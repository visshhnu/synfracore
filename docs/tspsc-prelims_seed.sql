-- ============================================================
-- TSPSC Group I Prelims — Practice Paper 1
-- Full-Length Practice Paper (20 questions, 18 minutes)
-- Marking: +1 correct / -0 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 'tspsc-prelims-practice-1', 'TSPSC Group I Prelims Practice Paper 1', 'tspsc', ARRAY['TSPSC', 'Group I', 'Prelims', 'Telangana', 'General Studies', 'Mental Ability']::TEXT[], 20, 'standard', true, 1, 18, 1, 0);

-- ── Section: General Studies (10 questions) — General Studies — authored from TSPSC Group I's own published Prelims syllabus (Telangana history/movement/culture, Indian polity, economy, geography, science & technology, current affairs); not copied from any official TSPSC question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c376f209-237b-44b9-9375-b3baf6f6163e', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 1, 'The Telangana Rebellion (1946-51), a peasant armed struggle against feudal landlords, was significantly led by which political organization?', 'General Studies', 'Telangana Movement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2c22132-70c7-4b3c-91e9-80e6131d305b', 'c376f209-237b-44b9-9375-b3baf6f6163e', 0, 'Indian National Congress');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e81fc14-522e-4858-8ed1-f56b11822141', 'c376f209-237b-44b9-9375-b3baf6f6163e', 1, 'Communist Party of India');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d660cf2-3008-481c-b94d-0f8202d4292c', 'c376f209-237b-44b9-9375-b3baf6f6163e', 2, 'Hyderabad State Congress');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d2213e0-1eee-46a0-baf7-dbf371074276', 'c376f209-237b-44b9-9375-b3baf6f6163e', 3, 'Andhra Mahasabha alone, unaffiliated with any party');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c376f209-237b-44b9-9375-b3baf6f6163e', '1e81fc14-522e-4858-8ed1-f56b11822141', 'The Communist Party of India played a central leadership role in the Telangana Rebellion, an armed peasant struggle against feudal landlords (Deshmukhs) and the Nizam''s rule.', 'General Studies — authored from TSPSC Group I''s own published Prelims syllabus (Telangana history/movement/culture, Indian polity, economy, geography, science & technology, current affairs); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1ac3f8a4-0f2b-49ca-96fa-350011c44413', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 2, 'The state of Telangana was formally carved out of Andhra Pradesh in which year?', 'General Studies', 'Telangana Formation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('399c7b55-4c47-420f-a6b8-a945a84a932b', '1ac3f8a4-0f2b-49ca-96fa-350011c44413', 0, '2012');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c42d548c-cb11-44e4-bba6-6aab882e9435', '1ac3f8a4-0f2b-49ca-96fa-350011c44413', 1, '2013');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2aff5584-8dc8-4ab6-9623-692ad699de88', '1ac3f8a4-0f2b-49ca-96fa-350011c44413', 2, '2014');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b503e983-76e3-4aaa-8cf0-eff7fccda9f1', '1ac3f8a4-0f2b-49ca-96fa-350011c44413', 3, '2015');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1ac3f8a4-0f2b-49ca-96fa-350011c44413', '2aff5584-8dc8-4ab6-9623-692ad699de88', 'Telangana became India''s 29th state on 2 June 2014, formed by bifurcating the erstwhile Andhra Pradesh.', 'General Studies — authored from TSPSC Group I''s own published Prelims syllabus (Telangana history/movement/culture, Indian polity, economy, geography, science & technology, current affairs); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5f86a9dd-4b3d-4e0f-855b-d36255f6e282', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 3, 'Bathukamma, a floral festival celebrated predominantly by women, is a distinctive cultural tradition of which state?', 'General Studies', 'Telangana Culture', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2b8ccc1-c100-4ebc-98c2-38b5bf6791cd', '5f86a9dd-4b3d-4e0f-855b-d36255f6e282', 0, 'Andhra Pradesh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('adc1d08b-e3a0-4a52-9d76-94a111681ad0', '5f86a9dd-4b3d-4e0f-855b-d36255f6e282', 1, 'Telangana');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbb48a68-ade6-4ebe-b524-81449fe45330', '5f86a9dd-4b3d-4e0f-855b-d36255f6e282', 2, 'Karnataka');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a94e7e2e-2a34-4691-b0fd-466c5046e734', '5f86a9dd-4b3d-4e0f-855b-d36255f6e282', 3, 'Tamil Nadu');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5f86a9dd-4b3d-4e0f-855b-d36255f6e282', 'adc1d08b-e3a0-4a52-9d76-94a111681ad0', 'Bathukamma is a distinctive floral festival of Telangana, celebrated over nine days, now also recognized as a state festival.', 'General Studies — authored from TSPSC Group I''s own published Prelims syllabus (Telangana history/movement/culture, Indian polity, economy, geography, science & technology, current affairs); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('af26f778-aaa5-4f88-8498-821e3d7819a4', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 4, 'The Anti-Defection Law in India is contained in which Schedule of the Constitution?', 'General Studies', 'Indian Polity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a41987f-e961-40db-a250-735b0896bb6b', 'af26f778-aaa5-4f88-8498-821e3d7819a4', 0, 'Ninth Schedule');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0fd4bbcd-79e0-43c5-9179-ac424c67eebf', 'af26f778-aaa5-4f88-8498-821e3d7819a4', 1, 'Tenth Schedule');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1630e617-2e36-48e6-b9c0-f4c906f053d4', 'af26f778-aaa5-4f88-8498-821e3d7819a4', 2, 'Eleventh Schedule');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51918ece-654d-4845-a92e-e94a2a2d775b', 'af26f778-aaa5-4f88-8498-821e3d7819a4', 3, 'Twelfth Schedule');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('af26f778-aaa5-4f88-8498-821e3d7819a4', '0fd4bbcd-79e0-43c5-9179-ac424c67eebf', 'The Tenth Schedule, added by the 52nd Amendment (1985), contains the Anti-Defection provisions.', 'General Studies — authored from TSPSC Group I''s own published Prelims syllabus (Telangana history/movement/culture, Indian polity, economy, geography, science & technology, current affairs); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('416386c4-2316-46e3-b3da-8fa65c32cdd1', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 5, 'The Kaleshwaram Lift Irrigation Project, one of the world''s largest multi-stage lift irrigation schemes, is built primarily on which river?', 'General Studies', 'Telangana Geography', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc95dc15-afc4-4f02-afeb-94834e0c0761', '416386c4-2316-46e3-b3da-8fa65c32cdd1', 0, 'Krishna');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('653d877c-edec-456b-9bba-2b8d4519dea7', '416386c4-2316-46e3-b3da-8fa65c32cdd1', 1, 'Godavari');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b448e856-764e-4bff-8ec8-6fde65cf62f1', '416386c4-2316-46e3-b3da-8fa65c32cdd1', 2, 'Musi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2aecb1b9-5023-4be1-b222-bd6708f11fc3', '416386c4-2316-46e3-b3da-8fa65c32cdd1', 3, 'Manjira');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('416386c4-2316-46e3-b3da-8fa65c32cdd1', '653d877c-edec-456b-9bba-2b8d4519dea7', 'The Kaleshwaram Lift Irrigation Project draws water from the Godavari river, lifting it across multiple stages to irrigate Telangana''s drought-prone regions.', 'General Studies — authored from TSPSC Group I''s own published Prelims syllabus (Telangana history/movement/culture, Indian polity, economy, geography, science & technology, current affairs); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6895e021-9078-4c14-86ff-36b7aafb8f29', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 6, 'Which of the following best describes ''Fiscal Deficit''?', 'General Studies', 'Indian Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ab5f8c0-37fd-4e15-8d5f-c3d08dfebe87', '6895e021-9078-4c14-86ff-36b7aafb8f29', 0, 'Total revenue minus total expenditure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('486b5237-1051-4fbf-b37e-ed94ebdf7746', '6895e021-9078-4c14-86ff-36b7aafb8f29', 1, 'Total expenditure minus total receipts excluding borrowings');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0578950a-2415-425d-9956-7e71761b1326', '6895e021-9078-4c14-86ff-36b7aafb8f29', 2, 'Total borrowings minus total revenue');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2af6752-e5d0-4b6a-a772-9670a4f6d50e', '6895e021-9078-4c14-86ff-36b7aafb8f29', 3, 'Total exports minus total imports');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6895e021-9078-4c14-86ff-36b7aafb8f29', '486b5237-1051-4fbf-b37e-ed94ebdf7746', 'Fiscal deficit is the excess of total government expenditure over total receipts (revenue plus non-debt capital receipts), excluding borrowings themselves.', 'General Studies — authored from TSPSC Group I''s own published Prelims syllabus (Telangana history/movement/culture, Indian polity, economy, geography, science & technology, current affairs); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6720d9c0-690a-4b14-ab4d-df57c695f818', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 7, 'The Defence Research and Development Organisation (DRDO) has a major missile-technology research complex located in which Telangana city?', 'General Studies', 'Science & Technology', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6172b61-4be4-49d8-a628-4ab598fb4f0c', '6720d9c0-690a-4b14-ab4d-df57c695f818', 0, 'Warangal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4fb8ae12-ed12-4987-a7d7-85917c397761', '6720d9c0-690a-4b14-ab4d-df57c695f818', 1, 'Hyderabad');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('daba0d13-771b-4852-ad10-e2cdfe0012db', '6720d9c0-690a-4b14-ab4d-df57c695f818', 2, 'Karimnagar');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7daddd55-bcc3-40be-ab21-215a9439db8d', '6720d9c0-690a-4b14-ab4d-df57c695f818', 3, 'Nizamabad');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6720d9c0-690a-4b14-ab4d-df57c695f818', '4fb8ae12-ed12-4987-a7d7-85917c397761', 'Hyderabad hosts several major DRDO facilities, including missile and defence research complexes.', 'General Studies — authored from TSPSC Group I''s own published Prelims syllabus (Telangana history/movement/culture, Indian polity, economy, geography, science & technology, current affairs); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8a8c45e7-260f-4afd-bf20-34165f404671', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 8, 'The Golconda Fort, a major historical fortification near Hyderabad, was the capital of which dynasty before the Mughal conquest?', 'General Studies', 'Telangana History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e6055e5-5e68-42cc-801b-308c4a028a33', '8a8c45e7-260f-4afd-bf20-34165f404671', 0, 'Qutb Shahi dynasty');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7777708-025a-4ee4-96c2-44fbf4ac3a86', '8a8c45e7-260f-4afd-bf20-34165f404671', 1, 'Nizam Shahi dynasty');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e521103d-c36a-4f58-8e20-b4a9a4786b9d', '8a8c45e7-260f-4afd-bf20-34165f404671', 2, 'Bahmani Sultanate exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25286527-eea0-4fac-96a1-ffdbfed437b4', '8a8c45e7-260f-4afd-bf20-34165f404671', 3, 'Vijayanagara Empire');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8a8c45e7-260f-4afd-bf20-34165f404671', '5e6055e5-5e68-42cc-801b-308c4a028a33', 'Golconda Fort served as the capital of the Qutb Shahi dynasty until the Mughal conquest in 1687.', 'General Studies — authored from TSPSC Group I''s own published Prelims syllabus (Telangana history/movement/culture, Indian polity, economy, geography, science & technology, current affairs); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9d4f1047-273d-4a48-9793-388fe887c18c', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 9, 'The Right to Education (Article 21A), making free and compulsory education a fundamental right for children aged 6-14, was added by which amendment?', 'General Studies', 'Indian Polity — Fundamental Rights', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bf7e421-dc0f-4b6f-9b18-6e69d1b44558', '9d4f1047-273d-4a48-9793-388fe887c18c', 0, '42nd Amendment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1639eda2-648e-462d-b321-7263aaf9508c', '9d4f1047-273d-4a48-9793-388fe887c18c', 1, '86th Amendment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a008d5b0-261a-488e-8234-99cea740454b', '9d4f1047-273d-4a48-9793-388fe887c18c', 2, '93rd Amendment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35927042-4a00-4489-89c7-b8a2941ef4e5', '9d4f1047-273d-4a48-9793-388fe887c18c', 3, '44th Amendment');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9d4f1047-273d-4a48-9793-388fe887c18c', '1639eda2-648e-462d-b321-7263aaf9508c', 'The 86th Constitutional Amendment (2002) inserted Article 21A, making education a fundamental right for children aged 6-14.', 'General Studies — authored from TSPSC Group I''s own published Prelims syllabus (Telangana history/movement/culture, Indian polity, economy, geography, science & technology, current affairs); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('eb8137ce-9c94-4f27-8b94-64b289e999bf', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 10, 'The Rythu Bandhu scheme (and its successor schemes), providing direct investment support to farmers, was a flagship initiative associated with which state?', 'General Studies', 'Current Affairs — Schemes', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff1b7019-7da0-44b1-8b18-78f76877c9bd', 'eb8137ce-9c94-4f27-8b94-64b289e999bf', 0, 'Andhra Pradesh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('566750de-1b2f-435b-958d-a6fd663618d6', 'eb8137ce-9c94-4f27-8b94-64b289e999bf', 1, 'Telangana');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38a85a0f-988c-4fc7-a59b-fc42ea61c667', 'eb8137ce-9c94-4f27-8b94-64b289e999bf', 2, 'Karnataka');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('518256eb-5d54-4f50-89c5-90228f01bee1', 'eb8137ce-9c94-4f27-8b94-64b289e999bf', 3, 'Tamil Nadu');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('eb8137ce-9c94-4f27-8b94-64b289e999bf', '566750de-1b2f-435b-958d-a6fd663618d6', 'Rythu Bandhu was Telangana''s flagship farmer investment-support scheme, providing direct per-acre cash assistance.', 'General Studies — authored from TSPSC Group I''s own published Prelims syllabus (Telangana history/movement/culture, Indian polity, economy, geography, science & technology, current affairs); not copied from any official TSPSC question paper.');

-- ── Section: Mental Ability (10 questions) — Mental Ability — authored from TSPSC's own published Prelims mental-ability syllabus (logical reasoning, data interpretation, basic numeracy); not copied from any official TSPSC question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('019456a0-3fc1-43d0-b801-a48a3b040d3c', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 11, 'If ''PAPER'' is coded as ''QBQFS'' (each letter shifted forward by 1), how is ''PENCIL'' coded?', 'Mental Ability', 'Logical Reasoning', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a39c95d9-94da-47ab-abef-066cf495fbe5', '019456a0-3fc1-43d0-b801-a48a3b040d3c', 0, 'QFODJM');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b003d72-59dd-4cd4-9310-58cfa8541dd7', '019456a0-3fc1-43d0-b801-a48a3b040d3c', 1, 'QEODJM');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58816c89-32e2-4e88-961b-7aeb3225dfe4', '019456a0-3fc1-43d0-b801-a48a3b040d3c', 2, 'QFOCJM');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98d077b8-956b-4f6b-a2f1-1fd6437b27a3', '019456a0-3fc1-43d0-b801-a48a3b040d3c', 3, 'PFODJM');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('019456a0-3fc1-43d0-b801-a48a3b040d3c', 'a39c95d9-94da-47ab-abef-066cf495fbe5', 'Shifting each letter forward by 1: P→Q, E→F, N→O, C→D, I→J, L→M, giving QFODJM.', 'Mental Ability — authored from TSPSC''s own published Prelims mental-ability syllabus (logical reasoning, data interpretation, basic numeracy); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7b89f75e-3053-45c6-af5a-074048b64ae5', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 12, 'Find the next term: 6, 13, 27, 55, 111, ?', 'Mental Ability', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a86adfe8-79cf-4dfa-a7a7-cb6b672a668a', '7b89f75e-3053-45c6-af5a-074048b64ae5', 0, '220');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4cd9010-2699-48c1-8239-40e8bcd7495f', '7b89f75e-3053-45c6-af5a-074048b64ae5', 1, '221');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b4c4c26-80cd-41fd-b09d-70cb4d98a807', '7b89f75e-3053-45c6-af5a-074048b64ae5', 2, '222');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0592e29d-a025-4b7e-8d73-b738ba12ae4b', '7b89f75e-3053-45c6-af5a-074048b64ae5', 3, '223');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7b89f75e-3053-45c6-af5a-074048b64ae5', '0592e29d-a025-4b7e-8d73-b738ba12ae4b', 'Each term roughly doubles and adds 1 (6×2+1=13, 13×2+1=27, 27×2+1=55, 55×2+1=111); next is 111×2+1=223.', 'Mental Ability — authored from TSPSC''s own published Prelims mental-ability syllabus (logical reasoning, data interpretation, basic numeracy); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('73aa45f1-9dcb-4473-9cc1-f245f9221a5a', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 13, 'A worker earns ₹450 for 6 hours of work. What is the hourly rate?', 'Mental Ability', 'Basic Numeracy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be105a3e-a6c7-4667-8efc-889d4e08e885', '73aa45f1-9dcb-4473-9cc1-f245f9221a5a', 0, '₹65');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ca8d946-9018-448c-9188-238bbf647945', '73aa45f1-9dcb-4473-9cc1-f245f9221a5a', 1, '₹70');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9ead3c7-1e2f-40ec-b836-c38e86d853c0', '73aa45f1-9dcb-4473-9cc1-f245f9221a5a', 2, '₹75');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b91b2ea5-e240-49c8-9e1e-b3254494e39b', '73aa45f1-9dcb-4473-9cc1-f245f9221a5a', 3, '₹80');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('73aa45f1-9dcb-4473-9cc1-f245f9221a5a', 'f9ead3c7-1e2f-40ec-b836-c38e86d853c0', 'Hourly rate = 450/6 = ₹75.', 'Mental Ability — authored from TSPSC''s own published Prelims mental-ability syllabus (logical reasoning, data interpretation, basic numeracy); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ee80c541-695d-4139-8fb7-377a02eeb7b3', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 14, 'If a survey shows 40% of 250 respondents prefer option A, how many respondents is that?', 'Mental Ability', 'Data Interpretation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6dff0036-2dc3-49ac-87fe-ef774ac08aba', 'ee80c541-695d-4139-8fb7-377a02eeb7b3', 0, '90');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e571504-ba92-4445-ad27-d7146fc713e8', 'ee80c541-695d-4139-8fb7-377a02eeb7b3', 1, '95');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc761920-5f19-454c-924d-601f5bde8da0', 'ee80c541-695d-4139-8fb7-377a02eeb7b3', 2, '100');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0415829d-0c79-4e22-bce1-637848715252', 'ee80c541-695d-4139-8fb7-377a02eeb7b3', 3, '105');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ee80c541-695d-4139-8fb7-377a02eeb7b3', 'dc761920-5f19-454c-924d-601f5bde8da0', '40% of 250 = 100 respondents.', 'Mental Ability — authored from TSPSC''s own published Prelims mental-ability syllabus (logical reasoning, data interpretation, basic numeracy); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0d490481-ddda-4927-bc20-b48e73560644', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 15, 'If P is Q''s mother and R is P''s father, how is R related to Q?', 'Mental Ability', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58971eb6-d9a9-4757-8710-1efdc8bbe117', '0d490481-ddda-4927-bc20-b48e73560644', 0, 'Father');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7bac2e7c-8f9e-4193-a4e6-4f373421bf9c', '0d490481-ddda-4927-bc20-b48e73560644', 1, 'Grandfather');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c412806c-928f-4e99-9053-042ca804b7c3', '0d490481-ddda-4927-bc20-b48e73560644', 2, 'Uncle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6cf9db1d-c011-430e-96c9-a719b4723ee3', '0d490481-ddda-4927-bc20-b48e73560644', 3, 'Brother');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0d490481-ddda-4927-bc20-b48e73560644', '7bac2e7c-8f9e-4193-a4e6-4f373421bf9c', 'R is P''s father, and P is Q''s mother — so R is Q''s maternal grandfather.', 'Mental Ability — authored from TSPSC''s own published Prelims mental-ability syllabus (logical reasoning, data interpretation, basic numeracy); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4b92f34b-a30e-4e39-83b6-5ac2df94a20c', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 16, 'A person walks 8km north, then 6km east. What is the shortest distance from the starting point?', 'Mental Ability', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68ec6978-48ba-4eba-9be1-6d94e5b580e7', '4b92f34b-a30e-4e39-83b6-5ac2df94a20c', 0, '8km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b1eefe0-2e88-45fc-a370-0c2010707290', '4b92f34b-a30e-4e39-83b6-5ac2df94a20c', 1, '10km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e2c0df5-b092-4f4b-af25-686532206dc7', '4b92f34b-a30e-4e39-83b6-5ac2df94a20c', 2, '12km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6534b37-2c35-4b70-8d8a-aebb87c4838d', '4b92f34b-a30e-4e39-83b6-5ac2df94a20c', 3, '14km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4b92f34b-a30e-4e39-83b6-5ac2df94a20c', '1b1eefe0-2e88-45fc-a370-0c2010707290', 'Right triangle with legs 8 and 6; distance = sqrt(8²+6²) = sqrt(100) = 10km.', 'Mental Ability — authored from TSPSC''s own published Prelims mental-ability syllabus (logical reasoning, data interpretation, basic numeracy); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('54ab955d-b4ba-47da-b233-35d14cbda5be', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 17, 'In a class of 35, Meera ranks 9th from the top. What is her rank from the bottom?', 'Mental Ability', 'Ranking', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('286d3785-d18b-434c-94f1-4905653aeb44', '54ab955d-b4ba-47da-b233-35d14cbda5be', 0, '26');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94494fda-7dc0-459e-8983-8114a55471e6', '54ab955d-b4ba-47da-b233-35d14cbda5be', 1, '27');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c47ee5fe-7fb2-4daa-9379-d5a9060a7f04', '54ab955d-b4ba-47da-b233-35d14cbda5be', 2, '28');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfdacb74-eb06-40bf-8a10-50dafaf78da8', '54ab955d-b4ba-47da-b233-35d14cbda5be', 3, '29');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('54ab955d-b4ba-47da-b233-35d14cbda5be', '94494fda-7dc0-459e-8983-8114a55471e6', 'Rank from bottom = total - rank from top + 1 = 35-9+1 = 27.', 'Mental Ability — authored from TSPSC''s own published Prelims mental-ability syllabus (logical reasoning, data interpretation, basic numeracy); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('05cfe5a1-f614-46af-b882-66e3fa1f0684', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 18, 'Statements: All rivers are water bodies. Some water bodies are lakes. Conclusion: Some rivers are lakes. Is this valid?', 'Mental Ability', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a8fa719-8ee1-42a9-899f-b5cbb22a9bb8', '05cfe5a1-f614-46af-b882-66e3fa1f0684', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0a99594-b920-4e7d-aa44-afe44fdd848d', '05cfe5a1-f614-46af-b882-66e3fa1f0684', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('026465ac-2b5a-4e97-8236-dc2e53f7b5a4', '05cfe5a1-f614-46af-b882-66e3fa1f0684', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c7bb2f1-9b12-415b-b95a-b72156a98567', '05cfe5a1-f614-46af-b882-66e3fa1f0684', 3, 'Partially valid');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('05cfe5a1-f614-46af-b882-66e3fa1f0684', 'b0a99594-b920-4e7d-aa44-afe44fdd848d', 'The premises don''t establish that rivers specifically overlap with the lake subset of water bodies — the conclusion doesn''t necessarily follow.', 'Mental Ability — authored from TSPSC''s own published Prelims mental-ability syllabus (logical reasoning, data interpretation, basic numeracy); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('00406a02-bf16-4f15-b234-4b2c9f43f366', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 19, 'If a number is decreased by 15% to give 340, what was the original number?', 'Mental Ability', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac50aeef-6c5e-4d00-b7ee-f3c3b364f20b', '00406a02-bf16-4f15-b234-4b2c9f43f366', 0, '390');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f1d287e-e38e-4f1a-aacb-de91b677d611', '00406a02-bf16-4f15-b234-4b2c9f43f366', 1, '400');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8fd47d1e-8b38-4d2a-8a9b-6449274ae4b3', '00406a02-bf16-4f15-b234-4b2c9f43f366', 2, '410');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbdbbf6e-248d-4f16-b45c-5e0e78a532bd', '00406a02-bf16-4f15-b234-4b2c9f43f366', 3, '420');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('00406a02-bf16-4f15-b234-4b2c9f43f366', '7f1d287e-e38e-4f1a-aacb-de91b677d611', 'Original × 0.85 = 340; original = 340/0.85 = 400.', 'Mental Ability — authored from TSPSC''s own published Prelims mental-ability syllabus (logical reasoning, data interpretation, basic numeracy); not copied from any official TSPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c90e90ed-46d5-4d1d-a110-14d5cd58b953', '6a94dc72-0593-42c6-9b30-cbdbb0db6e57', 20, 'The average of 4 numbers is 18. If a 5th number, 28, is added, what is the new average?', 'Mental Ability', 'Average', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08b33eb2-6745-4600-873f-63e1ec30971d', 'c90e90ed-46d5-4d1d-a110-14d5cd58b953', 0, '19');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59d642fd-84b6-4bdc-b3bf-96e4c1aa2c69', 'c90e90ed-46d5-4d1d-a110-14d5cd58b953', 1, '20');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46c553f9-f10e-4bd7-8606-13d145226e26', 'c90e90ed-46d5-4d1d-a110-14d5cd58b953', 2, '21');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c2bd7d0-6d7b-419c-a8ac-e08f9de9c589', 'c90e90ed-46d5-4d1d-a110-14d5cd58b953', 3, '22');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c90e90ed-46d5-4d1d-a110-14d5cd58b953', '59d642fd-84b6-4bdc-b3bf-96e4c1aa2c69', 'Total of 4 numbers = 72; new total = 72+28=100; new average = 100/5=20.', 'Mental Ability — authored from TSPSC''s own published Prelims mental-ability syllabus (logical reasoning, data interpretation, basic numeracy); not copied from any official TSPSC question paper.');
