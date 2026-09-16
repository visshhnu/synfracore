-- ============================================================
-- Quantitative Aptitude — Practice Paper 5
-- Full-Length Practice Paper (20 questions, 15 minutes)
-- Marking: +1 correct / -0.25 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('07165c19-7194-4734-a612-c47968f9350a', 'quant-aptitude-practice-5', 'Quantitative Aptitude Practice Paper 5', 'quant-aptitude', ARRAY['Quantitative Aptitude', 'Banking', 'SSC', 'Railways', 'State PSC']::TEXT[], 20, 'standard', true, 5, 15, 1, 0.25);

-- ── Section: Quantitative Aptitude (20 questions) — Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam's specific paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('08c98049-2efa-441a-8306-4ca3571428b7', '07165c19-7194-4734-a612-c47968f9350a', 1, 'Find the remainder when 2^50 is divided by 7.', 'Quantitative Aptitude', 'Number System', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3bbe69e0-90b3-4d22-ad58-c3201738affb', '08c98049-2efa-441a-8306-4ca3571428b7', 0, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c36db7f4-00a3-4cfd-95f1-9e9ab852802b', '08c98049-2efa-441a-8306-4ca3571428b7', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7d1fb9f-aa7c-434f-8a17-cc6715e3add2', '08c98049-2efa-441a-8306-4ca3571428b7', 2, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('036d2e79-1231-4163-a264-85762f9ca8a1', '08c98049-2efa-441a-8306-4ca3571428b7', 3, '6');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('08c98049-2efa-441a-8306-4ca3571428b7', '3bbe69e0-90b3-4d22-ad58-c3201738affb', 'Powers of 2 mod 7 cycle every 3 (2,4,1). 50 mod 3 = 2, giving remainder 4.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c77bbea3-8a45-4cdc-b343-fc56e648f19e', '07165c19-7194-4734-a612-c47968f9350a', 2, 'Simplify: (12x8) - (15x4) + 20.', 'Quantitative Aptitude', 'Simplification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da22a2f6-7d70-4476-8b86-3cd4d00c903d', 'c77bbea3-8a45-4cdc-b343-fc56e648f19e', 0, '56');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eba36871-81d7-4266-9b45-516124a1db72', 'c77bbea3-8a45-4cdc-b343-fc56e648f19e', 1, '60');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad0dcf63-e581-47e2-86d3-6e51a449813b', 'c77bbea3-8a45-4cdc-b343-fc56e648f19e', 2, '50');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('71361fe3-c9ef-4bad-8cc6-968e19c55bbc', 'c77bbea3-8a45-4cdc-b343-fc56e648f19e', 3, '64');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c77bbea3-8a45-4cdc-b343-fc56e648f19e', 'da22a2f6-7d70-4476-8b86-3cd4d00c903d', '96 - 60 + 20 = 56.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('98502698-7813-424d-b015-712ea670ddc4', '07165c19-7194-4734-a612-c47968f9350a', 3, 'A''s salary is 25% more than B''s. By what percent is B''s salary less than A''s?', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0982e6d2-e4e1-49a0-b470-897ecc737fc8', '98502698-7813-424d-b015-712ea670ddc4', 0, '20%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7f6553f-b9cc-40b6-a452-a331ff3c1498', '98502698-7813-424d-b015-712ea670ddc4', 1, '25%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbb82cfc-b2e5-4b5e-88b0-8498c9d44e66', '98502698-7813-424d-b015-712ea670ddc4', 2, '15%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a15aaa85-5bc5-4f95-9b2f-5e8391cdfb58', '98502698-7813-424d-b015-712ea670ddc4', 3, '22%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('98502698-7813-424d-b015-712ea670ddc4', '0982e6d2-e4e1-49a0-b470-897ecc737fc8', 'If B=100, A=125; B is less than A by 25/125 x 100 = 20%.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a876f970-81b4-490e-9d3d-651f214daaee', '07165c19-7194-4734-a612-c47968f9350a', 4, 'By selling an article for Rs. 720, a man loses 10%. Find the cost price.', 'Quantitative Aptitude', 'Profit & Loss', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3399b60a-e465-44ad-93c0-dacc24e8b4cd', 'a876f970-81b4-490e-9d3d-651f214daaee', 0, 'Rs. 800');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('289837a8-2bbd-4432-8f72-2b306e59d4d7', 'a876f970-81b4-490e-9d3d-651f214daaee', 1, 'Rs. 750');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('595e5f05-b8b7-4744-9579-3f6e995d8620', 'a876f970-81b4-490e-9d3d-651f214daaee', 2, 'Rs. 850');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e90bf1e4-eefa-4230-b8b1-287794998380', 'a876f970-81b4-490e-9d3d-651f214daaee', 3, 'Rs. 780');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a876f970-81b4-490e-9d3d-651f214daaee', '3399b60a-e465-44ad-93c0-dacc24e8b4cd', 'CP = 720/0.9 = 800.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('76f2580f-000b-4164-85a0-8fdb56201deb', '07165c19-7194-4734-a612-c47968f9350a', 5, 'A sum of Rs. 10000 amounts to Rs. 12100 in 2 years at compound interest. Find the rate percent per annum.', 'Quantitative Aptitude', 'Compound Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b2eee41-194f-4b01-88d4-32a0a947c9f9', '76f2580f-000b-4164-85a0-8fdb56201deb', 0, '10%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a41a1240-60d0-4ff3-bc7d-5000a2a18a2e', '76f2580f-000b-4164-85a0-8fdb56201deb', 1, '8%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b4f9794a-ce2e-4360-9ebb-5cb30c5758ba', '76f2580f-000b-4164-85a0-8fdb56201deb', 2, '12%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('387e83cf-4a23-4bcf-9176-174bccd49a53', '76f2580f-000b-4164-85a0-8fdb56201deb', 3, '9%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('76f2580f-000b-4164-85a0-8fdb56201deb', '2b2eee41-194f-4b01-88d4-32a0a947c9f9', '12100/10000 = 1.21 = (1+r)^2; 1+r = 1.1; r = 10%.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('00a93f56-a5e5-4df9-8c96-2a8f47ef32ae', '07165c19-7194-4734-a612-c47968f9350a', 6, 'The average of 3 numbers is 45. If one of the numbers is 55, find the average of the other two.', 'Quantitative Aptitude', 'Averages', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85632540-08c6-41ff-b9fa-468e34dafb4b', '00a93f56-a5e5-4df9-8c96-2a8f47ef32ae', 0, '40');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfe570e5-dfa5-4352-9379-94e0deb88ffc', '00a93f56-a5e5-4df9-8c96-2a8f47ef32ae', 1, '35');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63bc9d4d-da34-4d18-b47e-25c53a75f139', '00a93f56-a5e5-4df9-8c96-2a8f47ef32ae', 2, '45');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4828d7e5-ae47-47bf-86cf-a1638f63726e', '00a93f56-a5e5-4df9-8c96-2a8f47ef32ae', 3, '38');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('00a93f56-a5e5-4df9-8c96-2a8f47ef32ae', '85632540-08c6-41ff-b9fa-468e34dafb4b', 'Total3 = 135; remaining sum = 80; average = 40.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bfc4fd7c-ce7a-420d-8f4c-5191f6aafaaa', '07165c19-7194-4734-a612-c47968f9350a', 7, 'Two vessels contain milk and water in ratios 3:1 and 5:2 respectively. Which vessel has a higher proportion of milk?', 'Quantitative Aptitude', 'Ratio & Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('484b492a-c520-440d-8470-530b6b48aa02', 'bfc4fd7c-ce7a-420d-8f4c-5191f6aafaaa', 0, 'Vessel 1 (3:1)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4eb916da-8e94-4cc2-81c8-480b02cb8f62', 'bfc4fd7c-ce7a-420d-8f4c-5191f6aafaaa', 1, 'Vessel 2 (5:2)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9874eaa8-a6d8-4d51-a5de-32835262e874', 'bfc4fd7c-ce7a-420d-8f4c-5191f6aafaaa', 2, 'Both equal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef756620-6daa-4a6d-96a1-88d5d75fe073', 'bfc4fd7c-ce7a-420d-8f4c-5191f6aafaaa', 3, 'Cannot be determined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bfc4fd7c-ce7a-420d-8f4c-5191f6aafaaa', '484b492a-c520-440d-8470-530b6b48aa02', 'Vessel 1: 3/4 = 0.75; Vessel 2: 5/7 approx 0.714; Vessel 1 has the higher milk proportion.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('df3f7787-2716-49ae-8c9f-58aab993076d', '07165c19-7194-4734-a612-c47968f9350a', 8, 'A is twice as efficient as B. If B alone can complete a work in 24 days, find the time taken by A and B working together.', 'Quantitative Aptitude', 'Time & Work', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f2f5fa1-3f0e-4fea-93ac-37cb320d1c37', 'df3f7787-2716-49ae-8c9f-58aab993076d', 0, '8 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5c08909-2368-4637-a4bb-fa2715d3d4c3', 'df3f7787-2716-49ae-8c9f-58aab993076d', 1, '10 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92d78e09-dccc-4d52-ace2-657c82ea15b5', 'df3f7787-2716-49ae-8c9f-58aab993076d', 2, '6 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d3581fb-dc25-4048-a03d-61136a2147ad', 'df3f7787-2716-49ae-8c9f-58aab993076d', 3, '12 days');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('df3f7787-2716-49ae-8c9f-58aab993076d', '3f2f5fa1-3f0e-4fea-93ac-37cb320d1c37', 'A''s rate = 2/24 = 1/12; combined rate = 1/12+1/24 = 1/8; time = 8 days.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ee7a4dc4-cdf2-4489-92ea-f506df476bf0', '07165c19-7194-4734-a612-c47968f9350a', 9, 'A cyclist covers 15 km in 45 minutes. Find his speed in km/h.', 'Quantitative Aptitude', 'Time, Speed & Distance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a91a018-f5ef-4f58-97ed-82aae3461300', 'ee7a4dc4-cdf2-4489-92ea-f506df476bf0', 0, '20 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b418791e-cace-429d-8208-55621286d0a3', 'ee7a4dc4-cdf2-4489-92ea-f506df476bf0', 1, '18 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ffab3f30-5853-4997-b5c1-73b51dfde7cd', 'ee7a4dc4-cdf2-4489-92ea-f506df476bf0', 2, '22 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f0c6313-0add-477c-aab3-99ea229d02b0', 'ee7a4dc4-cdf2-4489-92ea-f506df476bf0', 3, '25 km/h');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ee7a4dc4-cdf2-4489-92ea-f506df476bf0', '6a91a018-f5ef-4f58-97ed-82aae3461300', 'Speed = 15/(45/60) = 15/0.75 = 20 km/h.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fdabf07c-84e3-4403-99ff-e475013795c3', '07165c19-7194-4734-a612-c47968f9350a', 10, 'A train 100m long crosses a pole in 5 seconds. Find its speed in km/h.', 'Quantitative Aptitude', 'Time, Speed & Distance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('823a6563-0481-4e13-932c-93f0b2acf60d', 'fdabf07c-84e3-4403-99ff-e475013795c3', 0, '72 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ca1fc9c-075e-427a-8566-8e6724abd7ca', 'fdabf07c-84e3-4403-99ff-e475013795c3', 1, '60 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e608b399-7eb8-41a0-9160-8ef832f39cab', 'fdabf07c-84e3-4403-99ff-e475013795c3', 2, '80 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3254247b-9df9-4709-a4c2-ade07d6e4369', 'fdabf07c-84e3-4403-99ff-e475013795c3', 3, '65 km/h');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fdabf07c-84e3-4403-99ff-e475013795c3', '823a6563-0481-4e13-932c-93f0b2acf60d', 'Speed = 100/5 = 20 m/s = 20x18/5 = 72 km/h.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0c091bcb-e6ce-438e-9093-6a8df1e20218', '07165c19-7194-4734-a612-c47968f9350a', 11, 'Find the next term: 100, 90, 81, 73, ?', 'Quantitative Aptitude', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('beb403e6-3782-4871-afd8-7903664a0da6', '0c091bcb-e6ce-438e-9093-6a8df1e20218', 0, '66');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f553cd2-5730-4ff1-bebb-cc44d010888e', '0c091bcb-e6ce-438e-9093-6a8df1e20218', 1, '65');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62d449b6-6923-404b-aab0-faa33764d162', '0c091bcb-e6ce-438e-9093-6a8df1e20218', 2, '68');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc5e2e1f-d381-4627-aa6c-d3824ce64318', '0c091bcb-e6ce-438e-9093-6a8df1e20218', 3, '70');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0c091bcb-e6ce-438e-9093-6a8df1e20218', 'beb403e6-3782-4871-afd8-7903664a0da6', 'Differences decrease by 1 each time (10,9,8,7): next term = 73-7 = 66.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('697e5dca-b23d-4f0a-9f9a-c758334113fd', '07165c19-7194-4734-a612-c47968f9350a', 12, 'In a survey of 1000 people, 45% like Product A, 35% like Product B, and the rest like neither. How many like neither?', 'Quantitative Aptitude', 'Data Interpretation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47298774-9263-4140-8b25-9ec6e9e1ae76', '697e5dca-b23d-4f0a-9f9a-c758334113fd', 0, '200');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8361c002-4034-4755-8e99-8bd8c020ce60', '697e5dca-b23d-4f0a-9f9a-c758334113fd', 1, '150');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5df7cd81-9c60-49e1-91a4-9b48c88c0c62', '697e5dca-b23d-4f0a-9f9a-c758334113fd', 2, '250');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d72fb418-9ec6-4833-ac5e-94be88c485cd', '697e5dca-b23d-4f0a-9f9a-c758334113fd', 3, '180');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('697e5dca-b23d-4f0a-9f9a-c758334113fd', '47298774-9263-4140-8b25-9ec6e9e1ae76', '1000 - 450 - 350 = 200.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9783fe9b-fc22-4b7f-95b6-1dcf7891bb5c', '07165c19-7194-4734-a612-c47968f9350a', 13, 'Find the sum of all odd numbers from 1 to 50.', 'Quantitative Aptitude', 'Number System', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc982bb7-188e-4554-a2aa-16fb7b6ee078', '9783fe9b-fc22-4b7f-95b6-1dcf7891bb5c', 0, '625');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c1fd5cc-33b7-452e-8ba1-c6155b494336', '9783fe9b-fc22-4b7f-95b6-1dcf7891bb5c', 1, '600');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3c2c522-e93e-44ef-9f06-54cf9fd63668', '9783fe9b-fc22-4b7f-95b6-1dcf7891bb5c', 2, '650');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dad18c4e-c9f1-4387-be87-6fdb7dcd5cf3', '9783fe9b-fc22-4b7f-95b6-1dcf7891bb5c', 3, '575');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9783fe9b-fc22-4b7f-95b6-1dcf7891bb5c', 'dc982bb7-188e-4554-a2aa-16fb7b6ee078', 'There are 25 odd numbers from 1 to 49; sum = 25^2 = 625.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d79960c3-ce48-4924-990f-1b4b1a249407', '07165c19-7194-4734-a612-c47968f9350a', 14, 'If the length of a rectangle is increased by 20% and the breadth decreased by 20%, find the net percentage change in area.', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('56d1e69b-cf60-41dd-9700-643b06b9cf83', 'd79960c3-ce48-4924-990f-1b4b1a249407', 0, '4% decrease');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8b7d687-60d4-4956-804e-f1f382ead3e7', 'd79960c3-ce48-4924-990f-1b4b1a249407', 1, 'No change');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28c5549d-a169-44cf-bafb-971ecb60b948', 'd79960c3-ce48-4924-990f-1b4b1a249407', 2, '4% increase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0376d0ca-77f0-4b1c-a55c-3883af572231', 'd79960c3-ce48-4924-990f-1b4b1a249407', 3, '8% decrease');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d79960c3-ce48-4924-990f-1b4b1a249407', '56d1e69b-cf60-41dd-9700-643b06b9cf83', 'Net% = x+y+xy/100 = 20-20+(20x-20)/100 = -4%, i.e. a 4% decrease.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cdd699b2-d23c-4c77-86c3-a30ce255407e', '07165c19-7194-4734-a612-c47968f9350a', 15, 'A dishonest dealer professes to sell his goods at cost price but uses a weight of 800g instead of 1kg. Find his profit percentage.', 'Quantitative Aptitude', 'Profit & Loss', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68e77799-4d27-44df-9d5a-00db9889ba33', 'cdd699b2-d23c-4c77-86c3-a30ce255407e', 0, '25%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0ea714d-497e-49e6-9df3-edea1dc57f69', 'cdd699b2-d23c-4c77-86c3-a30ce255407e', 1, '20%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80f8c48d-bcb6-420a-936a-82fb9dabc876', 'cdd699b2-d23c-4c77-86c3-a30ce255407e', 2, '15%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd90e8ca-0d3e-4a02-9561-7bba30db26dc', 'cdd699b2-d23c-4c77-86c3-a30ce255407e', 3, '30%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cdd699b2-d23c-4c77-86c3-a30ce255407e', '68e77799-4d27-44df-9d5a-00db9889ba33', 'Profit% = (1000-800)/800 x 100 = 25%.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4ba44a23-dce4-423e-b0ca-31b0b3f0160a', '07165c19-7194-4734-a612-c47968f9350a', 16, 'A sum triples itself in 20 years at simple interest. Find the rate percent per annum.', 'Quantitative Aptitude', 'Simple Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c99cb4ca-cb2f-44c6-95b5-df0ef4d77de2', '4ba44a23-dce4-423e-b0ca-31b0b3f0160a', 0, '10%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de72ba5e-ee29-4d4a-a487-5bb4db65ff4d', '4ba44a23-dce4-423e-b0ca-31b0b3f0160a', 1, '15%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c32183b2-9cf8-4ac5-88b1-dd3e8bc4b251', '4ba44a23-dce4-423e-b0ca-31b0b3f0160a', 2, '8%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8cb3e892-d3c9-47c8-8ac3-cbb87b9c5931', '4ba44a23-dce4-423e-b0ca-31b0b3f0160a', 3, '12%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4ba44a23-dce4-423e-b0ca-31b0b3f0160a', 'c99cb4ca-cb2f-44c6-95b5-df0ef4d77de2', 'If P triples, SI=2P over 20 years; rate = 2Px100/(Px20) = 10%.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a8264b03-7834-4197-8b68-a4809cfc7c55', '07165c19-7194-4734-a612-c47968f9350a', 17, 'The average height of 30 students is 150cm. The average height of 18 of them is 155cm. Find the average height of the remaining 12.', 'Quantitative Aptitude', 'Averages', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60b2c10b-9e01-415f-9a36-12d52e7c09b1', 'a8264b03-7834-4197-8b68-a4809cfc7c55', 0, '142.5 cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6cc22a34-8ca2-4d87-b271-7cd6691e9012', 'a8264b03-7834-4197-8b68-a4809cfc7c55', 1, '145 cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a18d4c63-97d6-42ee-ad0f-7f716ad43094', 'a8264b03-7834-4197-8b68-a4809cfc7c55', 2, '140 cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cb4fd61-0934-4bc3-83fa-e08a01e162f7', 'a8264b03-7834-4197-8b68-a4809cfc7c55', 3, '144 cm');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a8264b03-7834-4197-8b68-a4809cfc7c55', '60b2c10b-9e01-415f-9a36-12d52e7c09b1', 'Total30=4500; total18=2790; remaining12=1710; average = 1710/12 = 142.5 cm.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8b160c0a-51cb-4154-b025-43f97d6c46a2', '07165c19-7194-4734-a612-c47968f9350a', 18, 'The sum of three numbers is 98. The ratio between the first and second is 2:3, and between the second and third is 5:8. Find the second number.', 'Quantitative Aptitude', 'Ratio & Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('470f49ad-e0fe-4f2a-b15d-72e78e845255', '8b160c0a-51cb-4154-b025-43f97d6c46a2', 0, '30');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23086748-40eb-4c58-8a6d-f8fa2bb045eb', '8b160c0a-51cb-4154-b025-43f97d6c46a2', 1, '28');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('882b0f28-3289-473b-8f42-4f28163c3d95', '8b160c0a-51cb-4154-b025-43f97d6c46a2', 2, '32');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a456888-5550-44f3-aa4a-7236ac1a37f6', '8b160c0a-51cb-4154-b025-43f97d6c46a2', 3, '35');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8b160c0a-51cb-4154-b025-43f97d6c46a2', '470f49ad-e0fe-4f2a-b15d-72e78e845255', 'Setting second=x: first=2x/3, third=8x/5; 2x/3+x+8x/5=98 gives 49x/15=98, x=30.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0fcb26b4-7a5e-485f-ab14-278953c8a4b0', '07165c19-7194-4734-a612-c47968f9350a', 19, '6 men and 8 women can complete a work in 10 days. In how many days can 3 men and 4 women (half the workforce) complete the same work?', 'Quantitative Aptitude', 'Time & Work', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c694963b-987d-43cc-b71b-9067adfb0e12', '0fcb26b4-7a5e-485f-ab14-278953c8a4b0', 0, '20 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('489b4e80-9854-4d17-870d-2b4c7f45a8fd', '0fcb26b4-7a5e-485f-ab14-278953c8a4b0', 1, '15 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f46ddbb7-db7d-49e2-8eb9-633b0e3fce4c', '0fcb26b4-7a5e-485f-ab14-278953c8a4b0', 2, '18 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa320ab0-25fa-46ed-aaef-dc94011beac2', '0fcb26b4-7a5e-485f-ab14-278953c8a4b0', 3, '25 days');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0fcb26b4-7a5e-485f-ab14-278953c8a4b0', 'c694963b-987d-43cc-b71b-9067adfb0e12', 'Half the workforce works at half the rate, so it takes double the time: 20 days.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8b7fe073-26b6-49fb-8779-b51d6022ff1c', '07165c19-7194-4734-a612-c47968f9350a', 20, 'A boat''s speed in still water is 15 km/h. It travels 30 km upstream in 3 hours. Find the speed of the stream.', 'Quantitative Aptitude', 'Time, Speed & Distance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c808eb8b-ccdb-455c-83fc-9415af546b1d', '8b7fe073-26b6-49fb-8779-b51d6022ff1c', 0, '5 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fde11da5-6933-4bbd-9a03-7163e3e8d2a1', '8b7fe073-26b6-49fb-8779-b51d6022ff1c', 1, '4 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('229cf5f2-2342-4ee2-bbfc-c6cdb39729e2', '8b7fe073-26b6-49fb-8779-b51d6022ff1c', 2, '6 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0652a26-14d8-4673-86b7-c99fd167d74e', '8b7fe073-26b6-49fb-8779-b51d6022ff1c', 3, '3 km/h');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8b7fe073-26b6-49fb-8779-b51d6022ff1c', 'c808eb8b-ccdb-455c-83fc-9415af546b1d', 'Upstream speed = 30/3 = 10 km/h = 15 - stream speed; stream speed = 5 km/h.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');
