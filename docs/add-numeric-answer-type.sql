-- Adds a second question "shape" (free-text numeric entry, e.g. JEE Main's
-- Numerical Value Questions) alongside the existing multiple-choice shape.
-- Run AFTER docs/add-question-subject-marking.sql.
--
-- MUST BE APPLIED MANUALLY (same convention as every other migration in
-- this project — see lib/supabase/questionBank.ts's own comment on why DDL
-- here isn't automated) before any numeric-type question can be authored,
-- seeded, or answered. Every function reading/writing these new columns
-- will simply not exist correctly until this runs — there's no
-- isolated-fetch degrade-gracefully path for this one, unlike
-- add-paper-time-limit.sql/add-question-subject-marking.sql, because this
-- isn't an optional new field on an existing row shape; it's a second row
-- shape entirely.

-- ---------- questions: explicit answer-type discriminator ----------
-- Deliberately an explicit column, not inferred from "this question has
-- zero question_options rows" — that inference is fragile (a genuine data
-- bug that failed to seed any options for an MCQ question would silently
-- look identical to an intentional numeric question) and every consumer
-- (grading, the attempt-runner UI, the results-review UI) needs to branch
-- on this up front anyway.
ALTER TABLE questions
  ADD COLUMN IF NOT EXISTS answer_type TEXT NOT NULL DEFAULT 'mcq'
    CHECK (answer_type IN ('mcq', 'numeric'));

-- ---------- question_answers: numeric correct-answer shape ----------
-- correct_option_id was NOT NULL (every question was assumed MCQ); relaxed
-- to nullable, with a CHECK enforcing exactly one answer shape is present
-- per row (never both, never neither) — mirrors the same discipline as the
-- exactly-one-shape rule this schema already uses elsewhere at the
-- database layer, not just trusted to application code.
ALTER TABLE question_answers
  ALTER COLUMN correct_option_id DROP NOT NULL,
  ADD COLUMN IF NOT EXISTS correct_numeric_answer NUMERIC;

ALTER TABLE question_answers
  DROP CONSTRAINT IF EXISTS question_answers_exactly_one_answer_shape;
ALTER TABLE question_answers
  ADD CONSTRAINT question_answers_exactly_one_answer_shape
  CHECK (
    (correct_option_id IS NOT NULL AND correct_numeric_answer IS NULL)
    OR
    (correct_option_id IS NULL AND correct_numeric_answer IS NOT NULL)
  );

-- ---------- attempt_responses: numeric response shape ----------
-- selected_option_id was already nullable (NULL = unanswered), so no ALTER
-- needed there. numeric_answer follows the same nullable convention: NULL
-- means "not answered (or answer cleared)", exactly like selected_option_id.
-- No CHECK constraint requiring exactly one populated here — unlike
-- question_answers (authored content, must be well-formed), a response row
-- legitimately has BOTH null (unanswered) at any point during an attempt.
ALTER TABLE attempt_responses
  ADD COLUMN IF NOT EXISTS numeric_answer NUMERIC;

-- ---------- Grading equality note ----------
-- NTA's own published rule for JEE Main NVQ answers: trailing zeroes in a
-- decimal answer are disregarded and all numerically-equivalent
-- representations are marked correct (5, 5.0, and 5.00 are the same
-- answer) — i.e. canonical numeric equality, NOT a fuzzy/epsilon tolerance
-- band. Postgres's NUMERIC type already compares by mathematical value
-- regardless of stored scale (5.00::numeric = 5::numeric is TRUE), and the
-- application-layer comparison in gradeAttempt()/getAttemptResults() uses
-- Number() coercion on both sides for the same reason — no custom
-- tolerance-window logic exists or is needed for this rule.
