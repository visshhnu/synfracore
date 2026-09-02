-- ============================================================
-- HAL Design/Management Trainee -- Aeronautical / Aerospace Engineering
-- Full-Length Mock Paper 5 (160 questions, 150 minutes)
-- 
-- SOURCE: informally shared study material (not an official/proprietary HAL
-- archive). Honest per-question source note via question_answers.source_note
-- (already rendered in the results-review UI) -- see each section below.
-- Run this AFTER docs/question-bank-schema.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes)
VALUES ('31e559e7-d3cb-4ce2-9d8c-91d977051718', 'hal-aero-practice-1', 'HAL DT/MT — Aeronautical / Aerospace Engineering — Full Mock Paper 1', 'hal-trainee', ARRAY['HAL', 'Aeronautical Engineering', 'Aerodynamics', 'General Awareness', 'Reasoning', 'English']::TEXT[], 160, 'standard', true, 5, 150);

-- ── Section: General Awareness (20 questions) — General Awareness — written to match HAL's real GA scope, not taken from an official HAL paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('09d448c9-3d4a-489b-a095-8b29771b4ab6', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 1, 'HAL''s Nashik Division is primarily associated with the manufacture and overhaul of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06493acb-53e1-434f-b55b-e797f1ed1fa6', '09d448c9-3d4a-489b-a095-8b29771b4ab6', 0, 'Helicopters only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c64a3e14-c9ee-44e9-8eed-5cefa0106ccf', '09d448c9-3d4a-489b-a095-8b29771b4ab6', 1, 'Su-30MKI and MiG aircraft (license-manufactured fighter jets)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31c4f954-9cac-4d20-841f-66a63d32985b', '09d448c9-3d4a-489b-a095-8b29771b4ab6', 2, 'Rocket engines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3d08680-70a7-4f16-a20f-1177e36c56b6', '09d448c9-3d4a-489b-a095-8b29771b4ab6', 3, 'Radar systems only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('09d448c9-3d4a-489b-a095-8b29771b4ab6', 'c64a3e14-c9ee-44e9-8eed-5cefa0106ccf', 'HAL''s Nashik Division has been a key facility for the license-manufacture and overhaul of Soviet/Russian-origin fighter aircraft, notably the Su-30MKI and earlier MiG variants, for the Indian Air Force.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('62bdbc7e-2dcd-4cfc-a9e6-ba9c96f78c29', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 2, 'The Aeronautical Development Agency (ADA), closely associated with HAL on the Tejas programme, functions as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aec4d887-b675-44a3-abde-015db0ae929e', '62bdbc7e-2dcd-4cfc-a9e6-ba9c96f78c29', 0, 'A private foreign contractor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20b81299-09ae-4563-9a6b-897e54465c1f', '62bdbc7e-2dcd-4cfc-a9e6-ba9c96f78c29', 1, 'The nodal DRDO agency responsible for designing and developing the Tejas Light Combat Aircraft');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1e246f2-1554-4e89-ae80-ab54532c38e9', '62bdbc7e-2dcd-4cfc-a9e6-ba9c96f78c29', 2, 'A commercial airline');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d8b51f5-39c3-46cd-8acf-ca8a5622bc98', '62bdbc7e-2dcd-4cfc-a9e6-ba9c96f78c29', 3, 'A pilot training academy only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('62bdbc7e-2dcd-4cfc-a9e6-ba9c96f78c29', '20b81299-09ae-4563-9a6b-897e54465c1f', 'ADA (Aeronautical Development Agency), under DRDO, is the nodal agency responsible for the design and development of the Tejas Light Combat Aircraft, with HAL serving as the principal production agency.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2b080e1b-0ef8-416f-afa2-9375fca4cfdd', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 3, 'India''s first indigenous jet trainer aircraft, developed by HAL, is named:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f08f1dd-9e75-4565-90e2-8591fb4a04bb', '2b080e1b-0ef8-416f-afa2-9375fca4cfdd', 0, 'HJT-36 Sitara');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be916c23-d440-482f-bf6f-3394183010dd', '2b080e1b-0ef8-416f-afa2-9375fca4cfdd', 1, 'Tejas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ccb9f95-ceeb-4ddb-9741-5397ff6d88ca', '2b080e1b-0ef8-416f-afa2-9375fca4cfdd', 2, 'Dhruv');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab9f8131-c074-44dd-bb1c-989697ddef6f', '2b080e1b-0ef8-416f-afa2-9375fca4cfdd', 3, 'Rustom');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2b080e1b-0ef8-416f-afa2-9375fca4cfdd', '1f08f1dd-9e75-4565-90e2-8591fb4a04bb', 'The HJT-36 Sitara is HAL''s indigenously developed intermediate jet trainer, intended to fill the training gap between basic and advanced fighter training for Indian Air Force pilots.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('21f73fbc-0f81-4733-9658-2965bd561e39', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 4, 'The Gas Turbine Research Establishment (GTRE), a DRDO laboratory closely tied to indigenous jet engine development, is developing the:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5b613ce-290d-46aa-920c-54e87c066069', '21f73fbc-0f81-4733-9658-2965bd561e39', 0, 'Kaveri engine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0011e103-6370-4580-b3df-e75740c0d3df', '21f73fbc-0f81-4733-9658-2965bd561e39', 1, 'Tejas airframe');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a19e9c1-1346-49fb-ab1e-3dd87bbaa969', '21f73fbc-0f81-4733-9658-2965bd561e39', 2, 'Prachand helicopter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc02ebd7-e2bf-4a59-a1ee-926155d9edad', '21f73fbc-0f81-4733-9658-2965bd561e39', 3, 'Netra radar system');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('21f73fbc-0f81-4733-9658-2965bd561e39', 'a5b613ce-290d-46aa-920c-54e87c066069', 'GTRE (Gas Turbine Research Establishment), a DRDO lab based in Bengaluru, is responsible for the Kaveri engine programme, India''s indigenous effort to develop a jet engine for fighter aircraft applications.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('19285b69-f9cd-4a73-84c3-15d328742f75', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 5, 'The ''Astra'' missile, an indigenous beyond-visual-range air-to-air missile integrated on HAL-manufactured fighter platforms, was developed by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('585a88d2-8f04-41a1-a3f2-5b7986a6aee3', '19285b69-f9cd-4a73-84c3-15d328742f75', 0, 'Bharat Electronics Limited (BEL)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2348715-f5ac-4a1f-b410-c5d85f1db405', '19285b69-f9cd-4a73-84c3-15d328742f75', 1, 'Defence Research and Development Organisation (DRDO)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa76d714-81b8-4ebc-ac76-6b6c4d4c8650', '19285b69-f9cd-4a73-84c3-15d328742f75', 2, 'Indian Space Research Organisation (ISRO)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb3922d2-93d7-4523-9c4c-cb29b081dda7', '19285b69-f9cd-4a73-84c3-15d328742f75', 3, 'Hindustan Shipyard Limited');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('19285b69-f9cd-4a73-84c3-15d328742f75', 'b2348715-f5ac-4a1f-b410-c5d85f1db405', 'Astra is an indigenous beyond-visual-range air-to-air missile developed by DRDO, integrated on Indian Air Force fighter platforms including the Su-30MKI and Tejas, both manufactured by HAL.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0ebdbf23-c2fb-4762-9396-ec675dd2b4a8', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 6, 'Gaganyaan, India''s crewed spaceflight programme, is being developed by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7aa55cce-3e25-4b1a-b7a2-1461238addf9', '0ebdbf23-c2fb-4762-9396-ec675dd2b4a8', 0, 'HAL');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63b946dc-11b4-449f-8a43-3c2c7bd83a42', '0ebdbf23-c2fb-4762-9396-ec675dd2b4a8', 1, 'ISRO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e5d4550-43b2-44ef-8a29-0a54f216c39f', '0ebdbf23-c2fb-4762-9396-ec675dd2b4a8', 2, 'DRDO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9a98948-ac24-4b2c-9e8c-a8749606821c', '0ebdbf23-c2fb-4762-9396-ec675dd2b4a8', 3, 'NASA in collaboration with private Indian firms');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0ebdbf23-c2fb-4762-9396-ec675dd2b4a8', '63b946dc-11b4-449f-8a43-3c2c7bd83a42', 'Gaganyaan is ISRO''s crewed spaceflight programme, aiming to send Indian astronauts into low Earth orbit aboard an indigenously developed spacecraft — a separate initiative from HAL''s aircraft manufacturing role, though both are part of India''s broader aerospace ecosystem.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f7121f2b-dd10-49ca-88b5-acf4d5417c19', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 7, 'The ''Akash'' missile system, an indigenous surface-to-air missile, was developed primarily by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cab287aa-0db0-4f00-9c66-1095ee782b5b', 'f7121f2b-dd10-49ca-88b5-acf4d5417c19', 0, 'HAL');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73e14bcf-e649-427d-9a26-a5fabe9336ef', 'f7121f2b-dd10-49ca-88b5-acf4d5417c19', 1, 'DRDO, with production support from Bharat Dynamics Limited (BDL) and Bharat Electronics Limited (BEL)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('71d30ed5-ce24-4f94-b772-20a6a3fe8228', 'f7121f2b-dd10-49ca-88b5-acf4d5417c19', 2, 'ISRO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4936769-c030-4db7-840a-ac3042f712a7', 'f7121f2b-dd10-49ca-88b5-acf4d5417c19', 3, 'A foreign defence contractor');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f7121f2b-dd10-49ca-88b5-acf4d5417c19', '73e14bcf-e649-427d-9a26-a5fabe9336ef', 'The Akash surface-to-air missile system was developed by DRDO, with Bharat Dynamics Limited handling missile production and Bharat Electronics Limited providing radar and associated systems.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d236fd19-f18a-4e48-9699-377fd05b13f7', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 8, 'India''s National Aerospace Laboratories (CSIR-NAL) primarily focuses on:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c712a607-a415-41ce-a5d5-1bef1e7b40db', 'd236fd19-f18a-4e48-9699-377fd05b13f7', 0, 'Only military aircraft procurement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a90ae8e7-ae85-471c-934a-89d8f33e1a5e', 'd236fd19-f18a-4e48-9699-377fd05b13f7', 1, 'Civil aircraft-related aerospace research and development, including the Saras and Hansa aircraft programmes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a49f2384-de6e-493e-bbbe-c5304d3789d1', 'd236fd19-f18a-4e48-9699-377fd05b13f7', 2, 'Space launch vehicle manufacturing exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('776558ae-2ed4-4782-b15b-4aad9c1a3597', 'd236fd19-f18a-4e48-9699-377fd05b13f7', 3, 'Air traffic control regulation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d236fd19-f18a-4e48-9699-377fd05b13f7', 'a90ae8e7-ae85-471c-934a-89d8f33e1a5e', 'CSIR-NAL focuses on civil aerospace research and development, notably including the Saras light transport aircraft and Hansa trainer aircraft programmes, complementing HAL''s predominantly military-focused manufacturing role.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bc7abc8b-5812-4608-bec3-0398b1a07b28', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 9, 'Which of the following is a real Indian Air Force aerobatic display team?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b2a93cb-0b8d-485e-9fb7-f0b8feef249e', 'bc7abc8b-5812-4608-bec3-0398b1a07b28', 0, 'Garud (this is actually the IAF''s special forces unit, not an aerobatic team)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('309ad288-3535-4982-894b-46c01bad1455', 'bc7abc8b-5812-4608-bec3-0398b1a07b28', 1, 'Sarang, flying HAL-manufactured Dhruv helicopters');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8fe6abfd-169b-4034-9f41-5d0790bb9f47', 'bc7abc8b-5812-4608-bec3-0398b1a07b28', 2, 'Sudarshan Chakra (not a real IAF aerobatic team name)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd9f6457-bae5-4061-aa01-12759ed9073e', 'bc7abc8b-5812-4608-bec3-0398b1a07b28', 3, 'Agniveer (a defence recruitment scheme, not an aerobatic team)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bc7abc8b-5812-4608-bec3-0398b1a07b28', '309ad288-3535-4982-894b-46c01bad1455', 'Sarang is a real Indian Air Force aerobatic display team, flying HAL-manufactured Dhruv (ALH) helicopters — the IAF also separately operates Suryakiran, a fixed-wing jet aerobatic team; Garud is actually the IAF''s special forces unit, not an aerobatic team.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cdc612c7-e735-472e-ad75-1aa2afb73981', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 10, 'The ''Aero India'' biennial air show and aviation exhibition, showcasing HAL''s products among others, is held at:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('592c2c31-55f7-4f7d-a91a-3dbd4e55397c', 'cdc612c7-e735-472e-ad75-1aa2afb73981', 0, 'Yelahanka Air Force Station, Bengaluru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f85f4e11-465d-4069-862a-ebf01bb6562a', 'cdc612c7-e735-472e-ad75-1aa2afb73981', 1, 'Palam Air Force Station, Delhi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8a01f28-f607-4456-a6d0-6f562d205a4a', 'cdc612c7-e735-472e-ad75-1aa2afb73981', 2, 'Hindon Air Force Station');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ed780d4-169f-4a29-9b18-48c3dbda0fd2', 'cdc612c7-e735-472e-ad75-1aa2afb73981', 3, 'Jodhpur Air Force Station');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cdc612c7-e735-472e-ad75-1aa2afb73981', '592c2c31-55f7-4f7d-a91a-3dbd4e55397c', 'Aero India, one of Asia''s largest aerospace and defence exhibitions, is held biennially at Yelahanka Air Force Station in Bengaluru — the same city hosting HAL''s headquarters.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ffa8c874-b83f-425d-9d24-b3d928f0c01c', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 11, 'The Wright Flyer, the aircraft used for the first powered flight, was primarily constructed from:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5544f68b-4236-440e-b254-25ad0e91aba3', 'ffa8c874-b83f-425d-9d24-b3d928f0c01c', 0, 'Aluminum alloy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c61193d-e8c1-41c1-848c-65bb42a0c870', 'ffa8c874-b83f-425d-9d24-b3d928f0c01c', 1, 'Spruce wood, with a fabric-covered wing structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e3eb729-4875-4241-8123-f83ec0d41639', 'ffa8c874-b83f-425d-9d24-b3d928f0c01c', 2, 'Carbon fiber composite');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0e4c2de-131f-4b97-ac77-96e81befd270', 'ffa8c874-b83f-425d-9d24-b3d928f0c01c', 3, 'Steel tubing');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ffa8c874-b83f-425d-9d24-b3d928f0c01c', '8c61193d-e8c1-41c1-848c-65bb42a0c870', 'The Wright Flyer (1903) was constructed primarily from spruce wood for its structural framework, with muslin fabric covering the wings — modern materials like aluminum and composites came decades later in aviation history.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('693ee85d-51e8-42e1-915a-9ea929f4f7b6', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 12, 'The Indian Space Research Organisation''s PSLV (Polar Satellite Launch Vehicle) is notable for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8613084-bc2e-4ca8-929a-1c231852cf8a', '693ee85d-51e8-42e1-915a-9ea929f4f7b6', 0, 'Being used exclusively for crewed missions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d5aa595-12ee-45f3-b623-8e181c97b7ac', '693ee85d-51e8-42e1-915a-9ea929f4f7b6', 1, 'Its versatility and reliability in launching satellites into polar and other orbits, including the Chandrayaan and Mangalyaan missions'' initial launch stages');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a718ebe-78d2-47aa-883e-a816741b2d68', '693ee85d-51e8-42e1-915a-9ea929f4f7b6', 2, 'Never having a successful launch');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a861a1a3-bd1f-4f87-a260-9c0e99b31f55', '693ee85d-51e8-42e1-915a-9ea929f4f7b6', 3, 'Being manufactured outside India');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('693ee85d-51e8-42e1-915a-9ea929f4f7b6', '7d5aa595-12ee-45f3-b623-8e181c97b7ac', 'PSLV is ISRO''s versatile, highly reliable workhorse launch vehicle, used for numerous missions including launching satellites into polar orbits and providing the launch vehicle for missions like Chandrayaan-1 and the Mars Orbiter Mission (Mangalyaan).', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4e3e412a-0b78-4cd8-943d-d1137ab5e1ed', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 13, 'The ''Su-30MKI'', extensively license-manufactured by HAL, is a fighter aircraft originally designed by which country?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df44d95e-7c47-4070-87bd-248bd96cb80c', '4e3e412a-0b78-4cd8-943d-d1137ab5e1ed', 0, 'France');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9db8520-4339-47e4-8899-18872e837328', '4e3e412a-0b78-4cd8-943d-d1137ab5e1ed', 1, 'Russia');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bcb90533-19db-4815-8cfb-601ffecc178c', '4e3e412a-0b78-4cd8-943d-d1137ab5e1ed', 2, 'United States');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b088b4ba-ff19-4d29-b9ab-1bf6ae162d50', '4e3e412a-0b78-4cd8-943d-d1137ab5e1ed', 3, 'United Kingdom');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4e3e412a-0b78-4cd8-943d-d1137ab5e1ed', 'd9db8520-4339-47e4-8899-18872e837328', 'The Su-30MKI is a Russian-designed (Sukhoi) multirole fighter aircraft, license-manufactured in India by HAL under a technology transfer agreement, forming a mainstay of the Indian Air Force''s fighter fleet.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('67a72fdf-08d4-4d19-bbb1-9de4902ceb93', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 14, 'India''s indigenous Airborne Warning and Control System aircraft platform, ''Netra'', is based on which base aircraft?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('392c51d9-1458-4c23-bc74-2f75fe40b325', '67a72fdf-08d4-4d19-bbb1-9de4902ceb93', 0, 'Boeing 737');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbe3a4f2-1ad0-4bd3-aee9-120f4ecc6d00', '67a72fdf-08d4-4d19-bbb1-9de4902ceb93', 1, 'Embraer ERJ-145');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0409f586-1410-465d-b38b-39227f185ed2', '67a72fdf-08d4-4d19-bbb1-9de4902ceb93', 2, 'Airbus A320');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('418090ce-7bf4-499b-860c-62f6e9f18035', '67a72fdf-08d4-4d19-bbb1-9de4902ceb93', 3, 'Ilyushin Il-76');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('67a72fdf-08d4-4d19-bbb1-9de4902ceb93', 'fbe3a4f2-1ad0-4bd3-aee9-120f4ecc6d00', 'Netra, India''s indigenous AEW&C system, is mounted on a modified Embraer ERJ-145 regional jet platform, with the radar and mission systems developed by DRDO.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1fd6af20-b92e-4546-9201-c91b41ac5221', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 15, 'The term ''Maharatna'', ''Navratna'', and ''Miniratna'' collectively refer to India''s:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7245accb-bb23-4b96-a4cc-2e15d3b3ce7b', '1fd6af20-b92e-4546-9201-c91b41ac5221', 0, 'Military rank structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6c52b77-8045-4f0c-8eee-bb348e333230', '1fd6af20-b92e-4546-9201-c91b41ac5221', 1, 'CPSE (Central Public Sector Enterprise) classification tiers, granting varying degrees of financial and operational autonomy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1747b3e2-1b7a-4fd5-839b-4b42c24e2d9b', '1fd6af20-b92e-4546-9201-c91b41ac5221', 2, 'Space mission naming convention');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ee64974-0385-4eb7-9315-124abade3a00', '1fd6af20-b92e-4546-9201-c91b41ac5221', 3, 'Educational institution grading system');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1fd6af20-b92e-4546-9201-c91b41ac5221', 'e6c52b77-8045-4f0c-8eee-bb348e333230', 'Maharatna, Navratna, and Miniratna are the three tiers of India''s CPSE classification system, administered by the Department of Public Enterprises, granting progressively greater financial and operational autonomy — HAL holds Maharatna status, the highest tier.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('41400616-eb2b-4869-9cf9-fb60f908a69b', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 16, 'The ''Rustom'' series, developed by DRDO with HAL''s involvement, refers to India''s:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af56c6d4-500d-4938-bb28-fd516c729064', '41400616-eb2b-4869-9cf9-fb60f908a69b', 0, 'Fighter jet programme');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0c8a52a-147a-4d5d-9242-54df8f194be3', '41400616-eb2b-4869-9cf9-fb60f908a69b', 1, 'Medium-altitude, long-endurance Unmanned Aerial Vehicle (UAV) programme');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ec3d0fc-3b9c-4f38-84dc-c0a45eb1fbea', '41400616-eb2b-4869-9cf9-fb60f908a69b', 2, 'Naval destroyer programme');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9b4a9ff-8662-4cf5-8d2a-e900e83f0c33', '41400616-eb2b-4869-9cf9-fb60f908a69b', 3, 'Space telescope programme');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('41400616-eb2b-4869-9cf9-fb60f908a69b', 'f0c8a52a-147a-4d5d-9242-54df8f194be3', 'The Rustom series (including Rustom-II, later designated TAPAS-BH-201) is DRDO''s medium-altitude, long-endurance unmanned aerial vehicle (UAV/drone) programme, aimed at surveillance and reconnaissance applications.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('dccebed8-884f-4fc7-89d2-734deda27c2f', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 17, 'The first flight of the Indian-designed HF-24 Marut, HAL''s earliest indigenous fighter jet programme, took place in which decade?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7ac6545-6bfa-471d-a134-8ac33f312c15', 'dccebed8-884f-4fc7-89d2-734deda27c2f', 0, '1950s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f83c12b2-4b99-4893-a604-e67ed7e5110a', 'dccebed8-884f-4fc7-89d2-734deda27c2f', 1, '1960s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c88457d-ba25-45c3-baf5-5685546bf2cd', 'dccebed8-884f-4fc7-89d2-734deda27c2f', 2, '1980s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94435e17-9825-4738-bd5d-6d6c8c492222', 'dccebed8-884f-4fc7-89d2-734deda27c2f', 3, '2000s');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dccebed8-884f-4fc7-89d2-734deda27c2f', 'f83c12b2-4b99-4893-a604-e67ed7e5110a', 'The HF-24 Marut, designed under Kurt Tank and manufactured by HAL, first flew in 1961 — making it India''s first indigenously designed and manufactured fighter jet, decades before the Tejas programme.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('faceae58-1917-46a5-ad12-77588b3e6245', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 18, '''ISRO'' stands for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7084c77e-82a4-4316-8d8f-3be0f968454a', 'faceae58-1917-46a5-ad12-77588b3e6245', 0, 'Indian Space Research Organisation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32028885-7f0f-45e7-8f61-fd2bc0f788f0', 'faceae58-1917-46a5-ad12-77588b3e6245', 1, 'International Space Research Office');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8224c36b-ef42-4bdf-b051-3f393cc88622', 'faceae58-1917-46a5-ad12-77588b3e6245', 2, 'Indian Satellite Research Organisation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7de0fc9-6b42-4820-85b7-5a52e63a90ec', 'faceae58-1917-46a5-ad12-77588b3e6245', 3, 'Institute of Space Research Operations');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('faceae58-1917-46a5-ad12-77588b3e6245', '7084c77e-82a4-4316-8d8f-3be0f968454a', 'ISRO stands for the Indian Space Research Organisation, India''s national space agency, headquartered in Bengaluru, responsible for the country''s space research and satellite/launch vehicle programmes.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('968d8bdd-597e-4feb-a68d-46eb7761e9d8', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 19, 'The ''sound barrier'', a significant milestone in aviation history first broken by Chuck Yeager in 1947, refers to the aerodynamic challenges encountered when an aircraft approaches:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65c221bd-ac23-4d3b-a1cd-41f82c1318e1', '968d8bdd-597e-4feb-a68d-46eb7761e9d8', 0, 'The speed of light');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('051c22e5-1569-4a44-8bfa-7375d124ad80', '968d8bdd-597e-4feb-a68d-46eb7761e9d8', 1, 'The speed of sound (Mach 1)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6dd23583-b331-4bac-a8e7-da49ff62b848', '968d8bdd-597e-4feb-a68d-46eb7761e9d8', 2, 'Zero velocity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef4b10ec-235d-4e7d-bd46-e00a8bfa9f7c', '968d8bdd-597e-4feb-a68d-46eb7761e9d8', 3, 'Escape velocity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('968d8bdd-597e-4feb-a68d-46eb7761e9d8', '051c22e5-1569-4a44-8bfa-7375d124ad80', 'The ''sound barrier'' refers to the sharp increase in aerodynamic drag and control difficulties an aircraft experiences as it approaches the speed of sound (Mach 1) — first successfully broken in controlled, level flight by Chuck Yeager in the Bell X-1 in 1947.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e835beb9-e884-4a66-a3e2-d8c2db6991b3', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 20, 'The ''Kaveri'' engine programme, an indigenous Indian jet engine development effort, has faced well-documented challenges primarily related to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('307d6409-489a-47db-83ff-792a471233d2', 'e835beb9-e884-4a66-a3e2-d8c2db6991b3', 0, 'Excessive cost reduction with no technical issues');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a246895-af02-4f60-940e-35df70835337', 'e835beb9-e884-4a66-a3e2-d8c2db6991b3', 1, 'Achieving the required thrust-to-weight ratio and high-temperature material performance for fighter-jet-grade propulsion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1a539c7-ee03-417f-bf8e-9beb71d08113', 'e835beb9-e884-4a66-a3e2-d8c2db6991b3', 2, 'Regulatory approval delays only, with no technical challenges');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e2c400b-6c2c-433a-bcec-370376593287', 'e835beb9-e884-4a66-a3e2-d8c2db6991b3', 3, 'A complete absence of any government funding');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e835beb9-e884-4a66-a3e2-d8c2db6991b3', '5a246895-af02-4f60-940e-35df70835337', 'The Kaveri engine programme has publicly faced significant technical challenges in achieving the thrust-to-weight ratio and high-temperature material performance required for a modern fighter jet engine, leading to a prolonged development timeline and continued reliance on imported engines for programmes like Tejas. `(needs verification — recheck current programme status against official DRDO/GTRE sources, since development status can change)`', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

-- ── Section: English & Reasoning (40 questions) — English & Reasoning — general competitive-exam style practice content, not an official HAL paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e01c99a0-69b3-4df6-b7a2-9aa337465d6c', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 21, 'Point out any grammatical error: ''The flight crew, despite the delay, remained calm and professional throughout.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3cc5a59-406b-437c-ac06-3bc8ff15a739', 'e01c99a0-69b3-4df6-b7a2-9aa337465d6c', 0, '''remained'' should be ''remains''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('888c5986-61ba-4663-9b6e-43cd178aea9b', 'e01c99a0-69b3-4df6-b7a2-9aa337465d6c', 1, '''despite'' should be ''inspite''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e17dd096-d77a-48c7-b72c-61568a935dd8', 'e01c99a0-69b3-4df6-b7a2-9aa337465d6c', 2, '''crew'' should be ''crews''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f1fba02-4b1b-42c6-bad5-f955680d36aa', 'e01c99a0-69b3-4df6-b7a2-9aa337465d6c', 3, 'No error');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e01c99a0-69b3-4df6-b7a2-9aa337465d6c', '8f1fba02-4b1b-42c6-bad5-f955680d36aa', 'The sentence is grammatically correct as written — ''crew'' (a collective noun, treated as singular here) correctly takes the singular verb ''remained'', and ''despite'' is used correctly (note: ''inspite'' is not a standard single word — the correct form is the two-word ''in spite of'').', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b7a32e88-dda0-46c7-9c77-6161c80387d2', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 22, 'Complete the sentence: ''The aircraft ________ undergoing maintenance checks before its next scheduled flight.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c9c64c9-f9e3-407e-9a53-e954758901e2', 'b7a32e88-dda0-46c7-9c77-6161c80387d2', 0, 'is');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df15b1a7-7a1d-47ba-9cff-7e93b3ef1cb9', 'b7a32e88-dda0-46c7-9c77-6161c80387d2', 1, 'is currently');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d60b58aa-19a3-4e31-b94a-faa83af73b15', 'b7a32e88-dda0-46c7-9c77-6161c80387d2', 2, 'was');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87270ea9-d462-4392-b7fc-e4e218104061', 'b7a32e88-dda0-46c7-9c77-6161c80387d2', 3, 'were');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b7a32e88-dda0-46c7-9c77-6161c80387d2', 'df15b1a7-7a1d-47ba-9cff-7e93b3ef1cb9', '''Is currently undergoing'' most precisely and completely conveys an ongoing action happening right now — the most grammatically complete option among those given.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('01c52a40-feea-4912-bc54-23164caea754', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 23, 'Pick the word nearest in meaning to ''Turbulence'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30c83a38-454f-40dc-a98c-2e7a2849c036', '01c52a40-feea-4912-bc54-23164caea754', 0, 'Calmness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00f408f7-ebec-46ea-9cae-8aedea5b887c', '01c52a40-feea-4912-bc54-23164caea754', 1, 'Instability or disturbance in the flow of air (or more generally, any disorderly, unpredictable state)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41990238-a847-493b-8190-d06a5a1c8954', '01c52a40-feea-4912-bc54-23164caea754', 2, 'Silence');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d26b0b99-23c3-4f63-ad0a-58692e0b7b43', '01c52a40-feea-4912-bc54-23164caea754', 3, 'Precision');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('01c52a40-feea-4912-bc54-23164caea754', '00f408f7-ebec-46ea-9cae-8aedea5b887c', '''Turbulence'' refers to instability or disturbed, irregular flow (of air, in an aviation context) — or more broadly, any disorderly, unpredictable condition or state.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('10a81b64-5ea9-4d5c-992d-484af1823aa3', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 24, 'Pick the closest antonym for ''Stability'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8136e9df-7474-4a5f-bf5b-171ae46301ee', '10a81b64-5ea9-4d5c-992d-484af1823aa3', 0, 'Steadiness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c4ced89-ee83-4b6a-8c06-9a1f60dbac63', '10a81b64-5ea9-4d5c-992d-484af1823aa3', 1, 'Instability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd11c1c0-18f9-4c4d-8d17-9bd71d6483d4', '10a81b64-5ea9-4d5c-992d-484af1823aa3', 2, 'Balance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bff34b76-ae82-4c54-aeaa-d93ceae0dfce', '10a81b64-5ea9-4d5c-992d-484af1823aa3', 3, 'Equilibrium');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('10a81b64-5ea9-4d5c-992d-484af1823aa3', '9c4ced89-ee83-4b6a-8c06-9a1f60dbac63', '''Stability'' means the state of being steady and not likely to change or fail; its direct antonym is ''Instability''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b636485f-efbb-4446-8edd-49ea782721ba', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 25, 'Which of the following sentences uses commas correctly?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bfe34ac2-0132-4ddd-8195-102c76264ab2', 'b636485f-efbb-4446-8edd-49ea782721ba', 0, 'The pilot, who has flown for over 20 years landed the aircraft smoothly.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a816f4e6-9840-4416-a667-01809a0f7a88', 'b636485f-efbb-4446-8edd-49ea782721ba', 1, 'The pilot who has flown for over 20 years, landed the aircraft smoothly.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83df3c7f-7bd8-47db-ac0d-03dfe9e98784', 'b636485f-efbb-4446-8edd-49ea782721ba', 2, 'The pilot, who has flown for over 20 years, landed the aircraft smoothly.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('144a0840-d1b6-4061-8855-62c0a92a57f5', 'b636485f-efbb-4446-8edd-49ea782721ba', 3, 'The pilot who, has flown for over 20 years landed the aircraft smoothly.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b636485f-efbb-4446-8edd-49ea782721ba', '83df3c7f-7bd8-47db-ac0d-03dfe9e98784', 'The non-restrictive clause ''who has flown for over 20 years'' requires commas on both sides.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7d08d64c-fbbb-497d-b90f-22937e4bcf1f', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 26, 'Choose the option with the correctly spelled word:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8899869-8df5-4143-9254-bfc9c906368b', '7d08d64c-fbbb-497d-b90f-22937e4bcf1f', 0, 'Manuever');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a850396-0f19-4d3a-9aa6-8d45d652d2da', '7d08d64c-fbbb-497d-b90f-22937e4bcf1f', 1, 'Maneuver');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9fa7395e-09e4-457a-b0ff-9409fe3f4e2b', '7d08d64c-fbbb-497d-b90f-22937e4bcf1f', 2, 'Manuver');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('620d89c7-bfd3-423a-85cf-3051216f89c4', '7d08d64c-fbbb-497d-b90f-22937e4bcf1f', 3, 'Manoeuvor');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7d08d64c-fbbb-497d-b90f-22937e4bcf1f', '9a850396-0f19-4d3a-9aa6-8d45d652d2da', '''Maneuver'' (American spelling) is a correct standard spelling — an alternative British spelling ''manoeuvre'' also exists, but among the given options, ''Maneuver'' is the correctly spelled one.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a53173ea-3803-4c5f-bfad-f80298d9ba72', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 27, 'Identify the part of speech of the underlined word: ''The engineer inspected the fuselage THOROUGHLY.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a239caad-6dbb-4efa-bad2-a6d0e965e6ab', 'a53173ea-3803-4c5f-bfad-f80298d9ba72', 0, 'Adjective');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24522a72-738a-4ec8-8beb-e53c1bd7f126', 'a53173ea-3803-4c5f-bfad-f80298d9ba72', 1, 'Adverb');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce8d2e62-ab7f-44e3-8a62-ba5ae8372308', 'a53173ea-3803-4c5f-bfad-f80298d9ba72', 2, 'Noun');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ccbaa1d0-d2ce-48ed-a0c2-038063ea97d0', 'a53173ea-3803-4c5f-bfad-f80298d9ba72', 3, 'Preposition');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a53173ea-3803-4c5f-bfad-f80298d9ba72', '24522a72-738a-4ec8-8beb-e53c1bd7f126', '''Thoroughly'' modifies the verb ''inspected'', describing how the inspection was carried out — it is an adverb.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e9594d73-89bd-4924-8ad5-fc8d7850677f', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 28, 'Convert to passive voice: ''The mechanics repaired the landing gear overnight.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c63d639-2553-43a4-8fd0-52c32b4663c0', 'e9594d73-89bd-4924-8ad5-fc8d7850677f', 0, 'The landing gear is repaired by the mechanics overnight.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff330903-9f6e-4458-90de-d41ac39d6f34', 'e9594d73-89bd-4924-8ad5-fc8d7850677f', 1, 'The landing gear was repaired by the mechanics overnight.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('000f87e8-0545-4c47-8320-0af326515b7d', 'e9594d73-89bd-4924-8ad5-fc8d7850677f', 2, 'The landing gear repairs by the mechanics overnight.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('602c8835-90a0-40d9-83e3-c8bbbf77b6e0', 'e9594d73-89bd-4924-8ad5-fc8d7850677f', 3, 'The landing gear has repair by the mechanics overnight.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e9594d73-89bd-4924-8ad5-fc8d7850677f', 'ff330903-9f6e-4458-90de-d41ac39d6f34', 'Simple past active (''repaired'') converts to simple past passive: ''was repaired by''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b36c408c-1d9e-4114-9291-6a785cbd4bf0', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 29, 'Complete the idiom: ''Despite years of setbacks, the engineering team refused to ________ and eventually delivered a working prototype.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6cb804c2-4145-47f7-8cf7-374fd64004cb', 'b36c408c-1d9e-4114-9291-6a785cbd4bf0', 0, 'throw in the towel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2eb2facd-a72b-4a00-96dc-9c912d66ffe7', 'b36c408c-1d9e-4114-9291-6a785cbd4bf0', 1, 'jump on the bandwagon');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5611153-fba5-4000-b61e-e3c8075ecc49', 'b36c408c-1d9e-4114-9291-6a785cbd4bf0', 2, 'let the cat out of the bag');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d07452f-4cbd-446c-a7a8-ae23317900af', 'b36c408c-1d9e-4114-9291-6a785cbd4bf0', 3, 'spill the beans');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b36c408c-1d9e-4114-9291-6a785cbd4bf0', '6cb804c2-4145-47f7-8cf7-374fd64004cb', '''To throw in the towel'' means to give up or admit defeat — the context of ''refused to'' fits its negation, indicating persistence despite setbacks.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bcf2b5ae-5bb2-4f64-b84d-8578d18a03c7', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 30, 'Pick the word nearest in meaning to ''Aerodynamic'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ad2f3c6-e955-4959-b869-3c8e39a8dc19', 'bcf2b5ae-5bb2-4f64-b84d-8578d18a03c7', 0, 'Heavy and bulky in design');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d44d2da-714c-4651-84db-91ef3345a8b4', 'bcf2b5ae-5bb2-4f64-b84d-8578d18a03c7', 1, 'Designed to reduce air resistance and move efficiently through air');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e932c844-eceb-49b7-b4bf-ed0c7675a1d6', 'bcf2b5ae-5bb2-4f64-b84d-8578d18a03c7', 2, 'Related only to underwater vehicles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c03274a9-a4c1-4248-9201-98ca6beaa336', 'bcf2b5ae-5bb2-4f64-b84d-8578d18a03c7', 3, 'Related to sound waves specifically');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bcf2b5ae-5bb2-4f64-b84d-8578d18a03c7', '4d44d2da-714c-4651-84db-91ef3345a8b4', '''Aerodynamic'' describes a shape or design optimized to reduce air resistance (drag) and move efficiently through the air.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('443385bd-46a5-4003-8547-291d68338f2d', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 31, 'Identify the grammatically correct sentence:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f24369e-6b22-4630-913f-ba7b8eb3cea3', '443385bd-46a5-4003-8547-291d68338f2d', 0, 'Neither the pilot nor the co-pilots was informed of the delay.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbed42de-12e1-4e5a-8b38-0bdf082fbd5a', '443385bd-46a5-4003-8547-291d68338f2d', 1, 'Neither the pilot nor the co-pilots were informed of the delay.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48b6d72b-574c-420b-b4be-aa0769ffaee6', '443385bd-46a5-4003-8547-291d68338f2d', 2, 'Neither the pilot or the co-pilots were informed of the delay.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3860c021-03b1-4719-8230-583fe1db7b54', '443385bd-46a5-4003-8547-291d68338f2d', 3, 'Neither the pilot and the co-pilots were informed of the delay.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('443385bd-46a5-4003-8547-291d68338f2d', 'bbed42de-12e1-4e5a-8b38-0bdf082fbd5a', 'With ''neither...nor'', the verb agrees with the noun closest to it (''co-pilots'', plural) — ''were informed'' is correct.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4d9e8173-8eb1-40cc-b8d7-bd13b0ee64af', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 32, 'Fill in the blank with the correct preposition: ''The aircraft''s performance is highly sensitive ________ altitude changes.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad095d74-8323-48d7-be55-3be31d04a6c7', '4d9e8173-8eb1-40cc-b8d7-bd13b0ee64af', 0, 'to');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee4ab81c-690a-4d6e-b1bf-e612bb08f4c6', '4d9e8173-8eb1-40cc-b8d7-bd13b0ee64af', 1, 'of');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7806d4ce-31e7-4d67-9e65-7e42377ff04d', '4d9e8173-8eb1-40cc-b8d7-bd13b0ee64af', 2, 'for');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a234a223-220e-4f53-8887-abc8b69b5aff', '4d9e8173-8eb1-40cc-b8d7-bd13b0ee64af', 3, 'with');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4d9e8173-8eb1-40cc-b8d7-bd13b0ee64af', 'ad095d74-8323-48d7-be55-3be31d04a6c7', 'The idiomatic preposition following ''sensitive'' is ''to'' — ''sensitive to''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('086e71b3-3ad8-482c-8e90-d28549357110', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 33, 'Convert to reported speech: The captain said, ''We are approaching turbulent weather.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8843e63a-be8b-4d6d-9818-72283be7b3c0', '086e71b3-3ad8-482c-8e90-d28549357110', 0, 'The captain said that they are approaching turbulent weather.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d89ba63f-207d-4ae5-980f-83be0327c1e0', '086e71b3-3ad8-482c-8e90-d28549357110', 1, 'The captain said that they were approaching turbulent weather.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ba2a197-4f85-419a-b15f-f0a13f7a9acc', '086e71b3-3ad8-482c-8e90-d28549357110', 2, 'The captain said that they approach turbulent weather.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d9304f6-dd1c-4132-8b8b-6883569855e5', '086e71b3-3ad8-482c-8e90-d28549357110', 3, 'The captain said that they will approach turbulent weather.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('086e71b3-3ad8-482c-8e90-d28549357110', 'd89ba63f-207d-4ae5-980f-83be0327c1e0', 'In reported speech, present continuous (''are approaching'') shifts back to past continuous (''were approaching'') when the reporting verb is in the past tense.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4db92f8c-6c38-4e10-9f7f-a551d1a073c0', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 34, 'Pick the correctly spelled option:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd18ee44-a361-4c92-9639-4b043bcddbfd', '4db92f8c-6c38-4e10-9f7f-a551d1a073c0', 0, 'Gyroscpe');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38ed7928-acc2-4e60-aab4-0f2bc40681b1', '4db92f8c-6c38-4e10-9f7f-a551d1a073c0', 1, 'Gyroscope');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9dadfeb-dba6-4f68-8127-1677b6d87051', '4db92f8c-6c38-4e10-9f7f-a551d1a073c0', 2, 'Gyrosope');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('148c4bc0-67d4-4b42-8e8d-c20fb0aade4a', '4db92f8c-6c38-4e10-9f7f-a551d1a073c0', 3, 'Gyrescope');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4db92f8c-6c38-4e10-9f7f-a551d1a073c0', '38ed7928-acc2-4e60-aab4-0f2bc40681b1', '''Gyroscope'' is the correct spelling.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a464ce32-eebe-4c3e-a0b2-de69f2830c90', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 35, 'Spot the sentence with correct subject-verb agreement:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('676052aa-d3a3-4446-9d87-a0fbee6ac611', 'a464ce32-eebe-4c3e-a0b2-de69f2830c90', 0, 'The squadron of fighter jets fly in tight formation.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd29b2c1-f919-4f37-adfa-5c27b2cc91ad', 'a464ce32-eebe-4c3e-a0b2-de69f2830c90', 1, 'The squadron of fighter jets flies in tight formation.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4dc7cb2-90e1-4fec-a5a4-bc78bc80ae9a', 'a464ce32-eebe-4c3e-a0b2-de69f2830c90', 2, 'The squadron of fighter jet fly in tight formation.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95d6fcd5-0547-46ff-acf8-328cb2351269', 'a464ce32-eebe-4c3e-a0b2-de69f2830c90', 3, 'The squadron of fighter jets has flying in tight formation.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a464ce32-eebe-4c3e-a0b2-de69f2830c90', 'cd29b2c1-f919-4f37-adfa-5c27b2cc91ad', '''Squadron'' (a collective noun, treated as singular here) takes the singular verb ''flies'' — the prepositional phrase ''of fighter jets'' doesn''t change the subject''s number.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f26d4605-343d-4806-b90a-661300108b00', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 36, 'Pick the word closest in meaning to ''Ceiling'' (in an aviation context):');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba3a28e4-9ef1-43cc-b243-3a78d63aa348', 'f26d4605-343d-4806-b90a-661300108b00', 0, 'The physical roof of an aircraft cabin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46b872c3-e51a-47f7-87d9-34f4014c2cf9', 'f26d4605-343d-4806-b90a-661300108b00', 1, 'The maximum altitude an aircraft is capable of reaching under given conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9429b498-e5bc-4fee-a329-3695599488e6', 'f26d4605-343d-4806-b90a-661300108b00', 2, 'A type of landing gear');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d73be58-38fc-4c17-95eb-00c98ed1352f', 'f26d4605-343d-4806-b90a-661300108b00', 3, 'A radio communication frequency');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f26d4605-343d-4806-b90a-661300108b00', '46b872c3-e51a-47f7-87d9-34f4014c2cf9', 'In aviation terminology, ''ceiling'' refers to the maximum altitude an aircraft can achieve under specified conditions (e.g., ''service ceiling''), distinct from its everyday meaning of a room''s physical roof.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1c38e733-6efa-415e-bee9-ca7c7453d2f9', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 37, 'Which of these correctly distinguishes ''between'' from ''among''?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89c70de3-6fcb-4126-b12b-fe4aebee6394', '1c38e733-6efa-415e-bee9-ca7c7453d2f9', 0, 'Fuel was distributed between the six aircraft.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67b34b8f-b264-4cfd-99e7-731084c1a836', '1c38e733-6efa-415e-bee9-ca7c7453d2f9', 1, 'Fuel was distributed among the six aircraft.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d51e155d-9385-47d2-ae90-15ad42772a93', '1c38e733-6efa-415e-bee9-ca7c7453d2f9', 2, 'Fuel was distributed between the six aircrafts.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88b30713-1590-43ca-a279-5b0995fb8e54', '1c38e733-6efa-415e-bee9-ca7c7453d2f9', 3, 'Fuel was distributed among the six aircrafts.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1c38e733-6efa-415e-bee9-ca7c7453d2f9', '67b34b8f-b264-4cfd-99e7-731084c1a836', '''Among'' is used for three or more entities (six aircraft here), rather than ''between'' (traditionally reserved for exactly two); also, ''aircraft'' is both singular and plural in standard usage, so ''aircrafts'' is non-standard.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('02b13390-f388-45b1-9f1d-cf75f7806640', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 38, 'Choose the sentence with correct list punctuation:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('127ec71e-3029-4b7d-a26e-ee552d10fc3b', '02b13390-f388-45b1-9f1d-cf75f7806640', 0, 'The checklist includes fuel level altitude, and weather conditions.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79c66648-20fd-4ebe-80e8-8f4da937553a', '02b13390-f388-45b1-9f1d-cf75f7806640', 1, 'The checklist includes fuel level, altitude and weather conditions.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f9161d3-b76e-4f6a-b680-05dd446ad9c1', '02b13390-f388-45b1-9f1d-cf75f7806640', 2, 'The checklist includes fuel level, altitude, and weather conditions.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e882b4c2-9ee2-4b7c-addd-9842197d4183', '02b13390-f388-45b1-9f1d-cf75f7806640', 3, 'The checklist includes; fuel level, altitude, weather conditions.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('02b13390-f388-45b1-9f1d-cf75f7806640', '0f9161d3-b76e-4f6a-b680-05dd446ad9c1', 'A comma should separate each item in a list, including before the final conjunction (Oxford comma), for maximum clarity.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('11a71e19-88b7-4b86-b0e0-6d0bad2c8f73', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 39, 'Pick the option nearest in meaning to the idiom ''to fly by the seat of one''s pants'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cee95e7a-883d-4f64-8036-8ea8358c2aea', '11a71e19-88b7-4b86-b0e0-6d0bad2c8f73', 0, 'To follow a strict, pre-planned procedure exactly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1a36947-d502-4e9e-ba4a-e1f65823ca48', '11a71e19-88b7-4b86-b0e0-6d0bad2c8f73', 1, 'To act or make decisions based on instinct and improvisation, without formal instruments, plans, or guidance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36efd09c-cc91-412d-92d2-ecf41e1cc7b7', '11a71e19-88b7-4b86-b0e0-6d0bad2c8f73', 2, 'To refuse to take any action at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('714d4aca-f892-4678-a5bf-3a1fd384a9f8', '11a71e19-88b7-4b86-b0e0-6d0bad2c8f73', 3, 'To always rely entirely on automated systems');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('11a71e19-88b7-4b86-b0e0-6d0bad2c8f73', 'e1a36947-d502-4e9e-ba4a-e1f65823ca48', '''To fly by the seat of one''s pants'' — originating from early aviation, when pilots often had to rely on instinct and physical sensation rather than instruments — means to act on instinct and improvisation, without formal guidance or a detailed plan.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ac7a3a9f-0a3e-488d-aa9a-2757c941ac2a', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 40, 'Complete the sentence: ''The test pilot''s ________ report helped engineers identify the exact cause of the anomaly.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3224ef96-1833-47f9-88f7-b3f272833a10', 'ac7a3a9f-0a3e-488d-aa9a-2757c941ac2a', 0, 'vague');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39d541ce-d039-48b3-ab50-7b3c2b59381e', 'ac7a3a9f-0a3e-488d-aa9a-2757c941ac2a', 1, 'detailed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ae2a03d-48d5-43a3-81ed-14759d90b372', 'ac7a3a9f-0a3e-488d-aa9a-2757c941ac2a', 2, 'incomplete');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76d5de48-e265-40ed-b8c6-8b10842561ff', 'ac7a3a9f-0a3e-488d-aa9a-2757c941ac2a', 3, 'delayed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ac7a3a9f-0a3e-488d-aa9a-2757c941ac2a', '39d541ce-d039-48b3-ab50-7b3c2b59381e', '''Detailed'' (thorough, comprehensive) fits the context of a report praised for helping identify an exact cause, unlike the negative alternatives.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('50e3eb3c-4a49-4e03-ab40-339e6bbc1e6e', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 41, 'Statements: All fighter jets have afterburners. Some afterburner-equipped aircraft are supersonic. Conclusions: I. Some fighter jets are supersonic. II. All afterburner-equipped aircraft are fighter jets. Which conclusion(s) follow?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39ffdfe3-e3c0-4a76-b029-f59bb5e52784', '50e3eb3c-4a49-4e03-ab40-339e6bbc1e6e', 0, 'Only I follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3bbbc755-cd3d-4a39-bef4-1bffee8693c5', '50e3eb3c-4a49-4e03-ab40-339e6bbc1e6e', 1, 'Only II follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb530497-7cb2-44c5-b767-0a3c58ba45f1', '50e3eb3c-4a49-4e03-ab40-339e6bbc1e6e', 2, 'Both follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e383d617-389f-4f6f-9922-e6d62eb396d7', '50e3eb3c-4a49-4e03-ab40-339e6bbc1e6e', 3, 'Neither follows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('50e3eb3c-4a49-4e03-ab40-339e6bbc1e6e', 'e383d617-389f-4f6f-9922-e6d62eb396d7', 'There''s no guarantee the ''supersonic'' subset of afterburner-equipped aircraft overlaps specifically with fighter jets, so I doesn''t necessarily follow. II reverses the given relationship incorrectly. Neither conclusion follows with certainty.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d1a15b05-5434-4cbe-9d76-96c57eb91fc9', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 42, 'If ''ROCKET'' is coded as ''SPDLFU'' in a certain code, how is ''RUDDER'' coded in that language?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b263fba-c645-430c-bf5e-05692df47ee6', 'd1a15b05-5434-4cbe-9d76-96c57eb91fc9', 0, 'SVEEFS');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('965cc5cb-4cc1-431a-84c8-a271f5656889', 'd1a15b05-5434-4cbe-9d76-96c57eb91fc9', 1, 'SVEEFT');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44ec02d5-56ef-4efe-8368-a15d54d9613c', 'd1a15b05-5434-4cbe-9d76-96c57eb91fc9', 2, 'SVEDFS');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2471125d-6f25-4091-8cef-6ddfebb615bb', 'd1a15b05-5434-4cbe-9d76-96c57eb91fc9', 3, 'TVEEFS');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d1a15b05-5434-4cbe-9d76-96c57eb91fc9', '9b263fba-c645-430c-bf5e-05692df47ee6', 'Each letter is shifted forward by 1 (R→S, O→P, C→D, K→L, E→F, T→U). Applying this to RUDDER: R→S, U→V, D→E, D→E, E→F, R→S, giving ''SVEEFS''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2e7c2da0-aa74-400f-9962-8322e743098f', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 43, 'Find the next number in the series: 5, 11, 23, 47, 95, ?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5230463a-0add-416d-adb5-6707d2d4028b', '2e7c2da0-aa74-400f-9962-8322e743098f', 0, '191');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c43500cc-2e41-46b3-82f5-b4c9ff141da1', '2e7c2da0-aa74-400f-9962-8322e743098f', 1, '189');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1bbd726f-2c7c-4cfd-a669-3087c7ac0d17', '2e7c2da0-aa74-400f-9962-8322e743098f', 2, '193');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd523e4f-d8a9-429f-854e-032fef820b8f', '2e7c2da0-aa74-400f-9962-8322e743098f', 3, '185');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2e7c2da0-aa74-400f-9962-8322e743098f', '5230463a-0add-416d-adb5-6707d2d4028b', 'Each term follows the pattern: multiply by 2 and add 1. 5×2+1=11, 11×2+1=23, 23×2+1=47, 47×2+1=95, 95×2+1=191.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3ddeccb4-24bc-478a-b679-e99f6330835f', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 44, 'Choose the odd one out: Aileron, Elevator, Rudder, Altimeter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72689e6d-1ecf-4098-b765-6df1694b1b66', '3ddeccb4-24bc-478a-b679-e99f6330835f', 0, 'Aileron');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b141eb08-d22c-4ddd-a0eb-8d21e436c8ac', '3ddeccb4-24bc-478a-b679-e99f6330835f', 1, 'Elevator');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c41f886-4ee1-4f49-84c7-50dc02255a97', '3ddeccb4-24bc-478a-b679-e99f6330835f', 2, 'Rudder');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4523f78-5bdf-4cf9-954f-4a2d004c982f', '3ddeccb4-24bc-478a-b679-e99f6330835f', 3, 'Altimeter');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3ddeccb4-24bc-478a-b679-e99f6330835f', 'c4523f78-5bdf-4cf9-954f-4a2d004c982f', 'Aileron, Elevator, and Rudder are all primary flight control surfaces; an Altimeter is a cockpit instrument for measuring altitude, not a control surface — the odd one out.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c268935c-6791-44f9-8fe8-d98d084474de', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 45, 'Five aircraft P, Q, R, S, T have different maximum speeds. P is faster than Q but slower than R. S is the slowest. T is faster than R. What is the correct order from fastest to slowest?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38c4d13f-c0bc-4dab-9d5e-ade70cb6327e', 'c268935c-6791-44f9-8fe8-d98d084474de', 0, 'T, R, P, Q, S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e195118-3667-4a78-872f-14fa928e09fa', 'c268935c-6791-44f9-8fe8-d98d084474de', 1, 'T, R, Q, P, S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('966705f7-6d0a-4dd3-9ef0-f73989c908fd', 'c268935c-6791-44f9-8fe8-d98d084474de', 2, 'R, T, P, Q, S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0688e610-64af-4609-8d66-dea1494faf8b', 'c268935c-6791-44f9-8fe8-d98d084474de', 3, 'T, P, R, Q, S');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c268935c-6791-44f9-8fe8-d98d084474de', '38c4d13f-c0bc-4dab-9d5e-ade70cb6327e', 'Given: R > P > Q, T > R, S is slowest. Combining: T > R > P > Q > S — matching option A.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('23e83661-a3ff-4573-98fd-7af4a17dbf62', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 46, 'If ''A ↑ B'' means ''A generates lift over B'' and ''B ↓ C'' means ''B is heavier than C'', what does ''P ↑ Q ↓ R'' establish?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a08b77b-714a-4754-9281-c4915effc6e3', '23e83661-a3ff-4573-98fd-7af4a17dbf62', 0, 'P generates lift over Q, and Q is heavier than R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16426990-51a7-4587-833e-20815a0095a6', '23e83661-a3ff-4573-98fd-7af4a17dbf62', 1, 'R generates lift over P directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d75772f2-8b73-4b3d-a394-e5ad3d704d40', '23e83661-a3ff-4573-98fd-7af4a17dbf62', 2, 'P and R have identical weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7fab44e-58cd-4e35-b2d5-7a0da4b53bc0', '23e83661-a3ff-4573-98fd-7af4a17dbf62', 3, 'No relationship can be established');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('23e83661-a3ff-4573-98fd-7af4a17dbf62', '7a08b77b-714a-4754-9281-c4915effc6e3', '''P ↑ Q'' means P generates lift over Q. ''Q ↓ R'' means Q is heavier than R. Combined: P generates lift over Q, and Q is heavier than R — matching option A; this does not directly establish a relationship between P and R.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('58ad1292-75e4-4c0f-85f1-e2c1283263c7', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 47, 'Complete the analogy: Wing is to Lift as Engine is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19490fad-bcee-4ac0-b818-d43bd1a4d117', '58ad1292-75e4-4c0f-85f1-e2c1283263c7', 0, 'Thrust');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b082d672-f35d-4b87-a1ff-fea6bd68e05c', '58ad1292-75e4-4c0f-85f1-e2c1283263c7', 1, 'Drag');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30d6996d-94e0-4fa2-b8f0-bffad4c14984', '58ad1292-75e4-4c0f-85f1-e2c1283263c7', 2, 'Weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1dfc50f3-90c3-4fb3-972a-e85a12fcf471', '58ad1292-75e4-4c0f-85f1-e2c1283263c7', 3, 'Altitude');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('58ad1292-75e4-4c0f-85f1-e2c1283263c7', '19490fad-bcee-4ac0-b818-d43bd1a4d117', 'A wing''s primary aerodynamic function is to generate lift; an engine''s primary function is to generate thrust — the analogy pairs each component with the force it is primarily responsible for producing.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e491c1e1-54f9-4705-8e96-d9e194e29f75', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 48, 'In a certain code, if ''RADAR'' is coded as ''18-1-4-1-18'' (each letter replaced by its alphabetical position), what is ''PILOT'' coded as?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('381e97c0-769c-4127-a2b5-c2729a6feb5c', 'e491c1e1-54f9-4705-8e96-d9e194e29f75', 0, '16-9-12-15-20');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('962c1fe2-7714-4b75-8b8a-0e56bfb96fb5', 'e491c1e1-54f9-4705-8e96-d9e194e29f75', 1, '16-9-11-15-20');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('626e374e-de7d-490a-a5b2-d65c15dcd920', 'e491c1e1-54f9-4705-8e96-d9e194e29f75', 2, '15-9-12-15-20');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0da03fee-5d17-4bcf-a5fa-f4dbb74c7b86', 'e491c1e1-54f9-4705-8e96-d9e194e29f75', 3, '16-9-12-14-20');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e491c1e1-54f9-4705-8e96-d9e194e29f75', '381e97c0-769c-4127-a2b5-c2729a6feb5c', 'P=16, I=9, L=12, O=15, T=20 — matching each letter to its exact alphabetical position gives ''16-9-12-15-20''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('aca91dc3-9c58-4e8f-9082-2118ec827667', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 49, 'A is the pilot of aircraft B. C is the co-pilot of the same aircraft B. D is the flight engineer of aircraft B. If all three are crew members of aircraft B, how many total crew members does aircraft B have, based strictly on the information given?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4da82cc5-4ca2-454a-933f-6772f377a5de', 'aca91dc3-9c58-4e8f-9082-2118ec827667', 0, 'Exactly 3, based on the information given (though the aircraft may have additional undisclosed crew)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1cccf2fc-f17d-4227-97d2-4e3f0d728ad9', 'aca91dc3-9c58-4e8f-9082-2118ec827667', 1, 'Exactly 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4975314-f0b1-4d49-baf4-8f6771a2b2e8', 'aca91dc3-9c58-4e8f-9082-2118ec827667', 2, 'Exactly 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54bc0de0-da77-49d7-a12e-badb9da4a802', 'aca91dc3-9c58-4e8f-9082-2118ec827667', 3, 'Cannot be determined at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aca91dc3-9c58-4e8f-9082-2118ec827667', '4da82cc5-4ca2-454a-933f-6772f377a5de', 'Based strictly on the given information, three distinct crew roles (pilot, co-pilot, flight engineer) are described as belonging to aircraft B — so at least 3 crew members are confirmed, though the statement doesn''t rule out additional crew not mentioned.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c374cc26-47f7-4054-8eda-2c36c09913e3', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 50, 'Statements: No glider is a powered aircraft. All powered aircraft require fuel. Conclusions: I. No glider requires fuel. II. Some fuel-requiring vehicles are powered aircraft. Which conclusion(s) follow?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('577a552c-c347-4e10-871b-b2e25660a997', 'c374cc26-47f7-4054-8eda-2c36c09913e3', 0, 'Only I follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e21a350-5c01-4e0e-96cf-ca4e563dcedf', 'c374cc26-47f7-4054-8eda-2c36c09913e3', 1, 'Only II follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85f094fa-d293-46d3-89b6-a6e01f5e49e5', 'c374cc26-47f7-4054-8eda-2c36c09913e3', 2, 'Both follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed936c69-fde3-433e-8022-2d705c73f1bf', 'c374cc26-47f7-4054-8eda-2c36c09913e3', 3, 'Neither follows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c374cc26-47f7-4054-8eda-2c36c09913e3', '8e21a350-5c01-4e0e-96cf-ca4e563dcedf', '''No glider is a powered aircraft'' and ''All powered aircraft require fuel'' does NOT imply ''no glider requires fuel'' (a glider could require fuel through some other unstated means) — so I does not follow. ''All powered aircraft require fuel'' directly implies ''Some fuel-requiring vehicles are powered aircraft'' — so II follows.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0a2db521-7198-4660-9cd7-62e4f5281300', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 51, 'A clock shows 4:35. What is the angle between the hour and minute hands?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e135156c-10f6-47ce-bc96-3c75be57a673', '0a2db521-7198-4660-9cd7-62e4f5281300', 0, '62.5°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5661d78-ca19-4670-b893-92fb4c667cd0', '0a2db521-7198-4660-9cd7-62e4f5281300', 1, '67.5°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07e5452a-ed88-4235-9f13-b6082709435a', '0a2db521-7198-4660-9cd7-62e4f5281300', 2, '72.5°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3deb8edc-56b9-48cf-9a4f-1577c01d9855', '0a2db521-7198-4660-9cd7-62e4f5281300', 3, '77.5°');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0a2db521-7198-4660-9cd7-62e4f5281300', '07e5452a-ed88-4235-9f13-b6082709435a', 'At 4:35, the minute hand is at 35×6=210° from 12. The hour hand is at 4×30+35×0.5=120+17.5=137.5° from 12. The angle between them is |210-137.5|=72.5°.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('651173d3-bb32-448d-a648-f5dbd9ea8145', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 52, 'Find the odd one out: (2,6), (3,12), (4,20), (5,25)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('934d54a0-2a1e-4272-b995-42f80cbebf24', '651173d3-bb32-448d-a648-f5dbd9ea8145', 0, '(2,6)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37b7355f-37bd-4c88-ad13-51c99d33274c', '651173d3-bb32-448d-a648-f5dbd9ea8145', 1, '(3,12)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f3ad80c-132c-4732-9495-330585a05db3', '651173d3-bb32-448d-a648-f5dbd9ea8145', 2, '(4,20)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2aa37809-6b16-4e91-a3c6-837ee820dc79', '651173d3-bb32-448d-a648-f5dbd9ea8145', 3, '(5,25)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('651173d3-bb32-448d-a648-f5dbd9ea8145', '2aa37809-6b16-4e91-a3c6-837ee820dc79', 'In (2,6), (3,12), and (4,20), the pattern is n×(n+1): 2×3=6, 3×4=12, 4×5=20. In (5,25), 5×6=30, not 25 — this pair breaks the pattern.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d08595e9-8d9a-4d66-9d6c-3a3b9b0f53e9', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 53, 'If North-East becomes South, South-West becomes North, then East becomes:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7922e20-bdbe-4e04-b52d-fe01a08f89d1', 'd08595e9-8d9a-4d66-9d6c-3a3b9b0f53e9', 0, 'West');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0738a1c9-9204-4d88-954c-26ea8a6b285d', 'd08595e9-8d9a-4d66-9d6c-3a3b9b0f53e9', 1, 'South-West');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('381997cf-49b4-4b1d-9081-f321e398c693', 'd08595e9-8d9a-4d66-9d6c-3a3b9b0f53e9', 2, 'North-West');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('afb6a68a-6feb-476c-8975-810b6037deb0', 'd08595e9-8d9a-4d66-9d6c-3a3b9b0f53e9', 3, 'South-East');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d08595e9-8d9a-4d66-9d6c-3a3b9b0f53e9', '381997cf-49b4-4b1d-9081-f321e398c693', 'The transformation is a 135° clockwise rotation of directions (NE→S is a 135° clockwise shift; SW→N confirms the same 135° clockwise shift). Applying the same 135° clockwise rotation to East gives North-West.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cc74efb2-faad-4ac2-a25d-4ea871e3695a', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 54, 'A can inspect an aircraft in 6 hours, and B can inspect it in 9 hours. Working together, how long will they take?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9491179-9f08-4fcf-93c2-9a6229c64e41', 'cc74efb2-faad-4ac2-a25d-4ea871e3695a', 0, '3 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f77ad0e-3077-44c8-a996-0c1567d6f7c9', 'cc74efb2-faad-4ac2-a25d-4ea871e3695a', 1, '3.6 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86203ebf-3558-4b4d-bd77-de81c783f354', 'cc74efb2-faad-4ac2-a25d-4ea871e3695a', 2, '4 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec94355e-f6f6-4039-bca6-f4583ff5f057', 'cc74efb2-faad-4ac2-a25d-4ea871e3695a', 3, '4.5 hours');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cc74efb2-faad-4ac2-a25d-4ea871e3695a', '3f77ad0e-3077-44c8-a996-0c1567d6f7c9', 'A''s rate = 1/6, B''s rate = 1/9. Combined rate = 1/6 + 1/9 = 3/18 + 2/18 = 5/18 (jobs/hour). Time = 18/5 = 3.6 hours.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6db19d49-28ae-465f-9964-9ef2714f3d7f', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 55, 'Choose the word that does NOT belong with the others: Fuselage, Wing, Empennage, Radar');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a52a0d8-80fe-4390-9289-f0271ea50946', '6db19d49-28ae-465f-9964-9ef2714f3d7f', 0, 'Fuselage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15be9a9f-f427-43ee-bbce-816bb6e57ef1', '6db19d49-28ae-465f-9964-9ef2714f3d7f', 1, 'Wing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fed045b0-543d-4140-a341-7c1b0681ba00', '6db19d49-28ae-465f-9964-9ef2714f3d7f', 2, 'Empennage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b014b468-1d16-4594-8588-059e1bd1a833', '6db19d49-28ae-465f-9964-9ef2714f3d7f', 3, 'Radar');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6db19d49-28ae-465f-9964-9ef2714f3d7f', 'b014b468-1d16-4594-8588-059e1bd1a833', 'Fuselage, Wing, and Empennage (tail assembly) are all primary structural components of an aircraft''s airframe; Radar is an avionics/sensor system, not a structural component — the odd one out.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('87c13430-80cd-457a-a731-992012f25ca0', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 56, 'In a row of 55 aircraft on a tarmac, one is 22nd from the left. What is its position from the right?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b7340db-bb38-48b3-bee7-dea48e1caaa9', '87c13430-80cd-457a-a731-992012f25ca0', 0, '33rd');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9567b0c-aa74-4b7f-adac-9b4f452d3bce', '87c13430-80cd-457a-a731-992012f25ca0', 1, '34th');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8bf0ca46-e984-4e78-b268-7b5c312367e0', '87c13430-80cd-457a-a731-992012f25ca0', 2, '35th');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a56cb3a-5231-4a7d-87d3-26c6f492195a', '87c13430-80cd-457a-a731-992012f25ca0', 3, '32nd');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('87c13430-80cd-457a-a731-992012f25ca0', 'd9567b0c-aa74-4b7f-adac-9b4f452d3bce', 'Position from the right = (Total − Position from left) + 1 = (55 − 22) + 1 = 34th from the right.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('672ee452-eac8-4f55-be1a-45ecdf7a880c', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 57, 'Which term logically completes the series: Troposphere, Stratosphere, Mesosphere, ?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2263ba77-fa3e-404b-bdb1-5746fbf9eaa0', '672ee452-eac8-4f55-be1a-45ecdf7a880c', 0, 'Hydrosphere (not an atmospheric layer by altitude, breaking the pattern)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('323079c6-944a-4748-933a-9841ab5f308d', '672ee452-eac8-4f55-be1a-45ecdf7a880c', 1, 'Thermosphere (the next atmospheric layer by increasing altitude, continuing the pattern)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5b558c9-0057-4595-a0a4-cbcfbb52189d', '672ee452-eac8-4f55-be1a-45ecdf7a880c', 2, 'Biosphere (not defined by atmospheric altitude)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66d76f84-842a-401e-968d-6c77986ff3c8', '672ee452-eac8-4f55-be1a-45ecdf7a880c', 3, 'Lithosphere (Earth''s solid crust, unrelated to the atmosphere)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('672ee452-eac8-4f55-be1a-45ecdf7a880c', '323079c6-944a-4748-933a-9841ab5f308d', 'Troposphere, Stratosphere, and Mesosphere are consecutive layers of Earth''s atmosphere in order of increasing altitude. The Thermosphere is the next layer, continuing the pattern — the other options are not atmospheric layers ordered by altitude.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('862bdb48-206b-4844-88c8-afc3555ca5aa', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 58, 'If today is Sunday, what day will it be 60 days from now?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66084da4-1b72-47bc-bf5e-f463d6892639', '862bdb48-206b-4844-88c8-afc3555ca5aa', 0, 'Wednesday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0b1905c-d43d-4dd8-ab52-082812aee886', '862bdb48-206b-4844-88c8-afc3555ca5aa', 1, 'Thursday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec0ae5bd-0e9c-409f-9d04-63135573a1c0', '862bdb48-206b-4844-88c8-afc3555ca5aa', 2, 'Friday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5b4a2a9-6566-4abf-b0ea-675da2e4d904', '862bdb48-206b-4844-88c8-afc3555ca5aa', 3, 'Saturday');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('862bdb48-206b-4844-88c8-afc3555ca5aa', 'd0b1905c-d43d-4dd8-ab52-082812aee886', '60 days = 8 weeks + 4 days. 8 weeks from Sunday is still Sunday; counting 4 more days (Mon, Tue, Wed, Thu) lands on Thursday.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('41fa3f9a-cbf3-416b-97bb-03b3a1923db8', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 59, 'Statements: All helicopters can hover. Some hovering vehicles are used for rescue operations. Conclusion: Some helicopters are used for rescue operations. Is this conclusion valid based strictly on the statements given?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f56b4289-45d6-4a63-bd09-a81f0f04bd67', '41fa3f9a-cbf3-416b-97bb-03b3a1923db8', 0, 'Valid — it follows directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be528f15-4e83-4101-9b83-414a0f4dc2fb', '41fa3f9a-cbf3-416b-97bb-03b3a1923db8', 1, 'Invalid — it does not necessarily follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eea5f656-35be-4420-bdb2-5a0c22de613e', '41fa3f9a-cbf3-416b-97bb-03b3a1923db8', 2, 'Valid only if all hovering vehicles are helicopters');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7bef90ce-66f3-4b02-96aa-6b6ed27e924f', '41fa3f9a-cbf3-416b-97bb-03b3a1923db8', 3, 'Cannot be determined without additional data');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('41fa3f9a-cbf3-416b-97bb-03b3a1923db8', 'be528f15-4e83-4101-9b83-414a0f4dc2fb', 'The statements establish helicopters are a subset of hovering vehicles, and some (unspecified) hovering vehicles are used for rescue operations — but there''s no guarantee the ''rescue'' subset overlaps with ''helicopters'' specifically. The conclusion does not necessarily follow.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('abafe8bf-8246-49ef-ba30-069325f4012b', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 60, 'A senior engineer''s age is 5 times a trainee engineer''s age. In 6 years, the senior engineer''s age will be twice the trainee''s age. What is the trainee''s current age?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d68c86f6-ef1e-4fbe-ba66-962a12416eeb', 'abafe8bf-8246-49ef-ba30-069325f4012b', 0, '1 year');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('61e12d0a-1a9d-4a4c-810e-a0e9c14f4add', 'abafe8bf-8246-49ef-ba30-069325f4012b', 1, '2 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8bdd361c-4436-40ee-bde2-6e8d273f46a8', 'abafe8bf-8246-49ef-ba30-069325f4012b', 2, '3 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('451f603a-5e12-49ca-ba0a-fb27c41836cb', 'abafe8bf-8246-49ef-ba30-069325f4012b', 3, '4 years');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('abafe8bf-8246-49ef-ba30-069325f4012b', '61e12d0a-1a9d-4a4c-810e-a0e9c14f4add', 'Let the trainee''s current age = x, so the senior engineer''s age = 5x. In 6 years: (5x+6) = 2(x+6). Solving: 5x+6 = 2x+12, so 3x=6, x=2. (This yields a deliberately small, purely-arithmetic answer — the question tests the algebra, not realistic ages.)', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

-- ── Section: Aeronautical / Aerospace Engineering (Discipline) (100 questions) — Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7b340076-e8fb-4307-9ad1-bb66d322e888', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 61, 'Bernoulli''s principle, as applied to airflow over an aircraft wing, states that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd9601b9-a6da-4f4c-a4ca-5e00a94bbd4c', '7b340076-e8fb-4307-9ad1-bb66d322e888', 0, 'Faster-moving air exerts higher pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8e7e842-83a4-4e13-8d06-aa5521299bab', '7b340076-e8fb-4307-9ad1-bb66d322e888', 1, 'Faster-moving air exerts lower pressure — contributing to the pressure differential between the wing''s upper and lower surfaces that generates lift');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64c2c94d-5b8a-4773-85d8-f84e20284114', '7b340076-e8fb-4307-9ad1-bb66d322e888', 2, 'Air pressure is independent of air velocity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ca32441-d7c4-4eb5-bee8-ca78cc660b6d', '7b340076-e8fb-4307-9ad1-bb66d322e888', 3, 'Bernoulli''s principle applies only to liquids, never to air');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7b340076-e8fb-4307-9ad1-bb66d322e888', 'c8e7e842-83a4-4e13-8d06-aa5521299bab', 'Bernoulli''s principle states that, for an inviscid, incompressible flow, faster-moving air exerts lower pressure — the accelerated airflow over a wing''s curved upper surface (compared to the lower surface) contributes to a pressure differential that generates lift, alongside the equally important contribution from the wing''s angle of attack and Newton''s third law (downward air deflection).', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4649b2b8-a877-4745-9847-ae777857e797', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 62, 'The ''angle of attack'' of an airfoil is defined as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b0b9148-b464-4626-9347-22ac82d33722', '4649b2b8-a877-4745-9847-ae777857e797', 0, 'The angle between the wing''s leading and trailing edges');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a98a41f-1807-4481-b77c-0de0fc7f5293', '4649b2b8-a877-4745-9847-ae777857e797', 1, 'The angle between the chord line of the airfoil and the direction of the oncoming relative airflow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c688d0d9-40d1-45bd-a5c0-af944e52a9c6', '4649b2b8-a877-4745-9847-ae777857e797', 2, 'The angle of the aircraft''s fuselage relative to the ground');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4dada5d4-31e4-462d-a82a-de085857af7c', '4649b2b8-a877-4745-9847-ae777857e797', 3, 'The angle of the propeller blades only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4649b2b8-a877-4745-9847-ae777857e797', '6a98a41f-1807-4481-b77c-0de0fc7f5293', 'Angle of attack is the angle between the airfoil''s chord line (a straight line from the leading to trailing edge) and the direction of the oncoming relative wind — a critical parameter directly influencing lift generation, up to the point of stall.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3ab8bcd3-bb94-487f-8f62-9bc36514fc03', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 63, '''Stall'', in aerodynamics, occurs when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c014308-d3ee-45eb-a7ae-85ca372c57fe', '3ab8bcd3-bb94-487f-8f62-9bc36514fc03', 0, 'The engine stops running');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c188cff-3ce9-4652-8a38-0d299c5f4630', '3ab8bcd3-bb94-487f-8f62-9bc36514fc03', 1, 'The angle of attack exceeds a critical value, causing airflow separation over the wing and a sudden loss of lift');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f82a213-6ec1-423b-9038-a89bdec7007d', '3ab8bcd3-bb94-487f-8f62-9bc36514fc03', 2, 'The aircraft reaches its maximum speed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e80f48e1-971d-4538-a668-5eb77f7e9fd6', '3ab8bcd3-bb94-487f-8f62-9bc36514fc03', 3, 'The landing gear fails to deploy');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3ab8bcd3-bb94-487f-8f62-9bc36514fc03', '5c188cff-3ce9-4652-8a38-0d299c5f4630', 'Aerodynamic stall occurs when the angle of attack exceeds a critical value, causing the smooth airflow over the wing''s upper surface to separate — resulting in a sudden, significant loss of lift, independent of engine status (an engine can be fully functional during a stall).', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2399e463-2a16-4607-abd8-0b1e50c11d4e', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 64, 'The four fundamental forces acting on an aircraft in flight are:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75342cc7-4208-4bcb-abde-90e7c5d1656e', '2399e463-2a16-4607-abd8-0b1e50c11d4e', 0, 'Lift, Weight, Thrust, Drag');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e826bb5b-f00c-4372-9dab-d4e2d5f64d25', '2399e463-2a16-4607-abd8-0b1e50c11d4e', 1, 'Pressure, Volume, Temperature, Density');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e24f9056-e539-4a3c-a462-b753d991beb8', '2399e463-2a16-4607-abd8-0b1e50c11d4e', 2, 'Speed, Altitude, Direction, Time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a01395da-d9eb-4eb0-abe5-77e2c92e18e4', '2399e463-2a16-4607-abd8-0b1e50c11d4e', 3, 'Mass, Velocity, Acceleration, Force');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2399e463-2a16-4607-abd8-0b1e50c11d4e', '75342cc7-4208-4bcb-abde-90e7c5d1656e', 'The four fundamental forces in flight are Lift (opposing weight, generated primarily by the wings), Weight (gravity acting on the aircraft''s mass), Thrust (forward force from the engine/propulsion system), and Drag (resistance opposing forward motion through the air).', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8f01877d-81a8-4165-b52e-64bc2f62bcb5', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 65, '''Induced drag'' on an aircraft wing is primarily caused by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18a1e324-605a-4374-8df3-b543305f86cd', '8f01877d-81a8-4165-b52e-64bc2f62bcb5', 0, 'Air friction along the fuselage surface only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a89bff9c-2a79-4f0d-b3a3-ac81e8ff53b0', '8f01877d-81a8-4165-b52e-64bc2f62bcb5', 1, 'The generation of lift itself — specifically, wingtip vortices formed by the pressure differential between the wing''s upper and lower surfaces');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ed6b829-c0ec-46f0-9750-580588dec09c', '8f01877d-81a8-4165-b52e-64bc2f62bcb5', 2, 'The engine''s exhaust exiting the rear');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7263ed45-3e69-4ccd-93fd-be591001d9ab', '8f01877d-81a8-4165-b52e-64bc2f62bcb5', 3, 'The landing gear being extended');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8f01877d-81a8-4165-b52e-64bc2f62bcb5', 'a89bff9c-2a79-4f0d-b3a3-ac81e8ff53b0', 'Induced drag is a direct byproduct of lift generation — the pressure differential between a wing''s lower (higher pressure) and upper (lower pressure) surfaces causes air to spill around the wingtips, forming trailing vortices that induce additional drag; induced drag decreases with increasing airspeed, unlike parasitic drag, which increases.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f0df959b-8104-41a5-8767-63c519a126f8', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 66, 'The Mach number of an aircraft is defined as the ratio of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ceac210-bf16-419b-b775-8e079639ddb5', 'f0df959b-8104-41a5-8767-63c519a126f8', 0, 'The aircraft''s altitude to its weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1db002c-327c-462d-b171-15b1218887be', 'f0df959b-8104-41a5-8767-63c519a126f8', 1, 'The aircraft''s true airspeed to the local speed of sound');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4b12a25-8bc4-4984-a43f-4e19de7bb457', 'f0df959b-8104-41a5-8767-63c519a126f8', 2, 'The aircraft''s fuel consumption to its range');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5fe5fad6-82ba-49be-9a2c-9403731cfd66', 'f0df959b-8104-41a5-8767-63c519a126f8', 3, 'The wing''s area to the fuselage''s length');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f0df959b-8104-41a5-8767-63c519a126f8', 'a1db002c-327c-462d-b171-15b1218887be', 'Mach number is the ratio of an object''s speed (true airspeed) to the local speed of sound in the surrounding medium — Mach 1 represents flight at exactly the speed of sound, with subsonic (Mach < 1), transonic (Mach ≈ 1), supersonic (Mach > 1), and hypersonic (Mach > 5) regimes classified accordingly.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('aaf78309-db8c-45c2-9bfb-f069da16ea66', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 67, 'A wing''s ''aspect ratio'' is defined as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2afc7b56-d5a9-45a1-8bea-71fecb176cf8', 'aaf78309-db8c-45c2-9bfb-f069da16ea66', 0, 'The ratio of the wing''s span to its mean chord (or span squared divided by wing area)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c7fce06-0f9f-4ec6-ae34-6a8e529a5466', 'aaf78309-db8c-45c2-9bfb-f069da16ea66', 1, 'The ratio of the wing''s thickness to its length');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69fa6016-482c-43a8-a751-4e62a5465ac4', 'aaf78309-db8c-45c2-9bfb-f069da16ea66', 2, 'The angle between the wing and the fuselage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0305ba1d-d16a-4521-931c-135aa715d927', 'aaf78309-db8c-45c2-9bfb-f069da16ea66', 3, 'The wing''s material density');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aaf78309-db8c-45c2-9bfb-f069da16ea66', '2afc7b56-d5a9-45a1-8bea-71fecb176cf8', 'Aspect ratio is defined as the wing span divided by the mean chord length (equivalently, span squared divided by wing planform area) — a high-aspect-ratio wing (long and narrow, like a glider''s) generally has lower induced drag, while a low-aspect-ratio wing (short and wide) is often favored for high-speed maneuverability.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a243e813-7aa2-420c-bf65-86e39ecf3859', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 68, '''Boundary layer separation'' over a wing surface, associated with stall, occurs when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5b38421-0ec4-4542-ad12-2807d585b342', 'a243e813-7aa2-420c-bf65-86e39ecf3859', 0, 'The boundary layer''s momentum is insufficient to overcome an adverse pressure gradient, causing the flow to detach from the surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('922886d3-bc00-4444-9faa-5e27b1b77968', 'a243e813-7aa2-420c-bf65-86e39ecf3859', 1, 'The boundary layer becomes thinner than the surface material');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aac7f9da-7061-4eca-b942-8daaa7185039', 'a243e813-7aa2-420c-bf65-86e39ecf3859', 2, 'Air temperature drops below freezing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e3a1b78-c7a3-42f6-b5b1-7220c76acac4', 'a243e813-7aa2-420c-bf65-86e39ecf3859', 3, 'The wing surface is perfectly smooth');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a243e813-7aa2-420c-bf65-86e39ecf3859', 'f5b38421-0ec4-4542-ad12-2807d585b342', 'Boundary layer separation occurs when the flow within the thin boundary layer (adjacent to the wing surface) loses enough momentum against an adverse (increasing) pressure gradient that it can no longer follow the surface''s contour, detaching and creating turbulent wake — a key mechanism underlying aerodynamic stall.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ad0cedf1-d0e8-46f1-b818-0e9f0758547e', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 69, 'A ''supersonic'' aircraft flying faster than the speed of sound generates a distinctive:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5dd38bbd-18cc-4482-92f9-8819114d8905', 'ad0cedf1-d0e8-46f1-b818-0e9f0758547e', 0, 'Sonic boom, caused by shock waves forming as the aircraft moves faster than the pressure waves it generates can propagate away');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d15a64e-157d-4688-b891-aaa6330a7473', 'ad0cedf1-d0e8-46f1-b818-0e9f0758547e', 1, 'Silent flight with no acoustic signature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8491b316-5060-4d24-a982-e344838562c5', 'ad0cedf1-d0e8-46f1-b818-0e9f0758547e', 2, 'Constant hum, unrelated to speed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92a97fcc-b6aa-4a8c-8beb-78744866aba7', 'ad0cedf1-d0e8-46f1-b818-0e9f0758547e', 3, 'Visible rainbow trail only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ad0cedf1-d0e8-46f1-b818-0e9f0758547e', '5dd38bbd-18cc-4482-92f9-8819114d8905', 'A sonic boom occurs when an aircraft travels faster than the speed of sound, causing the pressure waves it generates to compress into shock waves — the characteristic loud boom is heard when this shock wave reaches an observer on the ground.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4af39674-f696-4219-9996-d801621000fc', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 70, 'Winglets, the small upward-curved extensions at aircraft wingtips, are primarily designed to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bdd3c438-ca7f-4381-8a3a-ae34f593a21d', '4af39674-f696-4219-9996-d801621000fc', 0, 'Increase the aircraft''s overall weight for stability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94fd4a32-1a04-4bec-a075-d3c261ea5ab2', '4af39674-f696-4219-9996-d801621000fc', 1, 'Reduce induced drag by disrupting the formation of strong wingtip vortices');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1fe98b76-a2fe-4296-ad4f-b33bc45da2b3', '4af39674-f696-4219-9996-d801621000fc', 2, 'Increase engine thrust directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e2d657c9-6d62-4f9c-adb3-30a83e94c241', '4af39674-f696-4219-9996-d801621000fc', 3, 'Serve only a cosmetic/branding purpose with no aerodynamic function');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4af39674-f696-4219-9996-d801621000fc', '94fd4a32-1a04-4bec-a075-d3c261ea5ab2', 'Winglets reduce induced drag by disrupting and weakening the wingtip vortices that would otherwise form from the pressure differential between the wing''s upper and lower surfaces — improving fuel efficiency, particularly noticeable on longer flights.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('85a4294c-c60f-4a4e-ae3c-6d5df9116195', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 71, 'The ''center of pressure'' on an airfoil refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3321f2fa-fc5e-4dbd-be65-0794f641bf9c', '85a4294c-c60f-4a4e-ae3c-6d5df9116195', 0, 'The exact geometric center of the wing regardless of airflow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53c8f36f-b639-4517-a620-3989af5e5ba9', '85a4294c-c60f-4a4e-ae3c-6d5df9116195', 1, 'The point at which the aggregate/net aerodynamic force (lift and drag combined) is considered to act');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67021776-5778-4a6b-ac7e-764a72a6deac', '85a4294c-c60f-4a4e-ae3c-6d5df9116195', 2, 'The location of the engine mount');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f354dd47-21f9-428a-bf31-e418f0507a93', '85a4294c-c60f-4a4e-ae3c-6d5df9116195', 3, 'The point where the wing attaches to the fuselage');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('85a4294c-c60f-4a4e-ae3c-6d5df9116195', '53c8f36f-b639-4517-a620-3989af5e5ba9', 'The center of pressure is the point along the airfoil''s chord at which the total aerodynamic force (the resultant of lift and drag distributed across the surface) can be considered to act — its position typically shifts with changing angle of attack, an important consideration in stability analysis.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('70777aee-29b4-4c12-bc64-7d536f195ab8', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 72, 'A ''laminar flow'' airfoil is specifically designed to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f60a27c-19b2-4e51-8a13-d28a7dc2923c', '70777aee-29b4-4c12-bc64-7d536f195ab8', 0, 'Maximize turbulent flow immediately from the leading edge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('153aa34f-59af-4a37-ba99-6de685d8a520', '70777aee-29b4-4c12-bc64-7d536f195ab8', 1, 'Maintain smooth, laminar (non-turbulent) airflow over a larger portion of the wing surface, reducing skin-friction drag');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9225b829-115b-4430-b8b8-8042b2729d52', '70777aee-29b4-4c12-bc64-7d536f195ab8', 2, 'Increase the wing''s overall weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05bbbb39-cd88-4f97-a498-ec499cc346fe', '70777aee-29b4-4c12-bc64-7d536f195ab8', 3, 'Eliminate lift generation entirely');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('70777aee-29b4-4c12-bc64-7d536f195ab8', '153aa34f-59af-4a37-ba99-6de685d8a520', 'A laminar-flow airfoil is shaped to maintain smooth, orderly (laminar) airflow over a greater portion of its chord before the flow transitions to turbulent, reducing skin-friction drag compared to a conventional airfoil where transition occurs earlier — though laminar-flow designs are more sensitive to surface imperfections and contamination.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1f533940-2abe-4c88-888c-de7dd2a8a992', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 73, '''Ground effect'', experienced by an aircraft flying very close to the ground, results in:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('acba36f8-d2de-4c28-bf1d-0883be514bc8', '1f533940-2abe-4c88-888c-de7dd2a8a992', 0, 'Increased induced drag and reduced lift compared to flying at altitude');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d2c7497-d12f-4129-aef2-c45cdd283088', '1f533940-2abe-4c88-888c-de7dd2a8a992', 1, 'Reduced induced drag and increased effective lift-to-drag ratio, due to the ground disrupting wingtip vortex formation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4214e3e6-7214-438e-8429-a0ed6ade82ba', '1f533940-2abe-4c88-888c-de7dd2a8a992', 2, 'No aerodynamic change whatsoever');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9337e974-cdeb-4a69-9765-5c8a5eae0f4d', '1f533940-2abe-4c88-888c-de7dd2a8a992', 3, 'Complete loss of aerodynamic lift');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1f533940-2abe-4c88-888c-de7dd2a8a992', '0d2c7497-d12f-4129-aef2-c45cdd283088', 'Ground effect occurs when an aircraft flies close to the ground (typically within about one wingspan of altitude) — the ground surface disrupts the formation of wingtip vortices, reducing induced drag and effectively increasing the lift-to-drag ratio, a noticeable phenomenon during takeoff and landing.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ef71287c-257a-4bd5-9901-1588822cba3e', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 74, 'The critical Mach number of an aircraft is the freestream Mach number at which:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a8d9580-7c6b-4ed3-8df1-d62760a97845', 'ef71287c-257a-4bd5-9901-1588822cba3e', 0, 'The aircraft''s engines shut down automatically');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40d54918-7ab6-4eab-a3a6-16437708c005', 'ef71287c-257a-4bd5-9901-1588822cba3e', 1, 'Airflow over some part of the aircraft (typically the wing''s upper surface) first reaches local sonic speed (Mach 1), even though the aircraft itself is still flying subsonically');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('943def1b-7d9c-4484-b568-53a5d8345a19', 'ef71287c-257a-4bd5-9901-1588822cba3e', 2, 'The aircraft achieves maximum fuel efficiency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b9e4883-f6e9-4fef-8e22-6a37507e6757', 'ef71287c-257a-4bd5-9901-1588822cba3e', 3, 'The landing gear must be retracted');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ef71287c-257a-4bd5-9901-1588822cba3e', '40d54918-7ab6-4eab-a3a6-16437708c005', 'The critical Mach number is the freestream (overall aircraft) Mach number at which airflow accelerating over a curved surface (like the wing''s upper camber) first locally reaches Mach 1, even though the aircraft''s overall speed remains subsonic — exceeding this can introduce shock-wave-related effects like wave drag and control difficulties, relevant to transonic flight design.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f6081c5d-e392-49ff-bc3a-7ea8d5f1f66b', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 75, 'A delta wing configuration, commonly used on supersonic fighter aircraft, offers the advantage of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a29b6aca-36f9-4fac-b83e-316f30ba9ea4', 'f6081c5d-e392-49ff-bc3a-7ea8d5f1f66b', 0, 'Lower structural strength requirements than a conventional wing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e4add58-737f-4771-a1f5-41a4b4bc447d', 'f6081c5d-e392-49ff-bc3a-7ea8d5f1f66b', 1, 'Good structural strength, favorable supersonic aerodynamic characteristics, and the ability to generate lift via leading-edge vortices at high angles of attack');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6572596e-1275-4266-92f2-775c232b0981', 'f6081c5d-e392-49ff-bc3a-7ea8d5f1f66b', 2, 'Guaranteed superior fuel efficiency at all speeds compared to every other wing shape');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8780bc32-f69c-456b-9469-1376efdf86f7', 'f6081c5d-e392-49ff-bc3a-7ea8d5f1f66b', 3, 'Elimination of the need for any tail control surfaces');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f6081c5d-e392-49ff-bc3a-7ea8d5f1f66b', '5e4add58-737f-4771-a1f5-41a4b4bc447d', 'Delta wings offer strong structural characteristics, favorable aerodynamic performance at supersonic speeds (lower wave drag), and can generate additional lift through controlled leading-edge vortex formation at high angles of attack — making them a common choice for supersonic fighter aircraft, though with tradeoffs in low-speed handling.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2be773c6-d048-46d8-b24a-80e5138254ef', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 76, 'The primary structural component running the length of an aircraft fuselage, providing longitudinal strength, is called:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d305960-8ed5-46ec-bebd-e5737e949d6b', '2be773c6-d048-46d8-b24a-80e5138254ef', 0, 'Longeron (or stringer)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('741bdc90-115f-47f7-a458-608ed8c63d89', '2be773c6-d048-46d8-b24a-80e5138254ef', 1, 'Aileron');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('322b5c84-6f96-4e70-89ce-e877f567dc74', '2be773c6-d048-46d8-b24a-80e5138254ef', 2, 'Empennage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d669bcb0-6eca-497a-90bf-75f1d46dad65', '2be773c6-d048-46d8-b24a-80e5138254ef', 3, 'Cowling');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2be773c6-d048-46d8-b24a-80e5138254ef', '1d305960-8ed5-46ec-bebd-e5737e949d6b', 'Longerons (and the similar, typically lighter stringers) are longitudinal structural members running along the length of the fuselage, working with transverse frames/formers to provide the fuselage''s overall structural strength and shape.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b6dc1a27-5a48-4560-a455-697ecc1a62da', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 77, 'A ''monocoque'' fuselage structure design relies primarily on:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cfb37e2-b76d-480d-8867-18f444d35c17', 'b6dc1a27-5a48-4560-a455-697ecc1a62da', 0, 'An internal skeleton of trusses, with the outer skin carrying no structural load');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('064ecfbe-1315-47c6-8121-bbb25182b5e4', 'b6dc1a27-5a48-4560-a455-697ecc1a62da', 1, 'The outer skin itself carrying the primary structural (bending and torsional) loads, with minimal internal framework');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ed010a5-ddf0-420a-bddf-082aacde46d2', 'b6dc1a27-5a48-4560-a455-697ecc1a62da', 2, 'Having no outer skin at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2256a3a3-0c42-4d26-b7d6-2ac1bfb8df5c', 'b6dc1a27-5a48-4560-a455-697ecc1a62da', 3, 'External bracing wires exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b6dc1a27-5a48-4560-a455-697ecc1a62da', '064ecfbe-1315-47c6-8121-bbb25182b5e4', 'A true monocoque structure relies on the outer skin itself to carry the primary structural loads (bending, torsion), with minimal internal bracing — in practice, most modern aircraft use a ''semi-monocoque'' design, combining a load-bearing skin with some internal stringers and frames for additional strength.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6bda7790-9575-4467-9f7f-b5d1abc09b8a', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 78, 'The wing spar, a primary structural member within an aircraft wing, is primarily responsible for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d04eee2-2a90-479d-93ba-5e621d6e13cd', '6bda7790-9575-4467-9f7f-b5d1abc09b8a', 0, 'Providing the wing''s aerodynamic shape only, with no structural role');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('347257c4-f964-4643-99b8-5650f82a71fa', '6bda7790-9575-4467-9f7f-b5d1abc09b8a', 1, 'Carrying the majority of the bending and shear loads experienced by the wing during flight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a0ffffc-5f12-4353-b9cb-80352d5c6bc4', '6bda7790-9575-4467-9f7f-b5d1abc09b8a', 2, 'Housing only the fuel tank, with no load-bearing function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('799b3f43-99c2-4818-befe-6522fd4969b7', '6bda7790-9575-4467-9f7f-b5d1abc09b8a', 3, 'Generating lift directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6bda7790-9575-4467-9f7f-b5d1abc09b8a', '347257c4-f964-4643-99b8-5650f82a71fa', 'The wing spar is the primary load-bearing structural member running spanwise within the wing, carrying the majority of bending and shear loads generated by lift and other aerodynamic/inertial forces during flight — the wing''s ribs, by contrast, primarily maintain the airfoil''s aerodynamic cross-sectional shape.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2ed6801b-6590-4f03-aa4f-12cbf4c36dac', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 79, '''Fatigue'' in aircraft structural design refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd78c448-14e9-43ea-8ed8-ff538d73dd73', '2ed6801b-6590-4f03-aa4f-12cbf4c36dac', 0, 'Pilot tiredness during long flights');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63cba542-cf0f-4104-b899-d5d32989e5a7', '2ed6801b-6590-4f03-aa4f-12cbf4c36dac', 1, 'The progressive weakening and potential failure of a structural component due to repeated cyclic loading, even at stress levels below the material''s ultimate strength');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dea9950c-8d19-41b7-9c3e-2c970318e03e', '2ed6801b-6590-4f03-aa4f-12cbf4c36dac', 2, 'A one-time overload failure only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad9a4174-ea2f-4bbd-9586-b2088aa7f14a', '2ed6801b-6590-4f03-aa4f-12cbf4c36dac', 3, 'A type of corrosion');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2ed6801b-6590-4f03-aa4f-12cbf4c36dac', '63cba542-cf0f-4104-b899-d5d32989e5a7', 'Structural fatigue refers to the progressive damage and potential failure of a component subjected to repeated cyclic loading (e.g., repeated pressurization cycles, gust loads) over its operational life, even at stress levels well below the material''s static ultimate strength — a critical consideration in aircraft structural design and maintenance inspection schedules.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7b696be6-54fd-4bc9-8df4-68fb3aed7fef', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 80, 'The ''V-n diagram'' (velocity-load factor diagram) used in aircraft structural design defines:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b96507e7-b2e0-46be-b45a-5e923a9d7d27', '7b696be6-54fd-4bc9-8df4-68fb3aed7fef', 0, 'The aircraft''s fuel consumption at different speeds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebd710ee-121f-43c1-9004-1a7b3dbd2270', '7b696be6-54fd-4bc9-8df4-68fb3aed7fef', 1, 'The safe structural operating envelope of an aircraft, showing the permissible combinations of airspeed and load factor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6c54e75-324e-42e4-a6e3-cf3b08855bbc', '7b696be6-54fd-4bc9-8df4-68fb3aed7fef', 2, 'The aircraft''s radar cross-section');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f346e45-8e09-4b9a-a889-1e87947cd49f', '7b696be6-54fd-4bc9-8df4-68fb3aed7fef', 3, 'The cabin pressurization schedule');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7b696be6-54fd-4bc9-8df4-68fb3aed7fef', 'ebd710ee-121f-43c1-9004-1a7b3dbd2270', 'The V-n diagram defines the safe structural operating envelope of an aircraft, plotting permissible combinations of airspeed and load factor (g-force) — exceeding this envelope risks structural damage or failure, making it a foundational reference for both design and flight operations.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7d9ac0d9-ebbe-4caa-b3c9-903d2c2d5264', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 81, 'A ''pressure bulkhead'' in a pressurized aircraft fuselage is designed to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('508844d4-1177-4a25-83ba-487f34cbb5c9', '7d9ac0d9-ebbe-4caa-b3c9-903d2c2d5264', 0, 'Provide decorative interior paneling only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d74840f8-a387-4501-827e-b885eccf1f4e', '7d9ac0d9-ebbe-4caa-b3c9-903d2c2d5264', 1, 'Seal the pressurized cabin section from unpressurized areas, withstanding the pressure differential');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d56f7240-b733-4f6a-af0b-b716c9681f30', '7d9ac0d9-ebbe-4caa-b3c9-903d2c2d5264', 2, 'Generate additional lift');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abf55d9e-29e8-468f-9049-b4e2ed4e5b40', '7d9ac0d9-ebbe-4caa-b3c9-903d2c2d5264', 3, 'House the aircraft''s radar system');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7d9ac0d9-ebbe-4caa-b3c9-903d2c2d5264', 'd74840f8-a387-4501-827e-b885eccf1f4e', 'A pressure bulkhead seals the pressurized cabin section from unpressurized areas of the aircraft (like the tail cone), structurally withstanding the significant pressure differential between the cabin and the lower-pressure environment outside/behind it at cruise altitude.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('81b9b36d-eed6-4943-8421-84f84df761a3', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 82, 'The primary purpose of aircraft ''ribs'' within a wing structure is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c36a45ed-62c7-45d7-a39b-f254ddbbc9b9', '81b9b36d-eed6-4943-8421-84f84df761a3', 0, 'Carry the majority of the wing''s bending loads (a role primarily belonging to the spar)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d537f403-d119-4a68-b19a-542ab7d9becc', '81b9b36d-eed6-4943-8421-84f84df761a3', 1, 'Maintain and support the wing''s aerodynamic cross-sectional (airfoil) shape');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c55ea9b0-a081-43d1-89b9-bc7a588be79b', '81b9b36d-eed6-4943-8421-84f84df761a3', 2, 'Generate thrust');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2b616af-f3d0-439f-bc86-239943c8c3c7', '81b9b36d-eed6-4943-8421-84f84df761a3', 3, 'Store hydraulic fluid exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('81b9b36d-eed6-4943-8421-84f84df761a3', 'd537f403-d119-4a68-b19a-542ab7d9becc', 'Wing ribs run chordwise (front to back) within the wing, primarily maintaining and supporting the wing''s aerodynamic cross-sectional shape and transferring local aerodynamic loads to the spar — the spar, not the ribs, carries the primary spanwise bending loads.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('74699455-61ec-4a10-b7cc-2b9c146e9acf', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 83, '''Corrosion'' in aircraft structures is a significant concern primarily because it can:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3933bbe7-b12e-4b0e-994c-1a95d259a3fa', '74699455-61ec-4a10-b7cc-2b9c146e9acf', 0, 'Improve the material''s structural strength over time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3fbfe2bd-7ceb-4f42-b492-5fc1a79e4238', '74699455-61ec-4a10-b7cc-2b9c146e9acf', 1, 'Progressively weaken structural material, reducing load-carrying capacity and potentially leading to structural failure if undetected');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76e130ad-92e2-43e9-9687-5eb94a5774b2', '74699455-61ec-4a10-b7cc-2b9c146e9acf', 2, 'Only affect the aircraft''s paint, with no structural impact');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9ee7635-46ce-4443-80bb-0f5a782c9979', '74699455-61ec-4a10-b7cc-2b9c146e9acf', 3, 'Occur only in aircraft that never fly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('74699455-61ec-4a10-b7cc-2b9c146e9acf', '3fbfe2bd-7ceb-4f42-b492-5fc1a79e4238', 'Corrosion progressively degrades structural material (commonly aluminum alloys), reducing its effective cross-sectional area and load-carrying capacity — a significant concern requiring regular inspection and maintenance, since undetected corrosion can lead to structural failure.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9f0df068-dcbf-4c74-a5e4-54f1f22db498', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 84, 'The term ''aeroelasticity'' refers to the study of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0a6e369-abb2-47f1-9091-273ddeb681a6', '9f0df068-dcbf-4c74-a5e4-54f1f22db498', 0, 'The interaction between aerodynamic forces, structural elastic (deformation) response, and inertial forces on an aircraft structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('523273b1-8a1a-45a8-8e18-10cbafc9182d', '9f0df068-dcbf-4c74-a5e4-54f1f22db498', 1, 'Only the electrical systems of an aircraft');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c61fe6ee-088f-4b62-9609-af259ef05ed2', '9f0df068-dcbf-4c74-a5e4-54f1f22db498', 2, 'The chemical composition of jet fuel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ba83b89-ae75-4372-887b-aab1afe5cfa7', '9f0df068-dcbf-4c74-a5e4-54f1f22db498', 3, 'Pilot physiological responses to acceleration');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9f0df068-dcbf-4c74-a5e4-54f1f22db498', 'b0a6e369-abb2-47f1-9091-273ddeb681a6', 'Aeroelasticity studies the complex interaction between aerodynamic forces, a structure''s elastic deformation response, and inertial forces — phenomena like flutter (a potentially catastrophic self-excited oscillation) arise from this interaction and are a critical consideration in aircraft structural and aerodynamic design.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('dc873da8-2d75-48c5-a7d1-7cb5635426f7', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 85, '''Flutter'', a dangerous aeroelastic phenomenon, refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e696ee02-4639-4d68-848b-12360b98a25b', 'dc873da8-2d75-48c5-a7d1-7cb5635426f7', 0, 'A gentle, harmless vibration that always damps out naturally');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e062cec0-f24a-4ba0-819b-b97069898aec', 'dc873da8-2d75-48c5-a7d1-7cb5635426f7', 1, 'A potentially catastrophic, self-excited and self-sustaining (or growing) oscillation of a structure, driven by the interaction of aerodynamic, elastic, and inertial forces');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('271beff8-15d1-486f-9a46-8404bb4ff525', 'dc873da8-2d75-48c5-a7d1-7cb5635426f7', 2, 'A type of engine malfunction unrelated to structural vibration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01871310-fee8-4ac8-961d-1026dbd4da07', 'dc873da8-2d75-48c5-a7d1-7cb5635426f7', 3, 'Normal turbulence-induced aircraft motion');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dc873da8-2d75-48c5-a7d1-7cb5635426f7', 'e062cec0-f24a-4ba0-819b-b97069898aec', 'Flutter is a potentially catastrophic, self-excited aeroelastic oscillation where aerodynamic forces feed energy into a structure''s vibration mode faster than structural damping can dissipate it, causing the oscillation amplitude to grow (potentially to structural failure) rather than decay — a critical safety consideration requiring careful design analysis and flight testing to avoid within the aircraft''s operational envelope.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('58cfbfe7-ce79-4277-b030-402043984cf7', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 86, 'The ''landing gear'' of an aircraft is primarily designed to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2a92d6a-7dde-4ee9-a397-6771f26c29fb', '58cfbfe7-ce79-4277-b030-402043984cf7', 0, 'Generate lift during flight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a03b8a6-6aac-41d4-adeb-8afae5da8d86', '58cfbfe7-ce79-4277-b030-402043984cf7', 1, 'Support the aircraft''s weight on the ground and absorb the impact loads of landing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('528f6e94-3430-4533-9c84-619c5b00fc2e', '58cfbfe7-ce79-4277-b030-402043984cf7', 2, 'Provide forward thrust');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ffa3363d-feba-44e8-b955-55d3e895b16a', '58cfbfe7-ce79-4277-b030-402043984cf7', 3, 'Control the aircraft''s roll during flight');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('58cfbfe7-ce79-4277-b030-402043984cf7', '0a03b8a6-6aac-41d4-adeb-8afae5da8d86', 'Landing gear supports the aircraft''s weight while on the ground (taxiing, takeoff, landing roll) and absorbs the significant impact loads experienced during landing, typically via a combination of tires and a shock-absorbing strut (oleo strut).', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6691a5cf-4dd9-4eee-b683-09320344eb97', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 87, '''Composite materials'' (like carbon-fiber-reinforced polymer), increasingly used in modern aircraft structures, offer the advantage of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a412e312-c6b2-45b7-b71d-9f21bedfe8ee', '6691a5cf-4dd9-4eee-b683-09320344eb97', 0, 'Higher weight for the same strength compared to traditional aluminum alloys');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51afbb61-a332-4a14-a590-7994d17257fd', '6691a5cf-4dd9-4eee-b683-09320344eb97', 1, 'A generally favorable strength-to-weight ratio compared to traditional aluminum alloys, along with good fatigue and corrosion resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02823e4f-3a7f-4d42-b5c9-e033d83c4632', '6691a5cf-4dd9-4eee-b683-09320344eb97', 2, 'Being impossible to repair once damaged');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b8a4bb0-ee3c-4034-b037-e0cb35431607', '6691a5cf-4dd9-4eee-b683-09320344eb97', 3, 'Complete immunity to any form of structural damage');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6691a5cf-4dd9-4eee-b683-09320344eb97', '51afbb61-a332-4a14-a590-7994d17257fd', 'Composite materials, particularly carbon-fiber-reinforced polymers, offer a favorable strength-to-weight ratio compared to traditional aluminum alloys, along with generally good fatigue life and corrosion resistance — driving their increasing use in modern aircraft primary structures, though they require distinct manufacturing and repair techniques.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1be0abf0-b626-42bb-b222-548a6bbc7460', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 88, 'A ''wing box'' structure, common in modern aircraft wing design, primarily provides:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f3bf26e9-6bfe-4b02-b080-25093b136a94', '1be0abf0-b626-42bb-b222-548a6bbc7460', 0, 'Only aerodynamic shaping, with no structural function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1bd1771-9d5b-400c-af20-6eaf34eb2887', '1be0abf0-b626-42bb-b222-548a6bbc7460', 1, 'The primary torsional and bending stiffness of the wing, typically formed by the front and rear spars, upper and lower skins, and ribs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b148d9b9-dae8-4ff3-ba71-7698acbb4be8', '1be0abf0-b626-42bb-b222-548a6bbc7460', 2, 'Fuel storage exclusively, with no structural role');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f9265b2-426a-418b-8669-bd7e39bb2342', '1be0abf0-b626-42bb-b222-548a6bbc7460', 3, 'Landing gear attachment points only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1be0abf0-b626-42bb-b222-548a6bbc7460', 'd1bd1771-9d5b-400c-af20-6eaf34eb2887', 'The wing box (formed by the front and rear spars, upper and lower wing skins, and ribs) provides the primary torsional and bending stiffness/strength of the wing structure, and commonly also serves as the integral fuel tank in many modern aircraft designs.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('49c53ea5-45b4-4f34-a1f4-cb9968dbddb5', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 89, '''Damage tolerance'' design philosophy in aircraft structures assumes that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aac5b8ab-5ab2-4fbc-bc56-f90084c9d402', '49c53ea5-45b4-4f34-a1f4-cb9968dbddb5', 0, 'No structural damage or defects will ever occur throughout the aircraft''s service life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc0a90c6-2306-4573-9da0-7020c6516e73', '49c53ea5-45b4-4f34-a1f4-cb9968dbddb5', 1, 'Structural damage or defects may exist or develop, and the structure must be designed and inspected to safely tolerate such damage until detected and repaired');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b3d2260-eb14-4687-a523-830e13a42155', '49c53ea5-45b4-4f34-a1f4-cb9968dbddb5', 2, 'All aircraft structures are permanently indestructible');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('165f3836-743a-4bab-9af7-8951d3c29a2d', '49c53ea5-45b4-4f34-a1f4-cb9968dbddb5', 3, 'Inspection schedules are unnecessary if a structure is initially defect-free');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('49c53ea5-45b4-4f34-a1f4-cb9968dbddb5', 'dc0a90c6-2306-4573-9da0-7020c6516e73', 'Damage tolerance design philosophy explicitly assumes that cracks, defects, or damage may exist or develop in a structure during its service life, and designs the structure (and associated inspection schedules) to safely tolerate such damage until it is detected and repaired — rather than assuming a structure will remain entirely defect-free throughout its life.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('138cd68b-6cba-4dde-b940-dbf2a14b26a5', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 90, 'The ''empennage'' of an aircraft refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('165babd0-0364-4341-8e60-e9b14125c328', '138cd68b-6cba-4dde-b940-dbf2a14b26a5', 0, 'The engine and its cowling');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1d479d8-d0bc-4356-9050-fb2805864de6', '138cd68b-6cba-4dde-b940-dbf2a14b26a5', 1, 'The tail assembly, including the horizontal and vertical stabilizers with their associated control surfaces (elevator and rudder)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78fe45c7-fe61-4e34-a5c6-29fae7ce09b4', '138cd68b-6cba-4dde-b940-dbf2a14b26a5', 2, 'The landing gear assembly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c96f9fb9-8293-49b3-b78e-50eaafceffa4', '138cd68b-6cba-4dde-b940-dbf2a14b26a5', 3, 'The cockpit instrument panel');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('138cd68b-6cba-4dde-b940-dbf2a14b26a5', 'b1d479d8-d0bc-4356-9050-fb2805864de6', 'The empennage is the aircraft''s tail assembly, comprising the horizontal stabilizer (with elevator) and vertical stabilizer (with rudder) — providing longitudinal and directional stability and control.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('494bdfe3-fab0-4f3d-8870-e0abbbc73780', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 91, 'A turbojet engine generates thrust primarily by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ebf6cea-77b6-4c0c-89e3-850c094fcc52', '494bdfe3-fab0-4f3d-8870-e0abbbc73780', 0, 'Directly converting fuel into electrical energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd606ea8-4ad8-437c-9424-e3ee2a841942', '494bdfe3-fab0-4f3d-8870-e0abbbc73780', 1, 'Accelerating a mass of air through the engine (compressing, combusting with fuel, and expelling it at high velocity through the exhaust nozzle), per Newton''s third law');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('200fe3f3-b2c5-487d-af95-f0eae2714cd5', '494bdfe3-fab0-4f3d-8870-e0abbbc73780', 2, 'Using only propeller blades with no internal combustion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa0cb48f-8ece-437b-ae23-ee6dabec0a00', '494bdfe3-fab0-4f3d-8870-e0abbbc73780', 3, 'Absorbing atmospheric heat with no combustion process');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('494bdfe3-fab0-4f3d-8870-e0abbbc73780', 'cd606ea8-4ad8-437c-9424-e3ee2a841942', 'A turbojet engine draws in air, compresses it, mixes it with fuel and combusts it, then expands the hot gases through a turbine (which drives the compressor) and expels them at high velocity through the exhaust nozzle — the resulting rearward acceleration of the air mass generates forward thrust, per Newton''s third law of motion.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b3f6b272-4a22-4acc-a7b7-3fa189c5654e', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 92, 'The primary difference between a turbojet and a turbofan engine is that a turbofan:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6129eac-9dfc-441e-a964-8425e19ab127', 'b3f6b272-4a22-4acc-a7b7-3fa189c5654e', 0, 'Has no compressor stage at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d163e95f-4520-4fc9-a0d3-1dd99f55879a', 'b3f6b272-4a22-4acc-a7b7-3fa189c5654e', 1, 'Incorporates a large fan that bypasses a significant portion of intake air around the engine core, improving fuel efficiency and reducing noise at typical airliner speeds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d6adc8a-9f08-44bb-94db-0d82b18d9555', 'b3f6b272-4a22-4acc-a7b7-3fa189c5654e', 2, 'Cannot be used on commercial aircraft');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1285f38-1462-48ca-b8a8-6bc606f9f1d6', 'b3f6b272-4a22-4acc-a7b7-3fa189c5654e', 3, 'Generates thrust exclusively through propeller blades, with no jet exhaust');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b3f6b272-4a22-4acc-a7b7-3fa189c5654e', 'd163e95f-4520-4fc9-a0d3-1dd99f55879a', 'A turbofan engine adds a large front fan that accelerates a significant portion of intake air around (''bypassing'') the engine''s core, rather than through it — this bypass air contributes substantial thrust with better fuel efficiency and reduced noise compared to a pure turbojet, making turbofans the standard choice for modern commercial airliners.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6e5042f0-1ded-4b43-af51-5d962ca2417d', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 93, 'A turboprop engine differs from a turbojet in that a turboprop:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f6f842e-1715-48c1-ba1c-a19d8a1acfc0', '6e5042f0-1ded-4b43-af51-5d962ca2417d', 0, 'Uses the gas turbine primarily to drive a propeller, with the propeller (not direct jet exhaust) generating most of the thrust');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d5ba955-f3ce-4f45-b156-fd4d2bd3afd6', '6e5042f0-1ded-4b43-af51-5d962ca2417d', 1, 'Has no gas turbine component at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e748d26-4979-4de0-b8c0-4f4356dffde6', '6e5042f0-1ded-4b43-af51-5d962ca2417d', 2, 'Is only usable for hypersonic flight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04298523-0918-4cc0-83c4-5529eaf9513a', '6e5042f0-1ded-4b43-af51-5d962ca2417d', 3, 'Generates thrust exclusively through exhaust gas velocity, with no rotating propeller');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6e5042f0-1ded-4b43-af51-5d962ca2417d', '4f6f842e-1715-48c1-ba1c-a19d8a1acfc0', 'A turboprop engine uses a gas turbine primarily to drive a propeller (through a reduction gearbox), with the propeller generating the majority of thrust — turboprops are generally more fuel-efficient than turbojets/turbofans at lower subsonic speeds and altitudes, commonly used on regional and cargo aircraft.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ef667733-581f-4517-9abf-76eb37ebc866', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 94, 'The ''specific impulse'' of a rocket engine is a measure of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c382bf64-b471-449f-bbca-525ee8476544', 'ef667733-581f-4517-9abf-76eb37ebc866', 0, 'The rocket''s total weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66a8e8af-ecd5-413b-9f71-cf77a5ff0eab', 'ef667733-581f-4517-9abf-76eb37ebc866', 1, 'The efficiency of a rocket propulsion system — the thrust produced per unit weight (or mass) flow rate of propellant consumed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a37f1bba-4a9e-4a67-a793-b44457a76412', 'ef667733-581f-4517-9abf-76eb37ebc866', 2, 'The rocket''s maximum altitude only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d419be9-885d-4f49-a1f7-db583b6098bd', 'ef667733-581f-4517-9abf-76eb37ebc866', 3, 'The color/visibility of the exhaust plume');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ef667733-581f-4517-9abf-76eb37ebc866', '66a8e8af-ecd5-413b-9f71-cf77a5ff0eab', 'Specific impulse (Isp) measures the efficiency of a rocket propulsion system, expressed as the thrust generated per unit weight (or mass) flow rate of propellant consumed — a higher specific impulse indicates a more propellant-efficient engine for a given thrust level.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('90f881ac-6885-42c3-8c0f-cbe3ee45e919', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 95, 'A ramjet engine, unlike a turbojet, has:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d624fbf-9930-4583-9660-bd3c96edb342', '90f881ac-6885-42c3-8c0f-cbe3ee45e919', 0, 'A conventional rotating compressor and turbine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aacf0a90-1a30-4421-b538-956371ad3503', '90f881ac-6885-42c3-8c0f-cbe3ee45e919', 1, 'No rotating compressor — it relies entirely on the aircraft''s forward speed (ram effect) to compress incoming air, making it only functional above a minimum airspeed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1c27b8c-378d-45da-bb5a-c81e8ba2e734', '90f881ac-6885-42c3-8c0f-cbe3ee45e919', 2, 'No combustion chamber at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ebb3bf2-ea4a-4df4-8d19-5eddba08e046', '90f881ac-6885-42c3-8c0f-cbe3ee45e919', 3, 'The ability to generate thrust while stationary on the ground');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('90f881ac-6885-42c3-8c0f-cbe3ee45e919', 'aacf0a90-1a30-4421-b538-956371ad3503', 'A ramjet has no rotating compressor or turbine — it relies entirely on the vehicle''s own forward speed to ram (compress) incoming air before combustion, meaning a ramjet cannot generate static thrust and requires the vehicle to already be moving at a substantial speed (typically supersonic) before it becomes functional.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fae9ef55-af0f-42c7-81af-19681da15489', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 96, 'In a gas turbine engine, the compressor''s primary function is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9dcaefb-a44f-490e-a5f7-7c589c6e2f26', 'fae9ef55-af0f-42c7-81af-19681da15489', 0, 'Cool the incoming air before combustion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1cf77202-f8f9-4c7f-a935-0dcc8c94b29a', 'fae9ef55-af0f-42c7-81af-19681da15489', 1, 'Increase the pressure (and consequently temperature) of the incoming air before it enters the combustion chamber');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37dbe7a9-4bce-462d-85c7-426b3aa5acc6', 'fae9ef55-af0f-42c7-81af-19681da15489', 2, 'Generate the primary thrust directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95286dcd-4233-463d-b6a6-1bc2484a4a7c', 'fae9ef55-af0f-42c7-81af-19681da15489', 3, 'Mix fuel with the exhaust gases');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fae9ef55-af0f-42c7-81af-19681da15489', '1cf77202-f8f9-4c7f-a935-0dcc8c94b29a', 'The compressor stage increases the pressure (and correspondingly the temperature) of incoming air before it enters the combustion chamber — higher pressure air allows more efficient combustion and greater overall engine thermal efficiency.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fbd39a56-6924-4278-a9b1-6a6a74fc6fca', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 97, '''Afterburning'' (or ''reheat'') in a jet engine involves:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39db3d08-5cf7-4d8c-b2f9-7a27a39f7799', 'fbd39a56-6924-4278-a9b1-6a6a74fc6fca', 0, 'Cooling the exhaust gases before they exit the nozzle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41f655dc-b013-4a11-b4ae-6ae208dd1071', 'fbd39a56-6924-4278-a9b1-6a6a74fc6fca', 1, 'Injecting and burning additional fuel directly in the exhaust stream (downstream of the turbine), significantly boosting thrust at the cost of much higher fuel consumption');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45d5d974-fab4-4812-94c1-19b6f04d6804', 'fbd39a56-6924-4278-a9b1-6a6a74fc6fca', 2, 'Shutting down the main combustion chamber entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ed00d9a-b005-42aa-bf4e-3146a9101280', 'fbd39a56-6924-4278-a9b1-6a6a74fc6fca', 3, 'Reducing the engine''s exhaust velocity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fbd39a56-6924-4278-a9b1-6a6a74fc6fca', '41f655dc-b013-4a11-b4ae-6ae208dd1071', 'Afterburning injects and combusts additional fuel directly in the hot exhaust stream (which still contains substantial unburnt oxygen after passing through the turbine), significantly boosting thrust for high-performance maneuvers or supersonic flight — at the cost of dramatically increased fuel consumption, making it typically used only for short durations.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ce16385f-debb-4f30-a4a8-f0442d68df8b', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 98, 'The ''bypass ratio'' of a turbofan engine refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78b28062-abe0-4083-a233-8d51ef7c2024', 'ce16385f-debb-4f30-a4a8-f0442d68df8b', 0, 'The ratio of fuel to air in the combustion chamber');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c38b552-575b-4901-8c5b-b88e5c47d7a0', 'ce16385f-debb-4f30-a4a8-f0442d68df8b', 1, 'The ratio of the mass flow rate of air bypassing the engine core to the mass flow rate of air passing through the core');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b049a963-8fe6-4e30-8ca8-74ab68ba9283', 'ce16385f-debb-4f30-a4a8-f0442d68df8b', 2, 'The ratio of thrust to weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30214a8b-e6d4-4c6b-a3ed-80f67327d22e', 'ce16385f-debb-4f30-a4a8-f0442d68df8b', 3, 'The ratio of engine diameter to length');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ce16385f-debb-4f30-a4a8-f0442d68df8b', '7c38b552-575b-4901-8c5b-b88e5c47d7a0', 'Bypass ratio is the ratio of the mass of air flowing around (bypassing) the engine core to the mass of air flowing through the core itself — high-bypass turbofans (common on commercial airliners) prioritize fuel efficiency and reduced noise, while low-bypass turbofans (common on fighter aircraft) prioritize higher specific thrust for high-speed performance.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6a2c0a07-4662-4561-a94a-98d5f8b0c783', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 99, 'A rocket engine, unlike an air-breathing jet engine, is capable of operating:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5e60451-f2d4-4a10-815f-7ba7f847b843', '6a2c0a07-4662-4561-a94a-98d5f8b0c783', 0, 'Only within the Earth''s atmosphere');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88bcfa89-a2fc-4c38-ab2c-056141d7f6f7', '6a2c0a07-4662-4561-a94a-98d5f8b0c783', 1, 'In the vacuum of space, since it carries its own oxidizer rather than relying on atmospheric oxygen for combustion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57ac868b-e141-4374-992a-0fdb4d3becf6', '6a2c0a07-4662-4561-a94a-98d5f8b0c783', 2, 'Only at subsonic speeds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27cea09d-cde0-4429-b823-6e21ad676190', '6a2c0a07-4662-4561-a94a-98d5f8b0c783', 3, 'Only while attached to a runway');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6a2c0a07-4662-4561-a94a-98d5f8b0c783', '88bcfa89-a2fc-4c38-ab2c-056141d7f6f7', 'A rocket engine carries its own oxidizer (rather than drawing oxygen from the surrounding atmosphere, as air-breathing jet engines do), allowing it to operate in the vacuum of space where no atmospheric oxygen is available — a fundamental distinction enabling rockets to power space launch vehicles beyond the atmosphere.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b21db470-59ec-4a52-9b05-65dd5ad975f3', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 100, '''Thrust-to-weight ratio'' of an aircraft or rocket is significant because it directly indicates:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a19d778-3dbe-4662-b527-463b12298af5', 'b21db470-59ec-4a52-9b05-65dd5ad975f3', 0, 'The vehicle''s fuel efficiency exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be675afe-ee20-4b93-92c7-0d90dfc4fa2b', 'b21db470-59ec-4a52-9b05-65dd5ad975f3', 1, 'The vehicle''s acceleration capability — a ratio greater than 1 (for a rocket) means the vehicle can accelerate vertically off the ground under its own power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cdf9982-2835-49b9-b49a-8a311b3957a1', 'b21db470-59ec-4a52-9b05-65dd5ad975f3', 2, 'The vehicle''s maximum passenger capacity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44293eea-463b-4269-a8a3-98d36f52fe43', 'b21db470-59ec-4a52-9b05-65dd5ad975f3', 3, 'The vehicle''s radar cross-section');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b21db470-59ec-4a52-9b05-65dd5ad975f3', 'be675afe-ee20-4b93-92c7-0d90dfc4fa2b', 'Thrust-to-weight ratio directly determines a vehicle''s acceleration capability — for a rocket specifically, a thrust-to-weight ratio greater than 1 is required to lift off vertically under its own power (thrust must exceed weight), and a higher ratio generally translates to superior acceleration and maneuverability performance for both aircraft and rockets.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('665ea3ca-402d-42f8-a5c5-579e0cf1b13d', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 101, 'The combustion chamber in a gas turbine engine is where:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8bd88ae3-d0c9-4054-aa1c-af00d4ab912c', '665ea3ca-402d-42f8-a5c5-579e0cf1b13d', 0, 'Air is compressed to its highest pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e025b34e-817e-4795-9f82-3986dc1a4d97', '665ea3ca-402d-42f8-a5c5-579e0cf1b13d', 1, 'Fuel is mixed with compressed air and ignited, producing high-temperature, high-energy gases that drive the turbine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b07a7266-2c38-4f3a-900d-5d511508990f', '665ea3ca-402d-42f8-a5c5-579e0cf1b13d', 2, 'The exhaust gases are cooled before release');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0079d41a-8bc4-43ce-ba06-5c4ddfc7efb4', '665ea3ca-402d-42f8-a5c5-579e0cf1b13d', 3, 'The propeller (if present) is mounted');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('665ea3ca-402d-42f8-a5c5-579e0cf1b13d', 'e025b34e-817e-4795-9f82-3986dc1a4d97', 'In the combustion chamber, fuel is injected into and mixed with the compressed air from the compressor stage, then ignited — the resulting high-temperature, high-energy combustion gases expand through the turbine (extracting energy to drive the compressor) before exiting through the exhaust nozzle to generate thrust.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e0dd9954-19aa-4cf5-af9c-77df1dd0fe6f', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 102, 'A ''solid propellant'' rocket motor, compared to a liquid propellant rocket engine, generally offers:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5fbfb3c-7e24-452a-865b-70aab79a846e', 'e0dd9954-19aa-4cf5-af9c-77df1dd0fe6f', 0, 'The ability to be throttled or shut down and restarted easily mid-flight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('071584db-d15e-4d75-afca-de64e6eabb4c', 'e0dd9954-19aa-4cf5-af9c-77df1dd0fe6f', 1, 'Simpler design and storage (propellant is pre-mixed in solid form), but typically cannot be throttled or shut down once ignited');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa79b1f3-844c-43b4-98a9-1a0ad3169c4f', 'e0dd9954-19aa-4cf5-af9c-77df1dd0fe6f', 2, 'Higher specific impulse in every case than liquid propellants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b4ef395-bfcd-4b1a-a0d5-112f6d8de768', 'e0dd9954-19aa-4cf5-af9c-77df1dd0fe6f', 3, 'The requirement for complex turbopump machinery');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e0dd9954-19aa-4cf5-af9c-77df1dd0fe6f', '071584db-d15e-4d75-afca-de64e6eabb4c', 'Solid propellant rockets offer simpler design, storage, and handling (the propellant is a pre-mixed solid grain), but generally cannot be throttled, shut down, or restarted once ignited — unlike many liquid propellant engines, which can offer more precise thrust control at the cost of greater system complexity (pumps, valves, separate fuel/oxidizer tanks).', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5e39ee25-1174-48b9-a21b-9058a418360a', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 103, 'The ''nozzle'' of a jet or rocket engine is primarily designed to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c7e087a-10e3-4261-8171-854e72aa0e96', '5e39ee25-1174-48b9-a21b-9058a418360a', 0, 'Slow down and compress the exhaust gases before release');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81280aac-4909-4801-b23d-8fb185beaaf7', '5e39ee25-1174-48b9-a21b-9058a418360a', 1, 'Accelerate and expand the high-pressure combustion gases to high exhaust velocity, converting thermal/pressure energy into kinetic energy (thrust)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3a4317d-abbc-4fdf-a0a2-133e4981ca9d', '5e39ee25-1174-48b9-a21b-9058a418360a', 2, 'Cool the engine''s internal components only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1fa81e71-bd21-4afc-aac0-db2bdf07166f', '5e39ee25-1174-48b9-a21b-9058a418360a', 3, 'Mix fuel and air before combustion');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5e39ee25-1174-48b9-a21b-9058a418360a', '81280aac-4909-4801-b23d-8fb185beaaf7', 'The exhaust nozzle accelerates and expands the high-pressure, high-temperature combustion gases as they exit the engine, converting thermal and pressure energy into kinetic energy (high exhaust velocity) — this accelerated exhaust mass flow is what directly generates the reaction thrust force.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('142cf1d0-492a-4123-8467-be5e36c40a9b', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 104, '''Chemical propellants'' used in most conventional rockets release energy through:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ae7b634-0d2a-4e97-8f02-b5f6721d4acf', '142cf1d0-492a-4123-8467-be5e36c40a9b', 0, 'Nuclear fission reactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8c80df0-48ac-467a-a74f-74d96084a190', '142cf1d0-492a-4123-8467-be5e36c40a9b', 1, 'An exothermic (heat-releasing) chemical combustion reaction between a fuel and an oxidizer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44ad51ab-a2ad-489f-93cb-664f755c6021', '142cf1d0-492a-4123-8467-be5e36c40a9b', 2, 'Purely mechanical (non-chemical) means');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba7fdfee-7974-489d-aadb-71e8854e2c7d', '142cf1d0-492a-4123-8467-be5e36c40a9b', 3, 'Solar radiation absorption exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('142cf1d0-492a-4123-8467-be5e36c40a9b', 'c8c80df0-48ac-467a-a74f-74d96084a190', 'Conventional chemical rocket propellants generate thrust energy through an exothermic combustion reaction between a fuel and an oxidizer, releasing large amounts of heat energy that is converted into high-velocity exhaust gas — distinct from alternative propulsion concepts like nuclear-thermal or ion propulsion.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a97d41f1-cc4f-4214-a392-cec0a67613f8', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 105, 'The ''compressor stall'' or ''surge'' phenomenon in a gas turbine engine refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a3ac754-aca1-410f-a858-2020702b9f36', 'a97d41f1-cc4f-4214-a392-cec0a67613f8', 0, 'Normal, expected engine shutdown at the end of a flight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6dd53fd-b001-4be0-a52f-7f307435ebc6', 'a97d41f1-cc4f-4214-a392-cec0a67613f8', 1, 'An aerodynamic instability where airflow through the compressor breaks down, potentially causing a loud bang, loss of thrust, and possible engine damage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('befb49d2-8651-4628-9dfd-c51e20bf0b0e', 'a97d41f1-cc4f-4214-a392-cec0a67613f8', 2, 'The engine achieving maximum rated thrust efficiently');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1df2f70-892a-415a-b6a7-a3149982acb3', 'a97d41f1-cc4f-4214-a392-cec0a67613f8', 3, 'A planned engine maintenance procedure');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a97d41f1-cc4f-4214-a392-cec0a67613f8', 'f6dd53fd-b001-4be0-a52f-7f307435ebc6', 'Compressor stall/surge is an aerodynamic instability where the smooth airflow through the compressor stages breaks down (often triggered by disturbed inlet airflow, rapid throttle changes, or foreign object damage), potentially causing a loud bang, momentary loss of thrust, engine vibration, and in severe cases, mechanical damage — a serious operational and safety concern actively managed by engine control systems.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('29168e80-aaeb-48e5-89c0-5dbddb1de153', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 106, '''Static stability'' of an aircraft refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64782d6b-8ee8-4956-ae3c-b06a9951ea6a', '29168e80-aaeb-48e5-89c0-5dbddb1de153', 0, 'The aircraft''s tendency to return toward its original equilibrium condition immediately after a disturbance, without regard to the subsequent motion path');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a88bfbf-6123-4734-9416-d48acdec821b', '29168e80-aaeb-48e5-89c0-5dbddb1de153', 1, 'The aircraft''s total weight remaining constant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3dafb783-9a79-484b-b1dd-5183fc960d6c', '29168e80-aaeb-48e5-89c0-5dbddb1de153', 2, 'The pilot''s physical stability in the cockpit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9cec9bfa-fd22-4fbe-b41a-6d872ab96ecf', '29168e80-aaeb-48e5-89c0-5dbddb1de153', 3, 'The aircraft''s radar signature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('29168e80-aaeb-48e5-89c0-5dbddb1de153', '64782d6b-8ee8-4956-ae3c-b06a9951ea6a', 'Static stability describes the initial tendency of an aircraft to move back toward its original equilibrium (trimmed) condition immediately following a disturbance — it says nothing about the subsequent oscillatory motion (which is instead described by dynamic stability).', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c36efe14-be60-43c6-9082-965fd42f1b8e', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 107, '''Dynamic stability'' of an aircraft, as distinct from static stability, describes:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37663ef8-de8c-43af-a2c7-7e4467a2d630', 'c36efe14-be60-43c6-9082-965fd42f1b8e', 0, 'Only the initial tendency to return toward equilibrium after a disturbance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d6f02e0-44f5-46dc-ab2a-e17b61dd1fd6', 'c36efe14-be60-43c6-9082-965fd42f1b8e', 1, 'The time-history of the aircraft''s motion following a disturbance — whether oscillations grow, decay, or remain constant over time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46616beb-b3dc-41d9-af35-555d93374d2a', 'c36efe14-be60-43c6-9082-965fd42f1b8e', 2, 'The aircraft''s maximum takeoff weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d6ea55f-a2f1-4cc9-a1c6-d7c917a0579c', 'c36efe14-be60-43c6-9082-965fd42f1b8e', 3, 'The color scheme of the aircraft');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c36efe14-be60-43c6-9082-965fd42f1b8e', '1d6f02e0-44f5-46dc-ab2a-e17b61dd1fd6', 'Dynamic stability describes the complete time-history of an aircraft''s motion following a disturbance — a statically stable aircraft can still be dynamically unstable if its oscillations grow in amplitude over time, even though it initially tends back toward equilibrium at each moment.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('63cddd5f-94da-4f88-baa6-4dde3c7ad88a', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 108, 'The three primary axes of rotation for an aircraft in flight are:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9ea6491-3c41-4df9-b1a0-0358cf21040e', '63cddd5f-94da-4f88-baa6-4dde3c7ad88a', 0, 'Vertical, Horizontal, Diagonal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('902b4d96-67fe-40dc-ab94-065bd8d98118', '63cddd5f-94da-4f88-baa6-4dde3c7ad88a', 1, 'Longitudinal (roll), Lateral (pitch), Vertical (yaw)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('654d942f-2d5a-44b7-bdfa-583193d451f5', '63cddd5f-94da-4f88-baa6-4dde3c7ad88a', 2, 'North-South, East-West, Up-Down only, with no rotational meaning');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c27b925e-1ad0-4fc8-8a5b-00605bcd256a', '63cddd5f-94da-4f88-baa6-4dde3c7ad88a', 3, 'Forward, Backward, Sideways');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('63cddd5f-94da-4f88-baa6-4dde3c7ad88a', '902b4d96-67fe-40dc-ab94-065bd8d98118', 'An aircraft''s three axes of rotation are: the longitudinal axis (nose to tail, rotation about it is roll), the lateral axis (wingtip to wingtip, rotation about it is pitch), and the vertical axis (top to bottom, rotation about it is yaw) — controlled primarily by ailerons, elevator, and rudder respectively.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9544438f-642f-4d32-977a-b8ec55871b4c', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 109, 'The ''aileron'' control surface is primarily used to control:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55fcbc59-cbda-43a9-a2c4-8f89698120c8', '9544438f-642f-4d32-977a-b8ec55871b4c', 0, 'Pitch');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('71a625f5-6b0d-46b7-8f6a-da889b9bbbb6', '9544438f-642f-4d32-977a-b8ec55871b4c', 1, 'Roll (rotation about the longitudinal axis)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b83c157-5007-4c80-9de3-96e621c93641', '9544438f-642f-4d32-977a-b8ec55871b4c', 2, 'Yaw');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60e4cf83-581a-432d-a23c-921a973092b5', '9544438f-642f-4d32-977a-b8ec55871b4c', 3, 'Altitude directly, with no effect on roll');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9544438f-642f-4d32-977a-b8ec55871b4c', '71a625f5-6b0d-46b7-8f6a-da889b9bbbb6', 'Ailerons, located on the outer trailing edge of each wing and deflecting in opposite directions, primarily control roll (rotation about the longitudinal axis) by creating differential lift between the two wings.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('01cfd3e9-0a32-4a54-8668-bdc9b9324ffa', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 110, 'The ''elevator'' control surface, typically located on the horizontal stabilizer, is primarily used to control:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('437f595d-d353-4966-adcf-95a6c0bb4738', '01cfd3e9-0a32-4a54-8668-bdc9b9324ffa', 0, 'Roll');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('acb8ddd0-13d1-4034-bc8b-61623785f596', '01cfd3e9-0a32-4a54-8668-bdc9b9324ffa', 1, 'Pitch (rotation about the lateral axis)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb24947b-bdb0-4eab-a0e1-ad8e483dd299', '01cfd3e9-0a32-4a54-8668-bdc9b9324ffa', 2, 'Yaw');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09681530-c1d3-4b5a-ad7d-7efd9d235d04', '01cfd3e9-0a32-4a54-8668-bdc9b9324ffa', 3, 'Engine thrust directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('01cfd3e9-0a32-4a54-8668-bdc9b9324ffa', 'acb8ddd0-13d1-4034-bc8b-61623785f596', 'The elevator, typically located on the trailing edge of the horizontal stabilizer, controls pitch (rotation about the lateral axis) — deflecting it changes the tail''s lift, causing the nose to pitch up or down.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4da9825c-4819-40f4-a1ab-2f2de95e25c7', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 111, 'The ''rudder'' control surface, typically located on the vertical stabilizer, is primarily used to control:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('254873c2-2120-4a96-9adf-d8b8f3cb285a', '4da9825c-4819-40f4-a1ab-2f2de95e25c7', 0, 'Pitch');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f67944f-bec1-4eca-a5a2-9935d986b97c', '4da9825c-4819-40f4-a1ab-2f2de95e25c7', 1, 'Roll');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e3f2e98-f26c-45e6-9e0b-e34b39f0e767', '4da9825c-4819-40f4-a1ab-2f2de95e25c7', 2, 'Yaw (rotation about the vertical axis)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f546f0e-a640-4ca4-a7ec-0d2188ccb634', '4da9825c-4819-40f4-a1ab-2f2de95e25c7', 3, 'Airspeed directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4da9825c-4819-40f4-a1ab-2f2de95e25c7', '2e3f2e98-f26c-45e6-9e0b-e34b39f0e767', 'The rudder, located on the trailing edge of the vertical stabilizer, controls yaw (rotation about the vertical axis) — commonly used in coordination with ailerons during turns, and for directional control during crosswind takeoffs/landings.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('888c3ff1-1196-4b98-849f-f9ee0a4da749', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 112, 'A positive ''dihedral'' wing configuration (wingtips angled upward relative to the wing root) primarily contributes to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27311b01-f8ec-440d-a2fa-dae6071a6ac3', '888c3ff1-1196-4b98-849f-f9ee0a4da749', 0, 'Reduced roll stability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf091f95-274e-4d1e-92a9-513293c9946a', '888c3ff1-1196-4b98-849f-f9ee0a4da749', 1, 'Improved lateral (roll) stability, since a sideslip generates a restoring rolling moment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b04cb10-4ca7-49d6-89b8-5568e405d6be', '888c3ff1-1196-4b98-849f-f9ee0a4da749', 2, 'Increased engine efficiency directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6645f96d-ba01-4509-97fb-90db5e3ec6b4', '888c3ff1-1196-4b98-849f-f9ee0a4da749', 3, 'Reduced structural strength');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('888c3ff1-1196-4b98-849f-f9ee0a4da749', 'cf091f95-274e-4d1e-92a9-513293c9946a', 'Positive dihedral (wingtips angled upward) improves lateral (roll) stability — when the aircraft sideslips (e.g., due to a disturbance), the lower wing generates relatively more lift than the upper wing due to the dihedral angle, creating a restoring rolling moment back toward level flight.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b150a06c-9ad8-4400-a72b-dc12e38f3ce3', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 113, '''Trim'' controls on an aircraft are used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cc8d09d-21aa-41c3-8517-511078d94f04', 'b150a06c-9ad8-4400-a72b-dc12e38f3ce3', 0, 'Permanently lock the flight controls in a fixed position with no adjustment possible');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3aefada-62f6-48f1-bf66-f04d308c5f36', 'b150a06c-9ad8-4400-a72b-dc12e38f3ce3', 1, 'Adjust and hold a desired steady-state flight condition (e.g., level flight) without requiring the pilot to continuously apply manual control pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e4ce618-24a7-44c2-bd27-b6dc8c169ba3', 'b150a06c-9ad8-4400-a72b-dc12e38f3ce3', 2, 'Increase the aircraft''s maximum speed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ca963c5-ea33-4d8c-8f33-a6b6c5dcd768', 'b150a06c-9ad8-4400-a72b-dc12e38f3ce3', 3, 'Control the cabin pressurization system');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b150a06c-9ad8-4400-a72b-dc12e38f3ce3', 'd3aefada-62f6-48f1-bf66-f04d308c5f36', 'Trim controls (commonly a trim tab or adjustable stabilizer) allow the pilot to establish and hold a desired steady-state flight condition without needing to continuously apply manual control force — reducing pilot workload and fatigue during sustained flight.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4fa6a644-3954-493b-a891-b25cab259447', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 114, 'The ''neutral point'' of an aircraft, in longitudinal stability analysis, is significant because:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4899f677-7fdb-461d-a270-1a0d477d0be8', '4fa6a644-3954-493b-a891-b25cab259447', 0, 'It has no relevance to stability whatsoever');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2633ac85-2634-46c4-8bd7-faadc1c94646', '4fa6a644-3954-493b-a891-b25cab259447', 1, 'The center of gravity''s position relative to the neutral point determines the aircraft''s static longitudinal stability margin — CG ahead of the neutral point is generally required for positive static stability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6cfd401f-e085-4731-9d14-eecd249f1e57', '4fa6a644-3954-493b-a891-b25cab259447', 2, 'It is always located at the aircraft''s nose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d7fe242-974a-4125-bc46-0d3c44db0e1c', '4fa6a644-3954-493b-a891-b25cab259447', 3, 'It changes the aircraft''s paint scheme requirements');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4fa6a644-3954-493b-a891-b25cab259447', '2633ac85-2634-46c4-8bd7-faadc1c94646', 'The neutral point is the center-of-gravity location at which the aircraft would have neutral (zero) static longitudinal stability — for positive static stability, the actual center of gravity must be positioned ahead of the neutral point, and the distance between them (as a fraction of the mean aerodynamic chord) defines the static margin.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('835065b3-8fcc-41b4-8649-e5b81c9c4bc2', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 115, '''Adverse yaw'', experienced during a coordinated turn using ailerons alone, refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee74eaed-99ee-4c37-9af1-5de2bb47a50b', '835065b3-8fcc-41b4-8649-e5b81c9c4bc2', 0, 'The aircraft yawing in the same direction as the intended roll, with no rudder correction needed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21d0df38-83ea-4eeb-a633-dcaf4423e722', '835065b3-8fcc-41b4-8649-e5b81c9c4bc2', 1, 'The aircraft initially yawing opposite to the direction of the intended roll/turn, due to differential drag between the up-going and down-going aileron');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd6e4a96-cf30-4293-a26a-e0b56f01ebba', '835065b3-8fcc-41b4-8649-e5b81c9c4bc2', 2, 'A complete loss of yaw control');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e55739cc-f49a-4a94-b705-513e74257c46', '835065b3-8fcc-41b4-8649-e5b81c9c4bc2', 3, 'An engine malfunction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('835065b3-8fcc-41b4-8649-e5b81c9c4bc2', '21d0df38-83ea-4eeb-a633-dcaf4423e722', 'Adverse yaw occurs because the down-deflected aileron (on the wing rising during a roll) generates more induced drag than the up-deflected aileron on the opposite (descending) wing, causing the aircraft to initially yaw opposite to the intended turn direction — pilots typically apply coordinated rudder input to counteract this effect.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5a641426-845e-40a2-aa45-0d191fffe148', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 116, '''Load factor'' (measured in ''g'') during a maneuver represents:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1bed6bf4-87cb-4d7c-a3c0-39f832a0f531', '5a641426-845e-40a2-aa45-0d191fffe148', 0, 'The aircraft''s total fuel weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ad8fac5-e44d-40b4-ac03-4621bbec7dde', '5a641426-845e-40a2-aa45-0d191fffe148', 1, 'The ratio of the lift (or total aerodynamic force) generated to the aircraft''s actual weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4612f70-7896-4f85-948f-9bde198380eb', '5a641426-845e-40a2-aa45-0d191fffe148', 2, 'The number of passengers aboard');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('652b0faa-11cf-4d02-8760-1f67a667ad50', '5a641426-845e-40a2-aa45-0d191fffe148', 3, 'The engine''s fuel flow rate');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5a641426-845e-40a2-aa45-0d191fffe148', '2ad8fac5-e44d-40b4-ac03-4621bbec7dde', 'Load factor is the ratio of the total lift (or aerodynamic load) generated to the aircraft''s actual weight, commonly expressed in units of ''g'' — a level, unaccelerated flight has a load factor of 1g, while a steep turn or pull-up maneuver can significantly increase the load factor, directly impacting structural loading.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7a05f6fd-b4a9-4473-b78a-9e45d5b1e9a9', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 117, 'The ''stall speed'' of an aircraft is the minimum speed at which:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fcab5736-4f3b-4c0f-adf6-d544c2f2135d', '7a05f6fd-b4a9-4473-b78a-9e45d5b1e9a9', 0, 'The aircraft achieves maximum fuel efficiency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d6ff16d-d7fc-40d0-bd19-a3264ca268a3', '7a05f6fd-b4a9-4473-b78a-9e45d5b1e9a9', 1, 'The wing can no longer generate sufficient lift to sustain level flight at the current angle of attack limit, before airflow separation occurs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('389fea0e-1ac4-48d6-844a-ce52c336ea71', '7a05f6fd-b4a9-4473-b78a-9e45d5b1e9a9', 2, 'The engines produce maximum thrust');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd201732-6ef6-4d77-8c06-8fb08fffe4e9', '7a05f6fd-b4a9-4473-b78a-9e45d5b1e9a9', 3, 'The landing gear must be extended');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7a05f6fd-b4a9-4473-b78a-9e45d5b1e9a9', '2d6ff16d-d7fc-40d0-bd19-a3264ca268a3', 'Stall speed is the minimum airspeed at which a wing can generate enough lift to sustain the aircraft''s weight in level flight before reaching the critical angle of attack and experiencing airflow separation (stall) — it varies with factors like aircraft weight, configuration (flaps), and load factor.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5f0ebe83-27a5-4ac0-91b0-86ed18ca2248', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 118, 'A ''spin'', a specific and potentially dangerous flight condition, is characterized by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d947d59-567e-4e48-b83f-f566100fa8a2', '5f0ebe83-27a5-4ac0-91b0-86ed18ca2248', 0, 'A controlled, coordinated turn at normal speed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5103192-6ca3-4b0d-a1c2-02dd61ac3ec1', '5f0ebe83-27a5-4ac0-91b0-86ed18ca2248', 1, 'An autorotational, stalled condition where the aircraft descends while rotating about a vertical axis, with one wing more deeply stalled than the other');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89459f28-15cd-412e-809b-66d4837c8d64', '5f0ebe83-27a5-4ac0-91b0-86ed18ca2248', 2, 'Level, unaccelerated cruise flight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a42f852e-141d-4f69-8e9a-aa11e699f3f9', '5f0ebe83-27a5-4ac0-91b0-86ed18ca2248', 3, 'Maximum-performance straight-line acceleration');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5f0ebe83-27a5-4ac0-91b0-86ed18ca2248', 'a5103192-6ca3-4b0d-a1c2-02dd61ac3ec1', 'A spin is a specific, autorotational flight condition combining a stall with a yaw rotation — one wing is more deeply stalled (generating less lift) than the other, causing the aircraft to rotate about a vertical axis while descending, requiring specific recovery technique distinct from standard stall recovery.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a82a3a91-fb8d-48f1-b0a8-da3253d1a207', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 119, '''Center of gravity'' (CG) limits are established for an aircraft primarily because:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('628bfbd1-dc6c-48fc-8e8c-67b2e54c9d72', 'a82a3a91-fb8d-48f1-b0a8-da3253d1a207', 0, 'CG position has no meaningful effect on aircraft handling or stability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9633e280-e9be-4b46-9f2f-e8522b631d6c', 'a82a3a91-fb8d-48f1-b0a8-da3253d1a207', 1, 'CG position significantly affects the aircraft''s static/dynamic stability, control effectiveness, and stall/spin characteristics — operating outside approved CG limits can cause dangerous handling');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('180c1e80-35ca-4144-801b-a77578ead6b4', 'a82a3a91-fb8d-48f1-b0a8-da3253d1a207', 2, 'CG limits are purely a cosmetic/regulatory formality with no real safety basis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27c84a28-4902-4b07-afaf-490837ed50da', 'a82a3a91-fb8d-48f1-b0a8-da3253d1a207', 3, 'CG only affects the aircraft''s paint durability');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a82a3a91-fb8d-48f1-b0a8-da3253d1a207', '9633e280-e9be-4b46-9f2f-e8522b631d6c', 'An aircraft''s center of gravity position significantly affects its longitudinal stability, control surface effectiveness, and stall/spin recovery characteristics — operating outside the manufacturer''s approved CG envelope (too far forward or aft) can result in dangerously degraded or unpredictable handling, which is why CG limits are strictly enforced through proper weight and balance calculations before every flight.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('456ddc53-3531-4996-b308-cde67735da4b', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 120, '''Phugoid'' motion, a characteristic long-period longitudinal dynamic mode of aircraft motion, involves:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0aa0e635-c115-4c63-9c92-955b51d9d672', '456ddc53-3531-4996-b308-cde67735da4b', 0, 'A rapid, high-frequency oscillation with negligible altitude change');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b19f3906-1b82-494e-8eae-72ee7d3684ba', '456ddc53-3531-4996-b308-cde67735da4b', 1, 'A slow, long-period oscillatory exchange between airspeed and altitude, with relatively constant angle of attack');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3f06d28-3db8-4cbc-a303-5f913b0f4cb3', '456ddc53-3531-4996-b308-cde67735da4b', 2, 'Only lateral (roll) motion, with no pitch involvement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32e2fbc8-4778-4b10-b2ed-5f9fa841dbcf', '456ddc53-3531-4996-b308-cde67735da4b', 3, 'A permanent, non-oscillatory divergence from trimmed flight');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('456ddc53-3531-4996-b308-cde67735da4b', 'b19f3906-1b82-494e-8eae-72ee7d3684ba', 'The phugoid mode is a slow, long-period longitudinal oscillation involving a gradual exchange between airspeed and altitude (climbing and slowing, then descending and speeding up, and repeating), while the angle of attack remains relatively constant throughout — distinct from the much faster, short-period pitch oscillation mode.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6dcb2b1a-376d-4cc3-83db-cf3bc1382fae', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 121, 'Aluminum alloys have historically been the dominant material for aircraft primary structures primarily due to their:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa106c24-3618-456d-9bed-f45e7b5f1d6d', '6dcb2b1a-376d-4cc3-83db-cf3bc1382fae', 0, 'Very high density, providing structural mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab5261f0-150e-48c3-a898-0d6982a099c1', '6dcb2b1a-376d-4cc3-83db-cf3bc1382fae', 1, 'Favorable strength-to-weight ratio, good fatigue properties, and established manufacturing/repair infrastructure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1970b407-3977-4bec-adde-cc3ab0489f14', '6dcb2b1a-376d-4cc3-83db-cf3bc1382fae', 2, 'Extremely high cost, ensuring exclusivity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04b78e88-9efe-4d6c-b1b7-33abb5dbe759', '6dcb2b1a-376d-4cc3-83db-cf3bc1382fae', 3, 'Complete immunity to corrosion, requiring no protective treatment');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6dcb2b1a-376d-4cc3-83db-cf3bc1382fae', 'ab5261f0-150e-48c3-a898-0d6982a099c1', 'Aluminum alloys have dominated aircraft structures historically due to their favorable strength-to-weight ratio, generally good fatigue characteristics, and well-established, mature manufacturing and repair infrastructure — though they do require corrosion protection (unlike the incorrect claim of complete immunity) and are increasingly being supplemented or replaced by composites in modern designs.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1eb609c9-48c8-48ec-9e0e-6cca56938267', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 122, 'Titanium alloys, used selectively in aircraft (particularly engine components and high-temperature areas), are valued for their:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8edfd8c1-59cc-411b-ab60-689a70c8937d', '1eb609c9-48c8-48ec-9e0e-6cca56938267', 0, 'Very low melting point, unsuitable for hot sections');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2de026c5-d99a-4b3b-a97b-bb90ba11397c', '1eb609c9-48c8-48ec-9e0e-6cca56938267', 1, 'High strength-to-weight ratio combined with excellent high-temperature performance and corrosion resistance, at a higher cost than aluminum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05870f82-2a7b-4383-b74d-eef4f6bd57c3', '1eb609c9-48c8-48ec-9e0e-6cca56938267', 2, 'Extremely low cost compared to aluminum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b46903a2-8780-4ffc-991d-2ed3f6a34936', '1eb609c9-48c8-48ec-9e0e-6cca56938267', 3, 'Complete lack of any structural strength');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1eb609c9-48c8-48ec-9e0e-6cca56938267', '2de026c5-d99a-4b3b-a97b-bb90ba11397c', 'Titanium alloys offer a high strength-to-weight ratio combined with excellent performance at elevated temperatures and good corrosion resistance — valuable properties for engine components and high-temperature airframe areas, though titanium is generally more expensive and more difficult to machine than aluminum.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f4cfaccd-5410-41de-b695-1c6d48291581', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 123, 'Carbon Fiber Reinforced Polymer (CFRP) composites, increasingly used in modern aircraft (e.g., Boeing 787, Airbus A350), consist of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3edff394-f712-4ef8-b125-fd1b9dfb660f', 'f4cfaccd-5410-41de-b695-1c6d48291581', 0, 'Pure carbon with no other material');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2cf2ea4f-fbbc-4809-b4f5-830778ce38ec', 'f4cfaccd-5410-41de-b695-1c6d48291581', 1, 'Carbon fibers embedded in a polymer (resin) matrix, combining the fiber''s high strength/stiffness with the matrix''s ability to transfer load and provide shape');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ba39d73-8d9a-4bf7-93bf-75731b34da70', 'f4cfaccd-5410-41de-b695-1c6d48291581', 2, 'A type of aluminum alloy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bcb962aa-b95a-49be-aad9-cb2ac119f8db', 'f4cfaccd-5410-41de-b695-1c6d48291581', 3, 'Pure steel wire mesh');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f4cfaccd-5410-41de-b695-1c6d48291581', '2cf2ea4f-fbbc-4809-b4f5-830778ce38ec', 'CFRP composites consist of high-strength, high-stiffness carbon fibers embedded within a polymer (typically epoxy) resin matrix — the fibers carry the primary structural load, while the matrix binds the fibers together, transfers load between them, and maintains the overall structural shape.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ca084a9d-e5b2-4109-bace-269553d62a3e', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 124, '''Anisotropic'' material behavior, characteristic of composite materials, means the material''s properties:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f737476-73e6-444a-8bea-ce5f1e59cea7', 'ca084a9d-e5b2-4109-bace-269553d62a3e', 0, 'Are identical in all directions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e934c09-807a-4de4-a68f-2e243ec9acd3', 'ca084a9d-e5b2-4109-bace-269553d62a3e', 1, 'Vary depending on the direction of measurement/loading, unlike an ''isotropic'' material like most metals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86297428-411d-434e-bff6-ff5e72492a9e', 'ca084a9d-e5b2-4109-bace-269553d62a3e', 2, 'Cannot be measured at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd98ac63-c6d3-49f8-b5c8-bc64f517c35f', 'ca084a9d-e5b2-4109-bace-269553d62a3e', 3, 'Only apply at very low temperatures');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ca084a9d-e5b2-4109-bace-269553d62a3e', '0e934c09-807a-4de4-a68f-2e243ec9acd3', 'Anisotropic materials (like fiber-reinforced composites) exhibit properties (strength, stiffness) that vary significantly depending on direction — a composite is typically much stronger along the fiber direction than perpendicular to it — unlike an isotropic material (like most bulk metals), whose properties are essentially uniform in all directions.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f3b6843a-938f-4d2b-9a6e-4b50b5a2e5d1', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 125, 'Heat treatment processes (like annealing and age-hardening) applied to aluminum aircraft alloys are used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0955255-f336-4f8d-b01d-88a52a91d8c8', 'f3b6843a-938f-4d2b-9a6e-4b50b5a2e5d1', 0, 'Permanently weaken the material for easier disposal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('105ee52b-2c31-4a82-9a61-f4d52bf4d338', 'f3b6843a-938f-4d2b-9a6e-4b50b5a2e5d1', 1, 'Optimize the alloy''s mechanical properties (strength, hardness, ductility) for its specific structural application');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('829e0f2b-a60f-4fb8-84a3-b0484ded0d22', 'f3b6843a-938f-4d2b-9a6e-4b50b5a2e5d1', 2, 'Change the material''s chemical composition entirely, adding new elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f33c963-7540-4f09-9f56-595268a0a6de', 'f3b6843a-938f-4d2b-9a6e-4b50b5a2e5d1', 3, 'Reduce the material''s weight without any strength implications');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f3b6843a-938f-4d2b-9a6e-4b50b5a2e5d1', '105ee52b-2c31-4a82-9a61-f4d52bf4d338', 'Heat treatment processes (like solution heat treatment followed by age-hardening/precipitation hardening for many aluminum alloys) are used to optimize the alloy''s mechanical properties for its specific application — significantly influencing strength, hardness, and ductility without changing the base chemical composition.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4798777a-adde-46b9-855e-eb817eb8c0cf', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 126, '''Stress corrosion cracking'', a specific material degradation mechanism relevant to aircraft structures, occurs due to the combined effect of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0990a34d-8f26-4ec7-8fca-31d08b0c5937', '4798777a-adde-46b9-855e-eb817eb8c0cf', 0, 'Temperature alone, with no chemical or mechanical factor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32076fdf-b950-4fcd-9293-82081d48cfba', '4798777a-adde-46b9-855e-eb817eb8c0cf', 1, 'Sustained tensile stress AND a corrosive environment acting together, causing crack initiation and growth at stress levels below what would cause failure from either factor alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4f7fe6c-0523-4abd-98fb-48764ad89a2f', '4798777a-adde-46b9-855e-eb817eb8c0cf', 2, 'Only mechanical fatigue, with no corrosive element');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c0fc719-0289-4381-ac41-51da14d6ebea', '4798777a-adde-46b9-855e-eb817eb8c0cf', 3, 'Excessive lubrication');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4798777a-adde-46b9-855e-eb817eb8c0cf', '32076fdf-b950-4fcd-9293-82081d48cfba', 'Stress corrosion cracking results from the combined, simultaneous effect of sustained tensile stress and a corrosive environment — cracks can initiate and propagate at stress levels significantly below what would cause failure from either mechanical stress or corrosion acting alone, making it a particularly insidious failure mode requiring careful material selection and design consideration.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4d5e18c4-80a9-41dc-b626-e9f44a4ec614', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 127, 'Magnesium alloys, though offering an even lower density than aluminum, see more limited use in aircraft structures primarily due to their:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ff01c77-7af6-4059-befb-da1a66d0d477', '4d5e18c4-80a9-41dc-b626-e9f44a4ec614', 0, 'Excessively high cost only, with no other concerns');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0204dadc-1f91-4cf9-b920-27655ae890f9', '4d5e18c4-80a9-41dc-b626-e9f44a4ec614', 1, 'Relatively poor corrosion resistance and higher flammability risk compared to aluminum alloys');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c254c2e0-fa7b-4644-827f-f40653e3dad3', '4d5e18c4-80a9-41dc-b626-e9f44a4ec614', 2, 'Complete lack of any structural strength');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7553a093-b8e2-4510-aef2-0d15d5c976d3', '4d5e18c4-80a9-41dc-b626-e9f44a4ec614', 3, 'Inability to be manufactured into any useful shape');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4d5e18c4-80a9-41dc-b626-e9f44a4ec614', '0204dadc-1f91-4cf9-b920-27655ae890f9', 'While magnesium alloys offer even lower density than aluminum (attractive for weight reduction), their relatively poor corrosion resistance and higher flammability risk have historically limited their broader structural use in aircraft, restricting them to more selective, carefully-managed applications.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ef329caa-5fc9-479f-8b0e-c75d009323d6', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 128, 'A ''sandwich structure'' (or sandwich panel), commonly used in aircraft secondary structures, consists of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c853646-7db6-4fa4-865b-4363c2c059dc', 'ef329caa-5fc9-479f-8b0e-c75d009323d6', 0, 'A single solid material with no internal layering');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76d68501-5c36-4a13-ae17-17aa07336d96', 'ef329caa-5fc9-479f-8b0e-c75d009323d6', 1, 'Two thin, stiff face sheets separated by and bonded to a lightweight core material (like honeycomb), providing high bending stiffness at low weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee152647-caa6-4072-8256-231d0de52973', 'ef329caa-5fc9-479f-8b0e-c75d009323d6', 2, 'A structure made entirely of foam with no facing material');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e369f74c-a74e-458d-86f9-ab52e1a39df4', 'ef329caa-5fc9-479f-8b0e-c75d009323d6', 3, 'A structure with no adhesive bonding at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ef329caa-5fc9-479f-8b0e-c75d009323d6', '76d68501-5c36-4a13-ae17-17aa07336d96', 'A sandwich structure consists of two thin, stiff face sheets (often aluminum or composite) bonded to and separated by a lightweight core material (commonly honeycomb or foam) — this configuration achieves high bending stiffness and strength at significantly lower weight than an equivalent solid structure, widely used in aircraft floors, control surfaces, and interior panels.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('046810c2-6dff-40c9-95b7-bdd88231605c', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 129, 'Non-destructive testing (NDT) methods, such as ultrasonic and eddy current inspection, are used on aircraft structures to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24ebfc7c-89dc-468b-86fe-49f5d3e6bba9', '046810c2-6dff-40c9-95b7-bdd88231605c', 0, 'Permanently destroy a component to determine its failure point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f8963e8-bee4-4519-af10-d9fac4ebca22', '046810c2-6dff-40c9-95b7-bdd88231605c', 1, 'Detect internal or surface defects (cracks, delamination, corrosion) without damaging or destroying the component being inspected');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3dc93ce8-7b0b-405b-a1c7-5cd2418d7f64', '046810c2-6dff-40c9-95b7-bdd88231605c', 2, 'Repaint aircraft surfaces');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef053f76-8e08-4b24-b1b5-f04f5ff526b0', '046810c2-6dff-40c9-95b7-bdd88231605c', 3, 'Only measure the aircraft''s overall weight');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('046810c2-6dff-40c9-95b7-bdd88231605c', '0f8963e8-bee4-4519-af10-d9fac4ebca22', 'Non-destructive testing methods (ultrasonic, eddy current, radiographic, dye penetrant, among others) allow inspectors to detect internal or surface defects — cracks, delamination in composites, corrosion — without damaging or destroying the component itself, a critical capability for ongoing aircraft structural maintenance and airworthiness verification.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c51144b7-f357-4d96-a55a-8b5ef058f372', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 130, '''Fiber orientation'' in a composite laminate structure is a critical design parameter because:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee9cf13f-1007-4929-ba46-c62e6869921f', 'c51144b7-f357-4d96-a55a-8b5ef058f372', 0, 'It has no effect on the laminate''s mechanical properties');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1185761-11ea-4a15-a43a-414114470081', 'c51144b7-f357-4d96-a55a-8b5ef058f372', 1, 'It directly determines the laminate''s directional strength and stiffness, since composites are anisotropic — engineers deliberately orient different fiber layers to match the actual expected loading directions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa207884-a556-44f5-97ca-88bb0d85a81f', 'c51144b7-f357-4d96-a55a-8b5ef058f372', 2, 'It only affects the laminate''s color');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20bc67fa-7b1e-4c94-a808-a24802dd55b9', 'c51144b7-f357-4d96-a55a-8b5ef058f372', 3, 'Fiber orientation is fixed and cannot be varied during manufacturing');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c51144b7-f357-4d96-a55a-8b5ef058f372', 'd1185761-11ea-4a15-a43a-414114470081', 'Because composite materials are inherently anisotropic (properties vary by direction), the orientation of fiber layers within a laminate is a critical, deliberately-engineered design parameter — different layers (plies) are oriented at different angles to provide strength and stiffness matched to the actual expected multi-directional loading the component will experience in service.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('dca32fcd-c400-4fe4-ab05-db3ec3bfba0e', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 131, 'An ''altimeter'', a standard cockpit flight instrument, measures:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('065f4270-13e0-4058-979b-0bfd3c613796', 'dca32fcd-c400-4fe4-ab05-db3ec3bfba0e', 0, 'The aircraft''s forward airspeed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b826c6e-6ad2-49f7-bdf4-9f7561e0a176', 'dca32fcd-c400-4fe4-ab05-db3ec3bfba0e', 1, 'The aircraft''s altitude, typically by sensing ambient atmospheric pressure and relating it to altitude via a standard reference');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ccb2eb9-ee4d-433b-a2dd-7691734f29a0', 'dca32fcd-c400-4fe4-ab05-db3ec3bfba0e', 2, 'The aircraft''s rate of turn');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('391fb29d-fb35-4f44-ab06-687b5bb0842e', 'dca32fcd-c400-4fe4-ab05-db3ec3bfba0e', 3, 'The engine''s rotational speed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dca32fcd-c400-4fe4-ab05-db3ec3bfba0e', '5b826c6e-6ad2-49f7-bdf4-9f7561e0a176', 'A standard pressure altimeter measures the aircraft''s altitude by sensing ambient atmospheric (static) pressure, which decreases predictably with increasing altitude, and displaying the corresponding altitude based on a reference pressure setting.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('68b1309d-8e0a-4f5e-8ead-59bf9e46d283', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 132, 'An ''airspeed indicator'' determines the aircraft''s speed by measuring:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd71b325-f6c8-49b9-a388-1d67896f5936', '68b1309d-8e0a-4f5e-8ead-59bf9e46d283', 0, 'The difference between total (pitot) pressure and static pressure (dynamic pressure)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5e27256-c3e7-4503-97a3-01e8437a9914', '68b1309d-8e0a-4f5e-8ead-59bf9e46d283', 1, 'The aircraft''s ground-referenced GPS position change only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77536d7d-d48d-4d76-8978-75867a73bcf0', '68b1309d-8e0a-4f5e-8ead-59bf9e46d283', 2, 'The engine''s fuel flow rate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('164a0cf4-bd6b-4747-aa10-3c134d1815e2', '68b1309d-8e0a-4f5e-8ead-59bf9e46d283', 3, 'The ambient outside air temperature only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('68b1309d-8e0a-4f5e-8ead-59bf9e46d283', 'bd71b325-f6c8-49b9-a388-1d67896f5936', 'An airspeed indicator measures dynamic pressure — the difference between total (pitot, ram-air) pressure and static (ambient) pressure — and converts this into a displayed airspeed value, following principles derived from Bernoulli''s equation.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a2b16e2a-9cf6-479f-90be-92ec30ae1a48', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 133, 'An ''attitude indicator'' (artificial horizon) provides the pilot with information about the aircraft''s:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7522bc2-7ea4-459e-bfa6-1972e77eb68b', 'a2b16e2a-9cf6-479f-90be-92ec30ae1a48', 0, 'Compass heading only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7decd380-b15b-4387-8d50-da418727fd1f', 'a2b16e2a-9cf6-479f-90be-92ec30ae1a48', 1, 'Pitch and bank (roll) orientation relative to the true horizon, especially critical in poor visibility conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a32a3d05-ee64-4171-81cf-efffa73d9d59', 'a2b16e2a-9cf6-479f-90be-92ec30ae1a48', 2, 'Fuel remaining');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad70598a-e60b-4005-8cb0-27ee753ef277', 'a2b16e2a-9cf6-479f-90be-92ec30ae1a48', 3, 'Cabin pressure altitude');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a2b16e2a-9cf6-479f-90be-92ec30ae1a48', '7decd380-b15b-4387-8d50-da418727fd1f', 'The attitude indicator (artificial horizon) displays the aircraft''s pitch and bank orientation relative to the true horizon, using a gyroscopically-stabilized reference — a critical instrument for maintaining spatial orientation and control, especially in instrument meteorological conditions (poor visibility) when the natural horizon isn''t visible.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('03c19447-2f59-4a95-8b3d-e902179c11f3', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 134, 'A ''gyroscope'', a core sensing element in many traditional aircraft instruments, exhibits the property of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e677f021-7d4f-48fa-b188-cf86f7bcc0d5', '03c19447-2f59-4a95-8b3d-e902179c11f3', 0, 'Rigidity in space — a spinning gyroscope resists changes to its axis of rotation, maintaining a fixed orientation reference');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c884085d-5370-492f-89b3-59fabc0f333f', '03c19447-2f59-4a95-8b3d-e902179c11f3', 1, 'Complete lack of any directional stability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6a7d7df-b63d-4d6e-9f5c-45ece5fa1705', '03c19447-2f59-4a95-8b3d-e902179c11f3', 2, 'Direct measurement of air pressure only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('985744f1-cd0f-47a4-abfb-c84c23a36798', '03c19447-2f59-4a95-8b3d-e902179c11f3', 3, 'Functioning only when the aircraft is stationary on the ground');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('03c19447-2f59-4a95-8b3d-e902179c11f3', 'e677f021-7d4f-48fa-b188-cf86f7bcc0d5', 'A gyroscope''s fundamental property of rigidity in space — a rapidly spinning rotor resists changes to its axis of rotation due to angular momentum — makes it a foundational sensing element for traditional instruments like the attitude indicator and heading indicator, providing a stable orientation reference independent of the aircraft''s own motion.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('50f0bd44-858c-4bc4-8402-f69a714abb54', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 135, '''INS'' (Inertial Navigation System), used for aircraft navigation independent of external signals, relies on:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d93ce7a8-eb84-4e41-8b58-62495edf8865', '50f0bd44-858c-4bc4-8402-f69a714abb54', 0, 'Continuous GPS satellite reception exclusively, with no independent sensing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c508840-37be-4088-968b-5664d1f8a5aa', '50f0bd44-858c-4bc4-8402-f69a714abb54', 1, 'Onboard accelerometers and gyroscopes to continuously calculate position, velocity, and orientation by integrating measured acceleration and rotation over time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4dcd77cd-ddbc-47cc-a002-3d09098adf04', '50f0bd44-858c-4bc4-8402-f69a714abb54', 2, 'Visual reference to ground landmarks only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57078c8e-3359-495b-8600-6946fc463716', '50f0bd44-858c-4bc4-8402-f69a714abb54', 3, 'Radio beacon triangulation exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('50f0bd44-858c-4bc4-8402-f69a714abb54', '2c508840-37be-4088-968b-5664d1f8a5aa', 'An Inertial Navigation System uses onboard accelerometers (measuring acceleration) and gyroscopes (measuring rotation), mathematically integrating these measurements over time to continuously calculate the aircraft''s position, velocity, and orientation — notably, this operates independently of any external signal (like GPS), though INS accuracy can drift over time and is often combined with GPS for improved accuracy in modern systems.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c90c776e-5868-4fa0-985e-94ac4c1cbfe9', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 136, 'A ''transponder'' aboard an aircraft is primarily used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ded8fbf-a4be-4d33-bd51-426cb1fffada', 'c90c776e-5868-4fa0-985e-94ac4c1cbfe9', 0, 'Generate lift electronically');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aca76a33-e86b-4153-90d3-879b9f29360c', 'c90c776e-5868-4fa0-985e-94ac4c1cbfe9', 1, 'Respond to air traffic control radar interrogation signals, transmitting identification and altitude information to aid air traffic surveillance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7df6adbb-a4ba-4ffb-981e-a6685c565f8f', 'c90c776e-5868-4fa0-985e-94ac4c1cbfe9', 2, 'Control the aircraft''s engines directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ac97413-98d3-4f1f-80cd-b55e04c99338', 'c90c776e-5868-4fa0-985e-94ac4c1cbfe9', 3, 'Provide cabin entertainment services');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c90c776e-5868-4fa0-985e-94ac4c1cbfe9', 'aca76a33-e86b-4153-90d3-879b9f29360c', 'A transponder responds automatically to radar interrogation signals from air traffic control ground stations, transmitting the aircraft''s assigned identification code and altitude information — a critical component of modern air traffic surveillance and collision avoidance systems.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('57e00425-df89-4409-8e03-e48967d5bcd6', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 137, '''Fly-by-wire'' flight control systems, used on many modern aircraft, replace traditional mechanical/hydraulic linkages with:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7380fe72-f4ba-4176-bc7c-d73d22066185', '57e00425-df89-4409-8e03-e48967d5bcd6', 0, 'No control system at all, relying purely on aerodynamic self-stability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed4cf7d5-0ebb-439a-a6e4-7ae333ff897c', '57e00425-df89-4409-8e03-e48967d5bcd6', 1, 'Electronic signals transmitted from the pilot''s controls to computers, which then command the actuators moving the control surfaces, often with computer-mediated flight envelope protection');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88718703-0540-4026-aa34-6a1e6e3205da', '57e00425-df89-4409-8e03-e48967d5bcd6', 2, 'Manual cables exclusively, with no electronic involvement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e4bde0e-7b00-4a69-8843-8fae0675bb83', '57e00425-df89-4409-8e03-e48967d5bcd6', 3, 'Purely mechanical gears with no wiring');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('57e00425-df89-4409-8e03-e48967d5bcd6', 'ed4cf7d5-0ebb-439a-a6e4-7ae333ff897c', 'Fly-by-wire systems replace direct mechanical/hydraulic linkages between the pilot''s controls and the control surfaces with electronic signals, processed by flight control computers that command the actual control surface actuators — often incorporating flight envelope protection to prevent the pilot from commanding maneuvers that would exceed the aircraft''s safe structural or aerodynamic limits.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2d3e38ba-d6db-4d7e-8303-a6633065c1e1', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 138, 'A ''weather radar'' system aboard commercial aircraft is primarily used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8f50eb6-19a6-4b34-a491-fe24367a5922', '2d3e38ba-d6db-4d7e-8303-a6633065c1e1', 0, 'Detect and display precipitation/storm cells ahead of the aircraft''s flight path, aiding in hazardous weather avoidance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08f03e7e-2cf6-47af-b86b-047fe3dcc719', '2d3e38ba-d6db-4d7e-8303-a6633065c1e1', 1, 'Measure the aircraft''s own airspeed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da9379a1-5aa6-44b9-8fe0-f7252348e995', '2d3e38ba-d6db-4d7e-8303-a6633065c1e1', 2, 'Detect other aircraft for collision avoidance purposes exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d2613c2-e5ae-4b38-a422-4f488924eb93', '2d3e38ba-d6db-4d7e-8303-a6633065c1e1', 3, 'Control cabin humidity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2d3e38ba-d6db-4d7e-8303-a6633065c1e1', 'b8f50eb6-19a6-4b34-a491-fe24367a5922', 'Airborne weather radar detects precipitation and storm activity ahead of the aircraft, displaying it to the flight crew to aid in identifying and navigating around hazardous weather like severe thunderstorms — distinct from a transponder-based collision avoidance system (like TCAS), which serves a different purpose.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0d495223-e258-4840-8484-11e6c46aa95e', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 139, 'A ''Flight Data Recorder'' (FDR, commonly part of the so-called ''black box'') is designed to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b68afe78-ddcf-4d53-b177-2b822edf90e5', '0d495223-e258-4840-8484-11e6c46aa95e', 0, 'Record cockpit audio conversations exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da06409c-3d69-4fd4-b9a8-e93ac17ed83f', '0d495223-e258-4840-8484-11e6c46aa95e', 1, 'Continuously record a wide range of aircraft flight parameters (altitude, airspeed, control positions, engine data, etc.) for accident investigation purposes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e7ad959-42a1-4fe3-a7cc-73499a1d3428', '0d495223-e258-4840-8484-11e6c46aa95e', 2, 'Control the aircraft''s autopilot system directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a96e33fe-972f-4feb-8d34-4c36ad115471', '0d495223-e258-4840-8484-11e6c46aa95e', 3, 'Store passenger entertainment content');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0d495223-e258-4840-8484-11e6c46aa95e', 'da06409c-3d69-4fd4-b9a8-e93ac17ed83f', 'The Flight Data Recorder continuously records a wide array of flight parameters — altitude, airspeed, heading, control surface positions, engine performance data — designed to survive severe accidents and provide critical data for accident investigation; it is distinct from (but often paired with) the Cockpit Voice Recorder, which separately records cockpit audio.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('09e8f425-4051-4367-9912-ef603bf1c7dd', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 140, '''TCAS'' (Traffic Collision Avoidance System) aboard an aircraft is designed to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9175857-bf8f-4cc9-ac6b-0e56c5053646', '09e8f425-4051-4367-9912-ef603bf1c7dd', 0, 'Automatically navigate the aircraft to its destination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6745715-acda-464e-9dc8-9d98660f2c3c', '09e8f425-4051-4367-9912-ef603bf1c7dd', 1, 'Detect nearby transponder-equipped aircraft and provide the crew with traffic advisories and, if necessary, resolution advisories to avoid a potential collision');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c42cbcc5-7b26-48e3-8fb0-05cd53914884', '09e8f425-4051-4367-9912-ef603bf1c7dd', 2, 'Monitor engine oil pressure exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd4d779c-fae8-4355-811a-44769008c10b', '09e8f425-4051-4367-9912-ef603bf1c7dd', 3, 'Control cabin lighting');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('09e8f425-4051-4367-9912-ef603bf1c7dd', 'a6745715-acda-464e-9dc8-9d98660f2c3c', 'TCAS monitors the airspace around an aircraft by interrogating nearby aircraft transponders, providing the flight crew with traffic advisories (awareness of nearby traffic) and, when a collision risk is detected, resolution advisories (specific vertical maneuvers) to maintain safe separation — an important layer of collision avoidance independent of ground-based air traffic control.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9f5f211a-7289-471c-88b0-66c894a52503', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 141, '''Escape velocity'' from a celestial body''s surface is defined as the minimum speed required for an object to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40a408d1-e8ff-48ba-ac14-96446c3ea875', '9f5f211a-7289-471c-88b0-66c894a52503', 0, 'Enter a stable circular orbit around that body');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('788fd61f-3b4f-49e8-bcb5-597a16c409ed', '9f5f211a-7289-471c-88b0-66c894a52503', 1, 'Escape the body''s gravitational field entirely, without any further propulsion, reaching an infinite distance with zero remaining kinetic energy at the limit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f31874b-4904-4bb1-9f29-2854861cb81f', '9f5f211a-7289-471c-88b0-66c894a52503', 2, 'Land safely on the body''s surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('783387af-d316-435f-9dad-629723d001cb', '9f5f211a-7289-471c-88b0-66c894a52503', 3, 'Achieve geostationary orbit specifically');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9f5f211a-7289-471c-88b0-66c894a52503', '788fd61f-3b4f-49e8-bcb5-597a16c409ed', 'Escape velocity is the minimum speed at which an object, launched with no further propulsion, has just enough kinetic energy to overcome the gravitational potential energy binding it to the body, allowing it to escape the gravitational field entirely (theoretically reaching infinite distance with zero remaining velocity).', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fdb08e48-8ab8-4b1b-a1d3-adc5d6c1a9bf', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 142, 'A ''geostationary orbit'' is characterized by an orbital period that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ef3a8fa-bddd-4b04-91a6-faa09e9246e8', 'fdb08e48-8ab8-4b1b-a1d3-adc5d6c1a9bf', 0, 'Is much shorter than Earth''s rotational period');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ea3e8a3-d9ac-4418-869f-f21287782fc1', 'fdb08e48-8ab8-4b1b-a1d3-adc5d6c1a9bf', 1, 'Exactly matches Earth''s rotational period (~24 hours), combined with a circular, equatorial orbit — causing the satellite to appear stationary relative to a fixed point on Earth''s surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be91a145-8c02-41f3-9f32-ffb7620cc9c7', 'fdb08e48-8ab8-4b1b-a1d3-adc5d6c1a9bf', 2, 'Constantly varies with no fixed pattern');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d14d7797-2360-46ce-9c51-c2037f392d21', 'fdb08e48-8ab8-4b1b-a1d3-adc5d6c1a9bf', 3, 'Only applies to polar orbits');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fdb08e48-8ab8-4b1b-a1d3-adc5d6c1a9bf', '6ea3e8a3-d9ac-4418-869f-f21287782fc1', 'A geostationary orbit specifically requires a circular, equatorial orbit with a period exactly matching Earth''s rotational period (~24 hours) — this combination causes the satellite to appear stationary relative to a fixed point on Earth''s surface, ideal for continuous, fixed-antenna communication and weather monitoring applications.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e828a837-6427-48aa-a6a3-49bbf6ff8483', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 143, 'Kepler''s First Law of planetary motion states that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79c08d1b-5741-429b-96aa-02fdb605a81b', 'e828a837-6427-48aa-a6a3-49bbf6ff8483', 0, 'Planets orbit in perfect circles around the Sun');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd2a31e4-57d9-444a-845b-bbf95a714813', 'e828a837-6427-48aa-a6a3-49bbf6ff8483', 1, 'A planet''s orbit around the Sun is an ellipse, with the Sun located at one of the two foci of that ellipse');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d1961ba-f897-48da-bd1b-39d6c89c20da', 'e828a837-6427-48aa-a6a3-49bbf6ff8483', 2, 'Planetary orbital speed is always constant throughout the orbit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7368fed-4a1f-45d7-a819-3c7d4ecc8739', 'e828a837-6427-48aa-a6a3-49bbf6ff8483', 3, 'Planets have no defined orbital path');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e828a837-6427-48aa-a6a3-49bbf6ff8483', 'bd2a31e4-57d9-444a-845b-bbf95a714813', 'Kepler''s First Law establishes that planetary orbits are ellipses, not perfect circles, with the Sun positioned at one focus of the ellipse (not at its geometric center) — a foundational, empirically-derived law of orbital mechanics.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8c3d4fc2-d002-49ee-b5ce-13c6353943fc', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 144, 'Kepler''s Second Law of planetary motion (the ''equal areas'' law) implies that an orbiting body moves:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8151695-8dff-4a23-af65-3cddf90a441f', '8c3d4fc2-d002-49ee-b5ce-13c6353943fc', 0, 'At a constant speed throughout its entire orbit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0d5dc83-1253-4b6c-abc2-61d596dd459c', '8c3d4fc2-d002-49ee-b5ce-13c6353943fc', 1, 'Faster when closer to the body it orbits (perihelion/perigee) and slower when farther away (aphelion/apogee)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('adea0d60-b687-4bfb-909f-cb62b68550a7', '8c3d4fc2-d002-49ee-b5ce-13c6353943fc', 2, 'Only in a straight line');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('128e5bb4-691a-4bc3-934f-d013ed467375', '8c3d4fc2-d002-49ee-b5ce-13c6353943fc', 3, 'At zero velocity at all points in the orbit');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8c3d4fc2-d002-49ee-b5ce-13c6353943fc', 'd0d5dc83-1253-4b6c-abc2-61d596dd459c', 'Kepler''s Second Law states that a line joining an orbiting body to the body it orbits sweeps out equal areas in equal time intervals — a direct consequence is that the orbiting body moves faster when closer to the central body (at perihelion for solar orbits, or perigee for Earth orbits) and slower when farther away (aphelion/apogee).', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cd8987e8-da39-4957-9ab5-f3ea273afe33', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 145, 'A ''Hohmann transfer orbit'', commonly used for spacecraft orbital maneuvers, is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('edd71f45-6032-439d-84cf-a5c1fd156305', 'cd8987e8-da39-4957-9ab5-f3ea273afe33', 0, 'A single continuous burn maintaining constant thrust throughout the entire transfer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fea573a9-9b5e-493e-9f3c-358fb9bf69b1', 'cd8987e8-da39-4957-9ab5-f3ea273afe33', 1, 'An efficient elliptical transfer orbit connecting two different circular orbits, using two separate engine burns (one at each end of the transfer ellipse)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4096590-649c-4045-bbea-062cbbd93c3a', 'cd8987e8-da39-4957-9ab5-f3ea273afe33', 2, 'Only usable for interplanetary travel, never for satellite orbit changes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17bfdecd-470e-4c71-9c56-1df800195275', 'cd8987e8-da39-4957-9ab5-f3ea273afe33', 3, 'A type of geostationary orbit specifically');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cd8987e8-da39-4957-9ab5-f3ea273afe33', 'fea573a9-9b5e-493e-9f3c-358fb9bf69b1', 'A Hohmann transfer orbit is a fuel-efficient elliptical transfer path connecting two circular orbits of different altitudes, using two brief engine burns — one at the initial orbit to enter the transfer ellipse, and a second at the target orbit''s altitude to circularize into the final desired orbit.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f7681828-4fa0-4407-a6b2-c8b606eddc7f', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 146, '''Low Earth Orbit'' (LEO), the orbital regime used by the International Space Station and many Earth observation satellites, is characterized by an altitude of approximately:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('653090c3-d80e-4e8a-8fb7-b1de4afbba05', 'f7681828-4fa0-4407-a6b2-c8b606eddc7f', 0, '160-2,000 km above Earth''s surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7938512-fdbf-42cc-ac98-dd2121aa1d34', 'f7681828-4fa0-4407-a6b2-c8b606eddc7f', 1, '35,786 km above Earth''s surface (geostationary altitude)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e3c1148-b18a-482d-b5fc-afd5514e4a6d', 'f7681828-4fa0-4407-a6b2-c8b606eddc7f', 2, '384,400 km (the distance to the Moon)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('057d04d7-3778-4b1b-92b6-ba9fd2da1001', 'f7681828-4fa0-4407-a6b2-c8b606eddc7f', 3, '1.5 million km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f7681828-4fa0-4407-a6b2-c8b606eddc7f', '653090c3-d80e-4e8a-8fb7-b1de4afbba05', 'Low Earth Orbit (LEO) typically spans altitudes of roughly 160 to 2,000 km above Earth''s surface — significantly lower than geostationary orbit (35,786 km), offering shorter orbital periods and closer proximity for applications like Earth observation and human spaceflight (e.g., the ISS orbits at roughly 400 km altitude).', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('77ea24d5-4bae-408d-a4ae-72cdd1942d11', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 147, 'A launch vehicle''s ''staging'' (discarding spent lower stages during ascent) is primarily done to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c495fb0-05e5-4ad0-8a21-e1cc76d5079d', '77ea24d5-4bae-408d-a4ae-72cdd1942d11', 0, 'Increase the vehicle''s total weight throughout the entire flight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f84b836-c39e-4f5a-94ae-daead22fdd6f', '77ea24d5-4bae-408d-a4ae-72cdd1942d11', 1, 'Reduce the vehicle''s mass as propellant is consumed, improving overall efficiency by not carrying the dead weight of empty, spent stages');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3db15ab3-9a70-428a-bd23-f40c438b3387', '77ea24d5-4bae-408d-a4ae-72cdd1942d11', 2, 'Slow the vehicle down deliberately');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69f0bfbc-b7b5-40f9-8c98-754fd143b8a5', '77ea24d5-4bae-408d-a4ae-72cdd1942d11', 3, 'Provide entertainment value with no functional purpose');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('77ea24d5-4bae-408d-a4ae-72cdd1942d11', '7f84b836-c39e-4f5a-94ae-daead22fdd6f', 'Staging discards spent lower stages (whose propellant has been consumed) during ascent, reducing the vehicle''s remaining mass — since carrying the dead weight of empty tanks and structure would otherwise waste propellant on subsequent stages, staging significantly improves overall vehicle efficiency and achievable payload capacity.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e97a2c8f-f401-4680-9aac-62187a0f6160', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 148, '''Microgravity'', the environment experienced by objects in orbit (like the International Space Station), occurs because:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1078a714-a146-4e57-b1e5-01730990a2f2', 'e97a2c8f-f401-4680-9aac-62187a0f6160', 0, 'Gravity is entirely absent at orbital altitudes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5e54db9-e825-4a98-8422-500f47c39db1', 'e97a2c8f-f401-4680-9aac-62187a0f6160', 1, 'The orbiting object and its contents are in continuous free-fall around the Earth, creating an apparent weightlessness even though gravity is still acting on them');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23b8a171-2339-47a5-8ce8-3239a8e7da87', 'e97a2c8f-f401-4680-9aac-62187a0f6160', 2, 'The object has somehow become massless');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('affc6851-b712-4cf7-96ec-4ddebacc67c7', 'e97a2c8f-f401-4680-9aac-62187a0f6160', 3, 'Orbital objects are shielded from gravity by the atmosphere');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e97a2c8f-f401-4680-9aac-62187a0f6160', 'c5e54db9-e825-4a98-8422-500f47c39db1', 'Microgravity (apparent weightlessness) occurs because an orbiting object is in continuous free-fall — falling toward Earth under gravity''s pull while simultaneously moving forward fast enough that it continuously ''misses'' the Earth, following a curved orbital path — Earth''s gravity at typical LEO altitudes is still nearly as strong as at the surface, it''s the state of continuous free-fall that creates the apparent weightlessness, not an actual absence of gravity.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c3678fd6-1bb9-4ecb-a086-f45e3ac17799', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 149, 'A ''polar orbit'', used by many Earth-observation and reconnaissance satellites, passes:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46defc52-d2df-4b5b-9542-e154b34fad37', 'c3678fd6-1bb9-4ecb-a086-f45e3ac17799', 0, 'Directly over or near the Earth''s poles on each orbit, allowing the satellite to eventually cover the entire Earth''s surface as the planet rotates beneath it');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('127dd41a-290d-4174-95e5-679cc7326973', 'c3678fd6-1bb9-4ecb-a086-f45e3ac17799', 1, 'Only over the equator repeatedly, with no variation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2e70bda-f8bb-4259-802f-11ebc08f2aa8', 'c3678fd6-1bb9-4ecb-a086-f45e3ac17799', 2, 'Never near either pole under any circumstance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dff13374-6d82-4abc-adef-f766857ec387', 'c3678fd6-1bb9-4ecb-a086-f45e3ac17799', 3, 'Only in a fixed position relative to the Sun with no orbital motion at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c3678fd6-1bb9-4ecb-a086-f45e3ac17799', '46defc52-d2df-4b5b-9542-e154b34fad37', 'A polar orbit passes over or near both of Earth''s poles on each revolution — since Earth rotates beneath the satellite''s roughly fixed orbital plane, this allows the satellite to eventually pass over virtually every point on Earth''s surface over successive orbits, making it valuable for global Earth observation and mapping applications.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9a9c81e6-0ded-40ab-a610-8897c5d48b8b', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 150, 'The term ''delta-v'' in spacecraft mission planning refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8017044a-6351-43ce-aaa1-0e2a9734b2b4', '9a9c81e6-0ded-40ab-a610-8897c5d48b8b', 0, 'The spacecraft''s total mass at launch');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7fca492-51f6-4192-885c-ec839fc0b4fa', '9a9c81e6-0ded-40ab-a610-8897c5d48b8b', 1, 'The total change in velocity required to perform a given orbital maneuver, directly related to the propellant needed via the rocket equation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3fc76141-5364-470b-84cb-24bf0eec7a06', '9a9c81e6-0ded-40ab-a610-8897c5d48b8b', 2, 'The spacecraft''s radar cross-section');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebef077a-c51b-46e7-8623-07facac328bd', '9a9c81e6-0ded-40ab-a610-8897c5d48b8b', 3, 'The distance traveled during launch only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9a9c81e6-0ded-40ab-a610-8897c5d48b8b', 'e7fca492-51f6-4192-885c-ec839fc0b4fa', 'Delta-v (Δv) represents the total change in velocity required to perform a given maneuver or complete a mission — a fundamental planning parameter directly related, via the Tsiolkovsky rocket equation, to the amount of propellant a spacecraft must carry to achieve that velocity change.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7babb46f-5d98-4d6e-9d0e-dccc8907768e', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 151, 'An aircraft''s hydraulic system is primarily used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9db146b3-9262-41f9-be95-5577298bf184', '7babb46f-5d98-4d6e-9d0e-dccc8907768e', 0, 'Generate electrical power for the cabin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1a283e9-7fc3-4454-a509-983ac3d170e5', '7babb46f-5d98-4d6e-9d0e-dccc8907768e', 1, 'Provide the power to actuate heavy mechanical systems (like landing gear, flight controls, and brakes) using pressurized fluid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36635eac-09bf-4eb9-b9bc-69f0f05768ac', '7babb46f-5d98-4d6e-9d0e-dccc8907768e', 2, 'Cool the engine directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d75d0812-1a3d-45e8-8d27-53cec12b8b6e', '7babb46f-5d98-4d6e-9d0e-dccc8907768e', 3, 'Purify cabin air');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7babb46f-5d98-4d6e-9d0e-dccc8907768e', 'c1a283e9-7fc3-4454-a509-983ac3d170e5', 'Aircraft hydraulic systems use pressurized fluid to transmit force efficiently, powering heavy mechanical systems like landing gear retraction/extension, primary flight control actuation, wheel brakes, and thrust reversers — offering a high power-to-weight ratio compared to purely mechanical or electrical alternatives for these high-force applications.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('444bcdbd-94a8-4bfb-8bf2-5244a75690ac', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 152, 'The ''pneumatic system'' aboard many aircraft, using compressed (bleed) air from the engines, is commonly used for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('320c345c-a8b3-4c2e-acdb-401c5360f372', '444bcdbd-94a8-4bfb-8bf2-5244a75690ac', 0, 'Generating thrust directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1caf1515-f407-4fb6-b476-d79e83482a05', '444bcdbd-94a8-4bfb-8bf2-5244a75690ac', 1, 'Cabin pressurization, air conditioning, and engine/wing anti-ice systems');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54c0910f-a19b-43eb-b46a-11fc3a568b39', '444bcdbd-94a8-4bfb-8bf2-5244a75690ac', 2, 'Fuel storage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2556d77-c953-4cbe-880e-b907d136da48', '444bcdbd-94a8-4bfb-8bf2-5244a75690ac', 3, 'Radio communication');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('444bcdbd-94a8-4bfb-8bf2-5244a75690ac', '1caf1515-f407-4fb6-b476-d79e83482a05', 'Pneumatic systems, typically using compressed ''bleed air'' extracted from the engine compressor stages, commonly power cabin pressurization and air conditioning, as well as anti-ice/de-ice systems for the engine inlets and wing leading edges.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bfe09090-22e9-4195-9e43-56bc9c69ae73', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 153, '''Cabin pressurization'' on a commercial aircraft is necessary primarily because:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('056ec73e-54fc-4d93-9d40-cc1fa072c8de', 'bfe09090-22e9-4195-9e43-56bc9c69ae73', 0, 'It has no functional purpose beyond passenger comfort preference');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2fa559c5-2fb0-4a57-819c-70823c44de99', 'bfe09090-22e9-4195-9e43-56bc9c69ae73', 1, 'At typical cruise altitudes, ambient air pressure and oxygen levels are far too low to sustain unassisted human physiological function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6dfd4609-9665-479c-86c8-cc3edb3cc6fb', 'bfe09090-22e9-4195-9e43-56bc9c69ae73', 2, 'It increases the aircraft''s speed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8dce24f7-9c5f-4a48-942c-6898717d32a3', 'bfe09090-22e9-4195-9e43-56bc9c69ae73', 3, 'It reduces the aircraft''s weight');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bfe09090-22e9-4195-9e43-56bc9c69ae73', '2fa559c5-2fb0-4a57-819c-70823c44de99', 'At typical commercial jet cruise altitudes (30,000-40,000+ feet), ambient atmospheric pressure and oxygen partial pressure are far too low to sustain normal human physiological function without supplemental pressurization — cabin pressurization systems maintain a cabin altitude equivalent (typically around 6,000-8,000 feet) safe and comfortable for unassisted breathing.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8971a32f-b28c-4d57-829e-ea628bcbf7aa', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 154, '''Redundancy'' in aircraft system design refers to the practice of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4964af6f-605e-449d-880a-3b50fd697517', '8971a32f-b28c-4d57-829e-ea628bcbf7aa', 0, 'Deliberately removing backup systems to reduce weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('866f2408-33be-4d8c-8bc9-ff728cce8ac8', '8971a32f-b28c-4d57-829e-ea628bcbf7aa', 1, 'Incorporating multiple independent, backup systems performing the same critical function, so a single failure doesn''t result in complete loss of that function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6cb43404-d2b7-40f6-860d-03ada9523ccd', '8971a32f-b28c-4d57-829e-ea628bcbf7aa', 2, 'Using only one single system for every function, with no backups');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb6664c8-f98d-4161-b45f-236a895cdb22', '8971a32f-b28c-4d57-829e-ea628bcbf7aa', 3, 'Testing a system exactly once before certification');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8971a32f-b28c-4d57-829e-ea628bcbf7aa', '866f2408-33be-4d8c-8bc9-ff728cce8ac8', 'Redundancy is a deliberate design philosophy incorporating multiple independent backup systems (e.g., multiple hydraulic systems, multiple electrical generators, multiple flight control computers) performing the same critical function, so that a single component failure doesn''t result in complete loss of that critical capability — a foundational aviation safety principle.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('171bea47-aaa6-4efd-814b-8f2d4941fa1b', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 155, 'The ''fuel system'' of an aircraft, beyond simply storing fuel, is also responsible for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ec5e582-7435-4e10-889e-7e0bc337ec8f', '171bea47-aaa6-4efd-814b-8f2d4941fa1b', 0, 'Generating lift directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20c1be0b-536d-488f-8326-85c8d3adfede', '171bea47-aaa6-4efd-814b-8f2d4941fa1b', 1, 'Managing fuel distribution, transfer between tanks (for weight/balance management), and reliable delivery to the engines under varying flight conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b8cbdaf-05b1-4e22-b859-f11c3d0e18f7', '171bea47-aaa6-4efd-814b-8f2d4941fa1b', 2, 'Controlling the landing gear');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0b9c628-d8f5-4ce0-8f75-429a37ac40fc', '171bea47-aaa6-4efd-814b-8f2d4941fa1b', 3, 'Providing cabin pressurization');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('171bea47-aaa6-4efd-814b-8f2d4941fa1b', '20c1be0b-536d-488f-8326-85c8d3adfede', 'Beyond simple storage, an aircraft''s fuel system manages fuel distribution and transfer between multiple tanks (often used deliberately to manage the aircraft''s center of gravity during flight), and ensures reliable fuel delivery to the engines under the full range of expected flight attitudes and conditions.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5c9b5b08-0529-432a-bb67-977e7353293d', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 156, '''De-icing'' and ''anti-icing'' systems on an aircraft serve to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b95a6f5-0ce6-4bc0-8a34-fba6a7e63433', '5c9b5b08-0529-432a-bb67-977e7353293d', 0, 'Remove or prevent the formation of ice on critical surfaces (wings, engine inlets, control surfaces), which can otherwise dangerously disrupt airflow and add weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2dd1b4a3-7e63-4040-b9da-c6ed7b56ea23', '5c9b5b08-0529-432a-bb67-977e7353293d', 1, 'Increase the aircraft''s cabin temperature only, unrelated to external surfaces');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93076bd5-c01e-44f2-8c55-58754657f639', '5c9b5b08-0529-432a-bb67-977e7353293d', 2, 'Improve fuel efficiency with no relation to ice');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d045d1a-1b7c-4102-b3b1-0417e9ad40f1', '5c9b5b08-0529-432a-bb67-977e7353293d', 3, 'Control radio communication frequency');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5c9b5b08-0529-432a-bb67-977e7353293d', '6b95a6f5-0ce6-4bc0-8a34-fba6a7e63433', 'De-icing (removing existing ice) and anti-icing (preventing ice formation) systems protect critical surfaces — wings, engine inlets, propellers, control surfaces — from ice accumulation, which can dangerously disrupt smooth airflow (reducing lift, increasing drag) and add significant unwanted weight if left unaddressed.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9c8698d5-5c6d-47b3-9145-fb494ab7d591', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 157, '''Auxiliary Power Unit'' (APU) aboard an aircraft is primarily used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72751906-325a-4197-a6e4-09ed4ba5b986', '9c8698d5-5c6d-47b3-9145-fb494ab7d591', 0, 'Provide the primary thrust for flight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2914cf5b-e641-45f2-95ae-807fd828f587', '9c8698d5-5c6d-47b3-9145-fb494ab7d591', 1, 'Provide electrical power, compressed air, and sometimes hydraulic power while the main engines are shut down (e.g., on the ground)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ced0ffc-398b-4022-95bb-fbfbd03f0024', '9c8698d5-5c6d-47b3-9145-fb494ab7d591', 2, 'Generate lift during takeoff');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0486382a-1512-4e8a-8418-120557fc6a2e', '9c8698d5-5c6d-47b3-9145-fb494ab7d591', 3, 'Store excess fuel');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9c8698d5-5c6d-47b3-9145-fb494ab7d591', '2914cf5b-e641-45f2-95ae-807fd828f587', 'The Auxiliary Power Unit, typically a small gas turbine located in the tail, provides electrical power, compressed air (for air conditioning and main engine starting), and sometimes hydraulic power while the aircraft''s main engines are shut down — commonly used while the aircraft is on the ground, before the main engines are started.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('328866c2-fea4-4cfa-a782-22d3664a680b', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 158, '''Fly-by-wire'' redundancy in modern airliner flight control computers is typically achieved through:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c06be1b0-b6d1-4976-96b9-279f45a8b86e', '328866c2-fea4-4cfa-a782-22d3664a680b', 0, 'Using only a single flight control computer, relying on it never failing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86e55600-6003-45bd-ae6b-9c82d1192844', '328866c2-fea4-4cfa-a782-22d3664a680b', 1, 'Multiple independent flight control computers (often from different manufacturers or using different software/hardware design approaches) that cross-check each other''s outputs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ccc2d30d-3fe3-41e8-8a13-3ff727f6492a', '328866c2-fea4-4cfa-a782-22d3664a680b', 2, 'Eliminating computers entirely in favor of pure mechanical linkages');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be61fb20-6ebe-420f-b480-70ea8dffe80c', '328866c2-fea4-4cfa-a782-22d3664a680b', 3, 'Relying solely on the pilot''s manual backup with no computer involvement whatsoever');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('328866c2-fea4-4cfa-a782-22d3664a680b', '86e55600-6003-45bd-ae6b-9c82d1192844', 'Modern fly-by-wire systems typically employ multiple independent flight control computers (often using dissimilar hardware/software design, sometimes from different design teams or suppliers, to guard against common-mode software errors) that continuously cross-check each other''s computed outputs, voting out and isolating any computer producing anomalous results.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8d278e0a-f58c-4859-9ae1-67e51a5f3f9b', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 159, 'The ''design philosophy'' of ''fail-safe'' in aircraft system engineering means:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd3ca439-1c4f-4b07-8cb3-0832615147ea', '8d278e0a-f58c-4859-9ae1-67e51a5f3f9b', 0, 'A system is designed such that, if a component fails, the overall system responds in a manner that minimizes hazard to the aircraft and occupants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0bf0e0a8-626b-4920-b41d-2f07dabf2570', '8d278e0a-f58c-4859-9ae1-67e51a5f3f9b', 1, 'A system that can never fail under any circumstance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a360c6d7-a664-4f36-9f52-4f6061a79da8', '8d278e0a-f58c-4859-9ae1-67e51a5f3f9b', 2, 'A system with no monitoring or fault-detection at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9cdf4c71-f530-48be-b50b-7bc77e941072', '8d278e0a-f58c-4859-9ae1-67e51a5f3f9b', 3, 'A design approach used only for non-critical cabin entertainment systems');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8d278e0a-f58c-4859-9ae1-67e51a5f3f9b', 'bd3ca439-1c4f-4b07-8cb3-0832615147ea', 'Fail-safe design ensures that when a component or system does fail (an assumption, not a guarantee against failure entirely), the overall system responds in a way that minimizes hazard — for example, defaulting to a safe state, alerting the crew, or automatically switching to a redundant backup — rather than assuming failure will never occur.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('169d2a17-dbd9-460f-b973-74caf620979a', '31e559e7-d3cb-4ce2-9d8c-91d977051718', 160, 'Environmental Control Systems (ECS) aboard an aircraft are responsible for managing:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47952a79-a776-4f25-8115-b8f53dc0a4a9', '169d2a17-dbd9-460f-b973-74caf620979a', 0, 'Only the exterior paint scheme');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c87415ec-6cb5-4c7b-8fbb-5a47307dac1b', '169d2a17-dbd9-460f-b973-74caf620979a', 1, 'Cabin temperature, air pressurization, and ventilation/air quality for passenger and crew comfort and safety');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a47a43c-9ec5-491c-a02c-0f0c7184bd03', '169d2a17-dbd9-460f-b973-74caf620979a', 2, 'Radio navigation exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9836bce3-1f13-439d-a04e-5a2d166e6ac7', '169d2a17-dbd9-460f-b973-74caf620979a', 3, 'Landing gear retraction only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('169d2a17-dbd9-460f-b973-74caf620979a', 'c87415ec-6cb5-4c7b-8fbb-5a47307dac1b', 'The Environmental Control System manages cabin temperature regulation, pressurization, and ventilation/air quality (including fresh air supply and filtration) — critical for passenger and crew comfort, safety, and physiological well-being throughout the flight, particularly at high cruise altitudes.', 'Discipline (Aeronautical / Aerospace) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');
