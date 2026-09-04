-- ============================================================
-- SynfraCore — Error Logs Schema
-- Self-hosted, free error-logging alternative to Sentry (which was ruled
-- out: @sentry/nextjs costs ~650KB gzip, ~96% of the free Workers plan's
-- 3MB limit; @sentry/cloudflare has no supported integration path for
-- @opennextjs/cloudflare's generated worker). Uses Supabase, already in
-- use, no new cost, no new dependency.
--
-- SECURITY MODEL: same two-layer pattern as question-bank-schema.sql —
-- GRANT (table-level "can this role touch this table at all") always
-- runs before RLS (row-level "which rows"), never assume RLS alone is
-- enough. No SELECT/INSERT policy is defined for the anon or
-- authenticated roles at all: every write goes through
-- app/api/log-error/route.ts using SUPABASE_SERVICE_ROLE_KEY (server-only,
-- bypasses RLS), and review happens via the Supabase SQL editor/table
-- view with the same service-role access — not a public-facing table by
-- design, since raw stack traces/user-agents shouldn't be world-readable.
-- ============================================================

CREATE TABLE IF NOT EXISTS error_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  message TEXT NOT NULL,
  stack TEXT,
  route TEXT,
  user_agent TEXT,
  user_id TEXT,
  -- 'client-boundary' (a React error.tsx boundary caught it),
  -- 'global-boundary' (app/global-error.tsx, root layout failure),
  -- 'unhandled' (window 'error'/'unhandledrejection', outside React's
  -- render tree entirely), 'server' (instrumentation.ts's onRequestError).
  source TEXT NOT NULL CHECK (source IN ('client-boundary', 'global-boundary', 'unhandled', 'server')),
  -- Next.js's own error.digest, when present — lets a boundary's log row
  -- be cross-referenced against `wrangler tail` output for the same
  -- request, the same correlation purpose app/not-found.tsx's diagnostic
  -- beacon already uses cf-ray for.
  digest TEXT
);

CREATE INDEX IF NOT EXISTS idx_error_logs_created_at ON error_logs (created_at DESC);

-- ---------- SERVICE-ROLE TABLE-LEVEL GRANTS (must run BEFORE RLS below) ----------
GRANT SELECT, INSERT ON error_logs TO service_role;

-- ---------- RLS ----------
ALTER TABLE error_logs ENABLE ROW LEVEL SECURITY;
-- No policies defined for anon/authenticated on purpose — this table is
-- service-role-only, identical in spirit to question_answers having zero
-- SELECT policies (docs/question-bank-schema.sql). RLS being enabled with
-- no matching policy denies all access to every role except service_role
-- (which bypasses RLS entirely, per Postgres/Supabase BYPASSRLS).
