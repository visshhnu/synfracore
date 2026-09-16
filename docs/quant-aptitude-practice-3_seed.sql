-- ============================================================
-- Quantitative Aptitude — Practice Paper 3
-- Full-Length Practice Paper (20 questions, 15 minutes)
-- Marking: +1 correct / -0.25 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('61620444-7306-4773-a151-4bae4552c812', 'quant-aptitude-practice-3', 'Quantitative Aptitude Practice Paper 3', 'quant-aptitude', ARRAY['Quantitative Aptitude', 'Banking', 'SSC', 'Railways', 'State PSC']::TEXT[], 20, 'standard', true, 3, 15, 1, 0.25);

-- ── Section: Quantitative Aptitude (20 questions) — Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam's specific paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fba4842b-cc7c-4508-86a6-15c23dfe3fab', '61620444-7306-4773-a151-4bae4552c812', 1, 'Find the smallest 4-digit number divisible by 6.', 'Quantitative Aptitude', 'Number System', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ec3378b-07c3-424b-8f4b-7a7b3388baf2', 'fba4842b-cc7c-4508-86a6-15c23dfe3fab', 0, '1002');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64fe8b93-9433-4fd6-8343-a0b8d9f8e717', 'fba4842b-cc7c-4508-86a6-15c23dfe3fab', 1, '1000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbd997f9-24c9-4537-b636-0d92c68fef28', 'fba4842b-cc7c-4508-86a6-15c23dfe3fab', 2, '1004');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e5e3275-d8cc-42a8-8b3f-45309df80f96', 'fba4842b-cc7c-4508-86a6-15c23dfe3fab', 3, '1006');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fba4842b-cc7c-4508-86a6-15c23dfe3fab', '9ec3378b-07c3-424b-8f4b-7a7b3388baf2', '1000/6 = 166.67; next multiple of 6 is 167x6 = 1002.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b44a73c8-8e2c-4d9c-a9f7-0200f1b94866', '61620444-7306-4773-a151-4bae4552c812', 2, 'Simplify: 45% of 300 - 15% of 200.', 'Quantitative Aptitude', 'Simplification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c653c927-c134-40ba-976d-eda34768bb00', 'b44a73c8-8e2c-4d9c-a9f7-0200f1b94866', 0, '105');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ea6b39d-d639-4739-bb04-b3048465d6e1', 'b44a73c8-8e2c-4d9c-a9f7-0200f1b94866', 1, '110');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18de3775-881a-4f9d-aa11-c2713efa91e7', 'b44a73c8-8e2c-4d9c-a9f7-0200f1b94866', 2, '100');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c44279c-4512-4b10-8a7b-e71eb39b5342', 'b44a73c8-8e2c-4d9c-a9f7-0200f1b94866', 3, '120');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b44a73c8-8e2c-4d9c-a9f7-0200f1b94866', 'c653c927-c134-40ba-976d-eda34768bb00', '45% of 300=135; 15% of 200=30; difference = 105.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('54914018-8e84-4ecd-9ba6-73c708bbb129', '61620444-7306-4773-a151-4bae4552c812', 3, 'If 30% of a number is 90, find 50% of the same number.', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26800912-2083-4b7b-8514-d161d5c173a4', '54914018-8e84-4ecd-9ba6-73c708bbb129', 0, '150');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('acd24d6c-6201-4ce2-81b7-473d5adcbe1d', '54914018-8e84-4ecd-9ba6-73c708bbb129', 1, '120');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b161e14e-fb76-4eb7-a12d-2822350d1508', '54914018-8e84-4ecd-9ba6-73c708bbb129', 2, '180');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d2fb5ce-46d9-4a71-a1be-e8769b7462f5', '54914018-8e84-4ecd-9ba6-73c708bbb129', 3, '160');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('54914018-8e84-4ecd-9ba6-73c708bbb129', '26800912-2083-4b7b-8514-d161d5c173a4', 'Number = 90/0.3 = 300; 50% of 300 = 150.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fdbc3fe5-f5f4-4ff3-ac66-c5fb7c9b8935', '61620444-7306-4773-a151-4bae4552c812', 4, 'A man sells two articles at Rs. 1000 each -- one at 20% profit, the other at 20% loss. Find his overall profit or loss percentage.', 'Quantitative Aptitude', 'Profit & Loss', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6593f010-0cab-4a96-b850-c1886c68cb6a', 'fdbc3fe5-f5f4-4ff3-ac66-c5fb7c9b8935', 0, '4% loss');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7270b2c8-248c-4a2a-bcf9-c11826c80dad', 'fdbc3fe5-f5f4-4ff3-ac66-c5fb7c9b8935', 1, '4% profit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3e1b2f0-877b-48b9-9e3f-92ffc95218bc', 'fdbc3fe5-f5f4-4ff3-ac66-c5fb7c9b8935', 2, 'No profit no loss');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0894cb59-6d30-4ec4-a41f-855edbd61913', 'fdbc3fe5-f5f4-4ff3-ac66-c5fb7c9b8935', 3, '5% loss');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fdbc3fe5-f5f4-4ff3-ac66-c5fb7c9b8935', '6593f010-0cab-4a96-b850-c1886c68cb6a', 'CP1=1000/1.2=833.33, CP2=1000/0.8=1250; total CP=2083.33, total SP=2000; loss = 83.33, loss% = 4%.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bad2993f-3dbb-4dfb-b67a-d9b4fc337536', '61620444-7306-4773-a151-4bae4552c812', 5, 'Find the time required for a sum to double itself at 8% p.a. simple interest.', 'Quantitative Aptitude', 'Simple Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28154a37-c332-4c91-9555-3afb9ce0af05', 'bad2993f-3dbb-4dfb-b67a-d9b4fc337536', 0, '12.5 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f43b0c99-0444-473b-85d0-40e949a8d8a0', 'bad2993f-3dbb-4dfb-b67a-d9b4fc337536', 1, '10 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd376a3b-9d90-4b7c-9bf6-42f819956448', 'bad2993f-3dbb-4dfb-b67a-d9b4fc337536', 2, '15 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5d99d2f-612c-4848-8560-5c5e58186e79', 'bad2993f-3dbb-4dfb-b67a-d9b4fc337536', 3, '8 years');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bad2993f-3dbb-4dfb-b67a-d9b4fc337536', '28154a37-c332-4c91-9555-3afb9ce0af05', 'SI=P means P=Px8xT/100; T = 100/8 = 12.5 years.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('57dedb55-74b7-44af-974c-ee7ab1b13b47', '61620444-7306-4773-a151-4bae4552c812', 6, 'A sum becomes Rs. 1210 in 2 years at 10% p.a. compound interest. Find the sum.', 'Quantitative Aptitude', 'Compound Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80b4c7d7-9b92-41ce-b75d-63bb6fc0bf98', '57dedb55-74b7-44af-974c-ee7ab1b13b47', 0, 'Rs. 1000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cd177c7-7673-42e6-9d34-9ecac8440e74', '57dedb55-74b7-44af-974c-ee7ab1b13b47', 1, 'Rs. 1100');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f2f0cbe-43ac-47b3-8cb1-3de1feae4acd', '57dedb55-74b7-44af-974c-ee7ab1b13b47', 2, 'Rs. 1050');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12367809-3a7a-472a-a6d1-834efe46b850', '57dedb55-74b7-44af-974c-ee7ab1b13b47', 3, 'Rs. 950');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('57dedb55-74b7-44af-974c-ee7ab1b13b47', '80b4c7d7-9b92-41ce-b75d-63bb6fc0bf98', 'P = 1210/(1.1)^2 = 1210/1.21 = 1000.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d08ef275-f8c7-4ac4-a42a-bbdd63ffc7e0', '61620444-7306-4773-a151-4bae4552c812', 7, 'A, B, C can complete a work in 6, 8, 12 days respectively. Find the time for all three working together.', 'Quantitative Aptitude', 'Time & Work', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a208d337-5e1a-4154-835b-636f2714d4a3', 'd08ef275-f8c7-4ac4-a42a-bbdd63ffc7e0', 0, '8/3 days (approx 2.67 days)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc8b449d-2609-4a0f-9b0a-fdf1c55659b8', 'd08ef275-f8c7-4ac4-a42a-bbdd63ffc7e0', 1, '3 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e7faee4-5340-4b2e-a69a-23e9b866aac6', 'd08ef275-f8c7-4ac4-a42a-bbdd63ffc7e0', 2, '2.5 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('006bdc71-3589-442b-a97e-173c0ab12c22', 'd08ef275-f8c7-4ac4-a42a-bbdd63ffc7e0', 3, '3.5 days');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d08ef275-f8c7-4ac4-a42a-bbdd63ffc7e0', 'a208d337-5e1a-4154-835b-636f2714d4a3', 'Combined rate = 1/6+1/8+1/12 = 9/24 = 3/8; time = 8/3 days.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('49c43218-7145-42a1-8062-3bdc3fc93473', '61620444-7306-4773-a151-4bae4552c812', 8, 'Convert a speed of 90 km/h into m/s.', 'Quantitative Aptitude', 'Time, Speed & Distance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f15df46f-e988-4ef5-bf3f-4190e75d1c70', '49c43218-7145-42a1-8062-3bdc3fc93473', 0, '25 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e80f13d2-5e18-40c0-bf42-c09bf819af6d', '49c43218-7145-42a1-8062-3bdc3fc93473', 1, '20 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('439c1c55-c316-4f05-ac56-eb1e43ff4485', '49c43218-7145-42a1-8062-3bdc3fc93473', 2, '30 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f773ae77-25c0-4a49-adfd-e2b907e9b381', '49c43218-7145-42a1-8062-3bdc3fc93473', 3, '22.5 m/s');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('49c43218-7145-42a1-8062-3bdc3fc93473', 'f15df46f-e988-4ef5-bf3f-4190e75d1c70', '90 x 5/18 = 25 m/s.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('588f7054-d5be-4294-a18e-836bb5aea3cc', '61620444-7306-4773-a151-4bae4552c812', 9, 'Average age of a class of 20 students is 15 years. Including the teacher, the average becomes 16 years. Find the teacher''s age.', 'Quantitative Aptitude', 'Averages', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6366b70d-3193-4427-bfb6-3c3d29d83af1', '588f7054-d5be-4294-a18e-836bb5aea3cc', 0, '36 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1aff73d-c693-4dfb-9773-e6446e1911d4', '588f7054-d5be-4294-a18e-836bb5aea3cc', 1, '40 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a2441ea-d6f7-4650-ac09-833643cba01a', '588f7054-d5be-4294-a18e-836bb5aea3cc', 2, '35 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ab7e643-0c18-4c93-a79a-120ac0aca1a2', '588f7054-d5be-4294-a18e-836bb5aea3cc', 3, '38 years');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('588f7054-d5be-4294-a18e-836bb5aea3cc', '6366b70d-3193-4427-bfb6-3c3d29d83af1', 'Students total = 300; new total (21 people) = 21x16 = 336; teacher''s age = 336-300 = 36.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bbf67f62-4802-4175-ac56-bc5c799ea371', '61620444-7306-4773-a151-4bae4552c812', 10, 'Two numbers are in the ratio 4:5. If each is increased by 10, the ratio becomes 5:6. Find the numbers.', 'Quantitative Aptitude', 'Ratio & Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c46c1d8-0f02-4761-9989-233da80cdcab', 'bbf67f62-4802-4175-ac56-bc5c799ea371', 0, '40 and 50');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5653ed9f-a7fb-4bfb-bf21-67c849759c28', 'bbf67f62-4802-4175-ac56-bc5c799ea371', 1, '30 and 40');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('475a3963-2ff1-45e4-9644-794e4bcf6966', 'bbf67f62-4802-4175-ac56-bc5c799ea371', 2, '44 and 55');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4fde709a-8fde-4173-8fa8-3b06e9d649c7', 'bbf67f62-4802-4175-ac56-bc5c799ea371', 3, '36 and 45');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bbf67f62-4802-4175-ac56-bc5c799ea371', '7c46c1d8-0f02-4761-9989-233da80cdcab', 'Let numbers be 4x,5x. (4x+10)/(5x+10)=5/6 gives x=10; numbers = 40, 50.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('17c812f4-e4be-47a6-9f83-d36e84736505', '61620444-7306-4773-a151-4bae4552c812', 11, 'Find the number that doesn''t fit the pattern: 3, 6, 9, 15, 24, 38.', 'Quantitative Aptitude', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce2b4770-73a7-4a47-8178-7ce043ca6407', '17c812f4-e4be-47a6-9f83-d36e84736505', 0, '38');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e30fe866-a878-4bf5-badf-11d9c94f924c', '17c812f4-e4be-47a6-9f83-d36e84736505', 1, '24');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4fdfd5a-cc42-4eec-b6c4-888acf91f237', '17c812f4-e4be-47a6-9f83-d36e84736505', 2, '15');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('393ab5d6-e3f8-4e74-8ba0-83c7343db9d8', '17c812f4-e4be-47a6-9f83-d36e84736505', 3, '9');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('17c812f4-e4be-47a6-9f83-d36e84736505', 'ce2b4770-73a7-4a47-8178-7ce043ca6407', 'Pattern is each term = sum of previous two (Fibonacci-like): 3,6,9,15,24, then 15+24=39, not 38 -- 38 is the outlier.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('146dea38-cd38-424e-ba1f-2b487b023be3', '61620444-7306-4773-a151-4bae4552c812', 12, 'A pie chart shows 25% of students prefer Math out of 200 total students. How many prefer Math?', 'Quantitative Aptitude', 'Data Interpretation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d05e68d-4179-4126-a2b3-2d6b73dd3141', '146dea38-cd38-424e-ba1f-2b487b023be3', 0, '50');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9328b16b-e5c3-467f-b511-8af5723afef7', '146dea38-cd38-424e-ba1f-2b487b023be3', 1, '40');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5db0b81e-af6a-4266-af1e-73dc5fac3188', '146dea38-cd38-424e-ba1f-2b487b023be3', 2, '60');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83ae9c1d-d47e-4bca-a472-7bdb51b1cc1b', '146dea38-cd38-424e-ba1f-2b487b023be3', 3, '45');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('146dea38-cd38-424e-ba1f-2b487b023be3', '5d05e68d-4179-4126-a2b3-2d6b73dd3141', '25% of 200 = 50.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a8f41f97-af61-4ecb-9390-b2617279dcca', '61620444-7306-4773-a151-4bae4552c812', 13, 'Find the unit digit of 7^45.', 'Quantitative Aptitude', 'Number System', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f68691b7-90f2-42c5-a118-9ab05f945113', 'a8f41f97-af61-4ecb-9390-b2617279dcca', 0, '7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80316345-cf3a-4f1d-82a7-22f0bc4d8159', 'a8f41f97-af61-4ecb-9390-b2617279dcca', 1, '9');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e2f02ea2-2abd-46d6-ae11-e2e6f34b8cc4', 'a8f41f97-af61-4ecb-9390-b2617279dcca', 2, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23c7647e-b4a0-4e45-8e6e-8b5da6f1c3eb', 'a8f41f97-af61-4ecb-9390-b2617279dcca', 3, '1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a8f41f97-af61-4ecb-9390-b2617279dcca', 'f68691b7-90f2-42c5-a118-9ab05f945113', 'Unit digits of 7 cycle every 4: 7,9,3,1. 45 mod 4 = 1, so unit digit = 7 (first in the cycle).', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2d39f7f3-ec9d-41dc-8409-036f785d30bf', '61620444-7306-4773-a151-4bae4552c812', 14, 'The population of a town increases by 10% annually. If the current population is 22000, find the population 1 year ago.', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d158a11e-d6b9-43f3-bb60-ba0ed6845717', '2d39f7f3-ec9d-41dc-8409-036f785d30bf', 0, '20000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2fbe36b7-2d91-497c-af0f-f25a66acb3c3', '2d39f7f3-ec9d-41dc-8409-036f785d30bf', 1, '21000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08fb8f2b-ff38-4083-8301-def937da87dc', '2d39f7f3-ec9d-41dc-8409-036f785d30bf', 2, '19000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae6f832f-c875-471c-9201-e568007e6b61', '2d39f7f3-ec9d-41dc-8409-036f785d30bf', 3, '20500');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2d39f7f3-ec9d-41dc-8409-036f785d30bf', 'd158a11e-d6b9-43f3-bb60-ba0ed6845717', '22000/1.1 = 20000.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5847d7ac-2fac-4005-96f8-c4dc276ec683', '61620444-7306-4773-a151-4bae4552c812', 15, 'A retailer buys 20 pens for Rs. 200 and sells them at Rs. 12 each. Find the profit percentage.', 'Quantitative Aptitude', 'Profit & Loss', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('197fd424-dbc9-4dc6-9c38-56456cf80f8a', '5847d7ac-2fac-4005-96f8-c4dc276ec683', 0, '20%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b66e4131-fe8f-4a33-8047-08caf1f31caa', '5847d7ac-2fac-4005-96f8-c4dc276ec683', 1, '15%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2772c1e9-e6e7-4ac5-b99a-d9e32a7dd0f8', '5847d7ac-2fac-4005-96f8-c4dc276ec683', 2, '25%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce8ddc6d-d496-4395-b3e1-c10fbee5291c', '5847d7ac-2fac-4005-96f8-c4dc276ec683', 3, '18%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5847d7ac-2fac-4005-96f8-c4dc276ec683', '197fd424-dbc9-4dc6-9c38-56456cf80f8a', 'CP/pen = 10, SP/pen = 12; profit = 2; profit% = 20%.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('51cd15e0-f451-4360-af96-703d1685664e', '61620444-7306-4773-a151-4bae4552c812', 16, 'Find the CI on Rs. 8000 for 1 year at 10% p.a., compounded half-yearly.', 'Quantitative Aptitude', 'Compound Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b799b7ee-6409-40fc-b5bc-7840575396c4', '51cd15e0-f451-4360-af96-703d1685664e', 0, 'Rs. 820');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('956f862c-0393-4069-aa15-16ed1e0f0305', '51cd15e0-f451-4360-af96-703d1685664e', 1, 'Rs. 800');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('efd3ca23-6922-420d-b3bb-b9e728e549ef', '51cd15e0-f451-4360-af96-703d1685664e', 2, 'Rs. 840');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f66521e-e4e1-44f3-9f78-322d2d34e805', '51cd15e0-f451-4360-af96-703d1685664e', 3, 'Rs. 880');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('51cd15e0-f451-4360-af96-703d1685664e', 'b799b7ee-6409-40fc-b5bc-7840575396c4', 'Rate/half-year = 5%, 2 periods; Amount = 8000x1.05^2 = 8820; CI = 820.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2b42cb3a-a92a-4656-847a-d7846d0048ac', '61620444-7306-4773-a151-4bae4552c812', 17, 'The average of 6 consecutive numbers is 15.5. Find the largest number.', 'Quantitative Aptitude', 'Averages', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('863c35ad-8c12-44f1-99aa-1a15b4694b34', '2b42cb3a-a92a-4656-847a-d7846d0048ac', 0, '18');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba763790-f112-4939-88c2-a360c131ae85', '2b42cb3a-a92a-4656-847a-d7846d0048ac', 1, '17');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e60f8cf5-4519-431b-bb4f-b254b43dcdf9', '2b42cb3a-a92a-4656-847a-d7846d0048ac', 2, '19');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f769b02d-154a-4c7a-abf8-1a2bac0a6d37', '2b42cb3a-a92a-4656-847a-d7846d0048ac', 3, '20');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2b42cb3a-a92a-4656-847a-d7846d0048ac', '863c35ad-8c12-44f1-99aa-1a15b4694b34', 'Numbers n to n+5 average to n+2.5=15.5, so n=13; largest = 18.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8cd39a2f-5b1d-4fe0-8c61-e09c8039fb25', '61620444-7306-4773-a151-4bae4552c812', 18, 'A sum of Rs. 2700 is divided among A, B, C in the ratio 2:3:4. Find C''s share.', 'Quantitative Aptitude', 'Ratio & Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45df55cd-4164-4248-a735-9db574a5014a', '8cd39a2f-5b1d-4fe0-8c61-e09c8039fb25', 0, 'Rs. 1200');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f35bdc34-87ed-4e3b-99cf-7a20ec4bbc1e', '8cd39a2f-5b1d-4fe0-8c61-e09c8039fb25', 1, 'Rs. 1000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5ffe0d4-2bb5-4dda-abe5-5bcad36ca990', '8cd39a2f-5b1d-4fe0-8c61-e09c8039fb25', 2, 'Rs. 1100');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d05b9c5-c353-4fc3-9b41-634d8ffc5cf5', '8cd39a2f-5b1d-4fe0-8c61-e09c8039fb25', 3, 'Rs. 1300');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8cd39a2f-5b1d-4fe0-8c61-e09c8039fb25', '45df55cd-4164-4248-a735-9db574a5014a', '9 parts = 2700, each = 300; C''s share = 4x300 = 1200.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3319d97c-0b90-4c7b-b78d-14a43641b6f3', '61620444-7306-4773-a151-4bae4552c812', 19, '15 workers can complete a task in 20 days. After 5 days, 5 more workers join. Find the total time to complete the work.', 'Quantitative Aptitude', 'Time & Work', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c778b14-0764-43c5-87fb-f24fea69f6cc', '3319d97c-0b90-4c7b-b78d-14a43641b6f3', 0, '16.25 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67c14f5f-1d9b-4b7a-a61c-52b474064a5d', '3319d97c-0b90-4c7b-b78d-14a43641b6f3', 1, '15 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0bdc6494-c076-4c06-b923-837b61c837ba', '3319d97c-0b90-4c7b-b78d-14a43641b6f3', 2, '17 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36480721-b687-4293-825b-645591cfb5ca', '3319d97c-0b90-4c7b-b78d-14a43641b6f3', 3, '18 days');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3319d97c-0b90-4c7b-b78d-14a43641b6f3', '2c778b14-0764-43c5-87fb-f24fea69f6cc', 'Total work = 300 man-days; 5 days by 15 workers = 75; remaining = 225; with 20 workers, remaining time = 11.25 days; total = 16.25 days.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e8f17b12-c673-43f7-b67c-9964946a9d0c', '61620444-7306-4773-a151-4bae4552c812', 20, 'A train travels at 60 km/h and covers a distance in 45 minutes. Find the distance.', 'Quantitative Aptitude', 'Time, Speed & Distance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c05ee3e7-63d3-4eae-8d32-2a2bc67cfc50', 'e8f17b12-c673-43f7-b67c-9964946a9d0c', 0, '45 km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('587dae99-7340-4166-8fed-21b302afad7c', 'e8f17b12-c673-43f7-b67c-9964946a9d0c', 1, '50 km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d04e0c5d-0701-46a8-8864-240689163a52', 'e8f17b12-c673-43f7-b67c-9964946a9d0c', 2, '40 km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce529df3-b598-4df8-84c7-283788cc3cc3', 'e8f17b12-c673-43f7-b67c-9964946a9d0c', 3, '48 km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e8f17b12-c673-43f7-b67c-9964946a9d0c', 'c05ee3e7-63d3-4eae-8d32-2a2bc67cfc50', 'Distance = 60 x (45/60) = 45 km.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');
