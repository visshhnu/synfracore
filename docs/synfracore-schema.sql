-- ============================================================
-- SUPERSEDED (2026-07-08) — see docs/audit/06-roadmap.md 3.2.
--
-- The real, in-use schema is docs/learner-platform-schema.sql, which
-- builds on the SAME `users` table this file defines but uses a
-- different content-progress model (lesson_progress/quiz_attempts/
-- bookmarks/recent_activity/roadmap_progress, keyed by
-- academy_slug/technology_slug/section_slug TEXT, not the
-- academy_id/course_id/module_id/lesson_id UUID chain below).
--
-- Confirmed via a full codebase grep (2026-07-08): none of the 14
-- non-`users` tables below (academies, courses, modules, lessons,
-- progress, certificates, xp_ledger, streaks, challenges,
-- challenge_submissions, badges, user_badges, plans, subscriptions)
-- are queried anywhere in application code. `users` itself IS real —
-- it's the one table this file and learner-platform-schema.sql
-- actually share.
--
-- Do NOT build new features against the 14 tables below — they
-- reflect an earlier content-modeling approach that was superseded
-- before the app code was written against it, not a legacy system
-- still in use. Only drop them after confirming zero rows in
-- production first (see the verification query recommended alongside
-- this notice); this file is left in place, not deleted, so the
-- historical design intent stays discoverable rather than vanishing
-- outright.
-- ============================================================

-- ============================================================
-- SynfraCore — Unified Platform Database Schema
-- PostgreSQL 15+ / Supabase-compatible
--
-- Design principle: ONE user table, ONE progress engine.
-- Every "academy" (DevOps, Cloud, Law, NEET, etc.) is just
-- data inside the same tables — never a separate system.
-- This is what makes "one login, every skill" actually true.
-- ============================================================

-- ---------- IDENTITY (the "one account" core) ----------

CREATE TABLE IF NOT EXISTS users (
    id              TEXT PRIMARY KEY,           -- Clerk user ID (the `sub` claim) — NOT a generated UUID
    email           TEXT UNIQUE NOT NULL,
    full_name       TEXT NOT NULL,
    avatar_url      TEXT,
    role            TEXT NOT NULL DEFAULT 'learner',   -- learner | instructor | admin
    country         TEXT,
    education_level TEXT,                              -- school | undergrad | professional (for content targeting)
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    last_active_at  TIMESTAMPTZ
);

-- ---------- CONTENT STRUCTURE ----------
-- academy > course > module > lesson  (4 levels, always)

CREATE TABLE IF NOT EXISTS academies (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    slug        TEXT UNIQUE NOT NULL,        -- 'devops', 'cloud-ai', 'neet'
    name        TEXT NOT NULL,
    description TEXT,
    icon_url    TEXT,
    is_active   BOOLEAN NOT NULL DEFAULT true,  -- lets you "pause" academies during phased rollout
    sort_order  INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS courses (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    academy_id  UUID NOT NULL REFERENCES academies(id) ON DELETE CASCADE,
    slug        TEXT NOT NULL,
    title       TEXT NOT NULL,
    description TEXT,
    difficulty  TEXT DEFAULT 'beginner',      -- beginner | intermediate | advanced
    is_paid     BOOLEAN NOT NULL DEFAULT false,
    sort_order  INT DEFAULT 0,
    UNIQUE(academy_id, slug)
);

CREATE TABLE IF NOT EXISTS modules (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    course_id   UUID NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    title       TEXT NOT NULL,
    sort_order  INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS lessons (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    module_id       UUID NOT NULL REFERENCES modules(id) ON DELETE CASCADE,
    title           TEXT NOT NULL,
    content_type    TEXT NOT NULL DEFAULT 'article', -- article | video | quiz | lab | flashcards
    difficulty      TEXT NOT NULL DEFAULT 'beginner', -- beginner | intermediate | advanced

    -- Content-template fields — enforce the 5-part beginner-friendly
    -- structure at the DATA level, so a page literally cannot be
    -- published without a hook, an analogy, and a diagram.
    hook_text       TEXT,          -- part 1: plain-English "why care" (2-3 sentences)
    analogy_text    TEXT,          -- part 2: one real-world analogy
    diagram_url     TEXT,          -- part 3: concept diagram — REQUIRED for Overview/Fundamentals
    example_body    TEXT,          -- part 4: annotated example (code/screenshot + inline notes)
    try_it_prompt   TEXT,          -- part 5: 2-minute hands-on micro-task

    content_body    TEXT,          -- full markdown/HTML body (existing deep content)
    video_url       TEXT,
    lab_config      JSONB,         -- sandbox/container config, if content_type = 'lab'
    xp_value        INT NOT NULL DEFAULT 10,
    sort_order      INT DEFAULT 0,

    -- soft content-quality gate: a page can be marked incomplete
    -- until the beginner-facing fields are filled in
    is_beginner_ready BOOLEAN GENERATED ALWAYS AS (
        hook_text IS NOT NULL AND analogy_text IS NOT NULL AND diagram_url IS NOT NULL
    ) STORED
);

-- ---------- PROGRESS ENGINE (powers the "one ring" dashboard) ----------

CREATE TABLE IF NOT EXISTS progress (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id     TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    lesson_id   UUID NOT NULL REFERENCES lessons(id) ON DELETE CASCADE,
    status      TEXT NOT NULL DEFAULT 'not_started', -- not_started | in_progress | completed
    score       NUMERIC,             -- for quizzes
    completed_at TIMESTAMPTZ,
    UNIQUE(user_id, lesson_id)
);
CREATE INDEX IF NOT EXISTS idx_progress_user ON progress(user_id);

CREATE TABLE IF NOT EXISTS certificates (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id     TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    course_id   UUID NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    issued_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
    cert_code   TEXT UNIQUE NOT NULL,   -- for public verification URL
    UNIQUE(user_id, course_id)
);

-- ---------- GAMIFICATION ----------

CREATE TABLE IF NOT EXISTS xp_ledger (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id     TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    academy_id  UUID NOT NULL REFERENCES academies(id),
    amount      INT NOT NULL,
    reason      TEXT NOT NULL,          -- 'lesson_completed', 'challenge_won', etc.
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_xp_user ON xp_ledger(user_id);

CREATE TABLE IF NOT EXISTS streaks (
    user_id             TEXT PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
    current_streak_days INT NOT NULL DEFAULT 0,
    longest_streak_days INT NOT NULL DEFAULT 0,
    last_activity_date  DATE
);

CREATE TABLE IF NOT EXISTS challenges (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    academy_id  UUID NOT NULL REFERENCES academies(id),
    title       TEXT NOT NULL,
    description TEXT,
    why_it_matters TEXT,           -- "ties back to a real job task or exam question" line
    tier        TEXT NOT NULL DEFAULT 'micro', -- micro | skill | build | hackathon | exam_sprint
    difficulty  TEXT NOT NULL DEFAULT 'beginner', -- beginner | intermediate | advanced
    est_minutes INT,               -- e.g. 5 for micro, 120 for build challenges
    starts_at   TIMESTAMPTZ NOT NULL,
    ends_at     TIMESTAMPTZ NOT NULL,
    xp_reward   INT NOT NULL DEFAULT 100
);

CREATE TABLE IF NOT EXISTS challenge_submissions (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    challenge_id  UUID NOT NULL REFERENCES challenges(id) ON DELETE CASCADE,
    user_id       TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    submitted_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    score         NUMERIC,
    rank          INT,
    UNIQUE(challenge_id, user_id)
);

CREATE TABLE IF NOT EXISTS badges (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    slug        TEXT UNIQUE NOT NULL,
    name        TEXT NOT NULL,
    icon_url    TEXT
);

CREATE TABLE IF NOT EXISTS user_badges (
    user_id     TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    badge_id    UUID NOT NULL REFERENCES badges(id) ON DELETE CASCADE,
    earned_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
    PRIMARY KEY (user_id, badge_id)
);

-- ---------- MONETIZATION ----------

CREATE TABLE IF NOT EXISTS plans (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    slug        TEXT UNIQUE NOT NULL,      -- 'free', 'academy-pass', 'all-access', 'institutional'
    name        TEXT NOT NULL,
    price_cents INT NOT NULL,
    currency    TEXT NOT NULL DEFAULT 'INR',
    billing_period TEXT NOT NULL DEFAULT 'monthly'  -- monthly | yearly | one_time
);

CREATE TABLE IF NOT EXISTS subscriptions (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id     TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    plan_id     UUID NOT NULL REFERENCES plans(id),
    academy_id  UUID REFERENCES academies(id),  -- NULL if plan = all-access
    status      TEXT NOT NULL DEFAULT 'active', -- active | cancelled | expired
    started_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    expires_at  TIMESTAMPTZ
);
CREATE INDEX IF NOT EXISTS idx_subscriptions_user ON subscriptions(user_id);

-- ============================================================
-- NOTES FOR IMPLEMENTATION (hand this whole file + these notes
-- to Claude Code as your starting instruction):
--
-- 1. Build auth + `users` + `progress` + `academies` FIRST.
--    Everything else can be added table-by-table without
--    breaking the core "one account, one progress" promise.
--
-- 2. The dashboard's main query is:
--    SELECT academy_id, COUNT(*) FILTER (WHERE status='completed')
--    FROM progress JOIN lessons... GROUP BY academy_id
--    — this single query powers the whole "progress ring" UI.
--
-- 3. Keep `lab_config` as JSONB so each academy can define
--    wildly different lab types (a Docker sandbox for DevOps,
--    a flashcard deck for NEET) without new tables.
--
-- 4. Row-Level Security with Clerk as a Third-Party Auth provider:
--    every table with user_id should have a policy using Clerk's
--    JWT `sub` claim, e.g.:
--      using ( (select auth.jwt()->>'sub') = user_id )
--    NOT auth.uid() — that only works with Supabase's own native
--    auth, which you are not using here.
--
-- 5. A lesson's "Overview" and "Fundamentals" content_type pages
--    should NOT be publishable (flip a `published` flag, add one
--    if missing) until is_beginner_ready = true. This turns your
--    content standard into an enforced rule, not a style guide
--    someone can skip under deadline pressure.
--
-- 6. Challenge auto-suggestion: query the user's average
--    `difficulty` across completed lessons per academy, and only
--    surface challenges where challenges.difficulty matches —
--    this is what stops a beginner from ever seeing an advanced
--    challenge and bouncing.
--
-- 7. Leaderboards (app-layer, not a table): always filter
--    challenge_submissions by challenges.tier before ranking.
--    A global leaderboard mixing micro-challenges and hackathons
--    discourages beginners immediately.
-- ============================================================
