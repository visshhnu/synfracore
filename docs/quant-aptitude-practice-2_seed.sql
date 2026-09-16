-- ============================================================
-- Quantitative Aptitude — Practice Paper 2
-- Full-Length Practice Paper (20 questions, 15 minutes)
-- Marking: +1 correct / -0.25 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 'quant-aptitude-practice-2', 'Quantitative Aptitude Practice Paper 2', 'quant-aptitude', ARRAY['Quantitative Aptitude', 'Banking', 'SSC', 'Railways', 'State PSC']::TEXT[], 20, 'standard', true, 2, 15, 1, 0.25);

-- ── Section: Quantitative Aptitude (20 questions) — Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam's specific paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4620e2e8-a9e8-439e-9e6d-c202a719e201', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 1, 'Find the LCM of 15 and 20.', 'Quantitative Aptitude', 'Number System', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48214778-d35c-42ef-8b17-cc005a79ece7', '4620e2e8-a9e8-439e-9e6d-c202a719e201', 0, '60');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9a6d277-d2f7-4200-9db4-c88de9229650', '4620e2e8-a9e8-439e-9e6d-c202a719e201', 1, '30');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2fa7646-377e-4738-8cf0-1b0b97188163', '4620e2e8-a9e8-439e-9e6d-c202a719e201', 2, '45');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('712059a5-a907-4f84-98f2-2e04d01aaa7a', '4620e2e8-a9e8-439e-9e6d-c202a719e201', 3, '75');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4620e2e8-a9e8-439e-9e6d-c202a719e201', '48214778-d35c-42ef-8b17-cc005a79ece7', '15=3x5, 20=2^2x5; LCM = 2^2x3x5 = 60.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c08253d3-4ec5-400a-b09b-0ed6bd7be151', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 2, 'Simplify: 18^2 - 12^2.', 'Quantitative Aptitude', 'Simplification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0228301-7e60-43fb-85bf-49b9cece87e8', 'c08253d3-4ec5-400a-b09b-0ed6bd7be151', 0, '180');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b61d8964-f24d-4f53-be1e-96bdcd7c4ddc', 'c08253d3-4ec5-400a-b09b-0ed6bd7be151', 1, '216');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1294b1cb-d78f-40f8-92ab-1be8129ed0af', 'c08253d3-4ec5-400a-b09b-0ed6bd7be151', 2, '144');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ece2597-1e0b-436b-8483-2ae0103e3114', 'c08253d3-4ec5-400a-b09b-0ed6bd7be151', 3, '196');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c08253d3-4ec5-400a-b09b-0ed6bd7be151', 'd0228301-7e60-43fb-85bf-49b9cece87e8', '(18-12)(18+12) = 6x30 = 180.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('963b43f2-49a8-47e0-b23f-59567c5a7598', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 3, 'A number decreased by 20% gives 160. Find the original number.', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3740e30b-57c8-45ba-9dac-655cae31161d', '963b43f2-49a8-47e0-b23f-59567c5a7598', 0, '200');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90def0fd-5df2-4b6d-9926-6a08c350fc94', '963b43f2-49a8-47e0-b23f-59567c5a7598', 1, '192');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aae1e0db-bb21-4637-92c6-b19c9c3c0884', '963b43f2-49a8-47e0-b23f-59567c5a7598', 2, '180');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87587e87-6204-4853-a1b4-b03a5414b821', '963b43f2-49a8-47e0-b23f-59567c5a7598', 3, '210');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('963b43f2-49a8-47e0-b23f-59567c5a7598', '3740e30b-57c8-45ba-9dac-655cae31161d', 'Original = 160/0.8 = 200.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9bffb4dd-29a8-4318-a4b2-4e8837d34e5e', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 4, 'Cost price is Rs. 1200 and loss is 15%. Find the selling price.', 'Quantitative Aptitude', 'Profit & Loss', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f52d6cc0-a484-4db2-a1e6-a043b09abc55', '9bffb4dd-29a8-4318-a4b2-4e8837d34e5e', 0, 'Rs. 1020');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4eb9d79-38d7-4455-b65b-0adb53f1170c', '9bffb4dd-29a8-4318-a4b2-4e8837d34e5e', 1, 'Rs. 1080');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f738b74-ffa7-441e-83b7-98965cc0b28d', '9bffb4dd-29a8-4318-a4b2-4e8837d34e5e', 2, 'Rs. 1000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f93f9697-c982-4af6-949e-832f237787fa', '9bffb4dd-29a8-4318-a4b2-4e8837d34e5e', 3, 'Rs. 1050');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9bffb4dd-29a8-4318-a4b2-4e8837d34e5e', 'f52d6cc0-a484-4db2-a1e6-a043b09abc55', 'SP = 1200x0.85 = 1020.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('07d1ee3b-10f0-43f3-a6c3-69216062c586', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 5, 'Find the principal that yields SI of Rs. 900 in 3 years at 6% p.a.', 'Quantitative Aptitude', 'Simple Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3be198d0-89e6-48d3-ba43-8af71561ee3e', '07d1ee3b-10f0-43f3-a6c3-69216062c586', 0, 'Rs. 5000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('214c54ab-c067-4989-8d05-04ad7a11913e', '07d1ee3b-10f0-43f3-a6c3-69216062c586', 1, 'Rs. 4500');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f195c14e-4533-40dd-8693-2d306e36adc9', '07d1ee3b-10f0-43f3-a6c3-69216062c586', 2, 'Rs. 5500');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0fe5fac-d4c9-4ccd-9c29-bbcf2592bb56', '07d1ee3b-10f0-43f3-a6c3-69216062c586', 3, 'Rs. 4000');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('07d1ee3b-10f0-43f3-a6c3-69216062c586', '3be198d0-89e6-48d3-ba43-8af71561ee3e', 'P = SIx100/(RxT) = 900x100/18 = 5000.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ffcf510d-d2ad-4037-b35b-8f47235c988e', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 6, 'Find the compound interest on Rs. 3000 for 2 years at 5% p.a.', 'Quantitative Aptitude', 'Compound Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82100009-0792-4087-b743-61d423c86d1d', 'ffcf510d-d2ad-4037-b35b-8f47235c988e', 0, 'Rs. 307.50');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c8b58e2-cf2a-48e6-b177-78f4ce75a46d', 'ffcf510d-d2ad-4037-b35b-8f47235c988e', 1, 'Rs. 300');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c65fe72-0c9f-48a7-a9b1-ee80f6c81bbc', 'ffcf510d-d2ad-4037-b35b-8f47235c988e', 2, 'Rs. 315');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d33d4c2-ea13-4159-b33e-335bb4a13825', 'ffcf510d-d2ad-4037-b35b-8f47235c988e', 3, 'Rs. 320');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ffcf510d-d2ad-4037-b35b-8f47235c988e', '82100009-0792-4087-b743-61d423c86d1d', 'Amount = 3000x1.05^2 = 3307.50; CI = 307.50.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('57cd8b38-8f40-40e5-a1b0-84b751e54acb', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 7, 'A alone can finish a work in 12 days, B alone in 18 days. In how many days will both finish it together?', 'Quantitative Aptitude', 'Time & Work', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5833a0d0-a415-48d4-b8bb-3375cda84cfa', '57cd8b38-8f40-40e5-a1b0-84b751e54acb', 0, '7.2 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ac70897-c7eb-40e3-971f-59aa83146fa7', '57cd8b38-8f40-40e5-a1b0-84b751e54acb', 1, '8 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0358e53d-5760-4515-bece-ae234df0d9c4', '57cd8b38-8f40-40e5-a1b0-84b751e54acb', 2, '7.5 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8569bbff-f997-4796-b05b-e5ea1ed94d02', '57cd8b38-8f40-40e5-a1b0-84b751e54acb', 3, '6.5 days');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('57cd8b38-8f40-40e5-a1b0-84b751e54acb', '5833a0d0-a415-48d4-b8bb-3375cda84cfa', 'Combined rate = 1/12+1/18 = 5/36; time = 36/5 = 7.2 days.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('23ae50c6-2728-4dc7-8d69-240f2fd1018a', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 8, 'A man walks at 5 km/h and covers a distance in 3 hours. Find the distance.', 'Quantitative Aptitude', 'Time, Speed & Distance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15e22dc5-23f8-4d53-9633-fcadb03c2f11', '23ae50c6-2728-4dc7-8d69-240f2fd1018a', 0, '15 km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5079ec53-c04b-466a-8b16-c65e628a31cc', '23ae50c6-2728-4dc7-8d69-240f2fd1018a', 1, '12 km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49435a78-f0f3-40bb-9a6f-6aab5bb8aa56', '23ae50c6-2728-4dc7-8d69-240f2fd1018a', 2, '18 km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45347c30-8944-4e35-b929-f4d64456ceeb', '23ae50c6-2728-4dc7-8d69-240f2fd1018a', 3, '20 km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('23ae50c6-2728-4dc7-8d69-240f2fd1018a', '15e22dc5-23f8-4d53-9633-fcadb03c2f11', 'Distance = 5x3 = 15 km.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bb0f8421-a383-4be5-b0a5-b595dfd34f0d', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 9, 'The average weight of 4 people is 65 kg. A fifth person weighing 75 kg joins. Find the new average.', 'Quantitative Aptitude', 'Averages', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30f82f8a-aa79-4c64-86d5-c7b0c349d5ae', 'bb0f8421-a383-4be5-b0a5-b595dfd34f0d', 0, '67 kg');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d15210de-0048-42c2-89dd-b64526bb8145', 'bb0f8421-a383-4be5-b0a5-b595dfd34f0d', 1, '68 kg');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8df85a2a-9aad-43b6-9a0c-a2fa0dbd6495', 'bb0f8421-a383-4be5-b0a5-b595dfd34f0d', 2, '66 kg');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec951a0b-e607-40fc-9a89-5f75c7031988', 'bb0f8421-a383-4be5-b0a5-b595dfd34f0d', 3, '70 kg');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bb0f8421-a383-4be5-b0a5-b595dfd34f0d', '30f82f8a-aa79-4c64-86d5-c7b0c349d5ae', 'Total4=260, +75=335; new average = 335/5 = 67 kg.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3b3c1375-d7f7-4d74-910b-62d89bfa4947', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 10, 'The ratio of two numbers is 5:7 and their sum is 96. Find the smaller number.', 'Quantitative Aptitude', 'Ratio & Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('29315cb7-fcf7-438c-ace1-cadc812465ce', '3b3c1375-d7f7-4d74-910b-62d89bfa4947', 0, '40');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6771f4f8-ae7f-4a30-b7b8-b7e9dda16733', '3b3c1375-d7f7-4d74-910b-62d89bfa4947', 1, '45');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d1464cf-b314-403d-a576-337d8fc1e2b5', '3b3c1375-d7f7-4d74-910b-62d89bfa4947', 2, '35');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92f9fc17-1950-4b29-913f-354e49bfc3ef', '3b3c1375-d7f7-4d74-910b-62d89bfa4947', 3, '48');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3b3c1375-d7f7-4d74-910b-62d89bfa4947', '29315cb7-fcf7-438c-ace1-cadc812465ce', '12 parts = 96, each part = 8; smaller = 5x8 = 40.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c52bd0d1-2daf-4d24-a2d3-a70383210d00', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 11, 'Find the missing term: 5, 10, 20, 40, ?', 'Quantitative Aptitude', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1a8b99c-82f6-4ebd-a0f1-65b1a794c599', 'c52bd0d1-2daf-4d24-a2d3-a70383210d00', 0, '80');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('362d8baf-75a2-4627-8e27-26f9a7592190', 'c52bd0d1-2daf-4d24-a2d3-a70383210d00', 1, '70');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e29791cb-7abf-4071-9620-9311247ab229', 'c52bd0d1-2daf-4d24-a2d3-a70383210d00', 2, '75');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab14118d-a14a-48ff-831e-c8a8a8ccd314', 'c52bd0d1-2daf-4d24-a2d3-a70383210d00', 3, '60');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c52bd0d1-2daf-4d24-a2d3-a70383210d00', 'd1a8b99c-82f6-4ebd-a0f1-65b1a794c599', 'Each term doubles the previous: 40x2 = 80.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('283880fd-c394-48ac-9ea9-95b99ffc586a', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 12, 'In a class, 40% of 50 students play cricket. Find the number playing cricket.', 'Quantitative Aptitude', 'Data Interpretation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16c807c0-0e87-4ff8-b5a0-60534d2f7d49', '283880fd-c394-48ac-9ea9-95b99ffc586a', 0, '20');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9610b66c-568c-4bce-9f2b-4918863cd0dd', '283880fd-c394-48ac-9ea9-95b99ffc586a', 1, '15');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8dd78fe4-482c-4cd4-b284-5997ef2545c3', '283880fd-c394-48ac-9ea9-95b99ffc586a', 2, '25');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5198cb3-2c72-4600-8c81-0e37c39640cc', '283880fd-c394-48ac-9ea9-95b99ffc586a', 3, '18');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('283880fd-c394-48ac-9ea9-95b99ffc586a', '16c807c0-0e87-4ff8-b5a0-60534d2f7d49', '40% of 50 = 20.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2525aa8f-c174-445a-9e66-943f519c163b', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 13, 'The sum of two consecutive even numbers is 74. Find the larger number.', 'Quantitative Aptitude', 'Number System', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1f49b36-384d-43d7-9222-452782434b69', '2525aa8f-c174-445a-9e66-943f519c163b', 0, '38');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa689ede-4a6a-47ad-b7ee-5771d38329f4', '2525aa8f-c174-445a-9e66-943f519c163b', 1, '36');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7de2a7d1-271d-42f6-b17b-9c8a1b516d80', '2525aa8f-c174-445a-9e66-943f519c163b', 2, '40');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9900f49-1452-4388-87de-23672c7603cc', '2525aa8f-c174-445a-9e66-943f519c163b', 3, '42');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2525aa8f-c174-445a-9e66-943f519c163b', 'b1f49b36-384d-43d7-9222-452782434b69', 'x+(x+2)=74; x=36; larger = 38.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8fa700ff-ae8a-4fbc-8d60-6c5f3104bd14', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 14, 'In an election, a candidate got 60% of votes and won by 4000 votes. Find the total votes.', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6014d416-ab70-4c15-9ad4-6888052a597f', '8fa700ff-ae8a-4fbc-8d60-6c5f3104bd14', 0, '20000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef4fc8dd-07a8-4b41-b3c4-7f73756049ee', '8fa700ff-ae8a-4fbc-8d60-6c5f3104bd14', 1, '18000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1c8702a-f883-4912-bb31-24c64d06cbe0', '8fa700ff-ae8a-4fbc-8d60-6c5f3104bd14', 2, '22000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('545960bf-3f82-47e7-9471-1269085bc000', '8fa700ff-ae8a-4fbc-8d60-6c5f3104bd14', 3, '24000');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8fa700ff-ae8a-4fbc-8d60-6c5f3104bd14', '6014d416-ab70-4c15-9ad4-6888052a597f', 'Winning margin = 20% of total = 4000; total = 20000.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c325e596-a110-4357-aa40-3bba6777743e', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 15, 'A trader marks goods 20% above cost price and gives a 10% discount. Find his profit percentage.', 'Quantitative Aptitude', 'Profit & Loss', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f2d8b64-ee57-4157-8dea-ee9f622e5e10', 'c325e596-a110-4357-aa40-3bba6777743e', 0, '8%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('061c5c48-7f54-471c-940c-c2e7b64ce28c', 'c325e596-a110-4357-aa40-3bba6777743e', 1, '10%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00d4a3af-cddb-472c-a68c-d79751026eea', 'c325e596-a110-4357-aa40-3bba6777743e', 2, '12%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a73e043-9613-4a01-9a50-13cd44bc2685', 'c325e596-a110-4357-aa40-3bba6777743e', 3, '6%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c325e596-a110-4357-aa40-3bba6777743e', '1f2d8b64-ee57-4157-8dea-ee9f622e5e10', 'CP=100, MP=120, SP=120x0.9=108; profit = 8%.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('749a64ae-f753-4a14-b562-b97c51e519e6', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 16, 'The difference between CI and SI on a sum for 2 years at 10% p.a. is Rs. 50. Find the sum.', 'Quantitative Aptitude', 'Simple/Compound Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fca237bf-5dab-42ce-aed7-b99ed1eb8933', '749a64ae-f753-4a14-b562-b97c51e519e6', 0, 'Rs. 5000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a617fee2-0c1a-4be9-836e-8c6b237fca31', '749a64ae-f753-4a14-b562-b97c51e519e6', 1, 'Rs. 4500');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9753e6b3-6174-4a40-8c08-8086b799f005', '749a64ae-f753-4a14-b562-b97c51e519e6', 2, 'Rs. 5500');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d1e9e62-f0f8-4258-9483-83c00a2f8957', '749a64ae-f753-4a14-b562-b97c51e519e6', 3, 'Rs. 6000');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('749a64ae-f753-4a14-b562-b97c51e519e6', 'fca237bf-5dab-42ce-aed7-b99ed1eb8933', 'For 2 years, CI-SI = P(r/100)^2; 50 = Px0.01; P = 5000.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('14396453-6191-492b-8e65-2598a0a03b4a', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 17, 'Find the average of the first 10 odd numbers.', 'Quantitative Aptitude', 'Averages', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d370313-89d5-4622-9c4e-a6e9ba4a257e', '14396453-6191-492b-8e65-2598a0a03b4a', 0, '10');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ef7779e-91a6-47ab-be6a-dcf73d82ca49', '14396453-6191-492b-8e65-2598a0a03b4a', 1, '9');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b06264b3-5dbb-4729-a2ce-4bf41e0709f5', '14396453-6191-492b-8e65-2598a0a03b4a', 2, '11');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2b5659c-5e0d-4bea-a4d5-20d4090a8870', '14396453-6191-492b-8e65-2598a0a03b4a', 3, '12');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('14396453-6191-492b-8e65-2598a0a03b4a', '8d370313-89d5-4622-9c4e-a6e9ba4a257e', 'Sum of first n odd numbers = n^2 = 100; average = 100/10 = 10.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('17c2c60a-b297-4261-878e-e03029fcab19', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 18, 'If x:y = 3:4, find (2x+3y):(3x+2y).', 'Quantitative Aptitude', 'Ratio & Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9fcf8b6-9b33-424b-8466-49ae2a62cbbc', '17c2c60a-b297-4261-878e-e03029fcab19', 0, '18:17');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbaba303-3a9f-4d53-8b08-7e0b5155e2d3', '17c2c60a-b297-4261-878e-e03029fcab19', 1, '17:18');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97a71db6-b45f-4d41-b027-0820eca831c5', '17c2c60a-b297-4261-878e-e03029fcab19', 2, '3:4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95b392ce-7412-4f48-937b-b49f087306bd', '17c2c60a-b297-4261-878e-e03029fcab19', 3, '4:3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('17c2c60a-b297-4261-878e-e03029fcab19', 'b9fcf8b6-9b33-424b-8466-49ae2a62cbbc', 'Let x=3,y=4: 2x+3y=18; 3x+2y=17; ratio = 18:17.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('16ccc329-f3ea-428c-ac55-53e4d9dcbd69', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 19, '12 men can complete a job in 8 days. How many days will 16 men take?', 'Quantitative Aptitude', 'Time & Work', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb9badc4-92b0-40e1-ad3f-48fc4afb5544', '16ccc329-f3ea-428c-ac55-53e4d9dcbd69', 0, '6 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac2a5436-7a64-41a9-a967-ca1b7d89d4f9', '16ccc329-f3ea-428c-ac55-53e4d9dcbd69', 1, '8 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6fe8f7e3-fcb2-44f9-a9d2-467e25533ef3', '16ccc329-f3ea-428c-ac55-53e4d9dcbd69', 2, '5 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8acd305-a574-4ed9-8cde-aace77a16fe4', '16ccc329-f3ea-428c-ac55-53e4d9dcbd69', 3, '7 days');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('16ccc329-f3ea-428c-ac55-53e4d9dcbd69', 'cb9badc4-92b0-40e1-ad3f-48fc4afb5544', 'Men x days = constant = 96; 96/16 = 6 days.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('857b5a79-4f17-4942-aa5d-d0a9dce73dcf', '4fdeb6f9-fc16-44eb-8c71-4cc7b09f0b18', 20, 'A boat goes 24 km upstream in 6 hours. Find the boat''s upstream speed.', 'Quantitative Aptitude', 'Time, Speed & Distance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d130f6f-4da3-41c8-aaa1-5e8aa0b5840b', '857b5a79-4f17-4942-aa5d-d0a9dce73dcf', 0, '4 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38c8aa74-efee-4034-bce9-75a64133b3dd', '857b5a79-4f17-4942-aa5d-d0a9dce73dcf', 1, '6 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('114e7436-6919-4a25-965e-cc34db4a9d8f', '857b5a79-4f17-4942-aa5d-d0a9dce73dcf', 2, '5 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e704dda-4ee3-4a2e-b9c9-f2adc886abb1', '857b5a79-4f17-4942-aa5d-d0a9dce73dcf', 3, '8 km/h');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('857b5a79-4f17-4942-aa5d-d0a9dce73dcf', '8d130f6f-4da3-41c8-aaa1-5e8aa0b5840b', 'Speed = 24/6 = 4 km/h.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');
