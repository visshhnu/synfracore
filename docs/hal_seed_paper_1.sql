-- ============================================================
-- HAL Design/Management Trainee -- Electrical & Electronics Engineering
-- Full-Length Mock Paper 1 (160 questions, 150 minutes)
-- 
-- SOURCE: informally shared study material (not an official/proprietary HAL
-- archive). Honest per-question source note via question_answers.source_note
-- (already rendered in the results-review UI):
--   Section A (General Awareness, Q1-20): written to match HAL's real GA
--     scope, not taken from an official HAL paper.
--   Section B (English & Reasoning, Q21-60): general competitive-exam style
--     practice content, not an official HAL paper.
--   Section C (Electrical & Electronics discipline, Q61-160): technical
--     difficulty based on GATE-pattern questions, not an official HAL paper.
--     All 160 answers independently checked/derived, not copied from source.
-- Run this AFTER docs/question-bank-schema.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes)
VALUES ('632d2d17-f8c9-41d0-9051-7919f9ff538d', 'hal-eee-practice-1', 'HAL DT/MT — Electrical & Electronics Engineering — Full Mock Paper 1', 'hal-trainee', ARRAY['HAL', 'Electrical Engineering', 'Electronics', 'General Awareness', 'Reasoning', 'English']::TEXT[], 160, 'standard', true, 1, 150);

-- ── Section: General Awareness (20 questions) ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('eab623cd-2f66-4af8-911e-a79a58f0a8e0', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 1, 'HAL (Hindustan Aeronautics Limited) is classified under which category of Central Public Sector Enterprise (CPSE)?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6a952f3-34c6-4ede-b6bd-97e8d71f5e09', 'eab623cd-2f66-4af8-911e-a79a58f0a8e0', 0, 'Miniratna');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24342d72-4072-49cd-86d1-c4b402ff9598', 'eab623cd-2f66-4af8-911e-a79a58f0a8e0', 1, 'Navratna');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('369eccab-da99-4796-9ec2-a00582b36047', 'eab623cd-2f66-4af8-911e-a79a58f0a8e0', 2, 'Maharatna');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f74173f8-9ad7-44ef-a9b6-947c7f4ad643', 'eab623cd-2f66-4af8-911e-a79a58f0a8e0', 3, 'Not a CPSE — HAL is a private company');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('eab623cd-2f66-4af8-911e-a79a58f0a8e0', '369eccab-da99-4796-9ec2-a00582b36047', 'HAL holds Maharatna status, the highest CPSE classification, granted to CPSEs with a strong track record of performance and significant operational autonomy.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f99e8e4c-5354-4094-b4fc-19db65c9584a', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 2, 'HAL is headquartered in which city?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44f4c63a-fa69-4bd4-98bd-7572736bc138', 'f99e8e4c-5354-4094-b4fc-19db65c9584a', 0, 'Nashik');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89848085-057c-4c5f-a5f5-234c7778ef6b', 'f99e8e4c-5354-4094-b4fc-19db65c9584a', 1, 'Bengaluru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a2a5c49-2c2c-4d01-945c-9102c574006c', 'f99e8e4c-5354-4094-b4fc-19db65c9584a', 2, 'Kanpur');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c0f606b-2329-4726-b868-c873acac6319', 'f99e8e4c-5354-4094-b4fc-19db65c9584a', 3, 'Hyderabad');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f99e8e4c-5354-4094-b4fc-19db65c9584a', '89848085-057c-4c5f-a5f5-234c7778ef6b', 'HAL''s registered and corporate headquarters is in Bengaluru, Karnataka, where its origins as Hindustan Aircraft Limited (founded 1940) also began.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d0339d52-6f26-4d61-a5ff-10603e07c19a', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 3, 'Which of the following is an indigenously developed light combat aircraft manufactured by HAL?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0998ee4e-b8cd-44c3-8fcd-ac882b1a1e6f', 'd0339d52-6f26-4d61-a5ff-10603e07c19a', 0, 'Su-30MKI');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e066e1dd-aa95-4b19-ac82-ad6424b706e9', 'd0339d52-6f26-4d61-a5ff-10603e07c19a', 1, 'Tejas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed6146ae-95ab-4c3a-bdc4-ce5f99105a39', 'd0339d52-6f26-4d61-a5ff-10603e07c19a', 2, 'Rafale');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a077d053-beaa-49ef-8172-cdf848288e2a', 'd0339d52-6f26-4d61-a5ff-10603e07c19a', 3, 'Mirage 2000');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d0339d52-6f26-4d61-a5ff-10603e07c19a', 'e066e1dd-aa95-4b19-ac82-ad6424b706e9', 'Tejas is India''s indigenously designed and developed Light Combat Aircraft (LCA), manufactured by HAL; Su-30MKI is license-built (originally Russian design), and Rafale/Mirage 2000 are French Dassault aircraft not manufactured by HAL.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1e716a58-2c98-4a25-a3af-adf202ea0344', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 4, 'The ''Prachand'' manufactured by HAL is which type of aircraft?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97b0e42f-3dc5-41af-af3d-62eedf10e46a', '1e716a58-2c98-4a25-a3af-adf202ea0344', 0, 'A light combat helicopter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c841c42f-3a67-43f1-9ef9-44841595fa7b', '1e716a58-2c98-4a25-a3af-adf202ea0344', 1, 'A fighter jet');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6b0c859-28e6-4582-a748-51ee148b6bec', '1e716a58-2c98-4a25-a3af-adf202ea0344', 2, 'A trainer aircraft');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('729ce2e4-994f-4d02-8bb9-5ca5711912da', '1e716a58-2c98-4a25-a3af-adf202ea0344', 3, 'An unmanned aerial vehicle');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1e716a58-2c98-4a25-a3af-adf202ea0344', '97b0e42f-3dc5-41af-af3d-62eedf10e46a', 'The Light Combat Helicopter (LCH), named Prachand, is an indigenous attack helicopter developed and manufactured by HAL for the Indian Air Force and Army.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('64fa5b85-4bd4-495a-b12b-842b8434c67c', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 5, 'Which ministry administratively controls HAL?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d82fc0b7-2bd8-4f71-a04f-a650efb657e0', '64fa5b85-4bd4-495a-b12b-842b8434c67c', 0, 'Ministry of Civil Aviation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('254c7445-b590-4ad2-b6bb-532c09731584', '64fa5b85-4bd4-495a-b12b-842b8434c67c', 1, 'Ministry of Heavy Industries');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00597e31-b0eb-4216-ab0f-5cee042d174d', '64fa5b85-4bd4-495a-b12b-842b8434c67c', 2, 'Ministry of Defence');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21a657fe-0ddd-4264-be4c-f30c74e98619', '64fa5b85-4bd4-495a-b12b-842b8434c67c', 3, 'Ministry of Science and Technology');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('64fa5b85-4bd4-495a-b12b-842b8434c67c', '00597e31-b0eb-4216-ab0f-5cee042d174d', 'HAL operates under the administrative control of the Ministry of Defence, Government of India, being India''s primary aerospace and defence manufacturing PSU.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('41f2de22-4b8f-43bb-a7b4-f155858a188f', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 6, 'The Indian Constitution came into effect on which date?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47688ef1-6420-439b-b223-41da8cf0a776', '41f2de22-4b8f-43bb-a7b4-f155858a188f', 0, '15 August 1947');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec39a5be-3f74-4882-9d8a-981a9e233577', '41f2de22-4b8f-43bb-a7b4-f155858a188f', 1, '26 January 1950');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0bb96589-d313-4045-b6b4-088ef8b02d2c', '41f2de22-4b8f-43bb-a7b4-f155858a188f', 2, '26 November 1949');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88827128-e46e-43ec-afe6-fab06c7089b5', '41f2de22-4b8f-43bb-a7b4-f155858a188f', 3, '2 October 1950');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('41f2de22-4b8f-43bb-a7b4-f155858a188f', 'ec39a5be-3f74-4882-9d8a-981a9e233577', 'The Constitution of India was adopted on 26 November 1949 but came into effect (commenced) on 26 January 1950, which is celebrated annually as Republic Day.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('806460a6-01ff-44f9-8cb4-41fbc90eaa41', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 7, 'Which Article of the Indian Constitution abolishes untouchability?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87e41e3a-7fe9-4ff6-b211-c1d5d89a29a6', '806460a6-01ff-44f9-8cb4-41fbc90eaa41', 0, 'Article 14');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a68c3f3-d7fe-4273-9d57-bb93227a71d9', '806460a6-01ff-44f9-8cb4-41fbc90eaa41', 1, 'Article 17');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60906f5b-8b27-450b-ae03-c70e9e9b4494', '806460a6-01ff-44f9-8cb4-41fbc90eaa41', 2, 'Article 21');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b4ef9fb-683a-4bbd-a4dd-5a8fcfa3f68c', '806460a6-01ff-44f9-8cb4-41fbc90eaa41', 3, 'Article 32');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('806460a6-01ff-44f9-8cb4-41fbc90eaa41', '9a68c3f3-d7fe-4273-9d57-bb93227a71d9', 'Article 17 abolishes untouchability in any form and forbids its practice, making it an enforceable Fundamental Right violation.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bca8bcaf-bb5c-4a19-aecd-d3c9b0e939c4', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 8, 'The longest river entirely within India (by length) is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eff6d104-96b9-4110-9840-3c47ede6f61e', 'bca8bcaf-bb5c-4a19-aecd-d3c9b0e939c4', 0, 'Ganga');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4faed6b6-a4d5-4e24-bebe-ec5aad286621', 'bca8bcaf-bb5c-4a19-aecd-d3c9b0e939c4', 1, 'Godavari');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('975c8d31-ea98-4a8c-adc0-1de2e5718b81', 'bca8bcaf-bb5c-4a19-aecd-d3c9b0e939c4', 2, 'Yamuna');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f7a0673-faa9-441f-b279-bf1d28249928', 'bca8bcaf-bb5c-4a19-aecd-d3c9b0e939c4', 3, 'Narmada');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bca8bcaf-bb5c-4a19-aecd-d3c9b0e939c4', 'eff6d104-96b9-4110-9840-3c47ede6f61e', 'The Ganga is the longest river flowing entirely within India, at roughly 2,525 km, originating at Gangotri and emptying into the Bay of Bengal.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0194407b-3e93-43e1-bbb8-181884c2bd41', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 9, 'The Tropic of Cancer does NOT pass through which of these Indian states?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef61fe76-afd7-463f-8bb0-b03065372866', '0194407b-3e93-43e1-bbb8-181884c2bd41', 0, 'Gujarat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f70a17ff-9a90-4fb2-bbd1-15657af2a057', '0194407b-3e93-43e1-bbb8-181884c2bd41', 1, 'Madhya Pradesh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c96b956-d6ee-4a34-a578-105b6750d505', '0194407b-3e93-43e1-bbb8-181884c2bd41', 2, 'Kerala');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('358c094e-aed2-413b-9aca-8c99def2c905', '0194407b-3e93-43e1-bbb8-181884c2bd41', 3, 'West Bengal');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0194407b-3e93-43e1-bbb8-181884c2bd41', '4c96b956-d6ee-4a34-a578-105b6750d505', 'The Tropic of Cancer passes through 8 Indian states (Gujarat, Rajasthan, MP, Chhattisgarh, Jharkhand, WB, Tripura, Mizoram) — Kerala, being near the southern tip of India, is well south of it.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6f31b123-0399-4b2e-b451-26280d385a2f', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 10, 'Who was the first Indian to receive the Bharat Ratna?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('56291dcd-bff1-4d61-ad0d-7f178cf6d1a1', '6f31b123-0399-4b2e-b451-26280d385a2f', 0, 'Jawaharlal Nehru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f63f9e3a-0f76-430f-9d96-4f431e206976', '6f31b123-0399-4b2e-b451-26280d385a2f', 1, 'C. Rajagopalachari');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2eaf08c7-1c77-4830-aca5-81e75ea13446', '6f31b123-0399-4b2e-b451-26280d385a2f', 2, 'Dr. S. Radhakrishnan');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05e02401-20ca-4cc8-b65e-dd143075d93e', '6f31b123-0399-4b2e-b451-26280d385a2f', 3, 'All three were awarded together in the inaugural year');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6f31b123-0399-4b2e-b451-26280d385a2f', '05e02401-20ca-4cc8-b65e-dd143075d93e', 'The Bharat Ratna was instituted in 1954, and its first three recipients — C. Rajagopalachari, Dr. S. Radhakrishnan, and C.V. Raman — were all awarded in the same inaugural year (1954).', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('41bf5391-b178-466e-ae77-5166d9213642', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 11, 'The Reserve Bank of India was nationalised in which year?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd5554d5-756c-438b-96f3-633b4d56389e', '41bf5391-b178-466e-ae77-5166d9213642', 0, '1935');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f78d798-b2bb-40e8-87b9-48d5834f745b', '41bf5391-b178-466e-ae77-5166d9213642', 1, '1949');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('537e813c-c1da-4b21-b1d5-b3bee8123435', '41bf5391-b178-466e-ae77-5166d9213642', 2, '1969');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d65647f-5643-4424-9460-766455babae1', '41bf5391-b178-466e-ae77-5166d9213642', 3, '1991');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('41bf5391-b178-466e-ae77-5166d9213642', '9f78d798-b2bb-40e8-87b9-48d5834f745b', 'The RBI was established in 1935 as a privately-owned institution under the RBI Act, 1934, and was subsequently nationalised in 1949, after independence.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e4f3d8d1-e842-47d6-a96d-446c3c058dfd', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 12, 'Which of the following best describes the primary role of NITI Aayog?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2385bc3-dd95-42c6-aed9-d6848ddfbb4d', 'e4f3d8d1-e842-47d6-a96d-446c3c058dfd', 0, 'A statutory body that allocates funds to states, replacing the Finance Commission');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b36698e-dc10-4fc9-aa8d-2961965a2fb7', 'e4f3d8d1-e842-47d6-a96d-446c3c058dfd', 1, 'A constitutional body responsible for conducting elections');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca4a9675-940a-4bf7-9351-09930981b6a1', 'e4f3d8d1-e842-47d6-a96d-446c3c058dfd', 2, 'A policy think tank of the Government of India that replaced the Planning Commission');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('362fb3a0-0077-4ac4-8bc4-0fcac7fc4449', 'e4f3d8d1-e842-47d6-a96d-446c3c058dfd', 3, 'A regulatory body for the banking sector');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e4f3d8d1-e842-47d6-a96d-446c3c058dfd', 'ca4a9675-940a-4bf7-9351-09930981b6a1', 'NITI Aayog (National Institution for Transforming India), formed in 2015, is a policy think tank that replaced the Planning Commission — it advises on policy but does not allocate funds directly the way the Planning Commission''s five-year plans did.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4ffda82b-32c1-40ee-9ef5-7e5476b58cda', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 13, 'India''s first indigenous aircraft carrier is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65cd7387-767f-45a6-99e3-d5a5adb0df28', '4ffda82b-32c1-40ee-9ef5-7e5476b58cda', 0, 'INS Vikramaditya');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a721158c-9202-4b9f-9990-5e6a901f34db', '4ffda82b-32c1-40ee-9ef5-7e5476b58cda', 1, 'INS Vikrant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09871d95-44e5-4b15-ac15-fcfd993a8a26', '4ffda82b-32c1-40ee-9ef5-7e5476b58cda', 2, 'INS Viraat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c21f3777-5932-4cb8-b94a-c1083e8eac5c', '4ffda82b-32c1-40ee-9ef5-7e5476b58cda', 3, 'INS Arihant');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4ffda82b-32c1-40ee-9ef5-7e5476b58cda', 'a721158c-9202-4b9f-9990-5e6a901f34db', 'INS Vikrant, commissioned in 2022, is India''s first indigenously designed and built aircraft carrier; INS Vikramaditya was acquired from Russia, and INS Arihant is a nuclear submarine, not a carrier.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bc10846f-8521-41ae-bed3-353967e5481d', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 14, 'DRDO stands for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ee30ce9-f6a9-4b9e-917f-f701bf001e05', 'bc10846f-8521-41ae-bed3-353967e5481d', 0, 'Defence Research and Development Organisation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1efccad-7910-4799-803a-3e78d5da2dfd', 'bc10846f-8521-41ae-bed3-353967e5481d', 1, 'Defence Rocket and Design Office');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('687f255f-c5aa-4744-8418-97a8fa8c3c4d', 'bc10846f-8521-41ae-bed3-353967e5481d', 2, 'Directorate of Research and Defence Operations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb950ad4-ba59-4571-b3a2-be37a77ba450', 'bc10846f-8521-41ae-bed3-353967e5481d', 3, 'Defence Regulatory and Development Office');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bc10846f-8521-41ae-bed3-353967e5481d', '9ee30ce9-f6a9-4b9e-917f-f701bf001e05', 'DRDO is the Defence Research and Development Organisation, India''s premier agency for military research and development, working closely with PSUs like HAL, BEL, and BDL on indigenous defence systems.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9956e360-f20d-491c-8101-7f33b51fa708', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 15, 'Which of the following is NOT a defence-sector Public Sector Undertaking in India?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f79f929-299e-45d7-9fe2-67eb39b56825', '9956e360-f20d-491c-8101-7f33b51fa708', 0, 'Bharat Electronics Limited (BEL)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ba17bb1-6cc1-4b73-8d31-a9c2e30f0091', '9956e360-f20d-491c-8101-7f33b51fa708', 1, 'Bharat Dynamics Limited (BDL)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('61af1890-e14f-495a-82d6-7133b3fcc052', '9956e360-f20d-491c-8101-7f33b51fa708', 2, 'Steel Authority of India Limited (SAIL)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c84b0095-e7f2-4297-9fb0-2b34f3b52695', '9956e360-f20d-491c-8101-7f33b51fa708', 3, 'Mazagon Dock Shipbuilders Limited (MDL)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9956e360-f20d-491c-8101-7f33b51fa708', '61af1890-e14f-495a-82d6-7133b3fcc052', 'SAIL is a steel-manufacturing PSU under the Ministry of Steel, unrelated to defence production. BEL, BDL, and MDL are all defence-sector PSUs (electronics, guided missiles, and shipbuilding respectively).', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4fdcfdae-cfd1-48d7-840a-a37711f10fc7', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 16, 'The headquarters of the International Court of Justice is located at:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93f85d0a-c687-402d-b115-e47c6d716fe4', '4fdcfdae-cfd1-48d7-840a-a37711f10fc7', 0, 'Geneva');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('baab7214-43db-4def-9cbe-99e53ce7e730', '4fdcfdae-cfd1-48d7-840a-a37711f10fc7', 1, 'New York');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f0b802b-7115-429d-8ba3-5a282819a60a', '4fdcfdae-cfd1-48d7-840a-a37711f10fc7', 2, 'The Hague');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99b706aa-1cc1-45f6-9cf6-b64c381167d1', '4fdcfdae-cfd1-48d7-840a-a37711f10fc7', 3, 'Vienna');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4fdcfdae-cfd1-48d7-840a-a37711f10fc7', '9f0b802b-7115-429d-8ba3-5a282819a60a', 'The International Court of Justice, the principal judicial organ of the United Nations, is headquartered at the Peace Palace in The Hague, Netherlands.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f680c7dc-76d0-449c-aa53-63ae30f31867', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 17, '''Ashtadhyayi'', a foundational work on Sanskrit grammar, was authored by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac43ecb2-d72e-4d1d-a15b-876280ba5d82', 'f680c7dc-76d0-449c-aa53-63ae30f31867', 0, 'Kalidasa');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6114382c-d2a3-4a61-8ae9-221989997ed8', 'f680c7dc-76d0-449c-aa53-63ae30f31867', 1, 'Panini');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d4f20f3-5bf9-4edf-8f93-749d7c851d01', 'f680c7dc-76d0-449c-aa53-63ae30f31867', 2, 'Chanakya');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f846d3a-40fd-482a-b578-0451a5c82830', 'f680c7dc-76d0-449c-aa53-63ae30f31867', 3, 'Bhasa');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f680c7dc-76d0-449c-aa53-63ae30f31867', '6114382c-d2a3-4a61-8ae9-221989997ed8', 'The Ashtadhyayi is a treatise on Sanskrit grammar composed by the ancient grammarian Panini, considered one of the earliest known works of descriptive linguistics.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('51d5c0ee-b094-4ad0-bd8e-6c3329e0a8ff', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 18, 'The Battle of Plassey (1757), which established British political power in India, was fought in the present-day state of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a44090e8-1fdc-47d6-b103-44c15fe16aa2', '51d5c0ee-b094-4ad0-bd8e-6c3329e0a8ff', 0, 'Bihar');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0fe1f502-529c-4abc-927a-6b73dd2885a2', '51d5c0ee-b094-4ad0-bd8e-6c3329e0a8ff', 1, 'West Bengal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84334686-3ae0-47d4-8e20-e88075637380', '51d5c0ee-b094-4ad0-bd8e-6c3329e0a8ff', 2, 'Odisha');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87bb989f-c498-4026-8524-e81b5ca04ceb', '51d5c0ee-b094-4ad0-bd8e-6c3329e0a8ff', 3, 'Jharkhand');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('51d5c0ee-b094-4ad0-bd8e-6c3329e0a8ff', '0fe1f502-529c-4abc-927a-6b73dd2885a2', 'The Battle of Plassey was fought in 1757 near Palashi, in present-day West Bengal, between the British East India Company and the Nawab of Bengal, Siraj-ud-Daulah — its outcome marked the start of British political dominance in India.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c021a82a-e73e-470a-b3c0-b00acbcda8b4', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 19, 'Which Five-Year Plan period is associated with the launch of India''s economic liberalisation reforms (LPG reforms)?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3fbc5262-da77-4b63-8de2-173b9fb19495', 'c021a82a-e73e-470a-b3c0-b00acbcda8b4', 0, 'Sixth Plan (1980-85)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e46e1565-88f9-4840-91fb-ad79c7232219', 'c021a82a-e73e-470a-b3c0-b00acbcda8b4', 1, 'Seventh Plan (1985-90)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa65503e-1d53-4bb8-b6d6-69954d05907a', 'c021a82a-e73e-470a-b3c0-b00acbcda8b4', 2, 'Eighth Plan (1992-97)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e8a93b3-d0f2-418c-8d27-4c8684030852', 'c021a82a-e73e-470a-b3c0-b00acbcda8b4', 3, 'Tenth Plan (2002-07)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c021a82a-e73e-470a-b3c0-b00acbcda8b4', 'fa65503e-1d53-4bb8-b6d6-69954d05907a', 'India''s Liberalisation-Privatisation-Globalisation (LPG) reforms began in 1991 under a new economic policy, and the Eighth Five-Year Plan (1992-97) was the first full plan period to be built around this liberalised framework.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5a6702dd-e851-478a-9f28-706479c33b85', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 20, 'The ''Make in India'' initiative was launched in which year?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00b76298-d65c-40e6-9e7e-26872a592755', '5a6702dd-e851-478a-9f28-706479c33b85', 0, '2012');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a05782e-05fa-4512-aa7c-0d53090df6bb', '5a6702dd-e851-478a-9f28-706479c33b85', 1, '2014');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('109feb69-9d49-4aa6-8025-77c27eca7409', '5a6702dd-e851-478a-9f28-706479c33b85', 2, '2016');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce07d0f2-e754-481c-ac82-ceddadb1c678', '5a6702dd-e851-478a-9f28-706479c33b85', 3, '2019');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5a6702dd-e851-478a-9f28-706479c33b85', '5a05782e-05fa-4512-aa7c-0d53090df6bb', 'The ''Make in India'' initiative, aimed at boosting domestic manufacturing (including defence manufacturing, directly relevant to HAL''s own indigenisation push), was launched in September 2014.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

-- ── Section: English & Reasoning (40 questions) ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('07e8f002-d81d-4de9-999c-6f91aa4a2c5d', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 21, 'Choose the option that correctly identifies the error in the sentence: ''Neither of the two engineers were available for the interview.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30e1ca5f-b8e5-4c77-9f3c-5cf48fc765b8', '07e8f002-d81d-4de9-999c-6f91aa4a2c5d', 0, '''Neither'' should be ''None''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c8db93a-fdf9-4a69-a7a0-f4b920906186', '07e8f002-d81d-4de9-999c-6f91aa4a2c5d', 1, '''were'' should be ''was''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e25a8fc8-9513-4af2-bd3f-8ed7975b02b1', '07e8f002-d81d-4de9-999c-6f91aa4a2c5d', 2, '''the two'' is redundant and should be removed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d84338b9-bb29-43fb-8731-b6dc624f18ab', '07e8f002-d81d-4de9-999c-6f91aa4a2c5d', 3, 'There is no error');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('07e8f002-d81d-4de9-999c-6f91aa4a2c5d', '7c8db93a-fdf9-4a69-a7a0-f4b920906186', '''Neither'' is a singular pronoun and takes a singular verb — the correct form is ''Neither of the two engineers WAS available.''', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c4484f24-9ca8-45d4-8bbd-8cda619b2c77', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 22, 'Fill in the blank: ''The committee ________ its decision after a lengthy discussion.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90692bb6-cc26-43dd-b0c5-f8648ba87527', 'c4484f24-9ca8-45d4-8bbd-8cda619b2c77', 0, 'have announced');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ec39eeb-95af-41fc-8393-dbac1606dd67', 'c4484f24-9ca8-45d4-8bbd-8cda619b2c77', 1, 'has announced');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18594ea0-66d4-42ba-ab8e-7e81b8db5ffb', 'c4484f24-9ca8-45d4-8bbd-8cda619b2c77', 2, 'having announce');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('286aea84-d53a-4e15-bace-20efaf0f0b04', 'c4484f24-9ca8-45d4-8bbd-8cda619b2c77', 3, 'had been announce');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c4484f24-9ca8-45d4-8bbd-8cda619b2c77', '6ec39eeb-95af-41fc-8393-dbac1606dd67', '''Committee'' is a collective noun treated as singular when acting as one unit — ''has announced'' (singular present-perfect) is grammatically correct.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8a41a717-796a-487c-af68-e02a5233db8a', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 23, 'Choose the correct synonym for ''Meticulous'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55a8f890-8ed6-4f4b-a966-c4f76324786e', '8a41a717-796a-487c-af68-e02a5233db8a', 0, 'Careless');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79271f1e-dbfb-4343-bff9-c819114445c9', '8a41a717-796a-487c-af68-e02a5233db8a', 1, 'Painstaking');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4cdc7d4-6122-465b-9c5c-509eb0cd50a5', '8a41a717-796a-487c-af68-e02a5233db8a', 2, 'Hasty');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('121b8833-b951-43ef-9e39-da7ba266abb8', '8a41a717-796a-487c-af68-e02a5233db8a', 3, 'Ambiguous');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8a41a717-796a-487c-af68-e02a5233db8a', '79271f1e-dbfb-4343-bff9-c819114445c9', '''Meticulous'' means showing great attention to detail; very careful and precise — ''Painstaking'' is the closest synonym among the options.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('08b41f42-3860-47f3-b797-a6ed4cacc9b1', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 24, 'Choose the correct antonym for ''Redundant'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f9f02e4-b480-4464-a23d-2e7ebded72fa', '08b41f42-3860-47f3-b797-a6ed4cacc9b1', 0, 'Excessive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24712c6b-3604-4ec3-a4d2-698a54825ccb', '08b41f42-3860-47f3-b797-a6ed4cacc9b1', 1, 'Essential');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d549e18b-c461-4bc5-b54f-a179a6f4336d', '08b41f42-3860-47f3-b797-a6ed4cacc9b1', 2, 'Repetitive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6123b1b-f771-4bd8-8d28-b8341385ea27', '08b41f42-3860-47f3-b797-a6ed4cacc9b1', 3, 'Superfluous');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('08b41f42-3860-47f3-b797-a6ed4cacc9b1', '24712c6b-3604-4ec3-a4d2-698a54825ccb', '''Redundant'' means no longer needed or unnecessary; its antonym is ''Essential'' (necessary/required).', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a29137d9-af51-45eb-b76f-232e0192f9c3', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 25, 'Identify the correctly punctuated sentence:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91f980f6-d9d1-4db8-9dbb-5ed270777ad3', 'a29137d9-af51-45eb-b76f-232e0192f9c3', 0, 'The engineer, who designed the bridge won an award.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65a3e204-e12f-4bb8-b61f-a6c26b54d068', 'a29137d9-af51-45eb-b76f-232e0192f9c3', 1, 'The engineer who designed the bridge, won an award.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd9258b9-1561-4e79-adba-91ca48daf55f', 'a29137d9-af51-45eb-b76f-232e0192f9c3', 2, 'The engineer who designed the bridge won an award.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2be655aa-6c43-4537-bdd8-25e75adb84cb', 'a29137d9-af51-45eb-b76f-232e0192f9c3', 3, 'The engineer, who designed the bridge, won an award.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a29137d9-af51-45eb-b76f-232e0192f9c3', '2be655aa-6c43-4537-bdd8-25e75adb84cb', '''Who designed the bridge'' is a non-restrictive (additional information) clause here since it''s describing a specific, already-identified engineer, so it should be set off by commas on both sides: ''The engineer, who designed the bridge, won an award.''', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('68a98e31-538f-4fb1-8afa-73c1297eb7fc', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 26, 'Choose the word that best completes the sentence: ''Despite the heavy rain, the launch proceeded as scheduled, ________ the engineers'' concerns.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c80ed57-5a6d-4510-b717-e4c84e1301e5', '68a98e31-538f-4fb1-8afa-73c1297eb7fc', 0, 'contrary to');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6fb5e2d3-b6e4-43d1-b1f0-027fa6dd913f', '68a98e31-538f-4fb1-8afa-73c1297eb7fc', 1, 'in spite of');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e1f500a-3603-4809-9a72-e0dc5b647829', '68a98e31-538f-4fb1-8afa-73c1297eb7fc', 2, 'regardless of');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c5d2c12-7a2f-4ef9-89d6-5e72c2849d5c', '68a98e31-538f-4fb1-8afa-73c1297eb7fc', 3, 'All three are grammatically acceptable here');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('68a98e31-538f-4fb1-8afa-73c1297eb7fc', '9c5d2c12-7a2f-4ef9-89d6-5e72c2849d5c', '''Contrary to'', ''in spite of'', and ''regardless of'' are all grammatically valid transitional phrases meaning ''despite/without regard for'' in this context — the sentence''s meaning holds with any of them.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('875fecd4-1395-4249-964f-d83c3e9a3022', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 27, 'Choose the correctly spelled word:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7cb5922e-7f86-4f36-a255-b92b614c8464', '875fecd4-1395-4249-964f-d83c3e9a3022', 0, 'Occassion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07849ea5-03ee-48cc-a776-7eeda5a86ce4', '875fecd4-1395-4249-964f-d83c3e9a3022', 1, 'Ocassion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68d6007a-3ab6-4fb3-af77-1ef0be1c26a4', '875fecd4-1395-4249-964f-d83c3e9a3022', 2, 'Occasion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f58a339-df7c-4c70-8a7e-a65b59a2642c', '875fecd4-1395-4249-964f-d83c3e9a3022', 3, 'Occasoin');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('875fecd4-1395-4249-964f-d83c3e9a3022', '68d6007a-3ab6-4fb3-af77-1ef0be1c26a4', '''Occasion'' is the correct spelling — it has a double ''c'' but a single ''s''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('90051792-d0b0-46d5-b0ce-3e1301d6ac8e', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 28, 'Identify the part of speech of the underlined word: ''The engineer worked METICULOUSLY on the circuit design.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbad9300-0f77-4bb6-b83c-c327ed637ef3', '90051792-d0b0-46d5-b0ce-3e1301d6ac8e', 0, 'Adjective');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4fbce381-5121-4daf-9041-89291c3e5cc2', '90051792-d0b0-46d5-b0ce-3e1301d6ac8e', 1, 'Adverb');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7f42f00-bf40-428c-b7d7-4afc5bcf083b', '90051792-d0b0-46d5-b0ce-3e1301d6ac8e', 2, 'Noun');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df32e7bc-7e97-45ea-8b8f-eb36cb4df445', '90051792-d0b0-46d5-b0ce-3e1301d6ac8e', 3, 'Verb');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('90051792-d0b0-46d5-b0ce-3e1301d6ac8e', '4fbce381-5121-4daf-9041-89291c3e5cc2', '''Meticulously'' modifies the verb ''worked'', describing HOW the engineer worked — words ending in ''-ly'' that modify verbs are adverbs.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fdbbbeeb-bfdc-49e4-aaa9-41faed9062ee', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 29, 'Choose the option with the correct active voice for: ''The report was submitted by the trainee.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ac899fb-739a-4aad-ba4c-0dfb05ced811', 'fdbbbeeb-bfdc-49e4-aaa9-41faed9062ee', 0, 'The trainee submits the report.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf0c8660-20d5-49f5-a01f-cc2fe7cfca5e', 'fdbbbeeb-bfdc-49e4-aaa9-41faed9062ee', 1, 'The trainee submitted the report.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0823206-a0da-49d7-b4a7-3d19cc77ffff', 'fdbbbeeb-bfdc-49e4-aaa9-41faed9062ee', 2, 'The trainee has submitted the report.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd139b45-5a77-49b8-aacd-263754959207', 'fdbbbeeb-bfdc-49e4-aaa9-41faed9062ee', 3, 'The trainee was submitting the report.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fdbbbeeb-bfdc-49e4-aaa9-41faed9062ee', 'cf0c8660-20d5-49f5-a01f-cc2fe7cfca5e', 'The original sentence is in simple past passive voice (''was submitted'') — its correct active-voice equivalent is simple past active: ''The trainee submitted the report.''', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e6d8c870-b19d-4b33-8765-da98b8cadf71', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 30, 'Choose the correct idiom to complete: ''After months of preparation, the team finally managed to ________ and launch the product on time.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e690705-6e4e-4bf9-996f-ffd0c2e4b248', 'e6d8c870-b19d-4b33-8765-da98b8cadf71', 0, 'cut corners');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4c063fb-5c2b-434c-9759-10f2842b48b2', 'e6d8c870-b19d-4b33-8765-da98b8cadf71', 1, 'get their act together');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b93031a7-6fb4-411b-94cf-2d16a8e0bfaa', 'e6d8c870-b19d-4b33-8765-da98b8cadf71', 2, 'beat around the bush');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('682d168c-1afa-49e7-b1cc-3209064e0399', 'e6d8c870-b19d-4b33-8765-da98b8cadf71', 3, 'let the cat out of the bag');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e6d8c870-b19d-4b33-8765-da98b8cadf71', 'e4c063fb-5c2b-434c-9759-10f2842b48b2', '''Get their act together'' means to organise oneself effectively to achieve a goal, which fits the context of successfully preparing for and executing a launch.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6fd627c8-a476-41b5-b510-16a6f3013c3d', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 31, 'Select the option that is nearest in meaning to ''Ubiquitous'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e1c9bad-2c18-4ef5-94ff-a1cd50f20000', '6fd627c8-a476-41b5-b510-16a6f3013c3d', 0, 'Rare');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a23d7426-d634-48fc-a94d-a8f101d3e1ca', '6fd627c8-a476-41b5-b510-16a6f3013c3d', 1, 'Omnipresent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a788b4f6-5ece-43a6-aa4a-23a85d9ba5e1', '6fd627c8-a476-41b5-b510-16a6f3013c3d', 2, 'Ambiguous');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d99c5ac9-0114-4913-b449-3730e568d9dc', '6fd627c8-a476-41b5-b510-16a6f3013c3d', 3, 'Obsolete');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6fd627c8-a476-41b5-b510-16a6f3013c3d', 'a23d7426-d634-48fc-a94d-a8f101d3e1ca', '''Ubiquitous'' means present, appearing, or found everywhere — ''Omnipresent'' carries the same meaning.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cb59f589-515f-4756-8a3d-9d9bc8bf632e', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 32, 'Choose the correctly formed sentence:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48664193-5cff-4bf8-925b-8a4f756167ff', 'cb59f589-515f-4756-8a3d-9d9bc8bf632e', 0, 'Each of the candidates have submitted their application.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d767210-3dfa-4f13-928a-b74866d9486e', 'cb59f589-515f-4756-8a3d-9d9bc8bf632e', 1, 'Each of the candidates has submitted his or her application.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3aecf21e-4e93-40df-bb1e-0fa0a1e04338', 'cb59f589-515f-4756-8a3d-9d9bc8bf632e', 2, 'Each of the candidate have submit their application.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a8b926b-915c-4ff2-8daa-a28709c967fd', 'cb59f589-515f-4756-8a3d-9d9bc8bf632e', 3, 'Each of the candidates has submit their applications.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cb59f589-515f-4756-8a3d-9d9bc8bf632e', '4d767210-3dfa-4f13-928a-b74866d9486e', '''Each'' is singular and takes a singular verb (''has submitted''); traditionally, formal usage pairs it with a singular pronoun (''his or her'') rather than ''their'', though usage conventions vary — option B is the only one that is both grammatically consistent and singular throughout.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c0e24d3a-1b39-4320-8da9-741f713d2e1a', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 33, 'Fill in the blank with the correct preposition: ''The transformer is responsible ________ stepping down the voltage.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1838f1b1-54f7-4cd0-bcca-b5170c56d42a', 'c0e24d3a-1b39-4320-8da9-741f713d2e1a', 0, 'of');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('433db2f7-232b-4c0e-8862-36a978708752', 'c0e24d3a-1b39-4320-8da9-741f713d2e1a', 1, 'for');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97741a92-5404-4603-937e-5aba8b89c425', 'c0e24d3a-1b39-4320-8da9-741f713d2e1a', 2, 'with');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b752e13d-da96-4ee3-ad3a-438abe2fa6c0', 'c0e24d3a-1b39-4320-8da9-741f713d2e1a', 3, 'to');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c0e24d3a-1b39-4320-8da9-741f713d2e1a', '433db2f7-232b-4c0e-8862-36a978708752', 'The idiomatic preposition following ''responsible'' when describing a function or duty is ''for'' — ''responsible for [doing something]''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5b4e8a46-a61f-4ee8-9fcb-6f97f1797e52', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 34, 'Choose the option that correctly converts the sentence into reported (indirect) speech: He said, ''I will complete the project by Friday.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87540d0a-6463-4890-bfb0-4181ddd67446', '5b4e8a46-a61f-4ee8-9fcb-6f97f1797e52', 0, 'He said that he will complete the project by Friday.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('299c16b0-66b9-4516-bf22-e986292581a7', '5b4e8a46-a61f-4ee8-9fcb-6f97f1797e52', 1, 'He said that he would complete the project by Friday.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a2a2bd8-d572-43af-bec0-9ccb59a9f30f', '5b4e8a46-a61f-4ee8-9fcb-6f97f1797e52', 2, 'He said that he completes the project by Friday.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7a95f66-3179-47d4-a0fc-021561364866', '5b4e8a46-a61f-4ee8-9fcb-6f97f1797e52', 3, 'He said that he is completing the project by Friday.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5b4e8a46-a61f-4ee8-9fcb-6f97f1797e52', '299c16b0-66b9-4516-bf22-e986292581a7', 'In reported speech, when the reporting verb (''said'') is in the past tense, ''will'' shifts back to ''would'' — hence ''he WOULD complete the project by Friday.''', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('14fdc59c-0899-43e4-b5f2-499d7e62ce11', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 35, 'Identify the correctly spelled word among the options:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5aa4247-35fc-4551-b9d0-54f0f82f094f', '14fdc59c-0899-43e4-b5f2-499d7e62ce11', 0, 'Maintainance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('468d0bea-1209-44e6-a2a8-5dad22b6343e', '14fdc59c-0899-43e4-b5f2-499d7e62ce11', 1, 'Maintenance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c094fb42-93a4-49c6-8295-a136e2e9c63a', '14fdc59c-0899-43e4-b5f2-499d7e62ce11', 2, 'Maintenence');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd986157-1761-4449-b016-0d1d1c059e2a', '14fdc59c-0899-43e4-b5f2-499d7e62ce11', 3, 'Maintainence');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('14fdc59c-0899-43e4-b5f2-499d7e62ce11', '468d0bea-1209-44e6-a2a8-5dad22b6343e', '''Maintenance'' is the correct spelling.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e0036877-2fdf-4060-9fd3-5caeb646245b', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 36, 'Identify the sentence with the correct subject-verb agreement:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5102fc7f-fd43-4113-8561-65c4a0f657a0', 'e0036877-2fdf-4060-9fd3-5caeb646245b', 0, 'The number of applicants have increased this year.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('623f9274-a7d7-4331-9f6c-a86cd3176a88', 'e0036877-2fdf-4060-9fd3-5caeb646245b', 1, 'The number of applicants has increased this year.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('addf7f88-1407-4045-85cf-80a977d6c37a', 'e0036877-2fdf-4060-9fd3-5caeb646245b', 2, 'A number of applicants has applied for the post.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('546a0143-2669-4761-9ee5-7456cf10080c', 'e0036877-2fdf-4060-9fd3-5caeb646245b', 3, 'A number of applicant have applied for the post.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e0036877-2fdf-4060-9fd3-5caeb646245b', '623f9274-a7d7-4331-9f6c-a86cd3176a88', '''The number of'' takes a singular verb (''has increased''), while ''A number of'' (meaning ''several'') takes a plural verb — so ''The number of applicants HAS increased'' is correct, distinguishing it from the reversed pattern in the other options.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9729f877-04b8-4536-9a6a-aa5af17c14ce', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 37, 'Choose the word closest in meaning to ''Feasible'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98853383-27dd-4f98-ad5f-d4d1bb987233', '9729f877-04b8-4536-9a6a-aa5af17c14ce', 0, 'Impossible');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a4cc87b-3609-4c40-b4ae-5036ecb19fcc', '9729f877-04b8-4536-9a6a-aa5af17c14ce', 1, 'Practicable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f51afdd1-e50d-4a8c-ad5d-b6407ca8ebfa', '9729f877-04b8-4536-9a6a-aa5af17c14ce', 2, 'Theoretical');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c29ed00-dad6-4066-8d67-1d18711f6c2e', '9729f877-04b8-4536-9a6a-aa5af17c14ce', 3, 'Unlikely');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9729f877-04b8-4536-9a6a-aa5af17c14ce', '1a4cc87b-3609-4c40-b4ae-5036ecb19fcc', '''Feasible'' means capable of being done or carried out; possible — ''Practicable'' (able to be put into practice) is the closest synonym.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('12530e5b-c25f-4288-bb77-1f88db74443a', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 38, 'Choose the correct sentence:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b2a9061-1350-4848-b814-a90bb6329880', '12530e5b-c25f-4288-bb77-1f88db74443a', 0, 'Between you and I, the design has a flaw.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9723b742-0709-4a2b-9d53-6122cf3210f0', '12530e5b-c25f-4288-bb77-1f88db74443a', 1, 'Between you and me, the design has a flaw.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b44a40b-0895-4e70-9872-8ce37fc5e3b4', '12530e5b-c25f-4288-bb77-1f88db74443a', 2, 'Between you and myself, the design has a flaw.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a0f6995-fcb5-4c84-a371-a65eb54e9c19', '12530e5b-c25f-4288-bb77-1f88db74443a', 3, 'Between I and you, the design has a flaw.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('12530e5b-c25f-4288-bb77-1f88db74443a', '9723b742-0709-4a2b-9d53-6122cf3210f0', '''Between'' is a preposition, and prepositions take the objective case of pronouns — ''me'' (not ''I'') — so ''Between you and me'' is correct.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e90f1c7b-96ae-4d79-84f3-b510c7392db9', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 39, 'Choose the correctly punctuated sentence for a list:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3be362e6-6655-41b3-832c-6f1460da46c0', 'e90f1c7b-96ae-4d79-84f3-b510c7392db9', 0, 'The kit includes a multimeter, a soldering iron and, a set of resistors.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9310b179-e3f2-4f56-9955-8099ccabe6a8', 'e90f1c7b-96ae-4d79-84f3-b510c7392db9', 1, 'The kit includes a multimeter a soldering iron and a set of resistors.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('000e615e-d9e8-40b6-9544-33bc838104d7', 'e90f1c7b-96ae-4d79-84f3-b510c7392db9', 2, 'The kit includes a multimeter, a soldering iron, and a set of resistors.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9624cf2e-fe9a-408a-88f3-cf56143ee574', 'e90f1c7b-96ae-4d79-84f3-b510c7392db9', 3, 'The kit includes; a multimeter, a soldering iron, a set of resistors.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e90f1c7b-96ae-4d79-84f3-b510c7392db9', '000e615e-d9e8-40b6-9544-33bc838104d7', 'A comma should separate each item in a list, including before the final conjunction (''a soldering iron, and a set of resistors'') — this is the standard, unambiguous list-punctuation form.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8233bcca-a1d2-4c9e-8392-5a243287ae2c', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 40, 'Choose the option nearest in meaning to the idiom ''to shelve a project'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1cc15c66-17f1-4395-a67e-581adec8b2e4', '8233bcca-a1d2-4c9e-8392-5a243287ae2c', 0, 'To complete a project urgently');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0648127c-eb84-4952-8017-54af8943779b', '8233bcca-a1d2-4c9e-8392-5a243287ae2c', 1, 'To postpone or set aside a project indefinitely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ccc503a6-4057-4e14-b9a0-da8e913a0466', '8233bcca-a1d2-4c9e-8392-5a243287ae2c', 2, 'To publicly announce a project');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65a95dee-9a32-444c-a818-b171f75a8aa5', '8233bcca-a1d2-4c9e-8392-5a243287ae2c', 3, 'To assign a project to a new team');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8233bcca-a1d2-4c9e-8392-5a243287ae2c', '0648127c-eb84-4952-8017-54af8943779b', '''To shelve'' something means to postpone or decide not to proceed with it for the time being — ''to set aside a project indefinitely'' captures this meaning.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d3cd9f84-7978-4829-a539-75ceb12b6872', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 41, 'Statements: All engineers are professionals. Some professionals are managers. Conclusions: I. Some engineers are managers. II. All professionals are engineers. Which conclusion(s) logically follow?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0bc6e9f9-385a-4384-b670-5b6ae81721b4', 'd3cd9f84-7978-4829-a539-75ceb12b6872', 0, 'Only I follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d1136d6-f26e-4740-b655-60f239182339', 'd3cd9f84-7978-4829-a539-75ceb12b6872', 1, 'Only II follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19557b57-6f6d-4a04-87d5-645bb058c6af', 'd3cd9f84-7978-4829-a539-75ceb12b6872', 2, 'Both I and II follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ecb3b19-6013-4892-87ef-4b6f146bad41', 'd3cd9f84-7978-4829-a539-75ceb12b6872', 3, 'Neither I nor II follows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d3cd9f84-7978-4829-a539-75ceb12b6872', '2ecb3b19-6013-4892-87ef-4b6f146bad41', 'From ''All engineers are professionals'' and ''Some professionals are managers'', we cannot conclude that any engineers specifically are managers (the ''some managers'' among professionals may not overlap with the engineer subset) — so I does not necessarily follow. II reverses the first statement''s direction incorrectly (''all professionals are engineers'' is not given). Neither conclusion follows with certainty.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f3cafb49-f69e-4f05-ad52-c5d389d25096', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 42, 'If in a certain code, ''CIRCUIT'' is written as ''DJSDVJU'', how is ''RESISTOR'' written in that code?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ca29549-ef88-4ede-9efe-9901c3814464', 'f3cafb49-f69e-4f05-ad52-c5d389d25096', 0, 'SFTJTUPS');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65d74542-9291-4410-b5df-fd3ad949de39', 'f3cafb49-f69e-4f05-ad52-c5d389d25096', 1, 'SFTJTUPT');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d8e6802-e2e9-468b-968e-e29d36ed7cd0', 'f3cafb49-f69e-4f05-ad52-c5d389d25096', 2, 'SFTIJTUPS');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('166e013e-05a3-4522-a493-9f89f6bf596f', 'f3cafb49-f69e-4f05-ad52-c5d389d25096', 3, 'SFTJUTPS');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f3cafb49-f69e-4f05-ad52-c5d389d25096', '4ca29549-ef88-4ede-9efe-9901c3814464', 'Each letter in the code is shifted forward by 1 in the alphabet (C→D, I→J, R→S, ...). Applying this to RESISTOR: R→S, E→F, S→T, I→J, S→T, T→U, O→P, R→S, giving ''SFTJTUPS''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0689d466-117d-4f89-a707-1aaeab31b784', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 43, 'Find the next number in the series: 2, 6, 12, 20, 30, ?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0812d7d0-e297-4688-854f-dc3b89edd6cf', '0689d466-117d-4f89-a707-1aaeab31b784', 0, '36');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24a10f19-d62b-4bc5-aa11-b2d318ccbe23', '0689d466-117d-4f89-a707-1aaeab31b784', 1, '40');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe372316-0e1f-41b6-ada7-40e1250c6970', '0689d466-117d-4f89-a707-1aaeab31b784', 2, '42');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2fc6efbd-ab40-456d-99e0-dc301f0d5b9d', '0689d466-117d-4f89-a707-1aaeab31b784', 3, '44');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0689d466-117d-4f89-a707-1aaeab31b784', 'fe372316-0e1f-41b6-ada7-40e1250c6970', 'The differences between consecutive terms are 4, 6, 8, 10, 12 (increasing by 2 each time). 30 + 12 = 42, so the next term is 42. (This is also the pattern n×(n+1): 1×2=2, 2×3=6, 3×4=12, 4×5=20, 5×6=30, 6×7=42.)', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5b48fe6c-8e51-4939-ab5a-e7feaeddca1f', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 44, 'Choose the odd one out: Transformer, Alternator, Rectifier, Ammeter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8fde7e42-c60e-4664-967e-303407b9561c', '5b48fe6c-8e51-4939-ab5a-e7feaeddca1f', 0, 'Transformer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('adf737cb-eae8-4832-a259-697f1ed19529', '5b48fe6c-8e51-4939-ab5a-e7feaeddca1f', 1, 'Alternator');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08c8bce4-0d45-403e-8a5e-5df5bdec1854', '5b48fe6c-8e51-4939-ab5a-e7feaeddca1f', 2, 'Rectifier');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48547705-595d-4230-af66-af1699d11931', '5b48fe6c-8e51-4939-ab5a-e7feaeddca1f', 3, 'Ammeter');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5b48fe6c-8e51-4939-ab5a-e7feaeddca1f', '48547705-595d-4230-af66-af1699d11931', 'Transformer, Alternator, and Rectifier are all power-conversion devices (voltage transformation, AC generation, AC-to-DC conversion respectively); Ammeter is a measuring instrument, not a power-conversion device — it is the odd one out.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('edddd326-47d5-4c45-a797-a6a774c5a612', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 45, 'Five people P, Q, R, S, T sit in a row facing the same direction. R sits second from the left end. P and T are not at either end. P is not adjacent to S. How many distinct seating arrangements are possible for this row (given only these constraints, positions numbered 1-5 from the left)?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38a1e7ba-b62e-44ab-ae20-89ce91a24fc1', 'edddd326-47d5-4c45-a797-a6a774c5a612', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a03d2879-3755-4091-acec-9fb011a251c3', 'edddd326-47d5-4c45-a797-a6a774c5a612', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a17175c-db07-470e-8397-db80a14de42f', 'edddd326-47d5-4c45-a797-a6a774c5a612', 2, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b3e8327-00c9-4b0a-b0bc-52ceb3802014', 'edddd326-47d5-4c45-a797-a6a774c5a612', 3, '4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('edddd326-47d5-4c45-a797-a6a774c5a612', 'a03d2879-3755-4091-acec-9fb011a251c3', 'R is fixed at position 2. Positions 1 and 5 (the ends) must be filled by Q and S (since P and T cannot be at either end). This leaves P and T for positions 3 and 4, with the constraint that P is not adjacent to S. Testing both Q/S end-arrangements against the P-not-adjacent-to-S constraint yields exactly 2 valid arrangements.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ce0eb48c-6414-4c7e-95d1-620972620dd7', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 46, 'If ''A + B'' means ''A is the father of B'', ''A − B'' means ''A is the mother of B'', and ''A × B'' means ''A is the sibling of B'', what does ''P + Q × R'' establish?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb0b5e32-5a0e-4a17-ba07-5d0a5a444173', 'ce0eb48c-6414-4c7e-95d1-620972620dd7', 0, 'P is the father of R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('600beabf-3612-4318-9f50-659559be53e3', 'ce0eb48c-6414-4c7e-95d1-620972620dd7', 1, 'P is the grandfather of R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('665bd73d-c90c-49f4-bbe3-4f5298b21f72', 'ce0eb48c-6414-4c7e-95d1-620972620dd7', 2, 'P is the father of Q, and Q is the sibling of R (so P is R''s father too, if R is Q''s sibling by blood)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b39d476-d97f-4bed-9723-28acc05d2497', 'ce0eb48c-6414-4c7e-95d1-620972620dd7', 3, 'P is unrelated to R');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ce0eb48c-6414-4c7e-95d1-620972620dd7', '665bd73d-c90c-49f4-bbe3-4f5298b21f72', '''P + Q'' means P is the father of Q. ''Q × R'' means Q is the sibling of R. Since P is Q''s father and Q and R are siblings, P is also R''s father (assuming siblings share the same father) — the relationship chain establishes this jointly, matching option C''s full statement.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5a85012e-42a9-44fd-b9cf-54c1cad96521', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 47, 'Complete the analogy: Ohm''s Law is to Voltage-Current-Resistance as Newton''s Second Law is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('355cf640-65cc-405e-a892-0aeac299e9b4', '5a85012e-42a9-44fd-b9cf-54c1cad96521', 0, 'Force-Mass-Acceleration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dece3b26-d5a3-406d-bdf9-9a9657594549', '5a85012e-42a9-44fd-b9cf-54c1cad96521', 1, 'Energy-Work-Power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d0ceb97-3e0c-48e9-8552-ebe327424d4d', '5a85012e-42a9-44fd-b9cf-54c1cad96521', 2, 'Distance-Speed-Time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93a459cb-7441-4de2-8982-e449dcbbd3ba', '5a85012e-42a9-44fd-b9cf-54c1cad96521', 3, 'Mass-Weight-Gravity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5a85012e-42a9-44fd-b9cf-54c1cad96521', '355cf640-65cc-405e-a892-0aeac299e9b4', 'Ohm''s Law relates three electrical quantities (V = IR); Newton''s Second Law similarly relates three mechanical quantities via F = ma (Force-Mass-Acceleration) — the analogy is between a law and the three quantities it directly relates.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b3d7e9a3-a8d8-4601-a23c-e34e15f5f2f0', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 48, 'In a certain code, if ''MOTOR'' is coded as ''13-15-20-15-18'' (each letter replaced by its position in the alphabet), what is ''RELAY'' coded as?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e41a919-f9cd-4a0b-bd94-8a165054f941', 'b3d7e9a3-a8d8-4601-a23c-e34e15f5f2f0', 0, '18-5-12-1-25');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('493bb576-d264-45ea-9a66-28ac4a5cf234', 'b3d7e9a3-a8d8-4601-a23c-e34e15f5f2f0', 1, '18-5-11-1-25');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f8191da-ce8a-4cdf-a045-87d5554f1439', 'b3d7e9a3-a8d8-4601-a23c-e34e15f5f2f0', 2, '17-5-12-1-25');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c0b6bf0-a926-4f95-b009-2d6ce1027f7a', 'b3d7e9a3-a8d8-4601-a23c-e34e15f5f2f0', 3, '18-5-12-2-25');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b3d7e9a3-a8d8-4601-a23c-e34e15f5f2f0', '6e41a919-f9cd-4a0b-bd94-8a165054f941', 'R=18, E=5, L=12, A=1, Y=25 — matching each letter to its exact alphabetical position gives ''18-5-12-1-25''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('52298b11-6bcc-49fe-9f7c-65fd5e89613b', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 49, 'A is the brother of B. C is the mother of A. D is the father of C. How is B related to D?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a2f1dbc-d8b9-4db1-a6fa-d464d108aea6', '52298b11-6bcc-49fe-9f7c-65fd5e89613b', 0, 'Grandson/Granddaughter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9943962e-2e21-4606-a8f3-16a362ed8982', '52298b11-6bcc-49fe-9f7c-65fd5e89613b', 1, 'Son/Daughter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80dd23e6-0dec-4128-8c09-6299ad09a648', '52298b11-6bcc-49fe-9f7c-65fd5e89613b', 2, 'Nephew/Niece');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3fb30f15-89ad-420f-bfe2-fcffc692c66a', '52298b11-6bcc-49fe-9f7c-65fd5e89613b', 3, 'Cousin');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('52298b11-6bcc-49fe-9f7c-65fd5e89613b', '6a2f1dbc-d8b9-4db1-a6fa-d464d108aea6', 'C is A''s mother, so C is also B''s mother (A and B are siblings). D is C''s father, making D the grandfather of both A and B — so B is D''s grandson or granddaughter.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c2bd6b26-a6bc-4ad4-8b90-7e30479c83d8', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 50, 'Which figure logically completes the series (described): a circuit diagram sequence shows a resistor, then two resistors in series, then three resistors in series. Following this pattern, what would the fourth figure show?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f0c54a3-e746-484f-ab46-d4c72613654e', 'c2bd6b26-a6bc-4ad4-8b90-7e30479c83d8', 0, 'Four resistors in series');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c91fbdfe-8282-4eae-9440-d56939c919c1', 'c2bd6b26-a6bc-4ad4-8b90-7e30479c83d8', 1, 'Four resistors in parallel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d72a77d5-5468-4cad-81ac-34786a0a28cc', 'c2bd6b26-a6bc-4ad4-8b90-7e30479c83d8', 2, 'Two resistors in parallel and two in series');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('472bb52d-ccb6-4cc3-ac76-1f22c7025b16', 'c2bd6b26-a6bc-4ad4-8b90-7e30479c83d8', 3, 'A single resistor');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c2bd6b26-a6bc-4ad4-8b90-7e30479c83d8', '6f0c54a3-e746-484f-ab46-d4c72613654e', 'The series clearly adds one more resistor in series at each step (1, then 2, then 3 in series) — following the established pattern, the fourth figure logically shows four resistors in series.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('91a2c905-90de-42ae-aa57-0519cde0bf91', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 51, 'Statements: No cable is a wire. All wires are conductors. Conclusions: I. No cable is a conductor. II. Some conductors are wires. Which conclusion(s) follow?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5fa45304-5faa-44b2-b921-a76961f65283', '91a2c905-90de-42ae-aa57-0519cde0bf91', 0, 'Only I follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c74c34a0-b56f-4a58-9c13-d96c8df06a56', '91a2c905-90de-42ae-aa57-0519cde0bf91', 1, 'Only II follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4da745cb-7336-441a-8d3c-0e43c949df7b', '91a2c905-90de-42ae-aa57-0519cde0bf91', 2, 'Both follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f40eed0-18ea-47c0-b10b-11fb175028ea', '91a2c905-90de-42ae-aa57-0519cde0bf91', 3, 'Neither follows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('91a2c905-90de-42ae-aa57-0519cde0bf91', 'c74c34a0-b56f-4a58-9c13-d96c8df06a56', '''No cable is a wire'' and ''All wires are conductors'' does NOT imply ''no cable is a conductor'' (a cable could still be a conductor through some other category) — so I does not follow. ''All wires are conductors'' does directly imply ''Some conductors are wires'' (since wires exist and are a subset of conductors) — so II follows.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7d146414-fa3f-4532-8cf0-b047d085c8af', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 52, 'A clock shows 3:15. What is the angle between the hour and minute hands?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f5e52bb-1d60-4005-9de9-2f62c0bb97c8', '7d146414-fa3f-4532-8cf0-b047d085c8af', 0, '0°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd333be4-ba91-4aea-a91e-2871d797c888', '7d146414-fa3f-4532-8cf0-b047d085c8af', 1, '7.5°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75405197-2cd4-4a17-8487-f5b331935ae2', '7d146414-fa3f-4532-8cf0-b047d085c8af', 2, '5.5°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b2942ae-1597-4909-abf9-e31ef89f76a6', '7d146414-fa3f-4532-8cf0-b047d085c8af', 3, '15°');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7d146414-fa3f-4532-8cf0-b047d085c8af', 'fd333be4-ba91-4aea-a91e-2871d797c888', 'At 3:15, the minute hand is at the ''3'' position (90° from 12). The hour hand has moved 15/60 of the way from 3 to 4, i.e., 0.25 × 30° = 7.5° past the ''3'' position (97.5° from 12). The angle between them is 97.5° − 90° = 7.5°.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e460d2b1-1f70-4f3a-ab7d-427b43b0e4ba', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 53, 'Find the odd one out among the following number pairs, where each pair follows a common relationship except one: (4,16), (5,25), (6,35), (7,49)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a323f3ce-f647-4694-8c4b-b03b3bf3296a', 'e460d2b1-1f70-4f3a-ab7d-427b43b0e4ba', 0, '(4,16)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d9284ab-22c6-4edc-876c-ab950f185050', 'e460d2b1-1f70-4f3a-ab7d-427b43b0e4ba', 1, '(5,25)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0640a82c-ebfa-400a-91dc-65059fdb9c82', 'e460d2b1-1f70-4f3a-ab7d-427b43b0e4ba', 2, '(6,35)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0201371-4ae3-4dcf-98be-ecab8c7dfee6', 'e460d2b1-1f70-4f3a-ab7d-427b43b0e4ba', 3, '(7,49)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e460d2b1-1f70-4f3a-ab7d-427b43b0e4ba', '0640a82c-ebfa-400a-91dc-65059fdb9c82', 'In (4,16), (5,25), and (7,49), the second number is the square of the first (4²=16, 5²=25, 7²=49). In (6,35), 6²=36, not 35 — this pair breaks the pattern and is the odd one out.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3db6b326-cead-44e3-8193-4aa22b754d40', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 54, 'If South-East becomes North, North-East becomes West, then West becomes:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b69088e6-b955-4bb5-8955-dfc026e85ff2', '3db6b326-cead-44e3-8193-4aa22b754d40', 0, 'North-East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e256b828-b76f-4ea9-ac87-d354a2d5fb12', '3db6b326-cead-44e3-8193-4aa22b754d40', 1, 'South-East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69e7ac14-93a6-45d7-968e-3129e967ef96', '3db6b326-cead-44e3-8193-4aa22b754d40', 2, 'South-West');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b96e172f-99f6-4bea-992c-8243d505f8a0', '3db6b326-cead-44e3-8193-4aa22b754d40', 3, 'North-West');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3db6b326-cead-44e3-8193-4aa22b754d40', '69e7ac14-93a6-45d7-968e-3129e967ef96', 'The transformation is a 135° anticlockwise rotation of directions (SE→N is a 135° anticlockwise shift; NE→W confirms the same 135° anticlockwise shift). Applying the same 135° anticlockwise rotation to West gives South-West.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7137b97d-765d-4d48-9e34-b4ea340736d9', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 55, 'P is twice as efficient as Q. Working together, they complete a task in 8 days. How many days would Q alone take to complete the task?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28ed0fdf-b1ea-4b5a-9459-6d7ae2c9b8fe', '7137b97d-765d-4d48-9e34-b4ea340736d9', 0, '12 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('347e0cf5-0c57-40df-af43-05dfc96864ff', '7137b97d-765d-4d48-9e34-b4ea340736d9', 1, '16 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17da4a13-1116-4fec-8220-ce6bef2ed4c2', '7137b97d-765d-4d48-9e34-b4ea340736d9', 2, '24 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f803722e-078f-4eac-aeb6-b7ea67ff833d', '7137b97d-765d-4d48-9e34-b4ea340736d9', 3, '20 days');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7137b97d-765d-4d48-9e34-b4ea340736d9', '17da4a13-1116-4fec-8220-ce6bef2ed4c2', 'Let Q''s rate be r; P''s rate is 2r. Combined rate = 3r = 1/8 (task/day), so r = 1/24. Q alone, at rate r = 1/24, takes 24 days to complete the task.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('21c39c1d-14fe-4fbe-aa2c-260520dd659e', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 56, 'Choose the word that does NOT belong with the others: Voltmeter, Ammeter, Wattmeter, Capacitor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d90465c-300b-4d62-940b-541faadfff4c', '21c39c1d-14fe-4fbe-aa2c-260520dd659e', 0, 'Voltmeter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50a069ca-79e5-48ee-9f16-75bdaf41060d', '21c39c1d-14fe-4fbe-aa2c-260520dd659e', 1, 'Ammeter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7316fd04-1836-4712-9d0c-375ef2e0e251', '21c39c1d-14fe-4fbe-aa2c-260520dd659e', 2, 'Wattmeter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4f1ad43-b2c8-4c11-9fac-641d32ae1e98', '21c39c1d-14fe-4fbe-aa2c-260520dd659e', 3, 'Capacitor');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('21c39c1d-14fe-4fbe-aa2c-260520dd659e', 'a4f1ad43-b2c8-4c11-9fac-641d32ae1e98', 'Voltmeter, Ammeter, and Wattmeter are all measuring instruments (for voltage, current, and power respectively); a Capacitor is a passive energy-storage component, not a measuring instrument — it is the odd one out.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ccade7e5-986c-42fc-829f-8869357cc922', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 57, 'In a row of 40 students, Ravi is 12th from the left. What is his position from the right?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f166662c-8469-4e2f-abc2-14321f211560', 'ccade7e5-986c-42fc-829f-8869357cc922', 0, '27th');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7445de9-9224-4982-b2d5-da05c31f6f27', 'ccade7e5-986c-42fc-829f-8869357cc922', 1, '28th');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('faa26ac9-d01e-4016-ad68-cb777f62a0ba', 'ccade7e5-986c-42fc-829f-8869357cc922', 2, '29th');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c332b3f-8c96-4dde-b301-c2a7a733ea1a', 'ccade7e5-986c-42fc-829f-8869357cc922', 3, '30th');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ccade7e5-986c-42fc-829f-8869357cc922', 'faa26ac9-d01e-4016-ad68-cb777f62a0ba', 'Position from the right = (Total students − Position from left) + 1 = (40 − 12) + 1 = 29th from the right.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a5049391-6295-4bfc-aa9a-a16416b69e98', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 58, 'Which term logically completes the series: Resistor, Capacitor, Inductor, ?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('902e9403-1440-4bf8-95af-22de99b03a88', 'a5049391-6295-4bfc-aa9a-a16416b69e98', 0, 'Diode (an active/nonlinear device, breaking the passive-linear-component pattern)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ecaa065-c953-4996-a9a9-02fb30cd627c', 'a5049391-6295-4bfc-aa9a-a16416b69e98', 1, 'Transformer (a passive linear component, continuing the pattern)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f95f6124-499f-4742-a768-4f6e029cc1f0', 'a5049391-6295-4bfc-aa9a-a16416b69e98', 2, 'Transistor (an active device)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a9165e4-57e3-42d5-a02b-d07543fefc55', 'a5049391-6295-4bfc-aa9a-a16416b69e98', 3, 'Amplifier (an active circuit)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a5049391-6295-4bfc-aa9a-a16416b69e98', '0ecaa065-c953-4996-a9a9-02fb30cd627c', 'Resistor, Capacitor, and Inductor are all basic passive, linear circuit elements. A Transformer is also a passive, linear component (works via mutual inductance), continuing the pattern — the other options (Diode, Transistor, Amplifier) are active/nonlinear devices that break it.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d78ab0aa-40e7-49ff-b813-b6ec72a3e8d1', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 59, 'If the day before yesterday was Wednesday, what day will it be tomorrow?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac24cede-b620-4a08-a191-cd8d1b1237c0', 'd78ab0aa-40e7-49ff-b813-b6ec72a3e8d1', 0, 'Friday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b2d01cc-3ff8-4c8d-86a0-32262672da98', 'd78ab0aa-40e7-49ff-b813-b6ec72a3e8d1', 1, 'Saturday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2d3ac9c-9c17-41ae-8310-310d257af4ee', 'd78ab0aa-40e7-49ff-b813-b6ec72a3e8d1', 2, 'Sunday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('246584f1-21f7-4693-830f-180d182b0822', 'd78ab0aa-40e7-49ff-b813-b6ec72a3e8d1', 3, 'Monday');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d78ab0aa-40e7-49ff-b813-b6ec72a3e8d1', '1b2d01cc-3ff8-4c8d-86a0-32262672da98', 'If the day before yesterday was Wednesday, then yesterday was Thursday and today is Friday. Tomorrow, therefore, is Saturday.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1b08d9fd-0fab-479a-92e5-3645ab7be9cf', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 60, 'Statements: All transformers are electrical devices. Some electrical devices are expensive. Conclusion: Some transformers are expensive. Is this conclusion valid based strictly on the statements given?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7957d74b-2adf-4e29-84be-bdd931caf619', '1b08d9fd-0fab-479a-92e5-3645ab7be9cf', 0, 'Valid — it follows directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f5a83f3-d25b-418f-9438-94cd806a1af0', '1b08d9fd-0fab-479a-92e5-3645ab7be9cf', 1, 'Invalid — it does not necessarily follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa9aaff2-465d-41e9-867b-4b008f9ae4bc', '1b08d9fd-0fab-479a-92e5-3645ab7be9cf', 2, 'Valid only if all electrical devices are transformers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98168a85-65ca-4086-a17f-af5356330eb2', '1b08d9fd-0fab-479a-92e5-3645ab7be9cf', 3, 'Cannot be determined without additional numerical data');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1b08d9fd-0fab-479a-92e5-3645ab7be9cf', '8f5a83f3-d25b-418f-9438-94cd806a1af0', 'The statements establish that transformers are a subset of electrical devices, and some (unspecified) electrical devices are expensive — but there''s no guarantee the ''expensive'' subset overlaps with the ''transformer'' subset specifically. The conclusion does not necessarily follow from the given statements alone.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

-- ── Section: Electrical & Electronics Engineering (Discipline) (100 questions) ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('efce745f-4460-4c90-998b-2bc27a81de6e', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 61, 'In a series RLC circuit at resonance, the impedance of the circuit is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d261c5f3-6189-4d34-b8ce-db2b853b64b3', 'efce745f-4460-4c90-998b-2bc27a81de6e', 0, 'Maximum and purely inductive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e15da40b-9c22-4c99-8fa6-40d02e0ca5b7', 'efce745f-4460-4c90-998b-2bc27a81de6e', 1, 'Maximum and purely capacitive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23abcd89-d1cc-467b-8e8c-93036514b0f7', 'efce745f-4460-4c90-998b-2bc27a81de6e', 2, 'Minimum and purely resistive (equal to R)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e779bec8-8835-445a-92f9-ba88ed0dafad', 'efce745f-4460-4c90-998b-2bc27a81de6e', 3, 'Zero');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('efce745f-4460-4c90-998b-2bc27a81de6e', '23abcd89-d1cc-467b-8e8c-93036514b0f7', 'At resonance in a series RLC circuit, the inductive and capacitive reactances cancel each other out (XL = XC), leaving the impedance purely resistive and at its minimum value, equal to R.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3737ab8d-ac5e-4acb-b95b-2dff862be730', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 62, 'Two resistors of 6Ω and 3Ω are connected in parallel. The equivalent resistance is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f712e018-ed8d-4e71-be36-b314eee1de46', '3737ab8d-ac5e-4acb-b95b-2dff862be730', 0, '9Ω');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5ebdab5-5c58-4093-bed6-210698fa1255', '3737ab8d-ac5e-4acb-b95b-2dff862be730', 1, '2Ω');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aaab8454-a9fc-40d9-9e53-692553619b2b', '3737ab8d-ac5e-4acb-b95b-2dff862be730', 2, '4.5Ω');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('711d27db-bce4-4b53-9d0f-50f0e9b4d552', '3737ab8d-ac5e-4acb-b95b-2dff862be730', 3, '1.5Ω');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3737ab8d-ac5e-4acb-b95b-2dff862be730', 'a5ebdab5-5c58-4093-bed6-210698fa1255', 'For parallel resistors: 1/Req = 1/6 + 1/3 = 1/6 + 2/6 = 3/6 = 1/2, so Req = 2Ω.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ae65bcd0-ad41-4f64-a316-0d358462bee1', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 63, 'Thevenin''s theorem states that any linear bilateral network, as seen from two terminals, can be replaced by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21a8698c-a996-4a99-a79f-9836d7f0abdf', 'ae65bcd0-ad41-4f64-a316-0d358462bee1', 0, 'A current source in parallel with a resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7642e41-f892-448a-a607-96e063cf170e', 'ae65bcd0-ad41-4f64-a316-0d358462bee1', 1, 'A voltage source in series with a resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('858645c6-b783-4263-849d-21c08bb970aa', 'ae65bcd0-ad41-4f64-a316-0d358462bee1', 2, 'Two voltage sources in series');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1449c89-2943-4d9d-9535-72cdde212d33', 'ae65bcd0-ad41-4f64-a316-0d358462bee1', 3, 'A pure resistance only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ae65bcd0-ad41-4f64-a316-0d358462bee1', 'f7642e41-f892-448a-a607-96e063cf170e', 'Thevenin''s theorem replaces a linear network, as seen from two output terminals, with a single voltage source (Thevenin voltage) in series with a single resistance (Thevenin resistance).', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('72073690-8afa-442b-b9e8-917d6c1db3fc', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 64, 'Kirchhoff''s Current Law (KCL) is based on the conservation of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e85f58e9-882a-49c7-b6a3-033d15ff4e4b', '72073690-8afa-442b-b9e8-917d6c1db3fc', 0, 'Energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('985e6812-06e6-4353-9624-4c70f9fe8115', '72073690-8afa-442b-b9e8-917d6c1db3fc', 1, 'Charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8b5f0e1-f7a1-4075-92ee-4ba50697e478', '72073690-8afa-442b-b9e8-917d6c1db3fc', 2, 'Momentum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38392cfd-74d5-4b65-94b7-b055bbb06f5b', '72073690-8afa-442b-b9e8-917d6c1db3fc', 3, 'Voltage');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('72073690-8afa-442b-b9e8-917d6c1db3fc', '985e6812-06e6-4353-9624-4c70f9fe8115', 'KCL states that the algebraic sum of currents entering and leaving a node is zero, which is a direct consequence of the conservation of electric charge — charge cannot accumulate at a node under steady-state conditions.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('591e7a04-b38b-429b-8991-248480456e55', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 65, 'The Q-factor (quality factor) of a series RLC circuit is given by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44736d78-fa1a-4c2a-b7f1-8aca03928f41', '591e7a04-b38b-429b-8991-248480456e55', 0, 'Q = R / (ωL)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4ca58d9-6526-4601-a911-7087802076de', '591e7a04-b38b-429b-8991-248480456e55', 1, 'Q = (ωL) / R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c647ef13-0d64-4bf1-af8c-66f48e8a7bea', '591e7a04-b38b-429b-8991-248480456e55', 2, 'Q = R × ωL');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('696fb48f-9256-4134-855a-ecf8ee04f96c', '591e7a04-b38b-429b-8991-248480456e55', 3, 'Q = ωL × ωC');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('591e7a04-b38b-429b-8991-248480456e55', 'a4ca58d9-6526-4601-a911-7087802076de', 'For a series RLC circuit, the quality factor Q = (ωL)/R = (1/ωRC), representing the ratio of reactive power stored to resistive power dissipated at resonance — a higher Q means a sharper resonance peak.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c27acc6e-e99a-482f-9d4f-93fa34f00cdd', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 66, 'Superposition theorem is applicable to circuits that are:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('197b0b19-cf5d-4b1d-8488-9dd516fa184f', 'c27acc6e-e99a-482f-9d4f-93fa34f00cdd', 0, 'Linear and bilateral only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1efd8d1-52f8-4aaf-8980-878dcccd5f32', 'c27acc6e-e99a-482f-9d4f-93fa34f00cdd', 1, 'Nonlinear only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25e96e2b-8b00-45f7-a92c-978cc334d127', 'c27acc6e-e99a-482f-9d4f-93fa34f00cdd', 2, 'Linear (containing independent sources), regardless of bilaterality');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ffaf5a2c-5b85-40d0-afd1-9eaaa93e8091', 'c27acc6e-e99a-482f-9d4f-93fa34f00cdd', 3, 'Any circuit, including nonlinear ones');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c27acc6e-e99a-482f-9d4f-93fa34f00cdd', '25e96e2b-8b00-45f7-a92c-978cc334d127', 'The Superposition theorem applies to linear circuits with two or more independent sources — it analyzes the effect of each independent source separately (with others deactivated) and sums the results; it is not restricted to nonlinear circuits, which violate the linearity requirement entirely.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6a31be7c-8f87-4a5a-9dd9-7796b7f9cedb', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 67, 'In a purely capacitive AC circuit, the current:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('085b6d63-ed8a-4c74-b9c1-820a2bf87e27', '6a31be7c-8f87-4a5a-9dd9-7796b7f9cedb', 0, 'Lags the voltage by 90°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9579a812-e214-45a7-86eb-6d66ae202f84', '6a31be7c-8f87-4a5a-9dd9-7796b7f9cedb', 1, 'Leads the voltage by 90°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ddee4c4-2c12-4960-ba50-83e6fd38bacf', '6a31be7c-8f87-4a5a-9dd9-7796b7f9cedb', 2, 'Is in phase with the voltage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66e4e9b7-acf9-428c-8320-4c2942d6b8af', '6a31be7c-8f87-4a5a-9dd9-7796b7f9cedb', 3, 'Lags the voltage by 180°');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6a31be7c-8f87-4a5a-9dd9-7796b7f9cedb', '9579a812-e214-45a7-86eb-6d66ae202f84', 'In a purely capacitive circuit, current leads voltage by 90° — this is commonly remembered via the mnemonic ''ICE'' (in a Capacitor, current I leads voltage E).', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9a160de8-beab-47cd-a98a-4769d78b8f1e', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 68, 'The time constant of an RC charging circuit is defined as the time taken for the capacitor voltage to reach what fraction of its final steady-state value?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88e6505d-5d23-4520-8109-8c000f65d7ca', '9a160de8-beab-47cd-a98a-4769d78b8f1e', 0, '50%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd9fa062-ecac-45dc-a739-d1dc4e96c666', '9a160de8-beab-47cd-a98a-4769d78b8f1e', 1, '63.2%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ea2e74b-e35e-4f5e-823a-2dd231b9a5ec', '9a160de8-beab-47cd-a98a-4769d78b8f1e', 2, '90%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5eb41753-7a78-4dbc-9497-dc842938075d', '9a160de8-beab-47cd-a98a-4769d78b8f1e', 3, '100%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9a160de8-beab-47cd-a98a-4769d78b8f1e', 'fd9fa062-ecac-45dc-a739-d1dc4e96c666', 'The time constant τ = RC is defined as the time taken for the capacitor voltage to reach approximately 63.2% (1 − 1/e) of its final steady-state value during charging.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('97516428-f5d2-4794-92a2-dc215fab8600', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 69, 'Maximum power transfer from a source to a load occurs when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24d6104b-d06d-49b4-9641-b2aeff016c05', '97516428-f5d2-4794-92a2-dc215fab8600', 0, 'Load resistance is zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef2b3bc8-bf41-44e2-b7fb-871ff87767f3', '97516428-f5d2-4794-92a2-dc215fab8600', 1, 'Load resistance equals source (Thevenin) resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abb024f8-3010-4f5c-8bd8-d8f5f0379c57', '97516428-f5d2-4794-92a2-dc215fab8600', 2, 'Load resistance is infinite');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0524a7c7-604a-449d-b573-c8da712cd036', '97516428-f5d2-4794-92a2-dc215fab8600', 3, 'Load resistance is twice the source resistance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('97516428-f5d2-4794-92a2-dc215fab8600', 'ef2b3bc8-bf41-44e2-b7fb-871ff87767f3', 'The Maximum Power Transfer theorem states that maximum power is delivered to the load when the load resistance equals the Thevenin (source) resistance of the network supplying it.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('12912568-a1d1-49d9-b2dc-ca90510f40ed', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 70, 'A star-connected three-phase system has a line voltage of 400V. The phase voltage is approximately:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99784924-aef2-4a5b-8492-fa68b54fad76', '12912568-a1d1-49d9-b2dc-ca90510f40ed', 0, '400V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('260d6e54-a11c-439e-872d-cc59104fe564', '12912568-a1d1-49d9-b2dc-ca90510f40ed', 1, '231V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('283b28cd-3df6-41b4-8f5c-5d99b7688d66', '12912568-a1d1-49d9-b2dc-ca90510f40ed', 2, '692V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('983843a6-f855-4cbc-8e6a-60d96fba8d0c', '12912568-a1d1-49d9-b2dc-ca90510f40ed', 3, '133V');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('12912568-a1d1-49d9-b2dc-ca90510f40ed', '260d6e54-a11c-439e-872d-cc59104fe564', 'In a star connection, line voltage = √3 × phase voltage, so phase voltage = 400/√3 ≈ 231V.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('53baeeac-11c2-4fe3-bbfd-b41bbf3404b2', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 71, 'Norton''s theorem represents a linear network as seen from its terminals as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6e24175-163d-4e5f-87cb-2e98a2f3e64f', '53baeeac-11c2-4fe3-bbfd-b41bbf3404b2', 0, 'A voltage source in series with a resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be330f44-988a-4e6e-9e0f-a1e690598bc9', '53baeeac-11c2-4fe3-bbfd-b41bbf3404b2', 1, 'A current source in parallel with a resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3eb1589-d2ab-4be8-9f54-ec8c98f66568', '53baeeac-11c2-4fe3-bbfd-b41bbf3404b2', 2, 'A current source in series with a resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35d826db-8232-402d-86a2-0bd34ab6c973', '53baeeac-11c2-4fe3-bbfd-b41bbf3404b2', 3, 'Two current sources in parallel');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('53baeeac-11c2-4fe3-bbfd-b41bbf3404b2', 'be330f44-988a-4e6e-9e0f-a1e690598bc9', 'Norton''s theorem is the current-source dual of Thevenin''s theorem — it represents a linear network, as seen from two terminals, as a single current source (Norton current) in parallel with a resistance (Norton resistance, equal to the Thevenin resistance).', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('569ee68b-c350-4e3d-805c-faa9d8149fd5', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 72, 'The unit of electrical conductance is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54b7fc4d-b55a-4b94-8ece-d5924145c545', '569ee68b-c350-4e3d-805c-faa9d8149fd5', 0, 'Ohm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23f3a05c-b0e6-4bcb-8017-fb300d003274', '569ee68b-c350-4e3d-805c-faa9d8149fd5', 1, 'Siemens (mho)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08f5b2d3-c5f6-40d6-ae2f-a4351a39f1cb', '569ee68b-c350-4e3d-805c-faa9d8149fd5', 2, 'Farad');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62ef405b-fa9e-40fa-bbc6-e59c806a9396', '569ee68b-c350-4e3d-805c-faa9d8149fd5', 3, 'Henry');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('569ee68b-c350-4e3d-805c-faa9d8149fd5', '23f3a05c-b0e6-4bcb-8017-fb300d003274', 'Conductance (G), the reciprocal of resistance, is measured in Siemens (S), also historically called ''mho'' (ohm spelled backward).', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('67535a54-35b7-4f4d-a162-63fd1631da06', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 73, 'In a purely inductive AC circuit, the power factor is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1262c054-4d0a-4819-af4b-17fcc2ca990a', '67535a54-35b7-4f4d-a162-63fd1631da06', 0, '1 (unity)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76f2d2ee-ff90-464c-8294-fdb8f58f4ba1', '67535a54-35b7-4f4d-a162-63fd1631da06', 1, '0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0be38c0-40c9-4ffe-aaac-d7395f15c661', '67535a54-35b7-4f4d-a162-63fd1631da06', 2, '0.5 lagging');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19f3847a-0e77-47f8-a617-bec9fb7ed3ea', '67535a54-35b7-4f4d-a162-63fd1631da06', 3, '-1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('67535a54-35b7-4f4d-a162-63fd1631da06', '76f2d2ee-ff90-464c-8294-fdb8f58f4ba1', 'In a purely inductive circuit, current lags voltage by exactly 90°, so power factor = cos(90°) = 0 — no real (average) power is consumed; only reactive power flows.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6f9bdc60-af70-4aab-8f67-f4c6917e1099', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 74, 'Millman''s theorem is used to find the:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4fe61b73-f884-4f78-978c-85fc96ba2fd4', '6f9bdc60-af70-4aab-8f67-f4c6917e1099', 0, 'Total resistance of a series circuit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e32ecff1-0cee-47ed-ad6b-596eb1b494ed', '6f9bdc60-af70-4aab-8f67-f4c6917e1099', 1, 'Common voltage across several parallel branches with different sources');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23575abc-4da8-46e8-b363-4501aa54afd7', '6f9bdc60-af70-4aab-8f67-f4c6917e1099', 2, 'Resonant frequency of an RLC circuit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43b0a9cb-8954-4c7e-9bbb-5e7a9d96467f', '6f9bdc60-af70-4aab-8f67-f4c6917e1099', 3, 'Power dissipated in a resistor');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6f9bdc60-af70-4aab-8f67-f4c6917e1099', 'e32ecff1-0cee-47ed-ad6b-596eb1b494ed', 'Millman''s theorem provides a simplified method to find the common voltage (Millman voltage) across two or more parallel branches, each containing its own voltage source and series impedance, without full nodal analysis.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8718a395-c245-4149-af86-9e6b350fb872', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 75, 'Two capacitors of 4µF and 6µF are connected in series. The equivalent capacitance is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b872a7c6-d1e0-4204-9150-0754891daa90', '8718a395-c245-4149-af86-9e6b350fb872', 0, '10µF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa194f48-50be-4ea1-97c9-8dd262e96d4b', '8718a395-c245-4149-af86-9e6b350fb872', 1, '2.4µF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7af65fb1-a5cf-480e-84e8-39b718fec789', '8718a395-c245-4149-af86-9e6b350fb872', 2, '24µF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9834dacf-56be-4614-b4f1-50dd0600848c', '8718a395-c245-4149-af86-9e6b350fb872', 3, '1.2µF');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8718a395-c245-4149-af86-9e6b350fb872', 'fa194f48-50be-4ea1-97c9-8dd262e96d4b', 'For series capacitors: 1/Ceq = 1/4 + 1/6 = 3/12 + 2/12 = 5/12, so Ceq = 12/5 = 2.4µF.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('88796499-0db6-495d-9c5a-ce0523ed897b', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 76, 'The speed of a DC shunt motor can be increased by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6501a2ce-0d34-45c4-863f-c2507a15553f', '88796499-0db6-495d-9c5a-ce0523ed897b', 0, 'Increasing the field current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1e9513a-c85b-4f2c-aa43-a9f084a8b428', '88796499-0db6-495d-9c5a-ce0523ed897b', 1, 'Decreasing the field current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62dbbc4d-84a5-4ce1-903c-79e9811e6401', '88796499-0db6-495d-9c5a-ce0523ed897b', 2, 'Increasing the armature resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17d868c2-9937-48ab-b3e9-d6676668bbfe', '88796499-0db6-495d-9c5a-ce0523ed897b', 3, 'Decreasing the supply voltage');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('88796499-0db6-495d-9c5a-ce0523ed897b', 'a1e9513a-c85b-4f2c-aa43-a9f084a8b428', 'DC shunt motor speed is inversely related to field flux (N ∝ 1/Φ, approximately, for constant back-EMF) — decreasing the field current reduces the flux, which increases speed. This is the basis of ''field weakening control'' used for above-base-speed operation.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5d03d3ae-d5f1-4b1a-82c5-4591c83f82b8', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 77, 'The slip of an induction motor at synchronous speed is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('559f73d9-ff92-412f-be8e-ce4a39c2b73a', '5d03d3ae-d5f1-4b1a-82c5-4591c83f82b8', 0, '1 (100%)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b08e81a8-45b7-41ef-bba1-59d64317fa45', '5d03d3ae-d5f1-4b1a-82c5-4591c83f82b8', 1, '0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f564e186-99c3-4a63-adb0-5ac67d3ef2a9', '5d03d3ae-d5f1-4b1a-82c5-4591c83f82b8', 2, '0.5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59dba14f-f05e-4be1-8291-7ab73d61eb0d', '5d03d3ae-d5f1-4b1a-82c5-4591c83f82b8', 3, 'Infinite');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5d03d3ae-d5f1-4b1a-82c5-4591c83f82b8', 'b08e81a8-45b7-41ef-bba1-59d64317fa45', 'Slip is defined as s = (Ns − N)/Ns, where Ns is synchronous speed and N is rotor speed. At synchronous speed, N = Ns, so slip = 0 — however, at zero slip, an induction motor produces no torque (since relative motion between rotor and stator field is what induces rotor current), so it never actually reaches exact synchronous speed under load.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a482a231-4635-4425-ae30-4b5cf1be51d4', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 78, 'A transformer works on the principle of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3a72e44-864c-46e5-889e-0f16fb7623e1', 'a482a231-4635-4425-ae30-4b5cf1be51d4', 0, 'Self-induction only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2e49298-cf0c-4ef5-acec-2e2adfeada1a', 'a482a231-4635-4425-ae30-4b5cf1be51d4', 1, 'Mutual induction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('11cbd6fb-98eb-48de-881a-e19bb3c3481c', 'a482a231-4635-4425-ae30-4b5cf1be51d4', 2, 'Electromagnetic force between conductors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b8a40c3-5e76-4b21-be67-83e82648a08b', 'a482a231-4635-4425-ae30-4b5cf1be51d4', 3, 'Static electricity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a482a231-4635-4425-ae30-4b5cf1be51d4', 'b2e49298-cf0c-4ef5-acec-2e2adfeada1a', 'A transformer operates on the principle of mutual induction — a changing current in the primary winding induces a changing magnetic flux that links with the secondary winding, inducing an EMF in it.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('749b7774-8184-41c5-b5a8-09fe02fa2f95', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 79, 'The ''no-load test'' on a transformer is used to determine:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('104ceb4d-c123-430e-95c9-58366c3134de', '749b7774-8184-41c5-b5a8-09fe02fa2f95', 0, 'Copper losses only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e3b4bec-c581-40f1-b947-7c13a8ab6f5f', '749b7774-8184-41c5-b5a8-09fe02fa2f95', 1, 'Core (iron) losses and magnetizing current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c343d0c-46fe-4508-9827-81fe6491490f', '749b7774-8184-41c5-b5a8-09fe02fa2f95', 2, 'Full-load efficiency directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed70a8cf-4a61-4dcb-a633-e0d5c7928d55', '749b7774-8184-41c5-b5a8-09fe02fa2f95', 3, 'Short-circuit impedance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('749b7774-8184-41c5-b5a8-09fe02fa2f95', '5e3b4bec-c581-40f1-b947-7c13a8ab6f5f', 'The no-load (open-circuit) test is performed at rated voltage with the secondary open — since there''s negligible current-dependent copper loss at no load, the input power measured represents the core (iron) losses, and the test also determines the no-load (magnetizing) current.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b9131da6-0dbf-4dae-9df6-efb7eecaa9ff', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 80, 'In a DC generator, the function of a commutator is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6a43704-431a-4a72-9b6e-b2baa99b14a9', 'b9131da6-0dbf-4dae-9df6-efb7eecaa9ff', 0, 'Increase the generated EMF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49d07bff-281b-4c4b-bd58-5cca7f781be3', 'b9131da6-0dbf-4dae-9df6-efb7eecaa9ff', 1, 'Convert AC generated in the armature to DC output');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87e065a7-3781-4ea4-9d73-7047974910ff', 'b9131da6-0dbf-4dae-9df6-efb7eecaa9ff', 2, 'Reduce armature reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88d86207-da5f-4c24-a23b-7a81c5432ccc', 'b9131da6-0dbf-4dae-9df6-efb7eecaa9ff', 3, 'Provide field excitation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b9131da6-0dbf-4dae-9df6-efb7eecaa9ff', '49d07bff-281b-4c4b-bd58-5cca7f781be3', 'The armature of a DC generator actually generates AC (since conductors alternately pass under N and S poles) — the commutator, along with brushes, mechanically rectifies this AC into a unidirectional (DC) output at the terminals.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('18050066-e447-45f8-ab44-831ef8af3b21', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 81, 'The starting torque of a single-phase induction motor (without any starting mechanism) is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aea8ffb4-a974-4504-9923-9b61dbde648d', '18050066-e447-45f8-ab44-831ef8af3b21', 0, 'Very high');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b191f48d-e41d-4322-897a-0198e5bd9b24', '18050066-e447-45f8-ab44-831ef8af3b21', 1, 'Zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d82316ff-a022-44d6-8e50-03894480f8e0', '18050066-e447-45f8-ab44-831ef8af3b21', 2, 'Equal to full-load torque');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ed4e991-e785-48d6-a8f6-d5128efa2f0b', '18050066-e447-45f8-ab44-831ef8af3b21', 3, 'Negative');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('18050066-e447-45f8-ab44-831ef8af3b21', 'b191f48d-e41d-4322-897a-0198e5bd9b24', 'A single-phase induction motor produces a purely pulsating (not rotating) magnetic field, which can be resolved into two equal and opposite rotating fields that produce equal and opposite torques at standstill — net starting torque is zero, which is why single-phase induction motors require an auxiliary starting mechanism (e.g., a capacitor-start arrangement).', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('89a3d317-330d-490c-b53c-6aa962ceda7c', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 82, 'The efficiency of a transformer is typically maximum when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed3207f4-609f-4c47-9833-e913a44614a5', '89a3d317-330d-490c-b53c-6aa962ceda7c', 0, 'Copper losses equal core (iron) losses');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('912b8bae-27d9-4da1-9942-e1d7f7b3dad6', '89a3d317-330d-490c-b53c-6aa962ceda7c', 1, 'Copper losses are zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b8c542f-00dc-406b-bb4f-db89f1755192', '89a3d317-330d-490c-b53c-6aa962ceda7c', 2, 'Core losses are zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('61f2bdc5-901f-48fa-97fd-c77ecbfc885e', '89a3d317-330d-490c-b53c-6aa962ceda7c', 3, 'The transformer operates at no load');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('89a3d317-330d-490c-b53c-6aa962ceda7c', 'ed3207f4-609f-4c47-9833-e913a44614a5', 'Transformer efficiency is maximum at the load point where variable copper losses (which increase with load²) equal the constant core/iron losses — this is a standard result derived by differentiating the efficiency expression with respect to load current.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('db99e96c-d2ef-43f7-b58e-146c984a7b57', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 83, 'A synchronous motor, unlike an induction motor, runs at:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca7651af-a952-4e0e-954c-5f2a5c2cc21b', 'db99e96c-d2ef-43f7-b58e-146c984a7b57', 0, 'A speed slightly less than synchronous speed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50cc67f3-7eda-4e0d-8a7d-8a4879d050d5', 'db99e96c-d2ef-43f7-b58e-146c984a7b57', 1, 'Exactly synchronous speed, regardless of load (within its capability)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db44d238-d83e-4afd-b22f-bba055d9d9c6', 'db99e96c-d2ef-43f7-b58e-146c984a7b57', 2, 'A speed dependent on the load torque');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6545f77f-2933-4be9-a42f-f06060b2d779', 'db99e96c-d2ef-43f7-b58e-146c984a7b57', 3, 'Variable speed only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('db99e96c-d2ef-43f7-b58e-146c984a7b57', '50cc67f3-7eda-4e0d-8a7d-8a4879d050d5', 'A synchronous motor''s rotor locks in step with the rotating stator field and runs at exactly synchronous speed (Ns = 120f/P) for any load within its pull-out torque limit — unlike an induction motor, which always runs with some slip below synchronous speed.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a05de4c0-dec2-499a-89e6-adbac497e819', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 84, 'The purpose of ''armature reaction'' compensation (e.g., interpoles) in a DC machine is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a064df26-1bde-42c1-a2f2-79250069e443', 'a05de4c0-dec2-499a-89e6-adbac497e819', 0, 'Increase the generated voltage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1524b6c8-9899-47e2-bc4e-5aa7c098bddc', 'a05de4c0-dec2-499a-89e6-adbac497e819', 1, 'Neutralize the distorting effect of armature MMF on the main field, reducing sparking at brushes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b4cea870-637a-4c95-85f7-6e527acbac16', 'a05de4c0-dec2-499a-89e6-adbac497e819', 2, 'Reduce copper losses in the field winding');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e718f1c-dbe9-4f2f-b252-c5beb3444528', 'a05de4c0-dec2-499a-89e6-adbac497e819', 3, 'Increase the speed of the machine');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a05de4c0-dec2-499a-89e6-adbac497e819', '1524b6c8-9899-47e2-bc4e-5aa7c098bddc', 'Armature reaction is the distorting/weakening effect of the armature''s own magnetic field on the main field flux, which shifts the magnetic neutral axis and can cause sparking at the brushes — interpoles (small auxiliary poles) are used specifically to neutralize this effect in the commutating zone.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bde20f09-3448-46d9-86c4-ded55d3b918f', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 85, 'The rating of a transformer is typically expressed in:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('240133e4-3532-45eb-b589-e6381e9e8d54', 'bde20f09-3448-46d9-86c4-ded55d3b918f', 0, 'kW');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e895ff3c-ecc1-4ddb-b701-cf70a3a6e800', 'bde20f09-3448-46d9-86c4-ded55d3b918f', 1, 'kVA');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a1b214f-1455-4601-9e16-3571f2358f8a', 'bde20f09-3448-46d9-86c4-ded55d3b918f', 2, 'kWh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e86d68f-81d1-4fbe-8477-53c3ac3c68ee', 'bde20f09-3448-46d9-86c4-ded55d3b918f', 3, 'Amperes');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bde20f09-3448-46d9-86c4-ded55d3b918f', 'e895ff3c-ecc1-4ddb-b701-cf70a3a6e800', 'Transformers are rated in kVA (kilovolt-amperes), not kW, because transformer losses (copper loss ∝ current², core loss ∝ voltage) depend on voltage and current independent of the load''s power factor — kVA is a power-factor-independent rating.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2f353a9e-7992-49b1-b3a6-e337d9f73d44', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 86, 'In an alternator (synchronous generator), the frequency of the generated EMF is given by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b836c18f-07e3-4419-9d85-207ab5027cc6', '2f353a9e-7992-49b1-b3a6-e337d9f73d44', 0, 'f = PN/120');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('11d263d4-be02-4bd8-9f8a-ee403c9b0290', '2f353a9e-7992-49b1-b3a6-e337d9f73d44', 1, 'f = 120P/N');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67c65317-2119-48fb-9e58-62b0de00f922', '2f353a9e-7992-49b1-b3a6-e337d9f73d44', 2, 'f = PN/60');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0949a920-cb51-4342-9b33-dd0f51ddf516', '2f353a9e-7992-49b1-b3a6-e337d9f73d44', 3, 'f = N/P');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2f353a9e-7992-49b1-b3a6-e337d9f73d44', 'b836c18f-07e3-4419-9d85-207ab5027cc6', 'The standard relation is f = PN/120, where P is the number of poles and N is the rotor speed in RPM — rearranged from the synchronous speed formula Ns = 120f/P.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a9106238-f179-44e2-82d0-a66b75588d33', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 87, 'A DC series motor should never be started at no load because:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca298527-9517-4e72-b6df-09d544b9414f', 'a9106238-f179-44e2-82d0-a66b75588d33', 0, 'It will not start at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91f92b11-1bd9-4320-aac8-49591f227e45', 'a9106238-f179-44e2-82d0-a66b75588d33', 1, 'It may reach dangerously high speed, risking mechanical damage (''runaway'')');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ceece93b-cb2d-4efe-9958-c906c7f7c47e', 'a9106238-f179-44e2-82d0-a66b75588d33', 2, 'It will draw excessive current and burn out immediately');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a06b7ae1-5fc2-4cbf-8a86-cfe9a0e29ac0', 'a9106238-f179-44e2-82d0-a66b75588d33', 3, 'It will run in the reverse direction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a9106238-f179-44e2-82d0-a66b75588d33', '91f92b11-1bd9-4320-aac8-49591f227e45', 'In a DC series motor, flux is proportional to armature current, and at no load, the current (and hence flux) is very low. Since speed is inversely proportional to flux, low flux at no load causes the motor to accelerate to dangerously high, potentially destructive speeds — this is why series motors are never started unloaded or belt-coupled to a load that could disconnect.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('95c14a87-c154-4616-8154-f824ebb6ea42', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 88, 'The short-circuit test on a transformer is used primarily to determine:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ea65718-3179-4d23-bc9c-1e29d48ded57', '95c14a87-c154-4616-8154-f824ebb6ea42', 0, 'Core losses and magnetizing current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2d0ec99-9978-40ab-9f13-96357357b562', '95c14a87-c154-4616-8154-f824ebb6ea42', 1, 'Copper losses and equivalent impedance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40710113-1dd2-4d0f-862f-836a6e4eb6c5', '95c14a87-c154-4616-8154-f824ebb6ea42', 2, 'Voltage regulation directly without calculation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43e755e7-6871-4c76-85fe-5b50eff6797e', '95c14a87-c154-4616-8154-f824ebb6ea42', 3, 'Turns ratio');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('95c14a87-c154-4616-8154-f824ebb6ea42', 'b2d0ec99-9978-40ab-9f13-96357357b562', 'The short-circuit test is performed at reduced voltage with the secondary short-circuited, so the applied voltage overcomes only the winding impedance drop at rated current — the input power measured represents copper losses at that current, and the test also yields the equivalent circuit impedance.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4ccbab52-fb60-4b84-bb9f-b3c964c95d86', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 89, 'Which type of DC motor is most suitable for applications requiring a constant speed regardless of load variation, such as machine tools?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c377ea3-3936-470e-a9dc-3c282f17e471', '4ccbab52-fb60-4b84-bb9f-b3c964c95d86', 0, 'DC series motor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d67c22c2-f4fd-4556-9713-7e013d70e53a', '4ccbab52-fb60-4b84-bb9f-b3c964c95d86', 1, 'DC shunt motor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5b9a407-82de-483b-aaf7-6f5e12691cff', '4ccbab52-fb60-4b84-bb9f-b3c964c95d86', 2, 'DC compound motor (cumulative)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('366ba183-2da1-4df9-9f17-39b913191087', '4ccbab52-fb60-4b84-bb9f-b3c964c95d86', 3, 'DC motor with no field winding');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4ccbab52-fb60-4b84-bb9f-b3c964c95d86', 'd67c22c2-f4fd-4556-9713-7e013d70e53a', 'A DC shunt motor has an approximately constant field flux (field winding connected in parallel with the armature, largely independent of armature/load current), giving it relatively flat, near-constant speed characteristics across a wide load range — making it well suited to constant-speed applications like machine tools.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('eec2293f-3085-4614-a006-de14a75b7c21', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 90, 'The ''pitch factor'' (coil-span factor) of an AC machine winding is always:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('060cf3fb-f714-4996-8649-d02e5d783158', 'eec2293f-3085-4614-a006-de14a75b7c21', 0, 'Greater than 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('024059a9-d466-4456-88e8-dc6c4a0bd29e', 'eec2293f-3085-4614-a006-de14a75b7c21', 1, 'Equal to 1 for full-pitch windings, and less than 1 for short-pitch (chorded) windings');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5c307f4-eed7-49ab-a24b-841a92e64330', 'eec2293f-3085-4614-a006-de14a75b7c21', 2, 'Independent of coil span');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89d5d10c-4aa7-491b-b680-f938631c6b39', 'eec2293f-3085-4614-a006-de14a75b7c21', 3, 'Equal to 0');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('eec2293f-3085-4614-a006-de14a75b7c21', '024059a9-d466-4456-88e8-dc6c4a0bd29e', 'The pitch factor is 1 for a full-pitch winding (coil span = pole pitch) and less than 1 for a short-pitch (chorded) winding — short-pitching is deliberately used to reduce harmonic content in the generated EMF, at the cost of slightly reducing the fundamental EMF (hence a pitch factor < 1).', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('abb60df4-a77a-4236-b98d-e236a631450b', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 91, 'The main advantage of using extra high voltage (EHV) transmission lines is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e9f8ebb-f3cd-4e6a-8454-6bf8cd233560', 'abb60df4-a77a-4236-b98d-e236a631450b', 0, 'Reduced conductor cost per unit length');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0332f06d-10c6-414e-9aea-232bbc6c009e', 'abb60df4-a77a-4236-b98d-e236a631450b', 1, 'Reduced I²R (copper) losses for the same power transmitted');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5dde8167-687a-4580-820a-ef904a5c75c9', 'abb60df4-a77a-4236-b98d-e236a631450b', 2, 'Simpler insulation requirements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3636e2e5-7fc4-472c-aece-f5cd6e7cb49c', 'abb60df4-a77a-4236-b98d-e236a631450b', 3, 'Lower tower height requirements');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('abb60df4-a77a-4236-b98d-e236a631450b', '0332f06d-10c6-414e-9aea-232bbc6c009e', 'For a given power P = VI, transmitting at higher voltage reduces the required current proportionally, and since transmission losses scale as I²R, a higher transmission voltage significantly reduces line losses for the same power delivered.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('60270fd2-28b7-485a-9444-37c7a0726999', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 92, 'The purpose of a surge impedance loading (SIL) calculation for a transmission line is to determine:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ccd673e-a6cd-4790-9ec7-c59aa8e5bdd7', '60270fd2-28b7-485a-9444-37c7a0726999', 0, 'The maximum voltage the line insulation can withstand');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8df818e-cb94-4cd3-b919-312900f26cb7', '60270fd2-28b7-485a-9444-37c7a0726999', 1, 'The power level at which the line''s reactive power generation (by capacitance) equals its reactive power absorption (by inductance)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c96adbc4-7055-45ff-b89d-6c556a2d1e5f', '60270fd2-28b7-485a-9444-37c7a0726999', 2, 'The minimum current for stable operation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f9d6e19-a3f4-4a33-93c3-4b1500f10858', '60270fd2-28b7-485a-9444-37c7a0726999', 3, 'The line''s total resistance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('60270fd2-28b7-485a-9444-37c7a0726999', 'd8df818e-cb94-4cd3-b919-312900f26cb7', 'SIL is the power loading at which a lossless transmission line''s natural reactive power balance is achieved — the line neither absorbs nor generates net reactive power, since the reactive power absorbed by its series inductance equals that generated by its shunt capacitance at that specific loading.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ea11bb84-8127-4723-a710-48d49af7a1aa', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 93, 'In power system protection, a ''distance relay'' operates based on:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a349650c-9357-43a1-8cf9-68514f7ec362', 'ea11bb84-8127-4723-a710-48d49af7a1aa', 0, 'The magnitude of fault current only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5bfd5386-6772-4b00-afdf-31523ea4d7d3', 'ea11bb84-8127-4723-a710-48d49af7a1aa', 1, 'The impedance (ratio of voltage to current) measured up to the fault point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('482b3fe7-887d-4bf9-98ef-bf8d46b0904e', 'ea11bb84-8127-4723-a710-48d49af7a1aa', 2, 'The frequency deviation during a fault');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('531c1173-92ba-4ac0-9298-3f3ca31ee6f1', 'ea11bb84-8127-4723-a710-48d49af7a1aa', 3, 'The power factor at the relay location');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ea11bb84-8127-4723-a710-48d49af7a1aa', '5bfd5386-6772-4b00-afdf-31523ea4d7d3', 'A distance relay measures the apparent impedance (V/I) seen from the relay location — since impedance is roughly proportional to the distance to a fault along a transmission line, this allows the relay to estimate how far away a fault has occurred and operate selectively.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d201d9f9-ad40-4e28-82a1-d02f224f1121', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 94, 'The purpose of a shunt capacitor bank in a power system is primarily to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c76287d-c1ed-4721-8592-418bc5a86bcd', 'd201d9f9-ad40-4e28-82a1-d02f224f1121', 0, 'Reduce the system''s real power demand');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d615ea1e-6437-4e98-8938-70819498f0d9', 'd201d9f9-ad40-4e28-82a1-d02f224f1121', 1, 'Improve power factor by supplying reactive power locally');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66dfd2c3-2a2c-4861-9638-a09f1e0b0caa', 'd201d9f9-ad40-4e28-82a1-d02f224f1121', 2, 'Increase transmission line resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5779d0cd-d6ba-4505-9a1e-6d8745bcabbf', 'd201d9f9-ad40-4e28-82a1-d02f224f1121', 3, 'Step down transmission voltage');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d201d9f9-ad40-4e28-82a1-d02f224f1121', 'd615ea1e-6437-4e98-8938-70819498f0d9', 'Shunt capacitor banks supply reactive power locally at the load, reducing the reactive power that must be drawn from the source through the transmission/distribution network — this improves the power factor and reduces line losses and voltage drop.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('33d091f1-8e99-4d48-b448-ed0c5b0c85ab', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 95, 'Corona loss on a transmission line increases with:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c3defcf-b4e3-4c6a-9c20-35fb2c4a3a68', '33d091f1-8e99-4d48-b448-ed0c5b0c85ab', 0, 'Larger conductor diameter and lower system voltage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58fba413-4eb7-4de9-9b27-b03e7929070d', '33d091f1-8e99-4d48-b448-ed0c5b0c85ab', 1, 'Smaller conductor diameter and higher system voltage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e272a42a-ec24-4b0b-b17e-702b2fa4ae5f', '33d091f1-8e99-4d48-b448-ed0c5b0c85ab', 2, 'Higher ambient temperature only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2affff35-90a0-4926-beaf-78d31c57b5b2', '33d091f1-8e99-4d48-b448-ed0c5b0c85ab', 3, 'Lower altitude only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('33d091f1-8e99-4d48-b448-ed0c5b0c85ab', '58fba413-4eb7-4de9-9b27-b03e7929070d', 'Corona (ionization of air around a conductor) occurs when the electric field at the conductor surface exceeds the breakdown strength of air — this is more likely with smaller conductor diameter (concentrating the field) and higher operating voltage, both of which increase corona loss.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('04267659-7408-49f8-bc1a-42ddc95d9499', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 96, 'The purpose of an isolator (disconnector) switch in a substation, unlike a circuit breaker, is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9630b3c-91e6-43a0-a075-ef60da384d26', '04267659-7408-49f8-bc1a-42ddc95d9499', 0, 'Interrupt fault current under load');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('664db8b0-6f7b-4b37-9215-e184e6dc4d1d', '04267659-7408-49f8-bc1a-42ddc95d9499', 1, 'Provide visible, safe isolation of a de-energized circuit for maintenance, NOT to interrupt load or fault current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e02723d1-63ef-41a1-b09d-99e288602d25', '04267659-7408-49f8-bc1a-42ddc95d9499', 2, 'Automatically clear short circuits');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4f3e778-2370-4f4c-9dd6-2ce233b3f4a5', '04267659-7408-49f8-bc1a-42ddc95d9499', 3, 'Regulate voltage');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('04267659-7408-49f8-bc1a-42ddc95d9499', '664db8b0-6f7b-4b37-9215-e184e6dc4d1d', 'An isolator provides visible physical isolation of a circuit for safety during maintenance, but it has no current-interrupting capability and must only be operated when the circuit is already de-energized (typically after the associated circuit breaker has opened) — unlike a circuit breaker, which is specifically designed to interrupt load and fault currents.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1467e25c-3894-4240-a474-2c4a2ee837fd', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 97, 'The ''ABCD parameters'' of a transmission line are used to relate:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67c9f97a-43aa-4ee1-a6ba-94c1a2e89209', '1467e25c-3894-4240-a474-2c4a2ee837fd', 0, 'Sending-end voltage/current to receiving-end voltage/current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3295934d-0037-4ce8-80ca-5f182e70959e', '1467e25c-3894-4240-a474-2c4a2ee837fd', 1, 'Real power to reactive power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c7ff4a6-6fcf-48db-80a3-3e152a435f70', '1467e25c-3894-4240-a474-2c4a2ee837fd', 2, 'Voltage to frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('990bc442-7361-42e8-9282-2a5e1d54e5d9', '1467e25c-3894-4240-a474-2c4a2ee837fd', 3, 'Resistance to temperature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1467e25c-3894-4240-a474-2c4a2ee837fd', '67c9f97a-43aa-4ee1-a6ba-94c1a2e89209', 'ABCD (transmission line) parameters express the sending-end voltage and current as linear functions of the receiving-end voltage and current (Vs = A·Vr + B·Ir, Is = C·Vr + D·Ir), a standard two-port network model used in transmission line analysis.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8ca8e78e-9eb9-4716-b3bb-7678059f24e7', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 98, 'Ferranti effect on a transmission line refers to the phenomenon where:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa1cb266-a0e0-43d9-84f9-c4ab4242b76d', '8ca8e78e-9eb9-4716-b3bb-7678059f24e7', 0, 'Receiving-end voltage exceeds sending-end voltage under light/no-load conditions on a long line');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9c522df-9dac-4af3-b27c-a0b7c5c0aacb', '8ca8e78e-9eb9-4716-b3bb-7678059f24e7', 1, 'Sending-end voltage always exceeds receiving-end voltage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2d1ce36-0e8e-4664-941b-1d8ea588f1e4', '8ca8e78e-9eb9-4716-b3bb-7678059f24e7', 2, 'Voltage drops to zero at no load');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6251d0f-986c-4af2-b3e2-c0edef6377d4', '8ca8e78e-9eb9-4716-b3bb-7678059f24e7', 3, 'Current increases at no load');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8ca8e78e-9eb9-4716-b3bb-7678059f24e7', 'aa1cb266-a0e0-43d9-84f9-c4ab4242b76d', 'The Ferranti effect occurs on long transmission lines under light or no-load conditions, where the line''s shunt capacitance draws a leading current through the series inductance, causing the receiving-end voltage to actually exceed the sending-end voltage — a counterintuitive but well-documented phenomenon.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('02e21aef-ecec-4304-afc9-35916d310345', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 99, 'The main function of a Buchholz relay is to protect:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2392a5d2-edc3-4707-9cec-9cf07baa6a42', '02e21aef-ecec-4304-afc9-35916d310345', 0, 'Transmission lines from lightning strikes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07c56dbe-0501-4ae5-b630-f1bc8aaf5bab', '02e21aef-ecec-4304-afc9-35916d310345', 1, 'Oil-filled transformers from internal faults, by detecting gas accumulation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('519395d4-1e53-45d6-8d83-3f512d5b811c', '02e21aef-ecec-4304-afc9-35916d310345', 2, 'Generators from over-speed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4c9a90d-178e-4fed-bf0a-e2203db38949', '02e21aef-ecec-4304-afc9-35916d310345', 3, 'Motors from overload');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('02e21aef-ecec-4304-afc9-35916d310345', '07c56dbe-0501-4ae5-b630-f1bc8aaf5bab', 'A Buchholz relay is a gas-actuated protective device installed in the pipe between an oil-filled transformer''s main tank and its conservator — it detects gas generated by internal faults (incipient winding faults, arcing) and can trigger an alarm or trip signal before the fault escalates.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('109ca626-c3ee-42d9-8f21-8404963bbdb5', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 100, 'Load factor of a power system is defined as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23d9fd46-da42-48d0-8461-bb1ca309036e', '109ca626-c3ee-42d9-8f21-8404963bbdb5', 0, 'Maximum demand / Average load');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b4a07ad-fe2d-4b77-83a2-41fe51f73155', '109ca626-c3ee-42d9-8f21-8404963bbdb5', 1, 'Average load / Maximum demand');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d0f35de-da3b-4124-b806-c761cd6e5c6d', '109ca626-c3ee-42d9-8f21-8404963bbdb5', 2, 'Connected load / Maximum demand');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b51f345-b728-4b17-a8a3-b6c549255a8c', '109ca626-c3ee-42d9-8f21-8404963bbdb5', 3, 'Peak load / Connected load');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('109ca626-c3ee-42d9-8f21-8404963bbdb5', '2b4a07ad-fe2d-4b77-83a2-41fe51f73155', 'Load factor = Average load / Maximum demand, over a given period — a higher load factor indicates a more uniform, efficiently-utilized load profile (closer to constant), while a lower load factor indicates a peaky, less efficient demand pattern.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8b1f3601-92e6-4453-b58c-53f46005e172', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 101, 'In a power system, ''string efficiency'' relates to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5103a36c-ee83-4f71-970b-85e7cec2875c', '8b1f3601-92e6-4453-b58c-53f46005e172', 0, 'The mechanical strength of transmission towers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('232eb28b-3107-4341-8424-019aa6de074a', '8b1f3601-92e6-4453-b58c-53f46005e172', 1, 'The uniformity of voltage distribution across the units (discs) of a suspension insulator string');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('913598c2-d053-462c-b6f7-98c948764ce3', '8b1f3601-92e6-4453-b58c-53f46005e172', 2, 'The efficiency of a generator''s excitation system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa3ed9d4-5863-44b5-a9d0-3c934c8cf7af', '8b1f3601-92e6-4453-b58c-53f46005e172', 3, 'The current-carrying capacity of a conductor bundle');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8b1f3601-92e6-4453-b58c-53f46005e172', '232eb28b-3107-4341-8424-019aa6de074a', 'String efficiency measures how uniformly voltage is distributed across the individual disc units of a suspension insulator string — due to stray capacitance to the tower, the unit nearest the line conductor experiences the highest voltage stress; string efficiency is ideally 100% (perfectly uniform) but is always less in practice.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('eec8302f-2f2e-4879-9d31-0684ababa023', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 102, 'The purpose of grading rings (or grading shields) on high-voltage insulator strings is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4265c132-7b82-4451-b238-ac9b9570fa7c', 'eec8302f-2f2e-4879-9d31-0684ababa023', 0, 'Increase mechanical strength only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('405659f9-3d35-48df-9618-fadf946bb808', 'eec8302f-2f2e-4879-9d31-0684ababa023', 1, 'Improve voltage distribution uniformity across the insulator units (improve string efficiency)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb7f85d9-8286-489b-be53-c0f21cbc090b', 'eec8302f-2f2e-4879-9d31-0684ababa023', 2, 'Reduce the number of insulator discs required');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('768a5245-8de5-4547-aafe-1d91590d2060', 'eec8302f-2f2e-4879-9d31-0684ababa023', 3, 'Provide a path for lightning current only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('eec8302f-2f2e-4879-9d31-0684ababa023', '405659f9-3d35-48df-9618-fadf946bb808', 'Grading rings modify the stray capacitance distribution around an insulator string, helping to equalize the voltage stress across each disc unit — directly improving string efficiency and reducing the risk of flashover at the line-end unit.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f7820ffe-6fb9-4663-a309-df415af3f1d8', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 103, 'A power system''s frequency drops when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2dee7258-7f6b-48dd-9271-89f9437e81f2', 'f7820ffe-6fb9-4663-a309-df415af3f1d8', 0, 'Generation exceeds load demand');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f4b6f72-64f5-4225-a4f5-061a090a246a', 'f7820ffe-6fb9-4663-a309-df415af3f1d8', 1, 'Load demand exceeds generation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18d922b8-0b43-49dd-b6b1-812d58d0f00c', 'f7820ffe-6fb9-4663-a309-df415af3f1d8', 2, 'Voltage increases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('493817a6-d544-42f7-82b2-baff74b1db0e', 'f7820ffe-6fb9-4663-a309-df415af3f1d8', 3, 'Reactive power increases with real power unchanged');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f7820ffe-6fb9-4663-a309-df415af3f1d8', '2f4b6f72-64f5-4225-a4f5-061a090a246a', 'System frequency is directly tied to generator rotor speed, which is governed by the balance between mechanical input power and electrical output (load) power — when load demand exceeds available generation, generators decelerate (as they supply the extra energy from rotational kinetic energy), causing frequency to drop.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('04c0d6dc-00c8-4a22-9687-05556dd45fbd', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 104, 'The main reason for transposition of transmission line conductors is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a6ba090-6a3a-4bcb-ae91-8d33a5eb4b20', '04c0d6dc-00c8-4a22-9687-05556dd45fbd', 0, 'Reduce conductor cost');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('71881d8e-795d-4da6-9515-91302d41bf10', '04c0d6dc-00c8-4a22-9687-05556dd45fbd', 1, 'Equalize the inductance and capacitance of each phase, reducing electrical unbalance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d1dd937-2ef6-4548-b571-f3f50b149e87', '04c0d6dc-00c8-4a22-9687-05556dd45fbd', 2, 'Increase mechanical strength');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0b997bd-87fe-40e4-befa-1af105962a7b', '04c0d6dc-00c8-4a22-9687-05556dd45fbd', 3, 'Simplify tower design');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('04c0d6dc-00c8-4a22-9687-05556dd45fbd', '71881d8e-795d-4da6-9515-91302d41bf10', 'In an untransposed line, each phase conductor occupies a different physical position relative to the others, resulting in unequal mutual inductance/capacitance among phases. Transposition (systematically rotating each conductor''s position along the line''s length) equalizes these parameters across all three phases, reducing electrical unbalance and interference with nearby communication lines.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('017cb0e1-d8e5-4238-a3f0-f95dd47d9d50', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 105, 'HVDC (High Voltage Direct Current) transmission is generally preferred over AC transmission for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb0ab881-8fd0-4553-ab2b-05320114b1df', '017cb0e1-d8e5-4238-a3f0-f95dd47d9d50', 0, 'Short-distance urban distribution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3490a1f0-ac31-4ac2-bc83-f6c1150d2649', '017cb0e1-d8e5-4238-a3f0-f95dd47d9d50', 1, 'Very long-distance bulk power transmission and asynchronous interconnections');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('14d61f14-c7ee-442d-b16a-97be27e9f56e', '017cb0e1-d8e5-4238-a3f0-f95dd47d9d50', 2, 'Household wiring');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc5801dd-e3c2-460b-b98b-e2e54244c45e', '017cb0e1-d8e5-4238-a3f0-f95dd47d9d50', 3, 'Low-voltage local distribution');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('017cb0e1-d8e5-4238-a3f0-f95dd47d9d50', '3490a1f0-ac31-4ac2-bc83-f6c1150d2649', 'HVDC is preferred for very long-distance bulk power transmission (where it avoids AC''s reactive power/charging current issues over long lines) and for interconnecting asynchronous AC grids (which cannot be directly connected via AC) — it is not typically used for short-distance or household-level distribution, where AC remains standard.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d7cb5cbe-2f43-4a81-8393-55681b0447e1', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 106, 'The transfer function of a control system is defined as the ratio of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5bbc517a-bc5b-4425-90d3-9778237c6256', 'd7cb5cbe-2f43-4a81-8393-55681b0447e1', 0, 'Input to output in the time domain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d125b2a7-a905-4cd4-b834-9e84b8a3f310', 'd7cb5cbe-2f43-4a81-8393-55681b0447e1', 1, 'Laplace transform of output to Laplace transform of input, assuming zero initial conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c4a2c25-0215-4c46-8740-d5f360a0805d', 'd7cb5cbe-2f43-4a81-8393-55681b0447e1', 2, 'Output power to input power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18a9e3c4-5fae-43c6-9774-b47bf6238b2f', 'd7cb5cbe-2f43-4a81-8393-55681b0447e1', 3, 'Steady-state error to input');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d7cb5cbe-2f43-4a81-8393-55681b0447e1', 'd125b2a7-a905-4cd4-b834-9e84b8a3f310', 'A transfer function is defined in the Laplace (frequency) domain as the ratio C(s)/R(s) — Laplace transform of the output to the Laplace transform of the input — under the assumption of zero initial conditions, for a linear time-invariant system.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('28f04741-7d24-4932-8f98-7f6ae65425ee', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 107, 'A system is said to be stable (BIBO stable) if:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbc21cac-78e9-42c6-9b2c-25532362c6c1', '28f04741-7d24-4932-8f98-7f6ae65425ee', 0, 'Its poles lie in the right half of the s-plane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('470b06d4-9e75-4613-96e4-32e5411ddf42', '28f04741-7d24-4932-8f98-7f6ae65425ee', 1, 'Its poles lie in the left half of the s-plane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3515018f-9341-461f-9261-ec16a7f49964', '28f04741-7d24-4932-8f98-7f6ae65425ee', 2, 'Its zeros lie in the right half of the s-plane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7eaa3c2-4874-4d52-a2ac-f6e0b122ccfc', '28f04741-7d24-4932-8f98-7f6ae65425ee', 3, 'It has no poles or zeros');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('28f04741-7d24-4932-8f98-7f6ae65425ee', '470b06d4-9e75-4613-96e4-32e5411ddf42', 'For BIBO (Bounded-Input, Bounded-Output) stability, all poles of the system''s transfer function must lie strictly in the left half of the s-plane — any pole in the right half plane causes the system''s response to grow unboundedly for a bounded input.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f1ad8c12-3a0f-461f-8f3a-ad2abbf1fae6', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 108, 'In a unity negative feedback control system, increasing the loop gain generally:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('11012b5c-04b0-4a45-8712-a61741102d7a', 'f1ad8c12-3a0f-461f-8f3a-ad2abbf1fae6', 0, 'Increases steady-state error');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e802c0a3-ca86-449d-9657-7c8ff89699c3', 'f1ad8c12-3a0f-461f-8f3a-ad2abbf1fae6', 1, 'Reduces steady-state error but may reduce relative stability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d689658-82f5-48d1-8e32-23ff0691f9dd', 'f1ad8c12-3a0f-461f-8f3a-ad2abbf1fae6', 2, 'Has no effect on steady-state error or stability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37ee1886-d301-4dcc-8730-3e7bf59260b1', 'f1ad8c12-3a0f-461f-8f3a-ad2abbf1fae6', 3, 'Always improves both error and stability with no tradeoff');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f1ad8c12-3a0f-461f-8f3a-ad2abbf1fae6', 'e802c0a3-ca86-449d-9657-7c8ff89699c3', 'Increasing loop gain in a negative feedback system generally reduces steady-state error (better tracking of the reference input), but it also tends to reduce the system''s gain and phase margins, potentially degrading relative stability or even causing instability if increased too far — a classic control-systems tradeoff.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7f7bcfee-3ca4-46ee-8ad0-234b310d878e', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 109, 'The ''type'' of a control system (Type 0, Type 1, Type 2) refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7fc04672-6991-4103-bae5-9bd5ca7a4f15', '7f7bcfee-3ca4-46ee-8ad0-234b310d878e', 0, 'The number of poles at the origin in the open-loop transfer function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae531a47-a20e-4966-b0bc-108987decfab', '7f7bcfee-3ca4-46ee-8ad0-234b310d878e', 1, 'The order of the differential equation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79b651d7-61a0-4e6b-8f6d-8d7a94d0379f', '7f7bcfee-3ca4-46ee-8ad0-234b310d878e', 2, 'The number of feedback loops');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da5752df-75e3-4f48-8a95-10ab192a444f', '7f7bcfee-3ca4-46ee-8ad0-234b310d878e', 3, 'The system''s damping ratio');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7f7bcfee-3ca4-46ee-8ad0-234b310d878e', '7fc04672-6991-4103-bae5-9bd5ca7a4f15', 'System type is defined by the number of poles located at the origin (s=0) of the open-loop transfer function — Type 0 has none, Type 1 has one (a pure integrator), Type 2 has two, and this directly determines the system''s steady-state error for step, ramp, and parabolic inputs.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8155be4b-29d5-4cb5-b884-fef109a310dc', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 110, 'A PID controller combines which three control actions?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('52ea5383-51cf-43af-abf6-31f967615954', '8155be4b-29d5-4cb5-b884-fef109a310dc', 0, 'Proportional, Integral, Derivative');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c36a377d-0aa7-459e-809f-4c38a497d0fd', '8155be4b-29d5-4cb5-b884-fef109a310dc', 1, 'Proportional, Inverse, Differential');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f2c39f5-c5bf-44e8-b528-39ca2bd71832', '8155be4b-29d5-4cb5-b884-fef109a310dc', 2, 'Power, Impedance, Damping');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a59505c2-3295-413a-a0f2-9848555ce35f', '8155be4b-29d5-4cb5-b884-fef109a310dc', 3, 'Phase, Inductance, Delay');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8155be4b-29d5-4cb5-b884-fef109a310dc', '52ea5383-51cf-43af-abf6-31f967615954', 'PID stands for Proportional-Integral-Derivative — a controller combining proportional action (responds to current error), integral action (eliminates steady-state error by accumulating past error), and derivative action (anticipates future error trend, improving transient response).', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b90f948b-3dba-46d0-bd6d-c9f9d522572b', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 111, 'The Routh-Hurwitz criterion is used to determine:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0edce0a-0643-43d9-9704-8d4c19f41e24', 'b90f948b-3dba-46d0-bd6d-c9f9d522572b', 0, 'The frequency response of a system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2347eb5e-6f2d-4130-9b11-8bf790d7bdb6', 'b90f948b-3dba-46d0-bd6d-c9f9d522572b', 1, 'The number of roots of the characteristic equation in the right half of the s-plane, without actually solving for them');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb1cc63a-c8fd-4eb5-a4e1-bb0230c298e6', 'b90f948b-3dba-46d0-bd6d-c9f9d522572b', 2, 'The transfer function of a system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e188be5b-5252-48f0-84b7-c0ac649033f2', 'b90f948b-3dba-46d0-bd6d-c9f9d522572b', 3, 'The steady-state gain of a system');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b90f948b-3dba-46d0-bd6d-c9f9d522572b', '2347eb5e-6f2d-4130-9b11-8bf790d7bdb6', 'The Routh-Hurwitz criterion is an algebraic method that determines the number of roots of a characteristic equation lying in the right half of the s-plane (indicating instability) directly from the equation''s coefficients, without requiring the roots to actually be computed.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cad3d5fb-dc3b-4146-baa2-6e44d9a8f92d', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 112, 'In a second-order underdamped system, the damping ratio (ζ) lies in the range:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('833f75eb-0604-44db-b356-9daa841b9adb', 'cad3d5fb-dc3b-4146-baa2-6e44d9a8f92d', 0, 'ζ = 0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9843fb4b-8121-4d6c-81e1-4c24be3bba40', 'cad3d5fb-dc3b-4146-baa2-6e44d9a8f92d', 1, '0 < ζ < 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a13c3e4f-fe7b-46a6-a1b9-e07850caf8e8', 'cad3d5fb-dc3b-4146-baa2-6e44d9a8f92d', 2, 'ζ = 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad56d1ff-bb03-4920-9ed2-9f7ca6036256', 'cad3d5fb-dc3b-4146-baa2-6e44d9a8f92d', 3, 'ζ > 1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cad3d5fb-dc3b-4146-baa2-6e44d9a8f92d', '9843fb4b-8121-4d6c-81e1-4c24be3bba40', 'An underdamped second-order system has 0 < ζ < 1, resulting in an oscillatory response that decays over time; ζ = 0 is undamped (sustained oscillation), ζ = 1 is critically damped, and ζ > 1 is overdamped (no oscillation, slower response).', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cbe3ad14-3bcb-41c2-91ef-1400eef6ca4b', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 113, 'A Bode plot represents a system''s frequency response as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd894fb2-9ea5-450c-9a0e-3781e9b59ca7', 'cbe3ad14-3bcb-41c2-91ef-1400eef6ca4b', 0, 'Magnitude and phase versus frequency, on a logarithmic frequency scale');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9987132a-65d1-4536-b141-ec1859b5c95e', 'cbe3ad14-3bcb-41c2-91ef-1400eef6ca4b', 1, 'Real part versus imaginary part of the transfer function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54e7877a-e0ed-4179-9388-0e54424e62e8', 'cbe3ad14-3bcb-41c2-91ef-1400eef6ca4b', 2, 'Root locations versus gain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99052776-6f13-4a3a-957b-926b704d09c2', 'cbe3ad14-3bcb-41c2-91ef-1400eef6ca4b', 3, 'Time response versus time');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cbe3ad14-3bcb-41c2-91ef-1400eef6ca4b', 'dd894fb2-9ea5-450c-9a0e-3781e9b59ca7', 'A Bode plot consists of two separate plots — magnitude (in dB) and phase (in degrees) — both plotted against frequency on a logarithmic scale, providing an intuitive graphical tool for stability analysis via gain and phase margins.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f7c1c857-9f0d-4a51-9e01-437489173b7a', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 114, 'The primary purpose of feedback in a closed-loop control system is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5b06d0f-2a1a-4b47-a397-7c8e4b6ba0d5', 'f7c1c857-9f0d-4a51-9e01-437489173b7a', 0, 'Increase system cost');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d949741-848d-497f-abe6-61500c095d54', 'f7c1c857-9f0d-4a51-9e01-437489173b7a', 1, 'Reduce the effect of disturbances and parameter variations on system output');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de375462-1742-4b03-8ed9-f29fbd797091', 'f7c1c857-9f0d-4a51-9e01-437489173b7a', 2, 'Eliminate the need for a controller');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7cb9b74e-ff45-4048-9656-a6ac6a2ae7ed', 'f7c1c857-9f0d-4a51-9e01-437489173b7a', 3, 'Always increase system bandwidth without limit');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f7c1c857-9f0d-4a51-9e01-437489173b7a', '7d949741-848d-497f-abe6-61500c095d54', 'The core purpose of feedback is to make the system''s actual output track the desired reference more accurately by continuously comparing output to input and correcting for disturbances, noise, and internal parameter variations — a fundamental advantage over open-loop control.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('05a97311-a79b-4a77-b2a8-29cef126b3c5', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 115, 'Root locus technique is used to study how:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abe90bc6-45d0-4fc1-9885-7076c3106d39', '05a97311-a79b-4a77-b2a8-29cef126b3c5', 0, 'The system''s poles move in the s-plane as a system parameter (typically gain K) varies');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8aa306cb-8826-4a11-b52a-61793d4f6d93', '05a97311-a79b-4a77-b2a8-29cef126b3c5', 1, 'The system''s frequency response changes with temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('060b7dd2-db89-4508-b07c-ba877df65a90', '05a97311-a79b-4a77-b2a8-29cef126b3c5', 2, 'The transfer function changes with input amplitude');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('042e2ee7-541c-4d42-8d0a-76e59f2b8085', '05a97311-a79b-4a77-b2a8-29cef126b3c5', 3, 'The system''s power consumption varies with load');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('05a97311-a79b-4a77-b2a8-29cef126b3c5', 'abe90bc6-45d0-4fc1-9885-7076c3106d39', 'Root locus is a graphical technique showing how the roots (poles) of the closed-loop characteristic equation move in the s-plane as a chosen system parameter — most commonly the loop gain K — is varied from 0 to infinity, directly informing stability and transient-response design.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a2fd7b91-972e-4cd0-97f5-66373e14bb8a', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 116, 'A galvanometer can be converted into an ammeter by connecting:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21493316-3711-41ba-b29f-1e86c365c37e', 'a2fd7b91-972e-4cd0-97f5-66373e14bb8a', 0, 'A high resistance in series');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37abe585-7a79-473f-9675-4964c5f5eff2', 'a2fd7b91-972e-4cd0-97f5-66373e14bb8a', 1, 'A low resistance (shunt) in parallel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9e75c03-29f5-48ba-819e-b63e30a5277c', 'a2fd7b91-972e-4cd0-97f5-66373e14bb8a', 2, 'A capacitor in series');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90840679-f116-4964-8e0c-91c905bd8478', 'a2fd7b91-972e-4cd0-97f5-66373e14bb8a', 3, 'An inductor in parallel');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a2fd7b91-972e-4cd0-97f5-66373e14bb8a', '37abe585-7a79-473f-9675-4964c5f5eff2', 'A galvanometer is converted into an ammeter by connecting a low-value shunt resistance in parallel with it — the shunt diverts most of the current around the galvanometer''s sensitive coil, extending the instrument''s current-measuring range.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ca864e89-c746-4db2-8f11-ec23bf87a8af', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 117, 'A galvanometer can be converted into a voltmeter by connecting:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87bfaab7-73b8-45a6-b36e-a457ce0866be', 'ca864e89-c746-4db2-8f11-ec23bf87a8af', 0, 'A high resistance in series');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('edeedf71-6545-4c10-8f79-20bf639ae835', 'ca864e89-c746-4db2-8f11-ec23bf87a8af', 1, 'A low resistance in parallel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0aa29817-7aa2-400e-9f16-a08affbf5214', 'ca864e89-c746-4db2-8f11-ec23bf87a8af', 2, 'A capacitor in parallel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73212acb-0066-4489-807c-d95adb32cbf9', 'ca864e89-c746-4db2-8f11-ec23bf87a8af', 3, 'A short circuit across it');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ca864e89-c746-4db2-8f11-ec23bf87a8af', '87bfaab7-73b8-45a6-b36e-a457ce0866be', 'A galvanometer is converted into a voltmeter by connecting a high-value resistance (multiplier) in series with it — this limits the current through the galvanometer to a safe level for a given applied voltage, extending the voltage-measuring range while keeping current draw low.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e1f27405-5947-4cde-b6cd-a0b5e4bd8de4', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 118, 'A Wheatstone bridge is primarily used to measure:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('950fc3fa-dd60-46d6-96f9-1c7a131f047f', 'e1f27405-5947-4cde-b6cd-a0b5e4bd8de4', 0, 'Very high voltages');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33dec70c-5f77-41a4-a74f-cbe09053213c', 'e1f27405-5947-4cde-b6cd-a0b5e4bd8de4', 1, 'Unknown medium-range resistance with high accuracy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5570d1fd-2a63-431f-a589-18d5fc86ac06', 'e1f27405-5947-4cde-b6cd-a0b5e4bd8de4', 2, 'AC frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a205dd9f-825e-4158-b937-becf5dcc4b5c', 'e1f27405-5947-4cde-b6cd-a0b5e4bd8de4', 3, 'Magnetic flux density');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e1f27405-5947-4cde-b6cd-a0b5e4bd8de4', '33dec70c-5f77-41a4-a74f-cbe09053213c', 'A Wheatstone bridge is a null-deflection method for accurately measuring an unknown medium-range resistance by balancing it against three known resistances until the bridge galvanometer reads zero — this null method eliminates errors from galvanometer calibration/linearity.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cbdae5fa-27f2-4582-be26-68cfb96dab6b', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 119, 'A CRO (Cathode Ray Oscilloscope) is primarily used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ff981c9-ec2c-446c-8a66-132aa93fb9dc', 'cbdae5fa-27f2-4582-be26-68cfb96dab6b', 0, 'Measure resistance directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a8978bd-f1d5-4cc3-827f-07590dc16493', 'cbdae5fa-27f2-4582-be26-68cfb96dab6b', 1, 'Visualize and measure the waveform (amplitude and time characteristics) of a voltage signal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('003758a4-244d-4bb0-a928-8987e7c568a0', 'cbdae5fa-27f2-4582-be26-68cfb96dab6b', 2, 'Generate AC power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97ac4c6e-7b4c-4b6e-b1b5-2e963319183a', 'cbdae5fa-27f2-4582-be26-68cfb96dab6b', 3, 'Measure only DC voltage');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cbdae5fa-27f2-4582-be26-68cfb96dab6b', '4a8978bd-f1d5-4cc3-827f-07590dc16493', 'A CRO displays a voltage signal''s waveform on a screen as a function of time, allowing direct visual measurement of amplitude, frequency, phase, and other time-domain characteristics — it is a fundamental tool for signal visualization and analysis.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('165f811c-d912-451b-99ee-7eb059825c40', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 120, 'The main advantage of a digital multimeter (DMM) over an analog multimeter is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64d35f3a-35e0-4b22-a5ea-3047b555d35b', '165f811c-d912-451b-99ee-7eb059825c40', 0, 'Lower cost always');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2979afa4-f77e-477a-8d4d-cf104ec8772f', '165f811c-d912-451b-99ee-7eb059825c40', 1, 'Higher input impedance and reduced loading effect on the circuit under test');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8c18620-4cf2-4f3f-b81f-8b5f3f4c4ca7', '165f811c-d912-451b-99ee-7eb059825c40', 2, 'It requires no power source');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('449de074-11ba-464e-805d-8810291b1825', '165f811c-d912-451b-99ee-7eb059825c40', 3, 'It measures only DC quantities');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('165f811c-d912-451b-99ee-7eb059825c40', '2979afa4-f77e-477a-8d4d-cf104ec8772f', 'Digital multimeters typically have very high input impedance (often 10 MΩ or more), which minimizes the ''loading effect'' — the disturbance the meter itself introduces into the circuit being measured — compared to analog meters, which draw more current from the circuit.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f42fcabb-1bca-421c-bdcd-b1369675df18', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 121, 'A Kelvin double bridge is specifically used to measure:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21db6be9-baa3-4f9b-83f6-202997b87878', 'f42fcabb-1bca-421c-bdcd-b1369675df18', 0, 'High resistance (megohms)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cbd39535-8fa6-42f3-af47-364540f4cbee', 'f42fcabb-1bca-421c-bdcd-b1369675df18', 1, 'Very low resistance (milliohms and below), eliminating lead and contact resistance errors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66de107f-a50c-4efa-9513-56024e07c140', 'f42fcabb-1bca-421c-bdcd-b1369675df18', 2, 'Capacitance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59ff2925-fd1c-40bc-b003-ccf83f2896fe', 'f42fcabb-1bca-421c-bdcd-b1369675df18', 3, 'Inductance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f42fcabb-1bca-421c-bdcd-b1369675df18', 'cbd39535-8fa6-42f3-af47-364540f4cbee', 'The Kelvin double bridge is a specialized variant of the Wheatstone bridge designed to accurately measure very low resistances by using an additional set of ratio arms specifically to eliminate the effect of lead and contact resistance, which would otherwise dominate the measurement error at such low resistance values.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('95bd483d-4151-4df4-b021-fd2631a5387f', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 122, 'In a Maxwell''s inductance bridge, an unknown inductance is measured by balancing it against a known:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e822744-edbd-42b0-83c9-9aee5919093c', '95bd483d-4151-4df4-b021-fd2631a5387f', 0, 'Resistance only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e74ec1dd-6115-4f3b-9d44-730ed2324df5', '95bd483d-4151-4df4-b021-fd2631a5387f', 1, 'Capacitance and resistance combination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6dcc4812-ba33-4567-bebe-0a26644e8359', '95bd483d-4151-4df4-b021-fd2631a5387f', 2, 'Another inductance only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ce68525-b1c6-4e35-bc39-b00b6004f33b', '95bd483d-4151-4df4-b021-fd2631a5387f', 3, 'Frequency source');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('95bd483d-4151-4df4-b021-fd2631a5387f', 'e74ec1dd-6115-4f3b-9d44-730ed2324df5', 'Maxwell''s inductance-capacitance bridge balances an unknown inductor (with its internal resistance) against a standard capacitor in parallel with a resistance, exploiting the fact that inductive and capacitive reactances have opposite phase relationships — a well-known AC bridge configuration.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5a142d60-c883-4a10-8f66-221e7e922687', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 123, 'A CT (Current Transformer) secondary should never be left open-circuited while the primary is energized, because:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b617e70-14d4-4d40-898e-8ab553ec85e8', '5a142d60-c883-4a10-8f66-221e7e922687', 0, 'It will short-circuit the primary');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9af2b94-b953-4b73-84d0-0b0f8204031c', '5a142d60-c883-4a10-8f66-221e7e922687', 1, 'The high turns ratio can induce a dangerously high voltage across the open secondary');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78c2b82d-2428-41aa-85fe-8a4057dac2ea', '5a142d60-c883-4a10-8f66-221e7e922687', 2, 'It will reduce the primary current to zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae6d99be-6a5e-4681-a8fb-6b6e6b10ef38', '5a142d60-c883-4a10-8f66-221e7e922687', 3, 'It has no effect either way');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5a142d60-c883-4a10-8f66-221e7e922687', 'd9af2b94-b953-4b73-84d0-0b0f8204031c', 'A CT''s primary current is set by the load, independent of the secondary condition. If the secondary is opened while primary current flows, there''s no secondary current to counteract the primary''s magnetizing MMF, causing the core flux (and hence the induced secondary voltage) to rise dangerously high — a well-known, real safety hazard in CT operation.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('58ade31a-2be3-4b7c-b9d7-671a2323c7b5', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 124, 'The ''true RMS'' feature in a multimeter is important when measuring:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cbfde223-e09d-4e0f-acb7-5a507829516e', '58ade31a-2be3-4b7c-b9d7-671a2323c7b5', 0, 'Pure sine wave signals only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3569de00-37d7-47a3-a865-be086feed959', '58ade31a-2be3-4b7c-b9d7-671a2323c7b5', 1, 'Non-sinusoidal (distorted) AC waveforms accurately');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c695503-55fd-4f2e-8f52-619b3cb7ca3b', '58ade31a-2be3-4b7c-b9d7-671a2323c7b5', 2, 'DC voltage only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f63fe7e-4c44-4cd2-9233-5175aacd303b', '58ade31a-2be3-4b7c-b9d7-671a2323c7b5', 3, 'Resistance only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('58ade31a-2be3-4b7c-b9d7-671a2323c7b5', '3569de00-37d7-47a3-a865-be086feed959', 'A standard (average-responding, RMS-calibrated) multimeter is calibrated assuming a pure sine wave and gives inaccurate readings for distorted/non-sinusoidal waveforms; a ''true RMS'' meter calculates the actual root-mean-square value regardless of waveform shape, giving accurate readings for distorted AC signals (common in circuits with nonlinear loads).', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9d525bc5-2b15-4ece-b864-e675e3344729', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 125, 'A potentiometer (in the DC measurement context) is used to measure:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3835d814-c003-452c-8a90-4a753ee7f62b', '9d525bc5-2b15-4ece-b864-e675e3344729', 0, 'An unknown EMF or voltage by comparison against a known standard, with zero current drawn at balance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d3d41c1-13e4-4bed-bd81-7acb09ac408c', '9d525bc5-2b15-4ece-b864-e675e3344729', 1, 'AC frequency only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('29ef7c8f-ba1a-4c04-9e2d-b54aca99a9a2', '9d525bc5-2b15-4ece-b864-e675e3344729', 2, 'Magnetic field strength');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3760fe4c-b4c9-48ff-8d29-3b821ec87969', '9d525bc5-2b15-4ece-b864-e675e3344729', 3, 'Only resistance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9d525bc5-2b15-4ece-b864-e675e3344729', '3835d814-c003-452c-8a90-4a753ee7f62b', 'A DC potentiometer measures an unknown EMF/voltage by balancing it against a known standard voltage along a calibrated slide-wire until a galvanometer shows zero deflection — at balance, no current is drawn from the source being measured, making it a highly accurate null method (unlike a voltmeter, which always draws some current).', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4a6f0835-5e32-481b-8294-4ff86f223b62', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 126, 'A P-N junction diode conducts significantly when forward biased and the applied voltage exceeds:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b62f8ec1-7c19-49e5-a724-63e23b462c4c', '4a6f0835-5e32-481b-8294-4ff86f223b62', 0, 'The breakdown voltage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13ac97c6-79a3-4b58-b234-5a9f2e53d7bb', '4a6f0835-5e32-481b-8294-4ff86f223b62', 1, 'The barrier (cut-in/knee) potential (~0.7V for silicon)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f94b549-1dde-4aa2-83a2-56d43d53d8b2', '4a6f0835-5e32-481b-8294-4ff86f223b62', 2, 'Zero volts exactly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64bfbd16-c5cc-4e24-a9e5-da0c3b4fcc65', '4a6f0835-5e32-481b-8294-4ff86f223b62', 3, 'The Zener voltage');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4a6f0835-5e32-481b-8294-4ff86f223b62', '13ac97c6-79a3-4b58-b234-5a9f2e53d7bb', 'A silicon P-N junction diode begins to conduct significantly once the forward bias voltage exceeds its barrier (cut-in) potential of approximately 0.7V, which is needed to overcome the built-in potential barrier at the junction.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5a4bf496-3f33-4a59-9d8a-19924bf76159', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 127, 'A Zener diode is primarily used as a:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c0974c6-5e33-4def-9502-a2dd48d6a634', '5a4bf496-3f33-4a59-9d8a-19924bf76159', 0, 'Rectifier for high-power AC-to-DC conversion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e321f48b-1c3c-47e6-a0c4-0bb1cd8f3773', '5a4bf496-3f33-4a59-9d8a-19924bf76159', 1, 'Voltage regulator, operating in its reverse breakdown region');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cacea345-bf3e-4aa7-938c-c5368e38c753', '5a4bf496-3f33-4a59-9d8a-19924bf76159', 2, 'Signal amplifier');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac2c228b-3ae3-48fe-b5bc-b1057f04af8a', '5a4bf496-3f33-4a59-9d8a-19924bf76159', 3, 'Oscillator');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5a4bf496-3f33-4a59-9d8a-19924bf76159', 'e321f48b-1c3c-47e6-a0c4-0bb1cd8f3773', 'A Zener diode is specifically designed to operate in its reverse breakdown region at a well-defined, stable voltage (the Zener voltage) — this makes it ideal as a voltage reference/regulator, maintaining a nearly constant voltage across it despite variations in current.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1accbeaa-a81f-42e1-9a09-4343976cf540', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 128, 'In a common-emitter (CE) BJT amplifier configuration, the output signal is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6727f33d-fd7e-49ef-83b5-6e9e1234f958', '1accbeaa-a81f-42e1-9a09-4343976cf540', 0, 'In phase with the input signal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d85fa07-ddf3-4314-9543-611b90a95878', '1accbeaa-a81f-42e1-9a09-4343976cf540', 1, '180° out of phase with the input signal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05588adb-306b-4fc8-a427-1e2a95e0e281', '1accbeaa-a81f-42e1-9a09-4343976cf540', 2, '90° out of phase with the input signal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2002354c-6b77-4591-b8ff-ee1a544a2b8f', '1accbeaa-a81f-42e1-9a09-4343976cf540', 3, 'Always zero');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1accbeaa-a81f-42e1-9a09-4343976cf540', '7d85fa07-ddf3-4314-9543-611b90a95878', 'A common-emitter amplifier is well known for producing a 180° phase inversion between input and output signals — as the input increases, the collector current increases, causing a larger voltage drop across the collector resistor and thus a decreasing collector voltage (output), and vice versa.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ef045806-b965-4ba5-a62b-3f8ae183e0af', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 129, 'An operational amplifier (op-amp) in an ideal state has:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('317775d7-5d4d-4710-b673-8a54390143df', 'ef045806-b965-4ba5-a62b-3f8ae183e0af', 0, 'Infinite input impedance and zero output impedance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ffd97080-d2fa-423d-b3b4-84843f496b96', 'ef045806-b965-4ba5-a62b-3f8ae183e0af', 1, 'Zero input impedance and infinite output impedance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5091d303-c618-48a7-a455-40dcc5547bd5', 'ef045806-b965-4ba5-a62b-3f8ae183e0af', 2, 'Finite, equal input and output impedance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9921721-2e74-4fae-bf06-057b545bc716', 'ef045806-b965-4ba5-a62b-3f8ae183e0af', 3, 'Zero gain');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ef045806-b965-4ba5-a62b-3f8ae183e0af', '317775d7-5d4d-4710-b673-8a54390143df', 'An ideal op-amp is characterized by infinite input impedance (draws no input current), zero output impedance (output voltage unaffected by load), and infinite open-loop gain — these idealizations simplify circuit analysis and are closely approximated by real op-amps.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ac1ce544-de9c-4878-a226-ffc9cca9a47c', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 130, 'In digital logic, the Boolean expression for a NAND gate''s output (for inputs A and B) is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c1f14b0-3e2a-4e3f-a534-cd25eb68e601', 'ac1ce544-de9c-4878-a226-ffc9cca9a47c', 0, 'A · B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d56be05-fa79-46d1-9dfe-5a28e8eae6ab', 'ac1ce544-de9c-4878-a226-ffc9cca9a47c', 1, 'A + B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94c7a30f-84a0-4575-af4a-a6042af09dfc', 'ac1ce544-de9c-4878-a226-ffc9cca9a47c', 2, '(A · B)''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('215f8a6e-1006-4ea9-a6f8-dc694bc2e563', 'ac1ce544-de9c-4878-a226-ffc9cca9a47c', 3, 'A'' · B''');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ac1ce544-de9c-4878-a226-ffc9cca9a47c', '94c7a30f-84a0-4575-af4a-a6042af09dfc', 'A NAND gate''s output is the complement (NOT) of the AND operation: (A·B)'' — it outputs LOW only when both inputs are HIGH, and HIGH for every other input combination.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('286284c1-18af-4eae-ae26-e7600733972d', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 131, 'A full adder circuit, unlike a half adder, additionally accounts for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0d85954-7849-4f11-b79c-96fbeff05f57', '286284c1-18af-4eae-ae26-e7600733972d', 0, 'A carry input from a previous stage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('629cac03-698d-4031-a507-680283466943', '286284c1-18af-4eae-ae26-e7600733972d', 1, 'Two separate outputs for sum only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb6dadf0-102d-409d-b92e-1573b281081b', '286284c1-18af-4eae-ae26-e7600733972d', 2, 'Negative numbers directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70448893-6108-4e63-96c2-2e8b5e0720b1', '286284c1-18af-4eae-ae26-e7600733972d', 3, 'Only single-bit addition');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('286284c1-18af-4eae-ae26-e7600733972d', 'e0d85954-7849-4f11-b79c-96fbeff05f57', 'A half adder adds two single bits and produces a sum and carry-out, but cannot accept a carry-in. A full adder extends this by also accepting a carry-in from a previous (less significant) stage, making it suitable for chaining together to build multi-bit adders.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('753e0ee3-8756-469a-bee4-3cfd52449231', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 132, 'The number of flip-flops required to design a MOD-16 counter is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b851514c-2be2-4fcb-b58b-1042d4d73772', '753e0ee3-8756-469a-bee4-3cfd52449231', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92edad70-c47d-4e9d-bcab-fe06ed99a9ac', '753e0ee3-8756-469a-bee4-3cfd52449231', 1, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18b094f2-acac-4e63-afd6-5565770d0849', '753e0ee3-8756-469a-bee4-3cfd52449231', 2, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d35d92a7-d5b4-4967-b2d7-4f84f2bf56ef', '753e0ee3-8756-469a-bee4-3cfd52449231', 3, '16');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('753e0ee3-8756-469a-bee4-3cfd52449231', '18b094f2-acac-4e63-afd6-5565770d0849', 'A MOD-16 counter must count through 16 distinct states (0 to 15), requiring n flip-flops such that 2ⁿ ≥ 16 — with n=4, 2⁴=16, exactly matching the requirement, so 4 flip-flops are needed.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('05cabfa2-9bf7-4ac3-a8f8-a4b434e4a936', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 133, 'A Schmitt trigger circuit is primarily used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a006b73e-02f4-444f-9352-a792680cdcbe', '05cabfa2-9bf7-4ac3-a8f8-a4b434e4a936', 0, 'Amplify weak signals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84ec80c5-2255-4774-b099-f202835b3643', '05cabfa2-9bf7-4ac3-a8f8-a4b434e4a936', 1, 'Convert a slowly-varying or noisy input signal into a clean, sharp-edged digital output using hysteresis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c07632e0-2794-4b7c-9265-f209cd08f6e7', '05cabfa2-9bf7-4ac3-a8f8-a4b434e4a936', 2, 'Generate sine waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31f35163-5014-480c-b772-e11847a55b09', '05cabfa2-9bf7-4ac3-a8f8-a4b434e4a936', 3, 'Rectify AC signals');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('05cabfa2-9bf7-4ac3-a8f8-a4b434e4a936', '84ec80c5-2255-4774-b099-f202835b3643', 'A Schmitt trigger uses positive feedback to introduce hysteresis (two different threshold levels for rising vs. falling input), allowing it to convert a slow-changing, noisy, or distorted input signal into a clean square-wave digital output with sharp transitions, immune to noise-induced multiple triggering.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b07e22a8-922c-4e15-a612-32d3326d534f', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 134, 'In a JK flip-flop, when both J and K inputs are HIGH (J=1, K=1), the output on the next clock edge:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24fc4969-bf1b-4478-983b-ab3de56c663f', 'b07e22a8-922c-4e15-a612-32d3326d534f', 0, 'Sets to 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9b359b3-15ef-483e-b194-8c7bc8949a56', 'b07e22a8-922c-4e15-a612-32d3326d534f', 1, 'Resets to 0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37ced89b-7cc7-4db5-8697-251e9b97131d', 'b07e22a8-922c-4e15-a612-32d3326d534f', 2, 'Toggles (changes to the opposite of its previous state)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e189d81c-3480-4dbb-8ed0-d9e718f6c566', 'b07e22a8-922c-4e15-a612-32d3326d534f', 3, 'Remains unchanged (no-change/hold state)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b07e22a8-922c-4e15-a612-32d3326d534f', '37ced89b-7cc7-4db5-8697-251e9b97131d', 'The JK flip-flop''s defining feature over the SR flip-flop is that the J=1,K=1 condition (which would be an invalid/forbidden state in an SR flip-flop) is defined as the ''toggle'' state — the output flips to the complement of its previous state on each clock edge.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3225975e-a7c0-4539-a95d-f434f8dad438', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 135, 'The main advantage of a CMOS logic family over TTL is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e32f6594-6bab-4a1a-a2a3-2b7d656f006c', '3225975e-a7c0-4539-a95d-f434f8dad438', 0, 'Higher power consumption');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b3a41e7-fcc2-4e0e-8f71-c47320d80e8c', '3225975e-a7c0-4539-a95d-f434f8dad438', 1, 'Very low static power consumption and high noise immunity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1f73706-7b2a-46f7-b2b3-e8da06ac0c84', '3225975e-a7c0-4539-a95d-f434f8dad438', 2, 'Faster switching speed under all conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a50502dc-0a89-49a3-bc4a-bd58fc024902', '3225975e-a7c0-4539-a95d-f434f8dad438', 3, 'Lower input impedance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3225975e-a7c0-4539-a95d-f434f8dad438', '7b3a41e7-fcc2-4e0e-8f71-c47320d80e8c', 'CMOS logic uses complementary MOSFET pairs where, in steady state, one transistor is always off, resulting in very low static (quiescent) power consumption compared to TTL''s bipolar transistors, which always draw some current — CMOS also offers higher noise immunity due to its wider logic voltage swing.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('12177b78-783e-4e42-9cb7-1744e7d6e45c', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 136, 'The purpose of a multiplexer (MUX) in digital circuits is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9d6a7d5-efcb-4050-827d-dc3685552e5f', '12177b78-783e-4e42-9cb7-1744e7d6e45c', 0, 'Select one of several input signals and route it to a single output, based on select lines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6bfeb9f1-386c-4e84-8d85-75baa7d35c1c', '12177b78-783e-4e42-9cb7-1744e7d6e45c', 1, 'Distribute one input signal to multiple outputs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('655bb084-b741-4462-9c5b-21108bc04dd5', '12177b78-783e-4e42-9cb7-1744e7d6e45c', 2, 'Store binary data');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da8082b1-bce9-40b5-9d06-12347b4caba9', '12177b78-783e-4e42-9cb7-1744e7d6e45c', 3, 'Perform addition of binary numbers');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('12177b78-783e-4e42-9cb7-1744e7d6e45c', 'e9d6a7d5-efcb-4050-827d-dc3685552e5f', 'A multiplexer is a combinational circuit that selects one of several (2ⁿ) input data lines and routes it to a single output line, with the specific input chosen based on the binary value applied to n select lines — the inverse function is performed by a demultiplexer.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c8b3f718-3c7f-4b96-bdb6-fbe1932d98c9', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 137, 'In an astable multivibrator (using a 555 timer or transistors), the circuit:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cfcdd56-934d-4d37-8f00-126ad865358b', 'c8b3f718-3c7f-4b96-bdb6-fbe1932d98c9', 0, 'Has one stable state and one quasi-stable state');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3abb18ea-a45f-4581-b4e5-2d5c6f7e9e76', 'c8b3f718-3c7f-4b96-bdb6-fbe1932d98c9', 1, 'Has two stable states');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('674e64bd-c324-4968-a6d4-078cea39b327', 'c8b3f718-3c7f-4b96-bdb6-fbe1932d98c9', 2, 'Has no stable state — it continuously oscillates between two quasi-stable states, generating a continuous square wave');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ba84f69-00b4-42e7-a930-c1019d8f892b', 'c8b3f718-3c7f-4b96-bdb6-fbe1932d98c9', 3, 'Produces a single output pulse only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c8b3f718-3c7f-4b96-bdb6-fbe1932d98c9', '674e64bd-c324-4968-a6d4-078cea39b327', 'An astable multivibrator has no stable state at all — it free-runs, continuously switching between two quasi-stable states, making it useful as a free-running square-wave/clock-pulse generator (unlike a monostable, which has one stable and one quasi-stable state, or a bistable, which has two stable states).', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9b79a981-97c8-46ad-9ca1-a1c65ce01692', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 138, 'The function of a Digital-to-Analog Converter (DAC) is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('52ee2f87-209b-4a76-b65c-d76ee443f540', '9b79a981-97c8-46ad-9ca1-a1c65ce01692', 0, 'Convert a continuous analog signal into discrete digital codes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a59cd55-581b-4909-acdb-2daa74707782', '9b79a981-97c8-46ad-9ca1-a1c65ce01692', 1, 'Convert a digital (binary) code into a corresponding analog voltage or current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('749ba881-70b6-4904-aa9a-0e66d10e6fda', '9b79a981-97c8-46ad-9ca1-a1c65ce01692', 2, 'Amplify a digital signal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58744667-5971-441a-8de5-8172e8b450c4', '9b79a981-97c8-46ad-9ca1-a1c65ce01692', 3, 'Store digital data permanently');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9b79a981-97c8-46ad-9ca1-a1c65ce01692', '1a59cd55-581b-4909-acdb-2daa74707782', 'A DAC performs the reverse operation of an ADC — it converts a digital (binary-coded) input into a proportional analog output voltage or current, commonly used wherever a digital system needs to interface with and control an analog quantity.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('98292332-76e5-4fc6-8b87-dfe4a0841c97', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 139, 'The main function of a rectifier circuit is to convert:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('edf3f90b-5948-467c-b95a-0cb692445f52', '98292332-76e5-4fc6-8b87-dfe4a0841c97', 0, 'DC to AC');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('925d7959-29f2-4206-9bf7-5ce9d2b4f829', '98292332-76e5-4fc6-8b87-dfe4a0841c97', 1, 'AC to DC (unidirectional current)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6efa4e7d-fb50-4f7b-82e0-0ba284a5938f', '98292332-76e5-4fc6-8b87-dfe4a0841c97', 2, 'Low voltage to high voltage without changing frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8fbc6247-afb7-48a8-bd67-31e0f70b9808', '98292332-76e5-4fc6-8b87-dfe4a0841c97', 3, 'Digital signals to analog signals');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('98292332-76e5-4fc6-8b87-dfe4a0841c97', '925d7959-29f2-4206-9bf7-5ce9d2b4f829', 'A rectifier converts an alternating current (AC) input into a unidirectional (DC) output — using diodes (half-wave, full-wave bridge, etc.) to allow current flow in only one direction, forming the first stage of most AC-to-DC power supplies.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('db60aa60-b7c9-4695-9c82-fa03c9139113', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 140, 'The De Morgan''s theorem states that: (A + B)'' is equivalent to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ace60cef-31eb-4d16-878e-62ee4c40dce4', 'db60aa60-b7c9-4695-9c82-fa03c9139113', 0, 'A'' + B''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('998b63db-9f11-47f1-ad97-b52d3a57e921', 'db60aa60-b7c9-4695-9c82-fa03c9139113', 1, 'A'' · B''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad40b442-3938-48f2-8f15-dbc36de5c440', 'db60aa60-b7c9-4695-9c82-fa03c9139113', 2, 'A · B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1bce0e6-cef1-404c-9ea1-757ef92cd7fb', 'db60aa60-b7c9-4695-9c82-fa03c9139113', 3, 'A + B');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('db60aa60-b7c9-4695-9c82-fa03c9139113', '998b63db-9f11-47f1-ad97-b52d3a57e921', 'De Morgan''s first theorem states (A + B)'' = A'' · B'' — the complement of a sum (OR) equals the product (AND) of the individual complements. This is a fundamental Boolean-algebra identity used extensively for simplifying digital logic expressions.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('75f9165a-41d4-4de9-92d5-8333eadf2d8b', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 141, 'The Nyquist sampling theorem states that a band-limited signal can be perfectly reconstructed from its samples if the sampling frequency is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a514fbe-276b-424a-b3e7-b15835e44455', '75f9165a-41d4-4de9-92d5-8333eadf2d8b', 0, 'Equal to the signal''s maximum frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e6fd3b7-14ef-40f2-b176-9b42527fa897', '75f9165a-41d4-4de9-92d5-8333eadf2d8b', 1, 'At least twice the signal''s maximum (highest) frequency component');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbb3f875-12fe-41bc-ad21-8cb5ee408ee5', '75f9165a-41d4-4de9-92d5-8333eadf2d8b', 2, 'Half the signal''s maximum frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d022e6ee-9bd8-49c7-8dd6-612273f9266f', '75f9165a-41d4-4de9-92d5-8333eadf2d8b', 3, 'Independent of the signal''s frequency content');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('75f9165a-41d4-4de9-92d5-8333eadf2d8b', '1e6fd3b7-14ef-40f2-b176-9b42527fa897', 'The Nyquist sampling theorem requires the sampling frequency to be at least twice the highest frequency component present in the band-limited signal (fs ≥ 2fmax) to allow perfect reconstruction and avoid aliasing distortion.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('72ef489b-cd8e-4884-8a33-636fbae1e901', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 142, 'Amplitude Modulation (AM) works by varying which characteristic of the carrier signal in proportion to the message signal?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50c00115-5252-4089-a0f4-1263f21424eb', '72ef489b-cd8e-4884-8a33-636fbae1e901', 0, 'Frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0227316-715d-4308-bfe2-0a0ec4a02b16', '72ef489b-cd8e-4884-8a33-636fbae1e901', 1, 'Phase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01c9ce08-fb89-47ef-b25e-3a01c6944d06', '72ef489b-cd8e-4884-8a33-636fbae1e901', 2, 'Amplitude');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6dfd0b5-e92f-44c3-a1a3-ab44db9dbe38', '72ef489b-cd8e-4884-8a33-636fbae1e901', 3, 'Wavelength');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('72ef489b-cd8e-4884-8a33-636fbae1e901', '01c9ce08-fb89-47ef-b25e-3a01c6944d06', 'In Amplitude Modulation, the amplitude of a high-frequency carrier wave is varied in direct proportion to the instantaneous amplitude of the lower-frequency message (baseband) signal, while the carrier''s frequency and phase remain constant.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('18a641e3-f4a6-462b-b3c4-d065bf0c680e', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 143, 'The bandwidth of a standard double-sideband AM signal is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b53c2489-b71a-4f0f-a6a3-94d5bba29ced', '18a641e3-f4a6-462b-b3c4-d065bf0c680e', 0, 'Equal to the message signal''s bandwidth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7942ccb1-5d64-41c5-9c50-a4e696ac8277', '18a641e3-f4a6-462b-b3c4-d065bf0c680e', 1, 'Twice the message signal''s bandwidth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d176aa7-c8c2-44de-a821-64a496f7389b', '18a641e3-f4a6-462b-b3c4-d065bf0c680e', 2, 'Half the message signal''s bandwidth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('208ecc33-53b7-48e2-966b-42bcb433f033', '18a641e3-f4a6-462b-b3c4-d065bf0c680e', 3, 'Independent of the message signal''s bandwidth');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('18a641e3-f4a6-462b-b3c4-d065bf0c680e', '7942ccb1-5d64-41c5-9c50-a4e696ac8277', 'Double-sideband AM produces both an upper sideband and a lower sideband around the carrier, each occupying a bandwidth equal to the message signal''s bandwidth — so the total transmitted AM bandwidth is twice the message signal''s bandwidth.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a18ac5f7-55a4-4ca2-a7c7-507cf1e19bae', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 144, 'A system is said to be ''linear'' if it satisfies:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7488bbd3-4fa8-46a0-be77-534ff74eeba8', 'a18ac5f7-55a4-4ca2-a7c7-507cf1e19bae', 0, 'Only the additivity property');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe561904-03e6-4b2d-8bfc-52d115ffcfd0', 'a18ac5f7-55a4-4ca2-a7c7-507cf1e19bae', 1, 'Only the homogeneity (scaling) property');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c48431c-a5ef-4463-8ce9-3c1b5a237926', 'a18ac5f7-55a4-4ca2-a7c7-507cf1e19bae', 2, 'Both additivity and homogeneity (together, the superposition property)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad1e90fd-4b1a-439b-9458-3a9bbf1cbe2c', 'a18ac5f7-55a4-4ca2-a7c7-507cf1e19bae', 3, 'Neither property is required for linearity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a18ac5f7-55a4-4ca2-a7c7-507cf1e19bae', '2c48431c-a5ef-4463-8ce9-3c1b5a237926', 'A system is linear if and only if it satisfies the superposition property, which requires BOTH additivity (response to a sum of inputs equals the sum of individual responses) AND homogeneity/scaling (scaling the input scales the output proportionally) — both conditions together, not either alone.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('dfcab441-aa11-416f-8634-6b1dd67e5e06', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 145, 'The Fourier Transform of a signal represents the signal in terms of its:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c20695cd-10df-417f-b310-40cc7add86ef', 'dfcab441-aa11-416f-8634-6b1dd67e5e06', 0, 'Time-domain amplitude only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81125b97-8821-4089-a929-fc2857f2a9fe', 'dfcab441-aa11-416f-8634-6b1dd67e5e06', 1, 'Frequency components (spectral content)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4526cc4c-87a7-466a-8dd1-4d48ac2bfcaa', 'dfcab441-aa11-416f-8634-6b1dd67e5e06', 2, 'Spatial coordinates');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3983abe-86b2-42c0-9205-4550b56d8a6b', 'dfcab441-aa11-416f-8634-6b1dd67e5e06', 3, 'Probability distribution');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dfcab441-aa11-416f-8634-6b1dd67e5e06', '81125b97-8821-4089-a929-fc2857f2a9fe', 'The Fourier Transform decomposes a time-domain signal into its constituent frequency components, representing the signal''s amplitude and phase as a function of frequency — a fundamental tool for analyzing a signal''s spectral content.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('56b3dbfb-2d6b-42cc-8ace-a1b630d46c17', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 146, 'In Frequency Modulation (FM), the bandwidth of the modulated signal is generally:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8ffca0d-d1f3-4ab0-879e-37c5258073d9', '56b3dbfb-2d6b-42cc-8ace-a1b630d46c17', 0, 'Always equal to twice the message signal''s bandwidth, like AM');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6390a90-7e20-484a-b499-d6ec50016a1e', '56b3dbfb-2d6b-42cc-8ace-a1b630d46c17', 1, 'Wider than AM for a given message bandwidth, and depends on the modulation index (per Carson''s Rule)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('033b4e0d-85ac-42ae-9171-ea56fec7b348', '56b3dbfb-2d6b-42cc-8ace-a1b630d46c17', 2, 'Always narrower than the message signal''s own bandwidth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fdc640f1-1d50-439d-a3f7-13295bdc787e', '56b3dbfb-2d6b-42cc-8ace-a1b630d46c17', 3, 'Independent of the modulation index');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('56b3dbfb-2d6b-42cc-8ace-a1b630d46c17', 'e6390a90-7e20-484a-b499-d6ec50016a1e', 'FM bandwidth is generally significantly wider than AM''s for comparable message signals, and per Carson''s Rule, it depends on both the message bandwidth and the frequency deviation (modulation index) — this bandwidth tradeoff is a key reason FM offers better noise immunity than AM at the cost of using more spectrum.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('47c3e7c2-124b-4d3c-8bc4-7ef4f5050dea', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 147, 'A system is said to be ''causal'' if:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4bec895d-d729-4e09-8857-d631248a0fa4', '47c3e7c2-124b-4d3c-8bc4-7ef4f5050dea', 0, 'The output depends only on present and past inputs, not future inputs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a53b1c79-155a-47af-b569-4d90f8b4e6f7', '47c3e7c2-124b-4d3c-8bc4-7ef4f5050dea', 1, 'The output depends only on future inputs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('447e8bb5-6fb4-45b2-a94c-125fbd660b2c', '47c3e7c2-124b-4d3c-8bc4-7ef4f5050dea', 2, 'The output is always zero for negative time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41389429-4fd5-4a2a-a4d4-45b995bd34e5', '47c3e7c2-124b-4d3c-8bc4-7ef4f5050dea', 3, 'The system has no memory');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('47c3e7c2-124b-4d3c-8bc4-7ef4f5050dea', '4bec895d-d729-4e09-8857-d631248a0fa4', 'A causal (or ''physically realizable'') system''s output at any given time depends only on the present and past values of the input, never on future input values — this is a physical requirement for any real-time system, since it cannot know future inputs in advance.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('548b81bf-4fe1-46e1-bdfa-6e6397192687', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 148, 'Pulse Code Modulation (PCM) involves which three fundamental processes, in order?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f30817d-4b8b-4eb4-a9e6-90c7ba1c02bd', '548b81bf-4fe1-46e1-bdfa-6e6397192687', 0, 'Sampling, Quantization, Encoding');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8cbf2910-93ae-4d3e-a2ff-e62541cf9aec', '548b81bf-4fe1-46e1-bdfa-6e6397192687', 1, 'Modulation, Demodulation, Filtering');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6850788-326a-49a0-9ddd-35a01e9371b9', '548b81bf-4fe1-46e1-bdfa-6e6397192687', 2, 'Amplification, Rectification, Filtering');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a8ae915-275d-4d76-a04b-dec5b4999bcc', '548b81bf-4fe1-46e1-bdfa-6e6397192687', 3, 'Encoding, Decoding, Amplification');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('548b81bf-4fe1-46e1-bdfa-6e6397192687', '4f30817d-4b8b-4eb4-a9e6-90c7ba1c02bd', 'PCM converts an analog signal into a digital bitstream through three sequential steps: Sampling (converting continuous time to discrete time instants), Quantization (converting continuous amplitude to discrete levels), and Encoding (representing each quantized level as a binary code).', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fe056fd4-2d7f-4df8-b257-2f1002402b25', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 149, 'The main purpose of a low-pass filter in a communication receiver is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41a0554a-c0bc-41ce-ad37-114bca7f37a4', 'fe056fd4-2d7f-4df8-b257-2f1002402b25', 0, 'Amplify high-frequency noise');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9164e30-b558-4771-a687-0524252e3040', 'fe056fd4-2d7f-4df8-b257-2f1002402b25', 1, 'Allow low-frequency signal components through while attenuating high-frequency components (e.g., noise or unwanted harmonics)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a3ef74b-c858-4393-abb1-eee1d2df770f', 'fe056fd4-2d7f-4df8-b257-2f1002402b25', 2, 'Block all frequencies equally');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ff8dda0-1192-4bb8-b3be-9ec3725931e4', 'fe056fd4-2d7f-4df8-b257-2f1002402b25', 3, 'Convert AC to DC');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fe056fd4-2d7f-4df8-b257-2f1002402b25', 'd9164e30-b558-4771-a687-0524252e3040', 'A low-pass filter allows frequencies below a defined cutoff frequency to pass through with minimal attenuation while significantly attenuating frequencies above that cutoff — commonly used to remove high-frequency noise or unwanted harmonics from a signal after demodulation.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d9b18a09-cd39-44fd-8a2f-d20b4b4b7e53', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 150, 'Time Division Multiplexing (TDM) allows multiple signals to share a common channel by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40302800-566f-4330-9782-49a25f61445f', 'd9b18a09-cd39-44fd-8a2f-d20b4b4b7e53', 0, 'Assigning each signal a different frequency band');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30c0afd2-bddf-4dae-80a3-6eb81d4d78fe', 'd9b18a09-cd39-44fd-8a2f-d20b4b4b7e53', 1, 'Assigning each signal a distinct, non-overlapping time slot on the shared channel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('940fed4c-dcc7-429a-839f-08b5abc5abb1', 'd9b18a09-cd39-44fd-8a2f-d20b4b4b7e53', 2, 'Assigning each signal a different amplitude range');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b775db15-f472-4a11-a117-7554d0d1167a', 'd9b18a09-cd39-44fd-8a2f-d20b4b4b7e53', 3, 'Transmitting all signals simultaneously at full bandwidth');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d9b18a09-cd39-44fd-8a2f-d20b4b4b7e53', '30c0afd2-bddf-4dae-80a3-6eb81d4d78fe', 'TDM shares a single transmission channel among multiple signals by allocating each signal its own distinct time slot in a repeating cycle — each signal is transmitted only during its assigned slot, distinguishing TDM from Frequency Division Multiplexing (FDM), which instead separates signals by frequency band.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6093fddf-a653-4367-ab06-1e1951968fce', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 151, 'A Silicon Controlled Rectifier (SCR/thyristor) is turned ON by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3fa38e49-6f28-4d71-90b3-10c859ce191b', '6093fddf-a653-4367-ab06-1e1951968fce', 0, 'Applying a negative gate pulse');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e15b3979-fe10-44ae-89ae-4815ebed1bf4', '6093fddf-a653-4367-ab06-1e1951968fce', 1, 'Applying a positive gate pulse while the device is forward biased (anode positive relative to cathode)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c7c6782-5b01-488a-9c28-899367dc1c7a', '6093fddf-a653-4367-ab06-1e1951968fce', 2, 'Simply removing the load');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9f0c0e4-d321-4b20-be52-d060ece9bc4f', '6093fddf-a653-4367-ab06-1e1951968fce', 3, 'Reversing the anode-cathode voltage');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6093fddf-a653-4367-ab06-1e1951968fce', 'e15b3979-fe10-44ae-89ae-4815ebed1bf4', 'An SCR conducts when forward biased (anode more positive than cathode) AND a positive trigger pulse is applied to its gate terminal — once triggered into conduction, the SCR continues conducting even after the gate signal is removed, until the anode current falls below the holding current.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0a8ca8c3-ab01-4c5b-abaf-1ff1418f8916', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 152, 'An SCR, once triggered into conduction, can only be turned OFF by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e373fe93-98e4-4747-8389-f602d1074ce4', '0a8ca8c3-ab01-4c5b-abaf-1ff1418f8916', 0, 'Applying a negative gate pulse');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b58ae35b-39f4-459a-bdfd-a4e97f0c1bcb', '0a8ca8c3-ab01-4c5b-abaf-1ff1418f8916', 1, 'Reducing the anode current below the holding current (natural or forced commutation)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04b44b81-b2a5-4bc2-8893-9ce31503dfd1', '0a8ca8c3-ab01-4c5b-abaf-1ff1418f8916', 2, 'Increasing the gate current further');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5f8005a-f3ff-493e-bcab-b4fb2d2e4b58', '0a8ca8c3-ab01-4c5b-abaf-1ff1418f8916', 3, 'It cannot be turned off once triggered');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0a8ca8c3-ab01-4c5b-abaf-1ff1418f8916', 'b58ae35b-39f4-459a-bdfd-a4e97f0c1bcb', 'Unlike a transistor, an SCR''s gate has no control once conduction begins — it can only be turned off (commutated) by reducing the anode current below its holding current, either naturally (as in AC circuits, where current crosses zero each half-cycle) or via a forced commutation circuit (in DC applications).', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c6c47200-8223-4930-aaf8-d63cca839759', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 153, 'A buck converter (DC-DC) is used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a430ee1-8faf-4fa3-83ec-078537681f71', 'c6c47200-8223-4930-aaf8-d63cca839759', 0, 'Step up the input DC voltage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43e7039d-d16b-46a4-9917-47acaf7b8a32', 'c6c47200-8223-4930-aaf8-d63cca839759', 1, 'Step down the input DC voltage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5625712-acbd-4bb6-aacc-6a3d81dc42be', 'c6c47200-8223-4930-aaf8-d63cca839759', 2, 'Convert DC to AC');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a8f22d0-e2d9-40bd-9280-a3dc0965a302', 'c6c47200-8223-4930-aaf8-d63cca839759', 3, 'Convert AC to DC');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c6c47200-8223-4930-aaf8-d63cca839759', '43e7039d-d16b-46a4-9917-47acaf7b8a32', 'A buck converter is a step-down DC-DC converter — its output voltage is always less than or equal to its input voltage, achieved by controlling the duty cycle of a switching element (typically a MOSFET) in conjunction with an inductor and capacitor.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bc3eefb4-8fb1-432d-ba83-9c28e0815d83', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 154, 'A boost converter (DC-DC) is used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a18491f5-0baf-4d2f-a3a2-e3c2f505b948', 'bc3eefb4-8fb1-432d-ba83-9c28e0815d83', 0, 'Step down the input DC voltage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc2ee698-3fff-4592-bdcb-75c624d90370', 'bc3eefb4-8fb1-432d-ba83-9c28e0815d83', 1, 'Step up the input DC voltage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96804432-c400-429a-8b57-6378d72a0a03', 'bc3eefb4-8fb1-432d-ba83-9c28e0815d83', 2, 'Convert DC to AC only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec02bf57-edba-4033-b62d-616bc0400def', 'bc3eefb4-8fb1-432d-ba83-9c28e0815d83', 3, 'Rectify AC to DC');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bc3eefb4-8fb1-432d-ba83-9c28e0815d83', 'bc2ee698-3fff-4592-bdcb-75c624d90370', 'A boost converter is a step-up DC-DC converter — its output voltage is always greater than or equal to its input voltage, achieved by using an inductor to store energy during the switch-on period and releasing it (in series with the input) during the switch-off period.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('741aa7b7-37a2-4f9d-b557-bfd3a7954334', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 155, 'The main advantage of a full-bridge (H-bridge) inverter over a half-bridge inverter, for the same DC input voltage, is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2682101-9a41-434a-a66c-9a856f1e56ae', '741aa7b7-37a2-4f9d-b557-bfd3a7954334', 0, 'Lower output voltage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0c5513c-c188-4830-8a4e-711048a8a8d7', '741aa7b7-37a2-4f9d-b557-bfd3a7954334', 1, 'Twice the output voltage swing (peak-to-peak) for the same DC input');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ac32a25-36b3-4d8a-ad5a-1c74e922cbd6', '741aa7b7-37a2-4f9d-b557-bfd3a7954334', 2, 'Fewer switching devices required');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('297cdc75-fd66-4596-a807-27275b031e6f', '741aa7b7-37a2-4f9d-b557-bfd3a7954334', 3, 'It can only produce DC output');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('741aa7b7-37a2-4f9d-b557-bfd3a7954334', 'd0c5513c-c188-4830-8a4e-711048a8a8d7', 'A full-bridge (H-bridge) inverter can apply the full DC input voltage across the load in either polarity, giving twice the peak-to-peak output voltage swing compared to a half-bridge inverter (which only applies half the DC bus voltage across the load) for the same DC input.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d8356874-681b-4f1c-8a7f-d0ad58816f9e', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 156, 'PWM (Pulse Width Modulation) in power electronics is primarily used to control the:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a5e3f40-09e5-4cec-af47-783b1b9cf169', 'd8356874-681b-4f1c-8a7f-d0ad58816f9e', 0, 'Frequency of the input supply only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('532b5272-d65b-40ef-9595-8cc975af19c2', 'd8356874-681b-4f1c-8a7f-d0ad58816f9e', 1, 'Average (effective) output voltage or current delivered to a load, by varying switch ON-time duty cycle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a64bf90-d6b3-4af6-a01b-55fc32a4bc9d', 'd8356874-681b-4f1c-8a7f-d0ad58816f9e', 2, 'Temperature of the switching device');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ae6b3fa-878f-4d22-b72e-b83984e833dc', 'd8356874-681b-4f1c-8a7f-d0ad58816f9e', 3, 'Resistance of the load');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d8356874-681b-4f1c-8a7f-d0ad58816f9e', '532b5272-d65b-40ef-9595-8cc975af19c2', 'PWM controls the average output voltage/current delivered to a load by rapidly switching a device ON and OFF and varying the duty cycle (proportion of time ON versus the full switching period) — a higher duty cycle delivers more average power, without needing to vary the actual supply voltage itself.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('03256b79-605c-4747-af06-cad409435fb5', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 157, 'A freewheeling diode (flyback diode) is used in inductive-load switching circuits to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45fda64a-638e-4b5b-9473-a1895830c19d', '03256b79-605c-4747-af06-cad409435fb5', 0, 'Increase the switching speed of the main device');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e09e82d0-e480-4ae1-8d1d-c5c7ca76b38c', '03256b79-605c-4747-af06-cad409435fb5', 1, 'Provide a safe path for inductor current to continue flowing when the main switch turns off, protecting it from voltage spikes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a6b5861-686a-4818-b806-80e801b50938', '03256b79-605c-4747-af06-cad409435fb5', 2, 'Rectify the AC supply');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9eddfdf3-e4a9-41e3-b383-1391b2c5a89a', '03256b79-605c-4747-af06-cad409435fb5', 3, 'Reduce the inductance value');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('03256b79-605c-4747-af06-cad409435fb5', 'e09e82d0-e480-4ae1-8d1d-c5c7ca76b38c', 'When a switch driving an inductive load turns off abruptly, the inductor''s stored energy tries to maintain current flow, generating a large, potentially damaging voltage spike across the switch. A freewheeling diode provides an alternative path for this current to safely decay, protecting the switching device from this spike.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9af3c086-c438-4fbc-ab56-4ae59afdd69c', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 158, 'The main difference between a Power MOSFET and a BJT (Bipolar Junction Transistor), relevant to power electronics switching applications, is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b01c8e11-fce1-45d5-84f7-ee712fcea90d', '9af3c086-c438-4fbc-ab56-4ae59afdd69c', 0, 'MOSFETs are current-controlled devices; BJTs are voltage-controlled');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f951477-d1b0-4302-b107-c5ed2d6fd489', '9af3c086-c438-4fbc-ab56-4ae59afdd69c', 1, 'MOSFETs are voltage-controlled devices (via gate voltage, near-zero gate current in steady state); BJTs are current-controlled (via base current)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f98ff181-8318-4dc4-af8f-29fefd8ce7c9', '9af3c086-c438-4fbc-ab56-4ae59afdd69c', 2, 'Both are identical in control mechanism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('22fa0124-f41d-4f40-be1c-3bba2382a157', '9af3c086-c438-4fbc-ab56-4ae59afdd69c', 3, 'BJTs always switch faster than MOSFETs');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9af3c086-c438-4fbc-ab56-4ae59afdd69c', '7f951477-d1b0-4302-b107-c5ed2d6fd489', 'Power MOSFETs are voltage-controlled devices — the gate draws negligible steady-state current, requiring only a gate-source voltage to control conduction — while BJTs are current-controlled devices, requiring a continuous base current to sustain conduction. This makes MOSFET gate drive circuitry generally simpler and more efficient for high-frequency switching.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e17efe2e-0f5c-414c-a62c-6395953445f4', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 159, 'A cycloconverter is used to directly convert:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bade3e1e-d3b0-488a-b793-1e05ac06f600', 'e17efe2e-0f5c-414c-a62c-6395953445f4', 0, 'DC to DC at a different voltage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a7c20d4-68d3-4298-b03d-d85ba6c6cf88', 'e17efe2e-0f5c-414c-a62c-6395953445f4', 1, 'AC of one frequency to AC of a different (usually lower) frequency, without an intermediate DC link');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e8575fd-4d70-45f4-b735-bc9438dfd1ec', 'e17efe2e-0f5c-414c-a62c-6395953445f4', 2, 'AC to DC only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7331b460-c129-4a91-b7a6-1274c379683e', 'e17efe2e-0f5c-414c-a62c-6395953445f4', 3, 'DC to AC at a fixed frequency only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e17efe2e-0f5c-414c-a62c-6395953445f4', '6a7c20d4-68d3-4298-b03d-d85ba6c6cf88', 'A cycloconverter performs direct AC-to-AC frequency conversion (typically producing a lower output frequency than the input) without an intermediate DC conversion stage, commonly used in applications like large, low-speed variable-frequency motor drives.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1c4cdab5-e73b-41a3-acd1-784e7cc70f70', '632d2d17-f8c9-41d0-9051-7919f9ff538d', 160, 'The ''commutation'' process in power electronic converters refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03b5d653-4fc8-413f-9b28-e6efbceb311a', '1c4cdab5-e73b-41a3-acd1-784e7cc70f70', 0, 'The process of amplifying the output signal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4da1146-f832-4579-ae1d-c0b66eb4b5ee', '1c4cdab5-e73b-41a3-acd1-784e7cc70f70', 1, 'The transfer of current from one switching device (or path) to another');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d7272d3-8417-4f95-b173-b93a4ad5f198', '1c4cdab5-e73b-41a3-acd1-784e7cc70f70', 2, 'The process of rectifying AC to DC only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5a7844e-d31c-440e-9027-2e17ebd9ab6c', '1c4cdab5-e73b-41a3-acd1-784e7cc70f70', 3, 'The cooling of power semiconductor devices');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1c4cdab5-e73b-41a3-acd1-784e7cc70f70', 'f4da1146-f832-4579-ae1d-c0b66eb4b5ee', 'Commutation is the process by which current is transferred from one conducting switching device/path to another within a converter circuit — this can occur naturally (line commutation, using the AC source''s natural voltage reversal) or via forced commutation (using an auxiliary circuit), and is a fundamental concept in thyristor-based converter design.', 'Discipline (Electrical & Electronics) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');
