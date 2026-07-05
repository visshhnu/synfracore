-- ============================================================
-- SynfraCore — Learner Platform Schema Extension
-- Run AFTER synfracore-schema.sql and docs/rls-policies.sql.
-- PostgreSQL 15+ / Supabase-compatible.
--
-- ARCHITECTURAL NOTE (read before extending):
-- synfracore-schema.sql's `lessons`/`progress` tables assume content lives
-- as DB rows (lesson_id UUID FKs). In practice, all academy content today
-- is flat markdown under public/content/{academy}/{technology}/{section}.md
-- — there are no lesson rows to reference, and populating thousands of them
-- from markdown is out of scope for this session. Every table below keys
-- progress/bookmarks/quizzes off (academy_slug, technology_slug, section_slug)
-- string triples instead of lesson_id UUIDs — this matches the site's actual
-- content addressing scheme (/academies/[academy]/[technology]/[section])
-- and needs no migration of existing content to adopt. If lessons ever move
-- into the DB, these tables can gain a lesson_id column alongside the slugs
-- without breaking anything.
-- ============================================================

-- ---------- PROFILE EXTENSION ----------
-- (users table already has: id, email, full_name, avatar_url, role, country,
--  education_level, created_at, last_active_at — see synfracore-schema.sql)

ALTER TABLE users ADD COLUMN IF NOT EXISTS onboarding_completed BOOLEAN NOT NULL DEFAULT false;
ALTER TABLE users ADD COLUMN IF NOT EXISTS learner_type TEXT;        -- school | college | competitive-exam | tech | healthcare | finance-law-mgmt | career-switcher | wellness
ALTER TABLE users ADD COLUMN IF NOT EXISTS primary_goal TEXT;        -- free-text: target exam / role / certification
ALTER TABLE users ADD COLUMN IF NOT EXISTS current_level TEXT;       -- beginner | intermediate | advanced
ALTER TABLE users ADD COLUMN IF NOT EXISTS goal_timeline TEXT;       -- optional: "3 months", "1 year", etc.
ALTER TABLE users ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ NOT NULL DEFAULT now();

-- ---------- DOMAIN INTEREST (multi-select, never gates access) ----------

CREATE TABLE IF NOT EXISTS user_domain_preferences (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    academy_slug    TEXT NOT NULL,
    interest_level  TEXT NOT NULL DEFAULT 'exploring',  -- exploring | active | completed
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE(user_id, academy_slug)
);
CREATE INDEX IF NOT EXISTS idx_domain_prefs_user ON user_domain_preferences(user_id);

-- ---------- CONTENT PROGRESS (slug-addressed, see architectural note) ----------

CREATE TABLE IF NOT EXISTS lesson_progress (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    academy_slug    TEXT NOT NULL,
    technology_slug TEXT NOT NULL,
    section_slug    TEXT NOT NULL DEFAULT 'overview',
    status          TEXT NOT NULL DEFAULT 'in_progress',  -- in_progress | completed
    completed_at    TIMESTAMPTZ,
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE(user_id, academy_slug, technology_slug, section_slug)
);
CREATE INDEX IF NOT EXISTS idx_lesson_progress_user ON lesson_progress(user_id);
CREATE INDEX IF NOT EXISTS idx_lesson_progress_academy ON lesson_progress(user_id, academy_slug);

CREATE TABLE IF NOT EXISTS roadmap_progress (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    roadmap_slug    TEXT NOT NULL,
    step_index      INT NOT NULL,
    completed       BOOLEAN NOT NULL DEFAULT false,
    completed_at    TIMESTAMPTZ,
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE(user_id, roadmap_slug, step_index)
);
CREATE INDEX IF NOT EXISTS idx_roadmap_progress_user ON roadmap_progress(user_id);

-- ---------- BOOKMARKS ----------

CREATE TABLE IF NOT EXISTS bookmarks (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    academy_slug    TEXT NOT NULL,
    technology_slug TEXT NOT NULL,
    section_slug    TEXT NOT NULL DEFAULT 'overview',
    title           TEXT NOT NULL,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE(user_id, academy_slug, technology_slug, section_slug)
);
CREATE INDEX IF NOT EXISTS idx_bookmarks_user ON bookmarks(user_id);

-- ---------- QUIZ / VERIFICATION MODEL ----------

CREATE TABLE IF NOT EXISTS quiz_questions (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    academy_slug    TEXT NOT NULL,
    technology_slug TEXT NOT NULL,
    section_slug    TEXT NOT NULL DEFAULT 'overview',
    question        TEXT NOT NULL,
    options         JSONB NOT NULL,   -- ["opt1","opt2","opt3","opt4"]
    correct_index   INT NOT NULL,     -- 0-3
    explanation     TEXT,
    difficulty      TEXT NOT NULL DEFAULT 'beginner',  -- beginner | intermediate | advanced
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    -- Prevents docs/sample-quiz-questions.sql (or any future seed) from
    -- silently duplicating questions if it's ever run more than once.
    UNIQUE(academy_slug, technology_slug, section_slug, question)
);
CREATE INDEX IF NOT EXISTS idx_quiz_questions_topic ON quiz_questions(academy_slug, technology_slug, section_slug);

CREATE TABLE IF NOT EXISTS quiz_attempts (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    academy_slug    TEXT NOT NULL,
    technology_slug TEXT NOT NULL,
    section_slug    TEXT NOT NULL DEFAULT 'overview',
    score           INT NOT NULL,
    total           INT NOT NULL,
    answers         JSONB,            -- [{questionId, selectedIndex, correct}]
    attempted_at    TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_quiz_attempts_user ON quiz_attempts(user_id);
CREATE INDEX IF NOT EXISTS idx_quiz_attempts_topic ON quiz_attempts(academy_slug, technology_slug, section_slug);

-- ---------- RECENT ACTIVITY (dashboard feed) ----------

CREATE TABLE IF NOT EXISTS recent_activity (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id         TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    activity_type   TEXT NOT NULL,   -- lesson_viewed | lesson_completed | quiz_attempted | bookmark_added | onboarding_completed
    academy_slug    TEXT,
    technology_slug TEXT,
    section_slug    TEXT,
    metadata        JSONB,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_recent_activity_user ON recent_activity(user_id, created_at DESC);

-- ============================================================
-- ADMIN HELPER FUNCTION
-- SECURITY DEFINER so RLS policies can call this without recursively
-- re-evaluating RLS on the `users` table (a common Supabase gotcha).
-- ============================================================

CREATE OR REPLACE FUNCTION public.is_admin()
RETURNS BOOLEAN
LANGUAGE sql
SECURITY DEFINER
STABLE
AS $$
  SELECT EXISTS (
    SELECT 1 FROM users
    WHERE id = (SELECT auth.jwt()->>'sub') AND role = 'admin'
  );
$$;

-- ============================================================
-- RLS — enable + policies for every new table
-- ============================================================

ALTER TABLE user_domain_preferences ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "own domain prefs: read" ON user_domain_preferences;
CREATE POLICY "own domain prefs: read"   ON user_domain_preferences FOR SELECT USING ( (select auth.jwt()->>'sub') = user_id OR is_admin() );
DROP POLICY IF EXISTS "own domain prefs: write" ON user_domain_preferences;
CREATE POLICY "own domain prefs: write"  ON user_domain_preferences FOR INSERT WITH CHECK ( (select auth.jwt()->>'sub') = user_id );
DROP POLICY IF EXISTS "own domain prefs: update" ON user_domain_preferences;
CREATE POLICY "own domain prefs: update" ON user_domain_preferences FOR UPDATE USING ( (select auth.jwt()->>'sub') = user_id ) WITH CHECK ( (select auth.jwt()->>'sub') = user_id );
DROP POLICY IF EXISTS "own domain prefs: delete" ON user_domain_preferences;
CREATE POLICY "own domain prefs: delete" ON user_domain_preferences FOR DELETE USING ( (select auth.jwt()->>'sub') = user_id );

ALTER TABLE lesson_progress ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "own lesson progress: read" ON lesson_progress;
CREATE POLICY "own lesson progress: read"   ON lesson_progress FOR SELECT USING ( (select auth.jwt()->>'sub') = user_id OR is_admin() );
DROP POLICY IF EXISTS "own lesson progress: write" ON lesson_progress;
CREATE POLICY "own lesson progress: write"  ON lesson_progress FOR INSERT WITH CHECK ( (select auth.jwt()->>'sub') = user_id );
DROP POLICY IF EXISTS "own lesson progress: update" ON lesson_progress;
CREATE POLICY "own lesson progress: update" ON lesson_progress FOR UPDATE USING ( (select auth.jwt()->>'sub') = user_id ) WITH CHECK ( (select auth.jwt()->>'sub') = user_id );

ALTER TABLE roadmap_progress ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "own roadmap progress: read" ON roadmap_progress;
CREATE POLICY "own roadmap progress: read"   ON roadmap_progress FOR SELECT USING ( (select auth.jwt()->>'sub') = user_id OR is_admin() );
DROP POLICY IF EXISTS "own roadmap progress: write" ON roadmap_progress;
CREATE POLICY "own roadmap progress: write"  ON roadmap_progress FOR INSERT WITH CHECK ( (select auth.jwt()->>'sub') = user_id );
DROP POLICY IF EXISTS "own roadmap progress: update" ON roadmap_progress;
CREATE POLICY "own roadmap progress: update" ON roadmap_progress FOR UPDATE USING ( (select auth.jwt()->>'sub') = user_id ) WITH CHECK ( (select auth.jwt()->>'sub') = user_id );

ALTER TABLE bookmarks ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "own bookmarks: read" ON bookmarks;
CREATE POLICY "own bookmarks: read"   ON bookmarks FOR SELECT USING ( (select auth.jwt()->>'sub') = user_id );
DROP POLICY IF EXISTS "own bookmarks: write" ON bookmarks;
CREATE POLICY "own bookmarks: write"  ON bookmarks FOR INSERT WITH CHECK ( (select auth.jwt()->>'sub') = user_id );
DROP POLICY IF EXISTS "own bookmarks: delete" ON bookmarks;
CREATE POLICY "own bookmarks: delete" ON bookmarks FOR DELETE USING ( (select auth.jwt()->>'sub') = user_id );

-- quiz_questions is catalog content, not user data — public read, no user_id.
ALTER TABLE quiz_questions ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public reads quiz questions" ON quiz_questions;
CREATE POLICY "public reads quiz questions" ON quiz_questions FOR SELECT USING ( true );

ALTER TABLE quiz_attempts ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "own quiz attempts: read" ON quiz_attempts;
CREATE POLICY "own quiz attempts: read"  ON quiz_attempts FOR SELECT USING ( (select auth.jwt()->>'sub') = user_id OR is_admin() );
DROP POLICY IF EXISTS "own quiz attempts: write" ON quiz_attempts;
CREATE POLICY "own quiz attempts: write" ON quiz_attempts FOR INSERT WITH CHECK ( (select auth.jwt()->>'sub') = user_id );

ALTER TABLE recent_activity ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "own recent activity: read" ON recent_activity;
CREATE POLICY "own recent activity: read"  ON recent_activity FOR SELECT USING ( (select auth.jwt()->>'sub') = user_id OR is_admin() );
DROP POLICY IF EXISTS "own recent activity: write" ON recent_activity;
CREATE POLICY "own recent activity: write" ON recent_activity FOR INSERT WITH CHECK ( (select auth.jwt()->>'sub') = user_id );

-- ============================================================
-- ADMIN VISIBILITY ON EXISTING TABLES
-- docs/rls-policies.sql already added "user reads own record" etc. on
-- `users` — this adds the missing admin-read-all policy on top of it.
-- ============================================================

DROP POLICY IF EXISTS "admin reads all users" ON users;
CREATE POLICY "admin reads all users" ON users FOR SELECT USING ( is_admin() );

-- ============================================================
-- MAKE YOURSELF ADMIN (run once, manually, after signing in at least once
-- so your row exists — replace the email with your own)
-- ============================================================
-- UPDATE users SET role = 'admin' WHERE email = 'you@example.com';
