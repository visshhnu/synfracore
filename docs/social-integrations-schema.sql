-- ============================================================
-- SynfraCore — Social Integrations Schema (Phase 2, Telegram first)
-- Native, Workers-compatible social posting — not a Postiz fork (see
-- docs/OPERATIONAL-GUIDE.md for the fork-feasibility audit that ruled out
-- forking Postiz: Nx/NestJS/Temporal stack, native deps, total incompatibility
-- with the Workers runtime). Telegram goes first because it needs no OAuth
-- (a single platform-owned bot token, the user just adds the bot as admin to
-- their own channel/group) and no inbound webhook for v1 (outbound-only:
-- scheduled text posts, dispatched by a Cron Trigger).
--
-- SECURITY MODEL (revised 2026-09-12 — see below): admin-only, not
-- per-user. Real gap found through actual use: this started as standard
-- Clerk-JWT "owner manages own rows" RLS (same pattern as every other
-- user_id table — see synfracore-schema.sql's own note), which meant ANY
-- signed-in visitor could connect their own Telegram channel through
-- /settings/social. The actual intent is SynfraCore posting to its own
-- official channels — a single-owner internal tool, not a multi-tenant
-- feature — so both tables are now gated by is_admin() instead, reusing
-- the exact admin mechanism /admin already has (the `role` column on
-- `users` + the is_admin() SECURITY DEFINER function, both defined in
-- docs/learner-platform-schema.sql). No new allowlist, no new schema field,
-- no new role system — same reasoning as choosing Cloudflare Workers AI
-- over a new provider: reuse what's already trusted before adding a new
-- mechanism.
--
-- The dispatch job itself (custom-worker.ts's scheduled() handler) has no
-- end-user session either way — same reasoning as the Clerk webhook and
-- question-bank grading — so it reads/writes scheduled_posts via
-- SUPABASE_SERVICE_ROLE_KEY (lib/supabase/serviceRole.ts), which bypasses
-- RLS entirely regardless of the policy below.
-- ============================================================

CREATE TABLE IF NOT EXISTS social_connections (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id       TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    -- CHECK constraint deliberately lists only 'telegram' for now — widen
    -- this (and add a matching branch in the dispatch handler) when a second
    -- platform actually ships, rather than pre-allowing values nothing
    -- handles yet.
    platform      TEXT NOT NULL CHECK (platform IN ('telegram')),
    external_id   TEXT NOT NULL,        -- Telegram chat_id, verified via getChat/getChatMember at connect time
    display_name  TEXT,                 -- channel/group title, for the UI — not used by the dispatch job
    connected_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    status        TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active', 'revoked')),
    UNIQUE(user_id, platform, external_id)
);
CREATE INDEX IF NOT EXISTS idx_social_connections_user ON social_connections(user_id);

CREATE TABLE IF NOT EXISTS scheduled_posts (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id       TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    connection_id UUID NOT NULL REFERENCES social_connections(id) ON DELETE CASCADE,
    content       TEXT NOT NULL,        -- text-only for v1 — no media column yet, add one deliberately later
    scheduled_at  TIMESTAMPTZ NOT NULL,
    status        TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'sent', 'failed')),
    sent_at       TIMESTAMPTZ,
    error         TEXT,                 -- last dispatch failure's message, for a future "why did this fail" UI
    created_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);
-- The dispatch job's actual query shape: "pending rows due now" — this index
-- is what keeps that query cheap as the table grows, since it's read every
-- 2 minutes by the Cron Trigger for the life of the feature.
CREATE INDEX IF NOT EXISTS idx_scheduled_posts_due ON scheduled_posts(status, scheduled_at);
CREATE INDEX IF NOT EXISTS idx_scheduled_posts_user ON scheduled_posts(user_id);

-- ---------- RLS: admin-only (see SECURITY MODEL above) ----------
-- Requires is_admin() to already exist — docs/learner-platform-schema.sql,
-- run once for /admin. If this errors with "function is_admin() does not
-- exist", that file hasn't been applied to this database yet.
ALTER TABLE social_connections ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "user manages own connections" ON social_connections;
DROP POLICY IF EXISTS "admin manages connections" ON social_connections;
CREATE POLICY "admin manages connections" ON social_connections
  FOR ALL USING (is_admin());

ALTER TABLE scheduled_posts ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "user manages own scheduled posts" ON scheduled_posts;
DROP POLICY IF EXISTS "admin manages scheduled posts" ON scheduled_posts;
CREATE POLICY "admin manages scheduled posts" ON scheduled_posts
  FOR ALL USING (is_admin());

-- ---------- SERVICE-ROLE TABLE-LEVEL GRANTS (must run BEFORE relying on service-role access) ----------
-- The dispatch job only ever needs to read due rows and flip their status —
-- it never needs to see/touch social_connections' rows itself beyond the
-- join below, so no GRANT is added there; service_role already bypasses RLS
-- for any table it's granted on, but only scheduled_posts is actually
-- touched server-side.
GRANT SELECT, UPDATE ON scheduled_posts TO service_role;
GRANT SELECT ON social_connections TO service_role; -- read-only join, for the connection's external_id
