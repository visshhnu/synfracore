-- ============================================================
-- SynfraCore — Slug rename safety (slug_aliases)
--
-- Background: an "infrastructure" academy was renamed to "devops" at some
-- point in this project's history (see the permanent redirect in
-- next.config.ts), with no data-level safeguard for the tables that key on
-- academy_slug/technology_slug/section_slug as plain TEXT
-- (lesson_progress, bookmarks, quiz_attempts, recent_activity). That
-- specific rename happened to orphan zero rows (verified directly against
-- production), but nothing prevented it, and nothing prevents the next one
-- from orphaning real user data.
--
-- This table alone does NOT fix that — it's a lookup table with no
-- application code consulting it yet (see the "Renaming a slug" procedure
-- in CLAUDE.md for the actual safeguard, which is a paired data migration
-- run at rename time). This table exists so that a fallback lookup can be
-- added to the query layer later without a schema change at that point —
-- see CLAUDE.md for why that fallback isn't wired up yet.
-- ============================================================

CREATE TABLE IF NOT EXISTS slug_aliases (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    slug_type   TEXT NOT NULL,          -- 'academy' | 'technology' | 'section'
    old_slug    TEXT NOT NULL,
    new_slug    TEXT NOT NULL,
    renamed_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE(slug_type, old_slug)
);

-- Reference/lookup data, not user data — public read, matching the pattern
-- already used for other catalog tables (academies, courses, etc. in
-- docs/rls-policies.sql).
ALTER TABLE slug_aliases ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public reads slug aliases" ON slug_aliases;
CREATE POLICY "public reads slug aliases" ON slug_aliases FOR SELECT USING ( true );

-- Backfill this table now with the one rename already known to have
-- happened, so the history is captured even though no rows needed
-- recovering this time:
INSERT INTO slug_aliases (slug_type, old_slug, new_slug)
VALUES ('academy', 'infrastructure', 'devops')
ON CONFLICT (slug_type, old_slug) DO NOTHING;
