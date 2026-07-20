-- Adds time_limit_minutes to question_papers (per-paper, configurable --
-- not hardcoded). All 10 existing BCHHC papers set to 300 (5 hours),
-- matching the real BCHH-C exam's official timing. New exam_types added
-- later should get their own real-exam-matched value, not inherit 300.

ALTER TABLE question_papers
  ADD COLUMN IF NOT EXISTS time_limit_minutes INT NOT NULL DEFAULT 60;

UPDATE question_papers
  SET time_limit_minutes = 300
  WHERE exam_type = 'bchhc';
