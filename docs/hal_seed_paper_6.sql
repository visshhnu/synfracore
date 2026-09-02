-- ============================================================
-- HAL Design/Management Trainee -- Civil Engineering
-- Full-Length Mock Paper 6 (160 questions, 150 minutes)
-- 
-- SOURCE: informally shared study material (not an official/proprietary HAL
-- archive). Honest per-question source note via question_answers.source_note
-- (already rendered in the results-review UI) -- see each section below.
-- Run this AFTER docs/question-bank-schema.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes)
VALUES ('553374b4-6da1-4a64-81a1-93a717660412', 'hal-civil-practice-1', 'HAL DT/MT — Civil Engineering — Full Mock Paper 1', 'hal-trainee', ARRAY['HAL', 'Civil Engineering', 'Structural Engineering', 'General Awareness', 'Reasoning', 'English']::TEXT[], 160, 'standard', true, 6, 150);

-- ── Section: General Awareness (20 questions) — General Awareness — written to match HAL's real GA scope, not taken from an official HAL paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('79da0bb8-4411-40ac-8f14-110da4feafd7', '553374b4-6da1-4a64-81a1-93a717660412', 1, 'HAL''s Civil/Infrastructure engineering functions primarily support:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c19347e-28d4-44da-9d24-52c0adf3105c', '79da0bb8-4411-40ac-8f14-110da4feafd7', 0, 'Airline ticketing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8680cc12-78af-4a5a-bcf8-2eaa416e1947', '79da0bb8-4411-40ac-8f14-110da4feafd7', 1, 'The construction and maintenance of HAL''s own manufacturing facilities, runways, hangars, and associated infrastructure across its divisions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('682bd698-8087-4657-b808-3bbf47a800b1', '79da0bb8-4411-40ac-8f14-110da4feafd7', 2, 'Only residential housing projects unrelated to HAL''s operations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b4d420c-52c2-49f7-b723-a52afcfffa5c', '79da0bb8-4411-40ac-8f14-110da4feafd7', 3, 'Foreign government infrastructure contracts exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('79da0bb8-4411-40ac-8f14-110da4feafd7', '8680cc12-78af-4a5a-bcf8-2eaa416e1947', 'Like most large industrial organisations operating multiple manufacturing divisions, HAL''s civil/infrastructure engineering functions primarily support the construction, maintenance, and expansion of its own facilities — factories, runways, hangars, and testing infrastructure — across its various divisions.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9426d1c2-83c5-4f0b-9836-9786389e1ce7', '553374b4-6da1-4a64-81a1-93a717660412', 2, 'India''s largest dam by reservoir capacity is generally considered to be:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1d057c2-d97a-44d4-8526-f4aa1cb49d2d', '9426d1c2-83c5-4f0b-9836-9786389e1ce7', 0, 'Bhakra Dam');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a50de49-4441-4415-aebf-9c116f1c3d29', '9426d1c2-83c5-4f0b-9836-9786389e1ce7', 1, 'Indira Sagar Dam');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0737859a-df91-4bee-b5ca-0786a07c678c', '9426d1c2-83c5-4f0b-9836-9786389e1ce7', 2, 'Tehri Dam');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07885ffb-ebf3-445d-8884-ceeefa89c0c8', '9426d1c2-83c5-4f0b-9836-9786389e1ce7', 3, 'Sardar Sarovar Dam');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9426d1c2-83c5-4f0b-9836-9786389e1ce7', '9a50de49-4441-4415-aebf-9c116f1c3d29', 'The Indira Sagar Dam, on the Narmada River in Madhya Pradesh, is generally considered India''s largest dam by reservoir capacity, though rankings can vary depending on the specific metric used. `(needs verification — recheck current rankings against an authoritative source, since dam capacity comparisons are sometimes measured differently)`', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bed3d5d7-33fa-4639-af0d-74d470a3ae1f', '553374b4-6da1-4a64-81a1-93a717660412', 3, 'The ''Bhakra Nangal'' project, a major early Indian dam and irrigation project, is located on which river?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('548ff885-3428-411b-9b0d-8ef17e71eb8e', 'bed3d5d7-33fa-4639-af0d-74d470a3ae1f', 0, 'Ganga');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0fc86b68-9e6d-4b4c-9e39-29992e1b3bd0', 'bed3d5d7-33fa-4639-af0d-74d470a3ae1f', 1, 'Sutlej');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5092a80-2a87-4dfc-add1-6df935a6343e', 'bed3d5d7-33fa-4639-af0d-74d470a3ae1f', 2, 'Yamuna');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5ea6e2e-bc1d-44e8-b990-4e5409381d4b', 'bed3d5d7-33fa-4639-af0d-74d470a3ae1f', 3, 'Krishna');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bed3d5d7-33fa-4639-af0d-74d470a3ae1f', '0fc86b68-9e6d-4b4c-9e39-29992e1b3bd0', 'The Bhakra Nangal project is built on the Sutlej River, spanning Himachal Pradesh and Punjab, and was one of independent India''s earliest major multipurpose river valley projects.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('96947b62-1ccc-4d1e-814d-1251c6b0444d', '553374b4-6da1-4a64-81a1-93a717660412', 4, 'The Central Public Works Department (CPWD) is primarily responsible for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88993739-9328-4961-8ef6-c9fe74801250', '96947b62-1ccc-4d1e-814d-1251c6b0444d', 0, 'Regulating stock markets');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5a1c0b1-866c-4a86-80ae-ea1c93e61e24', '96947b62-1ccc-4d1e-814d-1251c6b0444d', 1, 'Construction and maintenance of central government buildings and infrastructure across India');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b46dbd22-f861-4429-925f-79ac901c56ea', '96947b62-1ccc-4d1e-814d-1251c6b0444d', 2, 'Managing India''s space programme');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2573e69-0e8c-4012-a8d8-5aa9276476a6', '96947b62-1ccc-4d1e-814d-1251c6b0444d', 3, 'Issuing passports');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('96947b62-1ccc-4d1e-814d-1251c6b0444d', 'f5a1c0b1-866c-4a86-80ae-ea1c93e61e24', 'CPWD, under the Ministry of Housing and Urban Affairs, is India''s premier central government agency responsible for constructing and maintaining government buildings, roads, and related infrastructure.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('da61cf4b-23a9-4818-a1f8-6bce2411d3e0', '553374b4-6da1-4a64-81a1-93a717660412', 5, 'The ''Pradhan Mantri Awas Yojana'' (PMAY), a major Indian government housing scheme, primarily aims to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad416ef3-c9e0-4d32-a6f1-aee6ca85e8a3', 'da61cf4b-23a9-4818-a1f8-6bce2411d3e0', 0, 'Provide affordable housing for economically weaker sections and urban/rural poor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af356736-93e2-418a-b931-2558b152061f', 'da61cf4b-23a9-4818-a1f8-6bce2411d3e0', 1, 'Fund only luxury housing developments');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0012ddc-6e65-49d0-a20b-78df895c89cf', 'da61cf4b-23a9-4818-a1f8-6bce2411d3e0', 2, 'Regulate the stock market');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('673b52ed-3b58-4492-8e7b-b020752de2fe', 'da61cf4b-23a9-4818-a1f8-6bce2411d3e0', 3, 'Build only commercial office space');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('da61cf4b-23a9-4818-a1f8-6bce2411d3e0', 'ad416ef3-c9e0-4d32-a6f1-aee6ca85e8a3', 'PMAY is a Government of India scheme launched in 2015 aiming to provide affordable, pucca housing to economically weaker sections and low-income groups in both urban and rural areas.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e2f46a77-f146-46fa-b93c-a6c01c69dc04', '553374b4-6da1-4a64-81a1-93a717660412', 6, 'The National Highways Authority of India (NHAI) is primarily responsible for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a83d7f2f-9bd2-4bf6-a3de-e405c215e1d4', 'e2f46a77-f146-46fa-b93c-a6c01c69dc04', 0, 'Railway track construction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e41e7c7b-1e38-4a34-b854-20b4ea6cf541', 'e2f46a77-f146-46fa-b93c-a6c01c69dc04', 1, 'Development, maintenance, and management of the National Highways network in India');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ded1290-9d88-4acc-b7e6-c0a179e4a86a', 'e2f46a77-f146-46fa-b93c-a6c01c69dc04', 2, 'Airport construction exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d08a572b-e006-4c2a-8a3e-afb2efa00141', 'e2f46a77-f146-46fa-b93c-a6c01c69dc04', 3, 'Urban metro rail systems');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e2f46a77-f146-46fa-b93c-a6c01c69dc04', 'e41e7c7b-1e38-4a34-b854-20b4ea6cf541', 'NHAI, under the Ministry of Road Transport and Highways, is responsible for the development, maintenance, and management of India''s National Highways network — a critical component of the country''s road infrastructure.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a2f68b0f-114d-48b4-ac35-7a5ba117a895', '553374b4-6da1-4a64-81a1-93a717660412', 7, 'The ''Smart Cities Mission'', an Indian government urban development initiative, primarily aims to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b0289b4-dddf-4791-92b8-7883577f3872', 'a2f68b0f-114d-48b4-ac35-7a5ba117a895', 0, 'Discourage urbanization entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e733d7ed-451e-4592-a4bf-c196c0144788', 'a2f68b0f-114d-48b4-ac35-7a5ba117a895', 1, 'Develop selected cities with improved infrastructure, sustainable environment, and enhanced quality of life through technology-driven solutions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0fddaec-4bfe-41de-b7e5-c0d056f519a2', 'a2f68b0f-114d-48b4-ac35-7a5ba117a895', 2, 'Focus exclusively on rural road construction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c57e87ce-a07b-4587-b56a-9109e56cd91d', 'a2f68b0f-114d-48b4-ac35-7a5ba117a895', 3, 'Ban private vehicle ownership');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a2f68b0f-114d-48b4-ac35-7a5ba117a895', 'e733d7ed-451e-4592-a4bf-c196c0144788', 'The Smart Cities Mission, launched in 2015, aims to develop selected cities with improved core infrastructure, a sustainable and clean environment, and enhanced quality of life through technology-enabled, citizen-friendly solutions.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8e6edb69-2e31-4acb-826e-651c12adad7f', '553374b4-6da1-4a64-81a1-93a717660412', 8, 'The ''Statue of Unity'', the world''s tallest statue, required significant civil engineering work and is located in which Indian state?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('817e25d6-5a18-4175-b963-e153f892a25c', '8e6edb69-2e31-4acb-826e-651c12adad7f', 0, 'Madhya Pradesh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb97a44a-64ef-4a1f-b81a-d87828470e6d', '8e6edb69-2e31-4acb-826e-651c12adad7f', 1, 'Gujarat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f7bae3e-1337-4dc9-a278-f40e8e589272', '8e6edb69-2e31-4acb-826e-651c12adad7f', 2, 'Rajasthan');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04ca97c7-5041-4336-be26-9065c23ad5a2', '8e6edb69-2e31-4acb-826e-651c12adad7f', 3, 'Maharashtra');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8e6edb69-2e31-4acb-826e-651c12adad7f', 'eb97a44a-64ef-4a1f-b81a-d87828470e6d', 'The Statue of Unity, dedicated to Sardar Vallabhbhai Patel, is located in Gujarat, near the Sardar Sarovar Dam on the Narmada River, and required substantial civil and structural engineering work for its foundation and construction.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d4093c68-e6df-4e45-85b1-1c350bfc23f8', '553374b4-6da1-4a64-81a1-93a717660412', 9, 'India''s longest river bridge (a major civil engineering achievement) is the Bhupen Hazarika Setu, built across which river?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cca6bb8a-a562-46c8-8f9b-327235cfe789', 'd4093c68-e6df-4e45-85b1-1c350bfc23f8', 0, 'Ganga');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e653c05d-04d8-433b-a6f5-cd4c8b963c2c', 'd4093c68-e6df-4e45-85b1-1c350bfc23f8', 1, 'Brahmaputra (specifically its Lohit tributary)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3992fc65-e56a-4ae8-af72-491af6967b2b', 'd4093c68-e6df-4e45-85b1-1c350bfc23f8', 2, 'Godavari');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66d069e9-0d39-4599-a866-92b81cc93b92', 'd4093c68-e6df-4e45-85b1-1c350bfc23f8', 3, 'Narmada');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d4093c68-e6df-4e45-85b1-1c350bfc23f8', 'e653c05d-04d8-433b-a6f5-cd4c8b963c2c', 'The Bhupen Hazarika Setu, connecting Assam and Arunachal Pradesh, spans the Lohit tributary of the Brahmaputra River and was, at the time of its completion, India''s longest river bridge.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2a77ea82-9e4a-426a-a4f9-3569fe1ae311', '553374b4-6da1-4a64-81a1-93a717660412', 10, 'The Bureau of Indian Standards (BIS) code that primarily governs the design of reinforced concrete structures in India is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfada7f6-57f0-49d2-a6b8-0d943e2a9630', '2a77ea82-9e4a-426a-a4f9-3569fe1ae311', 0, 'IS 456');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b55b8a9c-3692-43f6-8409-dbe14856f837', '2a77ea82-9e4a-426a-a4f9-3569fe1ae311', 1, 'IS 800');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4bac857d-ebf6-42ec-a09e-5e4a6fddbae6', '2a77ea82-9e4a-426a-a4f9-3569fe1ae311', 2, 'IS 1200');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('387a6386-5bc2-4b56-a90c-7d568b056e50', '2a77ea82-9e4a-426a-a4f9-3569fe1ae311', 3, 'IS 2062');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2a77ea82-9e4a-426a-a4f9-3569fe1ae311', 'dfada7f6-57f0-49d2-a6b8-0d943e2a9630', 'IS 456 is the primary Indian Standard code of practice governing the design and construction of plain and reinforced concrete structures; IS 800 governs steel structure design, another commonly referenced but distinct code.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a070b4d4-51ce-4852-9da8-d5ca5968bf66', '553374b4-6da1-4a64-81a1-93a717660412', 11, 'The Delhi Metro, one of India''s largest urban infrastructure projects, is operated by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b230e10-3df2-424b-82ac-47b7afe3d3b3', 'a070b4d4-51ce-4852-9da8-d5ca5968bf66', 0, 'Indian Railways directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00388b77-7317-4b01-a050-5de6bf6974fb', 'a070b4d4-51ce-4852-9da8-d5ca5968bf66', 1, 'Delhi Metro Rail Corporation (DMRC)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('11b10693-6474-4f66-8276-58b41eab8543', 'a070b4d4-51ce-4852-9da8-d5ca5968bf66', 2, 'National Highways Authority of India');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('015a766a-7b9d-4e62-b38d-b3e1e38c4bc3', 'a070b4d4-51ce-4852-9da8-d5ca5968bf66', 3, 'Airports Authority of India');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a070b4d4-51ce-4852-9da8-d5ca5968bf66', '00388b77-7317-4b01-a050-5de6bf6974fb', 'The Delhi Metro is planned, constructed, and operated by the Delhi Metro Rail Corporation (DMRC), a joint venture between the Government of India and the Government of the National Capital Territory of Delhi.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('70457cb5-325c-40d0-a834-b8f5280c5bb8', '553374b4-6da1-4a64-81a1-93a717660412', 12, '''Atal Setu'' (Mumbai Trans Harbour Link), one of India''s longest sea bridges, connects Mumbai to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba64e868-1253-4b45-852f-ab7a5a53273b', '70457cb5-325c-40d0-a834-b8f5280c5bb8', 0, 'Pune');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc73516e-71e8-4273-8797-cf24bc07ae73', '70457cb5-325c-40d0-a834-b8f5280c5bb8', 1, 'Navi Mumbai');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8b049ea-2c34-4db1-b36a-9a929259cb66', '70457cb5-325c-40d0-a834-b8f5280c5bb8', 2, 'Surat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d4e511c-996b-43b9-b540-7ad29a25d50f', '70457cb5-325c-40d0-a834-b8f5280c5bb8', 3, 'Goa');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('70457cb5-325c-40d0-a834-b8f5280c5bb8', 'cc73516e-71e8-4273-8797-cf24bc07ae73', 'Atal Setu, India''s longest sea bridge, connects Mumbai to Navi Mumbai across Mumbai Harbour, significantly reducing travel time between the two areas.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('53ac700b-3e56-4945-b885-3aa2430d9e8b', '553374b4-6da1-4a64-81a1-93a717660412', 13, 'The ''Jal Jeevan Mission'', an Indian government initiative, primarily aims to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6acc73a0-9b18-42a3-9072-f9704703cea7', '53ac700b-3e56-4945-b885-3aa2430d9e8b', 0, 'Provide functional household tap water connections to every rural household');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba26120f-50b4-4389-8acd-116c2d938576', '53ac700b-3e56-4945-b885-3aa2430d9e8b', 1, 'Build new dams exclusively for hydroelectric power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('feb9bde6-f0b8-48b3-8610-818db7d51a6a', '53ac700b-3e56-4945-b885-3aa2430d9e8b', 2, 'Regulate ocean shipping traffic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09b0a4e4-680c-4f48-bdb6-ee858d773c11', '53ac700b-3e56-4945-b885-3aa2430d9e8b', 3, 'Construct new airports');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('53ac700b-3e56-4945-b885-3aa2430d9e8b', '6acc73a0-9b18-42a3-9072-f9704703cea7', 'The Jal Jeevan Mission, launched in 2019, aims to provide safe and adequate drinking water through functional household tap connections to every rural household in India.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4b2859f9-860b-4af4-9a45-be959c83b512', '553374b4-6da1-4a64-81a1-93a717660412', 14, '''FSI'' (Floor Space Index), a term commonly used in urban planning and building regulations, refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f0d7965-d7df-4ec8-b4d1-f7cfede3a306', '4b2859f9-860b-4af4-9a45-be959c83b512', 0, 'The fire safety index of a building material');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3bdbc481-0874-42d7-828b-b8b6a4957452', '4b2859f9-860b-4af4-9a45-be959c83b512', 1, 'The ratio of a building''s total floor area to the area of the plot on which it stands');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ce3607d-259c-43cc-87f8-52684a760bb2', '4b2859f9-860b-4af4-9a45-be959c83b512', 2, 'The number of floors a building has, regardless of area');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb036c7f-c5f6-4922-80d4-92998ecb6253', '4b2859f9-860b-4af4-9a45-be959c83b512', 3, 'The structural load capacity of a floor');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4b2859f9-860b-4af4-9a45-be959c83b512', '3bdbc481-0874-42d7-828b-b8b6a4957452', 'FSI (also called Floor Area Ratio, FAR, in some regions) is the ratio of a building''s total constructed floor area to the area of the underlying plot of land — a key parameter in urban planning regulations, directly controlling permissible building density and height.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('41b2553f-5cd9-42c9-8a02-4440efdc8f59', '553374b4-6da1-4a64-81a1-93a717660412', 15, 'The ''Namami Gange'' programme is an Indian government initiative focused on:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a86d6fe-91bc-4e95-8594-ea77acc90f29', '41b2553f-5cd9-42c9-8a02-4440efdc8f59', 0, 'Highway construction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0e9449b-5e55-4e0b-9c25-462bcebed3fb', '41b2553f-5cd9-42c9-8a02-4440efdc8f59', 1, 'Conservation and rejuvenation of the Ganga river, including pollution abatement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b97eb8d-83a9-4a75-b251-3dbd782e8205', '41b2553f-5cd9-42c9-8a02-4440efdc8f59', 2, 'Space exploration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5d50f57-368d-4636-912b-c06d9c7cbc90', '41b2553f-5cd9-42c9-8a02-4440efdc8f59', 3, 'Defence procurement');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('41b2553f-5cd9-42c9-8a02-4440efdc8f59', 'f0e9449b-5e55-4e0b-9c25-462bcebed3fb', 'Namami Gange is an integrated conservation mission approved in 2014, aimed at the effective abatement of pollution and the conservation and rejuvenation of the Ganga River.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1c8830c1-dd77-48b7-a797-0305e6d89b5f', '553374b4-6da1-4a64-81a1-93a717660412', 16, 'India''s tallest building (as of recent construction milestones) is generally recognised as being located in:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a96a67f-3fbb-437a-9365-b5dd19a08da7', '1c8830c1-dd77-48b7-a797-0305e6d89b5f', 0, 'Mumbai (e.g., structures like the Palais Royale or World One)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e679ef6-f516-4751-b23d-a7ec9a0a51b9', '1c8830c1-dd77-48b7-a797-0305e6d89b5f', 1, 'Delhi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('458ce420-20e8-4dac-b662-fe191d1bb7df', '1c8830c1-dd77-48b7-a797-0305e6d89b5f', 2, 'Bengaluru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ea70680-515f-4e27-a2ad-d4d7d7b34aab', '1c8830c1-dd77-48b7-a797-0305e6d89b5f', 3, 'Chennai');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1c8830c1-dd77-48b7-a797-0305e6d89b5f', '2a96a67f-3fbb-437a-9365-b5dd19a08da7', 'India''s tallest completed skyscrapers are generally concentrated in Mumbai, reflecting the city''s high land value and dense high-rise development. `(needs verification — recheck the current tallest-building ranking against an authoritative source, since new construction can change this ranking over time)`', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('065493f9-7258-4571-8a49-32ab288edd75', '553374b4-6da1-4a64-81a1-93a717660412', 17, 'The ''Prime Minister Gram Sadak Yojana'' (PMGSY) primarily focuses on:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f70c753f-7da5-43f0-b6a1-44978a61680b', '065493f9-7258-4571-8a49-32ab288edd75', 0, 'Urban metro construction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f76f2133-57be-4a98-bbb2-341daccb3563', '065493f9-7258-4571-8a49-32ab288edd75', 1, 'Providing all-weather road connectivity to unconnected rural habitations across India');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0b98285-b7f9-439d-b0d7-04bd353f738f', '065493f9-7258-4571-8a49-32ab288edd75', 2, 'Airport modernization');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01a844fc-476c-44f3-878f-dbab0b7f6521', '065493f9-7258-4571-8a49-32ab288edd75', 3, 'Coastal shipping infrastructure');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('065493f9-7258-4571-8a49-32ab288edd75', 'f76f2133-57be-4a98-bbb2-341daccb3563', 'PMGSY, launched in 2000, is a Government of India scheme aimed at providing all-weather road connectivity to unconnected rural habitations, a foundational rural infrastructure initiative.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c5c03b23-6ed0-4099-bd74-92b509d0f85e', '553374b4-6da1-4a64-81a1-93a717660412', 18, 'The Central Water Commission (CWC), a key Indian technical organisation, is primarily involved in:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee9ec17c-1c53-4c7b-bfe9-23573d884072', 'c5c03b23-6ed0-4099-bd74-92b509d0f85e', 0, 'Space satellite launches');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('752dcff4-a586-465b-bf15-ce5c552d8e60', 'c5c03b23-6ed0-4099-bd74-92b509d0f85e', 1, 'Water resources development, including river/dam planning, flood forecasting, and irrigation-related technical guidance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ac89f3e-1599-43db-8ea5-a6c5e01b30b1', 'c5c03b23-6ed0-4099-bd74-92b509d0f85e', 2, 'Aircraft certification');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3650d8be-65c8-4148-97e1-530f45f12adc', 'c5c03b23-6ed0-4099-bd74-92b509d0f85e', 3, 'Telecom spectrum allocation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c5c03b23-6ed0-4099-bd74-92b509d0f85e', '752dcff4-a586-465b-bf15-ce5c552d8e60', 'The Central Water Commission is a premier technical organisation involved in water resources planning, coordination, and development across India, including river basin studies, dam safety, flood forecasting, and irrigation guidance.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6e2b4ad9-a495-4b1e-a2fe-1b17a1da3cac', '553374b4-6da1-4a64-81a1-93a717660412', 19, 'The concept of ''sustainable development'' in civil/infrastructure engineering emphasizes:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa444c95-5b4a-4bcc-8964-05bb7571367d', '6e2b4ad9-a495-4b1e-a2fe-1b17a1da3cac', 0, 'Maximizing short-term construction speed regardless of environmental impact');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e234e0d0-78d5-4382-9894-cc7c067d0bb6', '6e2b4ad9-a495-4b1e-a2fe-1b17a1da3cac', 1, 'Meeting present infrastructure needs without compromising the ability of future generations to meet their own needs, balancing economic, social, and environmental considerations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8417f768-9564-4fc7-a049-10f6aef758da', '6e2b4ad9-a495-4b1e-a2fe-1b17a1da3cac', 2, 'Using only the cheapest available materials regardless of durability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0b90115-23bb-4ed0-aecf-d8e7e0e3e4ad', '6e2b4ad9-a495-4b1e-a2fe-1b17a1da3cac', 3, 'Avoiding all new construction entirely');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6e2b4ad9-a495-4b1e-a2fe-1b17a1da3cac', 'e234e0d0-78d5-4382-9894-cc7c067d0bb6', 'Sustainable development, as classically defined, emphasizes meeting present needs without compromising future generations'' ability to meet their own — in civil engineering, this translates to balancing economic viability, social benefit, and environmental impact across a project''s full lifecycle, not just its immediate construction cost.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('377d2ac3-c95e-4586-8fbd-77966109ec55', '553374b4-6da1-4a64-81a1-93a717660412', 20, 'The Geological Survey of India (GSI), relevant to civil engineering site investigation and geotechnical work, primarily conducts:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('811c227a-e22a-4229-ac48-f5a6c979731d', '377d2ac3-c95e-4586-8fbd-77966109ec55', 0, 'Weather forecasting');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5cc42b91-6b2e-4f9b-a5e9-f3be13327657', '377d2ac3-c95e-4586-8fbd-77966109ec55', 1, 'Geological mapping, mineral resource assessment, and geo-hazard studies across India');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('754ff309-1dac-493a-8aec-f0e13be4ad91', '377d2ac3-c95e-4586-8fbd-77966109ec55', 2, 'Airline route planning');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25d04f1e-e8a3-44c2-b3df-9cce09b04ca8', '377d2ac3-c95e-4586-8fbd-77966109ec55', 3, 'Banking sector audits');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('377d2ac3-c95e-4586-8fbd-77966109ec55', '5cc42b91-6b2e-4f9b-a5e9-f3be13327657', 'The Geological Survey of India conducts geological mapping, mineral resource assessment, and studies of geological hazards (landslides, seismic activity) — work directly relevant to civil engineering site investigation, foundation design, and geotechnical risk assessment for major infrastructure projects.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

-- ── Section: English & Reasoning (40 questions) — English & Reasoning — general competitive-exam style practice content, not an official HAL paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('48375f99-f84f-4a29-bf73-8d8d3b45af7f', '553374b4-6da1-4a64-81a1-93a717660412', 21, 'Point out the error, if any: ''The construction crew have finished the foundation work ahead of schedule.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17c51d79-effb-4a4b-8be4-1752851f190c', '48375f99-f84f-4a29-bf73-8d8d3b45af7f', 0, '''have'' should be ''has''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c4fa85f-b929-4ac3-96fa-ed12dfa96a30', '48375f99-f84f-4a29-bf73-8d8d3b45af7f', 1, '''ahead'' should be ''in advance''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6996206-8597-4cb3-8ac6-7ca447f6b3db', '48375f99-f84f-4a29-bf73-8d8d3b45af7f', 2, '''finished'' should be ''finish''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('133eda36-737a-4dec-be76-25ea4bc085b0', '48375f99-f84f-4a29-bf73-8d8d3b45af7f', 3, 'No error');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('48375f99-f84f-4a29-bf73-8d8d3b45af7f', '17c51d79-effb-4a4b-8be4-1752851f190c', '''Crew'', a collective noun acting as a single unit here, takes the singular verb ''has finished'', not ''have finished''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0c5e5863-7de1-4351-81d6-e87cf38417e2', '553374b4-6da1-4a64-81a1-93a717660412', 22, 'Complete the sentence: ''The bridge ________ inspected annually for structural integrity.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9fce28c1-0f7a-443f-afd5-0d04d935d569', '0c5e5863-7de1-4351-81d6-e87cf38417e2', 0, 'is');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb210781-fe92-4390-8ec3-5ae3ee4ff751', '0c5e5863-7de1-4351-81d6-e87cf38417e2', 1, 'is routinely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd85b2a4-dbb4-49c5-8819-6aceb1a4c98a', '0c5e5863-7de1-4351-81d6-e87cf38417e2', 2, 'was');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63e464ad-3658-4ea0-92a5-9595db180ea4', '0c5e5863-7de1-4351-81d6-e87cf38417e2', 3, 'were');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0c5e5863-7de1-4351-81d6-e87cf38417e2', 'fb210781-fe92-4390-8ec3-5ae3ee4ff751', '''Is routinely inspected'' most precisely and completely conveys a regularly recurring present-tense action, making it the most grammatically complete option among those given.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9f7e1d20-e13d-4075-8e11-e685b1011b36', '553374b4-6da1-4a64-81a1-93a717660412', 23, 'Pick the word nearest in meaning to ''Sturdy'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25b61448-6df6-4271-b453-e377955d8dd6', '9f7e1d20-e13d-4075-8e11-e685b1011b36', 0, 'Fragile');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e01bba98-9cab-462b-abc5-8e6ac5ad5923', '9f7e1d20-e13d-4075-8e11-e685b1011b36', 1, 'Robust');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51b263fc-b154-49d9-8302-ed782edbce38', '9f7e1d20-e13d-4075-8e11-e685b1011b36', 2, 'Delicate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b24a3467-871d-46e3-88c5-d68738818943', '9f7e1d20-e13d-4075-8e11-e685b1011b36', 3, 'Flimsy');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9f7e1d20-e13d-4075-8e11-e685b1011b36', 'e01bba98-9cab-462b-abc5-8e6ac5ad5923', '''Sturdy'' means strongly and solidly built; ''Robust'' is the closest synonym.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('daf558ac-8276-422b-93b5-42812bb5706f', '553374b4-6da1-4a64-81a1-93a717660412', 24, 'Pick the closest antonym for ''Reinforce'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e77f105-dc80-4498-af1f-225000056512', 'daf558ac-8276-422b-93b5-42812bb5706f', 0, 'Strengthen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('feb0c144-8190-444e-9030-76b39d93a928', 'daf558ac-8276-422b-93b5-42812bb5706f', 1, 'Weaken');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43ef44f6-ccde-4d7e-acab-7f38af1e55b0', 'daf558ac-8276-422b-93b5-42812bb5706f', 2, 'Support');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e21c17d-de6c-4b72-86a0-545d8f3ca89e', 'daf558ac-8276-422b-93b5-42812bb5706f', 3, 'Fortify');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('daf558ac-8276-422b-93b5-42812bb5706f', 'feb0c144-8190-444e-9030-76b39d93a928', '''Reinforce'' means to strengthen or support something; its direct antonym is ''Weaken''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ee14d5db-e38d-401e-b185-99db387d7db1', '553374b4-6da1-4a64-81a1-93a717660412', 25, 'Pick the sentence that uses commas correctly:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('391e9967-10af-402e-9d54-a8f607fb1594', 'ee14d5db-e38d-401e-b185-99db387d7db1', 0, 'The contractor, who won the bid last month began construction immediately.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16c914a2-2104-4fab-9dbe-342be3aee743', 'ee14d5db-e38d-401e-b185-99db387d7db1', 1, 'The contractor who won the bid last month, began construction immediately.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4a9be30-73f6-4771-a5a3-22eed6aad2b4', 'ee14d5db-e38d-401e-b185-99db387d7db1', 2, 'The contractor, who won the bid last month, began construction immediately.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7fed1c9-0abb-457b-9c90-ea7507abe008', 'ee14d5db-e38d-401e-b185-99db387d7db1', 3, 'The contractor who, won the bid last month began construction immediately.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ee14d5db-e38d-401e-b185-99db387d7db1', 'c4a9be30-73f6-4771-a5a3-22eed6aad2b4', 'The non-restrictive clause ''who won the bid last month'' requires commas on both sides.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('063513c4-9873-40a3-b805-78e567c1816d', '553374b4-6da1-4a64-81a1-93a717660412', 26, 'Identify the correctly spelled word:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f2debc2-eae0-4e6f-8f5a-ac71dd5e13d7', '063513c4-9873-40a3-b805-78e567c1816d', 0, 'Reinfrocement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3bafdd1c-4e7a-4e8a-a62f-3be888086177', '063513c4-9873-40a3-b805-78e567c1816d', 1, 'Reinforcement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ec36aa5-2887-437a-831b-7c233d595b1a', '063513c4-9873-40a3-b805-78e567c1816d', 2, 'Reinforcemant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f060bd2a-270e-476d-9c82-ede329361a32', '063513c4-9873-40a3-b805-78e567c1816d', 3, 'Reinforcment');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('063513c4-9873-40a3-b805-78e567c1816d', '3bafdd1c-4e7a-4e8a-a62f-3be888086177', '''Reinforcement'' is the correct spelling.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0fd95901-9477-459b-afb3-0fc58cac9f00', '553374b4-6da1-4a64-81a1-93a717660412', 27, 'Identify the part of speech of the underlined word: ''The surveyor measured the plot ACCURATELY.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80b08218-9207-483d-9902-0e10db206b6a', '0fd95901-9477-459b-afb3-0fc58cac9f00', 0, 'Adjective');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fcfc0e39-f3e1-4809-abaf-84509ed2da08', '0fd95901-9477-459b-afb3-0fc58cac9f00', 1, 'Adverb');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b98ba387-7cb2-49ca-b29d-a40640c328eb', '0fd95901-9477-459b-afb3-0fc58cac9f00', 2, 'Noun');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a051fa07-5f02-42a7-a3db-d213f3e9aab8', '0fd95901-9477-459b-afb3-0fc58cac9f00', 3, 'Preposition');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0fd95901-9477-459b-afb3-0fc58cac9f00', 'fcfc0e39-f3e1-4809-abaf-84509ed2da08', '''Accurately'' modifies the verb ''measured'', describing how the measurement was carried out — it is an adverb.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c7c7a256-dcac-40a2-a31b-7119021499ee', '553374b4-6da1-4a64-81a1-93a717660412', 28, 'Convert to passive voice: ''The engineers designed the flyover to reduce traffic congestion.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('549fdbcd-6ca9-48f8-9819-364642790701', 'c7c7a256-dcac-40a2-a31b-7119021499ee', 0, 'The flyover is designed by the engineers to reduce traffic congestion.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15d2bb79-9d9f-44e3-9bf1-ec08632ceb09', 'c7c7a256-dcac-40a2-a31b-7119021499ee', 1, 'The flyover was designed by the engineers to reduce traffic congestion.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('310f56d6-03f9-4c4a-9e30-c04ce27426cc', 'c7c7a256-dcac-40a2-a31b-7119021499ee', 2, 'The flyover designs by the engineers to reduce traffic congestion.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6670828-b25a-411d-bdc0-04e5d4970f8e', 'c7c7a256-dcac-40a2-a31b-7119021499ee', 3, 'The flyover has design by the engineers to reduce traffic congestion.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c7c7a256-dcac-40a2-a31b-7119021499ee', '15d2bb79-9d9f-44e3-9bf1-ec08632ceb09', 'Simple past active (''designed'') converts to simple past passive: ''was designed by''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f10c3769-e0d7-4dd1-aef2-7dda1f3d698c', '553374b4-6da1-4a64-81a1-93a717660412', 29, 'Complete the idiom: ''After the third design revision failed, the team decided to ________ and start the project from scratch.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8903c9d2-b1de-47b7-8fa2-f1257d7155a7', 'f10c3769-e0d7-4dd1-aef2-7dda1f3d698c', 0, 'cut corners');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49b7b2c3-e52a-49e6-a37d-c082939b9e7e', 'f10c3769-e0d7-4dd1-aef2-7dda1f3d698c', 1, 'go back to square one');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('beb0fd6b-8681-44e1-8166-c7c303b8c058', 'f10c3769-e0d7-4dd1-aef2-7dda1f3d698c', 2, 'jump on the bandwagon');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35f391d3-8694-4ccd-8247-2f04596a8b34', 'f10c3769-e0d7-4dd1-aef2-7dda1f3d698c', 3, 'let the cat out of the bag');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f10c3769-e0d7-4dd1-aef2-7dda1f3d698c', '49b7b2c3-e52a-49e6-a37d-c082939b9e7e', '''To go back to square one'' means to start over from the very beginning, fitting the context of restarting a project after repeated failures.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c08b7f79-931f-4d16-8694-82f30f4e3138', '553374b4-6da1-4a64-81a1-93a717660412', 30, 'Pick the word nearest in meaning to ''Load-bearing'' (in a structural context):');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a639dad-93f7-4531-8fd9-886f60b0cc11', 'c08b7f79-931f-4d16-8694-82f30f4e3138', 0, 'Decorative, with no structural function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69c26024-510b-4dd3-ba05-45dfc069c86e', 'c08b7f79-931f-4d16-8694-82f30f4e3138', 1, 'Designed to carry and transfer structural weight/forces to the foundation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('890e7797-9b16-4483-bfe3-01d0114e0036', 'c08b7f79-931f-4d16-8694-82f30f4e3138', 2, 'Related only to electrical wiring');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ace11d5-b4dc-4da7-b5a3-f6af1313a6d0', 'c08b7f79-931f-4d16-8694-82f30f4e3138', 3, 'A term used exclusively for roofing materials');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c08b7f79-931f-4d16-8694-82f30f4e3138', '69c26024-510b-4dd3-ba05-45dfc069c86e', '''Load-bearing'', in structural engineering, describes a wall or element specifically designed to carry and transfer structural loads (weight) down to the foundation, distinguishing it from a purely decorative or non-structural partition.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6fecf7aa-4103-4415-891e-fe6adbc125c1', '553374b4-6da1-4a64-81a1-93a717660412', 31, 'Select the grammatically correct option:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aba4a5fe-61fc-4da9-a7ce-88603c2c8767', '6fecf7aa-4103-4415-891e-fe6adbc125c1', 0, 'Neither the beam nor the columns was inspected properly.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58d267b2-2ec7-4ea9-82ad-6e8a2b4a8400', '6fecf7aa-4103-4415-891e-fe6adbc125c1', 1, 'Neither the beam nor the columns were inspected properly.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f74c4d8-8e11-40c3-b0e6-dbecbcd6dd19', '6fecf7aa-4103-4415-891e-fe6adbc125c1', 2, 'Neither the beam or the columns were inspected properly.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7179918f-6250-4e6b-9f30-4884fbc4df0c', '6fecf7aa-4103-4415-891e-fe6adbc125c1', 3, 'Neither the beam and the columns were inspected properly.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6fecf7aa-4103-4415-891e-fe6adbc125c1', '58d267b2-2ec7-4ea9-82ad-6e8a2b4a8400', 'With ''neither...nor'', the verb agrees with the noun closest to it (''columns'', plural) — ''were inspected'' is correct.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('704ab872-6507-4f7e-8585-bcb9242315bc', '553374b4-6da1-4a64-81a1-93a717660412', 32, 'Fill in the blank with the correct preposition: ''The building''s design must comply ________ local zoning regulations.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('919e3642-d3a0-4de0-bd4d-82ffe3ed367b', '704ab872-6507-4f7e-8585-bcb9242315bc', 0, 'with');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2069773a-7b4a-4e18-bac8-b4b2036bdcbf', '704ab872-6507-4f7e-8585-bcb9242315bc', 1, 'of');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b366902c-58ab-4c36-88da-b08eec3969d4', '704ab872-6507-4f7e-8585-bcb9242315bc', 2, 'for');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a675eae3-4672-42d3-9a57-5e274102b028', '704ab872-6507-4f7e-8585-bcb9242315bc', 3, 'at');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('704ab872-6507-4f7e-8585-bcb9242315bc', '919e3642-d3a0-4de0-bd4d-82ffe3ed367b', 'The idiomatic preposition following ''comply'' is ''with'' — ''comply with''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f98cc906-5eed-4150-8ebe-58da331f5b29', '553374b4-6da1-4a64-81a1-93a717660412', 33, 'Convert to reported speech: The engineer said, ''I have completed the structural analysis.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5356c291-5f6c-4052-9b2e-af4e77fc524e', 'f98cc906-5eed-4150-8ebe-58da331f5b29', 0, 'The engineer said that she has completed the structural analysis.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a84d43a2-71dc-46de-af95-12e03fd6ca42', 'f98cc906-5eed-4150-8ebe-58da331f5b29', 1, 'The engineer said that she had completed the structural analysis.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfd3de56-c5e0-44a0-9d5d-651294d6df2f', 'f98cc906-5eed-4150-8ebe-58da331f5b29', 2, 'The engineer said that she completes the structural analysis.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('966079ee-be7c-4be3-84c4-b8ee0615d152', 'f98cc906-5eed-4150-8ebe-58da331f5b29', 3, 'The engineer said that she is completing the structural analysis.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f98cc906-5eed-4150-8ebe-58da331f5b29', 'a84d43a2-71dc-46de-af95-12e03fd6ca42', 'In reported speech, present perfect (''have completed'') shifts back to past perfect (''had completed'') when the reporting verb is in the past tense.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('381c5d9c-7d92-42ff-939e-c47e9db50e46', '553374b4-6da1-4a64-81a1-93a717660412', 34, 'Choose the option that is spelled correctly:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97daa993-4961-424a-be9e-e12fc833ad5d', '381c5d9c-7d92-42ff-939e-c47e9db50e46', 0, 'Excavtion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e048a1a-0cdc-474f-ab4a-2df736dd42a8', '381c5d9c-7d92-42ff-939e-c47e9db50e46', 1, 'Excavation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70235f15-5155-4523-b67c-90385c475e29', '381c5d9c-7d92-42ff-939e-c47e9db50e46', 2, 'Excavasion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd5e1235-287c-40c3-b052-3c111dea0e1b', '381c5d9c-7d92-42ff-939e-c47e9db50e46', 3, 'Excavaton');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('381c5d9c-7d92-42ff-939e-c47e9db50e46', '9e048a1a-0cdc-474f-ab4a-2df736dd42a8', '''Excavation'' is the correct spelling.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3bf72ca2-c372-4899-8fde-b75dc4510b39', '553374b4-6da1-4a64-81a1-93a717660412', 35, 'Which option shows correct subject-verb agreement?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43032ca0-9347-4b96-8ec5-b0a73d8923f9', '3bf72ca2-c372-4899-8fde-b75dc4510b39', 0, 'Each of the beams require load testing.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f544a5d-ea44-4068-83cb-f995e151c70c', '3bf72ca2-c372-4899-8fde-b75dc4510b39', 1, 'Each of the beams requires load testing.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c7e980e-5ef1-4492-a4af-446bd2944fdf', '3bf72ca2-c372-4899-8fde-b75dc4510b39', 2, 'Each of the beam require load testing.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('371a4f7b-868e-4908-a44b-f294b120d84d', '3bf72ca2-c372-4899-8fde-b75dc4510b39', 3, 'Each of the beams has been require testing.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3bf72ca2-c372-4899-8fde-b75dc4510b39', '9f544a5d-ea44-4068-83cb-f995e151c70c', '''Each'' is grammatically singular and requires a singular verb — ''requires'' is correct.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('84f38a2b-8e5e-4b30-aa0c-87ade0f70930', '553374b4-6da1-4a64-81a1-93a717660412', 36, 'Pick the word closest in meaning to ''Subsidence'' (in a civil engineering context):');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b74ce39-aad6-493a-ad94-280c21debe89', '84f38a2b-8e5e-4b30-aa0c-87ade0f70930', 0, 'The upward expansion of a structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8446af6d-b58a-4b38-973d-267580f7db6e', '84f38a2b-8e5e-4b30-aa0c-87ade0f70930', 1, 'The gradual sinking or settling of ground/foundation, often due to soil compression or underground voids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73789e3b-efb4-4821-a33e-c4e1b481d16f', '84f38a2b-8e5e-4b30-aa0c-87ade0f70930', 2, 'The chemical hardening of concrete');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4475c78e-1355-4749-9d1d-518ef99399a0', '84f38a2b-8e5e-4b30-aa0c-87ade0f70930', 3, 'The lateral movement of a structure only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('84f38a2b-8e5e-4b30-aa0c-87ade0f70930', '8446af6d-b58a-4b38-973d-267580f7db6e', '''Subsidence'' refers to the gradual sinking or settling of the ground (and any structure resting on it), commonly caused by soil compression, groundwater extraction, or underground voids — a significant concern in foundation engineering.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c509ea20-465a-4c6f-a232-dad715657c3c', '553374b4-6da1-4a64-81a1-93a717660412', 37, 'Which sentence correctly uses ''among'' rather than ''between''?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('756e3013-bfb6-4580-a120-4de767a71413', 'c509ea20-465a-4c6f-a232-dad715657c3c', 0, 'The workload was divided between the five contractors.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4c74493-28cd-4fe5-9a6d-9cab0cb27ae0', 'c509ea20-465a-4c6f-a232-dad715657c3c', 1, 'The workload was divided among the five contractors.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('895669b7-e359-4341-a454-498b3686c1f7', 'c509ea20-465a-4c6f-a232-dad715657c3c', 2, 'The workload was divided between the five contractor.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce532dfc-3135-40b3-bf53-e00c0841696f', 'c509ea20-465a-4c6f-a232-dad715657c3c', 3, 'The workload was divided among the five contractor.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c509ea20-465a-4c6f-a232-dad715657c3c', 'a4c74493-28cd-4fe5-9a6d-9cab0cb27ae0', '''Among'' is used for three or more entities (five contractors here), rather than ''between'' (traditionally reserved for exactly two).', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fdd714db-8e73-4f9e-a65a-9d38b9bc9e58', '553374b4-6da1-4a64-81a1-93a717660412', 38, 'Identify the option with correct list punctuation:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a44992c-0464-4c07-b6c2-8430f831fc8a', 'fdd714db-8e73-4f9e-a65a-9d38b9bc9e58', 0, 'The site survey covered soil type drainage, and elevation.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4fb2888-0eb5-48d1-a4c4-373038877582', 'fdd714db-8e73-4f9e-a65a-9d38b9bc9e58', 1, 'The site survey covered soil type, drainage and elevation.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45ad0700-16dd-4ab5-80ac-3c0456abeee8', 'fdd714db-8e73-4f9e-a65a-9d38b9bc9e58', 2, 'The site survey covered soil type, drainage, and elevation.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a12f726-14f1-4da0-b683-7ac458a4983c', 'fdd714db-8e73-4f9e-a65a-9d38b9bc9e58', 3, 'The site survey covered; soil type, drainage, elevation.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fdd714db-8e73-4f9e-a65a-9d38b9bc9e58', '45ad0700-16dd-4ab5-80ac-3c0456abeee8', 'A comma should separate each item in a list, including before the final conjunction (Oxford comma), for maximum clarity.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('40979ce2-a12e-4a54-ae10-e75740de7759', '553374b4-6da1-4a64-81a1-93a717660412', 39, 'Pick the option nearest in meaning to the idiom ''to build from the ground up'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9de17709-f621-4a81-b928-08087e296871', '40979ce2-a12e-4a54-ae10-e75740de7759', 0, 'To renovate only the roof of an existing structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8e30e97-547f-4e92-bea0-471a078fd5fd', '40979ce2-a12e-4a54-ae10-e75740de7759', 1, 'To construct something entirely from the very beginning, starting with the foundation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ce9c7f1-0ce9-46f0-8af4-52e1d45da858', '40979ce2-a12e-4a54-ae10-e75740de7759', 2, 'To demolish a structure completely with no rebuilding');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28b7d2ff-bd4e-4561-af1b-2e289c51b7dd', '40979ce2-a12e-4a54-ae10-e75740de7759', 3, 'To hire external contractors exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('40979ce2-a12e-4a54-ae10-e75740de7759', 'e8e30e97-547f-4e92-bea0-471a078fd5fd', '''To build from the ground up'' means to construct something completely from the very beginning, starting with the most basic/foundational elements — used both literally (construction) and figuratively (starting any project or organization from scratch).', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c0a4dc84-f1af-4047-b7eb-fab09dcb0512', '553374b4-6da1-4a64-81a1-93a717660412', 40, 'Complete the sentence: ''The site engineer''s ________ record-keeping made the final audit straightforward.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3e66f71-9fe5-4b58-9393-9de2b2d79ad6', 'c0a4dc84-f1af-4047-b7eb-fab09dcb0512', 0, 'haphazard');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00b995d4-d421-4c36-872a-acd417eb3879', 'c0a4dc84-f1af-4047-b7eb-fab09dcb0512', 1, 'meticulous');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26512bdf-955e-43aa-a083-df5dc0d51d75', 'c0a4dc84-f1af-4047-b7eb-fab09dcb0512', 2, 'incomplete');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66008eff-c00c-4af1-99b5-9a4b41785639', 'c0a4dc84-f1af-4047-b7eb-fab09dcb0512', 3, 'delayed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c0a4dc84-f1af-4047-b7eb-fab09dcb0512', '00b995d4-d421-4c36-872a-acd417eb3879', '''Meticulous'' (careful, thorough) fits the context of record-keeping praised for making an audit straightforward, unlike the negative alternatives.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('24520733-028c-4252-a150-588f7921b21c', '553374b4-6da1-4a64-81a1-93a717660412', 41, 'Statements: All beams are structural members. Some structural members are made of steel. Conclusions: I. Some beams are made of steel. II. All structural members are beams. Which conclusion(s) follow?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75890409-a9aa-46bd-999a-d4637f8143f3', '24520733-028c-4252-a150-588f7921b21c', 0, 'Only I follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55babd53-c804-4f7b-a806-e25029e17aad', '24520733-028c-4252-a150-588f7921b21c', 1, 'Only II follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f79d9f30-4a8c-4b1d-bc61-e11e313e4117', '24520733-028c-4252-a150-588f7921b21c', 2, 'Both follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7377743a-73d8-4dbb-953f-30fb99cc5f84', '24520733-028c-4252-a150-588f7921b21c', 3, 'Neither follows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('24520733-028c-4252-a150-588f7921b21c', '7377743a-73d8-4dbb-953f-30fb99cc5f84', 'There''s no guarantee the ''steel'' subset of structural members overlaps specifically with beams, so I doesn''t necessarily follow. II reverses the given relationship incorrectly. Neither conclusion follows with certainty.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c350f94a-3f1e-4b95-8959-2bc7c7e3d065', '553374b4-6da1-4a64-81a1-93a717660412', 42, 'If ''CEMENT'' is coded as ''DFNFOU'' in a certain code, how is ''GIRDER'' coded in that language?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2fbe7da4-8000-452b-b699-4bea11635d6f', 'c350f94a-3f1e-4b95-8959-2bc7c7e3d065', 0, 'HJSEFS');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04421ae4-cdf1-4d04-905c-dd561e537e1d', 'c350f94a-3f1e-4b95-8959-2bc7c7e3d065', 1, 'HJSEFT');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa48d036-a3d5-4639-8925-c2eef636d237', 'c350f94a-3f1e-4b95-8959-2bc7c7e3d065', 2, 'HJSDFS');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfea3027-ca08-454d-8719-e8156d7df57c', 'c350f94a-3f1e-4b95-8959-2bc7c7e3d065', 3, 'GJSEFS');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c350f94a-3f1e-4b95-8959-2bc7c7e3d065', '2fbe7da4-8000-452b-b699-4bea11635d6f', 'Each letter is shifted forward by 1 (C→D, E→F, M→N, E→F, N→O, T→U). Applying this to GIRDER: G→H, I→J, R→S, D→E, E→F, R→S, giving ''HJSEFS''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ed7f4e8c-ecaf-458c-829a-1ee5cc148fb7', '553374b4-6da1-4a64-81a1-93a717660412', 43, 'Find the next number in the series: 4, 9, 19, 39, 79, ?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a127c2b-fd0f-4c28-abd0-c3e3e1bf40e5', 'ed7f4e8c-ecaf-458c-829a-1ee5cc148fb7', 0, '159');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e492874c-d8a9-4f19-8e3f-3a49a2cbd25b', 'ed7f4e8c-ecaf-458c-829a-1ee5cc148fb7', 1, '155');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72e0db7b-6bae-4b6e-a6ac-6348cfa4d7ec', 'ed7f4e8c-ecaf-458c-829a-1ee5cc148fb7', 2, '161');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8cb521ca-47df-4307-8f97-0806c62078ff', 'ed7f4e8c-ecaf-458c-829a-1ee5cc148fb7', 3, '149');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ed7f4e8c-ecaf-458c-829a-1ee5cc148fb7', '2a127c2b-fd0f-4c28-abd0-c3e3e1bf40e5', 'Each term follows the pattern: multiply by 2 and add 1. 4×2+1=9, 9×2+1=19, 19×2+1=39, 39×2+1=79, 79×2+1=159.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e483438e-04ca-41e6-b775-d1047cbe6c6c', '553374b4-6da1-4a64-81a1-93a717660412', 44, 'Choose the odd one out: Cement, Sand, Aggregate, Theodolite');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5da2e975-1732-4d80-bfa5-2925d5392d01', 'e483438e-04ca-41e6-b775-d1047cbe6c6c', 0, 'Cement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('456200b2-b13e-464e-bf29-e808a16ba2f4', 'e483438e-04ca-41e6-b775-d1047cbe6c6c', 1, 'Sand');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1e28d8b-ecff-4b80-bf76-c92b95c1b1a4', 'e483438e-04ca-41e6-b775-d1047cbe6c6c', 2, 'Aggregate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d7667b1-b1d7-4256-b969-24170fa2fcd2', 'e483438e-04ca-41e6-b775-d1047cbe6c6c', 3, 'Theodolite');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e483438e-04ca-41e6-b775-d1047cbe6c6c', '1d7667b1-b1d7-4256-b969-24170fa2fcd2', 'Cement, Sand, and Aggregate are all construction materials (used to make concrete); a Theodolite is a surveying instrument, not a construction material — the odd one out.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c08999a5-0778-4ba5-b52b-49f9cd1bf1cb', '553374b4-6da1-4a64-81a1-93a717660412', 45, 'Five buildings P, Q, R, S, T have different heights. P is taller than Q but shorter than R. S is the shortest. T is taller than R. What is the correct order from tallest to shortest?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d1e0305-9a0b-4f69-8944-4cfb3c3661f6', 'c08999a5-0778-4ba5-b52b-49f9cd1bf1cb', 0, 'T, R, P, Q, S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa7cc032-b32e-4c3e-9834-7a8b9b9b385b', 'c08999a5-0778-4ba5-b52b-49f9cd1bf1cb', 1, 'T, R, Q, P, S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('784ee747-b129-4277-868e-93ba8481621a', 'c08999a5-0778-4ba5-b52b-49f9cd1bf1cb', 2, 'R, T, P, Q, S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c72452b-993d-42d0-b033-37b06a2369c4', 'c08999a5-0778-4ba5-b52b-49f9cd1bf1cb', 3, 'T, P, R, Q, S');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c08999a5-0778-4ba5-b52b-49f9cd1bf1cb', '3d1e0305-9a0b-4f69-8944-4cfb3c3661f6', 'Given: R > P > Q, T > R, S is shortest. Combining: T > R > P > Q > S — matching option A.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('12c44065-970b-4d37-86f4-4baa04b20ac1', '553374b4-6da1-4a64-81a1-93a717660412', 46, 'If ''A # B'' means ''A supports the load of B'' and ''B @ C'' means ''B is connected to C'', what does ''P # Q @ R'' establish?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6e12bed-1e5e-4630-a2d5-3cd19ac571ab', '12c44065-970b-4d37-86f4-4baa04b20ac1', 0, 'P supports the load of Q, and Q is connected to R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebe402ef-e308-4e59-ab26-86bbf4596d41', '12c44065-970b-4d37-86f4-4baa04b20ac1', 1, 'R supports the load of P directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('249cca27-aa71-4c3d-89bd-1b3ed5368cd6', '12c44065-970b-4d37-86f4-4baa04b20ac1', 2, 'P and R carry identical loads');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f204bcb-bccb-41ad-a2d1-158a558a94ce', '12c44065-970b-4d37-86f4-4baa04b20ac1', 3, 'No relationship can be established');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('12c44065-970b-4d37-86f4-4baa04b20ac1', 'd6e12bed-1e5e-4630-a2d5-3cd19ac571ab', '''P # Q'' means P supports the load of Q. ''Q @ R'' means Q is connected to R. Combined: P supports the load of Q, and Q is connected to R — matching option A; this does not directly establish a relationship between P and R.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b08cb0ae-f05c-4e1e-87aa-924bf2bc3cb8', '553374b4-6da1-4a64-81a1-93a717660412', 47, 'Complete the analogy: Column is to Compression as Tie Rod is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ceb8f381-860f-4c4d-8ce6-7828620b0adb', 'b08cb0ae-f05c-4e1e-87aa-924bf2bc3cb8', 0, 'Tension');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('300b16e0-5d79-4e47-8226-07c557387b6b', 'b08cb0ae-f05c-4e1e-87aa-924bf2bc3cb8', 1, 'Bending');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1a9b164-9efe-4449-9207-6e08cdd5fa5b', 'b08cb0ae-f05c-4e1e-87aa-924bf2bc3cb8', 2, 'Torsion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3009020-fd8d-4de5-9323-56d79116645d', 'b08cb0ae-f05c-4e1e-87aa-924bf2bc3cb8', 3, 'Shear');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b08cb0ae-f05c-4e1e-87aa-924bf2bc3cb8', 'ceb8f381-860f-4c4d-8ce6-7828620b0adb', 'A column primarily resists axial compressive force; a tie rod (or tension member) primarily resists axial tensile force — the analogy pairs each structural element with the primary type of force it''s designed to resist.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b6248488-813e-4997-8427-c512efe364c0', '553374b4-6da1-4a64-81a1-93a717660412', 48, 'In a certain code, if ''BEAM'' is coded as ''2-5-1-13'' (each letter replaced by its alphabetical position), what is ''SLAB'' coded as?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4aad0383-9333-44f4-93b6-81fe9b5fdd2e', 'b6248488-813e-4997-8427-c512efe364c0', 0, '19-12-1-2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27b75a71-3e68-4841-af92-5f7a00262448', 'b6248488-813e-4997-8427-c512efe364c0', 1, '19-11-1-2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99ec30ed-b9d7-4dc7-ab95-7f6eaf0d65db', 'b6248488-813e-4997-8427-c512efe364c0', 2, '18-12-1-2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('491b37ae-76e7-461c-b476-07510a33b504', 'b6248488-813e-4997-8427-c512efe364c0', 3, '19-12-2-2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b6248488-813e-4997-8427-c512efe364c0', '4aad0383-9333-44f4-93b6-81fe9b5fdd2e', 'S=19, L=12, A=1, B=2 — matching each letter to its exact alphabetical position gives ''19-12-1-2''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6433f313-d839-4610-9b89-b28eea9168fd', '553374b4-6da1-4a64-81a1-93a717660412', 49, 'A is the structural engineer for building B. C is the site supervisor for building B. D is the project manager overseeing both A and C. How is D related to the project team of building B?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e899b576-8f78-41d1-ae0a-d49e134ee44b', '6433f313-d839-4610-9b89-b28eea9168fd', 0, 'D directly oversees both the structural engineer (A) and the site supervisor (C) for building B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f374ff63-e76d-4fca-8f88-5b10db99751b', '6433f313-d839-4610-9b89-b28eea9168fd', 1, 'D has no involvement in building B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7238338f-addf-4df5-83a6-6bb274aa6ba0', '6433f313-d839-4610-9b89-b28eea9168fd', 2, 'D is the same person as A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f891999d-1ba4-416c-8220-3894e0e4c0ed', '6433f313-d839-4610-9b89-b28eea9168fd', 3, 'D reports to C');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6433f313-d839-4610-9b89-b28eea9168fd', 'e899b576-8f78-41d1-ae0a-d49e134ee44b', 'Based on the given statements, D is the project manager overseeing both A (structural engineer) and C (site supervisor), both of whom work on building B — so D directly oversees both roles on that project.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('33c41054-4191-4915-9995-21fa91dd801b', '553374b4-6da1-4a64-81a1-93a717660412', 50, 'Statements: No footing is a column. All columns transfer vertical load. Conclusions: I. No footing transfers vertical load. II. Some vertical-load-transferring elements are columns. Which conclusion(s) follow?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7c26256-87b9-43eb-829e-f1f37d7764c6', '33c41054-4191-4915-9995-21fa91dd801b', 0, 'Only I follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f949a433-d651-4989-96d2-4d60080b51fa', '33c41054-4191-4915-9995-21fa91dd801b', 1, 'Only II follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bf2092cf-283a-4412-8a8c-d5c850247d4b', '33c41054-4191-4915-9995-21fa91dd801b', 2, 'Both follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90c8d624-3a38-482f-818a-93f855e25129', '33c41054-4191-4915-9995-21fa91dd801b', 3, 'Neither follows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('33c41054-4191-4915-9995-21fa91dd801b', 'f949a433-d651-4989-96d2-4d60080b51fa', '''No footing is a column'' and ''All columns transfer vertical load'' does NOT imply ''no footing transfers vertical load'' (a footing could still transfer vertical load through a different path — in fact, footings do transfer load in reality, illustrating exactly why this conclusion doesn''t logically follow from the given statements) — so I does not follow. ''All columns transfer vertical load'' directly implies ''Some vertical-load-transferring elements are columns'' — so II follows.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ea2afb45-22d8-44b8-a262-1ff8fd8175af', '553374b4-6da1-4a64-81a1-93a717660412', 51, 'A clock shows 7:25. What is the angle between the hour and minute hands?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1238051c-05d7-45da-987c-6b9e9bb07102', 'ea2afb45-22d8-44b8-a262-1ff8fd8175af', 0, '62.5°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('330cd01e-7dec-4d72-98e2-018b4f16d597', 'ea2afb45-22d8-44b8-a262-1ff8fd8175af', 1, '67.5°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a557ef6-9135-4b4a-9ab8-e9deada5c601', 'ea2afb45-22d8-44b8-a262-1ff8fd8175af', 2, '72.5°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c38c104-ca3d-45d1-8c73-4d4a0192a953', 'ea2afb45-22d8-44b8-a262-1ff8fd8175af', 3, '77.5°');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ea2afb45-22d8-44b8-a262-1ff8fd8175af', '3a557ef6-9135-4b4a-9ab8-e9deada5c601', 'At 7:25, the minute hand is at 25×6=150° from 12. The hour hand is at 7×30+25×0.5=210+12.5=222.5° from 12. The angle between them is |222.5-150|=72.5°.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('607a510d-25ca-45f7-89ae-22b9051abe87', '553374b4-6da1-4a64-81a1-93a717660412', 52, 'Find the odd one out: (3,12), (4,20), (5,30), (6,40)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e41f7222-f917-473f-ae99-bb287189b9d8', '607a510d-25ca-45f7-89ae-22b9051abe87', 0, '(3,12)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('628d4890-c9fe-4866-b5b4-cf19383aaa8f', '607a510d-25ca-45f7-89ae-22b9051abe87', 1, '(4,20)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('348b7a85-72d7-42d1-ba1c-9b34a87cfba2', '607a510d-25ca-45f7-89ae-22b9051abe87', 2, '(5,30)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86fee356-1a53-4e92-908b-ccab4841f81f', '607a510d-25ca-45f7-89ae-22b9051abe87', 3, '(6,40)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('607a510d-25ca-45f7-89ae-22b9051abe87', '86fee356-1a53-4e92-908b-ccab4841f81f', 'In (3,12), (4,20), and (5,30), the second number follows n×(n+1): 3×4=12, 4×5=20, 5×6=30. For (6,40), 6×7=42, not 40 — this pair breaks the pattern.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fd672a9f-7d93-4c9d-b7d9-faf75e4317f5', '553374b4-6da1-4a64-81a1-93a717660412', 53, 'If South becomes West, West becomes North, then North becomes:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12385233-65e7-4415-b9ad-e67610221500', 'fd672a9f-7d93-4c9d-b7d9-faf75e4317f5', 0, 'East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8edfcc6a-0a53-4cd0-93f2-f9e4cfba4d3d', 'fd672a9f-7d93-4c9d-b7d9-faf75e4317f5', 1, 'South');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5dc11e37-0572-4ad9-b660-308b754a54b8', 'fd672a9f-7d93-4c9d-b7d9-faf75e4317f5', 2, 'West');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5a2a8e3-b764-446d-89ca-34acc216a615', 'fd672a9f-7d93-4c9d-b7d9-faf75e4317f5', 3, 'North stays the same');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fd672a9f-7d93-4c9d-b7d9-faf75e4317f5', '12385233-65e7-4415-b9ad-e67610221500', 'The transformation is a 90° anticlockwise rotation of directions (South→West is 90° anticlockwise; West→North confirms the same 90° anticlockwise shift). Applying the same 90° anticlockwise rotation to North gives East.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('aa2f9d72-1d32-4880-97c4-b04c336d2b3f', '553374b4-6da1-4a64-81a1-93a717660412', 54, 'A can complete a survey in 10 hours, and B can complete it in 15 hours. Working together, how long will they take?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04d07307-e9de-4611-b28b-dd967961d05e', 'aa2f9d72-1d32-4880-97c4-b04c336d2b3f', 0, '5 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3bdd574-630c-49f7-8549-eb12fdcaa392', 'aa2f9d72-1d32-4880-97c4-b04c336d2b3f', 1, '6 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04018fc9-ed1e-4714-8f79-43206837b275', 'aa2f9d72-1d32-4880-97c4-b04c336d2b3f', 2, '7 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da92c73a-b621-4d0c-9fc2-b5b26c36bfa6', 'aa2f9d72-1d32-4880-97c4-b04c336d2b3f', 3, '8 hours');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aa2f9d72-1d32-4880-97c4-b04c336d2b3f', 'e3bdd574-630c-49f7-8549-eb12fdcaa392', 'A''s rate = 1/10, B''s rate = 1/15. Combined rate = 1/10 + 1/15 = 3/30 + 2/30 = 5/30 = 1/6 (jobs/hour). Time = 6 hours.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e5bee922-664f-4d20-92a3-2a42b725dec4', '553374b4-6da1-4a64-81a1-93a717660412', 55, 'Choose the word that does NOT belong with the others: Theodolite, Total Station, Level, Excavator');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72b1eb6c-412c-4c97-9b59-70798b27c239', 'e5bee922-664f-4d20-92a3-2a42b725dec4', 0, 'Theodolite');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18b8c40c-9ac7-40a6-a794-032b822a2bbb', 'e5bee922-664f-4d20-92a3-2a42b725dec4', 1, 'Total Station');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c53a7f9c-b46c-4c2f-84ea-d37e05acba39', 'e5bee922-664f-4d20-92a3-2a42b725dec4', 2, 'Level');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c00dacd6-dc5f-4c77-b9e0-f5f5ffed6636', 'e5bee922-664f-4d20-92a3-2a42b725dec4', 3, 'Excavator');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e5bee922-664f-4d20-92a3-2a42b725dec4', 'c00dacd6-dc5f-4c77-b9e0-f5f5ffed6636', 'Theodolite, Total Station, and Level are all surveying instruments; an Excavator is heavy earthmoving construction equipment, not a surveying instrument — the odd one out.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('84cd9383-a6db-4ada-b99a-c5dbae0a61e2', '553374b4-6da1-4a64-81a1-93a717660412', 56, 'In a row of 48 workers on a construction site, one is 19th from the left. What is their position from the right?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('585aaa3e-4ec2-414b-b9c8-9e49f992e56a', '84cd9383-a6db-4ada-b99a-c5dbae0a61e2', 0, '29th');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31949a85-a616-4b43-abca-81a8ec4f6384', '84cd9383-a6db-4ada-b99a-c5dbae0a61e2', 1, '30th');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ee74338-ddf0-4749-ae13-873a2669fb92', '84cd9383-a6db-4ada-b99a-c5dbae0a61e2', 2, '31st');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('22106b76-dfca-4474-beb7-4df87ba62ede', '84cd9383-a6db-4ada-b99a-c5dbae0a61e2', 3, '28th');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('84cd9383-a6db-4ada-b99a-c5dbae0a61e2', '31949a85-a616-4b43-abca-81a8ec4f6384', 'Position from the right = (Total − Position from left) + 1 = (48 − 19) + 1 = 30th from the right.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3a1c5644-0127-42c0-9ea5-3484d46aa1bb', '553374b4-6da1-4a64-81a1-93a717660412', 57, 'Which term logically completes the series: Foundation, Plinth, Superstructure, ?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc739b4b-b049-4e85-a9f9-ead705b725a2', '3a1c5644-0127-42c0-9ea5-3484d46aa1bb', 0, 'Excavation (this precedes foundation work, breaking the bottom-to-top building sequence)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6511b28-82eb-4545-9eb2-d68bf0072e9e', '3a1c5644-0127-42c0-9ea5-3484d46aa1bb', 1, 'Roof (continuing the pattern of building upward from foundation to superstructure to roof)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfb69be2-d4b4-46b9-810a-2136792ac1b6', '3a1c5644-0127-42c0-9ea5-3484d46aa1bb', 2, 'Soil Testing (a pre-construction investigation step, not a structural sequence stage)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3a35c25-57dc-4c2c-8d31-72a4d4c763a9', '3a1c5644-0127-42c0-9ea5-3484d46aa1bb', 3, 'Demolition (the reverse/end-of-life process, not part of construction sequence)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3a1c5644-0127-42c0-9ea5-3484d46aa1bb', 'c6511b28-82eb-4545-9eb2-d68bf0072e9e', 'Foundation, Plinth, and Superstructure represent the sequential stages of building construction from bottom to top. Roof continues this upward-building pattern as the final major structural stage — the other options are either pre-construction steps or unrelated to the sequential building-up process.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f7bc218f-aeb7-402e-b8d9-37bd55c04ec8', '553374b4-6da1-4a64-81a1-93a717660412', 58, 'If today is Tuesday, what day was it 45 days ago?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7886d959-e87d-4946-a7ae-66a769c0a852', 'f7bc218f-aeb7-402e-b8d9-37bd55c04ec8', 0, 'Thursday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5caa94a6-90c1-4e0e-b0b1-e7757c852f78', 'f7bc218f-aeb7-402e-b8d9-37bd55c04ec8', 1, 'Friday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('571169d0-1a5d-4c8b-b687-c5a2136aefc6', 'f7bc218f-aeb7-402e-b8d9-37bd55c04ec8', 2, 'Saturday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f76ec2f-b2b9-417a-963d-60ef6994965b', 'f7bc218f-aeb7-402e-b8d9-37bd55c04ec8', 3, 'Sunday');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f7bc218f-aeb7-402e-b8d9-37bd55c04ec8', '571169d0-1a5d-4c8b-b687-c5a2136aefc6', '45 days = 6 weeks + 3 days. 6 weeks back from Tuesday is still Tuesday; counting back 3 more days (Monday, Sunday, Saturday) lands on Saturday.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0c04c390-bedf-4662-8811-bcc5b8abbb3b', '553374b4-6da1-4a64-81a1-93a717660412', 59, 'Statements: All contractors submit tenders. Some tender-submitting entities are disqualified for non-compliance. Conclusion: Some contractors are disqualified for non-compliance. Is this conclusion valid based strictly on the statements given?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbbee201-427b-46be-87ae-260e3e86b89d', '0c04c390-bedf-4662-8811-bcc5b8abbb3b', 0, 'Valid — it follows directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98eea5ae-4802-4bb0-97b8-b4f71b6c1f84', '0c04c390-bedf-4662-8811-bcc5b8abbb3b', 1, 'Invalid — it does not necessarily follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db4b94ac-6d1a-4791-91df-c679d6e8a82b', '0c04c390-bedf-4662-8811-bcc5b8abbb3b', 2, 'Valid only if all tender-submitting entities are contractors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a6c260a-1ad3-4abb-906b-d4697c9c09aa', '0c04c390-bedf-4662-8811-bcc5b8abbb3b', 3, 'Cannot be determined without additional data');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0c04c390-bedf-4662-8811-bcc5b8abbb3b', '98eea5ae-4802-4bb0-97b8-b4f71b6c1f84', 'The statements establish contractors are a subset of tender-submitting entities, and some (unspecified) tender-submitting entities are disqualified — but there''s no guarantee the ''disqualified'' subset overlaps with ''contractors'' specifically. The conclusion does not necessarily follow.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a7bb73d0-c2f4-4584-a15a-0056b7b44a71', '553374b4-6da1-4a64-81a1-93a717660412', 60, 'A project manager''s experience (in years) is 4 times a junior engineer''s experience. In 9 years, the manager''s experience will be twice the junior engineer''s. What is the junior engineer''s current experience?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0ea22d8-2bed-42a0-b30e-0e220ad1dc36', 'a7bb73d0-c2f4-4584-a15a-0056b7b44a71', 0, '1.5 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f9f64e2-36bf-4e57-ab33-9f9f4eede174', 'a7bb73d0-c2f4-4584-a15a-0056b7b44a71', 1, '3 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d6e45bf-011a-4532-be01-58db193fc23e', 'a7bb73d0-c2f4-4584-a15a-0056b7b44a71', 2, '4.5 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b845f7f-7f33-40a0-b006-e630ca604cd7', 'a7bb73d0-c2f4-4584-a15a-0056b7b44a71', 3, '6 years');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a7bb73d0-c2f4-4584-a15a-0056b7b44a71', '2d6e45bf-011a-4532-be01-58db193fc23e', 'Let junior''s experience = x, manager''s = 4x. In 9 years: (4x+9) = 2(x+9). Solving: 4x+9 = 2x+18, so 2x=9, x=4.5 years.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

-- ── Section: Civil Engineering (Discipline) (100 questions) — Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a4cc4eeb-41c5-4c29-87ce-f2142fdd8531', '553374b4-6da1-4a64-81a1-93a717660412', 61, 'A ''statically determinate'' structure is one in which:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dcc4a1a5-7844-499d-accc-10a4f60354b3', 'a4cc4eeb-41c5-4c29-87ce-f2142fdd8531', 0, 'The support reactions and internal forces can be determined using only the equations of static equilibrium, without needing compatibility conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79bc1d38-db0d-4e3f-a8d5-6451e258dd2d', 'a4cc4eeb-41c5-4c29-87ce-f2142fdd8531', 1, 'The structure has more unknowns than available equilibrium equations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f40428f3-bdb3-4f48-bf7d-820b0cb09339', 'a4cc4eeb-41c5-4c29-87ce-f2142fdd8531', 2, 'The structure cannot support any load');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c71507d7-d058-4b40-999c-0833122c2f0f', 'a4cc4eeb-41c5-4c29-87ce-f2142fdd8531', 3, 'All members are made of the same material');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a4cc4eeb-41c5-4c29-87ce-f2142fdd8531', 'dcc4a1a5-7844-499d-accc-10a4f60354b3', 'A statically determinate structure has exactly enough equilibrium equations to solve for all support reactions and internal member forces — no additional compatibility (deformation-based) equations are needed, unlike a statically indeterminate structure, which requires such additional conditions.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5c30753a-3e41-4da2-9066-ca3ee50a26a3', '553374b4-6da1-4a64-81a1-93a717660412', 62, 'A ''statically indeterminate'' structure has:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ee922c0-e5b1-45c2-9e5b-f4953f4f660e', '5c30753a-3e41-4da2-9066-ca3ee50a26a3', 0, 'Fewer unknowns than available equilibrium equations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e02b0baa-0b45-4d84-a63d-d38c8b118366', '5c30753a-3e41-4da2-9066-ca3ee50a26a3', 1, 'More unknown reactions/forces than can be solved using static equilibrium equations alone, requiring additional compatibility conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab083976-0936-425d-89a5-3f6d99728627', '5c30753a-3e41-4da2-9066-ca3ee50a26a3', 2, 'No support reactions at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f672177-5243-4e6e-ae90-c7d4c9f3a8c4', '5c30753a-3e41-4da2-9066-ca3ee50a26a3', 3, 'Zero internal forces under any load');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5c30753a-3e41-4da2-9066-ca3ee50a26a3', 'e02b0baa-0b45-4d84-a63d-d38c8b118366', 'A statically indeterminate structure has more unknown support reactions or internal forces than the available independent equilibrium equations can solve — additional compatibility conditions (based on the structure''s deformation behavior) are required to fully solve for all unknowns.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('53ee2533-e1c5-4c37-bea9-ed0c455194f8', '553374b4-6da1-4a64-81a1-93a717660412', 63, 'The ''degree of static indeterminacy'' of a structure quantifies:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('639ba68a-741c-414b-b84b-35469cab64fb', '53ee2533-e1c5-4c37-bea9-ed0c455194f8', 0, 'The structure''s total weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c9ff9a1-e727-465c-95c5-d8fb8e75c5b2', '53ee2533-e1c5-4c37-bea9-ed0c455194f8', 1, 'The number of additional (redundant) unknowns beyond what static equilibrium equations alone can solve');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('175e8f0c-5ba4-48a3-98c5-011733c005d8', '53ee2533-e1c5-4c37-bea9-ed0c455194f8', 2, 'The structure''s height');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d4ff064-096a-4f38-8863-c834d15b8c5a', '53ee2533-e1c5-4c37-bea9-ed0c455194f8', 3, 'The number of construction workers required');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('53ee2533-e1c5-4c37-bea9-ed0c455194f8', '7c9ff9a1-e727-465c-95c5-d8fb8e75c5b2', 'The degree of static indeterminacy quantifies the number of redundant (additional) unknown forces or reactions beyond what the equations of static equilibrium alone can solve — directly determining how many additional compatibility equations are needed for a complete structural analysis.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('eb049b13-483a-44e2-a39f-ebad7103b072', '553374b4-6da1-4a64-81a1-93a717660412', 64, 'A simply supported beam has supports that provide:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3b6ef66-2ac1-419c-ac11-5f94ff615156', 'eb049b13-483a-44e2-a39f-ebad7103b072', 0, 'Resistance to both vertical translation and rotation at both ends');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d3e0c23-64b1-4614-8edc-98260d1fd180', 'eb049b13-483a-44e2-a39f-ebad7103b072', 1, 'Resistance to vertical translation at both ends, but no resistance to rotation (allowing free rotation at the supports)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5744d71b-d131-4a9e-9e6a-ad869920bad2', 'eb049b13-483a-44e2-a39f-ebad7103b072', 2, 'No support resistance of any kind');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50c7d019-c0e4-4c39-a8fc-5a6ef8101bc6', 'eb049b13-483a-44e2-a39f-ebad7103b072', 3, 'Resistance to horizontal translation only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('eb049b13-483a-44e2-a39f-ebad7103b072', '0d3e0c23-64b1-4614-8edc-98260d1fd180', 'A simply supported beam has supports (typically one pin and one roller) that resist vertical translation but allow free rotation at the support points — distinct from a fixed (cantilever-type) support, which resists both translation and rotation.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('62712c6d-3aca-4edb-85ae-a9a73f317b8c', '553374b4-6da1-4a64-81a1-93a717660412', 65, 'In a beam under pure bending, the ''point of contraflexure'' refers to the location where:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d5dac7d-ffe7-472d-9ee1-50133cef09d8', '62712c6d-3aca-4edb-85ae-a9a73f317b8c', 0, 'Maximum bending moment occurs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99230306-1b6c-4c0c-9eb4-f9471ee27363', '62712c6d-3aca-4edb-85ae-a9a73f317b8c', 1, 'The bending moment changes sign (from positive/sagging to negative/hogging, or vice versa), and is theoretically zero at that exact point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7107fb46-0a7c-411e-8697-3174196fab7d', '62712c6d-3aca-4edb-85ae-a9a73f317b8c', 2, 'Maximum shear force occurs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47492a30-1042-40ce-b9ac-d7c0ac0aa175', '62712c6d-3aca-4edb-85ae-a9a73f317b8c', 3, 'The beam physically breaks');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('62712c6d-3aca-4edb-85ae-a9a73f317b8c', '99230306-1b6c-4c0c-9eb4-f9471ee27363', 'The point of contraflexure is the location along a beam''s length where the bending moment changes sign (from sagging to hogging or vice versa) — the bending moment value at this exact point is theoretically zero, though shear force is generally non-zero there.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('02d27ade-784e-4d40-a54d-bbc6739e7a57', '553374b4-6da1-4a64-81a1-93a717660412', 66, 'The ''moment of inertia'' of a cross-section, relevant to beam bending analysis, is a measure of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b99a2d84-633c-4f19-af11-339050986fd0', '02d27ade-784e-4d40-a54d-bbc6739e7a57', 0, 'The cross-section''s weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65bee046-b4bf-4e51-92dd-bb85696900dd', '02d27ade-784e-4d40-a54d-bbc6739e7a57', 1, 'The cross-section''s resistance to bending, based on how its area is distributed relative to the neutral axis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5f2e929-0dd8-4fa5-a6ff-002f27890bcc', '02d27ade-784e-4d40-a54d-bbc6739e7a57', 2, 'The material''s yield strength');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e94afde-5566-4e95-9fdf-eca2fd75ebac', '02d27ade-784e-4d40-a54d-bbc6739e7a57', 3, 'The beam''s total length');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('02d27ade-784e-4d40-a54d-bbc6739e7a57', '65bee046-b4bf-4e51-92dd-bb85696900dd', 'The moment of inertia (second moment of area) quantifies how a cross-section''s area is distributed relative to a reference axis (typically the neutral axis) — a higher moment of inertia (achieved by placing material farther from the neutral axis, as in an I-beam) provides greater resistance to bending for a given material quantity.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('05e4b65f-8e87-4aaf-9764-51e6ccf9f85a', '553374b4-6da1-4a64-81a1-93a717660412', 67, 'Macaulay''s method, used in structural analysis, is a technique specifically for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f87fa245-9441-429c-b2ae-3832eee63320', '05e4b65f-8e87-4aaf-9764-51e6ccf9f85a', 0, 'Determining the ultimate load capacity of a column');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9b88d6e-cada-46ca-8a3c-6b7ae6ac551e', '05e4b65f-8e87-4aaf-9764-51e6ccf9f85a', 1, 'Calculating beam deflections, particularly convenient for beams with discontinuous loading (multiple point loads/varying distributed loads along the span)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5e19ba7-4d4a-4fc5-bf17-614570cd10e1', '05e4b65f-8e87-4aaf-9764-51e6ccf9f85a', 2, 'Measuring soil bearing capacity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a61a905-6cb6-4a4a-9a3c-e33efbeabac5', '05e4b65f-8e87-4aaf-9764-51e6ccf9f85a', 3, 'Designing reinforced concrete slabs');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('05e4b65f-8e87-4aaf-9764-51e6ccf9f85a', 'b9b88d6e-cada-46ca-8a3c-6b7ae6ac551e', 'Macaulay''s method is a mathematical technique for calculating beam deflection and slope, particularly convenient for beams with discontinuous loading conditions (multiple point loads, moments, or varying distributed loads at different points along the span), using a unified single expression rather than separate equations for each loading segment.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2957a664-2c78-43c6-9fab-ee1838e714be', '553374b4-6da1-4a64-81a1-93a717660412', 68, 'The ''influence line diagram'' for a structural quantity (like reaction or bending moment at a point) shows:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('732e02fb-f474-4471-9e58-54e69c9cbdd9', '2957a664-2c78-43c6-9fab-ee1838e714be', 0, 'The structure''s deflected shape under a fixed, permanent load');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bc85f51-cd4e-4be5-ae8c-14d869c047fc', '2957a664-2c78-43c6-9fab-ee1838e714be', 1, 'How that quantity varies as a unit load moves across the structure''s span');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c38ddfc6-b90e-4ccc-b3d9-6fea449d390c', '2957a664-2c78-43c6-9fab-ee1838e714be', 2, 'The structure''s material composition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66d2e02d-09e8-4123-99b4-d0a9adeea571', '2957a664-2c78-43c6-9fab-ee1838e714be', 3, 'The construction schedule timeline');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2957a664-2c78-43c6-9fab-ee1838e714be', '2bc85f51-cd4e-4be5-ae8c-14d869c047fc', 'An influence line diagram plots how a specific structural response quantity (like the reaction at a support, or bending moment at a particular section) varies as a unit load moves across the structure — particularly valuable for analyzing structures under moving loads, like bridges under vehicular traffic.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('147be466-5d07-4425-a66d-42e7ea24be53', '553374b4-6da1-4a64-81a1-93a717660412', 69, 'The ''method of joints'', used in truss analysis, determines member forces by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a97a808-619d-492e-a401-72b08ad64618', '147be466-5d07-4425-a66d-42e7ea24be53', 0, 'Analyzing the equilibrium of forces at each individual joint of the truss');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fce4c0e7-8cb1-481b-9188-4758eb4f24a8', '147be466-5d07-4425-a66d-42e7ea24be53', 1, 'Cutting the entire truss into two halves and analyzing one section');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3eeb14d7-c864-4884-a626-5572305b9890', '147be466-5d07-4425-a66d-42e7ea24be53', 2, 'Ignoring all external loads');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d4daf94-8df9-45ef-8abb-c497d9cf3434', '147be466-5d07-4425-a66d-42e7ea24be53', 3, 'Assuming all members are subjected to bending, not axial force');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('147be466-5d07-4425-a66d-42e7ea24be53', '5a97a808-619d-492e-a401-72b08ad64618', 'The method of joints analyzes a truss by considering the equilibrium of forces (sum of forces = 0) at each individual joint, sequentially solving for unknown member forces — truss members are idealized as carrying only axial force (tension or compression), not bending, which simplifies this joint-by-joint equilibrium analysis.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('41749c53-3107-4c9c-8d68-448e887b0ce5', '553374b4-6da1-4a64-81a1-93a717660412', 70, 'The ''method of sections'', an alternative truss analysis technique to the method of joints, is particularly useful for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e93f0e52-a140-4567-9a56-d1b8d1e3d07e', '41749c53-3107-4c9c-8d68-448e887b0ce5', 0, 'Determining the force in only one or a few specific members without solving the entire truss joint by joint');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d25c288a-9713-49e3-86d9-33463caad48d', '41749c53-3107-4c9c-8d68-448e887b0ce5', 1, 'Only analyzing beams, never trusses');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebcbdaae-daff-4970-b851-e657c33cd9a7', '41749c53-3107-4c9c-8d68-448e887b0ce5', 2, 'Calculating soil settlement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ca688e5-1d63-4284-b620-6143db0ed85c', '41749c53-3107-4c9c-8d68-448e887b0ce5', 3, 'Measuring concrete curing time');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('41749c53-3107-4c9c-8d68-448e887b0ce5', 'e93f0e52-a140-4567-9a56-d1b8d1e3d07e', 'The method of sections cuts through a truss (through no more than three unknown-force members at once, generally) and analyzes the equilibrium of one resulting section — this is particularly efficient when only the force in a specific member (or a few members) is needed, without requiring a full joint-by-joint solution of the entire truss.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('38f53cfb-9e35-4f57-b92e-9f14adad4ea5', '553374b4-6da1-4a64-81a1-93a717660412', 71, 'A ''cantilever beam'' is characterized by having:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b386e4a9-156d-4a5f-a09c-be9ee95d7f68', '38f53cfb-9e35-4f57-b92e-9f14adad4ea5', 0, 'Simple supports at both ends, free to rotate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40e21f98-55fa-4302-908f-e3740d4c346c', '38f53cfb-9e35-4f57-b92e-9f14adad4ea5', 1, 'One end rigidly fixed (resisting both translation and rotation), with the other end completely free');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3d0db3e-5baa-4f1b-aa90-b7f6e04bbe07', '38f53cfb-9e35-4f57-b92e-9f14adad4ea5', 2, 'No supports at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7841dfb-1680-4ed9-ac82-4e19d38a356a', '38f53cfb-9e35-4f57-b92e-9f14adad4ea5', 3, 'Supports only at the midpoint');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('38f53cfb-9e35-4f57-b92e-9f14adad4ea5', '40e21f98-55fa-4302-908f-e3740d4c346c', 'A cantilever beam has one end rigidly fixed (resisting both translational and rotational movement) while the other end is completely free/unsupported — a common structural configuration in balconies, overhangs, and diving boards.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('86063c73-6d60-4fe9-a436-6597ec6fc713', '553374b4-6da1-4a64-81a1-93a717660412', 72, 'The ''shear force diagram'' (SFD) and ''bending moment diagram'' (BMD) for a beam are mathematically related such that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f0e4605-96e8-4317-92a3-954f0cee5329', '86063c73-6d60-4fe9-a436-6597ec6fc713', 0, 'They are entirely unrelated quantities');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8dd71537-5e95-4a1e-b33b-9c6b939c42a7', '86063c73-6d60-4fe9-a436-6597ec6fc713', 1, 'The slope of the bending moment diagram at any point equals the shear force value at that point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb9ea06b-628f-4519-8d35-aee150c8e2c2', '86063c73-6d60-4fe9-a436-6597ec6fc713', 2, 'The bending moment diagram is always a mirror image of the shear force diagram');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('204829c6-36a4-49dc-9cb7-8883d74b7a82', '86063c73-6d60-4fe9-a436-6597ec6fc713', 3, 'Bending moment is always exactly double the shear force');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('86063c73-6d60-4fe9-a436-6597ec6fc713', '8dd71537-5e95-4a1e-b33b-9c6b939c42a7', 'A fundamental relationship in beam analysis is that the slope of the bending moment diagram at any point equals the shear force at that point (dM/dx = V) — this relationship is used extensively to construct and verify SFDs and BMDs, and explains why bending moment reaches an extremum (maximum or minimum) where shear force crosses zero.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fb7219d3-c1f8-4b16-81c8-586b240a3f7a', '553374b4-6da1-4a64-81a1-93a717660412', 73, '''Strain energy'' stored in a structural member under elastic loading is used in analysis methods such as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58d370af-4e72-4dfc-ae10-89e59c81a120', 'fb7219d3-c1f8-4b16-81c8-586b240a3f7a', 0, 'Only material selection, with no analytical application');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6699a51-2daf-4ef2-8098-04c511b40b6c', 'fb7219d3-c1f8-4b16-81c8-586b240a3f7a', 1, 'Castigliano''s theorem, for calculating deflections in structures using energy methods');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9507e0e-0206-4b6b-9d24-1ced6165e80f', 'fb7219d3-c1f8-4b16-81c8-586b240a3f7a', 2, 'Determining soil type only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('448f2e75-9dc1-47a3-bf0b-8df899e35d47', 'fb7219d3-c1f8-4b16-81c8-586b240a3f7a', 3, 'Selecting paint color for a structure');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fb7219d3-c1f8-4b16-81c8-586b240a3f7a', 'f6699a51-2daf-4ef2-8098-04c511b40b6c', 'Strain energy (elastic energy stored in a deformed structural member) is the basis for energy-method structural analysis techniques, notably Castigliano''s theorem, which provides a systematic way to calculate deflections (or rotations) at specific points in a structure by differentiating the total strain energy with respect to an applied load (or moment) at that point.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b6313dec-ca58-4fe2-b1f8-7d5926d831d2', '553374b4-6da1-4a64-81a1-93a717660412', 74, 'A ''portal frame'', a common structural form in industrial buildings, is characterized by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('407851f4-d8bc-450d-804b-0295d42aafd2', 'b6313dec-ca58-4fe2-b1f8-7d5926d831d2', 0, 'Having no rigid connections between beams and columns');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c067090-68a8-443d-9e2f-75246a6387d3', 'b6313dec-ca58-4fe2-b1f8-7d5926d831d2', 1, 'A rigid (moment-resisting) connection between the horizontal beam and vertical columns, forming a self-supporting frame that resists both vertical and lateral loads');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57452e00-8369-4be1-8fd8-37c37f67d011', 'b6313dec-ca58-4fe2-b1f8-7d5926d831d2', 2, 'Being usable only for very short spans');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('755fed6a-eb86-4d1f-abb5-d645725cf3f8', 'b6313dec-ca58-4fe2-b1f8-7d5926d831d2', 3, 'Requiring no foundation at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b6313dec-ca58-4fe2-b1f8-7d5926d831d2', '5c067090-68a8-443d-9e2f-75246a6387d3', 'A portal frame consists of rigid (moment-resisting) connections between its horizontal beam and vertical columns, forming a self-supporting structural frame capable of resisting both vertical (gravity) loads and lateral (wind/seismic) loads without requiring separate bracing systems — widely used in industrial and warehouse buildings.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('735682eb-dca5-45ca-b1df-44cc78c4e2ad', '553374b4-6da1-4a64-81a1-93a717660412', 75, '''Buckling'' of a slender structural column under axial compressive load is a failure mode governed primarily by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e44eb191-75b2-4e03-830c-3fd745ccfd5d', '735682eb-dca5-45ca-b1df-44cc78c4e2ad', 0, 'The material''s tensile strength alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d9c3a9f-f973-44b1-a7ee-159189ef8629', '735682eb-dca5-45ca-b1df-44cc78c4e2ad', 1, 'Euler''s buckling theory, which depends on the column''s slenderness ratio, material stiffness, and end-support conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d42be04b-e917-4ef2-8df3-bb10ca428363', '735682eb-dca5-45ca-b1df-44cc78c4e2ad', 2, 'The column''s color');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9bfd475-4dcb-430d-8010-fcb49378e6e8', '735682eb-dca5-45ca-b1df-44cc78c4e2ad', 3, 'The ambient humidity only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('735682eb-dca5-45ca-b1df-44cc78c4e2ad', '3d9c3a9f-f973-44b1-a7ee-159189ef8629', 'For slender columns, failure often occurs through elastic buckling (sudden lateral instability) rather than material crushing — Euler''s classical buckling theory predicts the critical buckling load based on the column''s effective length (governed by end-support conditions), cross-sectional moment of inertia, and the material''s modulus of elasticity.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2f18728e-9aa1-443a-a616-d27885375580', '553374b4-6da1-4a64-81a1-93a717660412', 76, 'Reinforced concrete combines plain concrete (strong in compression, weak in tension) with steel reinforcement bars primarily to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92745136-d9e3-47eb-bf47-543bb6dcf6e0', '2f18728e-9aa1-443a-a616-d27885375580', 0, 'Increase the concrete''s weight only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('699b1c85-9992-421a-a4ae-c4449817fe6b', '2f18728e-9aa1-443a-a616-d27885375580', 1, 'Provide tensile strength that plain concrete alone lacks, since steel is strong in tension');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b695ecd-bc8d-4411-a1a5-f1f8a75cc9bf', '2f18728e-9aa1-443a-a616-d27885375580', 2, 'Reduce the concrete''s compressive strength deliberately');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fce0c9f7-5ee1-4546-b2af-22feaa8abccc', '2f18728e-9aa1-443a-a616-d27885375580', 3, 'Eliminate the need for any structural design calculations');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2f18728e-9aa1-443a-a616-d27885375580', '699b1c85-9992-421a-a4ae-c4449817fe6b', 'Plain concrete is strong in compression but weak and brittle in tension; steel reinforcement bars, which are strong in tension, are embedded in the concrete specifically to carry the tensile stresses that plain concrete alone cannot adequately resist — this combination is the fundamental principle behind reinforced concrete construction.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('66f5fa79-ee66-4f6b-9a9a-e887a72c5d28', '553374b4-6da1-4a64-81a1-93a717660412', 77, 'The ''water-cement ratio'' in concrete mix design significantly affects:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e695c76c-104a-4eb2-8b60-63b8022d3ba9', '66f5fa79-ee66-4f6b-9a9a-e887a72c5d28', 0, 'Only the concrete''s color');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3fed4959-9181-4520-887c-74f5d1bc24c7', '66f5fa79-ee66-4f6b-9a9a-e887a72c5d28', 1, 'The concrete''s strength and durability — generally, a lower water-cement ratio (within workable limits) produces stronger, more durable concrete');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e48112d-ce43-4606-8d16-5687fe4abb48', '66f5fa79-ee66-4f6b-9a9a-e887a72c5d28', 2, 'Only the setting time, with no effect on final strength');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb4c7151-8e6d-4e24-b92c-36ec466e6e5f', '66f5fa79-ee66-4f6b-9a9a-e887a72c5d28', 3, 'The steel reinforcement''s yield strength');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('66f5fa79-ee66-4f6b-9a9a-e887a72c5d28', '3fed4959-9181-4520-887c-74f5d1bc24c7', 'Water-cement ratio is one of the most critical parameters in concrete mix design — a lower water-cement ratio (while maintaining adequate workability) generally produces concrete with higher compressive strength and better long-term durability, since excess water beyond what''s needed for cement hydration creates voids that weaken the hardened concrete.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e31b0b0f-2f0c-4b25-aa2c-5917c51de053', '553374b4-6da1-4a64-81a1-93a717660412', 78, '''Curing'' of concrete, the process of maintaining adequate moisture and temperature after placement, is essential because:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9495ddea-16ff-4e4e-bf7c-1971c32bc6ba', 'e31b0b0f-2f0c-4b25-aa2c-5917c51de053', 0, 'It has no effect on final concrete properties');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c841dec8-ecee-434a-a455-cb651e13ba55', 'e31b0b0f-2f0c-4b25-aa2c-5917c51de053', 1, 'Proper curing ensures adequate hydration of cement, directly influencing the concrete''s final strength, durability, and resistance to cracking');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('819acc28-f27d-4274-a6a0-a296d1999ae7', 'e31b0b0f-2f0c-4b25-aa2c-5917c51de053', 2, 'Curing only affects the concrete''s appearance, not its structural properties');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68c5a30f-4f32-4c87-b0ed-620e07b60ca2', 'e31b0b0f-2f0c-4b25-aa2c-5917c51de053', 3, 'Curing is only relevant for concrete used in cold climates');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e31b0b0f-2f0c-4b25-aa2c-5917c51de053', 'c841dec8-ecee-434a-a455-cb651e13ba55', 'Curing maintains adequate moisture (and often temperature control) in concrete after placement, allowing the cement hydration reaction to continue properly — inadequate curing results in incomplete hydration, leading to reduced strength, increased permeability, and greater susceptibility to shrinkage cracking.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9faf014e-5d46-4f01-8c04-24f118984cd2', '553374b4-6da1-4a64-81a1-93a717660412', 79, '''Development length'' of a reinforcement bar in reinforced concrete refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9327dbf2-d5ba-44a4-95fd-ebdf0c932a7b', '9faf014e-5d46-4f01-8c04-24f118984cd2', 0, 'The total length of the bar, regardless of embedment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77e45267-a5bc-4f8d-b10f-4bb1e2f41ddc', '9faf014e-5d46-4f01-8c04-24f118984cd2', 1, 'The minimum length of bar that must be embedded in concrete to develop the bar''s full design stress through bond, without pulling out or slipping');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1d04cf7-95c7-4a1b-9ce9-155d4f930d71', '9faf014e-5d46-4f01-8c04-24f118984cd2', 2, 'The length of the bar visible outside the concrete');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6f7fcc7-3d79-460e-9e4e-121432e379e3', '9faf014e-5d46-4f01-8c04-24f118984cd2', 3, 'The length used only for cosmetic purposes');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9faf014e-5d46-4f01-8c04-24f118984cd2', '77e45267-a5bc-4f8d-b10f-4bb1e2f41ddc', 'Development length is the minimum embedment length required for a reinforcement bar within concrete to develop its full intended design stress (typically its yield strength) through bond between the bar''s surface and the surrounding concrete, without the bar slipping or pulling out — a critical design parameter ensuring reinforcement actually functions as intended.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b3aaf0d4-7bfe-4646-9621-b9df69a9af89', '553374b4-6da1-4a64-81a1-93a717660412', 80, '''Shear reinforcement'' (stirrups) in a reinforced concrete beam is primarily provided to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbc4f720-0408-48e3-aecf-bd4245a57e6b', 'b3aaf0d4-7bfe-4646-9621-b9df69a9af89', 0, 'Resist the bending moment directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12621e11-c818-4319-a459-0a9913f0a91a', 'b3aaf0d4-7bfe-4646-9621-b9df69a9af89', 1, 'Resist diagonal tension cracking caused by shear forces, which plain concrete alone is inadequate to resist near supports');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9875348e-97ea-425b-a524-b59ea8ca6bb7', 'b3aaf0d4-7bfe-4646-9621-b9df69a9af89', 2, 'Improve the concrete''s color');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6aa9bd61-3393-422a-85a4-ae860a212969', 'b3aaf0d4-7bfe-4646-9621-b9df69a9af89', 3, 'Reduce the beam''s overall weight');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b3aaf0d4-7bfe-4646-9621-b9df69a9af89', '12621e11-c818-4319-a459-0a9913f0a91a', 'Shear reinforcement (stirrups), typically vertical or inclined bars, is provided to resist diagonal tension cracking caused by combined shear and bending stress, particularly significant near beam supports — the main longitudinal reinforcement primarily resists bending (flexural) tension, while stirrups specifically address shear-related diagonal tension.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('34a1a3c6-4b04-4f29-96e3-6e98d66b5c1e', '553374b4-6da1-4a64-81a1-93a717660412', 81, 'The ''limit state design'' philosophy, widely used in modern structural design codes, considers:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ebb2bb4-2eca-4f35-b43a-ad19285dec15', '34a1a3c6-4b04-4f29-96e3-6e98d66b5c1e', 0, 'Only the structure''s ultimate (collapse) load capacity, with no regard for serviceability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6bb35b2e-47e3-40dd-a811-a9c82eb8048b', '34a1a3c6-4b04-4f29-96e3-6e98d66b5c1e', 1, 'Both the ultimate limit state (safety against collapse) and serviceability limit state (deflection, cracking, vibration under normal service loads)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ba034f1-b9fd-44de-99cc-5171edad2509', '34a1a3c6-4b04-4f29-96e3-6e98d66b5c1e', 2, 'Only aesthetic appearance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e72ca4ea-cc08-43cf-8732-7335f415ad63', '34a1a3c6-4b04-4f29-96e3-6e98d66b5c1e', 3, 'Only construction cost, with no safety considerations');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('34a1a3c6-4b04-4f29-96e3-6e98d66b5c1e', '6bb35b2e-47e3-40dd-a811-a9c82eb8048b', 'Limit state design explicitly considers both the ultimate limit state (ensuring adequate safety margin against structural collapse/failure) and the serviceability limit state (ensuring the structure performs acceptably under normal service loads, in terms of deflection, cracking, and vibration) — a more comprehensive design philosophy than earlier working-stress methods.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('68d67ca4-a2c6-485e-bbd5-c775320171ce', '553374b4-6da1-4a64-81a1-93a717660412', 82, '''Prestressed concrete'', as distinct from ordinary reinforced concrete, involves:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f48e3b17-8e4e-4e32-a3ab-792fe7d24efd', '68d67ca4-a2c6-485e-bbd5-c775320171ce', 0, 'No steel reinforcement at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2af1e496-a7f4-4568-9d65-3bcac86f6b14', '68d67ca4-a2c6-485e-bbd5-c775320171ce', 1, 'Deliberately introducing internal compressive stress into the concrete (via tensioned tendons) before external service loads are applied, counteracting tensile stresses that would otherwise develop');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e50c665-d797-431d-8657-ddfcf13f4695', '68d67ca4-a2c6-485e-bbd5-c775320171ce', 2, 'Using only low-strength concrete');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9be12a0-6ebc-451b-a804-2f93819419e4', '68d67ca4-a2c6-485e-bbd5-c775320171ce', 3, 'Eliminating the need for any curing process');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('68d67ca4-a2c6-485e-bbd5-c775320171ce', '2af1e496-a7f4-4568-9d65-3bcac86f6b14', 'Prestressed concrete deliberately introduces internal compressive stress into the concrete (through tensioned steel tendons, either pre-tensioned or post-tensioned) before external service loads are applied — this pre-compression counteracts the tensile stresses that would otherwise develop under service loading, allowing for more efficient use of materials and longer spans than ordinary reinforced concrete.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d30ac047-7036-4509-8ce8-0242921a857e', '553374b4-6da1-4a64-81a1-93a717660412', 83, 'In steel structural design, a ''bolted connection'', compared to a welded connection, generally offers the advantage of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02e436c1-2d4a-46ff-9723-445ec42dea5c', 'd30ac047-7036-4509-8ce8-0242921a857e', 0, 'Requiring specialized on-site heating equipment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28b3e2a7-1ab8-4e9e-93cf-c7441836a7bd', 'd30ac047-7036-4509-8ce8-0242921a857e', 1, 'Easier field assembly, inspection, and (if needed) disassembly, without requiring skilled on-site welding');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de44c952-ad16-49bb-b975-0ebe89d1daec', 'd30ac047-7036-4509-8ce8-0242921a857e', 2, 'Guaranteed higher strength in every application');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42e221ee-7395-4e4b-b12f-d34d411155c3', 'd30ac047-7036-4509-8ce8-0242921a857e', 3, 'Elimination of the need for any design calculations');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d30ac047-7036-4509-8ce8-0242921a857e', '28b3e2a7-1ab8-4e9e-93cf-c7441836a7bd', 'Bolted connections generally offer easier field assembly and inspection (visual verification of proper bolt tightening is more straightforward than verifying weld quality) and can be disassembled if needed, without requiring skilled on-site welders — welded connections, by contrast, often provide more continuous, rigid connections but require greater quality control during field welding.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6c6a30fa-591c-4d6f-9e24-56e189a6267f', '553374b4-6da1-4a64-81a1-93a717660412', 84, 'The ''yield strength'' of structural steel is significant in design because it represents:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('71360a62-1e69-46a9-8635-6c0b5dcf7f57', '6c6a30fa-591c-4d6f-9e24-56e189a6267f', 0, 'The maximum stress the steel can withstand before fracturing completely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd5428a9-cf7a-40c1-8fc0-3a86783833a4', '6c6a30fa-591c-4d6f-9e24-56e189a6267f', 1, 'The stress level at which the steel begins to deform plastically (permanently), rather than purely elastically');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9b2867b-16e4-4b85-bbb8-65fc1e1899cf', '6c6a30fa-591c-4d6f-9e24-56e189a6267f', 2, 'The steel''s melting point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77bc2672-2bdc-49a2-a329-9bda124e0f47', '6c6a30fa-591c-4d6f-9e24-56e189a6267f', 3, 'The steel''s density');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6c6a30fa-591c-4d6f-9e24-56e189a6267f', 'dd5428a9-cf7a-40c1-8fc0-3a86783833a4', 'Yield strength marks the stress level at which steel transitions from elastic behavior (fully recoverable deformation) to plastic behavior (permanent deformation) — most structural steel design is based on ensuring stresses remain below yield under service loads, with the material''s ultimate (fracture) strength providing an additional margin beyond yield.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d658f340-1527-4785-8755-bec643184677', '553374b4-6da1-4a64-81a1-93a717660412', 85, '''Effective span'' of a beam, used in structural calculations, generally refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9404a263-8c07-4a0e-a7f1-89af862d47fe', 'd658f340-1527-4785-8755-bec643184677', 0, 'The beam''s total physical length including any overhangs beyond supports');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ffcc5d4-0453-49dd-a029-f8e69601b2a4', 'd658f340-1527-4785-8755-bec643184677', 1, 'The distance between the centers of the beam''s supports (or a similarly defined distance per the relevant design code), used for calculating bending moments and deflections');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b0ac54e-3f5b-4390-8f1f-60ce66771ade', 'd658f340-1527-4785-8755-bec643184677', 2, 'The beam''s cross-sectional width');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53b7bb1e-d6da-4a08-9bba-6d0a2068f537', 'd658f340-1527-4785-8755-bec643184677', 3, 'The beam''s total weight');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d658f340-1527-4785-8755-bec643184677', '3ffcc5d4-0453-49dd-a029-f8e69601b2a4', 'Effective span, as defined by design codes, is typically taken as the distance between the centers of a beam''s supports (with specific code-defined adjustments for support width and other factors) — this is the length used in bending moment, shear force, and deflection calculations, and can differ slightly from the beam''s total clear or overall physical length.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d7eaaead-ce13-4dba-bdc4-6615195da742', '553374b4-6da1-4a64-81a1-93a717660412', 86, '''Cover'' (concrete cover) over reinforcement bars in reinforced concrete is provided primarily to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bd92d93-05c5-4f51-ba82-4c1f3afcdfde', 'd7eaaead-ce13-4dba-bdc4-6615195da742', 0, 'Improve the concrete''s color');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb670194-a0bb-46a9-a2e1-4b00acdbdc02', 'd7eaaead-ce13-4dba-bdc4-6615195da742', 1, 'Protect the reinforcement from corrosion and provide fire resistance, while also ensuring adequate bond between steel and concrete');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6402ba82-46ed-4fae-a0bb-a2d3fdb35f9c', 'd7eaaead-ce13-4dba-bdc4-6615195da742', 2, 'Increase the beam''s weight with no functional benefit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96723f64-4402-4221-b6a6-7dc0f16a50e0', 'd7eaaead-ce13-4dba-bdc4-6615195da742', 3, 'Reduce the concrete''s compressive strength');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d7eaaead-ce13-4dba-bdc4-6615195da742', 'bb670194-a0bb-46a9-a2e1-4b00acdbdc02', 'Concrete cover — the distance between the reinforcement bar''s surface and the concrete''s outer surface — protects the embedded steel from corrosion (by limiting exposure to moisture and corrosive agents) and provides fire resistance (concrete''s low thermal conductivity delays heat reaching the steel), while also being essential for proper bond development between the steel and surrounding concrete.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('61b289b2-3327-4df1-94f5-d95235511c05', '553374b4-6da1-4a64-81a1-93a717660412', 87, 'The ''plastic hinge'' concept in steel/reinforced concrete structural design refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62657fd6-38b5-414d-b0d4-7ce017c489da', '61b289b2-3327-4df1-94f5-d95235511c05', 0, 'A physical mechanical hinge joint installed at construction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5df415e-1f94-4bae-8741-f52a5f711b64', '61b289b2-3327-4df1-94f5-d95235511c05', 1, 'A section of a structural member that has reached its full plastic moment capacity and continues to rotate under roughly constant moment, behaving somewhat like a real hinge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f87461da-7d65-44d6-8514-b2cfe2c335bb', '61b289b2-3327-4df1-94f5-d95235511c05', 2, 'A permanently rigid, non-rotating connection');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a66f6d1-892e-4403-b3c0-6d3b8bfaa4b5', '61b289b2-3327-4df1-94f5-d95235511c05', 3, 'A hinge used only for doors within a building');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('61b289b2-3327-4df1-94f5-d95235511c05', 'd5df415e-1f94-4bae-8741-f52a5f711b64', 'A plastic hinge forms at a section of a structural member (beam or column) once it reaches its full plastic moment capacity — beyond this point, the section continues to rotate under approximately constant moment, behaving analogously to a mechanical hinge, a concept central to plastic (limit) analysis and design of steel and reinforced concrete structures.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1463e089-950b-465d-82b7-6da04a07b444', '553374b4-6da1-4a64-81a1-93a717660412', 88, '''Slenderness ratio'' of a structural column significantly affects its:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3975256e-fff2-4d98-a018-88692ce702c1', '1463e089-950b-465d-82b7-6da04a07b444', 0, 'Color and surface finish only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d366bac4-142a-4b8c-a432-44deb74c13ae', '1463e089-950b-465d-82b7-6da04a07b444', 1, 'Buckling behavior — a higher slenderness ratio (relatively long, thin column) makes the column more susceptible to buckling failure at lower loads');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12d85126-add7-42e5-9132-518701ecd217', '1463e089-950b-465d-82b7-6da04a07b444', 2, 'Fire resistance rating exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('158ed84a-b408-4165-94cd-66860abd5158', '1463e089-950b-465d-82b7-6da04a07b444', 3, 'Construction cost only, with no structural implication');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1463e089-950b-465d-82b7-6da04a07b444', 'd366bac4-142a-4b8c-a432-44deb74c13ae', 'Slenderness ratio (effective length divided by the radius of gyration of the cross-section) directly determines a column''s buckling susceptibility — a higher slenderness ratio (a relatively long, thin column) is significantly more prone to elastic buckling failure at lower axial loads compared to a stockier column with a lower slenderness ratio.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b7ed819f-515d-4843-a7ce-a174380fdbfe', '553374b4-6da1-4a64-81a1-93a717660412', 89, '''Working stress method'' of structural design, an older approach largely superseded by limit state design in most modern codes, is based on:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b509ff9-d540-4c1c-a31e-d4368a0fc993', 'b7ed819f-515d-4843-a7ce-a174380fdbfe', 0, 'Designing structures such that stresses under service loads remain within a permissible (allowable) fraction of the material''s yield or ultimate strength');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20859092-5119-43d8-9afa-480da49f0e8f', 'b7ed819f-515d-4843-a7ce-a174380fdbfe', 1, 'Designing structures to fail immediately under any load');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('14d215c2-b5db-466c-b521-0b0d55d4f145', 'b7ed819f-515d-4843-a7ce-a174380fdbfe', 2, 'Ignoring material strength entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc29f42d-94d4-450b-84f9-f997a8d2c98f', 'b7ed819f-515d-4843-a7ce-a174380fdbfe', 3, 'Using only empirical rules with no calculation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b7ed819f-515d-4843-a7ce-a174380fdbfe', '7b509ff9-d540-4c1c-a31e-d4368a0fc993', 'The working stress method designs structural members such that calculated stresses under actual service loads remain within a permissible (allowable) fraction of the material''s yield or ultimate strength (incorporating a factor of safety) — this approach has been largely superseded in most modern design codes by limit state design, which more explicitly and separately addresses ultimate strength and serviceability considerations.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a4a1aebb-2805-433e-b5d1-fd48bbfb6ef8', '553374b4-6da1-4a64-81a1-93a717660412', 90, '''Doubly reinforced'' concrete beams (with reinforcement in both the tension and compression zones) are typically used when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('894f5cf3-6117-4300-89b8-bf9ff942efb4', 'a4a1aebb-2805-433e-b5d1-fd48bbfb6ef8', 0, 'The beam''s cross-sectional dimensions are restricted (architecturally or otherwise), requiring additional compression reinforcement to increase moment capacity beyond what a singly-reinforced section of the same size could achieve');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a89a7e7-5baa-4cdd-99de-d16a19479e7a', 'a4a1aebb-2805-433e-b5d1-fd48bbfb6ef8', 1, 'No tension reinforcement is needed at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b8e3b8a-2978-42ba-ab0b-3bb290ea0ead', 'a4a1aebb-2805-433e-b5d1-fd48bbfb6ef8', 2, 'The beam carries no load whatsoever');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43eb0741-310d-4f45-a450-836ee671ab0a', 'a4a1aebb-2805-433e-b5d1-fd48bbfb6ef8', 3, 'The concrete has zero compressive strength');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a4a1aebb-2805-433e-b5d1-fd48bbfb6ef8', '894f5cf3-6117-4300-89b8-bf9ff942efb4', 'Doubly reinforced beams (with steel in both tension and compression zones) are typically used when architectural or other constraints limit the beam''s cross-sectional dimensions, and additional compression reinforcement is needed to increase the beam''s moment-carrying capacity beyond what a singly-reinforced section of the same restricted size could otherwise achieve.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9dda0fbf-7d66-4f11-a112-5294bbebe023', '553374b4-6da1-4a64-81a1-93a717660412', 91, '''Bearing capacity'' of soil, a critical parameter in foundation design, refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de8ba406-018d-4b91-9a66-4c7de3a6d6d7', '9dda0fbf-7d66-4f11-a112-5294bbebe023', 0, 'The soil''s color classification');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7a23a8f-9110-41e5-888b-522a513a40e3', '9dda0fbf-7d66-4f11-a112-5294bbebe023', 1, 'The maximum load per unit area that the soil can safely support without excessive settlement or shear failure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc0e0092-403e-47dc-93fb-41f5bad7e25e', '9dda0fbf-7d66-4f11-a112-5294bbebe023', 2, 'The soil''s water content only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('570f312a-19b3-4799-a97d-24e85a88fe36', '9dda0fbf-7d66-4f11-a112-5294bbebe023', 3, 'The depth to groundwater table');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9dda0fbf-7d66-4f11-a112-5294bbebe023', 'e7a23a8f-9110-41e5-888b-522a513a40e3', 'Bearing capacity is the maximum load per unit area a soil can safely support beneath a foundation without experiencing shear failure or excessive settlement — a fundamental parameter directly governing foundation sizing and design.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ecb4fdc3-6756-41c5-8be6-b1f4d20f0ec4', '553374b4-6da1-4a64-81a1-93a717660412', 92, '''Settlement'' of a foundation refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b45f798-3501-4189-aecb-5060e049cbfb', 'ecb4fdc3-6756-41c5-8be6-b1f4d20f0ec4', 0, 'The foundation''s initial construction cost');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd674214-9b7c-48ac-af69-652ebb50213e', 'ecb4fdc3-6756-41c5-8be6-b1f4d20f0ec4', 1, 'The vertical downward movement of a foundation (and the structure it supports) due to compression/consolidation of the underlying soil under applied load');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bace27d7-4cbb-4af4-afe9-e0682bf1740d', 'ecb4fdc3-6756-41c5-8be6-b1f4d20f0ec4', 2, 'The lateral (horizontal) movement of a foundation only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('11efeb99-a21c-47db-8779-e010c8564baf', 'ecb4fdc3-6756-41c5-8be6-b1f4d20f0ec4', 3, 'A construction defect that never actually occurs in practice');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ecb4fdc3-6756-41c5-8be6-b1f4d20f0ec4', 'dd674214-9b7c-48ac-af69-652ebb50213e', 'Settlement is the vertical downward movement of a foundation resulting from compression or consolidation of the soil beneath it under the applied structural load — some settlement is normal and expected, but excessive or differential (uneven) settlement can cause structural damage, making settlement analysis a critical part of foundation design.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('94943f36-5fa0-49b5-b6b3-832c3d82b331', '553374b4-6da1-4a64-81a1-93a717660412', 93, '''Consolidation'' of soil, particularly significant in clay soils, refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('048da51b-56bf-4318-98a1-7e3e248f03ce', '94943f36-5fa0-49b5-b6b3-832c3d82b331', 0, 'The instantaneous, immediate compression of soil upon load application');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec8ecba2-f1ab-4274-ae40-5b8786f777a9', '94943f36-5fa0-49b5-b6b3-832c3d82b331', 1, 'The gradual, time-dependent reduction in soil volume due to the slow expulsion of pore water under sustained load, particularly significant in low-permeability clay soils');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfbc8cdc-b6cb-4e77-a601-bffda4afbc3b', '94943f36-5fa0-49b5-b6b3-832c3d82b331', 2, 'The chemical hardening of soil particles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a943487-9ddd-472c-84c5-bca3dcc7b025', '94943f36-5fa0-49b5-b6b3-832c3d82b331', 3, 'A process that occurs only in sandy soils');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('94943f36-5fa0-49b5-b6b3-832c3d82b331', 'ec8ecba2-f1ab-4274-ae40-5b8786f777a9', 'Consolidation is the gradual, time-dependent process by which saturated soil (particularly clay, due to its low permeability) reduces in volume as pore water is slowly squeezed out under sustained applied load — this time-dependent behavior, governed by Terzaghi''s consolidation theory, is why clay soils can continue settling for months or years after a structure is built.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7f69b37f-1366-4cf2-a3c8-b54d526cc97f', '553374b4-6da1-4a64-81a1-93a717660412', 94, 'The ''angle of internal friction'', a key soil shear strength parameter, is primarily associated with:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b23403b0-fc41-4c82-9aea-26c1f2bc33d1', '7f69b37f-1366-4cf2-a3c8-b54d526cc97f', 0, 'Cohesive strength in pure clay soils only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ca917ea-d953-4886-9545-4fb4d585dde3', '7f69b37f-1366-4cf2-a3c8-b54d526cc97f', 1, 'Frictional resistance between soil particles, particularly significant in granular (cohesionless) soils like sand and gravel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58d0ec14-d991-465b-88a8-a4c3fd98250b', '7f69b37f-1366-4cf2-a3c8-b54d526cc97f', 2, 'The soil''s color');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ca2cca2-ffb0-49b4-ad00-b7f7f4ecc39a', '7f69b37f-1366-4cf2-a3c8-b54d526cc97f', 3, 'The construction equipment used on site');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7f69b37f-1366-4cf2-a3c8-b54d526cc97f', '8ca917ea-d953-4886-9545-4fb4d585dde3', 'The angle of internal friction represents the frictional resistance to sliding between soil particles, and is a primary contributor to shear strength in granular (cohesionless) soils like sand and gravel — cohesive soils (like clay) derive shear strength primarily from particle-to-particle cohesion instead, though many real soils exhibit a combination of both (c-φ soils).', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a15826a8-087c-4d5f-a11c-3e9f38a9b091', '553374b4-6da1-4a64-81a1-93a717660412', 95, '''Cohesion'' as a soil shear strength parameter is primarily significant in:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b521222d-b7d9-4c7a-9260-b1623a2b6e90', 'a15826a8-087c-4d5f-a11c-3e9f38a9b091', 0, 'Cohesionless granular soils like clean sand');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('61b5d533-61fa-48a5-bbeb-aed7a5ed7d8a', 'a15826a8-087c-4d5f-a11c-3e9f38a9b091', 1, 'Cohesive fine-grained soils like clay, where particle-to-particle attraction contributes significant shear strength independent of applied normal stress');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('403f5ff5-9a2c-423f-bef1-5f5487498c3c', 'a15826a8-087c-4d5f-a11c-3e9f38a9b091', 2, 'Only rock formations, never soil');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49d57383-2678-4835-bf11-4b15c144ea3a', 'a15826a8-087c-4d5f-a11c-3e9f38a9b091', 3, 'Water bodies exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a15826a8-087c-4d5f-a11c-3e9f38a9b091', '61b5d533-61fa-48a5-bbeb-aed7a5ed7d8a', 'Cohesion represents shear strength derived from particle-to-particle attraction/bonding, independent of applied normal stress — this is particularly significant in fine-grained cohesive soils like clay, distinguishing their behavior from cohesionless granular soils (like clean sand), whose shear strength depends almost entirely on frictional resistance proportional to applied normal stress.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2388bf94-ed33-467f-a5c0-cda6329ed8e0', '553374b4-6da1-4a64-81a1-93a717660412', 96, 'A ''pile foundation'' is typically used when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6344a29d-d089-404c-b6a2-8f1b1ee2c880', '2388bf94-ed33-467f-a5c0-cda6329ed8e0', 0, 'Shallow soil layers have adequate bearing capacity for a simple shallow (spread) footing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ac2ce08-ef30-40af-a2bd-1790dd876dc0', '2388bf94-ed33-467f-a5c0-cda6329ed8e0', 1, 'Surface/shallow soil layers have inadequate bearing capacity, requiring load transfer to deeper, more competent soil or rock strata');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f83cb526-727e-4b0b-b9d7-ba1b295bac6e', '2388bf94-ed33-467f-a5c0-cda6329ed8e0', 2, 'The structure has no significant load to support');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc93bf02-4c33-4ad8-97c7-303970acf151', '2388bf94-ed33-467f-a5c0-cda6329ed8e0', 3, 'Cost is not a consideration and the simplest possible foundation is always preferred regardless of soil conditions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2388bf94-ed33-467f-a5c0-cda6329ed8e0', '0ac2ce08-ef30-40af-a2bd-1790dd876dc0', 'Pile foundations are typically used when shallow surface soil layers have inadequate bearing capacity or are prone to excessive settlement — piles transfer structural loads down to deeper, more competent soil or rock strata (end-bearing piles) or develop capacity through friction along the pile''s length in the surrounding soil (friction piles), or often a combination of both.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f5d2336a-7e58-489f-94d4-0cc6ed71d7f1', '553374b4-6da1-4a64-81a1-93a717660412', 97, '''Standard Penetration Test'' (SPT), a widely used in-situ soil investigation test, measures:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2c0fd53-e887-4cbc-aa70-815738ee1d36', 'f5d2336a-7e58-489f-94d4-0cc6ed71d7f1', 0, 'The soil''s exact chemical composition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dff0e608-3392-4d7d-b30f-50cc045c1de4', 'f5d2336a-7e58-489f-94d4-0cc6ed71d7f1', 1, 'The number of hammer blows required to drive a standard sampler a specified depth into the soil, providing an indirect measure of soil density/strength');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da3faef7-8f08-4d8d-a7eb-9edb155b57a0', 'f5d2336a-7e58-489f-94d4-0cc6ed71d7f1', 2, 'Only the groundwater table depth, with no other measurement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27249ef4-419a-44f4-a61c-eb0777578651', 'f5d2336a-7e58-489f-94d4-0cc6ed71d7f1', 3, 'The soil''s exact color using a standardized chart, with no other data collected');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f5d2336a-7e58-489f-94d4-0cc6ed71d7f1', 'dff0e608-3392-4d7d-b30f-50cc045c1de4', 'The Standard Penetration Test measures the number of blows (N-value) required to drive a standard split-spoon sampler a specified depth into the ground using a standardized hammer weight and drop height — this N-value serves as an indirect but widely-used indicator of soil density and relative strength, correlated empirically to various soil engineering properties.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4178a77d-3126-42b7-8386-9178b14b8cc0', '553374b4-6da1-4a64-81a1-93a717660412', 98, '''Liquefaction'', a significant geotechnical hazard particularly relevant during earthquakes, occurs when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('319f29cc-b385-42f9-a0ee-6ab50d9f3801', '4178a77d-3126-42b7-8386-9178b14b8cc0', 0, 'Dry soil becomes even drier under vibration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01c04fc4-c5fc-4bb1-96ab-edee35b1689a', '4178a77d-3126-42b7-8386-9178b14b8cc0', 1, 'Saturated, loose, cohesionless soil (typically sand) temporarily loses shear strength and behaves like a liquid, due to a sudden increase in pore water pressure caused by cyclic loading (like seismic shaking)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3dcf12a8-6f96-471c-a8f4-51db835779c5', '4178a77d-3126-42b7-8386-9178b14b8cc0', 2, 'Clay soil becomes stronger under vibration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0817dcc-b4b9-4d53-b2be-47f55d898804', '4178a77d-3126-42b7-8386-9178b14b8cc0', 3, 'Rock formations melt due to heat');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4178a77d-3126-42b7-8386-9178b14b8cc0', '01c04fc4-c5fc-4bb1-96ab-edee35b1689a', 'Liquefaction occurs when saturated, loose, cohesionless soil (typically fine sand) experiences a sudden, significant increase in pore water pressure due to cyclic loading (most commonly earthquake shaking), causing the soil to temporarily lose its shear strength and behave like a liquid — a major cause of foundation failure and structural damage during major earthquakes.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('dd9c5929-7e93-4019-b626-c9f00a8e09dc', '553374b4-6da1-4a64-81a1-93a717660412', 99, '''Permeability'' of soil, relevant to seepage and drainage analysis, refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6cb514a1-6cef-4e80-89a0-c0d5775d9979', 'dd9c5929-7e93-4019-b626-c9f00a8e09dc', 0, 'The soil''s color intensity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ad4adff-e828-471a-9b56-f31e23110e37', 'dd9c5929-7e93-4019-b626-c9f00a8e09dc', 1, 'The soil''s capacity to allow water (or other fluids) to flow through its pore spaces');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('078a3263-3d62-4b4b-b662-14bfac593ef5', 'dd9c5929-7e93-4019-b626-c9f00a8e09dc', 2, 'The soil''s exact mineral composition only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b58e8a00-54cc-4c53-ac32-159ddb42596c', 'dd9c5929-7e93-4019-b626-c9f00a8e09dc', 3, 'The soil''s temperature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dd9c5929-7e93-4019-b626-c9f00a8e09dc', '5ad4adff-e828-471a-9b56-f31e23110e37', 'Permeability quantifies a soil''s capacity to allow fluid (typically water) to flow through its interconnected pore spaces — coarse-grained soils (like gravel and sand) generally have high permeability, while fine-grained soils (like clay) generally have very low permeability, a critical parameter in seepage, drainage, and consolidation-rate analysis.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('668a65ba-c11d-4828-a1c5-6fe3d86c2ec8', '553374b4-6da1-4a64-81a1-93a717660412', 100, 'A ''retaining wall'' is designed primarily to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f44139d2-c02e-4e5f-8827-249084a7c8c3', '668a65ba-c11d-4828-a1c5-6fe3d86c2ec8', 0, 'Support a structure''s roof');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7cd13228-f515-4428-8ac7-e0049ea98180', '668a65ba-c11d-4828-a1c5-6fe3d86c2ec8', 1, 'Resist lateral earth pressure, retaining soil at a different elevation than the adjacent ground, preventing it from sliding or collapsing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f9f6611-d5cb-4a4e-ab0a-b0c40b98330a', '668a65ba-c11d-4828-a1c5-6fe3d86c2ec8', 2, 'Generate electrical power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e390c97-9b6f-4ce5-b633-70debbd02eb6', '668a65ba-c11d-4828-a1c5-6fe3d86c2ec8', 3, 'Purify groundwater');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('668a65ba-c11d-4828-a1c5-6fe3d86c2ec8', '7cd13228-f515-4428-8ac7-e0049ea98180', 'A retaining wall is designed to resist the lateral pressure exerted by retained soil, holding back earth at a different elevation than the adjacent grade and preventing it from sliding, slumping, or collapsing — a common structure in highway embankments, basement walls, and terraced landscapes.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('12044ded-4669-4094-8ed5-c3ccd26abcda', '553374b4-6da1-4a64-81a1-93a717660412', 101, '''Active earth pressure'' and ''passive earth pressure'', both relevant to retaining wall design, differ in that active pressure occurs when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc9bb2c3-d315-48b7-aa03-bc2d3109ea3a', '12044ded-4669-4094-8ed5-c3ccd26abcda', 0, 'The retaining wall moves toward the soil, compressing it');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34ff97c9-9283-4a8d-924f-2f5bfa86cf79', '12044ded-4669-4094-8ed5-c3ccd26abcda', 1, 'The retaining wall moves away from the retained soil, allowing it to expand slightly and mobilize its minimum lateral pressure state');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47fb0886-31e3-4f93-bf5e-9d3ec8d0ffcb', '12044ded-4669-4094-8ed5-c3ccd26abcda', 2, 'No movement of the wall occurs at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebf68392-208d-4521-b6d8-b515c17fc9dd', '12044ded-4669-4094-8ed5-c3ccd26abcda', 3, 'The soil is completely dry with no moisture content');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('12044ded-4669-4094-8ed5-c3ccd26abcda', '34ff97c9-9283-4a8d-924f-2f5bfa86cf79', 'Active earth pressure develops when a retaining wall moves (or tends to move) away from the retained soil, allowing the soil to expand slightly and reach its minimum lateral pressure state; passive earth pressure, by contrast, develops when the wall moves toward the soil, compressing it and mobilizing a much higher resisting pressure — this distinction is fundamental to retaining wall design.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c56403cf-e60c-43f5-b893-4cd03f81c0bc', '553374b4-6da1-4a64-81a1-93a717660412', 102, '''Compaction'' of soil during earthwork construction is performed primarily to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ef81991-a07d-4d29-94c4-c3d082110606', 'c56403cf-e60c-43f5-b893-4cd03f81c0bc', 0, 'Increase the soil''s water content permanently');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce1e3b93-7788-4a57-9d53-e61e03cc8ac6', 'c56403cf-e60c-43f5-b893-4cd03f81c0bc', 1, 'Increase the soil''s density by reducing air voids, thereby improving its strength, reducing compressibility, and reducing permeability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('074914ca-e94b-4ba0-a6c8-95657fb94831', 'c56403cf-e60c-43f5-b893-4cd03f81c0bc', 2, 'Decrease the soil''s overall strength deliberately');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15e0305c-8af6-4adb-8fc1-9c7a7f8fbd5b', 'c56403cf-e60c-43f5-b893-4cd03f81c0bc', 3, 'Add organic material to the soil');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c56403cf-e60c-43f5-b893-4cd03f81c0bc', 'ce1e3b93-7788-4a57-9d53-e61e03cc8ac6', 'Soil compaction (typically using mechanical rollers or tampers) increases soil density by expelling air from the void spaces between particles, without significantly changing the soil''s water content in the process — this improves the soil''s strength, reduces its compressibility (future settlement potential), and reduces its permeability, all desirable properties for engineered fill.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('09960501-41eb-4d25-b43e-fcb4a4bc67a8', '553374b4-6da1-4a64-81a1-93a717660412', 103, 'The ''Proctor compaction test'' is used to determine:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dcd86379-b953-44ce-9671-5846cbda98a9', '09960501-41eb-4d25-b43e-fcb4a4bc67a8', 0, 'The soil''s exact color under laboratory lighting');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1df8769-1fad-41e6-a1a5-06ec1896bd48', '09960501-41eb-4d25-b43e-fcb4a4bc67a8', 1, 'The relationship between a soil''s moisture content and its dry density under a standard compactive effort, identifying the ''optimum moisture content'' for maximum achievable dry density');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfcad910-79e3-445d-81d1-338db8af0ea3', '09960501-41eb-4d25-b43e-fcb4a4bc67a8', 2, 'Only the soil''s permeability, with no relation to compaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('def2f7e1-f450-4f6f-98dc-f60cf05aba90', '09960501-41eb-4d25-b43e-fcb4a4bc67a8', 3, 'The soil''s bearing capacity directly, with no reference to moisture content');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('09960501-41eb-4d25-b43e-fcb4a4bc67a8', 'f1df8769-1fad-41e6-a1a5-06ec1896bd48', 'The Proctor compaction test determines the relationship between a soil''s moisture content and the dry density achieved under a standardized compactive effort — this identifies the soil''s ''optimum moisture content'', the water content at which maximum dry density (and generally best engineering properties) is achieved for that specific compactive effort, a key reference for field compaction quality control.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d0f29010-298c-4c63-affe-230e69489cfe', '553374b4-6da1-4a64-81a1-93a717660412', 104, 'A ''shallow foundation'' (like an isolated or combined spread footing), as distinct from a deep foundation, is generally used when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b806519c-b3c0-4398-ada5-6696f0b3b819', 'd0f29010-298c-4c63-affe-230e69489cfe', 0, 'The bearing soil at a relatively shallow depth has adequate capacity to support the structural loads without excessive settlement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec26f8b7-be99-4148-886e-b2219c0a8413', 'd0f29010-298c-4c63-affe-230e69489cfe', 1, 'Only when the structure has zero load to transfer to the ground');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4b3ce51-b4ee-4b59-a2ea-63d887e40e5b', 'd0f29010-298c-4c63-affe-230e69489cfe', 2, 'Only for underwater construction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('996060f8-d69c-48a4-ab26-5fb02403e65c', 'd0f29010-298c-4c63-affe-230e69489cfe', 3, 'Only when deep foundations are unavailable due to equipment shortage, regardless of soil conditions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d0f29010-298c-4c63-affe-230e69489cfe', 'b806519c-b3c0-4398-ada5-6696f0b3b819', 'Shallow foundations (spread footings, mat/raft foundations) are used when soil at a relatively shallow depth beneath the structure has adequate bearing capacity to support the applied loads without excessive settlement, avoiding the greater cost and complexity of deep foundations (like piles) that transfer load to much deeper, more competent strata.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f6c7e437-5cb1-4cc5-ba7d-e84efd11c1cd', '553374b4-6da1-4a64-81a1-93a717660412', 105, '''Differential settlement'' between different parts of a structure''s foundation is a particular concern because it can cause:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f55d1f90-939e-414b-b538-01c00b1cd49f', 'f6c7e437-5cb1-4cc5-ba7d-e84efd11c1cd', 0, 'No structural consequence whatsoever, since all settlement is identical everywhere');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c53f4ff0-0c03-4a18-bacf-53f80ee43bc9', 'f6c7e437-5cb1-4cc5-ba7d-e84efd11c1cd', 1, 'Structural distress — cracking, tilting, or damage — since different parts of the structure settle unevenly, inducing additional stresses the structure wasn''t necessarily designed to accommodate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a44b6a10-2ea7-424b-b2f4-76d93ca6fe99', 'f6c7e437-5cb1-4cc5-ba7d-e84efd11c1cd', 2, 'Only cosmetic issues with the exterior paint');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a657e4c7-58cb-4fce-8332-28ab9490911e', 'f6c7e437-5cb1-4cc5-ba7d-e84efd11c1cd', 3, 'Improved structural performance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f6c7e437-5cb1-4cc5-ba7d-e84efd11c1cd', 'c53f4ff0-0c03-4a18-bacf-53f80ee43bc9', 'Differential settlement — uneven settlement between different foundation points or parts of a structure — is generally of much greater concern than uniform total settlement, since it induces additional internal stresses and distortions (cracking, tilting, jamming of doors/windows) that the structure may not have been explicitly designed to accommodate, even if the absolute magnitude of settlement seems modest.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f63d90f4-c196-40b2-87f8-3bc8e393c741', '553374b4-6da1-4a64-81a1-93a717660412', 106, 'Bernoulli''s equation, applied to open channel or pipe flow in civil engineering, is fundamentally a statement of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c09fe71-90d3-43af-8c62-d90877b5f46e', 'f63d90f4-c196-40b2-87f8-3bc8e393c741', 0, 'Conservation of mass only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e81e78b1-968e-403e-a4e5-79e46e885637', 'f63d90f4-c196-40b2-87f8-3bc8e393c741', 1, 'Conservation of energy along a streamline, for an ideal, incompressible, steady flow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1375087-7b79-4230-b1b9-f5a47a08fad3', 'f63d90f4-c196-40b2-87f8-3bc8e393c741', 2, 'Conservation of electric charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c02ec79f-f6fe-4149-9110-ae68e66a513d', 'f63d90f4-c196-40b2-87f8-3bc8e393c741', 3, 'Conservation of momentum only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f63d90f4-c196-40b2-87f8-3bc8e393c741', 'e81e78b1-968e-403e-a4e5-79e46e885637', 'Bernoulli''s equation represents the conservation of mechanical energy (pressure, kinetic, and potential/elevation energy) along a streamline for an ideal (inviscid), incompressible, steady flow — widely applied in civil engineering hydraulics for pipe flow, open channel flow, and flow measurement device design.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a07ab1c1-82f7-4210-b461-31d66bd91dd3', '553374b4-6da1-4a64-81a1-93a717660412', 107, 'The ''continuity equation'' in fluid mechanics, for steady, incompressible flow, states that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e51a1b7d-9caf-423e-b2f0-d8b28e4283e4', 'a07ab1c1-82f7-4210-b461-31d66bd91dd3', 0, 'Pressure is constant throughout the entire flow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9878dfd-a2cc-45ef-a3b4-48bb78a3eebc', 'a07ab1c1-82f7-4210-b461-31d66bd91dd3', 1, 'The volumetric flow rate (A×V) remains constant at every cross-section along the flow path');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da56976a-861a-45a2-8cd4-ad9b7624e1d5', 'a07ab1c1-82f7-4210-b461-31d66bd91dd3', 2, 'Velocity is identical at every cross-section regardless of area change');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7874d26f-fc66-4baa-866a-41982f0845d5', 'a07ab1c1-82f7-4210-b461-31d66bd91dd3', 3, 'Density varies significantly along the flow path');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a07ab1c1-82f7-4210-b461-31d66bd91dd3', 'e9878dfd-a2cc-45ef-a3b4-48bb78a3eebc', 'The continuity equation for steady, incompressible flow states that A₁V₁ = A₂V₂ (the product of cross-sectional area and velocity is conserved) — as flow area decreases, velocity must increase proportionally, and vice versa, to maintain a constant volumetric flow rate.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cc14007a-4de5-4a3f-9d04-54ca0be3bf39', '553374b4-6da1-4a64-81a1-93a717660412', 108, 'A ''weir'', a hydraulic structure commonly used in open channels, is primarily used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('325945e6-6129-44a7-9811-150bb8328275', 'cc14007a-4de5-4a3f-9d04-54ca0be3bf39', 0, 'Purify water chemically');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('332eaeb3-89fc-4a89-9d9f-d9c2a92ca326', 'cc14007a-4de5-4a3f-9d04-54ca0be3bf39', 1, 'Measure flow rate and/or control upstream water level, by creating a controlled overflow condition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf1d745a-e109-4e75-9c0d-c1ccffb6268c', 'cc14007a-4de5-4a3f-9d04-54ca0be3bf39', 2, 'Generate electrical power exclusively, with no other function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fac19bba-4bc9-4336-8322-1665521784a3', 'cc14007a-4de5-4a3f-9d04-54ca0be3bf39', 3, 'Store groundwater permanently');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cc14007a-4de5-4a3f-9d04-54ca0be3bf39', '332eaeb3-89fc-4a89-9d9f-d9c2a92ca326', 'A weir is a structure placed across an open channel, over which water flows — it is commonly used both to measure discharge (flow rate) using established weir flow formulas, and to control/raise the upstream water level for irrigation diversion or other purposes.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3e9ced4a-bed6-43cd-9b37-06338e1ee38f', '553374b4-6da1-4a64-81a1-93a717660412', 109, 'The ''hydraulic gradient'' in pipe flow analysis represents:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8bc9e2f9-6ae2-4de3-aa6f-8353a895ebe7', '3e9ced4a-bed6-43cd-9b37-06338e1ee38f', 0, 'The pipe''s physical diameter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b4c9726-0711-44b9-af92-d0d42891b3b1', '3e9ced4a-bed6-43cd-9b37-06338e1ee38f', 1, 'The rate of head loss (energy loss) per unit length along the flow direction, due to friction and other losses');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1972eeda-7db1-4085-838c-93c619be245c', '3e9ced4a-bed6-43cd-9b37-06338e1ee38f', 2, 'The pipe material''s roughness coefficient directly, with no relation to head loss');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1b90038-915d-456e-b435-f74e59c0b90c', '3e9ced4a-bed6-43cd-9b37-06338e1ee38f', 3, 'The flow''s exact temperature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3e9ced4a-bed6-43cd-9b37-06338e1ee38f', '7b4c9726-0711-44b9-af92-d0d42891b3b1', 'The hydraulic gradient represents the slope of the hydraulic grade line — the rate of head (energy) loss per unit length of pipe along the flow direction, primarily due to friction — a fundamental concept in analyzing pressure and energy losses in pipe flow systems.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e226ce45-9a16-4dc6-9812-716b4cd5273d', '553374b4-6da1-4a64-81a1-93a717660412', 110, '''Manning''s equation'', widely used in open channel flow analysis, relates flow velocity to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0fc308c-7814-4d93-8de3-8a8f8f1ff9c2', 'e226ce45-9a16-4dc6-9812-716b4cd5273d', 0, 'Only the channel''s color');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bed40016-92c2-41fb-bdf9-c2dc56955e20', 'e226ce45-9a16-4dc6-9812-716b4cd5273d', 1, 'The channel''s hydraulic radius, slope, and a roughness coefficient (Manning''s n) reflecting the channel surface''s resistance to flow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c072ca6-89a8-4b9a-adb4-d164c9be8934', 'e226ce45-9a16-4dc6-9812-716b4cd5273d', 2, 'Only the water''s temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6dd7d9d4-84da-4d58-8791-e2f472c1e7e0', 'e226ce45-9a16-4dc6-9812-716b4cd5273d', 3, 'Only the channel''s total length, with no other parameters');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e226ce45-9a16-4dc6-9812-716b4cd5273d', 'bed40016-92c2-41fb-bdf9-c2dc56955e20', 'Manning''s equation relates open channel flow velocity to the channel''s hydraulic radius (cross-sectional area divided by wetted perimeter), the channel bed slope, and Manning''s roughness coefficient (n), which reflects the resistance to flow from the channel surface''s texture — a foundational empirical formula for open channel hydraulics design.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('56db66d3-9825-47b4-87d5-dc4255031b99', '553374b4-6da1-4a64-81a1-93a717660412', 111, '''Hydrology'', as a discipline within civil engineering, is primarily concerned with the study of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05f6aca8-6242-4718-ad90-787a6f126425', '56db66d3-9825-47b4-87d5-dc4255031b99', 0, 'Structural steel design');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd9c086c-8046-4871-ac32-78439611cfe2', '56db66d3-9825-47b4-87d5-dc4255031b99', 1, 'The occurrence, distribution, movement, and properties of water in the Earth''s atmosphere, surface, and subsurface, including the water cycle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58ef3d70-a3a9-4a4c-9aba-8336584f0311', '56db66d3-9825-47b4-87d5-dc4255031b99', 2, 'Reinforced concrete mix design exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4047c520-a781-4a1f-b415-6dd2ea75506b', '56db66d3-9825-47b4-87d5-dc4255031b99', 3, 'Traffic signal timing');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('56db66d3-9825-47b4-87d5-dc4255031b99', 'fd9c086c-8046-4871-ac32-78439611cfe2', 'Hydrology studies the occurrence, distribution, movement, and properties of water throughout the Earth''s atmosphere, surface (rivers, lakes), and subsurface (groundwater), encompassing the entire water cycle — directly informing civil engineering design for water resources, drainage, flood control, and water supply infrastructure.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ebd4e585-753d-4ee9-83e9-e51df781db28', '553374b4-6da1-4a64-81a1-93a717660412', 112, 'The ''rational method'', a commonly used approach for estimating peak runoff from a small watershed for drainage design, calculates peak flow as a function of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('194441d4-4e20-484c-a8d8-608b480f4eac', 'ebd4e585-753d-4ee9-83e9-e51df781db28', 0, 'Only the watershed''s soil color');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('607aedf1-42f7-4a92-964a-0d9e518e19bf', 'ebd4e585-753d-4ee9-83e9-e51df781db28', 1, 'Rainfall intensity, watershed area, and a runoff coefficient reflecting the watershed''s surface characteristics (imperviousness, slope, etc.)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbd76f27-dbb9-4ed7-a58f-c3896572d679', 'ebd4e585-753d-4ee9-83e9-e51df781db28', 2, 'Only the watershed''s elevation above sea level');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d11b04b-71af-450b-88e1-38240de7fa73', 'ebd4e585-753d-4ee9-83e9-e51df781db28', 3, 'Only the season of the year, with no other input');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ebd4e585-753d-4ee9-83e9-e51df781db28', '607aedf1-42f7-4a92-964a-0d9e518e19bf', 'The rational method (Q = CiA) estimates peak runoff as a function of a runoff coefficient (C, reflecting the watershed''s surface characteristics like imperviousness), rainfall intensity (i, for a specified duration and return period), and the watershed''s drainage area (A) — widely used for smaller drainage design applications, though with known limitations for larger, more complex watersheds.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('45062e71-6819-4129-8aa8-1c5a4c3b6690', '553374b4-6da1-4a64-81a1-93a717660412', 113, 'A ''hydrograph'', used in hydrological analysis, is a graphical representation of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cf3160f-0c4c-42a1-8098-855e46a6c934', '45062e71-6819-4129-8aa8-1c5a4c3b6690', 0, 'A river''s water quality parameters only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e99f07c-a3d5-4d84-8816-9f3fe4f7fb37', '45062e71-6819-4129-8aa8-1c5a4c3b6690', 1, 'Streamflow (discharge) at a specific point, plotted as a function of time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('798e9e87-329c-4486-aef5-92da62ee7707', '45062e71-6819-4129-8aa8-1c5a4c3b6690', 2, 'Only the geological composition of a river bed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c118123e-1509-4c42-8aab-bf28f4f79207', '45062e71-6819-4129-8aa8-1c5a4c3b6690', 3, 'Groundwater chemical composition');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('45062e71-6819-4129-8aa8-1c5a4c3b6690', '1e99f07c-a3d5-4d84-8816-9f3fe4f7fb37', 'A hydrograph plots streamflow discharge at a specific location as a function of time, commonly used to analyze a watershed''s response to a rainfall event (a ''unit hydrograph'' shows the runoff response to a unit depth of rainfall) — a fundamental tool in flood forecasting and drainage system design.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('81bea8b5-f217-46e9-b093-c023f94bcd5e', '553374b4-6da1-4a64-81a1-93a717660412', 114, '''Infiltration'', a key process in the hydrological cycle relevant to drainage and runoff calculations, refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f1d7dc4-caaa-4158-a6e3-131076a8de69', '81bea8b5-f217-46e9-b093-c023f94bcd5e', 0, 'Rainfall evaporating directly back into the atmosphere');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3f23d17-4d1c-4082-8c36-f2ae57c61e1e', '81bea8b5-f217-46e9-b093-c023f94bcd5e', 1, 'The process by which water on the ground surface enters and percolates into the soil');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c32594e8-a21f-48c8-9146-0dda927ea5cd', '81bea8b5-f217-46e9-b093-c023f94bcd5e', 2, 'Water flowing directly into a river channel without touching the ground');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b1be190-539f-4431-a9d3-5f6f5ace9b11', '81bea8b5-f217-46e9-b093-c023f94bcd5e', 3, 'The freezing of surface water');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('81bea8b5-f217-46e9-b093-c023f94bcd5e', 'a3f23d17-4d1c-4082-8c36-f2ae57c61e1e', 'Infiltration is the process by which surface water percolates into the underlying soil, replenishing soil moisture and (eventually) groundwater — the portion of rainfall that does NOT infiltrate becomes surface runoff, making infiltration rate a critical factor in estimating runoff for drainage system design.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8c3f7c37-d740-4504-9b53-79fe5dbb886f', '553374b4-6da1-4a64-81a1-93a717660412', 115, 'A ''flood frequency analysis'', used in hydraulic structure design (like bridges and spillways), estimates:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7dd494d2-7d3f-4620-a300-9203140d56df', '8c3f7c37-d740-4504-9b53-79fe5dbb886f', 0, 'The exact date of the next flood event with certainty');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3dc10b1e-7dbc-4782-a42b-de1d0375609b', '8c3f7c37-d740-4504-9b53-79fe5dbb886f', 1, 'The probability (or statistical return period) of a flood of a given magnitude occurring, used to establish appropriate design flood levels');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe1c1273-db65-4b5b-96be-1414cdcbc747', '8c3f7c37-d740-4504-9b53-79fe5dbb886f', 2, 'Only the color of floodwater');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07c83ac5-8512-4d20-b648-997a4f22c709', '8c3f7c37-d740-4504-9b53-79fe5dbb886f', 3, 'The construction cost of a flood control structure directly, with no reference to flood magnitude');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8c3f7c37-d740-4504-9b53-79fe5dbb886f', '3dc10b1e-7dbc-4782-a42b-de1d0375609b', 'Flood frequency analysis uses statistical methods applied to historical streamflow/rainfall data to estimate the probability (or ''return period'', e.g., a ''100-year flood'') of a flood event of a given magnitude occurring in any given year — this informs the appropriate design flood level for hydraulic structures like bridges, culverts, and spillways, balancing risk against construction cost.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a5a29951-1c53-441c-a432-8f8218a8759c', '553374b4-6da1-4a64-81a1-93a717660412', 116, '''Groundwater'' recharge occurs primarily through:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5e012a5-37ce-449b-a518-5e8717301271', 'a5a29951-1c53-441c-a432-8f8218a8759c', 0, 'Direct evaporation from the ocean surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33cac777-c61f-4a32-b98c-cdd767cda05f', 'a5a29951-1c53-441c-a432-8f8218a8759c', 1, 'Infiltration of surface water (rainfall, rivers, lakes) percolating down through the soil into underlying aquifers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a1bf88b-69e0-4da3-93a8-62d89024395a', 'a5a29951-1c53-441c-a432-8f8218a8759c', 2, 'Artificial pumping of water upward exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2b79916-b43b-4e31-b1e7-82d0b22e98c9', 'a5a29951-1c53-441c-a432-8f8218a8759c', 3, 'Condensation of atmospheric water vapor directly into rock formations');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a5a29951-1c53-441c-a432-8f8218a8759c', '33cac777-c61f-4a32-b98c-cdd767cda05f', 'Groundwater recharge occurs primarily through the infiltration and downward percolation of surface water (from rainfall, rivers, or other surface water bodies) through the soil and unsaturated zone into underlying water-bearing rock/soil formations (aquifers) — a critical process for sustaining groundwater resources.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4b0fc611-74d9-4e70-a67f-2375da3e3fc5', '553374b4-6da1-4a64-81a1-93a717660412', 117, 'A ''sewage treatment plant''s'' primary purpose is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6dc100fd-8819-494f-b57e-48488733c020', '4b0fc611-74d9-4e70-a67f-2375da3e3fc5', 0, 'Increase the pollutant concentration of wastewater before discharge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1c8acf2-c83e-423d-a2f8-748112fb5f63', '4b0fc611-74d9-4e70-a67f-2375da3e3fc5', 1, 'Treat and remove contaminants from wastewater before it is discharged into the environment or reused, protecting public health and water quality');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7dcf3387-e2ec-4f8d-9555-299f0754fd5c', '4b0fc611-74d9-4e70-a67f-2375da3e3fc5', 2, 'Generate drinking water directly from seawater exclusively (a distinct process, desalination)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2860fc8e-11fe-4cf7-b264-f95b5f47cb21', '4b0fc611-74d9-4e70-a67f-2375da3e3fc5', 3, 'Store untreated sewage indefinitely with no treatment');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4b0fc611-74d9-4e70-a67f-2375da3e3fc5', 'b1c8acf2-c83e-423d-a2f8-748112fb5f63', 'A sewage (wastewater) treatment plant treats and removes contaminants — organic matter, pathogens, nutrients, and other pollutants — from collected wastewater before it is discharged into the environment or, in some cases, reused, protecting public health and downstream water quality.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e3dc5521-e7ea-42df-8ded-9087e4eeff4d', '553374b4-6da1-4a64-81a1-93a717660412', 118, '''Cavitation'' in hydraulic machinery (like pumps and turbines) occurs when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0966256-3cd5-4978-b371-ff057c2b81ab', 'e3dc5521-e7ea-42df-8ded-9087e4eeff4d', 0, 'Water temperature rises significantly above boiling under normal atmospheric pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('950efc1e-eec1-4ad7-887a-dd384366b530', 'e3dc5521-e7ea-42df-8ded-9087e4eeff4d', 1, 'Local pressure in the flowing water drops below the water''s vapor pressure, causing vapor bubbles to form and then violently collapse, causing damage and noise');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('982c2385-7a4a-4692-b027-6bc752b6da67', 'e3dc5521-e7ea-42df-8ded-9087e4eeff4d', 2, 'The flow rate is extremely low with no velocity change');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc067c72-fe7a-49ff-ad9e-6c2cfb9ef06c', 'e3dc5521-e7ea-42df-8ded-9087e4eeff4d', 3, 'Only in completely dry pipe systems with no water present');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e3dc5521-e7ea-42df-8ded-9087e4eeff4d', '950efc1e-eec1-4ad7-887a-dd384366b530', 'Cavitation occurs when local pressure within flowing water drops below the water''s vapor pressure at the prevailing temperature, causing vapor bubbles to form; these bubbles then violently collapse upon reaching higher-pressure regions downstream, causing noise, vibration, and progressive erosion damage to hydraulic machinery like pump impellers and turbine blades.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d4b1a926-319d-4d95-8038-0bf738d784db', '553374b4-6da1-4a64-81a1-93a717660412', 119, 'The ''catchment area'' (or watershed/drainage basin) of a river refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d526a4c-5a00-4d60-b6ac-6ce4796f3012', 'd4b1a926-319d-4d95-8038-0bf738d784db', 0, 'Only the river''s immediate channel width');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dae6577d-eaa6-4699-b5d6-b060a93cfa40', 'd4b1a926-319d-4d95-8038-0bf738d784db', 1, 'The total land area from which surface runoff drains into that particular river or river system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ec1ef34-0e86-4cbe-8cc7-7ceaaba48e9b', 'd4b1a926-319d-4d95-8038-0bf738d784db', 2, 'Only the area directly downstream of a dam');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6dba0c30-829a-40e2-8115-1ac0a229fcf3', 'd4b1a926-319d-4d95-8038-0bf738d784db', 3, 'The area used exclusively for agricultural irrigation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d4b1a926-319d-4d95-8038-0bf738d784db', 'dae6577d-eaa6-4699-b5d6-b060a93cfa40', 'A catchment area (also called a watershed or drainage basin) is the total land area from which all surface runoff drains toward and eventually into a particular river, stream, or other water body — a fundamental unit of analysis in hydrology, flood estimation, and water resources planning.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c3e5a2e4-61c0-4544-9775-8efa3a52fa74', '553374b4-6da1-4a64-81a1-93a717660412', 120, '''Total dynamic head'' in pump system design refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8be69491-aa89-4de3-9b33-a9a2538a8eca', 'c3e5a2e4-61c0-4544-9775-8efa3a52fa74', 0, 'Only the pump''s physical weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4dd11f8-09e6-4a29-90bd-30ccaf6c366d', 'c3e5a2e4-61c0-4544-9775-8efa3a52fa74', 1, 'The total energy (expressed as an equivalent height of fluid column) a pump must supply, accounting for static lift, friction losses, and velocity head');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae743dd8-460d-4615-bb66-d14a5cb7b929', 'c3e5a2e4-61c0-4544-9775-8efa3a52fa74', 2, 'Only the pipe''s diameter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fba5703e-62a2-4ef8-b433-5cef1364c9cc', 'c3e5a2e4-61c0-4544-9775-8efa3a52fa74', 3, 'The pump''s electrical power rating directly, with no reference to hydraulic conditions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c3e5a2e4-61c0-4544-9775-8efa3a52fa74', 'e4dd11f8-09e6-4a29-90bd-30ccaf6c366d', 'Total dynamic head represents the total energy (expressed in an equivalent height of fluid column) a pump must overcome/supply — accounting for the static lift (elevation difference), friction losses through the piping system, and any velocity head requirement — a fundamental parameter for correctly sizing a pump for a given hydraulic application.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5710aaa4-4137-44c6-9298-0c9be04e81b3', '553374b4-6da1-4a64-81a1-93a717660412', 121, 'A ''total station'', a modern surveying instrument, combines the functions of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1fcce368-6620-4d97-8381-e7d46a2c0718', '5710aaa4-4137-44c6-9298-0c9be04e81b3', 0, 'A hammer and a chisel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16709969-c6a0-46dc-860b-d7d9a0c492f0', '5710aaa4-4137-44c6-9298-0c9be04e81b3', 1, 'An electronic theodolite (for angle measurement) and an electronic distance measurement (EDM) device, integrated into a single instrument');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0166884-0c5e-4307-a241-a712a3cec013', '5710aaa4-4137-44c6-9298-0c9be04e81b3', 2, 'Only a simple measuring tape, with no electronic component');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94eee434-41e0-4181-aba3-c7be4e5e9e4d', '5710aaa4-4137-44c6-9298-0c9be04e81b3', 3, 'A weather forecasting device');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5710aaa4-4137-44c6-9298-0c9be04e81b3', '16709969-c6a0-46dc-860b-d7d9a0c492f0', 'A total station integrates an electronic theodolite (for precise angular measurement) with an electronic distance measurement (EDM) device into a single instrument, allowing simultaneous, highly accurate measurement of both angles and distances — a standard modern replacement for older, separate surveying instruments.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('390519b5-d730-46d2-bec9-dbde403434b1', '553374b4-6da1-4a64-81a1-93a717660412', 122, '''Leveling'' in surveying refers to the process of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69b0d3b5-f243-450e-924b-53b691c72168', '390519b5-d730-46d2-bec9-dbde403434b1', 0, 'Measuring horizontal angles only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af552864-a744-4d7f-94f3-67ebdc423cf5', '390519b5-d730-46d2-bec9-dbde403434b1', 1, 'Determining the relative elevation (height) of different points on the Earth''s surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41b33b15-d8c1-416b-8afe-b99a1b2842fb', '390519b5-d730-46d2-bec9-dbde403434b1', 2, 'Measuring only horizontal distances, with no vertical component');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a98db54-dc75-41fd-b0f9-ab75ee1b24ad', '390519b5-d730-46d2-bec9-dbde403434b1', 3, 'Calculating land area exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('390519b5-d730-46d2-bec9-dbde403434b1', 'af552864-a744-4d7f-94f3-67ebdc423cf5', 'Leveling is the surveying process of determining the relative elevation of different points, typically referenced to a common datum (like mean sea level) — essential for establishing site grades, drainage design, and construction reference elevations.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('62c8869d-96be-4dbf-b05c-923421d7f78f', '553374b4-6da1-4a64-81a1-93a717660412', 123, 'A ''benchmark'' in surveying refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f91b7bb9-2307-4c39-8cff-e8f52aaf4ff8', '62c8869d-96be-4dbf-b05c-923421d7f78f', 0, 'The maximum load capacity of a structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4136f5f1-197c-43cc-950c-f9af6805cd39', '62c8869d-96be-4dbf-b05c-923421d7f78f', 1, 'A fixed reference point of known, precisely established elevation, used as a starting/reference point for leveling surveys');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a451ef4-7298-4eb6-b2a2-75fe0474d6aa', '62c8869d-96be-4dbf-b05c-923421d7f78f', 2, 'A type of surveying equipment brand name only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fecb808f-5b9c-4a7b-9951-edd7de0c85de', '62c8869d-96be-4dbf-b05c-923421d7f78f', 3, 'A temporary marker that changes value with each new survey');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('62c8869d-96be-4dbf-b05c-923421d7f78f', '4136f5f1-197c-43cc-950c-f9af6805cd39', 'A benchmark is a fixed, permanent reference point of precisely known and documented elevation, used as the starting or reference point for leveling surveys — allowing elevations of other points to be determined relative to this established, trusted reference.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('519b19b6-6a5a-43c7-80a9-fcb8a3cba915', '553374b4-6da1-4a64-81a1-93a717660412', 124, '''Contour lines'' on a topographic map represent:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36a400ba-cc97-42e7-8835-ea27ec65fc6d', '519b19b6-6a5a-43c7-80a9-fcb8a3cba915', 0, 'Property boundary lines exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a30c0ef4-3f8c-4373-ad9c-7cedefff7063', '519b19b6-6a5a-43c7-80a9-fcb8a3cba915', 1, 'Lines connecting points of equal elevation on the ground surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1581970-f160-4c0b-a1fb-08bb1702958f', '519b19b6-6a5a-43c7-80a9-fcb8a3cba915', 2, 'Only road networks');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('988025b2-b67b-4203-ae93-6e45d7f62f3c', '519b19b6-6a5a-43c7-80a9-fcb8a3cba915', 3, 'Underground utility locations');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('519b19b6-6a5a-43c7-80a9-fcb8a3cba915', 'a30c0ef4-3f8c-4373-ad9c-7cedefff7063', 'Contour lines connect points of equal elevation on a topographic map, providing a visual representation of the ground surface''s three-dimensional shape (terrain) on a two-dimensional map — closely spaced contour lines indicate steep terrain, while widely spaced lines indicate relatively flat terrain.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f3f65db1-ab4f-4a69-8e10-c69fbfba50d7', '553374b4-6da1-4a64-81a1-93a717660412', 125, 'GPS (Global Positioning System) surveying determines a point''s position by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2530d7cd-f5e3-4097-877f-21671c9b567c', 'f3f65db1-ab4f-4a69-8e10-c69fbfba50d7', 0, 'Measuring distances using a physical measuring tape only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab691662-670f-4c51-a81b-5617897e2499', 'f3f65db1-ab4f-4a69-8e10-c69fbfba50d7', 1, 'Receiving and processing signals from multiple orbiting satellites, calculating position via trilateration based on signal travel time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7cee5da4-52a9-4683-922a-0ec1ec051da3', 'f3f65db1-ab4f-4a69-8e10-c69fbfba50d7', 2, 'Using only a magnetic compass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b6b44de-962a-4b19-af0a-814ff3458ddd', 'f3f65db1-ab4f-4a69-8e10-c69fbfba50d7', 3, 'Visual estimation by the surveyor');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f3f65db1-ab4f-4a69-8e10-c69fbfba50d7', 'ab691662-670f-4c51-a81b-5617897e2499', 'GPS surveying determines position by receiving signals from multiple orbiting satellites simultaneously, and calculating the receiver''s precise position via trilateration based on the measured time delay (and hence distance) of signals from each satellite — modern differential/RTK GPS techniques achieve high positional accuracy for surveying applications.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('62f30b7a-0698-4d5f-849c-e1e20ba46f3b', '553374b4-6da1-4a64-81a1-93a717660412', 126, '''Traversing'', a common surveying technique, involves:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fdf47f92-60c1-4858-a507-1b85274a3431', '62f30b7a-0698-4d5f-849c-e1e20ba46f3b', 0, 'A single measurement at one fixed point only, with no connection to other points');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40dd4855-9836-4823-88d1-49db00b24f3c', '62f30b7a-0698-4d5f-849c-e1e20ba46f3b', 1, 'Establishing a series of connected survey lines (forming a traverse), measuring their lengths and the angles between them to determine the relative positions of survey points');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58f662d3-2e52-4566-87e1-66302de18201', '62f30b7a-0698-4d5f-849c-e1e20ba46f3b', 2, 'Measuring only vertical elevations, with no horizontal component');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('623b83d2-a5ca-4aa0-9d4e-cfcb1240780e', '62f30b7a-0698-4d5f-849c-e1e20ba46f3b', 3, 'Aerial photography exclusively, with no ground-based measurement');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('62f30b7a-0698-4d5f-849c-e1e20ba46f3b', '40dd4855-9836-4823-88d1-49db00b24f3c', 'Traversing establishes a series of connected straight survey lines, with their lengths and the angles between consecutive lines carefully measured — this allows the calculation of the relative (and, with appropriate reference, absolute) positions of a series of survey points across a site.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a728f6b8-56eb-471e-96dd-5dd00a93df23', '553374b4-6da1-4a64-81a1-93a717660412', 127, '''Chain surveying'' (or tape surveying), one of the simplest surveying methods, is primarily suited for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb66e468-9f91-48ec-9999-e38740d77e12', 'a728f6b8-56eb-471e-96dd-5dd00a93df23', 0, 'Large-scale national mapping projects requiring the highest possible precision');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3e377b5-e095-4ada-a366-58df22040bce', 'a728f6b8-56eb-471e-96dd-5dd00a93df23', 1, 'Small areas with relatively simple, open terrain, where distances can be directly and practically measured');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb2fe047-1fac-41f9-97dd-75f8ae2a6ef9', 'a728f6b8-56eb-471e-96dd-5dd00a93df23', 2, 'Underwater surveying exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01f78d1e-78e2-4d30-b510-dd6e2e75e497', 'a728f6b8-56eb-471e-96dd-5dd00a93df23', 3, 'Measuring only vertical heights, with no horizontal distance measurement');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a728f6b8-56eb-471e-96dd-5dd00a93df23', 'c3e377b5-e095-4ada-a366-58df22040bce', 'Chain (or tape) surveying, using a physical measuring chain or tape to directly measure distances, is best suited for small areas with relatively open, simple terrain — it becomes impractical for large areas, obstructed terrain, or projects demanding very high precision, where instrument-based methods (total station, GPS) are preferred.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7f52b532-1d7c-4a7b-80d1-f5fe97ca0892', '553374b4-6da1-4a64-81a1-93a717660412', 128, '''Bearing'', in surveying terminology, refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b5bc3b8-af63-4241-8ea2-63202b05569f', '7f52b532-1d7c-4a7b-80d1-f5fe97ca0892', 0, 'A structural support element');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2fc361bc-03f4-43bb-a719-1b74809d3a3a', '7f52b532-1d7c-4a7b-80d1-f5fe97ca0892', 1, 'The horizontal angle of a survey line measured relative to a reference direction, typically true north or magnetic north');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('efd9fb2f-8f38-4670-addf-de32e1d561c4', '7f52b532-1d7c-4a7b-80d1-f5fe97ca0892', 2, 'The load-carrying capacity of soil');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ee6a63a-ad3e-4e7b-89ea-f88d76678ef1', '7f52b532-1d7c-4a7b-80d1-f5fe97ca0892', 3, 'A type of surveying error');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7f52b532-1d7c-4a7b-80d1-f5fe97ca0892', '2fc361bc-03f4-43bb-a719-1b74809d3a3a', 'In surveying, a bearing is the horizontal angle of a line measured relative to a fixed reference direction (typically true north, magnetic north, or a specified grid north), expressed either as a quadrantal bearing (e.g., N45°E) or a whole-circle bearing (0° to 360°) — used to define a survey line''s precise direction.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a0ac8175-4a62-4389-86e3-bc2a41815697', '553374b4-6da1-4a64-81a1-93a717660412', 129, 'The purpose of ''closing error'' (or ''closing correction'') calculations in a closed traverse survey is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1cc58946-b137-4ba2-9056-01b9bfaf6bc0', 'a0ac8175-4a62-4389-86e3-bc2a41815697', 0, 'Intentionally introduce error into the survey for testing purposes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5aabced8-e756-438d-8958-afbeca7e715e', 'a0ac8175-4a62-4389-86e3-bc2a41815697', 1, 'Identify and distribute the small discrepancy that arises between the calculated and expected (theoretical) closure of a survey loop, due to accumulated measurement errors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d6b8e80-b9b2-42a7-b3ed-f47334c63b91', 'a0ac8175-4a62-4389-86e3-bc2a41815697', 2, 'Determine the exact cost of the survey');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48936960-9eb3-4aa0-ad29-0d6b5c8fae95', 'a0ac8175-4a62-4389-86e3-bc2a41815697', 3, 'Calculate the survey team''s working hours');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a0ac8175-4a62-4389-86e3-bc2a41815697', '5aabced8-e756-438d-8958-afbeca7e715e', 'In a closed traverse (a survey loop that returns to its starting point), the sum of calculated coordinate differences should theoretically be zero — any small discrepancy (closing error) reflects the cumulative effect of small measurement errors, and standard surveying methods (like the Bowditch/compass rule) systematically distribute this error across the traverse to produce adjusted, more consistent final coordinates.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('42e29fee-5b00-4880-b6a3-f65567dbab72', '553374b4-6da1-4a64-81a1-93a717660412', 130, '''Photogrammetry'', an increasingly important surveying technique, determines measurements of objects/terrain from:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6bf7f851-d61f-4d68-949b-c2efa4ea1547', '42e29fee-5b00-4880-b6a3-f65567dbab72', 0, 'Direct physical contact measurement only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('247d9abc-790f-4a18-8dc2-fce56fd5f8d7', '42e29fee-5b00-4880-b6a3-f65567dbab72', 1, 'Analysis of photographs (often aerial or drone-captured), using the geometric principles of overlapping images to extract accurate three-dimensional measurements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fec460ed-ad8e-42ac-b450-fd3ace569d78', '42e29fee-5b00-4880-b6a3-f65567dbab72', 2, 'Sound wave reflection exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77749cea-3a66-46ee-aa9b-34751588f94d', '42e29fee-5b00-4880-b6a3-f65567dbab72', 3, 'Only historical written records, with no image analysis');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('42e29fee-5b00-4880-b6a3-f65567dbab72', '247d9abc-790f-4a18-8dc2-fce56fd5f8d7', 'Photogrammetry extracts accurate measurements and three-dimensional models of terrain or objects by analyzing overlapping photographs (increasingly captured via drones or aircraft), using the geometric relationships between multiple images taken from different positions — an efficient, increasingly important technique for large-area topographic surveying and mapping.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d846e151-0f80-4352-ad83-f63b80c08464', '553374b4-6da1-4a64-81a1-93a717660412', 131, '''Camber'' (or crossfall) provided on a road''s cross-section refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b4be92a1-f6f9-4a2b-b052-5a546a8c6849', 'd846e151-0f80-4352-ad83-f63b80c08464', 0, 'The road''s total length');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('400db2ef-5ed3-419f-a4a7-65c6f71dc11a', 'd846e151-0f80-4352-ad83-f63b80c08464', 1, 'A slight transverse slope from the road''s centerline toward its edges, provided primarily to drain surface water off the pavement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d1e56de-2af5-492a-b0db-5650df223309', 'd846e151-0f80-4352-ad83-f63b80c08464', 2, 'The road''s speed limit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc65f3b6-42ca-4659-8375-37d2af433c91', 'd846e151-0f80-4352-ad83-f63b80c08464', 3, 'The thickness of the road''s base layer');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d846e151-0f80-4352-ad83-f63b80c08464', '400db2ef-5ed3-419f-a4a7-65c6f71dc11a', 'Camber (crossfall) is a slight transverse slope built into a road''s cross-section, sloping from the centerline (or crown) down toward the edges — its primary purpose is to efficiently drain surface water off the pavement, preventing water accumulation that could damage the pavement or create hazardous driving conditions.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b49de112-67e4-46c3-8f78-367dae815ba9', '553374b4-6da1-4a64-81a1-93a717660412', 132, '''Superelevation'' provided on a horizontal curve in road design is intended to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43a9562c-91ef-4273-954c-a8ccf441c6a4', 'b49de112-67e4-46c3-8f78-367dae815ba9', 0, 'Decrease vehicle speed forcibly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2993505-df40-4aeb-aa41-9f13a1e626a7', 'b49de112-67e4-46c3-8f78-367dae815ba9', 1, 'Counteract the centrifugal force experienced by a vehicle traveling around the curve, by banking the roadway (raising the outer edge relative to the inner edge)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f6b5d4d-a3c5-414a-aaaa-16de7b7f803c', 'b49de112-67e4-46c3-8f78-367dae815ba9', 2, 'Increase the road''s total length');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ccc08972-cb28-4ae4-88f6-2b6b2683cc13', 'b49de112-67e4-46c3-8f78-367dae815ba9', 3, 'Reduce the pavement''s structural thickness');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b49de112-67e4-46c3-8f78-367dae815ba9', 'a2993505-df40-4aeb-aa41-9f13a1e626a7', 'Superelevation banks a road''s horizontal curve (raising the outer edge of the pavement relative to the inner edge) to help counteract the centrifugal force a vehicle experiences while traveling around the curve, allowing for safer travel at the design speed by reducing reliance on tire friction alone.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0a8b492a-1ef3-4484-b045-c1a06bee4b4b', '553374b4-6da1-4a64-81a1-93a717660412', 133, '''Design speed'', a fundamental parameter in highway geometric design, refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb9f8e43-d122-43c2-a517-6418221d3927', '0a8b492a-1ef3-4484-b045-c1a06bee4b4b', 0, 'The maximum speed any vehicle is physically capable of achieving');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d65f83e-171f-4dd5-b544-5afdb13a99db', '0a8b492a-1ef3-4484-b045-c1a06bee4b4b', 1, 'A selected speed used to determine the various geometric design features of a roadway (curve radii, sight distances, superelevation), intended to be safely achievable under favorable conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8edc7635-8484-4443-8a13-bfe9937aa895', '0a8b492a-1ef3-4484-b045-c1a06bee4b4b', 2, 'The average speed of all vehicles currently using the road');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6bb50a5-8ac3-4bf7-a4fd-0f3fd1db0f81', '0a8b492a-1ef3-4484-b045-c1a06bee4b4b', 3, 'The speed limit posted, which is always numerically identical to the design speed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0a8b492a-1ef3-4484-b045-c1a06bee4b4b', '3d65f83e-171f-4dd5-b544-5afdb13a99db', 'Design speed is a selected reference speed used to determine appropriate geometric design elements of a roadway — horizontal/vertical curve radii, sight distances, superelevation rates — intended to be safely negotiable by a reasonably skillful driver under favorable weather and traffic conditions; the actual posted speed limit is a separate (often related but not identical) determination.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f63ae756-68d5-4556-8dd1-8d1bc6a5d459', '553374b4-6da1-4a64-81a1-93a717660412', 134, '''Sight distance'' in highway design refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83478b6b-b914-4ced-a5d8-32a6a92f3bc8', 'f63ae756-68d5-4556-8dd1-8d1bc6a5d459', 0, 'The distance a road extends beyond the visible horizon');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('315a9b21-02f0-4087-a92a-f473f9ed1fca', 'f63ae756-68d5-4556-8dd1-8d1bc6a5d459', 1, 'The length of roadway ahead that is visible to a driver, critical for ensuring adequate time to perceive and react to hazards or stop safely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e747599-0f3a-40c7-a6bf-e84560a7790b', 'f63ae756-68d5-4556-8dd1-8d1bc6a5d459', 2, 'The width of the road pavement only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d177a52-6dd7-4932-80aa-834eb8464988', 'f63ae756-68d5-4556-8dd1-8d1bc6a5d459', 3, 'The distance between two adjacent traffic signals');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f63ae756-68d5-4556-8dd1-8d1bc6a5d459', '315a9b21-02f0-4087-a92a-f473f9ed1fca', 'Sight distance is the length of roadway visible to a driver ahead of their vehicle — critical design parameters include ''stopping sight distance'' (adequate distance to perceive a hazard and stop safely) and ''overtaking/passing sight distance'' (adequate distance to safely complete an overtaking maneuver on a two-lane road).', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('24751a38-44ff-4f19-8695-4fea3f1a4012', '553374b4-6da1-4a64-81a1-93a717660412', 135, '''Flexible pavement'' (like typical asphalt roads), as distinct from ''rigid pavement'' (like concrete pavement), primarily distributes traffic loads through:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95db8382-b976-448e-94d3-4b58d8c6252c', '24751a38-44ff-4f19-8695-4fea3f1a4012', 0, 'A single rigid slab spanning across weak points, with minimal load spreading through underlying layers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e7704a0-f46e-4e8a-915a-7644e67a445a', '24751a38-44ff-4f19-8695-4fea3f1a4012', 1, 'Distributing the load progressively through multiple flexible layers (surface, base, sub-base) down to the underlying subgrade soil, with each successive layer distributing load over a wider area');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1bc46a14-a74c-4324-9d73-28a0f4d8f214', '24751a38-44ff-4f19-8695-4fea3f1a4012', 2, 'No load distribution mechanism at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b079602-0041-449e-a816-ba83f78bce93', '24751a38-44ff-4f19-8695-4fea3f1a4012', 3, 'Electrical current, unrelated to mechanical load');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('24751a38-44ff-4f19-8695-4fea3f1a4012', '7e7704a0-f46e-4e8a-915a-7644e67a445a', 'A flexible pavement (typically asphalt-based) distributes traffic loads progressively through a series of layers (surface course, base course, sub-base course), with each layer spreading the load over an increasingly wider area before it reaches the underlying subgrade soil — distinct from a rigid pavement (typically Portland cement concrete), which relies on the slab''s own flexural (bending) strength to bridge over localized weak points in the subgrade.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e757a751-6a5f-4433-bf74-050bdf816615', '553374b4-6da1-4a64-81a1-93a717660412', 136, 'The California Bearing Ratio (CBR) test, commonly used in pavement design, evaluates:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3076f0fe-33ef-4079-9eb3-8c7d7ad61b84', 'e757a751-6a5f-4433-bf74-050bdf816615', 0, 'The exact chemical composition of pavement materials');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aed265e5-a992-4f66-882a-f9db3f09f6a9', 'e757a751-6a5f-4433-bf74-050bdf816615', 1, 'The relative strength of a soil subgrade (or base material) for pavement design purposes, by comparing it to a standard, well-graded crushed stone material');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('113386c8-267e-4501-9f99-4d2c6a76f542', 'e757a751-6a5f-4433-bf74-050bdf816615', 2, 'Only the pavement''s surface color');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e1ebd73-a855-4b92-9340-ca866ee2faa2', 'e757a751-6a5f-4433-bf74-050bdf816615', 3, 'The pavement''s exact age since construction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e757a751-6a5f-4433-bf74-050bdf816615', 'aed265e5-a992-4f66-882a-f9db3f09f6a9', 'The CBR test evaluates the relative strength of a soil or base material by comparing its resistance to penetration against that of a standard, well-graded crushed stone material — the resulting CBR value (expressed as a percentage) is widely used as a key input parameter for flexible pavement thickness design.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8eb9597a-dfd2-4c57-a923-756794dd3630', '553374b4-6da1-4a64-81a1-93a717660412', 137, '''Traffic signal timing'', in transportation engineering, is primarily designed to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6bd0ec81-252a-4aee-97f2-e3765deef11b', '8eb9597a-dfd2-4c57-a923-756794dd3630', 0, 'Maximize traffic congestion deliberately');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d2a9553-73ed-4b7a-bc91-6e06893a905c', '8eb9597a-dfd2-4c57-a923-756794dd3630', 1, 'Efficiently and safely allocate right-of-way among competing traffic movements (through, left-turn, pedestrian) at an intersection, minimizing delay while maintaining safety');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb78bd3c-2fd1-4ea5-a398-1922839ee569', '8eb9597a-dfd2-4c57-a923-756794dd3630', 2, 'Eliminate all vehicle stops entirely, under all conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26bb353a-3375-48dc-ac77-7dd9e92bae0b', '8eb9597a-dfd2-4c57-a923-756794dd3630', 3, 'Apply only to pedestrian crossings, with no relation to vehicular traffic');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8eb9597a-dfd2-4c57-a923-756794dd3630', '8d2a9553-73ed-4b7a-bc91-6e06893a905c', 'Traffic signal timing is designed to efficiently and safely allocate the limited right-of-way at an intersection among competing traffic movements (through traffic, turning movements, pedestrians) — properly designed timing minimizes overall vehicle and pedestrian delay while maintaining a safe, orderly flow through the intersection.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ce61435b-5cd6-4406-b58a-9edbb113c389', '553374b4-6da1-4a64-81a1-93a717660412', 138, '''Level of Service'' (LOS), a widely used transportation engineering metric, describes:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b082b612-1dcc-447a-84b7-192d0b14fbda', 'ce61435b-5cd6-4406-b58a-9edbb113c389', 0, 'Only the pavement''s surface roughness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f08d618-eac9-4e4e-8fa9-41c2625173ae', 'ce61435b-5cd6-4406-b58a-9edbb113c389', 1, 'A qualitative measure of traffic flow conditions on a roadway or at an intersection, typically graded from A (excellent, free-flow) to F (severe congestion/failure)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d6a9531-830f-414e-ac2f-19f2feed0e48', 'ce61435b-5cd6-4406-b58a-9edbb113c389', 2, 'The exact number of traffic accidents on a road, with no relation to flow quality');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77294180-e5e6-441d-b2c1-c2743534d872', 'ce61435b-5cd6-4406-b58a-9edbb113c389', 3, 'Only the width of the road shoulder');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ce61435b-5cd6-4406-b58a-9edbb113c389', '3f08d618-eac9-4e4e-8fa9-41c2625173ae', 'Level of Service (LOS) is a qualitative measure describing traffic flow conditions on a roadway segment or at an intersection, typically graded on a scale from A (excellent, essentially free-flow conditions) to F (severe congestion, breakdown of flow) — widely used to evaluate existing conditions and the anticipated impact of proposed transportation improvements.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4d85b763-3da0-42a2-9f89-88e4835a9f6c', '553374b4-6da1-4a64-81a1-93a717660412', 139, '''Rigid pavement'' (Portland cement concrete pavement) generally offers, compared to flexible pavement, the advantage of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('561a34d8-e3e3-4053-9cf7-02a9a675c4fb', '4d85b763-3da0-42a2-9f89-88e4835a9f6c', 0, 'Lower initial construction cost in every case');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('919abbff-c324-48a0-9a15-90993e8dc212', '4d85b763-3da0-42a2-9f89-88e4835a9f6c', 1, 'Greater durability and longer service life under heavy repeated loading, at typically higher initial construction cost');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b67a6b5-8625-47f8-9a16-2dc9e443f035', '4d85b763-3da0-42a2-9f89-88e4835a9f6c', 2, 'Requiring absolutely no maintenance over its entire service life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('801b1eb8-57e5-40d2-9194-5778e4bdc59c', '4d85b763-3da0-42a2-9f89-88e4835a9f6c', 3, 'Being unsuitable for any airport runway application');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4d85b763-3da0-42a2-9f89-88e4835a9f6c', '919abbff-c324-48a0-9a15-90993e8dc212', 'Rigid (concrete) pavement generally offers greater durability and a longer service life under heavy, repeated loading compared to flexible (asphalt) pavement, though typically at a higher initial construction cost — this durability makes rigid pavement a common choice for heavy-duty applications like airport runways and highway sections carrying significant heavy vehicle traffic.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('862bc930-7d00-40a6-8131-6f1dd92d3616', '553374b4-6da1-4a64-81a1-93a717660412', 140, 'A ''grade separated'' intersection (like a flyover or underpass) is designed to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ee96782-f888-4d84-9c28-30334d0daf49', '862bc930-7d00-40a6-8131-6f1dd92d3616', 0, 'Force all traffic movements to stop and cross at the same level');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f498132-4cd8-4fcf-a104-600aedfb9ee9', '862bc930-7d00-40a6-8131-6f1dd92d3616', 1, 'Allow conflicting traffic streams to cross each other at different vertical levels, eliminating direct at-grade conflict points and improving traffic flow/safety');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41fe8dba-f6dc-4bc8-85f1-7bf3fe1a2fd2', '862bc930-7d00-40a6-8131-6f1dd92d3616', 2, 'Reduce a road''s total capacity deliberately');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7bd7bfb3-3560-45de-bba2-d7dfa0ad56f2', '862bc930-7d00-40a6-8131-6f1dd92d3616', 3, 'Only apply to pedestrian pathways, with no relevance to vehicular traffic');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('862bc930-7d00-40a6-8131-6f1dd92d3616', '8f498132-4cd8-4fcf-a104-600aedfb9ee9', 'A grade-separated intersection allows conflicting traffic streams to cross at different vertical levels (via a flyover, underpass, or interchange), eliminating direct at-grade crossing conflicts — significantly improving traffic flow capacity and safety compared to an at-grade intersection, though typically at greater construction cost and complexity.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('111e7da1-7537-4a3e-b2d5-1bd3b8b70b4a', '553374b4-6da1-4a64-81a1-93a717660412', 141, '''Biochemical Oxygen Demand'' (BOD), a key water quality parameter, measures:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1c51ef7-a445-4ea3-ad69-a8071f7df58c', '111e7da1-7537-4a3e-b2d5-1bd3b8b70b4a', 0, 'The exact temperature of a water sample');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43c71e6a-796f-4171-a8f2-43bc0997f7ca', '111e7da1-7537-4a3e-b2d5-1bd3b8b70b4a', 1, 'The amount of dissolved oxygen consumed by microorganisms while decomposing organic matter in a water sample over a specified period, indicating the level of organic pollution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a900d2e1-adde-40df-bb28-b576f025e53a', '111e7da1-7537-4a3e-b2d5-1bd3b8b70b4a', 2, 'The water''s exact color, with no relation to pollution level');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b081ea6c-f0d4-425a-b697-c768fef571ed', '111e7da1-7537-4a3e-b2d5-1bd3b8b70b4a', 3, 'The water''s pH level directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('111e7da1-7537-4a3e-b2d5-1bd3b8b70b4a', '43c71e6a-796f-4171-a8f2-43bc0997f7ca', 'BOD measures the amount of dissolved oxygen consumed by microorganisms as they biologically decompose organic matter present in a water sample over a specified incubation period (commonly 5 days, as BOD5) — a higher BOD indicates a greater concentration of biodegradable organic pollutants, making it a fundamental water quality and wastewater treatment performance indicator.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('873f287f-568d-4808-b0bc-2b93a4dc459b', '553374b4-6da1-4a64-81a1-93a717660412', 142, '''Chemical Oxygen Demand'' (COD), another common water quality parameter, measures:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37acf14a-b92a-4de6-9077-9b2f188ce415', '873f287f-568d-4808-b0bc-2b93a4dc459b', 0, 'Only biologically degradable organic matter, identical to BOD');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7cf44348-191b-404d-9b56-db40fe3536ed', '873f287f-568d-4808-b0bc-2b93a4dc459b', 1, 'The total amount of oxygen required to chemically oxidize both biodegradable and non-biodegradable organic matter in a water sample');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db91ca53-6d30-4e93-a72d-5de68e062856', '873f287f-568d-4808-b0bc-2b93a4dc459b', 2, 'Only the water''s dissolved mineral content');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1c45011-09de-4a84-b903-e4cc59705172', '873f287f-568d-4808-b0bc-2b93a4dc459b', 3, 'Only the presence of heavy metals');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('873f287f-568d-4808-b0bc-2b93a4dc459b', '7cf44348-191b-404d-9b56-db40fe3536ed', 'COD measures the total oxygen equivalent required to chemically oxidize organic matter in a water sample, including both biodegradable material (also captured by BOD) and non-biodegradable organic compounds that BOD testing wouldn''t capture — COD values are typically higher than BOD values for the same sample, and the test is completed much faster than the multi-day BOD test.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('33f0eeba-d9f9-46a4-a615-6bb96f7e527a', '553374b4-6da1-4a64-81a1-93a717660412', 143, '''Potable water'' refers to water that is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66343dac-b1e1-4ead-8552-8524472d2c19', '33f0eeba-d9f9-46a4-a615-6bb96f7e527a', 0, 'Contaminated and unsafe for any use');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2964fb9-c1a4-4060-bf1e-b4506d9fbc66', '33f0eeba-d9f9-46a4-a615-6bb96f7e527a', 1, 'Safe and suitable for human consumption, meeting established drinking water quality standards');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd06545c-e7ff-4cc8-8df7-854e09533434', '33f0eeba-d9f9-46a4-a615-6bb96f7e527a', 2, 'Used exclusively for industrial cooling purposes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('977a7b7c-cf37-43d0-80cf-bf3b0ef8a6d3', '33f0eeba-d9f9-46a4-a615-6bb96f7e527a', 3, 'Salt water directly from the ocean, with no treatment');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('33f0eeba-d9f9-46a4-a615-6bb96f7e527a', 'b2964fb9-c1a4-4060-bf1e-b4506d9fbc66', 'Potable water is water that meets established quality standards and is safe and suitable for human drinking and consumption — the treatment of raw water to potable standards (removing pathogens, harmful contaminants, and adjusting chemical properties) is a core function of municipal water treatment systems.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('48affdf3-da0a-4fdd-bf43-7b65f22ea390', '553374b4-6da1-4a64-81a1-93a717660412', 144, '''Coagulation and flocculation'', common processes in water treatment, are primarily used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7aa05230-e2e6-445d-a226-de60dc1710fd', '48affdf3-da0a-4fdd-bf43-7b65f22ea390', 0, 'Add color to treated water');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67455fbe-ea8a-4555-a37b-22a921398845', '48affdf3-da0a-4fdd-bf43-7b65f22ea390', 1, 'Aggregate small, suspended particles into larger clumps (flocs) that can be more easily removed through subsequent settling or filtration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2253397b-e713-4e6b-9faf-bdf98adf78ee', '48affdf3-da0a-4fdd-bf43-7b65f22ea390', 2, 'Increase the water''s dissolved oxygen content directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7bf03452-6307-41d0-b574-bb9657ded418', '48affdf3-da0a-4fdd-bf43-7b65f22ea390', 3, 'Disinfect the water by killing pathogens directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('48affdf3-da0a-4fdd-bf43-7b65f22ea390', '67455fbe-ea8a-4555-a37b-22a921398845', 'Coagulation (adding chemicals to destabilize fine suspended particles) followed by flocculation (gentle mixing to allow destabilized particles to aggregate into larger, more easily removable clumps called ''flocs'') are foundational water treatment processes that prepare suspended solids for efficient removal through subsequent sedimentation and filtration stages.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e8afd963-0a71-4106-a8b3-3d83b0faa3d8', '553374b4-6da1-4a64-81a1-93a717660412', 145, '''Chlorination'' of water, a common disinfection method, is used primarily to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e9a912b-bd29-47c8-9a3f-2525bcdfe676', 'e8afd963-0a71-4106-a8b3-3d83b0faa3d8', 0, 'Remove suspended solid particles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cbdef2f-cd62-4300-900b-9dbf11796729', 'e8afd963-0a71-4106-a8b3-3d83b0faa3d8', 1, 'Kill or inactivate disease-causing pathogens (bacteria, viruses) in the water, making it safer for consumption');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e2f17a4-f674-49d7-87eb-2ac2ddf63284', 'e8afd963-0a71-4106-a8b3-3d83b0faa3d8', 2, 'Add beneficial minerals to the water');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43a92b20-5af0-4499-90c7-d154a72577a1', 'e8afd963-0a71-4106-a8b3-3d83b0faa3d8', 3, 'Reduce the water''s total volume');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e8afd963-0a71-4106-a8b3-3d83b0faa3d8', '4cbdef2f-cd62-4300-900b-9dbf11796729', 'Chlorination introduces chlorine (or a chlorine-based compound) into water specifically to disinfect it — killing or inactivating disease-causing pathogens like bacteria and viruses — a widely used, cost-effective disinfection method in municipal water treatment, though it must be carefully dosed to balance effective disinfection against potential byproduct formation.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('31678364-2f42-430f-9681-3fc722b155d1', '553374b4-6da1-4a64-81a1-93a717660412', 146, '''Solid waste management'' hierarchy generally prioritizes waste reduction/handling approaches in which order (from most to least preferred)?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96cffceb-3caa-4471-b7e2-de87f1d4fde8', '31678364-2f42-430f-9681-3fc722b155d1', 0, 'Disposal, Recycling, Reduction, Reuse');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d068d6e-7878-47fa-8a08-2a4156656fbb', '31678364-2f42-430f-9681-3fc722b155d1', 1, 'Reduction (source reduction), Reuse, Recycling, and finally, Disposal (landfilling/incineration) as a last resort');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f78a000d-c1e3-4033-b3b3-98a4e76ac390', '31678364-2f42-430f-9681-3fc722b155d1', 2, 'Incineration first, then all other methods equally');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a348b20-7353-4101-99cd-d607cca4405b', '31678364-2f42-430f-9681-3fc722b155d1', 3, 'There is no established preference order among these approaches');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('31678364-2f42-430f-9681-3fc722b155d1', '6d068d6e-7878-47fa-8a08-2a4156656fbb', 'The widely adopted solid waste management hierarchy prioritizes source reduction (generating less waste in the first place) as most preferable, followed by reuse, then recycling, with disposal (landfilling or incineration) as the least preferred, last-resort option — reflecting an emphasis on preventing waste generation over managing waste after it''s created.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('14b51f51-0d51-4843-ab0e-f02d2d670e17', '553374b4-6da1-4a64-81a1-93a717660412', 147, '''Sanitary landfill'', a controlled method of solid waste disposal, is designed to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('396aba2e-d6b4-42d8-8d36-024a5afece18', '14b51f51-0d51-4843-ab0e-f02d2d670e17', 0, 'Allow waste to be dumped with no engineering controls whatsoever');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cad74733-c08f-48da-9a0e-861fa86b587d', '14b51f51-0d51-4843-ab0e-f02d2d670e17', 1, 'Dispose of solid waste in a controlled, engineered manner — using compaction, daily soil cover, and liner/leachate management systems — to minimize environmental and public health impacts');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('715a07fc-37d2-49e6-a782-b72edac58eb0', '14b51f51-0d51-4843-ab0e-f02d2d670e17', 2, 'Burn all waste immediately with no landfilling at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6037967-fb82-43e3-97ef-6803285a8ac9', '14b51f51-0d51-4843-ab0e-f02d2d670e17', 3, 'Only accept liquid waste, never solid waste');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('14b51f51-0d51-4843-ab0e-f02d2d670e17', 'cad74733-c08f-48da-9a0e-861fa86b587d', 'A sanitary landfill is an engineered facility for solid waste disposal, incorporating controls like waste compaction, daily soil (or alternative) cover, and liner/leachate collection systems specifically designed to minimize groundwater contamination, odor, pest issues, and other environmental/public health impacts, distinguishing it from an uncontrolled open dump.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a2148f81-0791-474f-a8a1-5649a5f4ed36', '553374b4-6da1-4a64-81a1-93a717660412', 148, '''Air pollution'' from industrial or vehicular sources is commonly monitored and regulated based on concentrations of pollutants such as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('225dfced-e49f-469d-8c24-870b10d8e792', 'a2148f81-0791-474f-a8a1-5649a5f4ed36', 0, 'Only visible smoke color, with no quantitative measurement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebddb68b-0f2e-4145-9be5-2b1d3c4fc2fd', 'a2148f81-0791-474f-a8a1-5649a5f4ed36', 1, 'Particulate matter (PM2.5/PM10), sulfur dioxide, nitrogen oxides, carbon monoxide, and ozone, among other regulated pollutants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03f9d055-4c31-4dc5-a482-14addb457638', 'a2148f81-0791-474f-a8a1-5649a5f4ed36', 2, 'Only water vapor content');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5debcf86-8f44-407c-b36d-f90ddd0b6275', 'a2148f81-0791-474f-a8a1-5649a5f4ed36', 3, 'Only the ambient temperature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a2148f81-0791-474f-a8a1-5649a5f4ed36', 'ebddb68b-0f2e-4145-9be5-2b1d3c4fc2fd', 'Air quality monitoring and regulation commonly focus on specific pollutants including particulate matter (PM2.5 and PM10, referring to particle size in micrometers), sulfur dioxide, nitrogen oxides, carbon monoxide, and ground-level ozone — each associated with specific health and environmental impacts, and each subject to established regulatory concentration limits.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e5c4afc5-fa2f-46b4-b5db-82c406995bf1', '553374b4-6da1-4a64-81a1-93a717660412', 149, 'An ''Environmental Impact Assessment'' (EIA), required for many major infrastructure projects, is conducted to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5eaf4cd2-8496-4192-a56f-f37e1ff83790', 'e5c4afc5-fa2f-46b4-b5db-82c406995bf1', 0, 'Guarantee project approval regardless of environmental consequences');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b0ad230-c014-4327-8bdf-9320da9893e3', 'e5c4afc5-fa2f-46b4-b5db-82c406995bf1', 1, 'Systematically evaluate and document the likely environmental consequences of a proposed project before it proceeds, informing decision-making and potential mitigation measures');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('557bac85-9472-4ca4-af97-d096652e130d', 'e5c4afc5-fa2f-46b4-b5db-82c406995bf1', 2, 'Only assess the project''s financial cost, with no environmental consideration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36a85e98-a31c-4719-a644-854160aa42a2', 'e5c4afc5-fa2f-46b4-b5db-82c406995bf1', 3, 'Replace the need for any other project planning or design work');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e5c4afc5-fa2f-46b4-b5db-82c406995bf1', '6b0ad230-c014-4327-8bdf-9320da9893e3', 'An Environmental Impact Assessment systematically evaluates and documents a proposed project''s likely environmental consequences (on air/water quality, ecosystems, communities, and other factors) before the project proceeds — informing regulatory decision-making and identifying appropriate mitigation measures to minimize adverse impacts.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d3e899a4-46f0-496b-a339-7d58c3405348', '553374b4-6da1-4a64-81a1-93a717660412', 150, '''Eutrophication'' of a water body, an environmental concern often linked to excess nutrient runoff (nitrogen/phosphorus), results in:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28bc2f9f-fe91-4cc4-9858-a8b3d4e72c82', 'd3e899a4-46f0-496b-a339-7d58c3405348', 0, 'A permanent decrease in aquatic plant growth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('237e1e81-dc71-4b5a-ab3f-c97f02910ae7', 'd3e899a4-46f0-496b-a339-7d58c3405348', 1, 'Excessive growth of algae and aquatic plants due to nutrient enrichment, which can subsequently deplete dissolved oxygen as this biomass decomposes, harming aquatic life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47a4b1d1-9377-454f-be08-10936de49bfd', 'd3e899a4-46f0-496b-a339-7d58c3405348', 2, 'Improved water clarity in every case');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4027cd98-584a-4e80-ae46-4c3b001b963e', 'd3e899a4-46f0-496b-a339-7d58c3405348', 3, 'No meaningful ecological consequence');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d3e899a4-46f0-496b-a339-7d58c3405348', '237e1e81-dc71-4b5a-ab3f-c97f02910ae7', 'Eutrophication occurs when excess nutrients (commonly nitrogen and phosphorus from agricultural runoff, sewage, or other sources) enter a water body, causing excessive growth of algae and aquatic plants — when this excess biomass eventually dies and decomposes, the decomposition process consumes significant dissolved oxygen, potentially creating oxygen-depleted conditions harmful or lethal to fish and other aquatic life.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('34e8501c-7d97-490a-815f-5fa14a8c5ac4', '553374b4-6da1-4a64-81a1-93a717660412', 151, '''Ordinary Portland Cement'' (OPC), the most widely used cement type, achieves its binding property primarily through:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c031d1a-583c-4232-a6f4-f85f5e7c8666', '34e8501c-7d97-490a-815f-5fa14a8c5ac4', 0, 'A purely physical drying process with no chemical reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eeef1a3a-5e27-4c5d-8d04-150c337925c8', '34e8501c-7d97-490a-815f-5fa14a8c5ac4', 1, 'A chemical hydration reaction between cement compounds and water, forming hardened hydration products that bind aggregate particles together');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('558c465f-9c33-4918-b063-701053837dbf', '34e8501c-7d97-490a-815f-5fa14a8c5ac4', 2, 'Exposure to sunlight only, with no water involvement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fdb8eff9-d2a9-4a7e-b2a7-9f6b1fd04a80', '34e8501c-7d97-490a-815f-5fa14a8c5ac4', 3, 'Freezing at low temperature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('34e8501c-7d97-490a-815f-5fa14a8c5ac4', 'eeef1a3a-5e27-4c5d-8d04-150c337925c8', 'Portland cement hardens through a chemical hydration reaction — cement compounds react with water to form hardened calcium silicate hydrate and other hydration products, which bind together the sand and coarse aggregate particles to form the hardened concrete matrix; this is fundamentally a chemical process, not simple physical drying.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9d89746e-a234-4183-b12f-04c4e2901fb3', '553374b4-6da1-4a64-81a1-93a717660412', 152, '''Workability'' of fresh concrete refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d77477e0-403b-463b-8ddf-55870abec835', '9d89746e-a234-4183-b12f-04c4e2901fb3', 0, 'The concrete''s final hardened compressive strength');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9896e7c-e0cb-482c-ac27-494ce0a95894', '9d89746e-a234-4183-b12f-04c4e2901fb3', 1, 'The ease with which fresh concrete can be mixed, placed, compacted, and finished without excessive segregation or bleeding');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e068b86-954b-48d7-aa08-2e17ee353225', '9d89746e-a234-4183-b12f-04c4e2901fb3', 2, 'Only the concrete''s final color');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('044e58fb-5c37-4b53-9742-7da4720c2a41', '9d89746e-a234-4183-b12f-04c4e2901fb3', 3, 'The concrete''s resistance to fire');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9d89746e-a234-4183-b12f-04c4e2901fb3', 'e9896e7c-e0cb-482c-ac27-494ce0a95894', 'Workability describes the ease and consistency with which fresh (unhardened) concrete can be mixed, transported, placed into formwork, compacted, and finished — without excessive segregation (separation of coarse aggregate from the mortar) or bleeding (excess water rising to the surface); the slump test is a common field method for assessing workability.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('51a73a5f-72b3-4f25-a744-b7c32e2a512b', '553374b4-6da1-4a64-81a1-93a717660412', 153, '''Curing compounds'' (membrane-forming compounds), sometimes used as an alternative to water curing, work by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34e44334-c0d0-4386-9d2d-acd0efc74b89', '51a73a5f-72b3-4f25-a744-b7c32e2a512b', 0, 'Adding extra water to the concrete surface continuously');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3617407c-831b-437b-9fdf-25118ea99454', '51a73a5f-72b3-4f25-a744-b7c32e2a512b', 1, 'Forming a thin membrane on the concrete''s exposed surface that reduces moisture loss (evaporation), allowing internal hydration to continue effectively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8975ae11-14ea-4339-bdfa-9a67303fb0d4', '51a73a5f-72b3-4f25-a744-b7c32e2a512b', 2, 'Chemically weakening the concrete''s surface deliberately');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01cd6e93-492f-414f-a98d-f9172626b6ac', '51a73a5f-72b3-4f25-a744-b7c32e2a512b', 3, 'Coloring the concrete permanently, with no functional curing benefit');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('51a73a5f-72b3-4f25-a744-b7c32e2a512b', '3617407c-831b-437b-9fdf-25118ea99454', 'Curing compounds form a thin membrane on the exposed concrete surface once applied, significantly reducing moisture evaporation from the concrete — this helps retain the water needed for continued cement hydration internally, serving as a practical alternative to methods requiring continuous water application (like ponding or wet burlap covering).', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ba1ced75-04da-43fd-9689-ee2ba57fdf75', '553374b4-6da1-4a64-81a1-93a717660412', 154, '''Admixtures'' added to concrete mixes are used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('281ea6b9-c84b-44e7-9a90-0aa86203e8a6', 'ba1ced75-04da-43fd-9689-ee2ba57fdf75', 0, 'Replace cement entirely with no functional equivalent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2ed11fd-141d-4e38-a5a9-edbf3e7743e9', 'ba1ced75-04da-43fd-9689-ee2ba57fdf75', 1, 'Modify specific properties of fresh or hardened concrete (like workability, setting time, or strength development), without being a primary structural ingredient themselves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00452fbf-871c-48a9-81e2-4ff56bcade93', 'ba1ced75-04da-43fd-9689-ee2ba57fdf75', 2, 'Only change the concrete''s color, with no other functional purpose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43f015e6-08ae-4b67-90ce-4eccba9679a6', 'ba1ced75-04da-43fd-9689-ee2ba57fdf75', 3, 'Eliminate the need for any reinforcement');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ba1ced75-04da-43fd-9689-ee2ba57fdf75', 'c2ed11fd-141d-4e38-a5a9-edbf3e7743e9', 'Admixtures are materials added to a concrete mix (in relatively small quantities, distinct from the primary ingredients of cement, aggregate, and water) specifically to modify particular fresh or hardened concrete properties — examples include water-reducing (plasticizing) admixtures for improved workability, retarders/accelerators to adjust setting time, and air-entraining admixtures for improved freeze-thaw durability.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a7c359ef-dc80-4db2-96ef-3136ef5d39c3', '553374b4-6da1-4a64-81a1-93a717660412', 155, 'The ''slump test'', a common field test for fresh concrete, measures:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f6a5d61-58d2-4bad-ba98-fc196b6157c0', 'a7c359ef-dc80-4db2-96ef-3136ef5d39c3', 0, 'The concrete''s exact compressive strength directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64a63764-c5e9-4ef8-984b-d3b5bda289af', 'a7c359ef-dc80-4db2-96ef-3136ef5d39c3', 1, 'The consistency (workability) of fresh concrete, by measuring how much a standard cone-shaped sample subsides after the mold is removed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('978735f8-94ac-4dee-9424-4a4603144d8b', 'a7c359ef-dc80-4db2-96ef-3136ef5d39c3', 2, 'The concrete''s exact chemical composition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2e54cce-66c7-4869-8e6c-a1974a9a32c8', 'a7c359ef-dc80-4db2-96ef-3136ef5d39c3', 3, 'The concrete''s fire resistance rating');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a7c359ef-dc80-4db2-96ef-3136ef5d39c3', '64a63764-c5e9-4ef8-984b-d3b5bda289af', 'The slump test measures fresh concrete''s consistency/workability by filling a standard cone-shaped mold with the concrete sample, then removing the mold and measuring how much the concrete subsides (the ''slump'') — a higher slump generally indicates a more fluid, workable mix, though it doesn''t directly measure the concrete''s eventual hardened compressive strength.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('48c97672-ae40-405e-aace-c5b5d5d62db3', '553374b4-6da1-4a64-81a1-93a717660412', 156, '''Critical Path Method'' (CPM), a widely used project management/scheduling technique in construction, identifies:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b29472a8-b0f6-4b88-80a0-4e1619a6f641', '48c97672-ae40-405e-aace-c5b5d5d62db3', 0, 'Only the project''s total budget');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('615b93c4-e7af-4525-a509-7f35cb1f81da', '48c97672-ae40-405e-aace-c5b5d5d62db3', 1, 'The sequence of dependent project activities that determines the minimum possible total project duration — any delay to an activity on this critical path directly delays the overall project');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba924d86-1c47-4ac8-b846-f169c872cd6e', '48c97672-ae40-405e-aace-c5b5d5d62db3', 2, 'Only activities with the highest individual cost');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c9881e5-5a8a-49a6-b0d0-4087a0ddcf16', '48c97672-ae40-405e-aace-c5b5d5d62db3', 3, 'The construction site''s exact geographic boundaries');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('48c97672-ae40-405e-aace-c5b5d5d62db3', '615b93c4-e7af-4525-a509-7f35cb1f81da', 'CPM identifies the ''critical path'' — the specific sequence of interdependent project activities whose total duration determines the minimum possible overall project completion time — any delay to an activity on this critical path directly delays the entire project, while delays to non-critical activities (with available ''float''/slack time) may not affect the overall completion date.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2140c6bc-9201-48b9-90f5-fecb29fea003', '553374b4-6da1-4a64-81a1-93a717660412', 157, '''Bar bending schedule'' (BBS), a document used in reinforced concrete construction, provides:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0e02630-9f4b-446c-bddd-02863cead5a6', '2140c6bc-9201-48b9-90f5-fecb29fea003', 0, 'Only the concrete mix design proportions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d41cc16-7163-4be9-8d67-a0cf4ef1c1f7', '2140c6bc-9201-48b9-90f5-fecb29fea003', 1, 'Detailed information on reinforcement bar shapes, lengths, bending details, and quantities required for a structural element, facilitating accurate fabrication and material estimation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2fda4129-b4f0-4d07-9934-3d3b0b4c6fde', '2140c6bc-9201-48b9-90f5-fecb29fea003', 2, 'Only the construction schedule/timeline, unrelated to reinforcement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('778d217b-56ad-42f1-bdf9-e1d093f96e39', '2140c6bc-9201-48b9-90f5-fecb29fea003', 3, 'The architect''s aesthetic design preferences');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2140c6bc-9201-48b9-90f5-fecb29fea003', '9d41cc16-7163-4be9-8d67-a0cf4ef1c1f7', 'A bar bending schedule provides detailed information on the shape, cutting length, bending details, and required quantity of each reinforcement bar for a given structural element — facilitating accurate off-site or on-site bar fabrication, efficient material estimation/procurement, and reduced wastage compared to less systematic approaches.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('780ce31b-29e4-406b-9add-3fe25486384f', '553374b4-6da1-4a64-81a1-93a717660412', 158, '''Quality control'' in construction, as distinct from broader ''quality assurance'', primarily focuses on:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2618c78e-722d-4351-844d-4689bf77cb1d', '780ce31b-29e4-406b-9add-3fe25486384f', 0, 'Only the project''s overall management philosophy, with no specific testing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6a9f91e-518f-41d3-bfc9-517475526eb5', '780ce31b-29e4-406b-9add-3fe25486384f', 1, 'The specific inspection, testing, and verification activities confirming that materials and completed work actually meet the specified requirements/standards');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7eea441-958e-4684-9c35-64bb458a77f7', '780ce31b-29e4-406b-9add-3fe25486384f', 2, 'Only the project''s financial auditing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e71c3f57-e780-4aaf-b809-6f335957a6b7', '780ce31b-29e4-406b-9add-3fe25486384f', 3, 'Only the aesthetic appearance of the final structure');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('780ce31b-29e4-406b-9add-3fe25486384f', 'c6a9f91e-518f-41d3-bfc9-517475526eb5', 'Quality control encompasses the specific inspection, testing, and verification activities (like concrete cube testing, reinforcement inspection, dimensional checks) that confirm materials and completed work actually meet specified requirements — distinct from the broader ''quality assurance'' concept, which encompasses the overall management system and processes designed to prevent quality problems in the first place.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cd6339db-bfe8-42e7-867a-c4018fb42e29', '553374b4-6da1-4a64-81a1-93a717660412', 159, '''Formwork'' (or shuttering) in concrete construction serves to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c46fb14a-1c11-4f02-b58c-89c8cafda1e8', 'cd6339db-bfe8-42e7-867a-c4018fb42e29', 0, 'Permanently remain as part of the final structure in every case');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c178b88-1095-4404-91ab-4aaff9d62d4f', 'cd6339db-bfe8-42e7-867a-c4018fb42e29', 1, 'Temporarily contain and support fresh concrete in the desired shape until it gains sufficient strength to be self-supporting');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d5330bc-576d-494f-b584-3b0c3ef231f5', 'cd6339db-bfe8-42e7-867a-c4018fb42e29', 2, 'Replace the need for reinforcement entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00ff501c-bc92-4947-adc1-8b1804a2f543', 'cd6339db-bfe8-42e7-867a-c4018fb42e29', 3, 'Only decorate the finished concrete surface');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cd6339db-bfe8-42e7-867a-c4018fb42e29', '9c178b88-1095-4404-91ab-4aaff9d62d4f', 'Formwork (shuttering) temporarily contains and supports fresh, plastic concrete in the desired shape and position until the concrete has gained sufficient strength to support itself and any construction loads — after which the formwork is typically removed (stripped), though some specialized formwork systems (like permanent/stay-in-place forms) are designed to remain.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1c41015e-16db-40d6-9da0-23f2b74ce35b', '553374b4-6da1-4a64-81a1-93a717660412', 160, '''Value engineering'' in construction project management aims to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8a1f948-a7cf-4c53-ae9b-208b59e6378f', '1c41015e-16db-40d6-9da0-23f2b74ce35b', 0, 'Maximize project cost regardless of function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d67f032-9e49-40c5-a076-4f7ee772ed7a', '1c41015e-16db-40d6-9da0-23f2b74ce35b', 1, 'Achieve the required function and quality of a project at the lowest overall lifecycle cost, by systematically examining alternative materials, designs, or methods');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50e31e19-ec13-4099-87b8-23c38f6e3972', '1c41015e-16db-40d6-9da0-23f2b74ce35b', 2, 'Eliminate all quality standards to reduce cost');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('832c9ed2-2644-47c6-ae74-4c803f6d5268', '1c41015e-16db-40d6-9da0-23f2b74ce35b', 3, 'Focus exclusively on aesthetic considerations, with no regard for cost or function');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1c41015e-16db-40d6-9da0-23f2b74ce35b', '1d67f032-9e49-40c5-a076-4f7ee772ed7a', 'Value engineering is a systematic process of examining a project''s design, materials, and methods to identify alternatives that achieve the required function and quality at the lowest overall lifecycle cost — a deliberate cost-optimization approach that explicitly considers both function/quality and cost together, rather than simply cutting cost at the expense of performance.', 'Discipline (Civil Engineering) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');
