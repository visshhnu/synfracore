-- Backfills questions.subject for the 6 existing HAL DT/MT papers, using the
-- sort_order ranges each paper's seed file already documents in comments
-- (docs/hal_seed_paper_1..6.sql): Q1-20 General Awareness, Q21-60 English &
-- Reasoning, Q61-160 discipline-specific. Run AFTER
-- add-question-subject-marking.sql. Idempotent — safe to re-run.
--
-- topic is intentionally left NULL here — no finer per-question tagging
-- exists in the source seed files to backfill from.

UPDATE questions SET subject = 'General Awareness'
WHERE sort_order BETWEEN 1 AND 20
  AND paper_id IN (SELECT id FROM question_papers WHERE slug IN (
    'hal-eee-practice-1', 'hal-mech-practice-1', 'hal-ece-practice-1',
    'hal-cse-practice-1', 'hal-aero-practice-1', 'hal-civil-practice-1'
  ));

UPDATE questions SET subject = 'English & Reasoning'
WHERE sort_order BETWEEN 21 AND 60
  AND paper_id IN (SELECT id FROM question_papers WHERE slug IN (
    'hal-eee-practice-1', 'hal-mech-practice-1', 'hal-ece-practice-1',
    'hal-cse-practice-1', 'hal-aero-practice-1', 'hal-civil-practice-1'
  ));

UPDATE questions SET subject = 'Electrical & Electronics Engineering'
WHERE sort_order BETWEEN 61 AND 160
  AND paper_id = (SELECT id FROM question_papers WHERE slug = 'hal-eee-practice-1');

UPDATE questions SET subject = 'Mechanical Engineering'
WHERE sort_order BETWEEN 61 AND 160
  AND paper_id = (SELECT id FROM question_papers WHERE slug = 'hal-mech-practice-1');

UPDATE questions SET subject = 'Electronics & Communication Engineering'
WHERE sort_order BETWEEN 61 AND 160
  AND paper_id = (SELECT id FROM question_papers WHERE slug = 'hal-ece-practice-1');

UPDATE questions SET subject = 'Computer Science & IT'
WHERE sort_order BETWEEN 61 AND 160
  AND paper_id = (SELECT id FROM question_papers WHERE slug = 'hal-cse-practice-1');

UPDATE questions SET subject = 'Aeronautical / Aerospace Engineering'
WHERE sort_order BETWEEN 61 AND 160
  AND paper_id = (SELECT id FROM question_papers WHERE slug = 'hal-aero-practice-1');

UPDATE questions SET subject = 'Civil Engineering'
WHERE sort_order BETWEEN 61 AND 160
  AND paper_id = (SELECT id FROM question_papers WHERE slug = 'hal-civil-practice-1');
