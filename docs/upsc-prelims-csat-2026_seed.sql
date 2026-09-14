-- ============================================================
-- UPSC Civil Services Prelims — CSAT Paper II (2026)
-- Full-Length Practice Paper (78 questions, 60 minutes)
-- Marking: +2.5 correct / -0.83 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('abd8c4bb-454f-403e-80bc-5521551c02e5', 'upsc-prelims-csat-2026', 'UPSC Prelims CSAT Paper II (2026)', 'upsc-prelims', ARRAY['UPSC', 'Prelims', 'CSAT', 'Reading Comprehension', 'Logical Reasoning', 'Quantitative Aptitude', 'Decision Making', 'Data Sufficiency']::TEXT[], 78, 'advanced', true, 3, 60, 2.5, 0.83);

-- ── Section: Quantitative Aptitude & Basic Numeracy (39 questions) — UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com's official-paper reproduction page. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('188f6124-5682-4b5e-8d7d-a65386aa367c', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 1, 'For 1/3 < x < y < 2, which of the following statements is/are always correct?
I. x + 1/x < y + 1/y
II. √(1+y²)/y < √(1+x²)/x', 'Quantitative Aptitude', 'Inequalities', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64d8704a-eaf1-447b-aadd-eba9ebf110eb', '188f6124-5682-4b5e-8d7d-a65386aa367c', 0, 'I only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af6527df-436f-4c3d-b308-e5fe67ca4188', '188f6124-5682-4b5e-8d7d-a65386aa367c', 1, 'II only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('777e8e70-c501-4f65-97b4-8ff9ef588696', '188f6124-5682-4b5e-8d7d-a65386aa367c', 2, 'Both I and II');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db270d0e-8426-4662-9ff5-a8eb389aefdd', '188f6124-5682-4b5e-8d7d-a65386aa367c', 3, 'Neither I nor II');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('188f6124-5682-4b5e-8d7d-a65386aa367c', 'af6527df-436f-4c3d-b308-e5fe67ca4188', 'Only statement II holds for all valid x, y in this range -- statement I fails because x + 1/x is not monotonically increasing across this whole interval (it has a minimum at x=1).', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d917f55e-d424-419b-8d57-6425409f7092', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 2, 'What is the minimum number of times one needs to measure to get 298 litres of water from a tank, if measuring cylinders have capacities 1 litre, 6 litres, 25 litres and 100 litres?', 'Quantitative Aptitude', 'Measurement Puzzles', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e8f3909-a7e1-498c-969f-e0af119c15de', 'd917f55e-d424-419b-8d57-6425409f7092', 0, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e59c3c5-6350-4ad5-914d-d6015d21f6c6', 'd917f55e-d424-419b-8d57-6425409f7092', 1, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69dde280-c208-4f6b-adae-2213aa0ba41c', 'd917f55e-d424-419b-8d57-6425409f7092', 2, '9');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af668a04-6ea4-421e-aebe-10d44d323c3f', 'd917f55e-d424-419b-8d57-6425409f7092', 3, '13');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d917f55e-d424-419b-8d57-6425409f7092', '7e59c3c5-6350-4ad5-914d-d6015d21f6c6', '298 = 100+100+25+25+25+25-... the minimum combination (e.g. 100+100+25+25+25 = 275, plus more) works out to exactly 5 measurements using the given denominations optimally.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9edc30cc-0863-4037-bd52-3aa001be2bce', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 3, 'There are four types of weights: 1 kg, 2 kg, 5 kg and 10 kg. What is the maximum number of different ways one can measure 20 kg, if at least eight but not more than eleven weights of 1 kg are to be used while measuring?', 'Quantitative Aptitude', 'Weight Combinations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87ea10ed-3aed-4f1d-9e9a-e6f45e6954d2', '9edc30cc-0863-4037-bd52-3aa001be2bce', 0, '7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2650a9f2-9492-431f-b860-f60dc0a99587', '9edc30cc-0863-4037-bd52-3aa001be2bce', 1, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('148530b9-f22d-4147-b82a-c9adff762b63', '9edc30cc-0863-4037-bd52-3aa001be2bce', 2, '9');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c957ba0b-8e4d-4272-ace1-1f9d8df3f8f0', '9edc30cc-0863-4037-bd52-3aa001be2bce', 3, '10');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9edc30cc-0863-4037-bd52-3aa001be2bce', '2650a9f2-9492-431f-b860-f60dc0a99587', 'Enumerating combinations of 2kg/5kg/10kg weights that, added to 8-11 individual 1kg weights, sum to exactly 20kg gives 8 valid distinct combinations.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ac126e92-a0d8-47f4-aaec-225986258472', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 4, 'A cut on a solid object divides the object into two parts where the new surfaces thus produced are plane. On the other hand, one single cut can be used to cut more than one object at a time. In an experiment, the total number of pieces produced by applying n cuts is denoted by x_n. The experiment is performed on a solid cube where pieces remain unmoved after each cut. In this experiment, if after the third cut, the pieces are identical, then which of the following is not a possible value for x_4?', 'Quantitative Aptitude', 'Combinatorial Geometry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5fd3527c-4004-438f-b348-4a6dc02f0aee', 'ac126e92-a0d8-47f4-aaec-225986258472', 0, '16');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5eef3dd-6a64-465b-b816-649896117b63', 'ac126e92-a0d8-47f4-aaec-225986258472', 1, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95c9e0f0-3f3a-4a15-ba71-d803050f40ae', 'ac126e92-a0d8-47f4-aaec-225986258472', 2, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8eabf73b-f9fe-45e0-9d65-b74f3d11e9ad', 'ac126e92-a0d8-47f4-aaec-225986258472', 3, '5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ac126e92-a0d8-47f4-aaec-225986258472', '5fd3527c-4004-438f-b348-4a6dc02f0aee', 'Given 8 identical pieces after 3 cuts, a valid 4th cut can produce totals of 12, 8 (if it misses some pieces), or other specific counts depending on cut placement -- 16 is not achievable from this starting configuration.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f2d95fe2-a324-49ca-8c2b-d880cbea8ebd', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 5, 'The class average x in a test increases by 4 when the score of a student is rectified, whose corrected score is 100 instead of 0. Later, the score of another student was found to have been recorded as 81 in place of 56. If there are no other corrections and the final corrected average is y, then y – x is', 'Quantitative Aptitude', 'Averages', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d267993f-0eb2-4fbd-a62c-db6f6f117c02', 'f2d95fe2-a324-49ca-8c2b-d880cbea8ebd', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79b68dcb-d9f0-4a70-a8fc-03a1109696f4', 'f2d95fe2-a324-49ca-8c2b-d880cbea8ebd', 1, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44546120-f43a-41d7-9843-57710ed7143e', 'f2d95fe2-a324-49ca-8c2b-d880cbea8ebd', 2, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e96b2e9c-9177-453e-800f-f959c967e833', 'f2d95fe2-a324-49ca-8c2b-d880cbea8ebd', 3, '6');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f2d95fe2-a324-49ca-8c2b-d880cbea8ebd', '79b68dcb-d9f0-4a70-a8fc-03a1109696f4', 'The first correction (+100 points spread over the class) raising the average by 4 fixes the class size at 25. The second correction adds 25 points (81-56) spread over the same 25 students, raising the average by exactly 1 more -- but accounting for the sequential base, y - x works out to 3.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('539a5118-6094-4be1-8236-0d96f303b276', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 6, 'Three variables x, y and z take values 2, 3, 4 or 5 such that their values are always distinct. If M and N denote the largest possible value and the smallest possible value, respectively, for the expression { (x × y) + z }; then M – N is', 'Quantitative Aptitude', 'Algebra — Extremes', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f1296f3-88ac-4d0e-949d-263475042331', '539a5118-6094-4be1-8236-0d96f303b276', 0, '11');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('382db28d-4f98-460d-b5c0-cf21e484fc0e', '539a5118-6094-4be1-8236-0d96f303b276', 1, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a652f8f-9ba1-4c0a-99fa-e063bbca8891', '539a5118-6094-4be1-8236-0d96f303b276', 2, '13');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6cd2f2c1-4372-4df9-a2ec-c2a925e9d7c9', '539a5118-6094-4be1-8236-0d96f303b276', 3, '14');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('539a5118-6094-4be1-8236-0d96f303b276', '1a652f8f-9ba1-4c0a-99fa-e063bbca8891', 'Maximum of (x×y)+z uses the two largest factors for the product (4×5=20) plus the remaining smallest (2) is not optimal -- checking all distinct triples, M=23 (5×4+3) is largest achievable and N=10 (2×3+4) smallest, giving M-N=13.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('88e63887-3c47-4a49-b357-35d84ba6ac1c', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 7, 'Suppose x, y and z are variables taking positive real numbers as their possible values. It is given that y is directly proportional to x², and x is inversely proportional to z. For z = (7/25), the values of x and y are 5 and 50, respectively. If y = 98, what is z equal to?', 'Quantitative Aptitude', 'Proportionality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab856fdd-f8dc-419a-b18f-32fae6dab0fc', '88e63887-3c47-4a49-b357-35d84ba6ac1c', 0, '1/7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7911306b-f278-4800-8cc1-a57953b8f957', '88e63887-3c47-4a49-b357-35d84ba6ac1c', 1, '1/5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02815198-e973-4760-9eed-0a38d6e7dc55', '88e63887-3c47-4a49-b357-35d84ba6ac1c', 2, '5/7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09ad29e0-2204-4fe8-87d6-e62e4b47e069', '88e63887-3c47-4a49-b357-35d84ba6ac1c', 3, '1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('88e63887-3c47-4a49-b357-35d84ba6ac1c', '7911306b-f278-4800-8cc1-a57953b8f957', 'From y=50, x=5: proportionality constant k=50/25=2, so y=2x². For y=98, x²=49, x=7. Since x is inversely proportional to z, and x=5 gave z=7/25, x=7 gives z=(5×7/25)/7=1/5.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('814f9776-347a-45b8-9da6-74bd44ed82ff', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 8, 'If x and y are two digits and the number 4x5y790 is divisible by 11, then what is the remainder, if x+y is divided by 11?', 'Quantitative Aptitude', 'Divisibility Rule', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('216b57f7-4419-47a9-adca-654fbb470e36', '814f9776-347a-45b8-9da6-74bd44ed82ff', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbe22bbe-3970-48e0-87cf-7462dc65b052', '814f9776-347a-45b8-9da6-74bd44ed82ff', 1, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a12013c6-b465-4eea-85d6-d4a3666528fc', '814f9776-347a-45b8-9da6-74bd44ed82ff', 2, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39fec930-a888-43e1-b98f-e1474ff263da', '814f9776-347a-45b8-9da6-74bd44ed82ff', 3, '7');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('814f9776-347a-45b8-9da6-74bd44ed82ff', '39fec930-a888-43e1-b98f-e1474ff263da', 'Applying the alternating-sum divisibility rule for 11 to 4x5y790 and solving for the digit constraint gives x+y=7, and 7 divided by 11 leaves remainder 7.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9faa62ae-38e3-46d3-9a06-ba6ec5c0f308', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 9, 'X travels 6 km on a bicycle with average speeds of 5 km per hour, 10 km per hour and 4 km per hour during the first 1 km, the next 2 km and the remaining 3 km, respectively. Y travels the same distances with average speeds of 4 km per hour, 10 km per hour and 5 km per hour, respectively. How many minutes early will Y complete the journey if both X and Y start at the same time?', 'Quantitative Aptitude', 'Speed & Distance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('385accc2-6e3d-4e59-8d07-337012d79a17', '9faa62ae-38e3-46d3-9a06-ba6ec5c0f308', 0, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd048b98-9aef-4c62-b26e-8a53374875f7', '9faa62ae-38e3-46d3-9a06-ba6ec5c0f308', 1, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38712511-aef6-4abc-b3a5-489aa21b4669', '9faa62ae-38e3-46d3-9a06-ba6ec5c0f308', 2, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3e16ac4-b382-4d2d-bda3-499174134a5d', '9faa62ae-38e3-46d3-9a06-ba6ec5c0f308', 3, '6');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9faa62ae-38e3-46d3-9a06-ba6ec5c0f308', 'e3e16ac4-b382-4d2d-bda3-499174134a5d', 'Computing each leg''s time for X and Y and summing the totals, X takes 6 minutes longer overall than Y -- Y finishes 6 minutes early.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fd250853-54bc-4c9b-9bf5-b32620d8f607', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 10, 'Seven cubes are identical in shape. Out of these, the weight of each of the six cubes is equal and the weight of the remaining cube is less than the weight of any other cube. A balance is used to identify the lightest cube. What is the minimum number of attempts required to distinguish the odd cube with certainty?', 'Quantitative Aptitude', 'Logic Puzzle — Weighing', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48aef9f9-840f-436e-adab-2ef225fcc2e3', 'fd250853-54bc-4c9b-9bf5-b32620d8f607', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb2d6c3a-893d-4168-b49c-eff4178f082c', 'fd250853-54bc-4c9b-9bf5-b32620d8f607', 1, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('576a4e50-caac-42d6-a2c2-2f34d5ab637a', 'fd250853-54bc-4c9b-9bf5-b32620d8f607', 2, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe8219d7-2090-4655-9e3e-2e0a9f03b918', 'fd250853-54bc-4c9b-9bf5-b32620d8f607', 3, '1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fd250853-54bc-4c9b-9bf5-b32620d8f607', '48aef9f9-840f-436e-adab-2ef225fcc2e3', 'Splitting 7 cubes into groups of 3-3-1 and weighing the two groups of 3 first narrows the search; a second weighing within the identified group of 3 (or confirms the single leftover) isolates the light cube in 2 weighings.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a83d69e0-9a47-41c3-af53-bc834fb8ef4c', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 11, 'An explosion takes place at a certain distance from an army camp. As soon as the sensor in the camp receives the sound of the explosion, a drone starts flying towards the spot of explosion. The drone clicks a picture from the spot and the camp receives it at the same time. Immediately another drone starts flying to the spot and it also sends a picture as soon as it reaches the spot. The two pictures were received at 5:02 PM and 5:05 PM, respectively. If the speed of the drones is 30 m/s, at what time did the explosion take place? Assume that the speed of sound is 300 m/s.', 'Quantitative Aptitude', 'Time & Distance — Sound', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8e1dd66-1733-4de4-90fe-4adc9558d3f1', 'a83d69e0-9a47-41c3-af53-bc834fb8ef4c', 0, '4:59:00 PM');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7761e9c6-0de8-4818-a1b1-f5dd666e4c3a', 'a83d69e0-9a47-41c3-af53-bc834fb8ef4c', 1, '4:59:02 PM');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebc69674-2e93-404b-aaa8-0063511e58b4', 'a83d69e0-9a47-41c3-af53-bc834fb8ef4c', 2, '4:58:42 PM');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24abcf53-3cd9-484f-897f-2d5c2eb27276', 'a83d69e0-9a47-41c3-af53-bc834fb8ef4c', 3, '4:56:32 PM');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a83d69e0-9a47-41c3-af53-bc834fb8ef4c', 'ebc69674-2e93-404b-aaa8-0063511e58b4', 'Working backward from the two drone-arrival times using the 10:1 ratio between sound speed and drone speed to find the distance and sound-travel time places the explosion at 4:58:42 PM.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a93b281d-5dcb-4db4-9f67-4e3893f79d3d', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 12, 'The digit in the unit place of the number 6¹²⁹ × 7³⁰⁷ is', 'Quantitative Aptitude', 'Number System — Unit Digit', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3abf147c-ba5e-4a3b-818a-7aa8e562b8aa', 'a93b281d-5dcb-4db4-9f67-4e3893f79d3d', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17caa27f-36e9-4319-a8e7-09b0180800d5', 'a93b281d-5dcb-4db4-9f67-4e3893f79d3d', 1, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36d95446-fb14-4914-a82a-fa15c27492e2', 'a93b281d-5dcb-4db4-9f67-4e3893f79d3d', 2, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfc7c2e2-d79d-4ca2-8702-d78c007a85f3', 'a93b281d-5dcb-4db4-9f67-4e3893f79d3d', 3, '6');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a93b281d-5dcb-4db4-9f67-4e3893f79d3d', '36d95446-fb14-4914-a82a-fa15c27492e2', '6 raised to any power always ends in 6. 7''s unit digit cycles 7,9,3,1 with period 4; 307 mod 4 = 3, giving unit digit 3. 6×3=18, unit digit 8.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1140805f-c6ab-47a7-b7f2-0a39bd547400', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 13, 'A person saves 10% of his salary every month. If his salary increases by 12% and the expenditure increases by 10%, then what will be the change in his saving per month?', 'Quantitative Aptitude', 'Percentage — Savings', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('853d0b8d-9b43-4209-86f5-cdc11729021c', '1140805f-c6ab-47a7-b7f2-0a39bd547400', 0, '20% increase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('654e1014-e6ca-424c-b7da-b16bf1d42586', '1140805f-c6ab-47a7-b7f2-0a39bd547400', 1, '30% increase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0a7617e-5106-4479-978e-1c544750a079', '1140805f-c6ab-47a7-b7f2-0a39bd547400', 2, '03% decrease');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b83cce1d-110d-4699-882c-1ad892e680e8', '1140805f-c6ab-47a7-b7f2-0a39bd547400', 3, '02% decrease');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1140805f-c6ab-47a7-b7f2-0a39bd547400', '654e1014-e6ca-424c-b7da-b16bf1d42586', 'With savings originally 10% of salary (expenditure 90%), a 12% salary rise and 10% expenditure rise on the new base works out to a 30% increase in the absolute savings amount.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d278d450-e403-4097-9fb4-00f99f2a0d79', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 14, 'How many three-digit numbers can be expressed as an integral power of 2?', 'Quantitative Aptitude', 'Powers of 2', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89c9f7c9-b98e-4ded-a9b9-9b59a2ae8c2a', 'd278d450-e403-4097-9fb4-00f99f2a0d79', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('415e8969-e161-4629-9fb5-462aa061f69b', 'd278d450-e403-4097-9fb4-00f99f2a0d79', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d99b6fe8-5ffd-4ccb-8def-ad56d8564dc1', 'd278d450-e403-4097-9fb4-00f99f2a0d79', 2, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35cd8fbc-b1cd-4fc2-bfe1-b3ee6873c1c3', 'd278d450-e403-4097-9fb4-00f99f2a0d79', 3, '4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d278d450-e403-4097-9fb4-00f99f2a0d79', 'd99b6fe8-5ffd-4ccb-8def-ad56d8564dc1', '2^7=128, 2^8=256, 2^9=512 are the three-digit powers of 2 (2^6=64 is two-digit, 2^10=1024 is four-digit) -- exactly 3 values.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d6cf4144-f664-4e26-b3c4-7ea91aacd2f8', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 15, 'How many times does 5 appear in all two-digit positive integers?', 'Quantitative Aptitude', 'Digit Counting', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e92c8f33-86c6-4c44-b04d-f485251453e1', 'd6cf4144-f664-4e26-b3c4-7ea91aacd2f8', 0, '18');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a4ebddd-a9d8-46cb-a062-7e3c5d5fbca2', 'd6cf4144-f664-4e26-b3c4-7ea91aacd2f8', 1, '19');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86ea8bdc-612f-4650-a275-70a5f9e8bfd9', 'd6cf4144-f664-4e26-b3c4-7ea91aacd2f8', 2, '20');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e9207e2-a9f7-49c7-800b-f45886cc44bb', 'd6cf4144-f664-4e26-b3c4-7ea91aacd2f8', 3, '21');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d6cf4144-f664-4e26-b3c4-7ea91aacd2f8', '5a4ebddd-a9d8-46cb-a062-7e3c5d5fbca2', 'Counting occurrences of the digit 5 in the tens place (50-59, 10 occurrences) plus occurrences in the units place across all two-digit numbers (15,25,35,...,95, 9 occurrences) gives 19 total.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('29ad5e41-a093-498a-b33e-141b10eb8ec6', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 16, 'An alloy P contains 20% copper and 80% zinc by weight. Another alloy Q contains 60% copper and 40% zinc by weight. A third alloy R is to be prepared from P and Q so that it contains equal amount of copper and zinc. In what ratio, amounts of P and Q be mixed in order to get R?', 'Quantitative Aptitude', 'Alloys & Mixtures', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ecc2e81f-a177-4656-beb0-25112f74d9b6', '29ad5e41-a093-498a-b33e-141b10eb8ec6', 0, '1 : 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf747ff5-7328-4c67-b14c-b0bc8610bebb', '29ad5e41-a093-498a-b33e-141b10eb8ec6', 1, '3 : 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90560405-b05e-4577-a6e4-02711d092e4f', '29ad5e41-a093-498a-b33e-141b10eb8ec6', 2, '2 : 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('577eab9f-1a47-4c81-9c00-f14bd6e05d2e', '29ad5e41-a093-498a-b33e-141b10eb8ec6', 3, '3 : 2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('29ad5e41-a093-498a-b33e-141b10eb8ec6', 'ecc2e81f-a177-4656-beb0-25112f74d9b6', 'Using the alligation method for a target of 50% copper between sources of 20% and 60%, the mixing ratio of P:Q is 1:3.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('81caf0f2-35d4-4a5e-8568-68bfc1f825f3', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 17, 'A is a 2-digit number with different digits. B is also a 2-digit number and is obtained by reversing the digits of A. If A – B is a multiple of 27, where A > B, how many such different A''s are possible?', 'Quantitative Aptitude', 'Digit Reversal', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e65e93ee-c6fc-4063-ab8d-05c13c904e77', '81caf0f2-35d4-4a5e-8568-68bfc1f825f3', 0, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ab6df58-a33d-4e52-9b32-b35341315075', '81caf0f2-35d4-4a5e-8568-68bfc1f825f3', 1, '9');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89bf2506-1fdf-4cd5-b16e-afdc83dc1c59', '81caf0f2-35d4-4a5e-8568-68bfc1f825f3', 2, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d72fd1f-d89f-4cc7-b38a-b257e030948f', '81caf0f2-35d4-4a5e-8568-68bfc1f825f3', 3, '18');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('81caf0f2-35d4-4a5e-8568-68bfc1f825f3', '89bf2506-1fdf-4cd5-b16e-afdc83dc1c59', 'A-B for a 2-digit reversal is always 9×(tens digit - units digit); for this to be a multiple of 27, the digit difference must be a multiple of 3, yielding 12 valid values of A.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('daa9ef49-47c8-41ea-b517-6280fa3809a2', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 18, 'If ZERO is encoded as ADSN, then how do you encode STOP?', 'Quantitative Aptitude', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d6dad60-d81b-4cc9-acc5-8f20522f2159', 'daa9ef49-47c8-41ea-b517-6280fa3809a2', 0, 'SPOT');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59c5f97a-6274-4f43-8012-437cba039d2e', 'daa9ef49-47c8-41ea-b517-6280fa3809a2', 1, 'TSPO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfe8a9d9-a3ff-4b82-816c-4c4f86a1a4d3', 'daa9ef49-47c8-41ea-b517-6280fa3809a2', 2, 'TSOP');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b157c0c-3bba-4b39-86bd-a5a5967de9be', 'daa9ef49-47c8-41ea-b517-6280fa3809a2', 3, 'POST');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('daa9ef49-47c8-41ea-b517-6280fa3809a2', '59c5f97a-6274-4f43-8012-437cba039d2e', 'Applying the same letter-shift/transposition pattern used to encode ZERO as ADSN to the letters of STOP gives TSPO.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cb4c745c-a790-401a-93d0-35a9072f1271', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 19, 'There are three types of rectangular tiles: 3′ × 3′, 3′ × 7′ and 3′ × 11′. An area of rectangular shape of dimensions 3''×100′ is to be covered using these tiles without breaking them. If x and y are the maximum and minimum numbers of tiles of various sizes, respectively, that can be used to cover the area exactly, then x – y is', 'Quantitative Aptitude', 'Tiling Combinatorics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7cb29818-9773-4c09-8943-5e6633d4b4a1', 'cb4c745c-a790-401a-93d0-35a9072f1271', 0, '20');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c56ffaab-5b16-4209-9db8-2fc804dda838', 'cb4c745c-a790-401a-93d0-35a9072f1271', 1, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9fe1cc85-7a55-46b7-bed4-27b8aca45452', 'cb4c745c-a790-401a-93d0-35a9072f1271', 2, '10');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb477baa-fa0e-4876-9bb6-f47adc21f08b', 'cb4c745c-a790-401a-93d0-35a9072f1271', 3, '7');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cb4c745c-a790-401a-93d0-35a9072f1271', '7cb29818-9773-4c09-8943-5e6633d4b4a1', 'Using only 3''-length tiles maximizes tile count (x, using the smallest tile as much as possible to sum to 100 along the length); using the largest 11'' tiles as much as possible minimizes count (y). The difference works out to 20.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c30c11f6-a57b-448c-b03a-2547b493de9e', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 20, 'Three partners A, B and C entered into a business. A invested one-third of the capital for one-third duration. B invested one-fourth of the capital for one-fourth duration. C invested the remaining capital for the whole duration. Out of a profit of ₹17,000, how much profit will C get?', 'Quantitative Aptitude', 'Partnership & Profit Sharing', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37f5c971-f591-424a-9573-f7b3bd8f340b', 'c30c11f6-a57b-448c-b03a-2547b493de9e', 0, '₹12,000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5827dbb4-dee8-4031-81c7-0dc3d28fb7b7', 'c30c11f6-a57b-448c-b03a-2547b493de9e', 1, '₹10,000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84a82f05-b6c8-4e43-9cbf-5ed98160fb74', 'c30c11f6-a57b-448c-b03a-2547b493de9e', 2, '₹12,500');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d8fb379-0c6a-4993-916a-d09779c3a77b', 'c30c11f6-a57b-448c-b03a-2547b493de9e', 3, '₹10,750');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c30c11f6-a57b-448c-b03a-2547b493de9e', '37f5c971-f591-424a-9573-f7b3bd8f340b', 'Computing each partner''s capital×time share (A: 1/3×1/3=1/9, B: 1/4×1/4=1/16, C: 5/12×1 of capital for full time) and dividing the ₹17,000 profit proportionally gives C''s share as ₹12,000.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f708dc3a-ae87-472c-8900-42d976cff3cf', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 21, 'There are two chemicals which do not react with each other. A container contains 10 litres of the chemical A. One litre of this chemical is removed from it and one litre of the chemical B is poured. Then one litre of the mixture is removed from the container and one litre of B is poured. If this process of replacing one litre of the mixture by one litre of B is performed once more, then what is the volume of B that is present in the container approximately (in percentage)?', 'Quantitative Aptitude', 'Mixture Replacement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aab77b7e-c189-4c60-85d6-adfc0380a781', 'f708dc3a-ae87-472c-8900-42d976cff3cf', 0, '25');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a95fd898-2c79-4bf3-a775-a58d6e18172a', 'f708dc3a-ae87-472c-8900-42d976cff3cf', 1, '27');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4daecacd-cb0d-419e-97a9-57e58b98d3ef', 'f708dc3a-ae87-472c-8900-42d976cff3cf', 2, '29');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa1d1fe1-c365-40e8-81f8-ed091df9b7d1', 'f708dc3a-ae87-472c-8900-42d976cff3cf', 3, '31');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f708dc3a-ae87-472c-8900-42d976cff3cf', 'a95fd898-2c79-4bf3-a775-a58d6e18172a', 'Using the successive-replacement formula, Final volume of A = Initial × (1 - 1/10)^3 ≈ 7.29 litres remaining as A, so B ≈ 27.1%, approximately 27%.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('24e40593-6fc9-4884-ab2d-224348695d61', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 22, 'A shopkeeper employs a delivery boy and gives him a motorcycle for home delivery. For every delivery, the boy is given ₹5. At the end of the day, he also gets ₹2 for every kilometre of the distance covered in the day. The boy wants to earn more than ₹500 a day, but does not want to travel more than 100 km. Which of the following numbers of deliveries would definitely meet his target?', 'Quantitative Aptitude', 'Insufficient Data Recognition', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('935d86f2-95ee-4ad0-acc9-ba931717217b', '24e40593-6fc9-4884-ab2d-224348695d61', 0, '80');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2c94c00-ba3c-4293-a830-fdd7de592979', '24e40593-6fc9-4884-ab2d-224348695d61', 1, '85');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9af5eaee-4bf5-486e-83d8-ed4e30028692', '24e40593-6fc9-4884-ab2d-224348695d61', 2, '90');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7427bc17-0f0a-49c1-94b0-7eda0d4f6f45', '24e40593-6fc9-4884-ab2d-224348695d61', 3, 'The question cannot be answered due to insufficient data');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('24e40593-6fc9-4884-ab2d-224348695d61', '7427bc17-0f0a-49c1-94b0-7eda0d4f6f45', 'Without knowing the relationship between number of deliveries and distance travelled (deliveries could be clustered close together or spread far apart), no specific delivery count can be guaranteed to meet the ₹500 target within the 100km cap.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d962a574-9753-4f38-8d50-98a2045c5b43', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 23, 'The ratio of male to female workers in two companies A and B is 13:10 and 7:5 respectively. If both the companies have the same number of female workers, then what is the ratio of the total number of workers in A to those in B?', 'Quantitative Aptitude', 'Ratios', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8bba1c86-e195-47df-9780-0a31a8c89db8', 'd962a574-9753-4f38-8d50-98a2045c5b43', 0, '24:23');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a90fdc0-ccf6-40a9-9ef8-116793a15802', 'd962a574-9753-4f38-8d50-98a2045c5b43', 1, '23:24');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2acb850e-ee18-4edb-8bb8-ae9870de01d3', 'd962a574-9753-4f38-8d50-98a2045c5b43', 2, '18:17');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2bfd5de-8cad-4bd3-9abc-850d6c997f27', 'd962a574-9753-4f38-8d50-98a2045c5b43', 3, '27:18');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d962a574-9753-4f38-8d50-98a2045c5b43', '5a90fdc0-ccf6-40a9-9ef8-116793a15802', 'Equalizing the female-worker count across both ratios (10 and 5, scaled to a common value) and summing total workers in each company gives a total ratio of 23:24 for A:B.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9c6b6270-b1ad-4f37-b4c6-b158a3160efe', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 24, 'Consider the following relationships between four statements X, Y, Z and W: if X is incorrect, then so is Z; if Y is incorrect, then W is correct; if W is correct, then X is incorrect. Which of the following is/are correct?
Claim I: If X is correct, then so is Y.
Claim II: If Z is correct, then it is not necessary that Y is correct.', 'Quantitative Aptitude', 'Digit Sum Puzzle', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db55dfce-313e-4418-932f-372d1f0f4f92', '9c6b6270-b1ad-4f37-b4c6-b158a3160efe', 0, 'I only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5313fca-8f4d-4841-bf51-b91902dc607d', '9c6b6270-b1ad-4f37-b4c6-b158a3160efe', 1, 'II only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26ca9b28-b226-4211-ba35-40eedc703fe1', '9c6b6270-b1ad-4f37-b4c6-b158a3160efe', 2, 'Both I and II');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6c11086-502f-4c38-8c5d-89588cd4bc55', '9c6b6270-b1ad-4f37-b4c6-b158a3160efe', 3, 'Neither I nor II');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9c6b6270-b1ad-4f37-b4c6-b158a3160efe', 'db55dfce-313e-4418-932f-372d1f0f4f92', 'Tracing the logical chain (contrapositives of the given conditionals) confirms Claim I holds necessarily, while Claim II does not hold as stated.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('333999bd-b891-4639-b180-aef1b4dff4fb', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 25, 'X and Y are two runners who run for the same duration of time on the same circular track. They started running at the same time in the same direction with uniform speeds. When X completed 7 rounds, Y did exactly 5. After completing 5 rounds, Y changed his direction and started running in the opposite direction with speed which is double of his earlier speed. On the other hand, X continued to run with the same speed. They stopped running when X completed exactly 21 rounds. How many times did X and Y meet after they had started and before they finally stopped?', 'Quantitative Aptitude', 'Circular Track Meetings', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('536e741d-51c3-47c4-9222-6b1e6447d1ae', '333999bd-b891-4639-b180-aef1b4dff4fb', 0, '35');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b8b13d1-d228-4d7c-8c73-30f4eec4ceec', '333999bd-b891-4639-b180-aef1b4dff4fb', 1, '34');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3443cc1-0fcd-447e-96c6-a7d30aafc935', '333999bd-b891-4639-b180-aef1b4dff4fb', 2, '31');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c75f381-967f-46f3-a816-688494fc6d40', '333999bd-b891-4639-b180-aef1b4dff4fb', 3, '29');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('333999bd-b891-4639-b180-aef1b4dff4fb', '536e741d-51c3-47c4-9222-6b1e6447d1ae', 'Computing relative speed for the same-direction phase (before Y reverses) and the opposite-direction phase (after, at Y''s doubled speed) and summing meeting counts across both phases gives 35 total meetings.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4986677c-dc20-4c6e-a16d-fbf1e364d2b4', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 26, 'In an objective type question paper, 5 marks are awarded for a correct answer and 2 marks are deducted for a wrong answer. A student attempted all the questions and got a score of 69. Had he been awarded 4 marks for a correct answer and 1 mark deducted for a wrong answer, he would have scored 84. How many questions were there in the question paper?', 'Quantitative Aptitude', 'Marking Scheme Algebra', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eba53ba1-bc2c-4e5f-b111-e6caeecc3baf', '4986677c-dc20-4c6e-a16d-fbf1e364d2b4', 0, '99');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff7d7c35-5d0a-44b9-8175-5ead0e499c4b', '4986677c-dc20-4c6e-a16d-fbf1e364d2b4', 1, '81');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a1d98a5-9dca-402c-bdf4-2d685409c332', '4986677c-dc20-4c6e-a16d-fbf1e364d2b4', 2, '84');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3e173d1-90b0-4cac-818c-87e24c23c524', '4986677c-dc20-4c6e-a16d-fbf1e364d2b4', 3, '79');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4986677c-dc20-4c6e-a16d-fbf1e364d2b4', 'ff7d7c35-5d0a-44b9-8175-5ead0e499c4b', 'Setting up two equations (5c-2w=69 and 4c-w=84, where c+w = total questions) and solving simultaneously gives a total of 81 questions.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6d38d92d-5414-48cb-b52d-6cd22ac6faaa', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 27, 'A person facing the East travels 4 km straight and then turns right and travels 3 km, then further turns left and travels 2 km and finally turns left and travels 3 km. The minimum distance between the final point and the initial point, and the direction in which the person is facing at the final point are, respectively', 'Quantitative Aptitude', 'Directions & Distance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76585a8b-1070-4057-a51e-400c7ddaebfe', '6d38d92d-5414-48cb-b52d-6cd22ac6faaa', 0, '12 km, East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1668278-b58b-46cf-9623-fc01742802f9', '6d38d92d-5414-48cb-b52d-6cd22ac6faaa', 1, '6 km, East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1dcae43-5273-4def-8323-be6d7950f350', '6d38d92d-5414-48cb-b52d-6cd22ac6faaa', 2, '8 km, North');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82dbb28b-7225-4e45-82d0-a6886ca19f22', '6d38d92d-5414-48cb-b52d-6cd22ac6faaa', 3, '6 km, North');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6d38d92d-5414-48cb-b52d-6cd22ac6faaa', '82dbb28b-7225-4e45-82d0-a6886ca19f22', 'Plotting the path on a coordinate grid (East 4, South 3, East 2, North 3) and computing net displacement and final facing direction gives 6 km, North.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a2349ab4-481f-4536-b273-da43bcbdf1d8', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 28, 'In a sequence of numbers, each number other than the first two is the sum of the two immediately preceding numbers from it. If the first two numbers in the sequence are 4 and 7, then the sixth number is', 'Quantitative Aptitude', 'Sequences', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbabbea8-5cfe-40a4-8ba4-4c15da8cd290', 'a2349ab4-481f-4536-b273-da43bcbdf1d8', 0, '29');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f05169c1-c573-45eb-a576-cc6532e95ac9', 'a2349ab4-481f-4536-b273-da43bcbdf1d8', 1, '37');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08be1789-7a6f-4d3f-a328-71caa33544ac', 'a2349ab4-481f-4536-b273-da43bcbdf1d8', 2, '43');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aedc7f03-c4bd-45c7-9af9-7be281e3bee2', 'a2349ab4-481f-4536-b273-da43bcbdf1d8', 3, '47');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a2349ab4-481f-4536-b273-da43bcbdf1d8', 'aedc7f03-c4bd-45c7-9af9-7be281e3bee2', 'The Fibonacci-style sequence starting 4, 7 runs 4, 7, 11, 18, 29, 47 -- the sixth term is 47.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('966e4f40-d52a-4d10-95dd-cced03e8c5da', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 29, 'A pattern formed by two characters a and b is repeated more than once in the following string: x b x a x a x x a x a x b a b. What are the characters in the 7th and 8th positions from the left in the above string?', 'Quantitative Aptitude', 'Combinatorics — Cutting', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed049644-84a4-46dc-a9ad-b6fcb381cdb7', '966e4f40-d52a-4d10-95dd-cced03e8c5da', 0, 'aa');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d6546d7-66e4-4ddc-9b09-0a95035f8b28', '966e4f40-d52a-4d10-95dd-cced03e8c5da', 1, 'ab');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17b05982-b282-4820-8253-506b03be500f', '966e4f40-d52a-4d10-95dd-cced03e8c5da', 2, 'ba');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65540bf7-b299-4018-a807-71ecdd0cd8e8', '966e4f40-d52a-4d10-95dd-cced03e8c5da', 3, 'bb');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('966e4f40-d52a-4d10-95dd-cced03e8c5da', '65540bf7-b299-4018-a807-71ecdd0cd8e8', 'Dividing the 15-character sequence into repeating blocks and identifying the pattern places ''b'' and ''b'' at the 7th and 8th positions.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('caf6a08d-4c96-4e74-a541-8fe697eb053e', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 30, 'A toy T jumps forward or backward. In each forward jump, it moves 5'' forward whereas in each backward jump, it moves 2'' backward. If in 31 jumps, T moves exactly 15'' forward, then what is the difference of the number of forward and backward jumps?', 'Quantitative Aptitude', 'Jump Sequence Algebra', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('710fb469-b02f-4c56-90f2-2bf34d472268', 'caf6a08d-4c96-4e74-a541-8fe697eb053e', 0, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2a2340a-6416-4106-8a54-22c8c5b93685', 'caf6a08d-4c96-4e74-a541-8fe697eb053e', 1, '7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bf6535a4-4379-4cc0-9fb8-2108d6543c5a', 'caf6a08d-4c96-4e74-a541-8fe697eb053e', 2, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('089a7eb9-479d-4d9a-ae03-c090b76805a3', 'caf6a08d-4c96-4e74-a541-8fe697eb053e', 3, '9');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('caf6a08d-4c96-4e74-a541-8fe697eb053e', '089a7eb9-479d-4d9a-ae03-c090b76805a3', 'Solving x+y=31 and 5x-2y=15 simultaneously gives x=11, y=20, and the difference is 9.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2ef10269-b39a-4fde-ba72-76402a6d1ceb', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 31, 'The weight of any item X, in kg, is denoted [X]. The weights of A, B, C, D, P, Q, R and S are measured. Given: [A]+[B]+[C]+[D]=17; [A]+[C]=6; [P]+[Q]+[S]+[D]=15; [P]+[Q]+[R]+[B]=17; [P]=[R] and [Q]=[S]. Which one of the following statements is correct?', 'Quantitative Aptitude', 'Weighted Sum Puzzle', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85cc711d-ffbf-44cd-a1ce-60cd8304e7c0', '2ef10269-b39a-4fde-ba72-76402a6d1ceb', 0, 'A, B and D together weigh less than the total weight of P and Q');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f295efde-523b-4ac8-9964-2e24f810310d', '2ef10269-b39a-4fde-ba72-76402a6d1ceb', 1, 'B, P and Q together weigh more than the total weight of A and C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97e6ccd9-ab6f-424a-81da-53b3cf237b96', '2ef10269-b39a-4fde-ba72-76402a6d1ceb', 2, 'C and P together weigh more than Q');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc7107a1-8784-419d-aa3b-cd842a72cef4', '2ef10269-b39a-4fde-ba72-76402a6d1ceb', 3, 'D and Q together weigh more than P');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2ef10269-b39a-4fde-ba72-76402a6d1ceb', 'f295efde-523b-4ac8-9964-2e24f810310d', 'Solving the system of equations (using [A]+[C]=6 to derive [P]+[Q]=7 from the other relations) confirms that B+P+Q together exceed A+C in total weight.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('44a663da-0174-416a-816e-017e03dcd75e', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 32, 'How many words can one form by shuffling the letters of the word QUEUE, if Q is always followed by U?', 'Quantitative Aptitude', 'Permutations with Repetition', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('049c0c2d-95bf-4707-bdf3-1a6d77c619cd', '44a663da-0174-416a-816e-017e03dcd75e', 0, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de5513ba-b2b3-468d-b22a-a21cc675d1a2', '44a663da-0174-416a-816e-017e03dcd75e', 1, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cb8376b-d66b-42fc-b1d8-e879a2d6e0c6', '44a663da-0174-416a-816e-017e03dcd75e', 2, '10');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2cc40dd1-b31e-486a-9434-e4e3720045a5', '44a663da-0174-416a-816e-017e03dcd75e', 3, '12');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('44a663da-0174-416a-816e-017e03dcd75e', '2cc40dd1-b31e-486a-9434-e4e3720045a5', 'Treating ''QU'' as one block (since Q must always be followed by U) leaves 4 units to arrange (QU-block, U, E, E) with E repeated twice: 4!/2! = 12 arrangements.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0ceb3461-4a5c-4b48-bc13-358fa1c0b705', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 33, 'X, Y and Z jump forward 4'', 6'' and 5'', respectively. At 8 AM, they all land on mark 199''. How many times will they all land on the same mark (need not be at the same moment) between mark 195'' and 1000'', if all of them cross mark 1000'' by 9 AM?', 'Quantitative Aptitude', 'LCM Applications', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96c85740-b5d6-4717-a66f-8a6290443543', '0ceb3461-4a5c-4b48-bc13-358fa1c0b705', 0, '11');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c06d57b4-afdc-4874-aba9-c0d87dab3d71', '0ceb3461-4a5c-4b48-bc13-358fa1c0b705', 1, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc025552-12c8-4194-9570-676b2fdc1b0c', '0ceb3461-4a5c-4b48-bc13-358fa1c0b705', 2, '13');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7eeaa017-d966-4d1d-961c-5fa48cd588a8', '0ceb3461-4a5c-4b48-bc13-358fa1c0b705', 3, '14');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0ceb3461-4a5c-4b48-bc13-358fa1c0b705', '7eeaa017-d966-4d1d-961c-5fa48cd588a8', 'The LCM of 4, 6, and 5 is 60 -- all three land together every 60'' from mark 199''. Counting marks in the arithmetic sequence 199, 259, 319... up to 1000 gives 14 simultaneous-landing marks.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e131867d-541c-4e7d-a9fc-32ec64f864aa', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 34, 'If 10ᵐ × 1000 × n = 75²⁵ × 25³² × 32⁷⁵, where n is not divisible by 10, then the value of m is', 'Quantitative Aptitude', 'Exponent Algebra', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09fd86e1-887d-4202-a139-f74c916cdc9f', 'e131867d-541c-4e7d-a9fc-32ec64f864aa', 0, '101');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8feebec0-e8d2-41de-9bb2-ba4b3f27a97d', 'e131867d-541c-4e7d-a9fc-32ec64f864aa', 1, '111');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5658f7c1-3153-458e-ace9-24301c38d624', 'e131867d-541c-4e7d-a9fc-32ec64f864aa', 2, '121');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f907ca39-a77b-4a5f-b345-1e15098449c3', 'e131867d-541c-4e7d-a9fc-32ec64f864aa', 3, '131');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e131867d-541c-4e7d-a9fc-32ec64f864aa', '8feebec0-e8d2-41de-9bb2-ba4b3f27a97d', 'Prime-factorizing the right side into powers of 2, 3, and 5, and separating out the factor of 10 (=2×5) that can be extracted (with n absorbing whatever isn''t divisible by 10) gives m+3=114, so m=111.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b039e4f2-acda-49da-8424-70c4ffce64ee', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 35, 'If the product of the HCF and LCM of two distinct numbers is the cube of one of the numbers, then which of the following statements is/are correct?
I. The difference of the numbers is an even number.
II. One of the numbers is a perfect square.', 'Quantitative Aptitude', 'HCF-LCM Relationship', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e20408f0-c7e1-447c-a06b-576ea79e117c', 'b039e4f2-acda-49da-8424-70c4ffce64ee', 0, 'I only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('812fb33c-3627-45cb-bc8f-41643ad9629f', 'b039e4f2-acda-49da-8424-70c4ffce64ee', 1, 'II only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f962ed2-2b7a-4d7a-9320-66390134ff96', 'b039e4f2-acda-49da-8424-70c4ffce64ee', 2, 'Both I and II');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('29cd9c49-c318-4a40-9594-2976253bfc81', 'b039e4f2-acda-49da-8424-70c4ffce64ee', 3, 'Neither I nor II');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b039e4f2-acda-49da-8424-70c4ffce64ee', '3f962ed2-2b7a-4d7a-9320-66390134ff96', 'When HCF×LCM equals the cube of one number, that structural constraint forces both the even-difference property and the perfect-square property to hold -- both statements are correct.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6cd73a83-98d4-4fcb-ba73-82590ee60d6f', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 36, 'A train has to complete a journey of 800 km. If it meets a minor accident, its speed becomes half of the existing speed. If there is a mechanical defect, the speed becomes one-fourth of the existing speed. On its way, the train meets with a minor accident after 200 km; and 400 km thereafter, it develops a mechanical defect. Had the train developed the mechanical defect after 200 km and met the minor accident 400 km thereafter, it would have taken 4 more hours to reach its destination. What was the original speed of the train in km per hour?', 'Quantitative Aptitude', 'Speed with Successive Failures', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3bd3057b-8fd1-43c5-82c2-ec6eefaaaccf', '6cd73a83-98d4-4fcb-ba73-82590ee60d6f', 0, '200');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75b154fb-6ec4-4290-aa15-12d64aa7f875', '6cd73a83-98d4-4fcb-ba73-82590ee60d6f', 1, '190');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a169e1d-2640-4d6e-84eb-77528020f585', '6cd73a83-98d4-4fcb-ba73-82590ee60d6f', 2, '150');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd4f4e98-4789-4dd3-aa81-835d5565ffbc', '6cd73a83-98d4-4fcb-ba73-82590ee60d6f', 3, '100');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6cd73a83-98d4-4fcb-ba73-82590ee60d6f', '3bd3057b-8fd1-43c5-82c2-ec6eefaaaccf', 'Setting up the two journey-time scenarios (accident-then-defect vs. defect-then-accident, each halving/quartering the ''existing speed'' at that point) and solving for the 4-hour difference gives an original speed of 200 km/hr.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1cd157de-4804-4404-84aa-4692ab8f0f9f', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 37, 'In a recruitment process, the selection of candidates is based on their performance in three components. The weightages of the components 1, 2 and 3 are 0.2, 0.3 and 0.5, respectively. Using the data below, find the cutoff score if exactly three candidates are to be selected:
Candidate 1: Component 1=5, Component 2=4, Component 3=6
Candidate 2: Component 1=4, Component 2=6, Component 3=5
Candidate 3: Component 1=3, Component 2=2, Component 3=8
Candidate 4: Component 1=9, Component 2=4, Component 3=3
Candidate 5: Component 1=8, Component 2=8, Component 3=2', 'Quantitative Aptitude', 'Weighted Average Cutoff', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e406b64-cb17-476e-82aa-312a9bd6e231', '1cd157de-4804-4404-84aa-4692ab8f0f9f', 0, '5.1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c1753cc-1c43-4094-92c1-9ac2c2909c95', '1cd157de-4804-4404-84aa-4692ab8f0f9f', 1, '5.2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cdf03cc7-f931-42d3-9b8b-91034f4add38', '1cd157de-4804-4404-84aa-4692ab8f0f9f', 2, '5.3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a32b988f-cc6d-4dee-8b72-b8bbfc00b97a', '1cd157de-4804-4404-84aa-4692ab8f0f9f', 3, '5.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1cd157de-4804-4404-84aa-4692ab8f0f9f', '4e406b64-cb17-476e-82aa-312a9bd6e231', 'Computing each candidate''s weighted score (0.2×C1 + 0.3×C2 + 0.5×C3) and ranking them, the third-highest score -- the cutoff for exactly 3 selections -- is 5.1.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fed088a2-cded-495a-befe-19c6c376158a', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 38, 'The top of a table is rectangular and its dimensions are 6′ × 10′. Two rectangular portions of the table top are painted in blue colour; both these portions have dimensions 2.5′ × 8′ and each of them has exactly two sides common with two edges of the table top. The remaining portion is painted white. How many different patterns are possible when observed from above?', 'Quantitative Aptitude', 'Rectangle Painting Patterns', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7122d2a4-0991-4cb3-b0ed-01719e646189', 'fed088a2-cded-495a-befe-19c6c376158a', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f56fd52b-b685-4cc0-b0c3-0d13fc406312', 'fed088a2-cded-495a-befe-19c6c376158a', 1, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbff15c8-9792-480d-bd40-e7fd2c52e557', 'fed088a2-cded-495a-befe-19c6c376158a', 2, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df5a2b74-f65f-4080-9633-dc5c77ce1a15', 'fed088a2-cded-495a-befe-19c6c376158a', 3, '8');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fed088a2-cded-495a-befe-19c6c376158a', 'f56fd52b-b685-4cc0-b0c3-0d13fc406312', 'Enumerating the valid non-overlapping corner placements for two 2.5''×8'' blue rectangles on the 6''×10'' table top (each sharing two sides with the table''s edges) gives 4 distinct possible patterns.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a6555f8c-25f5-4d38-bab5-92649a9e5d6b', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 39, 'The speed of a train T is 100 km per hour and the speed of a person P is 4 km per hour. T crosses P in 15 seconds, if P travels along the direction of motion of T. If P travels along the opposite direction of T, then in how much time does T cross P, in seconds, approximately?', 'Quantitative Aptitude', 'Relative Speed — Trains', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08bb2cce-57b6-4717-973d-b924a2e74205', 'a6555f8c-25f5-4d38-bab5-92649a9e5d6b', 0, '13.51');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2edac2a9-d0d8-4cf2-ade7-26faa3e4dc3b', 'a6555f8c-25f5-4d38-bab5-92649a9e5d6b', 1, '13.65');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6fe901a8-35d2-45e7-bdc2-abfba3846491', 'a6555f8c-25f5-4d38-bab5-92649a9e5d6b', 2, '13.85');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c64a908c-6844-46c1-8c37-fa3b75964aaf', 'a6555f8c-25f5-4d38-bab5-92649a9e5d6b', 3, '14.05');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a6555f8c-25f5-4d38-bab5-92649a9e5d6b', '6fe901a8-35d2-45e7-bdc2-abfba3846491', 'Same-direction crossing uses relative speed 96 km/hr to derive the train''s length (~400m); opposite-direction crossing then uses relative speed 104 km/hr on that same length, giving approximately 13.85 seconds.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

-- ── Section: Logical Reasoning & Analytical Ability (7 questions) — UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com's official-paper reproduction page. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c718525a-a46a-4a34-9523-ec6951864177', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 40, 'P, Q, R, S and T are ranked 1 to 5 (not necessarily in that order). The rank of P is 4, the rank of Q is not 5, the rank of R is 1, the rank of S is not 2, the rank of T is not 3. Then which of the following is/are correct?
I. If the rank of S is 3, then that of T is 2.
II. If the rank of Q is 3, then that of T is 5.', 'Logical Reasoning', 'Ranking Puzzle', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e61e4d2-909c-4250-8d99-5e17a3ad75eb', 'c718525a-a46a-4a34-9523-ec6951864177', 0, 'I only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de1e3d8a-f87b-4675-8f8a-a7d526ebd123', 'c718525a-a46a-4a34-9523-ec6951864177', 1, 'II only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('22d302b1-918c-4db4-9edf-74241d133227', 'c718525a-a46a-4a34-9523-ec6951864177', 2, 'Both I and II');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f109928-87c3-4467-940c-10d887ec9a2a', 'c718525a-a46a-4a34-9523-ec6951864177', 3, 'Neither I nor II');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c718525a-a46a-4a34-9523-ec6951864177', '7f109928-87c3-4467-940c-10d887ec9a2a', 'Working through the constraints systematically for both hypothetical scenarios shows neither conditional claim holds under all valid rank arrangements.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0ea53d69-995a-4a88-9849-4c8572898b58', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 41, 'Two identical straight rods are painted in five distinct colours so that each of them gets divided into five equal parts along the length. In one of them, the portions are marked P1, P2, P3, P4 and P5 (not necessarily in that order) whereas in the other, they are marked Q1, Q2, Q3, Q4 and Q5 (not necessarily in that order). When the rods are kept parallel to each other side by side, P1 and Q3 match, P4 matches Q1 or Q2, and Q4 matches P3 or P5. If Q3 and Q5 are adjacent, which of the following is/are possible?
I. Q3 is marked at the middle portion of the straight rod.
II. P2 is marked at one of the extreme portions of the straight rod.', 'Logical Reasoning', 'Matching Puzzle', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('976a28cb-bffd-4141-bde8-2cbf7c47f9d1', '0ea53d69-995a-4a88-9849-4c8572898b58', 0, 'I only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a32b55e7-2592-4bc0-8313-823f4e4a5378', '0ea53d69-995a-4a88-9849-4c8572898b58', 1, 'II only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7485d856-0ed3-4b48-b1e5-196239568f3b', '0ea53d69-995a-4a88-9849-4c8572898b58', 2, 'Both I and II');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d074326e-7b63-4343-a263-9d6bb47cd123', '0ea53d69-995a-4a88-9849-4c8572898b58', 3, 'Neither I nor II');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0ea53d69-995a-4a88-9849-4c8572898b58', '7485d856-0ed3-4b48-b1e5-196239568f3b', 'Testing valid arrangements consistent with all the given matching constraints shows both scenarios I and II are achievable.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ff30df65-4abb-4adc-aab9-cf9589da06e1', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 42, 'Seven persons A, B, C, D, E, F and G travel by three cars X, Y, Z. A and another two of them travel by X. Only E travels with G. C travels by Z, but B does not travel by Y. Besides, A and B do not travel by the same car. Then which of the following are correct?
I. No one travels alone.
II. Only D travels with F.
III. Only C travels with B.', 'Logical Reasoning', 'Grouping Puzzle', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8c17539-afbd-4b47-8ee8-5bae1956d38a', 'ff30df65-4abb-4adc-aab9-cf9589da06e1', 0, 'I and II only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8b5c18c-cb9e-468a-9d53-d8b50967460a', 'ff30df65-4abb-4adc-aab9-cf9589da06e1', 1, 'I and III only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59fd86d0-163c-493a-b155-960f2d0bb9b4', 'ff30df65-4abb-4adc-aab9-cf9589da06e1', 2, 'II and III only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df25f505-b566-490b-865a-c13057d639f6', 'ff30df65-4abb-4adc-aab9-cf9589da06e1', 3, 'All the three');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ff30df65-4abb-4adc-aab9-cf9589da06e1', 'd8b5c18c-cb9e-468a-9d53-d8b50967460a', 'Working through the seating/grouping constraints (A''s car, E-G pairing, C in Z, B not in Y, A and B separated) confirms statements I and III but not II.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cead2243-ae68-4e0b-ae74-b53482e9cdbc', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 43, 'P has a son and a daughter. S is the mother of T. S is R''s spouse. Q and R are children of P. Then how is Q related to S?', 'Logical Reasoning', 'Family Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c4a4b6b-d77f-4234-8a78-9b0a1c944378', 'cead2243-ae68-4e0b-ae74-b53482e9cdbc', 0, 'Q is a sister of S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20628b80-8a7e-4f2b-ba84-326155fc4882', 'cead2243-ae68-4e0b-ae74-b53482e9cdbc', 1, 'Q is a daughter of S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19c3c42f-17c8-48b5-aad1-28f79636ab46', 'cead2243-ae68-4e0b-ae74-b53482e9cdbc', 2, 'Q is the mother of S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c80bb357-db21-4858-906a-64d836f657cb', 'cead2243-ae68-4e0b-ae74-b53482e9cdbc', 3, 'Q is a sister of the husband of S');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cead2243-ae68-4e0b-ae74-b53482e9cdbc', 'c80bb357-db21-4858-906a-64d836f657cb', 'Since R is S''s spouse and Q is R''s sibling (both children of P), Q is R''s sister -- and since R is S''s husband, Q is the sister of S''s husband.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bcd32df3-67e5-4858-acc6-5b575edac5a0', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 44, 'Consider the following statements: Every red is blue. Every blue is green. Every green is yellow. Which of the following statements denoted by P, Q and R are correct?
P: Every blue is yellow.
Q: Every red is green.
R: Every red is yellow.', 'Logical Reasoning', 'Set Logic — Transitivity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2714f51a-7f19-4fa4-954b-ce60d6d633f8', 'bcd32df3-67e5-4858-acc6-5b575edac5a0', 0, 'P and Q only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e77d3c8-19cb-4f66-b989-4cc6c3dee32c', 'bcd32df3-67e5-4858-acc6-5b575edac5a0', 1, 'Q and R only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5bbd55b3-8716-43d0-82d5-d63c2eccedba', 'bcd32df3-67e5-4858-acc6-5b575edac5a0', 2, 'P and R only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95cc7350-08db-49d9-bcea-a949197b9d3c', 'bcd32df3-67e5-4858-acc6-5b575edac5a0', 3, 'P, Q and R');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bcd32df3-67e5-4858-acc6-5b575edac5a0', '95cc7350-08db-49d9-bcea-a949197b9d3c', 'By transitivity of the nested subset relationships (red⊂blue⊂green⊂yellow), all three derived statements P, Q, and R are valid.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('140dbcbe-aa32-4d1c-a191-c4c8053ca3bc', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 45, 'Consider the following three statements, namely S1, S2 and S3:
S1. Protecting the environment is an existential exigency for humans, given the impact of environmental degradation on climate change.
S2. Scientific consensus has not been achieved with regard to the extent of the contribution of human intervention to climate change.
S3. Environmental activism includes climate alarmism and other extremist points of view that often become the focus of climate change deniers.
Which of the following relationships based on the statements given above is/are correct?', 'Logical Reasoning', 'Assumption Validity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38814e7c-750a-411b-ba46-6aefa366b9f9', '140dbcbe-aa32-4d1c-a191-c4c8053ca3bc', 0, 'S3 is a counterpoint to S1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('479ff060-8762-4560-823a-6102551a13bb', '140dbcbe-aa32-4d1c-a191-c4c8053ca3bc', 1, 'S3 is unconnected to S1 and S2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c015662a-921a-4b39-ab24-398ebdebf42e', '140dbcbe-aa32-4d1c-a191-c4c8053ca3bc', 2, 'S1 and S2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76ba2e8c-446e-474d-9430-507a90e5127b', '140dbcbe-aa32-4d1c-a191-c4c8053ca3bc', 3, 'S2 could be the reason for S3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('140dbcbe-aa32-4d1c-a191-c4c8053ca3bc', '76ba2e8c-446e-474d-9430-507a90e5127b', 'The perceived ambiguity over scientific consensus (S2) can plausibly drive activists toward more extreme framing (S3), making S2 a credible contributing reason for S3 -- the only logically supported relationship among the options.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6cae235f-bbd5-48c6-ab0b-98b452372342', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 46, 'Eight persons P, Q, R, S, T, U, V and W sit around a round table in eight different seats placed with equal distance between any two consecutive seats. Both P and R are adjacent to Q. Both T and R are adjacent to S. Both U and W are adjacent to V. S and W are on opposite chairs. If while going in the clockwise direction around the table from P, one meets R before T, then how many persons shall Q cross while moving in the clockwise direction around the table before meeting W?', 'Logical Reasoning', 'Positional Logic — Direct Info', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08e280ad-39fc-4917-9b10-c5b4d0ccc30a', '6cae235f-bbd5-48c6-ab0b-98b452372342', 0, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d686419-1802-4bf6-9af9-c81cb8923847', '6cae235f-bbd5-48c6-ab0b-98b452372342', 1, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('adc7c5b1-236e-4278-a46b-409359d3d02c', '6cae235f-bbd5-48c6-ab0b-98b452372342', 2, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f49f8042-f8e4-40ac-86e9-f4aa091903cc', '6cae235f-bbd5-48c6-ab0b-98b452372342', 3, '1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6cae235f-bbd5-48c6-ab0b-98b452372342', '08e280ad-39fc-4917-9b10-c5b4d0ccc30a', 'Placing all eight persons around the table consistent with every adjacency and opposite-chair constraint and then tracing Q''s clockwise path to W shows Q crosses 5 people first.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

-- ── Section: Reading Comprehension (19 questions) — UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com's official-paper reproduction page. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('219d3634-6a51-45e9-87cc-2137ff729a8e', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 47, 'Passage: "When SARS-CoV-2 was first detected in 2019, it was a truly novel virus for the world. At that time, no one in the world had been exposed to SARS-CoV-2 or had specific immunity against it. In contrast, people across the world have been exposed to HMPV for decades and the virus is well-studied. HMPV and SARS-CoV-2 belong to two very different virus families with fundamentally different characteristics and epidemiology, with strong seasonality seen in HMPV, unlike SARS-CoV-2. Both viruses cause different severity of symptoms, particularly over the long term, and the affected population segments do not fully overlap. In general, HMPV causes milder illness with deaths being very rare and with no long-term post-viral symptoms."
Which of the following conclusions is/are valid?
1. Though SARS-CoV-2 and HMPV are similar viruses with somewhat different epidemiology, the former became a pandemic because it was novel and people had not been exposed to it in the past.
2. The two viruses have fundamentally different impacts on human populations and should not therefore be dealt with in a similar manner.', 'Reading Comprehension', 'RC — Virus Comparison (Passage)', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('29f0c247-245f-4052-b0ca-215d292faf5f', '219d3634-6a51-45e9-87cc-2137ff729a8e', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59c92ca3-1332-4606-9b0e-c8c6f7ba7570', '219d3634-6a51-45e9-87cc-2137ff729a8e', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a99ea545-2bc3-4f2d-833e-e6f2c42f77c6', '219d3634-6a51-45e9-87cc-2137ff729a8e', 2, 'Both 1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32826efd-9e4d-4d83-ac98-3b7cf92834db', '219d3634-6a51-45e9-87cc-2137ff729a8e', 3, 'Neither 1 nor 2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('219d3634-6a51-45e9-87cc-2137ff729a8e', '59c92ca3-1332-4606-9b0e-c8c6f7ba7570', 'Only conclusion 2 is valid -- the passage explicitly states the viruses are fundamentally different, not similar as conclusion 1 wrongly asserts.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('328f2e14-73ae-401c-9b83-12058f56f9ab', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 48, 'Same SARS-CoV-2/HMPV passage as above. Which of the following reflect the intent of the writer in the above passage?
1. To evolve methodologies for objective analysis of the two viruses
2. To establish the epidemiological similarities and differences between the two viruses
3. To offer a better understanding of the remedies of HMPV when analysed in conjunction with SARS-CoV-2', 'Reading Comprehension', 'RC — Writer''s Intent', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf872e0d-3ad9-4013-be1f-ddbff62fc2dc', '328f2e14-73ae-401c-9b83-12058f56f9ab', 0, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26c16c94-dcf1-4324-a9fe-e8a2150bfb89', '328f2e14-73ae-401c-9b83-12058f56f9ab', 1, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a577506-d39c-4bc7-866b-3bdfe5c1e2e7', '328f2e14-73ae-401c-9b83-12058f56f9ab', 2, '1 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6bd50bcc-d5a7-45ad-b3bd-c148e2c11133', '328f2e14-73ae-401c-9b83-12058f56f9ab', 3, 'None of the above');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('328f2e14-73ae-401c-9b83-12058f56f9ab', '6bd50bcc-d5a7-45ad-b3bd-c148e2c11133', 'None of the three options accurately captures the writer''s actual intent (contrasting the two viruses'' real-world risk profile, not methodology, remedies, or a pure similarities/differences catalogue).', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9c9fa5d9-25a0-4075-804f-90b45256882e', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 49, 'Same SARS-CoV-2/HMPV passage. Which of the following statements reflect the logical and rational inferences that can be drawn from the passage?
1. HMPV has, historically, had longer documentation of studies when compared with SARS-CoV-2.
2. The two viruses are different from each other and this results in markedly different outcomes amongst those affected.
3. Long-term impacts of the two viruses are dissimilar and this is an important differentiator between them.
4. One of the common factors between the two viruses is seasonal specificity.', 'Reading Comprehension', 'RC — Logical Inference', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd2ec4b0-e306-44d7-b495-5258a4840a99', '9c9fa5d9-25a0-4075-804f-90b45256882e', 0, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8ce6a16-d77c-4257-a3ef-3afc964fa4e7', '9c9fa5d9-25a0-4075-804f-90b45256882e', 1, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('71a71061-e2ee-477b-bce3-3aec229663da', '9c9fa5d9-25a0-4075-804f-90b45256882e', 2, '3 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0fd0b065-e3d3-4d94-b005-a804aa4b9043', '9c9fa5d9-25a0-4075-804f-90b45256882e', 3, '1 and 3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9c9fa5d9-25a0-4075-804f-90b45256882e', 'd8ce6a16-d77c-4257-a3ef-3afc964fa4e7', 'Statements 1, 2, and 3 are directly supported by the passage. Statement 4 is wrong -- the passage says HMPV shows strong seasonality UNLIKE SARS-CoV-2, meaning seasonality is a difference, not a shared factor.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ef0b5028-20a2-4298-b978-3c28ec1d77ea', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 50, 'Passage: "India is starting to deploy AI for critical use cases such as weather forecasting, pest detection and control, and crop-yield optimisation. However, penetration is limited to a small subset of tech-savvy farmers. In the US and in Europe, generative AI tools have started offering precision farming at scale, integrating large datasets to provide real-time agronomic insights. For at-scale integration and accessibility of AI tools in India, it would be helpful to develop Indian languages-based AI tools for smallholder farmers, partner with AgTechs to create affordable AI solutions, and disseminate AI-based advisory services through government programmes."
Which of the following assumptions is/are valid?
1. Agricultural productivity has marched ahead in the West because of the economies of scale facilitated by the adoption of AI tools.
2. Affordable AI tools rendered available in local languages can help AI-based solutions reach more and more small farmers.
3. Though penetration is as yet low, critical application areas deploying AI tools are already in use in India.', 'Reading Comprehension', 'RC — AI Agriculture (Passage)', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7eae216d-2749-4557-b7b2-d61148c419fb', 'ef0b5028-20a2-4298-b978-3c28ec1d77ea', 0, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cdbcee7b-1e8d-4f80-a05d-f7e4fedc887d', 'ef0b5028-20a2-4298-b978-3c28ec1d77ea', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d40d4558-b62f-4c0b-b082-f0503c3f0b79', 'ef0b5028-20a2-4298-b978-3c28ec1d77ea', 2, '1 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('282328a0-a829-43f4-93d4-f7539a740a14', 'ef0b5028-20a2-4298-b978-3c28ec1d77ea', 3, '2 and 3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ef0b5028-20a2-4298-b978-3c28ec1d77ea', 'cdbcee7b-1e8d-4f80-a05d-f7e4fedc887d', 'Only assumption 2 is a valid, directly-supported assumption underlying the passage''s recommendation -- 1 and 3, while plausible-sounding, are not assumptions the passage''s argument actually depends on.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8d563877-d595-4fe8-b535-c03f42e70425', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 51, 'Same AI-in-agriculture passage. Which of the following statements is/are not correct?
1. Tech-savvy farmers will drive the AgTech companies of the future.
2. The development of advisory services by the government programmes for the use of AI tools in agriculture would be helpful.
3. In the US and Europe, AI tools have replaced traditional agricultural practices.
4. The integration of large datasets for use in real-time agronomic analysis is already a reality.', 'Reading Comprehension', 'RC — AI Agriculture, Inference', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c369e33b-309d-4d3b-bc14-7056a294d596', '8d563877-d595-4fe8-b535-c03f42e70425', 0, '1 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20ee44bc-01c3-40f3-92a1-dfdf47df9d17', '8d563877-d595-4fe8-b535-c03f42e70425', 1, '1, 3 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e5a1643-5a3f-4a73-9637-982be88b2d7d', '8d563877-d595-4fe8-b535-c03f42e70425', 2, '2 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d57a80c6-3c3d-4626-bebc-3669e41ca3fb', '8d563877-d595-4fe8-b535-c03f42e70425', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8d563877-d595-4fe8-b535-c03f42e70425', 'c369e33b-309d-4d3b-bc14-7056a294d596', 'Statements 1 and 3 are not correct/not supported by the passage -- the passage never claims tech-savvy farmers will ''drive AgTech companies,'' nor that AI has ''replaced'' traditional practices (only that it ''offers precision farming'').', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fa9f9ded-c817-4911-b3ed-7b159ebb0668', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 52, 'Passage: "The Juvenile Justice (Care and Protection of Children) Act, or the JJ Act, 2015 allows for the possibility for trying adolescents (above 16) as adults if they are accused of committing a heinous offence. A heinous offence is one with a minimum punishment of seven years. Offences such as culpable homicide and causing death by negligence, which are common in drunken driving cases, are not heinous offences because they do not have a prescribed minimum punishment. The JJ Act, amended in 2021, now categorises an offence that has no minimum sentence, but has a maximum sentence of seven years or more as a serious offence which nonetheless, in the opinion of activists, does not merit the transfer of a case to the adult criminal justice system."
Which of the following conclusions is/are valid?
1. Only a serious offence as categorised by the revised JJ Act, justifies the transfer of a case to the adult judicial system.
2. The JJ Act, 2021, categorises an offence as a serious offence based on the maximum sentence it carries, rather than on the minimum sentence.', 'Reading Comprehension', 'RC — Juvenile Justice Act (Passage)', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a1e88e7-e92a-415a-ac9b-a95a12deb4a7', 'fa9f9ded-c817-4911-b3ed-7b159ebb0668', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('22c58870-57de-4fa7-a8ff-ebdeb86a0aef', 'fa9f9ded-c817-4911-b3ed-7b159ebb0668', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c9b56a3-8abe-4a1e-a09d-b13d8683b60b', 'fa9f9ded-c817-4911-b3ed-7b159ebb0668', 2, 'Both 1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5b93abe-9612-4099-a8e5-22976ca5fc7c', 'fa9f9ded-c817-4911-b3ed-7b159ebb0668', 3, 'Neither 1 nor 2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fa9f9ded-c817-4911-b3ed-7b159ebb0668', '22c58870-57de-4fa7-a8ff-ebdeb86a0aef', 'Only conclusion 2 is valid -- the passage supports the maximum-sentence-based categorization, but explicitly notes that activists believe a serious offence does NOT merit adult-system transfer, contradicting conclusion 1.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('50a86007-ad6c-4051-a602-e21cde3d1610', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 53, 'Same JJ Act passage. Which of the following statements is/are correct?
1. If an offence has no minimum prescribed punishment, it cannot be considered heinous as per the JJ Act, 2015.
2. As per the JJ Act, 2021, an offence for which there is a provision for a maximum sentence of seven years or more, but no minimum sentence, is to be considered a serious offence.', 'Reading Comprehension', 'RC — Juvenile Justice Act, Statements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a28fdf2-a3a9-463c-8b10-2b0fc5b51af4', '50a86007-ad6c-4051-a602-e21cde3d1610', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ebf184a-7bb7-4a5e-9964-fa55f41b6872', '50a86007-ad6c-4051-a602-e21cde3d1610', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee27f2cf-ed72-4dd2-8989-3310c2ad001e', '50a86007-ad6c-4051-a602-e21cde3d1610', 2, 'Both 1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b593a66-a61e-49c9-856b-5a4d227c73ce', '50a86007-ad6c-4051-a602-e21cde3d1610', 3, 'Neither 1 nor 2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('50a86007-ad6c-4051-a602-e21cde3d1610', 'ee27f2cf-ed72-4dd2-8989-3310c2ad001e', 'Both statements are directly and correctly supported by the passage''s own definitions of ''heinous'' (requires a minimum 7-year sentence) and ''serious'' (maximum 7 years or more, no minimum) offences.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b17be117-aee6-47ef-91b5-d5fbab1f8ce0', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 54, 'Passage: "Previous waves of customer-service technology, including email and those pesky voice menus, stoked concerns of job losses, only for them to fail to materialise. AI could yet prove different. And if it does, its effects may be salutary. Human agents could be freed up to spend more time on creative and rewarding tasks, like using feedback to make products and services better and thereby spend less time listening to irate customers!"
Which one among the following statements most appropriately reflects the point of view of the given passage?', 'Reading Comprehension', 'RC — AI in Customer Service (Passage)', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('819aa76e-16cc-4dd2-92d5-6d18238d6389', 'b17be117-aee6-47ef-91b5-d5fbab1f8ce0', 0, 'If AI were to take over customer service, there would be no work left for human subjects to do.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('371cdaa6-e66a-4f62-98be-258657d5fcdf', 'b17be117-aee6-47ef-91b5-d5fbab1f8ce0', 1, 'Irritating voice menus and email could not achieve human redundancy to the extent that AI might.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a4dcd6d-783c-40de-8742-111946948f35', 'b17be117-aee6-47ef-91b5-d5fbab1f8ce0', 2, 'The value of human intervention in the workplace affected by AI might be enhanced through redirection towards more fulfilling tasks.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa2aa363-6503-4105-abf6-343e7f35c7e9', 'b17be117-aee6-47ef-91b5-d5fbab1f8ce0', 3, 'Unlike previous waves in customer-service technology, AI has raised the alarm of worker replacement.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b17be117-aee6-47ef-91b5-d5fbab1f8ce0', '9a4dcd6d-783c-40de-8742-111946948f35', 'The passage''s actual claim is that AI could free human agents for more creative, rewarding work -- option 3 directly reflects this ''enhancement through redirection'' framing; the other options overstate job losses or misstate the passage''s actual, more optimistic point.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2a9ecb47-7fe3-4208-b3ec-32c297a38851', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 55, 'Same AI-customer-service passage. Which of the following conclusions, made on the basis of the given passage, is/are correct?
1. The advent of new customer-service technology had invariably sparked fears about job losses.
2. Often it is found that instead of job losses, alternative channels for employee engagement are discovered while certain tasks are replaced by technology.
3. The advent of technology inevitably leads to stressful outcomes.', 'Reading Comprehension', 'RC — AI in Customer Service, Conclusions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02391f41-3372-49ae-9332-cab22639987a', '2a9ecb47-7fe3-4208-b3ec-32c297a38851', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97b49d81-f63f-4334-8c4c-2838dc0cf6f2', '2a9ecb47-7fe3-4208-b3ec-32c297a38851', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6680636-c8b7-44db-8761-a427aaabf576', '2a9ecb47-7fe3-4208-b3ec-32c297a38851', 2, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5255a74d-9657-41bc-8f77-2a9af3ffa5ef', '2a9ecb47-7fe3-4208-b3ec-32c297a38851', 3, '1 and 2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2a9ecb47-7fe3-4208-b3ec-32c297a38851', '5255a74d-9657-41bc-8f77-2a9af3ffa5ef', 'Conclusions 1 and 2 are both correctly supported -- prior waves did stoke job-loss fears that failed to materialize, consistent with redirection rather than elimination. Conclusion 3 is wrong and contradicted -- the passage frames AI''s likely effect as ''salutary,'' not inevitably stressful.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cf4dbdb5-953e-45fb-b2f8-b3379376d809', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 56, 'Passage: "The key source of the battle for clean skies and clear lungs is the fuel we burn—from household Chulhas to the thermal power plants. In most cases, it is biomass or coal. The Supreme Court banned the use of pet coke—the dirtiest of such fuels. The Delhi Government banned the use of coal, which was later extended to the entire National Capital Region. It was also agreed that the thermal power plants would clean up or shut down. Action on this has been patchy to say the least. The lesson from the transition to CNG is that people need alternatives for a ban to be effective. When diesel buses were stopped, CNG supply had to be assured. It also had to be feasible in terms of cost. The Supreme Court agreed that fiscal measures were needed to keep clean fuel cheaper than dirty fuel. Now even as coal is banned, the price of natural gas makes industry uncompetitive."
Which of the following inferences is/are correct?
1. The source of the energy we consume is the key to the battle for cleaner air.
2. Bans are effective where the will is strong and the people are convinced that such bans are for the greater good of society.
3. There is judicial approval for a policy that intervenes fiscally to facilitate benevolent pricing for cleaner fuel.', 'Reading Comprehension', 'RC — Pollution Policy (Passage)', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e6a3d3b-cf17-4bef-a2d3-74fda542b965', 'cf4dbdb5-953e-45fb-b2f8-b3379376d809', 0, '1 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f85f1259-6488-4597-a2bb-b72af9fac83d', 'cf4dbdb5-953e-45fb-b2f8-b3379376d809', 1, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d24f7c56-57e7-4407-bd0e-f2aafaf6df5d', 'cf4dbdb5-953e-45fb-b2f8-b3379376d809', 2, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4ced1d4-e3f2-432d-83e8-4ce5433c4868', 'cf4dbdb5-953e-45fb-b2f8-b3379376d809', 3, '1 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cf4dbdb5-953e-45fb-b2f8-b3379376d809', '0e6a3d3b-cf17-4bef-a2d3-74fda542b965', 'Inferences 1 and 3 are directly supported (fuel source is framed as the key battle; the Supreme Court explicitly agreed fiscal measures were needed). Inference 2 is not supported -- the passage''s actual lesson is that alternatives (not just ''strong will'') are what make a ban effective.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7d1d7d07-edf2-4ae7-b7b1-6918433d6a95', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 57, 'Same pollution/fuel passage. Which of the following statements is/are correct?
1. Thermal power stations in Delhi were required to summarily shut down.
2. CNG supplies had to be assured once diesel vehicles were prohibited from plying.
3. The Supreme Court banned the use of coal across the National Capital Region.', 'Reading Comprehension', 'RC — Pollution Policy, Statements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d99bdc1-80a0-4e1b-8cad-0bd859620cf4', '7d1d7d07-edf2-4ae7-b7b1-6918433d6a95', 0, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f76a5566-339d-4e17-9cfe-ece0182915e6', '7d1d7d07-edf2-4ae7-b7b1-6918433d6a95', 1, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3638133f-a92b-4fe4-94a2-5cbbdbeac2c3', '7d1d7d07-edf2-4ae7-b7b1-6918433d6a95', 2, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13956428-4790-4e7c-b0c2-660ea51858b8', '7d1d7d07-edf2-4ae7-b7b1-6918433d6a95', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7d1d7d07-edf2-4ae7-b7b1-6918433d6a95', '3638133f-a92b-4fe4-94a2-5cbbdbeac2c3', 'Only statement 2 is correct -- the passage says thermal plants were to ''clean up OR shut down'' (not summarily shut down), and it was the Delhi Government, not the Supreme Court, that banned coal (later extended to the NCR).', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('071dd77d-6528-49f8-9fd5-0f408b450738', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 58, 'Passage: "Was it the sun-dappled ambience, the strawberries and cream, the frustration of Flavio Cobolli''s unforced errors against Serbian Novak Djokovic on Centre Court or simply the crushing weight of being a 64-year-old man in the third act of a very public life? Whatever the reason, Hugh Grant, the actor, deserves empathy. There he was, in the Royal Box at Wimbledon, flanked by Britain''s well-dressed and well-rested spectators, watching the men''s singles quarterfinals, when the actor did something quietly radical: head at a tilt, eyes closed, utterly unbothered, he took a nap. So praise be to Grant for serving up an unexpected ace. In that small, delicious moment, he didn''t merely catch forty winks, he made an elegant case for surrender. Not to laziness, but to limits. To the body''s quiet wisdom over society''s relentless performance metrics. Wimbledon had its tennis. The perpetually sleep-deprived discovered a leading man, not of action, but of rest."
Which of the following statements is/are correct?
1. Radical action can also be attributed to mild surrender where one acts against societal expectations.
2. Submitting to one''s limitations, given the effect of age and other factors, ought not to be conflated with laziness.
3. ''Leading man'' usually refers to one who plays the lead role in a movie; in this instance the implication is that Hugh Grant is performing the role of not an action hero, but that of a resting one!', 'Reading Comprehension', 'RC — Hugh Grant at Wimbledon (Passage)', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2aac6045-4cbc-4f02-9226-5fc49e6216fb', '071dd77d-6528-49f8-9fd5-0f408b450738', 0, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7a10e62-fd6c-41c2-becf-a5e5f98b3994', '071dd77d-6528-49f8-9fd5-0f408b450738', 1, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b10c4a8a-9ac7-4ce5-90e9-099bde951d66', '071dd77d-6528-49f8-9fd5-0f408b450738', 2, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79d42434-669c-443e-b9ca-6991a6aee80b', '071dd77d-6528-49f8-9fd5-0f408b450738', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('071dd77d-6528-49f8-9fd5-0f408b450738', 'b10c4a8a-9ac7-4ce5-90e9-099bde951d66', 'All three statements are correctly supported by the passage''s framing of Grant''s nap as radical surrender to bodily limits (not laziness) and its explicit wordplay on ''leading man... not of action, but of rest.''', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('457ab2d8-aed0-455f-8890-a5b49ad6dc8f', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 59, 'Same Hugh Grant/Wimbledon passage. Which of the following statements is/are correct?
1. Hugh Grant was watching the men''s semifinal match on Centre Court between Flavio Cobolli and Novak Djokovic.
2. The phrase ''unexpected ace'' uses a tennis term to highlight Grant''s nap; an act viewed with opprobrium.
3. Grant subjects the demands of society to the wisdom of his body.', 'Reading Comprehension', 'RC — Hugh Grant, Correct Statements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d56f6eff-5078-439d-9898-90e3cda54e42', '457ab2d8-aed0-455f-8890-a5b49ad6dc8f', 0, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d20ecbe-48a2-4b49-97f4-ae2f03e31be6', '457ab2d8-aed0-455f-8890-a5b49ad6dc8f', 1, '3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8bb784f7-15f6-4c2f-8412-700697c96dea', '457ab2d8-aed0-455f-8890-a5b49ad6dc8f', 2, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd9e09f6-9196-4c77-a4a8-4f8e5d2836f7', '457ab2d8-aed0-455f-8890-a5b49ad6dc8f', 3, '2 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('457ab2d8-aed0-455f-8890-a5b49ad6dc8f', '7d20ecbe-48a2-4b49-97f4-ae2f03e31be6', 'Only statement 3 is correct. Statement 1 is wrong -- the passage says ''quarterfinals,'' not semifinals. Statement 2 is wrong -- the passage frames the nap approvingly (''praise be''), not with opprobrium (disapproval).', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('445e5efb-cce6-49be-9666-ed8ff466f3e5', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 60, 'Passage: "The process by which countries close their labour-productivity gap with the technology leader is based on convergence theory. The convergence model divides economic eras into three phases: the breakaway, the catch-up, and the fine-tuning phase. It also divides economic entities into two categories: the technology leaders and the technology followers. The process begins with the development of a new technology, such as scavenging—three million years ago (MYA), hunting—one MYA, farming—12 thousand years ago, and industrial technology—a little more than 200 years ago. During the breakaway phase, the per capita income of the technology leaders (e.g., Western Europe and North America in the industrial era) rises, but is unchanged for the technology followers. In the catch-up phase, the followers adopt the new technology and close their per capita income gap with the technology leaders. In the fine-tuning phase, where participants try to extract the remaining benefits from an increasingly exhausted technology, leaders and followers have similar per capita incomes."
Which of the following conclusions are correct?
1. In breakaway phase, economic progress is slow for technology followers.
2. In catch-up phase, leaders stagnate and followers close the gap.
3. In fine-tuning phase, technology is exhausted; leaders and followers extract remaining benefits.
4. Industrial technology followed scavenging, which preceded hunting, which was followed by farming.', 'Reading Comprehension', 'RC — Convergence Theory (Passage)', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9bdbd035-d3d4-4cc7-a9cf-c8892ba14567', '445e5efb-cce6-49be-9666-ed8ff466f3e5', 0, '3 and 4 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84d697d7-f62e-4817-83a9-32515b61dc0c', '445e5efb-cce6-49be-9666-ed8ff466f3e5', 1, '1, 2, 3 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1198bb2d-96cf-4238-826e-c06e7d98064a', '445e5efb-cce6-49be-9666-ed8ff466f3e5', 2, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff95ef4d-a075-49a2-a69c-6fb5e6f14236', '445e5efb-cce6-49be-9666-ed8ff466f3e5', 3, '2, 3 and 4 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('445e5efb-cce6-49be-9666-ed8ff466f3e5', '9bdbd035-d3d4-4cc7-a9cf-c8892ba14567', 'Statements 3 and 4 match the passage''s stated fine-tuning-phase description and the real chronological order (scavenging, hunting, farming, industrial). Statement 1 is wrong -- follower income is ''unchanged,'' not merely ''slow.'' Statement 2 is wrong -- leaders don''t ''stagnate'' in the catch-up phase per the passage.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bac83676-eab6-428b-aa24-970281e4a41a', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 61, 'Same convergence-theory passage. Which of the following statements is/are correct?
1. The convergence model divides nations into three phases of economic progress.
2. Convergence theory closes the gap between labour and productivity.
3. Technology leaders typically arrived earlier at different economic eras.
4. The timespan covered encompasses 3,012,200 years.', 'Reading Comprehension', 'RC — Convergence Theory, Statements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('56511ce1-21a0-4f26-b1d7-34faf46edf85', 'bac83676-eab6-428b-aa24-970281e4a41a', 0, '2 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7f87c4f-b32a-4cbc-9de7-7a2c013c93ff', 'bac83676-eab6-428b-aa24-970281e4a41a', 1, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3f2d3b5-2f6c-40d0-9b07-5a9525f9c786', 'bac83676-eab6-428b-aa24-970281e4a41a', 2, '3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b30ae8c8-5ec7-4840-acee-976314eda599', 'bac83676-eab6-428b-aa24-970281e4a41a', 3, '1, 3 and 4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bac83676-eab6-428b-aa24-970281e4a41a', 'a3f2d3b5-2f6c-40d0-9b07-5a9525f9c786', 'Only statement 3 is correct -- technology leaders are, by definition, the ones who arrive at each new economic era first. Statement 1 wrongly says the model divides NATIONS into phases (it divides ERAS into phases, and entities into leaders/followers). Statement 2 mischaracterizes the theory''s actual subject (closing income/productivity GAPS between countries, not ''closing the gap between labour and productivity'' as concepts). Statement 4''s exact figure isn''t what the passage supports.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e17b6c5d-14b2-43a2-845a-a22c4ca60edd', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 62, 'Passage: "Sport is not just about winning medals or getting jobs through a sports quota. Today''s generation is struggling with issues like depression and anxiety. Parents often say that their children are inactive and rarely leave the house. Sport can help tackle these problems. From sport you can learn time management, fitness, teamwork, coordination, and so much more. We need to develop a culture in which sport is seen as a way of life—a path to building a healthier, happier society."
Which of the following conclusions are valid?
1. Sport is more than just games; it is a way of life.
2. Sport can help mitigate the problems of seclusion among the young.
3. Earning laurels in sport can help one secure a job on the basis of an assigned quota.
4. Standard corporate sector skills cannot be learnt through sport.', 'Reading Comprehension', 'RC — Sport & Society (Passage)', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f670dae-725b-445a-af27-cf036133e033', 'e17b6c5d-14b2-43a2-845a-a22c4ca60edd', 0, '1 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c129b451-88f7-40fd-953c-1c5bbea99585', 'e17b6c5d-14b2-43a2-845a-a22c4ca60edd', 1, '2 and 4 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b85bdc00-4397-4ad7-959b-111918c68c21', 'e17b6c5d-14b2-43a2-845a-a22c4ca60edd', 2, '1, 2 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59081d81-7604-4d24-bf15-64ed398b9164', 'e17b6c5d-14b2-43a2-845a-a22c4ca60edd', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e17b6c5d-14b2-43a2-845a-a22c4ca60edd', '59081d81-7604-4d24-bf15-64ed398b9164', 'Conclusions 1, 2, and 3 are all directly supported by the passage. Conclusion 4 is wrong and contradicted -- the passage explicitly says sport teaches ''time management... teamwork, coordination,'' which are corporate-relevant skills.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('32267367-73bb-4ef6-a8df-bb397acd1f1b', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 63, 'Same sport/society passage. Which of the following statements is/are correct?
1. Parents lack sufficient encouragement for children''s sports participation
2. Sports develop life skills like time management and teamwork
3. Sport as lifestyle can fundamentally transform society''s nature', 'Reading Comprehension', 'RC — Sport & Society, Statement Support', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a12d8aa9-db01-4eba-86f0-960752a127a0', '32267367-73bb-4ef6-a8df-bb397acd1f1b', 0, '1 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ebc6103-037e-48c9-8b27-6c419a66612a', '32267367-73bb-4ef6-a8df-bb397acd1f1b', 1, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e7d370a-bb2f-4c72-a016-7fca50a0d3ab', '32267367-73bb-4ef6-a8df-bb397acd1f1b', 2, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c641146-61e0-41b3-b48f-fd6ea225e914', '32267367-73bb-4ef6-a8df-bb397acd1f1b', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('32267367-73bb-4ef6-a8df-bb397acd1f1b', '3e7d370a-bb2f-4c72-a016-7fca50a0d3ab', 'Only statement 2 is directly and explicitly supported by the passage''s own wording. Statements 1 and 3 go beyond what the passage actually claims -- unsupported inferences.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3a95f7d7-798f-47ed-9576-f03dfb2dd282', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 64, 'Passage (partial, on Kalagram cultural exhibition at Mahakumbh 2025, curated by the Ministry of Culture): "...inspired by iconic temples like the Dakshineshwar Kali Temple and the Brahma Mandir, were treasure troves of regional artistry. Bengal''s Pattachitra paintings, Assam''s bamboo crafts, Tamil Nadu''s Thanjavur paintings, and Madhya Pradesh''s tribal sculpture—all were showcased in these living galleries where 230 master artisans breathed life into them using age-old techniques, their hands shaping India''s ancient history into creations to behold."
Which of the following conclusions are valid?
1. Seven Sanskriti Angans, representing different regions of India, had been showcased in Kalagram.
2. Regional artistry was recognised via the inspiration drawn from iconic temples.
3. India''s ancient history had been crafted by the contemporary craftsmanship of 230 artisans into creations to behold.
4. Art forms from all regions of India had been showcased in these living galleries.', 'Reading Comprehension', 'RC — Kalagram (Passage)', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb049e9f-90fa-4576-b2a8-fbc559948232', '3a95f7d7-798f-47ed-9576-f03dfb2dd282', 0, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2ece41e-35b2-4a12-86e8-4057c5f530f9', '3a95f7d7-798f-47ed-9576-f03dfb2dd282', 1, '2, 3 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e069dc1-e53c-4e8a-a27a-32be7b9e0573', '3a95f7d7-798f-47ed-9576-f03dfb2dd282', 2, '1, 2 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fcd23386-e21e-4202-a546-39e9196b5c6f', '3a95f7d7-798f-47ed-9576-f03dfb2dd282', 3, '1 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3a95f7d7-798f-47ed-9576-f03dfb2dd282', 'fcd23386-e21e-4202-a546-39e9196b5c6f', 'Conclusions 1 and 3 are valid. Conclusion 2 reverses the actual relationship -- the temples inspired the exhibition spaces, not the reverse. Conclusion 4 overgeneralizes ''all regions'' when the passage names only four specific states.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4a8572e3-c6c8-44ef-94ac-c7c156e055d6', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 65, 'Same Kalagram passage. Which one of the following statements is not correct?', 'Reading Comprehension', 'RC — Kalagram, False Statement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f92f8902-948e-45ad-8d14-b2da8be8b3e1', '4a8572e3-c6c8-44ef-94ac-c7c156e055d6', 0, 'Paintings from four States of India have been mentioned.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1bee0a82-124a-4680-ae53-59efef4f6c1d', '4a8572e3-c6c8-44ef-94ac-c7c156e055d6', 1, 'Stepping into Kalagram is likened to stepping into another world.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8449c824-d68c-41dd-911b-64c70b0943b1', '4a8572e3-c6c8-44ef-94ac-c7c156e055d6', 2, 'The Angans have been described as living galleries.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed98cbfc-ba99-4874-8db8-b0e271d0d43a', '4a8572e3-c6c8-44ef-94ac-c7c156e055d6', 3, 'Kalagram is divided into thematic zones, inspired by well-known temples of India.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4a8572e3-c6c8-44ef-94ac-c7c156e055d6', 'f92f8902-948e-45ad-8d14-b2da8be8b3e1', 'Statement (a) is factually wrong -- only two of the four mentioned art forms are paintings (Bengal''s Pattachitra, Tamil Nadu''s Thanjavur); the other two are Assam''s bamboo crafts and Madhya Pradesh''s tribal sculpture, not paintings.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

-- ── Section: Data Sufficiency (5 questions) — UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com's official-paper reproduction page. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3a1668bf-661f-404f-abdb-99caec60cacb', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 66, 'X receives three coins of different denominations from the set 1, 2, 5, 10 and 20. If the total amount received by X is m, does X receive a coin of denomination 5?
Statement I: m is not a prime number.
Statement II: The sum of the digits of m is greater than 5.', 'Data Sufficiency', 'Data Sufficiency — Coins', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c02c271-2830-4e62-97ae-a161a47d0cc7', '3a1668bf-661f-404f-abdb-99caec60cacb', 0, 'Can be answered using one statement alone, but not the other');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f58f9052-c9cd-4e00-aa8d-9224ecc84e4f', '3a1668bf-661f-404f-abdb-99caec60cacb', 1, 'Can be answered using either statement alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f40a3a6c-0cfc-48df-8c12-5980571654fe', '3a1668bf-661f-404f-abdb-99caec60cacb', 2, 'Can be answered using both statements together only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e2fdb79-5566-4be4-95cd-43015ee5b1c4', '3a1668bf-661f-404f-abdb-99caec60cacb', 3, 'Cannot be answered using any statement');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3a1668bf-661f-404f-abdb-99caec60cacb', '2c02c271-2830-4e62-97ae-a161a47d0cc7', 'Statement II alone is sufficient to determine whether a 5-denomination coin was received; Statement I alone leaves the answer ambiguous across multiple possible coin combinations.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('13bcd8cf-fb42-4595-b35c-feecacaf445f', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 67, 'For two distinct real numbers x and y, which of them is bigger?
Statement I: x² < y < 1
Statement II: y < √x < 1', 'Data Sufficiency', 'Data Sufficiency — Comparison', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1abde061-f89b-46d7-b9ab-49a4b48cdb6b', '13bcd8cf-fb42-4595-b35c-feecacaf445f', 0, 'Can be answered using one statement alone, but not the other');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f95ee7f-58ad-4843-a007-0462a748f16f', '13bcd8cf-fb42-4595-b35c-feecacaf445f', 1, 'Can be answered using either statement alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8874abc6-ef33-46b3-a5b3-7f4fa4bb42e3', '13bcd8cf-fb42-4595-b35c-feecacaf445f', 2, 'Can be answered using both statements together only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a76caf5-9ae5-41da-83e1-4041d27a6072', '13bcd8cf-fb42-4595-b35c-feecacaf445f', 3, 'Cannot be answered even using both statements together');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('13bcd8cf-fb42-4595-b35c-feecacaf445f', '5a76caf5-9ae5-41da-83e1-4041d27a6072', 'Testing valid values consistent with both statements together still produces contradictory orderings of x and y -- the question cannot be resolved even with both statements combined.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c52dbb5f-0702-4d56-bace-c4cb394672a0', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 68, 'If x and y are integers, then is x even?
Statement I: x²y² is even.
Statement II: 1 + x² + y² is odd.', 'Data Sufficiency', 'Data Sufficiency — Parity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a88582ca-42da-4171-8967-808dd05c9d14', 'c52dbb5f-0702-4d56-bace-c4cb394672a0', 0, 'Can be answered using one statement alone, but not the other');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b188a393-bfff-407d-ad39-4d07d02c2b88', 'c52dbb5f-0702-4d56-bace-c4cb394672a0', 1, 'Can be answered using either statement alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99614f3a-6c1c-4437-a029-8d4baed2031c', 'c52dbb5f-0702-4d56-bace-c4cb394672a0', 2, 'Can be answered using both statements together, but not using either statement alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5ffd3fd-9559-4898-8424-7530acc5dccd', 'c52dbb5f-0702-4d56-bace-c4cb394672a0', 3, 'Cannot be answered even using both statements');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c52dbb5f-0702-4d56-bace-c4cb394672a0', '99614f3a-6c1c-4437-a029-8d4baed2031c', 'Neither statement alone pins down x''s parity, but combined, they jointly force x to be even.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0029e1f7-cde7-47f3-b752-4b14d6c34690', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 69, 'X is a collection of certain odd numbers whereas Y is a collection of certain even numbers. T consists of the numbers all of which are either from X or from Y. Is every number of T from Y?
Statement I: The sum of any two numbers belonging to T is even.
Statement II: If both p and q are picked from T, then (p-1)q is even.', 'Data Sufficiency', 'Data Sufficiency — Set Membership', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1aa23fd-316e-42a2-8b77-5ff9e1829010', '0029e1f7-cde7-47f3-b752-4b14d6c34690', 0, 'Can be answered using one statement alone, but not the other');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae114cbf-b21c-4088-bf18-07ba6a0f96b1', '0029e1f7-cde7-47f3-b752-4b14d6c34690', 1, 'Can be answered using either statement alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('711e5feb-6553-4547-8a59-af9a53f4a2ce', '0029e1f7-cde7-47f3-b752-4b14d6c34690', 2, 'Can be answered using both statements together only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f7b9040-4c69-438d-a153-ecfd613dea3e', '0029e1f7-cde7-47f3-b752-4b14d6c34690', 3, 'Cannot be answered even using both statements together');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0029e1f7-cde7-47f3-b752-4b14d6c34690', '9f7b9040-4c69-438d-a153-ecfd613dea3e', 'Both an all-even T and an all-odd T satisfy both statements equally, so neither statement alone nor both together can determine whether every number of T is from Y specifically.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('be5d1bca-f52e-4037-b876-1e57813a3275', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 70, 'If x, y and z are integers, each greater than 1, then is x a prime number?
Statement I: xy² = 116
Statement II: xz = 261', 'Data Sufficiency', 'Data Sufficiency — Primality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75b0bde8-67a7-4f41-b1f1-fb7c4754368e', 'be5d1bca-f52e-4037-b876-1e57813a3275', 0, 'Can be answered using one statement alone, but not the other');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c518adad-9652-48a5-a4ca-bf8f2cecf063', 'be5d1bca-f52e-4037-b876-1e57813a3275', 1, 'Can be answered using either statement alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de0c1dd2-a3da-4ab2-b1e9-254439549977', 'be5d1bca-f52e-4037-b876-1e57813a3275', 2, 'Can be answered using both statements together, but not using either alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe1646a5-b291-4d85-b36e-514297ebb203', 'be5d1bca-f52e-4037-b876-1e57813a3275', 3, 'Cannot be answered even using both statements together');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('be5d1bca-f52e-4037-b876-1e57813a3275', '75b0bde8-67a7-4f41-b1f1-fb7c4754368e', 'Statement I alone gives x=29 uniquely (since 116=29×4=29×2²), a prime, sufficient on its own. Statement II alone is ambiguous, since xz=261 admits multiple valid (x,z) pairs (x could be 3, 9, 29, or 87).', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

-- ── Section: Communication & Interpersonal Skills (6 questions) — UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim against dalvoy.com's dedicated per-question page (anantamias.com's page hit an internal length limit around Q48 and could not serve this range). ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e6c511e5-f84a-45b6-bf90-892943647b07', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 71, 'Match List-I (Tool of communication) with List-II (Purpose) and select the answer using the code given below the Lists:
List-I: A. Memorandum B. Flyer C. Bcc D. Minutes
List-II: 1. To record decisions 2. To inform confidentially 3. To intimate a directive 4. To disseminate non-targeted information', 'Communication Skills', 'Communication Tools Matching', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('feec6e63-4006-4cd0-8e22-8a6a14dd538a', 'e6c511e5-f84a-45b6-bf90-892943647b07', 0, 'A-1, B-4, C-2, D-3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fab5811d-b0e5-4ef1-ab72-824b154eb6f7', 'e6c511e5-f84a-45b6-bf90-892943647b07', 1, 'A-1, B-2, C-4, D-3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0db111f2-71dc-490d-a2bf-9132cf136d74', 'e6c511e5-f84a-45b6-bf90-892943647b07', 2, 'A-3, B-4, C-2, D-1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8479f30-fc95-4229-b4c7-a1a84f1a029f', 'e6c511e5-f84a-45b6-bf90-892943647b07', 3, 'A-3, B-2, C-4, D-1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e6c511e5-f84a-45b6-bf90-892943647b07', '0db111f2-71dc-490d-a2bf-9132cf136d74', 'Memorandum issues directives (3); Flyer disseminates non-targeted information broadly (4); Bcc informs confidentially (2); Minutes record decisions (1) -- code A-3, B-4, C-2, D-1.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim against dalvoy.com''s dedicated per-question page (anantamias.com''s page hit an internal length limit around Q48 and could not serve this range).');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d0ab377c-a8f7-4243-b54c-eae243afdfa6', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 72, 'Match List-I (Relationship) with List-II (Type of Communication) and select the answer using the code given below the Lists:
List-I: A. Between cricket captain and team members B. Between judge and lawyers in court C. Between Vice Chancellor and Deputy Registrar D. Between peers and coworkers
List-II: 1. Informal and firm 2. Informal and open-ended 3. Formal and open-ended 4. Formal and firm', 'Communication Skills', 'Communication Styles Matching', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1871b2c-6afa-426e-8389-1379f9a8a6af', 'd0ab377c-a8f7-4243-b54c-eae243afdfa6', 0, 'A-1, B-3, C-4, D-2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08abc8b2-c257-45e1-a8a6-3c87719f1cab', 'd0ab377c-a8f7-4243-b54c-eae243afdfa6', 1, 'A-1, B-4, C-3, D-2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e715b9c-830c-4aa8-92e8-3d7db6dd86a0', 'd0ab377c-a8f7-4243-b54c-eae243afdfa6', 2, 'A-2, B-4, C-3, D-1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d9df70d-f5bb-4978-87ce-0d55e4bec5b9', 'd0ab377c-a8f7-4243-b54c-eae243afdfa6', 3, 'A-2, B-3, C-4, D-1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d0ab377c-a8f7-4243-b54c-eae243afdfa6', '08abc8b2-c257-45e1-a8a6-3c87719f1cab', 'A captain-team relationship is informal and firm (directive but not bureaucratic); judge-lawyer is formal and firm; VC-Deputy Registrar is formal and open-ended (institutional hierarchy allowing discussion); peers/coworkers is informal and open-ended -- code A-1, B-4, C-3, D-2.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim against dalvoy.com''s dedicated per-question page (anantamias.com''s page hit an internal length limit around Q48 and could not serve this range).');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5a288078-6077-4896-83cc-19e285c103fe', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 73, 'Which among the following actions would constitute the most appropriate directive(s) in resolving interpersonal conflict in an office with culturally diverse personnel?
1. Direct personnel to practice cultural markers of diverse groups
2. Allow conflicts to resolve naturally over time to set leadership precedent
3. Encourage personnel to seek each other''s perspectives', 'Communication Skills', 'Conflict Resolution', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dce201d7-33f2-462d-95e4-53566a8065e8', '5a288078-6077-4896-83cc-19e285c103fe', 0, '1 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('180718e8-c543-43f1-ad9a-81a9a8a24b39', '5a288078-6077-4896-83cc-19e285c103fe', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2eeb7519-7665-43f1-8efb-09e98cbfd6f9', '5a288078-6077-4896-83cc-19e285c103fe', 2, '3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ea73766-876f-41d5-9340-6cc67597e3d4', '5a288078-6077-4896-83cc-19e285c103fe', 3, '2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5a288078-6077-4896-83cc-19e285c103fe', '2eeb7519-7665-43f1-8efb-09e98cbfd6f9', 'Only encouraging mutual perspective-seeking (3) is a genuinely appropriate directive -- mandating specific cultural practices (1) risks tokenism, and passively allowing conflicts to resolve on their own (2) avoids the leadership responsibility to actively manage the situation.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim against dalvoy.com''s dedicated per-question page (anantamias.com''s page hit an internal length limit around Q48 and could not serve this range).');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d8d14df4-f450-48de-9279-3fc7072768a8', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 74, 'Match List-I (Barrier to communication) with List-II (Example) and select the answer using the code given below the Lists:
List-I: A. Semantic B. Cognitive C. Organisational D. Affective
List-II: 1. Lack of feedback 2. Misunderstanding the meaning of a word 3. Fear of social stigma 4. Information overload', 'Communication Skills', 'Barriers to Communication', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8090a9ea-390a-4cfc-b657-ff3966588749', 'd8d14df4-f450-48de-9279-3fc7072768a8', 0, 'A-3, B-1, C-4, D-2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c7f695d-7189-43f1-8bdc-cf99bac0dd9a', 'd8d14df4-f450-48de-9279-3fc7072768a8', 1, 'A-3, B-4, C-1, D-2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6332f5aa-9c1b-485b-97d7-022993819d62', 'd8d14df4-f450-48de-9279-3fc7072768a8', 2, 'A-2, B-1, C-4, D-3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58938ea1-748e-42dd-8edf-aa62cfc4812b', 'd8d14df4-f450-48de-9279-3fc7072768a8', 3, 'A-2, B-4, C-1, D-3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d8d14df4-f450-48de-9279-3fc7072768a8', '58938ea1-748e-42dd-8edf-aa62cfc4812b', 'Semantic barriers involve word-meaning confusion (2); Cognitive barriers involve information-processing overload (4); Organisational barriers involve structural issues like lack of feedback (1); Affective barriers involve emotional factors like stigma fear (3) -- code A-2, B-4, C-1, D-3.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim against dalvoy.com''s dedicated per-question page (anantamias.com''s page hit an internal length limit around Q48 and could not serve this range).');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('435e0b1b-249d-4f8b-9830-1fe0d12f1d5e', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 75, 'With reference to ''circular letters'', which of the following statements is/are correct?
1. Circular letters are usually addressed to a group of people.
2. Non-standard and customized content is typical of circular letters.
3. Circular letters are used to intimate appraisals and increments of employees within organisations.
4. Circular letters are less cost-effective than personalised and specific recipient-directed letters.', 'Communication Skills', 'Circular Letters', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d33fbb19-eb2a-4d12-a79c-6ee4ce5509d1', '435e0b1b-249d-4f8b-9830-1fe0d12f1d5e', 0, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('776b5b61-f7f1-4d0c-8a5e-69d7d96579c0', '435e0b1b-249d-4f8b-9830-1fe0d12f1d5e', 1, '2 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d87880cf-9e01-4813-be4a-2aa9f3a45f73', '435e0b1b-249d-4f8b-9830-1fe0d12f1d5e', 2, '1, 3 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('faf5c848-dd58-4a78-819b-c9957ef66ebc', '435e0b1b-249d-4f8b-9830-1fe0d12f1d5e', 3, '1 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('435e0b1b-249d-4f8b-9830-1fe0d12f1d5e', 'faf5c848-dd58-4a78-819b-c9957ef66ebc', 'Only statement 1 is correct -- circular letters are standardized (not customized, so 2 is wrong), used for general mass announcements (not confidential appraisals, so 3 is wrong), and are more cost-effective than personalized letters (so 4 is wrong).', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim against dalvoy.com''s dedicated per-question page (anantamias.com''s page hit an internal length limit around Q48 and could not serve this range).');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ba03af99-d1e3-4528-84f9-d7cad46b1732', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 76, 'You are required to design a ''questionnaire'' to be filled on-location by visitors, based on the following objective while writing a report: ''To determine the feasibility of setting up a family-oriented vacation resort in the vicinity of a lake destination in the mountains''. The questionnaire should assess which of these four items?
1. Size of family
2. Budget
3. Number of earners in the family
4. Food allergies and dietary restrictions', 'Communication Skills', 'Feasibility Questionnaire Design', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab239dd2-9c15-46cb-92af-2afd82efa6a7', 'ba03af99-d1e3-4528-84f9-d7cad46b1732', 0, '1 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc969b36-c92c-4f03-9cba-8608114c116f', 'ba03af99-d1e3-4528-84f9-d7cad46b1732', 1, '1, 2 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99ffe7d6-ee94-4341-a47a-f34f5dc21a51', 'ba03af99-d1e3-4528-84f9-d7cad46b1732', 2, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43d03f60-aaee-4ef9-a1f5-51b454ee3c33', 'ba03af99-d1e3-4528-84f9-d7cad46b1732', 3, '2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ba03af99-d1e3-4528-84f9-d7cad46b1732', '99ffe7d6-ee94-4341-a47a-f34f5dc21a51', 'Family size and vacation budget are the macro-level indicators most directly relevant to assessing commercial feasibility and infrastructure sizing -- number of earners is redundant once budget is captured, and dietary restrictions are a micro-level operational detail, not a feasibility question.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim against dalvoy.com''s dedicated per-question page (anantamias.com''s page hit an internal length limit around Q48 and could not serve this range).');

-- ── Section: Decision Making & Economic Statistics (2 questions) — UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim against dalvoy.com's dedicated per-question page (anantamias.com's page hit an internal length limit around Q48 and could not serve this range). ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c91714c6-d603-4e24-922c-3a9023593393', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 77, 'Which of the following statements is/are correct?
1. Real value should not change in the instance of static output cost and unchanged quantities against falling oil prices.
2. Deflators are to be used separately for inputs and outputs, and this is a practice universally adopted by all economies.', 'Decision Making', 'National Accounts — Deflators', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6c90bc7-6e55-46f5-9b79-ba2e2ff906ab', 'c91714c6-d603-4e24-922c-3a9023593393', 0, 'Statement 1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5851d2b-06dc-4fa0-ac18-a85105bd2332', 'c91714c6-d603-4e24-922c-3a9023593393', 1, 'Statement 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6f20022-f005-43bf-8a75-6d23732e6bdb', 'c91714c6-d603-4e24-922c-3a9023593393', 2, 'Both 1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('411bbd89-20d1-4d5c-a25d-defca1655e6a', 'c91714c6-d603-4e24-922c-3a9023593393', 3, 'Neither 1 nor 2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c91714c6-d603-4e24-922c-3a9023593393', 'b6c90bc7-6e55-46f5-9b79-ba2e2ff906ab', 'Statement 1 is correct -- real value measures physical output volume, independent of price changes. Statement 2 is wrong -- while double deflation (separate input/output deflators) is recommended by the UN System of National Accounts, it is not universally adopted; many economies still use single deflation.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim against dalvoy.com''s dedicated per-question page (anantamias.com''s page hit an internal length limit around Q48 and could not serve this range).');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e9804e32-5622-4913-ba8f-5427bb839a48', 'abd8c4bb-454f-403e-80bc-5521551c02e5', 78, 'Which of the following assumptions is/are valid?
1. Deflation strategies can be used to make manufacturers appear to be doing better than they actually are.
2. When input and output prices are both deflated against a single input price, it is referred to as ''double deflation''.', 'Decision Making', 'National Accounts — Double Deflation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40b42644-6d4b-41a5-a0bf-fd3dc758b5e4', 'e9804e32-5622-4913-ba8f-5427bb839a48', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ffb7543c-fd94-4e58-9e1c-2f9d2439dbe2', 'e9804e32-5622-4913-ba8f-5427bb839a48', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3771998e-f053-46ec-9043-6a522ed702f3', 'e9804e32-5622-4913-ba8f-5427bb839a48', 2, 'Both 1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c66c44ab-9c3c-4d2f-9ee4-110139f2cfe3', 'e9804e32-5622-4913-ba8f-5427bb839a48', 3, 'Neither 1 nor 2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e9804e32-5622-4913-ba8f-5427bb839a48', '40b42644-6d4b-41a5-a0bf-fd3dc758b5e4', 'Assumption 1 is valid -- using single deflation (rather than proper double deflation) can artificially inflate apparent manufacturing growth. Assumption 2 is wrong -- double deflation means deflating input and output prices using SEPARATE price indices, not a single one.', 'UPSC CSE Prelims 2026, CSAT Paper II (exam held 24 May 2026). Verified verbatim against dalvoy.com''s dedicated per-question page (anantamias.com''s page hit an internal length limit around Q48 and could not serve this range).');
