-- ============================================================
-- SynfraCore — Table privilege fix (run this NOW, before anything else)
--
-- Root cause: tables created via raw SQL (not Supabase's Table Editor) do
-- not automatically get SELECT/INSERT/UPDATE/DELETE granted to the `anon`
-- and `authenticated` Postgres roles. RLS policies only decide which ROWS
-- a role can see once it's already allowed to touch the table at all — so
-- every query against every table in this project has been failing with
-- Postgres error 42501 ("permission denied for table ...") before RLS was
-- ever evaluated. Confirmed directly against the live project:
--   curl .../rest/v1/users        -> 42501 permission denied for table users
--   curl .../rest/v1/academies    -> 42501 permission denied for table academies
--   curl .../rest/v1/quiz_questions -> 42501 permission denied for table quiz_questions
--
-- This is why ensureUserRecord() never created a row despite RLS looking
-- correct, and why every client-side query was silently failing with 401.
--
-- Safe to run anytime, in any order relative to the other 4 files, and
-- safe to re-run (GRANT is idempotent — granting a privilege you already
-- have is a no-op, not an error).
-- ============================================================

-- ---------- Original schema (synfracore-schema.sql) ----------
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE users                  TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE academies              TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE courses                TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE modules                TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE lessons                TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE progress               TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE certificates           TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE xp_ledger              TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE streaks                TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE challenges             TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE challenge_submissions  TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE badges                 TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE user_badges            TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE plans                  TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE subscriptions          TO anon, authenticated;

-- ---------- Learner platform schema (docs/learner-platform-schema.sql) ----------
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE user_domain_preferences TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE lesson_progress         TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE roadmap_progress        TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE bookmarks               TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE quiz_questions          TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE quiz_attempts           TO anon, authenticated;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE recent_activity         TO anon, authenticated;

-- ---------- Function used inside RLS policies ----------
-- Postgres grants EXECUTE to PUBLIC by default on new functions, so this is
-- likely already fine — included anyway since it costs nothing to be sure.
GRANT EXECUTE ON FUNCTION public.is_admin() TO anon, authenticated;

-- ---------- Make future tables in `public` inherit these grants automatically ----------
-- Without this, every NEW table you create later (via SQL, not the Table
-- Editor) will hit this exact same 42501 error again. This makes the fix
-- permanent instead of a one-time patch.
ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO anon, authenticated;

-- Note: RLS policies (docs/rls-policies.sql, docs/learner-platform-schema.sql)
-- remain the real access control — these GRANTs only get a role into the
-- room; RLS still decides which rows it's allowed to see once it's in.
-- Nothing about this file weakens the "own row only" policies already in place.
