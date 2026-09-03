-- ============================================================
-- IBPS PO Prelims — Full Mock Paper 1
-- Full-Length Practice Paper (89 questions, 54 minutes)
-- Marking: +1 correct / -0.25 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('fdf8104f-1fde-400f-9baf-dff0c531493d', 'ibps-po-prelims-practice-1', 'IBPS PO Prelims Full Mock Paper 1', 'ibps-po', ARRAY['Reasoning', 'Quantitative Aptitude', 'English', 'IBPS PO', 'Prelims']::TEXT[], 89, 'mixed', true, 1, 54, 1, 0.25);

-- ── Section: Reasoning Ability (39 questions) — Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0ce17fb5-113e-4d1c-8aef-ad6797dde65b', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 1, 'Five friends P, Q, R, S, T sit in a row facing north. Q sits second from the left. R sits immediately right of Q. Who sits third from the left?', 'Reasoning', 'Puzzles and Seating', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d6fa667-d0fd-4454-9794-7bad4db05d36', '0ce17fb5-113e-4d1c-8aef-ad6797dde65b', 0, 'P');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5fc7c1a2-30d0-4717-8528-f5fb77658575', '0ce17fb5-113e-4d1c-8aef-ad6797dde65b', 1, 'Q');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f66f0d0-1bde-493e-bd80-a2f6780cea2c', '0ce17fb5-113e-4d1c-8aef-ad6797dde65b', 2, 'R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cd54a02-4a4c-4a79-9ef6-a2cb42ed3f3f', '0ce17fb5-113e-4d1c-8aef-ad6797dde65b', 3, 'Cannot be determined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0ce17fb5-113e-4d1c-8aef-ad6797dde65b', '0f66f0d0-1bde-493e-bd80-a2f6780cea2c', 'Q is at position 2. R sits immediately right of Q, so R is at position 3.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('20e1452c-39ec-4d6e-a1aa-13dac43ca3aa', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 2, 'A is the son of B. C is B''s sister. How is C related to A?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be12cec3-4138-4b8e-a825-5f784e4b1cd9', '20e1452c-39ec-4d6e-a1aa-13dac43ca3aa', 0, 'Mother');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72348feb-7c81-400d-aceb-2b63c1b2f6c2', '20e1452c-39ec-4d6e-a1aa-13dac43ca3aa', 1, 'Aunt');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8bd58b64-d7b5-4b5e-8fad-a8608f5c0ce4', '20e1452c-39ec-4d6e-a1aa-13dac43ca3aa', 2, 'Sister');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cbd2452-a45a-459d-92be-11f206825d5c', '20e1452c-39ec-4d6e-a1aa-13dac43ca3aa', 3, 'Grandmother');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('20e1452c-39ec-4d6e-a1aa-13dac43ca3aa', '72348feb-7c81-400d-aceb-2b63c1b2f6c2', 'C is B''s sister, and B is A''s parent, so C is A''s aunt.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5f47a320-a0a7-4dee-8e5d-414b10bd40b5', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 3, 'Statements: All pens are books. Some books are pencils. Conclusion: Some pencils are pens. Is this conclusion definitely true?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('acf8adc5-dbbc-49db-9665-974aee7c91d7', '5f47a320-a0a7-4dee-8e5d-414b10bd40b5', 0, 'Definitely true');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28782c8a-2ffd-4dbd-b4ee-d192e2546898', '5f47a320-a0a7-4dee-8e5d-414b10bd40b5', 1, 'Not necessarily true');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67f564ae-cd69-450d-8a71-529e3cd86346', '5f47a320-a0a7-4dee-8e5d-414b10bd40b5', 2, 'Definitely false');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('510c6589-d321-441c-97d5-2ff0e6a36746', '5f47a320-a0a7-4dee-8e5d-414b10bd40b5', 3, 'Cannot be determined without a diagram');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5f47a320-a0a7-4dee-8e5d-414b10bd40b5', '28782c8a-2ffd-4dbd-b4ee-d192e2546898', '''Some books are pencils'' only tells us about an overlap between books and pencils, which may or may not include the specific books that are pens -- the conclusion is a possibility, not a certainty.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3a9ad76f-5366-4a26-a3b3-15bd01dba874', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 4, 'If in a code, TRAIN is written as USBJO, how is PLANE written?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('602a7fbd-b37f-4a59-8256-1a7d85d8f442', '3a9ad76f-5366-4a26-a3b3-15bd01dba874', 0, 'QMBOF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1dfeb9b4-b89d-4dff-95be-301454dfeb62', '3a9ad76f-5366-4a26-a3b3-15bd01dba874', 1, 'QMBOE');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b6c8fb6-d20a-4756-bcba-9d85fd702567', '3a9ad76f-5366-4a26-a3b3-15bd01dba874', 2, 'QMANF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('852c698f-b2c4-421a-8ab5-1c04589d8239', '3a9ad76f-5366-4a26-a3b3-15bd01dba874', 3, 'QMBOD');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3a9ad76f-5366-4a26-a3b3-15bd01dba874', '602a7fbd-b37f-4a59-8256-1a7d85d8f442', 'Each letter shifts forward by 1: P->Q, L->M, A->B, N->O, E->F, giving QMBOF.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('df01980a-8fba-4834-bca9-9b36161330a7', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 5, 'Ram walks 6km south, then 8km east. How far is he from his starting point?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3210643-2beb-49b4-801a-853af7ae7a7f', 'df01980a-8fba-4834-bca9-9b36161330a7', 0, '10km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc16aa2a-b254-4fc8-a7e9-572aa8e4af23', 'df01980a-8fba-4834-bca9-9b36161330a7', 1, '12km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38058d8a-8331-4f1a-845e-0754f5718561', 'df01980a-8fba-4834-bca9-9b36161330a7', 2, '14km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a709823-d0d9-499e-83ae-ef3899471fd4', 'df01980a-8fba-4834-bca9-9b36161330a7', 3, '2km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('df01980a-8fba-4834-bca9-9b36161330a7', 'd3210643-2beb-49b4-801a-853af7ae7a7f', 'This forms a right triangle with legs 6 and 8; displacement = sqrt(6^2+8^2) = sqrt(100) = 10km.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0e0302cd-e7f5-45ae-b597-e9ebfe3e5586', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 6, 'Statements: A > B, B >= C, C > D. Conclusion: A > D. Is this valid?', 'Reasoning', 'Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0f5b36c-5b25-460d-9085-970fb5c3342f', '0e0302cd-e7f5-45ae-b597-e9ebfe3e5586', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('208a8dce-86b7-449d-8060-21fe37f7da16', '0e0302cd-e7f5-45ae-b597-e9ebfe3e5586', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2eeefc4-536e-4a7a-a61c-28166aace4f7', '0e0302cd-e7f5-45ae-b597-e9ebfe3e5586', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a01c0a04-2d2b-41d7-8571-306266c8f082', '0e0302cd-e7f5-45ae-b597-e9ebfe3e5586', 3, 'Only valid if A=B');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0e0302cd-e7f5-45ae-b597-e9ebfe3e5586', 'e0f5b36c-5b25-460d-9085-970fb5c3342f', 'Even in the case B=C, we get A>B=C>D, meaning A>D holds regardless -- the chain supports the conclusion in every case.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e3417bcd-51dc-439d-9afa-b9ab6d46f00f', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 7, 'In a circular arrangement of 6 people facing the center, X sits third to the right of Y. If Y is at position 2 (numbered clockwise 1-6), where does X sit?', 'Reasoning', 'Puzzles and Seating', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0833ab7c-ab5b-44dd-ba3d-d92699004140', 'e3417bcd-51dc-439d-9afa-b9ab6d46f00f', 0, 'Position 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae3b08a8-1370-4b26-9e42-18db7888d5dd', 'e3417bcd-51dc-439d-9afa-b9ab6d46f00f', 1, 'Position 5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d356de8-0b9e-44cd-85ed-2f52eb89d312', 'e3417bcd-51dc-439d-9afa-b9ab6d46f00f', 2, 'Position 6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19819777-114b-4a25-972e-d31c0584e66e', 'e3417bcd-51dc-439d-9afa-b9ab6d46f00f', 3, 'Position 1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e3417bcd-51dc-439d-9afa-b9ab6d46f00f', 'ae3b08a8-1370-4b26-9e42-18db7888d5dd', 'Moving 3 positions clockwise (to the right) from position 2 gives position 5.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a6bbc17f-fe33-4a3a-bc56-abdf5c5857d8', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 8, 'Pointing to a photograph, a man said, ''She is the daughter of my grandfather''s only son.'' How is the woman related to the man?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5573b6b-f169-450e-b6ff-9dd1cd19242c', 'a6bbc17f-fe33-4a3a-bc56-abdf5c5857d8', 0, 'Sister');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8976214-d5b2-49e8-98fb-ea2ad1525df2', 'a6bbc17f-fe33-4a3a-bc56-abdf5c5857d8', 1, 'Mother');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1f13c33-96d5-42b7-8a85-9b6668a3daa6', 'a6bbc17f-fe33-4a3a-bc56-abdf5c5857d8', 2, 'Cousin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65fe6381-f506-4821-8e6f-01338589fa98', 'a6bbc17f-fe33-4a3a-bc56-abdf5c5857d8', 3, 'Aunt');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a6bbc17f-fe33-4a3a-bc56-abdf5c5857d8', 'f5573b6b-f169-450e-b6ff-9dd1cd19242c', '''My grandfather''s only son'' is the man''s father (assuming the man himself is that son, or it directly refers to his father as the only son). The daughter of the man''s father is his sister.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('dbd45ad8-c9b3-4b64-bb81-4c44d51a7456', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 9, 'In a certain code, ''ROSE'' is written as ''6821'' and ''CHAIR'' is written as ''73456''. What is the code for ''R''?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83e4cbd4-124c-42b4-a72a-87fe052495ac', 'dbd45ad8-c9b3-4b64-bb81-4c44d51a7456', 0, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c19c6651-810d-470a-880c-f73c1857a0b2', 'dbd45ad8-c9b3-4b64-bb81-4c44d51a7456', 1, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3bc66ae4-09d3-400a-9957-0576018bebd5', 'dbd45ad8-c9b3-4b64-bb81-4c44d51a7456', 2, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4372521e-c09c-4eb7-ad6e-1e18cc58a0e1', 'dbd45ad8-c9b3-4b64-bb81-4c44d51a7456', 3, '8');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dbd45ad8-c9b3-4b64-bb81-4c44d51a7456', 'c19c6651-810d-470a-880c-f73c1857a0b2', 'In ROSE=6821, R corresponds to the first digit position matching R''s occurrence; cross-referencing with CHAIR=73456 where R is the last letter coded as 5, R''s code is 5.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2d7f271e-9713-419a-94b2-128e4daacd19', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 10, 'A man starts from point X, walks 5km north to Y, then 5km east to Z. What direction is X from Z?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b9818d9-b641-43d9-b24d-5c93111ab300', '2d7f271e-9713-419a-94b2-128e4daacd19', 0, 'North-East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c2b0798-c26d-4658-b7f8-f93582e970a9', '2d7f271e-9713-419a-94b2-128e4daacd19', 1, 'South-West');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c57de41b-6343-4bfb-b4dc-3530f7ed552d', '2d7f271e-9713-419a-94b2-128e4daacd19', 2, 'North-West');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9d56823-ffff-4071-b962-ff5332a63a72', '2d7f271e-9713-419a-94b2-128e4daacd19', 3, 'South-East');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2d7f271e-9713-419a-94b2-128e4daacd19', '6c2b0798-c26d-4658-b7f8-f93582e970a9', 'Z is north-east of X, so X is in the opposite direction from Z, which is south-west.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('536c993b-4a11-4904-8a61-6c790615330f', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 11, 'Statements: P <= Q, Q < R, R <= S. Conclusion: P < S. Is this valid?', 'Reasoning', 'Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7cb7afe-000f-4e3d-bfe9-15948c844aa3', '536c993b-4a11-4904-8a61-6c790615330f', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c12b933-92cc-4de7-aa03-6e06ec513578', '536c993b-4a11-4904-8a61-6c790615330f', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00d09b2a-f0d3-421a-aad3-8140797f2988', '536c993b-4a11-4904-8a61-6c790615330f', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25558f5b-508c-4ba1-ba0e-c4baf66607ff', '536c993b-4a11-4904-8a61-6c790615330f', 3, 'Only valid if P=Q');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('536c993b-4a11-4904-8a61-6c790615330f', 'd7cb7afe-000f-4e3d-bfe9-15948c844aa3', 'Since Q<R strictly, even with P<=Q and R<=S at their loosest (P=Q and R=S), we get P=Q<R=S, so P<S holds in every case.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f211f90b-934f-4da0-a1b7-d4cfd17922ea', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 12, '8 people sit in a row. A sits at one of the extreme ends (position 1). B sits fourth from A. How many people sit between A and B?', 'Reasoning', 'Puzzles and Seating', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41ba7943-dbaf-468c-8cc6-c4da2220a454', 'f211f90b-934f-4da0-a1b7-d4cfd17922ea', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4fe3994-874c-4b60-9a06-58b622527fbc', 'f211f90b-934f-4da0-a1b7-d4cfd17922ea', 1, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad32cdee-522e-439f-8315-a4fbbf36f61b', 'f211f90b-934f-4da0-a1b7-d4cfd17922ea', 2, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eab6bb5f-7d79-464b-9672-8496408d4300', 'f211f90b-934f-4da0-a1b7-d4cfd17922ea', 3, '5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f211f90b-934f-4da0-a1b7-d4cfd17922ea', '41ba7943-dbaf-468c-8cc6-c4da2220a454', 'Counting A as the 1st position, B being ''fourth from A'' places B at position 4. The people sitting between position 1 (A) and position 4 (B) are at positions 2 and 3 -- 2 people.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('689f0b49-ea6e-4abf-8824-13ad51f7238f', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 13, 'A''s father is B. B''s mother is C. C''s husband is D. How is D related to A?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e31a4b9d-45df-45fb-a618-9bf941c5461e', '689f0b49-ea6e-4abf-8824-13ad51f7238f', 0, 'Father');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f5468f4-1eeb-40dc-8048-359e3cd59da7', '689f0b49-ea6e-4abf-8824-13ad51f7238f', 1, 'Grandfather');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('127c5857-7360-486b-9bf3-884d7916451a', '689f0b49-ea6e-4abf-8824-13ad51f7238f', 2, 'Uncle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('630f979a-279d-4a33-bb91-d13e42e2bc89', '689f0b49-ea6e-4abf-8824-13ad51f7238f', 3, 'Brother');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('689f0b49-ea6e-4abf-8824-13ad51f7238f', '2f5468f4-1eeb-40dc-8048-359e3cd59da7', 'C is B''s mother, so D (C''s husband) is B''s father, making D A''s grandfather.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8dafae0b-2e2b-4b71-b54e-6e1b9f716138', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 14, 'If DELHI is coded as 45327 and CALCUTTA is coded as 82589662, what is the code for L?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e07f9d08-470d-495f-81eb-894d7512db43', '8dafae0b-2e2b-4b71-b54e-6e1b9f716138', 0, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e297946-d98c-4391-af4b-0cb67a2f0a4e', '8dafae0b-2e2b-4b71-b54e-6e1b9f716138', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1534e71d-8757-4259-b1b2-a5f1803e9704', '8dafae0b-2e2b-4b71-b54e-6e1b9f716138', 2, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('025d495f-53f2-45f3-b079-5823f3c0dec0', '8dafae0b-2e2b-4b71-b54e-6e1b9f716138', 3, '5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8dafae0b-2e2b-4b71-b54e-6e1b9f716138', 'e07f9d08-470d-495f-81eb-894d7512db43', 'In DELHI=45327, matching each letter to a digit position, L corresponds to the third digit, which is 3.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ab20e71c-74a9-41a6-8b4d-d201c320a633', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 15, 'A person walks 10m north, then turns right and walks 5m, then turns right again and walks 10m. How far is he from the starting point?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('593584d7-0e97-4f0b-80b8-dc48ba22c6d3', 'ab20e71c-74a9-41a6-8b4d-d201c320a633', 0, '5m');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b71dcbe-8b37-4968-b4d8-ad39da181dff', 'ab20e71c-74a9-41a6-8b4d-d201c320a633', 1, '10m');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8dddbab-a1b9-49de-b9ed-349cb26213ef', 'ab20e71c-74a9-41a6-8b4d-d201c320a633', 2, '15m');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f9c2a63-757a-4627-92b2-4a9e863355b9', 'ab20e71c-74a9-41a6-8b4d-d201c320a633', 3, '25m');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ab20e71c-74a9-41a6-8b4d-d201c320a633', '593584d7-0e97-4f0b-80b8-dc48ba22c6d3', 'The two 10m segments (north, then south after two right turns) cancel out, leaving only the 5m east displacement.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('555e8b0e-4e20-453e-8f2c-1fd6548aa0e6', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 16, 'Statements: Some doctors are engineers. All engineers are graduates. Conclusion: Some doctors are graduates. Is this valid?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2777a0c3-5bbc-4065-aae5-98880add87fc', '555e8b0e-4e20-453e-8f2c-1fd6548aa0e6', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40548e3b-1f5f-45cb-beee-824d94a33e92', '555e8b0e-4e20-453e-8f2c-1fd6548aa0e6', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('378b1711-4bcd-4ea3-8bb1-62b956cbdc29', '555e8b0e-4e20-453e-8f2c-1fd6548aa0e6', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47459d27-f293-49b4-9f04-37930ec46eaa', '555e8b0e-4e20-453e-8f2c-1fd6548aa0e6', 3, 'Only valid if reversed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('555e8b0e-4e20-453e-8f2c-1fd6548aa0e6', '2777a0c3-5bbc-4065-aae5-98880add87fc', 'Since some doctors are engineers, and all of those engineers are graduates, those same doctors must be graduates too -- ''Some doctors are graduates'' follows directly.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('49625e47-9675-43da-a182-9635ee1ec2af', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 17, 'In a code, ''GARDEN'' is written as ''HBSEFO''. How is ''FLOWER'' written?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2308331-70a6-48b1-b36c-5dde8029a4eb', '49625e47-9675-43da-a182-9635ee1ec2af', 0, 'GMPXFS');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8059ac76-42b4-4dfd-ad32-27ddf95719da', '49625e47-9675-43da-a182-9635ee1ec2af', 1, 'GMPXFT');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fdc755b5-e392-4100-b7b2-36e9da39dfa2', '49625e47-9675-43da-a182-9635ee1ec2af', 2, 'GNPXFS');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e747fd3-edce-40a4-bccf-eb2e09cdb640', '49625e47-9675-43da-a182-9635ee1ec2af', 3, 'GMQXFS');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('49625e47-9675-43da-a182-9635ee1ec2af', 'f2308331-70a6-48b1-b36c-5dde8029a4eb', 'Each letter shifts forward by 1: F->G, L->M, O->P, W->X, E->F, R->S, giving GMPXFS.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0fa55b2a-8d7e-4ac6-a1f4-0cbaf7b615a2', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 18, 'Introducing a boy, a woman said, ''His mother is the only daughter-in-law of my mother.'' How is the woman related to the boy?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4fc9b9e0-db95-4b50-92b4-b6474e6c53e5', '0fa55b2a-8d7e-4ac6-a1f4-0cbaf7b615a2', 0, 'Mother');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5d21b2c-141a-4da1-a38b-baa924714875', '0fa55b2a-8d7e-4ac6-a1f4-0cbaf7b615a2', 1, 'Aunt');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09e978d1-cfc1-4507-b50a-d307f7d3f463', '0fa55b2a-8d7e-4ac6-a1f4-0cbaf7b615a2', 2, 'Grandmother');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4c6693b-00c8-4d49-b2a6-c46363a6b016', '0fa55b2a-8d7e-4ac6-a1f4-0cbaf7b615a2', 3, 'Sister');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0fa55b2a-8d7e-4ac6-a1f4-0cbaf7b615a2', '4fc9b9e0-db95-4b50-92b4-b6474e6c53e5', '''The only daughter-in-law of my mother'' means the wife of the woman''s brother OR the woman herself if she is her mother''s only son''s wife -- in context, this refers to the woman herself being the boy''s mother.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9e8d7a3b-ee59-4c43-bc03-ed5833fdd2d7', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 19, 'A is 10m north of B. C is 10m east of A. What is the direction of C with respect to B?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f3db2e5-66ec-4c63-8f8b-f81d0e4760d4', '9e8d7a3b-ee59-4c43-bc03-ed5833fdd2d7', 0, 'North-East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3966be9-762b-4b15-834d-2a52f0cc2625', '9e8d7a3b-ee59-4c43-bc03-ed5833fdd2d7', 1, 'North-West');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c691c01f-3b86-4d85-90b3-463e2301f09c', '9e8d7a3b-ee59-4c43-bc03-ed5833fdd2d7', 2, 'South-East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af00b420-6101-4741-9424-1f6ecaf18d25', '9e8d7a3b-ee59-4c43-bc03-ed5833fdd2d7', 3, 'South-West');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9e8d7a3b-ee59-4c43-bc03-ed5833fdd2d7', '6f3db2e5-66ec-4c63-8f8b-f81d0e4760d4', 'C is north of B (via A) and east of A, placing C in the north-east direction relative to B.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('875ea2bc-3891-48b7-8331-8c5a304bd162', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 20, 'Statements: X < Y, Y <= Z, Z < W. Conclusion: X < W. Is this valid?', 'Reasoning', 'Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea60b722-7bcf-4783-80e8-0ac8d06c3f0e', '875ea2bc-3891-48b7-8331-8c5a304bd162', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('878a8557-f7ff-410a-8e00-92cc9cd25455', '875ea2bc-3891-48b7-8331-8c5a304bd162', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('766d02e5-fe6d-46b2-b9f2-7278f68623f0', '875ea2bc-3891-48b7-8331-8c5a304bd162', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30f36ff3-82f4-45bd-8c76-a19108dca22a', '875ea2bc-3891-48b7-8331-8c5a304bd162', 3, 'Only valid if X=Y');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('875ea2bc-3891-48b7-8331-8c5a304bd162', 'ea60b722-7bcf-4783-80e8-0ac8d06c3f0e', 'Even at Y=Z (the loosest case), X<Y=Z<W gives X<W directly -- the conclusion holds in every case.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('91faf566-e642-4fff-acbb-f8d905a27017', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 21, '6 people sit around a circular table facing the center. A is to the immediate left of B. C is opposite A. Who is opposite B?', 'Reasoning', 'Puzzles and Seating', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ef5550e-5723-405c-9a76-a7714b068dca', '91faf566-e642-4fff-acbb-f8d905a27017', 0, 'A person adjacent to C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0bf47936-bdee-491f-af21-92f03f16cb1d', '91faf566-e642-4fff-acbb-f8d905a27017', 1, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6609cbee-40e5-482f-8707-c81b024c3e6c', '91faf566-e642-4fff-acbb-f8d905a27017', 2, 'A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('599c9cba-ba6b-414d-a7e1-d33edb7e3352', '91faf566-e642-4fff-acbb-f8d905a27017', 3, 'Cannot be determined without more clues');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('91faf566-e642-4fff-acbb-f8d905a27017', '3ef5550e-5723-405c-9a76-a7714b068dca', 'Since C is opposite A, and B is adjacent to A (not opposite), the person opposite B must be someone adjacent to C, not C itself.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5c397002-f7e5-4405-98d5-6c7b0682c817', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 22, 'If ''BOOK'' is coded as ''2 15 15 11'' (using A=1,B=2...), what is the code for ''PEN''?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('149a7765-b7d1-483a-8aaa-e64b96f030a4', '5c397002-f7e5-4405-98d5-6c7b0682c817', 0, '16 5 14');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('342e7b0d-512f-4a98-ba91-a69dde96716e', '5c397002-f7e5-4405-98d5-6c7b0682c817', 1, '16 4 14');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85d4db93-a79b-402a-9975-a254d02409ad', '5c397002-f7e5-4405-98d5-6c7b0682c817', 2, '15 5 14');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d072a120-a055-4991-b710-24e074b06154', '5c397002-f7e5-4405-98d5-6c7b0682c817', 3, '16 5 13');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5c397002-f7e5-4405-98d5-6c7b0682c817', '149a7765-b7d1-483a-8aaa-e64b96f030a4', 'P=16, E=5, N=14, giving the code ''16 5 14''.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a6bd33ea-d6e4-4cfe-a9fe-ef123a782870', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 23, 'A and B are sisters. C is A''s son. D is B''s brother. How is D related to C?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0799fdc-898c-487b-938c-4ac06b66bf10', 'a6bd33ea-d6e4-4cfe-a9fe-ef123a782870', 0, 'Uncle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5b6d768-e66e-48ce-b4e3-2953bfc77532', 'a6bd33ea-d6e4-4cfe-a9fe-ef123a782870', 1, 'Father');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27d09c8a-6a39-40b2-9a58-eefa5a60cdf0', 'a6bd33ea-d6e4-4cfe-a9fe-ef123a782870', 2, 'Cousin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50aa7546-b32f-45a1-a7d7-14f2dd5edaa2', 'a6bd33ea-d6e4-4cfe-a9fe-ef123a782870', 3, 'Grandfather');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a6bd33ea-d6e4-4cfe-a9fe-ef123a782870', 'd0799fdc-898c-487b-938c-4ac06b66bf10', 'D is B''s brother, and since A and B are sisters, D is also A''s brother. A''s brother is C''s uncle.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e5a54410-5801-41fa-ad96-d7394cabfa74', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 24, 'Facing south, a man turns 90 degrees anticlockwise, then 90 degrees clockwise, then 180 degrees. Which direction is he facing now?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d74d918b-a89e-4354-ac5b-0d9f8c482b1c', 'e5a54410-5801-41fa-ad96-d7394cabfa74', 0, 'North');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1d57366-20f6-4489-bf46-d31e3ead25c6', 'e5a54410-5801-41fa-ad96-d7394cabfa74', 1, 'South');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dde986b2-a634-4ba8-8dfd-e0bc5ce81604', 'e5a54410-5801-41fa-ad96-d7394cabfa74', 2, 'East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42de39b2-f1d2-46c8-80e7-6b4b7a9a0eb1', 'e5a54410-5801-41fa-ad96-d7394cabfa74', 3, 'West');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e5a54410-5801-41fa-ad96-d7394cabfa74', 'd74d918b-a89e-4354-ac5b-0d9f8c482b1c', 'South -> 90 anticlockwise -> East -> 90 clockwise -> South -> 180 degrees -> North.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9600b549-abb8-4c5b-bd5e-169836142479', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 25, 'Statements: A >= B, B > C, C >= D. Conclusion: A > D. Is this valid?', 'Reasoning', 'Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e6a8b2f-356c-4351-b1b6-b79256b97e7a', '9600b549-abb8-4c5b-bd5e-169836142479', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb098dfb-87f9-4768-8ae7-b47e654ea877', '9600b549-abb8-4c5b-bd5e-169836142479', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49edde0a-8f8d-448e-849a-58cf7e59d5f3', '9600b549-abb8-4c5b-bd5e-169836142479', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c531ea05-8309-4cba-9903-6891a29cba3e', '9600b549-abb8-4c5b-bd5e-169836142479', 3, 'Only valid if B=C');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9600b549-abb8-4c5b-bd5e-169836142479', '0e6a8b2f-356c-4351-b1b6-b79256b97e7a', 'Since B>C strictly, even at the loosest bounds (A=B and C=D), A=B>C=D gives A>D -- valid in every case.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('24015e30-30d4-4d5b-9d9f-cd59e248294a', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 26, 'In a row of 7 people facing north, D is exactly in the middle. Two people sit to D''s left and four to D''s right, or the reverse -- what must be true about D''s position for this to be a valid row of 7?', 'Reasoning', 'Puzzles and Seating', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da2c3efe-4ad3-4dcc-a146-12dcd97e815e', '24015e30-30d4-4d5b-9d9f-cd59e248294a', 0, 'D must be at position 4 (exactly 3 on each side)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0a4c4d6-ad64-4c54-a0cc-40aa49388644', '24015e30-30d4-4d5b-9d9f-cd59e248294a', 1, 'D can be at any position');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce1008ef-4154-4671-9027-02b6c07925fa', '24015e30-30d4-4d5b-9d9f-cd59e248294a', 2, 'D must be at an extreme end');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39081eb9-5bce-4410-bbe7-3e6fd0484935', '24015e30-30d4-4d5b-9d9f-cd59e248294a', 3, 'This scenario is impossible for 7 people');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('24015e30-30d4-4d5b-9d9f-cd59e248294a', 'da2c3efe-4ad3-4dcc-a146-12dcd97e815e', 'For D to be exactly in the middle of 7 people, there must be exactly 3 people on each side, placing D at position 4.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('85634f3a-e8c7-4aba-a86e-7de315ffd9ff', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 27, 'If the code for ''RIVER'' is ''SJWFS'', what is the code for ''OCEAN''?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b4c8107-997c-4ed2-aa92-94677f79398c', '85634f3a-e8c7-4aba-a86e-7de315ffd9ff', 0, 'PDFBO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('313c849d-22ef-44c6-99be-89fcc8ff82d5', '85634f3a-e8c7-4aba-a86e-7de315ffd9ff', 1, 'PDFBP');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7bad50e-ff51-4c2d-a3fd-0beb126ecd25', '85634f3a-e8c7-4aba-a86e-7de315ffd9ff', 2, 'PDGBO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('186da566-db67-4b79-9945-b5a39f6d2731', '85634f3a-e8c7-4aba-a86e-7de315ffd9ff', 3, 'PEFBO');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('85634f3a-e8c7-4aba-a86e-7de315ffd9ff', '6b4c8107-997c-4ed2-aa92-94677f79398c', 'Each letter shifts forward by 1: O->P, C->D, E->F, A->B, N->O, giving PDFBO.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c5d7857b-eeac-4bca-8c47-cc2b6f131f10', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 28, 'Pointing to a man, a woman said, ''His brother''s father is my father-in-law.'' How is the woman related to the man?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f34c009c-03bb-4c02-abeb-29d94ebf6c78', 'c5d7857b-eeac-4bca-8c47-cc2b6f131f10', 0, 'Sister-in-law');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67ed93fc-8226-48b1-8eb6-ba640c188561', 'c5d7857b-eeac-4bca-8c47-cc2b6f131f10', 1, 'Wife');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a54ea5a-cd4b-4100-be01-0f83ec4ac501', 'c5d7857b-eeac-4bca-8c47-cc2b6f131f10', 2, 'Daughter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8b97ea3-28f7-4e44-9c64-e927122d0ea0', 'c5d7857b-eeac-4bca-8c47-cc2b6f131f10', 3, 'Sister');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c5d7857b-eeac-4bca-8c47-cc2b6f131f10', 'f34c009c-03bb-4c02-abeb-29d94ebf6c78', 'The man''s brother''s father is also the man''s own father, and if that is the woman''s father-in-law, then the woman is married into that family, making her the man''s sister-in-law (his brother''s wife).', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4f3a0a8f-1b92-4738-acd4-141cca783863', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 29, 'Point A is 15km west of Point B. Point C is 15km north of Point A. What is the shortest distance between B and C?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a32f66f-8d8b-4f70-9b6a-110a0af9761e', '4f3a0a8f-1b92-4738-acd4-141cca783863', 0, '15sqrt(2) km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3406ef4-06d0-436e-86bb-6ec04efcf40b', '4f3a0a8f-1b92-4738-acd4-141cca783863', 1, '15km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('231b1a32-cc27-4f4a-9909-3abfe75ca86c', '4f3a0a8f-1b92-4738-acd4-141cca783863', 2, '30km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06be34c9-b53a-4797-9f33-8abde4202652', '4f3a0a8f-1b92-4738-acd4-141cca783863', 3, '7.5sqrt(2) km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4f3a0a8f-1b92-4738-acd4-141cca783863', '9a32f66f-8d8b-4f70-9b6a-110a0af9761e', 'B, A, and C form a right angle at A with both legs 15km, so the direct distance BC = sqrt(15^2+15^2) = 15sqrt(2) km.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6c61d783-d4f1-483e-ab11-bfafbfadf317', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 30, 'Statements: P > Q, Q = R, R > S. Conclusion: P > S. Is this valid?', 'Reasoning', 'Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('256f3b5a-c3fd-464a-9e68-6f08ec34a89d', '6c61d783-d4f1-483e-ab11-bfafbfadf317', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2edbc34-4c73-46af-b13c-ed7057c56b65', '6c61d783-d4f1-483e-ab11-bfafbfadf317', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('810d66af-13fc-4bf8-ba9c-f1832944b589', '6c61d783-d4f1-483e-ab11-bfafbfadf317', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a685444-d176-4bec-ac0f-42c6ef614d52', '6c61d783-d4f1-483e-ab11-bfafbfadf317', 3, 'Only valid if P=R');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6c61d783-d4f1-483e-ab11-bfafbfadf317', '256f3b5a-c3fd-464a-9e68-6f08ec34a89d', 'P>Q=R>S directly chains to P>S -- valid.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4679c682-07fd-442e-a5f1-0709e0f2b518', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 31, '5 boxes are stacked vertically. Box C is above Box D. Box A is at the top. Box B is directly below Box A. Box E is at the bottom. What is the order from top to bottom?', 'Reasoning', 'Puzzles and Seating', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d390c260-21c6-4771-90bc-9e9c21989bb6', '4679c682-07fd-442e-a5f1-0709e0f2b518', 0, 'A, B, C, D, E');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8c82d63-63ab-40b3-ad09-4f9517e797c5', '4679c682-07fd-442e-a5f1-0709e0f2b518', 1, 'A, C, B, D, E');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03174b20-8505-451f-b738-d14d341286f7', '4679c682-07fd-442e-a5f1-0709e0f2b518', 2, 'A, B, D, C, E');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e1afe51-40fd-44fd-b061-8cf8bc7a35fb', '4679c682-07fd-442e-a5f1-0709e0f2b518', 3, 'A, C, D, B, E');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4679c682-07fd-442e-a5f1-0709e0f2b518', 'd390c260-21c6-4771-90bc-9e9c21989bb6', 'A is at top, B directly below A (2nd), then C above D (so C is 3rd, D is 4th), and E is at the bottom (5th): A, B, C, D, E.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('efe338bc-991f-4f97-8c79-683980cc61fe', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 32, 'In a code, if ''SUN'' is written as ''19-21-14'' (matching alphabet positions), what is ''MOON'' written as?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b83940a2-cca7-4e9a-9ba9-a9c82736aefc', 'efe338bc-991f-4f97-8c79-683980cc61fe', 0, '13-15-15-14');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea084b4e-5d3f-4c58-bfb4-22a011a26d70', 'efe338bc-991f-4f97-8c79-683980cc61fe', 1, '13-14-15-14');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbfb3964-6d5d-49b9-8f59-f8210b98bee1', 'efe338bc-991f-4f97-8c79-683980cc61fe', 2, '12-15-15-14');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09957adc-1adc-4437-ada4-e88f8dc8877f', 'efe338bc-991f-4f97-8c79-683980cc61fe', 3, '13-15-14-14');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('efe338bc-991f-4f97-8c79-683980cc61fe', 'b83940a2-cca7-4e9a-9ba9-a9c82736aefc', 'M=13, O=15, O=15, N=14, giving ''13-15-15-14''.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('449ee3e5-71eb-4222-8010-94ca00a65b62', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 33, 'A man introduces a woman as ''the daughter of my wife''s mother-in-law''s only son.'' How is the woman related to the man?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1240335f-4a65-42a6-800d-045dac8eba37', '449ee3e5-71eb-4222-8010-94ca00a65b62', 0, 'His own daughter (if he is that son)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f672c077-e07a-47e6-b7ed-9bb9e220ccbf', '449ee3e5-71eb-4222-8010-94ca00a65b62', 1, 'His sister');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b3cae1a-fca2-4727-b50b-c5e6435bcad6', '449ee3e5-71eb-4222-8010-94ca00a65b62', 2, 'His niece');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f0f2d89-3798-4b7c-af9c-af45975ad577', '449ee3e5-71eb-4222-8010-94ca00a65b62', 3, 'His mother');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('449ee3e5-71eb-4222-8010-94ca00a65b62', '1240335f-4a65-42a6-800d-045dac8eba37', 'The man''s wife''s mother-in-law''s son is the man himself (since the mother-in-law''s son who is married to the wife is the man). So the woman, being that son''s daughter, is the man''s own daughter.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('428c5d93-b43d-484b-aa70-cf65daca5ca3', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 34, 'A person walks 8km east, then 6km south. What is the shortest distance to the starting point?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41ce1352-7fee-4302-9c93-43cbfdc52e9e', '428c5d93-b43d-484b-aa70-cf65daca5ca3', 0, '10km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df8226ad-6985-42bb-83c5-bcd3159431bb', '428c5d93-b43d-484b-aa70-cf65daca5ca3', 1, '12km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dff40631-6b82-432a-882f-90a9660db91b', '428c5d93-b43d-484b-aa70-cf65daca5ca3', 2, '14km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('faf7d6e8-b584-4820-a7ed-e92dbf4f8dc4', '428c5d93-b43d-484b-aa70-cf65daca5ca3', 3, '2km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('428c5d93-b43d-484b-aa70-cf65daca5ca3', '41ce1352-7fee-4302-9c93-43cbfdc52e9e', 'This forms a right triangle with legs 8 and 6; distance = sqrt(8^2+6^2) = sqrt(100) = 10km.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2fee4749-f936-4bef-b916-7119b4ae541b', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 35, 'Statements: M < N, N <= O, O < P. Conclusion: M < P. Is this valid?', 'Reasoning', 'Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('618fb482-30db-4a48-8532-2bdd5f78c9c3', '2fee4749-f936-4bef-b916-7119b4ae541b', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50c23e0b-f4db-4c88-8583-b889afc440eb', '2fee4749-f936-4bef-b916-7119b4ae541b', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0fec522-b187-4614-a322-04d37bfda38a', '2fee4749-f936-4bef-b916-7119b4ae541b', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('570c9c55-0afb-4305-af2b-68a1c9d9aefb', '2fee4749-f936-4bef-b916-7119b4ae541b', 3, 'Only valid if N=O');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2fee4749-f936-4bef-b916-7119b4ae541b', '618fb482-30db-4a48-8532-2bdd5f78c9c3', 'Even in the loosest case N=O, M<N=O<P gives M<P -- valid in every case.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f20a5d05-6294-4498-96c5-fc2b6f90e830', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 36, '7 people sit in a row. G is second from the left end. H is third from the right end. If there are 7 people total, how many people sit between G and H?', 'Reasoning', 'Puzzles and Seating', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57544fd3-173c-4afc-8113-51ce8df07b2e', 'f20a5d05-6294-4498-96c5-fc2b6f90e830', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f38cb45-6a66-4523-aa31-09f66f4cbe1e', 'f20a5d05-6294-4498-96c5-fc2b6f90e830', 1, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8abbb69-b40c-48cc-87a3-7b557f35bee7', 'f20a5d05-6294-4498-96c5-fc2b6f90e830', 2, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b494460-d53d-4456-a787-0f5f24b705fd', 'f20a5d05-6294-4498-96c5-fc2b6f90e830', 3, '5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f20a5d05-6294-4498-96c5-fc2b6f90e830', '57544fd3-173c-4afc-8113-51ce8df07b2e', 'G is at position 2 (from left). H is third from the right, which in a row of 7 is position 5 (from left). People between positions 2 and 5 are at positions 3 and 4 -- 2 people.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('eac98132-e739-4513-a644-e51b82a3a52d', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 37, 'If ''APPLE'' is coded as ''BQQMF'', what pattern is being used?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('481c9b9b-db68-402d-86d4-d566ac6cb3fe', 'eac98132-e739-4513-a644-e51b82a3a52d', 0, 'Each letter is shifted forward by 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5b14c53-88a5-4993-b14d-0ad9d68d8c97', 'eac98132-e739-4513-a644-e51b82a3a52d', 1, 'Each letter is shifted backward by 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc4ad0b9-8dd4-4731-84d8-293f8d2707aa', 'eac98132-e739-4513-a644-e51b82a3a52d', 2, 'Letters are reversed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('490777df-907b-4e98-8f16-94c53e99bd90', 'eac98132-e739-4513-a644-e51b82a3a52d', 3, 'Vowels and consonants are swapped');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('eac98132-e739-4513-a644-e51b82a3a52d', '481c9b9b-db68-402d-86d4-d566ac6cb3fe', 'A->B, P->Q, P->Q, L->M, E->F -- each letter moves forward by exactly one position in the alphabet.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b15f7909-5d88-436e-bfa7-a4156ecf3094', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 38, 'A is B''s father. C is D''s mother. A and C are married. B has no siblings. How is D related to B?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a13d9ca3-647c-429b-91b3-c445984c4c00', 'b15f7909-5d88-436e-bfa7-a4156ecf3094', 0, 'Sibling (brother or sister)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8ecdc3a-5b1a-41b6-8d6b-6bdee90057f6', 'b15f7909-5d88-436e-bfa7-a4156ecf3094', 1, 'Cousin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('255eee4e-71fb-4d4e-80a1-3b3b1eaa788e', 'b15f7909-5d88-436e-bfa7-a4156ecf3094', 2, 'Uncle/Aunt');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5f4af8b-4c9c-4975-93c0-d7af1a656c08', 'b15f7909-5d88-436e-bfa7-a4156ecf3094', 3, 'Grandparent');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b15f7909-5d88-436e-bfa7-a4156ecf3094', 'a13d9ca3-647c-429b-91b3-c445984c4c00', 'A (B''s father) and C (D''s mother) are married to each other, making them a couple whose children are B and D -- so B and D are siblings.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('94c6a8a2-ce4e-4769-b0c7-55d343cf8113', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 39, 'A cyclist rides 12km north, then 5km west. How far is he from the starting point?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('181fec23-45f2-49cd-80e6-2c8dbe174dca', '94c6a8a2-ce4e-4769-b0c7-55d343cf8113', 0, '13km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b567012-e268-4423-93f3-6be6246ce2c2', '94c6a8a2-ce4e-4769-b0c7-55d343cf8113', 1, '15km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1fc8785b-a57f-47a4-a8b8-da5d991e1e18', '94c6a8a2-ce4e-4769-b0c7-55d343cf8113', 2, '17km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72c36edf-1ca8-4098-ae2c-44fd0d787f4b', '94c6a8a2-ce4e-4769-b0c7-55d343cf8113', 3, '7km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('94c6a8a2-ce4e-4769-b0c7-55d343cf8113', '181fec23-45f2-49cd-80e6-2c8dbe174dca', 'This forms a right triangle with legs 12 and 5; distance = sqrt(12^2+5^2) = sqrt(169) = 13km.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality); not copied from any official IBPS question paper.');

-- ── Section: Quantitative Aptitude (25 questions) — Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3d565cbe-b758-4395-8d53-47b068bbb38b', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 40, 'Simplify: 45% of 200 + 15% of 300', 'Quantitative Aptitude', 'Simplification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28964e0d-c3bf-4969-a191-ce8d210fa45e', '3d565cbe-b758-4395-8d53-47b068bbb38b', 0, '80');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1721a08-c3cc-42ac-9d4c-978124fd6ca5', '3d565cbe-b758-4395-8d53-47b068bbb38b', 1, '85');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f98ad3c7-f65c-40a9-abdb-86804eb46cd1', '3d565cbe-b758-4395-8d53-47b068bbb38b', 2, '90');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77766b75-1aa4-4deb-bc1a-1ce7eb794622', '3d565cbe-b758-4395-8d53-47b068bbb38b', 3, '135');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3d565cbe-b758-4395-8d53-47b068bbb38b', '77766b75-1aa4-4deb-bc1a-1ce7eb794622', '45% of 200 = 90; 15% of 300 = 45. Sum = 90+45 = 135.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4efee922-df63-4ae6-b6bb-412f16b9ee9d', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 41, 'Find the wrong number in the series: 5, 10, 20, 42, 80, 160', 'Quantitative Aptitude', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d21cca13-b5d5-4d62-8c13-63e81e805f7b', '4efee922-df63-4ae6-b6bb-412f16b9ee9d', 0, '10');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e989f61-d1c4-4036-954c-4d542a3ae03b', '4efee922-df63-4ae6-b6bb-412f16b9ee9d', 1, '20');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51665a51-861c-4709-853e-737bd12241fe', '4efee922-df63-4ae6-b6bb-412f16b9ee9d', 2, '42');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68f7663d-38fd-4aec-8e63-f87309d267e9', '4efee922-df63-4ae6-b6bb-412f16b9ee9d', 3, '80');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4efee922-df63-4ae6-b6bb-412f16b9ee9d', '51665a51-861c-4709-853e-737bd12241fe', 'The series should double each time: 5,10,20,40,80,160. The given series has 42 instead of 40, making 42 the wrong term.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6ed6ea42-f8ec-4762-a1bd-0ae9660c3f31', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 42, 'A number is increased by 25% to get 500. What is the original number?', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a48b00d-619a-4abf-a517-61b533418110', '6ed6ea42-f8ec-4762-a1bd-0ae9660c3f31', 0, '375');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90b01c9d-9ada-484d-88b8-d1170577d3ad', '6ed6ea42-f8ec-4762-a1bd-0ae9660c3f31', 1, '400');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed4b3f9b-95a5-4da0-8657-27eeb77ed54e', '6ed6ea42-f8ec-4762-a1bd-0ae9660c3f31', 2, '425');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c7c09d7-b48c-4fd7-a6b8-bc86b155fd58', '6ed6ea42-f8ec-4762-a1bd-0ae9660c3f31', 3, '450');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6ed6ea42-f8ec-4762-a1bd-0ae9660c3f31', '90b01c9d-9ada-484d-88b8-d1170577d3ad', 'If original is x, x*1.25=500, so x=500/1.25=400.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0cb0fa00-35dc-4329-a792-982aba5c73c0', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 43, 'A shopkeeper sells an article for Rs. 720 at a loss of 10%. What was the cost price?', 'Quantitative Aptitude', 'Profit and Loss', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('674b2f23-4f3c-4499-86e3-9a9131aebd18', '0cb0fa00-35dc-4329-a792-982aba5c73c0', 0, 'Rs. 750');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ac9e3cc-da45-4190-bb12-dd91a57f3042', '0cb0fa00-35dc-4329-a792-982aba5c73c0', 1, 'Rs. 800');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07622543-1a95-4c26-bbf2-d84aeb0f19cc', '0cb0fa00-35dc-4329-a792-982aba5c73c0', 2, 'Rs. 850');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8de4b51-dd06-4de5-a4c3-2a17c3018159', '0cb0fa00-35dc-4329-a792-982aba5c73c0', 3, 'Rs. 900');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0cb0fa00-35dc-4329-a792-982aba5c73c0', '8ac9e3cc-da45-4190-bb12-dd91a57f3042', 'SP = CP x 0.9 = 720, so CP = 720/0.9 = Rs. 800.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ae4e3d86-3873-4e62-9156-e96d29cfedc3', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 44, 'The compound interest on Rs. 8000 for 1 year at 10% per annum, compounded half-yearly, is:', 'Quantitative Aptitude', 'Simple/Compound Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be41434b-1019-4e7b-800a-6806a9412613', 'ae4e3d86-3873-4e62-9156-e96d29cfedc3', 0, 'Rs. 800');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd821631-2ac9-45cc-870d-5f604bde4f8f', 'ae4e3d86-3873-4e62-9156-e96d29cfedc3', 1, 'Rs. 820');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('511fc9d7-685a-4c3c-a100-c1d99eac4207', 'ae4e3d86-3873-4e62-9156-e96d29cfedc3', 2, 'Rs. 840');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24e315ba-8fa8-4001-a56b-d94fac4a8831', 'ae4e3d86-3873-4e62-9156-e96d29cfedc3', 3, 'Rs. 850');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ae4e3d86-3873-4e62-9156-e96d29cfedc3', 'fd821631-2ac9-45cc-870d-5f604bde4f8f', 'Half-yearly rate = 5%, for 2 periods: A = 8000(1.05)^2 = 8820. CI = 8820-8000 = Rs. 820.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0ead2ee3-d84d-4e56-a8ad-0b4f7ca345ce', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 45, 'A and B together can complete a job in 12 days. A alone can do it in 20 days. In how many days can B alone complete it?', 'Quantitative Aptitude', 'Time and Work', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8940acfb-5892-4d20-b338-c38fa3a71b64', '0ead2ee3-d84d-4e56-a8ad-0b4f7ca345ce', 0, '25 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13b7f582-e0d7-40fb-825d-a2aad56203e5', '0ead2ee3-d84d-4e56-a8ad-0b4f7ca345ce', 1, '28 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bfeffddc-ce27-4520-bd25-ceea418dbf87', '0ead2ee3-d84d-4e56-a8ad-0b4f7ca345ce', 2, '30 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e74956e-aa2c-4192-97f1-9d26af0996ec', '0ead2ee3-d84d-4e56-a8ad-0b4f7ca345ce', 3, '32 days');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0ead2ee3-d84d-4e56-a8ad-0b4f7ca345ce', 'bfeffddc-ce27-4520-bd25-ceea418dbf87', 'Combined rate = 1/12. A''s rate = 1/20. B''s rate = 1/12-1/20 = (5-3)/60 = 2/60 = 1/30, so B takes 30 days.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8feed77d-5f3e-42de-ae1b-bcaa5ba9e927', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 46, 'A car covers a distance of 450km in 9 hours. If the speed is increased by 10 km/h, how long will it take to cover the same distance?', 'Quantitative Aptitude', 'Speed, Distance, Time', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b81f43c9-ae10-47fe-a8d9-08bb4d5b1f54', '8feed77d-5f3e-42de-ae1b-bcaa5ba9e927', 0, '7.5 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01f5c7cd-9d43-48ce-81b8-a24f8d3d6025', '8feed77d-5f3e-42de-ae1b-bcaa5ba9e927', 1, '8 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('828c608d-dac6-49cf-be7f-dc96fb3f20cf', '8feed77d-5f3e-42de-ae1b-bcaa5ba9e927', 2, '8.5 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1d1afdd-1624-4070-b5e0-d07dec83faad', '8feed77d-5f3e-42de-ae1b-bcaa5ba9e927', 3, '9.5 hours');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8feed77d-5f3e-42de-ae1b-bcaa5ba9e927', 'b81f43c9-ae10-47fe-a8d9-08bb4d5b1f54', 'Original speed = 450/9 = 50 km/h. New speed = 50+10 = 60 km/h. Time = 450/60 = 7.5 hours.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b7a4ef3a-a008-4ad1-b39a-a591803f5223', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 47, 'In a survey, 60% of people prefer tea, and the rest prefer coffee. If 320 people prefer coffee, how many people were surveyed in total?', 'Quantitative Aptitude', 'Data Interpretation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9887bc2-5b3b-4f9b-a30d-fbeb3a78b4ac', 'b7a4ef3a-a008-4ad1-b39a-a591803f5223', 0, '700');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c68e711-a1f7-4ae7-8ffb-cb1c397203d4', 'b7a4ef3a-a008-4ad1-b39a-a591803f5223', 1, '750');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e30fe4f-6fbd-404c-95a0-8dbfdaf5cad6', 'b7a4ef3a-a008-4ad1-b39a-a591803f5223', 2, '800');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad645277-7aaf-4afa-a463-39b0b53fc5be', 'b7a4ef3a-a008-4ad1-b39a-a591803f5223', 3, '850');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b7a4ef3a-a008-4ad1-b39a-a591803f5223', '1e30fe4f-6fbd-404c-95a0-8dbfdaf5cad6', '40% prefer coffee = 320 people. Total = 320/0.4 = 800.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('274047d4-20da-4276-ab83-2bf20123e326', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 48, 'The ratio of ages of A and B is 3:4. After 5 years, the ratio becomes 4:5. Find A''s current age.', 'Quantitative Aptitude', 'Ratio and Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b05ff41-03ee-45cb-b6c7-f95a396cf42e', '274047d4-20da-4276-ab83-2bf20123e326', 0, '10 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a5793dd-ed58-4479-b5c0-fb70f8180432', '274047d4-20da-4276-ab83-2bf20123e326', 1, '15 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5fc776f-961e-4cd0-ac48-53402a284dc1', '274047d4-20da-4276-ab83-2bf20123e326', 2, '20 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b073def1-13d7-49b0-b123-35bdb6754c24', '274047d4-20da-4276-ab83-2bf20123e326', 3, '25 years');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('274047d4-20da-4276-ab83-2bf20123e326', '5a5793dd-ed58-4479-b5c0-fb70f8180432', 'Let ages be 3x and 4x. (3x+5)/(4x+5)=4/5. 15x+25=16x+20. x=5. A''s age=3x=15 years.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a9abe009-c4f1-4cd9-8862-6266f011e791', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 49, 'The average of 10 numbers is 45. If each number is increased by 5, what is the new average?', 'Quantitative Aptitude', 'Average', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('081cb047-64d8-4ca4-9647-761c71c3e40b', 'a9abe009-c4f1-4cd9-8862-6266f011e791', 0, '45');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('036077f9-9e8c-459d-a35f-98749ea65732', 'a9abe009-c4f1-4cd9-8862-6266f011e791', 1, '48');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16c96904-473f-4b30-8120-ba758bc869fb', 'a9abe009-c4f1-4cd9-8862-6266f011e791', 2, '50');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df0f29a2-3195-4bec-a7ef-2e55f95cc29e', 'a9abe009-c4f1-4cd9-8862-6266f011e791', 3, '55');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a9abe009-c4f1-4cd9-8862-6266f011e791', '16c96904-473f-4b30-8120-ba758bc869fb', 'If each of the 10 numbers increases by 5, the average also increases by 5: 45+5=50.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('05703afd-3fac-42a5-860a-53c6a098f0cb', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 50, 'Simplify: (12 x 15) / (4 + 5)', 'Quantitative Aptitude', 'Simplification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('22fdc6fc-3e4e-46f4-9316-d75e5c62a8a9', '05703afd-3fac-42a5-860a-53c6a098f0cb', 0, '18');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad71ccc1-d92f-4f47-8115-aafa01cbf057', '05703afd-3fac-42a5-860a-53c6a098f0cb', 1, '20');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d18a756b-315e-476a-b343-b2c65bc91a42', '05703afd-3fac-42a5-860a-53c6a098f0cb', 2, '22');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e2fbd16-f27c-4ed7-bfef-4f52a870aeda', '05703afd-3fac-42a5-860a-53c6a098f0cb', 3, '24');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('05703afd-3fac-42a5-860a-53c6a098f0cb', 'ad71ccc1-d92f-4f47-8115-aafa01cbf057', '12x15=180. 4+5=9. 180/9=20.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('84b4c12b-3f6e-4ca8-8eec-bb8cbf81bc90', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 51, 'Find the next number: 7, 14, 28, 56, ?', 'Quantitative Aptitude', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32b30306-2b28-4bfc-b06c-376a0ed5bf30', '84b4c12b-3f6e-4ca8-8eec-bb8cbf81bc90', 0, '84');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e7e6845-dc12-4c38-85ce-80472aafe1d9', '84b4c12b-3f6e-4ca8-8eec-bb8cbf81bc90', 1, '98');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e2576a8-0161-4f25-aaf1-543396e66d08', '84b4c12b-3f6e-4ca8-8eec-bb8cbf81bc90', 2, '112');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e37b19ef-fc57-4d9d-b9c5-7a7be3a7d81b', '84b4c12b-3f6e-4ca8-8eec-bb8cbf81bc90', 3, '120');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('84b4c12b-3f6e-4ca8-8eec-bb8cbf81bc90', '8e2576a8-0161-4f25-aaf1-543396e66d08', 'Each term doubles the previous: 56x2=112.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ea95ebd8-ed08-4a6a-9e8e-0d01b3bd77d0', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 52, 'If the price of an item decreases by 20%, by what percentage should the new price be increased to restore the original price?', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2c0e41e-f4e9-43be-b6dc-18fb5d286735', 'ea95ebd8-ed08-4a6a-9e8e-0d01b3bd77d0', 0, '20%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('401542f9-e79e-4781-ae43-d9accb2c1e65', 'ea95ebd8-ed08-4a6a-9e8e-0d01b3bd77d0', 1, '22.5%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3e13714-f128-4350-b688-15657668a854', 'ea95ebd8-ed08-4a6a-9e8e-0d01b3bd77d0', 2, '25%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17887b1d-43f6-402c-ba80-11696b27391d', 'ea95ebd8-ed08-4a6a-9e8e-0d01b3bd77d0', 3, '30%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ea95ebd8-ed08-4a6a-9e8e-0d01b3bd77d0', 'a3e13714-f128-4350-b688-15657668a854', 'If original is 100, new price is 80. To go from 80 to 100 requires an increase of 20/80 x 100 = 25%.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('aa2f3fe4-4d8e-4d60-b7dc-a92377d99bab', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 53, 'A man buys 12 pens for Rs. 10 and sells them at 10 pens for Rs. 12. Find his profit percentage.', 'Quantitative Aptitude', 'Profit and Loss', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5c415a2-8a0a-477a-9ca4-57f1ea62da1b', 'aa2f3fe4-4d8e-4d60-b7dc-a92377d99bab', 0, '40%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9cb92a33-3e9f-457c-82f6-59b4233751f5', 'aa2f3fe4-4d8e-4d60-b7dc-a92377d99bab', 1, '44%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa150af2-d245-4ef5-98f6-9ed1a2b08e6d', 'aa2f3fe4-4d8e-4d60-b7dc-a92377d99bab', 2, '48%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbbab16d-1855-4836-a5a7-6b3e598b9cf1', 'aa2f3fe4-4d8e-4d60-b7dc-a92377d99bab', 3, '50%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aa2f3fe4-4d8e-4d60-b7dc-a92377d99bab', '9cb92a33-3e9f-457c-82f6-59b4233751f5', 'CP per pen = 10/12 = 0.833. SP per pen = 12/10 = 1.2. Profit per pen = 1.2-0.833 = 0.367. Profit% = (0.367/0.833) x 100 = 44%.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fefe473e-6565-4327-91f0-ca34866caa58', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 54, 'If 8 men can complete a task in 15 days, how many days will 12 men take to complete the same task?', 'Quantitative Aptitude', 'Time and Work', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28ee3067-6b9d-4e60-97d8-c9f72ea762ef', 'fefe473e-6565-4327-91f0-ca34866caa58', 0, '8 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07917edc-27ca-404e-8812-794fcb76a7f8', 'fefe473e-6565-4327-91f0-ca34866caa58', 1, '10 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b73c55b3-9429-4389-a006-b5864bbf5a74', 'fefe473e-6565-4327-91f0-ca34866caa58', 2, '12 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36f05f3d-605d-4cc0-9521-29715f1a9079', 'fefe473e-6565-4327-91f0-ca34866caa58', 3, '14 days');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fefe473e-6565-4327-91f0-ca34866caa58', '07917edc-27ca-404e-8812-794fcb76a7f8', 'Work is constant: 8x15=120 man-days. With 12 men, days = 120/12=10 days.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2d0f30cf-1c8d-4064-b990-1454a17e7fc5', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 55, 'A bar graph shows sales of Rs. 50 lakh in Q1 and Rs. 65 lakh in Q2. What is the percentage increase from Q1 to Q2?', 'Quantitative Aptitude', 'Data Interpretation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dad6cb03-bbbe-4c0e-bc55-055dccd560b4', '2d0f30cf-1c8d-4064-b990-1454a17e7fc5', 0, '25%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83aaf2ce-3308-483a-9836-a69a66d87492', '2d0f30cf-1c8d-4064-b990-1454a17e7fc5', 1, '30%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd515329-29c6-491d-8167-c1c646ca7567', '2d0f30cf-1c8d-4064-b990-1454a17e7fc5', 2, '35%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3968f72-e33e-40db-9969-2b01b9fa2b8c', '2d0f30cf-1c8d-4064-b990-1454a17e7fc5', 3, '40%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2d0f30cf-1c8d-4064-b990-1454a17e7fc5', '83aaf2ce-3308-483a-9836-a69a66d87492', 'Increase = 65-50=15. Percentage increase = 15/50 x 100 = 30%.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bc37d6be-7873-4c44-9812-426607fe1db1', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 56, 'Divide Rs. 1200 among A, B, C in the ratio 2:3:5. Find C''s share.', 'Quantitative Aptitude', 'Ratio and Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df2fb34c-da2c-4a14-8cc2-93c5007ccb1a', 'bc37d6be-7873-4c44-9812-426607fe1db1', 0, 'Rs. 400');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6b9d5f9-eb1e-4e3d-98ec-03beea923837', 'bc37d6be-7873-4c44-9812-426607fe1db1', 1, 'Rs. 500');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d78fd3d-75e9-477c-aa5c-4bccc7e04c64', 'bc37d6be-7873-4c44-9812-426607fe1db1', 2, 'Rs. 600');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('380859d6-bc36-4bf4-8d48-7aa9d3b474f8', 'bc37d6be-7873-4c44-9812-426607fe1db1', 3, 'Rs. 700');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bc37d6be-7873-4c44-9812-426607fe1db1', '4d78fd3d-75e9-477c-aa5c-4bccc7e04c64', 'Total parts = 2+3+5=10. C''s share = (5/10)x1200 = Rs. 600.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a5f99200-1417-4e1f-924b-15f81bac79fd', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 57, 'Two friends start from the same point walking in opposite directions at 4 km/h and 6 km/h. After 2 hours, how far apart are they?', 'Quantitative Aptitude', 'Speed, Distance, Time', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8143045-bcca-4dfc-b157-66618f6b0000', 'a5f99200-1417-4e1f-924b-15f81bac79fd', 0, '16km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c278bf76-b97a-42ac-8283-68eff10830e7', 'a5f99200-1417-4e1f-924b-15f81bac79fd', 1, '18km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d80dd0f-e232-4339-b3d1-e398c9bac6f8', 'a5f99200-1417-4e1f-924b-15f81bac79fd', 2, '20km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('040fe42d-d55c-43c8-936a-da78aa7c661c', 'a5f99200-1417-4e1f-924b-15f81bac79fd', 3, '22km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a5f99200-1417-4e1f-924b-15f81bac79fd', '3d80dd0f-e232-4339-b3d1-e398c9bac6f8', 'Since they move in opposite directions, relative speed = 4+6=10 km/h. Distance after 2 hours = 10x2=20km.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('17255307-b207-4c88-be62-db8faa52e96d', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 58, 'Find the simple interest on Rs. 6000 at 8% per annum for 2.5 years.', 'Quantitative Aptitude', 'Simple/Compound Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3f521c3-122d-4802-9c56-88714ab83f0e', '17255307-b207-4c88-be62-db8faa52e96d', 0, 'Rs. 1000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54652884-d273-4c8f-863c-4ba6b5ad96e4', '17255307-b207-4c88-be62-db8faa52e96d', 1, 'Rs. 1100');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8cac5d18-8868-42ff-9792-83a6197f6942', '17255307-b207-4c88-be62-db8faa52e96d', 2, 'Rs. 1200');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a3569ec-661d-4479-bc70-1765bf74f37e', '17255307-b207-4c88-be62-db8faa52e96d', 3, 'Rs. 1300');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('17255307-b207-4c88-be62-db8faa52e96d', '8cac5d18-8868-42ff-9792-83a6197f6942', 'SI = (6000x8x2.5)/100 = Rs. 1200.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a3098fa9-7034-4003-8b72-f9baa60e9270', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 59, 'The average marks of 30 students in a class is 60. If the marks of one student were misread as 40 instead of 70, find the correct average.', 'Quantitative Aptitude', 'Average', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('539a78d8-a844-4228-9e8b-2a14f7235a9b', 'a3098fa9-7034-4003-8b72-f9baa60e9270', 0, '60');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a773d870-3254-4af1-bebf-911561b1aafc', 'a3098fa9-7034-4003-8b72-f9baa60e9270', 1, '61');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('71d503a5-a092-4e4b-8adc-783b01bf4248', 'a3098fa9-7034-4003-8b72-f9baa60e9270', 2, '62');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3f7287f-d991-4c7f-81e2-8f2ef29f7a98', 'a3098fa9-7034-4003-8b72-f9baa60e9270', 3, '63');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a3098fa9-7034-4003-8b72-f9baa60e9270', 'a773d870-3254-4af1-bebf-911561b1aafc', 'Total was undercounted by 70-40=30. Corrected total increases by 30, so average increases by 30/30=1, giving 61.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b433a9af-7720-4496-a950-9b0d3e3ad049', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 60, 'What is the sum of the first 20 natural numbers?', 'Quantitative Aptitude', 'Number System', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92df1fc8-94e4-43f6-bc6b-10197f389d88', 'b433a9af-7720-4496-a950-9b0d3e3ad049', 0, '190');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0cd4a7d1-db1a-4f9f-855b-9a37de2001ee', 'b433a9af-7720-4496-a950-9b0d3e3ad049', 1, '200');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7cc23f21-5437-4380-91eb-a86928547e80', 'b433a9af-7720-4496-a950-9b0d3e3ad049', 2, '210');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7542ac81-6e42-4c3d-873f-41a4cad4fca4', 'b433a9af-7720-4496-a950-9b0d3e3ad049', 3, '220');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b433a9af-7720-4496-a950-9b0d3e3ad049', '7cc23f21-5437-4380-91eb-a86928547e80', 'Sum = n(n+1)/2 = 20x21/2 = 210.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1ca6ab4b-e9f9-4649-98ac-83a3732245ed', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 61, 'A student scored 450 marks out of 600. What percentage did the student score?', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('461c6669-b339-485d-992a-5ab445e1069a', '1ca6ab4b-e9f9-4649-98ac-83a3732245ed', 0, '70%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ec8c817-8419-41aa-afef-56f21141a71e', '1ca6ab4b-e9f9-4649-98ac-83a3732245ed', 1, '72.5%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf47ce71-e4a4-4a22-8882-e1ce9f2a7027', '1ca6ab4b-e9f9-4649-98ac-83a3732245ed', 2, '75%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23da89b0-5b42-4b1a-b02f-55d30ebdc27a', '1ca6ab4b-e9f9-4649-98ac-83a3732245ed', 3, '77.5%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1ca6ab4b-e9f9-4649-98ac-83a3732245ed', 'cf47ce71-e4a4-4a22-8882-e1ce9f2a7027', 'Percentage = (450/600) x 100 = 75%.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2a6970f3-0c47-4b78-9128-8ab7ae93cffe', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 62, 'A retailer buys goods at a 20% discount on the marked price and sells at the marked price. What is his profit percentage?', 'Quantitative Aptitude', 'Profit and Loss', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43ac21d0-73e5-4b99-adac-1aeab8c7b7e4', '2a6970f3-0c47-4b78-9128-8ab7ae93cffe', 0, '20%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('477ba601-44bf-454c-8310-12324864e9c8', '2a6970f3-0c47-4b78-9128-8ab7ae93cffe', 1, '22.5%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b861b380-f6e7-48c0-96a7-e46426d94654', '2a6970f3-0c47-4b78-9128-8ab7ae93cffe', 2, '25%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58ab985f-7a44-4544-b9d4-c76661bac507', '2a6970f3-0c47-4b78-9128-8ab7ae93cffe', 3, '30%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2a6970f3-0c47-4b78-9128-8ab7ae93cffe', 'b861b380-f6e7-48c0-96a7-e46426d94654', 'If MP=100, CP=80 (after 20% discount), SP=100. Profit=20. Profit%=20/80x100=25%.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6a086ba6-2049-4ca4-bb91-2ff6b4c7cfa9', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 63, 'A, B, and C can complete a task in 10, 15, and 30 days respectively. In how many days can they complete it together?', 'Quantitative Aptitude', 'Time and Work', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ccb5e28b-13b6-48df-8812-f66e9a81fa4d', '6a086ba6-2049-4ca4-bb91-2ff6b4c7cfa9', 0, '4 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb3bbdad-4a99-4c36-af29-3f06e762601b', '6a086ba6-2049-4ca4-bb91-2ff6b4c7cfa9', 1, '5 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8e0b122-a3d9-4f51-ac3a-f058ace5a043', '6a086ba6-2049-4ca4-bb91-2ff6b4c7cfa9', 2, '6 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b09ca6f-342d-4a57-b649-cc147e0c3579', '6a086ba6-2049-4ca4-bb91-2ff6b4c7cfa9', 3, '7 days');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6a086ba6-2049-4ca4-bb91-2ff6b4c7cfa9', 'fb3bbdad-4a99-4c36-af29-3f06e762601b', 'Combined rate = 1/10+1/15+1/30 = 3/30+2/30+1/30 = 6/30 = 1/5, so together they take 5 days.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('69718c0c-c4e9-4e52-a150-f0313273842c', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 64, 'If a pie chart shows a company spends 30% of its Rs. 10,00,000 budget on marketing, how much is spent on marketing?', 'Quantitative Aptitude', 'Data Interpretation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55b2f263-4336-4726-93bc-87363672ac2b', '69718c0c-c4e9-4e52-a150-f0313273842c', 0, 'Rs. 2,00,000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a954c30-4e3f-416a-a7a5-260ffc892068', '69718c0c-c4e9-4e52-a150-f0313273842c', 1, 'Rs. 2,50,000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23955b6c-d644-46f6-b236-0c2f2668e0d2', '69718c0c-c4e9-4e52-a150-f0313273842c', 2, 'Rs. 3,00,000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('348cb622-bc02-4a17-8c72-fbf5eff296ab', '69718c0c-c4e9-4e52-a150-f0313273842c', 3, 'Rs. 3,50,000');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('69718c0c-c4e9-4e52-a150-f0313273842c', '23955b6c-d644-46f6-b236-0c2f2668e0d2', '30% of 10,00,000 = Rs. 3,00,000.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation); not copied from any official IBPS question paper.');

-- ── Section: English Language (25 questions) — English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('dde5100a-b5fc-4a38-834f-8cff5548d777', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 65, 'Passage: ''Digital payments in India have grown rapidly due to increased smartphone penetration and government initiatives promoting cashless transactions.'' What are the two factors mentioned for the growth?', 'English', 'Reading Comprehension', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('463d131b-4b86-4d48-a473-6385b952a4ed', 'dde5100a-b5fc-4a38-834f-8cff5548d777', 0, 'Low interest rates and inflation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0df8ff6e-5e51-4309-9a4a-cb5e09843bdb', 'dde5100a-b5fc-4a38-834f-8cff5548d777', 1, 'Smartphone penetration and government initiatives');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('072c2beb-2327-49e1-874a-2611d810caf3', 'dde5100a-b5fc-4a38-834f-8cff5548d777', 2, 'Foreign investment and exports');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f312ee35-9500-4c4f-bfff-70b86f41e46d', 'dde5100a-b5fc-4a38-834f-8cff5548d777', 3, 'Banking reforms and literacy');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dde5100a-b5fc-4a38-834f-8cff5548d777', '0df8ff6e-5e51-4309-9a4a-cb5e09843bdb', 'The passage explicitly names ''increased smartphone penetration'' and ''government initiatives promoting cashless transactions'' as the two factors.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2df0f9b0-f724-493a-b5e6-3ec607db53fd', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 66, 'Fill in the blank: ''The bank''s profits fell sharply, ___ it announced a major cost-cutting plan.''', 'English', 'Cloze Test', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe6a2a1d-53e5-427f-9cb1-3ad781eb0d9e', '2df0f9b0-f724-493a-b5e6-3ec607db53fd', 0, 'moreover');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b0d1034-043a-448a-90f5-abfc5f90a92e', '2df0f9b0-f724-493a-b5e6-3ec607db53fd', 1, 'so');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ed5a684-93b1-4ca4-aaf8-35097de1a480', '2df0f9b0-f724-493a-b5e6-3ec607db53fd', 2, 'although');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13e39b55-41ce-482b-94cb-490ca43ecd4d', '2df0f9b0-f724-493a-b5e6-3ec607db53fd', 3, 'furthermore');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2df0f9b0-f724-493a-b5e6-3ec607db53fd', '7b0d1034-043a-448a-90f5-abfc5f90a92e', 'Falling profits leading to a cost-cutting plan is a cause-effect relationship, which ''so'' correctly expresses.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('65a5355c-db4f-4c20-9778-10218fa20ce0', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 67, 'Find the error: ''The manager, along with his team, (A) / were preparing (B) / the quarterly report (C) / for the board meeting. (D)''', 'English', 'Error Detection', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fda509ec-7cad-4cbc-83a7-6afeb9d4581f', '65a5355c-db4f-4c20-9778-10218fa20ce0', 0, 'A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c422848-1737-4190-86c0-0a43e4951e97', '65a5355c-db4f-4c20-9778-10218fa20ce0', 1, 'B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7422c60a-dd4c-42cd-b978-450dbbbbe612', '65a5355c-db4f-4c20-9778-10218fa20ce0', 2, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5e8d26f-91a1-4834-bdf9-1d1057bf72d2', '65a5355c-db4f-4c20-9778-10218fa20ce0', 3, 'D');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('65a5355c-db4f-4c20-9778-10218fa20ce0', '0c422848-1737-4190-86c0-0a43e4951e97', '''Along with his team'' is a parenthetical phrase, not part of the subject; the subject remains ''the manager'' (singular), so it should be ''was preparing'', not ''were preparing''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e8a26ecf-9ec6-4688-b7ba-84448487090c', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 68, 'Improve the underlined part: ''She is one of the employee who always arrive on time.''', 'English', 'Sentence Improvement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e8399af-1fab-46b3-930f-cdc5b1ff949b', 'e8a26ecf-9ec6-4688-b7ba-84448487090c', 0, 'employee who always arrives');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bebdfb4a-a754-4018-bac7-24df20858826', 'e8a26ecf-9ec6-4688-b7ba-84448487090c', 1, 'employees who always arrive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('822a2c3d-baf2-4377-9512-fa38e828ef5f', 'e8a26ecf-9ec6-4688-b7ba-84448487090c', 2, 'employees who always arrives');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4855b074-458e-4157-9cd3-b462f68177e8', 'e8a26ecf-9ec6-4688-b7ba-84448487090c', 3, 'employee whom always arrive');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e8a26ecf-9ec6-4688-b7ba-84448487090c', 'bebdfb4a-a754-4018-bac7-24df20858826', '''One of the'' requires a plural noun (''employees''), and ''who'' refers to that plural noun, requiring the plural verb ''arrive''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5ecf5ece-a2e3-4842-8072-1dbc0303ca55', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 69, 'Based on the same passage, what does ''cashless transactions'' likely refer to?', 'English', 'Reading Comprehension', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b371d40f-1795-47f6-8cd3-6a49eaafeb7a', '5ecf5ece-a2e3-4842-8072-1dbc0303ca55', 0, 'Barter trade');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34b115f7-6c5e-4e28-add8-fc9b8d4753da', '5ecf5ece-a2e3-4842-8072-1dbc0303ca55', 1, 'Transactions without physical currency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b65cc11-28a2-44d4-8cf3-20079b406ee6', '5ecf5ece-a2e3-4842-8072-1dbc0303ca55', 2, 'Transactions with no fees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a7f45d2-d368-4c22-b903-7b4d6aa6f790', '5ecf5ece-a2e3-4842-8072-1dbc0303ca55', 3, 'International transactions only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5ecf5ece-a2e3-4842-8072-1dbc0303ca55', '34b115f7-6c5e-4e28-add8-fc9b8d4753da', 'In the context of digital payments, ''cashless transactions'' means transactions conducted without physical cash.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1e029585-17b3-4520-8ed9-eefd8a3ea236', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 70, 'Fill in the blank: ''RBI regulates monetary policy ___ ensure financial stability.''', 'English', 'Cloze Test', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af8b2c8c-7618-49bf-939b-e16ecfe00cf9', '1e029585-17b3-4520-8ed9-eefd8a3ea236', 0, 'so that');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abb4463a-3d33-4615-9308-bb169da73601', '1e029585-17b3-4520-8ed9-eefd8a3ea236', 1, 'because');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21e904d6-36fc-42d0-b8ca-1256190cbf2c', '1e029585-17b3-4520-8ed9-eefd8a3ea236', 2, 'although');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9279c140-1dec-4456-86e8-2c7d9b84e5c4', '1e029585-17b3-4520-8ed9-eefd8a3ea236', 3, 'unless');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1e029585-17b3-4520-8ed9-eefd8a3ea236', 'af8b2c8c-7618-49bf-939b-e16ecfe00cf9', '''So that'' correctly introduces the purpose of RBI''s monetary policy regulation.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('858849a7-89a4-4d2d-afd1-91063c718cdb', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 71, 'Find the error: ''Each of the applicants (A) / are required to submit (B) / their documents (C) / by Friday. (D)''', 'English', 'Error Detection', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e90c04d-3411-4109-b772-bfd45fce93f0', '858849a7-89a4-4d2d-afd1-91063c718cdb', 0, 'A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38de29ee-4ca5-40be-ab2a-5a1d9746ce8f', '858849a7-89a4-4d2d-afd1-91063c718cdb', 1, 'B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ae5cd95-8167-405d-a468-ec63ec3bca3f', '858849a7-89a4-4d2d-afd1-91063c718cdb', 2, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f79f2e99-8787-40d3-8032-474d126486cf', '858849a7-89a4-4d2d-afd1-91063c718cdb', 3, 'D');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('858849a7-89a4-4d2d-afd1-91063c718cdb', '38de29ee-4ca5-40be-ab2a-5a1d9746ce8f', '''Each'' is singular and requires ''is required'', not ''are required''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('50572e3f-c46c-403a-8caf-0bd59503e9b2', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 72, 'Improve the underlined part: ''He is more taller than his brother.''', 'English', 'Sentence Improvement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0dccb8b-9a30-426b-9d11-878b364d6cd6', '50572e3f-c46c-403a-8caf-0bd59503e9b2', 0, 'more tall than');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3acd836f-0f52-4c0c-a822-7a7589f88a83', '50572e3f-c46c-403a-8caf-0bd59503e9b2', 1, 'taller than');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02b0068d-8bea-4ebe-a133-ca93ad7ca18f', '50572e3f-c46c-403a-8caf-0bd59503e9b2', 2, 'more taller as');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1606d304-5e64-4f53-80cb-53c3b7c30b35', '50572e3f-c46c-403a-8caf-0bd59503e9b2', 3, 'as tall than');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('50572e3f-c46c-403a-8caf-0bd59503e9b2', '3acd836f-0f52-4c0c-a822-7a7589f88a83', '''Taller'' is already a comparative form; adding ''more'' before it is redundant, so ''taller than'' is correct.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('946efb03-06c8-4555-bfa8-423f3b643256', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 73, 'Choose the word closest in meaning to ''PRUDENT'' as used in banking contexts:', 'English', 'Vocabulary', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ea5a800-0f86-4161-b4f5-90e8072bd33c', '946efb03-06c8-4555-bfa8-423f3b643256', 0, 'Careless');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c9707a2-4a64-4ce3-b7af-a78febb5768e', '946efb03-06c8-4555-bfa8-423f3b643256', 1, 'Wise and cautious');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('208fd7ea-b577-46da-99b5-40801d5940fe', '946efb03-06c8-4555-bfa8-423f3b643256', 2, 'Aggressive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac3febe5-ee21-4352-b586-4ade66de4312', '946efb03-06c8-4555-bfa8-423f3b643256', 3, 'Impulsive');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('946efb03-06c8-4555-bfa8-423f3b643256', '6c9707a2-4a64-4ce3-b7af-a78febb5768e', '''Prudent'' means acting with careful judgment, especially in financial matters -- wise and cautious.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('903ad9ef-6697-4ad7-bf47-f6611cb85121', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 74, 'Fill in the blank: ''Despite the economic slowdown, the bank''s ___ remained stable.''', 'English', 'Cloze Test', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a48ff328-1645-44f8-b321-2e3f831f29ec', '903ad9ef-6697-4ad7-bf47-f6611cb85121', 0, 'deficit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('efd05c5c-9e06-4acc-9009-92204188b2f4', '903ad9ef-6697-4ad7-bf47-f6611cb85121', 1, 'liquidity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87d72191-38dc-489d-91fa-34cd8458ed1c', '903ad9ef-6697-4ad7-bf47-f6611cb85121', 2, 'however');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d0bc5a0-cccc-4e0d-aa9b-3b5166e699ca', '903ad9ef-6697-4ad7-bf47-f6611cb85121', 3, 'therefore');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('903ad9ef-6697-4ad7-bf47-f6611cb85121', 'efd05c5c-9e06-4acc-9009-92204188b2f4', '''Liquidity'' is a noun that fits grammatically and contextually as something a bank would want to remain stable; the other options are either connectors (not nouns fitting the blank) or contextually odd.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a86a48bb-0b6d-4f77-bf29-67e2110c4365', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 75, 'Find the error: ''Neither the manager nor the employees (A) / was aware (B) / of the policy change (C) / announced yesterday. (D)''', 'English', 'Error Detection', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05193d23-73df-4623-835d-5750e5b35275', 'a86a48bb-0b6d-4f77-bf29-67e2110c4365', 0, 'A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2134acb-c3a3-43d8-92d6-ef304249cbaa', 'a86a48bb-0b6d-4f77-bf29-67e2110c4365', 1, 'B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19686901-244a-482d-b8da-59b0b5ec2df7', 'a86a48bb-0b6d-4f77-bf29-67e2110c4365', 2, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6818925-ce7b-48f5-aa9b-6864b1dbb250', 'a86a48bb-0b6d-4f77-bf29-67e2110c4365', 3, 'D');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a86a48bb-0b6d-4f77-bf29-67e2110c4365', 'd2134acb-c3a3-43d8-92d6-ef304249cbaa', 'With ''neither...nor'', the verb agrees with the nearer subject (''employees'', plural), so it should be ''were aware'', not ''was aware''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1c293d18-34fa-481e-8b62-20e110ab8b5f', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 76, 'Improve the underlined part: ''The report were submitted before the deadline.''', 'English', 'Sentence Improvement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2b8e3cb-2a4c-41de-8fe9-272d59bc2fea', '1c293d18-34fa-481e-8b62-20e110ab8b5f', 0, 'was submitted');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de48c73b-1442-419c-b6a2-6d6abd833842', '1c293d18-34fa-481e-8b62-20e110ab8b5f', 1, 'have submitted');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('307dde56-6368-483f-90f1-57f714f65ef4', '1c293d18-34fa-481e-8b62-20e110ab8b5f', 2, 'has submit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a86c328-d28e-4ee8-9591-8c8be8f6314a', '1c293d18-34fa-481e-8b62-20e110ab8b5f', 3, 'were submit');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1c293d18-34fa-481e-8b62-20e110ab8b5f', 'c2b8e3cb-2a4c-41de-8fe9-272d59bc2fea', '''Report'' is singular and requires ''was submitted'', not ''were submitted''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a896be77-a031-4018-90b9-4cf54a1083a0', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 77, 'Choose the word closest in meaning to ''VOLATILE'' as used in market contexts:', 'English', 'Vocabulary', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8929f06a-a8b5-40ef-ae57-15b6eeda3771', 'a896be77-a031-4018-90b9-4cf54a1083a0', 0, 'Stable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee16f6d4-504b-4573-9a15-159f3c7271ac', 'a896be77-a031-4018-90b9-4cf54a1083a0', 1, 'Unpredictable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c84a9524-cb5f-49ae-87a7-d1ce74385f90', 'a896be77-a031-4018-90b9-4cf54a1083a0', 2, 'Slow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9586e750-8b1b-48b6-957e-35588038f406', 'a896be77-a031-4018-90b9-4cf54a1083a0', 3, 'Consistent');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a896be77-a031-4018-90b9-4cf54a1083a0', 'ee16f6d4-504b-4573-9a15-159f3c7271ac', '''Volatile'' means liable to change rapidly and unpredictably, commonly used to describe unstable markets.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cf8a3597-c93e-465e-8276-10d40fc68e58', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 78, 'Based on a passage stating ''the RBI''s repo rate hike aims to control inflation by making borrowing costlier'', what is the stated goal of the repo rate hike?', 'English', 'Reading Comprehension', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c16cacc0-7c77-40c0-a03e-1a0416552547', 'cf8a3597-c93e-465e-8276-10d40fc68e58', 0, 'To increase bank profits');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99b3b522-b403-4cfc-86fb-523c9ab70dea', 'cf8a3597-c93e-465e-8276-10d40fc68e58', 1, 'To control inflation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c02bdcf3-2d3d-4cac-bcc6-dd016a1ea9d4', 'cf8a3597-c93e-465e-8276-10d40fc68e58', 2, 'To reduce government debt');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb766a95-eea4-4fe9-8c10-e1c6a09d052f', 'cf8a3597-c93e-465e-8276-10d40fc68e58', 3, 'To increase exports');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cf8a3597-c93e-465e-8276-10d40fc68e58', '99b3b522-b403-4cfc-86fb-523c9ab70dea', 'The passage explicitly states the aim is ''to control inflation''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('44ccdbb3-7e1a-4e84-9e24-d9964aae2842', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 79, 'Fill in the blank: ''The new policy will be implemented ___ the next fiscal year begins.''', 'English', 'Cloze Test', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b034c867-3729-432a-bb63-a6cb93cdfc6f', '44ccdbb3-7e1a-4e84-9e24-d9964aae2842', 0, 'once');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4bd47e89-413a-4711-890a-98898bb14a98', '44ccdbb3-7e1a-4e84-9e24-d9964aae2842', 1, 'unless');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d16ffe23-1fcd-44aa-89f1-6d3d4f41c609', '44ccdbb3-7e1a-4e84-9e24-d9964aae2842', 2, 'despite');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f0d60d6-df21-4e1a-90c6-47bf9aedc035', '44ccdbb3-7e1a-4e84-9e24-d9964aae2842', 3, 'whereas');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('44ccdbb3-7e1a-4e84-9e24-d9964aae2842', 'b034c867-3729-432a-bb63-a6cb93cdfc6f', '''Once'' correctly indicates the implementation will happen at the point the fiscal year begins.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0ab84d2e-5f83-4c84-a693-f6742f405ab9', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 80, 'Find the error: ''The committee have decided (A) / to postpone (B) / the meeting (C) / until further notice. (D)''', 'English', 'Error Detection', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa78adcd-9b16-4e94-b001-d6530071e45d', '0ab84d2e-5f83-4c84-a693-f6742f405ab9', 0, 'A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d6fa906-a4bd-44f6-9058-c010cd6daee7', '0ab84d2e-5f83-4c84-a693-f6742f405ab9', 1, 'B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e4599a8-6150-43c0-8831-85913524edf6', '0ab84d2e-5f83-4c84-a693-f6742f405ab9', 2, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e2c87389-0738-470d-8394-9016d57900c0', '0ab84d2e-5f83-4c84-a693-f6742f405ab9', 3, 'D');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0ab84d2e-5f83-4c84-a693-f6742f405ab9', 'aa78adcd-9b16-4e94-b001-d6530071e45d', '''Committee'' is typically treated as a singular collective noun in this context, requiring ''has decided'', not ''have decided''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('84b6f636-1a39-4ef5-abb6-acb5dae488b2', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 81, 'Improve the underlined part: ''She has been working here since five years.''', 'English', 'Sentence Improvement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0317d8e-bc79-4772-a00c-3464721bb18b', '84b6f636-1a39-4ef5-abb6-acb5dae488b2', 0, 'since five years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f9e3330-216c-451d-a9fd-d2c53b133d7d', '84b6f636-1a39-4ef5-abb6-acb5dae488b2', 1, 'for five years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6bb38e48-2934-4fb3-b4a7-0d343305c756', '84b6f636-1a39-4ef5-abb6-acb5dae488b2', 2, 'from five years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3f44bcc-8a93-4dae-bc80-14eec9acd293', '84b6f636-1a39-4ef5-abb6-acb5dae488b2', 3, 'during five years');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('84b6f636-1a39-4ef5-abb6-acb5dae488b2', '9f9e3330-216c-451d-a9fd-d2c53b133d7d', '''For'' is used with a duration of time (five years), while ''since'' is used with a specific starting point in time.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3900713e-eaf9-40bc-96b8-4568a5964d3a', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 82, 'Choose the word closest in meaning to ''SOLVENT'' as used in financial contexts:', 'English', 'Vocabulary', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55e2a83b-b7d6-4072-98d8-aa8072e93435', '3900713e-eaf9-40bc-96b8-4568a5964d3a', 0, 'Bankrupt');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6e82314-7ad7-4c2a-a1a1-66fa90d388d4', '3900713e-eaf9-40bc-96b8-4568a5964d3a', 1, 'Able to pay debts');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0db2bb29-920b-4bd3-8f05-e88ab100d96f', '3900713e-eaf9-40bc-96b8-4568a5964d3a', 2, 'Wealthy beyond measure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87a1e1f8-c788-4591-8af8-f6cf17809663', '3900713e-eaf9-40bc-96b8-4568a5964d3a', 3, 'In default');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3900713e-eaf9-40bc-96b8-4568a5964d3a', 'd6e82314-7ad7-4c2a-a1a1-66fa90d388d4', '''Solvent'' means having enough assets to pay one''s debts -- financially stable, not in default.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4890842e-7dd0-4953-930e-01d1365b888d', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 83, 'Fill in the blank: ''Banks must maintain adequate capital reserves ___ absorb potential losses.''', 'English', 'Cloze Test', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59c3569c-8252-4728-9105-d5dd7db73b31', '4890842e-7dd0-4953-930e-01d1365b888d', 0, 'to');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6628bb3e-3949-4750-983c-6563f448be94', '4890842e-7dd0-4953-930e-01d1365b888d', 1, 'for that');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('61243dd5-ddbe-4321-877a-31d534c9992c', '4890842e-7dd0-4953-930e-01d1365b888d', 2, 'so');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa898840-201c-4aba-88d3-752335853c17', '4890842e-7dd0-4953-930e-01d1365b888d', 3, 'being');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4890842e-7dd0-4953-930e-01d1365b888d', '59c3569c-8252-4728-9105-d5dd7db73b31', '''To absorb'' is the correct infinitive form expressing purpose.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('90d56a44-1447-4144-acc9-ad2b0cca980b', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 84, 'Find the error: ''One of the biggest challenge (A) / facing banks today (B) / is cybersecurity (C) / and fraud prevention. (D)''', 'English', 'Error Detection', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78d744d5-8b2f-4aab-8853-9239f5b34f32', '90d56a44-1447-4144-acc9-ad2b0cca980b', 0, 'A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ada8024-3303-48f9-a98a-5163912dff54', '90d56a44-1447-4144-acc9-ad2b0cca980b', 1, 'B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b58fbc19-03b4-4d7f-9af4-242aa18ad478', '90d56a44-1447-4144-acc9-ad2b0cca980b', 2, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e19916bf-d538-4d90-a966-371786ac9ca8', '90d56a44-1447-4144-acc9-ad2b0cca980b', 3, 'D');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('90d56a44-1447-4144-acc9-ad2b0cca980b', '78d744d5-8b2f-4aab-8853-9239f5b34f32', '''One of the'' requires a plural noun, so it should be ''challenges'', not ''challenge''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5ffb58b9-7d25-4682-a350-80233e59a654', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 85, 'Improve the underlined part: ''The number of frauds have increased significantly.''', 'English', 'Sentence Improvement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07eb8ed7-ce66-4869-b645-ef0541e02e9a', '5ffb58b9-7d25-4682-a350-80233e59a654', 0, 'have increased');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c9678cb-f39f-4849-9bf1-d7262cb28a12', '5ffb58b9-7d25-4682-a350-80233e59a654', 1, 'has increased');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f46981b9-e38f-450e-98e1-186e2adba847', '5ffb58b9-7d25-4682-a350-80233e59a654', 2, 'having increased');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4c73077-4ec6-4b5d-bb15-e3f3a25b5877', '5ffb58b9-7d25-4682-a350-80233e59a654', 3, 'had increase');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5ffb58b9-7d25-4682-a350-80233e59a654', '2c9678cb-f39f-4849-9bf1-d7262cb28a12', '''The number of'' takes a singular verb (''has increased''), whereas ''a number of'' would take a plural verb.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b3ddad72-5929-4b6b-980a-8314919d33a1', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 86, 'Choose the word closest in meaning to ''DEFAULT'' as used in loan contexts:', 'English', 'Vocabulary', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67c8194d-7f0c-4af0-80a4-0ec7493e52cd', 'b3ddad72-5929-4b6b-980a-8314919d33a1', 0, 'Timely repayment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f798f4d-56ac-4aae-b4ae-0662816f7afa', 'b3ddad72-5929-4b6b-980a-8314919d33a1', 1, 'Failure to repay a loan');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8fb05a4-3832-4fc3-82cd-5a9155ce7fc6', 'b3ddad72-5929-4b6b-980a-8314919d33a1', 2, 'Loan approval');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01d21b4f-2fe5-4fd4-a071-163123b12af8', 'b3ddad72-5929-4b6b-980a-8314919d33a1', 3, 'Interest calculation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b3ddad72-5929-4b6b-980a-8314919d33a1', '2f798f4d-56ac-4aae-b4ae-0662816f7afa', '''Default'' means failing to fulfill an obligation, especially failing to repay a loan.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d2a032ba-c5b2-4cd1-bb97-c8726a3bf30a', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 87, 'Based on a passage stating ''NPAs (non-performing assets) have declined due to stricter loan recovery mechanisms'', what caused the decline in NPAs?', 'English', 'Reading Comprehension', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70503180-3f1e-4fb4-a855-1fec1ab2db8c', 'd2a032ba-c5b2-4cd1-bb97-c8726a3bf30a', 0, 'Increased lending');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77052d6c-b019-40ce-9102-f8729b55cb79', 'd2a032ba-c5b2-4cd1-bb97-c8726a3bf30a', 1, 'Stricter loan recovery mechanisms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('011c7acf-3f8a-4f10-a439-b8e991da3d47', 'd2a032ba-c5b2-4cd1-bb97-c8726a3bf30a', 2, 'Lower interest rates');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0285ef6c-6e59-4b65-a7b3-cfa582559bea', 'd2a032ba-c5b2-4cd1-bb97-c8726a3bf30a', 3, 'Government subsidies');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d2a032ba-c5b2-4cd1-bb97-c8726a3bf30a', '77052d6c-b019-40ce-9102-f8729b55cb79', 'The passage explicitly attributes the decline to ''stricter loan recovery mechanisms''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b4607dcc-76e8-418b-adac-5f1bdd14a191', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 88, 'Fill in the blank: ''The RBI Governor emphasized that inflation control remains the ___ priority.''', 'English', 'Cloze Test', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c497c1d0-1d0f-463b-8b3e-c88404809127', 'b4607dcc-76e8-418b-adac-5f1bdd14a191', 0, 'top');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d322dbe8-6564-4204-9a6c-526988b0099d', 'b4607dcc-76e8-418b-adac-5f1bdd14a191', 1, 'sudden');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f26724f-a358-481b-b330-e19004e70354', 'b4607dcc-76e8-418b-adac-5f1bdd14a191', 2, 'rarely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55e769fd-3760-47eb-a9d9-2a289ea39c73', 'b4607dcc-76e8-418b-adac-5f1bdd14a191', 3, 'hardly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b4607dcc-76e8-418b-adac-5f1bdd14a191', 'c497c1d0-1d0f-463b-8b3e-c88404809127', '''Top priority'' is the correct, natural collocation; the other options don''t fit grammatically or contextually as an adjective before ''priority''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('23bc1535-98f1-42b0-b7bd-7605dc3fb9ab', 'fdf8104f-1fde-400f-9baf-dff0c531493d', 89, 'Find the error: ''She along with her colleagues (A) / were awarded (B) / a certificate of excellence (C) / last month. (D)''', 'English', 'Error Detection', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('668b2e76-2c5f-4dab-85fd-571cfcdb7b52', '23bc1535-98f1-42b0-b7bd-7605dc3fb9ab', 0, 'A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28efca6c-ce5c-4172-a1a0-8c72cb5b9190', '23bc1535-98f1-42b0-b7bd-7605dc3fb9ab', 1, 'B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20e060a2-7d59-4592-888f-2bfb952b8a13', '23bc1535-98f1-42b0-b7bd-7605dc3fb9ab', 2, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c7faf96-c3f5-4bad-9d62-1ba50fa1d172', '23bc1535-98f1-42b0-b7bd-7605dc3fb9ab', 3, 'D');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('23bc1535-98f1-42b0-b7bd-7605dc3fb9ab', '28efca6c-ce5c-4172-a1a0-8c72cb5b9190', '''Along with her colleagues'' is parenthetical; the subject remains ''she'' (singular), so it should be ''was awarded'', not ''were awarded''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement); not copied from any official IBPS question paper.');
