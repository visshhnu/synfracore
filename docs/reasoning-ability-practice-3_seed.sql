-- ============================================================
-- Reasoning Ability — Practice Paper 3
-- Full-Length Practice Paper (20 questions, 15 minutes)
-- Marking: +1 correct / -0.25 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('72786397-f590-4413-aff8-724e5bf9826e', 'reasoning-ability-practice-3', 'Reasoning Ability Practice Paper 3', 'reasoning-ability', ARRAY['Reasoning Ability', 'Banking', 'SSC', 'Railways', 'State PSC']::TEXT[], 20, 'standard', true, 3, 15, 1, 0.25);

-- ── Section: Reasoning Ability (20 questions) — Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam's specific paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bd035ad9-52b4-43a0-99d8-fc8f406c6f17', '72786397-f590-4413-aff8-724e5bf9826e', 1, 'Six people sit in a row facing north. C sits at the left end. D sits at the right end. How many people sit between C and D?', 'Reasoning', 'Puzzles & Seating', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15c22ed0-b89b-4164-ab29-f67ff3ad7167', 'bd035ad9-52b4-43a0-99d8-fc8f406c6f17', 0, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8706fdf9-5f6a-464b-9d7c-4d8c696a2f8a', 'bd035ad9-52b4-43a0-99d8-fc8f406c6f17', 1, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('382ed428-884f-48d5-813d-f4ba00c291c2', 'bd035ad9-52b4-43a0-99d8-fc8f406c6f17', 2, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('641bb401-9a1b-4475-8bf5-4caf466e76fa', 'bd035ad9-52b4-43a0-99d8-fc8f406c6f17', 3, '2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bd035ad9-52b4-43a0-99d8-fc8f406c6f17', '15c22ed0-b89b-4164-ab29-f67ff3ad7167', 'With 6 people in a row and C, D at the two ends (positions 1 and 6), the people between them occupy positions 2, 3, 4, 5 -- 4 people.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d2d4b83f-89e2-48e7-9df2-94418f66fe7c', '72786397-f590-4413-aff8-724e5bf9826e', 2, 'In a row of 5 people facing north, E is immediately left of F. G is at the right end. If F is third from the left, where does E sit?', 'Reasoning', 'Puzzles & Seating', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b4b506e-eb12-46e7-aa1d-6d64ae1382b6', 'd2d4b83f-89e2-48e7-9df2-94418f66fe7c', 0, 'Position 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a14b5577-b9da-485f-9c88-488bc6f4dd31', 'd2d4b83f-89e2-48e7-9df2-94418f66fe7c', 1, 'Position 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a6856ac-9c71-46ea-b601-65dee883e9b5', 'd2d4b83f-89e2-48e7-9df2-94418f66fe7c', 2, 'Position 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e39e7a70-76df-4fba-a587-12eff725d23c', 'd2d4b83f-89e2-48e7-9df2-94418f66fe7c', 3, 'Position 4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d2d4b83f-89e2-48e7-9df2-94418f66fe7c', 'a14b5577-b9da-485f-9c88-488bc6f4dd31', 'F is at position 3; E, immediately left of F, is at position 2.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('87d3692d-f817-436e-ab65-79c1b0141d43', '72786397-f590-4413-aff8-724e5bf9826e', 3, 'Statements: All lions are carnivores. All carnivores are animals. Conclusion: All lions are animals. Is this valid?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9887fc6-957b-4008-a8f3-8668a0d605d2', '87d3692d-f817-436e-ab65-79c1b0141d43', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ccdd2a74-bfad-4d90-a429-ef8910e6f594', '87d3692d-f817-436e-ab65-79c1b0141d43', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82baa566-21ab-4fda-8503-e92dcfa36bda', '87d3692d-f817-436e-ab65-79c1b0141d43', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03c31f3b-6cff-46b1-927f-e2f91f2bcbe4', '87d3692d-f817-436e-ab65-79c1b0141d43', 3, 'Valid only partially');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('87d3692d-f817-436e-ab65-79c1b0141d43', 'c9887fc6-957b-4008-a8f3-8668a0d605d2', 'This follows directly by transitivity: lions are carnivores, and all carnivores are animals.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e5191ac1-cdfa-4997-9e3f-df670c681303', '72786397-f590-4413-aff8-724e5bf9826e', 4, 'Statements: Some birds can fly. All flying creatures are agile. Conclusion: Some birds are agile. Is this valid?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc913b02-2003-4195-abab-b53c75447e91', 'e5191ac1-cdfa-4997-9e3f-df670c681303', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f40155c7-05d0-4c8f-ad90-2f1a3207c9a8', 'e5191ac1-cdfa-4997-9e3f-df670c681303', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0017c07f-bb70-45d5-8dd0-e3a66a38a26b', 'e5191ac1-cdfa-4997-9e3f-df670c681303', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ebb4b32-5fb4-4afc-a809-fb2183f7bfbd', 'e5191ac1-cdfa-4997-9e3f-df670c681303', 3, 'Valid only if reversed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e5191ac1-cdfa-4997-9e3f-df670c681303', 'bc913b02-2003-4195-abab-b53c75447e91', 'The birds that can fly must be agile (since all flying creatures are agile), so some birds are indeed agile.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('58d38ed2-07cb-4a47-a295-ecb7e53addb5', '72786397-f590-4413-aff8-724e5bf9826e', 5, 'If APPLE is coded as 1-16-16-12-5 (using A=1, B=2, ...), what is the code for GRAPE?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f45e700d-d542-4876-b3b7-7d36c5d2245b', '58d38ed2-07cb-4a47-a295-ecb7e53addb5', 0, '7-18-1-16-5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e9f77be-9611-423b-9a8b-2e6642b6e626', '58d38ed2-07cb-4a47-a295-ecb7e53addb5', 1, '7-17-1-16-5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b81294cf-a794-4e6c-a357-48ff2a153bcd', '58d38ed2-07cb-4a47-a295-ecb7e53addb5', 2, '7-18-1-15-5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51b21a0f-25f8-45b4-84c9-ce0a1f9bd7af', '58d38ed2-07cb-4a47-a295-ecb7e53addb5', 3, '6-18-1-16-5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('58d38ed2-07cb-4a47-a295-ecb7e53addb5', 'f45e700d-d542-4876-b3b7-7d36c5d2245b', 'G=7, R=18, A=1, P=16, E=5, giving the code 7-18-1-16-5.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('96351e98-1e18-47b9-8449-3f30669cafc5', '72786397-f590-4413-aff8-724e5bf9826e', 6, 'If CAT is coded as DBU (each letter shifted forward by 1), how is DOG coded?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f535722b-6999-4983-b3c8-03652c67bb15', '96351e98-1e18-47b9-8449-3f30669cafc5', 0, 'EPH');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eecee610-728d-4911-8ee7-1a3e62a49a96', '96351e98-1e18-47b9-8449-3f30669cafc5', 1, 'EPG');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd63b4d7-27b2-4169-b453-564f8e18d25b', '96351e98-1e18-47b9-8449-3f30669cafc5', 2, 'DPH');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20693ff6-9544-4a88-9f76-af04c7f80e92', '96351e98-1e18-47b9-8449-3f30669cafc5', 3, 'EOH');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('96351e98-1e18-47b9-8449-3f30669cafc5', 'f535722b-6999-4983-b3c8-03652c67bb15', 'Shifting each letter forward by 1: D->E, O->P, G->H, giving EPH.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('dc8e92c9-6270-42a7-9b33-16f310022642', '72786397-f590-4413-aff8-724e5bf9826e', 7, 'A is B''s father. C is B''s son. D is C''s sister. How is D related to A?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93f962c4-96d1-4b40-b7b1-a5a1a0a8a4a7', 'dc8e92c9-6270-42a7-9b33-16f310022642', 0, 'Granddaughter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1aa2523-9bb6-470e-9a2d-a1d2f7519218', 'dc8e92c9-6270-42a7-9b33-16f310022642', 1, 'Daughter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c35467c-519a-4318-9a82-db2304c27e79', 'dc8e92c9-6270-42a7-9b33-16f310022642', 2, 'Niece');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cbb4e18c-d9cd-4bc0-895b-e068100ebf65', 'dc8e92c9-6270-42a7-9b33-16f310022642', 3, 'Grandmother');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dc8e92c9-6270-42a7-9b33-16f310022642', '93f962c4-96d1-4b40-b7b1-a5a1a0a8a4a7', 'D is C''s sister, so D is also B''s daughter; since B is A''s child, D is A''s granddaughter.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fbfb36b4-185f-4b78-b066-b2d0fb796bf3', '72786397-f590-4413-aff8-724e5bf9826e', 8, 'P is the brother of Q. Q is the daughter of R. S is R''s husband. How is S related to P?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20246417-d55d-45b2-a175-c1112507d3ea', 'fbfb36b4-185f-4b78-b066-b2d0fb796bf3', 0, 'Father');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1539b61c-e93a-47f3-a8e9-47c1b91d95d5', 'fbfb36b4-185f-4b78-b066-b2d0fb796bf3', 1, 'Uncle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e08c5c4-8efb-4aea-adf5-faeea371be77', 'fbfb36b4-185f-4b78-b066-b2d0fb796bf3', 2, 'Grandfather');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('030dd321-80e0-4971-b436-45f3376c0c6d', 'fbfb36b4-185f-4b78-b066-b2d0fb796bf3', 3, 'Brother-in-law');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fbfb36b4-185f-4b78-b066-b2d0fb796bf3', '20246417-d55d-45b2-a175-c1112507d3ea', 'R is Q''s parent and, since P is Q''s brother, also P''s parent; S, being R''s husband, is P''s father.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('362eb29d-1916-4afb-ad6c-1235bfcf9395', '72786397-f590-4413-aff8-724e5bf9826e', 9, 'A person walks 7km east, then 24km north. Find his distance from the starting point.', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7abfbad9-3103-4824-9221-de62d249f04b', '362eb29d-1916-4afb-ad6c-1235bfcf9395', 0, '25km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78487fda-b000-4f2c-82cd-8da9495fc353', '362eb29d-1916-4afb-ad6c-1235bfcf9395', 1, '28km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f9be529-49f4-4a5c-8be2-a3f58a28ada5', '362eb29d-1916-4afb-ad6c-1235bfcf9395', 2, '30km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('770ccff8-1aea-4835-ae7c-aae5188a6051', '362eb29d-1916-4afb-ad6c-1235bfcf9395', 3, '22km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('362eb29d-1916-4afb-ad6c-1235bfcf9395', '7abfbad9-3103-4824-9221-de62d249f04b', 'Right triangle with legs 7 and 24; distance = sqrt(7^2+24^2) = sqrt(625) = 25km.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ec3e3baa-14b2-4dae-837f-3b5ea105511b', '72786397-f590-4413-aff8-724e5bf9826e', 10, 'Facing south, a person turns 90 degrees anticlockwise. Which direction is he facing now?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00ebe4d1-af4e-4f8c-89f2-17fac9f91293', 'ec3e3baa-14b2-4dae-837f-3b5ea105511b', 0, 'East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6826be25-5147-4930-b772-38eaf01fada4', 'ec3e3baa-14b2-4dae-837f-3b5ea105511b', 1, 'West');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9cd09c54-23b7-40b3-af96-be8f7973df5b', 'ec3e3baa-14b2-4dae-837f-3b5ea105511b', 2, 'North');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd5a5cd6-73be-4783-8b75-096354f2da28', 'ec3e3baa-14b2-4dae-837f-3b5ea105511b', 3, 'South');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ec3e3baa-14b2-4dae-837f-3b5ea105511b', '00ebe4d1-af4e-4f8c-89f2-17fac9f91293', 'South is 180 degrees on a compass; turning 90 anticlockwise gives 90 degrees, which is East.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f12135d2-b249-4b2e-bd95-bcbe18e0ded1', '72786397-f590-4413-aff8-724e5bf9826e', 11, 'Statements: A >= B > C >= D. Conclusion: A > D. Is this valid?', 'Reasoning', 'Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('217137eb-0e4a-4e81-9d13-51c3d1486423', 'f12135d2-b249-4b2e-bd95-bcbe18e0ded1', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48006742-807c-41f6-9926-ddb995505806', 'f12135d2-b249-4b2e-bd95-bcbe18e0ded1', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5eb0e8b8-2202-46e8-ab67-71452efe724b', 'f12135d2-b249-4b2e-bd95-bcbe18e0ded1', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90c13536-fce7-44ba-9d45-e381e0291c9f', 'f12135d2-b249-4b2e-bd95-bcbe18e0ded1', 3, 'Valid only if A=B');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f12135d2-b249-4b2e-bd95-bcbe18e0ded1', '217137eb-0e4a-4e81-9d13-51c3d1486423', 'Since B>C strictly, even at the loosest bounds (A=B and C=D), A=B>C=D gives A>D.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3f959a20-5bd7-4596-a113-714090c8e6b9', '72786397-f590-4413-aff8-724e5bf9826e', 12, 'Statements: P < Q, Q <= R, R < S. Conclusions: I. P < S. II. P < R. Which follow?', 'Reasoning', 'Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7f30f9e-2ddf-4545-8953-719995943315', '3f959a20-5bd7-4596-a113-714090c8e6b9', 0, 'Both I and II follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5fd257be-be61-43f0-aab2-4acfe46882f1', '3f959a20-5bd7-4596-a113-714090c8e6b9', 1, 'Only I follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b992556-3293-4981-9169-3c266999795e', '3f959a20-5bd7-4596-a113-714090c8e6b9', 2, 'Only II follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6bd36f01-e42a-489f-a27e-068ad2bf2ee6', '3f959a20-5bd7-4596-a113-714090c8e6b9', 3, 'Neither follows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3f959a20-5bd7-4596-a113-714090c8e6b9', 'a7f30f9e-2ddf-4545-8953-719995943315', 'P<Q<=R<S gives P<S (I); and P<Q<=R means P<R also holds (II), since even at Q=R, P<Q=R.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('53e41070-f0a3-460d-8d2c-7aa68aa20b4c', '72786397-f590-4413-aff8-724e5bf9826e', 13, 'Find the next term: Z, Y, X, W, ?', 'Reasoning', 'Series & Analogy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee51b638-1f54-4851-a7ee-7e923e09bf2e', '53e41070-f0a3-460d-8d2c-7aa68aa20b4c', 0, 'V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f492518-dde5-40f9-9ee5-348be66de50d', '53e41070-f0a3-460d-8d2c-7aa68aa20b4c', 1, 'U');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aef56c1e-f49f-4fd7-84e1-7ebb04dbbae7', '53e41070-f0a3-460d-8d2c-7aa68aa20b4c', 2, 'T');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('104bf226-cc8d-413c-aa6c-097e03f7f2d3', '53e41070-f0a3-460d-8d2c-7aa68aa20b4c', 3, 'W');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('53e41070-f0a3-460d-8d2c-7aa68aa20b4c', 'ee51b638-1f54-4851-a7ee-7e923e09bf2e', 'This is the alphabet in reverse order; after W comes V.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('54597301-ccbc-4c93-86a9-1dcfff5a181c', '72786397-f590-4413-aff8-724e5bf9826e', 14, 'Pen is to Write as Knife is to?', 'Reasoning', 'Series & Analogy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('958868d9-2980-4620-a811-22c5e65f62ab', '54597301-ccbc-4c93-86a9-1dcfff5a181c', 0, 'Cut');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac850a6a-23c4-4f9c-b0d4-8c09aac3397b', '54597301-ccbc-4c93-86a9-1dcfff5a181c', 1, 'Sharp');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dba96b33-a4e6-4e44-9ae3-f93cb6b346bf', '54597301-ccbc-4c93-86a9-1dcfff5a181c', 2, 'Kitchen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec9077f0-94f4-4270-b383-4d27b8869077', '54597301-ccbc-4c93-86a9-1dcfff5a181c', 3, 'Blade');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('54597301-ccbc-4c93-86a9-1dcfff5a181c', '958868d9-2980-4620-a811-22c5e65f62ab', 'A pen''s primary function is to write; a knife''s primary function is to cut.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('621d4b0c-ac18-4d20-8220-ac65a4fe8578', '72786397-f590-4413-aff8-724e5bf9826e', 15, 'Find the odd one out: Delhi, Mumbai, Chennai, India.', 'Reasoning', 'Classification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ce9e5af-8132-4be7-a2ec-83cae37ddf09', '621d4b0c-ac18-4d20-8220-ac65a4fe8578', 0, 'Delhi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38b1da15-cb1f-4b6a-aaaf-e19713970236', '621d4b0c-ac18-4d20-8220-ac65a4fe8578', 1, 'Mumbai');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49aa0ba3-6dcf-41a6-a985-308f0f80ea5c', '621d4b0c-ac18-4d20-8220-ac65a4fe8578', 2, 'Chennai');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7a9ccd6-c6db-4d09-a6be-93a40bf3bd44', '621d4b0c-ac18-4d20-8220-ac65a4fe8578', 3, 'India');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('621d4b0c-ac18-4d20-8220-ac65a4fe8578', 'c7a9ccd6-c6db-4d09-a6be-93a40bf3bd44', 'India is a country; the others are all cities.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fce8552d-782f-416d-925b-493243027a38', '72786397-f590-4413-aff8-724e5bf9826e', 16, 'Find the odd one out: 121, 144, 169, 200.', 'Reasoning', 'Classification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76ac0ed2-f5c0-4857-b742-bafbc9042bc2', 'fce8552d-782f-416d-925b-493243027a38', 0, '121');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e2cac985-45eb-490f-b1de-27b4a0656556', 'fce8552d-782f-416d-925b-493243027a38', 1, '144');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('709b7491-5fed-42e6-910c-317d4ae8f48c', 'fce8552d-782f-416d-925b-493243027a38', 2, '169');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40116ea2-83b1-4c1e-9515-5b2db1a1d950', 'fce8552d-782f-416d-925b-493243027a38', 3, '200');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fce8552d-782f-416d-925b-493243027a38', '40116ea2-83b1-4c1e-9515-5b2db1a1d950', '121, 144, and 169 are perfect squares (11^2, 12^2, 13^2); 200 is not.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6e37a03c-e982-4274-accc-f9af7e460bb3', '72786397-f590-4413-aff8-724e5bf9826e', 17, 'Statements: All roses are flowers. Some flowers fade quickly. Conclusion: Some roses fade quickly. Is this valid?', 'Reasoning', 'Venn & Statement-Conclusion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68a7978c-0c5f-4262-bdcc-f85e35df28cc', '6e37a03c-e982-4274-accc-f9af7e460bb3', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00dd4a4d-a6da-4a94-996f-2a3c24989446', '6e37a03c-e982-4274-accc-f9af7e460bb3', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('350f12f2-66f3-4721-9070-7d6c52675b07', '6e37a03c-e982-4274-accc-f9af7e460bb3', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38d98f85-aac8-4abf-b618-ed5d5b4d09dd', '6e37a03c-e982-4274-accc-f9af7e460bb3', 3, 'Valid only if reversed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6e37a03c-e982-4274-accc-f9af7e460bb3', '00dd4a4d-a6da-4a94-996f-2a3c24989446', 'The flowers that fade quickly might not overlap with the flowers that are roses -- the conclusion isn''t guaranteed.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d4b382b0-321e-4e37-8022-35c739a1f4e2', '72786397-f590-4413-aff8-724e5bf9826e', 18, 'Two overlapping circles represent "Employed" and "Graduates." The overlapping region represents:', 'Reasoning', 'Venn & Statement-Conclusion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b93a603e-e2be-4675-9c80-ec345095fb60', 'd4b382b0-321e-4e37-8022-35c739a1f4e2', 0, 'People who are both employed and graduates');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb5f54cd-343a-413f-937d-3e2b9aa225ba', 'd4b382b0-321e-4e37-8022-35c739a1f4e2', 1, 'People who are neither employed nor graduates');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18397726-802e-4335-adf5-b9844ebadcb5', 'd4b382b0-321e-4e37-8022-35c739a1f4e2', 2, 'People who are only employed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7146f30-172b-4228-b4a1-df1f37ed72ea', 'd4b382b0-321e-4e37-8022-35c739a1f4e2', 3, 'People who are only graduates');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d4b382b0-321e-4e37-8022-35c739a1f4e2', 'b93a603e-e2be-4675-9c80-ec345095fb60', 'The overlapping region of a Venn diagram always represents members common to both sets.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('72e007bb-902e-4210-8e4b-54c41042309f', '72786397-f590-4413-aff8-724e5bf9826e', 19, 'Input: 50 apple 12 ball 77 cat. Step 1 arranges numbers in descending order, keeping words'' relative positions. What is the output?', 'Reasoning', 'Input-Output', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce67bfa0-968e-42d8-b927-5606c0cdd34b', '72e007bb-902e-4210-8e4b-54c41042309f', 0, '77 apple 50 ball 12 cat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b16ceb29-3510-47ab-8cea-675fd2f2506a', '72e007bb-902e-4210-8e4b-54c41042309f', 1, '12 apple 50 ball 77 cat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9af40ee0-a66b-4ee4-9e17-a809acca34fe', '72e007bb-902e-4210-8e4b-54c41042309f', 2, 'apple ball cat 77 50 12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('145bacf3-2d2e-43ff-9f79-9e58c59de050', '72e007bb-902e-4210-8e4b-54c41042309f', 3, '50 apple 12 ball 77 cat (unchanged)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('72e007bb-902e-4210-8e4b-54c41042309f', 'ce67bfa0-968e-42d8-b927-5606c0cdd34b', 'The numbers 50, 12, 77 are rearranged in descending order (77, 50, 12), keeping each word in its original relative slot.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('143a43e5-25f0-4ca8-a27c-41d0728e9d4d', '72786397-f590-4413-aff8-724e5bf9826e', 20, 'Using the same machine, Step 2 arranges the words in alphabetical order, keeping the Step 1 numbers attached to their original word. Given Step 1 was "77 apple 50 ball 12 cat", what is the Step 2 output?', 'Reasoning', 'Input-Output', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77be8c0d-5981-4f7a-84f1-626d4dd28cde', '143a43e5-25f0-4ca8-a27c-41d0728e9d4d', 0, '77 apple 50 ball 12 cat (unchanged)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ab3c642-ef08-405d-b021-5ef0b50b1265', '143a43e5-25f0-4ca8-a27c-41d0728e9d4d', 1, '12 apple 50 ball 77 cat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b4cb8841-f1c0-4391-a7ce-824be9ab4fa0', '143a43e5-25f0-4ca8-a27c-41d0728e9d4d', 2, 'apple 77 ball 50 cat 12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f32b7446-84a1-4155-b634-72ba842920de', '143a43e5-25f0-4ca8-a27c-41d0728e9d4d', 3, '50 apple 12 ball 77 cat');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('143a43e5-25f0-4ca8-a27c-41d0728e9d4d', '77be8c0d-5981-4f7a-84f1-626d4dd28cde', 'The words apple, ball, cat are already in alphabetical order, so Step 2 produces no change from Step 1.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');
