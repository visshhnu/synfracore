-- ============================================================
-- Reasoning Ability — Practice Paper 4
-- Full-Length Practice Paper (20 questions, 15 minutes)
-- Marking: +1 correct / -0.25 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('d7fb3f69-48fe-4020-8a27-bcdee42c5391', 'reasoning-ability-practice-4', 'Reasoning Ability Practice Paper 4', 'reasoning-ability', ARRAY['Reasoning Ability', 'Banking', 'SSC', 'Railways', 'State PSC']::TEXT[], 20, 'standard', true, 4, 15, 1, 0.25);

-- ── Section: Reasoning Ability (20 questions) — Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam's specific paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d9ec9ab8-5b78-413b-b178-8d205e85faf9', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 1, 'Five people sit around a circular table facing the center. H sits immediately clockwise of (to the right of) G. I sits immediately clockwise of H. If G is at position 1 (numbered clockwise 1-5), find I''s position.', 'Reasoning', 'Puzzles & Seating', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('902585d8-8ead-4503-85b8-75af232b3029', 'd9ec9ab8-5b78-413b-b178-8d205e85faf9', 0, 'Position 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a667896f-b124-4c2d-873b-95ec5dd2e996', 'd9ec9ab8-5b78-413b-b178-8d205e85faf9', 1, 'Position 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ede082e-9468-41f9-a0df-8635d26632e2', 'd9ec9ab8-5b78-413b-b178-8d205e85faf9', 2, 'Position 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('169f60d7-a14a-4053-92f1-e1e08721a363', 'd9ec9ab8-5b78-413b-b178-8d205e85faf9', 3, 'Position 5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d9ec9ab8-5b78-413b-b178-8d205e85faf9', 'a667896f-b124-4c2d-873b-95ec5dd2e996', 'H is at position 2 (immediately clockwise of G); I is at position 3 (immediately clockwise of H).', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6c8457ea-dade-4fc1-8972-696304934d5b', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 2, 'In a row of 7 people, K sits exactly in the middle. L sits second to the right of K. Find L''s position from the left end.', 'Reasoning', 'Puzzles & Seating', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05add45f-eed0-4edb-b5c0-fc7fa148f304', '6c8457ea-dade-4fc1-8972-696304934d5b', 0, '6th from left');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e2928937-eeb0-48cc-a17b-5b1a22c9e0b0', '6c8457ea-dade-4fc1-8972-696304934d5b', 1, '5th from left');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9edaead3-bf96-4c5a-b96b-323bbaebf30e', '6c8457ea-dade-4fc1-8972-696304934d5b', 2, '7th from left');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c18185d-5ce9-4df8-b556-91bcc8739047', '6c8457ea-dade-4fc1-8972-696304934d5b', 3, '4th from left');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6c8457ea-dade-4fc1-8972-696304934d5b', '05add45f-eed0-4edb-b5c0-fc7fa148f304', 'The middle of 7 is position 4; second to the right of K is position 6.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4223554f-fd55-468c-ae6c-57c8967eaf1a', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 3, 'Statements: All rivers are water bodies. Some water bodies are polluted. Conclusion: Some rivers are polluted. Is this valid?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aae5efe3-7b92-47bb-9dc7-a315c3978a0d', '4223554f-fd55-468c-ae6c-57c8967eaf1a', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e4032fa-ae1c-4bf4-aac5-861a5fb2e0d8', '4223554f-fd55-468c-ae6c-57c8967eaf1a', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19f169ce-5e5f-4f0b-a0d7-2dfda68fec24', '4223554f-fd55-468c-ae6c-57c8967eaf1a', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1815dda4-4523-4fb9-a530-42ed682dd8f5', '4223554f-fd55-468c-ae6c-57c8967eaf1a', 3, 'Valid only if reversed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4223554f-fd55-468c-ae6c-57c8967eaf1a', '3e4032fa-ae1c-4bf4-aac5-861a5fb2e0d8', 'The polluted water bodies may not overlap with the ones that are rivers -- the conclusion isn''t guaranteed.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('95a08d6d-54f1-458a-8b41-66719d64dddb', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 4, 'Statements: No fish are mammals. All whales are mammals. Conclusion: No whales are fish. Is this valid?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9280e90d-f24f-4510-834c-66b7c4a8786d', '95a08d6d-54f1-458a-8b41-66719d64dddb', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa975415-aacf-4afa-87a7-896451933056', '95a08d6d-54f1-458a-8b41-66719d64dddb', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('730eed89-02e4-4e2f-b4eb-8ad8f11c86e5', '95a08d6d-54f1-458a-8b41-66719d64dddb', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d2bc371-f2bf-400e-b26b-c7da26954bae', '95a08d6d-54f1-458a-8b41-66719d64dddb', 3, 'Valid only partially');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('95a08d6d-54f1-458a-8b41-66719d64dddb', '9280e90d-f24f-4510-834c-66b7c4a8786d', 'Since whales are a subset of mammals, and mammals share no overlap with fish, whales cannot overlap with fish either.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('03d548de-b345-4401-ab58-b6737a5fe7fd', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 5, 'If HORSE is written as IPSTF (each letter shifted forward by 1), how is CAMEL coded?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7b94c50-f9bf-4443-a5f0-a5383dc3c7da', '03d548de-b345-4401-ab58-b6737a5fe7fd', 0, 'DBNFM');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef5dcae6-895d-483d-95ab-7b70f0b137c8', '03d548de-b345-4401-ab58-b6737a5fe7fd', 1, 'DBNFN');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9403891d-12fe-4584-9270-e76a048a065f', '03d548de-b345-4401-ab58-b6737a5fe7fd', 2, 'DANFM');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b64b8095-5ec3-460a-b75e-919fb257daa5', '03d548de-b345-4401-ab58-b6737a5fe7fd', 3, 'DBMFM');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('03d548de-b345-4401-ab58-b6737a5fe7fd', 'd7b94c50-f9bf-4443-a5f0-a5383dc3c7da', 'Shifting each letter forward by 1: C->D, A->B, M->N, E->F, L->M, giving DBNFM.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8b223aa2-6972-47ec-9fd0-fe89ab6c715f', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 6, 'In a code, CHAIR is written as 3-8-1-9-18 (each letter''s position in the alphabet). What is the code for TABLE?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('511f1bff-cde2-4632-97ad-e40706e96a7e', '8b223aa2-6972-47ec-9fd0-fe89ab6c715f', 0, '20-1-2-12-5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7129e209-b594-4891-8f34-27bcdc9bbf22', '8b223aa2-6972-47ec-9fd0-fe89ab6c715f', 1, '20-1-2-11-5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d373e0ed-fae2-412c-8404-c9ef01bb5c93', '8b223aa2-6972-47ec-9fd0-fe89ab6c715f', 2, '19-1-2-12-5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f1b61f2-4b65-46d4-83d8-e1589dc44611', '8b223aa2-6972-47ec-9fd0-fe89ab6c715f', 3, '20-2-1-12-5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8b223aa2-6972-47ec-9fd0-fe89ab6c715f', '511f1bff-cde2-4632-97ad-e40706e96a7e', 'T=20, A=1, B=2, L=12, E=5, giving the code 20-1-2-12-5.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4c51305c-5616-43a8-bce8-994d83f865d4', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 7, 'M is N''s mother. O is N''s brother. P is O''s son. How is P related to M?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('453f6586-8992-45c3-809c-b00910064f4e', '4c51305c-5616-43a8-bce8-994d83f865d4', 0, 'Grandson');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10a06461-0b11-409a-8158-56032a9417a6', '4c51305c-5616-43a8-bce8-994d83f865d4', 1, 'Son');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1151cb20-b052-47f2-96c5-5cf0d72e41c4', '4c51305c-5616-43a8-bce8-994d83f865d4', 2, 'Nephew');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58828081-1ff2-4e90-826d-39a7f0e64c01', '4c51305c-5616-43a8-bce8-994d83f865d4', 3, 'Grandfather');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4c51305c-5616-43a8-bce8-994d83f865d4', '453f6586-8992-45c3-809c-b00910064f4e', 'O is M''s child (N''s brother), and P, being O''s son, is M''s grandson.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('beeb66be-4357-4741-a256-1ec6ff6dc432', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 8, 'Introducing a girl, a man says, "She is the daughter of my wife''s brother." How is the girl related to the man?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85f0ebbf-71f7-4167-8954-283382b7a7c1', 'beeb66be-4357-4741-a256-1ec6ff6dc432', 0, 'Niece');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6cff7e8-ef75-4244-9e18-782f94fb0257', 'beeb66be-4357-4741-a256-1ec6ff6dc432', 1, 'Daughter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5dfe2382-f8ee-474b-8e86-8188f3054a69', 'beeb66be-4357-4741-a256-1ec6ff6dc432', 2, 'Sister');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb240cc7-2399-43d4-afca-39e3d6ef75fb', 'beeb66be-4357-4741-a256-1ec6ff6dc432', 3, 'Cousin');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('beeb66be-4357-4741-a256-1ec6ff6dc432', '85f0ebbf-71f7-4167-8954-283382b7a7c1', 'The wife''s brother is the man''s brother-in-law; his daughter is the man''s niece by marriage.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('de56113c-e79c-41a9-9ae0-bce5be11f5a0', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 9, 'A man walks 9km south, then 12km west. Find his distance from the starting point.', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b920c2c6-a47e-424e-9b5c-7b8eb9f41770', 'de56113c-e79c-41a9-9ae0-bce5be11f5a0', 0, '15km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b1c2f91-5b9a-4a94-aed7-bbd5672e9c0b', 'de56113c-e79c-41a9-9ae0-bce5be11f5a0', 1, '18km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b19ddf44-0d49-44ee-8cec-b751a7ea60fc', 'de56113c-e79c-41a9-9ae0-bce5be11f5a0', 2, '20km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75455032-b908-4ad6-936d-18fed5ee2fa9', 'de56113c-e79c-41a9-9ae0-bce5be11f5a0', 3, '14km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('de56113c-e79c-41a9-9ae0-bce5be11f5a0', 'b920c2c6-a47e-424e-9b5c-7b8eb9f41770', 'Right triangle with legs 9 and 12; distance = sqrt(9^2+12^2) = sqrt(225) = 15km.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b950e946-b091-4d2c-86e4-a7b724b21f37', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 10, 'A man is facing north-west. He turns 135 degrees clockwise. Which direction is he facing now?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e288730-a6b7-454e-b265-0474a4647fd4', 'b950e946-b091-4d2c-86e4-a7b724b21f37', 0, 'East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b5f43d0-7210-44a9-80ed-5c35fefb38f4', 'b950e946-b091-4d2c-86e4-a7b724b21f37', 1, 'South-East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b4af6d5-fe8c-4d57-b0f4-d07bef22462a', 'b950e946-b091-4d2c-86e4-a7b724b21f37', 2, 'North');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f14ff6f-b77e-47c5-8f12-88c786431d20', 'b950e946-b091-4d2c-86e4-a7b724b21f37', 3, 'West');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b950e946-b091-4d2c-86e4-a7b724b21f37', '6e288730-a6b7-454e-b265-0474a4647fd4', 'North-West is 315 degrees on a compass bearing; adding 135 degrees clockwise gives 450 mod 360 = 90 degrees, which is East.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f69798b5-456b-4b65-98f9-4f5b28e03bdd', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 11, 'Statements: X <= Y < Z, Z <= W. Conclusion: X < W. Is this valid?', 'Reasoning', 'Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('effad971-75f3-47ec-b5b1-a4fc1a2ad650', 'f69798b5-456b-4b65-98f9-4f5b28e03bdd', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('271ac04a-3e66-4263-b5d8-99182aea134e', 'f69798b5-456b-4b65-98f9-4f5b28e03bdd', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4e28a14-1e2e-4af2-895e-ee8992ac40e0', 'f69798b5-456b-4b65-98f9-4f5b28e03bdd', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e67af68-28bd-4721-a4e5-688fea48448e', 'f69798b5-456b-4b65-98f9-4f5b28e03bdd', 3, 'Valid only if X=Y');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f69798b5-456b-4b65-98f9-4f5b28e03bdd', 'effad971-75f3-47ec-b5b1-a4fc1a2ad650', 'Since Y<Z strictly, even at the loosest bounds (X=Y and Z=W), X=Y<Z=W gives X<W.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e07f4fec-f7a8-447a-82e7-045714afe709', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 12, 'Statements: A = B, B < C, C = D. Conclusions: I. A < D. II. A = D. Which follows?', 'Reasoning', 'Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('509d00cd-cb6c-47d3-befd-fbbafd709efe', 'e07f4fec-f7a8-447a-82e7-045714afe709', 0, 'Only I follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe86f408-b77f-432c-bda9-abc6a6b306f9', 'e07f4fec-f7a8-447a-82e7-045714afe709', 1, 'Only II follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('158acd0e-6613-406b-a9bf-8c4ade671c2a', 'e07f4fec-f7a8-447a-82e7-045714afe709', 2, 'Both follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7fda4f4f-238e-4161-90bd-d187debddc13', 'e07f4fec-f7a8-447a-82e7-045714afe709', 3, 'Neither follows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e07f4fec-f7a8-447a-82e7-045714afe709', '509d00cd-cb6c-47d3-befd-fbbafd709efe', 'A=B<C=D gives A<D (I); II can never hold since A is always strictly less than D.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('732ed73f-1dfe-4596-b28e-56fefcdc3c36', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 13, 'Find the next term: 1, 1, 2, 3, 5, 8, ?', 'Reasoning', 'Series & Analogy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('291ce0af-9bf3-45f9-8a28-300c6480c50a', '732ed73f-1dfe-4596-b28e-56fefcdc3c36', 0, '13');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a08c8c29-d69d-4e3e-95e8-2d2f4a478ed6', '732ed73f-1dfe-4596-b28e-56fefcdc3c36', 1, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a921753-0bb4-4ce8-b5b9-5f9148c13b4c', '732ed73f-1dfe-4596-b28e-56fefcdc3c36', 2, '14');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75e6a655-5281-46a6-a581-8922e29eddc7', '732ed73f-1dfe-4596-b28e-56fefcdc3c36', 3, '11');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('732ed73f-1dfe-4596-b28e-56fefcdc3c36', '291ce0af-9bf3-45f9-8a28-300c6480c50a', 'This is the Fibonacci sequence, where each term is the sum of the two before it: 5+8 = 13.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1deedad8-ed55-4323-8121-b4ae7ca95633', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 14, 'Fish is to Water as Bird is to?', 'Reasoning', 'Series & Analogy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4751d915-9129-47ef-863b-f6c7f3fc6666', '1deedad8-ed55-4323-8121-b4ae7ca95633', 0, 'Air');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c42668f-67e1-4c5c-8df4-105bd8fab75e', '1deedad8-ed55-4323-8121-b4ae7ca95633', 1, 'Nest');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('167bf385-4da4-4e53-bbbd-6c7f954ff7eb', '1deedad8-ed55-4323-8121-b4ae7ca95633', 2, 'Feather');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09912e31-d05d-4424-b072-28ec7fdaebff', '1deedad8-ed55-4323-8121-b4ae7ca95633', 3, 'Tree');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1deedad8-ed55-4323-8121-b4ae7ca95633', '4751d915-9129-47ef-863b-f6c7f3fc6666', 'A fish''s natural medium of movement is water; a bird''s natural medium of movement is air.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('83f1d634-7f88-45e5-8083-8a8df08ed833', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 15, 'Find the odd one out: Guitar, Violin, Sitar, Flute.', 'Reasoning', 'Classification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c1bf1a0-597e-44b7-99b4-3a0183b6bf29', '83f1d634-7f88-45e5-8083-8a8df08ed833', 0, 'Guitar');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72eb5d35-fc57-4c6a-83b0-aba7cebd8271', '83f1d634-7f88-45e5-8083-8a8df08ed833', 1, 'Violin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9fbda4ee-69cc-4f2a-ac3e-e6211f03f1e9', '83f1d634-7f88-45e5-8083-8a8df08ed833', 2, 'Sitar');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0c40432-82ae-4e25-bc01-1b230ac24672', '83f1d634-7f88-45e5-8083-8a8df08ed833', 3, 'Flute');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('83f1d634-7f88-45e5-8083-8a8df08ed833', 'd0c40432-82ae-4e25-bc01-1b230ac24672', 'Guitar, Violin, and Sitar are string instruments; Flute is a wind instrument.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('aabae705-dfb2-4aed-af43-4bb7c186440a', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 16, 'Find the odd pair: (3,9), (4,16), (5,20), (6,36).', 'Reasoning', 'Classification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82f64732-742c-4f29-8a03-a2a2cbc43658', 'aabae705-dfb2-4aed-af43-4bb7c186440a', 0, '(3,9)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e7918ea-aefa-4668-a960-f9e2ba9ad13f', 'aabae705-dfb2-4aed-af43-4bb7c186440a', 1, '(4,16)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c27f9fb2-ab7d-49a5-9b2d-a3aa0506fd79', 'aabae705-dfb2-4aed-af43-4bb7c186440a', 2, '(5,20)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b7c11f2-fdde-40cd-944d-bbc521d368f7', 'aabae705-dfb2-4aed-af43-4bb7c186440a', 3, '(6,36)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aabae705-dfb2-4aed-af43-4bb7c186440a', 'c27f9fb2-ab7d-49a5-9b2d-a3aa0506fd79', 'The pattern is (n, n^2): 3^2=9, 4^2=16, 6^2=36 all fit, but 5^2=25, not 20.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c9d9b5fa-efc4-43fa-803f-74057e30ba6f', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 17, 'Statements: All pilots are trained. Some trained people are certified. Conclusion: Some pilots are certified. Is this valid?', 'Reasoning', 'Venn & Statement-Conclusion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87640e0c-79b3-4aad-ace8-d1857f0000c6', 'c9d9b5fa-efc4-43fa-803f-74057e30ba6f', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('11ee946d-e931-4aea-9dd8-44b2470e1b68', 'c9d9b5fa-efc4-43fa-803f-74057e30ba6f', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('662e47d5-7ebd-4825-87bf-a19995d53859', 'c9d9b5fa-efc4-43fa-803f-74057e30ba6f', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('344fdf41-d97d-4b7f-8e13-0a635735ba90', 'c9d9b5fa-efc4-43fa-803f-74057e30ba6f', 3, 'Valid only if reversed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c9d9b5fa-efc4-43fa-803f-74057e30ba6f', '11ee946d-e931-4aea-9dd8-44b2470e1b68', 'The certified trained people might not overlap with the ones who are pilots -- the conclusion isn''t guaranteed.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('847cf20f-6ecf-4e3d-a627-9fbaf6fda64a', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 18, 'Set A (Cricketers) and Set B (Left-handed people) overlap partially. Set C (Professionals) completely contains Set A. Which statement is definitely true?', 'Reasoning', 'Venn & Statement-Conclusion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e266996-7b7d-41fb-b777-1cb56a90debc', '847cf20f-6ecf-4e3d-a627-9fbaf6fda64a', 0, 'All cricketers are professionals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fee187e9-9896-402f-8106-d842add1bf1a', '847cf20f-6ecf-4e3d-a627-9fbaf6fda64a', 1, 'All professionals are cricketers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72d3132f-3bb6-45d7-95c5-c2b53f43999a', '847cf20f-6ecf-4e3d-a627-9fbaf6fda64a', 2, 'No cricketer is left-handed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5650ce3e-b90b-44ff-9f87-557234eab531', '847cf20f-6ecf-4e3d-a627-9fbaf6fda64a', 3, 'All left-handed people are professionals');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('847cf20f-6ecf-4e3d-a627-9fbaf6fda64a', '3e266996-7b7d-41fb-b777-1cb56a90debc', 'Since Set A is entirely contained within Set C, every cricketer is necessarily a professional.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4367db9b-8cfc-4047-a519-ad0a248ea332', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 19, 'Input: 63 zebra 8 ant 41 monkey. Step 1 arranges numbers in ascending order, keeping words'' relative positions. What is the output?', 'Reasoning', 'Input-Output', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f001cb4-b90e-44c0-953c-a0add8849ed7', '4367db9b-8cfc-4047-a519-ad0a248ea332', 0, '8 zebra 41 ant 63 monkey');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02506cf8-2e95-49df-b260-b4cd08003ccb', '4367db9b-8cfc-4047-a519-ad0a248ea332', 1, '63 zebra 8 ant 41 monkey (unchanged)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('485cada4-c1a4-4a51-aedb-d780c566ebc6', '4367db9b-8cfc-4047-a519-ad0a248ea332', 2, 'ant monkey zebra 8 41 63');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4f904ca-968d-4cae-b9bf-0b5c3e6ef725', '4367db9b-8cfc-4047-a519-ad0a248ea332', 3, '8 ant 41 monkey 63 zebra');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4367db9b-8cfc-4047-a519-ad0a248ea332', '0f001cb4-b90e-44c0-953c-a0add8849ed7', 'The numbers 63, 8, 41 are rearranged in ascending order (8, 41, 63), keeping each word in its original relative slot.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ed488af4-0b6b-4c50-af09-5269ccbd2f5c', 'd7fb3f69-48fe-4020-8a27-bcdee42c5391', 20, 'Using the same machine, Step 2 rearranges the words alphabetically, keeping the Step 1 numbers attached to their sequence position (not the words). Given Step 1 was "8 zebra 41 ant 63 monkey", what is the Step 2 output?', 'Reasoning', 'Input-Output', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df0567f0-465f-43be-8444-12cf53b628ca', 'ed488af4-0b6b-4c50-af09-5269ccbd2f5c', 0, '8 ant 41 monkey 63 zebra');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cab3f5b8-b1f0-4593-8acb-db735f1151ad', 'ed488af4-0b6b-4c50-af09-5269ccbd2f5c', 1, '63 ant 41 monkey 8 zebra');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d30ed97e-1aa6-47a8-8e52-dbcf26b26a6c', 'ed488af4-0b6b-4c50-af09-5269ccbd2f5c', 2, 'ant 8 monkey 41 zebra 63');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15b41dd5-5032-496b-8a9e-ce9145e6243f', 'ed488af4-0b6b-4c50-af09-5269ccbd2f5c', 3, '8 zebra 41 ant 63 monkey');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ed488af4-0b6b-4c50-af09-5269ccbd2f5c', 'df0567f0-465f-43be-8444-12cf53b628ca', 'Alphabetically, the words become ant, monkey, zebra; the Step 1 numbers (8, 41, 63) stay attached to their sequence position.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');
