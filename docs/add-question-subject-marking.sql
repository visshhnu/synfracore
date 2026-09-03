-- Adds subject/topic tagging at the question level, and a per-paper
-- positive/negative marking scheme, to support the Exams cluster's
-- subject-tab + real-negative-marking UX (not just HAL) going forward.
-- Run AFTER question-bank-schema.sql and add-paper-time-limit.sql.

-- ---------- Subject/topic tagging (nullable — most existing papers are
-- single-subject certs where this stays unused; only backfilled where a
-- paper is genuinely multi-subject, see backfill-hal-subjects.sql) ----------

ALTER TABLE questions
  ADD COLUMN IF NOT EXISTS subject TEXT,
  ADD COLUMN IF NOT EXISTS topic   TEXT;

-- ---------- Per-paper marking scheme ----------
-- Defaults (1 / 0) preserve today's flat +1-per-correct, zero-penalty scoring
-- for every existing paper unless explicitly overridden below. This is not
-- an arbitrary default: AWS SAA and Security+ genuinely have NO negative
-- marking in the real certification exams (a wrong answer scores the same
-- as a blank) — 1/0 is the real-world-accurate value for those, not a
-- placeholder. HAL DT/MT's official scheme was verified (2026-09-02, most
-- recent HAL admit-card notification at the time) to ALSO be 1/0 — 160
-- questions, 1 mark each, no penalty for wrong answers. This was an open
-- question when this migration was first written (a JEE/NEET/UPSC-style
-- +4/-1 was assumed likely for a competitive exam); the verified answer
-- turned out to match the schema default already in place, so no data
-- change was needed for HAL specifically.

ALTER TABLE question_papers
  ADD COLUMN IF NOT EXISTS positive_marks NUMERIC NOT NULL DEFAULT 1,
  ADD COLUMN IF NOT EXISTS negative_marks NUMERIC NOT NULL DEFAULT 0;

-- ---------- Widen paper_attempts.score for fractional/negative totals ----------
-- Real negative-marking schemes are not always whole numbers (e.g. -0.25 or
-- -1/3 per wrong answer on some competitive exams), and a negatively-marked
-- attempt can legitimately net a negative score. INT would silently truncate
-- or reject either case. `total` (raw question count) is untouched — it's
-- always a whole number and never affected by marking scheme.

ALTER TABLE paper_attempts
  ALTER COLUMN score TYPE NUMERIC USING score::NUMERIC;
