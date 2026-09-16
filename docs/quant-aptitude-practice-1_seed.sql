-- ============================================================
-- Quantitative Aptitude — Practice Paper 1
-- Full-Length Practice Paper (20 questions, 15 minutes)
-- Marking: +1 correct / -0.25 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('72c10b12-7b18-42cd-bf70-2ba39ba80816', 'quant-aptitude-practice-1', 'Quantitative Aptitude Practice Paper 1', 'quant-aptitude', ARRAY['Quantitative Aptitude', 'Banking', 'SSC', 'Railways', 'State PSC']::TEXT[], 20, 'standard', true, 1, 15, 1, 0.25);

-- ── Section: Quantitative Aptitude (20 questions) — Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam's specific paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('88d48f38-82a6-49fe-a14a-428b41a3e636', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 1, 'Find the sum of the first 15 natural numbers.', 'Quantitative Aptitude', 'Number System', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('840ec81e-4de7-4d44-8bff-f662b89f5620', '88d48f38-82a6-49fe-a14a-428b41a3e636', 0, '120');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('56e1ff58-d0f9-480a-a7cd-cb0ae73f91a9', '88d48f38-82a6-49fe-a14a-428b41a3e636', 1, '110');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f621985-c7ff-468d-a793-3a7c7276d539', '88d48f38-82a6-49fe-a14a-428b41a3e636', 2, '105');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e95896ff-b3b0-4320-96b8-3b791376fe84', '88d48f38-82a6-49fe-a14a-428b41a3e636', 3, '125');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('88d48f38-82a6-49fe-a14a-428b41a3e636', '840ec81e-4de7-4d44-8bff-f662b89f5620', 'Sum = n(n+1)/2 = 15x16/2 = 120.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e5814490-73cc-4434-8fd3-0c7711878e58', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 2, 'Simplify: 15% of 240 + 20% of 150.', 'Quantitative Aptitude', 'Simplification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e111abe6-ade8-4ca4-ae0c-707e9a94639d', 'e5814490-73cc-4434-8fd3-0c7711878e58', 0, '66');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('907050e7-5dc9-47b5-9971-873cb60db0db', 'e5814490-73cc-4434-8fd3-0c7711878e58', 1, '60');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bda2bdf1-2435-4aef-af05-3b9221f17bb9', 'e5814490-73cc-4434-8fd3-0c7711878e58', 2, '72');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74dbb081-e181-447a-8102-06f157d10cb7', 'e5814490-73cc-4434-8fd3-0c7711878e58', 3, '56');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e5814490-73cc-4434-8fd3-0c7711878e58', 'e111abe6-ade8-4ca4-ae0c-707e9a94639d', '15% of 240 = 36; 20% of 150 = 30; sum = 66.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fe196383-d951-44b0-bdc3-879cd4fd67ab', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 3, 'If a number is increased by 25%, it becomes 150. Find the original number.', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f26d41a2-4499-4267-b7f7-25bbc533dbc2', 'fe196383-d951-44b0-bdc3-879cd4fd67ab', 0, '120');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de872b16-6e3e-432c-b0c0-cc9427b0c4b1', 'fe196383-d951-44b0-bdc3-879cd4fd67ab', 1, '125');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1de3dfa7-f0e4-4e5c-8a45-4e8a7a8c4806', 'fe196383-d951-44b0-bdc3-879cd4fd67ab', 2, '110');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65ae2888-58b8-4b04-885e-549e0f44a2a2', 'fe196383-d951-44b0-bdc3-879cd4fd67ab', 3, '100');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fe196383-d951-44b0-bdc3-879cd4fd67ab', 'f26d41a2-4499-4267-b7f7-25bbc533dbc2', 'Original = 150/1.25 = 120.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b1269ecc-10b6-4ed0-9efb-47145d9f1500', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 4, 'A shopkeeper buys an item for Rs. 800 and sells it for Rs. 960. Find the profit percentage.', 'Quantitative Aptitude', 'Profit & Loss', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1112a487-7320-4dc8-bef3-df28e56f4c97', 'b1269ecc-10b6-4ed0-9efb-47145d9f1500', 0, '20%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5646cfdb-dca5-4ed1-9481-e72a0c7d7120', 'b1269ecc-10b6-4ed0-9efb-47145d9f1500', 1, '15%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a4da83f-d757-4769-9a50-d611834ce2af', 'b1269ecc-10b6-4ed0-9efb-47145d9f1500', 2, '25%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c080bc0c-11db-4ca1-abbe-08402250dcb4', 'b1269ecc-10b6-4ed0-9efb-47145d9f1500', 3, '18%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b1269ecc-10b6-4ed0-9efb-47145d9f1500', '1112a487-7320-4dc8-bef3-df28e56f4c97', 'Profit = 160; profit% = 160/800 x 100 = 20%.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4a369abb-1507-4e69-ae50-0aa356e6c2c0', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 5, 'Find the simple interest on Rs. 5000 at 8% p.a. for 3 years.', 'Quantitative Aptitude', 'Simple Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b823480-f832-4511-a2c2-f066f9f7773c', '4a369abb-1507-4e69-ae50-0aa356e6c2c0', 0, 'Rs. 1200');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0fd3184-758b-4a5d-83e4-f8a7fbb0701b', '4a369abb-1507-4e69-ae50-0aa356e6c2c0', 1, 'Rs. 1000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b2099c4-6d84-418e-a329-e64b1f29a5c1', '4a369abb-1507-4e69-ae50-0aa356e6c2c0', 2, 'Rs. 1500');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a77ea3b0-1d2d-48d9-8170-e4f4fe37faf8', '4a369abb-1507-4e69-ae50-0aa356e6c2c0', 3, 'Rs. 1300');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4a369abb-1507-4e69-ae50-0aa356e6c2c0', '9b823480-f832-4511-a2c2-f066f9f7773c', 'SI = PRT/100 = 5000x8x3/100 = 1200.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f9132d52-12da-470d-8da6-00911fdfcd28', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 6, 'Find the compound interest on Rs. 2000 at 10% p.a. for 2 years, compounded annually.', 'Quantitative Aptitude', 'Compound Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86562816-732d-4132-a9fa-1bcd561f5260', 'f9132d52-12da-470d-8da6-00911fdfcd28', 0, 'Rs. 420');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2b6c7e0-1cec-400a-b33f-373c2abc7dbf', 'f9132d52-12da-470d-8da6-00911fdfcd28', 1, 'Rs. 400');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f7257c2-8d76-4dfb-9150-c77baa76bc3e', 'f9132d52-12da-470d-8da6-00911fdfcd28', 2, 'Rs. 440');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('928c2bc7-3a5a-4e7f-ae81-a7cb9846bb4e', 'f9132d52-12da-470d-8da6-00911fdfcd28', 3, 'Rs. 200');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f9132d52-12da-470d-8da6-00911fdfcd28', '86562816-732d-4132-a9fa-1bcd561f5260', 'Amount = 2000x(1.1)^2 = 2420; CI = 420.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bf725a62-90f7-4bec-99d3-d2af5dda3eb5', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 7, 'Find the average of 12, 18, 24, 30, 36.', 'Quantitative Aptitude', 'Averages', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2bf8441-1a9e-4bb4-99cb-4a0b253d44ba', 'bf725a62-90f7-4bec-99d3-d2af5dda3eb5', 0, '24');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99a1d01a-1021-423d-917e-3ccfa91ea193', 'bf725a62-90f7-4bec-99d3-d2af5dda3eb5', 1, '22');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb465352-63c1-4627-8748-0eb767ab4f00', 'bf725a62-90f7-4bec-99d3-d2af5dda3eb5', 2, '26');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f3d32e78-8836-488e-b870-3c3176e27aee', 'bf725a62-90f7-4bec-99d3-d2af5dda3eb5', 3, '20');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bf725a62-90f7-4bec-99d3-d2af5dda3eb5', 'c2bf8441-1a9e-4bb4-99cb-4a0b253d44ba', 'Sum = 120; average = 120/5 = 24.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('34e3575b-3043-463b-93b7-150db2e6847f', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 8, 'Divide Rs. 1200 between A and B in the ratio 3:5. Find A''s share.', 'Quantitative Aptitude', 'Ratio & Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0305a55e-1934-47f1-80c1-ffa8deaefc1f', '34e3575b-3043-463b-93b7-150db2e6847f', 0, 'Rs. 450');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cac706c1-9902-42b4-943e-588b9e440488', '34e3575b-3043-463b-93b7-150db2e6847f', 1, 'Rs. 500');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf3a12d2-3f6c-47c4-87dd-92c32857c074', '34e3575b-3043-463b-93b7-150db2e6847f', 2, 'Rs. 400');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0ed7d59-2304-43e1-8e0a-c5c74998043e', '34e3575b-3043-463b-93b7-150db2e6847f', 3, 'Rs. 600');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('34e3575b-3043-463b-93b7-150db2e6847f', '0305a55e-1934-47f1-80c1-ffa8deaefc1f', 'A''s share = 1200 x 3/8 = 450.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('07cb8bdc-1976-4609-b15f-56e5bec78d32', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 9, 'A can do a work in 10 days, B in 15 days. In how many days will they finish it together?', 'Quantitative Aptitude', 'Time & Work', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7680206e-dc3a-4286-8dd3-211787f6da26', '07cb8bdc-1976-4609-b15f-56e5bec78d32', 0, '6 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cc5b456-08ea-48f3-92e8-9ccc5da45543', '07cb8bdc-1976-4609-b15f-56e5bec78d32', 1, '8 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f2e31fd-1342-4174-8af0-cf47d85ab2ea', '07cb8bdc-1976-4609-b15f-56e5bec78d32', 2, '7 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36405c94-58b4-4e64-b147-13511c3d135d', '07cb8bdc-1976-4609-b15f-56e5bec78d32', 3, '5 days');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('07cb8bdc-1976-4609-b15f-56e5bec78d32', '7680206e-dc3a-4286-8dd3-211787f6da26', 'Combined rate = 1/10+1/15 = 1/6; time = 6 days.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b209e52e-7378-4a96-add3-c7165df031ae', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 10, 'A car travels 180 km in 3 hours. Find its speed.', 'Quantitative Aptitude', 'Time, Speed & Distance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('790909ed-320b-4ff8-982a-b2079948fa9f', 'b209e52e-7378-4a96-add3-c7165df031ae', 0, '60 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5373ee82-76ab-4c1f-b3b0-ced4185a0e29', 'b209e52e-7378-4a96-add3-c7165df031ae', 1, '50 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('740bbb18-5ee4-4a3c-8e35-dcc72a2523cd', 'b209e52e-7378-4a96-add3-c7165df031ae', 2, '70 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6eaff6fe-f243-441d-b06c-5a6f1faa09aa', 'b209e52e-7378-4a96-add3-c7165df031ae', 3, '65 km/h');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b209e52e-7378-4a96-add3-c7165df031ae', '790909ed-320b-4ff8-982a-b2079948fa9f', 'Speed = 180/3 = 60 km/h.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('109eb7bc-bab6-4cbe-a807-40b0b5b21c65', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 11, 'Find the next term: 3, 6, 12, 24, ?', 'Quantitative Aptitude', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('215eacc1-39a0-4954-9733-82e7f3f4fd73', '109eb7bc-bab6-4cbe-a807-40b0b5b21c65', 0, '48');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e30690d9-cf2a-4b96-b722-64cbef27584b', '109eb7bc-bab6-4cbe-a807-40b0b5b21c65', 1, '36');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('365b804e-b5a9-42a9-bfaa-68817cd52021', '109eb7bc-bab6-4cbe-a807-40b0b5b21c65', 2, '42');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a42336fe-7095-45bf-9658-cd45dc08b691', '109eb7bc-bab6-4cbe-a807-40b0b5b21c65', 3, '54');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('109eb7bc-bab6-4cbe-a807-40b0b5b21c65', '215eacc1-39a0-4954-9733-82e7f3f4fd73', 'Each term doubles the previous: 24x2 = 48.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('90b86a6b-dffa-43c0-95bb-ffd32b34ab35', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 12, 'Find the HCF of 18 and 24.', 'Quantitative Aptitude', 'Number System', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a13709d-5ec8-489a-a9ee-caf296edc12d', '90b86a6b-dffa-43c0-95bb-ffd32b34ab35', 0, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c877a796-7494-43b3-b833-78d145385082', '90b86a6b-dffa-43c0-95bb-ffd32b34ab35', 1, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c2b7626-4fc8-4d49-8c72-e2130f478300', '90b86a6b-dffa-43c0-95bb-ffd32b34ab35', 2, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d287181e-2af9-430c-9d0a-c52162b476f0', '90b86a6b-dffa-43c0-95bb-ffd32b34ab35', 3, '12');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('90b86a6b-dffa-43c0-95bb-ffd32b34ab35', '1a13709d-5ec8-489a-a9ee-caf296edc12d', '18=2x3^2, 24=2^3x3; HCF = 2x3 = 6.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('466dd80f-3c21-424a-9d65-957a6c930594', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 13, 'Simplify: (25x4) + (36 / 6).', 'Quantitative Aptitude', 'Simplification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73afd809-2e05-4aa5-bb6f-32eeedd6bf67', '466dd80f-3c21-424a-9d65-957a6c930594', 0, '106');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23dfd771-a42a-4072-bed6-60f336e25287', '466dd80f-3c21-424a-9d65-957a6c930594', 1, '100');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('248d7246-8999-4732-a345-b757b6b6a937', '466dd80f-3c21-424a-9d65-957a6c930594', 2, '110');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9ba8cb9-fe95-4f93-842b-7c9e547db788', '466dd80f-3c21-424a-9d65-957a6c930594', 3, '96');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('466dd80f-3c21-424a-9d65-957a6c930594', '73afd809-2e05-4aa5-bb6f-32eeedd6bf67', '25x4=100; 36/6=6; sum = 106.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('809f97d7-ecf9-4166-aa8a-3aee75551a44', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 14, '60 is what percent of 240?', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0721d5d3-43bd-4939-962c-8a69b27ff04a', '809f97d7-ecf9-4166-aa8a-3aee75551a44', 0, '25%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bf594904-36fd-4009-bdf8-88bbb725a049', '809f97d7-ecf9-4166-aa8a-3aee75551a44', 1, '20%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63c3af49-1323-49ef-8278-7c746cad40c6', '809f97d7-ecf9-4166-aa8a-3aee75551a44', 2, '30%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1178b949-3caa-41a6-a3d0-06cfdc559ad5', '809f97d7-ecf9-4166-aa8a-3aee75551a44', 3, '15%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('809f97d7-ecf9-4166-aa8a-3aee75551a44', '0721d5d3-43bd-4939-962c-8a69b27ff04a', '60/240 x 100 = 25%.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('832de004-8211-4a42-b8be-991149b1c445', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 15, 'An article marked at Rs. 500 is sold at a 10% discount. Find the selling price.', 'Quantitative Aptitude', 'Profit & Loss', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2abd68b-aec0-452d-bf2d-8ea5e0bc6f3b', '832de004-8211-4a42-b8be-991149b1c445', 0, 'Rs. 450');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90c6b58d-c41a-4603-9a2f-bdd5ccfc14a2', '832de004-8211-4a42-b8be-991149b1c445', 1, 'Rs. 480');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aef5722d-1e10-40cb-a48c-964639b74cd1', '832de004-8211-4a42-b8be-991149b1c445', 2, 'Rs. 400');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7526c264-cb8c-446b-8304-a6bd5b53ccb4', '832de004-8211-4a42-b8be-991149b1c445', 3, 'Rs. 460');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('832de004-8211-4a42-b8be-991149b1c445', 'b2abd68b-aec0-452d-bf2d-8ea5e0bc6f3b', 'SP = 500x0.9 = 450.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0c379eb2-19e7-4011-84cc-ff4a016a81f1', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 16, 'Find the rate percent if the SI on Rs. 4000 for 2 years is Rs. 800.', 'Quantitative Aptitude', 'Simple Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd5e4b8c-c015-48e9-aae9-32ca2cc8c2ad', '0c379eb2-19e7-4011-84cc-ff4a016a81f1', 0, '10%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eeb93ebd-6567-4334-9cdd-074f01487e14', '0c379eb2-19e7-4011-84cc-ff4a016a81f1', 1, '8%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('477a82f8-437a-4e59-a1c8-47fdf2c295c7', '0c379eb2-19e7-4011-84cc-ff4a016a81f1', 2, '12%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93314415-732c-4a2b-a7db-afabe722a164', '0c379eb2-19e7-4011-84cc-ff4a016a81f1', 3, '15%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0c379eb2-19e7-4011-84cc-ff4a016a81f1', 'cd5e4b8c-c015-48e9-aae9-32ca2cc8c2ad', 'Rate = SIx100/(PxT) = 800x100/8000 = 10%.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bf2e0818-5313-4a6a-9827-e5c305f85c1e', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 17, 'The average of 5 numbers is 20. If one number is excluded, the average of the remaining 4 becomes 18. Find the excluded number.', 'Quantitative Aptitude', 'Averages', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0be523d-511a-4d9e-a891-8d955bb32df0', 'bf2e0818-5313-4a6a-9827-e5c305f85c1e', 0, '28');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31f503db-809a-4581-b29c-595f4670e11f', 'bf2e0818-5313-4a6a-9827-e5c305f85c1e', 1, '20');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57021f8f-0f31-4d77-9c9f-d64d21534160', 'bf2e0818-5313-4a6a-9827-e5c305f85c1e', 2, '24');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91d4f7fc-2bef-4913-813c-6cdc2175a0bd', 'bf2e0818-5313-4a6a-9827-e5c305f85c1e', 3, '32');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bf2e0818-5313-4a6a-9827-e5c305f85c1e', 'd0be523d-511a-4d9e-a891-8d955bb32df0', 'Total5=100, total4=72; excluded = 100-72 = 28.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('61a9c3d7-cbd6-4d26-b32b-ca03badf6a96', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 18, 'If a:b = 2:3 and b:c = 4:5, find a:b:c.', 'Quantitative Aptitude', 'Ratio & Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30211abf-50eb-4b45-b525-f22b39f023a0', '61a9c3d7-cbd6-4d26-b32b-ca03badf6a96', 0, '8:12:15');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('132eb518-ffb1-4b94-b51b-ce2cea3ab884', '61a9c3d7-cbd6-4d26-b32b-ca03badf6a96', 1, '2:3:5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93df2eed-f7c7-4c72-a0fa-18380852e002', '61a9c3d7-cbd6-4d26-b32b-ca03badf6a96', 2, '2:4:5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da51853c-bcd2-490d-9a43-71d4db27d128', '61a9c3d7-cbd6-4d26-b32b-ca03badf6a96', 3, '6:9:15');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('61a9c3d7-cbd6-4d26-b32b-ca03badf6a96', '30211abf-50eb-4b45-b525-f22b39f023a0', 'Scale a:b by 4 and b:c by 3 to match b=12: a:b:c = 8:12:15.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d38c0111-122f-4d51-890f-106fdb2597d6', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 19, 'Pipe A fills a tank in 6 hours; pipe B empties it in 8 hours. If both are opened together, how long to fill the tank?', 'Quantitative Aptitude', 'Time & Work', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('112ae0d3-6e0f-4fa4-b5cd-cabd7eadeb31', 'd38c0111-122f-4d51-890f-106fdb2597d6', 0, '24 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c93877a-da8d-4636-829e-18a38227d982', 'd38c0111-122f-4d51-890f-106fdb2597d6', 1, '20 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a961db26-2ad8-4400-bf72-ba2621d3f3b0', 'd38c0111-122f-4d51-890f-106fdb2597d6', 2, '18 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50ed2f2d-b52e-4de1-95a2-17cb4408393d', 'd38c0111-122f-4d51-890f-106fdb2597d6', 3, '28 hours');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d38c0111-122f-4d51-890f-106fdb2597d6', '112ae0d3-6e0f-4fa4-b5cd-cabd7eadeb31', 'Net rate = 1/6-1/8 = 1/24; time = 24 hours.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('edeaf361-3f12-4d65-966e-f7df07689b11', '72c10b12-7b18-42cd-bf70-2ba39ba80816', 20, 'Two trains 150m and 100m long run in opposite directions at 30 km/h and 20 km/h. Find the time taken to cross each other.', 'Quantitative Aptitude', 'Time, Speed & Distance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4691500-ecb2-4824-949a-ebbc9032649f', 'edeaf361-3f12-4d65-966e-f7df07689b11', 0, '18 sec');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67221545-63fd-4561-8683-8efcbb5239ef', 'edeaf361-3f12-4d65-966e-f7df07689b11', 1, '20 sec');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('942613a7-a609-44cb-98cd-c02a4ee02bb8', 'edeaf361-3f12-4d65-966e-f7df07689b11', 2, '15 sec');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df315eb2-25b4-45b0-ac99-cbb0ec4c549a', 'edeaf361-3f12-4d65-966e-f7df07689b11', 3, '22 sec');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('edeaf361-3f12-4d65-966e-f7df07689b11', 'c4691500-ecb2-4824-949a-ebbc9032649f', 'Relative speed = 50 km/h = 125/9 m/s; total distance = 250m; time = 250/(125/9) = 18 sec.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically (Number System, Simplification, Percentage, Profit & Loss, Simple/Compound Interest, Time & Work, Time-Speed-Distance, Averages, Ratio & Proportion, Number Series); not copied from any official question paper, and not tied to any single exam''s specific paper.');
