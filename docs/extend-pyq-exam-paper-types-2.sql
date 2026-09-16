-- ============================================================
-- Extend pyq_collections.exam_paper again -- add 'paper-3'
-- ============================================================
-- APPSC Group 1 Mains numbers its core papers Paper I-VII (not GS1-4 like
-- UPSC), and the sourced collection here is specifically Paper III
-- (Polity, Constitution, Governance, Law & Ethics). 'paper-3' doesn't fit
-- the existing 'paper-1'/'paper-2' (two-paper-subject) or 'gs1'-'gs4'
-- (UPSC GS papers) values -- widening again, same backward-compatible
-- pattern as extend-pyq-exam-paper-types.sql, no existing row touched.

ALTER TABLE pyq_collections
  DROP CONSTRAINT IF EXISTS pyq_collections_exam_paper_check;

ALTER TABLE pyq_collections
  ADD CONSTRAINT pyq_collections_exam_paper_check
  CHECK (exam_paper IN ('paper-1', 'paper-2', 'paper-3', 'essay', 'gs1', 'gs2', 'gs3', 'gs4'));
