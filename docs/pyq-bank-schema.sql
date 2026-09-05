-- ============================================================
-- SynfraCore — PYQ + Model Answer Bank Schema
-- New premium content type for descriptive/essay-format exams (UPSC Mains
-- optional subjects, first) that the existing question_papers/questions/
-- question_options/question_answers MCQ schema structurally cannot
-- represent — there is no "correct option" in a real UPSC optional paper,
-- answers are full written essays. Design proposal approved 2026-09-04/05
-- (docs/OPERATIONAL-GUIDE.md's UPSC-IAS section has the full context).
--
-- SECURITY MODEL: same two-layer GRANT-then-RLS pattern as
-- question-bank-schema.sql, but the SPLIT is different from that schema's
-- reasoning. question_answers is locked to prevent cheating on a live
-- graded attempt -- there is no such attempt here, reading the model
-- answer IS the product. The lock here is purely about premium ACCESS,
-- the same gate question_papers.is_premium already uses
-- (lib/billing/access.ts's hasActivePremiumAccess()) -- pyq_collections
-- and pyq_questions (metadata + the bare question text) are public,
-- exactly like question_papers/questions are, as a legitimate "preview
-- before paying" the same way a locked paper's title is visible before
-- Start. pyq_model_answers is the one table gated service-role-only,
-- read through app/pyq-bank/[slug]/page.tsx's own server-side
-- hasActivePremiumAccess() check -- the same enforce-in-app-code-then-
-- service-role-fetch pattern app/question-bank/.../results/page.tsx
-- already uses for attempt grading.
-- ============================================================

CREATE TABLE IF NOT EXISTS pyq_collections (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  slug TEXT UNIQUE NOT NULL,
  subject TEXT NOT NULL,
  title TEXT NOT NULL,
  exam_paper TEXT NOT NULL CHECK (exam_paper IN ('paper-1', 'paper-2')),
  year INTEGER NOT NULL,
  is_premium BOOLEAN NOT NULL DEFAULT true,
  question_count INTEGER NOT NULL,
  sort_order INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS pyq_questions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  collection_id UUID NOT NULL REFERENCES pyq_collections(id) ON DELETE CASCADE,
  sort_order INTEGER NOT NULL,
  section TEXT,
  question_number TEXT NOT NULL,
  marks INTEGER NOT NULL,
  word_limit INTEGER,
  question_text TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS pyq_model_answers (
  question_id UUID PRIMARY KEY REFERENCES pyq_questions(id) ON DELETE CASCADE,
  model_answer TEXT NOT NULL,
  examiner_notes TEXT,
  -- Real-provenance disclosure is mandatory, not optional, for this table
  -- specifically -- unlike an MCQ paper's authored-not-copied disclosure,
  -- this must cite the SPECIFIC real UPSC exam year/paper/question number
  -- this question was actually asked in. A row without a verifiable real
  -- source must not exist here at all (excluded at authoring time, not
  -- flagged after the fact) -- see the integrity discipline agreed for
  -- this content type before any row in this table.
  source_note TEXT NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_pyq_questions_collection ON pyq_questions (collection_id, sort_order);

-- ---------- SERVICE-ROLE TABLE-LEVEL GRANTS (must run BEFORE RLS below) ----------
GRANT SELECT, INSERT, UPDATE, DELETE ON pyq_collections, pyq_questions, pyq_model_answers TO service_role;

-- ---------- RLS ----------
ALTER TABLE pyq_collections ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public reads pyq collections" ON pyq_collections;
CREATE POLICY "public reads pyq collections" ON pyq_collections FOR SELECT USING ( true );

ALTER TABLE pyq_questions ENABLE ROW LEVEL SECURITY;
DROP POLICY IF EXISTS "public reads pyq questions" ON pyq_questions;
CREATE POLICY "public reads pyq questions" ON pyq_questions FOR SELECT USING ( true );
-- Safe: question text only, no model answer.

ALTER TABLE pyq_model_answers ENABLE ROW LEVEL SECURITY;
-- Deliberately NO policies created here -- service-role-only, identical in
-- spirit to question_answers having zero SELECT policies
-- (question-bank-schema.sql). Premium-gated reveal happens in
-- app/pyq-bank/[slug]/page.tsx, not at the RLS layer.
