-- ============================================================
-- HAL Design/Management Trainee -- Mechanical Engineering
-- Full-Length Mock Paper 2 (160 questions, 150 minutes)
-- 
-- SOURCE: informally shared study material (not an official/proprietary HAL
-- archive). Honest per-question source note via question_answers.source_note
-- (already rendered in the results-review UI) -- see each section below.
-- Run this AFTER docs/question-bank-schema.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes)
VALUES ('e4041688-7f93-48f0-a3e5-ec4342ea38b8', 'hal-mech-practice-1', 'HAL DT/MT — Mechanical Engineering — Full Mock Paper 1', 'hal-trainee', ARRAY['HAL', 'Mechanical Engineering', 'Thermodynamics', 'General Awareness', 'Reasoning', 'English']::TEXT[], 160, 'standard', true, 2, 150);

-- ── Section: General Awareness (20 questions) — General Awareness — written to match HAL's real GA scope, not taken from an official HAL paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('293b0bc8-bd4c-46c2-bd60-009eced88f50', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 1, 'HAL''s Tejas Mk1A is an upgraded variant of which aircraft?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e7c099f-ac95-43e6-9b65-12ed3854d576', '293b0bc8-bd4c-46c2-bd60-009eced88f50', 0, 'Su-30MKI');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c559c07-92b8-4e13-a76d-73ac3380a182', '293b0bc8-bd4c-46c2-bd60-009eced88f50', 1, 'Tejas (LCA)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba3d41c7-35a8-4f4e-a56c-d1d3ab86fee9', '293b0bc8-bd4c-46c2-bd60-009eced88f50', 2, 'Mirage 2000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb384e95-8264-4785-ba3d-bc7cb0ff02af', '293b0bc8-bd4c-46c2-bd60-009eced88f50', 3, 'Jaguar');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('293b0bc8-bd4c-46c2-bd60-009eced88f50', '8c559c07-92b8-4e13-a76d-73ac3380a182', 'Tejas Mk1A is an upgraded, more capable variant of HAL''s original indigenous Light Combat Aircraft (Tejas Mk1), with improved radar, avionics, and weapons integration.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e0b2cda0-29dd-41ab-b0e1-69c8696fbe35', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 2, 'The ''Ratna'' classification system for CPSEs is administered by which body?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('098ce46d-6551-46b3-882c-ab3a6280176d', 'e0b2cda0-29dd-41ab-b0e1-69c8696fbe35', 0, 'Reserve Bank of India');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23e532ad-f569-4e61-b89a-1f5cf24a2906', 'e0b2cda0-29dd-41ab-b0e1-69c8696fbe35', 1, 'Department of Public Enterprises (DPE), Ministry of Finance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6896db4f-7ad4-43ff-84a3-8ae19a5fc4ec', 'e0b2cda0-29dd-41ab-b0e1-69c8696fbe35', 2, 'NITI Aayog');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6841b994-0886-43f2-b299-906e7a3e3ac6', 'e0b2cda0-29dd-41ab-b0e1-69c8696fbe35', 3, 'Comptroller and Auditor General (CAG)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e0b2cda0-29dd-41ab-b0e1-69c8696fbe35', '23e532ad-f569-4e61-b89a-1f5cf24a2906', 'The Department of Public Enterprises (DPE), under the Ministry of Finance, administers the Maharatna/Navratna/Miniratna classification scheme for Central Public Sector Enterprises.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4d14eb3f-5302-44a9-9596-1f6dd69523b0', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 3, 'Which HAL facility is primarily associated with helicopter manufacturing?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2fde21c4-5d70-4e50-af07-edf55bbd00bc', '4d14eb3f-5302-44a9-9596-1f6dd69523b0', 0, 'Nashik Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c9d024d-f166-4411-9882-49ef352e7507', '4d14eb3f-5302-44a9-9596-1f6dd69523b0', 1, 'Bengaluru Helicopter Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9cba83e0-0edc-4030-9c36-f0cdafb35707', '4d14eb3f-5302-44a9-9596-1f6dd69523b0', 2, 'Koraput Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ef06f71-1e76-456c-96da-261d09a1165c', '4d14eb3f-5302-44a9-9596-1f6dd69523b0', 3, 'Kanpur Division');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4d14eb3f-5302-44a9-9596-1f6dd69523b0', '1c9d024d-f166-4411-9882-49ef352e7507', 'HAL''s Helicopter Division in Bengaluru is the primary facility for helicopter design, development, and manufacturing, including the Dhruv (ALH) and Prachand (LCH) programs.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a043510a-ed78-44d1-bd3e-ab6e6afea812', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 4, 'India''s National Aerospace Laboratories (NAL), which collaborates with HAL on several programs, is headquartered in:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('501304c1-cd26-4694-b4f7-60baed718e4d', 'a043510a-ed78-44d1-bd3e-ab6e6afea812', 0, 'Bengaluru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9db80580-bde2-4ed9-93ef-36ba04be12bc', 'a043510a-ed78-44d1-bd3e-ab6e6afea812', 1, 'Thiruvananthapuram');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c506afcc-03b4-45ad-a396-f9d53ed52964', 'a043510a-ed78-44d1-bd3e-ab6e6afea812', 2, 'Hyderabad');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48daf0c7-e52a-43b0-bc71-f2b1a72b0d18', 'a043510a-ed78-44d1-bd3e-ab6e6afea812', 3, 'Pune');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a043510a-ed78-44d1-bd3e-ab6e6afea812', '501304c1-cd26-4694-b4f7-60baed718e4d', 'NAL, a constituent laboratory of the Council of Scientific and Industrial Research (CSIR), is headquartered in Bengaluru, in the same aerospace hub as HAL.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1665363f-701e-4dbf-9ebc-2be010d8f0cc', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 5, 'The Indian Parliament''s two houses are the Lok Sabha and:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('370a6151-8218-4cf9-9be8-2576e5741964', '1665363f-701e-4dbf-9ebc-2be010d8f0cc', 0, 'Vidhan Sabha');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd94964d-9cc3-4212-9062-eaeab1045ccc', '1665363f-701e-4dbf-9ebc-2be010d8f0cc', 1, 'Rajya Sabha');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c557878-da62-4c69-bdf6-b4a27acbea7c', '1665363f-701e-4dbf-9ebc-2be010d8f0cc', 2, 'Legislative Council');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('663a2442-f5a8-4b91-9db6-614c4bdac464', '1665363f-701e-4dbf-9ebc-2be010d8f0cc', 3, 'State Assembly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1665363f-701e-4dbf-9ebc-2be010d8f0cc', 'dd94964d-9cc3-4212-9062-eaeab1045ccc', 'The Indian Parliament is bicameral, consisting of the Lok Sabha (House of the People, directly elected) and the Rajya Sabha (Council of States, indirectly elected).', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('dc9e0c9e-12a9-4230-8cc1-cec4e70bdf01', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 6, 'The Fundamental Duties of Indian citizens were added to the Constitution by which amendment?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f9f3dff-b0b9-4101-8534-914b4cee612a', 'dc9e0c9e-12a9-4230-8cc1-cec4e70bdf01', 0, '42nd Amendment (1976)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e6d6592-0522-46b5-a49a-43baa0623a82', 'dc9e0c9e-12a9-4230-8cc1-cec4e70bdf01', 1, '44th Amendment (1978)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('099da308-8c41-4d5f-a059-b4f142071d2d', 'dc9e0c9e-12a9-4230-8cc1-cec4e70bdf01', 2, '73rd Amendment (1992)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e281f884-affe-4daa-8490-8be7773bf648', 'dc9e0c9e-12a9-4230-8cc1-cec4e70bdf01', 3, '1st Amendment (1951)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dc9e0c9e-12a9-4230-8cc1-cec4e70bdf01', '4f9f3dff-b0b9-4101-8534-914b4cee612a', 'The 42nd Constitutional Amendment Act, 1976, added Part IVA (Article 51A) containing the Fundamental Duties of Indian citizens.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a1917490-c577-4aa0-a22f-312a86a6babe', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 7, 'Which Indian state has the longest coastline?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6af3c22-6705-4c2b-bc4e-bb15d55fdc7f', 'a1917490-c577-4aa0-a22f-312a86a6babe', 0, 'Tamil Nadu');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e2e021a-3fc0-4c2a-8c55-16d898ac0e11', 'a1917490-c577-4aa0-a22f-312a86a6babe', 1, 'Gujarat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89ae100c-5e71-46ad-b51b-1e1f003b9709', 'a1917490-c577-4aa0-a22f-312a86a6babe', 2, 'Andhra Pradesh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9fa56ac-95ac-435e-901f-29a69d47f530', 'a1917490-c577-4aa0-a22f-312a86a6babe', 3, 'Maharashtra');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a1917490-c577-4aa0-a22f-312a86a6babe', '6e2e021a-3fc0-4c2a-8c55-16d898ac0e11', 'Gujarat has the longest coastline among Indian states, at approximately 1,600 km.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0d209147-4cc1-4f38-a50d-a2dfece16aaa', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 8, 'The ''Green Revolution'' in India, associated with high-yield crop varieties, is most closely credited to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca955163-c8d5-4297-80ec-984856783da8', '0d209147-4cc1-4f38-a50d-a2dfece16aaa', 0, 'Verghese Kurien');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09e069ef-d15a-452d-89db-f664a25b060a', '0d209147-4cc1-4f38-a50d-a2dfece16aaa', 1, 'M.S. Swaminathan');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ab7637e-0760-400c-b1d4-77f5fc2259ce', '0d209147-4cc1-4f38-a50d-a2dfece16aaa', 2, 'Norman Borlaug alone, with no Indian contribution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2220cbf-de7d-4ba3-aaf5-be6113bdf6d8', '0d209147-4cc1-4f38-a50d-a2dfece16aaa', 3, 'Homi Bhabha');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0d209147-4cc1-4f38-a50d-a2dfece16aaa', '09e069ef-d15a-452d-89db-f664a25b060a', 'M.S. Swaminathan is widely credited as the architect of India''s Green Revolution, which introduced high-yield variety seeds and modern agricultural techniques starting in the 1960s.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e5f89285-bc6b-4058-bc4e-1adfc377e4b7', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 9, 'The headquarters of the Indian Space Research Organisation (ISRO) is located at:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('946d3701-5868-46d9-ada1-243ecd0d9b3d', 'e5f89285-bc6b-4058-bc4e-1adfc377e4b7', 0, 'Thiruvananthapuram');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e3b4b7c-de04-47c5-af53-e66049f99d3e', 'e5f89285-bc6b-4058-bc4e-1adfc377e4b7', 1, 'Bengaluru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3c7fd89-5e3b-4a99-a666-7a35cad02b60', 'e5f89285-bc6b-4058-bc4e-1adfc377e4b7', 2, 'Sriharikota');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1f09e7e-def6-4f07-ab6d-b3bbfb10a9c2', 'e5f89285-bc6b-4058-bc4e-1adfc377e4b7', 3, 'Ahmedabad');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e5f89285-bc6b-4058-bc4e-1adfc377e4b7', '2e3b4b7c-de04-47c5-af53-e66049f99d3e', 'ISRO''s headquarters is in Bengaluru, though it operates multiple centres across India, including the launch facility at Sriharikota (SDSC-SHAR).', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('28b5587d-bde0-4301-9121-9cd94da9c4a6', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 10, 'India''s currency, the Rupee, is issued by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b96863c7-8645-43aa-a28e-133fe2d6abb6', '28b5587d-bde0-4301-9121-9cd94da9c4a6', 0, 'Ministry of Finance directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65ecac2d-cebc-4204-9a7e-a51f2f59c5a9', '28b5587d-bde0-4301-9121-9cd94da9c4a6', 1, 'The Reserve Bank of India, under the RBI Act 1934');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78149afc-b5fa-4267-bba8-0743b46aa335', '28b5587d-bde0-4301-9121-9cd94da9c4a6', 2, 'The State Bank of India');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec1e9f28-35aa-4366-a213-c1c020407dae', '28b5587d-bde0-4301-9121-9cd94da9c4a6', 3, 'NITI Aayog');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('28b5587d-bde0-4301-9121-9cd94da9c4a6', '65ecac2d-cebc-4204-9a7e-a51f2f59c5a9', 'The Reserve Bank of India has the sole authority to issue currency notes in India (except the one-rupee note and coins, which are issued by the Ministry of Finance under the RBI''s supervision), under the RBI Act, 1934.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('83e28bbc-cdf9-4463-89f7-539c8863c8cc', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 11, 'The ''Statue of Unity'', the world''s tallest statue, is dedicated to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('991cb750-0548-4dae-8d5a-f44e6d8ac4d5', '83e28bbc-cdf9-4463-89f7-539c8863c8cc', 0, 'Mahatma Gandhi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5825b30-2f26-453b-9b60-560ebad40044', '83e28bbc-cdf9-4463-89f7-539c8863c8cc', 1, 'Sardar Vallabhbhai Patel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('958a9c58-b54b-4d31-ac94-ef464a1b06c0', '83e28bbc-cdf9-4463-89f7-539c8863c8cc', 2, 'Jawaharlal Nehru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab54127b-4499-4e45-a1b4-ee8f1e8f8362', '83e28bbc-cdf9-4463-89f7-539c8863c8cc', 3, 'B.R. Ambedkar');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('83e28bbc-cdf9-4463-89f7-539c8863c8cc', 'f5825b30-2f26-453b-9b60-560ebad40044', 'The Statue of Unity, located in Gujarat, is dedicated to Sardar Vallabhbhai Patel, India''s first Deputy Prime Minister and Home Minister, known for unifying princely states into the Indian Union.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('16174ca0-7151-4f90-8579-b757bd75a218', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 12, 'Which Indian PSU is primarily responsible for manufacturing battle tanks and armoured vehicles?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e68ee42f-6d22-4944-8d73-01d570a3699a', '16174ca0-7151-4f90-8579-b757bd75a218', 0, 'Bharat Electronics Limited (BEL)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f16fd957-7d81-4914-82d1-8c843c506e2d', '16174ca0-7151-4f90-8579-b757bd75a218', 1, 'Heavy Vehicles Factory (HVF), Avadi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d235bc8f-d61d-43ee-98e5-d4a52db440da', '16174ca0-7151-4f90-8579-b757bd75a218', 2, 'Hindustan Aeronautics Limited (HAL)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('345ac3e1-1d35-4589-93c0-cf387fc2204b', '16174ca0-7151-4f90-8579-b757bd75a218', 3, 'Mazagon Dock Shipbuilders Limited (MDL)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('16174ca0-7151-4f90-8579-b757bd75a218', 'f16fd957-7d81-4914-82d1-8c843c506e2d', 'The Heavy Vehicles Factory (HVF) at Avadi, part of the Armoured Vehicles Nigam Limited (AVANI) group under the Ministry of Defence, manufactures battle tanks such as the Arjun and T-90.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e0b0645d-cdeb-451f-a8b4-549ce7cddd84', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 13, 'The Chief of Defence Staff (CDS), a post created in 2019, primarily serves as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e86c4c6-f3b0-46b1-aa28-f9859c732cc4', 'e0b0645d-cdeb-451f-a8b4-549ce7cddd84', 0, 'The head of the Indian Army only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ec6d55a-8784-4617-adba-3766c8660eb9', 'e0b0645d-cdeb-451f-a8b4-549ce7cddd84', 1, 'The single-point military advisor to the Government and head of the Department of Military Affairs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('236b47a4-2794-4676-90dd-05c890d0ef56', 'e0b0645d-cdeb-451f-a8b4-549ce7cddd84', 2, 'The head of DRDO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7784b0d4-c70b-45e4-8e59-a71766b9604a', 'e0b0645d-cdeb-451f-a8b4-549ce7cddd84', 3, 'A ceremonial post with no operational role');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e0b0645d-cdeb-451f-a8b4-549ce7cddd84', '6ec6d55a-8784-4617-adba-3766c8660eb9', 'The CDS was created in 2019 as the single-point military advisor to the Government of India and head of the newly formed Department of Military Affairs, overseeing tri-service integration.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d103fa77-0af7-4661-b8c1-3ec273d58c0e', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 14, '''Antyodaya'', a term associated with welfare schemes for the poorest sections, was a concept popularised by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f2fa405-4ad4-4a4c-97ed-7ff18c4a13f7', 'd103fa77-0af7-4661-b8c1-3ec273d58c0e', 0, 'Jawaharlal Nehru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75508e00-909c-43d8-bdf0-62596a58e72a', 'd103fa77-0af7-4661-b8c1-3ec273d58c0e', 1, 'Deendayal Upadhyaya');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a72cb77a-b98e-4688-9ea8-87f099f05d9b', 'd103fa77-0af7-4661-b8c1-3ec273d58c0e', 2, 'Rajiv Gandhi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7fe95680-cb10-49e7-b4ee-81782c036168', 'd103fa77-0af7-4661-b8c1-3ec273d58c0e', 3, 'Indira Gandhi');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d103fa77-0af7-4661-b8c1-3ec273d58c0e', '75508e00-909c-43d8-bdf0-62596a58e72a', '''Antyodaya'' (upliftment of the last/poorest person) was a concept popularised by Deendayal Upadhyaya, later adopted as the name for several Indian welfare schemes targeting the most disadvantaged.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('32ad0d32-1f33-4add-a8ef-d4fa8f072e32', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 15, 'The largest producer of steel among Indian states is generally:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3d4d2da-a63f-45eb-bede-c62bf495777c', '32ad0d32-1f33-4add-a8ef-d4fa8f072e32', 0, 'Odisha');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e600ec2-36da-4f17-aa7a-6e0a94576edd', '32ad0d32-1f33-4add-a8ef-d4fa8f072e32', 1, 'Jharkhand');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3591985d-ca9b-404d-bd2b-b6a327399a4d', '32ad0d32-1f33-4add-a8ef-d4fa8f072e32', 2, 'Chhattisgarh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dde3f6d8-b180-4dba-abb0-dded1b427a63', '32ad0d32-1f33-4add-a8ef-d4fa8f072e32', 3, 'It varies by year, but the eastern mineral belt states (Odisha, Jharkhand, Chhattisgarh, West Bengal) collectively dominate India''s steel production due to iron ore/coal proximity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('32ad0d32-1f33-4add-a8ef-d4fa8f072e32', 'dde3f6d8-b180-4dba-abb0-dded1b427a63', 'India''s steel production is concentrated in the eastern mineral belt states (Odisha, Jharkhand, Chhattisgarh, West Bengal) due to their proximity to iron ore and coal deposits — exact state-wise rankings shift year to year, so this is best understood as a regional pattern rather than one fixed state.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c189f52e-4d02-45e0-8b20-a0e2e6251fb4', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 16, 'The ''Beti Bachao Beti Padhao'' scheme primarily addresses:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7a3fdf4-4cb7-4cc9-81a1-d923e0fb62ed', 'c189f52e-4d02-45e0-8b20-a0e2e6251fb4', 0, 'Rural electrification');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5d91ea9-a0da-47f3-b7bc-fcf160223ac1', 'c189f52e-4d02-45e0-8b20-a0e2e6251fb4', 1, 'Declining child sex ratio and promoting girls'' education');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a920282-510a-411f-ad52-c78fd62b3973', 'c189f52e-4d02-45e0-8b20-a0e2e6251fb4', 2, 'Farmer income support');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f4ea4b7-6434-439d-887c-c203f82d85b4', 'c189f52e-4d02-45e0-8b20-a0e2e6251fb4', 3, 'Urban housing');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c189f52e-4d02-45e0-8b20-a0e2e6251fb4', 'd5d91ea9-a0da-47f3-b7bc-fcf160223ac1', '''Beti Bachao Beti Padhao'' (Save the Daughter, Educate the Daughter) is a Government of India scheme addressing the declining child sex ratio and promoting the education and welfare of girl children.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('236a3abd-cf9d-4ea0-ba3e-37876390f3f4', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 17, 'The Wright Brothers achieved the first powered, controlled flight in which year?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('caf03d7e-6d16-4ada-9d01-3ae4b906a800', '236a3abd-cf9d-4ea0-ba3e-37876390f3f4', 0, '1899');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a3b1465-cf60-43ff-9549-8db16c5c7ab4', '236a3abd-cf9d-4ea0-ba3e-37876390f3f4', 1, '1903');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2afe1868-24ba-4a84-9dce-ab9e7dd364b8', '236a3abd-cf9d-4ea0-ba3e-37876390f3f4', 2, '1910');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6cf42ff-ee24-483d-a14e-fb5358682a9f', '236a3abd-cf9d-4ea0-ba3e-37876390f3f4', 3, '1918');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('236a3abd-cf9d-4ea0-ba3e-37876390f3f4', '1a3b1465-cf60-43ff-9549-8db16c5c7ab4', 'The Wright Brothers achieved the first successful powered, sustained, and controlled flight of a heavier-than-air aircraft on December 17, 1903, at Kitty Hawk, North Carolina.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ac67efb5-9787-4f59-bf95-aa7f231fbafa', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 18, 'India''s first satellite, launched in 1975, was named:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4e37af6-33f8-4c12-b00f-92b59ac8819e', 'ac67efb5-9787-4f59-bf95-aa7f231fbafa', 0, 'Rohini');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36af0ba6-9f6f-4735-9f01-cbe84ebb872c', 'ac67efb5-9787-4f59-bf95-aa7f231fbafa', 1, 'Aryabhata');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09954aa3-649c-4b25-a217-9aeac213c609', 'ac67efb5-9787-4f59-bf95-aa7f231fbafa', 2, 'Bhaskara');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95b87e96-a782-4f3f-a2e4-77da3e32b244', 'ac67efb5-9787-4f59-bf95-aa7f231fbafa', 3, 'INSAT-1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ac67efb5-9787-4f59-bf95-aa7f231fbafa', '36af0ba6-9f6f-4735-9f01-cbe84ebb872c', 'Aryabhata, launched in 1975 with Soviet assistance, was India''s first satellite, named after the ancient Indian mathematician and astronomer.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('09023223-75d0-4328-9535-94ad21ac4813', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 19, 'The term ''GDP deflator'' in economics refers to a measure of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db87b8eb-05dd-4b55-b37a-37899c30391c', '09023223-75d0-4328-9535-94ad21ac4813', 0, 'The unemployment rate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f27bdbb-6693-4165-a196-d9a9f82e7825', '09023223-75d0-4328-9535-94ad21ac4813', 1, 'A price index measuring the level of prices of all new, domestically produced goods and services in an economy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43b38e15-142c-4ca6-8633-27d7e30d1e95', '09023223-75d0-4328-9535-94ad21ac4813', 2, 'The fiscal deficit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('911f99a1-4890-402f-b9dc-62dbb745a6a2', '09023223-75d0-4328-9535-94ad21ac4813', 3, 'Foreign exchange reserves');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('09023223-75d0-4328-9535-94ad21ac4813', '5f27bdbb-6693-4165-a196-d9a9f82e7825', 'The GDP deflator is a price index that measures the overall level of prices of all goods and services produced domestically in an economy, used to convert nominal GDP into real GDP.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6a894b1f-36aa-4d21-a170-4b006a00a5a1', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 20, 'The engineering discipline that deals with the design and analysis of thermal power plants, IC engines, and refrigeration systems is primarily:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3b9600f-115b-4e16-851d-a3913fa2a5ae', '6a894b1f-36aa-4d21-a170-4b006a00a5a1', 0, 'Civil Engineering');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3ba5158-40d8-4ff5-93ff-19e0c46e759a', '6a894b1f-36aa-4d21-a170-4b006a00a5a1', 1, 'Mechanical Engineering');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7646ed87-6c89-4f6c-bafa-4ca725539934', '6a894b1f-36aa-4d21-a170-4b006a00a5a1', 2, 'Electrical Engineering');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02a45774-8413-4e33-a45c-4c31fce305c1', '6a894b1f-36aa-4d21-a170-4b006a00a5a1', 3, 'Chemical Engineering');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6a894b1f-36aa-4d21-a170-4b006a00a5a1', 'd3ba5158-40d8-4ff5-93ff-19e0c46e759a', 'Mechanical engineering encompasses thermodynamics-based systems including thermal power plants, internal combustion engines, and refrigeration/HVAC systems, among its core sub-disciplines.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

-- ── Section: English & Reasoning (40 questions) — English & Reasoning — general competitive-exam style practice content, not an official HAL paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('afcaec15-b515-4df9-be48-6e4d4ba9453b', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 21, 'Choose the option with the correct error identification: ''Each of the students have submitted their assignment on time.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('794939ee-97c5-4cda-80c3-b52f096a9464', 'afcaec15-b515-4df9-be48-6e4d4ba9453b', 0, '''Each'' should be ''All''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2f21eb6-34f4-4842-a778-f06829d0187d', 'afcaec15-b515-4df9-be48-6e4d4ba9453b', 1, '''have'' should be ''has''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47c375b0-ca64-4854-b80f-025e454b1fcb', 'afcaec15-b515-4df9-be48-6e4d4ba9453b', 2, '''their'' should be ''his''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4df03a2d-22f2-484e-bfc3-0dea6597a87f', 'afcaec15-b515-4df9-be48-6e4d4ba9453b', 3, 'No error');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('afcaec15-b515-4df9-be48-6e4d4ba9453b', 'c2f21eb6-34f4-4842-a778-f06829d0187d', '''Each'' is grammatically singular and requires a singular verb — the correct form is ''Each of the students HAS submitted...''', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('85c478de-3f7a-469d-b935-2780a457d345', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 22, 'Fill in the blank: ''The design team ________ working on the prototype since Monday.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c89ee5b7-fa25-4ea1-9362-0cfa85f45eb1', '85c478de-3f7a-469d-b935-2780a457d345', 0, 'is');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ac877f9-ddfb-42b3-abce-d9a4e93f3ac9', '85c478de-3f7a-469d-b935-2780a457d345', 1, 'has been');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0112fe61-6997-4fb2-a7f0-ab8388fd4a9e', '85c478de-3f7a-469d-b935-2780a457d345', 2, 'have');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('efd02440-a826-4805-8999-712ff23c157b', '85c478de-3f7a-469d-b935-2780a457d345', 3, 'was');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('85c478de-3f7a-469d-b935-2780a457d345', '5ac877f9-ddfb-42b3-abce-d9a4e93f3ac9', '''Since Monday'' signals an action continuing from a past point to the present, requiring the present perfect continuous tense — ''has been working''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9efa52a2-5762-4e95-802f-bb09e46c953d', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 23, 'Choose the correct synonym for ''Robust'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c43b125-fc3a-466e-aba7-0de70e0f418b', '9efa52a2-5762-4e95-802f-bb09e46c953d', 0, 'Fragile');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0c5c1ab-3f77-46fe-b82e-2232ca70e6b7', '9efa52a2-5762-4e95-802f-bb09e46c953d', 1, 'Sturdy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c05a89e-ac8e-41aa-af97-98228604c801', '9efa52a2-5762-4e95-802f-bb09e46c953d', 2, 'Delicate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84d13d28-0918-452e-adf0-82946fc89408', '9efa52a2-5762-4e95-802f-bb09e46c953d', 3, 'Ambiguous');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9efa52a2-5762-4e95-802f-bb09e46c953d', 'f0c5c1ab-3f77-46fe-b82e-2232ca70e6b7', '''Robust'' means strong and durable; not likely to fail — ''Sturdy'' is the closest synonym.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0b183cfb-38b7-47fc-9ea3-e2d0cdcb6def', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 24, 'Choose the correct antonym for ''Precision'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9e81d1f-fea6-4964-807d-36945a5ffb93', '0b183cfb-38b7-47fc-9ea3-e2d0cdcb6def', 0, 'Accuracy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('defe1996-61d4-42a7-abdb-c08f83671dc1', '0b183cfb-38b7-47fc-9ea3-e2d0cdcb6def', 1, 'Exactness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d597f8a2-f6af-4c36-acdf-d2cadafd9f82', '0b183cfb-38b7-47fc-9ea3-e2d0cdcb6def', 2, 'Imprecision');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64e867f2-3284-495a-94b4-b00026fe2366', '0b183cfb-38b7-47fc-9ea3-e2d0cdcb6def', 3, 'Reliability');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0b183cfb-38b7-47fc-9ea3-e2d0cdcb6def', 'd597f8a2-f6af-4c36-acdf-d2cadafd9f82', '''Precision'' means the quality of being exact and accurate; its direct antonym is ''Imprecision'' (lack of exactness).', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9b22fb13-8c6b-4118-bd7b-bc36b9b7a761', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 25, 'Identify the correctly punctuated sentence:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('033191ac-fbbc-45f5-834d-658be5cc66e9', '9b22fb13-8c6b-4118-bd7b-bc36b9b7a761', 0, 'The machine which was recently repaired, broke down again.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42fdf632-a4f3-44ce-88aa-dbdc98a24591', '9b22fb13-8c6b-4118-bd7b-bc36b9b7a761', 1, 'The machine, which was recently repaired broke down again.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('581c5140-f084-4ad2-96f1-01b3af9846d9', '9b22fb13-8c6b-4118-bd7b-bc36b9b7a761', 2, 'The machine, which was recently repaired, broke down again.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42021cb6-87ac-445c-9ace-18f801032588', '9b22fb13-8c6b-4118-bd7b-bc36b9b7a761', 3, 'The machine which, was recently repaired, broke down again.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9b22fb13-8c6b-4118-bd7b-bc36b9b7a761', '581c5140-f084-4ad2-96f1-01b3af9846d9', 'The clause ''which was recently repaired'' is a non-restrictive (additional information) clause, correctly set off by commas on both sides.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('be59735b-d82f-4f22-9ce0-60e7f7d289a8', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 26, 'Choose the correctly spelled word:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de513d1f-75cd-4755-8759-d8dcab628189', 'be59735b-d82f-4f22-9ce0-60e7f7d289a8', 0, 'Recieve');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb62a5ba-a1a7-4853-85cc-47d7fec76ba0', 'be59735b-d82f-4f22-9ce0-60e7f7d289a8', 1, 'Receive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0cc85457-924e-4997-8a6c-36879d149e55', 'be59735b-d82f-4f22-9ce0-60e7f7d289a8', 2, 'Receeve');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e54cd01d-c994-443b-98fc-8ecf904fae85', 'be59735b-d82f-4f22-9ce0-60e7f7d289a8', 3, 'Receve');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('be59735b-d82f-4f22-9ce0-60e7f7d289a8', 'eb62a5ba-a1a7-4853-85cc-47d7fec76ba0', '''Receive'' is the correct spelling — following the standard ''i before e except after c'' rule.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('be88346a-7b85-4d44-9033-4c0205e193be', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 27, 'Identify the part of speech of the underlined word: ''The engine ran SMOOTHLY after the repair.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70c85f11-c96e-4883-86a0-dbcfb2619c91', 'be88346a-7b85-4d44-9033-4c0205e193be', 0, 'Adjective');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b5e8016-1d22-470a-bb95-d7924282bd0c', 'be88346a-7b85-4d44-9033-4c0205e193be', 1, 'Adverb');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84447bda-5d5b-4038-ba5a-dc1c9db1a7a4', 'be88346a-7b85-4d44-9033-4c0205e193be', 2, 'Noun');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b77001a-905f-4a52-aaec-1b567b9c2150', 'be88346a-7b85-4d44-9033-4c0205e193be', 3, 'Preposition');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('be88346a-7b85-4d44-9033-4c0205e193be', '4b5e8016-1d22-470a-bb95-d7924282bd0c', '''Smoothly'' modifies the verb ''ran'', describing HOW the engine ran — it is an adverb.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('44c307ae-a975-4ab0-84f0-d92a62dca5a3', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 28, 'Choose the option with the correct passive voice for: ''The engineer designed the new component.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('56ff06a0-e766-4e5c-b8f9-98b8ee8cd729', '44c307ae-a975-4ab0-84f0-d92a62dca5a3', 0, 'The new component is designed by the engineer.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94001aff-fc4e-4b04-b418-d49b42a27620', '44c307ae-a975-4ab0-84f0-d92a62dca5a3', 1, 'The new component was designed by the engineer.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('781eb556-45e0-445b-b3fc-e179d4e2db54', '44c307ae-a975-4ab0-84f0-d92a62dca5a3', 2, 'The new component designs by the engineer.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c899108b-5b04-4c06-8c85-ca4816342ec7', '44c307ae-a975-4ab0-84f0-d92a62dca5a3', 3, 'The new component has design by the engineer.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('44c307ae-a975-4ab0-84f0-d92a62dca5a3', '94001aff-fc4e-4b04-b418-d49b42a27620', 'The original sentence is simple past active (''designed'') — its correct passive-voice equivalent is simple past passive: ''was designed by''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('45922019-f9c7-4c7b-a9fa-4a8d5c913049', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 29, 'Choose the correct idiom to complete: ''The project deadline is approaching fast, so we need to ________ and finalize the design.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6853e8ad-79f7-4b72-9e12-c3f4e2914133', '45922019-f9c7-4c7b-a9fa-4a8d5c913049', 0, 'let the cat out of the bag');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a280e87-4d2c-4508-a254-67bffd15b8ee', '45922019-f9c7-4c7b-a9fa-4a8d5c913049', 1, 'pull up our socks');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b03734ed-51a2-4277-a583-fe14cfb5ba2b', '45922019-f9c7-4c7b-a9fa-4a8d5c913049', 2, 'beat around the bush');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('308abb3f-754b-44ed-bcbf-253ad2da5750', '45922019-f9c7-4c7b-a9fa-4a8d5c913049', 3, 'spill the beans');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('45922019-f9c7-4c7b-a9fa-4a8d5c913049', '0a280e87-4d2c-4508-a254-67bffd15b8ee', '''Pull up our socks'' means to prepare to work hard or improve effort, fitting the context of an approaching deadline requiring urgency.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('53bc7f87-9623-4bb5-b18a-863f638e3a43', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 30, 'Select the option nearest in meaning to ''Meticulous'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b23d3c47-62bc-47b1-9f92-99d829c8499e', '53bc7f87-9623-4bb5-b18a-863f638e3a43', 0, 'Careless');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92a35f7c-d428-4f97-a8c7-d4fe5dad4f2a', '53bc7f87-9623-4bb5-b18a-863f638e3a43', 1, 'Thorough');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6de7b25a-af4f-4b67-8a05-1b97b6e8bb9f', '53bc7f87-9623-4bb5-b18a-863f638e3a43', 2, 'Hasty');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc9cd147-bfe2-4bb6-9dae-a876e52bc08f', '53bc7f87-9623-4bb5-b18a-863f638e3a43', 3, 'Vague');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('53bc7f87-9623-4bb5-b18a-863f638e3a43', '92a35f7c-d428-4f97-a8c7-d4fe5dad4f2a', '''Meticulous'' means showing great attention to detail; very careful — ''Thorough'' captures this meaning closely.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cc10bd2c-6329-4731-8f81-7895772920c5', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 31, 'Choose the correctly formed sentence:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4eb78c0d-a424-44ec-bc57-30b1fb6cdc16', 'cc10bd2c-6329-4731-8f81-7895772920c5', 0, 'Neither the manager nor the engineers was present.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ab04d27-7f4d-40e4-82f8-987b93201f85', 'cc10bd2c-6329-4731-8f81-7895772920c5', 1, 'Neither the manager nor the engineers were present.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7095d30e-fdc1-4ac4-a99b-0717c30b259f', 'cc10bd2c-6329-4731-8f81-7895772920c5', 2, 'Neither the manager or the engineers were present.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39a44ad3-4181-4739-916b-49ea826f0abb', 'cc10bd2c-6329-4731-8f81-7895772920c5', 3, 'Neither the manager and the engineers were present.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cc10bd2c-6329-4731-8f81-7895772920c5', '5ab04d27-7f4d-40e4-82f8-987b93201f85', 'With ''neither...nor'', the verb agrees with the noun closest to it (''engineers'', plural) — so ''were present'' is correct; also, ''neither'' must pair with ''nor'', not ''or'' or ''and''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('61bb24e1-d262-4c15-b4df-0d8d086f30b8', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 32, 'Fill in the blank with the correct preposition: ''The pressure gauge is calibrated ________ a reference standard.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c145a66-3155-4937-89ab-6b25fc5a3dcf', '61bb24e1-d262-4c15-b4df-0d8d086f30b8', 0, 'with');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4e03303-9b9e-47c4-92e7-b15719d9b1d9', '61bb24e1-d262-4c15-b4df-0d8d086f30b8', 1, 'against');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32692d9f-7b3e-4e5f-9ef8-9a025ead0c95', '61bb24e1-d262-4c15-b4df-0d8d086f30b8', 2, 'for');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83c63057-fd09-4a74-ad8c-38656a1beea6', '61bb24e1-d262-4c15-b4df-0d8d086f30b8', 3, 'by');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('61bb24e1-d262-4c15-b4df-0d8d086f30b8', 'd4e03303-9b9e-47c4-92e7-b15719d9b1d9', 'The idiomatic preposition following ''calibrated'' when comparing against a standard is ''against'' — ''calibrated against a reference standard''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3f0984ca-be95-4e39-89e6-399662614651', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 33, 'Choose the option that correctly converts to reported speech: She said, ''I have finished the report.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('060d88a8-baba-44cd-9101-de5c0fd23d5f', '3f0984ca-be95-4e39-89e6-399662614651', 0, 'She said that she has finished the report.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bee33382-7522-4015-aaf1-e61efdb6dcff', '3f0984ca-be95-4e39-89e6-399662614651', 1, 'She said that she had finished the report.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be791c05-42f7-49d3-b7d4-07b4e47dc438', '3f0984ca-be95-4e39-89e6-399662614651', 2, 'She said that she finished the report.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a8e828a-2c0a-4374-98ae-17b07ae646b3', '3f0984ca-be95-4e39-89e6-399662614651', 3, 'She said that she is finishing the report.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3f0984ca-be95-4e39-89e6-399662614651', 'bee33382-7522-4015-aaf1-e61efdb6dcff', 'In reported speech, present perfect (''have finished'') shifts back to past perfect (''had finished'') when the reporting verb is in the past tense.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9c4cf1d0-4e25-44bb-956c-a110a482ded9', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 34, 'Identify the correctly spelled word among the options:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13639dba-7556-4d4a-8ea8-b70781a0e7c9', '9c4cf1d0-4e25-44bb-956c-a110a482ded9', 0, 'Accomodate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2dfc03d-532a-4c2c-a0b2-8a0dbfaebf17', '9c4cf1d0-4e25-44bb-956c-a110a482ded9', 1, 'Acommodate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('779a1e19-d1ba-47c6-b904-762dbcd5d72a', '9c4cf1d0-4e25-44bb-956c-a110a482ded9', 2, 'Accommodate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('004e9b91-ba97-403b-b858-d4cf41e577f4', '9c4cf1d0-4e25-44bb-956c-a110a482ded9', 3, 'Acomodate');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9c4cf1d0-4e25-44bb-956c-a110a482ded9', '779a1e19-d1ba-47c6-b904-762dbcd5d72a', '''Accommodate'' is the correct spelling — it has a double ''c'' and a double ''m''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e7e8cac5-90ac-4e75-880a-985b42e466b3', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 35, 'Identify the sentence with correct subject-verb agreement:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9177cb38-7791-431e-abf5-e437fdc1fd93', 'e7e8cac5-90ac-4e75-880a-985b42e466b3', 0, 'A number of components was found defective.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d9e0207-c631-4dde-9717-4e881a11661c', 'e7e8cac5-90ac-4e75-880a-985b42e466b3', 1, 'A number of components were found defective.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d237bdb-f6e0-4341-8897-8729bfc2dd52', 'e7e8cac5-90ac-4e75-880a-985b42e466b3', 2, 'The number of components were found defective.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82c12dcc-98fa-4a4a-b6c4-966d063eb6fe', 'e7e8cac5-90ac-4e75-880a-985b42e466b3', 3, 'The number of component was found defective.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e7e8cac5-90ac-4e75-880a-985b42e466b3', '0d9e0207-c631-4dde-9717-4e881a11661c', '''A number of'' (meaning ''several'') takes a plural verb — ''A number of components WERE found defective'' is correct; ''The number of'' would instead take a singular verb.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5be248db-f2f1-451c-9fa2-4bc47719a0f4', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 36, 'Choose the word closest in meaning to ''Redundant'' (in an engineering/systems context):');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef22111b-f5e1-4ae6-a3d0-1158e27f511b', '5be248db-f2f1-451c-9fa2-4bc47719a0f4', 0, 'Essential and irreplaceable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5a7fd13-3bc1-4ae3-accd-ae170a8dbb2b', '5be248db-f2f1-451c-9fa2-4bc47719a0f4', 1, 'Duplicated/backup, providing fault tolerance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92eaa982-4f19-4773-be8e-3b0434586027', '5be248db-f2f1-451c-9fa2-4bc47719a0f4', 2, 'Broken or non-functional');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5bfdf9b1-5a82-4954-ae07-86ad3006c723', '5be248db-f2f1-451c-9fa2-4bc47719a0f4', 3, 'Newly installed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5be248db-f2f1-451c-9fa2-4bc47719a0f4', 'a5a7fd13-3bc1-4ae3-accd-ae170a8dbb2b', 'In an engineering context, ''redundant'' often refers to a duplicated component or system providing a backup in case of failure — improving fault tolerance, distinct from its everyday meaning of ''unnecessary''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c6d00443-9937-4ba7-8f1c-0fda936fbc51', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 37, 'Choose the correct sentence:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20404193-cdd0-4d6c-98b7-4279cee8674c', 'c6d00443-9937-4ba7-8f1c-0fda936fbc51', 0, 'The results were shared between the three teams.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7e993c0-b758-42eb-8e91-0453073218db', 'c6d00443-9937-4ba7-8f1c-0fda936fbc51', 1, 'The results were shared among the three teams.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1215745c-eed0-468d-852f-a52205eda4d4', 'c6d00443-9937-4ba7-8f1c-0fda936fbc51', 2, 'The results were shared between the three team.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6bf8ae9-a427-4cc6-86a5-2151b48b0812', 'c6d00443-9937-4ba7-8f1c-0fda936fbc51', 3, 'The results were shared among the three team.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c6d00443-9937-4ba7-8f1c-0fda936fbc51', 'e7e993c0-b758-42eb-8e91-0453073218db', '''Between'' is traditionally used for exactly two entities, while ''among'' is used for three or more — since there are three teams, ''among'' is the grammatically correct choice.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d8747cb9-fb13-4e5c-9026-ca0b3dc8a946', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 38, 'Choose the correctly punctuated sentence:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39414121-187d-41c0-9ac0-ce1298f8a8bf', 'd8747cb9-fb13-4e5c-9026-ca0b3dc8a946', 0, 'The toolkit contains a wrench a screwdriver, and pliers.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6054634d-268f-4e45-a4da-6b53ce12d23d', 'd8747cb9-fb13-4e5c-9026-ca0b3dc8a946', 1, 'The toolkit contains a wrench, a screwdriver and pliers.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8911cb00-f305-4c76-a83b-909ca90bc6cd', 'd8747cb9-fb13-4e5c-9026-ca0b3dc8a946', 2, 'The toolkit contains a wrench, a screwdriver, and pliers.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce30d284-f524-43b2-b657-c9b60e4ae662', 'd8747cb9-fb13-4e5c-9026-ca0b3dc8a946', 3, 'The toolkit contains; a wrench, a screwdriver, pliers.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d8747cb9-fb13-4e5c-9026-ca0b3dc8a946', '8911cb00-f305-4c76-a83b-909ca90bc6cd', 'A comma should separate each item in a list, including before the final conjunction (the Oxford comma) — ''a wrench, a screwdriver, and pliers'' is the clearest, standard form.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('99385acf-42d2-4b72-bc01-2d5dafdea484', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 39, 'Choose the option nearest in meaning to the idiom ''to iron out the issues'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8eaffbbf-42cc-4282-a124-f3d624492fbc', '99385acf-42d2-4b72-bc01-2d5dafdea484', 0, 'To create new problems');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b356f1f1-8615-49d0-b3b0-aa8c03d72491', '99385acf-42d2-4b72-bc01-2d5dafdea484', 1, 'To resolve difficulties or disagreements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d7b44e3-cb4a-4940-857f-8289f8877a21', '99385acf-42d2-4b72-bc01-2d5dafdea484', 2, 'To ignore a problem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('838db652-c041-4228-8be1-1cd35272e01d', '99385acf-42d2-4b72-bc01-2d5dafdea484', 3, 'To postpone a decision');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('99385acf-42d2-4b72-bc01-2d5dafdea484', 'b356f1f1-8615-49d0-b3b0-aa8c03d72491', '''To iron out'' means to resolve difficulties or smooth out problems through discussion — ''to resolve difficulties'' captures this meaning.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('53a8c3b1-972f-4df8-b1e3-2c9f391528b0', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 40, 'Fill in the blank: ''The technician was praised for his ________ approach to troubleshooting.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2adc52b7-eb53-4670-a65b-a554ec030eaa', '53a8c3b1-972f-4df8-b1e3-2c9f391528b0', 0, 'haphazard');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5479014c-2055-456f-99c2-cab5671d8633', '53a8c3b1-972f-4df8-b1e3-2c9f391528b0', 1, 'systematic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d5d512e-08d1-43bc-9667-43cdf1052e2f', '53a8c3b1-972f-4df8-b1e3-2c9f391528b0', 2, 'careless');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4832302a-4632-49ca-ba8e-077b026fe376', '53a8c3b1-972f-4df8-b1e3-2c9f391528b0', 3, 'impulsive');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('53a8c3b1-972f-4df8-b1e3-2c9f391528b0', '5479014c-2055-456f-99c2-cab5671d8633', '''Systematic'' (methodical, organized) fits the context of being praised for troubleshooting effectively, unlike the other options, which describe disorganized or careless approaches.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e2666330-d2ee-41b9-be87-7674eac21f33', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 41, 'Statements: All gears are mechanical components. Some mechanical components are made of steel. Conclusions: I. Some gears are made of steel. II. All mechanical components are gears. Which conclusion(s) follow?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2d98b84-2264-475e-bf16-b93b9f596553', 'e2666330-d2ee-41b9-be87-7674eac21f33', 0, 'Only I follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('358e499f-b0da-4380-b1bd-39d70020b215', 'e2666330-d2ee-41b9-be87-7674eac21f33', 1, 'Only II follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7d33f89-e955-48f1-9ee0-77e174a7cd82', 'e2666330-d2ee-41b9-be87-7674eac21f33', 2, 'Both follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0813439-c38d-41ee-9503-611c7c452c26', 'e2666330-d2ee-41b9-be87-7674eac21f33', 3, 'Neither follows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e2666330-d2ee-41b9-be87-7674eac21f33', 'c0813439-c38d-41ee-9503-611c7c452c26', 'There''s no guarantee the ''made of steel'' subset of mechanical components overlaps with the ''gears'' subset, so I doesn''t necessarily follow. II reverses the given relationship incorrectly. Neither conclusion follows with certainty.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('08848f1d-5e35-45d8-b6d5-2ae379b5e635', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 42, 'If ''ENGINE'' is coded as ''FOHJOF'' in a certain code, how is ''MOTION'' coded in that language?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff85a8ff-b549-4e4b-bda6-0a002897aeb3', '08848f1d-5e35-45d8-b6d5-2ae379b5e635', 0, 'NPUJPO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a25513bb-0ea6-4a65-ab27-6993b3405f66', '08848f1d-5e35-45d8-b6d5-2ae379b5e635', 1, 'NPUJOO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e17f3ba-5ea6-4148-8bbc-c5ab3576e360', '08848f1d-5e35-45d8-b6d5-2ae379b5e635', 2, 'MPUJPO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17d3deeb-e398-44cd-b0ae-6de22dfe4d6c', '08848f1d-5e35-45d8-b6d5-2ae379b5e635', 3, 'NPTJPO');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('08848f1d-5e35-45d8-b6d5-2ae379b5e635', 'ff85a8ff-b549-4e4b-bda6-0a002897aeb3', 'Each letter is shifted forward by 1 in the alphabet (E→F, N→O, G→H, I→J, N→O, E→F). Applying this to MOTION: M→N, O→P, T→U, I→J, O→P, N→O, giving ''NPUJPO''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7c62fb27-216c-446d-af4d-2e2b438ac390', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 43, 'Find the next number in the series: 3, 8, 15, 24, 35, ?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7e5d35d-f0db-4d32-96fa-6ff72fe4d173', '7c62fb27-216c-446d-af4d-2e2b438ac390', 0, '46');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('61faaf1b-ed88-4bb4-aa1d-8b913d5ee51e', '7c62fb27-216c-446d-af4d-2e2b438ac390', 1, '48');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86c0119d-6a61-4824-8e3b-1f31e65bb472', '7c62fb27-216c-446d-af4d-2e2b438ac390', 2, '50');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de897bb9-8931-45fa-863c-bda914998954', '7c62fb27-216c-446d-af4d-2e2b438ac390', 3, '44');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7c62fb27-216c-446d-af4d-2e2b438ac390', '61faaf1b-ed88-4bb4-aa1d-8b913d5ee51e', 'The differences are 5, 7, 9, 11, 13 (consecutive odd numbers increasing by 2). 35 + 13 = 48. (This also matches the pattern n² + 2n: 1+2=3, 4+4=8, 9+6=15, 16+8=24, 25+10=35, 36+12=48.)', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0f5284ca-0987-4ac2-a344-30d6383c97fc', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 44, 'Choose the odd one out: Piston, Crankshaft, Camshaft, Voltmeter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63a62a9e-f930-4bfb-be16-b7f636cb0fd1', '0f5284ca-0987-4ac2-a344-30d6383c97fc', 0, 'Piston');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86159f96-1c91-4956-ab33-a479f16ff43f', '0f5284ca-0987-4ac2-a344-30d6383c97fc', 1, 'Crankshaft');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81b24890-20af-4da5-9049-7a992f2e9cb1', '0f5284ca-0987-4ac2-a344-30d6383c97fc', 2, 'Camshaft');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('61a9e7e5-2209-4331-a7ff-3ac658c35c2a', '0f5284ca-0987-4ac2-a344-30d6383c97fc', 3, 'Voltmeter');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0f5284ca-0987-4ac2-a344-30d6383c97fc', '61a9e7e5-2209-4331-a7ff-3ac658c35c2a', 'Piston, Crankshaft, and Camshaft are all mechanical components of an internal combustion engine; a Voltmeter is an electrical measuring instrument, unrelated to engine mechanics — the odd one out.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('955bcd09-0602-4c5c-b2cb-f4cfb032b4a0', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 45, 'Five machines P, Q, R, S, T are ranked by output, all different. P produces more than Q but less than R. S produces the least. T produces more than R. What is the correct ranking from highest to lowest output?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cee6fda5-91c1-4ebb-8e61-d6b16d7a9c87', '955bcd09-0602-4c5c-b2cb-f4cfb032b4a0', 0, 'T, R, P, Q, S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24d170b7-5f82-4f5c-a141-9cddd133c633', '955bcd09-0602-4c5c-b2cb-f4cfb032b4a0', 1, 'T, R, Q, P, S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6432897c-8153-4542-b5e0-55d9ffaa7000', '955bcd09-0602-4c5c-b2cb-f4cfb032b4a0', 2, 'R, T, P, Q, S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c979cce-a0d6-49a6-a658-4578219d1dd5', '955bcd09-0602-4c5c-b2cb-f4cfb032b4a0', 3, 'T, P, R, Q, S');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('955bcd09-0602-4c5c-b2cb-f4cfb032b4a0', 'cee6fda5-91c1-4ebb-8e61-d6b16d7a9c87', 'Given: R > P > Q, T > R, S is least. Combining: T > R > P > Q > S — matching option A.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('74de095a-d731-40a0-8055-3f8bf68af505', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 46, 'If ''A × B'' means ''A is the son of B'', and ''A + B'' means ''A is the brother of B'', what does ''P × Q + R'' establish?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d9c64c4-6d83-46ba-8cb4-a4a399bda145', '74de095a-d731-40a0-8055-3f8bf68af505', 0, 'P is R''s father');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4fce86e-112a-49dd-9bc1-15bb57d50892', '74de095a-d731-40a0-8055-3f8bf68af505', 1, 'P is Q''s son, and Q is R''s brother — so P is also R''s nephew (assuming R and Q share a parent)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('11e5f3d7-43ee-4ec4-a5ff-189b5acdf88a', '74de095a-d731-40a0-8055-3f8bf68af505', 2, 'P and R are unrelated');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3602db2-984f-43f3-bb86-8f65889f7f82', '74de095a-d731-40a0-8055-3f8bf68af505', 3, 'P is Q''s mother');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('74de095a-d731-40a0-8055-3f8bf68af505', 'f4fce86e-112a-49dd-9bc1-15bb57d50892', '''P × Q'' means P is the son of Q. ''Q + R'' means Q is the brother of R. So P is Q''s son, and Q is R''s sibling — making P the nephew (or niece) of R, matching option B''s full statement.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('60303678-6e14-47fd-afb8-e73e2650b0b4', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 47, 'Complete the analogy: Piston is to Cylinder as Rotor is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68e21cb1-c14b-4a6c-ba0b-8b9a29240a75', '60303678-6e14-47fd-afb8-e73e2650b0b4', 0, 'Stator');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b944733-99ab-41c9-803b-bcbbd8dfb0de', '60303678-6e14-47fd-afb8-e73e2650b0b4', 1, 'Bearing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72188a0c-b492-4ba0-9847-106d353d40a2', '60303678-6e14-47fd-afb8-e73e2650b0b4', 2, 'Shaft');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d074e40c-763a-4b80-b2ee-334a07ff5bca', '60303678-6e14-47fd-afb8-e73e2650b0b4', 3, 'Gear');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('60303678-6e14-47fd-afb8-e73e2650b0b4', '68e21cb1-c14b-4a6c-ba0b-8b9a29240a75', 'A piston moves within a cylinder (the piston is the moving part, the cylinder the containing structure); similarly, a rotor is the moving part that operates within a stator (the stationary part) in a rotating electrical machine — the analogy is ''moving part : containing/stationary structure''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4ab087e7-b0a0-4c6a-9f2f-1209d99c6455', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 48, 'In a certain code, if ''PISTON'' is coded as ''16-9-19-20-15-14'' (each letter replaced by its alphabetical position), what is ''ENGINE'' coded as?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b5b54c6-9796-4a9e-b108-dec80f5b8c8c', '4ab087e7-b0a0-4c6a-9f2f-1209d99c6455', 0, '5-14-7-9-14-5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98e0930d-a5e5-48f9-b23c-17c8a7454074', '4ab087e7-b0a0-4c6a-9f2f-1209d99c6455', 1, '5-14-7-9-15-5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7784ec0-3b9d-45eb-9e85-25a4e1cf877e', '4ab087e7-b0a0-4c6a-9f2f-1209d99c6455', 2, '5-13-7-9-14-5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74dd749f-9c0e-4de1-bcbd-7421ab9a7405', '4ab087e7-b0a0-4c6a-9f2f-1209d99c6455', 3, '5-14-8-9-14-5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4ab087e7-b0a0-4c6a-9f2f-1209d99c6455', '8b5b54c6-9796-4a9e-b108-dec80f5b8c8c', 'E=5, N=14, G=7, I=9, N=14, E=5 — matching each letter to its exact alphabetical position gives ''5-14-7-9-14-5''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6b18c922-1d0e-4e05-8066-ad940fbaba66', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 49, 'A is the father of B. C is the sister of B. D is the mother of C. How is A related to D?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbd1a28f-4840-42ae-abf4-d8f2383083a6', '6b18c922-1d0e-4e05-8066-ad940fbaba66', 0, 'Husband');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ace515e-e55f-41e7-827f-384227500367', '6b18c922-1d0e-4e05-8066-ad940fbaba66', 1, 'Brother');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a31c6f19-7d1e-4dbb-a166-1872fee803b8', '6b18c922-1d0e-4e05-8066-ad940fbaba66', 2, 'Son');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf0a9908-8c7c-4326-99f7-8982fbdd0548', '6b18c922-1d0e-4e05-8066-ad940fbaba66', 3, 'Father');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6b18c922-1d0e-4e05-8066-ad940fbaba66', 'dbd1a28f-4840-42ae-abf4-d8f2383083a6', 'A is B''s father, and D is C''s mother; since C is B''s sister, C and B share the same parents — so D (mother of both B and C) must be A''s spouse, making A D''s husband.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d343468a-8abf-467e-aee9-ffdd9844268a', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 50, 'Statements: No bolt is a nut. All nuts are fasteners. Conclusions: I. No bolt is a fastener. II. Some fasteners are nuts. Which conclusion(s) follow?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06235984-c843-4db3-a5cd-50995ce4cfb0', 'd343468a-8abf-467e-aee9-ffdd9844268a', 0, 'Only I follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b83c345c-73e3-44eb-8836-c2d90a7eaa7b', 'd343468a-8abf-467e-aee9-ffdd9844268a', 1, 'Only II follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18b1eaae-9a91-4400-a7a2-c80cf5796854', 'd343468a-8abf-467e-aee9-ffdd9844268a', 2, 'Both follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9371af6-12cb-4ec0-bc50-86990e321917', 'd343468a-8abf-467e-aee9-ffdd9844268a', 3, 'Neither follows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d343468a-8abf-467e-aee9-ffdd9844268a', 'b83c345c-73e3-44eb-8836-c2d90a7eaa7b', '''No bolt is a nut'' and ''All nuts are fasteners'' does NOT imply ''no bolt is a fastener'' (a bolt could still be a fastener through a different category) — so I does not follow. ''All nuts are fasteners'' directly implies ''Some fasteners are nuts'' — so II follows.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3e1afde7-1fda-487f-848c-a166fe735381', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 51, 'A clock shows 6:20. What is the angle between the hour and minute hands?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6c01bb6-c657-45c8-a8eb-602e87b91f6e', '3e1afde7-1fda-487f-848c-a166fe735381', 0, '50°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb157dc9-d8fb-409f-b9a8-a7d484eb9244', '3e1afde7-1fda-487f-848c-a166fe735381', 1, '60°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31eecb53-816a-41f8-b035-e2b936e0f35d', '3e1afde7-1fda-487f-848c-a166fe735381', 2, '70°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8eeb0ae2-14d1-446f-b737-70ead50beb6f', '3e1afde7-1fda-487f-848c-a166fe735381', 3, '80°');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3e1afde7-1fda-487f-848c-a166fe735381', '31eecb53-816a-41f8-b035-e2b936e0f35d', 'At 6:20, the minute hand is at the ''4'' position (120° from 12). The hour hand has moved 20/60 of the way from 6 to 7, i.e., 0.333 × 30° = 10° past the ''6'' position (190° from 12). The angle between them is 190° − 120° = 70°.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('49bba44f-856a-4ee9-adde-b8cd7081f21d', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 52, 'Find the odd one out: (3,9), (4,16), (5,30), (6,36)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2e70bcf-47ab-4ce9-b9ba-3431f604bb51', '49bba44f-856a-4ee9-adde-b8cd7081f21d', 0, '(3,9)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f117a3d3-46c7-4290-ae20-c8023671443d', '49bba44f-856a-4ee9-adde-b8cd7081f21d', 1, '(4,16)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67ec26e5-d7dc-4402-b986-a5ccc97f083a', '49bba44f-856a-4ee9-adde-b8cd7081f21d', 2, '(5,30)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c98c57e-7db8-4282-9628-340a40bb4457', '49bba44f-856a-4ee9-adde-b8cd7081f21d', 3, '(6,36)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('49bba44f-856a-4ee9-adde-b8cd7081f21d', '67ec26e5-d7dc-4402-b986-a5ccc97f083a', 'In (3,9), (4,16), and (6,36), the second number is the square of the first (3²=9, 4²=16, 6²=36). In (5,30), 5²=25, not 30 — this pair breaks the pattern.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6240485d-fcb2-4efa-b399-d195b3de559c', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 53, 'If North-West becomes South, South-East becomes North, then East becomes:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('acc40728-99de-4ca0-9e57-90beef32aaf3', '6240485d-fcb2-4efa-b399-d195b3de559c', 0, 'North-West');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7704471e-b001-41e9-b42f-93e10820300e', '6240485d-fcb2-4efa-b399-d195b3de559c', 1, 'South-West');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('741d9a95-e5e7-45de-a08b-ffc0fdc8405c', '6240485d-fcb2-4efa-b399-d195b3de559c', 2, 'North-East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('711b3225-b137-494d-9ee0-34a015fdf552', '6240485d-fcb2-4efa-b399-d195b3de559c', 3, 'South');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6240485d-fcb2-4efa-b399-d195b3de559c', '7704471e-b001-41e9-b42f-93e10820300e', 'The transformation is a 135° clockwise rotation of directions (NW→S is a 135° clockwise shift; SE→N confirms the same 135° clockwise shift). Applying the same 135° clockwise rotation to East gives South-West.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('41c6db7a-0bdb-46ec-a4ae-10c5114f5d04', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 54, 'A can complete a job in 12 days, and B can complete it in 18 days. If they work together, how many days will they take to complete the job?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa0e108e-23cc-48c7-a048-f0eea25330fa', '41c6db7a-0bdb-46ec-a4ae-10c5114f5d04', 0, '6 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a875960-1ade-4d18-9e48-19088f2ca952', '41c6db7a-0bdb-46ec-a4ae-10c5114f5d04', 1, '7.2 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a534ebc8-85d5-4158-bddd-0c9d87c8fc21', '41c6db7a-0bdb-46ec-a4ae-10c5114f5d04', 2, '8 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8dd3cff2-46ac-4ed7-a704-50b995063df2', '41c6db7a-0bdb-46ec-a4ae-10c5114f5d04', 3, '9 days');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('41c6db7a-0bdb-46ec-a4ae-10c5114f5d04', '2a875960-1ade-4d18-9e48-19088f2ca952', 'A''s rate = 1/12, B''s rate = 1/18. Combined rate = 1/12 + 1/18 = 3/36 + 2/36 = 5/36 (jobs/day). Time = 36/5 = 7.2 days.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d4a057ba-516d-41a7-a3f5-6dfee69439c1', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 55, 'Choose the word that does NOT belong with the others: Lathe, Milling Machine, Drilling Machine, Ammeter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6126706-bd3f-4222-b7ab-0e9052e8aeb8', 'd4a057ba-516d-41a7-a3f5-6dfee69439c1', 0, 'Lathe');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a3f9ad0-c81f-44c5-b15e-044c51e8d08e', 'd4a057ba-516d-41a7-a3f5-6dfee69439c1', 1, 'Milling Machine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6f08619-e5d7-4ea4-a8f7-d632a36c1c58', 'd4a057ba-516d-41a7-a3f5-6dfee69439c1', 2, 'Drilling Machine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba05c04d-fb38-4b12-afde-926dbc227bfd', 'd4a057ba-516d-41a7-a3f5-6dfee69439c1', 3, 'Ammeter');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d4a057ba-516d-41a7-a3f5-6dfee69439c1', 'ba05c04d-fb38-4b12-afde-926dbc227bfd', 'Lathe, Milling Machine, and Drilling Machine are all machine tools used for manufacturing/material removal; an Ammeter is an electrical measuring instrument, unrelated to machining — the odd one out.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('298344a3-641f-497a-bfec-1ad746635e4f', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 56, 'In a row of 50 workers, Ramesh is 18th from the right. What is his position from the left?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ed81ce9-038a-465c-9ac6-504e945a61b2', '298344a3-641f-497a-bfec-1ad746635e4f', 0, '32nd');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a192056b-1638-4127-82b5-64c80b770100', '298344a3-641f-497a-bfec-1ad746635e4f', 1, '33rd');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbed3402-7042-412b-80ce-864d5fa944a8', '298344a3-641f-497a-bfec-1ad746635e4f', 2, '34th');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b631670-26d1-4bc9-b966-9052c61a2b6e', '298344a3-641f-497a-bfec-1ad746635e4f', 3, '31st');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('298344a3-641f-497a-bfec-1ad746635e4f', 'a192056b-1638-4127-82b5-64c80b770100', 'Position from the left = (Total workers − Position from right) + 1 = (50 − 18) + 1 = 33rd from the left.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bc221680-c1b4-4fae-a806-7bc7481541fc', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 57, 'Which term logically completes the series: Petrol Engine, Diesel Engine, Gas Turbine, ?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3dc9611c-060c-489c-a501-f7819329827e', 'bc221680-c1b4-4fae-a806-7bc7481541fc', 0, 'Electric Motor (does not burn fuel internally, breaking the internal-combustion pattern)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7b9dbbe-649c-4913-bf77-04f38772faf1', 'bc221680-c1b4-4fae-a806-7bc7481541fc', 1, 'Jet Engine (an internal combustion / continuous-flow heat engine, continuing the pattern)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55464e6d-9439-4ddf-8477-00ebdfa36205', 'bc221680-c1b4-4fae-a806-7bc7481541fc', 2, 'Battery (an energy storage device)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('180db80d-517f-40fb-acf7-2a5f035aceeb', 'bc221680-c1b4-4fae-a806-7bc7481541fc', 3, 'Generator (converts mechanical to electrical energy)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bc221680-c1b4-4fae-a806-7bc7481541fc', 'b7b9dbbe-649c-4913-bf77-04f38772faf1', 'Petrol Engine, Diesel Engine, and Gas Turbine are all internal-combustion / continuous heat engines that convert fuel''s chemical energy into mechanical work. A Jet Engine is also a continuous-flow internal combustion heat engine, continuing the pattern — the other options (Electric Motor, Battery, Generator) don''t burn fuel internally.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('abfdb0f8-8461-488f-9c65-bdb9aceb2b50', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 58, 'If the day after tomorrow is Monday, what day was it three days ago?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa630dd2-78a8-48ca-ab11-71c3f2af800c', 'abfdb0f8-8461-488f-9c65-bdb9aceb2b50', 0, 'Wednesday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ee424ef-1cb9-483f-8c21-8c224323e022', 'abfdb0f8-8461-488f-9c65-bdb9aceb2b50', 1, 'Thursday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2def7b6a-13a5-477c-b9cc-40cade31dfdd', 'abfdb0f8-8461-488f-9c65-bdb9aceb2b50', 2, 'Friday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e501f28-2d22-4013-a4c8-c50f8efdc9d6', 'abfdb0f8-8461-488f-9c65-bdb9aceb2b50', 3, 'Saturday');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('abfdb0f8-8461-488f-9c65-bdb9aceb2b50', 'aa630dd2-78a8-48ca-ab11-71c3f2af800c', 'If the day after tomorrow is Monday, tomorrow is Sunday, so today is Saturday. Counting back three days from Saturday (Friday, Thursday, Wednesday) gives Wednesday.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b5dfc0f1-a917-41d0-a956-c69969dfc8f1', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 59, 'Statements: All bearings reduce friction. Some friction-reducing components are expensive. Conclusion: Some bearings are expensive. Is this conclusion valid based strictly on the statements given?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6aaae640-3d0b-49cf-bbd3-f79708aa837e', 'b5dfc0f1-a917-41d0-a956-c69969dfc8f1', 0, 'Valid — it follows directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7b25b97-d6f7-4cb4-a2af-ce4f0390e4f8', 'b5dfc0f1-a917-41d0-a956-c69969dfc8f1', 1, 'Invalid — it does not necessarily follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd886164-262f-41cf-b251-9d6553f1c915', 'b5dfc0f1-a917-41d0-a956-c69969dfc8f1', 2, 'Valid only if all friction-reducing components are bearings');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('52afe407-e90c-4946-b2a4-be75849ea030', 'b5dfc0f1-a917-41d0-a956-c69969dfc8f1', 3, 'Cannot be determined without additional data');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b5dfc0f1-a917-41d0-a956-c69969dfc8f1', 'c7b25b97-d6f7-4cb4-a2af-ce4f0390e4f8', 'The statements establish that bearings are a subset of friction-reducing components, and some (unspecified) friction-reducing components are expensive — but there''s no guarantee the ''expensive'' subset overlaps with the ''bearings'' subset specifically. The conclusion does not necessarily follow.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('866f03a1-be36-4bdf-b5ea-f29b62817d8a', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 60, 'A is twice as old as B. Five years ago, A was three times as old as B was then. What is B''s current age?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df063d0f-5098-45af-b723-a94c1a0bf6cf', '866f03a1-be36-4bdf-b5ea-f29b62817d8a', 0, '8 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1bf48e0-5612-4ff2-b50e-c2333df34de5', '866f03a1-be36-4bdf-b5ea-f29b62817d8a', 1, '10 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f1ef3e1-d81d-4e1c-b903-b835694236c4', '866f03a1-be36-4bdf-b5ea-f29b62817d8a', 2, '12 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f4d644a-d207-4452-97e0-87f5b9adc608', '866f03a1-be36-4bdf-b5ea-f29b62817d8a', 3, '15 years');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('866f03a1-be36-4bdf-b5ea-f29b62817d8a', 'a1bf48e0-5612-4ff2-b50e-c2333df34de5', 'Let B''s current age = x, so A''s current age = 2x. Five years ago: A''s age was (2x-5), B''s age was (x-5). Given (2x-5) = 3(x-5): 2x-5 = 3x-15, so x = 10. B''s current age is 10 years (and A''s is 20; five years ago A was 15 and B was 5, and 15 = 3×5, confirming the answer).', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

-- ── Section: Mechanical Engineering (Discipline) (100 questions) — Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('77c96515-880c-4b4c-9e3f-6b91527ee049', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 61, 'The First Law of Thermodynamics is fundamentally a statement of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5633a979-6c2a-4d35-8e87-e434982b75c8', '77c96515-880c-4b4c-9e3f-6b91527ee049', 0, 'Conservation of mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed8cdea7-2cb0-4c13-b859-cb25c5e52b46', '77c96515-880c-4b4c-9e3f-6b91527ee049', 1, 'Conservation of energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bcdddd40-36e8-4f71-9648-2131bb00633e', '77c96515-880c-4b4c-9e3f-6b91527ee049', 2, 'Increase of entropy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f806658-32f6-4602-8296-b1a5c2180aa2', '77c96515-880c-4b4c-9e3f-6b91527ee049', 3, 'Conservation of momentum');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('77c96515-880c-4b4c-9e3f-6b91527ee049', 'ed8cdea7-2cb0-4c13-b859-cb25c5e52b46', 'The First Law of Thermodynamics states that energy can neither be created nor destroyed, only converted from one form to another — it is the principle of conservation of energy applied to thermodynamic systems.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('addf1843-e635-426e-ae52-5c4ef374b828', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 62, 'The Second Law of Thermodynamics implies that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a99c395d-3c4a-4184-af1c-f82e4131c1ee', 'addf1843-e635-426e-ae52-5c4ef374b828', 0, 'Heat can flow spontaneously from a colder body to a hotter body');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('419b6095-2a0c-438d-857d-96527f69a868', 'addf1843-e635-426e-ae52-5c4ef374b828', 1, 'A heat engine cannot have 100% thermal efficiency when operating between two finite temperature reservoirs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3983854-af15-4d4f-aecc-fe00352af1c7', 'addf1843-e635-426e-ae52-5c4ef374b828', 2, 'Energy can be created from nothing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5987ff28-af33-44bb-98e2-772f8f7e0fca', 'addf1843-e635-426e-ae52-5c4ef374b828', 3, 'All processes are reversible');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('addf1843-e635-426e-ae52-5c4ef374b828', '419b6095-2a0c-438d-857d-96527f69a868', 'The Second Law establishes that no heat engine can convert all absorbed heat into work with 100% efficiency when operating in a cycle between two finite-temperature reservoirs — some heat must always be rejected to a lower-temperature sink (Kelvin-Planck statement).', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8445ab6e-a3be-4b0a-9364-b422e8c9c842', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 63, 'The Carnot cycle is significant because it represents:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('123faeac-f56d-4117-99fd-9290cbfd6aac', '8445ab6e-a3be-4b0a-9364-b422e8c9c842', 0, 'The most efficient practical engine cycle achievable with real components');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('914fec4c-7e2e-47d9-a4ba-7a8a9beda849', '8445ab6e-a3be-4b0a-9364-b422e8c9c842', 1, 'The theoretical maximum efficiency achievable by any heat engine operating between two given temperatures');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('881cb911-9950-4546-9809-1316f04ace7f', '8445ab6e-a3be-4b0a-9364-b422e8c9c842', 2, 'A cycle used only in refrigeration, never in engines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b29ba69a-9c26-4be0-9fc5-91024b1e9519', '8445ab6e-a3be-4b0a-9364-b422e8c9c842', 3, 'A cycle with zero net work output');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8445ab6e-a3be-4b0a-9364-b422e8c9c842', '914fec4c-7e2e-47d9-a4ba-7a8a9beda849', 'The Carnot cycle is a theoretical, fully reversible cycle that represents the maximum possible thermal efficiency any heat engine can achieve when operating between two given temperature limits — no real engine can exceed it, though real engines can''t achieve it exactly either, due to inherent irreversibilities.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('97261089-61bd-403f-ba81-43e425cae3d4', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 64, 'In a heat exchanger, the ''LMTD'' (Log Mean Temperature Difference) method is used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03f9d4a2-0635-4122-a657-a58206e1e686', '97261089-61bd-403f-ba81-43e425cae3d4', 0, 'Calculate the heat exchanger''s pressure drop');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('29257be6-2731-4167-89bc-54f044335d8d', '97261089-61bd-403f-ba81-43e425cae3d4', 1, 'Determine the effective average temperature difference driving heat transfer along the exchanger''s length');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d38375e-fc1f-4fd0-89f8-511fe0e004d4', '97261089-61bd-403f-ba81-43e425cae3d4', 2, 'Measure the fluid''s viscosity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05a811c4-f501-41c6-beb8-8ca6b700777a', '97261089-61bd-403f-ba81-43e425cae3d4', 3, 'Calculate the mass flow rate');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('97261089-61bd-403f-ba81-43e425cae3d4', '29257be6-2731-4167-89bc-54f044335d8d', 'LMTD provides the correct effective average temperature difference between hot and cold fluids across a heat exchanger, accounting for the fact that the temperature difference varies along the exchanger''s length (unlike a simple arithmetic mean, which would be inaccurate for this purpose).', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('51a5ba90-0bbb-4617-8593-792098b33d0b', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 65, 'Which mode of heat transfer does NOT require a material medium?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d0d3de6-2c61-4607-9f04-2db3da339be5', '51a5ba90-0bbb-4617-8593-792098b33d0b', 0, 'Conduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84f28128-d6f1-4ff8-91e7-5915d7147698', '51a5ba90-0bbb-4617-8593-792098b33d0b', 1, 'Convection');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a230a3f-f68a-4c53-9d72-5a088cc64584', '51a5ba90-0bbb-4617-8593-792098b33d0b', 2, 'Radiation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d56e0d7-6df7-4d81-acd1-31d9e06ea888', '51a5ba90-0bbb-4617-8593-792098b33d0b', 3, 'Both conduction and convection');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('51a5ba90-0bbb-4617-8593-792098b33d0b', '4a230a3f-f68a-4c53-9d72-5a088cc64584', 'Radiation is the only mode of heat transfer that can occur through a vacuum, since it involves electromagnetic wave propagation rather than requiring physical contact (conduction) or fluid motion (convection).', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0dd054ce-5120-4c1b-9efc-8396f693abe7', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 66, 'The COP (Coefficient of Performance) of a refrigerator is defined as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1394215-ea07-4dc2-95f2-e44d158fa7a8', '0dd054ce-5120-4c1b-9efc-8396f693abe7', 0, 'Work input / Heat rejected');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('efe40b38-39af-4f5d-982f-1b25b49a321b', '0dd054ce-5120-4c1b-9efc-8396f693abe7', 1, 'Heat extracted from the cold reservoir / Work input');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('708c704f-9011-40ee-99ce-d7c52fe29529', '0dd054ce-5120-4c1b-9efc-8396f693abe7', 2, 'Heat rejected / Work input');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a237fb08-7fdd-4c0d-b495-425799280fc0', '0dd054ce-5120-4c1b-9efc-8396f693abe7', 3, 'Work input / Heat extracted');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0dd054ce-5120-4c1b-9efc-8396f693abe7', 'efe40b38-39af-4f5d-982f-1b25b49a321b', 'COP of a refrigerator = Desired effect (heat extracted from the cold space) / Work input — a higher COP means the refrigerator extracts more heat per unit of work supplied, indicating better efficiency.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d11eb57e-98d6-4c7a-979c-a2c8028d7246', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 67, 'An isentropic process is one that is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42a17284-fabf-4b23-b974-3ae1a4946432', 'd11eb57e-98d6-4c7a-979c-a2c8028d7246', 0, 'Constant volume');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d8697c3-0993-4b31-90d1-9b42f46c38fa', 'd11eb57e-98d6-4c7a-979c-a2c8028d7246', 1, 'Constant pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d01c32de-2d74-4157-b90f-d82b5c006495', 'd11eb57e-98d6-4c7a-979c-a2c8028d7246', 2, 'Reversible and adiabatic (constant entropy)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1615c230-0bd3-4c04-a405-cbe2ef7dc11a', 'd11eb57e-98d6-4c7a-979c-a2c8028d7246', 3, 'Constant temperature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d11eb57e-98d6-4c7a-979c-a2c8028d7246', 'd01c32de-2d74-4157-b90f-d82b5c006495', 'An isentropic process is both reversible and adiabatic (no heat transfer), resulting in constant entropy throughout the process — a common idealization used in analyzing turbines and compressors.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d782a8e3-74d3-45c6-a6e4-a5c6f08d68d9', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 68, 'The efficiency of a Rankine cycle (used in steam power plants) can be improved by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33eea72e-46b4-48bb-9934-207ce0d5ee21', 'd782a8e3-74d3-45c6-a6e4-a5c6f08d68d9', 0, 'Lowering the boiler pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4502a066-0f94-4b6a-82d4-e11b5832408d', 'd782a8e3-74d3-45c6-a6e4-a5c6f08d68d9', 1, 'Increasing the condenser pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a30e9a75-1313-405d-9d33-d3fe0a0afe1c', 'd782a8e3-74d3-45c6-a6e4-a5c6f08d68d9', 2, 'Increasing the boiler pressure and/or lowering the condenser pressure, and using reheat/regeneration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8021d395-1eab-43f2-820c-ceac5a9502af', 'd782a8e3-74d3-45c6-a6e4-a5c6f08d68d9', 3, 'Removing the condenser entirely');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d782a8e3-74d3-45c6-a6e4-a5c6f08d68d9', 'a30e9a75-1313-405d-9d33-d3fe0a0afe1c', 'Rankine cycle efficiency improves with higher boiler (steam generation) pressure, lower condenser pressure (deeper vacuum), and techniques like reheat (re-heating steam mid-expansion) and regeneration (feedwater heating using extracted steam) — all standard real-world efficiency improvements in steam power plants.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('75e55bae-495d-4f93-b6d6-10e16f221c9e', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 69, 'Thermal conductivity, in Fourier''s Law of heat conduction, has units of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31de2ac7-20ae-4e8e-9338-97baf49a235f', '75e55bae-495d-4f93-b6d6-10e16f221c9e', 0, 'W/m·K');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37e692b7-5b5d-45fc-96a2-a114dd50abde', '75e55bae-495d-4f93-b6d6-10e16f221c9e', 1, 'W/m²');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7129eca-5f92-431e-b291-10712b31304a', '75e55bae-495d-4f93-b6d6-10e16f221c9e', 2, 'J/kg·K');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f18adaf0-0b39-4217-9d9a-add3d2bd2016', '75e55bae-495d-4f93-b6d6-10e16f221c9e', 3, 'W/K');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('75e55bae-495d-4f93-b6d6-10e16f221c9e', '31de2ac7-20ae-4e8e-9338-97baf49a235f', 'Thermal conductivity (k) in Fourier''s Law (q = -kA dT/dx) has units of W/(m·K) — power per unit length per unit temperature difference.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('610fad68-255c-4c82-bfe2-c9c19af0a026', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 70, 'The Otto cycle is the theoretical air-standard cycle for which type of engine?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c03869e-772e-4644-b78a-d77612f52956', '610fad68-255c-4c82-bfe2-c9c19af0a026', 0, 'Diesel (compression-ignition) engines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d565a9c-83d4-4fce-bc61-4cb92d6c4f38', '610fad68-255c-4c82-bfe2-c9c19af0a026', 1, 'Spark-ignition (petrol) engines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca628973-9559-40d0-80af-fc1195f7df78', '610fad68-255c-4c82-bfe2-c9c19af0a026', 2, 'Gas turbines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f928fa6b-95cd-418e-a837-7409cffdc6ce', '610fad68-255c-4c82-bfe2-c9c19af0a026', 3, 'Steam engines');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('610fad68-255c-4c82-bfe2-c9c19af0a026', '8d565a9c-83d4-4fce-bc61-4cb92d6c4f38', 'The Otto cycle represents the idealized air-standard cycle for spark-ignition (petrol) engines, characterized by constant-volume heat addition (representing near-instantaneous combustion after spark ignition).', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('84fbd47b-f1cf-409a-abb6-40bc5b8dfdfb', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 71, 'The Diesel cycle differs from the Otto cycle primarily in that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('810b3b79-c863-4fc1-b69a-5882c51c9a63', '84fbd47b-f1cf-409a-abb6-40bc5b8dfdfb', 0, 'Heat addition occurs at constant pressure in the Diesel cycle, versus constant volume in the Otto cycle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('977d04e0-9f37-4cbe-9102-7c2034537e4e', '84fbd47b-f1cf-409a-abb6-40bc5b8dfdfb', 1, 'The Diesel cycle has no compression stroke');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4254ee60-feeb-48be-b4fd-06a0ae833900', '84fbd47b-f1cf-409a-abb6-40bc5b8dfdfb', 2, 'The Diesel cycle uses a spark plug');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41d398c4-0592-4a09-adfe-7149da8dd3cf', '84fbd47b-f1cf-409a-abb6-40bc5b8dfdfb', 3, 'The Diesel cycle has lower compression ratios than Otto cycle engines');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('84fbd47b-f1cf-409a-abb6-40bc5b8dfdfb', '810b3b79-c863-4fc1-b69a-5882c51c9a63', 'In the Diesel cycle, heat addition (combustion) occurs at constant pressure, modeling the gradual fuel injection and combustion in a compression-ignition engine, unlike the Otto cycle''s constant-volume (near-instantaneous) heat addition — and Diesel engines typically operate at HIGHER compression ratios than Otto-cycle engines, not lower.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('508dbc35-e6fc-4fd8-858a-ce6823041c37', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 72, 'The Biot number in heat transfer analysis is used to determine:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d3dcb67-7bc0-4c99-8b59-0691f90a4d06', '508dbc35-e6fc-4fd8-858a-ce6823041c37', 0, 'The rate of fluid flow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd373dcd-f8ff-45e2-b09c-2878cb5e1a54', '508dbc35-e6fc-4fd8-858a-ce6823041c37', 1, 'Whether a lumped-capacitance (uniform temperature) approximation is valid for transient conduction analysis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a190e23e-397d-476d-b355-eb529e0e9ef7', '508dbc35-e6fc-4fd8-858a-ce6823041c37', 2, 'The thermal conductivity of a material directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49a945d8-e29e-437f-8f61-a9ae93197bad', '508dbc35-e6fc-4fd8-858a-ce6823041c37', 3, 'The pressure drop in a pipe');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('508dbc35-e6fc-4fd8-858a-ce6823041c37', 'fd373dcd-f8ff-45e2-b09c-2878cb5e1a54', 'The Biot number (Bi = hL/k) compares internal conductive resistance to external convective resistance — a small Biot number (typically Bi < 0.1) indicates the lumped-capacitance method (assuming uniform temperature throughout the body during transient cooling/heating) is a valid approximation.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1caf86f2-f403-4a6f-afc4-cf7576f94161', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 73, 'Entropy, in thermodynamics, is best described as a measure of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f09a525e-55c5-45b5-90ea-c79d0913ebb1', '1caf86f2-f403-4a6f-afc4-cf7576f94161', 0, 'Total energy of a system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a01eeb85-3a59-418f-b3b5-d07a9d94997f', '1caf86f2-f403-4a6f-afc4-cf7576f94161', 1, 'The disorder or randomness of a system, and the unavailability of energy to do useful work');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8755a00-a793-4ddf-9b7f-89ca02bb9d46', '1caf86f2-f403-4a6f-afc4-cf7576f94161', 2, 'Temperature difference');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1745989e-e60b-4fd9-9634-10be2387e312', '1caf86f2-f403-4a6f-afc4-cf7576f94161', 3, 'Pressure of a gas');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1caf86f2-f403-4a6f-afc4-cf7576f94161', 'a01eeb85-3a59-418f-b3b5-d07a9d94997f', 'Entropy is a thermodynamic property associated with the degree of disorder/randomness of a system''s molecular arrangement, and reflects the unavailability of a portion of a system''s energy to perform useful work — it always increases for any real (irreversible) process in an isolated system.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1fba95a3-4cb6-4d06-b1a3-8c84a9140d80', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 74, 'In a counter-flow heat exchanger compared to a parallel-flow heat exchanger (for the same inlet/outlet temperatures), the counter-flow configuration generally achieves:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c6adc58-c11b-4f8b-b8d9-42b51a0e570a', '1fba95a3-4cb6-4d06-b1a3-8c84a9140d80', 0, 'Lower heat transfer effectiveness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31460417-c39a-4fcb-80fb-166fc266e495', '1fba95a3-4cb6-4d06-b1a3-8c84a9140d80', 1, 'Higher heat transfer effectiveness for the same heat transfer area');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1481bcf9-e8cb-4c5a-8ae3-3828bcbb9537', '1fba95a3-4cb6-4d06-b1a3-8c84a9140d80', 2, 'Identical performance in all cases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('823986a9-5aae-4a20-8778-43d5ad87116e', '1fba95a3-4cb6-4d06-b1a3-8c84a9140d80', 3, 'No heat transfer at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1fba95a3-4cb6-4d06-b1a3-8c84a9140d80', '31460417-c39a-4fcb-80fb-166fc266e495', 'For the same terminal temperatures and heat transfer area, a counter-flow heat exchanger generally achieves higher effectiveness (and a higher LMTD) than a parallel-flow configuration, since it maintains a more uniform temperature difference along the exchanger''s length.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b8558f65-5fe4-4a9e-b60a-2734e6659bde', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 75, 'The specific heat at constant pressure (Cp) is always ________ the specific heat at constant volume (Cv) for an ideal gas.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4adaf4c9-69d8-4ce3-ae37-a25f54e90d9d', 'b8558f65-5fe4-4a9e-b60a-2734e6659bde', 0, 'Less than');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f497d75-6659-47e5-8e9f-5e12792c9464', 'b8558f65-5fe4-4a9e-b60a-2734e6659bde', 1, 'Greater than');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c18066ab-9b51-4e3b-b6e4-96f54d6107f4', 'b8558f65-5fe4-4a9e-b60a-2734e6659bde', 2, 'Equal to');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25110906-8e0e-4b2d-a99b-1c4df2ecf0e1', 'b8558f65-5fe4-4a9e-b60a-2734e6659bde', 3, 'Unrelated to');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b8558f65-5fe4-4a9e-b60a-2734e6659bde', '2f497d75-6659-47e5-8e9f-5e12792c9464', 'For an ideal gas, Cp is always greater than Cv (Cp − Cv = R, the specific gas constant), because at constant pressure, some of the heat added also does work as the gas expands, requiring additional heat input to achieve the same temperature rise compared to a constant-volume process.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a5ebd076-8464-46c4-a4ac-382460bd5119', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 76, 'Bernoulli''s equation, in its standard form, is a statement of conservation of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44874e86-658c-48a0-8689-16b29c0b4a29', 'a5ebd076-8464-46c4-a4ac-382460bd5119', 0, 'Mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1aad1e5c-73bd-4c1e-a3dd-1dff5e427edc', 'a5ebd076-8464-46c4-a4ac-382460bd5119', 1, 'Momentum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cdd1a580-b9b9-4b2c-9ad6-1852174c4457', 'a5ebd076-8464-46c4-a4ac-382460bd5119', 2, 'Energy, along a streamline for an ideal, incompressible, steady flow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66c63a2b-b8cc-4ab9-9b06-42dd44133fae', 'a5ebd076-8464-46c4-a4ac-382460bd5119', 3, 'Angular momentum');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a5ebd076-8464-46c4-a4ac-382460bd5119', 'cdd1a580-b9b9-4b2c-9ad6-1852174c4457', 'Bernoulli''s equation represents the conservation of mechanical energy (pressure, kinetic, and potential energy) along a streamline, for an ideal (inviscid), incompressible, steady flow.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('aed1fec1-78d7-4166-83c7-c538dc16c6ef', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 77, 'The Reynolds number is used to determine:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d339044-56ca-43cd-a96b-33610bac62ba', 'aed1fec1-78d7-4166-83c7-c538dc16c6ef', 0, 'The viscosity of a fluid directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9eecc635-4cc8-4626-a7d6-ee33efc40a0b', 'aed1fec1-78d7-4166-83c7-c538dc16c6ef', 1, 'Whether a flow is laminar or turbulent, based on the ratio of inertial to viscous forces');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca4ebb59-3a7b-4265-9d38-d6a07e2f5ea6', 'aed1fec1-78d7-4166-83c7-c538dc16c6ef', 2, 'The density of a fluid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26444544-92d0-4ad1-8718-5b8720b2fc04', 'aed1fec1-78d7-4166-83c7-c538dc16c6ef', 3, 'The pressure at a point in a fluid');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aed1fec1-78d7-4166-83c7-c538dc16c6ef', '9eecc635-4cc8-4626-a7d6-ee33efc40a0b', 'The Reynolds number (Re = ρVD/μ) represents the ratio of inertial forces to viscous forces in a flow — a low Reynolds number indicates laminar (smooth, orderly) flow, while a high Reynolds number indicates turbulent (chaotic) flow, with a transition typically around Re ≈ 2300 for pipe flow.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('603af1cc-7e4b-4227-a538-8b2bda252e2e', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 78, 'A centrifugal pump primarily works by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ea1a826-786f-4a18-9df6-9e8c56ceaff7', '603af1cc-7e4b-4227-a538-8b2bda252e2e', 0, 'Positive displacement of fluid through a piston');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5e1f914-7d02-41c6-94a4-235d23606d94', '603af1cc-7e4b-4227-a538-8b2bda252e2e', 1, 'Converting the kinetic energy imparted by a rotating impeller into pressure energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c04f941c-0fdb-4b3f-b98f-951f02541399', '603af1cc-7e4b-4227-a538-8b2bda252e2e', 2, 'Direct suction using atmospheric pressure alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a2d7089-059f-4f9b-9b8d-81354ba9934c', '603af1cc-7e4b-4227-a538-8b2bda252e2e', 3, 'Gravitational flow');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('603af1cc-7e4b-4227-a538-8b2bda252e2e', 'f5e1f914-7d02-41c6-94a4-235d23606d94', 'A centrifugal pump uses a rotating impeller to impart kinetic energy to the fluid (via centrifugal action), which is then converted into pressure energy as the fluid moves through the pump''s diffuser/volute casing.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('114b2dbe-094f-4277-aa02-9e0056747f83', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 79, 'Cavitation in a pump occurs when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3efe3e32-2100-4c95-a9e0-708d73225fa5', '114b2dbe-094f-4277-aa02-9e0056747f83', 0, 'The fluid temperature is too low');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa77bf65-5d9d-4a14-8797-0c21447d90c8', '114b2dbe-094f-4277-aa02-9e0056747f83', 1, 'The local pressure drops below the fluid''s vapor pressure, causing vapor bubbles to form and then violently collapse');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6e2fbed-d561-44a1-8c86-b5b5d29b6a61', '114b2dbe-094f-4277-aa02-9e0056747f83', 2, 'The pump runs at too low a speed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3157466-4485-47e0-aeb6-a32511856fe7', '114b2dbe-094f-4277-aa02-9e0056747f83', 3, 'The fluid viscosity is too high');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('114b2dbe-094f-4277-aa02-9e0056747f83', 'fa77bf65-5d9d-4a14-8797-0c21447d90c8', 'Cavitation occurs when local static pressure in the fluid drops below its vapor pressure (commonly at the pump''s suction side or impeller eye), causing vapor bubbles to form; these bubbles then collapse violently upon reaching higher-pressure regions, causing noise, vibration, and severe erosion damage over time.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('dfe8fd59-b4ec-4d3f-ac8f-4a210bbb8eab', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 80, 'The continuity equation in fluid mechanics, for steady, incompressible flow, states that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea56999b-4828-434d-8185-b56cc9569025', 'dfe8fd59-b4ec-4d3f-ac8f-4a210bbb8eab', 0, 'Pressure is constant throughout the flow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af329b31-2d62-4147-990a-e75c3e5aced6', 'dfe8fd59-b4ec-4d3f-ac8f-4a210bbb8eab', 1, 'The mass flow rate (or volumetric flow rate, for incompressible flow) is constant at every cross-section along the flow path');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58a029bd-327a-4006-a411-6a65943f7b8e', 'dfe8fd59-b4ec-4d3f-ac8f-4a210bbb8eab', 2, 'Velocity is constant everywhere');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6dde10cd-9d87-476a-a1a4-25868474825a', 'dfe8fd59-b4ec-4d3f-ac8f-4a210bbb8eab', 3, 'Temperature is constant');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dfe8fd59-b4ec-4d3f-ac8f-4a210bbb8eab', 'af329b31-2d62-4147-990a-e75c3e5aced6', 'The continuity equation, for steady incompressible flow, states that A₁V₁ = A₂V₂ (volumetric flow rate is conserved) — as the cross-sectional area decreases, velocity must increase proportionally to maintain the same flow rate, and vice versa.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7854f685-e48a-44f2-be1a-d1cc26034bf0', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 81, 'A Pelton wheel is a type of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d5e65ea-9602-469e-9d57-996c23a7fb9d', '7854f685-e48a-44f2-be1a-d1cc26034bf0', 0, 'Reaction turbine, used for low-head applications');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bf8b0952-544d-42b6-ab17-87152ccf1014', '7854f685-e48a-44f2-be1a-d1cc26034bf0', 1, 'Impulse turbine, used for high-head, low-flow applications');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f199b9a6-19ea-4d39-a329-9b7a1c50fd31', '7854f685-e48a-44f2-be1a-d1cc26034bf0', 2, 'Centrifugal pump');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c8c3c59-b482-47a8-9ff2-9a731b1ce25f', '7854f685-e48a-44f2-be1a-d1cc26034bf0', 3, 'Axial-flow compressor');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7854f685-e48a-44f2-be1a-d1cc26034bf0', 'bf8b0952-544d-42b6-ab17-87152ccf1014', 'A Pelton wheel is a tangential-flow impulse turbine, well-suited for high-head, relatively low-flow-rate hydroelectric applications — it converts the kinetic energy of a high-velocity water jet (from a nozzle) into rotational mechanical energy via curved buckets on the wheel''s periphery.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b86b9318-18a0-48f0-9bbb-9f9efde5b1df', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 82, 'A Francis turbine is classified as a:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03e2b830-2aaf-40a8-aa6a-bef553c95a7f', 'b86b9318-18a0-48f0-9bbb-9f9efde5b1df', 0, 'Pure impulse turbine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ba053fc-78f2-4093-97ba-8b907a88f7ba', 'b86b9318-18a0-48f0-9bbb-9f9efde5b1df', 1, 'Reaction turbine, suitable for medium-head applications');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a893a20-86fb-4af0-91b1-ad249aa2d9cd', 'b86b9318-18a0-48f0-9bbb-9f9efde5b1df', 2, 'Positive displacement pump');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c10299b-b79c-4152-8dc3-f1962dd0d658', 'b86b9318-18a0-48f0-9bbb-9f9efde5b1df', 3, 'Axial-flow-only turbine with no radial component');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b86b9318-18a0-48f0-9bbb-9f9efde5b1df', '5ba053fc-78f2-4093-97ba-8b907a88f7ba', 'A Francis turbine is a mixed-flow reaction turbine (both pressure and velocity of the water change as it passes through the runner), commonly used for medium-head hydroelectric applications — distinct from the pure impulse action of a Pelton wheel.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1978d4d4-8593-4f5a-9bcb-77290e520417', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 83, 'The Bernoulli equation assumes the fluid is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a118afc-bec2-444b-bd6a-3e86ea917c34', '1978d4d4-8593-4f5a-9bcb-77290e520417', 0, 'Viscous and compressible');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5dcf0e9d-2252-4ffa-8bb8-ce88740d8fde', '1978d4d4-8593-4f5a-9bcb-77290e520417', 1, 'Inviscid (ideal, frictionless) and incompressible, with steady flow along a streamline');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c047ac72-bd1e-4323-bc4c-49d5e4efff8a', '1978d4d4-8593-4f5a-9bcb-77290e520417', 2, 'Turbulent only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd9386af-e752-4c98-a535-e60e7809c3dc', '1978d4d4-8593-4f5a-9bcb-77290e520417', 3, 'Always at rest');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1978d4d4-8593-4f5a-9bcb-77290e520417', '5dcf0e9d-2252-4ffa-8bb8-ce88740d8fde', 'The standard (simplest) form of Bernoulli''s equation assumes an ideal, inviscid (no friction/viscosity losses), incompressible fluid undergoing steady flow along a single streamline — real fluid flows require correction factors or modified forms to account for viscous losses.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b78fcf7a-53e9-42d9-b799-c8b5d0cc87a0', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 84, 'The ''head loss'' in a pipe due to friction is calculated using which well-known equation?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6cfab5e-bafd-4730-95dc-1b5ef6773cb4', 'b78fcf7a-53e9-42d9-b799-c8b5d0cc87a0', 0, 'Bernoulli''s equation alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a767e8c-abc5-4f5e-b239-d12ff66e5d59', 'b78fcf7a-53e9-42d9-b799-c8b5d0cc87a0', 1, 'Darcy-Weisbach equation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a293c0bc-59c5-41ba-82df-92c13ebeb53a', 'b78fcf7a-53e9-42d9-b799-c8b5d0cc87a0', 2, 'Ohm''s Law');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d2ca924-0128-4291-9c80-35fdd969f3de', 'b78fcf7a-53e9-42d9-b799-c8b5d0cc87a0', 3, 'Newton''s Second Law');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b78fcf7a-53e9-42d9-b799-c8b5d0cc87a0', '7a767e8c-abc5-4f5e-b239-d12ff66e5d59', 'The Darcy-Weisbach equation (hf = f × (L/D) × (V²/2g)) is the standard equation used to calculate frictional head loss in pipe flow, incorporating the friction factor (f), pipe length (L), diameter (D), and flow velocity (V).', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a83731e1-d098-4f99-8c4f-65cca2e9f9a7', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 85, 'The ''boundary layer'' in fluid flow over a surface refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83628b7e-218f-474e-8d59-b2c3c08ac006', 'a83731e1-d098-4f99-8c4f-65cca2e9f9a7', 0, 'The entire flow field far from any surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8acf3814-2fee-43f5-a7c9-9ee477199b90', 'a83731e1-d098-4f99-8c4f-65cca2e9f9a7', 1, 'The thin region near a solid surface where viscous effects are significant and velocity varies from zero (at the surface) to the free-stream value');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f85c42a5-f393-4086-a176-a9e5dcd39774', 'a83731e1-d098-4f99-8c4f-65cca2e9f9a7', 2, 'A region with zero fluid velocity everywhere');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4df01fcd-b6a7-43c3-8879-e229929c0554', 'a83731e1-d098-4f99-8c4f-65cca2e9f9a7', 3, 'The region only present in turbulent flows, never in laminar flows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a83731e1-d098-4f99-8c4f-65cca2e9f9a7', '8acf3814-2fee-43f5-a7c9-9ee477199b90', 'The boundary layer is the thin region adjacent to a solid surface where viscous forces are significant, and fluid velocity transitions from zero at the surface (no-slip condition) to the free-stream velocity — this concept, developed by Prandtl, is fundamental to understanding drag and separation in both laminar and turbulent flows.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e535736b-8905-4963-b29c-96e00d2f4805', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 86, 'A venturi meter is used to measure:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e906e8d5-7e4f-45e6-9b1d-8e298cb7f4fb', 'e535736b-8905-4963-b29c-96e00d2f4805', 0, 'Fluid temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18e62fe5-1de2-4844-9368-6e1a2f076416', 'e535736b-8905-4963-b29c-96e00d2f4805', 1, 'Flow rate, based on the pressure difference created by a constriction in the pipe');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77cc0d25-418e-4d15-b16f-d434f6373096', 'e535736b-8905-4963-b29c-96e00d2f4805', 2, 'Fluid density directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('950dadf0-e7a3-4018-b964-18857a16f24d', 'e535736b-8905-4963-b29c-96e00d2f4805', 3, 'Pipe wall thickness');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e535736b-8905-4963-b29c-96e00d2f4805', '18e62fe5-1de2-4844-9368-6e1a2f076416', 'A venturi meter measures flow rate by creating a gradual constriction in the pipe, which increases velocity and decreases pressure at the throat (per Bernoulli''s principle) — the measured pressure difference between the inlet and throat is used to calculate the flow rate.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0d93402f-f22b-4fde-92ac-3552ad048c01', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 87, 'The specific speed of a pump or turbine is a parameter used primarily to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0ead2e3-ec2d-4070-9439-40829413e5e4', '0d93402f-f22b-4fde-92ac-3552ad048c01', 0, 'Classify and select the appropriate type of pump/turbine for a given head and flow rate application');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ed41167-2dd5-4281-a88d-c9effc6cc938', '0d93402f-f22b-4fde-92ac-3552ad048c01', 1, 'Measure the fluid''s viscosity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dcd2e7a0-38c2-4875-963c-c8d45ee9b787', '0d93402f-f22b-4fde-92ac-3552ad048c01', 2, 'Calculate the exact power output only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85858004-d7a3-4cab-a3fa-73ff05a08d00', '0d93402f-f22b-4fde-92ac-3552ad048c01', 3, 'Determine the material of construction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0d93402f-f22b-4fde-92ac-3552ad048c01', 'e0ead2e3-ec2d-4070-9439-40829413e5e4', 'Specific speed is a dimensionless (or dimensional, depending on convention) parameter derived from a pump/turbine''s operating speed, flow rate, and head — it is primarily used to classify and select the most suitable type of turbomachine (e.g., Pelton for low specific speed/high head, Kaplan for high specific speed/low head) for a given application.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('915a7cf8-cef7-4580-9295-f2305ed654d8', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 88, 'In an open channel flow, ''critical flow'' occurs when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e63a30f0-a408-4d52-8b5f-a0c772687471', '915a7cf8-cef7-4580-9295-f2305ed654d8', 0, 'The flow is always turbulent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35ef2ca6-25b3-4b9d-b892-1404a58381e9', '915a7cf8-cef7-4580-9295-f2305ed654d8', 1, 'The Froude number equals 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b18e1b10-a9f3-4860-bc3a-2a700f855f6d', '915a7cf8-cef7-4580-9295-f2305ed654d8', 2, 'The Reynolds number equals 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4defeb73-ef6d-47bf-ab69-3dac229588f3', '915a7cf8-cef7-4580-9295-f2305ed654d8', 3, 'The flow depth is maximum');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('915a7cf8-cef7-4580-9295-f2305ed654d8', '35ef2ca6-25b3-4b9d-b892-1404a58381e9', 'Critical flow in open channels occurs when the Froude number (Fr = V/√(gD)) equals 1 — flow is termed subcritical when Fr < 1 (tranquil, deep, slow) and supercritical when Fr > 1 (rapid, shallow, fast).', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('eb5e2943-36cc-4189-84be-af2217d9d180', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 89, 'The pressure at a depth ''h'' below the free surface of a static fluid (of density ρ) is given by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5a81e65-a133-4ce0-80a2-5d4ade86e2b7', 'eb5e2943-36cc-4189-84be-af2217d9d180', 0, 'P = ρgh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6b220bb-4631-4e96-b35c-7baff05d6c93', 'eb5e2943-36cc-4189-84be-af2217d9d180', 1, 'P = ρg/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4dec761-9d53-4872-b3e2-a0556fcccea9', 'eb5e2943-36cc-4189-84be-af2217d9d180', 2, 'P = ρ/gh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf54f1f0-1041-4af5-9968-eec518d114dc', 'eb5e2943-36cc-4189-84be-af2217d9d180', 3, 'P = gh/ρ');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('eb5e2943-36cc-4189-84be-af2217d9d180', 'e5a81e65-a133-4ce0-80a2-5d4ade86e2b7', 'Hydrostatic pressure at depth h is P = ρgh (plus atmospheric pressure, if measuring absolute rather than gauge pressure) — a direct consequence of the weight of the fluid column above that depth.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bd9f4916-d118-4105-ab58-282df7f715ed', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 90, 'A gear pump is an example of which category of pump?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('054b44e7-9060-412b-8df9-b722a82da354', 'bd9f4916-d118-4105-ab58-282df7f715ed', 0, 'Centrifugal (dynamic) pump');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eccfaaae-b913-4429-b17c-6a7f3b944c3b', 'bd9f4916-d118-4105-ab58-282df7f715ed', 1, 'Positive displacement pump');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a10fbf1b-dfba-4603-9de8-d843da831a22', 'bd9f4916-d118-4105-ab58-282df7f715ed', 2, 'Jet pump');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb873acf-ea86-4d93-b22d-b882ccbcd611', 'bd9f4916-d118-4105-ab58-282df7f715ed', 3, 'Axial-flow pump');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bd9f4916-d118-4105-ab58-282df7f715ed', 'eccfaaae-b913-4429-b17c-6a7f3b944c3b', 'A gear pump is a positive displacement pump — it moves a fixed volume of fluid per revolution by trapping fluid in the spaces between rotating gear teeth and the pump casing, distinct from centrifugal (dynamic) pumps, which impart velocity via a rotating impeller.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('684e5b52-06a5-473b-829c-424f661f5b3d', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 91, 'Hooke''s Law states that, within the elastic limit:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ba3fb06-6d5b-4307-bf10-dc267469566e', '684e5b52-06a5-473b-829c-424f661f5b3d', 0, 'Stress is inversely proportional to strain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('981b1f4d-3dd6-44aa-b0f7-0060d90257e4', '684e5b52-06a5-473b-829c-424f661f5b3d', 1, 'Stress is directly proportional to strain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('410bbcff-b535-403d-a190-d1da126a1ead', '684e5b52-06a5-473b-829c-424f661f5b3d', 2, 'Stress equals strain always');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d554a7d-3882-42cb-9b90-0df60c25d77c', '684e5b52-06a5-473b-829c-424f661f5b3d', 3, 'Stress is independent of strain');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('684e5b52-06a5-473b-829c-424f661f5b3d', '981b1f4d-3dd6-44aa-b0f7-0060d90257e4', 'Hooke''s Law states that, within the elastic limit of a material, stress is directly proportional to strain (σ = Eε), where E is the material''s modulus of elasticity (Young''s modulus) — this linear relationship breaks down beyond the elastic limit.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0e0d3571-a088-4833-893f-0cdd7a32445f', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 92, 'Young''s Modulus (Modulus of Elasticity) is a measure of a material''s:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cdc4edf5-f27c-46f9-85c5-4f296da341e0', '0e0d3571-a088-4833-893f-0cdd7a32445f', 0, 'Hardness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3059ade6-ae95-4dc9-8ec9-9add6e61d827', '0e0d3571-a088-4833-893f-0cdd7a32445f', 1, 'Stiffness — resistance to elastic deformation under tensile/compressive stress');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d99ee04-02fd-4a67-a67d-b3cc42bed9e0', '0e0d3571-a088-4833-893f-0cdd7a32445f', 2, 'Density');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7fbec5a-3e09-41d5-9481-15c364d07151', '0e0d3571-a088-4833-893f-0cdd7a32445f', 3, 'Thermal conductivity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0e0d3571-a088-4833-893f-0cdd7a32445f', '3059ade6-ae95-4dc9-8ec9-9add6e61d827', 'Young''s Modulus quantifies a material''s stiffness — its resistance to elastic (recoverable) deformation under a given tensile or compressive stress — a higher Young''s Modulus means the material deforms less for a given applied stress.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5d1350c6-9393-42af-993a-9ae0ba23cfb0', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 93, 'The ''neutral axis'' in a beam under pure bending is the axis where:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('afb026ef-9c17-4315-85f5-5e1cd5a5edfb', '5d1350c6-9393-42af-993a-9ae0ba23cfb0', 0, 'Maximum bending stress occurs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4aed8db3-41f1-4873-93bc-8488118ba80c', '5d1350c6-9393-42af-993a-9ae0ba23cfb0', 1, 'Bending stress is zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b42f01f-b41d-4423-9e17-f8274879041e', '5d1350c6-9393-42af-993a-9ae0ba23cfb0', 2, 'Maximum shear stress occurs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cbf01241-dc24-4a88-9041-2a72ba723bbc', '5d1350c6-9393-42af-993a-9ae0ba23cfb0', 3, 'The beam breaks first');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5d1350c6-9393-42af-993a-9ae0ba23cfb0', '4aed8db3-41f1-4873-93bc-8488118ba80c', 'The neutral axis is the plane within a beam''s cross-section where bending stress is zero — fibers above it experience one type of stress (e.g., compression) and fibers below experience the opposite (e.g., tension), for a beam in sagging bending.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a63c2737-a059-4dc6-a868-dc995a253cb9', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 94, 'Poisson''s Ratio is defined as the ratio of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81e7fe57-91fd-4854-a802-433103f58a67', 'a63c2737-a059-4dc6-a868-dc995a253cb9', 0, 'Axial stress to axial strain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1281358-42e6-4b10-ae0c-1403221db7b3', 'a63c2737-a059-4dc6-a868-dc995a253cb9', 1, 'Lateral strain to axial (longitudinal) strain, under uniaxial loading');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3617493-6ae2-4d0b-b06e-136d868c74ab', 'a63c2737-a059-4dc6-a868-dc995a253cb9', 2, 'Shear stress to shear strain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06ae261c-cd56-4c90-b7b4-dd93e9b41a59', 'a63c2737-a059-4dc6-a868-dc995a253cb9', 3, 'Volumetric strain to axial stress');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a63c2737-a059-4dc6-a868-dc995a253cb9', 'b1281358-42e6-4b10-ae0c-1403221db7b3', 'Poisson''s Ratio (ν) is defined as the negative ratio of lateral (transverse) strain to axial (longitudinal) strain when a material is subjected to uniaxial stress — it describes how much a material contracts laterally when stretched axially (or expands when compressed).', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2dfdf7e2-5c12-41b4-8b85-c59921a7a2d5', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 95, 'A material exhibiting a well-defined yield point followed by significant plastic deformation before fracture is described as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d67e449f-a5de-4d39-8f5b-378f908f41e0', '2dfdf7e2-5c12-41b4-8b85-c59921a7a2d5', 0, 'Brittle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce5c5b73-b693-46b9-9f12-1f35b67707e5', '2dfdf7e2-5c12-41b4-8b85-c59921a7a2d5', 1, 'Ductile');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e60ea185-1435-4e83-bce9-b430bcec2a7a', '2dfdf7e2-5c12-41b4-8b85-c59921a7a2d5', 2, 'Rigid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d1ae643-741c-40a2-acff-d70d44d82439', '2dfdf7e2-5c12-41b4-8b85-c59921a7a2d5', 3, 'Isotropic only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2dfdf7e2-5c12-41b4-8b85-c59921a7a2d5', 'ce5c5b73-b693-46b9-9f12-1f35b67707e5', 'A ductile material exhibits significant plastic (permanent) deformation after yielding and before fracture, unlike a brittle material, which fractures with little to no plastic deformation after reaching its ultimate strength.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4e85dbd1-514c-4bb6-bdf0-43c41d838575', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 96, 'The ''factor of safety'' in mechanical design is defined as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3fafbc0a-33d6-47c7-811a-6a817b1c5de2', '4e85dbd1-514c-4bb6-bdf0-43c41d838575', 0, 'Working stress / Ultimate (or yield) stress');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('108cbb2b-f1c4-44c1-8ba0-27e4ac3e68ee', '4e85dbd1-514c-4bb6-bdf0-43c41d838575', 1, 'Ultimate (or yield) stress / Working (allowable) stress');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00374b0b-88f6-438d-9f9f-4788b8797be8', '4e85dbd1-514c-4bb6-bdf0-43c41d838575', 2, 'Actual load / Design load');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('071e1c64-32b9-44ea-b6b0-5c8fc98be130', '4e85dbd1-514c-4bb6-bdf0-43c41d838575', 3, 'Always equal to 1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4e85dbd1-514c-4bb6-bdf0-43c41d838575', '108cbb2b-f1c4-44c1-8ba0-27e4ac3e68ee', 'Factor of safety = Ultimate (or yield) stress / Working (allowable) stress — a factor of safety greater than 1 provides a margin against uncertainties in loading, material properties, and manufacturing, ensuring the component operates well within its safe capacity.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0e25b910-b5eb-4acc-8750-2cf222e128e9', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 97, 'In a simply supported beam with a central point load, the maximum bending moment occurs:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e13888ce-ad15-4d02-b3a9-1a24341122c9', '0e25b910-b5eb-4acc-8750-2cf222e128e9', 0, 'At the supports');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b45d87b-4932-451b-829b-7fc3b7177088', '0e25b910-b5eb-4acc-8750-2cf222e128e9', 1, 'At the center (point of load application)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('874fbf58-8715-40ca-92f1-a51067e89b15', '0e25b910-b5eb-4acc-8750-2cf222e128e9', 2, 'Uniformly throughout the beam');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a339d80-f031-447a-bf8b-169470d68bee', '0e25b910-b5eb-4acc-8750-2cf222e128e9', 3, 'At the quarter-span points');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0e25b910-b5eb-4acc-8750-2cf222e128e9', '8b45d87b-4932-451b-829b-7fc3b7177088', 'For a simply supported beam with a central point load, the bending moment diagram is triangular, with the maximum bending moment occurring directly under the point load at the center of the span.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bbf061c0-c2a5-4555-81a2-ce5f00e95e5a', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 98, 'Torsional shear stress in a circular shaft, under a given torque, is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6a6879d-3a19-40c5-9029-00af2e3aae4b', 'bbf061c0-c2a5-4555-81a2-ce5f00e95e5a', 0, 'Uniform across the entire cross-section');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f828d60-9dc6-4cda-8f2f-a66020950860', 'bbf061c0-c2a5-4555-81a2-ce5f00e95e5a', 1, 'Zero at the center and maximum at the outer surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4918e9b9-240f-41f5-b4d1-e271b5bbfd69', 'bbf061c0-c2a5-4555-81a2-ce5f00e95e5a', 2, 'Maximum at the center and zero at the outer surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83b2a90c-af25-4121-be42-68eb20e5ac45', 'bbf061c0-c2a5-4555-81a2-ce5f00e95e5a', 3, 'Independent of the shaft''s radius');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bbf061c0-c2a5-4555-81a2-ce5f00e95e5a', '5f828d60-9dc6-4cda-8f2f-a66020950860', 'In a circular shaft under torsion, shear stress varies linearly from zero at the central axis (no torsional deformation there) to a maximum value at the outer surface (where the deformation, and hence stress, is greatest) — this is why hollow shafts can be more material-efficient than solid shafts for a given torque capacity.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('59394e0d-e086-42b1-90e3-9787332a49bf', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 99, 'Buckling of a slender column under axial compressive load is primarily governed by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb8f4b63-1a37-403a-afcc-19586d32a9fb', '59394e0d-e086-42b1-90e3-9787332a49bf', 0, 'The material''s yield strength alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('970b2d94-1702-45d5-9ff1-90f86ebc25e4', '59394e0d-e086-42b1-90e3-9787332a49bf', 1, 'Euler''s formula, which depends on the column''s slenderness ratio and end-support conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('668f7cd7-1742-44cf-a9c0-76a271e2795a', '59394e0d-e086-42b1-90e3-9787332a49bf', 2, 'The material''s density');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da3ecf81-d77e-4bde-9d03-15e1ee1b8d33', '59394e0d-e086-42b1-90e3-9787332a49bf', 3, 'The column''s surface finish');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('59394e0d-e086-42b1-90e3-9787332a49bf', '970b2d94-1702-45d5-9ff1-90f86ebc25e4', 'For slender columns, failure typically occurs by elastic buckling (sudden lateral deflection) rather than material yielding — Euler''s buckling formula predicts the critical buckling load based on the column''s length, cross-sectional moment of inertia, material''s elastic modulus, and end-support conditions (captured via the effective length/slenderness ratio).', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bd645987-419d-4939-860d-f246f679e2e7', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 100, 'Fatigue failure in a machine component occurs due to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38386e2b-f8db-4e17-aaa2-2791e8b6894f', 'bd645987-419d-4939-860d-f246f679e2e7', 0, 'A single overload event exceeding ultimate strength');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19bbfc35-1fd1-4302-9ef5-6757716ae00c', 'bd645987-419d-4939-860d-f246f679e2e7', 1, 'Repeated cyclic loading, even at stress levels well below the material''s ultimate (or even yield) strength');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0db3df70-369c-41c5-a08e-5fe1126c9eb4', 'bd645987-419d-4939-860d-f246f679e2e7', 2, 'Excessive heat alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ee89b62-1559-433d-90fb-4378314763b2', 'bd645987-419d-4939-860d-f246f679e2e7', 3, 'Corrosion alone');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bd645987-419d-4939-860d-f246f679e2e7', '19bbfc35-1fd1-4302-9ef5-6757716ae00c', 'Fatigue failure results from repeated cyclic loading over many cycles, causing progressive crack initiation and propagation, even when the applied stress is well below the material''s static ultimate or yield strength — a critical consideration in rotating machinery and vibrating structures.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('43b80dff-5823-4423-96c4-c161fef9955b', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 101, 'The ''Modulus of Rigidity'' (Shear Modulus) relates:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b30141f-0e17-4101-b36a-2134c192eddf', '43b80dff-5823-4423-96c4-c161fef9955b', 0, 'Normal stress to normal strain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5f033f2-8e28-4dc8-b0c4-f8a62cf6f5d0', '43b80dff-5823-4423-96c4-c161fef9955b', 1, 'Shear stress to shear strain, within the elastic limit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a3eb5c8-f249-4bf9-9273-2f76d862fd50', '43b80dff-5823-4423-96c4-c161fef9955b', 2, 'Volumetric stress to volumetric strain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d127b30-43c7-4410-b461-143764993c42', '43b80dff-5823-4423-96c4-c161fef9955b', 3, 'Temperature to thermal strain');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('43b80dff-5823-4423-96c4-c161fef9955b', 'a5f033f2-8e28-4dc8-b0c4-f8a62cf6f5d0', 'The Modulus of Rigidity (G), also called Shear Modulus, defines the linear relationship between shear stress and shear strain within a material''s elastic limit — analogous to how Young''s Modulus relates normal stress to normal strain.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d83e8cc7-f93c-4345-b6e7-86ad943d849d', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 102, 'A ''principal stress'' at a point in a stressed material is defined as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d032056f-f90a-47d9-b27a-b21cb6809835', 'd83e8cc7-f93c-4345-b6e7-86ad943d849d', 0, 'The average of all stresses at that point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0044cf30-2704-426e-b744-8f21aa67d581', 'd83e8cc7-f93c-4345-b6e7-86ad943d849d', 1, 'The normal stress on a plane where shear stress is zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c246bc89-0460-4357-95bc-fa0baab25357', 'd83e8cc7-f93c-4345-b6e7-86ad943d849d', 2, 'Always the maximum possible stress in any material');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb193ca8-4468-48b0-ac89-e7c7a6136cb2', 'd83e8cc7-f93c-4345-b6e7-86ad943d849d', 3, 'The stress measured only in the vertical direction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d83e8cc7-f93c-4345-b6e7-86ad943d849d', '0044cf30-2704-426e-b744-8f21aa67d581', 'Principal stresses are the normal stresses acting on specific planes (principal planes) at a point where the shear stress is zero — these represent the maximum and minimum normal stresses at that point, critical for failure analysis under combined loading.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e5e825b7-2c4d-49d4-88bc-6f5efdf0d13f', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 103, 'Strain energy stored in a material under elastic deformation is given by the area under the:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78ee79fd-5b43-4266-bcc2-b4946a9e29d5', 'e5e825b7-2c4d-49d4-88bc-6f5efdf0d13f', 0, 'Stress-strain curve, up to the point of loading');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a585755-3c45-4be5-ad08-4949f8ae71c3', 'e5e825b7-2c4d-49d4-88bc-6f5efdf0d13f', 1, 'Load-deflection curve of the structure only, never the stress-strain curve');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e1c33e4-99c4-4764-a871-06e04fd37659', 'e5e825b7-2c4d-49d4-88bc-6f5efdf0d13f', 2, 'Temperature-time curve');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24dcba9f-53d6-4e1c-99f4-5875fe5ca30b', 'e5e825b7-2c4d-49d4-88bc-6f5efdf0d13f', 3, 'Velocity-time curve');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e5e825b7-2c4d-49d4-88bc-6f5efdf0d13f', '78ee79fd-5b43-4266-bcc2-b4946a9e29d5', 'Strain energy (per unit volume, or resilience) stored in a material under elastic loading is represented by the area under the stress-strain curve up to the point of loading — for linear elastic (Hookean) behavior, this simplifies to (1/2)σε.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0f5c29d8-78b5-4c3f-b17c-9bc84fc22903', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 104, 'In a thin-walled pressure vessel (cylindrical), the hoop (circumferential) stress is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94dae8ae-165e-4483-b4fe-b92e7f00b463', '0f5c29d8-78b5-4c3f-b17c-9bc84fc22903', 0, 'Equal to the longitudinal stress');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('195c1470-1e0b-4c87-ac29-76c165e49f5e', '0f5c29d8-78b5-4c3f-b17c-9bc84fc22903', 1, 'Twice the longitudinal stress');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c0a5beb-a0a1-470a-9f9a-e26d2add7ffc', '0f5c29d8-78b5-4c3f-b17c-9bc84fc22903', 2, 'Half the longitudinal stress');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa481e95-8991-4db7-a0ac-81f5c2bbd24c', '0f5c29d8-78b5-4c3f-b17c-9bc84fc22903', 3, 'Independent of internal pressure');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0f5c29d8-78b5-4c3f-b17c-9bc84fc22903', '195c1470-1e0b-4c87-ac29-76c165e49f5e', 'For a thin-walled cylindrical pressure vessel, hoop stress (σh = pd/2t) is exactly twice the longitudinal stress (σl = pd/4t) — this is why cylindrical pressure vessels typically fail by splitting along a longitudinal seam rather than a circumferential one.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('147384b7-eadd-4afc-a899-d6d568213308', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 105, 'The ''endurance limit'' of a material, relevant to fatigue design, refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e9c615f-7d0f-4fa4-af9e-2ae7bb363294', '147384b7-eadd-4afc-a899-d6d568213308', 0, 'The maximum stress a material can withstand for exactly one cycle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfd00d7b-8e83-4ee1-ba61-6773f3bd9629', '147384b7-eadd-4afc-a899-d6d568213308', 1, 'The stress level below which a material can theoretically withstand an infinite number of load cycles without fatigue failure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5c90657-d709-42ca-b770-39a1eb966d94', '147384b7-eadd-4afc-a899-d6d568213308', 2, 'The material''s melting point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6e9ac88-49ea-4963-bc4f-8c9c80cab3dd', '147384b7-eadd-4afc-a899-d6d568213308', 3, 'The material''s hardness');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('147384b7-eadd-4afc-a899-d6d568213308', 'cfd00d7b-8e83-4ee1-ba61-6773f3bd9629', 'The endurance limit (for materials like steel that exhibit one, unlike most non-ferrous metals) is the stress amplitude below which a material can theoretically sustain an infinite number of cyclic loadings without fatigue failure — a key design parameter for components subject to repeated loading.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a3419463-46ee-4149-8c9f-3c12131c7e5c', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 106, 'A ''kinematic pair'' in mechanisms refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ceab6753-69e4-4545-a619-72b8d67a63f1', 'a3419463-46ee-4149-8c9f-3c12131c7e5c', 0, 'Two links connected in a manner that allows relative motion between them');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ad813d7-d005-4c59-9eb0-abbd11cb437b', 'a3419463-46ee-4149-8c9f-3c12131c7e5c', 1, 'Any two gears meshing together');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e51fc9d3-1e21-47f5-9de0-f36be0b44f27', 'a3419463-46ee-4149-8c9f-3c12131c7e5c', 2, 'A pair of identical machine parts');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab8b153b-5fa0-4807-987c-b972ce54709f', 'a3419463-46ee-4149-8c9f-3c12131c7e5c', 3, 'Two forces acting on a body');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a3419463-46ee-4149-8c9f-3c12131c7e5c', 'ceab6753-69e4-4545-a619-72b8d67a63f1', 'A kinematic pair is a joint between two links (rigid bodies) that permits some form of relative motion (e.g., sliding, rotating) between them while constraining others — the fundamental building block of mechanisms.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3ce3afd0-af55-413a-9c13-76732a408a90', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 107, 'The degrees of freedom of a planar mechanism can be calculated using:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77cb594e-4c56-4211-bf1c-0415d84ab82b', '3ce3afd0-af55-413a-9c13-76732a408a90', 0, 'Euler''s formula');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('71c82c2a-d294-41da-8acf-03974d1fe3a1', '3ce3afd0-af55-413a-9c13-76732a408a90', 1, 'Grubler''s (Kutzbach) equation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('52a238bb-9188-4d38-95c3-e2505a78e362', '3ce3afd0-af55-413a-9c13-76732a408a90', 2, 'Bernoulli''s equation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c82e917-1387-4d51-a30f-5d67c2de96d2', '3ce3afd0-af55-413a-9c13-76732a408a90', 3, 'Newton''s Second Law directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3ce3afd0-af55-413a-9c13-76732a408a90', '71c82c2a-d294-41da-8acf-03974d1fe3a1', 'Grubler''s equation (also called the Kutzbach criterion), DOF = 3(n-1) - 2j1 - j2, is used to calculate the degrees of freedom of a planar mechanism based on the number of links (n) and the number and type of kinematic pairs (j1 for lower pairs, j2 for higher pairs).', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d71e6b36-57d1-4b01-ad2c-c13646c499b2', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 108, 'A flywheel in a machine is primarily used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3489ff3d-7ab3-49cb-bdbb-be5629592388', 'd71e6b36-57d1-4b01-ad2c-c13646c499b2', 0, 'Increase the machine''s overall speed permanently');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef090e11-a022-410c-9446-17ba0e501fd1', 'd71e6b36-57d1-4b01-ad2c-c13646c499b2', 1, 'Store and release rotational kinetic energy, smoothing out fluctuations in speed caused by variable torque/load');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('512279d1-5459-46e7-8d50-e4ee4ff826c8', 'd71e6b36-57d1-4b01-ad2c-c13646c499b2', 2, 'Generate electrical power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be64977f-94a7-408f-b7c8-772e106b9649', 'd71e6b36-57d1-4b01-ad2c-c13646c499b2', 3, 'Reduce the machine''s weight');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d71e6b36-57d1-4b01-ad2c-c13646c499b2', 'ef090e11-a022-410c-9446-17ba0e501fd1', 'A flywheel stores rotational kinetic energy during periods of excess torque and releases it during periods of torque deficiency, smoothing out speed fluctuations in machines with cyclically varying loads or torque (like reciprocating engines and presses).', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6cef9b5c-2d1b-44bf-a56b-cc5d78988936', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 109, 'The natural frequency of a simple spring-mass system (undamped) is given by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8df7299d-1151-4240-9f21-fba2b24104ff', '6cef9b5c-2d1b-44bf-a56b-cc5d78988936', 0, 'ωn = √(k/m)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d823c55d-6a4f-4764-9a90-533906453af4', '6cef9b5c-2d1b-44bf-a56b-cc5d78988936', 1, 'ωn = k/m');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5dec0617-18f9-4c7e-9973-2e7c9c45db38', '6cef9b5c-2d1b-44bf-a56b-cc5d78988936', 2, 'ωn = √(m/k)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea734a23-4ccb-4247-80b0-3f265d5060f3', '6cef9b5c-2d1b-44bf-a56b-cc5d78988936', 3, 'ωn = km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6cef9b5c-2d1b-44bf-a56b-cc5d78988936', '8df7299d-1151-4240-9f21-fba2b24104ff', 'For a simple undamped spring-mass system, the natural angular frequency is ωn = √(k/m), where k is the spring stiffness and m is the mass — a stiffer spring or lighter mass results in a higher natural frequency.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4238e54b-0296-400b-be1e-fdccfb726b52', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 110, 'Resonance in a mechanical system occurs when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02db69b9-3248-4b70-bcfe-2b3e33a7edc6', '4238e54b-0296-400b-be1e-fdccfb726b52', 0, 'The damping ratio is exactly 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94ce3d57-97d6-47a0-b849-fb9d03bf60e9', '4238e54b-0296-400b-be1e-fdccfb726b52', 1, 'The frequency of an external excitation force matches (or nearly matches) the system''s natural frequency, causing large amplitude oscillations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4742b65c-5500-4808-bcc5-ca69a96a77d7', '4238e54b-0296-400b-be1e-fdccfb726b52', 2, 'The system is completely at rest');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9521b3b1-51c9-47aa-9f06-59af53ff2dde', '4238e54b-0296-400b-be1e-fdccfb726b52', 3, 'The system has no mass');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4238e54b-0296-400b-be1e-fdccfb726b52', '94ce3d57-97d6-47a0-b849-fb9d03bf60e9', 'Resonance occurs when an external excitation''s frequency approaches the system''s natural frequency, causing the amplitude of vibration to increase dramatically (theoretically to infinity for an undamped system) — a critical consideration to avoid in machine and structural design.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('156365ce-78e8-4ef1-ace2-4b687250fcf9', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 111, 'The purpose of a governor in an engine (as distinct from a flywheel) is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('416c5d3e-2be7-4043-beec-d77bbbd5872e', '156365ce-78e8-4ef1-ace2-4b687250fcf9', 0, 'Store kinetic energy to smooth out cyclic speed variation within one revolution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80b2c4d1-e47f-4f29-845e-32a70ac3bedb', '156365ce-78e8-4ef1-ace2-4b687250fcf9', 1, 'Regulate and maintain the mean speed of the engine over longer-term load variations, by controlling fuel/steam supply');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b80c7b2-5dbd-4833-b162-1173dfeab039', '156365ce-78e8-4ef1-ace2-4b687250fcf9', 2, 'Increase the engine''s maximum speed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5fd63247-751b-4946-818e-efff62452d9f', '156365ce-78e8-4ef1-ace2-4b687250fcf9', 3, 'Reduce vibration only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('156365ce-78e8-4ef1-ace2-4b687250fcf9', '80b2c4d1-e47f-4f29-845e-32a70ac3bedb', 'A governor regulates the engine''s mean speed over longer-term load variations by automatically adjusting the fuel or steam supply, whereas a flywheel smooths out short-term (within-cycle) speed fluctuations by storing/releasing kinetic energy — the two serve genuinely distinct, complementary purposes.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ae9d7569-cbf0-47fb-a429-e77a68a5c25a', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 112, 'A cam-follower mechanism is used primarily to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c01ae88-b0e4-4654-8d3b-7b0d38f8404b', 'ae9d7569-cbf0-47fb-a429-e77a68a5c25a', 0, 'Convert rotary motion into a desired (often complex) translational or oscillatory motion of the follower');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('609c7c7c-8336-4a75-91f9-89b5c48ad06c', 'ae9d7569-cbf0-47fb-a429-e77a68a5c25a', 1, 'Transmit power over long distances');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0676c1d9-3e14-420b-a0c1-e31bbf24f1b0', 'ae9d7569-cbf0-47fb-a429-e77a68a5c25a', 2, 'Generate electrical current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d17482e-0af6-4925-8dae-1d4fc6b7576a', 'ae9d7569-cbf0-47fb-a429-e77a68a5c25a', 3, 'Measure rotational speed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ae9d7569-cbf0-47fb-a429-e77a68a5c25a', '0c01ae88-b0e4-4654-8d3b-7b0d38f8404b', 'A cam-follower mechanism converts the rotary motion of the cam into a specific, often precisely-timed translational or oscillatory motion of the follower, widely used in engine valve trains, textile machinery, and automated production equipment.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3c566422-c976-4eb8-a8df-f8ec30a87670', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 113, 'In a simple gear train, the velocity ratio between two meshing gears is inversely proportional to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d44ad7da-e6dd-4f9f-a42d-76dff38368f0', '3c566422-c976-4eb8-a8df-f8ec30a87670', 0, 'The ratio of their pitch circle diameters (or number of teeth)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fed5371d-128b-45b7-aae1-62a84802c9ca', '3c566422-c976-4eb8-a8df-f8ec30a87670', 1, 'The distance between their centers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81fe03fd-1888-4238-b163-712e168ba95e', '3c566422-c976-4eb8-a8df-f8ec30a87670', 2, 'Their material properties');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc1e3554-2edd-4431-99d6-21307ba942e7', '3c566422-c976-4eb8-a8df-f8ec30a87670', 3, 'The applied torque');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3c566422-c976-4eb8-a8df-f8ec30a87670', 'd44ad7da-e6dd-4f9f-a42d-76dff38368f0', 'For two meshing gears, the velocity ratio (speed ratio) is inversely proportional to the ratio of their number of teeth (or pitch circle diameters) — a smaller gear (pinion) rotates faster than a larger meshing gear, in inverse proportion to their tooth counts.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d7050eb2-2438-4091-b0f5-cc286ac3945e', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 114, 'Whirling (or critical) speed of a rotating shaft refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0ae378f-d924-4c62-b64d-8986dedb812b', 'd7050eb2-2438-4091-b0f5-cc286ac3945e', 0, 'The maximum speed a motor can achieve');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('def481bd-c2d7-4fbc-8279-4e2ef6b2d889', 'd7050eb2-2438-4091-b0f5-cc286ac3945e', 1, 'The speed at which the shaft''s rotational frequency coincides with its natural transverse vibration frequency, causing large deflections');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('202df7e1-5c82-4c86-880b-404b222f7ef2', 'd7050eb2-2438-4091-b0f5-cc286ac3945e', 2, 'The speed at which a shaft stops rotating');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b09a161-e402-4959-8082-97b797b35a3d', 'd7050eb2-2438-4091-b0f5-cc286ac3945e', 3, 'A speed that never causes any issues');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d7050eb2-2438-4091-b0f5-cc286ac3945e', 'def481bd-c2d7-4fbc-8279-4e2ef6b2d889', 'The whirling (critical) speed is the rotational speed at which a shaft''s operating frequency coincides with its natural transverse (bending) vibration frequency, causing resonance and potentially large, damaging lateral deflections — shaft operating speeds are deliberately designed to avoid this critical speed.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bd53f361-dc6b-43c0-84e3-471a57b46c9f', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 115, 'Damping in a vibrating mechanical system serves to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45afad61-65b4-4b7b-809b-0b21c9e36173', 'bd53f361-dc6b-43c0-84e3-471a57b46c9f', 0, 'Increase the amplitude of vibration indefinitely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30d30182-c9a4-4a57-a479-0b996f0cea3c', 'bd53f361-dc6b-43c0-84e3-471a57b46c9f', 1, 'Dissipate vibrational energy over time, reducing the amplitude of oscillation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2d7ceec-55bb-46df-8341-6a775680f03b', 'bd53f361-dc6b-43c0-84e3-471a57b46c9f', 2, 'Increase the natural frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d38ee87f-7c8a-44be-9592-4bc117f9a9a8', 'bd53f361-dc6b-43c0-84e3-471a57b46c9f', 3, 'Have no effect on the system''s response');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bd53f361-dc6b-43c0-84e3-471a57b46c9f', '30d30182-c9a4-4a57-a479-0b996f0cea3c', 'Damping dissipates vibrational energy (typically as heat, via friction or viscous resistance), causing the amplitude of free vibration to decay over time — critical for controlling resonance amplitude and improving a system''s dynamic stability.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4abcaaaf-4a00-4c53-b3cd-549fa02e5777', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 116, 'A ''fillet'' is deliberately used at a sharp corner or change of cross-section in a machine component primarily to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('626961b4-1e04-40bd-87e2-bb670e00e57d', '4abcaaaf-4a00-4c53-b3cd-549fa02e5777', 0, 'Increase the component''s weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68f76c02-ef1b-424d-a2e8-0d09bfd93127', '4abcaaaf-4a00-4c53-b3cd-549fa02e5777', 1, 'Reduce stress concentration at that location');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0c1c5ba-92fd-48c9-be4d-c99257e5f33a', '4abcaaaf-4a00-4c53-b3cd-549fa02e5777', 2, 'Increase manufacturing cost with no functional benefit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30ba3908-7645-4975-82f1-0adc360bc553', '4abcaaaf-4a00-4c53-b3cd-549fa02e5777', 3, 'Reduce the component''s strength');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4abcaaaf-4a00-4c53-b3cd-549fa02e5777', '68f76c02-ef1b-424d-a2e8-0d09bfd93127', 'A fillet (a rounded transition at a sharp corner or change in cross-section) significantly reduces stress concentration at that location by smoothing the flow of stress lines, reducing the risk of fatigue crack initiation compared to a sharp corner.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a2145539-e42c-4f2e-a09a-44a7d11b9840', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 117, 'A ''key'' in a shaft-hub connection (e.g., attaching a gear to a shaft) is used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28f244f9-3c5d-4b0f-8a38-785c0cde3e81', 'a2145539-e42c-4f2e-a09a-44a7d11b9840', 0, 'Lubricate the connection');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a54e2c5-6724-4ba6-9039-cd8be7b6256a', 'a2145539-e42c-4f2e-a09a-44a7d11b9840', 1, 'Transmit torque between the shaft and the hub while preventing relative rotation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84c266d9-8866-4e7b-942f-d660727157e4', 'a2145539-e42c-4f2e-a09a-44a7d11b9840', 2, 'Reduce the shaft''s diameter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a4736bd-1a81-4356-a43c-778199a70f6d', 'a2145539-e42c-4f2e-a09a-44a7d11b9840', 3, 'Increase the connection''s flexibility');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a2145539-e42c-4f2e-a09a-44a7d11b9840', '6a54e2c5-6724-4ba6-9039-cd8be7b6256a', 'A key is a machine element inserted into matching keyways on a shaft and hub, transmitting torque between them while preventing relative rotational slip — a fundamental, widely-used method for connecting rotating components.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1e78c317-8924-4dbf-a3ba-7f94b2786662', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 118, 'A welded joint, compared to a riveted joint, generally offers:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aea9a834-0ca4-483e-969e-8594772e1528', '1e78c317-8924-4dbf-a3ba-7f94b2786662', 0, 'Lower joint efficiency and more weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7eea0b86-fe1c-46c2-a9fb-bd7914589819', '1e78c317-8924-4dbf-a3ba-7f94b2786662', 1, 'Higher joint efficiency (closer to 100%) and reduced weight, since no holes need to be drilled through the base material');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('affc3d00-3834-46cb-acb0-8a778c65de69', '1e78c317-8924-4dbf-a3ba-7f94b2786662', 2, 'No structural strength at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a1f5bae-c852-4491-b731-141f4fab5ff4', '1e78c317-8924-4dbf-a3ba-7f94b2786662', 3, 'Identical performance in every application');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1e78c317-8924-4dbf-a3ba-7f94b2786662', '7eea0b86-fe1c-46c2-a9fb-bd7914589819', 'Welded joints generally achieve higher joint efficiency (closer to the base material''s full strength) since they don''t require drilling holes (which remove material and create stress concentrations, as in riveted joints), and they typically result in lighter, more compact assemblies.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('10180ad6-600a-4941-8bea-04fb09ebb26a', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 119, 'The primary function of a bearing in rotating machinery is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('993b23eb-0ec7-4695-94e9-9ac666aceba8', '10180ad6-600a-4941-8bea-04fb09ebb26a', 0, 'Increase friction to slow the shaft down');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cca63eb1-2cdb-4aed-be60-5839b51b5ed4', '10180ad6-600a-4941-8bea-04fb09ebb26a', 1, 'Support a rotating (or reciprocating) shaft while allowing relative motion with minimal friction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f778ff2-8c76-4ab5-90a1-1469550ecc57', '10180ad6-600a-4941-8bea-04fb09ebb26a', 2, 'Generate electrical power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2485460b-f6f3-4956-a1db-7af5ec91275f', '10180ad6-600a-4941-8bea-04fb09ebb26a', 3, 'Convert rotary motion to linear motion');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('10180ad6-600a-4941-8bea-04fb09ebb26a', 'cca63eb1-2cdb-4aed-be60-5839b51b5ed4', 'A bearing supports a rotating or sliding component while permitting relative motion with minimal friction and wear — bearings can be broadly classified as rolling-contact (ball/roller) bearings or sliding-contact (journal/sleeve) bearings, each suited to different load/speed combinations.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c12974a7-51de-4525-9d5f-915aee336d20', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 120, 'A ''preloaded'' bolted joint is designed such that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3169e561-4a53-49fd-bbfe-9e5745713a51', 'c12974a7-51de-4525-9d5f-915aee336d20', 0, 'The bolt is left completely loose before service loading');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9969af7c-7cd4-4325-802b-473c933f611b', 'c12974a7-51de-4525-9d5f-915aee336d20', 1, 'The bolt is tightened to induce an initial tensile stress before external service loads are applied, improving joint stiffness and fatigue resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b19f29f-a38c-4801-85f1-530905c1c4ca', 'c12974a7-51de-4525-9d5f-915aee336d20', 2, 'The bolt material is heated before installation only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('369e942f-5a4d-4db4-bfb7-2a6e7a1f93f2', 'c12974a7-51de-4525-9d5f-915aee336d20', 3, 'Preloading has no effect on joint performance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c12974a7-51de-4525-9d5f-915aee336d20', '9969af7c-7cd4-4325-802b-473c933f611b', 'Preloading a bolted joint (tightening the bolt to induce an initial clamping tensile stress) improves the joint''s effective stiffness and significantly improves its fatigue resistance, since properly preloaded joints experience much smaller fluctuations in bolt stress under cyclic external loading compared to an unpreloaded joint.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('701abf50-2470-48cc-89da-2a84383886ad', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 121, 'In gear design, the ''module'' of a gear is defined as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3235dd9-6de9-4fd5-8167-5ca8b6021086', '701abf50-2470-48cc-89da-2a84383886ad', 0, 'The number of teeth divided by the pitch circle diameter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7fbaf38a-61ce-441a-87bd-c1a151a3f237', '701abf50-2470-48cc-89da-2a84383886ad', 1, 'The pitch circle diameter divided by the number of teeth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0984dd5e-e638-40d2-aa67-8e9970ea3380', '701abf50-2470-48cc-89da-2a84383886ad', 2, 'The pressure angle of the gear teeth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('827edfba-6a0d-4794-be79-667781139998', '701abf50-2470-48cc-89da-2a84383886ad', 3, 'The face width of the gear');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('701abf50-2470-48cc-89da-2a84383886ad', '7fbaf38a-61ce-441a-87bd-c1a151a3f237', 'The module (m) of a gear is defined as the pitch circle diameter divided by the number of teeth (m = D/T) — it is a standard, direct measure of tooth size, and two gears must have the same module to mesh correctly together.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('76d158f3-d094-4c30-8f71-5bb4cb5b1616', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 122, 'The purpose of a coupling in machine design is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('592315f8-92fb-4aab-a575-ac3b17806393', '76d158f3-d094-4c30-8f71-5bb4cb5b1616', 0, 'Connect two shafts together to transmit torque/power between them');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af3b94f4-8a0d-4410-a914-dc59cdb79f3b', '76d158f3-d094-4c30-8f71-5bb4cb5b1616', 1, 'Reduce the speed of a shaft');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c53551f1-03cb-4898-8ecd-f8391b538c6e', '76d158f3-d094-4c30-8f71-5bb4cb5b1616', 2, 'Convert AC to DC');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51d60f06-797e-4699-b06f-0c96e8167ae4', '76d158f3-d094-4c30-8f71-5bb4cb5b1616', 3, 'Increase the shaft''s diameter permanently');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('76d158f3-d094-4c30-8f71-5bb4cb5b1616', '592315f8-92fb-4aab-a575-ac3b17806393', 'A coupling connects two shafts (typically from separate machines, like a motor and a pump) to transmit torque and rotational motion between them — couplings can be rigid (no misalignment tolerance) or flexible (accommodates some misalignment and shock absorption).', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('135d2f70-eaf8-484d-a37f-0e7abce39ac4', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 123, 'A design based on ''maximum shear stress theory'' (Tresca criterion) is typically used for predicting failure in:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94ae55c9-47f0-4c56-ba56-b84626a89488', '135d2f70-eaf8-484d-a37f-0e7abce39ac4', 0, 'Brittle materials only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4308e0bc-0550-45f1-806b-81d4b2805fff', '135d2f70-eaf8-484d-a37f-0e7abce39ac4', 1, 'Ductile materials, under combined/complex loading');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f51f6906-9067-4fa4-8e8a-a556fd1e80de', '135d2f70-eaf8-484d-a37f-0e7abce39ac4', 2, 'Materials with no yield point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('078c6c32-a55d-4b5b-a73d-83aedf412c41', '135d2f70-eaf8-484d-a37f-0e7abce39ac4', 3, 'Materials under pure hydrostatic pressure only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('135d2f70-eaf8-484d-a37f-0e7abce39ac4', '4308e0bc-0550-45f1-806b-81d4b2805fff', 'The maximum shear stress theory (Tresca criterion) is commonly used to predict yielding (failure) in ductile materials under combined or complex loading conditions, based on the premise that yielding begins when the maximum shear stress reaches the value observed at yield in a simple uniaxial tension test.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('df6fb1ae-32cf-477e-bf61-f1e21bc34e15', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 124, 'A spring''s ''stiffness'' (spring rate) is defined as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38ca10f3-2c66-426e-9c1b-d82011cac6ee', 'df6fb1ae-32cf-477e-bf61-f1e21bc34e15', 0, 'The force required to produce unit deflection');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('671c7c54-9e26-4b8d-87f5-d933afcd40a7', 'df6fb1ae-32cf-477e-bf61-f1e21bc34e15', 1, 'The maximum load the spring can bear before permanent deformation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5a74b13-fb53-4ca3-95d0-bb56caa8fb54', 'df6fb1ae-32cf-477e-bf61-f1e21bc34e15', 2, 'The material of the spring');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f37071c0-61f1-47b1-add6-e635d216f3da', 'df6fb1ae-32cf-477e-bf61-f1e21bc34e15', 3, 'The number of coils in the spring');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('df6fb1ae-32cf-477e-bf61-f1e21bc34e15', '38ca10f3-2c66-426e-9c1b-d82011cac6ee', 'Spring stiffness (spring rate, k) is defined as the force required to produce a unit deflection (k = F/δ) — a stiffer spring requires more force to achieve the same deflection as a less stiff spring.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9ff88761-206f-4f33-9be7-6ce880247bc3', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 125, 'In gear systems, the ''pressure angle'' primarily affects:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9601d7bf-b085-4972-9644-2681c0e0bd5f', '9ff88761-206f-4f33-9be7-6ce880247bc3', 0, 'The gear''s color');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8fd380f0-368a-4c94-baf0-ddcc69ecbab0', '9ff88761-206f-4f33-9be7-6ce880247bc3', 1, 'The shape of the gear tooth profile and the direction of the force transmitted between meshing teeth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03147d22-babd-44db-9fad-7a2e4cb41740', '9ff88761-206f-4f33-9be7-6ce880247bc3', 2, 'The gear''s weight only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f55d10a6-9869-4f5c-9891-3871ad8ce22f', '9ff88761-206f-4f33-9be7-6ce880247bc3', 3, 'The lubricant type required');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9ff88761-206f-4f33-9be7-6ce880247bc3', '8fd380f0-368a-4c94-baf0-ddcc69ecbab0', 'The pressure angle (commonly 14.5° or 20° in standard involute gear systems) determines the tooth profile''s shape and the direction of the force transmitted at the point of contact between meshing gear teeth — it affects load-carrying capacity, interference, and smoothness of engagement.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('03dc1bfa-2011-4c9a-a4b1-f833f5fc4a63', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 126, 'In a lathe machine, the primary cutting motion is provided by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38af5a14-8cfc-4e26-8c87-9b57eb31601b', '03dc1bfa-2011-4c9a-a4b1-f833f5fc4a63', 0, 'The tool moving while the workpiece is stationary');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ad549c1-264e-4891-92ca-d654fa1ea440', '03dc1bfa-2011-4c9a-a4b1-f833f5fc4a63', 1, 'The rotation of the workpiece (chuck), while the tool moves along the feed direction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b131ffbb-3100-47e8-b4a9-2bb03bf228fc', '03dc1bfa-2011-4c9a-a4b1-f833f5fc4a63', 2, 'Both the tool and workpiece remaining stationary');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('14a8856c-3e13-49a8-9720-4f591da9a208', '03dc1bfa-2011-4c9a-a4b1-f833f5fc4a63', 3, 'The tailstock rotating');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('03dc1bfa-2011-4c9a-a4b1-f833f5fc4a63', '3ad549c1-264e-4891-92ca-d654fa1ea440', 'In a lathe, the workpiece (held in the chuck) rotates to provide the primary cutting motion, while the cutting tool moves (typically along the longitudinal or cross-feed direction) to remove material and shape the workpiece.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cf4ac567-f850-46a0-be9b-1119f3c69132', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 127, 'In arc welding, the primary source of heat for melting the base metal and filler material is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8e55a0f-a723-46a5-a138-ccc2643c8714', 'cf4ac567-f850-46a0-be9b-1119f3c69132', 0, 'Chemical combustion of a fuel gas alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57d78b0f-bc2e-46d2-a689-b8c068ac915d', 'cf4ac567-f850-46a0-be9b-1119f3c69132', 1, 'An electric arc struck between an electrode and the workpiece');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('640aaf5a-d358-4fdb-8075-83e9f38dda53', 'cf4ac567-f850-46a0-be9b-1119f3c69132', 2, 'Friction between two surfaces');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca733582-1146-4ee2-845c-425e2fea2682', 'cf4ac567-f850-46a0-be9b-1119f3c69132', 3, 'Induced electrical resistance heating alone');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cf4ac567-f850-46a0-be9b-1119f3c69132', '57d78b0f-bc2e-46d2-a689-b8c068ac915d', 'Arc welding generates intense localized heat from an electric arc sustained between an electrode and the workpiece, melting both the base metal and (in consumable-electrode processes) the filler material to form the weld joint.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('06a84c3e-7382-4959-92e8-573e6e10e152', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 128, 'Sand casting is a manufacturing process primarily suited for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e317fe9-525f-4e6f-a298-576c1d8d2982', '06a84c3e-7382-4959-92e8-573e6e10e152', 0, 'Very high-precision, tight-tolerance parts only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a1ace03-81af-48d8-9a4e-327b674b8cc9', '06a84c3e-7382-4959-92e8-573e6e10e152', 1, 'Producing complex-shaped metal parts economically, especially for low-to-medium production volumes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('825ae9c7-4a5f-4b50-aed7-d279780d010b', '06a84c3e-7382-4959-92e8-573e6e10e152', 2, 'Only non-metallic materials');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82f39d65-d8e9-462c-b669-0631c76a6613', '06a84c3e-7382-4959-92e8-573e6e10e152', 3, 'Producing parts with no internal cavities possible');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('06a84c3e-7382-4959-92e8-573e6e10e152', '1a1ace03-81af-48d8-9a4e-327b674b8cc9', 'Sand casting is a versatile, relatively low-cost process well-suited for producing complex-shaped metal parts (including internal cavities via cores) for low-to-medium production volumes, though it generally offers lower dimensional precision and surface finish than processes like die casting or machining.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('96a13de7-d951-4c74-8a96-f67126abe5bc', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 129, 'In injection molding (for plastic parts), the primary process steps are:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7413bcb5-3079-469b-a3ab-2c6f38f12318', '96a13de7-d951-4c74-8a96-f67126abe5bc', 0, 'Melting the polymer, injecting it into a mold cavity under pressure, cooling/solidifying, and ejecting the part');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08f9c299-6140-400f-afdb-5c821541726a', '96a13de7-d951-4c74-8a96-f67126abe5bc', 1, 'Only heating a solid block of plastic with no mold involved');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d6593ee-fcab-4b24-8cda-a0076d0110a8', '96a13de7-d951-4c74-8a96-f67126abe5bc', 2, 'Casting molten metal into a plastic mold');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8b0ebec-3a2a-4e1d-a589-95c61d65ecd2', '96a13de7-d951-4c74-8a96-f67126abe5bc', 3, 'Machining a solid plastic block into shape');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('96a13de7-d951-4c74-8a96-f67126abe5bc', '7413bcb5-3079-469b-a3ab-2c6f38f12318', 'Injection molding involves melting polymer pellets, injecting the molten polymer into a closed mold cavity under high pressure, allowing it to cool and solidify into the mold''s shape, and then ejecting the finished part — a highly efficient process for mass-producing plastic components.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7bb0568b-a1a1-4ae7-9390-431d36f3408c', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 130, '''Interchangeability'' in manufacturing/metrology refers to the ability to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b4c5512-3d4e-454b-bf3b-aeca696b57a6', '7bb0568b-a1a1-4ae7-9390-431d36f3408c', 0, 'Manufacture parts of any dimension without checking');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2762447a-c73c-417f-9aa0-6613e241882e', '7bb0568b-a1a1-4ae7-9390-431d36f3408c', 1, 'Replace any part from a batch with another identical part from the same batch, without additional fitting or adjustment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e83f64d-6ad1-4a4b-a93b-2de91fc90c82', '7bb0568b-a1a1-4ae7-9390-431d36f3408c', 2, 'Use only one type of material for all parts');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbbbf83e-7c01-4339-8fa1-d04868a04e78', '7bb0568b-a1a1-4ae7-9390-431d36f3408c', 3, 'Manufacture parts by hand only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7bb0568b-a1a1-4ae7-9390-431d36f3408c', '2762447a-c73c-417f-9aa0-6613e241882e', 'Interchangeability means any part manufactured to a given specification/tolerance can directly replace another part from the same production batch without requiring additional fitting, filing, or adjustment — a foundational principle of mass production, achieved through standardized tolerances and limits/fits systems.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f519ec59-d4c7-4085-b096-1975bd3f9afc', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 131, 'A vernier caliper is used to measure linear dimensions with a typical least count of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5794b5c9-40c5-4b2c-81b9-86f905b76669', 'f519ec59-d4c7-4085-b096-1975bd3f9afc', 0, '1 mm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d66f36b1-7192-4872-ae41-dbae574e58b1', 'f519ec59-d4c7-4085-b096-1975bd3f9afc', 1, '0.1 mm or 0.02 mm, depending on the specific instrument');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73fd1a6a-32ec-41b1-9d1a-b85a3fb34c5f', 'f519ec59-d4c7-4085-b096-1975bd3f9afc', 2, '1 cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13239c9b-2872-4b52-8551-9850a20eec18', 'f519ec59-d4c7-4085-b096-1975bd3f9afc', 3, '1 micron always');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f519ec59-d4c7-4085-b096-1975bd3f9afc', 'd66f36b1-7192-4872-ae41-dbae574e58b1', 'A standard vernier caliper typically has a least count of 0.02 mm (or 0.1 mm for coarser instruments), achieved by the vernier scale principle, which allows readings finer than the main scale''s smallest division — micrometer screw gauges typically achieve even finer resolution (0.01 mm or better).', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2c17dec9-9e77-44ea-977c-e79e20b1723e', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 132, 'A micrometer screw gauge is generally used for measurements requiring:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('395a6dc2-2f47-471b-8230-e2a6945e90b6', '2c17dec9-9e77-44ea-977c-e79e20b1723e', 0, 'Lower precision than a vernier caliper');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4e41942-7919-41dc-ba6c-7e9c7c01c060', '2c17dec9-9e77-44ea-977c-e79e20b1723e', 1, 'Higher precision than a standard vernier caliper, typically down to 0.01 mm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b58ec63-12ff-4118-a84e-ecdcfeac984c', '2c17dec9-9e77-44ea-977c-e79e20b1723e', 2, 'Measurement of angles only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82d3ce30-faed-44b9-ad08-14f39f4af08f', '2c17dec9-9e77-44ea-977c-e79e20b1723e', 3, 'Measurement of temperature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2c17dec9-9e77-44ea-977c-e79e20b1723e', 'e4e41942-7919-41dc-ba6c-7e9c7c01c060', 'A micrometer screw gauge typically offers finer precision (commonly 0.01 mm least count) than a standard vernier caliper (0.02-0.1 mm), making it preferred for applications requiring higher-precision linear dimensional measurement.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('beecc9d9-0337-48ca-b76a-bc119cad676b', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 133, '''Tolerance'' in engineering drawings and manufacturing refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78b3f469-6cb8-4541-9dc0-fd6489c1b75b', 'beecc9d9-0337-48ca-b76a-bc119cad676b', 0, 'The exact nominal dimension of a part');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e311c868-2752-4caa-8919-d8af1da6821a', 'beecc9d9-0337-48ca-b76a-bc119cad676b', 1, 'The permissible variation (upper and lower limits) allowed in a dimension, to account for practical manufacturing variability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('780c66da-fd9e-456e-bbd8-5b510ab5feeb', 'beecc9d9-0337-48ca-b76a-bc119cad676b', 2, 'The material''s hardness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4efe40db-fb04-494f-8ade-7fa8624ef73c', 'beecc9d9-0337-48ca-b76a-bc119cad676b', 3, 'The surface roughness only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('beecc9d9-0337-48ca-b76a-bc119cad676b', 'e311c868-2752-4caa-8919-d8af1da6821a', 'Tolerance is the total permissible variation in a specified dimension (the difference between the upper and lower limit), accounting for the practical reality that no manufacturing process can produce a part at an exact, precise nominal dimension every single time.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b1e6b8fa-a1c7-4f9c-878f-b40e4a376986', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 134, 'In welding, ''heat-affected zone'' (HAZ) refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ef7daca-d01e-4d4f-b9af-72d067bb7842', 'b1e6b8fa-a1c7-4f9c-878f-b40e4a376986', 0, 'The molten weld pool itself');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('731b4736-797f-4e7b-87ad-b14778e0c84c', 'b1e6b8fa-a1c7-4f9c-878f-b40e4a376986', 1, 'The region of base metal, adjacent to the weld, whose microstructure and properties are altered by the heat of welding without actually melting');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bd9e9bd-e11e-49a7-894a-494250d9b3db', 'b1e6b8fa-a1c7-4f9c-878f-b40e4a376986', 2, 'The area far from the weld, completely unaffected');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a65a997-3b32-440d-82b0-f683b89324c0', 'b1e6b8fa-a1c7-4f9c-878f-b40e4a376986', 3, 'The filler material only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b1e6b8fa-a1c7-4f9c-878f-b40e4a376986', '731b4736-797f-4e7b-87ad-b14778e0c84c', 'The heat-affected zone (HAZ) is the region of base metal adjacent to the actual weld/fusion zone that experiences significant microstructural changes (grain growth, hardness changes, potential embrittlement) due to the welding heat, without actually reaching the melting point — a critical consideration for weld joint integrity, especially in heat-treated or hardenable steels.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('be709a48-da4d-484b-8697-58ec07929f98', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 135, 'The ''drilling'' operation in machining primarily produces:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b982d86-a55a-4fda-a4c5-77b96baf5309', 'be709a48-da4d-484b-8697-58ec07929f98', 0, 'Flat surfaces');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0e89899-965e-485c-b1d1-927dbd3f496c', 'be709a48-da4d-484b-8697-58ec07929f98', 1, 'Cylindrical holes in a workpiece');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3512ff8d-286c-4c13-ab0a-1701536819e5', 'be709a48-da4d-484b-8697-58ec07929f98', 2, 'External threads only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ccc87c36-eb7f-4a19-9a57-a1b85faef510', 'be709a48-da4d-484b-8697-58ec07929f98', 3, 'Sheet metal bending');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('be709a48-da4d-484b-8697-58ec07929f98', 'e0e89899-965e-485c-b1d1-927dbd3f496c', 'Drilling is a machining operation that uses a rotating drill bit to produce cylindrical holes in a workpiece, one of the most common and fundamental machining operations.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ece204c9-d0ad-406a-a93f-f141016593fd', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 136, '''Surface roughness'' (a metrology parameter, commonly measured as Ra) quantifies:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f45f1b93-9bc6-465d-a14e-199a6f0abf07', 'ece204c9-d0ad-406a-a93f-f141016593fd', 0, 'The overall shape/form error of a part');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac000027-36fc-4f92-8c4d-7108c25cb5de', 'ece204c9-d0ad-406a-a93f-f141016593fd', 1, 'The finer-scale irregularities (peaks and valleys) on a machined surface, relative to a mean line');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80058595-484f-41ab-9209-ae3267245e67', 'ece204c9-d0ad-406a-a93f-f141016593fd', 2, 'The part''s hardness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3e86e5d-f05b-4be1-97cc-031de4aca1dd', 'ece204c9-d0ad-406a-a93f-f141016593fd', 3, 'The part''s color');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ece204c9-d0ad-406a-a93f-f141016593fd', 'ac000027-36fc-4f92-8c4d-7108c25cb5de', 'Surface roughness (commonly quantified as Ra, the arithmetic average deviation) measures the finer-scale irregularities present on a machined surface, distinct from larger-scale form errors (like flatness or roundness) — critical for applications involving friction, sealing, fatigue life, and aesthetic finish.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d84e8368-151b-46f9-b9fd-27127fe906c3', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 137, 'In powder metallurgy, the process of compacting metal powder and then heating it below its melting point to bond the particles is called:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7921a069-021b-4744-8d1b-a0a02fb395ea', 'd84e8368-151b-46f9-b9fd-27127fe906c3', 0, 'Casting');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4eac953-0e85-4292-b661-1dbbdbfa707b', 'd84e8368-151b-46f9-b9fd-27127fe906c3', 1, 'Sintering');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8ef64eb-8650-429d-adde-fc782cb4da04', 'd84e8368-151b-46f9-b9fd-27127fe906c3', 2, 'Forging');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe48d309-2593-489f-9b85-aefc35eb301f', 'd84e8368-151b-46f9-b9fd-27127fe906c3', 3, 'Extrusion');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d84e8368-151b-46f9-b9fd-27127fe906c3', 'e4eac953-0e85-4292-b661-1dbbdbfa707b', 'Sintering is the process of heating compacted metal powder to a temperature below its melting point, causing the powder particles to bond together through solid-state diffusion, forming a coherent, strong solid part — a key step in powder metallurgy after initial compaction.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('90f3d7eb-c1a2-4562-8635-d5eb967350c4', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 138, 'Forging, as a manufacturing process, primarily shapes metal by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94e7ebb9-981d-42d7-a87a-27915b55ec77', '90f3d7eb-c1a2-4562-8635-d5eb967350c4', 0, 'Melting it completely and pouring it into a mold');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd00bee1-0feb-48c8-b462-61939cd10b80', '90f3d7eb-c1a2-4562-8635-d5eb967350c4', 1, 'Applying compressive force (typically while the metal is hot) to plastically deform it into a desired shape');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac7f26a1-2807-4dd8-845f-3d746bf42bbe', '90f3d7eb-c1a2-4562-8635-d5eb967350c4', 2, 'Chemical etching');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18788e1a-b3f7-424e-863c-ecc2561e8c01', '90f3d7eb-c1a2-4562-8635-d5eb967350c4', 3, 'Removing material via cutting tools');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('90f3d7eb-c1a2-4562-8635-d5eb967350c4', 'cd00bee1-0feb-48c8-b462-61939cd10b80', 'Forging shapes metal through the application of compressive force (via hammering or pressing), typically while the metal is heated to improve ductility, plastically deforming it into the desired shape — this process also generally improves the metal''s grain structure and mechanical strength compared to casting.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2cbaaa83-2143-43e3-a7b1-862b7072603c', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 139, '''Limits and fits'' in engineering design/manufacturing refer to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62045f77-31f0-4760-8218-f9d06179c72c', '2cbaaa83-2143-43e3-a7b1-862b7072603c', 0, 'A system defining the permissible size variation of mating parts to achieve a desired type of assembly (clearance, transition, or interference fit)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b2dd267-e923-4f3a-95b0-16042487a2be', '2cbaaa83-2143-43e3-a7b1-862b7072603c', 1, 'The maximum speed a machine can operate at');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('870ca070-736e-4d2c-96b3-a607cbb9d884', '2cbaaa83-2143-43e3-a7b1-862b7072603c', 2, 'A single fixed dimension with no variation allowed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5cb29cad-38ad-4588-b05e-a4a08c4d3413', '2cbaaa83-2143-43e3-a7b1-862b7072603c', 3, 'The color coding of different materials');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2cbaaa83-2143-43e3-a7b1-862b7072603c', '62045f77-31f0-4760-8218-f9d06179c72c', 'The ''limits and fits'' system defines standardized tolerance limits for mating parts (like a shaft and a hole) to achieve a desired assembly relationship — clearance fit (always some gap), interference fit (always some overlap, requiring force to assemble), or transition fit (could be either, depending on actual manufactured sizes within tolerance).', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('18ef3aa6-24a5-4981-b875-e4d8071334a3', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 140, 'Extrusion, as a manufacturing process, is well-suited for producing:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b8b056d-508d-4bcd-a41e-07f92bd4a1ea', '18ef3aa6-24a5-4981-b875-e4d8071334a3', 0, 'Complex 3D hollow shapes only, never solid shapes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f87928e-4ee1-426f-88ee-a4513a872dba', '18ef3aa6-24a5-4981-b875-e4d8071334a3', 1, 'Long, uniform-cross-section products (rods, tubes, structural profiles) by forcing material through a shaped die');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cda04354-b589-4663-b120-087409bae865', '18ef3aa6-24a5-4981-b875-e4d8071334a3', 2, 'Only sheet metal parts');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7fc207fd-1b26-4f95-b71f-295db911b61a', '18ef3aa6-24a5-4981-b875-e4d8071334a3', 3, 'Powder-based ceramic parts exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('18ef3aa6-24a5-4981-b875-e4d8071334a3', '7f87928e-4ee1-426f-88ee-a4513a872dba', 'Extrusion forces material (typically metal or polymer) through a shaped die to produce long products with a constant (uniform) cross-sectional profile — well-suited for rods, tubes, and complex structural profiles, in both solid and hollow cross-section forms.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7efd5a72-4515-426d-a260-8f72de1e66c4', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 141, 'Cast iron, compared to mild steel, generally has:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b19e18b9-7453-47b0-849b-e1cbfe9a5511', '7efd5a72-4515-426d-a260-8f72de1e66c4', 0, 'Higher ductility and lower carbon content');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2cebf2fa-e597-4d52-9092-3fe91bee737a', '7efd5a72-4515-426d-a260-8f72de1e66c4', 1, 'Lower ductility (more brittle) and higher carbon content');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5641166-413f-4400-b07d-5fb3cf8811aa', '7efd5a72-4515-426d-a260-8f72de1e66c4', 2, 'Identical mechanical properties');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('248484df-fcfa-4535-b129-00e0691d6a2d', '7efd5a72-4515-426d-a260-8f72de1e66c4', 3, 'No carbon content at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7efd5a72-4515-426d-a260-8f72de1e66c4', '2cebf2fa-e597-4d52-9092-3fe91bee737a', 'Cast iron has a significantly higher carbon content (typically 2-4%) than mild steel (typically <0.3%), resulting in lower ductility and greater brittleness, but also generally better castability, compressive strength, and wear resistance in many applications.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ccf1151f-e759-4ab0-9f9a-2909b5df621e', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 142, 'The process of ''annealing'' in heat treatment is primarily used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfb32b73-02b4-44b5-8658-d6e82f42670a', 'ccf1151f-e759-4ab0-9f9a-2909b5df621e', 0, 'Increase hardness to the maximum possible level');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2386852b-bba4-48ac-a55f-2bcc80f8f390', 'ccf1151f-e759-4ab0-9f9a-2909b5df621e', 1, 'Soften a metal, relieve internal stresses, and improve ductility/machinability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de0cb27c-f53e-4231-b0da-1af30df7f72f', 'ccf1151f-e759-4ab0-9f9a-2909b5df621e', 2, 'Coat the metal surface with another material');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cfa9957-85ac-45f8-82f6-20d8704ff670', 'ccf1151f-e759-4ab0-9f9a-2909b5df621e', 3, 'Reduce the metal''s melting point');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ccf1151f-e759-4ab0-9f9a-2909b5df621e', '2386852b-bba4-48ac-a55f-2bcc80f8f390', 'Annealing involves heating a metal to a specific temperature, holding it, and then slowly cooling it — primarily used to soften the material, relieve internal stresses (from prior cold working or casting), refine grain structure, and improve ductility and machinability.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('07a339ba-3228-4851-accc-bd28b71f6224', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 143, '''Quenching'' in heat treatment refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5115f00-caa3-4a53-8967-51067b243e45', '07a339ba-3228-4851-accc-bd28b71f6224', 0, 'Slow, controlled cooling of a heated metal in a furnace');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad344bb5-516f-4e90-b6ff-4cf0885354bc', '07a339ba-3228-4851-accc-bd28b71f6224', 1, 'Rapid cooling of a heated metal (typically in water, oil, or air), to achieve a harder microstructure (e.g., martensite in steel)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9bf57ab5-da8f-48c9-89c2-702cc04e721a', '07a339ba-3228-4851-accc-bd28b71f6224', 2, 'Heating a metal without any subsequent cooling');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f0118ff-0e11-4e19-8a8c-0b1c25a5ed72', '07a339ba-3228-4851-accc-bd28b71f6224', 3, 'A process used only for non-metallic materials');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('07a339ba-3228-4851-accc-bd28b71f6224', 'ad344bb5-516f-4e90-b6ff-4cf0885354bc', 'Quenching involves rapidly cooling a heated metal (commonly in water, oil, or forced air), suppressing the formation of softer equilibrium microstructures and instead promoting harder, often more brittle microstructures (like martensite in steel) — typically followed by tempering to reduce brittleness while retaining much of the hardness gained.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4dd2aa91-5c51-4c9b-b1e9-d47c57233325', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 144, '''Tempering'', typically performed after quenching, is used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0325c52b-4bf2-41ff-86db-7c2ac071b642', '4dd2aa91-5c51-4c9b-b1e9-d47c57233325', 0, 'Further increase hardness beyond the quenched state');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4372504a-ecee-47e1-9d6b-5280204d55c6', '4dd2aa91-5c51-4c9b-b1e9-d47c57233325', 1, 'Reduce brittleness and internal stresses introduced by quenching, while retaining much of the gained hardness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b146ff1-e436-462c-80f8-b4c44a31cc88', '4dd2aa91-5c51-4c9b-b1e9-d47c57233325', 2, 'Melt the material completely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('703036c9-0099-440c-a5f2-ce40ca9fdae7', '4dd2aa91-5c51-4c9b-b1e9-d47c57233325', 3, 'Remove all carbon from the material');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4dd2aa91-5c51-4c9b-b1e9-d47c57233325', '4372504a-ecee-47e1-9d6b-5280204d55c6', 'Tempering is a secondary heat treatment (heating to a moderate temperature, below the hardening temperature) performed after quenching to reduce the excessive brittleness and internal stresses introduced by rapid quenching, achieving a more practical balance of hardness and toughness.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3c6367ec-8968-42cc-af73-ee71c5c9e255', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 145, 'An ''alloy'' is best defined as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49804c62-f512-4867-8c3c-eb106e897665', '3c6367ec-8968-42cc-af73-ee71c5c9e255', 0, 'A pure metal with no impurities whatsoever');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92442349-b0ce-45da-b8fa-3f40c6952544', '3c6367ec-8968-42cc-af73-ee71c5c9e255', 1, 'A material composed of a metal combined with one or more other elements (metallic or non-metallic), to modify or improve its properties');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e578cf6-b5b0-4605-a980-44035b01490b', '3c6367ec-8968-42cc-af73-ee71c5c9e255', 2, 'Any non-metallic material');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b2a6c86-4d85-4a98-a2a3-6a4b9c2b6c2e', '3c6367ec-8968-42cc-af73-ee71c5c9e255', 3, 'A ceramic material only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3c6367ec-8968-42cc-af73-ee71c5c9e255', '92442349-b0ce-45da-b8fa-3f40c6952544', 'An alloy is a material formed by combining a base metal with one or more other elements (which can be metallic or non-metallic, like carbon in steel), deliberately altering its properties — such as strength, hardness, corrosion resistance, or melting point — compared to the pure base metal alone.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5224d7d5-3642-48ad-a70c-4805174e610e', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 146, 'Stainless steel''s corrosion resistance is primarily attributed to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76a46489-3a67-494d-a2a4-af200e02aab5', '5224d7d5-3642-48ad-a70c-4805174e610e', 0, 'Its high carbon content');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57e8e1a8-9a72-4e27-8018-52788992cc24', '5224d7d5-3642-48ad-a70c-4805174e610e', 1, 'A significant chromium content (typically at least ~10.5%), which forms a thin, self-healing passive oxide layer on the surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('52e07f2d-4a7c-493f-a28a-4fcbaca2b195', '5224d7d5-3642-48ad-a70c-4805174e610e', 2, 'Its magnetic properties');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce533ae3-b86d-494c-8a9e-f57eb9ddad56', '5224d7d5-3642-48ad-a70c-4805174e610e', 3, 'Being coated with paint');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5224d7d5-3642-48ad-a70c-4805174e610e', '57e8e1a8-9a72-4e27-8018-52788992cc24', 'Stainless steel''s corrosion resistance comes primarily from its significant chromium content (at least ~10.5% by standard definition), which forms a thin, adherent, self-healing chromium oxide passive layer on the surface, protecting the underlying metal from further oxidation/corrosion.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a6e9c498-fe1f-4111-a7ce-4e4d11bf3a13', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 147, 'A material''s ''toughness'' is best described as its ability to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d6a6bde-5f73-49cb-b3d6-9dbb4a913987', 'a6e9c498-fe1f-4111-a7ce-4e4d11bf3a13', 0, 'Resist scratching');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('379e96b2-97c4-4023-be50-223251d59766', 'a6e9c498-fe1f-4111-a7ce-4e4d11bf3a13', 1, 'Absorb energy and plastically deform without fracturing, up to the point of failure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e375d96-edf7-492b-a7da-da5b21f30bdd', 'a6e9c498-fe1f-4111-a7ce-4e4d11bf3a13', 2, 'Conduct electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e08de402-67b6-4691-a31f-399af9a41392', 'a6e9c498-fe1f-4111-a7ce-4e4d11bf3a13', 3, 'Resist corrosion');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a6e9c498-fe1f-4111-a7ce-4e4d11bf3a13', '379e96b2-97c4-4023-be50-223251d59766', 'Toughness describes a material''s ability to absorb energy (typically measured as the area under the stress-strain curve up to fracture) and undergo plastic deformation without fracturing — a tough material combines reasonable strength with good ductility, unlike a hard-but-brittle material that fractures with little energy absorption.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('452ab85e-e9a7-4f09-8e74-4bcda02f6e1c', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 148, 'Composite materials (like fiber-reinforced polymers) achieve their properties by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ba53a5b-79db-4d18-8886-e60b913de26d', '452ab85e-e9a7-4f09-8e74-4bcda02f6e1c', 0, 'Using a single homogeneous material only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbdb40a6-c513-4bcf-a9dd-63653c13cc9e', '452ab85e-e9a7-4f09-8e74-4bcda02f6e1c', 1, 'Combining two or more distinct materials (e.g., a reinforcing fiber and a matrix), so the combination has properties superior to the individual constituents alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('137e1959-0947-4343-b21e-e4380c9168c9', '452ab85e-e9a7-4f09-8e74-4bcda02f6e1c', 2, 'Melting two metals together to form an alloy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8e0a51b-dfaf-499f-807a-64e7e12dcaf1', '452ab85e-e9a7-4f09-8e74-4bcda02f6e1c', 3, 'Applying a surface coating only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('452ab85e-e9a7-4f09-8e74-4bcda02f6e1c', 'fbdb40a6-c513-4bcf-a9dd-63653c13cc9e', 'A composite material combines two or more distinct constituent materials (e.g., a strong, stiff reinforcing fiber like carbon or glass, embedded in a matrix material like a polymer resin) — the resulting combination achieves a favorable combination of properties (like high strength-to-weight ratio) not achievable by either constituent alone, distinguishing it from a true alloy (which is a homogeneous mixture at the atomic/molecular level).', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8dfe0fd2-b0dc-46d8-8e9a-9d28ab53c5e8', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 149, '''Creep'' in materials science refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83f68626-def0-41ca-b63a-9afed1ae8493', '8dfe0fd2-b0dc-46d8-8e9a-9d28ab53c5e8', 0, 'Sudden, instantaneous fracture under a single overload');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('acbea82f-eae5-4b93-8791-b2033b27ff8d', '8dfe0fd2-b0dc-46d8-8e9a-9d28ab53c5e8', 1, 'The slow, time-dependent plastic deformation of a material under a constant (sustained) stress, typically significant at elevated temperatures');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a663bc7-c978-4fe3-adbc-1f508b5c9b70', '8dfe0fd2-b0dc-46d8-8e9a-9d28ab53c5e8', 2, 'A material''s response to a single impact load');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a9e2273-ebc7-4b83-8812-ed8d9f722083', '8dfe0fd2-b0dc-46d8-8e9a-9d28ab53c5e8', 3, 'Corrosion of a metal surface');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8dfe0fd2-b0dc-46d8-8e9a-9d28ab53c5e8', 'acbea82f-eae5-4b93-8791-b2033b27ff8d', 'Creep is the gradual, time-dependent plastic deformation of a material under a constant sustained stress, becoming particularly significant at elevated temperatures (typically above about 0.4 times the material''s melting point on an absolute temperature scale) — a critical design consideration for high-temperature components like turbine blades and boiler tubing.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('49fe21b4-8b93-47c1-ac77-acc4bd05e908', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 150, 'Aluminum alloys, compared to steel, are generally chosen in engineering applications for their:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6bf9ba57-79cb-4243-ae08-d2a5e4dfacf4', '49fe21b4-8b93-47c1-ac77-acc4bd05e908', 0, 'Higher density and lower strength-to-weight ratio');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90a92098-5916-487a-bcf2-03d13db67018', '49fe21b4-8b93-47c1-ac77-acc4bd05e908', 1, 'Lower density and generally favorable strength-to-weight ratio, along with good corrosion resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b33b834f-e5ca-48bd-9e2c-47c5dde51e5e', '49fe21b4-8b93-47c1-ac77-acc4bd05e908', 2, 'Higher melting point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de181ec8-3ae9-4efd-998e-aa5614d1458d', '49fe21b4-8b93-47c1-ac77-acc4bd05e908', 3, 'Higher electrical resistance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('49fe21b4-8b93-47c1-ac77-acc4bd05e908', '90a92098-5916-487a-bcf2-03d13db67018', 'Aluminum alloys are widely chosen in weight-sensitive applications (aerospace, automotive) for their significantly lower density compared to steel, combined with a generally favorable strength-to-weight ratio and good inherent corrosion resistance (via a natural, protective oxide layer).', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3a938164-2a64-4103-b148-6ce3582f684d', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 151, 'In an internal combustion engine, the ''compression ratio'' is defined as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b50afc1-28fb-4509-9fca-5bdf3fedf7c8', '3a938164-2a64-4103-b148-6ce3582f684d', 0, 'The ratio of the engine''s power output to its weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1b76b16-6889-4d62-a98c-08fab0e5f547', '3a938164-2a64-4103-b148-6ce3582f684d', 1, 'The ratio of the total cylinder volume (at BDC) to the clearance volume (at TDC)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1bfcc6f-23b4-46c3-8b34-965fd5a96ce7', '3a938164-2a64-4103-b148-6ce3582f684d', 2, 'The ratio of fuel to air in the mixture');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('668c14b0-d396-4c02-9232-30445512e18a', '3a938164-2a64-4103-b148-6ce3582f684d', 3, 'The ratio of the engine''s RPM to its torque');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3a938164-2a64-4103-b148-6ce3582f684d', 'a1b76b16-6889-4d62-a98c-08fab0e5f547', 'Compression ratio is defined as the ratio of the total cylinder volume when the piston is at bottom dead center (BDC) to the clearance volume when the piston is at top dead center (TDC) — a higher compression ratio generally improves thermal efficiency, though it is limited by considerations like knocking in spark-ignition engines.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bf5e964c-0808-40a7-aa28-1da60a61df1d', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 152, 'The four strokes of a four-stroke IC engine, in order, are:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b77e845c-55f0-4d68-a878-52c1b84f54e3', 'bf5e964c-0808-40a7-aa28-1da60a61df1d', 0, 'Power, Compression, Intake, Exhaust');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b5053a5-a636-4f97-ae00-81c55bf9f17b', 'bf5e964c-0808-40a7-aa28-1da60a61df1d', 1, 'Intake, Compression, Power (Expansion), Exhaust');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82b80e98-6b14-443b-bdd0-fd2d21dfdcca', 'bf5e964c-0808-40a7-aa28-1da60a61df1d', 2, 'Exhaust, Intake, Power, Compression');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58851f09-2522-408d-aef3-5156667618cb', 'bf5e964c-0808-40a7-aa28-1da60a61df1d', 3, 'Compression, Intake, Exhaust, Power');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bf5e964c-0808-40a7-aa28-1da60a61df1d', '5b5053a5-a636-4f97-ae00-81c55bf9f17b', 'The four strokes of a standard four-stroke IC engine cycle, in order, are: Intake (fuel-air mixture or air drawn in), Compression (mixture compressed), Power/Expansion (ignition and combustion drive the piston down), and Exhaust (burnt gases expelled).', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5a432392-6b2f-41ea-8751-691fc2348c3f', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 153, '''Knocking'' in a spark-ignition (petrol) engine refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('573aec9d-d468-450e-86df-540e9283bcda', '5a432392-6b2f-41ea-8751-691fc2348c3f', 0, 'Normal, controlled combustion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96aff419-31a0-41c0-88b0-9da668afbd7d', '5a432392-6b2f-41ea-8751-691fc2348c3f', 1, 'Uncontrolled, premature auto-ignition of the end-gas (unburnt fuel-air mixture) ahead of the advancing flame front, causing pressure spikes and a characteristic knocking sound');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69dcd6a7-0873-4831-9c24-b864e0bd7b1f', '5a432392-6b2f-41ea-8751-691fc2348c3f', 2, 'The sound of the starter motor engaging');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58fcb6cf-2b2c-4078-9e0b-1967e21d59a2', '5a432392-6b2f-41ea-8751-691fc2348c3f', 3, 'A cooling system malfunction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5a432392-6b2f-41ea-8751-691fc2348c3f', '96aff419-31a0-41c0-88b0-9da668afbd7d', 'Knocking (detonation) occurs when the unburnt end-gas ahead of the normal flame front spontaneously auto-ignites due to excessive pressure/temperature, rather than being consumed progressively by the advancing flame — this causes rapid, uncontrolled pressure rise, engine damage risk, and the characteristic knocking sound, and is mitigated by fuel octane rating, ignition timing, and compression ratio limits.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ea464662-ff47-42b7-97d8-a6ae946094e0', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 154, 'Which type of IC engine typically has a higher thermal efficiency: petrol (SI) or diesel (CI)?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13e5d3f4-f536-409d-9922-e6cbec0808ca', 'ea464662-ff47-42b7-97d8-a6ae946094e0', 0, 'Petrol (SI) engines, always');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66caeb12-d85e-4e8a-8cb4-0f0d76dd856a', 'ea464662-ff47-42b7-97d8-a6ae946094e0', 1, 'Diesel (CI) engines, generally, due to their higher compression ratios');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d70ed7b-1f61-4292-82a4-c0254a16a10a', 'ea464662-ff47-42b7-97d8-a6ae946094e0', 2, 'Both have identical thermal efficiency always');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7c4d8a3-e908-4798-8334-62f41806e1a8', 'ea464662-ff47-42b7-97d8-a6ae946094e0', 3, 'Neither has any meaningful thermal efficiency');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ea464662-ff47-42b7-97d8-a6ae946094e0', '66caeb12-d85e-4e8a-8cb4-0f0d76dd856a', 'Diesel (compression-ignition) engines generally achieve higher thermal efficiency than petrol (spark-ignition) engines, largely because they operate at significantly higher compression ratios (not limited by knock in the same way, since only air — not the fuel-air mixture — is compressed) and typically run leaner.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('66779257-4042-40e7-8c74-68eb0a03d4d3', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 155, '''Just-In-Time'' (JIT) is a production/inventory management philosophy primarily aimed at:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ffbd782-1e8e-49f2-b262-0bc3a321e224', '66779257-4042-40e7-8c74-68eb0a03d4d3', 0, 'Maximizing inventory stockpiles to avoid any shortage risk');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a965000f-8354-4daa-9ed1-bad35f6098bc', '66779257-4042-40e7-8c74-68eb0a03d4d3', 1, 'Minimizing inventory by receiving/producing goods only as they are needed in the production process, reducing waste and holding costs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b6ff883-9fb8-4c1c-b705-53c2d780f276', '66779257-4042-40e7-8c74-68eb0a03d4d3', 2, 'Producing goods far ahead of demand');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d4d95a4-d275-4f67-8fd8-b96377b0d480', '66779257-4042-40e7-8c74-68eb0a03d4d3', 3, 'Eliminating quality control checks');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('66779257-4042-40e7-8c74-68eb0a03d4d3', 'a965000f-8354-4daa-9ed1-bad35f6098bc', 'Just-In-Time (JIT) is a production philosophy (pioneered notably by Toyota) aimed at minimizing inventory holding by receiving materials and producing goods only as needed in the immediate production process, reducing waste, storage costs, and capital tied up in excess inventory.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3d73aa63-005a-4293-af81-bb78396218a4', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 156, 'In production planning, ''PERT'' (Program Evaluation and Review Technique) is primarily used for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b2b61a7-9cf3-464a-9f4b-8fca0166b859', '3d73aa63-005a-4293-af81-bb78396218a4', 0, 'Quality control of finished products');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13a012b1-d960-4dad-ac17-a071f1a6ad21', '3d73aa63-005a-4293-af81-bb78396218a4', 1, 'Project scheduling and management, particularly for projects with uncertain/variable activity durations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed86dba3-39c0-4835-8cc2-9f3a5bb04649', '3d73aa63-005a-4293-af81-bb78396218a4', 2, 'Inventory valuation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89d0b382-f6a3-4d2f-bd65-c8de39edf621', '3d73aa63-005a-4293-af81-bb78396218a4', 3, 'Payroll management');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3d73aa63-005a-4293-af81-bb78396218a4', '13a012b1-d960-4dad-ac17-a071f1a6ad21', 'PERT is a project management technique used for scheduling, organizing, and coordinating tasks within a project, particularly well-suited to projects where activity durations are uncertain or variable (using probabilistic time estimates), unlike CPM (Critical Path Method), which is typically used with deterministic activity durations.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fb03bba4-af54-4a07-b9d6-ec454fe604a9', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 157, '''Total Quality Management'' (TQM) is a management approach focused on:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b4e848d-0157-44b4-ae7e-cd60f7962fd2', 'fb03bba4-af54-4a07-b9d6-ec454fe604a9', 0, 'Quality control performed only at the final inspection stage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('261821ea-601f-480b-ba34-680a66877ed5', 'fb03bba4-af54-4a07-b9d6-ec454fe604a9', 1, 'Continuous improvement and quality as a shared responsibility across every function and level of an organization, not just a final inspection step');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a552ed8-e6a6-4790-bcf7-37af713d3159', 'fb03bba4-af54-4a07-b9d6-ec454fe604a9', 2, 'Reducing product variety to a single standard item');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a8cd703-56a0-4238-a082-de96c6cbffe0', 'fb03bba4-af54-4a07-b9d6-ec454fe604a9', 3, 'Maximizing production speed regardless of defect rates');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fb03bba4-af54-4a07-b9d6-ec454fe604a9', '261821ea-601f-480b-ba34-680a66877ed5', 'TQM is a holistic management philosophy emphasizing continuous improvement and treating quality as an organization-wide responsibility integrated into every process and function, rather than something checked only at a final inspection stage after production is complete.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('165ee966-941b-4235-a378-82a0f2e354bf', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 158, 'A ''break-even point'' in production/cost analysis is the point at which:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('564e0bd8-863b-4f0c-bac1-335e950a9bb5', '165ee966-941b-4235-a378-82a0f2e354bf', 0, 'Total revenue equals total cost (no profit, no loss)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30f03b1c-7064-4811-81f3-69df6336e1ea', '165ee966-941b-4235-a378-82a0f2e354bf', 1, 'Profit is always maximized');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e91c7f2f-a889-4bf3-b80b-9f8d5984b8a0', '165ee966-941b-4235-a378-82a0f2e354bf', 2, 'Fixed costs become zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb587f7f-1d7b-4420-9a7d-c62fa527d895', '165ee966-941b-4235-a378-82a0f2e354bf', 3, 'Variable costs exceed fixed costs');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('165ee966-941b-4235-a378-82a0f2e354bf', '564e0bd8-863b-4f0c-bac1-335e950a9bb5', 'The break-even point is the production/sales volume at which total revenue exactly equals total cost (fixed plus variable costs) — below this point the operation runs at a loss, and above it, a profit.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('243b4f61-26ba-432b-bc51-057cc5f15dfe', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 159, '''Ergonomics'' in industrial engineering primarily focuses on:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('552da129-c9f3-400e-9fae-ceecfb369775', '243b4f61-26ba-432b-bc51-057cc5f15dfe', 0, 'Machine speed optimization only, with no regard for the operator');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('080c623a-bef7-431e-9390-524d4a520880', '243b4f61-26ba-432b-bc51-057cc5f15dfe', 1, 'Designing workplaces, tools, and tasks to fit the physical and cognitive capabilities of the human operator, improving safety, comfort, and efficiency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da2bdd39-49a6-4b1e-9381-efe49fb0bb49', '243b4f61-26ba-432b-bc51-057cc5f15dfe', 2, 'Reducing the number of workers in a facility');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41ba11d1-b9b3-45fe-adfc-fa3a41b987a9', '243b4f61-26ba-432b-bc51-057cc5f15dfe', 3, 'Automating all processes to eliminate human involvement entirely');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('243b4f61-26ba-432b-bc51-057cc5f15dfe', '080c623a-bef7-431e-9390-524d4a520880', 'Ergonomics (human factors engineering) focuses on designing workplaces, equipment, and tasks to match the physical and cognitive capabilities and limitations of human operators, aiming to improve safety, reduce fatigue/injury risk, and enhance overall productivity and comfort.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('79cb1ed2-1764-409d-966b-dfbf3e8878eb', 'e4041688-7f93-48f0-a3e5-ec4342ea38b8', 160, 'The specific fuel consumption (SFC) of an IC engine is a measure of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f00f5f59-e020-4488-aaa6-6297b626565b', '79cb1ed2-1764-409d-966b-dfbf3e8878eb', 0, 'Total fuel used over the engine''s entire lifetime');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b890acd1-c45a-4937-a6ef-0db2c9521ab8', '79cb1ed2-1764-409d-966b-dfbf3e8878eb', 1, 'The amount of fuel consumed per unit of power output per unit time (a measure of engine efficiency)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b99f735-e293-41c0-8e92-da5699a9fbde', '79cb1ed2-1764-409d-966b-dfbf3e8878eb', 2, 'The fuel tank''s capacity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb69ee11-f30e-42f7-9c46-57154a9412c1', '79cb1ed2-1764-409d-966b-dfbf3e8878eb', 3, 'The engine''s exhaust temperature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('79cb1ed2-1764-409d-966b-dfbf3e8878eb', 'b890acd1-c45a-4937-a6ef-0db2c9521ab8', 'Specific fuel consumption (SFC) measures the amount of fuel consumed per unit of power output per unit time (e.g., grams per kilowatt-hour) — a lower SFC indicates better fuel efficiency for a given power output, making it a standard metric for comparing engine efficiency.', 'Discipline (Mechanical Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');
