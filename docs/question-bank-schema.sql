-- ============================================================
-- SynfraCore — Question Bank Schema
-- Run AFTER learner-platform-schema.sql. PostgreSQL 15+ / Supabase-compatible.
--
-- SECURITY MODEL (read before extending):
-- `question_answers` (correct_option_id + explanation) has ROW LEVEL
-- SECURITY ENABLED WITH ZERO SELECT POLICIES DEFINED. This means the
-- anon key and the authenticated (Clerk-JWT) key can NEVER read this
-- table under any circumstance — not "hidden by the UI", genuinely
-- unreadable at the database layer. All grading and post-submission
-- review happen exclusively through Next.js Server Actions using
-- SUPABASE_SERVICE_ROLE_KEY (server-only, never sent to the browser),
-- the same pattern this project already uses for auth fallback in
-- lib/clerk/authFallback.ts. `questions` and `question_options` are the
-- only tables ever queried directly with the anon/authenticated key —
-- they carry no answer or explanation data at all.
--
-- TWO ACCESS-CONTROL LAYERS, BOTH REQUIRED: RLS policies (below) only ever
-- get evaluated AFTER a role already has a plain table-level GRANT — GRANT
-- is the "can this role touch this table at all" gate, RLS is the
-- "which rows" gate on top of that. It's possible to correctly configure
-- RLS and still have every query fail with "permission denied for table"
-- because the GRANT step was skipped — this happened for real (2026-07-13):
-- service_role had REFERENCES/TRIGGER/TRUNCATE on every table here (glanced-at
-- diagnostics can look like "it has some privileges" and seem fine) but NOT
-- SELECT/INSERT/UPDATE/DELETE, so question-bank grading failed outright
-- despite RLS being configured exactly as intended below. The GRANT block
-- right before the RLS section exists specifically to prevent a repeat of
-- this on a fresh project — do not remove it because RLS looks sufficient
-- on its own; it isn't.
-- ============================================================

-- ---------- CATALOG (public-read, no correctness data) ----------

CREATE TABLE IF NOT EXISTS question_papers (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    slug            TEXT NOT NULL UNIQUE,
    title           TEXT NOT NULL,
    exam_type       TEXT NOT NULL,          -- 'bchhc' | 'cpc' (future)
    focus_tags      TEXT[] NOT NULL DEFAULT '{}',
    question_count  INT NOT NULL,
    difficulty      TEXT NOT NULL DEFAULT 'standard',  -- standard | advanced
    is_premium      BOOLEAN NOT NULL DEFAULT true,
    sort_order      INT NOT NULL,
    time_limit_minutes INT NOT NULL DEFAULT 60,  -- per-paper, not hardcoded; BCHHC papers set to 300 (5h, matches the real exam)
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS questions (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    paper_id        UUID NOT NULL REFERENCES question_papers(id) ON DELETE CASCADE,
    sort_order      INT NOT NULL,           -- ORIGINAL paper order — never shuffled in storage
    question_text   TEXT NOT NULL,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE(paper_id, sort_order)
);
CREATE INDEX IF NOT EXISTS idx_questions_paper ON questions(paper_id, sort_order);

CREATE TABLE IF NOT EXISTS question_options (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    question_id     UUID NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    sort_order      INT NOT NULL,           -- ORIGINAL option order — never shuffled in storage
    option_text     TEXT NOT NULL,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT now(),
    UNIQUE(question_id, sort_order)
);
CREATE INDEX IF NOT EXISTS idx_question_options_question ON question_options(question_id);

-- ---------- ANSWER KEY (server-only — no client-readable policy, ever) ----------

CREATE TABLE IF NOT EXISTS question_answers (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    question_id         UUID NOT NULL UNIQUE REFERENCES questions(id) ON DELETE CASCADE,
    correct_option_id   UUID NOT NULL REFERENCES question_options(id) ON DELETE RESTRICT,
    explanation         TEXT NOT NULL,
    source_note         TEXT,  -- e.g. "corrected from original exam key — see Q6 note"
    created_at          TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- ---------- ATTEMPTS (user-owned, RLS'd) ----------

CREATE TABLE IF NOT EXISTS paper_attempts (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id             TEXT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    paper_id            UUID NOT NULL REFERENCES question_papers(id) ON DELETE CASCADE,
    question_order      UUID[] NOT NULL,     -- shuffled question id order for THIS attempt
    started_at          TIMESTAMPTZ NOT NULL DEFAULT now(),
    submitted_at        TIMESTAMPTZ,
    time_taken_seconds  INT,
    score               INT,
    total               INT
);
CREATE INDEX IF NOT EXISTS idx_paper_attempts_user ON paper_attempts(user_id, paper_id, started_at DESC);

CREATE TABLE IF NOT EXISTS attempt_responses (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    attempt_id          UUID NOT NULL REFERENCES paper_attempts(id) ON DELETE CASCADE,
    question_id         UUID NOT NULL REFERENCES questions(id) ON DELETE CASCADE,
    shown_option_order  UUID[] NOT NULL,     -- shuffled option id order shown for THIS attempt+question
    selected_option_id  UUID REFERENCES question_options(id),
    is_correct          BOOLEAN,             -- NULL until graded server-side on submit
    UNIQUE(attempt_id, question_id)
);
CREATE INDEX IF NOT EXISTS idx_attempt_responses_attempt ON attempt_responses(attempt_id);

-- ============================================================
-- SERVICE-ROLE TABLE-LEVEL GRANTS (must run BEFORE the RLS policies below
-- do anything useful — see the SECURITY MODEL note at the top of this file)
-- ============================================================

-- service_role is the ONLY role that ever touches question_answers, and the
-- only role that writes attempt_responses/paper_attempts grading columns
-- (see the RLS section below — authenticated has no INSERT/UPDATE policy on
-- those). Supabase's usual auto-grant-on-table-creation doesn't reliably
-- cover tables created by a raw SQL script run outside the dashboard/
-- migration tooling — don't assume it happened; this GRANT makes it explicit
-- and idempotent (safe to re-run).
GRANT SELECT, INSERT, UPDATE, DELETE ON
  question_papers, questions, question_options, question_answers,
  paper_attempts, attempt_responses
TO service_role;

-- ============================================================
-- RLS
-- ============================================================

ALTER TABLE question_papers ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public reads question papers" ON question_papers;
CREATE POLICY "public reads question papers" ON question_papers FOR SELECT USING ( true );
-- Catalog metadata (title, question count, premium flag) is intentionally
-- public — this is what powers the "locked paper list" free-tier preview.

ALTER TABLE questions ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public reads questions" ON questions;
CREATE POLICY "public reads questions" ON questions FOR SELECT USING ( true );
-- Safe: this table never contains which option is correct.

ALTER TABLE question_options ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public reads question options" ON question_options;
CREATE POLICY "public reads question options" ON question_options FOR SELECT USING ( true );
-- Safe: option text alone, no correctness marker.

ALTER TABLE question_answers ENABLE ROW LEVEL SECURITY;
-- Deliberately NO policies created here. RLS enabled + zero policies =
-- every role (anon, authenticated) is denied SELECT/INSERT/UPDATE/DELETE
-- by default. Only a service-role connection (which bypasses RLS
-- entirely, by Postgres/Supabase design) can read or write this table.
-- Do not add a policy here without re-reading the security note at the
-- top of this file first.

ALTER TABLE paper_attempts ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "own paper attempts: read" ON paper_attempts;
CREATE POLICY "own paper attempts: read"  ON paper_attempts FOR SELECT USING ( (select auth.jwt()->>'sub') = user_id OR is_admin() );
DROP POLICY IF EXISTS "own paper attempts: write" ON paper_attempts;
CREATE POLICY "own paper attempts: write" ON paper_attempts FOR INSERT WITH CHECK ( (select auth.jwt()->>'sub') = user_id );
-- No client-side UPDATE policy: scoring/submission is written exclusively
-- by the server action via the service-role key, never by the browser
-- directly — this is what prevents a client from POSTing a fake score.

ALTER TABLE attempt_responses ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "own attempt responses: read" ON attempt_responses;
CREATE POLICY "own attempt responses: read" ON attempt_responses FOR SELECT USING (
    EXISTS (
        SELECT 1 FROM paper_attempts
        WHERE paper_attempts.id = attempt_responses.attempt_id
        AND ( (select auth.jwt()->>'sub') = paper_attempts.user_id OR is_admin() )
    )
);
-- No client-side INSERT/UPDATE policy on attempt_responses either —
-- writing selected answers and grading them both go through the
-- service-role server action, so a client can never self-report
-- is_correct=true without the server having actually checked it.
