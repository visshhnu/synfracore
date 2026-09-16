-- ============================================================
-- Quantitative Aptitude — Practice Paper 4
-- Full-Length Practice Paper (20 questions, 15 minutes)
-- Marking: +1 correct / -0.25 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 'quant-aptitude-practice-4', 'Quantitative Aptitude Practice Paper 4', 'quant-aptitude', ARRAY['Quantitative Aptitude', 'Banking', 'SSC', 'Railways', 'State PSC']::TEXT[], 20, 'standard', true, 4, 15, 1, 0.25);

-- ── Section: Quantitative Aptitude (20 questions) — Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam's specific paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('29f7a47c-0da6-4ed2-a507-045407bf558d', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 1, 'Total sales of a company over 4 months were 100, 150, 200, 150 (in lakh Rs.). Find the average monthly sales.', 'Quantitative Aptitude', 'Data Interpretation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f473209e-bce9-41a9-b582-c3cae3bf6e5b', '29f7a47c-0da6-4ed2-a507-045407bf558d', 0, 'Rs. 150 lakh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebf9bc74-147f-4b64-9ce0-462c67be9675', '29f7a47c-0da6-4ed2-a507-045407bf558d', 1, 'Rs. 140 lakh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3939e53-5f0c-4f8d-9dec-83a6820124c7', '29f7a47c-0da6-4ed2-a507-045407bf558d', 2, 'Rs. 160 lakh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68cfd968-386d-4234-96ce-04f6eb6a7845', '29f7a47c-0da6-4ed2-a507-045407bf558d', 3, 'Rs. 145 lakh');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('29f7a47c-0da6-4ed2-a507-045407bf558d', 'f473209e-bce9-41a9-b582-c3cae3bf6e5b', 'Sum = 600; average = 600/4 = 150 lakh.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('306925fb-1440-49a4-8a9c-8042e4b76a81', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 2, 'In a survey of 500 people, 60% prefer tea and the rest prefer coffee. How many prefer coffee?', 'Quantitative Aptitude', 'Data Interpretation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd7409d5-62e1-479a-9820-5054e4586ff1', '306925fb-1440-49a4-8a9c-8042e4b76a81', 0, '200');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a754f2d-a84a-4979-95ea-efa95aab5f69', '306925fb-1440-49a4-8a9c-8042e4b76a81', 1, '180');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4bb1acb3-52f7-4e56-bc6e-8f812dd37c42', '306925fb-1440-49a4-8a9c-8042e4b76a81', 2, '220');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7d61575-ac75-4e75-b567-e15bf0ccf513', '306925fb-1440-49a4-8a9c-8042e4b76a81', 3, '250');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('306925fb-1440-49a4-8a9c-8042e4b76a81', 'fd7409d5-62e1-479a-9820-5054e4586ff1', '40% of 500 = 200.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0beee117-6395-4d3d-b620-aebde4887308', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 3, 'A bar graph shows production (in thousand units): Jan-40, Feb-55, Mar-45, Apr-60. Find the percentage increase from Jan to Apr.', 'Quantitative Aptitude', 'Data Interpretation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('483d26ad-00df-45ce-b6c1-e95d302e0176', '0beee117-6395-4d3d-b620-aebde4887308', 0, '50%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a42c6a27-f83a-4b74-925e-4d3472320675', '0beee117-6395-4d3d-b620-aebde4887308', 1, '40%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe1bfd7a-ba1d-44de-81b9-e9ddb139c11e', '0beee117-6395-4d3d-b620-aebde4887308', 2, '45%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6236375e-473b-4f00-859c-f6139022bf95', '0beee117-6395-4d3d-b620-aebde4887308', 3, '60%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0beee117-6395-4d3d-b620-aebde4887308', '483d26ad-00df-45ce-b6c1-e95d302e0176', '(60-40)/40 x 100 = 50%.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1436d366-fbf6-494c-9583-fdcfa5fec3c1', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 4, 'Ages of A and B are in ratio 3:4. Five years hence, the ratio becomes 4:5. Find A''s present age.', 'Quantitative Aptitude', 'Ratio & Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ffaf969-56a0-430e-b11f-43fb23451e6d', '1436d366-fbf6-494c-9583-fdcfa5fec3c1', 0, '15 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9feb698-6f10-417e-8059-46408f75d943', '1436d366-fbf6-494c-9583-fdcfa5fec3c1', 1, '20 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41e77647-ed99-4c45-aa73-a790bd4a241b', '1436d366-fbf6-494c-9583-fdcfa5fec3c1', 2, '12 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da44c59a-8180-400b-a612-7759505d5515', '1436d366-fbf6-494c-9583-fdcfa5fec3c1', 3, '18 years');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1436d366-fbf6-494c-9583-fdcfa5fec3c1', '9ffaf969-56a0-430e-b11f-43fb23451e6d', 'Let ages be 3x,4x. (3x+5)/(4x+5)=4/5 gives x=5; A''s age = 15.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('33bffd9d-f6ec-412a-9b79-f6b696c17be4', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 5, 'If a:b:c = 2:3:4 and a+b+c = 54, find b.', 'Quantitative Aptitude', 'Ratio & Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09e63ec1-4e5a-43c7-b459-1cb6f483c5b7', '33bffd9d-f6ec-412a-9b79-f6b696c17be4', 0, '18');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cbb1f505-ee3b-42f7-80e8-8303b08bb50a', '33bffd9d-f6ec-412a-9b79-f6b696c17be4', 1, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55c6bcad-5062-4d1f-90d7-cfc26f31c0d5', '33bffd9d-f6ec-412a-9b79-f6b696c17be4', 2, '24');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2908b4e6-37b8-4e55-93bf-2850566fe5af', '33bffd9d-f6ec-412a-9b79-f6b696c17be4', 3, '16');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('33bffd9d-f6ec-412a-9b79-f6b696c17be4', '09e63ec1-4e5a-43c7-b459-1cb6f483c5b7', '9 parts = 54, each = 6; b = 3x6 = 18.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('eecb0fd5-8bfe-4956-bfcf-6752cb7e734d', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 6, 'Find the next term: 1, 4, 9, 16, 25, ?', 'Quantitative Aptitude', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24440b5a-f525-471d-960e-324db668fb4f', 'eecb0fd5-8bfe-4956-bfcf-6752cb7e734d', 0, '36');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ada3140f-bf85-460e-85aa-0a4a14410a28', 'eecb0fd5-8bfe-4956-bfcf-6752cb7e734d', 1, '30');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d781155-6a72-4395-bd5c-13fa45fe9aca', 'eecb0fd5-8bfe-4956-bfcf-6752cb7e734d', 2, '32');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('52484424-508f-4868-91cb-414a8ab92ab7', 'eecb0fd5-8bfe-4956-bfcf-6752cb7e734d', 3, '49');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('eecb0fd5-8bfe-4956-bfcf-6752cb7e734d', '24440b5a-f525-471d-960e-324db668fb4f', 'These are perfect squares (1^2 to 5^2); next is 6^2 = 36.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('53c628d9-c718-43bb-8b03-3d057d97f40e', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 7, 'Find the missing term: 7, 14, 28, 56, ?', 'Quantitative Aptitude', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e46f633-e9d0-4836-833b-a1d3c7154344', '53c628d9-c718-43bb-8b03-3d057d97f40e', 0, '112');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b3eed7b-cf08-46e7-b9fa-1b28477f31c2', '53c628d9-c718-43bb-8b03-3d057d97f40e', 1, '98');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0127789c-64cd-4275-9690-e82a00e011a0', '53c628d9-c718-43bb-8b03-3d057d97f40e', 2, '120');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c9ec2ec-4358-4ce4-94b6-1d8c6069bbcd', '53c628d9-c718-43bb-8b03-3d057d97f40e', 3, '100');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('53c628d9-c718-43bb-8b03-3d057d97f40e', '4e46f633-e9d0-4836-833b-a1d3c7154344', 'Each term doubles the previous: 56x2 = 112.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('36f82f89-35e0-4c80-8617-351548bf31ea', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 8, 'Average marks of 25 students is 60. If 5 students with average 40 are excluded, find the new average of the remaining 20.', 'Quantitative Aptitude', 'Averages', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a767e958-4a06-4c6a-b580-9f167b34958a', '36f82f89-35e0-4c80-8617-351548bf31ea', 0, '65');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cf6af53-1c58-4ded-b9cc-1b4f98cd5e13', '36f82f89-35e0-4c80-8617-351548bf31ea', 1, '62');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2243a28-cda0-4bb5-9cba-43cb3a97e155', '36f82f89-35e0-4c80-8617-351548bf31ea', 2, '68');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d743ca9-7603-4c42-b16c-6dcf089d1321', '36f82f89-35e0-4c80-8617-351548bf31ea', 3, '60');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('36f82f89-35e0-4c80-8617-351548bf31ea', 'a767e958-4a06-4c6a-b580-9f167b34958a', 'Total25=1500; excluded5 total=200; remaining=1300; new average = 1300/20 = 65.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2bafd82e-f1e0-4cdd-bd41-6ed575a4d1b1', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 9, 'The price of an item increases from Rs. 80 to Rs. 100. Find the percentage increase.', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96c1c7a3-7d87-4cc8-9e81-acc131f5e89c', '2bafd82e-f1e0-4cdd-bd41-6ed575a4d1b1', 0, '25%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d619303a-439e-46c2-9f93-12571b022bab', '2bafd82e-f1e0-4cdd-bd41-6ed575a4d1b1', 1, '20%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aac2dfae-add0-4891-b680-4d8d0de1abdc', '2bafd82e-f1e0-4cdd-bd41-6ed575a4d1b1', 2, '30%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('896d2331-c221-4167-b4f9-7f87a26cd0c5', '2bafd82e-f1e0-4cdd-bd41-6ed575a4d1b1', 3, '22%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2bafd82e-f1e0-4cdd-bd41-6ed575a4d1b1', '96c1c7a3-7d87-4cc8-9e81-acc131f5e89c', '(20/80) x 100 = 25%.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('73cbdeea-0d7f-4ffa-9d72-f5aa73aebde2', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 10, 'A 20% reduction in the price of sugar enables a person to buy 5 kg more for Rs. 800. Find the reduced price per kg.', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee6073e1-c64f-4ccb-aafd-aef3a99b395c', '73cbdeea-0d7f-4ffa-9d72-f5aa73aebde2', 0, 'Rs. 32');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47bb84fc-1dd4-44fb-ba46-1d77c72f5904', '73cbdeea-0d7f-4ffa-9d72-f5aa73aebde2', 1, 'Rs. 36');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f121f3d-c8e3-4b9b-a872-36a02462d9f5', '73cbdeea-0d7f-4ffa-9d72-f5aa73aebde2', 2, 'Rs. 30');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa9db6e8-eb1d-4826-89f4-b058ba236f1c', '73cbdeea-0d7f-4ffa-9d72-f5aa73aebde2', 3, 'Rs. 34');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('73cbdeea-0d7f-4ffa-9d72-f5aa73aebde2', 'ee6073e1-c64f-4ccb-aafd-aef3a99b395c', 'Let original price=p. 800/(0.8p) - 800/p = 5 gives 200/p = 5, p=40; reduced price = 0.8x40 = 32.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('789cebf3-8b73-4056-977d-0331b71e944e', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 11, 'A man buys an article for Rs. 500 and sells it for Rs. 575. Find the gain percentage.', 'Quantitative Aptitude', 'Profit & Loss', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35d99080-907b-4142-b283-d6938e0209e8', '789cebf3-8b73-4056-977d-0331b71e944e', 0, '15%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bef9ed53-cb6e-42fc-94f9-c8da459d6e6f', '789cebf3-8b73-4056-977d-0331b71e944e', 1, '12%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8af7ae7-531c-405a-9a76-e35efbbddb38', '789cebf3-8b73-4056-977d-0331b71e944e', 2, '18%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eaa3a972-a01a-41c1-b0ec-d4b1d7a79316', '789cebf3-8b73-4056-977d-0331b71e944e', 3, '10%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('789cebf3-8b73-4056-977d-0331b71e944e', '35d99080-907b-4142-b283-d6938e0209e8', 'Gain = 75; gain% = 75/500 x 100 = 15%.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1ecab446-49bf-4d54-b947-1927737403ca', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 12, 'Find the amount on Rs. 6000 at 5% p.a. simple interest for 4 years.', 'Quantitative Aptitude', 'Simple Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d36814f-7ba3-4d99-9204-dd7fd731f13c', '1ecab446-49bf-4d54-b947-1927737403ca', 0, 'Rs. 7200');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bce9d142-e9ea-45e6-bf92-d29b9c3ec51a', '1ecab446-49bf-4d54-b947-1927737403ca', 1, 'Rs. 7000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb09cde7-e831-4ea2-bbb1-1f6b24e62b94', '1ecab446-49bf-4d54-b947-1927737403ca', 2, 'Rs. 7500');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1bf9fb1-9e0b-4644-8648-b735a7774e70', '1ecab446-49bf-4d54-b947-1927737403ca', 3, 'Rs. 6800');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1ecab446-49bf-4d54-b947-1927737403ca', '6d36814f-7ba3-4d99-9204-dd7fd731f13c', 'SI = 6000x5x4/100 = 1200; amount = 7200.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2be9930c-57c5-4502-a809-607b1db10a44', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 13, '8 men or 12 women can complete a work in 10 days. Find the time taken by 4 men and 6 women working together.', 'Quantitative Aptitude', 'Time & Work', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('311eea8f-d261-49d1-b518-422e20f76606', '2be9930c-57c5-4502-a809-607b1db10a44', 0, '10 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c3e3c3e-f113-45c0-b010-16ede7ef19ed', '2be9930c-57c5-4502-a809-607b1db10a44', 1, '8 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('832dcf3a-6811-4955-8cbf-e1e872425c16', '2be9930c-57c5-4502-a809-607b1db10a44', 2, '12 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eac4f12e-5f60-44b2-9597-aa4ca8f3820d', '2be9930c-57c5-4502-a809-607b1db10a44', 3, '15 days');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2be9930c-57c5-4502-a809-607b1db10a44', '311eea8f-d261-49d1-b518-422e20f76606', '1 man''s rate=1/80, 1 woman''s rate=1/120; 4 men+6 women rate = 4/80+6/120 = 1/20+1/20 = 1/10; time = 10 days.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('533fd836-b31b-4424-b7fa-11404cfb30c8', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 14, 'Two cars start from the same point at the same time in opposite directions at 40 km/h and 60 km/h. Find the distance between them after 2 hours.', 'Quantitative Aptitude', 'Time, Speed & Distance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31a7b64a-3831-4650-bd9b-d6ba87f431f9', '533fd836-b31b-4424-b7fa-11404cfb30c8', 0, '200 km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7eb44c41-b597-4d26-8b93-6edb8e132b15', '533fd836-b31b-4424-b7fa-11404cfb30c8', 1, '180 km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82e16330-5a26-4694-a993-9d05211cfe1b', '533fd836-b31b-4424-b7fa-11404cfb30c8', 2, '220 km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2490369b-b5e2-420b-9c18-72ac96f66ff4', '533fd836-b31b-4424-b7fa-11404cfb30c8', 3, '240 km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('533fd836-b31b-4424-b7fa-11404cfb30c8', '31a7b64a-3831-4650-bd9b-d6ba87f431f9', 'Relative speed (opposite directions) = 100 km/h; distance = 100x2 = 200 km.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('63ab2042-52da-4310-888d-aa1dc6119281', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 15, 'A man covers a distance at 40 km/h and returns at 60 km/h. Find his average speed for the entire journey.', 'Quantitative Aptitude', 'Time, Speed & Distance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('deda6f06-88e7-4fcb-a387-ca698975aa53', '63ab2042-52da-4310-888d-aa1dc6119281', 0, '48 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c079147-5721-490f-901f-8c2d98fa7474', '63ab2042-52da-4310-888d-aa1dc6119281', 1, '50 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7e365a7-64bb-4c3b-a7a1-7bc2a67a10b3', '63ab2042-52da-4310-888d-aa1dc6119281', 2, '45 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa1770f6-0835-4685-9009-cbed3eb0aba0', '63ab2042-52da-4310-888d-aa1dc6119281', 3, '52 km/h');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('63ab2042-52da-4310-888d-aa1dc6119281', 'deda6f06-88e7-4fcb-a387-ca698975aa53', 'Average speed = 2xy/(x+y) = 2x40x60/100 = 48 km/h.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6cb8f038-b1e4-40e0-bb48-65381747db52', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 16, 'Find the number of factors of 36.', 'Quantitative Aptitude', 'Number System', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26088b6c-2980-4a3d-91eb-e62afdcef5f1', '6cb8f038-b1e4-40e0-bb48-65381747db52', 0, '9');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3260f058-7ab3-442f-9944-386141d81467', '6cb8f038-b1e4-40e0-bb48-65381747db52', 1, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4bcadae4-a2f3-47f1-9409-94ab13fe70f3', '6cb8f038-b1e4-40e0-bb48-65381747db52', 2, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('acb30afd-3dad-4ed0-a990-9ebb83a8bcb0', '6cb8f038-b1e4-40e0-bb48-65381747db52', 3, '10');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6cb8f038-b1e4-40e0-bb48-65381747db52', '26088b6c-2980-4a3d-91eb-e62afdcef5f1', '36=2^2x3^2; number of factors = (2+1)(2+1) = 9.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d2adbaa0-8efb-4c9d-9599-4f736258c983', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 17, 'The ratio of incomes of A and B is 5:4, and the ratio of their expenditures is 3:2. If each saves Rs. 1000, find A''s income.', 'Quantitative Aptitude', 'Ratio & Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2262507f-4355-4745-afd9-82016564ba47', 'd2adbaa0-8efb-4c9d-9599-4f736258c983', 0, 'Rs. 2500');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c91824df-dd39-4016-83b5-71c88753fa1b', 'd2adbaa0-8efb-4c9d-9599-4f736258c983', 1, 'Rs. 2000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77b59b1c-58f7-419e-9b59-bada73e35e65', 'd2adbaa0-8efb-4c9d-9599-4f736258c983', 2, 'Rs. 3000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7cdaef09-1ef0-4675-a780-7c8aa698b34d', 'd2adbaa0-8efb-4c9d-9599-4f736258c983', 3, 'Rs. 2800');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d2adbaa0-8efb-4c9d-9599-4f736258c983', '2262507f-4355-4745-afd9-82016564ba47', 'Solving 5x-3y=1000 and 4x-2y=1000 gives x=500; A''s income = 5x500 = 2500.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('98adeb3c-c493-407b-af0e-5d0de174b93a', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 18, 'Average of 11 results is 50. Average of the first 6 is 49 and the last 6 is 52. Find the 6th result.', 'Quantitative Aptitude', 'Averages', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17beead0-cf5b-4d3c-87da-53e8d90b0f83', '98adeb3c-c493-407b-af0e-5d0de174b93a', 0, '56');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d61f2dd3-1b72-47ce-9330-a8603bdb0c15', '98adeb3c-c493-407b-af0e-5d0de174b93a', 1, '52');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4b9c1d4-b55f-4a90-af78-0875284da62b', '98adeb3c-c493-407b-af0e-5d0de174b93a', 2, '58');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75a543f4-c59d-4ddd-8868-0901026f2401', '98adeb3c-c493-407b-af0e-5d0de174b93a', 3, '54');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('98adeb3c-c493-407b-af0e-5d0de174b93a', '17beead0-cf5b-4d3c-87da-53e8d90b0f83', 'Sum11=550; sum(first6)=294; sum(last6)=312; 6th = 294+312-550 = 56.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('aa0c2057-05a3-4e99-973a-af865f25a209', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 19, 'In a school of 800 students, the ratio of boys to girls is 3:5. Find the number of girls.', 'Quantitative Aptitude', 'Data Interpretation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8ecb79c-e9b5-4dd3-89d6-90258e2128e0', 'aa0c2057-05a3-4e99-973a-af865f25a209', 0, '500');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54b5443e-10b4-4b11-99b4-84dbdd4642d0', 'aa0c2057-05a3-4e99-973a-af865f25a209', 1, '480');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a8b2714-6c5c-40f5-bdc1-e0f1e1fedd0a', 'aa0c2057-05a3-4e99-973a-af865f25a209', 2, '520');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('271c0cd9-552d-4ee6-8324-3b243c2eee23', 'aa0c2057-05a3-4e99-973a-af865f25a209', 3, '450');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aa0c2057-05a3-4e99-973a-af865f25a209', 'a8ecb79c-e9b5-4dd3-89d6-90258e2128e0', '8 parts=800; girls = 5x100 = 500.', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f0c39934-0ddb-4c75-b8c9-f7ccf54a05fd', '8dd74dec-a883-464a-9b9c-b04e80f1d0e8', 20, 'Find the wrong number in the series: 2, 5, 10, 17, 26, 36.', 'Quantitative Aptitude', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0cf72066-6c87-43b1-9392-e438fb27a302', 'f0c39934-0ddb-4c75-b8c9-f7ccf54a05fd', 0, '36');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e86115f2-b17b-4648-b970-efb3478ab739', 'f0c39934-0ddb-4c75-b8c9-f7ccf54a05fd', 1, '26');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abf2daaf-ff0e-40b1-badc-26f32035e513', 'f0c39934-0ddb-4c75-b8c9-f7ccf54a05fd', 2, '17');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6d8a146-71a0-47bb-9085-60bea7945870', 'f0c39934-0ddb-4c75-b8c9-f7ccf54a05fd', 3, '10');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f0c39934-0ddb-4c75-b8c9-f7ccf54a05fd', '0cf72066-6c87-43b1-9392-e438fb27a302', 'Differences follow odd numbers 3,5,7,9,11: 2,5,10,17,26,37 expected -- 36 is wrong (should be 37).', 'Quantitative Aptitude — authored to match the real quant sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');
