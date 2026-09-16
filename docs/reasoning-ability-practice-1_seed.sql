-- ============================================================
-- Reasoning Ability — Practice Paper 1
-- Full-Length Practice Paper (20 questions, 15 minutes)
-- Marking: +1 correct / -0.25 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('c15fd325-cf81-4471-8095-730fbd5741e3', 'reasoning-ability-practice-1', 'Reasoning Ability Practice Paper 1', 'reasoning-ability', ARRAY['Reasoning Ability', 'Banking', 'SSC', 'Railways', 'State PSC']::TEXT[], 20, 'standard', true, 1, 15, 1, 0.25);

-- ── Section: Reasoning Ability (20 questions) — Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam's specific paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3281825a-6fa6-4d1b-bd98-346adbf91815', 'c15fd325-cf81-4471-8095-730fbd5741e3', 1, 'Five people A, B, C, D, E sit in a row facing north. B is second from the left. C sits immediately right of B. Who sits third from the left?', 'Reasoning', 'Puzzles & Seating', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d99c3335-0c2b-43e2-bd2e-5932c86911eb', '3281825a-6fa6-4d1b-bd98-346adbf91815', 0, 'A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60a3f725-c914-490c-a328-db42c2bf463f', '3281825a-6fa6-4d1b-bd98-346adbf91815', 1, 'B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60023200-bc0c-4649-b6f1-58260f9089b8', '3281825a-6fa6-4d1b-bd98-346adbf91815', 2, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6003903-6aea-46eb-98a2-7b82a4c32505', '3281825a-6fa6-4d1b-bd98-346adbf91815', 3, 'E');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3281825a-6fa6-4d1b-bd98-346adbf91815', '60023200-bc0c-4649-b6f1-58260f9089b8', 'B is at position 2. C sits immediately right of B, so C is at position 3.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('998b83d2-c293-4559-9484-6b73b916baf7', 'c15fd325-cf81-4471-8095-730fbd5741e3', 2, 'Six people sit around a circular table facing the center. P sits third to the right of Q. If Q is at position 1 (numbered clockwise 1-6), where does P sit?', 'Reasoning', 'Puzzles & Seating', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35f137b2-5cbc-4ccb-ad29-1e1b8a41ba23', '998b83d2-c293-4559-9484-6b73b916baf7', 0, 'Position 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0ab738f-4ee8-4542-8ebe-48ede3c245a0', '998b83d2-c293-4559-9484-6b73b916baf7', 1, 'Position 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c842f71e-8435-4f89-bf98-ade07c47f43f', '998b83d2-c293-4559-9484-6b73b916baf7', 2, 'Position 5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2268d180-f904-47b4-bf57-b1c81a9d493f', '998b83d2-c293-4559-9484-6b73b916baf7', 3, 'Position 6');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('998b83d2-c293-4559-9484-6b73b916baf7', 'c0ab738f-4ee8-4542-8ebe-48ede3c245a0', 'Moving 3 positions clockwise from position 1 gives position 4.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1a836acd-0762-448a-9c7b-5935f20238f3', 'c15fd325-cf81-4471-8095-730fbd5741e3', 3, 'Statements: All cats are animals. Some animals are wild. Conclusion: Some cats are wild. Is this valid?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e24ec3f0-d3e2-491a-83ef-eeb70a0ae934', '1a836acd-0762-448a-9c7b-5935f20238f3', 0, 'Definitely true');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('651b0b51-998d-4de5-ace3-6b2be4c8f893', '1a836acd-0762-448a-9c7b-5935f20238f3', 1, 'Not necessarily true');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f175d9c-ba63-4310-a7a2-adc2d6e45b51', '1a836acd-0762-448a-9c7b-5935f20238f3', 2, 'Definitely false');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe6056a1-894d-49f7-97b3-b9dea789dc60', '1a836acd-0762-448a-9c7b-5935f20238f3', 3, 'Cannot be determined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1a836acd-0762-448a-9c7b-5935f20238f3', '651b0b51-998d-4de5-ace3-6b2be4c8f893', 'The wild animals may not overlap with the specific animals that are cats, so the conclusion is only a possibility, not a certainty.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8f308c5f-a825-40bd-baeb-8bfa41c502bc', 'c15fd325-cf81-4471-8095-730fbd5741e3', 4, 'Statements: No teachers are students. All students are learners. Conclusion: No teachers are learners. Is this valid?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cbdf55cc-4b3f-4aba-b97b-f7971a01c5ea', '8f308c5f-a825-40bd-baeb-8bfa41c502bc', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cea02a49-e460-42eb-815d-de311e000f87', '8f308c5f-a825-40bd-baeb-8bfa41c502bc', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cb86e45-60f3-4d66-b8ee-d84c183a699d', '8f308c5f-a825-40bd-baeb-8bfa41c502bc', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('14df9f4c-2235-492b-b355-7ef1a4f9de8a', '8f308c5f-a825-40bd-baeb-8bfa41c502bc', 3, 'Valid only if reversed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8f308c5f-a825-40bd-baeb-8bfa41c502bc', 'cea02a49-e460-42eb-815d-de311e000f87', 'Teachers could still be learners through a category other than ''students'' -- the premises don''t rule that out, so the conclusion doesn''t necessarily follow.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f0591b76-b0c3-4730-971d-659a4e1a8d68', 'c15fd325-cf81-4471-8095-730fbd5741e3', 5, 'If in a code, BOOK is written as CPPL (each letter shifted forward by 1), how is PAGE written?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cd3682b-76c4-4b1c-937a-c3fd5aa6fdec', 'f0591b76-b0c3-4730-971d-659a4e1a8d68', 0, 'QBHF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4991875c-860f-428f-941e-ee861f02e0a7', 'f0591b76-b0c3-4730-971d-659a4e1a8d68', 1, 'QBGF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7bd3f659-1c51-4e72-be4d-a47f6f9af1ec', 'f0591b76-b0c3-4730-971d-659a4e1a8d68', 2, 'QAHF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6ef764d-7405-4948-a9be-b5c87f364510', 'f0591b76-b0c3-4730-971d-659a4e1a8d68', 3, 'PBHF');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f0591b76-b0c3-4730-971d-659a4e1a8d68', '3cd3682b-76c4-4b1c-937a-c3fd5aa6fdec', 'Shifting each letter forward by 1: P->Q, A->B, G->H, E->F, giving QBHF.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7ac95f68-6c91-47ed-abad-7be1b36ea88d', 'c15fd325-cf81-4471-8095-730fbd5741e3', 6, 'If MANGO is coded as NBOHP (each letter shifted forward by 1), how is APPLE coded?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('198cd8e0-1a12-4de2-b22c-09da66c6c04e', '7ac95f68-6c91-47ed-abad-7be1b36ea88d', 0, 'BQQMF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8591c4a3-2497-4e5e-90ba-f2b36de1e6b0', '7ac95f68-6c91-47ed-abad-7be1b36ea88d', 1, 'BQQLF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed3c9294-7a8c-4fab-8f2e-9ed1d841292b', '7ac95f68-6c91-47ed-abad-7be1b36ea88d', 2, 'AQQMF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7bf46d5-d0af-485a-a37b-4ac41efd1c20', '7ac95f68-6c91-47ed-abad-7be1b36ea88d', 3, 'BPQMF');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7ac95f68-6c91-47ed-abad-7be1b36ea88d', '198cd8e0-1a12-4de2-b22c-09da66c6c04e', 'Shifting each letter forward by 1: A->B, P->Q, P->Q, L->M, E->F, giving BQQMF.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('11afba05-1f9d-43ac-84f1-2237dd29af87', 'c15fd325-cf81-4471-8095-730fbd5741e3', 7, 'A is B''s father. C is B''s sister. D is C''s husband. How is D related to A?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89294e8a-cbd6-45db-8e0c-59c0735c8df3', '11afba05-1f9d-43ac-84f1-2237dd29af87', 0, 'Son-in-law');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fcb6f23b-ea6e-48b2-9592-dfd40fd88d92', '11afba05-1f9d-43ac-84f1-2237dd29af87', 1, 'Son');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab96d8a0-cdd3-4c3c-8f6b-e4f99ce0133d', '11afba05-1f9d-43ac-84f1-2237dd29af87', 2, 'Brother-in-law');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a461e87-e851-4988-af00-52b9c1f6478d', '11afba05-1f9d-43ac-84f1-2237dd29af87', 3, 'Nephew');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('11afba05-1f9d-43ac-84f1-2237dd29af87', '89294e8a-cbd6-45db-8e0c-59c0735c8df3', 'C is B''s sister, so C is also A''s daughter; D, being C''s husband, is A''s son-in-law.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d3f2a772-cc77-4f3f-b5bf-d3e77f8ad695', 'c15fd325-cf81-4471-8095-730fbd5741e3', 8, 'Pointing to a man, a woman said, "He is the son of my mother''s only daughter." How is the man related to the woman?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8376e8ea-b0d5-413e-9fc6-1f8ba316cecb', 'd3f2a772-cc77-4f3f-b5bf-d3e77f8ad695', 0, 'Son');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('823eb685-fc32-4ca7-b5df-0a8a89fcd270', 'd3f2a772-cc77-4f3f-b5bf-d3e77f8ad695', 1, 'Brother');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21306d30-011e-40a0-8ae2-14b14149ee56', 'd3f2a772-cc77-4f3f-b5bf-d3e77f8ad695', 2, 'Nephew');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4dc4ae3e-f304-4723-91d5-1b0e30c0ba3e', 'd3f2a772-cc77-4f3f-b5bf-d3e77f8ad695', 3, 'Cousin');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d3f2a772-cc77-4f3f-b5bf-d3e77f8ad695', '8376e8ea-b0d5-413e-9fc6-1f8ba316cecb', '"My mother''s only daughter" refers to the woman herself, so the man is her son.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9e5e0813-b9e0-44d1-9ec1-bb36274d34d8', 'c15fd325-cf81-4471-8095-730fbd5741e3', 9, 'A man walks 8km west, then 6km south. How far is he from his starting point?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1496c39c-900f-4161-a9b4-17c624012f36', '9e5e0813-b9e0-44d1-9ec1-bb36274d34d8', 0, '10km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5a09330-70a1-408a-b1d8-3a753a254115', '9e5e0813-b9e0-44d1-9ec1-bb36274d34d8', 1, '12km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('14c92d9d-3386-40d3-bbf6-ad258d3046bc', '9e5e0813-b9e0-44d1-9ec1-bb36274d34d8', 2, '14km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0591350c-eea4-4035-b0cd-74a78c141711', '9e5e0813-b9e0-44d1-9ec1-bb36274d34d8', 3, '8km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9e5e0813-b9e0-44d1-9ec1-bb36274d34d8', '1496c39c-900f-4161-a9b4-17c624012f36', 'This forms a right triangle with legs 8 and 6; distance = sqrt(8^2+6^2) = sqrt(100) = 10km.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5b960039-34bd-4cfc-b973-6842fba09b4a', 'c15fd325-cf81-4471-8095-730fbd5741e3', 10, 'Facing north, a man turns 90 degrees clockwise, then 180 degrees. Which direction is he facing now?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7046d05e-5dca-49db-9906-3c59086af79f', '5b960039-34bd-4cfc-b973-6842fba09b4a', 0, 'West');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1beaaa5-8fbc-4cb2-bb8f-39f2f0eac363', '5b960039-34bd-4cfc-b973-6842fba09b4a', 1, 'East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef536f1c-3263-4783-90cb-0fa0739c4c8e', '5b960039-34bd-4cfc-b973-6842fba09b4a', 2, 'South');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6adac33d-35ed-459a-84ac-b72dd2cf8b08', '5b960039-34bd-4cfc-b973-6842fba09b4a', 3, 'North');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5b960039-34bd-4cfc-b973-6842fba09b4a', '7046d05e-5dca-49db-9906-3c59086af79f', 'North -> 90 clockwise -> East -> 180 degrees -> West.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1adf3cd8-e303-4f30-8765-e16a8c2de574', 'c15fd325-cf81-4471-8095-730fbd5741e3', 11, 'Statements: P >= Q, Q > R, R >= S. Conclusion: P > S. Is this valid?', 'Reasoning', 'Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09910da7-a191-4652-9510-1133b7206393', '1adf3cd8-e303-4f30-8765-e16a8c2de574', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c4058ef-ebf5-4e12-86a4-6e69467e9500', '1adf3cd8-e303-4f30-8765-e16a8c2de574', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ad2fd31-f47a-41df-836c-5395744f71c6', '1adf3cd8-e303-4f30-8765-e16a8c2de574', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f068612f-208f-4a2d-9fd8-abcf22f936ff', '1adf3cd8-e303-4f30-8765-e16a8c2de574', 3, 'Valid only if P=Q');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1adf3cd8-e303-4f30-8765-e16a8c2de574', '09910da7-a191-4652-9510-1133b7206393', 'Since Q>R strictly, even at the loosest bounds (P=Q and R=S), P=Q>R=S gives P>S -- valid in every case.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a056bf44-1821-43c8-adbd-f7a2a9def3ae', 'c15fd325-cf81-4471-8095-730fbd5741e3', 12, 'Statements: X < Y, Y < Z. Conclusions: I. X < Z. II. Z > X. Which follow?', 'Reasoning', 'Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('094bbd5a-af1a-40d5-beee-d4f5544ce6d0', 'a056bf44-1821-43c8-adbd-f7a2a9def3ae', 0, 'Both I and II follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f4195fc-be71-4cbb-83da-f2fee6798928', 'a056bf44-1821-43c8-adbd-f7a2a9def3ae', 1, 'Only I follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f94d6b4f-6931-4d85-a597-b2371514d6a4', 'a056bf44-1821-43c8-adbd-f7a2a9def3ae', 2, 'Only II follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59721613-1d09-4956-9c5d-687c54a2403a', 'a056bf44-1821-43c8-adbd-f7a2a9def3ae', 3, 'Neither follows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a056bf44-1821-43c8-adbd-f7a2a9def3ae', '094bbd5a-af1a-40d5-beee-d4f5544ce6d0', 'X<Y<Z directly gives X<Z (I), which is logically identical to Z>X (II) -- both follow.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a7207f32-5a0d-4059-a129-fe5927ed8335', 'c15fd325-cf81-4471-8095-730fbd5741e3', 13, 'Find the next term: A, C, F, J, ?', 'Reasoning', 'Series & Analogy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7ec0273-ddc5-471c-b661-a25d45c9df39', 'a7207f32-5a0d-4059-a129-fe5927ed8335', 0, 'O');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('816739c4-7d1f-4329-84f0-55261274368b', 'a7207f32-5a0d-4059-a129-fe5927ed8335', 1, 'N');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('caad9414-ee01-4bf5-adae-0c27aa64df6b', 'a7207f32-5a0d-4059-a129-fe5927ed8335', 2, 'P');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67a440e1-17c5-45a9-8e3c-d763073405de', 'a7207f32-5a0d-4059-a129-fe5927ed8335', 3, 'M');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a7207f32-5a0d-4059-a129-fe5927ed8335', 'e7ec0273-ddc5-471c-b661-a25d45c9df39', 'The gaps between letters increase by 1 each time (2,3,4,5): J+5 positions = O.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2f275819-f0ab-4be1-a145-e71b9b6d4a5d', 'c15fd325-cf81-4471-8095-730fbd5741e3', 14, 'Book is to Library as Painting is to?', 'Reasoning', 'Series & Analogy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f37e3693-1993-424b-980f-aff05b927c2b', '2f275819-f0ab-4be1-a145-e71b9b6d4a5d', 0, 'Gallery');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('768ec94e-7798-411a-b3ec-b5f553b5e8a9', '2f275819-f0ab-4be1-a145-e71b9b6d4a5d', 1, 'Frame');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8490e6b4-34db-49a1-99a2-e48d44a35035', '2f275819-f0ab-4be1-a145-e71b9b6d4a5d', 2, 'Artist');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90456e4d-e38d-427e-ba93-ea3044bec031', '2f275819-f0ab-4be1-a145-e71b9b6d4a5d', 3, 'Wall');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2f275819-f0ab-4be1-a145-e71b9b6d4a5d', 'f37e3693-1993-424b-980f-aff05b927c2b', 'A library is where books are collected and displayed; a gallery serves the same role for paintings.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('aaca722f-1e40-478c-ad94-bf2604b47743', 'c15fd325-cf81-4471-8095-730fbd5741e3', 15, 'Find the odd one out: Apple, Banana, Carrot, Mango.', 'Reasoning', 'Classification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('56a5402f-c891-466f-968d-db0d17a3f46d', 'aaca722f-1e40-478c-ad94-bf2604b47743', 0, 'Apple');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6199ae7e-7037-4571-8e9e-5b2377bc8cff', 'aaca722f-1e40-478c-ad94-bf2604b47743', 1, 'Banana');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('adcfb2c4-66a1-4dac-a09b-b31db9088b23', 'aaca722f-1e40-478c-ad94-bf2604b47743', 2, 'Carrot');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ddec2970-3efa-41c9-b665-32d30678d656', 'aaca722f-1e40-478c-ad94-bf2604b47743', 3, 'Mango');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aaca722f-1e40-478c-ad94-bf2604b47743', 'adcfb2c4-66a1-4dac-a09b-b31db9088b23', 'Carrot is a vegetable; the others are all fruits.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('84ca0a96-a6b6-4ccf-8220-8dc2d5a54026', 'c15fd325-cf81-4471-8095-730fbd5741e3', 16, 'Find the odd one out: 8, 27, 64, 100.', 'Reasoning', 'Classification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8b67c79-c89d-49bf-9600-0123fb550de8', '84ca0a96-a6b6-4ccf-8220-8dc2d5a54026', 0, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b897824-d0a5-4f12-8378-dbc1c16b99d6', '84ca0a96-a6b6-4ccf-8220-8dc2d5a54026', 1, '27');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd52e6bc-3b32-467d-be0e-ac96673221d5', '84ca0a96-a6b6-4ccf-8220-8dc2d5a54026', 2, '64');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0be10b37-5509-4e74-a6d6-40dd01fe2264', '84ca0a96-a6b6-4ccf-8220-8dc2d5a54026', 3, '100');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('84ca0a96-a6b6-4ccf-8220-8dc2d5a54026', '0be10b37-5509-4e74-a6d6-40dd01fe2264', '8, 27, and 64 are perfect cubes (2^3, 3^3, 4^3); 100 is not a perfect cube.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b24075b9-f9c7-44df-95ca-461f9adc19a2', 'c15fd325-cf81-4471-8095-730fbd5741e3', 17, 'Statements: All doctors are engineers. All engineers are graduates. Conclusion: All doctors are graduates. Is this valid?', 'Reasoning', 'Venn & Statement-Conclusion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3436c87b-4b13-4abe-9b5c-b05964a23242', 'b24075b9-f9c7-44df-95ca-461f9adc19a2', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7983c5d4-84d5-4cbf-8d6c-414f952ef2d4', 'b24075b9-f9c7-44df-95ca-461f9adc19a2', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e89eb1ce-d04a-4704-b7aa-069e3f717bf1', 'b24075b9-f9c7-44df-95ca-461f9adc19a2', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('974e090c-acea-49f0-90af-accce2ea6630', 'b24075b9-f9c7-44df-95ca-461f9adc19a2', 3, 'Valid only partially');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b24075b9-f9c7-44df-95ca-461f9adc19a2', '3436c87b-4b13-4abe-9b5c-b05964a23242', 'This follows by transitivity: doctors are a subset of engineers, which are a subset of graduates.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6445768f-734a-45a6-96f0-3117288eabbb', 'c15fd325-cf81-4471-8095-730fbd5741e3', 18, 'In a class, some students play chess, some play football, and some play both. If drawn as two overlapping circles, the overlapping region represents:', 'Reasoning', 'Venn & Statement-Conclusion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2135be0c-0f04-488c-a2e2-eba423d12dd3', '6445768f-734a-45a6-96f0-3117288eabbb', 0, 'Students who play both chess and football');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9211c3f-732b-4dfe-8fd8-5b5bb2a453f7', '6445768f-734a-45a6-96f0-3117288eabbb', 1, 'Students who play neither game');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbf5c54c-3b0e-4a25-9acd-e6511093b1f7', '6445768f-734a-45a6-96f0-3117288eabbb', 2, 'Students who play only chess');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dcb5bfe5-7248-4df6-80a6-656f536af917', '6445768f-734a-45a6-96f0-3117288eabbb', 3, 'Students who play only football');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6445768f-734a-45a6-96f0-3117288eabbb', '2135be0c-0f04-488c-a2e2-eba423d12dd3', 'The overlapping region of a Venn diagram always represents members common to both sets.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('afb9f4f4-3039-4074-8bd7-c94e715ee51f', 'c15fd325-cf81-4471-8095-730fbd5741e3', 19, 'In a certain input-output machine, numbers in a string are rearranged in descending order while words keep their relative position unchanged. Input: 25 cat 9 dog 42 elephant. What is the output after Step 1?', 'Reasoning', 'Input-Output', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f79a3198-0677-4521-9f5c-75c011c17305', 'afb9f4f4-3039-4074-8bd7-c94e715ee51f', 0, '42 cat 25 dog 9 elephant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9bf0cb76-2401-4333-9ec1-e73f7f06e381', 'afb9f4f4-3039-4074-8bd7-c94e715ee51f', 1, '9 cat 25 dog 42 elephant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50c1f18f-eb97-4089-977f-75250bbf2a9f', 'afb9f4f4-3039-4074-8bd7-c94e715ee51f', 2, 'cat dog elephant 42 25 9');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('712cbf7e-4ba8-45f2-b173-a5ee4f96d4f2', 'afb9f4f4-3039-4074-8bd7-c94e715ee51f', 3, '25 cat 9 dog 42 elephant (unchanged)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('afb9f4f4-3039-4074-8bd7-c94e715ee51f', 'f79a3198-0677-4521-9f5c-75c011c17305', 'The numbers 25, 9, 42 are rearranged in descending order (42, 25, 9), keeping each word in its original relative slot.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d99f4816-c991-4b11-adf7-afe68e043e86', 'c15fd325-cf81-4471-8095-730fbd5741e3', 20, 'Using the same machine as above, Step 2 arranges the words in alphabetical order (numbers stay as positioned in Step 1). What is the output after Step 2, given Step 1 was "42 cat 25 dog 9 elephant"?', 'Reasoning', 'Input-Output', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e10d852-c1d6-416f-b9e1-8ed400990dc2', 'd99f4816-c991-4b11-adf7-afe68e043e86', 0, '42 cat 25 dog 9 elephant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fcbedc64-d466-4520-bd44-dd8ac45de922', 'd99f4816-c991-4b11-adf7-afe68e043e86', 1, 'cat 42 dog 25 elephant 9');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a11521a-4a37-41f8-b251-1ba421855f20', 'd99f4816-c991-4b11-adf7-afe68e043e86', 2, '42 dog 25 cat 9 elephant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('776227a6-3b1c-434d-a508-c120a5972a9b', 'd99f4816-c991-4b11-adf7-afe68e043e86', 3, '9 elephant 25 dog 42 cat');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d99f4816-c991-4b11-adf7-afe68e043e86', '3e10d852-c1d6-416f-b9e1-8ed400990dc2', 'The words cat, dog, elephant are already in alphabetical order, so Step 2 produces no change from Step 1.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Puzzles & Seating Arrangement, Syllogism, Coding-Decoding, Blood Relations, Direction Sense, Inequality, Series & Analogy, Classification, Venn Diagrams/Statement-Conclusion, Input-Output); not copied from any official question paper, and not tied to any single exam''s specific paper.');
