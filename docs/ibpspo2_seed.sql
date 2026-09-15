-- ============================================================
-- IBPS PO Prelims — Full Mock Paper 2
-- Full-Length Practice Paper (67 questions, 40 minutes)
-- Marking: +1 correct / -0.25 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('c15977cb-918c-49e3-94ee-e9b75f2d12b2', 'ibps-po-prelims-practice-2', 'IBPS PO Prelims Full Mock Paper 2', 'ibps-po', ARRAY['Reasoning', 'Quantitative Aptitude', 'English', 'IBPS PO', 'Prelims']::TEXT[], 67, 'mixed', true, 2, 40, 1, 0.25);

-- ── Section: Reasoning Ability (25 questions) — Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e8c3cf2a-c945-4a20-9313-2a5919751de7', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 1, 'Six friends A, B, C, D, E, F sit around a circular table facing the center. B sits second to the right of A. D sits immediately left of B. Who sits immediately right of A?', 'Reasoning', 'Seating Arrangement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab5dc898-ff3e-4bac-bdbe-84e0a9472390', 'e8c3cf2a-c945-4a20-9313-2a5919751de7', 0, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba772633-bb1d-46c4-9cdd-a55ae675e471', 'e8c3cf2a-c945-4a20-9313-2a5919751de7', 1, 'D');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65bb9703-aad9-4d25-8eb1-9350b1247fea', 'e8c3cf2a-c945-4a20-9313-2a5919751de7', 2, 'E');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42279959-2daf-4d9b-bed0-c7285bbd159d', 'e8c3cf2a-c945-4a20-9313-2a5919751de7', 3, 'Cannot be determined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e8c3cf2a-c945-4a20-9313-2a5919751de7', '42279959-2daf-4d9b-bed0-c7285bbd159d', 'The given information (B''s position relative to A, D immediately left of B) doesn''t uniquely fix who sits immediately right of A among the remaining unplaced friends — more constraints would be needed.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('80d25a7a-3e65-4f3f-bd67-add08f9713e6', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 2, 'Statements: All books are papers. No paper is plastic. Conclusion: No book is plastic. Is this valid?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23de9e55-7dc3-40aa-a0e8-773eaed9a651', '80d25a7a-3e65-4f3f-bd67-add08f9713e6', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abb60aad-8932-4b4d-8fbe-f63a9995cfd2', '80d25a7a-3e65-4f3f-bd67-add08f9713e6', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc373583-f1f5-422f-8bd6-d06116d1483f', '80d25a7a-3e65-4f3f-bd67-add08f9713e6', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b664d8ae-0bb3-45e4-afe4-638e1634dd67', '80d25a7a-3e65-4f3f-bd67-add08f9713e6', 3, 'Partially valid');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('80d25a7a-3e65-4f3f-bd67-add08f9713e6', '23de9e55-7dc3-40aa-a0e8-773eaed9a651', 'If all books are papers, and no paper is plastic, then no book can be plastic — a valid syllogistic conclusion (transitive negative).', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fbc28cbe-5bf1-4764-a5ed-56ddf8650994', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 3, 'Statements: P > Q ≥ R > S. Conclusion: P > S. Is this valid?', 'Reasoning', 'Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff60a088-6147-4bde-ac92-d4499390014f', 'fbc28cbe-5bf1-4764-a5ed-56ddf8650994', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6dd798ce-ba8d-4849-a5e1-70888079b1d9', 'fbc28cbe-5bf1-4764-a5ed-56ddf8650994', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('128c9703-c5d7-4f78-9cf6-7c21b2c0525d', 'fbc28cbe-5bf1-4764-a5ed-56ddf8650994', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09e2096a-7302-4a2e-a2d4-c895f64ed96a', 'fbc28cbe-5bf1-4764-a5ed-56ddf8650994', 3, 'Ambiguous');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fbc28cbe-5bf1-4764-a5ed-56ddf8650994', 'ff60a088-6147-4bde-ac92-d4499390014f', 'P > Q ≥ R > S establishes P is strictly greater than S transitively through the chain — a valid conclusion.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('aeba2563-05d9-47f7-b927-5e319bc38ec4', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 4, 'In a code, ''FLOWER'' is written as ''GMPXFS'' (each letter shifted forward by 1). How is ''GARDEN'' written in the same code?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9557726-6bc4-4184-8a41-f9118fd667cf', 'aeba2563-05d9-47f7-b927-5e319bc38ec4', 0, 'HBSEFO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63944047-b4c1-4597-801c-0b74f7cfabd7', 'aeba2563-05d9-47f7-b927-5e319bc38ec4', 1, 'HBSEFP');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6813fab9-b1e3-4309-bc99-1766306ccd49', 'aeba2563-05d9-47f7-b927-5e319bc38ec4', 2, 'HBSDFO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24e84c8d-fbd3-4a9f-871a-3e3f705344a7', 'aeba2563-05d9-47f7-b927-5e319bc38ec4', 3, 'GBSEFO');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aeba2563-05d9-47f7-b927-5e319bc38ec4', 'a9557726-6bc4-4184-8a41-f9118fd667cf', 'Shifting each letter forward by 1: G→H, A→B, R→S, D→E, E→F, N→O, giving HBSEFO.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('95149164-0d23-409d-8896-eab504b4243a', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 5, 'A woman introduces a man as ''the son of my husband''s mother.'' How is the man related to the woman, if he is not her son?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ee09979-5557-4352-a689-6e001a6c5bd5', '95149164-0d23-409d-8896-eab504b4243a', 0, 'Brother-in-law');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0939afed-40d6-4bdb-98f2-0d7c71b0744b', '95149164-0d23-409d-8896-eab504b4243a', 1, 'Husband');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f60a2b1c-2d26-44d0-8b45-c24c92a9fba3', '95149164-0d23-409d-8896-eab504b4243a', 2, 'Son');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76e50519-2971-43c2-ae5f-ab7ac5496dff', '95149164-0d23-409d-8896-eab504b4243a', 3, 'Father');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('95149164-0d23-409d-8896-eab504b4243a', '4ee09979-5557-4352-a689-6e001a6c5bd5', 'The son of the woman''s husband''s mother is the husband''s brother (or the husband himself) — since the man is stated not to be her son, he''s her husband''s brother, i.e., her brother-in-law.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7243e81e-afd9-4c81-b6dc-20db2af2dce3', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 6, 'Point A is 5m north of Point B. Point C is 12m east of Point A. What is the distance between B and C?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96be56ad-e792-4f66-94ab-686dbe9d9c98', '7243e81e-afd9-4c81-b6dc-20db2af2dce3', 0, '10m');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d72cd1c-5d5a-44b9-9457-7839ecb1fcf3', '7243e81e-afd9-4c81-b6dc-20db2af2dce3', 1, '13m');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a6442a8-98ad-4edd-9f6b-d51359e37ce9', '7243e81e-afd9-4c81-b6dc-20db2af2dce3', 2, '15m');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4af66543-b0a6-47df-bb3e-8285a969c7ae', '7243e81e-afd9-4c81-b6dc-20db2af2dce3', 3, '17m');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7243e81e-afd9-4c81-b6dc-20db2af2dce3', '0d72cd1c-5d5a-44b9-9457-7839ecb1fcf3', 'This forms a right triangle with legs 5m and 12m; distance = sqrt(5²+12²) = sqrt(169) = 13m.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2368fec4-b89f-4ccf-9efc-4b503a6b0db4', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 7, 'In a row of 25 students, Priya is 8th from the left. What is her position from the right?', 'Reasoning', 'Ranking', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30d83977-d1ad-4e2d-b488-ed51eebe81ca', '2368fec4-b89f-4ccf-9efc-4b503a6b0db4', 0, '17');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4fc3ddac-0560-4ddd-9842-8ab840136cea', '2368fec4-b89f-4ccf-9efc-4b503a6b0db4', 1, '18');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7403c8d-5f95-4a0e-8118-719822228edd', '2368fec4-b89f-4ccf-9efc-4b503a6b0db4', 2, '19');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df314b2e-cbcc-483c-a5dc-b090ffd61e8a', '2368fec4-b89f-4ccf-9efc-4b503a6b0db4', 3, '16');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2368fec4-b89f-4ccf-9efc-4b503a6b0db4', '4fc3ddac-0560-4ddd-9842-8ab840136cea', 'Position from right = total - position from left + 1 = 25 - 8 + 1 = 18.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7e6b9a71-9f9f-43a3-a338-a757e77bea6f', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 8, 'Five people P, Q, R, S, T live on 5 different floors (1 to 5) of a building. P lives above Q. R lives on floor 3. Q lives on floor 1. Which floor does P live on if P is directly above Q?', 'Reasoning', 'Puzzle — Floors', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a99041d-0eea-4978-888e-fb51c5866dfb', '7e6b9a71-9f9f-43a3-a338-a757e77bea6f', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4dd690bf-a843-4e3e-a1d8-54f512110077', '7e6b9a71-9f9f-43a3-a338-a757e77bea6f', 1, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c40c078f-3990-4192-a2ee-ab0e92e0bf8c', '7e6b9a71-9f9f-43a3-a338-a757e77bea6f', 2, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7b97d9d-3c88-41dd-939e-a8bcfa30616b', '7e6b9a71-9f9f-43a3-a338-a757e77bea6f', 3, 'Cannot be determined precisely without more clues, but must be above floor 1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7e6b9a71-9f9f-43a3-a338-a757e77bea6f', '8a99041d-0eea-4978-888e-fb51c5866dfb', '''Directly above Q'' (floor 1) means P is on floor 2, the floor immediately above.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('96054ce3-eabf-41a5-a888-707a2a29d17e', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 9, 'Statements: Some teachers are writers. All writers are readers. Conclusion: Some teachers are readers. Is this valid?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3612a0ab-92c2-4d9a-a0d0-d312bb8ad3f0', '96054ce3-eabf-41a5-a888-707a2a29d17e', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7a2bca1-0b9d-42a2-86e8-f80a08f2fbe5', '96054ce3-eabf-41a5-a888-707a2a29d17e', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('226bca89-826e-4007-a3e9-3b236689758c', '96054ce3-eabf-41a5-a888-707a2a29d17e', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9cc57905-7164-4525-bb21-5c639dd577c0', '96054ce3-eabf-41a5-a888-707a2a29d17e', 3, 'Ambiguous');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('96054ce3-eabf-41a5-a888-707a2a29d17e', '3612a0ab-92c2-4d9a-a0d0-d312bb8ad3f0', 'If some teachers are writers, and all writers are readers, then those specific teacher-writers are also readers — making ''some teachers are readers'' a valid conclusion.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2874dbe3-6024-4e02-a13b-3c8848138c50', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 10, 'In the series 3, F, 9, J, 15, N, 21, ?, what comes next?', 'Reasoning', 'Alphanumeric Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('671cba8c-877c-4cf0-91a3-8a3d278e8b0a', '2874dbe3-6024-4e02-a13b-3c8848138c50', 0, 'P');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e84538f3-2cbd-43c9-92f2-001f1bc352ec', '2874dbe3-6024-4e02-a13b-3c8848138c50', 1, 'Q');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e9379ab-480e-4de2-83c8-fd8bc4267598', '2874dbe3-6024-4e02-a13b-3c8848138c50', 2, 'R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7d8232f-9ca2-4a87-9e1b-7c1218f0cd34', '2874dbe3-6024-4e02-a13b-3c8848138c50', 3, 'S');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2874dbe3-6024-4e02-a13b-3c8848138c50', '4e9379ab-480e-4de2-83c8-fd8bc4267598', 'The numbers increase by 6 each time (3, 9, 15, 21); the letters are every 4th letter (F=6th, J=10th, N=14th letter of the alphabet), so the next letter is the 18th letter, R.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('72685870-d5fd-4c1f-98b9-95f6fc27b46e', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 11, 'Walking 10km south, then 10km west, then 10km north, a man reaches a point. How far and in which direction is he from his starting point?', 'Reasoning', 'Distance and Direction', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5cdc8ce1-81c6-4897-ac85-50ce718a705a', '72685870-d5fd-4c1f-98b9-95f6fc27b46e', 0, '10km west');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b83f406-b0eb-454b-ba1c-6a15ce85dcf2', '72685870-d5fd-4c1f-98b9-95f6fc27b46e', 1, '10km east');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1129fd12-0327-48cc-bf6f-6a5d05cf902e', '72685870-d5fd-4c1f-98b9-95f6fc27b46e', 2, '20km west');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68e0b1fe-72e4-4631-929b-4a16a78475d2', '72685870-d5fd-4c1f-98b9-95f6fc27b46e', 3, '10km south');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('72685870-d5fd-4c1f-98b9-95f6fc27b46e', '5cdc8ce1-81c6-4897-ac85-50ce718a705a', 'The south and north legs (10km each) cancel out, leaving only the 10km westward displacement.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('75b210fb-25ab-4adf-a4f1-073cede95062', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 12, 'Among 5 friends, A is taller than B but shorter than C. D is taller than C. E is shorter than B. Who is the tallest?', 'Reasoning', 'Order and Ranking', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb1ff8de-c62c-4a12-add4-f387ef680fbf', '75b210fb-25ab-4adf-a4f1-073cede95062', 0, 'A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50c14e86-169d-4341-b83f-63b12d7bc3a9', '75b210fb-25ab-4adf-a4f1-073cede95062', 1, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('709c991c-1257-4d8c-b908-84a976990eb8', '75b210fb-25ab-4adf-a4f1-073cede95062', 2, 'D');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3174296-73e7-4bf8-b9ff-f3b816c350e0', '75b210fb-25ab-4adf-a4f1-073cede95062', 3, 'E');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('75b210fb-25ab-4adf-a4f1-073cede95062', '709c991c-1257-4d8c-b908-84a976990eb8', 'The order from the given clues: D > C > A > B > E, making D the tallest.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fc082e25-4092-4778-8a4b-05b988ebf9a9', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 13, 'If ''A $ B'' means A is greater than B, and ''A # B'' means A is less than B, and it is given that Y $ X and X # Z, then which of the following is true?', 'Reasoning', 'Coded Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a67f0220-ddbf-4d20-99fb-16bba049e96d', 'fc082e25-4092-4778-8a4b-05b988ebf9a9', 0, 'X is the smallest of the three');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f45be109-7eb6-42a0-a8aa-32ae3ad0f0e5', 'fc082e25-4092-4778-8a4b-05b988ebf9a9', 1, 'X is the largest of the three');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73b05d4a-96be-4056-bc0b-7599c999e580', 'fc082e25-4092-4778-8a4b-05b988ebf9a9', 2, 'Y is the smallest of the three');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b2f58b0-1f98-499e-bfb1-f51c19fad0b2', 'fc082e25-4092-4778-8a4b-05b988ebf9a9', 3, 'Cannot be determined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fc082e25-4092-4778-8a4b-05b988ebf9a9', 'a67f0220-ddbf-4d20-99fb-16bba049e96d', 'Y $ X means Y > X; X # Z means X < Z. So both Y and Z are greater than X, making X the smallest of the three.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('772e9a81-8faf-416f-a8f1-64ae1d39f3a3', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 14, 'Introducing a boy, a girl said, ''His mother is the only daughter of my mother.'' How is the girl related to the boy?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00804282-cb45-4758-af16-42766f76f579', '772e9a81-8faf-416f-a8f1-64ae1d39f3a3', 0, 'Mother');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a927a06-201b-4bb9-92bb-428d20ac9e2d', '772e9a81-8faf-416f-a8f1-64ae1d39f3a3', 1, 'Sister');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31d553f3-7f74-4a67-b86e-6987ec642119', '772e9a81-8faf-416f-a8f1-64ae1d39f3a3', 2, 'Aunt');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('936a07cd-8a0a-44ae-b473-2115c1377c24', '772e9a81-8faf-416f-a8f1-64ae1d39f3a3', 3, 'Grandmother');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('772e9a81-8faf-416f-a8f1-64ae1d39f3a3', '00804282-cb45-4758-af16-42766f76f579', '''The only daughter of my mother'' is the girl herself — meaning the boy''s mother is the girl, making the girl the boy''s mother.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5f04eaa4-acef-4dbf-84bb-b46bfdbcad1e', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 15, 'P is 5 ranks ahead of Q in a class of 30. If Q''s rank from the bottom is 20, what is P''s rank from the top?', 'Reasoning', 'Number Ranking', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9383e42d-95d0-4782-9e14-7bdf241305c9', '5f04eaa4-acef-4dbf-84bb-b46bfdbcad1e', 0, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24c5f8c8-80f9-4667-9dec-2c60e7e98c36', '5f04eaa4-acef-4dbf-84bb-b46bfdbcad1e', 1, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e1e6e0c-b264-4e5a-8fdd-a3dc694a434c', '5f04eaa4-acef-4dbf-84bb-b46bfdbcad1e', 2, '7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2987510-f4ce-4184-9aef-f621ee8b574a', '5f04eaa4-acef-4dbf-84bb-b46bfdbcad1e', 3, '8');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5f04eaa4-acef-4dbf-84bb-b46bfdbcad1e', '24c5f8c8-80f9-4667-9dec-2c60e7e98c36', 'Q''s rank from top = 30-20+1 = 11; P is 5 ranks ahead (better), so P''s rank from top = 11-5 = 6.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f7581771-e9ea-4346-9c9f-de09dad5075f', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 16, 'Statements: All pens are pencils. All pencils are erasers. Conclusion: All pens are erasers. Is this valid?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92d9f85c-a6bd-4f32-8068-473519bc2ac8', 'f7581771-e9ea-4346-9c9f-de09dad5075f', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('986bbcdc-40d3-4395-89d2-cbed5f112838', 'f7581771-e9ea-4346-9c9f-de09dad5075f', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34197dac-9c72-4b37-811f-342d2cdb99eb', 'f7581771-e9ea-4346-9c9f-de09dad5075f', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('146797a0-f66a-4ad9-8031-60fd04169b61', 'f7581771-e9ea-4346-9c9f-de09dad5075f', 3, 'Ambiguous');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f7581771-e9ea-4346-9c9f-de09dad5075f', '92d9f85c-a6bd-4f32-8068-473519bc2ac8', 'A straightforward transitive chain — if all pens are pencils and all pencils are erasers, then all pens must be erasers.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ba523118-6029-4aa6-be53-a8e390a4a4c4', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 17, 'Seven people sit in a row. C sits in the middle. A sits at one end. If there are 3 people between A and C, how many people are between C and the other end?', 'Reasoning', 'Puzzle — Linear Arrangement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e4dcd02-980b-450b-b531-f30476cc0d07', 'ba523118-6029-4aa6-be53-a8e390a4a4c4', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aaceb22f-9ea8-4cd5-b3f1-c9b2de30a5fb', 'ba523118-6029-4aa6-be53-a8e390a4a4c4', 1, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d76544c6-76fb-419c-8c99-e0ac2535e38c', 'ba523118-6029-4aa6-be53-a8e390a4a4c4', 2, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d5ef61b-4751-49b1-ba95-527578c1057d', 'ba523118-6029-4aa6-be53-a8e390a4a4c4', 3, '0');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ba523118-6029-4aa6-be53-a8e390a4a4c4', '2e4dcd02-980b-450b-b531-f30476cc0d07', 'In a row of 7, position 4 is the middle (C). If A is at one end with 3 people between A and C, the other end has 7-4=3 positions, so 2 people between C and that end (excluding the end person itself).', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9a0d7c37-3bfc-4c70-b3c4-a6910a609553', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 18, 'A person starts from point X, walks 6km east to Y, then 8km north to Z. What is the shortest distance from X to Z?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bddab7ef-7c84-4104-a971-906357c8c456', '9a0d7c37-3bfc-4c70-b3c4-a6910a609553', 0, '10km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9b6fd4a-534d-4fed-95ea-50d48655735a', '9a0d7c37-3bfc-4c70-b3c4-a6910a609553', 1, '12km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0665a6db-f9bf-419c-8c76-5fea6b228d5f', '9a0d7c37-3bfc-4c70-b3c4-a6910a609553', 2, '14km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36205224-b4bd-45ea-9e10-90762276ea9e', '9a0d7c37-3bfc-4c70-b3c4-a6910a609553', 3, '16km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9a0d7c37-3bfc-4c70-b3c4-a6910a609553', 'bddab7ef-7c84-4104-a971-906357c8c456', 'Right triangle with legs 6 and 8; shortest distance = sqrt(6²+8²) = sqrt(100) = 10km.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('23578e86-3f5d-45ab-8919-7873bf95b340', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 19, 'If in a certain code ''TIGER'' is written as ''UJHFS'' (each letter shifted forward by 1), how is ''MOBILE'' written in the same code?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('595f26f3-2f7e-4571-840a-8bc11ccfedac', '23578e86-3f5d-45ab-8919-7873bf95b340', 0, 'NPCJMF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30d55239-a7fa-4a0a-b693-c087e19a6ed8', '23578e86-3f5d-45ab-8919-7873bf95b340', 1, 'NPBJMF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28934895-e822-4518-b58f-65d08f1e77f4', '23578e86-3f5d-45ab-8919-7873bf95b340', 2, 'NOCJMF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7a3a9d9-d94b-45e6-8f06-b5586a6be458', '23578e86-3f5d-45ab-8919-7873bf95b340', 3, 'MPCJMF');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('23578e86-3f5d-45ab-8919-7873bf95b340', '595f26f3-2f7e-4571-840a-8bc11ccfedac', 'Shifting each letter of MOBILE forward by 1: M→N, O→P, B→C, I→J, L→M, E→F, giving NPCJMF.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9f054a00-5f3d-4771-b961-23f135a3b414', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 20, 'Statements: No mango is an apple. Some apples are fruits. Conclusion: Some fruits are not mangoes. Is this valid?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1db27ee-c892-4501-a21b-c2929197fd31', '9f054a00-5f3d-4771-b961-23f135a3b414', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4298b0c-7f48-496c-a29c-f2fe43a00c9a', '9f054a00-5f3d-4771-b961-23f135a3b414', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c70d1402-2213-48ab-9112-cc44d3fca35b', '9f054a00-5f3d-4771-b961-23f135a3b414', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23b0e520-a7e7-4ded-a4ad-2c5db267945c', '9f054a00-5f3d-4771-b961-23f135a3b414', 3, 'Ambiguous');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9f054a00-5f3d-4771-b961-23f135a3b414', 'd1db27ee-c892-4501-a21b-c2929197fd31', 'Since some apples are fruits, and no mango is an apple, those specific apple-fruits cannot be mangoes — supporting ''some fruits are not mangoes'' as valid.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('18d937b4-2c5e-4762-875f-e1f566d85b05', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 21, 'If the day before yesterday was Wednesday, what day will it be tomorrow?', 'Reasoning', 'Puzzle — Days of Week', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e709b2a2-8dd9-4c7f-9fa6-69dc1bdd8689', '18d937b4-2c5e-4762-875f-e1f566d85b05', 0, 'Friday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64a7988d-a722-42b7-bfac-4a0b7d6bd309', '18d937b4-2c5e-4762-875f-e1f566d85b05', 1, 'Saturday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5cc5bb0-c498-44af-abd7-ec60adf01419', '18d937b4-2c5e-4762-875f-e1f566d85b05', 2, 'Sunday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f56fb44-ea81-477b-98a4-26371776e1b7', '18d937b4-2c5e-4762-875f-e1f566d85b05', 3, 'Thursday');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('18d937b4-2c5e-4762-875f-e1f566d85b05', '64a7988d-a722-42b7-bfac-4a0b7d6bd309', 'Day before yesterday = Wednesday means today is Friday; tomorrow is therefore Saturday.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6e3e9384-ed08-4353-a903-aef0bd7ecf10', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 22, 'In a queue, Ravi is 12th from the front and 18th from the back. How many people are in the queue?', 'Reasoning', 'Ranking — Reverse', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0f6501f-6e5c-4af5-abe6-32d77d389d43', '6e3e9384-ed08-4353-a903-aef0bd7ecf10', 0, '28');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c0c4fc2-6929-4569-8c44-b809017b3891', '6e3e9384-ed08-4353-a903-aef0bd7ecf10', 1, '29');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1fed1d55-b2b6-47f0-8b7a-6cebce3572a7', '6e3e9384-ed08-4353-a903-aef0bd7ecf10', 2, '30');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77808e9b-228e-4d00-9118-b5899d32cac8', '6e3e9384-ed08-4353-a903-aef0bd7ecf10', 3, '31');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6e3e9384-ed08-4353-a903-aef0bd7ecf10', '7c0c4fc2-6929-4569-8c44-b809017b3891', 'Total = (position from front) + (position from back) - 1 = 12+18-1 = 29.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b8a5f453-397e-4fca-a29d-25a404f8c852', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 23, 'A''s father is B. B''s sister is C. C''s daughter is D. How is D related to A?', 'Reasoning', 'Blood Relations — Complex', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1523c8f3-1ead-48e1-b27f-6238f9af0e26', 'b8a5f453-397e-4fca-a29d-25a404f8c852', 0, 'Sister');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee181ff2-7edb-4d02-8b6d-2e373b318e8c', 'b8a5f453-397e-4fca-a29d-25a404f8c852', 1, 'Cousin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68ee1902-13ca-49bb-acde-e83c7ffbfd50', 'b8a5f453-397e-4fca-a29d-25a404f8c852', 2, 'Aunt');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7406b938-5491-42b0-82b4-cd38906cfa5a', 'b8a5f453-397e-4fca-a29d-25a404f8c852', 3, 'Niece');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b8a5f453-397e-4fca-a29d-25a404f8c852', 'ee181ff2-7edb-4d02-8b6d-2e373b318e8c', 'C is A''s aunt (father''s sister); C''s daughter D is therefore A''s cousin.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cb7280ec-6594-4732-a590-1b054d829fa6', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 24, 'Find the missing term: AZ, CX, EV, GT, ?', 'Reasoning', 'Alphabet Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e77418c0-62fc-4deb-9b1a-67735dd716ea', 'cb7280ec-6594-4732-a590-1b054d829fa6', 0, 'IR');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('040fb650-dd2c-47a7-b076-8599887dab5c', 'cb7280ec-6594-4732-a590-1b054d829fa6', 1, 'IS');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1bbee0aa-8d17-4b0d-b6db-64a76227f605', 'cb7280ec-6594-4732-a590-1b054d829fa6', 2, 'HR');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f668de9-5ce9-4838-9e3d-0af302727f14', 'cb7280ec-6594-4732-a590-1b054d829fa6', 3, 'JR');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cb7280ec-6594-4732-a590-1b054d829fa6', 'e77418c0-62fc-4deb-9b1a-67735dd716ea', 'First letters advance by 2 (A,C,E,G,I); second letters retreat by 2 (Z,X,V,T,R) — giving IR.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('765bd934-b183-45fe-83b1-c8f4f842bca4', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 25, 'Five boxes P, Q, R, S, T are stacked with P at the top and T at the bottom. Q is above R. S is between Q and R. What is the order from top to bottom?', 'Reasoning', 'Puzzle — Box Arrangement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16901ae4-f935-43fd-9d15-4e45cbc5d6c8', '765bd934-b183-45fe-83b1-c8f4f842bca4', 0, 'P, Q, S, R, T');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79beb86d-8a1d-4d90-95a1-751c8b9113fd', '765bd934-b183-45fe-83b1-c8f4f842bca4', 1, 'P, Q, R, S, T');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e059d361-ddc2-48df-b33a-84ab51c3625c', '765bd934-b183-45fe-83b1-c8f4f842bca4', 2, 'P, S, Q, R, T');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e301dbe8-315b-4b55-888c-1150721c8893', '765bd934-b183-45fe-83b1-c8f4f842bca4', 3, 'Q, P, S, R, T');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('765bd934-b183-45fe-83b1-c8f4f842bca4', '16901ae4-f935-43fd-9d15-4e45cbc5d6c8', 'P is at top, T at bottom (given). Q above R, with S between them, gives the order P, Q, S, R, T.', 'Reasoning Ability — authored from standard IBPS PO Prelims reasoning topics (puzzles, seating arrangement, syllogism, coding-decoding, blood relations, direction sense, inequality, ranking); not copied from any official IBPS question paper.');

-- ── Section: Quantitative Aptitude (22 questions) — Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('78a38db4-78e2-49f2-990a-553e4f59815d', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 26, 'Simplify: (15 × 8) ÷ 4 + 12', 'Quantitative Aptitude', 'Simplification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08bfb372-ee0c-498f-8132-5cd3c3e612ab', '78a38db4-78e2-49f2-990a-553e4f59815d', 0, '36');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e6b292f-3a02-41cd-a448-7eff68bd456d', '78a38db4-78e2-49f2-990a-553e4f59815d', 1, '38');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('086ae184-dea3-442e-bee7-fac706665b2c', '78a38db4-78e2-49f2-990a-553e4f59815d', 2, '40');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a860a677-fd19-4b3f-a590-e62242708328', '78a38db4-78e2-49f2-990a-553e4f59815d', 3, '42');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('78a38db4-78e2-49f2-990a-553e4f59815d', 'a860a677-fd19-4b3f-a590-e62242708328', '(15×8)/4 + 12 = 120/4 + 12 = 30+12 = 42.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e8811945-cc36-4e05-b35c-b1f24b2deead', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 27, 'A student scores 350 out of 500 marks. What is his percentage?', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f3f6c5f1-6fbc-4f20-966f-6a7a9881ec71', 'e8811945-cc36-4e05-b35c-b1f24b2deead', 0, '65%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb938e84-72c4-47fd-b93f-eea3fe13cfb4', 'e8811945-cc36-4e05-b35c-b1f24b2deead', 1, '68%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab7a9d1d-df6e-4b4f-bbfa-837215e30612', 'e8811945-cc36-4e05-b35c-b1f24b2deead', 2, '70%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9d2485f-36f6-48ed-a221-f417146639f1', 'e8811945-cc36-4e05-b35c-b1f24b2deead', 3, '72%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e8811945-cc36-4e05-b35c-b1f24b2deead', 'ab7a9d1d-df6e-4b4f-bbfa-837215e30612', '350/500 × 100 = 70%.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d58dbf31-0b5a-47e8-9ff7-9e4432fa66bf', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 28, 'An article is sold at a loss of 10% for ₹900. What is its cost price?', 'Quantitative Aptitude', 'Profit and Loss', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d03ed267-cbf3-44d9-9f54-fc0a4011b8ae', 'd58dbf31-0b5a-47e8-9ff7-9e4432fa66bf', 0, '₹950');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44b030ef-dc58-44e1-bf48-d9187edcf42f', 'd58dbf31-0b5a-47e8-9ff7-9e4432fa66bf', 1, '₹1000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2945ea45-bbe5-4f51-8a08-e8f76f95e8f4', 'd58dbf31-0b5a-47e8-9ff7-9e4432fa66bf', 2, '₹1050');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b80ec4db-9c76-4667-b4cc-06c5a4cf9204', 'd58dbf31-0b5a-47e8-9ff7-9e4432fa66bf', 3, '₹1100');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d58dbf31-0b5a-47e8-9ff7-9e4432fa66bf', '44b030ef-dc58-44e1-bf48-d9187edcf42f', 'Selling price = 90% of cost price; cost price = 900/0.9 = ₹1000.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8f3d5650-6a12-4843-89e4-605f3c189307', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 29, 'At what rate percent per annum will ₹6000 amount to ₹7200 in 4 years at simple interest?', 'Quantitative Aptitude', 'Simple Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('22e76706-d995-464f-a271-d93e40b9f8ce', '8f3d5650-6a12-4843-89e4-605f3c189307', 0, '4%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce1a91e6-6d24-44e1-80ca-8657ca420341', '8f3d5650-6a12-4843-89e4-605f3c189307', 1, '5%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6df3ebf8-9ed1-4c3b-9010-4fc7d8804a8c', '8f3d5650-6a12-4843-89e4-605f3c189307', 2, '6%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad6f0db5-ddc0-46a7-84cc-b266cc9ae486', '8f3d5650-6a12-4843-89e4-605f3c189307', 3, '7%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8f3d5650-6a12-4843-89e4-605f3c189307', 'ce1a91e6-6d24-44e1-80ca-8657ca420341', 'SI = 7200-6000=1200; Rate = (SI×100)/(P×T) = (1200×100)/(6000×4) = 5%.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5003fd47-d3b5-4fa0-8904-ce47ec3d72c7', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 30, 'A alone can do a job in 15 days, B alone in 10 days. If they work together for 3 days, what fraction of the work is completed?', 'Quantitative Aptitude', 'Time and Work', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2468c08f-89c0-4955-9935-68ceb99c0525', '5003fd47-d3b5-4fa0-8904-ce47ec3d72c7', 0, '1/3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40b77ba6-2bbd-4c76-99da-fc6da73f2933', '5003fd47-d3b5-4fa0-8904-ce47ec3d72c7', 1, '2/5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73654a7e-bd1b-4a24-b23c-a9779d8798ad', '5003fd47-d3b5-4fa0-8904-ce47ec3d72c7', 2, '1/2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d2b80c0-e020-4524-abdc-48df2141e32f', '5003fd47-d3b5-4fa0-8904-ce47ec3d72c7', 3, '3/5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5003fd47-d3b5-4fa0-8904-ce47ec3d72c7', '73654a7e-bd1b-4a24-b23c-a9779d8798ad', 'Combined rate = 1/15 + 1/10 = 2/30 + 3/30 = 5/30 = 1/6 per day; in 3 days, completed fraction = 3 × 1/6 = 1/2.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0f167ffe-c44f-41d6-acf2-cbb0ccd40d63', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 31, 'A car covers 240km at a speed of 60km/h. If the speed is increased to 80km/h, how much time is saved?', 'Quantitative Aptitude', 'Speed, Distance, Time', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4247c16d-766f-4216-afef-8d26dd6d5827', '0f167ffe-c44f-41d6-acf2-cbb0ccd40d63', 0, '1 hour');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02ce44a9-89a8-46ab-b274-0ce4151732d5', '0f167ffe-c44f-41d6-acf2-cbb0ccd40d63', 1, '1.5 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6357b6ee-5824-4e09-91ba-8900ea9f2824', '0f167ffe-c44f-41d6-acf2-cbb0ccd40d63', 2, '2 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b29545b2-52ab-4657-a3ab-299e79ffb8dd', '0f167ffe-c44f-41d6-acf2-cbb0ccd40d63', 3, '2.5 hours');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0f167ffe-c44f-41d6-acf2-cbb0ccd40d63', '4247c16d-766f-4216-afef-8d26dd6d5827', 'Time at 60km/h = 240/60 = 4 hours; time at 80km/h = 240/80 = 3 hours; time saved = 4 − 3 = 1 hour.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('50ebd594-4c5f-4a40-a569-3a96a067d38a', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 32, 'If a:b = 2:3 and b:c = 4:5, find a:b:c.', 'Quantitative Aptitude', 'Ratio and Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7000e019-7836-4f01-bea8-3e3dcc8c528b', '50ebd594-4c5f-4a40-a569-3a96a067d38a', 0, '8:12:15');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4606317-fe4e-4cd4-bc17-47525c1ad128', '50ebd594-4c5f-4a40-a569-3a96a067d38a', 1, '2:3:5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0539a321-e47a-4630-9cd5-eba1e7395f18', '50ebd594-4c5f-4a40-a569-3a96a067d38a', 2, '8:10:15');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('147d87a6-5e9a-495f-9af0-bb3b14d560f7', '50ebd594-4c5f-4a40-a569-3a96a067d38a', 3, '4:6:15');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('50ebd594-4c5f-4a40-a569-3a96a067d38a', '7000e019-7836-4f01-bea8-3e3dcc8c528b', 'To combine, scale a:b=2:3 by 4 → 8:12; scale b:c=4:5 by 3 → 12:15; combined a:b:c = 8:12:15.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('de89728f-f1ab-4383-8d2b-875ac4e46776', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 33, 'The average of 5 consecutive even numbers is 24. What is the largest number?', 'Quantitative Aptitude', 'Average', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('963316af-9eea-4c9d-bf41-ff6371ab96a5', 'de89728f-f1ab-4383-8d2b-875ac4e46776', 0, '26');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f188e9d-22af-4122-a50d-926559ab9048', 'de89728f-f1ab-4383-8d2b-875ac4e46776', 1, '28');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00129bc2-b4fa-4e85-a397-fc985bf19744', 'de89728f-f1ab-4383-8d2b-875ac4e46776', 2, '30');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a43fa4a4-01f2-4f82-b6f7-482581c2f9fd', 'de89728f-f1ab-4383-8d2b-875ac4e46776', 3, '32');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('de89728f-f1ab-4383-8d2b-875ac4e46776', '6f188e9d-22af-4122-a50d-926559ab9048', '5 consecutive even numbers average to the middle one, so middle=24; numbers are 20,22,24,26,28; largest=28.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('35cbe838-3f01-4682-8c20-760ed6bd8005', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 34, 'A bar chart shows Company A''s sales grew from 200 units to 250 units. What is the percentage growth?', 'Quantitative Aptitude', 'Data Interpretation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4994eed6-5f7a-42ad-81dd-bd7b19769c60', '35cbe838-3f01-4682-8c20-760ed6bd8005', 0, '20%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9169b72b-0066-4434-9ab2-43e6aa10211a', '35cbe838-3f01-4682-8c20-760ed6bd8005', 1, '25%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1cafb833-954f-4f40-9187-5fd37b976482', '35cbe838-3f01-4682-8c20-760ed6bd8005', 2, '30%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba0a1b61-5545-49ef-bd73-216091173a1a', '35cbe838-3f01-4682-8c20-760ed6bd8005', 3, '35%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('35cbe838-3f01-4682-8c20-760ed6bd8005', '9169b72b-0066-4434-9ab2-43e6aa10211a', 'Growth = (250-200)/200 × 100 = 50/200×100 = 25%.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('52bf04ac-8449-4dad-8b35-6db686a12525', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 35, 'Find the next term: 7, 14, 28, 56, 112, ?', 'Quantitative Aptitude', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c063e550-bc2e-4d65-8acf-2c2dc20dbd10', '52bf04ac-8449-4dad-8b35-6db686a12525', 0, '168');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01396fb6-bc41-4bd8-aa89-0247d188d11e', '52bf04ac-8449-4dad-8b35-6db686a12525', 1, '196');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ebfb94a-4412-4431-8647-da3df7a987b5', '52bf04ac-8449-4dad-8b35-6db686a12525', 2, '224');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c89cbb8-f5d9-4aba-99df-eaa10038c1ac', '52bf04ac-8449-4dad-8b35-6db686a12525', 3, '220');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('52bf04ac-8449-4dad-8b35-6db686a12525', '8ebfb94a-4412-4431-8647-da3df7a987b5', 'Each term doubles; 112×2=224.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7d3a9b90-abf4-415d-a88e-453719c3075c', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 36, 'Find the compound interest on ₹10000 at 10% per annum for 2 years, compounded annually.', 'Quantitative Aptitude', 'Compound Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88a8b490-3694-47e0-9903-e9a4ff6e1a2f', '7d3a9b90-abf4-415d-a88e-453719c3075c', 0, '₹2000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('11061802-fa6a-4b62-bd3a-3fb5866e34af', '7d3a9b90-abf4-415d-a88e-453719c3075c', 1, '₹2100');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2bb452a-80ad-438a-9a1c-79ba0d3459a0', '7d3a9b90-abf4-415d-a88e-453719c3075c', 2, '₹2200');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79f195da-071c-4864-af9e-f5dbc168f09f', '7d3a9b90-abf4-415d-a88e-453719c3075c', 3, '₹1900');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7d3a9b90-abf4-415d-a88e-453719c3075c', '11061802-fa6a-4b62-bd3a-3fb5866e34af', 'Amount = 10000×(1.1)² = 12100; CI = 12100-10000 = ₹2100.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('384fac44-0d21-42ed-8516-2a6ab32ebf8f', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 37, 'In what ratio should rice at ₹40/kg be mixed with rice at ₹60/kg to get a mixture worth ₹48/kg?', 'Quantitative Aptitude', 'Mixture and Alligation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c65ee18-c37a-4d86-9cd0-ea4fe1a3637c', '384fac44-0d21-42ed-8516-2a6ab32ebf8f', 0, '2:3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b676b690-08d9-4e1f-bc85-f0d8d1adb386', '384fac44-0d21-42ed-8516-2a6ab32ebf8f', 1, '3:2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5148188-dd43-4d57-b477-1c987490d92c', '384fac44-0d21-42ed-8516-2a6ab32ebf8f', 2, '1:2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8232d28-1990-4548-9c9a-dc63b82fd497', '384fac44-0d21-42ed-8516-2a6ab32ebf8f', 3, '2:1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('384fac44-0d21-42ed-8516-2a6ab32ebf8f', 'b676b690-08d9-4e1f-bc85-f0d8d1adb386', 'By alligation: (60-48):(48-40) = 12:8 = 3:2 (cheaper:costlier).', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('03827f23-7a6b-45c0-861b-8d2485972287', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 38, 'What is the sum of the first 15 odd natural numbers?', 'Quantitative Aptitude', 'Number System', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbee13d4-f387-4c91-a768-366897f7be0b', '03827f23-7a6b-45c0-861b-8d2485972287', 0, '210');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd87e2ab-f074-4902-bdaa-60efea02744b', '03827f23-7a6b-45c0-861b-8d2485972287', 1, '215');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b0b3c30-7ba8-43de-b017-1972ab5494a1', '03827f23-7a6b-45c0-861b-8d2485972287', 2, '220');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5097a31-bc75-4089-8c91-216f7c95c347', '03827f23-7a6b-45c0-861b-8d2485972287', 3, '225');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('03827f23-7a6b-45c0-861b-8d2485972287', 'e5097a31-bc75-4089-8c91-216f7c95c347', 'The sum of the first n odd natural numbers is always n²; for n=15, sum = 15² = 225.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3e4b6f19-00db-49f3-aebd-7476899462fd', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 39, 'The population of a town increases by 10% each year. If the current population is 5000, what will it be after 2 years?', 'Quantitative Aptitude', 'Percentage — Population', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45a8ff82-e55f-4931-861e-0c2630b06e9f', '3e4b6f19-00db-49f3-aebd-7476899462fd', 0, '5900');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f5f1978-ed28-4d99-9c90-1bde908404c1', '3e4b6f19-00db-49f3-aebd-7476899462fd', 1, '6000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34ccd536-49c1-4ce9-96b6-cacf56c4dc8e', '3e4b6f19-00db-49f3-aebd-7476899462fd', 2, '6050');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25763abd-a684-4c26-818b-15acf89a522c', '3e4b6f19-00db-49f3-aebd-7476899462fd', 3, '6100');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3e4b6f19-00db-49f3-aebd-7476899462fd', '34ccd536-49c1-4ce9-96b6-cacf56c4dc8e', '5000×1.1×1.1 = 5000×1.21 = 6050.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('954fec52-89cb-4ac6-81ca-62015f0b7d2b', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 40, 'A, B, and C invest in a ratio of 2:3:5. If the total profit is ₹10000, what is C''s share?', 'Quantitative Aptitude', 'Partnership', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23f71e76-15ef-4b12-a290-c6b24b8e16c0', '954fec52-89cb-4ac6-81ca-62015f0b7d2b', 0, '₹4000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc99e0fe-78fe-4308-932d-8e50228bb3f4', '954fec52-89cb-4ac6-81ca-62015f0b7d2b', 1, '₹5000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff54d233-7a00-45c6-91ae-847ae5cc35b9', '954fec52-89cb-4ac6-81ca-62015f0b7d2b', 2, '₹3000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0487e7d-ca95-41b6-a72d-28251b1e0435', '954fec52-89cb-4ac6-81ca-62015f0b7d2b', 3, '₹2000');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('954fec52-89cb-4ac6-81ca-62015f0b7d2b', 'dc99e0fe-78fe-4308-932d-8e50228bb3f4', 'Total parts=2+3+5=10; C''s share = (5/10)×10000 = ₹5000.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9519ebb9-66b2-4ab9-a80c-d844528ab8ca', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 41, 'A boat''s speed in still water is 10km/h, and the current''s speed is 2km/h. What is the boat''s downstream speed?', 'Quantitative Aptitude', 'Speed — Boats and Streams', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('adc5d312-8606-4bef-8143-64764e2ac54d', '9519ebb9-66b2-4ab9-a80c-d844528ab8ca', 0, '8km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af882a60-b051-4fbc-88e7-f03852adc7a4', '9519ebb9-66b2-4ab9-a80c-d844528ab8ca', 1, '10km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e15ac636-cc8a-4b24-8c1c-ed57fedc65bb', '9519ebb9-66b2-4ab9-a80c-d844528ab8ca', 2, '12km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09fb0a2d-e683-4695-aee6-3a1441cf5d83', '9519ebb9-66b2-4ab9-a80c-d844528ab8ca', 3, '14km/h');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9519ebb9-66b2-4ab9-a80c-d844528ab8ca', 'e15ac636-cc8a-4b24-8c1c-ed57fedc65bb', 'Downstream speed = boat speed + current speed = 10+2 = 12km/h.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('66b84125-ce85-46bd-ab88-fbae9527c735', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 42, 'If a table shows Product X sold 500 units in Jan and 650 units in Feb, what is the absolute increase?', 'Quantitative Aptitude', 'Data Interpretation — Table', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40a18ed2-6d41-4691-b47a-a197e4ef6c5e', '66b84125-ce85-46bd-ab88-fbae9527c735', 0, '100');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a7e6e01-d343-49e1-a9d4-0515a8468ca3', '66b84125-ce85-46bd-ab88-fbae9527c735', 1, '130');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2374a6c7-335b-4841-a1d9-5fe594bc7718', '66b84125-ce85-46bd-ab88-fbae9527c735', 2, '150');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ebde38b-0e58-4126-936d-4893eb4b30ca', '66b84125-ce85-46bd-ab88-fbae9527c735', 3, '170');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('66b84125-ce85-46bd-ab88-fbae9527c735', '2374a6c7-335b-4841-a1d9-5fe594bc7718', '650-500 = 150 units increase.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('491a7c63-8af1-4e5d-9ff6-5db92f6d3ef9', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 43, 'Find the perimeter of a square with area 64 sq cm.', 'Quantitative Aptitude', 'Geometry — Perimeter', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08376a42-4e10-421f-ac19-bbde8fc6473e', '491a7c63-8af1-4e5d-9ff6-5db92f6d3ef9', 0, '28cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7fc1c507-9969-452a-89b3-471a2421eca2', '491a7c63-8af1-4e5d-9ff6-5db92f6d3ef9', 1, '30cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9338076a-025c-4fee-8ba6-81775e83369c', '491a7c63-8af1-4e5d-9ff6-5db92f6d3ef9', 2, '32cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a584009d-4a64-4b66-9898-c6f20ab9a26a', '491a7c63-8af1-4e5d-9ff6-5db92f6d3ef9', 3, '34cm');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('491a7c63-8af1-4e5d-9ff6-5db92f6d3ef9', '9338076a-025c-4fee-8ba6-81775e83369c', 'Side = sqrt(64) = 8cm; perimeter = 4×8 = 32cm.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('01d04388-abc9-4b82-9a4a-1d3dfe0e7507', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 44, 'Which of the following numbers is divisible by both 3 and 4?', 'Quantitative Aptitude', 'Number System — Divisibility', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5da0dc4-c841-4f9f-8847-9b09c1729e92', '01d04388-abc9-4b82-9a4a-1d3dfe0e7507', 0, '124');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2d6f2e5-c973-4668-b285-d01bcb69ff2c', '01d04388-abc9-4b82-9a4a-1d3dfe0e7507', 1, '132');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40ebf760-0ca0-40b6-bcae-49af486e9dad', '01d04388-abc9-4b82-9a4a-1d3dfe0e7507', 2, '146');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc60ebf7-7ee1-4cf8-b87e-2c652d91ee06', '01d04388-abc9-4b82-9a4a-1d3dfe0e7507', 3, '158');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('01d04388-abc9-4b82-9a4a-1d3dfe0e7507', 'f2d6f2e5-c973-4668-b285-d01bcb69ff2c', '132: digit sum=6 (divisible by 3), and 132/4=33 (divisible by 4) — 132 satisfies both.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('76b36958-c802-4555-b49d-e741470fb8b9', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 45, 'The average weight of 8 people is 65kg. If a 9th person weighing 74kg joins, what is the new average?', 'Quantitative Aptitude', 'Average — Combined', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d0481dc-dd44-4c96-b886-6414f47baa4d', '76b36958-c802-4555-b49d-e741470fb8b9', 0, '65kg');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('897b6493-7101-4bc6-834b-9303576196e8', '76b36958-c802-4555-b49d-e741470fb8b9', 1, '66kg');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0aa5ded7-32f7-4fe4-b5c1-04be1e85ea99', '76b36958-c802-4555-b49d-e741470fb8b9', 2, '67kg');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1a38029-30b5-4227-bd74-e44c8a7123fd', '76b36958-c802-4555-b49d-e741470fb8b9', 3, '68kg');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('76b36958-c802-4555-b49d-e741470fb8b9', '897b6493-7101-4bc6-834b-9303576196e8', 'New total = 8×65+74 = 594; new average = 594/9 = 66kg.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ba3ea4e8-69f3-47fc-aa5f-298f8c5f9196', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 46, 'P and Q together can complete a job in 8 days. P alone can do it in 14 days. In how many days can Q alone complete it?', 'Quantitative Aptitude', 'Time and Work — Combined then Alone', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a50c0dd9-01e8-4f17-a3f8-ab4fc914351f', 'ba3ea4e8-69f3-47fc-aa5f-298f8c5f9196', 0, '16.4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9886d2fb-74e9-488f-afbd-53d132d09367', 'ba3ea4e8-69f3-47fc-aa5f-298f8c5f9196', 1, '17.3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86b88a41-3895-4c8b-a33f-b27b80d5b376', 'ba3ea4e8-69f3-47fc-aa5f-298f8c5f9196', 2, '18.4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df60fa7d-5ea9-4dc7-a05a-6b718857099a', 'ba3ea4e8-69f3-47fc-aa5f-298f8c5f9196', 3, '19.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ba3ea4e8-69f3-47fc-aa5f-298f8c5f9196', '86b88a41-3895-4c8b-a33f-b27b80d5b376', 'Q''s rate = 1/8 − 1/14 = 7/56 − 4/56 = 3/56 per day; Q alone takes 56/3 ≈ 18.4 days.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9ee16aa7-e460-4854-aa65-9cb131cfc9a3', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 47, 'A shopkeeper marks an item at ₹1200 and offers a 15% discount. What is the selling price?', 'Quantitative Aptitude', 'Percentage — Discount', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3f022c6-f304-4d16-b8d9-0bc8a5edd206', '9ee16aa7-e460-4854-aa65-9cb131cfc9a3', 0, '₹1000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8095f70-1eed-4424-8581-8cb30d0aac37', '9ee16aa7-e460-4854-aa65-9cb131cfc9a3', 1, '₹1020');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cef95af7-601d-4398-83bd-0a5f6c3103db', '9ee16aa7-e460-4854-aa65-9cb131cfc9a3', 2, '₹1050');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b35ee967-f832-40a5-bcdc-da6f8095fc09', '9ee16aa7-e460-4854-aa65-9cb131cfc9a3', 3, '₹1080');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9ee16aa7-e460-4854-aa65-9cb131cfc9a3', 'b8095f70-1eed-4424-8581-8cb30d0aac37', 'Selling price = 1200×0.85 = ₹1020.', 'Quantitative Aptitude — authored from standard IBPS PO Prelims quant topics (number series, simplification, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, ratio); not copied from any official IBPS question paper.');

-- ── Section: English Language (20 questions) — English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('88671f89-9907-48bc-8745-ab9b4d370935', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 48, '"Digital banking has reduced the need for physical branch visits, but has simultaneously raised concerns about cybersecurity and digital literacy among older customers." What concern does the passage raise about digital banking?', 'English', 'Reading Comprehension', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('11663d56-b4ef-461f-9eea-840cb96ad503', '88671f89-9907-48bc-8745-ab9b4d370935', 0, 'Reduced profitability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0c52646-1be0-4f38-961b-97e91365355e', '88671f89-9907-48bc-8745-ab9b4d370935', 1, 'Cybersecurity and digital literacy concerns');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f6cfcd8-e071-4b9e-ae26-95f3b4d3673d', '88671f89-9907-48bc-8745-ab9b4d370935', 2, 'Increased branch visits');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('232f0c10-73bd-4d49-b3b9-07d5a8a6693b', '88671f89-9907-48bc-8745-ab9b4d370935', 3, 'Higher transaction costs');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('88671f89-9907-48bc-8745-ab9b4d370935', 'd0c52646-1be0-4f38-961b-97e91365355e', 'The passage explicitly names cybersecurity and digital literacy (particularly among older customers) as the concerns raised alongside digital banking''s convenience.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('071f082a-cef4-49bf-986e-96b2339cec94', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 49, 'The company has ___ significant growth over the past year.', 'English', 'Cloze Test', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af849881-6ca1-4081-affb-8499ea5c3641', '071f082a-cef4-49bf-986e-96b2339cec94', 0, 'experience');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1bba193c-d3ce-441c-ab7a-157dff9743f9', '071f082a-cef4-49bf-986e-96b2339cec94', 1, 'experienced');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15eead2a-bfa2-4885-82da-a8117e1cc39d', '071f082a-cef4-49bf-986e-96b2339cec94', 2, 'experiencing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('028a1206-f704-403e-ab47-cf70c3864205', '071f082a-cef4-49bf-986e-96b2339cec94', 3, 'experiences');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('071f082a-cef4-49bf-986e-96b2339cec94', '1bba193c-d3ce-441c-ab7a-157dff9743f9', 'The sentence requires the past participle ''experienced'' to correctly complete the present perfect construction ''has experienced''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('100781a9-86b6-4e40-abcd-81ed04716356', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 50, 'Identify the part with an error: (A) The manager along with his team / (B) are going to attend / (C) the conference next week / (D) No error', 'English', 'Error Detection', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0c5566b-01bc-4233-830d-319f3434c567', '100781a9-86b6-4e40-abcd-81ed04716356', 0, 'A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44a901ec-81c8-4db3-8207-b2fdd036df44', '100781a9-86b6-4e40-abcd-81ed04716356', 1, 'B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e816ed3a-70b9-4064-bdcc-1d5322f414ae', '100781a9-86b6-4e40-abcd-81ed04716356', 2, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('560cd90d-1be5-451b-bd20-abb1b081deda', '100781a9-86b6-4e40-abcd-81ed04716356', 3, 'D');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('100781a9-86b6-4e40-abcd-81ed04716356', '44a901ec-81c8-4db3-8207-b2fdd036df44', '''Along with'' doesn''t make the subject plural — the verb should agree with the singular subject ''manager'', requiring ''is going'', not ''are going''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0ad5b3ed-bbb7-472e-8662-d03ac01abb89', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 51, 'Improve: "The information which I have received are correct."', 'English', 'Sentence Improvement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ba5ccf2-d189-4b82-916e-8efdba0bfa47', '0ad5b3ed-bbb7-472e-8662-d03ac01abb89', 0, 'is correct');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d88bf84-9a74-42f4-a91b-abf8b3986b07', '0ad5b3ed-bbb7-472e-8662-d03ac01abb89', 1, 'were correct');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8de1e9f8-1068-4cdc-96b5-f160ccba2deb', '0ad5b3ed-bbb7-472e-8662-d03ac01abb89', 2, 'being correct');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5fcf1f0d-a4a6-4354-a8dd-fca7932a6240', '0ad5b3ed-bbb7-472e-8662-d03ac01abb89', 3, 'No improvement needed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0ad5b3ed-bbb7-472e-8662-d03ac01abb89', '4ba5ccf2-d189-4b82-916e-8efdba0bfa47', '''Information'' is an uncountable noun, always singular, requiring ''is'', not ''are''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('34036655-a52d-4e97-bcbb-3b4a8108ab65', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 52, 'Arrange in logical order: (P) As a result, sales increased by 30% (Q) The company launched a new marketing campaign (R) which targeted younger demographics (S) in the first quarter', 'English', 'Para Jumbles', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('492600ac-fd70-47b2-b2d5-4c25c14d3879', '34036655-a52d-4e97-bcbb-3b4a8108ab65', 0, 'Q-R-P-S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76ab62f5-45c5-4af7-b840-13f4569b3ae3', '34036655-a52d-4e97-bcbb-3b4a8108ab65', 1, 'Q-R-S-P');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f3a15d91-5bf1-4fd6-8e25-7a459e191c38', '34036655-a52d-4e97-bcbb-3b4a8108ab65', 2, 'P-Q-R-S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c1ffd59-e9d6-4122-b513-b1158ba2f6a9', '34036655-a52d-4e97-bcbb-3b4a8108ab65', 3, 'S-Q-R-P');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('34036655-a52d-4e97-bcbb-3b4a8108ab65', '76ab62f5-45c5-4af7-b840-13f4569b3ae3', 'Logical order: ''The company launched a new campaign which targeted younger demographics in the first quarter. As a result, sales increased by 30%'' — Q-R-S-P.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('84d2b808-67c6-4ea2-b7f4-e29e9c11b842', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 53, 'Choose the synonym of ''Resilient'':', 'English', 'Synonyms', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa815ab6-0327-499a-8e40-1217f7fff32c', '84d2b808-67c6-4ea2-b7f4-e29e9c11b842', 0, 'Fragile');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48e57901-c8fc-48dd-9186-b8dc91030e99', '84d2b808-67c6-4ea2-b7f4-e29e9c11b842', 1, 'Adaptable and tough');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b787f14b-e6ac-4618-85de-519081b6a879', '84d2b808-67c6-4ea2-b7f4-e29e9c11b842', 2, 'Stubborn');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f63fc63d-778f-4bd7-bb27-a619ab5b9efb', '84d2b808-67c6-4ea2-b7f4-e29e9c11b842', 3, 'Weak');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('84d2b808-67c6-4ea2-b7f4-e29e9c11b842', '48e57901-c8fc-48dd-9186-b8dc91030e99', '''Resilient'' means able to recover quickly and withstand difficulty — ''adaptable and tough'' captures this meaning.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('38536099-bd0d-4f83-9f78-58afa134d837', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 54, 'Choose the antonym of ''Transparent'':', 'English', 'Antonyms', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ac1769e-352c-4905-b1d9-31620cfab345', '38536099-bd0d-4f83-9f78-58afa134d837', 0, 'Clear');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e574460d-1e45-47f1-804a-132156d93459', '38536099-bd0d-4f83-9f78-58afa134d837', 1, 'Obvious');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97c6bf16-4dc4-42f5-9fea-30d52f3335de', '38536099-bd0d-4f83-9f78-58afa134d837', 2, 'Opaque');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3cb07e3-defe-4203-866d-4ef31aa6d1c1', '38536099-bd0d-4f83-9f78-58afa134d837', 3, 'Visible');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('38536099-bd0d-4f83-9f78-58afa134d837', '97c6bf16-4dc4-42f5-9fea-30d52f3335de', '''Transparent'' means easily seen through or understood; its opposite is ''Opaque''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('185dc795-e3b5-4c6d-af42-e139b8d7df92', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 55, 'Neither the manager ___ the employees were aware of the policy change.', 'English', 'Fill in the Blanks', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ddde6a96-be27-4c2b-8b13-94b606ac22e4', '185dc795-e3b5-4c6d-af42-e139b8d7df92', 0, 'nor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d3694a7-c0cc-4b1f-a4b7-6e0c27670702', '185dc795-e3b5-4c6d-af42-e139b8d7df92', 1, 'or');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('705dd815-e5f1-436f-bc72-08397764ee94', '185dc795-e3b5-4c6d-af42-e139b8d7df92', 2, 'and');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2e44727-c8f1-4333-a807-5fb09645dd20', '185dc795-e3b5-4c6d-af42-e139b8d7df92', 3, 'but');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('185dc795-e3b5-4c6d-af42-e139b8d7df92', 'ddde6a96-be27-4c2b-8b13-94b606ac22e4', '''Neither...nor'' is the correct paired conjunction construction.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0e77eaef-1365-48b6-bc2d-ef38d6925675', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 56, 'A statement that is difficult to understand due to its complexity is called:', 'English', 'One-Word Substitution', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03a2a082-6359-4e08-a872-4a7f31f1f54c', '0e77eaef-1365-48b6-bc2d-ef38d6925675', 0, 'Ambiguous');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc8c18c9-84ba-4ce4-b13f-001fc245862d', '0e77eaef-1365-48b6-bc2d-ef38d6925675', 1, 'Verbose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94eb2def-984c-43d4-92ed-52fe21f144ae', '0e77eaef-1365-48b6-bc2d-ef38d6925675', 2, 'Cryptic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9970daa-066a-417a-a700-7f89de33ddaa', '0e77eaef-1365-48b6-bc2d-ef38d6925675', 3, 'Esoteric');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0e77eaef-1365-48b6-bc2d-ef38d6925675', '03a2a082-6359-4e08-a872-4a7f31f1f54c', '''Ambiguous'' describes a statement open to multiple interpretations or difficult to understand due to unclear meaning.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4d59de7e-a288-4ed5-9e30-816b0dff0707', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 57, '"Microfinance institutions have expanded access to credit for small entrepreneurs, though critics point to high interest rates that can trap borrowers in debt cycles." What criticism is raised against microfinance?', 'English', 'Reading Comprehension', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('375442f7-4ab7-4796-8c51-cef7206987d6', '4d59de7e-a288-4ed5-9e30-816b0dff0707', 0, 'Lack of accessibility');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e95bff13-3e53-4c04-a911-22d2b0403e76', '4d59de7e-a288-4ed5-9e30-816b0dff0707', 1, 'High interest rates leading to debt cycles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3d51dd6-fbe9-4905-b67f-7d8818e3ce47', '4d59de7e-a288-4ed5-9e30-816b0dff0707', 2, 'Excessive government regulation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75ae33a8-9bd8-4102-be19-00c0dd1baafe', '4d59de7e-a288-4ed5-9e30-816b0dff0707', 3, 'Limited geographic reach');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4d59de7e-a288-4ed5-9e30-816b0dff0707', 'e95bff13-3e53-4c04-a911-22d2b0403e76', 'The passage explicitly names high interest rates and resulting debt cycles as the criticism, alongside acknowledging expanded credit access as a benefit.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0347ed0d-0678-45c5-9b1c-21e137b2e96f', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 58, 'What does ''to bite the bullet'' mean?', 'English', 'Idioms', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1c2ef6c-246b-4801-b4bb-3dec06496363', '0347ed0d-0678-45c5-9b1c-21e137b2e96f', 0, 'To eat quickly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa928a60-7b27-41de-aa3b-3b25d0d56666', '0347ed0d-0678-45c5-9b1c-21e137b2e96f', 1, 'To face a difficult situation with courage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00ffbb4e-8c65-452d-9691-1ccdd222682f', '0347ed0d-0678-45c5-9b1c-21e137b2e96f', 2, 'To avoid a problem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b004b2ba-9f64-4e10-ae5f-e8027820a5ea', '0347ed0d-0678-45c5-9b1c-21e137b2e96f', 3, 'To argue aggressively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0347ed0d-0678-45c5-9b1c-21e137b2e96f', 'fa928a60-7b27-41de-aa3b-3b25d0d56666', 'This idiom means to face an unpleasant or difficult situation with courage and resolve.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('82c9e121-80bc-4beb-8dbc-b2e77498a309', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 59, 'The company is known ___ its excellent customer service.', 'English', 'Prepositions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d316fb3-a842-41a6-bf3d-a96e9ef5fd6f', '82c9e121-80bc-4beb-8dbc-b2e77498a309', 0, 'for');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cf78e2b-b0b2-4eae-b63b-78d9483f78a9', '82c9e121-80bc-4beb-8dbc-b2e77498a309', 1, 'with');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ad1abaa-c0e6-4e9b-9624-94d7b66f2779', '82c9e121-80bc-4beb-8dbc-b2e77498a309', 2, 'by');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('155eb46f-b42c-4b37-8875-ab702b2f7321', '82c9e121-80bc-4beb-8dbc-b2e77498a309', 3, 'at');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('82c9e121-80bc-4beb-8dbc-b2e77498a309', '6d316fb3-a842-41a6-bf3d-a96e9ef5fd6f', 'The correct idiomatic preposition for reputation is ''known for''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2c98c18f-2d83-4582-b48b-4bea504c4ba7', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 60, 'Convert to passive voice: "The manager has approved the proposal."', 'English', 'Active-Passive Voice', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('648c420a-1d9c-4f89-b9ae-a577e847403e', '2c98c18f-2d83-4582-b48b-4bea504c4ba7', 0, 'The proposal has been approved by the manager');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb3ff702-1723-42e5-81cd-970cab1207f0', '2c98c18f-2d83-4582-b48b-4bea504c4ba7', 1, 'The proposal was approved by the manager');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26c15ceb-44f3-421f-a2f6-84a0b0331d5e', '2c98c18f-2d83-4582-b48b-4bea504c4ba7', 2, 'The proposal is approved by the manager');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2cecb405-cc02-410c-a745-b8d70a2a903b', '2c98c18f-2d83-4582-b48b-4bea504c4ba7', 3, 'The proposal had been approved by the manager');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2c98c18f-2d83-4582-b48b-4bea504c4ba7', '648c420a-1d9c-4f89-b9ae-a577e847403e', 'Present perfect active (''has approved'') converts to present perfect passive: ''has been approved by''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e1936cad-8536-4229-8f19-ab2156fa5ed5', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 61, 'Convert to indirect speech: She said, "I will finish the report tomorrow."', 'English', 'Direct-Indirect Speech', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c158fc6-e287-48eb-8611-cfaeca54bf33', 'e1936cad-8536-4229-8f19-ab2156fa5ed5', 0, 'She said that she would finish the report the next day');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc7358aa-ded5-49c9-b2a8-b64a0cc051cb', 'e1936cad-8536-4229-8f19-ab2156fa5ed5', 1, 'She said that she will finish the report tomorrow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b64276ff-4a64-4ed6-92e4-480893f564aa', 'e1936cad-8536-4229-8f19-ab2156fa5ed5', 2, 'She said that she finished the report tomorrow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('277b1b34-b541-4356-b92a-930be93fd884', 'e1936cad-8536-4229-8f19-ab2156fa5ed5', 3, 'She said that she finishes the report the next day');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e1936cad-8536-4229-8f19-ab2156fa5ed5', '4c158fc6-e287-48eb-8611-cfaeca54bf33', 'In reported speech, ''will'' shifts to ''would'' and ''tomorrow'' shifts to ''the next day'', with the tense correctly backshifted.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6bb42655-aad6-40ec-9319-b82e5d407995', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 62, 'Identify the error: (A) One of the biggest challenge / (B) facing small businesses today / (C) is access to capital / (D) No error', 'English', 'Error Detection', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86f7e5d1-02a3-4919-8246-d4feea626dbe', '6bb42655-aad6-40ec-9319-b82e5d407995', 0, 'A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbd5892f-5ca1-405e-bc48-fa61af26c356', '6bb42655-aad6-40ec-9319-b82e5d407995', 1, 'B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87b78981-cc13-4e82-ada0-af5137c3a318', '6bb42655-aad6-40ec-9319-b82e5d407995', 2, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c81d7b2-575a-4c18-acf7-b3766a4a444a', '6bb42655-aad6-40ec-9319-b82e5d407995', 3, 'D');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6bb42655-aad6-40ec-9319-b82e5d407995', '86f7e5d1-02a3-4919-8246-d4feea626dbe', '''One of the biggest'' should be followed by a plural noun — ''challenges'', not ''challenge'' — the error is in part A.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e7c01762-01e3-47d3-8848-3bf1cd21c7a0', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 63, 'Choose the synonym of ''Meticulous'':', 'English', 'Synonyms', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35f43cd5-5cc9-4d7a-ae84-6a981c774fd6', 'e7c01762-01e3-47d3-8848-3bf1cd21c7a0', 0, 'Careless');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c8fc1e5-a3aa-407c-b1cb-0d245f323d0e', 'e7c01762-01e3-47d3-8848-3bf1cd21c7a0', 1, 'Detailed and precise');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4417c2de-a682-437f-be3a-5ada9d1cb0ff', 'e7c01762-01e3-47d3-8848-3bf1cd21c7a0', 2, 'Slow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0d11bcf-92b5-40e3-9a06-2030cb7a732d', 'e7c01762-01e3-47d3-8848-3bf1cd21c7a0', 3, 'Confident');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e7c01762-01e3-47d3-8848-3bf1cd21c7a0', '7c8fc1e5-a3aa-407c-b1cb-0d245f323d0e', '''Meticulous'' means showing great attention to detail and being very careful/precise.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7b953c92-4aca-4fbf-9ca0-7d574750ae51', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 64, 'The new policy will come ___ effect from next month.', 'English', 'Cloze Test', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7dd1e4ec-b256-4d7f-80c3-03c28a8331ff', '7b953c92-4aca-4fbf-9ca0-7d574750ae51', 0, 'into');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99a5b715-0345-47fe-ae09-e99d72592ec7', '7b953c92-4aca-4fbf-9ca0-7d574750ae51', 1, 'in');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e2f6d92a-99ec-4134-ab03-1cd865699b44', '7b953c92-4aca-4fbf-9ca0-7d574750ae51', 2, 'at');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('71985623-0529-45e9-aaf5-f1fc84037e71', '7b953c92-4aca-4fbf-9ca0-7d574750ae51', 3, 'on');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7b953c92-4aca-4fbf-9ca0-7d574750ae51', '7dd1e4ec-b256-4d7f-80c3-03c28a8331ff', 'The correct idiomatic phrase is ''come into effect''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9a203517-563c-4b8e-a55a-422bbb03f307', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 65, 'A person who is an expert in the study of ancient societies through excavation is called:', 'English', 'One-Word Substitution', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8b3831a-b1cc-4b95-a748-689da39f592f', '9a203517-563c-4b8e-a55a-422bbb03f307', 0, 'Anthropologist');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5fb882d-1987-49e4-a968-20c37aedc182', '9a203517-563c-4b8e-a55a-422bbb03f307', 1, 'Archaeologist');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3df00f2-0d6e-40a2-b536-396e58edf407', '9a203517-563c-4b8e-a55a-422bbb03f307', 2, 'Historian');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('032fc25b-b91e-4612-b3f3-0a0a9b3a1b84', '9a203517-563c-4b8e-a55a-422bbb03f307', 3, 'Paleontologist');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9a203517-563c-4b8e-a55a-422bbb03f307', 'd5fb882d-1987-49e4-a968-20c37aedc182', 'An ''Archaeologist'' studies ancient human societies through excavation and material remains.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3ef5f211-bfb1-43b9-a174-6fe6b6bb4cb9', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 66, 'Arrange the parts: (P) despite the challenges (Q) the team completed the project (R) on time (S) it faced during development', 'English', 'Sentence Rearrangement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99e94a2f-1d32-45e8-8455-3345c3861a8c', '3ef5f211-bfb1-43b9-a174-6fe6b6bb4cb9', 0, 'Q-R-P-S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f54ad1b5-8aa2-44e4-91f7-f15fca501feb', '3ef5f211-bfb1-43b9-a174-6fe6b6bb4cb9', 1, 'P-S-Q-R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31975f17-c100-456a-beb5-40bd24cf6a82', '3ef5f211-bfb1-43b9-a174-6fe6b6bb4cb9', 2, 'Q-P-S-R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb175308-4e09-4c69-ae88-16ae19fe397d', '3ef5f211-bfb1-43b9-a174-6fe6b6bb4cb9', 3, 'P-Q-S-R');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3ef5f211-bfb1-43b9-a174-6fe6b6bb4cb9', 'f54ad1b5-8aa2-44e4-91f7-f15fca501feb', 'Logical order: ''Despite the challenges it faced during development, the team completed the project on time'' — P-S-Q-R.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a2e447c5-e285-4497-b8bf-955c44e389bc', 'c15977cb-918c-49e3-94ee-e9b75f2d12b2', 67, 'Choose the antonym of ''Abundant'':', 'English', 'Antonyms', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('328f693c-c32a-4330-b8bd-ce407e99d94e', 'a2e447c5-e285-4497-b8bf-955c44e389bc', 0, 'Plentiful');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13296cc2-3ba3-4b80-a49d-f620626b30b3', 'a2e447c5-e285-4497-b8bf-955c44e389bc', 1, 'Scarce');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d927053-17ee-4eee-a6c8-9ebbfbe0db7f', 'a2e447c5-e285-4497-b8bf-955c44e389bc', 2, 'Generous');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f615528c-a6bd-4a2a-ba7d-29affe1b223b', 'a2e447c5-e285-4497-b8bf-955c44e389bc', 3, 'Excessive');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a2e447c5-e285-4497-b8bf-955c44e389bc', '13296cc2-3ba3-4b80-a49d-f620626b30b3', '''Abundant'' means present in large quantities; its opposite is ''Scarce''.', 'English Language — authored from standard IBPS PO Prelims English topics (reading comprehension, cloze test, error detection, sentence improvement, para jumbles); not copied from any official IBPS question paper.');
