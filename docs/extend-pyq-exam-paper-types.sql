-- ============================================================
-- Extend pyq_collections.exam_paper beyond paper-1/paper-2
-- ============================================================
-- The original CHECK (docs/pyq-bank-schema.sql) only allowed 'paper-1' /
-- 'paper-2', modeled on the 6 optional subjects (each a 2-paper structure).
-- UPSC's own core Mains papers don't fit that shape -- Essay, GS Paper I,
-- GS Paper II, GS Paper III, and GS Paper IV (Ethics) are five distinct
-- named papers, not two papers of one subject. Widening the CHECK to add
-- 'essay'/'gs1'/'gs2'/'gs3'/'gs4' alongside the existing two values --
-- backward-compatible, no existing row's exam_paper value changes, no
-- data touched. Run this once against the Supabase database.
--
-- Postgres auto-names an inline CHECK constraint <table>_<column>_check
-- unless given an explicit name -- pyq_bank-schema.sql's CHECK was inline,
-- so it should be pyq_collections_exam_paper_check. Drop-if-exists that
-- name, then add back a new, explicitly named constraint so a future
-- migration can target it by name without guessing again.

ALTER TABLE pyq_collections
  DROP CONSTRAINT IF EXISTS pyq_collections_exam_paper_check;

ALTER TABLE pyq_collections
  ADD CONSTRAINT pyq_collections_exam_paper_check
  CHECK (exam_paper IN ('paper-1', 'paper-2', 'essay', 'gs1', 'gs2', 'gs3', 'gs4'));
