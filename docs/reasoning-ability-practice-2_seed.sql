-- ============================================================
-- Reasoning Ability — Practice Paper 2
-- Full-Length Practice Paper (20 questions, 15 minutes)
-- Marking: +1 correct / -0.25 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('b608eeb4-663c-4f39-9ea1-a00dca75ef33', 'reasoning-ability-practice-2', 'Reasoning Ability Practice Paper 2', 'reasoning-ability', ARRAY['Reasoning Ability', 'Banking', 'SSC', 'Railways', 'State PSC']::TEXT[], 20, 'standard', true, 2, 15, 1, 0.25);

-- ── Section: Reasoning Ability (20 questions) — Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam's specific paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3832296b-17d1-4c35-b1bc-a84e8b9d7943', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 1, 'Seven people sit in a row. F sits at one end. G sits fourth from F. How many people are between F and G?', 'Reasoning', 'Puzzles & Seating', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28121dcd-4d64-4d66-8668-5bb0f410e30a', '3832296b-17d1-4c35-b1bc-a84e8b9d7943', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7d57ca4-a38b-4837-9bcd-a6025898e9e7', '3832296b-17d1-4c35-b1bc-a84e8b9d7943', 1, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0ee10a9-f3d0-452c-8f76-bf4b3a5b7d4b', '3832296b-17d1-4c35-b1bc-a84e8b9d7943', 2, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aee3f5c6-1501-462c-bd27-426f8b688fc7', '3832296b-17d1-4c35-b1bc-a84e8b9d7943', 3, '1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3832296b-17d1-4c35-b1bc-a84e8b9d7943', '28121dcd-4d64-4d66-8668-5bb0f410e30a', 'F is at position 1, G is at position 4; the people between them are at positions 2 and 3 -- 2 people.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a4524977-9005-434a-af45-5114fcb4a72f', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 2, 'In a circular arrangement of 8 people facing the center, X sits fourth to the left of Y. If Y is at position 3 (numbered clockwise 1-8), find X''s position.', 'Reasoning', 'Puzzles & Seating', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('608794b5-640c-4474-9da7-b0435ffdab59', 'a4524977-9005-434a-af45-5114fcb4a72f', 0, 'Position 6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39289c12-e320-4546-9488-f69d2463c185', 'a4524977-9005-434a-af45-5114fcb4a72f', 1, 'Position 7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1298fd0d-6176-4744-80ae-bc3c866860b4', 'a4524977-9005-434a-af45-5114fcb4a72f', 2, 'Position 8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94b6c34c-0a63-4768-a900-c8be97ce109e', 'a4524977-9005-434a-af45-5114fcb4a72f', 3, 'Position 5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a4524977-9005-434a-af45-5114fcb4a72f', '39289c12-e320-4546-9488-f69d2463c185', 'Moving 4 positions counter-clockwise (to the left) from position 3 gives position 7 (3-4 = -1, wrapping to 8-1+1... i.e. position 7).', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6898c833-ca7f-4384-9b76-d403f913a633', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 3, 'Statements: Some fruits are vegetables. All vegetables are healthy. Conclusion: Some fruits are healthy. Is this valid?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8edd48df-7c49-4462-907f-27b2be7265b6', '6898c833-ca7f-4384-9b76-d403f913a633', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('509e1ed4-397a-45f7-958d-bf41518747a4', '6898c833-ca7f-4384-9b76-d403f913a633', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec197b85-3766-4509-b555-9eacc350e9c2', '6898c833-ca7f-4384-9b76-d403f913a633', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07a8da74-4947-496d-b83d-414cbbd6804f', '6898c833-ca7f-4384-9b76-d403f913a633', 3, 'Valid only if reversed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6898c833-ca7f-4384-9b76-d403f913a633', '8edd48df-7c49-4462-907f-27b2be7265b6', 'The fruits that are vegetables must be healthy (since all vegetables are healthy), so some fruits are indeed healthy.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3513f115-626f-4585-98a6-14feb6b6e29f', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 4, 'Statements: All squares are rectangles. No rectangle is a triangle. Conclusion: No square is a triangle. Is this valid?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd88bb9b-502c-41e8-aeef-5ced847c0511', '3513f115-626f-4585-98a6-14feb6b6e29f', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48300447-fe96-4b3f-b523-fed980830bc8', '3513f115-626f-4585-98a6-14feb6b6e29f', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4070e3b2-dfce-417d-982c-5fea83f98228', '3513f115-626f-4585-98a6-14feb6b6e29f', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44c33dde-17a5-4bef-8d7c-37142bc947d2', '3513f115-626f-4585-98a6-14feb6b6e29f', 3, 'Valid only partially');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3513f115-626f-4585-98a6-14feb6b6e29f', 'bd88bb9b-502c-41e8-aeef-5ced847c0511', 'Since squares are a subset of rectangles, and rectangles share no overlap with triangles, squares cannot overlap with triangles either.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1146abe0-1b9a-4483-b45c-2bfbfea018d1', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 5, 'If WATER is written as XBUFS (each letter shifted forward by 1), how is EARTH coded?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bdd026d7-cf9f-4dab-b45b-2f2275905876', '1146abe0-1b9a-4483-b45c-2bfbfea018d1', 0, 'FBSUI');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35b92f3f-e221-431d-a51a-4d181c7fd588', '1146abe0-1b9a-4483-b45c-2bfbfea018d1', 1, 'FBSUJ');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('591088ea-eca7-452d-b84f-fa82c055a006', '1146abe0-1b9a-4483-b45c-2bfbfea018d1', 2, 'EBSUI');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8095b96-397d-4694-9f45-1af1666d8243', '1146abe0-1b9a-4483-b45c-2bfbfea018d1', 3, 'FBSTI');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1146abe0-1b9a-4483-b45c-2bfbfea018d1', 'bdd026d7-cf9f-4dab-b45b-2f2275905876', 'Shifting each letter forward by 1: E->F, A->B, R->S, T->U, H->I, giving FBSUI.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('aafa7dfd-6179-4ef9-ae65-ef5d0125068e', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 6, 'If TIGER is coded as UJHFS (each letter shifted forward by 1), how is LION coded?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67842db8-9667-4e6c-9f86-855f26b2135c', 'aafa7dfd-6179-4ef9-ae65-ef5d0125068e', 0, 'MJPO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0640452a-8d72-486f-b843-945064647733', 'aafa7dfd-6179-4ef9-ae65-ef5d0125068e', 1, 'MJPP');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f17c181f-2c5f-4857-87e8-59d1426b9409', 'aafa7dfd-6179-4ef9-ae65-ef5d0125068e', 2, 'MIPO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ffcd5efd-e926-421e-91dd-cd3c7fb6cba1', 'aafa7dfd-6179-4ef9-ae65-ef5d0125068e', 3, 'MJOP');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aafa7dfd-6179-4ef9-ae65-ef5d0125068e', '67842db8-9667-4e6c-9f86-855f26b2135c', 'Shifting each letter forward by 1: L->M, I->J, O->P, N->O, giving MJPO.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e5bfd5e2-3aa8-4258-bb07-6f7aa205c803', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 7, 'A woman says, "B''s mother is the only daughter of my mother." How is A related to B, if the woman is A?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('befe7083-f951-45a4-b9be-80f22eaaf395', 'e5bfd5e2-3aa8-4258-bb07-6f7aa205c803', 0, 'Mother');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b92c0aca-b606-4c07-9157-6a39b3e6e764', 'e5bfd5e2-3aa8-4258-bb07-6f7aa205c803', 1, 'Grandmother');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a899d2b5-e193-4043-a9ae-a9a1ba7ddf86', 'e5bfd5e2-3aa8-4258-bb07-6f7aa205c803', 2, 'Aunt');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('11e6a695-f67b-4b46-819b-08accdae7d24', 'e5bfd5e2-3aa8-4258-bb07-6f7aa205c803', 3, 'Sister');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e5bfd5e2-3aa8-4258-bb07-6f7aa205c803', 'befe7083-f951-45a4-b9be-80f22eaaf395', '"My mother''s only daughter" refers to A herself, meaning B''s mother is A -- so A is B''s mother.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4562b42a-e98a-4350-8834-79841534f6d0', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 8, 'P is Q''s brother. R is P''s mother. S is R''s father. How is S related to Q?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9a1aa1c-e61a-4edd-b193-7d4b7454086e', '4562b42a-e98a-4350-8834-79841534f6d0', 0, 'Grandfather');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9540ef7b-4a8a-4897-8d2b-993ef557cd22', '4562b42a-e98a-4350-8834-79841534f6d0', 1, 'Father');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d9b4dfe-8d2a-4ba3-b76e-fec81201cc2e', '4562b42a-e98a-4350-8834-79841534f6d0', 2, 'Uncle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f8e39ed-3aa8-45c4-9d07-fb5dcf02159b', '4562b42a-e98a-4350-8834-79841534f6d0', 3, 'Great-grandfather');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4562b42a-e98a-4350-8834-79841534f6d0', 'c9a1aa1c-e61a-4edd-b193-7d4b7454086e', 'R is P''s mother and, since P and Q are siblings, also Q''s mother; S, being R''s father, is Q''s maternal grandfather.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6ea4da4e-f285-4ebe-873a-9ff4e39191a9', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 9, 'A person starts from point A, walks 12km north to B, then 5km east to C. Find the distance between A and C.', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4b3b824-44e9-4e8b-ab58-974eeee268fa', '6ea4da4e-f285-4ebe-873a-9ff4e39191a9', 0, '13km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a4ca716-858f-4ba4-b750-3aa653facf8c', '6ea4da4e-f285-4ebe-873a-9ff4e39191a9', 1, '15km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b4f20429-f7bf-43b4-86b9-fc1c963e58a1', '6ea4da4e-f285-4ebe-873a-9ff4e39191a9', 2, '17km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28bfaf15-a1de-46e2-ac6a-facac66bd372', '6ea4da4e-f285-4ebe-873a-9ff4e39191a9', 3, '10km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6ea4da4e-f285-4ebe-873a-9ff4e39191a9', 'a4b3b824-44e9-4e8b-ab58-974eeee268fa', 'Right triangle with legs 12 and 5; distance = sqrt(12^2+5^2) = sqrt(169) = 13km.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1171cf3d-db08-4843-8227-6b19b4a70cac', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 10, 'A man is facing east. He turns 45 degrees clockwise, then 90 degrees clockwise. Which direction is he facing now (approximately)?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5339b893-913d-4e15-812c-7112571c4ac6', '1171cf3d-db08-4843-8227-6b19b4a70cac', 0, 'South-West');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('554c11a3-4969-4c72-acc1-72c104ec4bbd', '1171cf3d-db08-4843-8227-6b19b4a70cac', 1, 'North-West');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('244dd1aa-5a93-478b-8989-5def2f8fef5b', '1171cf3d-db08-4843-8227-6b19b4a70cac', 2, 'South-East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a531115-a3ee-4b6e-8e7e-155268db56da', '1171cf3d-db08-4843-8227-6b19b4a70cac', 3, 'North-East');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1171cf3d-db08-4843-8227-6b19b4a70cac', '5339b893-913d-4e15-812c-7112571c4ac6', 'East (90 deg bearing) + 45 = 135 deg (South-East) + 90 = 225 deg (South-West).', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d48909a3-0bfa-430d-a367-f88111e9b075', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 11, 'Statements: M <= N, N < O, O <= P. Conclusion: M < P. Is this valid?', 'Reasoning', 'Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eab2b25a-92d9-47fe-ba99-15c1cb6fce4e', 'd48909a3-0bfa-430d-a367-f88111e9b075', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3265aa71-972d-4fa2-915f-34694bbcd69a', 'd48909a3-0bfa-430d-a367-f88111e9b075', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f97b132-b554-423a-bd40-8fe2b84615ae', 'd48909a3-0bfa-430d-a367-f88111e9b075', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c461a0a7-63ad-4a58-97ab-09582fa7f8cb', 'd48909a3-0bfa-430d-a367-f88111e9b075', 3, 'Valid only if M=N');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d48909a3-0bfa-430d-a367-f88111e9b075', 'eab2b25a-92d9-47fe-ba99-15c1cb6fce4e', 'Since N<O strictly, even at the loosest bounds (M=N and O=P), M=N<O=P gives M<P -- valid in every case.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0670cb4c-4977-47f7-98aa-0bc450f760c8', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 12, 'Statements: A > B, B = C, C > D. Conclusions: I. A > D. II. A = D. Which follow?', 'Reasoning', 'Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ade3f318-f65d-42c6-8f8e-10a8b8c24d30', '0670cb4c-4977-47f7-98aa-0bc450f760c8', 0, 'Only I follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('379d5bfb-39e2-4eb8-8ec5-7ac12613738d', '0670cb4c-4977-47f7-98aa-0bc450f760c8', 1, 'Only II follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb35d38e-391b-44d5-9b0e-c0ab5d624924', '0670cb4c-4977-47f7-98aa-0bc450f760c8', 2, 'Both follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92bd53c6-f2a9-495d-b387-44c20cabd71a', '0670cb4c-4977-47f7-98aa-0bc450f760c8', 3, 'Neither follows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0670cb4c-4977-47f7-98aa-0bc450f760c8', 'ade3f318-f65d-42c6-8f8e-10a8b8c24d30', 'A>B=C>D gives A>D (I), and II can never hold since A is always strictly greater than D.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('49ee21fc-2f01-464a-8ba4-bf6b1e7599c4', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 13, 'Find the next term: 2, 6, 12, 20, 30, ?', 'Reasoning', 'Series & Analogy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0004de7-d5e8-4cb1-b3a6-c598bb3a1e8c', '49ee21fc-2f01-464a-8ba4-bf6b1e7599c4', 0, '42');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db541dbb-a29c-4781-921f-b8c526b80995', '49ee21fc-2f01-464a-8ba4-bf6b1e7599c4', 1, '40');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d8e6c04-a376-44de-b365-df098dcf79c4', '49ee21fc-2f01-464a-8ba4-bf6b1e7599c4', 2, '36');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1cf6992b-56dd-4914-9a4f-505dbb889772', '49ee21fc-2f01-464a-8ba4-bf6b1e7599c4', 3, '44');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('49ee21fc-2f01-464a-8ba4-bf6b1e7599c4', 'b0004de7-d5e8-4cb1-b3a6-c598bb3a1e8c', 'Each term is n(n+1): 1x2, 2x3, 3x4, 4x5, 5x6, next is 6x7 = 42.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3fc75ee2-8a45-415c-a1d2-6e392ee27a4c', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 14, 'Doctor is to Hospital as Teacher is to?', 'Reasoning', 'Series & Analogy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c24fa44-dedd-4243-8268-079076ff8bca', '3fc75ee2-8a45-415c-a1d2-6e392ee27a4c', 0, 'School');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d3c3dbc-0649-4e22-b164-543c4a5435c7', '3fc75ee2-8a45-415c-a1d2-6e392ee27a4c', 1, 'Book');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ddfe559c-bc6e-4dca-a867-762cee86da05', '3fc75ee2-8a45-415c-a1d2-6e392ee27a4c', 2, 'Student');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('22e66944-88ba-45a4-b1ae-5cf61c5eac3c', '3fc75ee2-8a45-415c-a1d2-6e392ee27a4c', 3, 'Classroom');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3fc75ee2-8a45-415c-a1d2-6e392ee27a4c', '3c24fa44-dedd-4243-8268-079076ff8bca', 'A hospital is a doctor''s primary workplace; a school serves the same role for a teacher.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a83ed741-5a34-423f-a557-b42484030337', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 15, 'Find the odd one out: Triangle, Square, Circle, Cube.', 'Reasoning', 'Classification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0ee6cc6-dee3-43cd-8140-6c06ad34851d', 'a83ed741-5a34-423f-a557-b42484030337', 0, 'Triangle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a78b9a7b-cca6-4e55-8593-f4c9763b6296', 'a83ed741-5a34-423f-a557-b42484030337', 1, 'Square');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ede94a95-b37e-46ca-8722-8ed2e76faa94', 'a83ed741-5a34-423f-a557-b42484030337', 2, 'Circle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbd87234-6704-4982-9729-9ba8edb103aa', 'a83ed741-5a34-423f-a557-b42484030337', 3, 'Cube');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a83ed741-5a34-423f-a557-b42484030337', 'bbd87234-6704-4982-9729-9ba8edb103aa', 'Cube is a three-dimensional solid; the others are all two-dimensional shapes.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ecbd6830-4163-4104-87df-dac162a9fa0d', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 16, 'Find the odd pair: (4,16), (5,25), (6,35), (7,49).', 'Reasoning', 'Classification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46637034-628b-4db6-a9ff-aa03c0f81774', 'ecbd6830-4163-4104-87df-dac162a9fa0d', 0, '(4,16)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c62dfdf-21ac-4c59-bd8e-79c5427b41be', 'ecbd6830-4163-4104-87df-dac162a9fa0d', 1, '(5,25)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('deaf0fd2-4d5e-48aa-94d7-9c31d0945576', 'ecbd6830-4163-4104-87df-dac162a9fa0d', 2, '(6,35)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d832fece-b1e2-4b89-a84c-ab2d841b6130', 'ecbd6830-4163-4104-87df-dac162a9fa0d', 3, '(7,49)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ecbd6830-4163-4104-87df-dac162a9fa0d', 'deaf0fd2-4d5e-48aa-94d7-9c31d0945576', 'The pattern is (n, n^2): 4^2=16, 5^2=25, 7^2=49 all fit, but 6^2=36, not 35.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('67568f8f-6d53-4654-b4b6-ecc1eb7d8cab', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 17, 'Statements: No pens are pencils. All pencils are stationery. Conclusion: No pens are stationery. Is this valid?', 'Reasoning', 'Venn & Statement-Conclusion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb22f2b9-8973-42b7-96ba-2b61d004eb15', '67568f8f-6d53-4654-b4b6-ecc1eb7d8cab', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5dfebaa5-3dcc-4b7f-bed8-e5575270fc96', '67568f8f-6d53-4654-b4b6-ecc1eb7d8cab', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68f785f4-6275-43aa-8dd9-885141ab50a4', '67568f8f-6d53-4654-b4b6-ecc1eb7d8cab', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c09f06a-ea74-4bdf-9afe-b7dd008863a7', '67568f8f-6d53-4654-b4b6-ecc1eb7d8cab', 3, 'Valid only if reversed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('67568f8f-6d53-4654-b4b6-ecc1eb7d8cab', '5dfebaa5-3dcc-4b7f-bed8-e5575270fc96', 'Pens could still be stationery through a category other than ''pencils'' -- the premises don''t rule that out.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3ca5a5d7-6e21-4b9e-a9f3-2550d18fe14b', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 18, 'Three circles represent Athletes, Students, and Married persons. If some athletes are students, some students are married, but no athlete is married, what is the three-way overlap (Athletes, Students, Married all at once)?', 'Reasoning', 'Venn & Statement-Conclusion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aeca5307-7f33-4da8-bc0a-424ffffd0643', '3ca5a5d7-6e21-4b9e-a9f3-2550d18fe14b', 0, 'Zero (no common region among all three)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1bb9098b-65dd-4310-bb7c-d1dc5ce31ca7', '3ca5a5d7-6e21-4b9e-a9f3-2550d18fe14b', 1, 'One large overlapping region');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2025f37d-c1a5-4d91-be9b-f67915e6e48e', '3ca5a5d7-6e21-4b9e-a9f3-2550d18fe14b', 2, 'Two separate regions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0cf20345-6474-4fa3-a490-a83c0ca6fa9a', '3ca5a5d7-6e21-4b9e-a9f3-2550d18fe14b', 3, 'Cannot be determined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3ca5a5d7-6e21-4b9e-a9f3-2550d18fe14b', 'aeca5307-7f33-4da8-bc0a-424ffffd0643', 'Since no athlete is married, there can be no region where Athletes, Students, and Married all overlap.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4b7fedc8-43f7-4da2-aade-392a1c21c3ae', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 19, 'Input: 18 fox 33 lion 7 tiger. Step 1 arranges numbers in ascending order, keeping words'' relative positions. What is the output?', 'Reasoning', 'Input-Output', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5308d53-bb2a-4c00-8413-91880a125f3e', '4b7fedc8-43f7-4da2-aade-392a1c21c3ae', 0, '7 fox 18 lion 33 tiger');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bba12cc5-ecdb-46ac-ab44-dd675447e6c1', '4b7fedc8-43f7-4da2-aade-392a1c21c3ae', 1, '33 fox 18 lion 7 tiger');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1e30d78-df08-4969-87ab-a331546f30bd', '4b7fedc8-43f7-4da2-aade-392a1c21c3ae', 2, 'fox lion tiger 7 18 33');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2935a307-76bf-42fd-bad6-7118eeb57251', '4b7fedc8-43f7-4da2-aade-392a1c21c3ae', 3, '18 fox 33 lion 7 tiger (unchanged)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4b7fedc8-43f7-4da2-aade-392a1c21c3ae', 'f5308d53-bb2a-4c00-8413-91880a125f3e', 'The numbers 18, 33, 7 are rearranged in ascending order (7, 18, 33), keeping each word in its original relative slot.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cd1e1fef-d88c-4775-acb4-8ebc3bcadf4d', 'b608eeb4-663c-4f39-9ea1-a00dca75ef33', 20, 'Using the same machine, Step 2 arranges the words in reverse alphabetical order, while the numbers stay in their Step 1 sequence (7, 18, 33) attached to the new word order. Given Step 1 was "7 fox 18 lion 33 tiger", what is the Step 2 output?', 'Reasoning', 'Input-Output', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54013dfd-8cdb-4f31-877a-aacdfd0897d0', 'cd1e1fef-d88c-4775-acb4-8ebc3bcadf4d', 0, '7 tiger 18 lion 33 fox');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3af50cca-9d5c-49ec-9b36-5c4746816942', 'cd1e1fef-d88c-4775-acb4-8ebc3bcadf4d', 1, '33 tiger 18 lion 7 fox');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6044e85-e9d8-420c-8d6f-f407b0a06b04', 'cd1e1fef-d88c-4775-acb4-8ebc3bcadf4d', 2, 'tiger lion fox 33 18 7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ccba31ef-2888-4829-9a93-65e44bb2ee8c', 'cd1e1fef-d88c-4775-acb4-8ebc3bcadf4d', 3, '7 fox 18 lion 33 tiger');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cd1e1fef-d88c-4775-acb4-8ebc3bcadf4d', '54013dfd-8cdb-4f31-877a-aacdfd0897d0', 'Reverse alphabetical order of fox, lion, tiger is tiger, lion, fox; the Step 1 numbers (7, 18, 33) stay attached to their sequence position.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');
