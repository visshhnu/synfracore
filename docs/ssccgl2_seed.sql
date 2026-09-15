-- ============================================================
-- SSC CGL Tier 1 — Full Mock Paper 2
-- Full-Length Practice Paper (100 questions, 60 minutes)
-- Marking: +2 correct / -0.5 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('05bcd03f-aaa4-456e-ab91-214dc8c21757', 'ssc-cgl-tier1-practice-2', 'SSC CGL Tier 1 Full Mock Paper 2', 'ssc-cgl', ARRAY['Reasoning', 'General Awareness', 'Quantitative Aptitude', 'English', 'SSC CGL', 'Tier 1']::TEXT[], 100, 'mixed', true, 2, 60, 2, 0.5);

-- ── Section: General Intelligence & Reasoning (25 questions) — General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2a7ff1c9-f64a-4cf8-9a6e-f98459b67262', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 1, 'Pen : Write :: Knife : ?', 'Reasoning', 'Analogy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20f8a892-491e-466f-a3d7-ac95ccf3de13', '2a7ff1c9-f64a-4cf8-9a6e-f98459b67262', 0, 'Sharp');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60442c99-441a-46e5-b011-09dc4262e19d', '2a7ff1c9-f64a-4cf8-9a6e-f98459b67262', 1, 'Cut');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1068517f-9816-431a-bc74-135b863120dd', '2a7ff1c9-f64a-4cf8-9a6e-f98459b67262', 2, 'Kitchen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6f02302-c7af-4a7c-a2ab-1fca71740ae1', '2a7ff1c9-f64a-4cf8-9a6e-f98459b67262', 3, 'Blade');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2a7ff1c9-f64a-4cf8-9a6e-f98459b67262', '60442c99-441a-46e5-b011-09dc4262e19d', 'A pen''s function is to write; a knife''s function is to cut — the relationship is object to its primary function.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8e48e54e-9160-495c-aea8-a71a92d2cff5', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 2, 'Find the odd one out: Delhi, Mumbai, Chennai, Sikkim', 'Reasoning', 'Classification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9a48305-d95a-44c2-b0bf-449cc39d44d4', '8e48e54e-9160-495c-aea8-a71a92d2cff5', 0, 'Delhi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ab56a16-e9b2-488c-b770-daf7b6515987', '8e48e54e-9160-495c-aea8-a71a92d2cff5', 1, 'Mumbai');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e97baa6c-cc74-4082-a05e-d583d1ba4d64', '8e48e54e-9160-495c-aea8-a71a92d2cff5', 2, 'Chennai');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c3c3ce3-036e-4a6e-af77-ef4ba897faa0', '8e48e54e-9160-495c-aea8-a71a92d2cff5', 3, 'Sikkim');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8e48e54e-9160-495c-aea8-a71a92d2cff5', '7c3c3ce3-036e-4a6e-af77-ef4ba897faa0', 'Delhi, Mumbai, and Chennai are cities; Sikkim is a state, not a city.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0dba1af2-0702-43bd-9303-db5b1281ee53', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 3, 'Find the next term: 5, 11, 23, 47, 95, ?', 'Reasoning', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43b7232b-858e-4897-b0ad-be1d4622ce80', '0dba1af2-0702-43bd-9303-db5b1281ee53', 0, '190');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b267f66-945d-46fa-a346-1d1d7935bb9c', '0dba1af2-0702-43bd-9303-db5b1281ee53', 1, '191');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f0c5069-4f59-4fd4-84ed-114cc018324d', '0dba1af2-0702-43bd-9303-db5b1281ee53', 2, '192');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('942ff745-8edd-4a1d-9b51-42d0e3384c75', '0dba1af2-0702-43bd-9303-db5b1281ee53', 3, '193');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0dba1af2-0702-43bd-9303-db5b1281ee53', '8b267f66-945d-46fa-a346-1d1d7935bb9c', 'Each term is roughly double the previous plus 1 (5×2+1=11, 11×2+1=23, 23×2+1=47, 47×2+1=95); the next is 95×2+1=191.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3834a3c8-a13b-4621-a12c-3169781309d0', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 4, 'Find the next term: Z, X, V, T, R, ?', 'Reasoning', 'Letter Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b65c164-d2f2-4998-a130-4e8d86219da8', '3834a3c8-a13b-4621-a12c-3169781309d0', 0, 'Q');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7349cb86-30de-4df9-916f-8589b9a5173f', '3834a3c8-a13b-4621-a12c-3169781309d0', 1, 'P');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef127df2-0371-401d-905e-059868a24828', '3834a3c8-a13b-4621-a12c-3169781309d0', 2, 'O');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68a0fda8-1236-4511-a60a-86ff433d2b8d', '3834a3c8-a13b-4621-a12c-3169781309d0', 3, 'N');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3834a3c8-a13b-4621-a12c-3169781309d0', '7349cb86-30de-4df9-916f-8589b9a5173f', 'Each letter skips one position going backward (Z-2=X, X-2=V,...), so R-2=P.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4fb4bd2c-85ff-4380-a2e8-54da6d9abba9', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 5, 'If BOOK is coded as 25232, how is DOOR coded (using the same letter-to-position logic where A=1, B=2...)?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72a84144-5db1-49d0-97e8-d4650e3ad6fa', '4fb4bd2c-85ff-4380-a2e8-54da6d9abba9', 0, '4, 15, 15, 18');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fad7de91-85f0-4c65-acbd-5f250476e60e', '4fb4bd2c-85ff-4380-a2e8-54da6d9abba9', 1, '4, 15, 15, 17');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfd09e59-0654-4bdc-8c00-91e61f571025', '4fb4bd2c-85ff-4380-a2e8-54da6d9abba9', 2, '3, 15, 15, 18');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44541cba-156a-4707-9c1e-3ae00f6dd8d3', '4fb4bd2c-85ff-4380-a2e8-54da6d9abba9', 3, '4, 14, 14, 18');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4fb4bd2c-85ff-4380-a2e8-54da6d9abba9', '72a84144-5db1-49d0-97e8-d4650e3ad6fa', 'Using A=1...Z=26: D=4, O=15, O=15, R=18.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('199a749a-f296-44eb-abc5-dbc7df115bd2', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 6, 'Pointing to a photograph, Rina said, ''He is the son of my grandfather''s only child.'' How is the man in the photograph related to Rina?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58b2a775-80fb-4263-837f-fa1f906cd8c7', '199a749a-f296-44eb-abc5-dbc7df115bd2', 0, 'Father');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99f7dcbf-7da0-488b-a139-2089a3d972af', '199a749a-f296-44eb-abc5-dbc7df115bd2', 1, 'Brother');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62f85f4d-5b31-4549-a2ee-a43f36603aeb', '199a749a-f296-44eb-abc5-dbc7df115bd2', 2, 'Uncle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('944af271-e6cf-4652-b372-8eccfd229517', '199a749a-f296-44eb-abc5-dbc7df115bd2', 3, 'Cousin');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('199a749a-f296-44eb-abc5-dbc7df115bd2', '99f7dcbf-7da0-488b-a139-2089a3d972af', 'Grandfather''s only child is Rina''s own parent; the parent''s son is Rina''s brother.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b65e7097-8f39-429b-b2da-719f90dded4b', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 7, 'A man walks 4km north, turns right and walks 3km, then turns right again and walks 4km. How far is he from the starting point?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('655d2051-7834-4269-81bd-e43e1afdd0ac', 'b65e7097-8f39-429b-b2da-719f90dded4b', 0, '3km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fabd3cf2-1d8b-4a63-b0ce-563e5f43436b', 'b65e7097-8f39-429b-b2da-719f90dded4b', 1, '4km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b251eb7f-8c23-470f-992f-b92231007629', 'b65e7097-8f39-429b-b2da-719f90dded4b', 2, '5km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93ef1569-a408-4400-a50c-7e262e62c121', 'b65e7097-8f39-429b-b2da-719f90dded4b', 3, '11km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b65e7097-8f39-429b-b2da-719f90dded4b', '655d2051-7834-4269-81bd-e43e1afdd0ac', 'The two 4km legs (north, then south after the second right turn) cancel out, leaving only the 3km eastward displacement.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('219d46a2-ddc8-4009-9600-e79a906b502b', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 8, 'What is the angle between the hour and minute hands of a clock at 3:00?', 'Reasoning', 'Clock Angles', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d15754ae-14a5-4f31-bd9d-96725e0c5316', '219d46a2-ddc8-4009-9600-e79a906b502b', 0, '60°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67d94bce-5107-4814-8b94-d8abcc6ab9ea', '219d46a2-ddc8-4009-9600-e79a906b502b', 1, '75°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a9e518b-c7b8-4d4e-b82a-35228f6abed3', '219d46a2-ddc8-4009-9600-e79a906b502b', 2, '90°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('979d26aa-5f80-42cf-a4bf-40149733e035', '219d46a2-ddc8-4009-9600-e79a906b502b', 3, '120°');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('219d46a2-ddc8-4009-9600-e79a906b502b', '0a9e518b-c7b8-4d4e-b82a-35228f6abed3', 'At 3:00 the minute hand points at 12 and the hour hand at 3 — exactly a quarter of the clock face, i.e., 90°.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('413a17d5-b753-4914-aed8-0437c1817d30', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 9, 'In a class of 40 students, Rohan is 15th from the top. What is his rank from the bottom?', 'Reasoning', 'Ranking', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4203c7d4-05d2-4e1c-8be3-de3d792dd88a', '413a17d5-b753-4914-aed8-0437c1817d30', 0, '25');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3aeba0d3-3764-4237-8e75-8439369da54b', '413a17d5-b753-4914-aed8-0437c1817d30', 1, '26');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4fbb006a-778b-4e2f-beb3-7b2653097f52', '413a17d5-b753-4914-aed8-0437c1817d30', 2, '24');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('600a1437-aeb6-495c-b356-33a1c550b5ff', '413a17d5-b753-4914-aed8-0437c1817d30', 3, '27');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('413a17d5-b753-4914-aed8-0437c1817d30', '3aeba0d3-3764-4237-8e75-8439369da54b', 'Rank from bottom = total - rank from top + 1 = 40 - 15 + 1 = 26.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4fec56dd-55b2-488e-8bea-f4ae472df718', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 10, 'On a standard die, opposite faces always sum to 7. If the number 2 is on top, which number must be on the bottom?', 'Reasoning', 'Cube and Dice', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('761e85fe-a7e8-4da2-b4f0-7e27059946ff', '4fec56dd-55b2-488e-8bea-f4ae472df718', 0, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd814fb3-2645-4927-9fab-980ee2f778b6', '4fec56dd-55b2-488e-8bea-f4ae472df718', 1, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('271d2108-7504-48df-89e7-965dbe61a692', '4fec56dd-55b2-488e-8bea-f4ae472df718', 2, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ecfd22a2-9910-4064-9777-af0c4d6d3d4d', '4fec56dd-55b2-488e-8bea-f4ae472df718', 3, '3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4fec56dd-55b2-488e-8bea-f4ae472df718', 'bd814fb3-2645-4927-9fab-980ee2f778b6', 'Opposite faces sum to 7 on a standard die; if 2 is on top, the bottom face is 7−2=5.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('172f7e7e-e24e-4490-a6b3-6f6e8c34870c', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 11, 'Which Venn diagram best represents the relationship between: Teacher, Woman, Doctor?', 'Reasoning', 'Venn Diagram', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d3c0fe9-b0a4-49fb-bb17-83a9501bd700', '172f7e7e-e24e-4490-a6b3-6f6e8c34870c', 0, 'Three separate non-overlapping circles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8be50daa-89e5-4c91-a9c5-98dd9e5ea3c9', '172f7e7e-e24e-4490-a6b3-6f6e8c34870c', 1, 'Three circles all overlapping in a central region');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abc14bc2-6c69-49de-ac5c-ec20d0a9bcc5', '172f7e7e-e24e-4490-a6b3-6f6e8c34870c', 2, 'Two circles overlapping, third separate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6ec6aab-2963-4fb4-9bbd-5caab981923f', '172f7e7e-e24e-4490-a6b3-6f6e8c34870c', 3, 'One circle inside another');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('172f7e7e-e24e-4490-a6b3-6f6e8c34870c', '8be50daa-89e5-4c91-a9c5-98dd9e5ea3c9', 'A person can simultaneously be a teacher, a woman, and a doctor — all three categories can overlap, requiring three intersecting circles.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b82eefb6-7005-4651-b5d5-fb8e8ca18947', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 12, 'Which number does not belong: 8, 27, 64, 100, 125', 'Reasoning', 'Series and Analogy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a3a45e9-3b3b-4ac1-b679-6452f69a1186', 'b82eefb6-7005-4651-b5d5-fb8e8ca18947', 0, '27');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ee86138-e993-4906-bcd1-f0213d73987a', 'b82eefb6-7005-4651-b5d5-fb8e8ca18947', 1, '64');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('503300f9-ea59-4dc2-8161-c64ddd7b1661', 'b82eefb6-7005-4651-b5d5-fb8e8ca18947', 2, '100');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3921268f-dd1a-4d1c-9d73-b712cfad06cc', 'b82eefb6-7005-4651-b5d5-fb8e8ca18947', 3, '125');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b82eefb6-7005-4651-b5d5-fb8e8ca18947', '503300f9-ea59-4dc2-8161-c64ddd7b1661', '8,27,64,125 are perfect cubes (2³,3³,4³,5³); 100 is not a perfect cube.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e3b9c51f-43c3-43f9-a239-8249601f85c0', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 13, 'Find the odd one out: Triangle, Square, Pentagon, Sphere', 'Reasoning', 'Classification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d152552f-e036-4e5c-b0b7-1d246055e17e', 'e3b9c51f-43c3-43f9-a239-8249601f85c0', 0, 'Triangle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1bc66c78-76a6-4a98-9b9e-3c63d6a19cab', 'e3b9c51f-43c3-43f9-a239-8249601f85c0', 1, 'Square');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fcd7d2e9-397e-4dc7-ac70-167e5c4138cb', 'e3b9c51f-43c3-43f9-a239-8249601f85c0', 2, 'Pentagon');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f3d359ab-b44e-4781-9ded-a148ce81c15c', 'e3b9c51f-43c3-43f9-a239-8249601f85c0', 3, 'Sphere');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e3b9c51f-43c3-43f9-a239-8249601f85c0', 'f3d359ab-b44e-4781-9ded-a148ce81c15c', 'Triangle, square, and pentagon are 2D polygons; a sphere is a 3D solid.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fb2d1a91-d226-4e2e-9472-55b5cbc4e8c1', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 14, 'Find the missing term: 2, 5, 10, 17, 26, ?', 'Reasoning', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f84eaa4c-fba8-454e-959e-16462687c8a3', 'fb2d1a91-d226-4e2e-9472-55b5cbc4e8c1', 0, '35');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c5a5a4a-0907-4288-865a-1e7d1b0e6935', 'fb2d1a91-d226-4e2e-9472-55b5cbc4e8c1', 1, '36');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de7f5fee-904f-44b6-b4dc-0e6865ba4f83', 'fb2d1a91-d226-4e2e-9472-55b5cbc4e8c1', 2, '37');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e43d3a2-c355-482b-9c18-127725a6c1a5', 'fb2d1a91-d226-4e2e-9472-55b5cbc4e8c1', 3, '38');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fb2d1a91-d226-4e2e-9472-55b5cbc4e8c1', 'de7f5fee-904f-44b6-b4dc-0e6865ba4f83', 'Differences are 3,5,7,9,11 (consecutive odd numbers); 26+11=37.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('61fa7c1e-5c51-4f12-b669-240ea3c266ca', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 15, 'How many letters are there between K and S in the English alphabet?', 'Reasoning', 'Alphabet Test', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('665fed09-91a2-40c8-9f0e-fb7b9886f287', '61fa7c1e-5c51-4f12-b669-240ea3c266ca', 0, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('760373b8-d776-47ed-a1f7-f8712d3b4a2a', '61fa7c1e-5c51-4f12-b669-240ea3c266ca', 1, '7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62c522a0-ade0-4226-a5f9-2c8a9441c039', '61fa7c1e-5c51-4f12-b669-240ea3c266ca', 2, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a82b0227-5dd4-4da7-b432-6918e700431c', '61fa7c1e-5c51-4f12-b669-240ea3c266ca', 3, '9');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('61fa7c1e-5c51-4f12-b669-240ea3c266ca', '760373b8-d776-47ed-a1f7-f8712d3b4a2a', 'K is the 11th letter, S is the 19th; letters between them = 19-11-1 = 7.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4440f966-c3ee-46d8-80ae-38003b093148', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 16, 'If X is Y''s brother, Y is Z''s sister, and Z is W''s father, how is X related to W?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd029123-258f-4e52-acde-ba46668f5589', '4440f966-c3ee-46d8-80ae-38003b093148', 0, 'Grandfather');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc522f3e-12c8-44a6-bcd3-f5c3255461d9', '4440f966-c3ee-46d8-80ae-38003b093148', 1, 'Uncle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44c4578f-1aa1-4355-b38f-72468ff791e2', '4440f966-c3ee-46d8-80ae-38003b093148', 2, 'Father');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79ddbd3a-15ef-41bc-83f8-9d27e8fcbb87', '4440f966-c3ee-46d8-80ae-38003b093148', 3, 'Brother');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4440f966-c3ee-46d8-80ae-38003b093148', 'bc522f3e-12c8-44a6-bcd3-f5c3255461d9', 'Z is W''s father, and X is Z''s sibling (since X-Y are siblings and Y-Z are siblings) — so X is W''s uncle.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d21dc2b5-491c-4237-9ac3-e797f875def8', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 17, 'Statements: No cat is a dog. All dogs are animals. Conclusion: No cat is an animal. Is this valid?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4c4b536-34e9-4d77-b631-80a1f51a8080', 'd21dc2b5-491c-4237-9ac3-e797f875def8', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5740ef9-184a-4626-aac8-bc9dd3e7c0fa', 'd21dc2b5-491c-4237-9ac3-e797f875def8', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('137d3fbe-3688-4f51-905a-30df8a350ba2', 'd21dc2b5-491c-4237-9ac3-e797f875def8', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f7c78aa-c0ba-4d36-9c53-55ba56566235', 'd21dc2b5-491c-4237-9ac3-e797f875def8', 3, 'Partially valid');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d21dc2b5-491c-4237-9ac3-e797f875def8', 'f5740ef9-184a-4626-aac8-bc9dd3e7c0fa', 'The conclusion doesn''t follow — cats could still be animals through a different category path; the premises don''t support ''no cat is an animal'' at all.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d544f838-b343-4e28-ac72-cf88ca372052', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 18, 'Using the letters of the word ''GARDEN'' once each, which of the following CANNOT be formed?', 'Reasoning', 'Word Formation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec589935-1159-4671-afdf-8c48e777b686', 'd544f838-b343-4e28-ac72-cf88ca372052', 0, 'GRADE');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff6c27c6-1f85-4eab-ac96-4099e9c90fbe', 'd544f838-b343-4e28-ac72-cf88ca372052', 1, 'DANGER');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cb5698e-701b-45fb-a942-bbb9a2947d38', 'd544f838-b343-4e28-ac72-cf88ca372052', 2, 'RANGED');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9895942-343b-44df-8fd4-b23cf3b81318', 'd544f838-b343-4e28-ac72-cf88ca372052', 3, 'GARDENING');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d544f838-b343-4e28-ac72-cf88ca372052', 'f9895942-343b-44df-8fd4-b23cf3b81318', 'GARDENING uses letters (I, N twice) not available from GARDEN''s single set of six distinct letters; the other three are valid rearrangements/subsets.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8b1e0735-7863-45f0-a78c-9d8e6c669551', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 19, 'Find the next term: 3, 6, 12, 24, 48, ?', 'Reasoning', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c1cba62-9dff-4834-beea-1926a49252b8', '8b1e0735-7863-45f0-a78c-9d8e6c669551', 0, '72');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12a9d044-7b6a-4db2-bc2f-06406c2f8833', '8b1e0735-7863-45f0-a78c-9d8e6c669551', 1, '96');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59900e4d-5544-4548-8f82-c2f7cbc20432', '8b1e0735-7863-45f0-a78c-9d8e6c669551', 2, '84');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84d4ba7d-4e60-4f28-becc-104d57a1f5ac', '8b1e0735-7863-45f0-a78c-9d8e6c669551', 3, '100');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8b1e0735-7863-45f0-a78c-9d8e6c669551', '12a9d044-7b6a-4db2-bc2f-06406c2f8833', 'Each term doubles the previous; 48×2=96.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('86c3d6b1-61a9-406d-8088-0851b429c589', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 20, 'Facing south, a man turns 90° clockwise, then 180°. Which direction is he facing now?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7973e491-7ba1-4aad-8d39-a62712e991d3', '86c3d6b1-61a9-406d-8088-0851b429c589', 0, 'North');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7eee7559-c6a1-4727-8ca6-feba526c110b', '86c3d6b1-61a9-406d-8088-0851b429c589', 1, 'South');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c04d958-c6e6-4f18-88e6-15e82c3cc22e', '86c3d6b1-61a9-406d-8088-0851b429c589', 2, 'East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2a0894c-d111-466b-8903-8d0e88bd34d9', '86c3d6b1-61a9-406d-8088-0851b429c589', 3, 'West');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('86c3d6b1-61a9-406d-8088-0851b429c589', '5c04d958-c6e6-4f18-88e6-15e82c3cc22e', 'Starting south, 90° clockwise → west; another 180° → east.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('feaacc70-ea06-4996-aaa8-a4793dae2d9e', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 21, 'The present age of a father is 3 times his son''s age. After 12 years, the father''s age will be twice the son''s age. What is the son''s present age?', 'Reasoning', 'Age Puzzle', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c998280-2761-4ff1-ac9f-0cafa87759c0', 'feaacc70-ea06-4996-aaa8-a4793dae2d9e', 0, '10');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2533b89e-dec2-4424-9a77-85a2f7ab54ec', 'feaacc70-ea06-4996-aaa8-a4793dae2d9e', 1, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2068e69c-2da4-471c-8b1e-6a3947b6a759', 'feaacc70-ea06-4996-aaa8-a4793dae2d9e', 2, '14');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b17a8d1d-f4fa-4be3-9bd4-075c5c263e5d', 'feaacc70-ea06-4996-aaa8-a4793dae2d9e', 3, '16');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('feaacc70-ea06-4996-aaa8-a4793dae2d9e', '2533b89e-dec2-4424-9a77-85a2f7ab54ec', 'Let son=x, father=3x. After 12 years: 3x+12=2(x+12) → 3x+12=2x+24 → x=12.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('df5ae5d7-cc8c-42c6-a555-a4f815fa5337', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 22, 'In a 4x4 grid numbered 1-16 row-wise, what number is directly below the number 6?', 'Reasoning', 'Matrix Reasoning', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4ca574c-cd6a-4eeb-9f57-2fd3b19d218b', 'df5ae5d7-cc8c-42c6-a555-a4f815fa5337', 0, '9');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c5289ad-d229-409d-aeac-a18d88ce1dcd', 'df5ae5d7-cc8c-42c6-a555-a4f815fa5337', 1, '10');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d9d2a66-7489-4dd6-afcd-ad2df03558fb', 'df5ae5d7-cc8c-42c6-a555-a4f815fa5337', 2, '11');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a41e2ea-deac-4163-b9c6-2fa80c0a491f', 'df5ae5d7-cc8c-42c6-a555-a4f815fa5337', 3, '2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('df5ae5d7-cc8c-42c6-a555-a4f815fa5337', '3c5289ad-d229-409d-aeac-a18d88ce1dcd', 'In a 4-column grid, the number directly below any cell is that number + 4; 6+4=10.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c42718a4-59fb-479d-b18a-7e06ee36843c', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 23, 'Find the odd one out: Guitar, Violin, Flute, Tabla', 'Reasoning', 'Classification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('775b67b8-db40-423a-8aa7-dffe885e941b', 'c42718a4-59fb-479d-b18a-7e06ee36843c', 0, 'Guitar');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6692641-3b85-4e75-8012-856fc9c85739', 'c42718a4-59fb-479d-b18a-7e06ee36843c', 1, 'Violin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('14901697-a2a5-4c18-9aaf-f0e29f36a206', 'c42718a4-59fb-479d-b18a-7e06ee36843c', 2, 'Flute');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d28be616-419d-4886-9017-1674e7ca44c9', 'c42718a4-59fb-479d-b18a-7e06ee36843c', 3, 'Tabla');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c42718a4-59fb-479d-b18a-7e06ee36843c', '14901697-a2a5-4c18-9aaf-f0e29f36a206', 'Guitar, violin, and tabla can all be classified as string/percussion instruments played by direct contact technique groupings different from flute; specifically here flute is a wind instrument while the other three are not wind instruments.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('089a5dbd-1c0e-45d6-95e3-aca00a89323a', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 24, 'In a certain code, ''SUN'' is written as ''TVO'' (each letter shifted forward by 1). How is ''MOON'' written in the same code?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd17858c-3814-4555-ac0e-d6be9196ac66', '089a5dbd-1c0e-45d6-95e3-aca00a89323a', 0, 'NPPO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2adcc107-6916-4a42-82ca-e65c66591c30', '089a5dbd-1c0e-45d6-95e3-aca00a89323a', 1, 'NPPM');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f292c1c-444d-483c-a0ab-42d78eb7ade6', '089a5dbd-1c0e-45d6-95e3-aca00a89323a', 2, 'NPPN');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54c996d2-6492-4470-8f31-882a582c6aac', '089a5dbd-1c0e-45d6-95e3-aca00a89323a', 3, 'OPQN');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('089a5dbd-1c0e-45d6-95e3-aca00a89323a', 'dd17858c-3814-4555-ac0e-d6be9196ac66', 'Shifting each letter forward by 1: M->N, O->P, O->P, N->O, giving NPPO.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('904b2b2e-6142-4858-a5dc-8d1d2fd2023b', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 25, 'Find the odd one out: 121, 144, 169, 200, 225', 'Reasoning', 'Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('815b52f7-8aa7-4c4f-a4a2-39a9a2ea14f9', '904b2b2e-6142-4858-a5dc-8d1d2fd2023b', 0, '144');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('56effab6-c976-4bd0-a3f4-eef77dd0de15', '904b2b2e-6142-4858-a5dc-8d1d2fd2023b', 1, '169');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e460bd59-b714-44ed-8ebf-d2faeea7de20', '904b2b2e-6142-4858-a5dc-8d1d2fd2023b', 2, '200');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d56b08c0-b5d6-4ba9-9c19-f7e15022505e', '904b2b2e-6142-4858-a5dc-8d1d2fd2023b', 3, '225');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('904b2b2e-6142-4858-a5dc-8d1d2fd2023b', 'e460bd59-b714-44ed-8ebf-d2faeea7de20', '121,144,169,225 are perfect squares (11²,12²,13²,15²); 200 is not.', 'General Intelligence & Reasoning — authored from standard SSC CGL Tier 1 reasoning topics (analogy, classification, series, coding-decoding, blood relations, direction sense, mirror/water images, non-verbal reasoning, cube/dice, ranking); not copied from any official SSC question paper.');

-- ── Section: General Awareness (25 questions) — General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9233305b-c328-4ab6-bc1e-9cec48c06635', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 26, 'Who founded the Sarvodaya movement in India?', 'General Awareness', 'Indian History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31b0fd98-e081-475d-aca6-6079fc323aa0', '9233305b-c328-4ab6-bc1e-9cec48c06635', 0, 'Mahatma Gandhi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2895d8f-eee6-4a0f-98a6-8913e6bbbd7f', '9233305b-c328-4ab6-bc1e-9cec48c06635', 1, 'Vinoba Bhave');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9475cdba-b48e-4840-a0a3-7c6e6e6242fd', '9233305b-c328-4ab6-bc1e-9cec48c06635', 2, 'Jayaprakash Narayan');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5814ef4c-ca04-483f-9a53-5296cd8046a6', '9233305b-c328-4ab6-bc1e-9cec48c06635', 3, 'Acharya Kripalani');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9233305b-c328-4ab6-bc1e-9cec48c06635', 'a2895d8f-eee6-4a0f-98a6-8913e6bbbd7f', 'Vinoba Bhave founded the Sarvodaya movement (building on Gandhian principles), including the associated Bhoodan (land-gift) movement.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6f79056e-7e38-4254-b0c4-c263546d9b81', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 27, 'Which article of the Indian Constitution abolishes untouchability?', 'General Awareness', 'Indian Polity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f272de8-506d-4f21-ad1a-9ee154ce6bd4', '6f79056e-7e38-4254-b0c4-c263546d9b81', 0, 'Article 15');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('629334fc-847c-41d1-9fd4-6e5636610ad1', '6f79056e-7e38-4254-b0c4-c263546d9b81', 1, 'Article 17');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a155ae32-b9e9-4be0-a94c-5543fbfb09ed', '6f79056e-7e38-4254-b0c4-c263546d9b81', 2, 'Article 19');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db981958-60eb-4bc4-813a-f5459f23fb4d', '6f79056e-7e38-4254-b0c4-c263546d9b81', 3, 'Article 21');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6f79056e-7e38-4254-b0c4-c263546d9b81', '629334fc-847c-41d1-9fd4-6e5636610ad1', 'Article 17 abolishes untouchability and forbids its practice in any form.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('38709a0d-d008-4761-8dcf-bba002459046', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 28, 'Which is the largest freshwater lake in India?', 'General Awareness', 'Geography', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b06a114d-5d03-4a83-94a6-f9f10230d190', '38709a0d-d008-4761-8dcf-bba002459046', 0, 'Wular Lake');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48b7b4f8-e388-415f-80c1-80ad4723e856', '38709a0d-d008-4761-8dcf-bba002459046', 1, 'Dal Lake');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9b82542-d016-4d22-bf84-fe0aae63a9ab', '38709a0d-d008-4761-8dcf-bba002459046', 2, 'Chilika Lake');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1b28e0a-3aa4-4c47-884f-53b6a5115d4a', '38709a0d-d008-4761-8dcf-bba002459046', 3, 'Loktak Lake');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('38709a0d-d008-4761-8dcf-bba002459046', 'b06a114d-5d03-4a83-94a6-f9f10230d190', 'Wular Lake in Jammu & Kashmir is India''s largest freshwater lake (Chilika is the largest lake overall but is brackish/saltwater).', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('992d7706-ec83-45fa-845a-b86876684889', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 29, 'Who is the current apex regulator of the securities market in India?', 'General Awareness', 'Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31547b24-11b8-465b-bf75-9fe1da23bc9a', '992d7706-ec83-45fa-845a-b86876684889', 0, 'RBI');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05dc3bdf-ae78-45f5-b324-1e7650e76a37', '992d7706-ec83-45fa-845a-b86876684889', 1, 'SEBI');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3620fbf6-dece-4710-a9ae-74d90e17488d', '992d7706-ec83-45fa-845a-b86876684889', 2, 'IRDAI');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('257a259d-c36f-4abe-a2d1-c292da1acf58', '992d7706-ec83-45fa-845a-b86876684889', 3, 'NABARD');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('992d7706-ec83-45fa-845a-b86876684889', '05dc3bdf-ae78-45f5-b324-1e7650e76a37', 'SEBI (Securities and Exchange Board of India) regulates India''s securities market.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('78721d37-c6d4-4d8b-a033-3e8831c4260f', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 30, 'Which vitamin is synthesized in human skin upon exposure to sunlight?', 'General Awareness', 'Science', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c32cda2d-7d97-44cb-a1bd-1f1e06fff5c7', '78721d37-c6d4-4d8b-a033-3e8831c4260f', 0, 'Vitamin A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e75b107e-fbc1-4387-9e56-d0975b62c90a', '78721d37-c6d4-4d8b-a033-3e8831c4260f', 1, 'Vitamin C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd5475ba-f13d-4bab-ae18-607362682933', '78721d37-c6d4-4d8b-a033-3e8831c4260f', 2, 'Vitamin D');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5fe5e59-7f63-4ddf-b2f5-9212c85aed94', '78721d37-c6d4-4d8b-a033-3e8831c4260f', 3, 'Vitamin K');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('78721d37-c6d4-4d8b-a033-3e8831c4260f', 'dd5475ba-f13d-4bab-ae18-607362682933', 'Vitamin D is synthesized in the skin through a photochemical reaction triggered by UVB sunlight exposure.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bd7507be-1f9f-4fef-b99e-759ee85eaaa6', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 31, 'Kathakali classical dance form originates from which state?', 'General Awareness', 'Art & Culture', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e94f6c1b-7b85-42fe-a63f-2c43b8629095', 'bd7507be-1f9f-4fef-b99e-759ee85eaaa6', 0, 'Tamil Nadu');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ed4c526-495e-4990-9375-31c3f6d9cc38', 'bd7507be-1f9f-4fef-b99e-759ee85eaaa6', 1, 'Kerala');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1fa6bc52-3100-4132-b944-d6d920f32f44', 'bd7507be-1f9f-4fef-b99e-759ee85eaaa6', 2, 'Karnataka');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c9d044b-cdb1-45fb-8e39-363a27c416c2', 'bd7507be-1f9f-4fef-b99e-759ee85eaaa6', 3, 'Andhra Pradesh');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bd7507be-1f9f-4fef-b99e-759ee85eaaa6', '2ed4c526-495e-4990-9375-31c3f6d9cc38', 'Kathakali is a classical dance-drama form that originated in Kerala.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7a4cfde7-3aac-43bc-9ce2-ff94abc586dc', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 32, 'The Battle of Buxar, which further consolidated British control over Bengal, Bihar, and Odisha, was fought in which year?', 'General Awareness', 'Indian History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b998286-ad43-43ce-a1d4-7e82fbcc9a95', '7a4cfde7-3aac-43bc-9ce2-ff94abc586dc', 0, '1757');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a9a6819-fda4-4c7d-8bd0-61c7dafe01f0', '7a4cfde7-3aac-43bc-9ce2-ff94abc586dc', 1, '1764');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c40d014f-a3d2-4cc3-be66-a4e7b8650b41', '7a4cfde7-3aac-43bc-9ce2-ff94abc586dc', 2, '1857');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c279538-3be6-4c7f-b8f8-ddbb52d2d218', '7a4cfde7-3aac-43bc-9ce2-ff94abc586dc', 3, '1600');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7a4cfde7-3aac-43bc-9ce2-ff94abc586dc', '0a9a6819-fda4-4c7d-8bd0-61c7dafe01f0', 'The Battle of Buxar (1764) resulted in the British East India Company gaining the Diwani (revenue rights) of Bengal, Bihar, and Odisha, consolidating control begun after Plassey.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('335bce61-fa33-41b8-8c2f-d80fdfe9c425', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 33, 'The Directive Principles of State Policy are contained in which Part of the Constitution?', 'General Awareness', 'Polity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5373902e-8157-4f08-86d1-74bbcb8e671e', '335bce61-fa33-41b8-8c2f-d80fdfe9c425', 0, 'Part III');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef5bb347-553d-4ae9-ab2e-e8f44189757f', '335bce61-fa33-41b8-8c2f-d80fdfe9c425', 1, 'Part IV');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd5fe795-e503-4c05-b1f7-6f5c61012707', '335bce61-fa33-41b8-8c2f-d80fdfe9c425', 2, 'Part V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a215e1b2-c0be-456b-a1bf-9e6ec1214cd4', '335bce61-fa33-41b8-8c2f-d80fdfe9c425', 3, 'Part VI');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('335bce61-fa33-41b8-8c2f-d80fdfe9c425', 'ef5bb347-553d-4ae9-ab2e-e8f44189757f', 'Part IV of the Constitution contains the Directive Principles of State Policy.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('06199966-9259-41aa-8f28-67c1a59ba02d', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 34, 'Which state has the longest coastline in India?', 'General Awareness', 'Geography', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18b68268-6707-4c67-9848-d537d26a28f9', '06199966-9259-41aa-8f28-67c1a59ba02d', 0, 'Tamil Nadu');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d458087-7cab-40ea-938a-c4ad1329a38e', '06199966-9259-41aa-8f28-67c1a59ba02d', 1, 'Andhra Pradesh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a696ea3b-ed31-421f-987c-21cb81ab11bd', '06199966-9259-41aa-8f28-67c1a59ba02d', 2, 'Gujarat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f22bfec-b762-47c6-b76b-7bb3a2abda3d', '06199966-9259-41aa-8f28-67c1a59ba02d', 3, 'Kerala');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('06199966-9259-41aa-8f28-67c1a59ba02d', 'a696ea3b-ed31-421f-987c-21cb81ab11bd', 'Gujarat has India''s longest coastline among all states.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('034a9145-e110-4fc1-93c4-854b1910e9c8', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 35, 'GST in India is a form of which type of tax?', 'General Awareness', 'Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e291b040-aa60-49eb-beea-747488a0411b', '034a9145-e110-4fc1-93c4-854b1910e9c8', 0, 'Direct tax');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ab0e7e3-93c5-4ae7-8811-10cf0401a796', '034a9145-e110-4fc1-93c4-854b1910e9c8', 1, 'Indirect tax');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2988189f-416b-4a12-86a6-033ed2135928', '034a9145-e110-4fc1-93c4-854b1910e9c8', 2, 'Wealth tax');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cac787c5-c835-4276-a40b-e3f00edf6a2c', '034a9145-e110-4fc1-93c4-854b1910e9c8', 3, 'Capital gains tax');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('034a9145-e110-4fc1-93c4-854b1910e9c8', '4ab0e7e3-93c5-4ae7-8811-10cf0401a796', 'GST (Goods and Services Tax) is an indirect tax levied on the supply of goods and services.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('29b7e46c-ad2a-4dff-bb7e-504f63647920', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 36, 'The SI unit of electric current is:', 'General Awareness', 'Science', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e18038d8-82e5-4115-90e7-d71827f43107', '29b7e46c-ad2a-4dff-bb7e-504f63647920', 0, 'Volt');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ef7532f-e3d9-41b2-9494-7e1a9ee77235', '29b7e46c-ad2a-4dff-bb7e-504f63647920', 1, 'Ohm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5648ea94-5328-44e5-9005-48496b1d7562', '29b7e46c-ad2a-4dff-bb7e-504f63647920', 2, 'Ampere');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed483fdc-cd42-4a6e-b700-7d5dbe2da649', '29b7e46c-ad2a-4dff-bb7e-504f63647920', 3, 'Watt');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('29b7e46c-ad2a-4dff-bb7e-504f63647920', '5648ea94-5328-44e5-9005-48496b1d7562', 'The Ampere is the SI base unit of electric current.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('04b5e174-94f7-4b2d-854f-9ef1dba531da', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 37, 'The Ranji Trophy is associated with which sport?', 'General Awareness', 'Sports', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ddd174a0-39e7-4a03-8989-bfac6375fd0d', '04b5e174-94f7-4b2d-854f-9ef1dba531da', 0, 'Hockey');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('303cd2e4-d09e-4dea-a9ed-3599f1c29c73', '04b5e174-94f7-4b2d-854f-9ef1dba531da', 1, 'Football');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e956b55-f5a4-493b-a48c-1fb67c6785c3', '04b5e174-94f7-4b2d-854f-9ef1dba531da', 2, 'Cricket');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0147f2b4-c307-47a4-b3eb-44bf646ca31c', '04b5e174-94f7-4b2d-854f-9ef1dba531da', 3, 'Badminton');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('04b5e174-94f7-4b2d-854f-9ef1dba531da', '6e956b55-f5a4-493b-a48c-1fb67c6785c3', 'The Ranji Trophy is India''s premier domestic first-class cricket championship.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('edea45d2-eefc-40d3-869e-3bcb8845ffbb', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 38, 'Who was the first Indian-born Governor-General of independent India?', 'General Awareness', 'Indian History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54f39868-5733-4258-ad4b-583be73cb7aa', 'edea45d2-eefc-40d3-869e-3bcb8845ffbb', 0, 'Lord Mountbatten');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a57c118d-133f-4a23-a9a7-d29ada8aa6f2', 'edea45d2-eefc-40d3-869e-3bcb8845ffbb', 1, 'C. Rajagopalachari');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd3bb64b-f739-4854-be72-aa0829ecab68', 'edea45d2-eefc-40d3-869e-3bcb8845ffbb', 2, 'Jawaharlal Nehru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f682981-047b-4eb6-b55a-9bd769970578', 'edea45d2-eefc-40d3-869e-3bcb8845ffbb', 3, 'Rajendra Prasad');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('edea45d2-eefc-40d3-869e-3bcb8845ffbb', 'a57c118d-133f-4a23-a9a7-d29ada8aa6f2', 'C. Rajagopalachari succeeded Lord Mountbatten in 1948, becoming the first and only Indian-born person to hold the office of Governor-General of independent India.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ba6dc088-275d-4232-868d-b610cd142b05', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 39, 'The minimum age to become a member of the Lok Sabha is:', 'General Awareness', 'Polity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a507417-feaf-4404-8dec-784d17268c61', 'ba6dc088-275d-4232-868d-b610cd142b05', 0, '21 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b4c886c-5655-4c3e-913c-d89e2c66d5e3', 'ba6dc088-275d-4232-868d-b610cd142b05', 1, '25 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d77fa32-d55b-49ca-b8b7-9b86bc995405', 'ba6dc088-275d-4232-868d-b610cd142b05', 2, '30 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c81ef62e-c9cc-4dca-bc0d-964947f975e3', 'ba6dc088-275d-4232-868d-b610cd142b05', 3, '35 years');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ba6dc088-275d-4232-868d-b610cd142b05', '6b4c886c-5655-4c3e-913c-d89e2c66d5e3', 'The minimum age to contest and become a member of the Lok Sabha is 25 years.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4cfd3949-f93f-4598-a03a-6e422a00c03c', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 40, 'Mount K2, the second-highest mountain peak in the world, is located in which mountain range?', 'General Awareness', 'Geography', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1de2f529-3a09-4da9-a06b-0c4d1139c408', '4cfd3949-f93f-4598-a03a-6e422a00c03c', 0, 'Himalayas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f7e755b-0281-45b8-9274-759885431f8f', '4cfd3949-f93f-4598-a03a-6e422a00c03c', 1, 'Karakoram');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8153c0da-017f-4ac8-81ff-65ebc3e72eac', '4cfd3949-f93f-4598-a03a-6e422a00c03c', 2, 'Hindu Kush');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ddf63457-a418-43a4-8e09-84e0baa78b0f', '4cfd3949-f93f-4598-a03a-6e422a00c03c', 3, 'Pamir');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4cfd3949-f93f-4598-a03a-6e422a00c03c', '2f7e755b-0281-45b8-9274-759885431f8f', 'K2 is part of the Karakoram mountain range, straddling the border between Pakistan-administered Kashmir and China.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('147628ca-3c99-4c57-9c94-7959aea46ca5', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 41, 'Which committee''s recommendations led to the establishment of NABARD?', 'General Awareness', 'Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff9bc845-6db9-4771-885c-49bc149e18d7', '147628ca-3c99-4c57-9c94-7959aea46ca5', 0, 'Narasimham Committee');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8218470e-ab3c-46f5-aa31-c44ce101142a', '147628ca-3c99-4c57-9c94-7959aea46ca5', 1, 'Shivaraman Committee');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('065f4e30-790e-4520-8365-ce547f95dfa7', '147628ca-3c99-4c57-9c94-7959aea46ca5', 2, 'Chakravarty Committee');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5fa7e2d-a7d2-4140-96b6-35c80db9d52a', '147628ca-3c99-4c57-9c94-7959aea46ca5', 3, 'Raja Chelliah Committee');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('147628ca-3c99-4c57-9c94-7959aea46ca5', '8218470e-ab3c-46f5-aa31-c44ce101142a', 'NABARD was established in 1982 based on the recommendations of the Shivaraman Committee.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('35503050-e17b-409f-a9b8-b4d3e9e3d7a2', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 42, 'Which gas is commonly known as ''laughing gas''?', 'General Awareness', 'Science', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('238ea33d-2d04-4033-8147-04c32a080832', '35503050-e17b-409f-a9b8-b4d3e9e3d7a2', 0, 'Carbon dioxide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eec65d38-6254-47c2-8491-ba86b66470b5', '35503050-e17b-409f-a9b8-b4d3e9e3d7a2', 1, 'Nitrous oxide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fff51dff-8319-4059-a009-945eb0251e35', '35503050-e17b-409f-a9b8-b4d3e9e3d7a2', 2, 'Methane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('edcb24bc-8bca-4160-90c3-d210c88fdbf2', '35503050-e17b-409f-a9b8-b4d3e9e3d7a2', 3, 'Ozone');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('35503050-e17b-409f-a9b8-b4d3e9e3d7a2', 'eec65d38-6254-47c2-8491-ba86b66470b5', 'Nitrous oxide (N₂O) is commonly known as laughing gas, historically used as a mild anesthetic.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('109b7922-d742-4b38-b96a-7bca032422ee', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 43, 'The Khajuraho temples, known for their intricate sculptures, are located in which state?', 'General Awareness', 'Art & Culture', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1828bb3-f39d-4046-a6f2-4c07b886123f', '109b7922-d742-4b38-b96a-7bca032422ee', 0, 'Rajasthan');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c64c5d4b-267b-47da-a558-2f1e3a211a2e', '109b7922-d742-4b38-b96a-7bca032422ee', 1, 'Madhya Pradesh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32d9aabb-d009-43cb-9e86-6e10ac0d38e4', '109b7922-d742-4b38-b96a-7bca032422ee', 2, 'Uttar Pradesh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce3a1132-d59a-4e33-ba67-313db78e29de', '109b7922-d742-4b38-b96a-7bca032422ee', 3, 'Odisha');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('109b7922-d742-4b38-b96a-7bca032422ee', 'c64c5d4b-267b-47da-a558-2f1e3a211a2e', 'The Khajuraho Group of Monuments is located in Madhya Pradesh.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('57fc883b-f2ab-41df-a295-97e5cdc5a47a', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 44, 'The Non-Cooperation Movement, launched by Mahatma Gandhi in response to the Jallianwala Bagh massacre and the Khilafat issue, began in which year?', 'General Awareness', 'Indian History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e5211b7-e568-4a39-8660-3a42e672a54c', '57fc883b-f2ab-41df-a295-97e5cdc5a47a', 0, '1919');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5dd7ce1-82a9-451c-8c03-a38c81c88719', '57fc883b-f2ab-41df-a295-97e5cdc5a47a', 1, '1920');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dedc4476-55fc-448c-b74b-2890dddc4558', '57fc883b-f2ab-41df-a295-97e5cdc5a47a', 2, '1922');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('619bbf47-d81b-4a9d-bfb5-a80d19487570', '57fc883b-f2ab-41df-a295-97e5cdc5a47a', 3, '1930');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('57fc883b-f2ab-41df-a295-97e5cdc5a47a', 'a5dd7ce1-82a9-451c-8c03-a38c81c88719', 'The Non-Cooperation Movement was launched in 1920, India''s first genuinely mass nationwide movement led by Gandhi, and was called off in 1922 after the Chauri Chaura incident.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('97b4f04d-1713-44ac-9a6e-74dd2aa39e52', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 45, 'Who appoints the Chief Justice of India?', 'General Awareness', 'Polity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c5ad7ac-8035-4331-9f7b-c62b4c781b13', '97b4f04d-1713-44ac-9a6e-74dd2aa39e52', 0, 'Prime Minister');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6b33f00-152c-4496-931c-19df7e78b275', '97b4f04d-1713-44ac-9a6e-74dd2aa39e52', 1, 'President');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b77b741-c990-4b30-b197-5603fc1d138d', '97b4f04d-1713-44ac-9a6e-74dd2aa39e52', 2, 'Parliament');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b915ef7-6a32-4dd9-ae59-2e148629212b', '97b4f04d-1713-44ac-9a6e-74dd2aa39e52', 3, 'Chief Justice''s own predecessor');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('97b4f04d-1713-44ac-9a6e-74dd2aa39e52', 'd6b33f00-152c-4496-931c-19df7e78b275', 'The President of India formally appoints the Chief Justice of India, per constitutional procedure and established convention.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0451d5ae-2925-4c96-b699-fdf5e2489ec2', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 46, 'The Tropic of Cancer does NOT pass through which of the following Indian states?', 'General Awareness', 'Geography', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('130c6131-5770-48bf-b17c-70287865e555', '0451d5ae-2925-4c96-b699-fdf5e2489ec2', 0, 'Gujarat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('765cd330-c8d3-4496-8757-6335bd475ecd', '0451d5ae-2925-4c96-b699-fdf5e2489ec2', 1, 'Madhya Pradesh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a74f095-c882-41a7-8931-3192923b652c', '0451d5ae-2925-4c96-b699-fdf5e2489ec2', 2, 'Kerala');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbedf56e-aca4-4fa0-848c-17786d47d16a', '0451d5ae-2925-4c96-b699-fdf5e2489ec2', 3, 'West Bengal');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0451d5ae-2925-4c96-b699-fdf5e2489ec2', '2a74f095-c882-41a7-8931-3192923b652c', 'The Tropic of Cancer passes through 8 Indian states including Gujarat, Madhya Pradesh, and West Bengal, but Kerala (further south) is not among them.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('13598a21-5fd6-43d9-9559-c2b72e517311', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 47, 'The Reserve Bank of India was nationalized in which year?', 'General Awareness', 'Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a2b1d1e-0b7a-4364-b97b-4ab3fb878ecb', '13598a21-5fd6-43d9-9559-c2b72e517311', 0, '1935');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa994b67-d597-4b3d-bb51-a3b4d2beeb2d', '13598a21-5fd6-43d9-9559-c2b72e517311', 1, '1947');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c58bd00-692d-41e4-81da-db234ebdbcea', '13598a21-5fd6-43d9-9559-c2b72e517311', 2, '1949');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f75e6f3-e9a4-4813-ba9d-452398ac1f52', '13598a21-5fd6-43d9-9559-c2b72e517311', 3, '1969');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('13598a21-5fd6-43d9-9559-c2b72e517311', '0c58bd00-692d-41e4-81da-db234ebdbcea', 'The RBI, originally established in 1935 as a private shareholders'' bank, was nationalized in 1949.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fd38f0ac-835b-453c-8001-1840cc1af627', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 48, 'Which part of the human brain is primarily responsible for regulating balance and coordination?', 'General Awareness', 'Science', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abbce2be-884b-4c2e-a282-30d7f13e6900', 'fd38f0ac-835b-453c-8001-1840cc1af627', 0, 'Cerebrum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfdd71fa-d8da-428e-ad86-f720dbcd6325', 'fd38f0ac-835b-453c-8001-1840cc1af627', 1, 'Cerebellum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68a64723-a830-4284-bd23-c565f655ba07', 'fd38f0ac-835b-453c-8001-1840cc1af627', 2, 'Medulla oblongata');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a92cd4fd-e990-49bc-9ba3-64d402bdbc24', 'fd38f0ac-835b-453c-8001-1840cc1af627', 3, 'Hypothalamus');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fd38f0ac-835b-453c-8001-1840cc1af627', 'cfdd71fa-d8da-428e-ad86-f720dbcd6325', 'The cerebellum primarily regulates balance, posture, and coordination of voluntary movements.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('936ec569-73e3-4167-a1e9-8513526d1033', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 49, 'The term ''Grand Slam'' in tennis refers to winning which four tournaments in a calendar year?', 'General Awareness', 'Sports', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8df43a0-fad0-484e-b65d-c93a169161eb', '936ec569-73e3-4167-a1e9-8513526d1033', 0, 'Australian Open, French Open, Wimbledon, US Open');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c192e227-ff60-4711-b544-a73631c740b7', '936ec569-73e3-4167-a1e9-8513526d1033', 1, 'Australian Open, French Open, US Open, ATP Finals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('028c9590-9f99-4507-b1db-27398d9fa6aa', '936ec569-73e3-4167-a1e9-8513526d1033', 2, 'Wimbledon, US Open, ATP Finals, Davis Cup');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('22b91a7e-e004-466f-8f58-248d4e296d77', '936ec569-73e3-4167-a1e9-8513526d1033', 3, 'French Open, Wimbledon, US Open, Davis Cup');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('936ec569-73e3-4167-a1e9-8513526d1033', 'f8df43a0-fad0-484e-b65d-c93a169161eb', 'The four Grand Slam tournaments are the Australian Open, French Open, Wimbledon, and the US Open.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9cb60ddb-536f-42fb-a80b-d04d2d6c94fc', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 50, 'The Dandi March (Salt Satyagraha) was led by Mahatma Gandhi in which year?', 'General Awareness', 'Indian History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9be1537-99e0-464f-81ef-658f08897d55', '9cb60ddb-536f-42fb-a80b-d04d2d6c94fc', 0, '1920');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1bf96b1-b061-405d-aa2c-d977e3c23a90', '9cb60ddb-536f-42fb-a80b-d04d2d6c94fc', 1, '1930');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bbdf9a3-5371-4429-b439-65238dafd540', '9cb60ddb-536f-42fb-a80b-d04d2d6c94fc', 2, '1942');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('889b4429-f3bd-4ff7-bd2c-9da64f3e200b', '9cb60ddb-536f-42fb-a80b-d04d2d6c94fc', 3, '1919');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9cb60ddb-536f-42fb-a80b-d04d2d6c94fc', 'd1bf96b1-b061-405d-aa2c-d977e3c23a90', 'Gandhi led the Dandi March, a form of civil disobedience against the British salt tax, in 1930.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science, art & culture) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

-- ── Section: Quantitative Aptitude (25 questions) — Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f7ab2549-7fdf-4af2-97ca-855f5d2b2012', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 51, 'If 40% of a number is 200, what is the number?', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f020fee-87d6-426b-b8dd-240d9bbd3c0d', 'f7ab2549-7fdf-4af2-97ca-855f5d2b2012', 0, '400');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('464f622e-c8d7-4b52-8c56-6bc5956b8271', 'f7ab2549-7fdf-4af2-97ca-855f5d2b2012', 1, '450');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('957991d4-02eb-498f-9190-688cf87bf709', 'f7ab2549-7fdf-4af2-97ca-855f5d2b2012', 2, '500');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4eb41c74-f775-49f8-93ee-9875dd106c63', 'f7ab2549-7fdf-4af2-97ca-855f5d2b2012', 3, '550');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f7ab2549-7fdf-4af2-97ca-855f5d2b2012', '957991d4-02eb-498f-9190-688cf87bf709', '40% of x = 200 → x = 200/0.4 = 500.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('16d08222-9fe6-4f5f-8314-92061a6c7073', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 52, 'A shopkeeper buys an item for ₹800 and sells it at a 25% profit. What is the selling price?', 'Quantitative Aptitude', 'Profit and Loss', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79fcd47c-72a6-431c-8b5c-7012fbb88b89', '16d08222-9fe6-4f5f-8314-92061a6c7073', 0, '₹900');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('687fd304-770e-4435-802a-acb08947f8bb', '16d08222-9fe6-4f5f-8314-92061a6c7073', 1, '₹950');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6d73b79-3aed-4dc1-976a-95e47e70300e', '16d08222-9fe6-4f5f-8314-92061a6c7073', 2, '₹1000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('400c976b-8af6-4400-8e79-ef4f29165b42', '16d08222-9fe6-4f5f-8314-92061a6c7073', 3, '₹1050');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('16d08222-9fe6-4f5f-8314-92061a6c7073', 'c6d73b79-3aed-4dc1-976a-95e47e70300e', 'Selling price = 800 × 1.25 = ₹1000.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8d8f2e81-edc0-404c-9498-d312e5ffa3ef', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 53, 'Find the simple interest on ₹5000 at 8% per annum for 3 years.', 'Quantitative Aptitude', 'Simple Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0674f061-8366-4d77-9a95-4d3b1e09b668', '8d8f2e81-edc0-404c-9498-d312e5ffa3ef', 0, '₹1000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48aa7886-0027-48d7-b8fc-7d15a13d96a7', '8d8f2e81-edc0-404c-9498-d312e5ffa3ef', 1, '₹1100');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79636a83-873d-45f7-9ea2-e2eae728042f', '8d8f2e81-edc0-404c-9498-d312e5ffa3ef', 2, '₹1200');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d471723-9132-46ea-b77c-a8208f0f3fe2', '8d8f2e81-edc0-404c-9498-d312e5ffa3ef', 3, '₹1300');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8d8f2e81-edc0-404c-9498-d312e5ffa3ef', '79636a83-873d-45f7-9ea2-e2eae728042f', 'SI = (P×R×T)/100 = (5000×8×3)/100 = ₹1200.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1205d58d-72a1-46d5-8fb1-178751d17fa9', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 54, 'A can finish a job in 12 days, B in 18 days. Working together, how many days will they take?', 'Quantitative Aptitude', 'Time and Work', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb359889-73d5-4587-8e73-836c349efacf', '1205d58d-72a1-46d5-8fb1-178751d17fa9', 0, '6.2 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea5c7623-ac50-4234-8221-343331eb4ffa', '1205d58d-72a1-46d5-8fb1-178751d17fa9', 1, '7.2 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1111f7b-7e44-4dec-a44c-96d9463f1a04', '1205d58d-72a1-46d5-8fb1-178751d17fa9', 2, '8.2 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07e46fa1-d25c-49b7-a1e9-c1c9fdde500c', '1205d58d-72a1-46d5-8fb1-178751d17fa9', 3, '9.2 days');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1205d58d-72a1-46d5-8fb1-178751d17fa9', 'ea5c7623-ac50-4234-8221-343331eb4ffa', 'Combined rate = 1/12+1/18 = 3/36+2/36 = 5/36 per day; time = 36/5 = 7.2 days.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('761b74c6-a478-44f4-bb7b-885997bc7889', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 55, 'A train travels 300km in 5 hours. What is its speed in km/h?', 'Quantitative Aptitude', 'Speed, Distance, Time', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e27258bf-5a1b-4ad9-8e7a-f18c1e82dc4b', '761b74c6-a478-44f4-bb7b-885997bc7889', 0, '50');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f63543c4-d19a-4996-b240-35b7d0154ba3', '761b74c6-a478-44f4-bb7b-885997bc7889', 1, '60');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b221fc6-7347-4921-9f6f-af948d6dd6bc', '761b74c6-a478-44f4-bb7b-885997bc7889', 2, '65');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f7260f4-da2d-49ee-81b6-5c99a78f3ce6', '761b74c6-a478-44f4-bb7b-885997bc7889', 3, '70');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('761b74c6-a478-44f4-bb7b-885997bc7889', 'f63543c4-d19a-4996-b240-35b7d0154ba3', 'Speed = distance/time = 300/5 = 60 km/h.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('daffa72d-1588-48e9-a360-90116bd00ff9', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 56, 'Divide ₹1200 between A and B in the ratio 3:5. What is B''s share?', 'Quantitative Aptitude', 'Ratio and Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d879dfe-7112-4dea-97e6-cc9520085809', 'daffa72d-1588-48e9-a360-90116bd00ff9', 0, '₹450');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1557caec-daf0-4f60-999d-7ad70b3f0959', 'daffa72d-1588-48e9-a360-90116bd00ff9', 1, '₹600');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d324f433-bef8-4736-b091-260223724c4d', 'daffa72d-1588-48e9-a360-90116bd00ff9', 2, '₹750');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4890466c-48a3-48f7-9fbb-957e3a306e97', 'daffa72d-1588-48e9-a360-90116bd00ff9', 3, '₹800');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('daffa72d-1588-48e9-a360-90116bd00ff9', 'd324f433-bef8-4736-b091-260223724c4d', 'Total parts = 3+5=8; B''s share = (5/8)×1200 = ₹750.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('56075e58-6c57-429f-a61b-0c3f3819edbb', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 57, 'Find the average of the first 10 natural numbers.', 'Quantitative Aptitude', 'Average', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2635442f-2675-43eb-8a8d-f1b63c27dee9', '56075e58-6c57-429f-a61b-0c3f3819edbb', 0, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('527c1e49-7a47-407b-b01d-5edbf21c32bd', '56075e58-6c57-429f-a61b-0c3f3819edbb', 1, '5.5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('985ad2a3-eac7-488c-b545-4b18227eb612', '56075e58-6c57-429f-a61b-0c3f3819edbb', 2, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d2dd87f-a666-472e-90e5-644fbdcc06e2', '56075e58-6c57-429f-a61b-0c3f3819edbb', 3, '6.5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('56075e58-6c57-429f-a61b-0c3f3819edbb', '527c1e49-7a47-407b-b01d-5edbf21c32bd', 'Sum of first 10 natural numbers = 55; average = 55/10 = 5.5.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ea92cf62-5067-4e94-aeac-f34984bd6c9d', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 58, 'If x + 1/x = 5, find the value of x² + 1/x².', 'Quantitative Aptitude', 'Algebra', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66ff9b05-4b5a-45d1-b9dc-7265cb5201d6', 'ea92cf62-5067-4e94-aeac-f34984bd6c9d', 0, '21');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3886fb81-bd74-49d8-aa40-58c9d6d28979', 'ea92cf62-5067-4e94-aeac-f34984bd6c9d', 1, '23');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbb554fd-a369-4e53-8f4c-2be61a29a417', 'ea92cf62-5067-4e94-aeac-f34984bd6c9d', 2, '25');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08e1c042-16a1-41fe-8af4-2185ef523630', 'ea92cf62-5067-4e94-aeac-f34984bd6c9d', 3, '27');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ea92cf62-5067-4e94-aeac-f34984bd6c9d', '3886fb81-bd74-49d8-aa40-58c9d6d28979', 'x²+1/x² = (x+1/x)² - 2 = 25-2 = 23.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5d1b345e-a6b6-4858-b575-1a1b4e757f9c', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 59, 'Find the area of a triangle with base 12cm and height 8cm.', 'Quantitative Aptitude', 'Geometry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b29f026-8fc4-4544-92dd-2da6cd08805b', '5d1b345e-a6b6-4858-b575-1a1b4e757f9c', 0, '36 sq cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03345d3e-44e6-401f-a4ff-c4437b523efc', '5d1b345e-a6b6-4858-b575-1a1b4e757f9c', 1, '48 sq cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d918ac74-8269-47e9-bf51-6aa58751be96', '5d1b345e-a6b6-4858-b575-1a1b4e757f9c', 2, '60 sq cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8cced84-aac1-4308-bdc7-ded22c6a39b0', '5d1b345e-a6b6-4858-b575-1a1b4e757f9c', 3, '96 sq cm');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5d1b345e-a6b6-4858-b575-1a1b4e757f9c', '03345d3e-44e6-401f-a4ff-c4437b523efc', 'Area = (1/2)×base×height = (1/2)×12×8 = 48 sq cm.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2dec0b60-602b-4873-b51b-be11ee9a19a9', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 60, 'Find the volume of a cube with side length 5cm.', 'Quantitative Aptitude', 'Mensuration', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c29b6cd3-66be-45d0-b4ac-bd41593e9173', '2dec0b60-602b-4873-b51b-be11ee9a19a9', 0, '100 cubic cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f78cffd-1d78-4f51-be2a-d3d71edbad7f', '2dec0b60-602b-4873-b51b-be11ee9a19a9', 1, '125 cubic cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d3fd364-0ac1-4115-9a3d-30dc1beea0f1', '2dec0b60-602b-4873-b51b-be11ee9a19a9', 2, '150 cubic cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c78947c-5c79-4a70-897c-e1a7dcc570f1', '2dec0b60-602b-4873-b51b-be11ee9a19a9', 3, '175 cubic cm');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2dec0b60-602b-4873-b51b-be11ee9a19a9', '9f78cffd-1d78-4f51-be2a-d3d71edbad7f', 'Volume of a cube = side³ = 5³ = 125 cubic cm.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cd34ee50-3e46-4c4c-b07d-5eec4928da25', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 61, 'What is the value of sin(30°) + cos(60°)?', 'Quantitative Aptitude', 'Trigonometry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95193abe-80e7-43b5-b8ca-3490461dbfc6', 'cd34ee50-3e46-4c4c-b07d-5eec4928da25', 0, '0.5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00d3f87b-4e06-47f8-8955-8f6f5b129f07', 'cd34ee50-3e46-4c4c-b07d-5eec4928da25', 1, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9db1976-e733-47c7-a2fc-2706ef257985', 'cd34ee50-3e46-4c4c-b07d-5eec4928da25', 2, '1.5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ceb7e78d-684e-4d23-b95d-eaa0f73ab1c7', 'cd34ee50-3e46-4c4c-b07d-5eec4928da25', 3, '2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cd34ee50-3e46-4c4c-b07d-5eec4928da25', '00d3f87b-4e06-47f8-8955-8f6f5b129f07', 'sin(30°)=0.5, cos(60°)=0.5; sum = 1.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b2e29517-0e0a-4b22-9715-244187c97dfc', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 62, 'If a pie chart shows a sector representing 25% of a total of 800 students, how many students does that sector represent?', 'Quantitative Aptitude', 'Data Interpretation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6da9f3f1-dccc-4f8e-bf31-0fdefeb9720a', 'b2e29517-0e0a-4b22-9715-244187c97dfc', 0, '150');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd8207f0-fbcb-413f-bfcd-fb247d86e0ad', 'b2e29517-0e0a-4b22-9715-244187c97dfc', 1, '175');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2be1b162-f775-4b43-97e0-824aa1265368', 'b2e29517-0e0a-4b22-9715-244187c97dfc', 2, '200');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f612bac4-d46f-4798-9a14-b0cd230b014f', 'b2e29517-0e0a-4b22-9715-244187c97dfc', 3, '225');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b2e29517-0e0a-4b22-9715-244187c97dfc', '2be1b162-f775-4b43-97e0-824aa1265368', '25% of 800 = 200 students.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('50451c9b-d53b-466e-a6b9-9b09459f81ab', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 63, 'In what ratio must a shopkeeper mix tea worth ₹60/kg and ₹80/kg to get a mixture worth ₹65/kg?', 'Quantitative Aptitude', 'Mixture and Alligation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55583ba5-e999-4c9c-8fac-9127d904b4a1', '50451c9b-d53b-466e-a6b9-9b09459f81ab', 0, '1:3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1be0572-9e9b-4fbe-903e-b054caeeac42', '50451c9b-d53b-466e-a6b9-9b09459f81ab', 1, '3:1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a083a76-9754-4100-954e-b2841b98caa6', '50451c9b-d53b-466e-a6b9-9b09459f81ab', 2, '2:3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ad5ecc9-b964-4181-b0dc-342d8b459647', '50451c9b-d53b-466e-a6b9-9b09459f81ab', 3, '3:2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('50451c9b-d53b-466e-a6b9-9b09459f81ab', 'a1be0572-9e9b-4fbe-903e-b054caeeac42', 'By alligation: (80-65):(65-60) = 15:5 = 3:1 (ratio of cheaper to costlier).', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('961c5f46-c1e2-4090-8b40-d1ba6612bb91', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 64, 'A and B invest ₹4000 and ₹6000 respectively in a business. If the total profit is ₹5000, what is A''s share?', 'Quantitative Aptitude', 'Partnership', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ecf73b2-7f4d-4ed5-8827-a9cec151bdbf', '961c5f46-c1e2-4090-8b40-d1ba6612bb91', 0, '₹1500');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cad489a4-99c5-4085-b501-e00fa746699c', '961c5f46-c1e2-4090-8b40-d1ba6612bb91', 1, '₹2000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b86616d8-f5ce-4e21-b2ae-0aaf03431ff2', '961c5f46-c1e2-4090-8b40-d1ba6612bb91', 2, '₹2500');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b006b109-34a8-49bf-8679-115e4b94b003', '961c5f46-c1e2-4090-8b40-d1ba6612bb91', 3, '₹3000');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('961c5f46-c1e2-4090-8b40-d1ba6612bb91', 'cad489a4-99c5-4085-b501-e00fa746699c', 'Profit shared in investment ratio 4000:6000 = 2:3; A''s share = (2/5)×5000 = ₹2000.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1a66ef99-1772-4af8-9654-5b234d79c1e2', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 65, 'What is the smallest 4-digit number exactly divisible by 12?', 'Quantitative Aptitude', 'Number System', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('113a1234-5830-4c05-824a-6a4bde9f2ee7', '1a66ef99-1772-4af8-9654-5b234d79c1e2', 0, '1000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a1964fb-8c26-4f42-985b-2e42a3071929', '1a66ef99-1772-4af8-9654-5b234d79c1e2', 1, '1008');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c48000d3-ef60-4aa1-af78-9856a3118823', '1a66ef99-1772-4af8-9654-5b234d79c1e2', 2, '1002');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8bdcf99-89c4-497b-a202-f1bf5fee4dc9', '1a66ef99-1772-4af8-9654-5b234d79c1e2', 3, '1006');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1a66ef99-1772-4af8-9654-5b234d79c1e2', '6a1964fb-8c26-4f42-985b-2e42a3071929', '1000/12 ≈ 83.3, so the next multiple of 12 is 12×84=1008.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('97dc2d88-d70b-4e41-b399-4e8ad3dd4c13', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 66, 'Find the compound interest on ₹2000 at 10% per annum for 2 years, compounded annually.', 'Quantitative Aptitude', 'Compound Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c78d478a-5522-4758-bc7f-1b74d01c1f03', '97dc2d88-d70b-4e41-b399-4e8ad3dd4c13', 0, '₹400');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6c5ee00-b622-4f87-a330-597b603e11b6', '97dc2d88-d70b-4e41-b399-4e8ad3dd4c13', 1, '₹410');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18a69026-7479-45e2-845b-802450d7a544', '97dc2d88-d70b-4e41-b399-4e8ad3dd4c13', 2, '₹420');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15dc2357-bd56-4bcc-87ae-2d367fb51d4a', '97dc2d88-d70b-4e41-b399-4e8ad3dd4c13', 3, '₹440');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('97dc2d88-d70b-4e41-b399-4e8ad3dd4c13', '18a69026-7479-45e2-845b-802450d7a544', 'Amount = 2000×(1.1)² = 2000×1.21 = ₹2420; CI = 2420 − 2000 = ₹420.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2d929070-10e3-4f00-8b64-1c61053a7105', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 67, 'Two trains 100m and 150m long run in opposite directions at 30 km/h and 20 km/h. How long do they take to cross each other?', 'Quantitative Aptitude', 'Speed, Distance, Time — Relative', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d2b123e-be24-4d97-94ae-0f5aa790c03f', '2d929070-10e3-4f00-8b64-1c61053a7105', 0, '12 seconds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('170001bd-33c1-4ece-9091-8c01b26bfe44', '2d929070-10e3-4f00-8b64-1c61053a7105', 1, '18 seconds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('006ae674-f7d9-40e5-b1a4-5a291f6f93f3', '2d929070-10e3-4f00-8b64-1c61053a7105', 2, '24 seconds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3f43c6f-4da0-4a61-8906-825b22947311', '2d929070-10e3-4f00-8b64-1c61053a7105', 3, '30 seconds');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2d929070-10e3-4f00-8b64-1c61053a7105', '170001bd-33c1-4ece-9091-8c01b26bfe44', 'Relative speed = 50 km/h = 13.89 m/s; total length = 250m; time = 250/13.89 ≈ 18 seconds.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7f765323-4a66-4ff5-bd0c-dc74c98dc64a', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 68, 'A number is increased by 20% and then decreased by 20%. What is the net percentage change?', 'Quantitative Aptitude', 'Percentage — Successive Change', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76fa997d-bb2f-45ce-a462-ac4fd16b0b44', '7f765323-4a66-4ff5-bd0c-dc74c98dc64a', 0, 'No change');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47fd0bf3-e389-4184-8e4e-38c1fd2a468c', '7f765323-4a66-4ff5-bd0c-dc74c98dc64a', 1, '4% decrease');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6dd9236f-b52d-4c1b-ae72-f7fe1253cad1', '7f765323-4a66-4ff5-bd0c-dc74c98dc64a', 2, '4% increase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7672aff-69fc-43a9-add2-b67badb8d4e9', '7f765323-4a66-4ff5-bd0c-dc74c98dc64a', 3, '2% decrease');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7f765323-4a66-4ff5-bd0c-dc74c98dc64a', '47fd0bf3-e389-4184-8e4e-38c1fd2a468c', 'Net change = -(20×20)/100 = -4%, i.e., a 4% decrease overall (successive equal-percent opposite changes never fully cancel).', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('267f2058-f34f-4078-8b88-e94b03c8c021', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 69, 'Find the circumference of a circle with radius 7cm (use π=22/7).', 'Quantitative Aptitude', 'Geometry — Circles', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e92d917a-f810-4751-bd27-dc4eed8bfa65', '267f2058-f34f-4078-8b88-e94b03c8c021', 0, '40cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62b2fed8-7f09-429d-b241-45434a393937', '267f2058-f34f-4078-8b88-e94b03c8c021', 1, '42cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a9109a5-ef40-4855-ae5d-a9d96c00aaf6', '267f2058-f34f-4078-8b88-e94b03c8c021', 2, '44cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f4dc46a-d9ef-4402-9fe7-f29937c75444', '267f2058-f34f-4078-8b88-e94b03c8c021', 3, '46cm');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('267f2058-f34f-4078-8b88-e94b03c8c021', '7a9109a5-ef40-4855-ae5d-a9d96c00aaf6', 'Circumference = 2πr = 2×(22/7)×7 = 44cm.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('90203337-1a86-4e04-aff5-69cd2188e398', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 70, 'If A is twice as efficient as B, and B takes 20 days to finish a job alone, how many days will A take?', 'Quantitative Aptitude', 'Time and Work — Efficiency', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36cb3e62-d8d9-41cd-885c-8c1d3dfa6187', '90203337-1a86-4e04-aff5-69cd2188e398', 0, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78aa7dc3-f009-46e0-9445-13dc34725e9f', '90203337-1a86-4e04-aff5-69cd2188e398', 1, '10');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2fd782e1-b36c-495e-9418-8fb0981710c7', '90203337-1a86-4e04-aff5-69cd2188e398', 2, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e19c3373-3b3c-4e31-867e-47f3309a0eeb', '90203337-1a86-4e04-aff5-69cd2188e398', 3, '15');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('90203337-1a86-4e04-aff5-69cd2188e398', '78aa7dc3-f009-46e0-9445-13dc34725e9f', 'A is twice as efficient, so A takes half the time: 20/2 = 10 days.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8363ce36-a08f-4560-9a4b-94f869239b0e', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 71, 'Find the HCF of 24 and 36.', 'Quantitative Aptitude', 'Number System — LCM/HCF', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2296b652-8e0a-4c21-b6ed-4dfc29cf1628', '8363ce36-a08f-4560-9a4b-94f869239b0e', 0, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72b60a11-b6fc-4ff3-a053-03cc0056be63', '8363ce36-a08f-4560-9a4b-94f869239b0e', 1, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b3fe30d-8381-40c0-8410-675c692052a0', '8363ce36-a08f-4560-9a4b-94f869239b0e', 2, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f4ed996-2d82-4a6f-bcc8-b32bd03201db', '8363ce36-a08f-4560-9a4b-94f869239b0e', 3, '18');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8363ce36-a08f-4560-9a4b-94f869239b0e', '4b3fe30d-8381-40c0-8410-675c692052a0', 'Factors: 24=2³×3, 36=2²×3²; HCF = 2²×3 = 12.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e4986a35-4870-4252-8f7e-4c88fae67f00', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 72, 'Find the roots of x² - 5x + 6 = 0.', 'Quantitative Aptitude', 'Algebra — Quadratic', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7556f22e-7e83-4a02-a840-cee91d0819fb', 'e4986a35-4870-4252-8f7e-4c88fae67f00', 0, '2, 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf9e3414-e8b2-45f6-af09-0e98948c58d3', 'e4986a35-4870-4252-8f7e-4c88fae67f00', 1, '1, 6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67f9abd3-5696-4967-a5d2-2ced9f2242b8', 'e4986a35-4870-4252-8f7e-4c88fae67f00', 2, '-2, -3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('699432f7-7731-490f-af64-ee273713e273', 'e4986a35-4870-4252-8f7e-4c88fae67f00', 3, '2, -3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e4986a35-4870-4252-8f7e-4c88fae67f00', '7556f22e-7e83-4a02-a840-cee91d0819fb', 'Factoring: (x-2)(x-3)=0, so x=2 or x=3.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8bb44be7-8829-4069-a050-93423cb0c90c', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 73, 'In a class, the ratio of boys to girls is 3:2. If there are 15 boys, how many girls are there?', 'Quantitative Aptitude', 'Data Interpretation — Ratio', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f522bf5e-adfa-4284-9327-d3e0a70cc806', '8bb44be7-8829-4069-a050-93423cb0c90c', 0, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('157ab629-d06e-4aa0-9eb1-873a9752e198', '8bb44be7-8829-4069-a050-93423cb0c90c', 1, '10');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d474ba58-5869-4d7e-ba3a-510b50fc1d79', '8bb44be7-8829-4069-a050-93423cb0c90c', 2, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('151384c6-68ec-43db-81c4-2833a49a9a41', '8bb44be7-8829-4069-a050-93423cb0c90c', 3, '14');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8bb44be7-8829-4069-a050-93423cb0c90c', '157ab629-d06e-4aa0-9eb1-873a9752e198', '3 parts = 15 boys → 1 part = 5; girls = 2 parts = 10.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8f9d3e30-3240-4461-8f72-7fb8ee31aafa', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 74, 'Find the perimeter of a rectangle with length 15cm and breadth 10cm.', 'Quantitative Aptitude', 'Mensuration — Rectangle', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('231525cf-f4c8-4d18-8357-8fed6fb034c6', '8f9d3e30-3240-4461-8f72-7fb8ee31aafa', 0, '40cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28701055-5c32-4e0e-95e7-65157d57addd', '8f9d3e30-3240-4461-8f72-7fb8ee31aafa', 1, '45cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f938cf6-4259-4a72-ab0f-cdce05b46b55', '8f9d3e30-3240-4461-8f72-7fb8ee31aafa', 2, '50cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9054fa75-d6c2-4252-a8fa-3ced8005c398', '8f9d3e30-3240-4461-8f72-7fb8ee31aafa', 3, '55cm');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8f9d3e30-3240-4461-8f72-7fb8ee31aafa', '9f938cf6-4259-4a72-ab0f-cdce05b46b55', 'Perimeter = 2(l+b) = 2(15+10) = 50cm.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('10371da1-c04b-49f4-ae8b-5fafbddbd3cf', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 75, 'The average marks of 30 students in a class is 60. If the teacher''s marks (95) are added, what is the new average of 31 people?', 'Quantitative Aptitude', 'Average — Weighted', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91fb94a6-7de0-4052-8651-b70f60ee32a2', '10371da1-c04b-49f4-ae8b-5fafbddbd3cf', 0, '61.1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc47e90f-0467-45c9-a4e8-eb9843c8c44c', '10371da1-c04b-49f4-ae8b-5fafbddbd3cf', 1, '61.13');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('500156d8-8d16-4088-a584-cccd9716bc5b', '10371da1-c04b-49f4-ae8b-5fafbddbd3cf', 2, '60.5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72a999a1-8292-4f75-85a9-370c73bc755c', '10371da1-c04b-49f4-ae8b-5fafbddbd3cf', 3, '61.5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('10371da1-c04b-49f4-ae8b-5fafbddbd3cf', 'bc47e90f-0467-45c9-a4e8-eb9843c8c44c', 'New total = 30×60+95 = 1895; new average = 1895/31 ≈ 61.13.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (algebra, mensuration, geometry, trigonometry, data interpretation, average, mixture-alligation, partnership); not copied from any official SSC question paper.');

-- ── Section: English Comprehension (25 questions) — English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('16a8a925-829b-4537-b594-36389cb52176', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 76, 'Identify the part with an error: (A) Neither of the two boys / (B) have done / (C) their homework / (D) No error', 'English', 'Spotting Errors', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('103cb259-1bf8-432e-ac22-59e866cab188', '16a8a925-829b-4537-b594-36389cb52176', 0, 'A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bda7e2b7-c52c-474b-9c7b-bfe914deb715', '16a8a925-829b-4537-b594-36389cb52176', 1, 'B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bff662f4-6595-4828-a08e-8f43293e2141', '16a8a925-829b-4537-b594-36389cb52176', 2, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6d3d89a-c425-4c6f-8aff-7b8bff746e10', '16a8a925-829b-4537-b594-36389cb52176', 3, 'D');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('16a8a925-829b-4537-b594-36389cb52176', 'bda7e2b7-c52c-474b-9c7b-bfe914deb715', '''Neither'' is singular and should take ''has'', not ''have'' — the error is in part B.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e4a3a47b-62ca-4654-b77b-27d52ed830f9', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 77, 'Improve the underlined part: "She is senior than me."', 'English', 'Sentence Improvement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('230145c6-a65d-4f4b-b3c0-97bd0bc6ea7d', 'e4a3a47b-62ca-4654-b77b-27d52ed830f9', 0, 'senior to me');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51a8dfcd-c597-4266-9498-42aa037b0562', 'e4a3a47b-62ca-4654-b77b-27d52ed830f9', 1, 'more senior than me');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1bea56e-34aa-4789-8abc-07f9f12f85f3', 'e4a3a47b-62ca-4654-b77b-27d52ed830f9', 2, 'senior than I');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19378d4d-dd97-400a-97d1-a1dc7416ca21', 'e4a3a47b-62ca-4654-b77b-27d52ed830f9', 3, 'No improvement needed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e4a3a47b-62ca-4654-b77b-27d52ed830f9', '230145c6-a65d-4f4b-b3c0-97bd0bc6ea7d', '''Senior'' is a Latin comparative that takes ''to'', not ''than'' — the correct form is ''senior to me''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0b8de773-6d44-44a6-a5da-1d7d0d45c2d6', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 78, 'He has been living in Delhi ___ 2015.', 'English', 'Fill in the Blanks', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c3a5e28-3bfe-4576-b75e-66039f46a045', '0b8de773-6d44-44a6-a5da-1d7d0d45c2d6', 0, 'for');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e722625-2380-44e0-bdcb-a35fd4e0e43b', '0b8de773-6d44-44a6-a5da-1d7d0d45c2d6', 1, 'since');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('124adf64-424f-486b-a465-0877f87cb3ba', '0b8de773-6d44-44a6-a5da-1d7d0d45c2d6', 2, 'from');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4bf55f9b-dc00-4ded-b8dd-d9779f8aa644', '0b8de773-6d44-44a6-a5da-1d7d0d45c2d6', 3, 'during');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0b8de773-6d44-44a6-a5da-1d7d0d45c2d6', '2e722625-2380-44e0-bdcb-a35fd4e0e43b', '''Since'' is used with a specific starting point in time (a year, date); ''for'' is used with a duration (e.g., ''for 5 years'').', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bfc813b2-4926-44f4-a613-3e8487270b61', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 79, 'Choose the synonym of ''Eloquent'':', 'English', 'Synonyms', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24267c95-d005-4f8b-9e52-01e2c412bf70', 'bfc813b2-4926-44f4-a613-3e8487270b61', 0, 'Fluent and persuasive in speech');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e881f5dc-4d2e-435c-8e57-aca79a056657', 'bfc813b2-4926-44f4-a613-3e8487270b61', 1, 'Silent and withdrawn');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('201fd2b9-ae55-4854-bbeb-004c24dd1206', 'bfc813b2-4926-44f4-a613-3e8487270b61', 2, 'Confused and hesitant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db4b0b9d-7ed1-4597-9142-0ae0c1e63f2c', 'bfc813b2-4926-44f4-a613-3e8487270b61', 3, 'Angry and loud');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bfc813b2-4926-44f4-a613-3e8487270b61', '24267c95-d005-4f8b-9e52-01e2c412bf70', '''Eloquent'' describes fluent, persuasive, expressive speech or writing.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ab474473-f90b-4d3e-9e2c-8bdf7620ffbc', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 80, 'Choose the antonym of ''Meticulous'':', 'English', 'Antonyms', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87ddbabf-11d8-4b70-81ce-68ab162f2099', 'ab474473-f90b-4d3e-9e2c-8bdf7620ffbc', 0, 'Careful');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d7a5705-92e9-4345-9251-36a5bf3bdd2c', 'ab474473-f90b-4d3e-9e2c-8bdf7620ffbc', 1, 'Precise');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d4905ac-72af-444a-928f-40c2e56f298d', 'ab474473-f90b-4d3e-9e2c-8bdf7620ffbc', 2, 'Careless');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8b2d407-a3c1-4acb-aadc-f47beede781c', 'ab474473-f90b-4d3e-9e2c-8bdf7620ffbc', 3, 'Thorough');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ab474473-f90b-4d3e-9e2c-8bdf7620ffbc', '8d4905ac-72af-444a-928f-40c2e56f298d', '''Meticulous'' means extremely careful and precise; its opposite is ''Careless''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2beff46d-2f83-49f5-9654-809f7852718a', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 81, 'A person who is unable to read or write is called:', 'English', 'One-Word Substitution', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76afe3e3-d3ff-43e7-a568-58cb35a002db', '2beff46d-2f83-49f5-9654-809f7852718a', 0, 'Illiterate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fdff53e1-1163-4be5-ab5a-06ab55122de7', '2beff46d-2f83-49f5-9654-809f7852718a', 1, 'Illegible');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa5b9172-f240-4b37-8e9d-db565438e569', '2beff46d-2f83-49f5-9654-809f7852718a', 2, 'Incompetent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d056e03a-db42-4e15-b520-334eeee97433', '2beff46d-2f83-49f5-9654-809f7852718a', 3, 'Ignorant');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2beff46d-2f83-49f5-9654-809f7852718a', '76afe3e3-d3ff-43e7-a568-58cb35a002db', '''Illiterate'' specifically means unable to read or write.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('66227d0b-d549-4250-9908-a6324d165eba', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 82, 'What does the idiom ''to break the ice'' mean?', 'English', 'Idioms', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e8b5386-d5ce-497b-8e53-6c5f7e1314e9', '66227d0b-d549-4250-9908-a6324d165eba', 0, 'To cause a conflict');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0046f838-3842-4757-ae9e-f89c21c4598f', '66227d0b-d549-4250-9908-a6324d165eba', 1, 'To start a conversation in an awkward situation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c77a7bbf-98d4-4bf7-8c44-525cd66829d4', '66227d0b-d549-4250-9908-a6324d165eba', 2, 'To end a relationship');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55f3c87d-9aa4-42d2-862d-bb39e3be5f79', '66227d0b-d549-4250-9908-a6324d165eba', 3, 'To make something colder');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('66227d0b-d549-4250-9908-a6324d165eba', '0046f838-3842-4757-ae9e-f89c21c4598f', '''Break the ice'' means to initiate conversation or ease tension in a socially awkward or unfamiliar situation.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2aef96b9-2da9-40d2-b683-8949e9233c50', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 83, 'Convert to passive voice: "The chef cooks the meal."', 'English', 'Active-Passive Voice', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9dfa6c44-3637-492f-8bf1-fae32d956cd7', '2aef96b9-2da9-40d2-b683-8949e9233c50', 0, 'The meal is cooked by the chef');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d84b5c6-cc4e-4245-bc95-cdbac6f6d2e9', '2aef96b9-2da9-40d2-b683-8949e9233c50', 1, 'The meal was cooked by the chef');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb744687-7378-4a30-957f-a33c52c66714', '2aef96b9-2da9-40d2-b683-8949e9233c50', 2, 'The meal cooks by the chef');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfc8be78-f537-4eab-872d-e3c7afb9d312', '2aef96b9-2da9-40d2-b683-8949e9233c50', 3, 'The meal is cooking by the chef');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2aef96b9-2da9-40d2-b683-8949e9233c50', '9dfa6c44-3637-492f-8bf1-fae32d956cd7', 'Present simple active (''cooks'') converts to present simple passive: ''is cooked by''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3b32f8e9-1382-4ba6-9a8e-ca76ca5689df', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 84, 'Convert to indirect speech: He said, "I am going to the market."', 'English', 'Direct-Indirect Speech', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be40d2eb-c795-47be-9dd9-57d3c82b28cf', '3b32f8e9-1382-4ba6-9a8e-ca76ca5689df', 0, 'He said that he is going to the market');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c7d8a44-43f6-4af0-a024-49ef6b933c24', '3b32f8e9-1382-4ba6-9a8e-ca76ca5689df', 1, 'He said that he was going to the market');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17792b16-7963-44f9-8214-95c65c93159d', '3b32f8e9-1382-4ba6-9a8e-ca76ca5689df', 2, 'He said that he went to the market');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('614ac988-7465-4c42-a3fd-c4840b0fd9f0', '3b32f8e9-1382-4ba6-9a8e-ca76ca5689df', 3, 'He said that he will go to the market');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3b32f8e9-1382-4ba6-9a8e-ca76ca5689df', '6c7d8a44-43f6-4af0-a024-49ef6b933c24', 'In reported speech, present continuous (''am going'') shifts to past continuous (''was going''), with the pronoun also adjusted.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ca8eefee-8dbb-4dcf-b1fb-6e4fc0b6218f', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 85, 'Fill in the blank: Despite the heavy rain, the match ___ continued.', 'English', 'Cloze Test', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c4fbdb7-118e-4233-9d86-86f86442623a', 'ca8eefee-8dbb-4dcf-b1fb-6e4fc0b6218f', 0, 'was');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16c2872b-b211-45df-a90e-7557b16a3b69', 'ca8eefee-8dbb-4dcf-b1fb-6e4fc0b6218f', 1, 'is');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7abbde32-33f1-4d1b-8857-be41eefdfa3a', 'ca8eefee-8dbb-4dcf-b1fb-6e4fc0b6218f', 2, 'has');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16fd3334-0275-4649-9abf-756cfaf4e67f', 'ca8eefee-8dbb-4dcf-b1fb-6e4fc0b6218f', 3, 'had');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ca8eefee-8dbb-4dcf-b1fb-6e4fc0b6218f', '4c4fbdb7-118e-4233-9d86-86f86442623a', 'The sentence describes a completed past event, so the simple past ''was'' fits correctly with ''continued''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c107c4cb-3c71-486b-9cd0-b7083dd1264a', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 86, '"Renewable energy sources like solar and wind are increasingly cost-competitive with fossil fuels, driving their rapid global adoption." What does the passage suggest is driving renewable energy adoption?', 'English', 'Reading Comprehension', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7768cfaf-9cae-4e54-8e18-818a3fbd7c49', 'c107c4cb-3c71-486b-9cd0-b7083dd1264a', 0, 'Government mandates alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e037b22-2007-4f2d-a991-d9511651d260', 'c107c4cb-3c71-486b-9cd0-b7083dd1264a', 1, 'Cost-competitiveness with fossil fuels');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83c24ec1-ef13-412e-ac5d-59bd5c3c6e11', 'c107c4cb-3c71-486b-9cd0-b7083dd1264a', 2, 'Public protests');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1369208-3556-4ef5-872a-d19e6606bd0f', 'c107c4cb-3c71-486b-9cd0-b7083dd1264a', 3, 'Declining fossil fuel reserves');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c107c4cb-3c71-486b-9cd0-b7083dd1264a', '8e037b22-2007-4f2d-a991-d9511651d260', 'The passage explicitly attributes rapid adoption to renewable energy''s cost-competitiveness with fossil fuels.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('aa73d57d-74e1-4948-83d5-d22bec1a90a4', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 87, 'Arrange the parts in correct order: (P) to the station (Q) he ran (R) as fast as he could (S) to catch the train', 'English', 'Sentence Rearrangement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99c35488-8023-4cdd-814f-1fd838343f71', 'aa73d57d-74e1-4948-83d5-d22bec1a90a4', 0, 'Q-R-P-S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88507da0-9ea4-4e09-a86b-7c864e63d327', 'aa73d57d-74e1-4948-83d5-d22bec1a90a4', 1, 'P-Q-R-S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a9f31e5-fd61-4183-814e-f3735a506cc8', 'aa73d57d-74e1-4948-83d5-d22bec1a90a4', 2, 'S-Q-R-P');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ea7a054-2a3a-4d43-98f4-3195726a8a71', 'aa73d57d-74e1-4948-83d5-d22bec1a90a4', 3, 'Q-P-R-S');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aa73d57d-74e1-4948-83d5-d22bec1a90a4', '99c35488-8023-4cdd-814f-1fd838343f71', 'The natural sentence order is ''He ran as fast as he could to the station to catch the train'' — Q-R-P-S.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d4da8464-be5c-4d8b-987f-f821aac94553', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 88, 'She is good ___ mathematics.', 'English', 'Prepositions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75338294-1c3b-4266-8726-d7ff529e4f45', 'd4da8464-be5c-4d8b-987f-f821aac94553', 0, 'in');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b4277672-496d-49f3-8b52-eaf072d88059', 'd4da8464-be5c-4d8b-987f-f821aac94553', 1, 'at');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('238c0190-c33b-4803-9f05-14b641b49976', 'd4da8464-be5c-4d8b-987f-f821aac94553', 2, 'on');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6cba2705-da4c-4035-acd1-662d7f420233', 'd4da8464-be5c-4d8b-987f-f821aac94553', 3, 'with');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d4da8464-be5c-4d8b-987f-f821aac94553', 'b4277672-496d-49f3-8b52-eaf072d88059', 'The idiomatic preposition for being skilled in a subject is ''good at'', not ''good in''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('79a94082-76c6-4ff1-aad0-28ba21f7f1f1', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 89, 'Identify the part with an error: (A) Each of the students / (B) are required / (C) to submit their assignment / (D) No error', 'English', 'Spotting Errors', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1e8d985-084b-4def-bac3-4f464ba85855', '79a94082-76c6-4ff1-aad0-28ba21f7f1f1', 0, 'A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7dfb698f-d107-465d-af9c-325047ff2842', '79a94082-76c6-4ff1-aad0-28ba21f7f1f1', 1, 'B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f733ca5d-1d1f-4682-b631-e901ae5207ca', '79a94082-76c6-4ff1-aad0-28ba21f7f1f1', 2, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd43ab51-4abd-46b5-a943-ffa602c59605', '79a94082-76c6-4ff1-aad0-28ba21f7f1f1', 3, 'D');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('79a94082-76c6-4ff1-aad0-28ba21f7f1f1', '7dfb698f-d107-465d-af9c-325047ff2842', '''Each'' is singular and takes ''is'', not ''are'' — the error is in part B.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('57011a9a-96e8-4ad3-b3d1-2621c29f1613', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 90, 'Choose the synonym of ''Ubiquitous'':', 'English', 'Synonyms', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df81e546-caa4-4c1d-b72c-f2575c82c4d3', '57011a9a-96e8-4ad3-b3d1-2621c29f1613', 0, 'Rare');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e85ec705-99ac-4892-ac20-7fd9385c35ad', '57011a9a-96e8-4ad3-b3d1-2621c29f1613', 1, 'Omnipresent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4438bb32-89c3-4789-85ae-55a3e3edecca', '57011a9a-96e8-4ad3-b3d1-2621c29f1613', 2, 'Hidden');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23a15415-4249-4d69-88f1-b6bb585442e8', '57011a9a-96e8-4ad3-b3d1-2621c29f1613', 3, 'Ancient');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('57011a9a-96e8-4ad3-b3d1-2621c29f1613', 'e85ec705-99ac-4892-ac20-7fd9385c35ad', '''Ubiquitous'' means present everywhere — ''Omnipresent'' is its closest synonym.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8368fd67-0497-4a7a-ab38-a6d248d5448d', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 91, 'A person who loves and collects books is called:', 'English', 'One-Word Substitution', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27f85ef3-cc7a-4f0c-a7c8-9c5d4aa582ba', '8368fd67-0497-4a7a-ab38-a6d248d5448d', 0, 'Bibliophile');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4def077c-b005-4d31-8546-f354b173026a', '8368fd67-0497-4a7a-ab38-a6d248d5448d', 1, 'Philanthropist');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c07bd73-1dda-4df1-afe0-e7e8c4a380e9', '8368fd67-0497-4a7a-ab38-a6d248d5448d', 2, 'Bibliographer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91e95a93-e0a3-4a1f-92fa-e5d8c063f5a4', '8368fd67-0497-4a7a-ab38-a6d248d5448d', 3, 'Librarian');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8368fd67-0497-4a7a-ab38-a6d248d5448d', '27f85ef3-cc7a-4f0c-a7c8-9c5d4aa582ba', 'A ''Bibliophile'' is a person who loves and collects books.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fb9f4690-230f-43ad-8fe5-41d56570e66f', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 92, 'What does the idiom ''to let the cat out of the bag'' mean?', 'English', 'Idioms', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f252d818-835f-4dd2-b0f3-439cfa324441', 'fb9f4690-230f-43ad-8fe5-41d56570e66f', 0, 'To release an animal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0691464d-1573-47d8-909b-fa1fb485e1c5', 'fb9f4690-230f-43ad-8fe5-41d56570e66f', 1, 'To reveal a secret accidentally');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ee3b5c8-e2dd-4da2-b942-533bcec06375', 'fb9f4690-230f-43ad-8fe5-41d56570e66f', 2, 'To cause chaos');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8dcde37-436e-4856-b452-f1266d0bb4cf', 'fb9f4690-230f-43ad-8fe5-41d56570e66f', 3, 'To hide something carefully');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fb9f4690-230f-43ad-8fe5-41d56570e66f', '0691464d-1573-47d8-909b-fa1fb485e1c5', 'This idiom means to accidentally reveal a secret or confidential information.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ba7b2723-64ce-49f7-adac-6533cebd638e', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 93, 'The committee ___ yet to decide on the matter.', 'English', 'Fill in the Blanks', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8995f64b-f57d-4dad-8924-2abef99a93e2', 'ba7b2723-64ce-49f7-adac-6533cebd638e', 0, 'is');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d308f0d-4461-4233-af0a-04714f5d8acd', 'ba7b2723-64ce-49f7-adac-6533cebd638e', 1, 'are');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a5b2a28-5ca6-414c-97b3-9281c63cbee7', 'ba7b2723-64ce-49f7-adac-6533cebd638e', 2, 'have');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80b3f29c-0fcb-47de-9c03-255f4a25b04c', 'ba7b2723-64ce-49f7-adac-6533cebd638e', 3, 'were');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ba7b2723-64ce-49f7-adac-6533cebd638e', '8995f64b-f57d-4dad-8924-2abef99a93e2', '''Committee'' is treated as a singular collective noun in this context, taking ''is''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7ce31e7b-fefa-46bb-b5fa-0601db27f684', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 94, 'Choose the antonym of ''Verbose'':', 'English', 'Antonyms', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('486327c7-353b-491e-b3f2-93dfbed18b94', '7ce31e7b-fefa-46bb-b5fa-0601db27f684', 0, 'Wordy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e25a4ce-c592-4cdd-8a03-7ca38cb9fdd5', '7ce31e7b-fefa-46bb-b5fa-0601db27f684', 1, 'Concise');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2845f43b-35b3-4944-a25a-2e6a4b1b6d00', '7ce31e7b-fefa-46bb-b5fa-0601db27f684', 2, 'Lengthy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('559257cf-ddce-4924-bbaa-51f3c25b4806', '7ce31e7b-fefa-46bb-b5fa-0601db27f684', 3, 'Talkative');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7ce31e7b-fefa-46bb-b5fa-0601db27f684', '2e25a4ce-c592-4cdd-8a03-7ca38cb9fdd5', '''Verbose'' means using more words than needed; its opposite is ''Concise'' (brief and to the point).', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5f9f3156-083d-4cdc-bb13-48a16b641672', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 95, '"While automation increases efficiency, it also raises concerns about job displacement in traditional manufacturing sectors." What concern does the passage raise about automation?', 'English', 'Reading Comprehension', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5761443-2442-4d9e-9fc6-f6fd9e7c5f9f', '5f9f3156-083d-4cdc-bb13-48a16b641672', 0, 'Increased production costs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b770f1ca-99d3-49d2-afb4-b67620034405', '5f9f3156-083d-4cdc-bb13-48a16b641672', 1, 'Job displacement in manufacturing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b00d1bfa-477d-4a67-9906-06aaac23a249', '5f9f3156-083d-4cdc-bb13-48a16b641672', 2, 'Environmental damage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49166341-9204-4e0f-ba1f-22db306bd6de', '5f9f3156-083d-4cdc-bb13-48a16b641672', 3, 'Reduced product quality');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5f9f3156-083d-4cdc-bb13-48a16b641672', 'b770f1ca-99d3-49d2-afb4-b67620034405', 'The passage explicitly names job displacement in traditional manufacturing sectors as the concern raised alongside automation''s efficiency benefits.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ab5a1f21-2f83-47c0-8cea-e0a8ac33ee96', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 96, 'Convert to passive voice: "They will complete the project by Friday."', 'English', 'Active-Passive Voice', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5214394b-c5a2-4761-ac55-9db5745b7f59', 'ab5a1f21-2f83-47c0-8cea-e0a8ac33ee96', 0, 'The project will be completed by Friday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91fcf4d1-8d91-47ef-89d5-2f8e9ba3c41b', 'ab5a1f21-2f83-47c0-8cea-e0a8ac33ee96', 1, 'The project was completed by Friday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81eed93d-5576-4fd4-905f-0b34cc7a66d7', 'ab5a1f21-2f83-47c0-8cea-e0a8ac33ee96', 2, 'The project is completed by Friday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd3c61d3-4f45-4252-bd79-2053d3ae1a6e', 'ab5a1f21-2f83-47c0-8cea-e0a8ac33ee96', 3, 'The project will complete by Friday');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ab5a1f21-2f83-47c0-8cea-e0a8ac33ee96', '5214394b-c5a2-4761-ac55-9db5745b7f59', 'Future simple active (''will complete'') converts to future simple passive: ''will be completed''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('94019237-994f-48b3-8123-bc5e06bc34f6', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 97, 'He is married ___ a doctor.', 'English', 'Prepositions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df1d942f-84ec-4162-831a-3f3fcf0d1a30', '94019237-994f-48b3-8123-bc5e06bc34f6', 0, 'with');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('daec7931-a674-4e17-9c38-d042422e076a', '94019237-994f-48b3-8123-bc5e06bc34f6', 1, 'to');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74165240-18b2-46ae-8e86-e36ebd96eb8e', '94019237-994f-48b3-8123-bc5e06bc34f6', 2, 'by');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26d27d75-2b88-4081-a09c-cc8ba1d8e6d5', '94019237-994f-48b3-8123-bc5e06bc34f6', 3, 'for');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('94019237-994f-48b3-8123-bc5e06bc34f6', 'daec7931-a674-4e17-9c38-d042422e076a', 'The correct idiomatic preposition for marital relation is ''married to'', not ''married with''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('30fe0065-53d0-4c7f-9464-d95abe4074b6', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 98, 'A place where weapons and ammunition are stored is called:', 'English', 'One-Word Substitution', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8213e8d-de76-40ab-b41f-c6039c82154e', '30fe0065-53d0-4c7f-9464-d95abe4074b6', 0, 'Arsenal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ade95674-1112-4b85-b629-24a6ce001610', '30fe0065-53d0-4c7f-9464-d95abe4074b6', 1, 'Armory');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('963919a1-eb66-4b00-bfd2-af0d1bddbaa2', '30fe0065-53d0-4c7f-9464-d95abe4074b6', 2, 'Both (a) and (b) are acceptable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3974826b-4d3e-4f1f-95ee-f0ca82ed97bf', '30fe0065-53d0-4c7f-9464-d95abe4074b6', 3, 'Barracks');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('30fe0065-53d0-4c7f-9464-d95abe4074b6', '963919a1-eb66-4b00-bfd2-af0d1bddbaa2', 'Both ''Arsenal'' and ''Armory'' are accepted terms for a place where weapons/ammunition are stored, making them interchangeable in common usage for this definition.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bae9615a-de57-4894-9823-ee3e5e6cde7a', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 99, 'She has worked here ___ five years.', 'English', 'Cloze Test', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c72486a4-bf9e-45d2-88ba-147f7d179307', 'bae9615a-de57-4894-9823-ee3e5e6cde7a', 0, 'since');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c71aa20-31af-4a31-8801-dfe3deee97fb', 'bae9615a-de57-4894-9823-ee3e5e6cde7a', 1, 'for');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e74c602-de44-4c76-bfa9-82f5cbfbd0e0', 'bae9615a-de57-4894-9823-ee3e5e6cde7a', 2, 'from');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92020967-4580-41aa-a121-2c1f7f72cee5', 'bae9615a-de57-4894-9823-ee3e5e6cde7a', 3, 'at');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bae9615a-de57-4894-9823-ee3e5e6cde7a', '3c71aa20-31af-4a31-8801-dfe3deee97fb', '''For'' is used to express a duration of time (''for five years''), as opposed to ''since'' which marks a starting point.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('29165477-aa3a-4660-8a21-2bac9ead1f5d', '05bcd03f-aaa4-456e-ab91-214dc8c21757', 100, 'Improve the underlined part: "Each of the boys have submitted his assignment."', 'English', 'Sentence Improvement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30eb00c5-5f69-4b9c-8d35-ebd06fdcb1cd', '29165477-aa3a-4660-8a21-2bac9ead1f5d', 0, 'has submitted his assignment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4f82c72-0898-4fb1-85b3-afce372a622b', '29165477-aa3a-4660-8a21-2bac9ead1f5d', 1, 'have submitted their assignment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a82cf91d-87d3-4130-bd8c-6585ef6418b2', '29165477-aa3a-4660-8a21-2bac9ead1f5d', 2, 'has submitted their assignment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce57679d-45fe-437c-b46f-ebbcb44d1165', '29165477-aa3a-4660-8a21-2bac9ead1f5d', 3, 'No improvement needed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('29165477-aa3a-4660-8a21-2bac9ead1f5d', '30eb00c5-5f69-4b9c-8d35-ebd06fdcb1cd', '''Each'' is singular and requires the singular verb ''has'' along with the singular possessive ''his'', matching option (a).', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (spotting errors, sentence rearrangement, fill in the blanks, active-passive voice, direct-indirect speech, reading comprehension); not copied from any official SSC question paper.');
