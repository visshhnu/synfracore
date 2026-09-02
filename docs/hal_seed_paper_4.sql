-- ============================================================
-- HAL Design/Management Trainee -- Computer Science & Information Technology
-- Full-Length Mock Paper 4 (160 questions, 150 minutes)
-- 
-- SOURCE: informally shared study material (not an official/proprietary HAL
-- archive). Honest per-question source note via question_answers.source_note
-- (already rendered in the results-review UI) -- see each section below.
-- Run this AFTER docs/question-bank-schema.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes)
VALUES ('9c41f530-08db-4047-8407-0b03c9afec65', 'hal-cse-practice-1', 'HAL DT/MT — Computer Science & Information Technology — Full Mock Paper 1', 'hal-trainee', ARRAY['HAL', 'Computer Science', 'Data Structures', 'General Awareness', 'Reasoning', 'English']::TEXT[], 160, 'standard', true, 4, 150);

-- ── Section: General Awareness (20 questions) — General Awareness — written to match HAL's real GA scope, not taken from an official HAL paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0c0d8778-8737-4b31-bfc7-766efaf27054', '9c41f530-08db-4047-8407-0b03c9afec65', 1, 'HAL''s Management Information Systems and enterprise software needs are typically supported by which internal function, distinct from its core aerospace engineering divisions?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d510f39-70ca-4d96-9a42-f4331fb1942f', '0c0d8778-8737-4b31-bfc7-766efaf27054', 0, 'The IT/Systems Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de492d9f-f89f-4e95-ac88-973d5fdd71fd', '0c0d8778-8737-4b31-bfc7-766efaf27054', 1, 'The Metallurgy Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c55050f-1492-4139-a252-e50a03db833d', '0c0d8778-8737-4b31-bfc7-766efaf27054', 2, 'The Flight Test Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc88f7f0-67a0-4dd8-8c33-5507b61b54ca', '0c0d8778-8737-4b31-bfc7-766efaf27054', 3, 'The Foundry Division');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0c0d8778-8737-4b31-bfc7-766efaf27054', '8d510f39-70ca-4d96-9a42-f4331fb1942f', 'Like most large industrial organisations, HAL maintains an internal IT/Systems function supporting enterprise software, MIS, and digital infrastructure — a role distinct from (but supporting) its core aerospace design and manufacturing divisions.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('99f4538c-24f6-429b-b077-e876cbd00250', '9c41f530-08db-4047-8407-0b03c9afec65', 2, 'The Semiconductor Laboratory (SCL), a key Indian chip-fabrication facility, is located in:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('275cd83f-d2e8-4114-9270-3be5bbf59552', '99f4538c-24f6-429b-b077-e876cbd00250', 0, 'Mohali, Punjab');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c385d08-20eb-4ad6-9fac-52d1e34b14d3', '99f4538c-24f6-429b-b077-e876cbd00250', 1, 'Pune, Maharashtra');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a6837e5-e4b2-422f-a298-43d157d3db8d', '99f4538c-24f6-429b-b077-e876cbd00250', 2, 'Noida, Uttar Pradesh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0af9e6d-554e-45f1-8c06-ecaf4cca1acb', '99f4538c-24f6-429b-b077-e876cbd00250', 3, 'Bengaluru, Karnataka');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('99f4538c-24f6-429b-b077-e876cbd00250', '275cd83f-d2e8-4114-9270-3be5bbf59552', 'The Semiconductor Laboratory (SCL), one of India''s earliest chip-fabrication facilities, is located in Mohali, Punjab, and operates under the Department of Space.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('099c3fce-8ad4-45fe-b501-a7ecbb9270c9', '9c41f530-08db-4047-8407-0b03c9afec65', 3, 'India''s ''Aadhaar'' project, the world''s largest biometric identity system, is administered by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19325fc9-5858-4059-8046-036b3c439559', '099c3fce-8ad4-45fe-b501-a7ecbb9270c9', 0, 'Reserve Bank of India');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('919efc19-30b1-40f3-9ad5-c58352dc19ff', '099c3fce-8ad4-45fe-b501-a7ecbb9270c9', 1, 'Unique Identification Authority of India (UIDAI)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04507e0e-7ec7-4894-ba54-275c0f4de12f', '099c3fce-8ad4-45fe-b501-a7ecbb9270c9', 2, 'Election Commission of India');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9bea289b-782a-4683-bf4e-a2623e1688cd', '099c3fce-8ad4-45fe-b501-a7ecbb9270c9', 3, 'Ministry of Home Affairs directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('099c3fce-8ad4-45fe-b501-a7ecbb9270c9', '919efc19-30b1-40f3-9ad5-c58352dc19ff', 'The Unique Identification Authority of India (UIDAI) administers the Aadhaar programme, issuing a unique 12-digit identification number linked to biometric and demographic data for Indian residents.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e90c79cb-3342-4d78-90dd-688ee256e470', '9c41f530-08db-4047-8407-0b03c9afec65', 4, 'The ''National Supercomputing Mission'' aims to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ea5d339-64f7-4cef-b799-f492086801b4', 'e90c79cb-3342-4d78-90dd-688ee256e470', 0, 'Reduce India''s computing infrastructure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca715d64-e74e-43ca-b297-694c00df44da', 'e90c79cb-3342-4d78-90dd-688ee256e470', 1, 'Establish a network of high-performance computing facilities across India to boost research and industrial computing capability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b9a9c33-919c-4575-824b-3920dc8939c5', 'e90c79cb-3342-4d78-90dd-688ee256e470', 2, 'Regulate mobile phone tariffs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58f9e346-b33f-4d3f-861a-b8e680dcb31d', 'e90c79cb-3342-4d78-90dd-688ee256e470', 3, 'Ban the import of computer hardware');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e90c79cb-3342-4d78-90dd-688ee256e470', 'ca715d64-e74e-43ca-b297-694c00df44da', 'The National Supercomputing Mission, jointly steered by the Department of Science and Technology and Ministry of Electronics and IT, aims to build a network of supercomputing facilities across Indian academic and research institutions.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b5c1a737-e762-4cf5-a4c6-ffde704f4d1c', '9c41f530-08db-4047-8407-0b03c9afec65', 5, 'The Indian Institutes of Information Technology (IIITs) primarily focus on:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('469a9592-4de8-4d12-8ac6-4680d6853430', 'b5c1a737-e762-4cf5-a4c6-ffde704f4d1c', 0, 'Medical education');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df8fe2f3-d317-4c72-8628-d3e21a94cd47', 'b5c1a737-e762-4cf5-a4c6-ffde704f4d1c', 1, 'Information technology and allied engineering education and research');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('117740f6-9c51-47c1-ac7e-7d9d24b6928b', 'b5c1a737-e762-4cf5-a4c6-ffde704f4d1c', 2, 'Agricultural sciences');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ad23994-9ab1-45a7-8338-3c0323fb4289', 'b5c1a737-e762-4cf5-a4c6-ffde704f4d1c', 3, 'Legal studies');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b5c1a737-e762-4cf5-a4c6-ffde704f4d1c', 'df8fe2f3-d317-4c72-8628-d3e21a94cd47', 'IIITs are specialised technical institutes focused specifically on information technology and closely allied engineering disciplines, distinct from the broader-scope IITs.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4a6b9f0b-532e-49a4-8643-5e9163cbd936', '9c41f530-08db-4047-8407-0b03c9afec65', 6, 'The ''Personal Data Protection'' framework in India, addressing data privacy, most recently took the form of which enacted legislation?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('093b0672-f954-4ee0-abbe-659f8baaa5d6', '4a6b9f0b-532e-49a4-8643-5e9163cbd936', 0, 'The Digital Personal Data Protection Act, 2023');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e679144-a5e9-47a5-858b-506fce9be33e', '4a6b9f0b-532e-49a4-8643-5e9163cbd936', 1, 'The Right to Information Act, 2005');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c663465a-60fd-4794-a7a9-950c06c41a91', '4a6b9f0b-532e-49a4-8643-5e9163cbd936', 2, 'The Information Technology Act, 2000 (as originally enacted, with no later privacy-specific update)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac33ed41-da04-4173-9a6e-6f1921d51122', '4a6b9f0b-532e-49a4-8643-5e9163cbd936', 3, 'The Companies Act, 2013');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4a6b9f0b-532e-49a4-8643-5e9163cbd936', '093b0672-f954-4ee0-abbe-659f8baaa5d6', 'The Digital Personal Data Protection Act, 2023, is India''s dedicated legislation governing the processing of digital personal data, representing the most recent major step in India''s data-privacy legal framework. `(needs verification — recheck implementation/rules status against the current official source, since enactment and full rule notification can occur at different times)`', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d9a828cc-88b7-4e46-aca3-3188b538e101', '9c41f530-08db-4047-8407-0b03c9afec65', 7, 'The first Indian-built digital computer was developed at which institution?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5eadf23-fb00-47be-957f-b7adc17f24d7', 'd9a828cc-88b7-4e46-aca3-3188b538e101', 0, 'Indian Institute of Science (IISc), Bengaluru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a11360a2-ed23-4849-868a-31c0f84f6909', 'd9a828cc-88b7-4e46-aca3-3188b538e101', 1, 'Indian Statistical Institute (ISI), Kolkata');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0e8807f-e65c-481b-aca8-c0bed819a596', 'd9a828cc-88b7-4e46-aca3-3188b538e101', 2, 'IIT Bombay');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24dfd513-0c66-45c2-a51c-1b0df3b122ce', 'd9a828cc-88b7-4e46-aca3-3188b538e101', 3, 'Tata Institute of Fundamental Research (TIFR), Mumbai');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d9a828cc-88b7-4e46-aca3-3188b538e101', '24dfd513-0c66-45c2-a51c-1b0df3b122ce', 'TIFR (Tata Institute of Fundamental Research), Mumbai, developed TIFRAC, one of India''s earliest indigenous digital computers, completed in the early 1960s.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5941a0d2-9401-4db8-814f-89a1b282ec1e', '9c41f530-08db-4047-8407-0b03c9afec65', 8, '''Make in India'' explicitly identifies electronics system design and manufacturing (ESDM) as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7c1dc00-5c50-44fc-8d0a-f35a73bd6ee2', '5941a0d2-9401-4db8-814f-89a1b282ec1e', 0, 'An excluded sector');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12ac46bf-6bb3-4791-bcc6-361d6f9371c7', '5941a0d2-9401-4db8-814f-89a1b282ec1e', 1, 'One of its priority sectors for boosting domestic manufacturing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ebc3a10-81a2-4a4a-8759-171ca80907f1', '5941a0d2-9401-4db8-814f-89a1b282ec1e', 2, 'Relevant only to consumer goods, not defence electronics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5092935-9793-46f7-bc16-f8beecc9d32d', '5941a0d2-9401-4db8-814f-89a1b282ec1e', 3, 'A sector reserved exclusively for foreign companies');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5941a0d2-9401-4db8-814f-89a1b282ec1e', '12ac46bf-6bb3-4791-bcc6-361d6f9371c7', 'Electronics System Design and Manufacturing (ESDM) is explicitly identified as a priority sector under the ''Make in India'' initiative, directly relevant to reducing import dependence in electronics — including defence electronics used by organisations like HAL.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9d5a5cc1-88a8-41c6-8572-b40fbd75da24', '9c41f530-08db-4047-8407-0b03c9afec65', 9, 'The Indian government''s ''BharatNet'' project primarily aims to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c31d7a9a-cfe5-4199-8370-ab489bf633ef', '9d5a5cc1-88a8-41c6-8572-b40fbd75da24', 0, 'Provide broadband internet connectivity to rural India, particularly gram panchayats');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b764e188-f211-4c5a-9108-5b524cf91822', '9d5a5cc1-88a8-41c6-8572-b40fbd75da24', 1, 'Build national highways');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b681672-60ec-4577-a12b-2273c5aaa77d', '9d5a5cc1-88a8-41c6-8572-b40fbd75da24', 2, 'Launch new satellites exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('189e89a4-3dbe-4c4e-b5fd-cb0525c44f0c', '9d5a5cc1-88a8-41c6-8572-b40fbd75da24', 3, 'Regulate television broadcasting');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9d5a5cc1-88a8-41c6-8572-b40fbd75da24', 'c31d7a9a-cfe5-4199-8370-ab489bf633ef', 'BharatNet is a Government of India initiative aimed at providing broadband internet connectivity to rural areas, particularly gram panchayats, via optical fiber infrastructure.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d3ac6b9b-9c8a-4374-8694-7e948d0ed728', '9c41f530-08db-4047-8407-0b03c9afec65', 10, 'CERT-In (Indian Computer Emergency Response Team) is the national agency responsible for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd43b9a3-19e1-4720-bd1e-79c50c3586c2', 'd3ac6b9b-9c8a-4374-8694-7e948d0ed728', 0, 'Issuing passports');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ae82039-b00c-4fae-9a0f-d0415c67e6bf', 'd3ac6b9b-9c8a-4374-8694-7e948d0ed728', 1, 'Responding to cybersecurity incidents and threats within India');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4eb904b-a41c-4662-981c-21ed24297813', 'd3ac6b9b-9c8a-4374-8694-7e948d0ed728', 2, 'Regulating stock markets');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33a95032-1a61-4d3f-b327-d3a48d1d1e37', 'd3ac6b9b-9c8a-4374-8694-7e948d0ed728', 3, 'Managing railway operations');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d3ac6b9b-9c8a-4374-8694-7e948d0ed728', '6ae82039-b00c-4fae-9a0f-d0415c67e6bf', 'CERT-In, under the Ministry of Electronics and Information Technology, is India''s national nodal agency for responding to cybersecurity incidents and coordinating threat intelligence and response.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('03e75da9-9455-48bf-b923-f61a7e1a27f6', '9c41f530-08db-4047-8407-0b03c9afec65', 11, 'The programming language originally developed for teaching structured programming at Bell Labs, and later foundational to Unix, is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4121e66-c803-47b1-96b9-648b63126978', '03e75da9-9455-48bf-b923-f61a7e1a27f6', 0, 'Python');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfe8019b-2971-4f31-a7a4-d073e9afcbd7', '03e75da9-9455-48bf-b923-f61a7e1a27f6', 1, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26e29e76-8a33-4d5b-9632-7858710d6f4e', '03e75da9-9455-48bf-b923-f61a7e1a27f6', 2, 'Java');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9367648-54c6-497c-9f48-ec1215755e89', '03e75da9-9455-48bf-b923-f61a7e1a27f6', 3, 'COBOL');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('03e75da9-9455-48bf-b923-f61a7e1a27f6', 'cfe8019b-2971-4f31-a7a4-d073e9afcbd7', 'The C programming language, developed at Bell Labs by Dennis Ritchie in the early 1970s, became foundational to the Unix operating system and remains highly influential in systems programming.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('eab35cc3-f11b-45cc-ab0a-3c42af70cc96', '9c41f530-08db-4047-8407-0b03c9afec65', 12, 'The ''Digital Locker'' (DigiLocker) initiative in India is primarily used for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad5ab36a-3cdc-4bce-a675-3c0bd86c5855', 'eab35cc3-f11b-45cc-ab0a-3c42af70cc96', 0, 'Physical bank locker rentals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f5af68c-b536-493c-be74-555eae2e30ca', 'eab35cc3-f11b-45cc-ab0a-3c42af70cc96', 1, 'Secure, cloud-based storage and sharing of official documents and certificates');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c981dad1-2fe1-4922-9a07-36bb2e641b55', 'eab35cc3-f11b-45cc-ab0a-3c42af70cc96', 2, 'Video streaming');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8376ab97-ef2c-4cd9-a70d-9cd7b55875a5', 'eab35cc3-f11b-45cc-ab0a-3c42af70cc96', 3, 'Online gaming');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('eab35cc3-f11b-45cc-ab0a-3c42af70cc96', '5f5af68c-b536-493c-be74-555eae2e30ca', 'DigiLocker is a Government of India initiative providing citizens a secure, cloud-based platform to store and digitally access official documents and certificates, reducing dependence on physical paperwork.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3bac8111-0a85-4bfd-b190-86adbfc064d1', '9c41f530-08db-4047-8407-0b03c9afec65', 13, '''GPU'' commonly stands for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e445d9ad-1eda-4792-a4db-ee6c8eb0c8f5', '3bac8111-0a85-4bfd-b190-86adbfc064d1', 0, 'General Purpose Unit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34001bc9-0d16-4b2a-a034-2d04bc0aa110', '3bac8111-0a85-4bfd-b190-86adbfc064d1', 1, 'Graphics Processing Unit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0259345d-8c1e-4a6d-95f6-9a29e42592a1', '3bac8111-0a85-4bfd-b190-86adbfc064d1', 2, 'Global Processing Utility');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff49bf52-b810-4335-89eb-1f18734d4f63', '3bac8111-0a85-4bfd-b190-86adbfc064d1', 3, 'Gateway Protocol Unit');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3bac8111-0a85-4bfd-b190-86adbfc064d1', '34001bc9-0d16-4b2a-a034-2d04bc0aa110', 'GPU stands for Graphics Processing Unit — originally designed for rendering graphics, now also widely used for parallel computing workloads including AI/machine learning training.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('60e9a352-d89e-44c5-b25f-f2a75dd7f709', '9c41f530-08db-4047-8407-0b03c9afec65', 14, 'The headquarters of India''s premier defence R&D organisation, DRDO, is located in:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0a7a7e8-3b25-4aaa-9814-37959cea2b58', '60e9a352-d89e-44c5-b25f-f2a75dd7f709', 0, 'New Delhi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7bcb0b02-1a3e-4f04-a7af-250e68f48dc6', '60e9a352-d89e-44c5-b25f-f2a75dd7f709', 1, 'Bengaluru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05ba36e6-7d7e-4302-8224-260e1ae37914', '60e9a352-d89e-44c5-b25f-f2a75dd7f709', 2, 'Hyderabad');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4929bbcb-c4d8-421f-a67c-b16d9671b1d9', '60e9a352-d89e-44c5-b25f-f2a75dd7f709', 3, 'Pune');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('60e9a352-d89e-44c5-b25f-f2a75dd7f709', 'f0a7a7e8-3b25-4aaa-9814-37959cea2b58', 'DRDO (Defence Research and Development Organisation) is headquartered in New Delhi, though it operates numerous specialised laboratories across India, including several in Bengaluru and Hyderabad.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bd2c76d7-4543-4642-8cf9-c22c11fa3cfb', '9c41f530-08db-4047-8407-0b03c9afec65', 15, 'India''s National Informatics Centre (NIC) primarily provides:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0cc0919-a668-43c9-ad8d-18e6f2cfd08e', 'bd2c76d7-4543-4642-8cf9-c22c11fa3cfb', 0, 'Weather forecasting services only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ba0aca7-d8cb-4e2d-8def-ca3c892d5576', 'bd2c76d7-4543-4642-8cf9-c22c11fa3cfb', 1, 'IT infrastructure and e-governance support services to central and state government departments');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('491e55cf-5f17-402e-97c1-746e87c91de2', 'bd2c76d7-4543-4642-8cf9-c22c11fa3cfb', 2, 'Banking services to the public');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('754e8ad7-8a24-426c-890f-149c9b865dae', 'bd2c76d7-4543-4642-8cf9-c22c11fa3cfb', 3, 'Postal delivery services');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bd2c76d7-4543-4642-8cf9-c22c11fa3cfb', '6ba0aca7-d8cb-4e2d-8def-ca3c892d5576', 'NIC provides IT infrastructure, network services, and e-governance solutions supporting central and state government departments across India.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1f4a7d4b-39e0-451e-9839-c1fd7033f21e', '9c41f530-08db-4047-8407-0b03c9afec65', 16, 'The Indian Space Research Organisation''s Vikram Sarabhai Space Centre (VSSC), focused on launch vehicle technology, is located at:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9760064-c72c-4959-8f6f-d0471d138252', '1f4a7d4b-39e0-451e-9839-c1fd7033f21e', 0, 'Thiruvananthapuram');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('daf5ee81-23be-4edd-b231-2fd1df987b2a', '1f4a7d4b-39e0-451e-9839-c1fd7033f21e', 1, 'Sriharikota');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ebc1616-eefa-484c-98e5-be9e7d779825', '1f4a7d4b-39e0-451e-9839-c1fd7033f21e', 2, 'Bengaluru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5bef46aa-751a-476e-b7ba-ec314ea4e28d', '1f4a7d4b-39e0-451e-9839-c1fd7033f21e', 3, 'Ahmedabad');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1f4a7d4b-39e0-451e-9839-c1fd7033f21e', 'b9760064-c72c-4959-8f6f-d0471d138252', 'VSSC, ISRO''s lead center for launch vehicle and rocket technology development, is located in Thiruvananthapuram, Kerala.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('642e039f-c654-4576-9fe1-d30385bb229c', '9c41f530-08db-4047-8407-0b03c9afec65', 17, '''Open source software'' refers to software whose:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c233d69-09fb-4ade-8872-34bb320e92d0', '642e039f-c654-4576-9fe1-d30385bb229c', 0, 'Source code is kept permanently secret');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67b860c9-3ace-4718-9c0b-0d6feee62c99', '642e039f-c654-4576-9fe1-d30385bb229c', 1, 'Source code is made publicly available, typically allowing users to view, modify, and distribute it under a defined license');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('56cb6d86-b985-49d4-ae5b-0d5f1092bef9', '642e039f-c654-4576-9fe1-d30385bb229c', 2, 'Functionality is always limited compared to proprietary software');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6264b521-71bf-42bc-9cbd-e1c10548bc71', '642e039f-c654-4576-9fe1-d30385bb229c', 3, 'Use requires a mandatory paid subscription');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('642e039f-c654-4576-9fe1-d30385bb229c', '67b860c9-3ace-4718-9c0b-0d6feee62c99', 'Open source software makes its source code publicly available under a license that typically permits viewing, modification, and redistribution — distinct from proprietary/closed-source software, where the source code is kept private.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2b27e577-ce25-4a4e-93fa-bac1c748d6a5', '9c41f530-08db-4047-8407-0b03c9afec65', 18, 'The Indian government''s ''Startup India'' initiative primarily aims to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63757f53-1893-441f-babd-daf09bda8471', '2b27e577-ce25-4a4e-93fa-bac1c748d6a5', 0, 'Discourage private entrepreneurship');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86d63455-a477-449d-81c3-43c30b6367be', '2b27e577-ce25-4a4e-93fa-bac1c748d6a5', 1, 'Foster entrepreneurship and innovation by providing incentives, funding support, and regulatory simplification for startups');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a41f6964-da4b-4052-92a5-54596bd6ef3a', '2b27e577-ce25-4a4e-93fa-bac1c748d6a5', 2, 'Nationalise all private companies');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b36783f1-5ea9-4076-97bd-ed166c199e73', '2b27e577-ce25-4a4e-93fa-bac1c748d6a5', 3, 'Focus exclusively on agricultural startups');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2b27e577-ce25-4a4e-93fa-bac1c748d6a5', '86d63455-a477-449d-81c3-43c30b6367be', 'Startup India, launched in 2016, aims to build a strong ecosystem for innovation and entrepreneurship by providing tax benefits, funding support, and simplified compliance for eligible startups.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('32a2a968-5dd3-4487-9b1f-2dd7f2f9331e', '9c41f530-08db-4047-8407-0b03c9afec65', 19, 'Cloud computing, as a service delivery model, allows users to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6e89c62-57c2-4fa5-a3d3-b56a52545b75', '32a2a968-5dd3-4487-9b1f-2dd7f2f9331e', 0, 'Access computing resources (servers, storage, software) over the internet on demand, rather than owning and maintaining physical infrastructure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd61392c-6e93-4e5d-9375-75066570f505', '32a2a968-5dd3-4487-9b1f-2dd7f2f9331e', 1, 'Only store data locally on their own machine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4dcef78-1117-4b1b-97b6-cf04b4d3a25f', '32a2a968-5dd3-4487-9b1f-2dd7f2f9331e', 2, 'Eliminate the need for internet connectivity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('752e1642-d5a7-4482-a7eb-701efd7d68fe', '32a2a968-5dd3-4487-9b1f-2dd7f2f9331e', 3, 'Guarantee zero cost for any usage level');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('32a2a968-5dd3-4487-9b1f-2dd7f2f9331e', 'f6e89c62-57c2-4fa5-a3d3-b56a52545b75', 'Cloud computing delivers computing resources — servers, storage, databases, software — over the internet on an on-demand, typically pay-as-you-go basis, removing the need for organisations to own and maintain all their own physical IT infrastructure.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('dbee3d02-53ee-438e-8730-3aa5f1de4544', '9c41f530-08db-4047-8407-0b03c9afec65', 20, 'Which Indian PSU/organisation is primarily responsible for India''s telecom equipment manufacturing in the public sector?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9de3b9ec-e07e-4e87-9e7b-1886feb588a3', 'dbee3d02-53ee-438e-8730-3aa5f1de4544', 0, 'Bharat Sanchar Nigam Limited (BSNL) — a service provider, not primarily a manufacturer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('256c243c-39a1-40e1-a63c-6cd8124563a2', 'dbee3d02-53ee-438e-8730-3aa5f1de4544', 1, 'Indian Telephone Industries (ITI) Limited');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b43a2e72-8473-4e0a-8ebf-e4c6830133b0', 'dbee3d02-53ee-438e-8730-3aa5f1de4544', 2, 'Hindustan Aeronautics Limited (HAL)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f043c98-9035-4a9e-a3aa-ec53f6142b25', 'dbee3d02-53ee-438e-8730-3aa5f1de4544', 3, 'Steel Authority of India Limited (SAIL)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dbee3d02-53ee-438e-8730-3aa5f1de4544', '256c243c-39a1-40e1-a63c-6cd8124563a2', 'Indian Telephone Industries (ITI) Limited is a public sector telecom equipment manufacturer, distinct from BSNL (a telecom service provider) and from HAL (an aerospace/defence manufacturer) — India''s PSU landscape includes distinct organisations for equipment manufacturing versus service delivery across sectors.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

-- ── Section: English & Reasoning (40 questions) — English & Reasoning — general competitive-exam style practice content, not an official HAL paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a4fa7676-aeff-4f26-b213-eb4e1e99f5e2', '9c41f530-08db-4047-8407-0b03c9afec65', 21, 'Spot the error, if any: ''The software team have completed the testing phase ahead of schedule.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('066afc5b-3a00-4063-9e48-b5eb43e183ea', 'a4fa7676-aeff-4f26-b213-eb4e1e99f5e2', 0, '''have'' should be ''has''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a5570f4-b944-4fe2-8663-64b61e218228', 'a4fa7676-aeff-4f26-b213-eb4e1e99f5e2', 1, '''ahead'' should be ''ahead of''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0294a4ae-9b53-436d-93e7-aac0fcbd8d50', 'a4fa7676-aeff-4f26-b213-eb4e1e99f5e2', 2, '''completed'' should be ''complete''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f1cd32c-5123-4719-b18d-84d4105f56f0', 'a4fa7676-aeff-4f26-b213-eb4e1e99f5e2', 3, 'No error');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a4fa7676-aeff-4f26-b213-eb4e1e99f5e2', '066afc5b-3a00-4063-9e48-b5eb43e183ea', '''Team'', when acting as a single collective unit, takes a singular verb — ''has completed'' is correct, not ''have completed''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cc5e82c2-3078-4155-9f96-81364e04b9e5', '9c41f530-08db-4047-8407-0b03c9afec65', 22, 'Complete the sentence: ''The application ________ crash repeatedly since the last patch.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb9cbb97-b2d9-4083-af43-082b13856a90', 'cc5e82c2-3078-4155-9f96-81364e04b9e5', 0, 'is');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c46b41e6-84d1-4d41-9229-ba78a71c923b', 'cc5e82c2-3078-4155-9f96-81364e04b9e5', 1, 'has been known to');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01be5f88-3468-441e-ab9d-dce19e97db78', 'cc5e82c2-3078-4155-9f96-81364e04b9e5', 2, 'was');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd78efd3-190b-45b5-a992-a5e54b94bc1c', 'cc5e82c2-3078-4155-9f96-81364e04b9e5', 3, 'did');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cc5e82c2-3078-4155-9f96-81364e04b9e5', 'c46b41e6-84d1-4d41-9229-ba78a71c923b', '''Has been known to crash'' correctly uses present perfect to describe a recurring pattern observed up to the present — this is the grammatically complete and idiomatically correct option among those given.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5147b646-8a16-4b94-b6e1-8efc56dac06f', '9c41f530-08db-4047-8407-0b03c9afec65', 23, 'Pick the closest synonym for ''Redundant'' (general usage):');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('770d05d5-7ce5-4a91-bc07-3bf6faf43c33', '5147b646-8a16-4b94-b6e1-8efc56dac06f', 0, 'Essential');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e6e0abb-14f4-48eb-827e-90b25062b9c5', '5147b646-8a16-4b94-b6e1-8efc56dac06f', 1, 'Superfluous');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00216c50-e377-432a-8687-732875c3820f', '5147b646-8a16-4b94-b6e1-8efc56dac06f', 2, 'Efficient');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a763ed2-dae1-42c6-bef2-d308efc564c2', '5147b646-8a16-4b94-b6e1-8efc56dac06f', 3, 'Scarce');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5147b646-8a16-4b94-b6e1-8efc56dac06f', '5e6e0abb-14f4-48eb-827e-90b25062b9c5', '''Redundant'' in everyday usage means unnecessary or no longer needed — ''Superfluous'' is the closest synonym.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9e51cec7-476c-4418-891e-a1e6979fb060', '9c41f530-08db-4047-8407-0b03c9afec65', 24, 'Pick the closest antonym for ''Robust'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d318a0c-4843-4571-b013-cd9404667a3e', '9e51cec7-476c-4418-891e-a1e6979fb060', 0, 'Sturdy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd0589b2-9ff8-4be7-980f-b93bbfcd63d6', '9e51cec7-476c-4418-891e-a1e6979fb060', 1, 'Fragile');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d1a0c78-64a4-4e27-8447-e5503ea7f58c', '9e51cec7-476c-4418-891e-a1e6979fb060', 2, 'Reliable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1bf157d4-a380-4d62-9023-bda48f589363', '9e51cec7-476c-4418-891e-a1e6979fb060', 3, 'Durable');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9e51cec7-476c-4418-891e-a1e6979fb060', 'cd0589b2-9ff8-4be7-980f-b93bbfcd63d6', '''Robust'' means strong and resilient; its direct antonym is ''Fragile'' (easily broken or weak).', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('deb67abd-6dee-485b-ac44-7165404bfac6', '9c41f530-08db-4047-8407-0b03c9afec65', 25, 'Which sentence uses commas correctly?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db74879d-c52f-448d-927a-a08d704ca839', 'deb67abd-6dee-485b-ac44-7165404bfac6', 0, 'The algorithm, which was optimized last week performs faster now.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92694ea6-aa84-4458-a8c2-1ba3bce7977b', 'deb67abd-6dee-485b-ac44-7165404bfac6', 1, 'The algorithm which was optimized last week, performs faster now.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a52b967-1b81-4730-9c3d-6a4bfa28f14b', 'deb67abd-6dee-485b-ac44-7165404bfac6', 2, 'The algorithm, which was optimized last week, performs faster now.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1d64adc-1f18-4b41-bd65-6e3dbd9dbfd0', 'deb67abd-6dee-485b-ac44-7165404bfac6', 3, 'The algorithm which, was optimized last week performs faster now.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('deb67abd-6dee-485b-ac44-7165404bfac6', '4a52b967-1b81-4730-9c3d-6a4bfa28f14b', 'The non-restrictive clause ''which was optimized last week'' requires commas on both sides.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bbf434a1-28b6-43e9-bb22-d43b99b58697', '9c41f530-08db-4047-8407-0b03c9afec65', 26, 'Select the correctly spelled word:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88c749ea-7117-47ba-b490-cb948d8068b8', 'bbf434a1-28b6-43e9-bb22-d43b99b58697', 0, 'Compatibilty');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('623316d9-317e-4ed2-8745-091cc95ea645', 'bbf434a1-28b6-43e9-bb22-d43b99b58697', 1, 'Compatability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ab070bd-a1b2-4176-b731-83c8a51b1869', 'bbf434a1-28b6-43e9-bb22-d43b99b58697', 2, 'Compatibility');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31bfe5bf-63a4-40ed-9ed1-9f661d1e0880', 'bbf434a1-28b6-43e9-bb22-d43b99b58697', 3, 'Compattibility');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bbf434a1-28b6-43e9-bb22-d43b99b58697', '6ab070bd-a1b2-4176-b731-83c8a51b1869', '''Compatibility'' is the correct spelling.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('16b2d5a6-5045-4937-9d9b-6964482f755b', '9c41f530-08db-4047-8407-0b03c9afec65', 27, 'Identify the part of speech of the underlined word: ''The server responded QUICKLY to the request.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e474aaa-f52a-4dca-ad9a-84b0af29d125', '16b2d5a6-5045-4937-9d9b-6964482f755b', 0, 'Adjective');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6f80f02-f066-4d80-a469-57fe63088465', '16b2d5a6-5045-4937-9d9b-6964482f755b', 1, 'Adverb');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b4be2fa-d245-4d61-b43d-02292edf4f59', '16b2d5a6-5045-4937-9d9b-6964482f755b', 2, 'Noun');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3910e0d3-d37e-401a-95b6-f7174ab1ec14', '16b2d5a6-5045-4937-9d9b-6964482f755b', 3, 'Conjunction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('16b2d5a6-5045-4937-9d9b-6964482f755b', 'e6f80f02-f066-4d80-a469-57fe63088465', '''Quickly'' modifies the verb ''responded'', describing how the server responded — it is an adverb.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('236186b2-b6b1-4ebd-988a-7b121d1023a2', '9c41f530-08db-4047-8407-0b03c9afec65', 28, 'Convert to passive voice: ''The team deployed the update last night.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('482f48c7-7a2c-4ef0-bf8b-673e08aa57cd', '236186b2-b6b1-4ebd-988a-7b121d1023a2', 0, 'The update is deployed by the team last night.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a27ef98-6505-47f2-b529-deab2edafd83', '236186b2-b6b1-4ebd-988a-7b121d1023a2', 1, 'The update was deployed by the team last night.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b18824bd-1e18-4d87-a77d-024a82b8ab77', '236186b2-b6b1-4ebd-988a-7b121d1023a2', 2, 'The update deploys by the team last night.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('148415c1-fe7d-41a7-a3bb-a3a9ed69ee84', '236186b2-b6b1-4ebd-988a-7b121d1023a2', 3, 'The update has deploy by the team last night.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('236186b2-b6b1-4ebd-988a-7b121d1023a2', '8a27ef98-6505-47f2-b529-deab2edafd83', 'Simple past active (''deployed'') converts to simple past passive: ''was deployed by''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('686567e2-5f6e-4854-8d8c-6ceddbcc9cf9', '9c41f530-08db-4047-8407-0b03c9afec65', 29, 'Complete the idiom: ''When the server crashed twice in one week, management decided to ________ and replace the entire infrastructure.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1223c8e1-7e3d-44f6-a9ff-ee42c1b0d1d0', '686567e2-5f6e-4854-8d8c-6ceddbcc9cf9', 0, 'turn a blind eye');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd5a7eeb-dcf9-4936-bcb3-2b13fa36647c', '686567e2-5f6e-4854-8d8c-6ceddbcc9cf9', 1, 'bite the bullet');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dec134ba-8c80-421d-aa2d-1f97f1257cc0', '686567e2-5f6e-4854-8d8c-6ceddbcc9cf9', 2, 'beat around the bush');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8abf9260-e3a5-45df-8bc6-f19ff1dc4e0c', '686567e2-5f6e-4854-8d8c-6ceddbcc9cf9', 3, 'let sleeping dogs lie');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('686567e2-5f6e-4854-8d8c-6ceddbcc9cf9', 'bd5a7eeb-dcf9-4936-bcb3-2b13fa36647c', '''Bite the bullet'' means to face a difficult or costly decision head-on, fitting the context of committing to a significant infrastructure replacement.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a4636438-900f-4ed5-a8c0-1090c044dcc1', '9c41f530-08db-4047-8407-0b03c9afec65', 30, 'Pick the word nearest in meaning to ''Scalable'' (in a systems/software context):');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8428fd2-9694-4516-8a6d-e03acc10ce58', 'a4636438-900f-4ed5-a8c0-1090c044dcc1', 0, 'Fixed and unchangeable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b307ee5f-c9e2-409b-8198-54c8b93d1ad4', 'a4636438-900f-4ed5-a8c0-1090c044dcc1', 1, 'Capable of being expanded or adapted to handle increased load or size');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2483f1e-2901-478e-b13f-342e9fbc2bdf', 'a4636438-900f-4ed5-a8c0-1090c044dcc1', 2, 'Always small in scope');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fef25723-8b9e-4065-af4e-8e9b496f450a', 'a4636438-900f-4ed5-a8c0-1090c044dcc1', 3, 'Prone to frequent failure');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a4636438-900f-4ed5-a8c0-1090c044dcc1', 'b307ee5f-c9e2-409b-8198-54c8b93d1ad4', '''Scalable'', in a systems context, describes a system''s capacity to handle growth — increased load, data, or users — by expanding resources without a fundamental redesign.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d3ea9c1a-2a51-4a88-95ef-f3195588a69a', '9c41f530-08db-4047-8407-0b03c9afec65', 31, 'Which sentence is grammatically correct?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7a6e01b-458a-4f50-bbd0-32fc50b770a8', 'd3ea9c1a-2a51-4a88-95ef-f3195588a69a', 0, 'Neither the server nor the databases was responding.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f2dda47-0bb1-4d63-aca1-f28863b775b2', 'd3ea9c1a-2a51-4a88-95ef-f3195588a69a', 1, 'Neither the server nor the databases were responding.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ae251e9-fc8f-432b-acab-e9dd8abf0ff2', 'd3ea9c1a-2a51-4a88-95ef-f3195588a69a', 2, 'Neither the server or the databases were responding.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae0c866f-937e-4810-87af-4a2fc64c1d4a', 'd3ea9c1a-2a51-4a88-95ef-f3195588a69a', 3, 'Neither the server and the databases were responding.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d3ea9c1a-2a51-4a88-95ef-f3195588a69a', '8f2dda47-0bb1-4d63-aca1-f28863b775b2', 'With ''neither...nor'', the verb agrees with the noun closest to it (''databases'', plural) — ''were responding'' is correct; also, ''neither'' must pair with ''nor'', not ''or'' or ''and''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9faeaa68-9024-4ee6-95ea-04746db2614f', '9c41f530-08db-4047-8407-0b03c9afec65', 32, 'Fill in the blank with the correct preposition: ''The function is dependent ________ three input parameters.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d9c3e77-6fda-4436-893e-eeacbef36426', '9faeaa68-9024-4ee6-95ea-04746db2614f', 0, 'on');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69d5dd52-6d8d-40d8-ba3b-f2b3c976a86b', '9faeaa68-9024-4ee6-95ea-04746db2614f', 1, 'of');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6b8010e-a3a5-42cc-ae10-c6c18ef0e93e', '9faeaa68-9024-4ee6-95ea-04746db2614f', 2, 'for');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c605aff-15af-4235-abe0-ab963c53ec25', '9faeaa68-9024-4ee6-95ea-04746db2614f', 3, 'with');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9faeaa68-9024-4ee6-95ea-04746db2614f', '5d9c3e77-6fda-4436-893e-eeacbef36426', 'The idiomatic preposition following ''dependent'' is ''on'' — ''dependent on''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('64e89ecb-96c0-4634-b131-2cb9e13db07d', '9c41f530-08db-4047-8407-0b03c9afec65', 33, 'Convert to reported speech: She said, ''I will fix the bug by tomorrow.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb370f5d-4b6b-40e0-80df-cb8e9e569381', '64e89ecb-96c0-4634-b131-2cb9e13db07d', 0, 'She said that she will fix the bug by tomorrow.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('565bae09-f381-4e3e-98f6-a9f36a642c86', '64e89ecb-96c0-4634-b131-2cb9e13db07d', 1, 'She said that she would fix the bug by the next day.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76abc1f4-3cf5-490b-b4d5-d95645e81ce8', '64e89ecb-96c0-4634-b131-2cb9e13db07d', 2, 'She said that she fixes the bug by tomorrow.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('52ff3b14-5175-460a-ae14-86be9af6fc3b', '64e89ecb-96c0-4634-b131-2cb9e13db07d', 3, 'She said that she is fixing the bug by tomorrow.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('64e89ecb-96c0-4634-b131-2cb9e13db07d', '565bae09-f381-4e3e-98f6-a9f36a642c86', 'In reported speech, ''will'' shifts to ''would'', and ''tomorrow'' (relative to the original speech time) shifts to ''the next day'' when reported later.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c1202115-bea9-4649-b5cc-4fa114905042', '9c41f530-08db-4047-8407-0b03c9afec65', 34, 'Which of the following is spelled correctly?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0137450d-b835-41eb-b8dd-847354f09a80', 'c1202115-bea9-4649-b5cc-4fa114905042', 0, 'Occurance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5dee103-319e-4864-95af-120c5a0e6e76', 'c1202115-bea9-4649-b5cc-4fa114905042', 1, 'Occurrence');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abbc9c3f-5d26-4c1e-907e-bc574ff7942b', 'c1202115-bea9-4649-b5cc-4fa114905042', 2, 'Ocurrence');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b143b1d-a5c4-4749-944d-7d88e43880f3', 'c1202115-bea9-4649-b5cc-4fa114905042', 3, 'Occurrance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c1202115-bea9-4649-b5cc-4fa114905042', 'f5dee103-319e-4864-95af-120c5a0e6e76', '''Occurrence'' is the correct spelling — with a double ''c'', double ''r''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a0a19dc7-c3f0-4e72-a7d2-82b8898c42f5', '9c41f530-08db-4047-8407-0b03c9afec65', 35, 'Which sentence has correct subject-verb agreement?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('810e9c7f-0ddf-4faa-8335-a366106264c3', 'a0a19dc7-c3f0-4e72-a7d2-82b8898c42f5', 0, 'Each of the modules require separate testing.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3273755-fd74-4f71-9202-ed144f25681a', 'a0a19dc7-c3f0-4e72-a7d2-82b8898c42f5', 1, 'Each of the modules requires separate testing.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b273033-2b03-406c-b39c-cf2ac53972e4', 'a0a19dc7-c3f0-4e72-a7d2-82b8898c42f5', 2, 'Each of the module require separate testing.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6f8d2ca-6abe-4533-87f3-5b213cb6b6f5', 'a0a19dc7-c3f0-4e72-a7d2-82b8898c42f5', 3, 'Each of the modules has been require testing.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a0a19dc7-c3f0-4e72-a7d2-82b8898c42f5', 'b3273755-fd74-4f71-9202-ed144f25681a', '''Each'' is grammatically singular and requires a singular verb — ''requires'' is correct.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2f68b92d-3769-43ac-b529-2e65443ddb97', '9c41f530-08db-4047-8407-0b03c9afec65', 36, 'Pick the word closest in meaning to ''Deprecated'' (in a software/technical context):');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7478359-fefa-4f3c-aa13-45615c01ba4b', '2f68b92d-3769-43ac-b529-2e65443ddb97', 0, 'Newly released and actively promoted');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62ec1595-80cc-4589-a8bc-95cfbcec6523', '2f68b92d-3769-43ac-b529-2e65443ddb97', 1, 'Discouraged from use, typically because it has been superseded by a better alternative, though often still functional');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('672c3605-7bf8-4d97-b1da-ca9ce07f879c', '2f68b92d-3769-43ac-b529-2e65443ddb97', 2, 'Permanently deleted with no trace');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b868e86a-5305-4739-87e3-5f1492be7cc9', '2f68b92d-3769-43ac-b529-2e65443ddb97', 3, 'Made mandatory for all users');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2f68b92d-3769-43ac-b529-2e65443ddb97', '62ec1595-80cc-4589-a8bc-95cfbcec6523', 'In software, ''deprecated'' describes a feature or API that is discouraged from use (typically superseded by a newer alternative) but often still functions, at least temporarily, before eventual removal.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5bf7f159-7f4e-480f-9945-f7f666febb6d', '9c41f530-08db-4047-8407-0b03c9afec65', 37, 'Choose the correct sentence regarding ''between'' vs. ''among'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2731f91d-80a0-46cb-9841-dc15668d496f', '5bf7f159-7f4e-480f-9945-f7f666febb6d', 0, 'The load was balanced between the five servers.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0df1146a-ffee-437d-af19-52ed0e70056b', '5bf7f159-7f4e-480f-9945-f7f666febb6d', 1, 'The load was balanced among the five servers.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bab5728e-31c2-45a6-80ed-1bd6c112e0cf', '5bf7f159-7f4e-480f-9945-f7f666febb6d', 2, 'The load was balanced between the five server.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('582014f0-6bea-4f3e-8b27-138a95f7ec87', '5bf7f159-7f4e-480f-9945-f7f666febb6d', 3, 'The load was balanced among the five server.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5bf7f159-7f4e-480f-9945-f7f666febb6d', '0df1146a-ffee-437d-af19-52ed0e70056b', '''Among'' is used for three or more entities; since there are five servers, ''among'' is grammatically correct rather than ''between'' (traditionally reserved for exactly two).', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3f68eb62-427e-458c-99dd-f6126902819d', '9c41f530-08db-4047-8407-0b03c9afec65', 38, 'Which of these is punctuated correctly?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6dd4bfe5-ee72-4cd8-bf63-6ab959b6a4eb', '3f68eb62-427e-458c-99dd-f6126902819d', 0, 'The stack contains a header a payload, and a checksum.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e06d51f8-701c-4d48-abc9-f04ee7c21140', '3f68eb62-427e-458c-99dd-f6126902819d', 1, 'The stack contains a header, a payload and a checksum.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d23493d-00ff-4973-9419-692cbcca2e6c', '3f68eb62-427e-458c-99dd-f6126902819d', 2, 'The stack contains a header, a payload, and a checksum.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43da4312-6e26-492d-9fc1-c81c6e27d5d7', '3f68eb62-427e-458c-99dd-f6126902819d', 3, 'The stack contains; a header, a payload, a checksum.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3f68eb62-427e-458c-99dd-f6126902819d', '1d23493d-00ff-4973-9419-692cbcca2e6c', 'A comma should separate each item in a list, including before the final conjunction (Oxford comma), for maximum clarity.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5bf19bda-62b9-4e59-b798-ccc7ae3882e4', '9c41f530-08db-4047-8407-0b03c9afec65', 39, 'Pick the option nearest in meaning to the idiom ''to debug from the ground up'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5a541a1-9c44-4acc-ab99-58ad815a08ed', '5bf19bda-62b9-4e59-b798-ccc7ae3882e4', 0, 'To skip the initial stages of investigation entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9e64d4f-0509-4886-a534-72b876870131', '5bf19bda-62b9-4e59-b798-ccc7ae3882e4', 1, 'To systematically investigate a problem starting from its most fundamental, basic elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4b3a755-24f5-49b5-ba3c-669477b59c58', '5bf19bda-62b9-4e59-b798-ccc7ae3882e4', 2, 'To ignore the root cause');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ecf8646d-fa34-439f-a221-c71bbac362cf', '5bf19bda-62b9-4e59-b798-ccc7ae3882e4', 3, 'To only check the most recently changed code');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5bf19bda-62b9-4e59-b798-ccc7ae3882e4', 'f9e64d4f-0509-4886-a534-72b876870131', '''From the ground up'' means starting from the most basic/fundamental level — applied to debugging, it means systematically investigating from first principles rather than jumping to assumptions.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('29867bad-f927-42e9-98ec-c34f35ba22a3', '9c41f530-08db-4047-8407-0b03c9afec65', 40, 'Complete the sentence: ''The engineer''s ________ documentation made onboarding new team members much easier.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9deccca-837d-417b-9dca-12573cbfc2db', '29867bad-f927-42e9-98ec-c34f35ba22a3', 0, 'sparse');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae86701a-7896-41bf-b621-f2d813c9dd55', '29867bad-f927-42e9-98ec-c34f35ba22a3', 1, 'thorough');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e12a0923-b385-49b0-bcda-01a343fb9c7e', '29867bad-f927-42e9-98ec-c34f35ba22a3', 2, 'outdated');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9beaabbf-f089-4587-bbdb-28cf82aaac42', '29867bad-f927-42e9-98ec-c34f35ba22a3', 3, 'confusing');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('29867bad-f927-42e9-98ec-c34f35ba22a3', 'ae86701a-7896-41bf-b621-f2d813c9dd55', '''Thorough'' (comprehensive, detailed) fits the context of documentation praised for easing onboarding, unlike the negative alternatives.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('63fbac03-14f5-49dd-9edd-6f7e75714c95', '9c41f530-08db-4047-8407-0b03c9afec65', 41, 'Statements: All algorithms have a time complexity. Some time-complexity classes are considered efficient. Conclusions: I. Some algorithms are efficient. II. All time-complexity classes belong to algorithms. Which conclusion(s) follow?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10edcd78-a4e9-4a9e-b2ad-cf39aafb1d69', '63fbac03-14f5-49dd-9edd-6f7e75714c95', 0, 'Only I follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37acb5f4-c3e8-4445-b4c8-dc0cb1c0045b', '63fbac03-14f5-49dd-9edd-6f7e75714c95', 1, 'Only II follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3bc84d7d-92ad-4425-bc7b-7303947b3ef6', '63fbac03-14f5-49dd-9edd-6f7e75714c95', 2, 'Both follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('290c7087-9f11-40e9-93f8-9e0fd8568562', '63fbac03-14f5-49dd-9edd-6f7e75714c95', 3, 'Neither follows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('63fbac03-14f5-49dd-9edd-6f7e75714c95', '290c7087-9f11-40e9-93f8-9e0fd8568562', 'There''s no guarantee the ''efficient'' subset of time-complexity classes overlaps specifically with algorithms that HAVE those classes in a way that makes I certain, and II reverses the given relationship. Neither conclusion follows with certainty from strict syllogistic logic.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0fe61c85-36d9-439f-b51a-7e1d5d5897b9', '9c41f530-08db-4047-8407-0b03c9afec65', 42, 'If ''COMPUTER'' is coded as ''DPNQVUFS'' in a certain code, how is ''NETWORK'' coded in that language?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c1a0763-639d-48a5-b737-b0235238071d', '0fe61c85-36d9-439f-b51a-7e1d5d5897b9', 0, 'OFUXPSL');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('595a9ad1-01b1-4d92-a18f-409e1a8fe739', '0fe61c85-36d9-439f-b51a-7e1d5d5897b9', 1, 'OFUXOSL');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d08ae73-ded9-4445-982e-091f751288c3', '0fe61c85-36d9-439f-b51a-7e1d5d5897b9', 2, 'OFTXPSL');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe17ac7c-524c-42ff-88aa-bcbaa9d7c344', '0fe61c85-36d9-439f-b51a-7e1d5d5897b9', 3, 'OFUXPSK');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0fe61c85-36d9-439f-b51a-7e1d5d5897b9', '6c1a0763-639d-48a5-b737-b0235238071d', 'Each letter is shifted forward by 1 (C→D, O→P, M→N, P→Q, U→V, T→U, E→F, R→S). Applying this to NETWORK: N→O, E→F, T→U, W→X, O→P, R→S, K→L, giving ''OFUXPSL''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cc224587-08ee-4666-be55-3f5c0ec0613c', '9c41f530-08db-4047-8407-0b03c9afec65', 43, 'Find the next number in the series: 1, 4, 9, 16, 25, ?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d56864f9-1707-4fd7-9ff2-93e819c898ed', 'cc224587-08ee-4666-be55-3f5c0ec0613c', 0, '30');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92ad8d99-a7d9-4442-8523-2259aa0ec14b', 'cc224587-08ee-4666-be55-3f5c0ec0613c', 1, '36');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49b756f8-8900-4d1b-b5ac-efaf0278e907', 'cc224587-08ee-4666-be55-3f5c0ec0613c', 2, '42');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e702d06b-6759-4ecd-aafd-75b060d345c5', 'cc224587-08ee-4666-be55-3f5c0ec0613c', 3, '49');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cc224587-08ee-4666-be55-3f5c0ec0613c', '92ad8d99-a7d9-4442-8523-2259aa0ec14b', 'This is the series of perfect squares: 1², 2², 3², 4², 5², so the next term is 6² = 36.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fd96fb58-166a-47bf-b134-1a1542d6bf5c', '9c41f530-08db-4047-8407-0b03c9afec65', 44, 'Choose the odd one out: Stack, Queue, Linked List, Compiler');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d337e77-7595-4205-b8f0-ec1d269740f6', 'fd96fb58-166a-47bf-b134-1a1542d6bf5c', 0, 'Stack');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51047f0f-101c-47c4-8834-85239620193e', 'fd96fb58-166a-47bf-b134-1a1542d6bf5c', 1, 'Queue');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72b4864b-14cd-4b36-948c-035f11ea51fe', 'fd96fb58-166a-47bf-b134-1a1542d6bf5c', 2, 'Linked List');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5429cd6-9508-41bc-bd96-e87685a9e343', 'fd96fb58-166a-47bf-b134-1a1542d6bf5c', 3, 'Compiler');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fd96fb58-166a-47bf-b134-1a1542d6bf5c', 'e5429cd6-9508-41bc-bd96-e87685a9e343', 'Stack, Queue, and Linked List are all data structures; a Compiler is a software tool that translates source code, not a data structure — the odd one out.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('18404d98-01fb-4e5b-8bf7-7a4aff231e4c', '9c41f530-08db-4047-8407-0b03c9afec65', 45, 'Five processes P, Q, R, S, T have different priorities. P has higher priority than Q but lower than R. S has the lowest priority. T has higher priority than R. What is the correct order from highest to lowest priority?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b213ec1f-0fbd-4550-9409-7acf0e16dfd4', '18404d98-01fb-4e5b-8bf7-7a4aff231e4c', 0, 'T, R, P, Q, S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f91997f3-a725-4683-8f13-a6bd16db0835', '18404d98-01fb-4e5b-8bf7-7a4aff231e4c', 1, 'T, R, Q, P, S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('469499d3-7ad9-41aa-a194-ae94b8b3d5e4', '18404d98-01fb-4e5b-8bf7-7a4aff231e4c', 2, 'R, T, P, Q, S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3fdc00fa-037b-48fc-99ea-47bc4e52d93a', '18404d98-01fb-4e5b-8bf7-7a4aff231e4c', 3, 'T, P, R, Q, S');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('18404d98-01fb-4e5b-8bf7-7a4aff231e4c', 'b213ec1f-0fbd-4550-9409-7acf0e16dfd4', 'Given: R > P > Q, T > R, S is lowest. Combining: T > R > P > Q > S — matching option A.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('79f8a858-a6ae-4b93-8f65-91ad0742a802', '9c41f530-08db-4047-8407-0b03c9afec65', 46, 'If ''A → B'' means ''A calls function B'' and ''B ↔ C'' means ''B and C share memory'', what does ''P → Q ↔ R'' establish?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cbb153e6-5eaf-4e8f-928b-ab0c36f6330b', '79f8a858-a6ae-4b93-8f65-91ad0742a802', 0, 'P calls Q, and Q shares memory with R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a421de3c-1285-40dd-a330-857bd93bae67', '79f8a858-a6ae-4b93-8f65-91ad0742a802', 1, 'R calls P directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ae894d8-65b3-491f-871a-8b8be97d3375', '79f8a858-a6ae-4b93-8f65-91ad0742a802', 2, 'P and R share memory directly, with no involvement from Q');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f2fb772-a6d3-4938-a214-5882e95a5dc5', '79f8a858-a6ae-4b93-8f65-91ad0742a802', 3, 'No relationship can be established');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('79f8a858-a6ae-4b93-8f65-91ad0742a802', 'cbb153e6-5eaf-4e8f-928b-ab0c36f6330b', '''P → Q'' means P calls function Q. ''Q ↔ R'' means Q and R share memory. Combined: P calls Q, and Q shares memory with R — matching option A; note this does NOT establish a direct relationship between P and R.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2263ed55-0c7a-479d-b25c-5163ff392cf2', '9c41f530-08db-4047-8407-0b03c9afec65', 47, 'Complete the analogy: Compiler is to Source Code as Interpreter is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f31cc7f5-a938-4a04-8d77-d092cde7642b', '2263ed55-0c7a-479d-b25c-5163ff392cf2', 0, 'Machine Code');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16075b0a-0601-400d-90fc-a55921c087a8', '2263ed55-0c7a-479d-b25c-5163ff392cf2', 1, 'Source Code (executed line-by-line rather than compiled ahead of time)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30bdd31a-e0e0-4334-9b59-7c192d5181ed', '2263ed55-0c7a-479d-b25c-5163ff392cf2', 2, 'Object File');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6523301-3868-4b8a-9eb8-f7c11fcb2ea0', '2263ed55-0c7a-479d-b25c-5163ff392cf2', 3, 'Assembly Code');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2263ed55-0c7a-479d-b25c-5163ff392cf2', '16075b0a-0601-400d-90fc-a55921c087a8', 'A compiler translates entire source code into machine code ahead of execution; an interpreter processes source code directly, typically line-by-line, at execution time — the analogy pairs each tool with the input form it directly acts on.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4a035c51-a96d-41f2-9e2e-300bc4638403', '9c41f530-08db-4047-8407-0b03c9afec65', 48, 'In a certain code, if ''STACK'' is coded as ''19-20-1-3-11'' (each letter replaced by its alphabetical position), what is ''QUEUE'' coded as?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58e68f8f-147a-4e99-8b48-127cce93fb45', '4a035c51-a96d-41f2-9e2e-300bc4638403', 0, '17-21-5-21-5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fddb98a0-55aa-4649-b15a-a730e0dc0e0c', '4a035c51-a96d-41f2-9e2e-300bc4638403', 1, '17-20-5-21-5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7d01f66-e4df-401e-ae40-50cd94bd31d0', '4a035c51-a96d-41f2-9e2e-300bc4638403', 2, '16-21-5-21-5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb72a4f9-cb0c-4fc5-be37-15cda406f73f', '4a035c51-a96d-41f2-9e2e-300bc4638403', 3, '17-21-5-20-5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4a035c51-a96d-41f2-9e2e-300bc4638403', '58e68f8f-147a-4e99-8b48-127cce93fb45', 'Q=17, U=21, E=5, U=21, E=5 — matching each letter to its exact alphabetical position gives ''17-21-5-21-5''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5f241df9-d4d1-44ff-a007-4fdb1a949473', '9c41f530-08db-4047-8407-0b03c9afec65', 49, 'A is the parent process of B. C is the child process of B. D is the parent process of A. How is D related to C?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b5f0ba8-f158-480a-a3ad-bb7a1f0d49b6', '5f241df9-d4d1-44ff-a007-4fdb1a949473', 0, 'Grandparent process');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac00bbd3-7b51-4e5f-b2cc-78b3b436d807', '5f241df9-d4d1-44ff-a007-4fdb1a949473', 1, 'Sibling process');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc4c5596-d158-432c-8fc4-9139d7d75049', '5f241df9-d4d1-44ff-a007-4fdb1a949473', 2, 'Child process');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1757f5b-abc6-4dab-8e46-d6e8b80da19b', '5f241df9-d4d1-44ff-a007-4fdb1a949473', 3, 'No relationship');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5f241df9-d4d1-44ff-a007-4fdb1a949473', '4b5f0ba8-f158-480a-a3ad-bb7a1f0d49b6', 'D is A''s parent, A is B''s parent, and C is B''s child — so D is two levels above C in the process hierarchy (D → A → B → C), making D the grandparent process of C (via A and B).', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e82e5290-0b2b-4d98-b167-547aaae79b74', '9c41f530-08db-4047-8407-0b03c9afec65', 50, 'Statements: No array is a linked list. All linked lists are dynamic data structures. Conclusions: I. No array is a dynamic data structure. II. Some dynamic data structures are linked lists. Which conclusion(s) follow?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed26890a-0ead-4099-b69e-9e016704567f', 'e82e5290-0b2b-4d98-b167-547aaae79b74', 0, 'Only I follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79fe9988-8e94-49fa-bee5-2cfce90df874', 'e82e5290-0b2b-4d98-b167-547aaae79b74', 1, 'Only II follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2deebc4a-1ac4-4dbc-9365-f5b90cfe0500', 'e82e5290-0b2b-4d98-b167-547aaae79b74', 2, 'Both follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dde2d4d7-3a0b-470b-a856-80cd59d6ccf4', 'e82e5290-0b2b-4d98-b167-547aaae79b74', 3, 'Neither follows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e82e5290-0b2b-4d98-b167-547aaae79b74', '79fe9988-8e94-49fa-bee5-2cfce90df874', '''No array is a linked list'' and ''All linked lists are dynamic data structures'' does NOT imply ''no array is a dynamic data structure'' (an array could still be dynamic through a different path, e.g. a dynamic array) — so I does not follow. ''All linked lists are dynamic data structures'' directly implies ''Some dynamic data structures are linked lists'' — so II follows.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7a80c929-f550-4627-971e-945acd4ad49d', '9c41f530-08db-4047-8407-0b03c9afec65', 51, 'A clock shows 2:50. What is the angle between the hour and minute hands?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b73f8503-5fb4-44b4-9f77-3341c309348d', '7a80c929-f550-4627-971e-945acd4ad49d', 0, '125°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8740fee8-9580-4d2e-852b-585865b69fe4', '7a80c929-f550-4627-971e-945acd4ad49d', 1, '135°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b9ce29f-cd7a-4069-8f81-08182086efee', '7a80c929-f550-4627-971e-945acd4ad49d', 2, '145°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0fc680f-4123-4a0e-a9a6-18aea41025a1', '7a80c929-f550-4627-971e-945acd4ad49d', 3, '155°');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7a80c929-f550-4627-971e-945acd4ad49d', '5b9ce29f-cd7a-4069-8f81-08182086efee', 'At 2:50, the minute hand is at the ''10'' position (300° from 12). The hour hand is at 2×30 + 50×0.5 = 60 + 25 = 85° from 12. The raw difference is |300 − 85| = 215°; since this exceeds 180°, the actual angle between the hands is 360 − 215 = 145°.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a42d3ca8-3016-473b-a798-c11c5525c8d5', '9c41f530-08db-4047-8407-0b03c9afec65', 52, 'Find the odd one out: (2,4), (3,9), (4,16), (5,20)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80afb045-3cd1-4094-9319-dc4ab7e3314a', 'a42d3ca8-3016-473b-a798-c11c5525c8d5', 0, '(2,4)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8aa03455-bd25-4d61-b4f3-0ecd64fa2ddd', 'a42d3ca8-3016-473b-a798-c11c5525c8d5', 1, '(3,9)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c135eef1-fc0d-456b-a04a-f0d2426020f8', 'a42d3ca8-3016-473b-a798-c11c5525c8d5', 2, '(4,16)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6e480e5-f40b-45c0-b654-f3900d860743', 'a42d3ca8-3016-473b-a798-c11c5525c8d5', 3, '(5,20)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a42d3ca8-3016-473b-a798-c11c5525c8d5', 'a6e480e5-f40b-45c0-b654-f3900d860743', 'In (2,4), (3,9), and (4,16), the second number is the square of the first (2²=4, 3²=9, 4²=16). In (5,20), 5²=25, not 20 — this pair breaks the pattern.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('db838b7b-a459-4199-9c36-95c698f0ccfd', '9c41f530-08db-4047-8407-0b03c9afec65', 53, 'If North becomes East, East becomes South, then West becomes:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('569bdb59-8554-4bab-a0ab-0d7fe3917753', 'db838b7b-a459-4199-9c36-95c698f0ccfd', 0, 'North');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d483d51b-2f5c-4350-9616-106a74d2ae2c', 'db838b7b-a459-4199-9c36-95c698f0ccfd', 1, 'South');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9586c37-2f6b-4a69-960f-0b93a3fbea4c', 'db838b7b-a459-4199-9c36-95c698f0ccfd', 2, 'East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3adeea39-fc25-4547-bdea-24ac0d02b443', 'db838b7b-a459-4199-9c36-95c698f0ccfd', 3, 'West stays the same');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('db838b7b-a459-4199-9c36-95c698f0ccfd', '569bdb59-8554-4bab-a0ab-0d7fe3917753', 'The transformation is a 90° clockwise rotation of directions (North→East is 90° clockwise; East→South confirms the same 90° clockwise shift). Applying the same 90° clockwise rotation to West gives North.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('aa777c45-023d-4879-9ca8-df36c44d8274', '9c41f530-08db-4047-8407-0b03c9afec65', 54, 'A can complete a coding task in 8 hours, and B can complete it in 12 hours. Working together, how long will they take?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd5b0a20-0b6a-4ccb-8862-28109596805d', 'aa777c45-023d-4879-9ca8-df36c44d8274', 0, '4.2 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a410d13-11c9-4e2e-b6ce-c2f45a6fa668', 'aa777c45-023d-4879-9ca8-df36c44d8274', 1, '4.8 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('326f2ae0-fbdd-46f0-b789-cac48b891473', 'aa777c45-023d-4879-9ca8-df36c44d8274', 2, '5.2 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5f490e2-6b82-455d-b59a-f80c183c2faf', 'aa777c45-023d-4879-9ca8-df36c44d8274', 3, '6 hours');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aa777c45-023d-4879-9ca8-df36c44d8274', '9a410d13-11c9-4e2e-b6ce-c2f45a6fa668', 'A''s rate = 1/8, B''s rate = 1/12. Combined rate = 1/8 + 1/12 = 3/24 + 2/24 = 5/24 (jobs/hour). Time = 24/5 = 4.8 hours.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3d953b7b-f973-4e38-b4bb-1522f4fe5efe', '9c41f530-08db-4047-8407-0b03c9afec65', 55, 'Choose the word that does NOT belong with the others: RAM, ROM, Cache, Compiler');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('319c05c1-4f68-4df7-b28a-d803e4e6c1dc', '3d953b7b-f973-4e38-b4bb-1522f4fe5efe', 0, 'RAM');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e43caa77-e452-401c-98bc-1c9453d6f1d9', '3d953b7b-f973-4e38-b4bb-1522f4fe5efe', 1, 'ROM');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db456be7-145a-4350-a181-9ee888062e54', '3d953b7b-f973-4e38-b4bb-1522f4fe5efe', 2, 'Cache');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60e3b03e-af1b-4cee-8a5c-99febbc80498', '3d953b7b-f973-4e38-b4bb-1522f4fe5efe', 3, 'Compiler');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3d953b7b-f973-4e38-b4bb-1522f4fe5efe', '60e3b03e-af1b-4cee-8a5c-99febbc80498', 'RAM, ROM, and Cache are all types of computer memory; a Compiler is a software tool, not a memory type — the odd one out.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('892d57bf-2174-4ba2-a9fc-d91e2ba26ebf', '9c41f530-08db-4047-8407-0b03c9afec65', 56, 'In a row of 60 servers, one server is 25th from the left. What is its position from the right?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b332b9c6-4073-4ace-8944-d77432f60b7e', '892d57bf-2174-4ba2-a9fc-d91e2ba26ebf', 0, '35th');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba285a24-052c-46e3-b8d6-97d2cdc5c2eb', '892d57bf-2174-4ba2-a9fc-d91e2ba26ebf', 1, '36th');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8bba83f5-f233-4415-a912-405b34a81193', '892d57bf-2174-4ba2-a9fc-d91e2ba26ebf', 2, '37th');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49e7e460-c030-402a-b10c-e881565c2c7f', '892d57bf-2174-4ba2-a9fc-d91e2ba26ebf', 3, '34th');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('892d57bf-2174-4ba2-a9fc-d91e2ba26ebf', 'ba285a24-052c-46e3-b8d6-97d2cdc5c2eb', 'Position from the right = (Total − Position from left) + 1 = (60 − 25) + 1 = 36th from the right.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('47785416-4575-4f70-8809-10ef924b7644', '9c41f530-08db-4047-8407-0b03c9afec65', 57, 'Which term logically completes the series: RAM, Cache, Register, ?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7a8a420-92b5-4fc9-9c4b-08e19c8e1033', '47785416-4575-4f70-8809-10ef924b7644', 0, 'Hard Disk (much slower access, breaking the increasing-speed/decreasing-capacity pattern toward the CPU)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b4d3c80-b256-4482-8dd2-ee2bbbd4b7cd', '47785416-4575-4f70-8809-10ef924b7644', 1, 'L1 Cache (even closer to the CPU, continuing the pattern of increasing speed and proximity)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d79b944d-50f0-4dcb-a236-6443accf0dbd', '47785416-4575-4f70-8809-10ef924b7644', 2, 'Network Storage (far slower and farther from the CPU)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2657a40d-893b-4afa-acc7-cc0fc8cd535f', '47785416-4575-4f70-8809-10ef924b7644', 3, 'Optical Disc (far slower, unrelated to the memory hierarchy''s fast end)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('47785416-4575-4f70-8809-10ef924b7644', '3b4d3c80-b256-4482-8dd2-ee2bbbd4b7cd', 'RAM, Cache, and Register represent progressively faster, smaller, and closer-to-CPU levels of the memory hierarchy. L1 Cache continues this pattern (even faster/closer than general cache, closest to the CPU core) — the other options move in the opposite direction (slower, farther from CPU).', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fb805bd6-994f-48b7-bb35-c12acef7e9ed', '9c41f530-08db-4047-8407-0b03c9afec65', 58, 'If today is Thursday, what day was it 50 days ago?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9e3d2b0-f551-4eeb-be37-7f59e5779d5d', 'fb805bd6-994f-48b7-bb35-c12acef7e9ed', 0, 'Tuesday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b01bb31a-4f51-4df1-a18e-c02158bcd757', 'fb805bd6-994f-48b7-bb35-c12acef7e9ed', 1, 'Wednesday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('808d457c-5a16-445d-8024-03c82d6ad8b2', 'fb805bd6-994f-48b7-bb35-c12acef7e9ed', 2, 'Monday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('871aae01-9ac9-4d7a-9684-8afcf34aa094', 'fb805bd6-994f-48b7-bb35-c12acef7e9ed', 3, 'Friday');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fb805bd6-994f-48b7-bb35-c12acef7e9ed', 'b01bb31a-4f51-4df1-a18e-c02158bcd757', '50 days = 7 weeks + 1 day. Going back exactly 7 weeks from Thursday lands on Thursday again; one more day back gives Wednesday. So 50 days ago was Wednesday.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fd04fcbc-64f0-4709-8b83-8476041edbdc', '9c41f530-08db-4047-8407-0b03c9afec65', 59, 'Statements: All compilers translate code. Some code-translation tools are open source. Conclusion: Some compilers are open source. Is this conclusion valid based strictly on the statements given?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49b681c4-9389-4024-b680-3c489e49bcee', 'fd04fcbc-64f0-4709-8b83-8476041edbdc', 0, 'Valid — it follows directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de749a57-81d6-4d1d-aaff-938c4960565b', 'fd04fcbc-64f0-4709-8b83-8476041edbdc', 1, 'Invalid — it does not necessarily follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7b8a278-b352-4689-ba07-580a06cdd1f5', 'fd04fcbc-64f0-4709-8b83-8476041edbdc', 2, 'Valid only if all code-translation tools are compilers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b98b2fb5-a695-41e8-99e4-565cb658c18a', 'fd04fcbc-64f0-4709-8b83-8476041edbdc', 3, 'Cannot be determined without additional data');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fd04fcbc-64f0-4709-8b83-8476041edbdc', 'de749a57-81d6-4d1d-aaff-938c4960565b', 'The statements establish compilers are a subset of code-translation tools, and some (unspecified) code-translation tools are open source — but there''s no guarantee the ''open source'' subset overlaps with ''compilers'' specifically. The conclusion does not necessarily follow.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('842e05c7-1891-4054-9e0f-05367e77bcd7', '9c41f530-08db-4047-8407-0b03c9afec65', 60, 'A mother''s age is 3 times her daughter''s age. In 15 years, the mother''s age will be twice the daughter''s age. What is the daughter''s current age?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6bfdf06-a72b-4776-949f-a99479b67f47', '842e05c7-1891-4054-9e0f-05367e77bcd7', 0, '10 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ccb9e4f0-8aa2-4413-b506-1e2bb4649260', '842e05c7-1891-4054-9e0f-05367e77bcd7', 1, '12 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7981a808-6fe7-4f44-90f7-83409af2a2a3', '842e05c7-1891-4054-9e0f-05367e77bcd7', 2, '15 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c11eaed-74f8-4642-b145-ea8ea11d6a44', '842e05c7-1891-4054-9e0f-05367e77bcd7', 3, '18 years');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('842e05c7-1891-4054-9e0f-05367e77bcd7', '7981a808-6fe7-4f44-90f7-83409af2a2a3', 'Let daughter''s age = x, mother''s age = 3x. In 15 years: (3x+15) = 2(x+15). Solving: 3x+15 = 2x+30, so x=15. Daughter''s current age is 15 years.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

-- ── Section: Computer Science & IT (Discipline) (100 questions) — Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fdcdb7ba-2cba-4cee-9a77-2ba33aee2c7a', '9c41f530-08db-4047-8407-0b03c9afec65', 61, 'A stack data structure follows which access principle?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6168269e-e731-4bf1-8d97-d7576618486c', 'fdcdb7ba-2cba-4cee-9a77-2ba33aee2c7a', 0, 'First-In-First-Out (FIFO)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e97ce5a-8161-4916-a457-073bd1073728', 'fdcdb7ba-2cba-4cee-9a77-2ba33aee2c7a', 1, 'Last-In-First-Out (LIFO)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5f840f0-5ec4-46bc-beeb-794645ef126e', 'fdcdb7ba-2cba-4cee-9a77-2ba33aee2c7a', 2, 'Random access');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc70190a-7cde-4816-b12d-11d1b1452b1e', 'fdcdb7ba-2cba-4cee-9a77-2ba33aee2c7a', 3, 'Priority-based access only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fdcdb7ba-2cba-4cee-9a77-2ba33aee2c7a', '0e97ce5a-8161-4916-a457-073bd1073728', 'A stack follows Last-In-First-Out (LIFO) — the most recently added (pushed) element is the first one removed (popped), like a stack of physical plates.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('75a561eb-e061-422f-8206-7926c675ad49', '9c41f530-08db-4047-8407-0b03c9afec65', 62, 'A queue data structure follows which access principle?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91e3ef7a-36b1-49b5-9e2b-e303b38c3b46', '75a561eb-e061-422f-8206-7926c675ad49', 0, 'Last-In-First-Out (LIFO)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8c861d8-896d-4141-9fe0-3cc4acbb5c27', '75a561eb-e061-422f-8206-7926c675ad49', 1, 'First-In-First-Out (FIFO)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c29e71d-d5d8-4ddb-b43c-ffc63a8b7af7', '75a561eb-e061-422f-8206-7926c675ad49', 2, 'Random access');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0940075b-1dfd-44d6-8857-cf1c427d941d', '75a561eb-e061-422f-8206-7926c675ad49', 3, 'Reverse order access');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('75a561eb-e061-422f-8206-7926c675ad49', 'c8c861d8-896d-4141-9fe0-3cc4acbb5c27', 'A queue follows First-In-First-Out (FIFO) — the earliest-added element is the first one removed, like a real-world line/queue of people.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ab0fded7-3cee-4e2e-9b83-8ab13ee8fb97', '9c41f530-08db-4047-8407-0b03c9afec65', 63, 'The time complexity of binary search on a sorted array of n elements is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca6db9cd-eebc-4dab-bef1-1c1b25148665', 'ab0fded7-3cee-4e2e-9b83-8ab13ee8fb97', 0, 'O(n)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0cd2b1ff-2443-4c20-aa6d-0c1f282ceea8', 'ab0fded7-3cee-4e2e-9b83-8ab13ee8fb97', 1, 'O(log n)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d000747-a70e-4b1f-a2e7-0162164d1ff6', 'ab0fded7-3cee-4e2e-9b83-8ab13ee8fb97', 2, 'O(n log n)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('607ca611-2186-4942-8dfa-f53dcfdb1238', 'ab0fded7-3cee-4e2e-9b83-8ab13ee8fb97', 3, 'O(n²)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ab0fded7-3cee-4e2e-9b83-8ab13ee8fb97', '0cd2b1ff-2443-4c20-aa6d-0c1f282ceea8', 'Binary search repeatedly halves the search space, giving a time complexity of O(log n) — significantly more efficient than linear search''s O(n) for large sorted datasets.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8ca307ac-323c-49ef-86c9-727baa80df28', '9c41f530-08db-4047-8407-0b03c9afec65', 64, 'The worst-case time complexity of Quicksort is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40548d7f-d390-408e-9f4d-aacef370a8d8', '8ca307ac-323c-49ef-86c9-727baa80df28', 0, 'O(n log n)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8271f31d-e945-4313-a90e-3fe6f9207cf3', '8ca307ac-323c-49ef-86c9-727baa80df28', 1, 'O(n²)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd545406-a25c-4616-805c-3fe9cc7dd41d', '8ca307ac-323c-49ef-86c9-727baa80df28', 2, 'O(log n)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50f700ae-d51b-47a8-84a3-455cc307dcd8', '8ca307ac-323c-49ef-86c9-727baa80df28', 3, 'O(n)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8ca307ac-323c-49ef-86c9-727baa80df28', '8271f31d-e945-4313-a90e-3fe6f9207cf3', 'Quicksort has an average-case time complexity of O(n log n), but its worst-case (occurring with a poor pivot selection, e.g., an already-sorted array with a naive pivot choice) is O(n²) — a well-known, frequently-tested distinction.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('393ba864-b97c-4ddb-812d-58bb08c0068a', '9c41f530-08db-4047-8407-0b03c9afec65', 65, 'Merge sort''s time complexity, in both average and worst case, is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('990c25b8-6df4-41dc-b11f-1f04b864c2ac', '393ba864-b97c-4ddb-812d-58bb08c0068a', 0, 'O(n)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c45f3c7f-402b-4cad-8724-b9175583feb9', '393ba864-b97c-4ddb-812d-58bb08c0068a', 1, 'O(n log n)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68e0ac8b-49f1-40fb-8fde-b799ffb17cb0', '393ba864-b97c-4ddb-812d-58bb08c0068a', 2, 'O(n²)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1293972d-e4bb-4a8f-be58-f404fca755e7', '393ba864-b97c-4ddb-812d-58bb08c0068a', 3, 'O(log n)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('393ba864-b97c-4ddb-812d-58bb08c0068a', 'c45f3c7f-402b-4cad-8724-b9175583feb9', 'Merge sort consistently achieves O(n log n) time complexity in all cases (best, average, worst), due to its divide-and-conquer approach with a guaranteed balanced split — unlike Quicksort, whose worst case can degrade to O(n²).', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b6c4c20d-a2ef-485b-8d00-9a3aa5fa4d1f', '9c41f530-08db-4047-8407-0b03c9afec65', 66, 'A binary search tree (BST) maintains the property that, for any node:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae370371-8bb1-49fc-8b1b-0385c0ada4f9', 'b6c4c20d-a2ef-485b-8d00-9a3aa5fa4d1f', 0, 'All values in the tree are identical');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8e6b858-fca0-402f-b4a4-90bfc1196fe6', 'b6c4c20d-a2ef-485b-8d00-9a3aa5fa4d1f', 1, 'All values in its left subtree are smaller, and all values in its right subtree are larger');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1cf5790-3b18-402a-b950-9afddc8c7377', 'b6c4c20d-a2ef-485b-8d00-9a3aa5fa4d1f', 2, 'The tree has no leaf nodes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5e7f471-2012-4a4b-afce-9973eccd2e1d', 'b6c4c20d-a2ef-485b-8d00-9a3aa5fa4d1f', 3, 'All nodes have exactly two children');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b6c4c20d-a2ef-485b-8d00-9a3aa5fa4d1f', 'c8e6b858-fca0-402f-b4a4-90bfc1196fe6', 'A BST maintains the ordering invariant that, for every node, all values in its left subtree are smaller than the node''s value, and all values in its right subtree are larger — enabling efficient O(log n) average-case search, insertion, and deletion.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('70698bf9-c595-4398-be5d-2c3711b6e1bb', '9c41f530-08db-4047-8407-0b03c9afec65', 67, 'A hash table''s average-case time complexity for search, insert, and delete operations (with a good hash function and low collision rate) is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f7e2eac-b9b2-4ce5-85c5-9b671a74632f', '70698bf9-c595-4398-be5d-2c3711b6e1bb', 0, 'O(n)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07ee87e5-ad37-4010-b903-7df5192493b5', '70698bf9-c595-4398-be5d-2c3711b6e1bb', 1, 'O(1)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20acdafc-a1f4-40ce-8364-a28109a2fa18', '70698bf9-c595-4398-be5d-2c3711b6e1bb', 2, 'O(n²)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e68cd01c-6eee-4f9b-ae17-56e076f3dabe', '70698bf9-c595-4398-be5d-2c3711b6e1bb', 3, 'O(log n)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('70698bf9-c595-4398-be5d-2c3711b6e1bb', '07ee87e5-ad37-4010-b903-7df5192493b5', 'A well-designed hash table achieves O(1) (constant time) average-case complexity for search, insert, and delete operations, since the hash function directly maps a key to its storage location — though worst-case (with many collisions) can degrade to O(n).', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0638eea9-b377-460e-bf5d-f3a65ef6e206', '9c41f530-08db-4047-8407-0b03c9afec65', 68, 'A graph traversal algorithm that explores as far as possible along each branch before backtracking is called:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d80f5e6b-52c2-43d2-84b1-84959cbaf67f', '0638eea9-b377-460e-bf5d-f3a65ef6e206', 0, 'Breadth-First Search (BFS)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57f8205a-e992-4252-a2fa-c6b837c9479c', '0638eea9-b377-460e-bf5d-f3a65ef6e206', 1, 'Depth-First Search (DFS)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5e47977-27f2-4fe2-8218-4c86abc6f72f', '0638eea9-b377-460e-bf5d-f3a65ef6e206', 2, 'Dijkstra''s Algorithm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20275168-c8a8-44b3-85cc-da8797394dbe', '0638eea9-b377-460e-bf5d-f3a65ef6e206', 3, 'Binary Search');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0638eea9-b377-460e-bf5d-f3a65ef6e206', '57f8205a-e992-4252-a2fa-c6b837c9479c', 'Depth-First Search (DFS) explores as deep as possible along each branch before backtracking, typically implemented using a stack (explicitly or via recursion) — contrasted with Breadth-First Search (BFS), which explores level by level using a queue.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b2ea52da-109a-4b13-8160-20df5c9ed332', '9c41f530-08db-4047-8407-0b03c9afec65', 69, 'Dijkstra''s algorithm is used to find:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b0d816a-3401-4b11-b7e4-e44387db5466', 'b2ea52da-109a-4b13-8160-20df5c9ed332', 0, 'The minimum spanning tree of a graph');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86d4eb6e-764c-4cea-bbf5-59064b573d0d', 'b2ea52da-109a-4b13-8160-20df5c9ed332', 1, 'The shortest path from a single source vertex to all other vertices in a weighted graph (with non-negative edge weights)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7fbc1a9-a53a-4be8-957d-df982915b771', 'b2ea52da-109a-4b13-8160-20df5c9ed332', 2, 'Whether a graph contains a cycle only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97682b89-eaf3-417e-b936-0c5f2cd52d31', 'b2ea52da-109a-4b13-8160-20df5c9ed332', 3, 'The maximum flow in a network');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b2ea52da-109a-4b13-8160-20df5c9ed332', '86d4eb6e-764c-4cea-bbf5-59064b573d0d', 'Dijkstra''s algorithm computes the shortest path from a single source vertex to all other vertices in a weighted graph, provided all edge weights are non-negative — a foundational graph algorithm widely used in routing and network path-finding.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('28d33bb1-65b2-418c-b75f-495b4e90aca3', '9c41f530-08db-4047-8407-0b03c9afec65', 70, 'A linked list, compared to an array, generally offers the advantage of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbc5fa18-7b8c-4dc0-8cd5-a32b51aaad41', '28d33bb1-65b2-418c-b75f-495b4e90aca3', 0, 'Constant-time random access to any element');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc7df2ce-a3d1-4aee-8d15-37828d936eeb', '28d33bb1-65b2-418c-b75f-495b4e90aca3', 1, 'Efficient insertion/deletion at arbitrary positions without shifting other elements, at the cost of no direct random access');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55b69387-9bef-4c5f-9aab-194f742ddef0', '28d33bb1-65b2-418c-b75f-495b4e90aca3', 2, 'Guaranteed lower memory usage in every case');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6447851-7a45-4758-b655-50e99bc65714', '28d33bb1-65b2-418c-b75f-495b4e90aca3', 3, 'Requiring no pointers/references');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('28d33bb1-65b2-418c-b75f-495b4e90aca3', 'fc7df2ce-a3d1-4aee-8d15-37828d936eeb', 'A linked list allows efficient O(1) insertion/deletion at a given node (once located) without shifting subsequent elements, unlike an array, where such an operation requires shifting elements — but a linked list sacrifices the array''s O(1) random-access-by-index capability.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bc8e768c-6ad5-4500-8df0-1dbde372f27c', '9c41f530-08db-4047-8407-0b03c9afec65', 71, 'A ''heap'' data structure, commonly used to implement a priority queue, maintains which property?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('222f0ac3-516c-41bf-8acd-7a1750e832bb', 'bc8e768c-6ad5-4500-8df0-1dbde372f27c', 0, 'Elements are stored in strictly alphabetical order');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89ab500b-c8e8-41a8-968c-3c6470e70140', 'bc8e768c-6ad5-4500-8df0-1dbde372f27c', 1, 'Every parent node''s value is either always greater than (max-heap) or always less than (min-heap) its children''s values');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('29b6ac4c-bbd0-4790-8d03-5abc1decfb23', 'bc8e768c-6ad5-4500-8df0-1dbde372f27c', 2, 'Only leaf nodes store data');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34ce4ed2-7dbc-4cd4-876e-0185a7407ac2', 'bc8e768c-6ad5-4500-8df0-1dbde372f27c', 3, 'It is always a linear (non-tree) structure');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bc8e768c-6ad5-4500-8df0-1dbde372f27c', '89ab500b-c8e8-41a8-968c-3c6470e70140', 'A heap is a complete binary tree satisfying the heap property: in a max-heap, every parent''s value is greater than or equal to its children''s values (and vice versa for a min-heap) — enabling efficient O(log n) insertion and O(1) access to the maximum (or minimum) element.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f2e57b00-400d-42f5-8cda-37da67e8964f', '9c41f530-08db-4047-8407-0b03c9afec65', 72, 'Dynamic programming is an algorithmic technique primarily suited to problems that exhibit:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5676bec6-839e-44ca-920f-44bb2353fa9c', 'f2e57b00-400d-42f5-8cda-37da67e8964f', 0, 'No repeating substructure at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f794d1fd-7215-42e3-bd68-d2440a13d9fd', 'f2e57b00-400d-42f5-8cda-37da67e8964f', 1, 'Overlapping subproblems and optimal substructure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96b130d8-2711-4d90-83f8-fa5610f3d1c6', 'f2e57b00-400d-42f5-8cda-37da67e8964f', 2, 'Purely random behavior');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('968f7923-be08-4239-952b-696e0113ad59', 'f2e57b00-400d-42f5-8cda-37da67e8964f', 3, 'A requirement for infinite memory');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f2e57b00-400d-42f5-8cda-37da67e8964f', 'f794d1fd-7215-42e3-bd68-d2440a13d9fd', 'Dynamic programming is applicable to problems exhibiting overlapping subproblems (the same subproblem is solved repeatedly) and optimal substructure (an optimal solution can be built from optimal solutions to subproblems) — solving each unique subproblem once and storing (memoizing) the result avoids redundant recomputation.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4d049476-d38a-4158-a948-5820466b3b07', '9c41f530-08db-4047-8407-0b03c9afec65', 73, 'The space complexity of an algorithm refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dde35912-dabf-4aa3-851f-f5d0b4465b97', '4d049476-d38a-4158-a948-5820466b3b07', 0, 'The total time taken to execute the algorithm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38174dc1-9756-4e1f-86e8-7c3a4d079d2f', '4d049476-d38a-4158-a948-5820466b3b07', 1, 'The amount of memory (working storage) the algorithm requires as a function of input size');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ccc73b76-fc2f-4470-bf99-b4927e59dfae', '4d049476-d38a-4158-a948-5820466b3b07', 2, 'The number of lines of code in the algorithm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66d9fcc9-da13-41de-9dc4-e213a6da0ab9', '4d049476-d38a-4158-a948-5820466b3b07', 3, 'The programming language used to implement it');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4d049476-d38a-4158-a948-5820466b3b07', '38174dc1-9756-4e1f-86e8-7c3a4d079d2f', 'Space complexity measures the total amount of memory an algorithm requires (including auxiliary/working storage, not just the input itself) as a function of input size, analogous to how time complexity measures execution time.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6c0af116-781d-4df6-9504-588e5921ed10', '9c41f530-08db-4047-8407-0b03c9afec65', 74, 'A ''balanced'' binary search tree (e.g., AVL tree, Red-Black tree) is designed to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bdb624a0-d3e9-4f7c-9e71-793e2446e15a', '6c0af116-781d-4df6-9504-588e5921ed10', 0, 'Allow the tree to become arbitrarily skewed for better cache performance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2fa1cf3-38e2-48d9-a823-aeca6d3a1636', '6c0af116-781d-4df6-9504-588e5921ed10', 1, 'Maintain a height proportional to O(log n) by rebalancing after insertions/deletions, guaranteeing efficient operations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6857bd3e-0096-434c-a43e-aa36bd4cf6f1', '6c0af116-781d-4df6-9504-588e5921ed10', 2, 'Always store exactly n leaf nodes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49863ad9-9ea4-41fb-9901-22518bc932fb', '6c0af116-781d-4df6-9504-588e5921ed10', 3, 'Eliminate the need for comparison operations');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6c0af116-781d-4df6-9504-588e5921ed10', 'f2fa1cf3-38e2-48d9-a823-aeca6d3a1636', 'Balanced BSTs (like AVL or Red-Black trees) actively rebalance themselves after insertions/deletions to maintain a height proportional to O(log n), guaranteeing O(log n) worst-case search/insert/delete — preventing the tree from degrading into a slow, effectively-linked-list-like O(n) structure that an unbalanced BST can become with adversarial input.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('979a9100-9bb2-47b4-9017-5547cf1f50a6', '9c41f530-08db-4047-8407-0b03c9afec65', 75, 'A ''circular queue'' differs from a simple linear queue in that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b9ae5ba-d1ab-4322-8fcb-69c1c790fb00', '979a9100-9bb2-47b4-9017-5547cf1f50a6', 0, 'It has no rear pointer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07af9962-b99a-461c-95d7-65ed2cee51d2', '979a9100-9bb2-47b4-9017-5547cf1f50a6', 1, 'It reuses freed space at the front of the underlying array by wrapping the rear pointer back to the beginning, avoiding the ''false full'' problem of a simple linear queue');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc93f511-025c-4954-9374-5423c6022bb9', '979a9100-9bb2-47b4-9017-5547cf1f50a6', 2, 'It can never be empty');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bf495cf5-6be7-42aa-a21e-ff47b99d282e', '979a9100-9bb2-47b4-9017-5547cf1f50a6', 3, 'It only supports LIFO access');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('979a9100-9bb2-47b4-9017-5547cf1f50a6', '07af9962-b99a-461c-95d7-65ed2cee51d2', 'A circular queue treats the underlying array as circular, wrapping the rear pointer back to the beginning once it reaches the end — this reuses space freed by dequeue operations, avoiding the ''false full'' condition a simple linear array-based queue would otherwise hit even when logically empty slots exist at the front.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('84031480-b293-4ab6-8c90-8912d26e43e1', '9c41f530-08db-4047-8407-0b03c9afec65', 76, 'A ''process'', as distinct from a ''program'', is best described as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ceef5ee3-30e0-40d6-90a0-9c0a6ee3e769', '84031480-b293-4ab6-8c90-8912d26e43e1', 0, 'A static file stored on disk');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ad56cec-5697-43bb-9108-5eaa6dbf5237', '84031480-b293-4ab6-8c90-8912d26e43e1', 1, 'A program in execution, with its own allocated memory, state, and resources');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0712ff7-1bda-481e-9088-434757f18749', '84031480-b293-4ab6-8c90-8912d26e43e1', 2, 'Identical to a program in every respect');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4d44279-fa03-4027-a973-c71c7e0ed9fc', '84031480-b293-4ab6-8c90-8912d26e43e1', 3, 'A part of the operating system kernel only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('84031480-b293-4ab6-8c90-8912d26e43e1', '7ad56cec-5697-43bb-9108-5eaa6dbf5237', 'A process is a program in execution — it has its own allocated memory space, execution state (registers, program counter), and system resources, distinct from the program itself (a static set of instructions stored on disk).', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ba93dc51-0f41-4d03-9072-8147bc5944c0', '9c41f530-08db-4047-8407-0b03c9afec65', 77, 'A ''thread'' within a process is best described as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58a67980-bdf7-4270-80d8-aa18b0b439e1', 'ba93dc51-0f41-4d03-9072-8147bc5944c0', 0, 'A separate process with completely independent memory');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75afc4de-e1f0-4721-be9f-d0ee1a651fc6', 'ba93dc51-0f41-4d03-9072-8147bc5944c0', 1, 'A lightweight unit of execution within a process, typically sharing the process''s memory space with other threads of the same process');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7127ca32-2ebc-41d1-a6dc-3cde5bcf9cf7', 'ba93dc51-0f41-4d03-9072-8147bc5944c0', 2, 'Only relevant to single-core processors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8a02a25-c463-496a-b10b-7636990df58d', 'ba93dc51-0f41-4d03-9072-8147bc5944c0', 3, 'A file stored in the file system');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ba93dc51-0f41-4d03-9072-8147bc5944c0', '75afc4de-e1f0-4721-be9f-d0ee1a651fc6', 'A thread is a lightweight unit of execution within a process, typically sharing the process''s memory space (code, data, open files) with other threads of the same process — enabling concurrent execution within a single process with lower overhead than separate processes.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('918692af-c7e4-42ef-8e77-299eb87001e6', '9c41f530-08db-4047-8407-0b03c9afec65', 78, 'Deadlock, in operating systems, refers to a situation where:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d05cd2d0-adb6-4b89-bca9-89c406f0e4e0', '918692af-c7e4-42ef-8e77-299eb87001e6', 0, 'A single process runs indefinitely without any issue');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5a1ad70-3994-4cc8-8b43-b530b892c3c8', '918692af-c7e4-42ef-8e77-299eb87001e6', 1, 'Two or more processes are each waiting for a resource held by another, resulting in none of them being able to proceed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c187122-c2fa-477a-833f-282c13d08bc7', '918692af-c7e4-42ef-8e77-299eb87001e6', 2, 'A process completes execution successfully');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7df9c428-a6e0-4e45-a4c9-79a9fa65b3ae', '918692af-c7e4-42ef-8e77-299eb87001e6', 3, 'The CPU is idle with no processes to run');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('918692af-c7e4-42ef-8e77-299eb87001e6', 'f5a1ad70-3994-4cc8-8b43-b530b892c3c8', 'Deadlock occurs when two or more processes are each holding a resource the other needs and waiting for a resource the other holds, creating a circular wait where none can proceed — a critical concern in concurrent/multi-process system design.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a64c00ec-3e5d-4ae7-8f62-298d863b3afe', '9c41f530-08db-4047-8407-0b03c9afec65', 79, 'The four necessary conditions for deadlock to occur (Coffman conditions) include mutual exclusion, hold and wait, no preemption, and:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7acec21d-d6c7-4d20-965f-0be07398a723', 'a64c00ec-3e5d-4ae7-8f62-298d863b3afe', 0, 'Circular wait');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86a91898-24f0-4c99-afcd-12984a83b095', 'a64c00ec-3e5d-4ae7-8f62-298d863b3afe', 1, 'Infinite loop');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93b39c2a-5a28-48c6-a2b5-4e8fa2fe8e82', 'a64c00ec-3e5d-4ae7-8f62-298d863b3afe', 2, 'Memory overflow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62fa8161-6f63-4599-9687-374f5de8b1bb', 'a64c00ec-3e5d-4ae7-8f62-298d863b3afe', 3, 'Process termination');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a64c00ec-3e5d-4ae7-8f62-298d863b3afe', '7acec21d-d6c7-4d20-965f-0be07398a723', 'The four Coffman conditions necessary (though not individually sufficient) for deadlock are: mutual exclusion, hold and wait, no preemption, and circular wait — all four must hold simultaneously for deadlock to be possible.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5f99d45a-5b5b-4398-9a73-1c5ee4201a52', '9c41f530-08db-4047-8407-0b03c9afec65', 80, 'Virtual memory in an operating system allows:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b58c59e0-2c0b-4060-9311-8ae0b6eb7bb9', '5f99d45a-5b5b-4398-9a73-1c5ee4201a52', 0, 'Programs to use more memory than physically available RAM, using disk space as an extension, managed transparently by the OS');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d93d6de2-52dd-45d8-a77d-c206b3f7ebbd', '5f99d45a-5b5b-4398-9a73-1c5ee4201a52', 1, 'Programs to run without any memory allocation at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('802af69b-9834-42cd-b170-b266c35ff147', '5f99d45a-5b5b-4398-9a73-1c5ee4201a52', 2, 'Direct, unmediated access to physical memory addresses by every process');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1d70944-37c1-4062-bd2d-0836b47aa358', '5f99d45a-5b5b-4398-9a73-1c5ee4201a52', 3, 'Elimination of the need for a hard disk');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5f99d45a-5b5b-4398-9a73-1c5ee4201a52', 'b58c59e0-2c0b-4060-9311-8ae0b6eb7bb9', 'Virtual memory allows a system to run programs requiring more memory than physically available RAM, by using disk space (a page/swap file) as an extension of RAM, managed transparently by the OS through paging — giving each process the illusion of a large, contiguous, private address space.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('39e4557b-d324-41a4-bca1-2293167b48d0', '9c41f530-08db-4047-8407-0b03c9afec65', 81, '''Paging'', a memory management scheme, divides a process''s memory into fixed-size blocks called:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e3f545b-c5d2-4015-848c-40c0196f9b44', '39e4557b-d324-41a4-bca1-2293167b48d0', 0, 'Segments');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e4cda00-ff03-4e65-9287-c18ada639526', '39e4557b-d324-41a4-bca1-2293167b48d0', 1, 'Pages');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('782de27d-7e0a-4352-b9ef-fb386cd58ca6', '39e4557b-d324-41a4-bca1-2293167b48d0', 2, 'Sectors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f153345-4238-4a37-ba8b-efeb9339e90e', '39e4557b-d324-41a4-bca1-2293167b48d0', 3, 'Clusters');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('39e4557b-d324-41a4-bca1-2293167b48d0', '3e4cda00-ff03-4e65-9287-c18ada639526', 'Paging divides a process''s logical memory into fixed-size blocks called pages, and physical memory into equal-sized frames — the OS maintains a page table mapping pages to frames, avoiding the external fragmentation issues of variable-sized memory allocation schemes like segmentation.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0ed3b4f1-41b5-4856-b651-10dac3014fb2', '9c41f530-08db-4047-8407-0b03c9afec65', 82, 'A ''context switch'' in an operating system refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a901129-9ecb-43a2-9c8f-2f77bdbfbd47', '0ed3b4f1-41b5-4856-b651-10dac3014fb2', 0, 'Permanently terminating a process');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c24fb41-b9e0-4d8e-967d-e22c0315a94c', '0ed3b4f1-41b5-4856-b651-10dac3014fb2', 1, 'Saving the state of a currently running process and loading the saved state of another process, allowing the CPU to switch between them');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9e9393e-bdd4-4bde-b64d-3b447565c386', '0ed3b4f1-41b5-4856-b651-10dac3014fb2', 2, 'Restarting the entire operating system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca4b8c7c-87c3-44a2-94db-6ebff1869207', '0ed3b4f1-41b5-4856-b651-10dac3014fb2', 3, 'Compiling source code into machine code');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0ed3b4f1-41b5-4856-b651-10dac3014fb2', '5c24fb41-b9e0-4d8e-967d-e22c0315a94c', 'A context switch is the mechanism by which the OS saves the current process/thread''s execution state (registers, program counter) and loads another''s saved state, enabling the CPU to switch between multiple processes/threads — a fundamental mechanism underlying multitasking.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b993ea39-c36d-49c1-aea6-398110ab2fe2', '9c41f530-08db-4047-8407-0b03c9afec65', 83, '''Round Robin'' is a CPU scheduling algorithm characterized by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7864611-9d0c-4e9c-968d-57444582a88f', 'b993ea39-c36d-49c1-aea6-398110ab2fe2', 0, 'Executing the shortest job first, always');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bff8279-e00e-408b-9bb4-eea5c7a50493', 'b993ea39-c36d-49c1-aea6-398110ab2fe2', 1, 'Allocating each process a fixed time slice (quantum) in a cyclic order, preempting it if it doesn''t finish within that quantum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c61fa69-2bb0-4a1b-a084-c1f4d95ca02e', 'b993ea39-c36d-49c1-aea6-398110ab2fe2', 2, 'Only running the highest-priority process, ignoring all others until it completes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ceb78b80-9ea0-4c1f-b13e-25e333207d39', 'b993ea39-c36d-49c1-aea6-398110ab2fe2', 3, 'Running processes in a completely random order');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b993ea39-c36d-49c1-aea6-398110ab2fe2', '2bff8279-e00e-408b-9bb4-eea5c7a50493', 'Round Robin scheduling allocates each process a fixed time quantum in a cyclic (rotating) order, preempting a process that hasn''t finished when its quantum expires and moving to the next process in the queue — designed to provide fair, responsive time-sharing among processes.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ad14977e-096b-4b71-b458-7ad0e6de0ca0', '9c41f530-08db-4047-8407-0b03c9afec65', 84, 'A ''semaphore'' in operating systems is primarily used for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a4a31ea-ec8a-4332-ad59-b4b4433050e9', 'ad14977e-096b-4b71-b458-7ad0e6de0ca0', 0, 'File compression');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e44854f3-aad9-42df-910b-d2ed29cfb06c', 'ad14977e-096b-4b71-b458-7ad0e6de0ca0', 1, 'Process/thread synchronization, controlling access to shared resources to prevent race conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5cd7d9cf-8550-438b-8bf3-3724b014ba75', 'ad14977e-096b-4b71-b458-7ad0e6de0ca0', 2, 'Network packet routing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28bb3628-6d82-4c75-b28d-1bdc48cc4a8a', 'ad14977e-096b-4b71-b458-7ad0e6de0ca0', 3, 'Disk defragmentation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ad14977e-096b-4b71-b458-7ad0e6de0ca0', 'e44854f3-aad9-42df-910b-d2ed29cfb06c', 'A semaphore is a synchronization primitive (a counter with atomic increment/decrement operations) used to control access to shared resources among concurrent processes/threads, preventing race conditions — a foundational concurrency-control mechanism.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1a351a26-3b19-443d-a675-826621e00f65', '9c41f530-08db-4047-8407-0b03c9afec65', 85, '''Thrashing'', a performance problem in virtual memory systems, occurs when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18742634-2660-487b-b49b-0ba2b39823f0', '1a351a26-3b19-443d-a675-826621e00f65', 0, 'The system has excess free memory with nothing to allocate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b59b2517-4de7-45fc-94ab-67fb15541267', '1a351a26-3b19-443d-a675-826621e00f65', 1, 'The system spends more time swapping pages in and out of memory than executing actual useful work, due to insufficient physical memory for the current workload');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af650cc4-c275-422f-a920-8275f01f1878', '1a351a26-3b19-443d-a675-826621e00f65', 2, 'A process is intentionally terminated');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b228b29-7a4a-43b8-921f-a34f59200156', '1a351a26-3b19-443d-a675-826621e00f65', 3, 'The CPU runs at maximum speed with no issues');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1a351a26-3b19-443d-a675-826621e00f65', 'b59b2517-4de7-45fc-94ab-67fb15541267', 'Thrashing occurs when a system is so overcommitted on memory that it spends most of its time swapping pages between RAM and disk (page faults), leaving little time for actual process execution — a severe performance degradation typically caused by too many processes competing for insufficient physical memory.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('51ec659e-7acd-449a-822d-799d48e0376f', '9c41f530-08db-4047-8407-0b03c9afec65', 86, 'A ''file system'' in an operating system is primarily responsible for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('327aebe9-6c6c-4507-bf37-73cb8d24b65a', '51ec659e-7acd-449a-822d-799d48e0376f', 0, 'Managing how data is stored, organized, and retrieved on storage devices');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2dbc3d7f-36b3-4380-aa93-ea4da985d8e9', '51ec659e-7acd-449a-822d-799d48e0376f', 1, 'Executing arithmetic operations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da9a4d2a-2ce3-4619-ac42-2d8fb56fb43b', '51ec659e-7acd-449a-822d-799d48e0376f', 2, 'Rendering graphical user interfaces');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4ce9b0c-8623-46ef-b53e-29c62c32c92d', '51ec659e-7acd-449a-822d-799d48e0376f', 3, 'Managing network connections exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('51ec659e-7acd-449a-822d-799d48e0376f', '327aebe9-6c6c-4507-bf37-73cb8d24b65a', 'A file system manages how data is stored, named, organized into directories/folders, and retrieved from storage devices (hard disks, SSDs) — providing the OS abstraction layer between raw storage hardware and user/application-level file operations.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4b9447bb-20ff-475d-9e91-4ebb29fddf48', '9c41f530-08db-4047-8407-0b03c9afec65', 87, '''Mutual exclusion'' in concurrent programming ensures that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce40b8e6-c3f7-4e78-8d1e-3ba4af36e886', '4b9447bb-20ff-475d-9e91-4ebb29fddf48', 0, 'Multiple processes/threads can access a shared critical resource simultaneously without restriction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8662e844-f9cf-40a3-a5ec-685bf5bb62c0', '4b9447bb-20ff-475d-9e91-4ebb29fddf48', 1, 'Only one process/thread can access a shared critical resource (critical section) at any given time, preventing race conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32e57454-e18a-4105-978d-5d0ec943c5ec', '4b9447bb-20ff-475d-9e91-4ebb29fddf48', 2, 'No process can ever access a shared resource');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1e41686-c6b9-4bb8-a718-c4d8109226b7', '4b9447bb-20ff-475d-9e91-4ebb29fddf48', 3, 'All processes must run sequentially with no concurrency at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4b9447bb-20ff-475d-9e91-4ebb29fddf48', '8662e844-f9cf-40a3-a5ec-685bf5bb62c0', 'Mutual exclusion ensures that only one process or thread can execute within a critical section (accessing a shared resource) at any given time, preventing race conditions and data corruption from concurrent, unsynchronized access.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bb9950d9-021a-424b-bf7d-67e42846d4f8', '9c41f530-08db-4047-8407-0b03c9afec65', 88, 'A ''kernel'', the core component of an operating system, is primarily responsible for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebd9718a-7d4a-460b-bddb-d35cd5420bc2', 'bb9950d9-021a-424b-bf7d-67e42846d4f8', 0, 'Only rendering the desktop wallpaper');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee34a13f-7c40-4ef8-b2a7-e5030f466a36', 'bb9950d9-021a-424b-bf7d-67e42846d4f8', 1, 'Managing system resources — CPU scheduling, memory management, and hardware/device communication — as the interface between applications and hardware');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c5f245d-370a-497e-8de5-57204eca07d1', 'bb9950d9-021a-424b-bf7d-67e42846d4f8', 2, 'Compiling application source code');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6eb64f71-0117-4d1f-addc-99c252542b4a', 'bb9950d9-021a-424b-bf7d-67e42846d4f8', 3, 'Managing internet browser tabs specifically');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bb9950d9-021a-424b-bf7d-67e42846d4f8', 'ee34a13f-7c40-4ef8-b2a7-e5030f466a36', 'The kernel is the core of the operating system, managing fundamental system resources (CPU scheduling, memory management, device drivers) and serving as the primary interface between running applications and the underlying hardware.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3ea51218-0926-46c7-b1aa-5c992affbf64', '9c41f530-08db-4047-8407-0b03c9afec65', 89, '''Belady''s Anomaly'', a counterintuitive phenomenon in page replacement algorithms, refers to the observation that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e62c53f7-3a7e-4c22-a5f3-19be1ca11a69', '3ea51218-0926-46c7-b1aa-5c992affbf64', 0, 'Increasing the number of page frames always reduces the number of page faults');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0aa4e96-d911-4789-b672-4541460aaeac', '3ea51218-0926-46c7-b1aa-5c992affbf64', 1, 'For certain page replacement algorithms (notably FIFO), increasing the number of available page frames can, counterintuitively, INCREASE the number of page faults');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2dd96e73-84ae-46da-9fb8-cb2be8cdb918', '3ea51218-0926-46c7-b1aa-5c992affbf64', 2, 'Page faults never occur with an adequate number of frames');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc3a77cd-18c2-4d74-9344-e42daaea3095', '3ea51218-0926-46c7-b1aa-5c992affbf64', 3, 'Belady''s Anomaly applies to all page replacement algorithms equally');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3ea51218-0926-46c7-b1aa-5c992affbf64', 'c0aa4e96-d911-4789-b672-4541460aaeac', 'Belady''s Anomaly describes the counterintuitive result (observed specifically with the FIFO page replacement algorithm, though not with algorithms like LRU or Optimal) that increasing the number of available page frames can actually increase the number of page faults for certain reference strings — a well-known, frequently-tested OS concept.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f8db66e9-eabf-4f79-b6a1-05c47c1cb845', '9c41f530-08db-4047-8407-0b03c9afec65', 90, 'A ''system call'' allows a user-level application to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ce8710e-baba-468b-9bfe-ea097f68dd56', 'f8db66e9-eabf-4f79-b6a1-05c47c1cb845', 0, 'Directly modify the OS kernel''s source code at runtime');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b02560bf-b731-4d38-a010-3299d726f63f', 'f8db66e9-eabf-4f79-b6a1-05c47c1cb845', 1, 'Request a service from the operating system kernel (e.g., file I/O, process creation), transitioning from user mode to kernel mode');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b317d5c-6ada-4383-ab31-2733a3956611', 'f8db66e9-eabf-4f79-b6a1-05c47c1cb845', 2, 'Bypass the operating system entirely for hardware access');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8884f0a-b838-4c1d-b529-75831d6fd632', 'f8db66e9-eabf-4f79-b6a1-05c47c1cb845', 3, 'Compile code without OS involvement');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f8db66e9-eabf-4f79-b6a1-05c47c1cb845', 'b02560bf-b731-4d38-a010-3299d726f63f', 'A system call is the controlled mechanism by which a user-level application requests a service from the OS kernel (like file operations, process management, or network communication), causing a transition from user mode to the more privileged kernel mode to safely perform the requested operation.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9699ae13-1c42-4808-b4f6-defb7670964c', '9c41f530-08db-4047-8407-0b03c9afec65', 91, 'In relational database design, a ''primary key'' is defined as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7cbded11-cc51-4981-8d9b-8fd3267e9153', '9699ae13-1c42-4808-b4f6-defb7670964c', 0, 'Any column that can contain duplicate values');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35e2410c-ea53-4c16-b503-a446446a5e3d', '9699ae13-1c42-4808-b4f6-defb7670964c', 1, 'A column (or set of columns) that uniquely identifies each row in a table, and cannot contain NULL values');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7d55fbb-d76d-4675-b1e4-b065a4952048', '9699ae13-1c42-4808-b4f6-defb7670964c', 2, 'A column used only for storing text data');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21b0d3cd-6abc-4699-9a93-fc24bf7a153c', '9699ae13-1c42-4808-b4f6-defb7670964c', 3, 'A column that references another table''s data');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9699ae13-1c42-4808-b4f6-defb7670964c', '35e2410c-ea53-4c16-b503-a446446a5e3d', 'A primary key uniquely identifies each row within a table and, by definition, cannot contain NULL or duplicate values — a fundamental constraint ensuring each record can be unambiguously identified.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a3e4bb62-6b71-404e-8e51-ffe9ff3fe207', '9c41f530-08db-4047-8407-0b03c9afec65', 92, 'A ''foreign key'' in a relational database is used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b81baf5a-b5e0-4de2-b000-aa3a38bdbea1', 'a3e4bb62-6b71-404e-8e51-ffe9ff3fe207', 0, 'Uniquely identify rows within its own table');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74bd96b8-4ebd-4a0e-b2cd-ec5efe1db41d', 'a3e4bb62-6b71-404e-8e51-ffe9ff3fe207', 1, 'Establish and enforce a referential link between a column (or columns) in one table and the primary key of another table');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b2f6ec4-3c93-47be-9a66-ea74cf15ac84', 'a3e4bb62-6b71-404e-8e51-ffe9ff3fe207', 2, 'Store encrypted data only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ffd934d-ed53-4986-abf4-7372ab47367f', 'a3e4bb62-6b71-404e-8e51-ffe9ff3fe207', 3, 'Automatically delete unrelated rows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a3e4bb62-6b71-404e-8e51-ffe9ff3fe207', '74bd96b8-4ebd-4a0e-b2cd-ec5efe1db41d', 'A foreign key is a column (or set of columns) in one table that references the primary key of another table, enforcing referential integrity — ensuring that a value in the foreign key column corresponds to an existing value in the referenced table.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a17b4fe1-00bd-4cc9-ae30-9be9e6c91b71', '9c41f530-08db-4047-8407-0b03c9afec65', 93, '''Normalization'' in database design is primarily aimed at:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c232779b-bb6a-4243-92d3-5f11262a93dd', 'a17b4fe1-00bd-4cc9-ae30-9be9e6c91b71', 0, 'Maximizing data redundancy for faster reads');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0eff5ef-9eb8-4198-bbd8-3ef65caa2dea', 'a17b4fe1-00bd-4cc9-ae30-9be9e6c91b71', 1, 'Reducing data redundancy and improving data integrity by organizing tables according to a series of normal forms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5aa0450-e766-4703-a00b-3d9403214101', 'a17b4fe1-00bd-4cc9-ae30-9be9e6c91b71', 2, 'Encrypting all stored data');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('daec8a15-9bb9-4aa6-8850-ae7d3146871b', 'a17b4fe1-00bd-4cc9-ae30-9be9e6c91b71', 3, 'Reducing the number of tables to exactly one');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a17b4fe1-00bd-4cc9-ae30-9be9e6c91b71', 'f0eff5ef-9eb8-4198-bbd8-3ef65caa2dea', 'Normalization is the process of organizing database tables to reduce data redundancy and improve data integrity, following a series of progressively stricter ''normal forms'' (1NF, 2NF, 3NF, BCNF, etc.), each addressing specific types of redundancy/anomaly.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9455d5c6-a1fa-4750-9967-1a98dc046e3d', '9c41f530-08db-4047-8407-0b03c9afec65', 94, 'A table satisfying Third Normal Form (3NF) must, in addition to satisfying 2NF, eliminate:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da858a93-c4a4-4477-807a-e4c052736fde', '9455d5c6-a1fa-4750-9967-1a98dc046e3d', 0, 'All primary keys');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51d32add-7eba-4383-8580-69508e5759cf', '9455d5c6-a1fa-4750-9967-1a98dc046e3d', 1, 'Transitive dependencies — non-key attributes depending on other non-key attributes rather than directly on the primary key');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67422b03-fb0c-45b5-8804-107d30062bb5', '9455d5c6-a1fa-4750-9967-1a98dc046e3d', 2, 'All foreign keys');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cda3dd05-4e46-42c5-a751-5a4467bc2b31', '9455d5c6-a1fa-4750-9967-1a98dc046e3d', 3, 'All indexes');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9455d5c6-a1fa-4750-9967-1a98dc046e3d', '51d32add-7eba-4383-8580-69508e5759cf', '3NF requires that a table already satisfy 2NF, and additionally eliminates transitive dependencies — where a non-key attribute depends on another non-key attribute rather than depending directly and solely on the primary key.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0508e007-223a-4cfd-972d-9d8402e6dafd', '9c41f530-08db-4047-8407-0b03c9afec65', 95, 'SQL''s ''JOIN'' operation is used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f6e3156-c6ba-4d96-a9fd-263593057961', '0508e007-223a-4cfd-972d-9d8402e6dafd', 0, 'Delete rows from a table');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4305cd96-d38c-424c-85a7-8d904b1b931d', '0508e007-223a-4cfd-972d-9d8402e6dafd', 1, 'Combine rows from two or more tables based on a related column between them');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('155166ba-5574-475e-82d4-c8224607bfaa', '0508e007-223a-4cfd-972d-9d8402e6dafd', 2, 'Create a new, empty table');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e5a2cd0-0ebe-4b0e-be7a-93f044a52cd1', '0508e007-223a-4cfd-972d-9d8402e6dafd', 3, 'Rename a column');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0508e007-223a-4cfd-972d-9d8402e6dafd', '4305cd96-d38c-424c-85a7-8d904b1b931d', 'A JOIN operation combines rows from two or more tables based on a related column (typically a foreign key referencing a primary key), allowing queries to retrieve related data spread across multiple normalized tables.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('501a75d4-16ed-4e71-a358-f201efb443cb', '9c41f530-08db-4047-8407-0b03c9afec65', 96, 'The difference between an ''INNER JOIN'' and a ''LEFT (OUTER) JOIN'' is that a LEFT JOIN:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b394139-a6f5-4249-98d4-d1bf3a37091e', '501a75d4-16ed-4e71-a358-f201efb443cb', 0, 'Returns only rows with matches in both tables, exactly like an INNER JOIN');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80288e3a-ff72-4316-899c-4a6c5e9a98b7', '501a75d4-16ed-4e71-a358-f201efb443cb', 1, 'Returns all rows from the left table, along with matched rows from the right table (with NULLs for unmatched right-table columns)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0309299c-7823-43ed-a5cc-067580a926e9', '501a75d4-16ed-4e71-a358-f201efb443cb', 2, 'Returns only rows from the right table');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6c734d4-7b82-4a9c-9ba1-2834c5c023ee', '501a75d4-16ed-4e71-a358-f201efb443cb', 3, 'Deletes unmatched rows from the left table permanently');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('501a75d4-16ed-4e71-a358-f201efb443cb', '80288e3a-ff72-4316-899c-4a6c5e9a98b7', 'A LEFT (OUTER) JOIN returns all rows from the left table, and matching rows from the right table where they exist — where no match exists in the right table, the result includes NULL values for the right table''s columns, unlike an INNER JOIN, which excludes such unmatched rows entirely.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fdb1e704-f7f5-4e50-8b74-03bf8adb45fa', '9c41f530-08db-4047-8407-0b03c9afec65', 97, 'ACID properties in database transactions stand for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84c9800a-3a05-408c-b43e-240cc903fb9e', 'fdb1e704-f7f5-4e50-8b74-03bf8adb45fa', 0, 'Atomicity, Consistency, Isolation, Durability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70449445-87e5-4b30-b445-8cc8b13cf82f', 'fdb1e704-f7f5-4e50-8b74-03bf8adb45fa', 1, 'Accuracy, Concurrency, Integrity, Dependency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d3f4024-5cc8-4dbc-a79d-0b28180f2def', 'fdb1e704-f7f5-4e50-8b74-03bf8adb45fa', 2, 'Access, Control, Identity, Data');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('686b48f7-991e-402a-af95-117239d3efd6', 'fdb1e704-f7f5-4e50-8b74-03bf8adb45fa', 3, 'Allocation, Caching, Indexing, Deletion');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fdb1e704-f7f5-4e50-8b74-03bf8adb45fa', '84c9800a-3a05-408c-b43e-240cc903fb9e', 'ACID stands for Atomicity (a transaction completes entirely or not at all), Consistency (a transaction brings the database from one valid state to another), Isolation (concurrent transactions don''t interfere with each other), and Durability (once committed, changes persist even after a system failure) — the foundational guarantees of reliable database transaction processing.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4e8b7c15-7224-41c4-a2ca-a8b457273489', '9c41f530-08db-4047-8407-0b03c9afec65', 98, 'An ''index'' in a database is primarily used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2eeacb32-e810-4cb3-9fdc-06c6a247dc66', '4e8b7c15-7224-41c4-a2ca-a8b457273489', 0, 'Permanently delete unused data');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c80edf1-905f-41f4-9826-500391266a1d', '4e8b7c15-7224-41c4-a2ca-a8b457273489', 1, 'Improve the speed of data retrieval operations, at the cost of some additional storage space and slower write operations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58ad7e0b-995b-4bcc-b87b-134c61a08409', '4e8b7c15-7224-41c4-a2ca-a8b457273489', 2, 'Encrypt sensitive columns automatically');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e56cd6c-208b-45a0-8338-4beb44645ca2', '4e8b7c15-7224-41c4-a2ca-a8b457273489', 3, 'Enforce that a column can only contain numeric values');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4e8b7c15-7224-41c4-a2ca-a8b457273489', '8c80edf1-905f-41f4-9826-500391266a1d', 'A database index is a data structure (commonly a B-tree) that improves the speed of data retrieval (SELECT queries with WHERE/JOIN conditions on indexed columns), at the cost of additional storage overhead and somewhat slower INSERT/UPDATE/DELETE operations, since indexes must also be maintained.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b0a790bf-01bb-4cb1-a8fb-caeea6ca1740', '9c41f530-08db-4047-8407-0b03c9afec65', 99, 'A ''deadlock'' in a database transaction context occurs when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f5120ca-494a-473f-b481-b035038639f1', 'b0a790bf-01bb-4cb1-a8fb-caeea6ca1740', 0, 'A single transaction completes without any issue');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7008a319-9bd7-4912-88bf-63ad38c758f8', 'b0a790bf-01bb-4cb1-a8fb-caeea6ca1740', 1, 'Two or more transactions are each waiting for a lock held by the other, with neither able to proceed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f1249ab-6f1f-4c2e-b344-d441d983c099', 'b0a790bf-01bb-4cb1-a8fb-caeea6ca1740', 2, 'A transaction is automatically committed immediately');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e6b7936-16f6-4eb0-9421-484649bc2250', 'b0a790bf-01bb-4cb1-a8fb-caeea6ca1740', 3, 'The database has no active connections');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b0a790bf-01bb-4cb1-a8fb-caeea6ca1740', '7008a319-9bd7-4912-88bf-63ad38c758f8', 'A database deadlock occurs when two or more transactions each hold a lock the other needs and are waiting for a lock the other holds — most database systems detect this situation and automatically abort one of the transactions (a ''deadlock victim'') to break the cycle.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('859ce010-d08f-40ed-9c04-d30cec918a83', '9c41f530-08db-4047-8407-0b03c9afec65', 100, 'A ''view'' in SQL is best described as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3a6c4e2-5992-4631-9617-e805252000d5', '859ce010-d08f-40ed-9c04-d30cec918a83', 0, 'A physical table storing its own independent copy of data');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c637167d-182c-439b-9e4e-19ac2f4bc6b3', '859ce010-d08f-40ed-9c04-d30cec918a83', 1, 'A virtual table based on the result of a stored SQL query, which doesn''t store data itself but presents data from underlying tables');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfc6dd86-ef4f-442a-a561-f9734d799470', '859ce010-d08f-40ed-9c04-d30cec918a83', 2, 'A type of index');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bf2cfa26-ce22-4d23-8a94-335328109060', '859ce010-d08f-40ed-9c04-d30cec918a83', 3, 'A backup of the entire database');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('859ce010-d08f-40ed-9c04-d30cec918a83', 'c637167d-182c-439b-9e4e-19ac2f4bc6b3', 'A view is a virtual table defined by a stored SQL query — it doesn''t physically store its own data (unless explicitly materialized), but instead presents a customized, often simplified or restricted, representation of data drawn from one or more underlying tables.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('22d3fe93-d7ad-4fc4-9893-4a9d3cbf4578', '9c41f530-08db-4047-8407-0b03c9afec65', 101, '''Referential integrity'' in a relational database ensures that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f7705d4-b6f0-4a2f-940c-737b7ff0549f', '22d3fe93-d7ad-4fc4-9893-4a9d3cbf4578', 0, 'Every table has exactly one column');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80a631de-ebd1-4464-815f-68e4fc614d78', '22d3fe93-d7ad-4fc4-9893-4a9d3cbf4578', 1, 'A foreign key value in one table always corresponds to an existing, valid primary key value in the referenced table (or is NULL, if allowed)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d78e4ff8-b49b-4de2-ac2e-eac1282b6333', '22d3fe93-d7ad-4fc4-9893-4a9d3cbf4578', 2, 'All data is automatically encrypted');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('045e583c-ba24-4389-8479-a8ee53391c64', '22d3fe93-d7ad-4fc4-9893-4a9d3cbf4578', 3, 'No table can have more than 1000 rows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('22d3fe93-d7ad-4fc4-9893-4a9d3cbf4578', '80a631de-ebd1-4464-815f-68e4fc614d78', 'Referential integrity ensures that relationships between tables remain valid — a foreign key value must correspond to an existing primary key value in the referenced table (or be NULL, if the column allows it), preventing ''orphaned'' references to non-existent rows.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4c90ed5c-e524-4dc9-af90-6aca86bfeb68', '9c41f530-08db-4047-8407-0b03c9afec65', 102, 'SQL''s ''GROUP BY'' clause is used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0fcf5b69-054b-4ced-93fd-d11f36751213', '4c90ed5c-e524-4dc9-af90-6aca86bfeb68', 0, 'Sort query results alphabetically only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('618563a7-0047-418a-9e91-27a8eaa8b49b', '4c90ed5c-e524-4dc9-af90-6aca86bfeb68', 1, 'Group rows sharing the same value(s) in specified columns, typically used together with aggregate functions like COUNT, SUM, or AVG');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6002d588-4ecd-4b55-8f7a-caae30937d53', '4c90ed5c-e524-4dc9-af90-6aca86bfeb68', 2, 'Delete duplicate rows permanently');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfd94eb9-daa2-451a-ae2e-8e66bdfd9574', '4c90ed5c-e524-4dc9-af90-6aca86bfeb68', 3, 'Create a new table');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4c90ed5c-e524-4dc9-af90-6aca86bfeb68', '618563a7-0047-418a-9e91-27a8eaa8b49b', 'GROUP BY groups rows that share the same value(s) in one or more specified columns, commonly used with aggregate functions (COUNT, SUM, AVG, MAX, MIN) to compute per-group summary statistics rather than per-row results.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bd6a6577-803a-48cb-be16-66e283302f14', '9c41f530-08db-4047-8407-0b03c9afec65', 103, 'The main difference between a ''clustered'' and a ''non-clustered'' index is that a clustered index:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1cf20b49-403a-4328-9d3f-d20540f05e62', 'bd6a6577-803a-48cb-be16-66e283302f14', 0, 'Determines the physical storage order of the data rows themselves, and a table can have at most one');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7ee6874-3bed-4904-9ef6-a9bc00f4e008', 'bd6a6577-803a-48cb-be16-66e283302f14', 1, 'Is always slower than a non-clustered index');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a797403-a445-4bc3-81e2-be0e469c3b2a', 'bd6a6577-803a-48cb-be16-66e283302f14', 2, 'Can only be created on numeric columns');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd86a3db-46df-499b-b112-7afab63f8b96', 'bd6a6577-803a-48cb-be16-66e283302f14', 3, 'Never affects query performance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bd6a6577-803a-48cb-be16-66e283302f14', '1cf20b49-403a-4328-9d3f-d20540f05e62', 'A clustered index determines the actual physical storage order of a table''s data rows (so a table can have only one clustered index, since data can only be physically sorted one way), while a non-clustered index maintains a separate structure with pointers back to the actual data rows — allowing a table to have multiple non-clustered indexes.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a7cea7c6-ca59-4a6c-a4a7-d7677163ddd7', '9c41f530-08db-4047-8407-0b03c9afec65', 104, 'A NoSQL database, as distinct from a traditional relational (SQL) database, typically:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f07d6e6d-0d15-4477-a315-aacfbb62bc22', 'a7cea7c6-ca59-4a6c-a4a7-d7677163ddd7', 0, 'Always enforces a rigid, fixed schema before any data can be inserted');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97d75953-996a-49ba-8c03-c3d6af8ddccd', 'a7cea7c6-ca59-4a6c-a4a7-d7677163ddd7', 1, 'Offers more flexible (often schema-less or schema-optional) data models, often favoring horizontal scalability over strict relational consistency guarantees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8042d222-f0cf-4d60-99c7-ed23aa9cf3b6', 'a7cea7c6-ca59-4a6c-a4a7-d7677163ddd7', 2, 'Cannot store any data at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('862a492f-2790-466a-8f9c-bda17023d58a', 'a7cea7c6-ca59-4a6c-a4a7-d7677163ddd7', 3, 'Is identical in every respect to a relational database');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a7cea7c6-ca59-4a6c-a4a7-d7677163ddd7', '97d75953-996a-49ba-8c03-c3d6af8ddccd', 'NoSQL databases (document, key-value, column-family, or graph-based) typically offer more flexible data models than the rigid, predefined schema of relational databases, and are often designed to prioritize horizontal scalability and availability, sometimes at the cost of the strict ACID consistency guarantees relational databases provide by default.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7f1e0240-72a6-4d55-98cb-23d69c4be428', '9c41f530-08db-4047-8407-0b03c9afec65', 105, 'A ''transaction'' in a database context is best defined as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88aa5ab9-8219-40ea-a5a6-0d458dffc1ef', '7f1e0240-72a6-4d55-98cb-23d69c4be428', 0, 'A single INSERT statement only, never more');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12c767f9-69e3-45ef-bfc4-1a099758717f', '7f1e0240-72a6-4d55-98cb-23d69c4be428', 1, 'A logical unit of work comprising one or more operations, which must either complete entirely (commit) or have no effect at all (rollback)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15be6072-32b3-4c20-8008-cdb62538a235', '7f1e0240-72a6-4d55-98cb-23d69c4be428', 2, 'A permanent, unchangeable record of every query ever run');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25ed8410-43bc-483e-b31c-96d741ac266b', '7f1e0240-72a6-4d55-98cb-23d69c4be428', 3, 'A type of database index');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7f1e0240-72a6-4d55-98cb-23d69c4be428', '12c767f9-69e3-45ef-bfc4-1a099758717f', 'A transaction is a logical unit of work, potentially comprising multiple individual operations, that the database guarantees will either complete entirely (commit, with all changes applied) or have no effect whatsoever (rollback, as if it never happened) — the foundation of the Atomicity property in ACID.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6e434f18-654a-4aba-b423-bed697a9fb1e', '9c41f530-08db-4047-8407-0b03c9afec65', 106, 'The OSI model organizes network communication into how many layers?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc266fc4-993f-4bcc-a8d3-fe739ab15004', '6e434f18-654a-4aba-b423-bed697a9fb1e', 0, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc5911e4-2861-401c-bc14-8d068a693787', '6e434f18-654a-4aba-b423-bed697a9fb1e', 1, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d524176e-cc87-487c-a976-b969e433e5d4', '6e434f18-654a-4aba-b423-bed697a9fb1e', 2, '7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('29a04b28-77ac-440d-b120-062b2260e1fc', '6e434f18-654a-4aba-b423-bed697a9fb1e', 3, '9');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6e434f18-654a-4aba-b423-bed697a9fb1e', 'd524176e-cc87-487c-a976-b969e433e5d4', 'The OSI (Open Systems Interconnection) model defines 7 layers: Physical, Data Link, Network, Transport, Session, Presentation, and Application — a conceptual framework for understanding network communication, distinct from the simpler 4-layer TCP/IP model used in practice.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3ee550e9-26cb-430a-9418-2c5effb6f8d3', '9c41f530-08db-4047-8407-0b03c9afec65', 107, 'The TCP/IP model''s Transport layer is primarily responsible for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f48db63a-bae9-43b0-ac32-44d1863407d0', '3ee550e9-26cb-430a-9418-2c5effb6f8d3', 0, 'Physical transmission of bits over a medium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57ef5eb5-8a68-45f3-9c3f-87e9d47b84dc', '3ee550e9-26cb-430a-9418-2c5effb6f8d3', 1, 'Reliable (TCP) or unreliable/connectionless (UDP) end-to-end data delivery between applications, including flow control and error recovery (for TCP)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e10dda5f-2782-4c05-950c-5c6fe886cda3', '3ee550e9-26cb-430a-9418-2c5effb6f8d3', 2, 'Assigning MAC addresses');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e9385a0-5d04-45db-9978-c571cc04d249', '3ee550e9-26cb-430a-9418-2c5effb6f8d3', 3, 'Rendering web pages');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3ee550e9-26cb-430a-9418-2c5effb6f8d3', '57ef5eb5-8a68-45f3-9c3f-87e9d47b84dc', 'The Transport layer (TCP/IP model) provides end-to-end communication services between applications — TCP offers reliable, connection-oriented delivery with flow control and error recovery, while UDP offers a simpler, connectionless, unreliable (but lower-overhead) delivery model.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c802599c-69e5-46a5-b51a-048db2c0623a', '9c41f530-08db-4047-8407-0b03c9afec65', 108, 'The primary difference between TCP and UDP is that TCP:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b36217e1-b5ba-4f15-8c4d-f233782fedec', 'c802599c-69e5-46a5-b51a-048db2c0623a', 0, 'Is connectionless and unreliable, while UDP is connection-oriented and reliable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c2809f4-3e58-4e03-a94e-0c8228b68004', 'c802599c-69e5-46a5-b51a-048db2c0623a', 1, 'Is connection-oriented and reliable (with acknowledgments, retransmission, and ordering guarantees), while UDP is connectionless and does not guarantee delivery or ordering');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('afa30a33-9a2f-446b-a41e-ad95c8117a15', 'c802599c-69e5-46a5-b51a-048db2c0623a', 2, 'Is used exclusively for video streaming, never for anything else');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4f5a550-3b7d-4a68-bcd1-40d7bfd402d5', 'c802599c-69e5-46a5-b51a-048db2c0623a', 3, 'Cannot be used over the internet');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c802599c-69e5-46a5-b51a-048db2c0623a', '4c2809f4-3e58-4e03-a94e-0c8228b68004', 'TCP (Transmission Control Protocol) establishes a connection and guarantees reliable, ordered delivery via acknowledgments and retransmission of lost packets; UDP (User Datagram Protocol) is connectionless and offers no such guarantees, trading reliability for lower overhead and latency — making UDP preferred for latency-sensitive applications like real-time video/audio streaming.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c78c5513-daee-4e84-b133-49ecbe6bf617', '9c41f530-08db-4047-8407-0b03c9afec65', 109, 'An IP address in IPv4 format consists of how many bits?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a896498-737a-4d24-9c8a-fde09d46ce2d', 'c78c5513-daee-4e84-b133-49ecbe6bf617', 0, '16 bits');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2968ed0-eb20-48ce-9d38-115dd2e80e9f', 'c78c5513-daee-4e84-b133-49ecbe6bf617', 1, '32 bits');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('637f2244-e732-4a61-909a-727dd6968de9', 'c78c5513-daee-4e84-b133-49ecbe6bf617', 2, '64 bits');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('659260d3-2164-474e-b22a-057e9febdf68', 'c78c5513-daee-4e84-b133-49ecbe6bf617', 3, '128 bits');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c78c5513-daee-4e84-b133-49ecbe6bf617', 'a2968ed0-eb20-48ce-9d38-115dd2e80e9f', 'An IPv4 address consists of 32 bits, typically represented as four decimal octets (e.g., 192.168.1.1) — IPv6, developed to address IPv4''s address exhaustion, uses 128-bit addresses instead.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('53b58ed8-b88c-45ba-b31b-88527ca6c0ba', '9c41f530-08db-4047-8407-0b03c9afec65', 110, 'A ''subnet mask'' in IP networking is used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d06d7bd-1a88-4a5c-a340-72770d693c76', '53b58ed8-b88c-45ba-b31b-88527ca6c0ba', 0, 'Encrypt IP addresses');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d432f512-5c32-40c1-93ce-1fa47830184b', '53b58ed8-b88c-45ba-b31b-88527ca6c0ba', 1, 'Divide an IP address into its network and host portions, determining which addresses belong to the same local network');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c44f6c5-2eb1-4927-a815-190211d981a9', '53b58ed8-b88c-45ba-b31b-88527ca6c0ba', 2, 'Assign a device''s MAC address');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c84a8269-4275-4014-abd8-e5b1b14cbb7e', '53b58ed8-b88c-45ba-b31b-88527ca6c0ba', 3, 'Block all internet traffic');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('53b58ed8-b88c-45ba-b31b-88527ca6c0ba', 'd432f512-5c32-40c1-93ce-1fa47830184b', 'A subnet mask determines which portion of an IP address represents the network and which represents the specific host, enabling routers and devices to determine whether a destination address is on the same local network or requires routing to a different network.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f2954191-2590-4af5-bd81-ca0bb2c888d8', '9c41f530-08db-4047-8407-0b03c9afec65', 111, 'DNS (Domain Name System) primarily serves to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8720e6f-9d54-4eaa-8a4e-361e1de995f5', 'f2954191-2590-4af5-bd81-ca0bb2c888d8', 0, 'Encrypt web traffic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('340c43d4-0bd6-49b6-82e8-e0d1c2460a27', 'f2954191-2590-4af5-bd81-ca0bb2c888d8', 1, 'Translate human-readable domain names (like example.com) into IP addresses that computers use to identify each other on a network');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06aecabd-b3b1-4b72-967b-901852a3a746', 'f2954191-2590-4af5-bd81-ca0bb2c888d8', 2, 'Assign IP addresses dynamically to devices');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0b30e98-9ecd-4959-a8d7-033c9dadef7e', 'f2954191-2590-4af5-bd81-ca0bb2c888d8', 3, 'Compress data before transmission');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f2954191-2590-4af5-bd81-ca0bb2c888d8', '340c43d4-0bd6-49b6-82e8-e0d1c2460a27', 'DNS translates human-readable domain names into the numeric IP addresses that devices actually use to route traffic — functioning as the internet''s distributed ''phone book'', without which users would need to remember numeric IP addresses directly.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f5834b98-c5b3-4702-bb7a-fe4cf1333328', '9c41f530-08db-4047-8407-0b03c9afec65', 112, 'DHCP (Dynamic Host Configuration Protocol) is primarily used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a4a9c05-b9bd-4919-8a68-54682fb56246', 'f5834b98-c5b3-4702-bb7a-fe4cf1333328', 0, 'Automatically assign IP addresses and other network configuration parameters to devices on a network');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7a1a997-c83e-4369-be0e-cd12fc51a6d3', 'f5834b98-c5b3-4702-bb7a-fe4cf1333328', 1, 'Encrypt network traffic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce031de9-56f0-4e39-a4a3-dae870983a6b', 'f5834b98-c5b3-4702-bb7a-fe4cf1333328', 2, 'Translate domain names to IP addresses');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ced2647-31b4-44d0-929e-04cdd43c9688', 'f5834b98-c5b3-4702-bb7a-fe4cf1333328', 3, 'Route traffic between different networks');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f5834b98-c5b3-4702-bb7a-fe4cf1333328', '1a4a9c05-b9bd-4919-8a68-54682fb56246', 'DHCP automatically assigns IP addresses (and other configuration parameters like subnet mask, default gateway, and DNS server) to devices joining a network, eliminating the need for manual IP configuration on each device.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('eb4e9b85-7d97-4f3c-b890-9fa360533554', '9c41f530-08db-4047-8407-0b03c9afec65', 113, 'A ''router'', as distinct from a ''switch'', primarily operates by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8850ecc3-e59e-4195-8148-c964e2dd0701', 'eb4e9b85-7d97-4f3c-b890-9fa360533554', 0, 'Forwarding data only within a single local network segment based on MAC addresses');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5398fd2f-5041-43ae-ad00-328017d3d006', 'eb4e9b85-7d97-4f3c-b890-9fa360533554', 1, 'Forwarding data BETWEEN different networks based on IP addresses, making routing decisions at the Network layer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8599d3e-3839-4473-8d28-4817a6822177', 'eb4e9b85-7d97-4f3c-b890-9fa360533554', 2, 'Only amplifying electrical signals with no intelligent forwarding');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d3fb93c-ae8c-4978-953d-5cd89f120e53', 'eb4e9b85-7d97-4f3c-b890-9fa360533554', 3, 'Operating exclusively at the Physical layer');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('eb4e9b85-7d97-4f3c-b890-9fa360533554', '5398fd2f-5041-43ae-ad00-328017d3d006', 'A router operates at the Network layer, forwarding data between different networks based on IP addresses and routing tables — distinct from a switch, which typically operates at the Data Link layer, forwarding data within a single local network segment based on MAC addresses.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8df88169-8555-4ab3-93b3-7d60846709af', '9c41f530-08db-4047-8407-0b03c9afec65', 114, '''Firewall'', a network security device/software, primarily functions to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2fa06a59-9a3c-4002-ae11-37d65780d92e', '8df88169-8555-4ab3-93b3-7d60846709af', 0, 'Encrypt all data on a hard disk');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('182a94c0-b276-4b6b-9f63-6c0508b8c56a', '8df88169-8555-4ab3-93b3-7d60846709af', 1, 'Monitor and control incoming and outgoing network traffic based on predetermined security rules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89d9d8bd-d7a1-4784-9cc3-9aa40a5c2788', '8df88169-8555-4ab3-93b3-7d60846709af', 2, 'Physically block electrical surges');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a87e96fb-76dd-4771-85dd-cdbfd1e6fe75', '8df88169-8555-4ab3-93b3-7d60846709af', 3, 'Compress network traffic to save bandwidth');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8df88169-8555-4ab3-93b3-7d60846709af', '182a94c0-b276-4b6b-9f63-6c0508b8c56a', 'A firewall monitors and controls network traffic based on configured security rules, permitting or blocking traffic based on criteria like source/destination IP, port, or protocol — a foundational network security control.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8e05724d-c48a-496a-bbf9-76bf6cfa5651', '9c41f530-08db-4047-8407-0b03c9afec65', 115, 'HTTPS, as distinct from HTTP, provides:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85cecab3-9018-4d0b-862f-2c80c48b35ef', '8e05724d-c48a-496a-bbf9-76bf6cfa5651', 0, 'Faster page loading with no security features');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbe12993-16c5-4342-9f79-9337711f6ad3', '8e05724d-c48a-496a-bbf9-76bf6cfa5651', 1, 'Encrypted, authenticated communication (typically via TLS/SSL) between a client and server, protecting data in transit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4dade3e-96cd-4015-a263-7274b75f80bf', '8e05724d-c48a-496a-bbf9-76bf6cfa5651', 2, 'A completely different, incompatible web page format');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d33c0046-ed12-4ae6-b263-9980a8130f0f', '8e05724d-c48a-496a-bbf9-76bf6cfa5651', 3, 'No meaningful practical difference from HTTP');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8e05724d-c48a-496a-bbf9-76bf6cfa5651', 'bbe12993-16c5-4342-9f79-9337711f6ad3', 'HTTPS (HTTP Secure) adds a layer of encryption (typically via TLS/SSL) on top of standard HTTP, providing confidentiality, integrity, and authentication for data exchanged between a client and server — critical for protecting sensitive data like login credentials and payment information.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3e5cdadf-8da6-49ca-83fd-445d677b8036', '9c41f530-08db-4047-8407-0b03c9afec65', 116, 'In networking, ''latency'' refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('074ef349-7c12-478c-a81f-b35a2e681f56', '3e5cdadf-8da6-49ca-83fd-445d677b8036', 0, 'The total amount of data a connection can carry per second');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e4a182a-e772-40ca-8604-37cdabf7b8a5', '3e5cdadf-8da6-49ca-83fd-445d677b8036', 1, 'The time delay between sending a request and receiving a response (or between a packet being sent and received)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d082d80a-a7fa-407c-b7d3-b27498f25cac', '3e5cdadf-8da6-49ca-83fd-445d677b8036', 2, 'The physical distance between two devices only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49015e48-702c-4be8-a680-2e972a962aa1', '3e5cdadf-8da6-49ca-83fd-445d677b8036', 3, 'The number of devices connected to a network');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3e5cdadf-8da6-49ca-83fd-445d677b8036', '9e4a182a-e772-40ca-8604-37cdabf7b8a5', 'Latency measures the time delay for data to travel from source to destination (or for a request-response round trip) — distinct from bandwidth (the total data-carrying capacity of a connection), though both affect perceived network performance.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b1ed55d3-2fc7-42bd-86fd-fca9d18c575f', '9c41f530-08db-4047-8407-0b03c9afec65', 117, 'A ''MAC address'' is best described as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e70db77b-73f5-4af3-b5af-2861803bd66d', 'b1ed55d3-2fc7-42bd-86fd-fca9d18c575f', 0, 'A dynamically-assigned, easily-changeable software address');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5eb1decb-2406-4af3-8ced-045a1178eae3', 'b1ed55d3-2fc7-42bd-86fd-fca9d18c575f', 1, 'A unique hardware identifier assigned to a network interface, typically fixed at the time of manufacture');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8c4385d-c68b-4dce-b96b-0cc056918216', 'b1ed55d3-2fc7-42bd-86fd-fca9d18c575f', 2, 'The same as an IP address in every respect');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42caa8d6-46c0-4963-a873-afac0ba33479', 'b1ed55d3-2fc7-42bd-86fd-fca9d18c575f', 3, 'A type of network protocol');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b1ed55d3-2fc7-42bd-86fd-fca9d18c575f', '5eb1decb-2406-4af3-8ced-045a1178eae3', 'A MAC (Media Access Control) address is a unique hardware identifier assigned to a network interface controller, typically fixed by the manufacturer — used at the Data Link layer for local network communication, distinct from the logical, often dynamically-assigned IP address used at the Network layer.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b41c0a10-6822-472d-9a3b-aa0b271a542b', '9c41f530-08db-4047-8407-0b03c9afec65', 118, 'A VPN (Virtual Private Network) is primarily used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd62b5bf-5bcf-4470-a0ed-c9a9419f8030', 'b41c0a10-6822-472d-9a3b-aa0b271a542b', 0, 'Increase a device''s processing speed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02b8efd4-8465-49e9-94bf-dbd6826d24e4', 'b41c0a10-6822-472d-9a3b-aa0b271a542b', 1, 'Create a secure, encrypted connection over a public network (like the internet), allowing private, protected communication as if on a private network');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6797aba8-bfcd-4822-a41b-8fb5b550cd87', 'b41c0a10-6822-472d-9a3b-aa0b271a542b', 2, 'Physically extend a network cable''s maximum length');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1f2dcbd-3c18-45e8-a13a-cca03df79e09', 'b41c0a10-6822-472d-9a3b-aa0b271a542b', 3, 'Block all internet access entirely');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b41c0a10-6822-472d-9a3b-aa0b271a542b', '02b8efd4-8465-49e9-94bf-dbd6826d24e4', 'A VPN creates an encrypted tunnel over a public network (typically the internet), enabling secure, private communication and often masking the user''s actual network location/IP address — widely used for secure remote access to organizational networks and for privacy protection.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('295cee83-ae37-493b-ae23-b98c94f0a7d2', '9c41f530-08db-4047-8407-0b03c9afec65', 119, 'The three-way handshake in TCP connection establishment consists of which sequence of messages?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f58a175-bdbe-4ebe-b9ef-3557fa213970', '295cee83-ae37-493b-ae23-b98c94f0a7d2', 0, 'ACK, ACK, ACK');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('568bec73-a97a-406f-902d-f0a5a1b29338', '295cee83-ae37-493b-ae23-b98c94f0a7d2', 1, 'SYN, SYN-ACK, ACK');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8e4a71d-eb0a-4814-8913-e8a8c257972c', '295cee83-ae37-493b-ae23-b98c94f0a7d2', 2, 'SYN, ACK, FIN');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24c9a265-e0d7-4754-a822-b14e22f3774b', '295cee83-ae37-493b-ae23-b98c94f0a7d2', 3, 'FIN, FIN-ACK, ACK');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('295cee83-ae37-493b-ae23-b98c94f0a7d2', '568bec73-a97a-406f-902d-f0a5a1b29338', 'TCP''s three-way handshake establishes a connection via: SYN (client requests connection), SYN-ACK (server acknowledges and requests connection back), and ACK (client confirms) — after which the reliable, bidirectional connection is established.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fd3d81f1-48df-4685-8cf0-25b992e2829b', '9c41f530-08db-4047-8407-0b03c9afec65', 120, '''Bandwidth'' in networking refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4219650-9624-417f-90e9-826ea6d4ee03', 'fd3d81f1-48df-4685-8cf0-25b992e2829b', 0, 'The time delay for a single packet to arrive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a64dc53f-1d68-4cff-950f-ab6941ef04b2', 'fd3d81f1-48df-4685-8cf0-25b992e2829b', 1, 'The maximum rate of data transfer a network connection can support, typically measured in bits per second');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a93de01-7df4-48c0-b2b6-6e57527856ea', 'fd3d81f1-48df-4685-8cf0-25b992e2829b', 2, 'The physical thickness of a network cable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43fd9e1c-0283-4d7e-95f6-4d8090559429', 'fd3d81f1-48df-4685-8cf0-25b992e2829b', 3, 'The number of routers in a network path');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fd3d81f1-48df-4685-8cf0-25b992e2829b', 'a64dc53f-1d68-4cff-950f-ab6941ef04b2', 'Bandwidth measures the maximum data-carrying capacity of a network connection (typically expressed in bits per second, e.g., Mbps or Gbps) — distinct from latency, which measures delay rather than capacity.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bf6328e7-3de5-4f71-b414-50bd8de56736', '9c41f530-08db-4047-8407-0b03c9afec65', 121, '''Encapsulation'' in object-oriented programming refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6fcf9d1e-2609-4313-9af6-124dbc79c0c8', 'bf6328e7-3de5-4f71-b414-50bd8de56736', 0, 'Making all data and methods publicly accessible');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('adc15dbb-d630-42a2-a66a-17f4917cab53', 'bf6328e7-3de5-4f71-b414-50bd8de56736', 1, 'Bundling data and the methods that operate on it within a single unit (class/object), restricting direct external access to internal implementation details');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d90d0ff8-727f-4d1e-a7b6-82ea753cb69f', 'bf6328e7-3de5-4f71-b414-50bd8de56736', 2, 'Deleting unused objects automatically');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a87fc35c-61f1-4c23-b01f-c634aa1be60c', 'bf6328e7-3de5-4f71-b414-50bd8de56736', 3, 'Converting one data type to another');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bf6328e7-3de5-4f71-b414-50bd8de56736', 'adc15dbb-d630-42a2-a66a-17f4917cab53', 'Encapsulation bundles an object''s data (attributes) and the methods that operate on it into a single unit, restricting direct external access to internal state (typically via private/protected access modifiers) — promoting modularity and controlled interaction through a well-defined public interface.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('78d651c0-4ce5-40e4-90b2-768cc780fa42', '9c41f530-08db-4047-8407-0b03c9afec65', 122, '''Inheritance'' in object-oriented programming allows:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d396641-cb89-4ff9-aa30-e44efd233749', '78d651c0-4ce5-40e4-90b2-768cc780fa42', 0, 'A class to have zero methods');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('388e6fff-a084-4778-a9c9-b3be703f960a', '78d651c0-4ce5-40e4-90b2-768cc780fa42', 1, 'A new class (subclass/derived class) to acquire the properties and behaviors of an existing class (superclass/base class), enabling code reuse');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca47402c-031d-44d8-8edd-a13163611407', '78d651c0-4ce5-40e4-90b2-768cc780fa42', 2, 'Objects to be deleted automatically');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87e1ca25-98bd-47c7-b565-12238eeda777', '78d651c0-4ce5-40e4-90b2-768cc780fa42', 3, 'Variables to change their data type at runtime freely');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('78d651c0-4ce5-40e4-90b2-768cc780fa42', '388e6fff-a084-4778-a9c9-b3be703f960a', 'Inheritance allows a derived (child) class to acquire the attributes and methods of a base (parent) class, enabling code reuse and establishing an ''is-a'' relationship between classes — a foundational object-oriented programming concept.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('457b69c8-06c5-48ee-9bef-7ddc16e64ef2', '9c41f530-08db-4047-8407-0b03c9afec65', 123, '''Polymorphism'' in object-oriented programming refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1649da21-e534-474d-898a-53c0002ee2dc', '457b69c8-06c5-48ee-9bef-7ddc16e64ef2', 0, 'A class having only one method');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d65e9c0-25ec-4122-8d44-36496407488d', '457b69c8-06c5-48ee-9bef-7ddc16e64ef2', 1, 'The ability of different classes/objects to respond to the same method call in ways specific to their own type/implementation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7efb4d5d-1923-4286-92ec-9cac2c71c4ba', '457b69c8-06c5-48ee-9bef-7ddc16e64ef2', 2, 'Deleting all inherited methods');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('675da8c5-dee7-490f-ab0f-49e61f3d571a', '457b69c8-06c5-48ee-9bef-7ddc16e64ef2', 3, 'Converting an object to a primitive data type');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('457b69c8-06c5-48ee-9bef-7ddc16e64ef2', '4d65e9c0-25ec-4122-8d44-36496407488d', 'Polymorphism allows objects of different classes to be treated through a common interface, with each object responding to the same method call according to its own specific implementation (e.g., method overriding) — enabling flexible, extensible code design.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('63646b5a-654f-4728-a95f-4ba9d2d60f4d', '9c41f530-08db-4047-8407-0b03c9afec65', 124, '''Abstraction'' in object-oriented programming primarily focuses on:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77ef412c-3318-4da8-a6f9-4731ba08640a', '63646b5a-654f-4728-a95f-4ba9d2d60f4d', 0, 'Exposing every internal implementation detail to the user');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63ee0fde-7a9e-4d3e-a928-5147472fd6b4', '63646b5a-654f-4728-a95f-4ba9d2d60f4d', 1, 'Presenting only essential features/behavior to the user while hiding complex underlying implementation details');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33694787-65c5-46d1-a380-10c47963cc22', '63646b5a-654f-4728-a95f-4ba9d2d60f4d', 2, 'Making a class impossible to instantiate under any circumstance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('211d29d9-17e7-496d-ae29-4255fe1a4824', '63646b5a-654f-4728-a95f-4ba9d2d60f4d', 3, 'Removing all methods from a class');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('63646b5a-654f-4728-a95f-4ba9d2d60f4d', '63ee0fde-7a9e-4d3e-a928-5147472fd6b4', 'Abstraction focuses on exposing only the essential, relevant features and behavior of an object to the user, while hiding the complex internal implementation details — allowing users to interact with an object through a simplified interface without needing to understand its internal workings.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0cc622dc-ab4e-49cd-9bfb-6bc2e03bce9f', '9c41f530-08db-4047-8407-0b03c9afec65', 125, 'The Software Development Life Cycle (SDLC) ''Waterfall'' model is characterized by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('016a597b-2c35-4b15-a578-ea1db09e5d1a', '0cc622dc-ab4e-49cd-9bfb-6bc2e03bce9f', 0, 'Highly iterative, overlapping phases with frequent revisiting of earlier stages');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e413e1d8-45ce-480a-abef-eda75709ec40', '0cc622dc-ab4e-49cd-9bfb-6bc2e03bce9f', 1, 'A linear, sequential progression through distinct phases (requirements, design, implementation, testing, deployment), with each phase generally completed before the next begins');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('919e8903-a39a-4fb7-b256-abd4574f77ff', '0cc622dc-ab4e-49cd-9bfb-6bc2e03bce9f', 2, 'No planning phase at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1079c6d-3370-4361-962d-788fc15f3f21', '0cc622dc-ab4e-49cd-9bfb-6bc2e03bce9f', 3, 'Skipping the testing phase entirely');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0cc622dc-ab4e-49cd-9bfb-6bc2e03bce9f', 'e413e1d8-45ce-480a-abef-eda75709ec40', 'The Waterfall model follows a linear, sequential approach where each phase (requirements, design, implementation, testing, deployment) is generally completed before moving to the next, with limited iteration back to earlier phases — contrasted with iterative/agile approaches that embrace more frequent revisiting and adaptation.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0be85fee-37d4-4170-b669-451d6432fc14', '9c41f530-08db-4047-8407-0b03c9afec65', 126, 'Agile software development methodology emphasizes:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85d361b4-6653-4b84-80eb-e2cbdeb1d118', '0be85fee-37d4-4170-b669-451d6432fc14', 0, 'Rigid, fixed requirements defined once at the very start, with no changes allowed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('615ffd70-9e65-4834-becc-e76a4e037307', '0be85fee-37d4-4170-b669-451d6432fc14', 1, 'Iterative development, frequent collaboration, and adaptability to changing requirements throughout the project');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bfc5c643-2f59-42ff-a7fc-aaaac906222a', '0be85fee-37d4-4170-b669-451d6432fc14', 2, 'Completing all documentation before writing any code');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7973a8ea-dc09-4fe0-878b-e1f49e2584dd', '0be85fee-37d4-4170-b669-451d6432fc14', 3, 'Avoiding customer/stakeholder involvement until final delivery');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0be85fee-37d4-4170-b669-451d6432fc14', '615ffd70-9e65-4834-becc-e76a4e037307', 'Agile methodology emphasizes iterative development in short cycles (sprints), frequent collaboration with stakeholders, and adaptability to evolving requirements — contrasted with the more rigid, sequential Waterfall approach.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('23b56f4d-ad67-4a09-a613-69ba3eefa9d9', '9c41f530-08db-4047-8407-0b03c9afec65', 127, '''Version control'' systems (like Git) are primarily used in software development to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('156e41d5-2955-4e33-bc08-b8b0548dc3c7', '23b56f4d-ad67-4a09-a613-69ba3eefa9d9', 0, 'Compile source code into an executable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32396811-2771-42a7-abaf-88a963de7388', '23b56f4d-ad67-4a09-a613-69ba3eefa9d9', 1, 'Track and manage changes to source code over time, enabling collaboration, history tracking, and reverting to previous versions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6dc6483-c908-4e58-94a6-435f20194c24', '23b56f4d-ad67-4a09-a613-69ba3eefa9d9', 2, 'Test software for bugs automatically');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74300b03-665f-4cba-8318-8ee636e30c76', '23b56f4d-ad67-4a09-a613-69ba3eefa9d9', 3, 'Deploy software to production servers exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('23b56f4d-ad67-4a09-a613-69ba3eefa9d9', '32396811-2771-42a7-abaf-88a963de7388', 'Version control systems track changes to source code over time, enabling multiple developers to collaborate, maintaining a complete history of changes, and allowing reversion to previous versions if needed — an essential tool in modern software development workflows.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e58e87eb-c3cb-4906-b78e-e1e4f2ac0a47', '9c41f530-08db-4047-8407-0b03c9afec65', 128, '''Unit testing'' in software engineering refers to testing:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d288f96-4190-4f1c-a1f4-33cfa2368143', 'e58e87eb-c3cb-4906-b78e-e1e4f2ac0a47', 0, 'The entire integrated system as a whole, end to end');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b30ca1d-c028-4164-baac-f5dbaa66ce41', 'e58e87eb-c3cb-4906-b78e-e1e4f2ac0a47', 1, 'Individual, isolated components or functions of code, typically in isolation from the rest of the system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a9550ee-428c-44a5-a0a9-8cf4795badc5', 'e58e87eb-c3cb-4906-b78e-e1e4f2ac0a47', 2, 'Only the user interface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88c9f380-826a-4193-9f48-753a1f024d51', 'e58e87eb-c3cb-4906-b78e-e1e4f2ac0a47', 3, 'Only the database schema');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e58e87eb-c3cb-4906-b78e-e1e4f2ac0a47', '4b30ca1d-c028-4164-baac-f5dbaa66ce41', 'Unit testing verifies the correctness of individual, isolated components or functions of code (typically the smallest testable units), usually in isolation from other parts of the system — distinct from integration testing (testing how components work together) and system testing (testing the complete integrated system).', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6814ddf3-8c15-458c-9241-bdb069f9c1c5', '9c41f530-08db-4047-8407-0b03c9afec65', 129, 'A ''design pattern'' in software engineering refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8187fe50-6a06-4eed-b8ed-67cabed4ad9d', '6814ddf3-8c15-458c-9241-bdb069f9c1c5', 0, 'A specific piece of finished, ready-to-use code that must be copied exactly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('977f1263-1c51-4946-a028-4fb910e4736f', '6814ddf3-8c15-458c-9241-bdb069f9c1c5', 1, 'A general, reusable solution template to a commonly occurring design problem within a given context');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fcba13f8-e58a-427e-9b28-c14398401bbe', '6814ddf3-8c15-458c-9241-bdb069f9c1c5', 2, 'A mandatory government regulation for software');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c82e2fc9-ddac-456b-889e-393d922e6d12', '6814ddf3-8c15-458c-9241-bdb069f9c1c5', 3, 'A type of hardware component');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6814ddf3-8c15-458c-9241-bdb069f9c1c5', '977f1263-1c51-4946-a028-4fb910e4736f', 'A design pattern is a general, reusable solution template (not specific finished code) to a commonly occurring software design problem, providing a shared vocabulary and proven approach that developers can adapt to their specific context (e.g., Singleton, Observer, Factory patterns).', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('57505582-c3ba-4f7a-bf88-bc9d367442ab', '9c41f530-08db-4047-8407-0b03c9afec65', 130, '''Requirement gathering'', an early phase in software development, primarily aims to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('852b53ef-8bc5-433a-a932-d7368bdae0c2', '57505582-c3ba-4f7a-bf88-bc9d367442ab', 0, 'Write the final production code');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4095d95-2374-41c1-8fc9-ed97dcbb7c57', '57505582-c3ba-4f7a-bf88-bc9d367442ab', 1, 'Understand and document what the software system needs to do, gathered from stakeholders/users before design and implementation begin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f346c46c-f2fb-49b6-ab95-8111f22fffc1', '57505582-c3ba-4f7a-bf88-bc9d367442ab', 2, 'Deploy the software to end users');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6294827e-b9f6-4044-bace-9d80fe26e1f7', '57505582-c3ba-4f7a-bf88-bc9d367442ab', 3, 'Debug existing production issues');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('57505582-c3ba-4f7a-bf88-bc9d367442ab', 'd4095d95-2374-41c1-8fc9-ed97dcbb7c57', 'Requirement gathering is the process of understanding and documenting what stakeholders/users need the software system to accomplish, forming the foundation for subsequent design and implementation phases — errors or gaps at this stage are often the most costly to fix later in the development lifecycle.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3a7c6679-6098-4be3-bee7-e7cc4e021785', '9c41f530-08db-4047-8407-0b03c9afec65', 131, 'The ''ALU'' (Arithmetic Logic Unit) in a CPU is responsible for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a91eb5d-50c6-4637-86c5-88728f91aaec', '3a7c6679-6098-4be3-bee7-e7cc4e021785', 0, 'Storing program instructions permanently');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e647cf57-f1c7-4b82-ba05-c55514a94a49', '3a7c6679-6098-4be3-bee7-e7cc4e021785', 1, 'Performing arithmetic (addition, subtraction) and logical (AND, OR, comparison) operations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('857ab6fb-c1dc-4262-982b-c343e61067a5', '3a7c6679-6098-4be3-bee7-e7cc4e021785', 2, 'Managing network connections');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1b2f995-6745-43f4-9d95-e3dc7845c5a0', '3a7c6679-6098-4be3-bee7-e7cc4e021785', 3, 'Rendering display output directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3a7c6679-6098-4be3-bee7-e7cc4e021785', 'e647cf57-f1c7-4b82-ba05-c55514a94a49', 'The ALU is the component of the CPU responsible for performing arithmetic operations (addition, subtraction, multiplication) and logical operations (AND, OR, NOT, comparisons) on data.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1eaf735c-d5fe-4f37-a1f8-c44bc59994b9', '9c41f530-08db-4047-8407-0b03c9afec65', 132, '''Cache memory'' in a computer system is primarily used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b055b81d-9e18-42f9-b797-443b4dd615d2', '1eaf735c-d5fe-4f37-a1f8-c44bc59994b9', 0, 'Permanently store the operating system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df5a553a-f7bb-4cd4-90cd-bba9a9f5a3e9', '1eaf735c-d5fe-4f37-a1f8-c44bc59994b9', 1, 'Provide fast, small-capacity storage for frequently accessed data, reducing the average time to access data from the slower main memory (RAM)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82ddfebe-89a4-49f5-9d2b-568e988de3e4', '1eaf735c-d5fe-4f37-a1f8-c44bc59994b9', 2, 'Replace the need for RAM entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce651e1d-90c8-48aa-b790-b3fcc7e6a4f9', '1eaf735c-d5fe-4f37-a1f8-c44bc59994b9', 3, 'Store data only when the computer is powered off');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1eaf735c-d5fe-4f37-a1f8-c44bc59994b9', 'df5a553a-f7bb-4cd4-90cd-bba9a9f5a3e9', 'Cache memory is a small, very fast memory layer positioned between the CPU and main memory (RAM), storing frequently or recently accessed data/instructions to significantly reduce average memory access time compared to always fetching from slower RAM.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('df6e9c59-0a42-4125-af45-ee5d9806af5a', '9c41f530-08db-4047-8407-0b03c9afec65', 133, 'The ''von Neumann architecture'', foundational to most modern computers, is characterized by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6992f09-a7c1-4774-bd36-1cf0bbcd97f6', 'df6e9c59-0a42-4125-af45-ee5d9806af5a', 0, 'Separate, physically distinct memory for instructions and data');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33435044-1abd-440e-8405-563d2b5153f6', 'df6e9c59-0a42-4125-af45-ee5d9806af5a', 1, 'A single, shared memory space storing both program instructions and data, accessed via a shared bus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9fb3337-415f-4b62-9a61-a3cab4d8f2dc', 'df6e9c59-0a42-4125-af45-ee5d9806af5a', 2, 'No CPU at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d09763e0-0248-432f-9624-1a1620a93599', 'df6e9c59-0a42-4125-af45-ee5d9806af5a', 3, 'Exclusively analog (non-digital) computation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('df6e9c59-0a42-4125-af45-ee5d9806af5a', '33435044-1abd-440e-8405-563d2b5153f6', 'The von Neumann architecture stores both program instructions and data in the same shared memory space, accessed via a common bus — this is the foundational architecture of most modern general-purpose computers, distinct from the Harvard architecture, which uses physically separate memory for instructions and data.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('da846949-598e-4ccc-94aa-2fe97deb000d', '9c41f530-08db-4047-8407-0b03c9afec65', 134, '''Clock speed'' of a processor, typically measured in GHz, refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b68747e-7fde-4df1-80d5-e72315b7b5d2', 'da846949-598e-4ccc-94aa-2fe97deb000d', 0, 'The amount of RAM installed in the system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3361aa97-0606-41d9-b3f5-68aebf466d1c', 'da846949-598e-4ccc-94aa-2fe97deb000d', 1, 'The number of clock cycles (basic operations) the processor can execute per second');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('546702a8-b3c6-4e9e-af7b-349eff45509c', 'da846949-598e-4ccc-94aa-2fe97deb000d', 2, 'The processor''s physical temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e2b97d72-62f5-43c2-bc28-aa665f7151d3', 'da846949-598e-4ccc-94aa-2fe97deb000d', 3, 'The number of USB ports available');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('da846949-598e-4ccc-94aa-2fe97deb000d', '3361aa97-0606-41d9-b3f5-68aebf466d1c', 'Clock speed measures how many clock cycles a processor can execute per second (e.g., 3 GHz = 3 billion cycles/second) — while higher clock speed generally enables faster processing, actual performance also depends on architecture, instructions-per-cycle, and workload characteristics.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cae57f15-dd0e-46f3-bcde-0acb9581b75d', '9c41f530-08db-4047-8407-0b03c9afec65', 135, '''Pipelining'' in CPU architecture improves performance by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb3e1250-e01f-44b0-8ee0-0f84554f9e68', 'cae57f15-dd0e-46f3-bcde-0acb9581b75d', 0, 'Executing instructions strictly one at a time from start to finish before beginning the next');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1075036b-7dff-41ae-8857-289ee92383ea', 'cae57f15-dd0e-46f3-bcde-0acb9581b75d', 1, 'Overlapping the execution stages (fetch, decode, execute) of multiple instructions simultaneously, improving overall instruction throughput');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5502817-ffd7-4840-9f81-08689a9e2dd9', 'cae57f15-dd0e-46f3-bcde-0acb9581b75d', 2, 'Increasing the physical size of the CPU chip only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28da2422-e77e-4d01-bf6d-dbb4184ef5a9', 'cae57f15-dd0e-46f3-bcde-0acb9581b75d', 3, 'Disabling the ALU during idle periods');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cae57f15-dd0e-46f3-bcde-0acb9581b75d', '1075036b-7dff-41ae-8857-289ee92383ea', 'Pipelining overlaps the execution stages of multiple instructions (e.g., while one instruction is being executed, the next is being decoded, and the one after that is being fetched), significantly improving overall instruction throughput compared to fully sequential, non-overlapped instruction processing.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('60e530a8-d308-499c-a16f-2ef4e3104095', '9c41f530-08db-4047-8407-0b03c9afec65', 136, '''RISC'' architecture, as distinct from ''CISC'', is generally characterized by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b4a4cef-6fb8-4b43-b0c3-a2b6ede7dc20', '60e530a8-d308-499c-a16f-2ef4e3104095', 0, 'A large, complex instruction set with variable instruction lengths');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7793fbd3-096c-4d8e-aedf-c4dd25f20b2e', '60e530a8-d308-499c-a16f-2ef4e3104095', 1, 'A smaller set of simple, fixed-length instructions, each generally executable in about one clock cycle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2cabdc53-d29a-49f6-b1a1-9bd654222f10', '60e530a8-d308-499c-a16f-2ef4e3104095', 2, 'The complete absence of any instruction set');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b939d435-8b78-4fcf-8e7a-6afd0668ccbf', '60e530a8-d308-499c-a16f-2ef4e3104095', 3, 'Exclusively analog signal processing');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('60e530a8-d308-499c-a16f-2ef4e3104095', '7793fbd3-096c-4d8e-aedf-c4dd25f20b2e', 'RISC (Reduced Instruction Set Computer) architectures favor a smaller set of simple, fixed-length instructions, each executable in roughly one clock cycle — contrasted with CISC (Complex Instruction Set Computer) architectures, which use a larger, more complex instruction set with variable-length instructions.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('125c0dab-2be4-4e51-a255-42812085785c', '9c41f530-08db-4047-8407-0b03c9afec65', 137, '''Interrupt'', in the context of computer architecture, is a mechanism that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f49850b-4e42-4540-8577-a603a7f65a51', '125c0dab-2be4-4e51-a255-42812085785c', 0, 'Permanently halts the CPU with no recovery possible');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('955fd874-0362-4519-afb6-4db3a431fc8e', '125c0dab-2be4-4e51-a255-42812085785c', 1, 'Allows hardware or software to signal the CPU to temporarily suspend its current task and handle a higher-priority event');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f25f1bc5-5171-45f5-9f14-b26d7dae4b74', '125c0dab-2be4-4e51-a255-42812085785c', 2, 'Only occurs during system shutdown');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c25a74bc-38cf-47cb-aa19-cc2473086767', '125c0dab-2be4-4e51-a255-42812085785c', 3, 'Is identical in function to a system reboot');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('125c0dab-2be4-4e51-a255-42812085785c', '955fd874-0362-4519-afb6-4db3a431fc8e', 'An interrupt allows hardware devices (like a keyboard or disk controller) or software conditions to signal the CPU, causing it to temporarily suspend its current execution and jump to a dedicated interrupt handler routine to address the event, before resuming its original task.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('db58ef4a-6c5f-4cf6-92e5-09e902aaab60', '9c41f530-08db-4047-8407-0b03c9afec65', 138, '''Register'' memory, within a CPU, is characterized by being:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('139bfc7f-12c6-4850-9f46-1150b1b1c999', 'db58ef4a-6c5f-4cf6-92e5-09e902aaab60', 0, 'The slowest but largest-capacity memory in the memory hierarchy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('380510cd-b349-4751-b01a-d8345ac73a25', 'db58ef4a-6c5f-4cf6-92e5-09e902aaab60', 1, 'The fastest, smallest-capacity memory, located directly within the CPU itself, used for immediate operand storage during instruction execution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dad3c5b5-e9f1-4959-aae8-3f271dda3b80', 'db58ef4a-6c5f-4cf6-92e5-09e902aaab60', 2, 'External storage on a hard disk');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('370a8bd9-3a5c-4e6b-859a-a0160fa64622', 'db58ef4a-6c5f-4cf6-92e5-09e902aaab60', 3, 'A type of network memory shared across multiple computers');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('db58ef4a-6c5f-4cf6-92e5-09e902aaab60', '380510cd-b349-4751-b01a-d8345ac73a25', 'Registers are the fastest, smallest-capacity memory elements in the memory hierarchy, located directly within the CPU itself, used to hold operands and intermediate results during instruction execution — sitting even above cache memory in the speed hierarchy, at the cost of very limited capacity.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('400575fe-7ace-47ee-9205-e050d37fb7a2', '9c41f530-08db-4047-8407-0b03c9afec65', 139, 'The ''fetch-decode-execute'' cycle describes:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ceed6ce-ea67-4ef6-924a-dc379e1ac2e0', '400575fe-7ace-47ee-9205-e050d37fb7a2', 0, 'A network communication protocol');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1faf0b9b-5bd5-493f-93d9-fe387280db95', '400575fe-7ace-47ee-9205-e050d37fb7a2', 1, 'The fundamental repeating sequence by which a CPU retrieves, interprets, and carries out each instruction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ba4fbc9-5de2-49fa-81bf-3f1b531605d5', '400575fe-7ace-47ee-9205-e050d37fb7a2', 2, 'A database transaction process');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a8bfd6c-322f-47f3-ab6a-11d01d80b5cd', '400575fe-7ace-47ee-9205-e050d37fb7a2', 3, 'A file compression algorithm');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('400575fe-7ace-47ee-9205-e050d37fb7a2', '1faf0b9b-5bd5-493f-93d9-fe387280db95', 'The fetch-decode-execute cycle is the fundamental repeating sequence of CPU operation: fetching the next instruction from memory, decoding it to determine the required operation, and executing that operation — the basic operational loop underlying all instruction processing in a processor.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('79a3fc47-caf3-4341-8d3a-ca98be3bada4', '9c41f530-08db-4047-8407-0b03c9afec65', 140, '''Secondary storage'' (like a hard disk or SSD), as distinct from ''primary storage'' (RAM), is characterized by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5159f180-c9b3-4e76-a2e7-420865752eaf', '79a3fc47-caf3-4341-8d3a-ca98be3bada4', 0, 'Being volatile — losing all data when power is removed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebe4f709-57cc-4101-8e12-5c8babb9e476', '79a3fc47-caf3-4341-8d3a-ca98be3bada4', 1, 'Being non-volatile (retaining data without continuous power) but generally slower to access than primary storage (RAM)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5e4ce48-ee72-4aa2-be7c-1423dc89af65', '79a3fc47-caf3-4341-8d3a-ca98be3bada4', 2, 'Being faster to access than RAM in every case');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e649642-6f5b-490c-9e99-4e80a0f41344', '79a3fc47-caf3-4341-8d3a-ca98be3bada4', 3, 'Being located directly on the CPU chip');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('79a3fc47-caf3-4341-8d3a-ca98be3bada4', 'ebe4f709-57cc-4101-8e12-5c8babb9e476', 'Secondary storage (hard disks, SSDs) is non-volatile, retaining stored data even when power is removed, but is generally significantly slower to access than primary storage (RAM), which is volatile (loses data on power loss) but much faster — this speed/persistence tradeoff is the basis of the computer''s overall memory hierarchy.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6e7211eb-a7c9-492b-bc94-b5e3b156e6e4', '9c41f530-08db-4047-8407-0b03c9afec65', 141, 'A ''finite automaton'' (finite state machine) is a computational model characterized by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23401c56-c475-44ce-ae6f-6ca705c0318b', '6e7211eb-a7c9-492b-bc94-b5e3b156e6e4', 0, 'An infinite number of possible states');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bf3f1be6-0cdd-4c8e-a490-e80be0cb71a3', '6e7211eb-a7c9-492b-bc94-b5e3b156e6e4', 1, 'A finite number of states, transitioning between them based on input symbols, used to recognize regular languages');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1962acf0-e2d4-451f-82a1-b09bdaf22f31', '6e7211eb-a7c9-492b-bc94-b5e3b156e6e4', 2, 'The ability to solve any computable problem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc33eef0-9774-4ec8-b5c2-78e94f922048', '6e7211eb-a7c9-492b-bc94-b5e3b156e6e4', 3, 'Requiring unlimited memory');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6e7211eb-a7c9-492b-bc94-b5e3b156e6e4', 'bf3f1be6-0cdd-4c8e-a490-e80be0cb71a3', 'A finite automaton is a computational model with a finite (limited) number of states, transitioning between states based on input symbols according to defined rules — used specifically to recognize/accept regular languages, the simplest class in the Chomsky hierarchy of formal languages.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a3df812c-2e9e-46d5-87c3-c3c7f6b12830', '9c41f530-08db-4047-8407-0b03c9afec65', 142, 'The Chomsky hierarchy classifies formal languages into which order of increasing generative power (from most restrictive to least restrictive)?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a3b4ccd-4715-4fce-a8cd-7614ce332807', 'a3df812c-2e9e-46d5-87c3-c3c7f6b12830', 0, 'Context-free, Regular, Context-sensitive, Recursively enumerable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4aa890eb-f78b-4cfd-95d2-c034a673a2d3', 'a3df812c-2e9e-46d5-87c3-c3c7f6b12830', 1, 'Regular, Context-free, Context-sensitive, Recursively enumerable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0874b162-07e6-46b2-bbf7-73a3b4c93a8e', 'a3df812c-2e9e-46d5-87c3-c3c7f6b12830', 2, 'Recursively enumerable, Context-sensitive, Context-free, Regular');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1125f594-73d6-4519-b810-213068b31550', 'a3df812c-2e9e-46d5-87c3-c3c7f6b12830', 3, 'There is no defined hierarchy among these language types');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a3df812c-2e9e-46d5-87c3-c3c7f6b12830', '4aa890eb-f78b-4cfd-95d2-c034a673a2d3', 'The Chomsky hierarchy orders formal language classes by increasing generative power: Regular (Type 3, most restrictive), Context-free (Type 2), Context-sensitive (Type 1), and Recursively enumerable (Type 0, least restrictive/most powerful) — each higher class strictly contains all languages of the classes below it.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('34907693-c65d-43f2-af71-2c146f8d46d5', '9c41f530-08db-4047-8407-0b03c9afec65', 143, 'A compiler''s ''lexical analysis'' phase is primarily responsible for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dcc50906-d589-43e5-98c6-c56a03e9fa44', '34907693-c65d-43f2-af71-2c146f8d46d5', 0, 'Generating the final executable machine code');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4093bb1f-eb6c-4f95-b9d6-97215741e450', '34907693-c65d-43f2-af71-2c146f8d46d5', 1, 'Breaking the source code into a sequence of meaningful tokens (like keywords, identifiers, operators)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('787ead19-41f2-45af-b43b-c8baf562f47d', '34907693-c65d-43f2-af71-2c146f8d46d5', 2, 'Optimizing the generated machine code');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9301611a-19c0-4b59-b508-585cc997a59d', '34907693-c65d-43f2-af71-2c146f8d46d5', 3, 'Linking multiple object files together');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('34907693-c65d-43f2-af71-2c146f8d46d5', '4093bb1f-eb6c-4f95-b9d6-97215741e450', 'Lexical analysis (tokenization), the first phase of compilation, scans the source code character by character and groups them into meaningful tokens (keywords, identifiers, literals, operators, punctuation) — providing the input for the subsequent syntax analysis (parsing) phase.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('77448957-b127-4966-b6c8-4543d0828801', '9c41f530-08db-4047-8407-0b03c9afec65', 144, 'A compiler''s ''syntax analysis'' (parsing) phase checks whether:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35c2ceb8-8e63-436b-8983-9e7a63e06dd3', '77448957-b127-4966-b6c8-4543d0828801', 0, 'The program''s variable values are correct at runtime');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f7bedf2-0382-4b86-b7e6-c01caf705cfc', '77448957-b127-4966-b6c8-4543d0828801', 1, 'The sequence of tokens conforms to the grammatical rules (syntax) of the programming language, typically constructing a parse tree');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('444d1325-b2a0-43b4-afa8-deabfc5f339f', '77448957-b127-4966-b6c8-4543d0828801', 2, 'The program will run without any logical errors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15366ee8-7ee9-49c4-96d0-e42ecc524663', '77448957-b127-4966-b6c8-4543d0828801', 3, 'The program is optimized for speed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('77448957-b127-4966-b6c8-4543d0828801', '8f7bedf2-0382-4b86-b7e6-c01caf705cfc', 'Syntax analysis (parsing) checks whether the sequence of tokens produced by lexical analysis conforms to the programming language''s grammatical structure, typically constructing a parse tree (or abstract syntax tree) representing that structure — distinct from semantic analysis, which checks meaning/type correctness.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bb2b2dbd-da71-4678-9f1a-999f9acf7058', '9c41f530-08db-4047-8407-0b03c9afec65', 145, 'A pushdown automaton, an extension of a finite automaton with an added stack, is used to recognize:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('033bd1b6-1b50-4ed8-84b1-4de20279d9f8', 'bb2b2dbd-da71-4678-9f1a-999f9acf7058', 0, 'Only regular languages');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32bef8fa-53f0-4b4a-a2ce-0ac80cf14cc6', 'bb2b2dbd-da71-4678-9f1a-999f9acf7058', 1, 'Context-free languages');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82d3b990-7a5d-445c-bc15-07b12d9bea35', 'bb2b2dbd-da71-4678-9f1a-999f9acf7058', 2, 'Only recursively enumerable languages');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96c44b6a-dd2a-43ec-a461-b016bde9bf34', 'bb2b2dbd-da71-4678-9f1a-999f9acf7058', 3, 'No languages at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bb2b2dbd-da71-4678-9f1a-999f9acf7058', '32bef8fa-53f0-4b4a-a2ce-0ac80cf14cc6', 'A pushdown automaton (a finite automaton augmented with a stack for additional memory) is the computational model that recognizes exactly the class of context-free languages — more powerful than a plain finite automaton (which recognizes only regular languages), since the stack provides unbounded (though restricted, LIFO-access) memory.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('503b1307-8a77-4fe6-81fb-da01f5ecff50', '9c41f530-08db-4047-8407-0b03c9afec65', 146, 'The ''Turing machine'' is significant in computability theory because it:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7adf4d10-dc71-4984-b704-1632b3ccb8cf', '503b1307-8a77-4fe6-81fb-da01f5ecff50', 0, 'Represents the least powerful possible computational model');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('345d6dc9-4dbd-4eaf-b314-60480d56feff', '503b1307-8a77-4fe6-81fb-da01f5ecff50', 1, 'Serves as a theoretical model believed to be capable of computing anything that is algorithmically computable (per the Church-Turing thesis)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea70ee50-067f-438d-9d7a-8d343a5cc4cb', '503b1307-8a77-4fe6-81fb-da01f5ecff50', 2, 'Can only process a fixed, small amount of input');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7560928f-6433-43fb-a2c0-488760607251', '503b1307-8a77-4fe6-81fb-da01f5ecff50', 3, 'Was never actually formalized mathematically');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('503b1307-8a77-4fe6-81fb-da01f5ecff50', '345d6dc9-4dbd-4eaf-b314-60480d56feff', 'The Turing machine is a theoretical computational model (an idealized machine with an infinite tape and simple read/write/move rules) that, per the widely-accepted Church-Turing thesis, is believed capable of computing anything that is algorithmically computable — serving as the foundational reference model for defining what is and isn''t computable.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f64aa069-c6b7-4cbd-bb65-1d95d6df6cc4', '9c41f530-08db-4047-8407-0b03c9afec65', 147, 'A problem is classified as ''undecidable'' if:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce1ea623-4645-4280-96b9-90999b1dae1b', 'f64aa069-c6b7-4cbd-bb65-1d95d6df6cc4', 0, 'It has a known, efficient polynomial-time algorithm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2887001b-518d-4a1c-81db-01460c223ddf', 'f64aa069-c6b7-4cbd-bb65-1d95d6df6cc4', 1, 'No algorithm exists that can correctly decide (answer yes/no) the problem for all possible inputs in finite time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f724a09-6f68-4bbc-aa89-28db3ce92070', 'f64aa069-c6b7-4cbd-bb65-1d95d6df6cc4', 2, 'It has never been attempted by any researcher');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed4343ed-72de-4164-bc11-266bec3c0b90', 'f64aa069-c6b7-4cbd-bb65-1d95d6df6cc4', 3, 'It can only be solved using quantum computers');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f64aa069-c6b7-4cbd-bb65-1d95d6df6cc4', '2887001b-518d-4a1c-81db-01460c223ddf', 'A problem is undecidable if no algorithm exists that can correctly determine the answer (yes/no) for every possible input in finite time — the Halting Problem (determining whether an arbitrary program will eventually halt) is the most famous example of a proven undecidable problem.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1ab9ffac-a58d-4d3e-a721-1acee50a481b', '9c41f530-08db-4047-8407-0b03c9afec65', 148, 'In compiler design, ''semantic analysis'' primarily checks for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8b49686-4733-48bf-8ca6-5745bb01de72', '1ab9ffac-a58d-4d3e-a721-1acee50a481b', 0, 'Spelling errors in comments only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79f79739-3d26-4981-a9f6-44bced471cac', '1ab9ffac-a58d-4d3e-a721-1acee50a481b', 1, 'Type correctness, scope resolution, and other meaning-related correctness issues, beyond just syntactic structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00db9a73-83af-424f-83aa-d37901318e9e', '1ab9ffac-a58d-4d3e-a721-1acee50a481b', 2, 'Only whitespace formatting');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa1e1b20-ddd4-4305-b11b-7f0b2ed09b34', '1ab9ffac-a58d-4d3e-a721-1acee50a481b', 3, 'Network connectivity of the compiler itself');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1ab9ffac-a58d-4d3e-a721-1acee50a481b', '79f79739-3d26-4981-a9f6-44bced471cac', 'Semantic analysis checks for meaning-related correctness beyond pure syntax — verifying type compatibility, correct variable scope resolution, and other language-defined semantic rules that a purely syntactic check (parsing) cannot catch.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9967164b-3558-4c28-9fda-90a8fbf15ec3', '9c41f530-08db-4047-8407-0b03c9afec65', 149, 'A ''regular expression'' is used to describe:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5eb284b3-f8dd-458e-abad-a26765ffb0e9', '9967164b-3558-4c28-9fda-90a8fbf15ec3', 0, 'Any arbitrarily complex programming language grammar');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('387dc223-b184-4a4e-aa29-dde7fea535af', '9967164b-3558-4c28-9fda-90a8fbf15ec3', 1, 'A pattern matching a regular language, commonly used for text searching and lexical analysis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a856adea-b6fc-4df1-9a6c-053c7263b597', '9967164b-3558-4c28-9fda-90a8fbf15ec3', 2, 'Only numeric values');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53297bfb-d90f-4ffa-b19a-56e6c74327aa', '9967164b-3558-4c28-9fda-90a8fbf15ec3', 3, 'Machine code instructions directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9967164b-3558-4c28-9fda-90a8fbf15ec3', '387dc223-b184-4a4e-aa29-dde7fea535af', 'A regular expression describes patterns matching a regular language — a class of relatively simple, pattern-matchable languages, widely used for text searching/matching and as the formal basis for a compiler''s lexical analysis (tokenization) phase.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b574cfd5-198f-4f16-8a24-be1804452a5c', '9c41f530-08db-4047-8407-0b03c9afec65', 150, 'The P vs. NP problem, one of the most famous open problems in computer science, asks whether:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9d7c6c4-81d7-4ced-9308-10857375b466', 'b574cfd5-198f-4f16-8a24-be1804452a5c', 0, 'Every problem whose solution can be quickly VERIFIED (in polynomial time) can also be quickly SOLVED (in polynomial time)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08c77e74-541a-4770-a0f4-e89e356b6606', 'b574cfd5-198f-4f16-8a24-be1804452a5c', 1, 'All problems are solvable at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34f43381-1ffa-4420-8fb6-227ece2568a7', 'b574cfd5-198f-4f16-8a24-be1804452a5c', 2, 'Computers can ever become self-aware');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7a2d6fc-7367-4e80-bcc8-c41a81a2d797', 'b574cfd5-198f-4f16-8a24-be1804452a5c', 3, 'Quantum computers are faster than classical computers in every case');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b574cfd5-198f-4f16-8a24-be1804452a5c', 'd9d7c6c4-81d7-4ced-9308-10857375b466', 'The P vs. NP problem asks whether every problem whose proposed solution can be verified in polynomial time (class NP) can also be SOLVED from scratch in polynomial time (class P) — a foundational, still-unresolved open question in theoretical computer science with major implications for cryptography and algorithm design.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f86877d1-572a-49fd-aca7-fd2d6bdb581f', '9c41f530-08db-4047-8407-0b03c9afec65', 151, 'In C programming, the scope of a variable declared inside a function (without the ''static'' keyword) is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8fd567e8-0374-4c89-a8bb-70ade06427c2', 'f86877d1-572a-49fd-aca7-fd2d6bdb581f', 0, 'Global — accessible from any function in the program');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa85dd97-a762-4fde-a79f-1326b5451575', 'f86877d1-572a-49fd-aca7-fd2d6bdb581f', 1, 'Local — accessible only within that function, and its value is not retained between separate calls to the function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce11ad05-d4dd-4d8c-ac08-1cdee34f2266', 'f86877d1-572a-49fd-aca7-fd2d6bdb581f', 2, 'Accessible only from the main() function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b77bebb-3ca8-468b-b411-bd4bb7b76ae5', 'f86877d1-572a-49fd-aca7-fd2d6bdb581f', 3, 'Undefined behavior in every case');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f86877d1-572a-49fd-aca7-fd2d6bdb581f', 'aa85dd97-a762-4fde-a79f-1326b5451575', 'A variable declared inside a function without ''static'' is a local (automatic) variable — its scope is limited to that function, and its storage is allocated fresh (and value lost) on each call, unlike a ''static'' local variable, which retains its value between calls.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('915222c1-0feb-424c-8ccd-71975e4280fd', '9c41f530-08db-4047-8407-0b03c9afec65', 152, 'In C, the difference between ''=='' and ''='' is that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3ea8804-f17d-47dd-94fc-6fb06735869d', '915222c1-0feb-424c-8ccd-71975e4280fd', 0, 'They are functionally identical and interchangeable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18eff004-b652-431e-a044-457191840ca8', '915222c1-0feb-424c-8ccd-71975e4280fd', 1, '''=='' is the equality comparison operator, while ''='' is the assignment operator — a common source of bugs when accidentally swapped');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('467b8b24-e5e3-4df4-a5d2-4fd28a8aa8f5', '915222c1-0feb-424c-8ccd-71975e4280fd', 2, '''='' is used only for comparing strings');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c22ce98-aed1-4f23-915a-7c35aa22cb36', '915222c1-0feb-424c-8ccd-71975e4280fd', 3, '''=='' can only be used inside loops');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('915222c1-0feb-424c-8ccd-71975e4280fd', '18eff004-b652-431e-a044-457191840ca8', '''=='' tests whether two values are equal (returning true/false), while ''='' assigns a value to a variable — accidentally using ''='' where ''=='' was intended (e.g., in an ''if'' condition) is a classic, genuinely common programming bug, since ''if (x = 5)'' assigns 5 to x and evaluates as true, rather than comparing x to 5.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b5ad6c5b-1bc6-4581-9f03-7a5aa225d8ef', '9c41f530-08db-4047-8407-0b03c9afec65', 153, 'A function that calls itself, directly or indirectly, is called:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9430a225-27ba-4d46-8a60-e462f605d206', 'b5ad6c5b-1bc6-4581-9f03-7a5aa225d8ef', 0, 'An iterative function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2791050-fa70-470e-82da-a8ddc1a19c84', 'b5ad6c5b-1bc6-4581-9f03-7a5aa225d8ef', 1, 'A recursive function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4dc2bc62-7138-4b04-bd01-5215bc6f6d55', 'b5ad6c5b-1bc6-4581-9f03-7a5aa225d8ef', 2, 'A static function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b35d608-680f-4954-9f2b-2a3fe102aa8a', 'b5ad6c5b-1bc6-4581-9f03-7a5aa225d8ef', 3, 'An inline function');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b5ad6c5b-1bc6-4581-9f03-7a5aa225d8ef', 'c2791050-fa70-470e-82da-a8ddc1a19c84', 'A recursive function calls itself (directly or through a chain of other function calls) to solve a problem by breaking it into smaller instances of the same problem — requiring a well-defined base case to eventually terminate the recursion.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('de4229f0-aa76-4fb9-ac96-dbdf2182539e', '9c41f530-08db-4047-8407-0b03c9afec65', 154, 'In programming, a ''pointer'' variable stores:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b0a55a8-3cba-4973-8722-a4b609dc7389', 'de4229f0-aa76-4fb9-ac96-dbdf2182539e', 0, 'The actual data value directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6912f08-b5ab-4b42-a9c0-455bae8ee11a', 'de4229f0-aa76-4fb9-ac96-dbdf2182539e', 1, 'The memory address of another variable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0763fcd7-b505-465f-8050-93ec0cdf75ec', 'de4229f0-aa76-4fb9-ac96-dbdf2182539e', 2, 'Only text/string data');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3627ef9a-eede-4a9e-9a6a-4f9e669a9e9f', 'de4229f0-aa76-4fb9-ac96-dbdf2182539e', 3, 'A copy of the entire program');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('de4229f0-aa76-4fb9-ac96-dbdf2182539e', 'c6912f08-b5ab-4b42-a9c0-455bae8ee11a', 'A pointer variable stores the memory address of another variable (rather than the variable''s actual value directly), enabling indirect access to and manipulation of that variable''s data — a fundamental concept in languages like C/C++, enabling dynamic memory management and efficient data structure implementation.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e160733d-8213-4e9d-9a78-bc236123754b', '9c41f530-08db-4047-8407-0b03c9afec65', 155, '''Type casting'' in programming refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b350385d-8fa5-4892-b3c8-504171b0b87c', 'e160733d-8213-4e9d-9a78-bc236123754b', 0, 'Permanently deleting a variable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c17e0518-0fa3-419c-b2a2-3f350167c2e6', 'e160733d-8213-4e9d-9a78-bc236123754b', 1, 'Explicitly (or implicitly) converting a value from one data type to another (e.g., int to float)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfda883e-f070-4a2c-95b9-8dc738aabc9c', 'e160733d-8213-4e9d-9a78-bc236123754b', 2, 'Renaming a variable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4a37ca9-8ccb-4962-ae25-fdd532dc7773', 'e160733d-8213-4e9d-9a78-bc236123754b', 3, 'Declaring a variable without initializing it');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e160733d-8213-4e9d-9a78-bc236123754b', 'c17e0518-0fa3-419c-b2a2-3f350167c2e6', 'Type casting converts a value from one data type to another — either implicitly (automatically performed by the compiler in certain safe conversions) or explicitly (deliberately specified by the programmer, e.g., ''(float)x'' in C), needed when an operation requires a specific data type.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9ff922b5-c278-4110-b3ec-3e2204d4292d', '9c41f530-08db-4047-8407-0b03c9afec65', 156, 'An ''array'' in most programming languages is best described as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ade12cea-8ab1-4d5d-844a-223df2232f5c', '9ff922b5-c278-4110-b3ec-3e2204d4292d', 0, 'A collection of elements of the same data type, stored in contiguous memory locations, accessed via an index');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c595c400-5e09-40c4-9683-ecf7e5024d86', '9ff922b5-c278-4110-b3ec-3e2204d4292d', 1, 'A collection that can only ever hold exactly one element');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d85c39b-174c-4ea7-9460-6b88b5b3d844', '9ff922b5-c278-4110-b3ec-3e2204d4292d', 2, 'A function that returns multiple values');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a5f40fa-996e-4cda-a592-7be96abd3657', '9ff922b5-c278-4110-b3ec-3e2204d4292d', 3, 'A type of file format');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9ff922b5-c278-4110-b3ec-3e2204d4292d', 'ade12cea-8ab1-4d5d-844a-223df2232f5c', 'An array is a collection of elements of the same data type, stored in contiguous memory locations, and accessed via a numeric index — enabling efficient, constant-time access to any element given its index.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5621b216-83a0-42c2-8764-d30734de4035', '9c41f530-08db-4047-8407-0b03c9afec65', 157, 'In C, ''malloc()'' is a standard library function used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0597df21-cd97-47fa-8797-8afb48880496', '5621b216-83a0-42c2-8764-d30734de4035', 0, 'Permanently delete a file');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('684f4232-8e20-467f-b052-4c8f92e5571f', '5621b216-83a0-42c2-8764-d30734de4035', 1, 'Dynamically allocate a specified block of memory at runtime, returning a pointer to it');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d43b82e0-7870-4253-a3b4-e106268fbbc0', '5621b216-83a0-42c2-8764-d30734de4035', 2, 'Print output to the console');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d322453-fa6c-40a7-b2c1-55acd7fcfb78', '5621b216-83a0-42c2-8764-d30734de4035', 3, 'Compile source code');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5621b216-83a0-42c2-8764-d30734de4035', '684f4232-8e20-467f-b052-4c8f92e5571f', '''malloc()'' dynamically allocates a specified number of bytes of memory at runtime (from the heap) and returns a pointer to the allocated block — the programmer is responsible for eventually freeing this memory with ''free()'' to avoid memory leaks.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('335630cd-4226-4ef6-8869-99c93e8d6b61', '9c41f530-08db-4047-8407-0b03c9afec65', 158, 'A ''compiler error'' (as distinct from a ''runtime error'') occurs:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27b1e82e-9b05-476b-9e3e-f73cb83773e4', '335630cd-4226-4ef6-8869-99c93e8d6b61', 0, 'Only after the program has been running successfully for some time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67c24cba-a2bf-4bbc-a852-79ed42cd685f', '335630cd-4226-4ef6-8869-99c93e8d6b61', 1, 'During the compilation process, before the program is ever executed, typically due to syntax or type errors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f448403-d087-4135-b92e-f2d08daf7554', '335630cd-4226-4ef6-8869-99c93e8d6b61', 2, 'Only when the program is closed by the user');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1f84fca-a622-4ce0-8150-461da371db29', '335630cd-4226-4ef6-8869-99c93e8d6b61', 3, 'Exclusively due to hardware failures');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('335630cd-4226-4ef6-8869-99c93e8d6b61', '67c24cba-a2bf-4bbc-a852-79ed42cd685f', 'A compiler error is detected during the compilation phase, before the program ever runs — typically caused by syntax errors (violating the language''s grammar) or certain type errors — distinct from a runtime error, which occurs during actual program execution (e.g., division by zero, accessing invalid memory).', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('dac97ab6-f382-45c8-8686-f8ae34e6f30a', '9c41f530-08db-4047-8407-0b03c9afec65', 159, '''Global variables'' in a program, compared to local variables, are:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d49b045c-32b4-47e0-97f5-7c391761141a', 'dac97ab6-f382-45c8-8686-f8ae34e6f30a', 0, 'Accessible only within the single function where they are declared');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc82cfdd-8bf5-45d5-a087-916cb98e2528', 'dac97ab6-f382-45c8-8686-f8ae34e6f30a', 1, 'Accessible from any function within the program (within their defined scope), persisting for the program''s entire execution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af83ad85-e524-41da-a3bb-6b984e210c1c', 'dac97ab6-f382-45c8-8686-f8ae34e6f30a', 2, 'Automatically deleted after each function call');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('266ad65d-09b0-4b97-be54-d2687bb4fb3a', 'dac97ab6-f382-45c8-8686-f8ae34e6f30a', 3, 'Only usable in object-oriented languages');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dac97ab6-f382-45c8-8686-f8ae34e6f30a', 'bc82cfdd-8bf5-45d5-a087-916cb98e2528', 'Global variables are declared outside any function and are accessible from any function throughout the program''s execution (subject to scope rules), persisting for the entire program run — unlike local variables, which are confined to the function in which they''re declared and typically don''t persist between calls.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('835c8e49-787a-433e-b6f0-3bb91295e2fe', '9c41f530-08db-4047-8407-0b03c9afec65', 160, 'In programming, an ''infinite loop'' occurs when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a04859a-a7b4-4036-add5-02418aa644e8', '835c8e49-787a-433e-b6f0-3bb91295e2fe', 0, 'A loop''s terminating condition is never met, causing it to repeat indefinitely (until externally interrupted)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc5472cb-dcfe-44a9-a141-9c6f597e0276', '835c8e49-787a-433e-b6f0-3bb91295e2fe', 1, 'A loop executes exactly once');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3006dd99-1d0b-4311-9b1d-4584996e9505', '835c8e49-787a-433e-b6f0-3bb91295e2fe', 2, 'A loop is deliberately designed to never execute');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0b7024f-ed8a-4ef3-b521-9a6c6297bea9', '835c8e49-787a-433e-b6f0-3bb91295e2fe', 3, 'A loop always terminates after exactly 100 iterations');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('835c8e49-787a-433e-b6f0-3bb91295e2fe', '8a04859a-a7b4-4036-add5-02418aa644e8', 'An infinite loop occurs when a loop''s terminating (exit) condition is never satisfied — often an unintended bug (e.g., a loop counter that''s never incremented, or a logic error in the condition), causing the program to repeat the loop body indefinitely until externally interrupted or the system runs out of resources.', 'Discipline (Computer Science & IT) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');
