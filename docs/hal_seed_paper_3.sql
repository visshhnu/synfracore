-- ============================================================
-- HAL Design/Management Trainee -- Electronics & Communication Engineering
-- Full-Length Mock Paper 3 (160 questions, 150 minutes)
-- 
-- SOURCE: informally shared study material (not an official/proprietary HAL
-- archive). Honest per-question source note via question_answers.source_note
-- (already rendered in the results-review UI) -- see each section below.
-- Run this AFTER docs/question-bank-schema.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes)
VALUES ('5e47b501-7176-42f8-8137-c5acc30759bc', 'hal-ece-practice-1', 'HAL DT/MT — Electronics & Communication Engineering — Full Mock Paper 1', 'hal-trainee', ARRAY['HAL', 'Electronics', 'Communication Systems', 'General Awareness', 'Reasoning', 'English']::TEXT[], 160, 'standard', true, 3, 150);

-- ── Section: General Awareness (20 questions) — General Awareness — written to match HAL's real GA scope, not taken from an official HAL paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2c322b3e-dbf9-46e1-92ac-ed37f118f5e2', '5e47b501-7176-42f8-8137-c5acc30759bc', 1, 'HAL''s Avionics Division is primarily involved in developing:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('653ec3ca-d556-4877-a25f-cbe17cce862e', '2c322b3e-dbf9-46e1-92ac-ed37f118f5e2', 0, 'Aircraft engines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77fc9282-8eca-42aa-8209-b3c3fa9b997f', '2c322b3e-dbf9-46e1-92ac-ed37f118f5e2', 1, 'Onboard electronic systems — navigation, communication, radar, and flight control avionics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28015095-5795-44fe-9add-81a82815df92', '2c322b3e-dbf9-46e1-92ac-ed37f118f5e2', 2, 'Landing gear only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d66226a-6902-4651-9758-4b85ce2e06b5', '2c322b3e-dbf9-46e1-92ac-ed37f118f5e2', 3, 'Cabin furnishings');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2c322b3e-dbf9-46e1-92ac-ed37f118f5e2', '77fc9282-8eca-42aa-8209-b3c3fa9b997f', 'HAL''s Avionics Division develops onboard electronic systems for aircraft and helicopters, including navigation, communication, radar, and flight-control avionics — a natural fit for electronics and communication engineers.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('06986263-469e-4a8e-92f5-066717964498', '5e47b501-7176-42f8-8137-c5acc30759bc', 2, 'DRDO''s premier electronics and radar research laboratory is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d91cc10-6713-443a-964e-d1c973499fb4', '06986263-469e-4a8e-92f5-066717964498', 0, 'Vikram Sarabhai Space Centre (VSSC)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5c12213-421d-4b06-ae51-28511a055637', '06986263-469e-4a8e-92f5-066717964498', 1, 'Electronics and Radar Development Establishment (LRDE)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d88d9c85-2897-4118-b27d-8329b630ea86', '06986263-469e-4a8e-92f5-066717964498', 2, 'Defence Metallurgical Research Laboratory (DMRL)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72de9896-88a8-4110-b49a-7a51c450eef7', '06986263-469e-4a8e-92f5-066717964498', 3, 'Aeronautical Development Establishment (ADE)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('06986263-469e-4a8e-92f5-066717964498', 'e5c12213-421d-4b06-ae51-28511a055637', 'The Electronics and Radar Development Establishment (LRDE), a DRDO laboratory based in Bengaluru, is India''s premier facility for radar and electronic-warfare systems research and development.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5bcc43f1-bb7e-491b-8118-8815458b455f', '5e47b501-7176-42f8-8137-c5acc30759bc', 3, 'Bharat Electronics Limited (BEL), a major defence-electronics PSU often collaborating with HAL on integrated systems, is headquartered in:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5364798-e563-4a1d-ae52-b4a6bc601625', '5bcc43f1-bb7e-491b-8118-8815458b455f', 0, 'Bengaluru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1794159a-774f-4d30-a125-99cdc7ca73a5', '5bcc43f1-bb7e-491b-8118-8815458b455f', 1, 'Pune');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('091bf0c4-8972-4c09-a1c8-fe3a5ddac996', '5bcc43f1-bb7e-491b-8118-8815458b455f', 2, 'Chennai');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('efdaae15-1f81-4544-b40c-620c548795ea', '5bcc43f1-bb7e-491b-8118-8815458b455f', 3, 'Hyderabad');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5bcc43f1-bb7e-491b-8118-8815458b455f', 'e5364798-e563-4a1d-ae52-b4a6bc601625', 'Bharat Electronics Limited (BEL) is headquartered in Bengaluru, and is India''s principal defence-electronics PSU, supplying radar, communication, and electronic-warfare systems used alongside HAL''s aircraft platforms.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('80795a5d-9391-4405-9569-ecdd3cf5f416', '5e47b501-7176-42f8-8137-c5acc30759bc', 4, 'India''s satellite navigation system, an alternative to GPS, is called:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e773599f-25af-46a0-934b-335f111964a5', '80795a5d-9391-4405-9569-ecdd3cf5f416', 0, 'GAGAN');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('525dd1f5-19d2-45bc-9d64-325e9aa802c2', '80795a5d-9391-4405-9569-ecdd3cf5f416', 1, 'NavIC (IRNSS)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea0591dc-89f1-4bc5-a0e4-9e37a1e0ce91', '80795a5d-9391-4405-9569-ecdd3cf5f416', 2, 'Bhuvan');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d7469fd-39ea-4fd2-9ab3-571bd23114e1', '80795a5d-9391-4405-9569-ecdd3cf5f416', 3, 'INSAT');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('80795a5d-9391-4405-9569-ecdd3cf5f416', '525dd1f5-19d2-45bc-9d64-325e9aa802c2', 'NavIC (Navigation with Indian Constellation, formerly IRNSS) is India''s indigenous regional satellite navigation system, providing positioning services independent of the US GPS system.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0009452a-45de-4c32-a8c0-d5c29fa1134f', '5e47b501-7176-42f8-8137-c5acc30759bc', 5, 'The Right to Information (RTI) Act was enacted in which year?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45d035fa-5a2f-480e-a5f8-8bbb99113c74', '0009452a-45de-4c32-a8c0-d5c29fa1134f', 0, '2002');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13141623-af62-4141-b3dd-933179c71fc7', '0009452a-45de-4c32-a8c0-d5c29fa1134f', 1, '2005');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54e0c26c-4644-4273-a40c-87fd3092935e', '0009452a-45de-4c32-a8c0-d5c29fa1134f', 2, '2010');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da4f5364-2daf-4642-9d93-0dbc4a0e8321', '0009452a-45de-4c32-a8c0-d5c29fa1134f', 3, '1999');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0009452a-45de-4c32-a8c0-d5c29fa1134f', '13141623-af62-4141-b3dd-933179c71fc7', 'The Right to Information Act was enacted in 2005, empowering Indian citizens to request information from public authorities, promoting transparency and accountability in governance.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2424f586-af8c-4326-938a-60441bb0d6bf', '5e47b501-7176-42f8-8137-c5acc30759bc', 6, 'The Indian Parliament''s Money Bill can only be introduced in:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67e63b47-7d56-4a06-a10a-1aae6186e33a', '2424f586-af8c-4326-938a-60441bb0d6bf', 0, 'Rajya Sabha');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3df9367-503e-4d9c-aae8-407189310bed', '2424f586-af8c-4326-938a-60441bb0d6bf', 1, 'Lok Sabha');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1bae5d92-8efa-4722-b68e-dd45c9b82fea', '2424f586-af8c-4326-938a-60441bb0d6bf', 2, 'Either house, at the Speaker''s discretion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31d95ed3-cc8c-43ae-a54c-c7de56bfadbd', '2424f586-af8c-4326-938a-60441bb0d6bf', 3, 'State Legislative Assemblies');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2424f586-af8c-4326-938a-60441bb0d6bf', 'd3df9367-503e-4d9c-aae8-407189310bed', 'A Money Bill, as defined under Article 110 of the Constitution, can only be introduced in the Lok Sabha, and the Rajya Sabha''s role regarding such bills is limited to making recommendations, which the Lok Sabha may accept or reject.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('636e1575-b0d1-4b51-af3f-ca0256a61b6b', '5e47b501-7176-42f8-8137-c5acc30759bc', 7, 'The Sardar Sarovar Dam is built on which river?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07eccb05-3645-41f6-b3d0-02f70f04b21e', '636e1575-b0d1-4b51-af3f-ca0256a61b6b', 0, 'Godavari');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41e627e9-3032-4c1d-96d3-523ff2ae4519', '636e1575-b0d1-4b51-af3f-ca0256a61b6b', 1, 'Narmada');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6aca9889-1235-44eb-9cf6-573573cc2bef', '636e1575-b0d1-4b51-af3f-ca0256a61b6b', 2, 'Krishna');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f9dab64-3a96-4af9-877a-b80f92a4bd35', '636e1575-b0d1-4b51-af3f-ca0256a61b6b', 3, 'Tapi');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('636e1575-b0d1-4b51-af3f-ca0256a61b6b', '41e627e9-3032-4c1d-96d3-523ff2ae4519', 'The Sardar Sarovar Dam, one of India''s largest dam projects, is built on the Narmada River in Gujarat.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('457d4564-a412-4453-a623-e98a22015a84', '5e47b501-7176-42f8-8137-c5acc30759bc', 8, 'Which Indian city is known as the ''Silicon Valley of India'' due to its concentration of IT and electronics industries?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c9eca6b-82f2-4b6d-b99c-356c57038e9a', '457d4564-a412-4453-a623-e98a22015a84', 0, 'Hyderabad');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1658bdc9-2fa5-4d67-9c82-ffc14c4ae419', '457d4564-a412-4453-a623-e98a22015a84', 1, 'Bengaluru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de1bcc46-b56f-449c-a915-4ec46559de17', '457d4564-a412-4453-a623-e98a22015a84', 2, 'Pune');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4a16ef7-1d07-4f3e-a77a-2079ee299630', '457d4564-a412-4453-a623-e98a22015a84', 3, 'Chennai');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('457d4564-a412-4453-a623-e98a22015a84', '1658bdc9-2fa5-4d67-9c82-ffc14c4ae419', 'Bengaluru is widely known as the ''Silicon Valley of India'' due to its dense concentration of IT, electronics, and aerospace industries — including HAL''s own headquarters and major operations.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('127ba8d7-e2a3-4dc9-a720-739012d1bb82', '5e47b501-7176-42f8-8137-c5acc30759bc', 9, 'The ''Digital India'' initiative was launched in which year?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('22912acb-63bd-4a0d-b1d4-55e04921cd57', '127ba8d7-e2a3-4dc9-a720-739012d1bb82', 0, '2012');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fcf4c446-13b0-4fa5-9fdb-e847c24d7d35', '127ba8d7-e2a3-4dc9-a720-739012d1bb82', 1, '2015');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75e20ebf-ea7a-4739-add4-b62e61cedde1', '127ba8d7-e2a3-4dc9-a720-739012d1bb82', 2, '2018');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9d19920-08cf-4919-b91b-3400c3f1f544', '127ba8d7-e2a3-4dc9-a720-739012d1bb82', 3, '2020');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('127ba8d7-e2a3-4dc9-a720-739012d1bb82', 'fcf4c446-13b0-4fa5-9fdb-e847c24d7d35', 'The Digital India initiative, aimed at transforming India into a digitally empowered society and knowledge economy, was launched in 2015.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('601eca1a-878f-446e-ab52-0e3ccf2c87e8', '5e47b501-7176-42f8-8137-c5acc30759bc', 10, 'C-DAC (Centre for Development of Advanced Computing), a premier Indian R&D organisation in electronics/IT, was established primarily to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f26b5781-365f-4155-97ae-21b1bf969ab6', '601eca1a-878f-446e-ab52-0e3ccf2c87e8', 0, 'Manufacture consumer electronics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('821b23b3-54fd-4f73-b39c-eaf5d91517e9', '601eca1a-878f-446e-ab52-0e3ccf2c87e8', 1, 'Undertake R&D in advanced computing and IT, and reduce India''s dependence on imported supercomputing technology');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('411c3d9f-0049-4d96-bdcf-ca4ab3405a1c', '601eca1a-878f-446e-ab52-0e3ccf2c87e8', 2, 'Regulate telecom tariffs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eca8e355-3aad-4a62-a4e9-f1dce4e168fd', '601eca1a-878f-446e-ab52-0e3ccf2c87e8', 3, 'Issue driving licenses');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('601eca1a-878f-446e-ab52-0e3ccf2c87e8', '821b23b3-54fd-4f73-b39c-eaf5d91517e9', 'C-DAC was established in 1988, notably after the US denied India access to a supercomputer, to independently develop advanced computing and IT capabilities, including India''s PARAM series of supercomputers.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('68ec1965-d7b0-45d2-b242-fedaaa88e0c6', '5e47b501-7176-42f8-8137-c5acc30759bc', 11, 'The Telecom Regulatory Authority of India (TRAI) primarily regulates:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c1b5e6c-05f1-45a3-827d-a9a460a8a8ea', '68ec1965-d7b0-45d2-b242-fedaaa88e0c6', 0, 'Postal services');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a94499f-3995-427d-bad4-db9a2da9bbd5', '68ec1965-d7b0-45d2-b242-fedaaa88e0c6', 1, 'Telecommunication services and tariffs in India');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc9b7c1f-d108-470a-8a47-a22563142f82', '68ec1965-d7b0-45d2-b242-fedaaa88e0c6', 2, 'Banking transactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1df5422b-83fa-4e12-a4e6-7fe7159acf7f', '68ec1965-d7b0-45d2-b242-fedaaa88e0c6', 3, 'Railway fares');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('68ec1965-d7b0-45d2-b242-fedaaa88e0c6', '5a94499f-3995-427d-bad4-db9a2da9bbd5', 'TRAI, established in 1997, is the regulatory body overseeing telecommunications services, tariffs, and interconnection issues in India.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a8c5744e-8ad4-4339-8b08-3adfd10041b8', '5e47b501-7176-42f8-8137-c5acc30759bc', 12, 'The Chandrayaan-3 mission, which achieved a successful soft landing near the Moon''s south pole in 2023, was launched by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5a039e4-07cb-49ef-b9e3-cc2d809fde3c', 'a8c5744e-8ad4-4339-8b08-3adfd10041b8', 0, 'NASA');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('094b9bbd-ef61-493c-83c5-bdfccbfc5e15', 'a8c5744e-8ad4-4339-8b08-3adfd10041b8', 1, 'ISRO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8fb1268d-fc63-430c-a0a1-4fd4b4f77b27', 'a8c5744e-8ad4-4339-8b08-3adfd10041b8', 2, 'ESA');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1cd8d283-5b99-40d6-bf6c-51bb663eeb72', 'a8c5744e-8ad4-4339-8b08-3adfd10041b8', 3, 'Roscosmos');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a8c5744e-8ad4-4339-8b08-3adfd10041b8', '094b9bbd-ef61-493c-83c5-bdfccbfc5e15', 'Chandrayaan-3, launched and operated by ISRO, achieved a historic soft landing near the Moon''s south polar region in August 2023, making India the first country to do so.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3aef74b8-f35f-402e-a4b0-c4175918da6b', '5e47b501-7176-42f8-8137-c5acc30759bc', 13, '5G technology, compared to 4G, primarily offers improvements in:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c49d00d-b635-4ea6-9e21-4560a1d37dba', '3aef74b8-f35f-402e-a4b0-c4175918da6b', 0, 'Only voice call quality');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8b7b0b9-db9a-435c-b7e4-03f6e31875d7', '3aef74b8-f35f-402e-a4b0-c4175918da6b', 1, 'Higher data speeds, lower latency, and greater device connection density');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('215e9df0-b494-4969-9f76-00d8e61d0e6e', '3aef74b8-f35f-402e-a4b0-c4175918da6b', 2, 'Reduced smartphone battery life only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7bff57cf-5474-42f3-b0c2-6bf2b2f09c83', '3aef74b8-f35f-402e-a4b0-c4175918da6b', 3, 'No meaningful technical improvement');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3aef74b8-f35f-402e-a4b0-c4175918da6b', 'a8b7b0b9-db9a-435c-b7e4-03f6e31875d7', '5G networks offer substantially higher data throughput, significantly lower latency, and the ability to connect a much greater density of devices simultaneously, compared to 4G — enabling applications like enhanced mobile broadband, industrial IoT, and low-latency communication.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5d68e0bc-ad78-4c3a-8845-ad01ffc3884f', '5e47b501-7176-42f8-8137-c5acc30759bc', 14, 'The ''Atmanirbhar Bharat'' initiative primarily emphasizes:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe60ec2a-2ff0-488e-8148-9aa916bff027', '5d68e0bc-ad78-4c3a-8845-ad01ffc3884f', 0, 'Increasing dependence on imports');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c13272b-6711-46c3-9c58-00337da769a2', '5d68e0bc-ad78-4c3a-8845-ad01ffc3884f', 1, 'Self-reliance — boosting domestic manufacturing and reducing import dependence across sectors, including defence');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20675dea-0907-4bd8-b1ca-0060f82252a1', '5d68e0bc-ad78-4c3a-8845-ad01ffc3884f', 2, 'Reducing exports');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a9e5d6a-ba16-4ef8-b3e5-6ae8651e4f2b', '5d68e0bc-ad78-4c3a-8845-ad01ffc3884f', 3, 'Focus exclusively on agriculture');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5d68e0bc-ad78-4c3a-8845-ad01ffc3884f', '4c13272b-6711-46c3-9c58-00337da769a2', '''Atmanirbhar Bharat'' (Self-Reliant India), launched in 2020, emphasizes boosting domestic manufacturing capability and reducing import dependence across sectors — directly relevant to HAL''s own indigenisation push in defence manufacturing.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a1675c32-272b-4a76-b5de-51fe2a55e57d', '5e47b501-7176-42f8-8137-c5acc30759bc', 15, 'The first Indian to travel to space was:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb9e90f7-2808-48c8-9f32-e7f4edce37a8', 'a1675c32-272b-4a76-b5de-51fe2a55e57d', 0, 'Kalpana Chawla');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9937eb5-8318-403f-960e-637e669adf62', 'a1675c32-272b-4a76-b5de-51fe2a55e57d', 1, 'Rakesh Sharma');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f02894b5-99b3-445e-8060-432240302fe9', 'a1675c32-272b-4a76-b5de-51fe2a55e57d', 2, 'Sunita Williams');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2170947e-43d4-48fd-94e8-9e94bb0e62bb', 'a1675c32-272b-4a76-b5de-51fe2a55e57d', 3, 'Vikram Sarabhai');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a1675c32-272b-4a76-b5de-51fe2a55e57d', 'a9937eb5-8318-403f-960e-637e669adf62', 'Rakesh Sharma became the first Indian citizen to travel to space in 1984, aboard a Soviet Soyuz mission.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4de9fe79-363c-4dd7-a8c2-b53253961eff', '5e47b501-7176-42f8-8137-c5acc30759bc', 16, 'The apex Indian institution responsible for setting national standards (including electrical/electronic product standards) is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b81a0b06-d87d-441a-a57d-5dcf369788e0', '4de9fe79-363c-4dd7-a8c2-b53253961eff', 0, 'Bureau of Indian Standards (BIS)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c651a948-c707-443f-8565-6ad228f6e95f', '4de9fe79-363c-4dd7-a8c2-b53253961eff', 1, 'Reserve Bank of India');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f55690c-3255-4c85-a4fd-aae28d4ab0a5', '4de9fe79-363c-4dd7-a8c2-b53253961eff', 2, 'Securities and Exchange Board of India (SEBI)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b00ebf2-97d1-4fc3-ab94-0a55d3eb23cc', '4de9fe79-363c-4dd7-a8c2-b53253961eff', 3, 'Election Commission of India');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4de9fe79-363c-4dd7-a8c2-b53253961eff', 'b81a0b06-d87d-441a-a57d-5dcf369788e0', 'The Bureau of Indian Standards (BIS) is India''s national standards body, responsible for developing and certifying standards across products and services, including electrical and electronic goods.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a7dc8a65-637f-4bc4-bdfd-845d064ea022', '5e47b501-7176-42f8-8137-c5acc30759bc', 17, 'The term ''Internet of Things'' (IoT) refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9010967-8c3c-465a-a101-ce356b6a11ef', 'a7dc8a65-637f-4bc4-bdfd-845d064ea022', 0, 'A single large computer network for government use only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('731a2e2c-a65e-4794-87eb-73562aff81bc', 'a7dc8a65-637f-4bc4-bdfd-845d064ea022', 1, 'A network of physical devices embedded with sensors and connectivity, enabling them to collect and exchange data');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('788441e9-d327-4734-9153-e044abbe9a21', 'a7dc8a65-637f-4bc4-bdfd-845d064ea022', 2, 'A type of web browser');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0318acc-36e9-4beb-988d-492f05e626a0', 'a7dc8a65-637f-4bc4-bdfd-845d064ea022', 3, 'An outdated technology no longer in use');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a7dc8a65-637f-4bc4-bdfd-845d064ea022', '731a2e2c-a65e-4794-87eb-73562aff81bc', 'The Internet of Things (IoT) describes the network of physical devices (sensors, appliances, industrial equipment) embedded with connectivity and computing capability, enabling them to collect, exchange, and act on data — a rapidly growing field intersecting with electronics and communication engineering.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a6a6b7d7-adf4-492b-bf9b-0d8a09a35c54', '5e47b501-7176-42f8-8137-c5acc30759bc', 18, 'Which Indian institute is specifically known for its focus on semiconductor and VLSI research, closely tied to India''s chip-manufacturing ambitions?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27f691fc-a604-416f-86ae-027fb4c1b66c', 'a6a6b7d7-adf4-492b-bf9b-0d8a09a35c54', 0, 'Indian Institute of Science (IISc), Bengaluru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('883c39b9-c0ee-4327-bf02-efb8d5c97dca', 'a6a6b7d7-adf4-492b-bf9b-0d8a09a35c54', 1, 'All India Institute of Medical Sciences (AIIMS)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3d96909-9e82-4803-ab04-b6495b301297', 'a6a6b7d7-adf4-492b-bf9b-0d8a09a35c54', 2, 'National Institute of Fashion Technology (NIFT)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7a179a3-7fbb-4680-8397-030992d247b7', 'a6a6b7d7-adf4-492b-bf9b-0d8a09a35c54', 3, 'Indian Council of Agricultural Research (ICAR)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a6a6b7d7-adf4-492b-bf9b-0d8a09a35c54', '27f691fc-a604-416f-86ae-027fb4c1b66c', 'IISc Bengaluru is a leading Indian institution for semiconductor, VLSI, and advanced electronics research, closely aligned with India''s growing semiconductor manufacturing and design ambitions.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f754876b-2e9f-4829-9d03-b95e2662b248', '5e47b501-7176-42f8-8137-c5acc30759bc', 19, 'The primary purpose of a ''radar'' system, widely used in defence and aviation, is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd278fef-359a-4723-9c95-1c9d373f8c61', 'f754876b-2e9f-4829-9d03-b95e2662b248', 0, 'Detect and determine the range, angle, and velocity of objects using radio waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4118b0c5-a817-4de4-b7e9-85f3f085c936', 'f754876b-2e9f-4829-9d03-b95e2662b248', 1, 'Generate electrical power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f0a25b0-6dc2-43e6-b24d-8b5cf7c35210', 'f754876b-2e9f-4829-9d03-b95e2662b248', 2, 'Purify water');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0104448-9ee1-4c4a-bf2b-256a40e92d33', 'f754876b-2e9f-4829-9d03-b95e2662b248', 3, 'Measure atmospheric temperature only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f754876b-2e9f-4829-9d03-b95e2662b248', 'cd278fef-359a-4723-9c95-1c9d373f8c61', 'Radar (RAdio Detection And Ranging) systems use radio waves to detect objects and determine their range, angle, and velocity — a core technology in aviation, defence surveillance, and weather monitoring, closely tied to HAL''s avionics work.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d5f5e2ec-06bd-4ff7-930e-6214d0a17a0c', '5e47b501-7176-42f8-8137-c5acc30759bc', 20, 'India''s indigenous AWACS-type airborne early warning aircraft platform is named:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b81f7038-3e23-4b03-abad-fab8115e0ae5', 'd5f5e2ec-06bd-4ff7-930e-6214d0a17a0c', 0, 'Netra');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c58f6e1b-cfbf-41f6-bbaa-a2cc6380c23a', 'd5f5e2ec-06bd-4ff7-930e-6214d0a17a0c', 1, 'Tejas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a30a201-f233-4f88-ad6a-620a3f6d5522', 'd5f5e2ec-06bd-4ff7-930e-6214d0a17a0c', 2, 'Rustom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67a783a0-ddd0-474c-ba3b-3bdb84b93b5d', 'd5f5e2ec-06bd-4ff7-930e-6214d0a17a0c', 3, 'Prachand');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d5f5e2ec-06bd-4ff7-930e-6214d0a17a0c', 'b81f7038-3e23-4b03-abad-fab8115e0ae5', 'Netra is India''s indigenously developed Airborne Early Warning and Control (AEW&C) system, mounted on an aircraft platform, providing airborne radar surveillance — developed by DRDO with HAL''s platform integration involvement.', 'General Awareness — written to match HAL''s real GA scope, not taken from an official HAL paper.');

-- ── Section: English & Reasoning (40 questions) — English & Reasoning — general competitive-exam style practice content, not an official HAL paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0355dac4-9b2f-40e5-affe-85e3b43fa7fc', '5e47b501-7176-42f8-8137-c5acc30759bc', 21, 'Choose the option that correctly identifies the error, if any: ''The power supply, along with the circuit boards, were shipped yesterday.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b9047a8-e881-4969-8ced-4e3f7d06bcba', '0355dac4-9b2f-40e5-affe-85e3b43fa7fc', 0, '''were'' should be ''was''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ec57809-2af2-4d33-8667-10dcf1f01e34', '0355dac4-9b2f-40e5-affe-85e3b43fa7fc', 1, '''along with'' should be ''and''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5cb811ca-ca5b-4647-a941-a6e21b801e72', '0355dac4-9b2f-40e5-affe-85e3b43fa7fc', 2, '''shipped'' should be ''ship''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fea47ade-f69a-4c83-9890-e31a8d707a99', '0355dac4-9b2f-40e5-affe-85e3b43fa7fc', 3, 'No error');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0355dac4-9b2f-40e5-affe-85e3b43fa7fc', '4b9047a8-e881-4969-8ced-4e3f7d06bcba', '''Along with the circuit boards'' is a parenthetical phrase, not a coordinating conjunction — it does not make the subject plural. The true grammatical subject is ''The power supply'' (singular), so the verb should agree with it: ''was shipped'', not ''were shipped''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6a54c331-801f-41eb-a69b-9eb2e9f3a167', '5e47b501-7176-42f8-8137-c5acc30759bc', 22, 'Fill in the blank: ''The signal processing unit ________ malfunctioning since the last firmware update.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6423b66-2643-4d04-b222-0ea9cb4921b6', '6a54c331-801f-41eb-a69b-9eb2e9f3a167', 0, 'is');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98268a92-2f48-4c87-b8ba-30d671b0f20e', '6a54c331-801f-41eb-a69b-9eb2e9f3a167', 1, 'has been');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49ab5ceb-f9e9-4c6c-91ed-22c44210ebd1', '6a54c331-801f-41eb-a69b-9eb2e9f3a167', 2, 'was');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('026e6d35-fd8d-4451-b672-1f1c28ee64c5', '6a54c331-801f-41eb-a69b-9eb2e9f3a167', 3, 'were');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6a54c331-801f-41eb-a69b-9eb2e9f3a167', '98268a92-2f48-4c87-b8ba-30d671b0f20e', '''Since the last update'' signals an action continuing from a past point to the present, requiring present perfect continuous tense — ''has been malfunctioning''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('20920b4c-7c5c-4f8a-b488-cfff62fc52f6', '5e47b501-7176-42f8-8137-c5acc30759bc', 23, 'Choose the correct synonym for ''Ubiquitous'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18cec0a6-29c2-45de-9948-d4f466ad981c', '20920b4c-7c5c-4f8a-b488-cfff62fc52f6', 0, 'Rare');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d026ec7b-771e-4fbc-aa32-09e27be6807c', '20920b4c-7c5c-4f8a-b488-cfff62fc52f6', 1, 'Omnipresent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae7e046d-6fc3-4ee9-b3f5-c99a22400b0a', '20920b4c-7c5c-4f8a-b488-cfff62fc52f6', 2, 'Fragile');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1527f65-4e52-44bc-acf0-dae47a14ee63', '20920b4c-7c5c-4f8a-b488-cfff62fc52f6', 3, 'Obsolete');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('20920b4c-7c5c-4f8a-b488-cfff62fc52f6', 'd026ec7b-771e-4fbc-aa32-09e27be6807c', '''Ubiquitous'' means present or found everywhere — ''Omnipresent'' is the closest synonym.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('480e3c4b-81fd-4b32-a185-3403c52ed5ee', '5e47b501-7176-42f8-8137-c5acc30759bc', 24, 'Choose the correct antonym for ''Amplify'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84bcc456-6653-449b-86b9-61c5a29967f0', '480e3c4b-81fd-4b32-a185-3403c52ed5ee', 0, 'Boost');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('967d7405-4f4d-49f0-8534-e30b333bb8fd', '480e3c4b-81fd-4b32-a185-3403c52ed5ee', 1, 'Enhance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67075b35-3805-479a-9299-794fdb79718f', '480e3c4b-81fd-4b32-a185-3403c52ed5ee', 2, 'Attenuate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce7535a0-f934-45b9-9098-0563001bfa40', '480e3c4b-81fd-4b32-a185-3403c52ed5ee', 3, 'Increase');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('480e3c4b-81fd-4b32-a185-3403c52ed5ee', '67075b35-3805-479a-9299-794fdb79718f', '''Amplify'' means to increase the amplitude or strength of a signal; its direct antonym is ''Attenuate'' (to reduce or weaken a signal).', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('004ab101-0462-4591-99ec-bcb971fee8c8', '5e47b501-7176-42f8-8137-c5acc30759bc', 25, 'Identify the correctly punctuated sentence:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1fb1f971-2037-4bae-8748-56e8d71ba063', '004ab101-0462-4591-99ec-bcb971fee8c8', 0, 'The transmitter, which was recently upgraded operates at higher frequency.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f8abb0a-3f19-4bd5-a53f-012fab3dc351', '004ab101-0462-4591-99ec-bcb971fee8c8', 1, 'The transmitter which was recently upgraded, operates at higher frequency.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eab363f1-f2a1-4fc7-88db-7e472b108667', '004ab101-0462-4591-99ec-bcb971fee8c8', 2, 'The transmitter, which was recently upgraded, operates at higher frequency.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94cd0aa4-09e2-41a4-b52a-88395adfa181', '004ab101-0462-4591-99ec-bcb971fee8c8', 3, 'The transmitter which, was recently upgraded operates at higher frequency.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('004ab101-0462-4591-99ec-bcb971fee8c8', 'eab363f1-f2a1-4fc7-88db-7e472b108667', 'The non-restrictive clause ''which was recently upgraded'' should be set off by commas on both sides.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c363aa78-ea20-43cf-a287-a6194fc97515', '5e47b501-7176-42f8-8137-c5acc30759bc', 26, 'Choose the correctly spelled word:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62fbd9e3-4222-4092-895e-c1d18921cdac', 'c363aa78-ea20-43cf-a287-a6194fc97515', 0, 'Frequancy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4115d720-ad33-4e6b-a5d9-5b066f075372', 'c363aa78-ea20-43cf-a287-a6194fc97515', 1, 'Frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('259ba473-162a-4947-800e-d9649eb91e47', 'c363aa78-ea20-43cf-a287-a6194fc97515', 2, 'Frequensy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ed85244-e12f-406e-b36c-06516d37a03c', 'c363aa78-ea20-43cf-a287-a6194fc97515', 3, 'Freqency');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c363aa78-ea20-43cf-a287-a6194fc97515', '4115d720-ad33-4e6b-a5d9-5b066f075372', '''Frequency'' is the correct spelling.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c60151de-674c-4cd2-b04b-ff021e3096b6', '5e47b501-7176-42f8-8137-c5acc30759bc', 27, 'Identify the part of speech of the underlined word: ''The engineer calibrated the instrument PRECISELY.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b37e5d2-9c9c-49b1-a941-52a9e3a97d21', 'c60151de-674c-4cd2-b04b-ff021e3096b6', 0, 'Adjective');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a7b9ff2-c56b-4bea-a96f-f12c270344a1', 'c60151de-674c-4cd2-b04b-ff021e3096b6', 1, 'Adverb');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a118a883-8adb-49dc-b61e-bf45b5f3fe25', 'c60151de-674c-4cd2-b04b-ff021e3096b6', 2, 'Noun');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8eb467bc-eb25-4e83-8e9d-c209ca67d95b', 'c60151de-674c-4cd2-b04b-ff021e3096b6', 3, 'Preposition');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c60151de-674c-4cd2-b04b-ff021e3096b6', '6a7b9ff2-c56b-4bea-a96f-f12c270344a1', '''Precisely'' modifies the verb ''calibrated'', describing HOW the calibration was done — it is an adverb.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('328c349c-6117-4a42-a285-9fec3553c0f4', '5e47b501-7176-42f8-8137-c5acc30759bc', 28, 'Choose the correct passive voice for: ''Engineers designed the new receiver circuit.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b7be971-e67b-4106-83f8-b7d31ca36055', '328c349c-6117-4a42-a285-9fec3553c0f4', 0, 'The new receiver circuit is designed by engineers.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c79f97b6-f855-4dbc-8555-d2c4501fc085', '328c349c-6117-4a42-a285-9fec3553c0f4', 1, 'The new receiver circuit was designed by engineers.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e810eae-e4c3-437b-8140-96c40c394af7', '328c349c-6117-4a42-a285-9fec3553c0f4', 2, 'The new receiver circuit designs by engineers.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84a9b8a1-e322-432d-bc6c-f8bd529f0db4', '328c349c-6117-4a42-a285-9fec3553c0f4', 3, 'The new receiver circuit has design by engineers.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('328c349c-6117-4a42-a285-9fec3553c0f4', 'c79f97b6-f855-4dbc-8555-d2c4501fc085', 'Simple past active (''designed'') converts to simple past passive: ''was designed by''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('54e506a9-7112-425c-acc1-a5971ecb22ad', '5e47b501-7176-42f8-8137-c5acc30759bc', 29, 'Choose the correct idiom to complete: ''After the system crash, the team had to ________ and rebuild the database from scratch.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9f2ddd4-a88b-4dde-a229-87030531111a', '54e506a9-7112-425c-acc1-a5971ecb22ad', 0, 'go back to the drawing board');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('272f9c10-4ee0-4442-91e8-8d5663b91e17', '54e506a9-7112-425c-acc1-a5971ecb22ad', 1, 'beat around the bush');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a005a227-c340-4d93-9843-60ba96edbabf', '54e506a9-7112-425c-acc1-a5971ecb22ad', 2, 'let the cat out of the bag');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3bf4722-ec28-496c-9a01-863590c73e0b', '54e506a9-7112-425c-acc1-a5971ecb22ad', 3, 'burn the midnight oil only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('54e506a9-7112-425c-acc1-a5971ecb22ad', 'd9f2ddd4-a88b-4dde-a229-87030531111a', '''Go back to the drawing board'' means to start over after a failure, fitting the context of rebuilding after a crash.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7ac9f7cb-faf4-4a72-b4c5-6e81318bad90', '5e47b501-7176-42f8-8137-c5acc30759bc', 30, 'Select the option nearest in meaning to ''Redundant'' (general, non-technical sense):');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c624365-f2b2-446d-a6d9-0216959b3321', '7ac9f7cb-faf4-4a72-b4c5-6e81318bad90', 0, 'Essential');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('56cb142e-cc3b-442d-87ff-94e392b0a86b', '7ac9f7cb-faf4-4a72-b4c5-6e81318bad90', 1, 'Superfluous / unnecessary');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('334e15a3-9ae1-495d-9013-193fe561bfcd', '7ac9f7cb-faf4-4a72-b4c5-6e81318bad90', 2, 'Efficient');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88fbc121-796b-483b-afca-b9855f60e1b0', '7ac9f7cb-faf4-4a72-b4c5-6e81318bad90', 3, 'Compact');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7ac9f7cb-faf4-4a72-b4c5-6e81318bad90', '56cb142e-cc3b-442d-87ff-94e392b0a86b', 'In its everyday (non-engineering) sense, ''Redundant'' means no longer needed or unnecessary — ''Superfluous'' is the closest synonym.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('333a9cdc-b424-44ee-914e-13b1671773f6', '5e47b501-7176-42f8-8137-c5acc30759bc', 31, 'Choose the correctly formed sentence:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9a71e88-bd85-4973-83d7-4e4e134096d6', '333a9cdc-b424-44ee-914e-13b1671773f6', 0, 'Either the transmitter or the receivers is faulty.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c19aeeee-8017-4c1a-a21c-70ddf50c244f', '333a9cdc-b424-44ee-914e-13b1671773f6', 1, 'Either the transmitter or the receivers are faulty.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e49f100a-67b5-4f2a-a09a-f4dc242e56a3', '333a9cdc-b424-44ee-914e-13b1671773f6', 2, 'Either the transmitter and the receivers are faulty.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('042e3bdb-b3e0-4909-8445-41615e870ed0', '333a9cdc-b424-44ee-914e-13b1671773f6', 3, 'Either the transmitter or the receiver''s are faulty.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('333a9cdc-b424-44ee-914e-13b1671773f6', 'c19aeeee-8017-4c1a-a21c-70ddf50c244f', 'With ''either...or'', the verb agrees with the noun closest to it (''receivers'', plural) — so ''are faulty'' is correct.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5bb8679d-7efa-49aa-8bf8-3e8a6d111c8a', '5e47b501-7176-42f8-8137-c5acc30759bc', 32, 'Fill in the blank with the correct preposition: ''The output voltage varies ________ the input frequency.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7ebdf97-6dbd-48e6-862f-a09767db0893', '5bb8679d-7efa-49aa-8bf8-3e8a6d111c8a', 0, 'with');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('078ca26e-8a25-49fb-bb16-1c7c4eafb2b9', '5bb8679d-7efa-49aa-8bf8-3e8a6d111c8a', 1, 'of');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('471e1fa1-3af8-4438-8363-3ea5b1bfdae5', '5bb8679d-7efa-49aa-8bf8-3e8a6d111c8a', 2, 'for');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5fe56914-5900-4e58-bcc3-d2527d875665', '5bb8679d-7efa-49aa-8bf8-3e8a6d111c8a', 3, 'at');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5bb8679d-7efa-49aa-8bf8-3e8a6d111c8a', 'f7ebdf97-6dbd-48e6-862f-a09767db0893', '''Varies with'' is the correct idiomatic pairing when describing how one quantity changes in relation to another.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5582add8-6f37-4614-89ea-0312d70cf704', '5e47b501-7176-42f8-8137-c5acc30759bc', 33, 'Choose the option that correctly converts to reported speech: He said, ''The circuit is working fine.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f18f5963-fcaa-4659-8c1e-73cf65afc912', '5582add8-6f37-4614-89ea-0312d70cf704', 0, 'He said that the circuit is working fine.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c5b77cc-ecbe-4ed0-8be4-f38910928c99', '5582add8-6f37-4614-89ea-0312d70cf704', 1, 'He said that the circuit was working fine.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77e33d89-4808-47b6-b329-c7b8b9097b2f', '5582add8-6f37-4614-89ea-0312d70cf704', 2, 'He said that the circuit has worked fine.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8aba225-0d36-452c-9c98-af13047219e1', '5582add8-6f37-4614-89ea-0312d70cf704', 3, 'He said that the circuit works fine.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5582add8-6f37-4614-89ea-0312d70cf704', '0c5b77cc-ecbe-4ed0-8be4-f38910928c99', 'In reported speech, present continuous (''is working'') shifts back to past continuous (''was working'') when the reporting verb is in the past tense.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2366be03-66f0-4717-bf0c-c45296cd41c9', '5e47b501-7176-42f8-8137-c5acc30759bc', 34, 'Identify the correctly spelled word among the options:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f28e01e-b6b7-467b-88be-7b863ba1cb4d', '2366be03-66f0-4717-bf0c-c45296cd41c9', 0, 'Oscilator');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b781acd-7adc-4c7a-8757-af13f216102b', '2366be03-66f0-4717-bf0c-c45296cd41c9', 1, 'Osscillator');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff5fdb9f-3ae4-4d87-90e5-8163b1046d23', '2366be03-66f0-4717-bf0c-c45296cd41c9', 2, 'Oscillator');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abf93b84-35b5-4029-b73e-a556430e4a27', '2366be03-66f0-4717-bf0c-c45296cd41c9', 3, 'Oscilllator');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2366be03-66f0-4717-bf0c-c45296cd41c9', 'ff5fdb9f-3ae4-4d87-90e5-8163b1046d23', '''Oscillator'' is the correct spelling — with a double ''l''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('82d2b816-dd2e-4765-ac9a-4a5be091c69a', '5e47b501-7176-42f8-8137-c5acc30759bc', 35, 'Identify the sentence with correct subject-verb agreement:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e5773d3-6817-4275-9089-32423327d37a', '82d2b816-dd2e-4765-ac9a-4a5be091c69a', 0, 'Neither of the components were defective.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9eda574-3457-4320-b552-35758133338c', '82d2b816-dd2e-4765-ac9a-4a5be091c69a', 1, 'Neither of the components was defective.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('030ec380-540e-4ad3-842a-393e287e8cf1', '82d2b816-dd2e-4765-ac9a-4a5be091c69a', 2, 'Neither of the component was defective.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d02cd20-fdad-4c70-9a1d-4a2779ad3439', '82d2b816-dd2e-4765-ac9a-4a5be091c69a', 3, 'Neither of the components has been defect.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('82d2b816-dd2e-4765-ac9a-4a5be091c69a', 'b9eda574-3457-4320-b552-35758133338c', '''Neither'' is grammatically singular, requiring a singular verb — ''was defective'' is correct.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d1c31bf9-2177-4bbb-a5eb-f34b9fb2d641', '5e47b501-7176-42f8-8137-c5acc30759bc', 36, 'Choose the word closest in meaning to ''Attenuation'' (in a signal/communication context):');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5649ed4-20c5-4fde-9e8d-1e1f79942b85', 'd1c31bf9-2177-4bbb-a5eb-f34b9fb2d641', 0, 'Amplification of a signal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26615c1d-81dc-42b1-964e-c758b5ff403c', 'd1c31bf9-2177-4bbb-a5eb-f34b9fb2d641', 1, 'Progressive reduction in signal strength as it travels through a medium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e1ac643-cbda-475d-a094-f791eb3fc372', 'd1c31bf9-2177-4bbb-a5eb-f34b9fb2d641', 2, 'Increase in frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed57978d-7125-44ae-96de-5aff78115882', 'd1c31bf9-2177-4bbb-a5eb-f34b9fb2d641', 3, 'Complete loss of the signal instantly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d1c31bf9-2177-4bbb-a5eb-f34b9fb2d641', '26615c1d-81dc-42b1-964e-c758b5ff403c', 'Attenuation refers to the gradual reduction in signal amplitude/strength as it propagates through a transmission medium (cable, fiber, air) — a fundamental concept in communication systems.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('aa64bf4b-66bf-4eec-beda-e0b1ac6793e3', '5e47b501-7176-42f8-8137-c5acc30759bc', 37, 'Choose the correct sentence:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0b96137-7628-4cb1-acca-1a38e136f584', 'aa64bf4b-66bf-4eec-beda-e0b1ac6793e3', 0, 'The workload was distributed between the four engineers.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc63198f-86b7-4e03-aa4b-a6f203de2357', 'aa64bf4b-66bf-4eec-beda-e0b1ac6793e3', 1, 'The workload was distributed among the four engineers.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e78c83b-16a0-4992-be69-0bd0a7c4dea0', 'aa64bf4b-66bf-4eec-beda-e0b1ac6793e3', 2, 'The workload was distributed between the four engineer.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16d8aa61-21c7-4ef3-a824-6f779bdb82e1', 'aa64bf4b-66bf-4eec-beda-e0b1ac6793e3', 3, 'The workload was distributed among the four engineer.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aa64bf4b-66bf-4eec-beda-e0b1ac6793e3', 'fc63198f-86b7-4e03-aa4b-a6f203de2357', '''Among'' is used for three or more entities; since there are four engineers, ''among'' is grammatically correct (not ''between'', traditionally reserved for exactly two).', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f49d0720-3739-4648-8beb-e22c99f886ce', '5e47b501-7176-42f8-8137-c5acc30759bc', 38, 'Choose the correctly punctuated sentence:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fda32cd7-867f-43b5-901f-edd9b53a5bda', 'f49d0720-3739-4648-8beb-e22c99f886ce', 0, 'The kit includes a resistor an inductor, and a capacitor.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57ffed5c-d169-4a03-ab98-ac423ebc1a7a', 'f49d0720-3739-4648-8beb-e22c99f886ce', 1, 'The kit includes a resistor, an inductor and a capacitor.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b0e4ef8-0c0d-4f23-9fea-e70eb537b64e', 'f49d0720-3739-4648-8beb-e22c99f886ce', 2, 'The kit includes a resistor, an inductor, and a capacitor.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7cf59d03-3bd2-444e-9e6b-300bb6003bdf', 'f49d0720-3739-4648-8beb-e22c99f886ce', 3, 'The kit includes; a resistor, an inductor, a capacitor.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f49d0720-3739-4648-8beb-e22c99f886ce', '7b0e4ef8-0c0d-4f23-9fea-e70eb537b64e', 'A comma should separate each item in a list, including before the final conjunction (Oxford comma) for maximum clarity.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4e37eb35-50d2-4a0d-b6ac-ef4f376a8885', '5e47b501-7176-42f8-8137-c5acc30759bc', 39, 'Choose the option nearest in meaning to the idiom ''to troubleshoot an issue'':');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d517c933-ee2c-4710-9962-7e7472858e27', '4e37eb35-50d2-4a0d-b6ac-ef4f376a8885', 0, 'To create a new problem deliberately');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('71c7d1c8-ad36-4fcf-bcc3-440e3a62f409', '4e37eb35-50d2-4a0d-b6ac-ef4f376a8885', 1, 'To systematically identify and resolve the cause of a malfunction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c384aa0-ecbe-4ed5-8972-e8092821f6cb', '4e37eb35-50d2-4a0d-b6ac-ef4f376a8885', 2, 'To ignore a malfunction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5d1ccc9-e5db-46b0-a04e-0e134cee338c', '4e37eb35-50d2-4a0d-b6ac-ef4f376a8885', 3, 'To replace an entire system without diagnosis');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4e37eb35-50d2-4a0d-b6ac-ef4f376a8885', '71c7d1c8-ad36-4fcf-bcc3-440e3a62f409', '''To troubleshoot'' means to systematically diagnose and resolve the source of a problem or malfunction — a term with direct engineering usage as well as this idiomatic sense.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7b36071d-af61-4e06-b2e3-1655e675541f', '5e47b501-7176-42f8-8137-c5acc30759bc', 40, 'Fill in the blank: ''The technician''s ________ approach to debugging saved significant time.''');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77a1271b-c3d7-426e-886c-80b00d51e6d3', '7b36071d-af61-4e06-b2e3-1655e675541f', 0, 'haphazard');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e677098-7229-42c2-9b14-45bc69aaa66a', '7b36071d-af61-4e06-b2e3-1655e675541f', 1, 'methodical');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('905f82bf-8d63-40b7-b965-623c5a7a39a8', '7b36071d-af61-4e06-b2e3-1655e675541f', 2, 'careless');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bc2b345-e6d2-4b4c-b5c6-ddfcb4902e7b', '7b36071d-af61-4e06-b2e3-1655e675541f', 3, 'impulsive');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7b36071d-af61-4e06-b2e3-1655e675541f', '9e677098-7229-42c2-9b14-45bc69aaa66a', '''Methodical'' (systematic, orderly) fits the context of a debugging approach praised for saving time, unlike the disorganized alternatives.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a6704591-6a78-4e92-b34e-616b70520820', '5e47b501-7176-42f8-8137-c5acc30759bc', 41, 'Statements: All transistors are semiconductor devices. Some semiconductor devices are used in amplifiers. Conclusions: I. Some transistors are used in amplifiers. II. All semiconductor devices are transistors. Which conclusion(s) follow?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00197e27-2197-426a-8a44-b5f4f455a776', 'a6704591-6a78-4e92-b34e-616b70520820', 0, 'Only I follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34f4c235-85e7-4fe7-b0fa-63812122a93f', 'a6704591-6a78-4e92-b34e-616b70520820', 1, 'Only II follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e464812-99e1-487d-a9e8-fe49f707090a', 'a6704591-6a78-4e92-b34e-616b70520820', 2, 'Both follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ab1c0e6-e614-43c4-a033-8d87da0cf940', 'a6704591-6a78-4e92-b34e-616b70520820', 3, 'Neither follows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a6704591-6a78-4e92-b34e-616b70520820', '8ab1c0e6-e614-43c4-a033-8d87da0cf940', 'There''s no guarantee the ''used in amplifiers'' subset overlaps specifically with the ''transistors'' subset, so I doesn''t necessarily follow. II reverses the given relationship incorrectly. Neither conclusion follows with certainty.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('54310653-00b5-4188-ba10-6d07be59a0c5', '5e47b501-7176-42f8-8137-c5acc30759bc', 42, 'If ''SIGNAL'' is coded as ''TJHOBM'' in a certain code, how is ''CIRCUIT'' coded in that language?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df6d7222-78f2-4289-aa9c-2797c69f5927', '54310653-00b5-4188-ba10-6d07be59a0c5', 0, 'DJSDVJU');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97013e80-0260-43fb-8cca-0470b0e0ef33', '54310653-00b5-4188-ba10-6d07be59a0c5', 1, 'DJSDUJV');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8fb0a3c-7daa-4d4c-a970-b7b22f4b9d16', '54310653-00b5-4188-ba10-6d07be59a0c5', 2, 'DJSDVIU');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af9f4a08-9812-4687-a6c2-4578be00f536', '54310653-00b5-4188-ba10-6d07be59a0c5', 3, 'CJSDVJU');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('54310653-00b5-4188-ba10-6d07be59a0c5', 'df6d7222-78f2-4289-aa9c-2797c69f5927', 'Each letter is shifted forward by 1 (S→T, I→J, G→H, N→O, A→B, L→M). Applying this to CIRCUIT: C→D, I→J, R→S, C→D, U→V, I→J, T→U, giving ''DJSDVJU''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7b4496e2-c858-4f8b-a1d6-8d3fcfd82786', '5e47b501-7176-42f8-8137-c5acc30759bc', 43, 'Find the next number in the series: 2, 5, 10, 17, 26, ?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3af6031f-5e00-4650-8108-3122dce2a121', '7b4496e2-c858-4f8b-a1d6-8d3fcfd82786', 0, '35');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a484fe0-02d6-4b82-9aff-56c6a2484fc6', '7b4496e2-c858-4f8b-a1d6-8d3fcfd82786', 1, '37');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f7c49f8-8bf0-4361-9145-bb235b282cca', '7b4496e2-c858-4f8b-a1d6-8d3fcfd82786', 2, '39');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b2b8cf0-6806-4ea5-b292-27b805009acf', '7b4496e2-c858-4f8b-a1d6-8d3fcfd82786', 3, '41');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7b4496e2-c858-4f8b-a1d6-8d3fcfd82786', '8a484fe0-02d6-4b82-9aff-56c6a2484fc6', 'The differences are 3, 5, 7, 9 (consecutive odd numbers). Next difference is 11: 26+11=37. (This also matches n²+1: 1+1=2, 4+1=5, 9+1=10, 16+1=17, 25+1=26, 36+1=37.)', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('03581b3d-eb18-4756-955c-82f47a31412b', '5e47b501-7176-42f8-8137-c5acc30759bc', 44, 'Choose the odd one out: Resistor, Capacitor, Inductor, Ammeter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f242b9d7-7b91-449c-814c-48d4f1876996', '03581b3d-eb18-4756-955c-82f47a31412b', 0, 'Resistor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('235054b0-634f-49fa-8a78-8e012ee658c3', '03581b3d-eb18-4756-955c-82f47a31412b', 1, 'Capacitor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43d41e77-d828-4ac4-91c6-4cece01967cd', '03581b3d-eb18-4756-955c-82f47a31412b', 2, 'Inductor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25ca8287-8d64-43f7-93e6-1637a93d7f8c', '03581b3d-eb18-4756-955c-82f47a31412b', 3, 'Ammeter');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('03581b3d-eb18-4756-955c-82f47a31412b', '25ca8287-8d64-43f7-93e6-1637a93d7f8c', 'Resistor, Capacitor, and Inductor are passive circuit components; Ammeter is a measuring instrument — the odd one out.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6da1344c-0a7f-4c0d-a71e-372dc83e0af7', '5e47b501-7176-42f8-8137-c5acc30759bc', 45, 'Five signals P, Q, R, S, T have different frequencies. P has a higher frequency than Q but lower than R. S has the lowest frequency. T has a higher frequency than R. What is the correct order from highest to lowest?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('207ed6be-78ce-4d8b-8e24-f56fc626d9c2', '6da1344c-0a7f-4c0d-a71e-372dc83e0af7', 0, 'T, R, P, Q, S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c445a572-6140-4c4f-bc09-d70043590673', '6da1344c-0a7f-4c0d-a71e-372dc83e0af7', 1, 'T, R, Q, P, S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4dfe5164-803a-4c29-a9b8-bb7f06c5f1c2', '6da1344c-0a7f-4c0d-a71e-372dc83e0af7', 2, 'R, T, P, Q, S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('adbd6d52-7048-4511-8fc2-b1bd1d24c065', '6da1344c-0a7f-4c0d-a71e-372dc83e0af7', 3, 'T, P, R, Q, S');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6da1344c-0a7f-4c0d-a71e-372dc83e0af7', '207ed6be-78ce-4d8b-8e24-f56fc626d9c2', 'Given: R > P > Q, T > R, S is lowest. Combining: T > R > P > Q > S — matching option A.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d90068d8-2bee-4d25-bde3-c757dee19b36', '5e47b501-7176-42f8-8137-c5acc30759bc', 46, 'If ''A / B'' means ''A is the transmitter of B'' and ''B * C'' means ''B is connected to C'', what does ''P / Q * R'' establish?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59f70206-719c-4a86-9da1-2df024064afc', 'd90068d8-2bee-4d25-bde3-c757dee19b36', 0, 'P transmits to Q, and Q is connected to R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dae61648-e5b2-4d33-a4d4-5139592f9d1e', 'd90068d8-2bee-4d25-bde3-c757dee19b36', 1, 'P and R are the same device');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a874663b-f985-45be-ae06-0b521d54a7e2', 'd90068d8-2bee-4d25-bde3-c757dee19b36', 2, 'R transmits to P');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53b71ed2-4bd1-4888-a5be-229408157fb3', 'd90068d8-2bee-4d25-bde3-c757dee19b36', 3, 'No relationship can be established');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d90068d8-2bee-4d25-bde3-c757dee19b36', '59f70206-719c-4a86-9da1-2df024064afc', '''P / Q'' means P is the transmitter of Q. ''Q * R'' means Q is connected to R. So the combined relationship is: P transmits to Q, and Q is connected to R — matching option A.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9204ecd7-5de1-4cee-b527-7bfd2569b006', '5e47b501-7176-42f8-8137-c5acc30759bc', 47, 'Complete the analogy: Transmitter is to Receiver as Encoder is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0d68b87-c32d-415a-8b56-f675b7d6163e', '9204ecd7-5de1-4cee-b527-7bfd2569b006', 0, 'Decoder');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c8d4a78-95ce-49a6-a851-65a9dd3dbd51', '9204ecd7-5de1-4cee-b527-7bfd2569b006', 1, 'Amplifier');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18042162-c8df-4a5a-995d-0f3a6e0e2964', '9204ecd7-5de1-4cee-b527-7bfd2569b006', 2, 'Filter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cac13054-f153-45c3-aa48-3ef3ef139434', '9204ecd7-5de1-4cee-b527-7bfd2569b006', 3, 'Oscillator');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9204ecd7-5de1-4cee-b527-7bfd2569b006', 'a0d68b87-c32d-415a-8b56-f675b7d6163e', 'A transmitter sends a signal that a receiver picks up and processes; similarly, an encoder converts information into a coded format, and a decoder reverses that process — the analogy is ''sender/encoder : receiver/decoder'' as complementary pairs.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a6228337-901b-46b0-a81e-b8961ead0e73', '5e47b501-7176-42f8-8137-c5acc30759bc', 48, 'In a certain code, if ''RADAR'' is coded as ''18-1-4-1-18'' (each letter replaced by its alphabetical position), what is ''SONAR'' coded as?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b51839f-0629-44aa-b8c7-8ad22fdb6479', 'a6228337-901b-46b0-a81e-b8961ead0e73', 0, '19-15-14-1-18');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('214181f3-3275-4e69-ac6f-0af901bb30c5', 'a6228337-901b-46b0-a81e-b8961ead0e73', 1, '19-14-15-1-18');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8935bfbc-913b-417d-b44e-a87b5a44b64b', 'a6228337-901b-46b0-a81e-b8961ead0e73', 2, '18-15-14-1-19');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c20b2999-059f-4896-990f-44e0af111dbd', 'a6228337-901b-46b0-a81e-b8961ead0e73', 3, '19-15-14-2-18');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a6228337-901b-46b0-a81e-b8961ead0e73', '7b51839f-0629-44aa-b8c7-8ad22fdb6479', 'S=19, O=15, N=14, A=1, R=18 — matching each letter to its exact alphabetical position gives ''19-15-14-1-18''.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('082a6f35-1fd7-47ae-94e5-64dccbe8000b', '5e47b501-7176-42f8-8137-c5acc30759bc', 49, 'A is the son of B. C is the daughter of B. D is the husband of B. How is D related to A?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e020088e-942a-4ab4-a717-a72258b510c7', '082a6f35-1fd7-47ae-94e5-64dccbe8000b', 0, 'Father');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77453688-e1d4-429e-80f8-a72408d0d11c', '082a6f35-1fd7-47ae-94e5-64dccbe8000b', 1, 'Brother');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('afbcdb9b-d417-444d-9487-0e05aff4c9b7', '082a6f35-1fd7-47ae-94e5-64dccbe8000b', 2, 'Uncle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c80ac7a-412b-43c2-a9e6-c59e72ae19cf', '082a6f35-1fd7-47ae-94e5-64dccbe8000b', 3, 'Grandfather');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('082a6f35-1fd7-47ae-94e5-64dccbe8000b', 'e020088e-942a-4ab4-a717-a72258b510c7', 'B is A''s parent (since A is B''s son), and D is B''s husband — since A is B''s child and D is B''s spouse, D is A''s father.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a88d53ec-545f-4ad8-b28f-c4a5cc5850c5', '5e47b501-7176-42f8-8137-c5acc30759bc', 50, 'Statements: No amplifier is a filter. All filters are passive circuits. Conclusions: I. No amplifier is a passive circuit. II. Some passive circuits are filters. Which conclusion(s) follow?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c26c0113-ede9-47d7-adb2-3646a523485b', 'a88d53ec-545f-4ad8-b28f-c4a5cc5850c5', 0, 'Only I follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2f934bf-028d-4f4f-94e7-1a9e091a3f71', 'a88d53ec-545f-4ad8-b28f-c4a5cc5850c5', 1, 'Only II follows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90fa920a-5d29-4d4e-a3b3-100d38c2e99d', 'a88d53ec-545f-4ad8-b28f-c4a5cc5850c5', 2, 'Both follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ad1bff8-6d04-4fdc-989b-e118897ec137', 'a88d53ec-545f-4ad8-b28f-c4a5cc5850c5', 3, 'Neither follows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a88d53ec-545f-4ad8-b28f-c4a5cc5850c5', 'd2f934bf-028d-4f4f-94e7-1a9e091a3f71', '''No amplifier is a filter'' and ''All filters are passive circuits'' does NOT imply ''no amplifier is a passive circuit'' (an amplifier could still be passive through some other path) — so I does not follow. ''All filters are passive circuits'' directly implies ''Some passive circuits are filters'' — so II follows.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c4d2b0c3-7a2c-41e6-8959-c5a784d36d6a', '5e47b501-7176-42f8-8137-c5acc30759bc', 51, 'A clock shows 9:40. What is the angle between the hour and minute hands?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4343da2-7b7a-40d3-918a-d3cb96f78e0a', 'c4d2b0c3-7a2c-41e6-8959-c5a784d36d6a', 0, '40°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('edfeb411-0287-4d06-a3b4-a96bacfba6c2', 'c4d2b0c3-7a2c-41e6-8959-c5a784d36d6a', 1, '50°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('454b0a05-613c-4321-a43c-cfb89ef3272e', 'c4d2b0c3-7a2c-41e6-8959-c5a784d36d6a', 2, '60°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1733daa-a836-43b9-b440-ef2da6359b06', 'c4d2b0c3-7a2c-41e6-8959-c5a784d36d6a', 3, '70°');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c4d2b0c3-7a2c-41e6-8959-c5a784d36d6a', 'edfeb411-0287-4d06-a3b4-a96bacfba6c2', 'At 9:40, the minute hand is at the ''8'' position (240° from 12). The hour hand is at 9×30 + 40×0.5 = 270 + 20 = 290° from 12. The angle between them is |290 − 240| = 50°.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1b16031a-5f1d-4c5c-a40f-5407e49c239a', '5e47b501-7176-42f8-8137-c5acc30759bc', 52, 'Find the odd one out: (2,8), (3,27), (4,64), (5,100)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fcc2533d-468b-485b-8112-cd4beba622cd', '1b16031a-5f1d-4c5c-a40f-5407e49c239a', 0, '(2,8)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76c0faa4-4233-413e-87bf-35dc08879ac7', '1b16031a-5f1d-4c5c-a40f-5407e49c239a', 1, '(3,27)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e83708d-4114-4e23-aafe-adc7dee44b85', '1b16031a-5f1d-4c5c-a40f-5407e49c239a', 2, '(4,64)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f786910-0180-4410-b401-bc92d3b74338', '1b16031a-5f1d-4c5c-a40f-5407e49c239a', 3, '(5,100)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1b16031a-5f1d-4c5c-a40f-5407e49c239a', '0f786910-0180-4410-b401-bc92d3b74338', 'In (2,8), (3,27), and (4,64), the second number is the cube of the first (2³=8, 3³=27, 4³=64). In (5,100), 5³=125, not 100 — this pair breaks the pattern.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a9d32afc-48ff-49c4-9332-01206f311254', '5e47b501-7176-42f8-8137-c5acc30759bc', 53, 'If East becomes North-West, West becomes South-East, then South becomes:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23ed390b-7185-4505-8944-77433ed04c02', 'a9d32afc-48ff-49c4-9332-01206f311254', 0, 'North-East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6dabe703-e36f-4c4d-8768-7f43e1d9f9ff', 'a9d32afc-48ff-49c4-9332-01206f311254', 1, 'North-West');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b9e9d3c-a3c4-401a-84af-8c2eb32acaf9', 'a9d32afc-48ff-49c4-9332-01206f311254', 2, 'South-West');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3458b4de-8882-4b14-b697-4e0ef00cba5c', 'a9d32afc-48ff-49c4-9332-01206f311254', 3, 'North');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a9d32afc-48ff-49c4-9332-01206f311254', '23ed390b-7185-4505-8944-77433ed04c02', 'The transformation is a 135° anticlockwise rotation of directions (East→North-West is a 135° anticlockwise shift; West→South-East confirms the same shift). Applying the same 135° anticlockwise rotation to South gives North-East.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d50e2b62-1222-4f54-8d7d-a871bdc925f3', '5e47b501-7176-42f8-8137-c5acc30759bc', 54, 'A can assemble a circuit board in 15 hours, and B can assemble it in 10 hours. Working together, how long will they take?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e86a932-6a8a-47ad-92f4-a2d2d055330a', 'd50e2b62-1222-4f54-8d7d-a871bdc925f3', 0, '5 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cab56d6f-719b-4ae6-bf4a-d5a50f5a1cc9', 'd50e2b62-1222-4f54-8d7d-a871bdc925f3', 1, '6 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24bdabee-a99c-449b-a0d7-1e567567962f', 'd50e2b62-1222-4f54-8d7d-a871bdc925f3', 2, '7 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ff41c1a-a494-4ecf-926a-063f3a3e276e', 'd50e2b62-1222-4f54-8d7d-a871bdc925f3', 3, '8 hours');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d50e2b62-1222-4f54-8d7d-a871bdc925f3', 'cab56d6f-719b-4ae6-bf4a-d5a50f5a1cc9', 'A''s rate = 1/15, B''s rate = 1/10. Combined rate = 1/15 + 1/10 = 2/30 + 3/30 = 5/30 = 1/6 (jobs/hour). Time = 6 hours.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('607ea5c7-cd7d-4007-8ac4-1011bf366a8c', '5e47b501-7176-42f8-8137-c5acc30759bc', 55, 'Choose the word that does NOT belong with the others: Oscilloscope, Multimeter, Function Generator, Capacitor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83f04500-2062-4b4a-a6ad-1ea0da39d70a', '607ea5c7-cd7d-4007-8ac4-1011bf366a8c', 0, 'Oscilloscope');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92808a27-84cc-474e-9d4f-0c5c97a99ea0', '607ea5c7-cd7d-4007-8ac4-1011bf366a8c', 1, 'Multimeter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44560d42-aa28-4684-ad9f-e68513c61f1f', '607ea5c7-cd7d-4007-8ac4-1011bf366a8c', 2, 'Function Generator');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ae332e9-5a5b-4cbc-a622-31361cf0ddeb', '607ea5c7-cd7d-4007-8ac4-1011bf366a8c', 3, 'Capacitor');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('607ea5c7-cd7d-4007-8ac4-1011bf366a8c', '3ae332e9-5a5b-4cbc-a622-31361cf0ddeb', 'Oscilloscope, Multimeter, and Function Generator are all test/measurement instruments; a Capacitor is a passive circuit component, not a measuring instrument — the odd one out.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3566f903-f273-41d2-85ff-ecb5d1ba8912', '5e47b501-7176-42f8-8137-c5acc30759bc', 56, 'In a row of 45 antennas, one is 20th from the left. What is its position from the right?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed998b86-0cd5-49e0-9367-b9ce07fe0c12', '3566f903-f273-41d2-85ff-ecb5d1ba8912', 0, '25th');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('167db6ab-bb32-4de6-9b23-a3305e13718c', '3566f903-f273-41d2-85ff-ecb5d1ba8912', 1, '26th');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('832abf58-8c49-4a00-a272-8c1713ea9f38', '3566f903-f273-41d2-85ff-ecb5d1ba8912', 2, '27th');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ddbb7f3-c402-4fb7-85dc-6f2c976ced3e', '3566f903-f273-41d2-85ff-ecb5d1ba8912', 3, '24th');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3566f903-f273-41d2-85ff-ecb5d1ba8912', '167db6ab-bb32-4de6-9b23-a3305e13718c', 'Position from the right = (Total − Position from left) + 1 = (45 − 20) + 1 = 26th from the right.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f7bfa728-eeb6-4265-b50e-04d60c337498', '5e47b501-7176-42f8-8137-c5acc30759bc', 57, 'Which term logically completes the series: AM Radio, FM Radio, Television, ?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0082846-8c55-45af-bbc7-08d469f421f9', 'f7bfa728-eeb6-4265-b50e-04d60c337498', 0, 'Telegraph (a much earlier, distinct point-to-point technology, breaking the broadcast-medium pattern)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7eaa0318-c199-4a16-a70a-eef7c012d3dc', 'f7bfa728-eeb6-4265-b50e-04d60c337498', 1, 'Satellite Broadcasting (a broadcast medium, continuing the pattern)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('088ac6ee-4791-42be-87c0-ded40ec8a26a', 'f7bfa728-eeb6-4265-b50e-04d60c337498', 2, 'Telephone (a point-to-point, not broadcast, technology)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0243ee4-3821-4f6b-9f66-0980b15bcfad', 'f7bfa728-eeb6-4265-b50e-04d60c337498', 3, 'Morse Code (not an electronic transmission medium)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f7bfa728-eeb6-4265-b50e-04d60c337498', '7eaa0318-c199-4a16-a70a-eef7c012d3dc', 'AM Radio, FM Radio, and Television are all one-to-many broadcast communication media. Satellite Broadcasting is also a broadcast medium, continuing the pattern — the other options are point-to-point or non-electronic technologies.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5345dd72-0cf3-481b-8a3e-66bafd50f060', '5e47b501-7176-42f8-8137-c5acc30759bc', 58, 'If today is Wednesday, what day will it be 100 days from now?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a00a619-4a84-48bb-a76c-441eef90720a', '5345dd72-0cf3-481b-8a3e-66bafd50f060', 0, 'Wednesday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c583cf59-dfc4-49ca-b7f8-583b6f541cc7', '5345dd72-0cf3-481b-8a3e-66bafd50f060', 1, 'Thursday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c10e35b4-a037-4445-8d16-063813f12a0b', '5345dd72-0cf3-481b-8a3e-66bafd50f060', 2, 'Friday');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3d288fd-755f-47cf-ad45-cd436a6d3949', '5345dd72-0cf3-481b-8a3e-66bafd50f060', 3, 'Saturday');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5345dd72-0cf3-481b-8a3e-66bafd50f060', 'c10e35b4-a037-4445-8d16-063813f12a0b', '100 days = 14 weeks + 2 days. 14 weeks brings us back to Wednesday, and 2 more days brings us to Friday.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1d437046-95d8-4898-a532-d46eaea0d096', '5e47b501-7176-42f8-8137-c5acc30759bc', 59, 'Statements: All modulators shift signal frequency. Some frequency-shifting devices are expensive. Conclusion: Some modulators are expensive. Is this conclusion valid based strictly on the statements given?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8d8d998-fe53-452b-a8e4-8cdac1ec2f56', '1d437046-95d8-4898-a532-d46eaea0d096', 0, 'Valid — it follows directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('367e4a67-238d-40b4-bd5f-8b274f87787a', '1d437046-95d8-4898-a532-d46eaea0d096', 1, 'Invalid — it does not necessarily follow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('673360e9-99e7-4cda-b410-073166dd1db7', '1d437046-95d8-4898-a532-d46eaea0d096', 2, 'Valid only if all frequency-shifting devices are modulators');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5231c372-80a0-4ca1-991a-65710c9be1a1', '1d437046-95d8-4898-a532-d46eaea0d096', 3, 'Cannot be determined without additional data');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1d437046-95d8-4898-a532-d46eaea0d096', '367e4a67-238d-40b4-bd5f-8b274f87787a', 'The statements establish modulators are a subset of frequency-shifting devices, and some (unspecified) frequency-shifting devices are expensive — but there''s no guarantee the ''expensive'' subset overlaps with ''modulators'' specifically. The conclusion does not necessarily follow.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('41cce21e-7c50-4dab-910e-71bef8557d46', '5e47b501-7176-42f8-8137-c5acc30759bc', 60, 'A father''s age is 4 times his son''s age. In 20 years, the father''s age will be twice his son''s age. What is the son''s current age?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03161f37-9767-4082-b7f2-089fccabd2cd', '41cce21e-7c50-4dab-910e-71bef8557d46', 0, '8 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16a9465f-0b79-4627-950f-acdbffd3921e', '41cce21e-7c50-4dab-910e-71bef8557d46', 1, '10 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8501749-faaa-43a2-b03e-be1fed3e23fb', '41cce21e-7c50-4dab-910e-71bef8557d46', 2, '12 years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('add7e6f8-d8f9-4472-ba63-05e5a421cf42', '41cce21e-7c50-4dab-910e-71bef8557d46', 3, '15 years');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('41cce21e-7c50-4dab-910e-71bef8557d46', '16a9465f-0b79-4627-950f-acdbffd3921e', 'Let son''s age = x, father''s age = 4x. In 20 years: (4x+20) = 2(x+20). Solving: 4x+20 = 2x+40, so 2x=20, x=10. Son''s current age is 10 years.', 'English & Reasoning — general competitive-exam style practice content, not an official HAL paper.');

-- ── Section: Electronics & Communication Engineering (Discipline) (100 questions) — Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e05beab8-49de-4eae-8ee7-173593896d09', '5e47b501-7176-42f8-8137-c5acc30759bc', 61, 'In a common-base BJT amplifier configuration, the voltage gain and phase relationship between input and output are:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ddf08437-bfc6-4880-b07a-2073abe5df3d', 'e05beab8-49de-4eae-8ee7-173593896d09', 0, 'High voltage gain, 180° phase shift');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a24b8c94-7faf-4e04-857e-9ab4fe8a8abf', 'e05beab8-49de-4eae-8ee7-173593896d09', 1, 'High voltage gain, no phase shift (in phase)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f8f4fd1-b6d1-40c8-91d9-f1202503717f', 'e05beab8-49de-4eae-8ee7-173593896d09', 2, 'Low current gain, and a phase shift dependent on frequency only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dab25bfc-e616-41c5-b31f-8b395dce9037', 'e05beab8-49de-4eae-8ee7-173593896d09', 3, 'Zero voltage gain always');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e05beab8-49de-4eae-8ee7-173593896d09', 'a24b8c94-7faf-4e04-857e-9ab4fe8a8abf', 'A common-base amplifier provides high voltage gain with no phase inversion (input and output are in phase), unlike the common-emitter configuration, which inverts phase by 180°. Common-base current gain (alpha) is always slightly less than 1.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5d7aed50-1179-4b26-8a3d-e248cea8db27', '5e47b501-7176-42f8-8137-c5acc30759bc', 62, 'An emitter follower (common-collector) BJT configuration is primarily used for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e13927db-af91-407a-8088-05df2dc25692', '5d7aed50-1179-4b26-8a3d-e248cea8db27', 0, 'High voltage gain applications');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('549866dd-e605-4bd6-b9bf-7e3188201d6d', '5d7aed50-1179-4b26-8a3d-e248cea8db27', 1, 'Impedance matching — high input impedance, low output impedance, with voltage gain close to unity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('269dcd2e-3287-46ed-bd8f-0eca6ac50275', '5d7aed50-1179-4b26-8a3d-e248cea8db27', 2, 'Signal inversion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e05f614-7732-4305-a3bd-6c5867f12e3a', '5d7aed50-1179-4b26-8a3d-e248cea8db27', 3, 'Oscillation generation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5d7aed50-1179-4b26-8a3d-e248cea8db27', '549866dd-e605-4bd6-b9bf-7e3188201d6d', 'The emitter follower (common-collector) configuration provides voltage gain close to unity, but with high input impedance and low output impedance — making it ideal as a buffer stage for impedance matching between a high-impedance source and a low-impedance load.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b8006258-1c12-43b9-9b50-5c3d219f7c6a', '5e47b501-7176-42f8-8137-c5acc30759bc', 63, 'The primary function of a differential amplifier is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('535be597-6a4f-4575-ba6e-f79765cd4b06', 'b8006258-1c12-43b9-9b50-5c3d219f7c6a', 0, 'Amplify the sum of two input signals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c233209-6df4-4725-bfb3-ef106017b74e', 'b8006258-1c12-43b9-9b50-5c3d219f7c6a', 1, 'Amplify the difference between two input signals while rejecting common-mode (identical) signals present on both inputs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84231b8a-c86c-49a7-9819-8ab6d188eb3e', 'b8006258-1c12-43b9-9b50-5c3d219f7c6a', 2, 'Convert AC to DC');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('198fc28c-2ffa-4f96-b7cb-2b7f0ef3a47d', 'b8006258-1c12-43b9-9b50-5c3d219f7c6a', 3, 'Generate a fixed reference voltage only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b8006258-1c12-43b9-9b50-5c3d219f7c6a', '3c233209-6df4-4725-bfb3-ef106017b74e', 'A differential amplifier amplifies the difference between its two input signals while ideally rejecting any common-mode signal (noise or interference present identically on both inputs) — a foundational building block of op-amps and instrumentation amplifiers.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('31bbfc63-b72c-4510-8b7a-5a91ee7855de', '5e47b501-7176-42f8-8137-c5acc30759bc', 64, 'The Common Mode Rejection Ratio (CMRR) of an amplifier is a measure of its ability to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f89415a9-24ab-4d8f-8bcb-eb9e84420334', '31bbfc63-b72c-4510-8b7a-5a91ee7855de', 0, 'Amplify differential signals only, with no regard for common-mode signals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c30ad4d-d2a8-41d5-81a0-3d407dfbeaa3', '31bbfc63-b72c-4510-8b7a-5a91ee7855de', 1, 'Reject common-mode signals relative to how well it amplifies differential signals — a higher CMRR is better');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbeeb9ba-b01b-4880-be56-506e1cdf8e11', '31bbfc63-b72c-4510-8b7a-5a91ee7855de', 2, 'Increase output impedance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a67f0672-a20c-4fce-b350-18dcfbf1292d', '31bbfc63-b72c-4510-8b7a-5a91ee7855de', 3, 'Generate oscillations');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('31bbfc63-b72c-4510-8b7a-5a91ee7855de', '0c30ad4d-d2a8-41d5-81a0-3d407dfbeaa3', 'CMRR quantifies an amplifier''s ability to reject common-mode signals (noise/interference appearing identically on both inputs) relative to its differential gain — a higher CMRR (typically expressed in dB) indicates better rejection of unwanted common-mode noise, a critical specification for instrumentation and differential amplifiers.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cd77fab5-d1c6-48c6-a474-d766da31a4c4', '5e47b501-7176-42f8-8137-c5acc30759bc', 65, 'In an op-amp based inverting amplifier, the closed-loop voltage gain is given by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19b8572f-b497-4432-8edb-cc1c2eb9d3f1', 'cd77fab5-d1c6-48c6-a474-d766da31a4c4', 0, 'Rf / Rin (with a negative sign, indicating phase inversion)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b39da29-9bcc-4ecb-b50f-cda8d55a9959', 'cd77fab5-d1c6-48c6-a474-d766da31a4c4', 1, 'Rin / Rf');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f00780a8-6ef8-4fc2-ba18-cd324c6f8a43', 'cd77fab5-d1c6-48c6-a474-d766da31a4c4', 2, '1 + Rf/Rin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fcafacbc-ec8a-4d86-8255-bd5f8f076a5a', 'cd77fab5-d1c6-48c6-a474-d766da31a4c4', 3, 'Always equal to the op-amp''s open-loop gain');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cd77fab5-d1c6-48c6-a474-d766da31a4c4', '19b8572f-b497-4432-8edb-cc1c2eb9d3f1', 'For an inverting op-amp amplifier, the closed-loop gain is -Rf/Rin (Rf = feedback resistor, Rin = input resistor) — the negative sign indicates the output is inverted (180° out of phase) relative to the input.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('65f673ed-1e70-4b1e-a27a-92a5d53ef741', '5e47b501-7176-42f8-8137-c5acc30759bc', 66, 'A non-inverting op-amp amplifier''s closed-loop gain is given by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7179661c-4dde-426c-94c9-16a5e31034c0', '65f673ed-1e70-4b1e-a27a-92a5d53ef741', 0, '-Rf/Rin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a56532c3-f195-43d8-86ec-61002e05bbca', '65f673ed-1e70-4b1e-a27a-92a5d53ef741', 1, '1 + Rf/Rin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b12511d-40ba-44f9-9cb2-d4ed1f291bf2', '65f673ed-1e70-4b1e-a27a-92a5d53ef741', 2, 'Rin/Rf');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de397f34-895c-4b87-a2a7-ac0f9c6d6037', '65f673ed-1e70-4b1e-a27a-92a5d53ef741', 3, 'Always less than 1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('65f673ed-1e70-4b1e-a27a-92a5d53ef741', 'a56532c3-f195-43d8-86ec-61002e05bbca', 'For a non-inverting op-amp amplifier, the closed-loop gain is (1 + Rf/Rin) — always greater than or equal to 1, and the output is in phase with the input (no inversion), unlike the inverting configuration.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e009ccba-cb7c-417b-81a1-6e6484d31558', '5e47b501-7176-42f8-8137-c5acc30759bc', 67, 'A class B power amplifier, compared to class A, offers:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('410f3514-6ade-4020-a2d9-55a7e7384fb0', 'e009ccba-cb7c-417b-81a1-6e6484d31558', 0, 'Lower efficiency but less distortion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('311deb73-1438-469e-9982-4f4856ad7317', 'e009ccba-cb7c-417b-81a1-6e6484d31558', 1, 'Higher theoretical efficiency (up to ~78.5%), but with crossover distortion as a real practical concern');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e32f9bb-e726-40fc-b965-22ba71b87bf7', 'e009ccba-cb7c-417b-81a1-6e6484d31558', 2, 'Zero power consumption at all times');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12eab13c-d6ea-4a41-a614-b31ffa51a1bc', 'e009ccba-cb7c-417b-81a1-6e6484d31558', 3, 'Identical performance to class A in every respect');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e009ccba-cb7c-417b-81a1-6e6484d31558', '311deb73-1438-469e-9982-4f4856ad7317', 'Class B amplifiers achieve significantly higher theoretical maximum efficiency (~78.5%) compared to Class A (~25-50%), since each transistor conducts for only half the input cycle (reducing quiescent power dissipation) — but this introduces crossover distortion near the zero-crossing point, addressed practically via class AB biasing.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('32ed21b2-14ee-49dd-acf8-b80a9e4b077c', '5e47b501-7176-42f8-8137-c5acc30759bc', 68, 'A voltage regulator IC (like the 7805) is used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b4afd643-22b9-4991-8d68-e4fa16f0fc7e', '32ed21b2-14ee-49dd-acf8-b80a9e4b077c', 0, 'Amplify audio signals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d11ecd9f-0a2a-4f60-8114-5bf6a29dd9f4', '32ed21b2-14ee-49dd-acf8-b80a9e4b077c', 1, 'Provide a stable, constant output voltage regardless of input voltage variations (within limits) and load current changes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51fda5ec-ade0-4dae-a9ac-9326076969ca', '32ed21b2-14ee-49dd-acf8-b80a9e4b077c', 2, 'Convert digital signals to analog');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9991477e-9074-4ab8-a5a8-82eb06ae05cd', '32ed21b2-14ee-49dd-acf8-b80a9e4b077c', 3, 'Generate high-frequency oscillations');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('32ed21b2-14ee-49dd-acf8-b80a9e4b077c', 'd11ecd9f-0a2a-4f60-8114-5bf6a29dd9f4', 'A voltage regulator IC (such as the 7805, providing a fixed 5V output) maintains a stable output voltage despite variations in input voltage (within its specified range) and changes in load current — essential for providing clean, stable power to sensitive electronic circuits.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7c2f2047-c936-4aa5-86b0-582ba3583348', '5e47b501-7176-42f8-8137-c5acc30759bc', 69, 'The ''slew rate'' of an op-amp specifies:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('536fd511-e8f6-4bc3-aad0-8b3e1b940326', '7c2f2047-c936-4aa5-86b0-582ba3583348', 0, 'The maximum DC gain achievable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2cb4ea28-75c6-43d0-a592-4485cff1b75f', '7c2f2047-c936-4aa5-86b0-582ba3583348', 1, 'The maximum rate of change of output voltage per unit time, limiting how fast the output can respond to a rapidly changing input');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd6bdfb2-3b71-4435-8363-1debd45e67ff', '7c2f2047-c936-4aa5-86b0-582ba3583348', 2, 'The op-amp''s input impedance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e2642ad-34dd-49ec-881d-160d27153919', '7c2f2047-c936-4aa5-86b0-582ba3583348', 3, 'The op-amp''s power supply voltage range');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7c2f2047-c936-4aa5-86b0-582ba3583348', '2cb4ea28-75c6-43d0-a592-4485cff1b75f', 'Slew rate (typically in V/µs) defines the maximum rate at which an op-amp''s output voltage can change — if an input signal demands a faster output change than the slew rate allows, the output becomes distorted (slew-rate limited), a critical specification for high-frequency or fast-transient applications.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fb48a384-1530-4900-98d9-a2dbcb02b263', '5e47b501-7176-42f8-8137-c5acc30759bc', 70, 'An active low-pass filter, built using an op-amp, offers which advantage over a purely passive RC low-pass filter?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f9f5ec7-2763-4879-a643-f7c8c620f7e8', 'fb48a384-1530-4900-98d9-a2dbcb02b263', 0, 'Lower cost always');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('400af1c3-d7db-468e-b528-8450cb4cf9fe', 'fb48a384-1530-4900-98d9-a2dbcb02b263', 1, 'Can provide signal gain in addition to filtering, and offers better load-isolation (buffering) due to the op-amp''s low output impedance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e08a643d-0688-4369-8978-422e2233f3c6', 'fb48a384-1530-4900-98d9-a2dbcb02b263', 2, 'Requires no power supply');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d842d341-3c28-4e17-9a65-ac3a65795630', 'fb48a384-1530-4900-98d9-a2dbcb02b263', 3, 'Works only at very high frequencies');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fb48a384-1530-4900-98d9-a2dbcb02b263', '400af1c3-d7db-468e-b528-8450cb4cf9fe', 'An active filter (using an op-amp) can provide signal amplification in addition to frequency filtering, and its low output impedance effectively isolates/buffers the filter''s response from loading effects of subsequent stages — advantages a passive RC filter alone cannot offer.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a768cd26-adbc-4f6b-b922-f73bdf1325ba', '5e47b501-7176-42f8-8137-c5acc30759bc', 71, 'The 555 timer IC, in astable mode, is commonly used to generate:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2debb636-e156-4ad0-a7f1-cdaf4f61e790', 'a768cd26-adbc-4f6b-b922-f73bdf1325ba', 0, 'A single, one-time output pulse');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64b06deb-8cc9-43dc-bf81-de717e9dc9cc', 'a768cd26-adbc-4f6b-b922-f73bdf1325ba', 1, 'A continuous square-wave output with a specific frequency and duty cycle, determined by external resistors and a capacitor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8bc3c014-f256-4823-a5d4-fa17b559819c', 'a768cd26-adbc-4f6b-b922-f73bdf1325ba', 2, 'A pure sine wave only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38b3030c-8f25-4a43-95dd-26dfcc940e2f', 'a768cd26-adbc-4f6b-b922-f73bdf1325ba', 3, 'A DC voltage reference only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a768cd26-adbc-4f6b-b922-f73bdf1325ba', '64b06deb-8cc9-43dc-bf81-de717e9dc9cc', 'The 555 timer in astable mode functions as a free-running oscillator, generating a continuous square-wave output whose frequency and duty cycle are set by external resistor and capacitor values — widely used for clock generation, LED flashers, and PWM applications.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('17040003-0e3a-4be1-85fc-3a3ecddfbc48', '5e47b501-7176-42f8-8137-c5acc30759bc', 72, 'A voltage follower (unity-gain buffer) op-amp circuit is characterized by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c85b3a4-bfa5-4414-b61a-a788c602e69d', '17040003-0e3a-4be1-85fc-3a3ecddfbc48', 0, 'Voltage gain of exactly 1, very high input impedance, and very low output impedance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e2ba64c-2add-4a6d-aea5-377baf61c505', '17040003-0e3a-4be1-85fc-3a3ecddfbc48', 1, 'Voltage gain much greater than 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cd2b527-3ba7-4fc3-b12d-fb84317e3a3d', '17040003-0e3a-4be1-85fc-3a3ecddfbc48', 2, 'Signal inversion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d7ce71d-86ea-4811-8669-1b1015714554', '17040003-0e3a-4be1-85fc-3a3ecddfbc48', 3, 'High input impedance but also high output impedance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('17040003-0e3a-4be1-85fc-3a3ecddfbc48', '4c85b3a4-bfa5-4414-b61a-a788c602e69d', 'A voltage follower has a closed-loop gain of exactly 1 (output directly follows input), combined with the op-amp''s inherently very high input impedance and very low output impedance — making it an ideal buffer stage for impedance matching without loading the source.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a601d513-a0e2-480d-bcf9-b0435bbcc5fa', '5e47b501-7176-42f8-8137-c5acc30759bc', 73, 'A rectifier circuit''s ''ripple factor'' is a measure of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e908509a-c085-4510-9f47-ba61529014aa', 'a601d513-a0e2-480d-bcf9-b0435bbcc5fa', 0, 'The DC output voltage magnitude');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1dd587b8-3107-43e0-92fc-17328b028aa8', 'a601d513-a0e2-480d-bcf9-b0435bbcc5fa', 1, 'The amount of AC component remaining in the rectified DC output, relative to the DC component');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16cc1c25-e147-483e-9647-c7cf11543f89', 'a601d513-a0e2-480d-bcf9-b0435bbcc5fa', 2, 'The rectifier''s efficiency in converting AC power to DC power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1da08bc4-702b-40e2-870c-c1f157b75983', 'a601d513-a0e2-480d-bcf9-b0435bbcc5fa', 3, 'The peak inverse voltage rating');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a601d513-a0e2-480d-bcf9-b0435bbcc5fa', '1dd587b8-3107-43e0-92fc-17328b028aa8', 'Ripple factor quantifies the residual AC (fluctuating) component remaining in a rectifier''s DC output, relative to the average DC component — a lower ripple factor indicates a smoother, more effectively filtered DC output.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b70d0e1f-7b0c-4f3c-830b-ab2c9f69ef91', '5e47b501-7176-42f8-8137-c5acc30759bc', 74, 'A full-wave bridge rectifier, compared to a center-tapped full-wave rectifier, requires:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbeb5278-c39e-46fe-a5ef-e6db7f11ecc6', 'b70d0e1f-7b0c-4f3c-830b-ab2c9f69ef91', 0, 'A center-tapped transformer and only 2 diodes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a845776b-eb1c-49ae-b892-6fa501eeed17', 'b70d0e1f-7b0c-4f3c-830b-ab2c9f69ef91', 1, 'No center-tapped transformer (uses an ordinary transformer) and 4 diodes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d08d3f2b-3c59-4e20-82cd-ad091e1bd4ee', 'b70d0e1f-7b0c-4f3c-830b-ab2c9f69ef91', 2, 'No transformer at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('707c888e-cad6-4ca6-877d-74a9adba132b', 'b70d0e1f-7b0c-4f3c-830b-ab2c9f69ef91', 3, '8 diodes and 2 transformers');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b70d0e1f-7b0c-4f3c-830b-ab2c9f69ef91', 'a845776b-eb1c-49ae-b892-6fa501eeed17', 'A full-wave bridge rectifier uses 4 diodes and requires only an ordinary (non-center-tapped) transformer, unlike a center-tapped full-wave rectifier, which requires a center-tapped transformer but only 2 diodes — the bridge configuration is generally preferred for better transformer utilization.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3856f6bc-007f-4b6c-b5c8-39512f054772', '5e47b501-7176-42f8-8137-c5acc30759bc', 75, 'Negative feedback in an amplifier circuit generally results in:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21136f41-9533-48db-8c25-2c40e6bfcc74', '3856f6bc-007f-4b6c-b5c8-39512f054772', 0, 'Increased gain and increased distortion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3de3992e-db30-4f33-b863-1503b4859630', '3856f6bc-007f-4b6c-b5c8-39512f054772', 1, 'Reduced gain, but improved bandwidth, stability, and reduced distortion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3aec1101-f1ac-4713-8c89-cc2cc43277ae', '3856f6bc-007f-4b6c-b5c8-39512f054772', 2, 'No change in any performance parameter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b74e783d-b1d9-43eb-8686-aa0e9143c76a', '3856f6bc-007f-4b6c-b5c8-39512f054772', 3, 'Increased noise only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3856f6bc-007f-4b6c-b5c8-39512f054772', '3de3992e-db30-4f33-b863-1503b4859630', 'Negative feedback trades off some voltage gain (reduces it) in exchange for significant improvements in bandwidth, gain stability (less sensitive to component variations), reduced distortion, and reduced output impedance — a fundamental, widely-used design tradeoff in amplifier circuits.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7821ba3e-811c-4a7b-adb8-98262110e040', '5e47b501-7176-42f8-8137-c5acc30759bc', 76, 'The number of unique states representable by an n-bit binary number is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f87bdd8c-0e73-4884-b61c-fe1999f24cbf', '7821ba3e-811c-4a7b-adb8-98262110e040', 0, 'n');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('581e69ea-d039-4899-8449-190f25528237', '7821ba3e-811c-4a7b-adb8-98262110e040', 1, '2n');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('148d9055-3483-4e7e-b2c4-17e7bb36b4ab', '7821ba3e-811c-4a7b-adb8-98262110e040', 2, '2^n');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('706b22ab-17b6-4d83-bb9d-1b1f1bb9a295', '7821ba3e-811c-4a7b-adb8-98262110e040', 3, 'n^2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7821ba3e-811c-4a7b-adb8-98262110e040', '148d9055-3483-4e7e-b2c4-17e7bb36b4ab', 'An n-bit binary number can represent 2^n unique states (from 0 to 2^n - 1) — for example, a 4-bit number can represent 2^4 = 16 unique states (0 to 15).', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('87984198-d20b-4634-8c4a-03a15d3d4d42', '5e47b501-7176-42f8-8137-c5acc30759bc', 77, 'The decimal number 25 is represented in binary as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af1115b1-ab3b-4c62-8964-cd1652ec9145', '87984198-d20b-4634-8c4a-03a15d3d4d42', 0, '11001');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db762030-a026-4dde-8932-df0d75a8bcbc', '87984198-d20b-4634-8c4a-03a15d3d4d42', 1, '11010');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49c3bea6-fcc0-401c-b84f-97b4f6fa6b87', '87984198-d20b-4634-8c4a-03a15d3d4d42', 2, '10101');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6687024-f2d1-4215-8a1d-97ff31cbb8c4', '87984198-d20b-4634-8c4a-03a15d3d4d42', 3, '11101');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('87984198-d20b-4634-8c4a-03a15d3d4d42', 'af1115b1-ab3b-4c62-8964-cd1652ec9145', '25 = 16+8+1 = 2^4+2^3+2^0, giving binary 11001 (verify: 1×16+1×8+0×4+0×2+1×1 = 16+8+1 = 25).', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bf4472f6-72f8-4245-83b4-48efdb7f64d8', '5e47b501-7176-42f8-8137-c5acc30759bc', 78, 'A Karnaugh Map (K-map) is a tool primarily used for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60e570a0-5106-4af3-bba8-27c9f9dc2c01', 'bf4472f6-72f8-4245-83b4-48efdb7f64d8', 0, 'Simplifying/minimizing Boolean logic expressions graphically');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('625a0f2f-749b-4c1a-8cf7-8c4d325e78c5', 'bf4472f6-72f8-4245-83b4-48efdb7f64d8', 1, 'Measuring voltage in a circuit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5aed1d2d-0a5b-4d79-a2bc-750ee64a2d35', 'bf4472f6-72f8-4245-83b4-48efdb7f64d8', 2, 'Designing PCB layouts');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7df19c64-a39b-476f-958f-c93089334e97', 'bf4472f6-72f8-4245-83b4-48efdb7f64d8', 3, 'Generating random numbers');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bf4472f6-72f8-4245-83b4-48efdb7f64d8', '60e570a0-5106-4af3-bba8-27c9f9dc2c01', 'A K-map is a graphical tool for simplifying Boolean algebra expressions by visually grouping adjacent minterms, providing a more intuitive alternative to purely algebraic Boolean simplification, particularly for expressions with up to 4-6 variables.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('85e7337d-5564-4a72-b252-5c6549f3964e', '5e47b501-7176-42f8-8137-c5acc30759bc', 79, 'A D flip-flop, on each active clock edge, causes the output Q to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ffb7ba4a-6a20-4d2c-a6e0-9c722c009f5a', '85e7337d-5564-4a72-b252-5c6549f3964e', 0, 'Always toggle to the opposite state');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3c30d08-57c3-498b-8e5f-be8de74fe8cf', '85e7337d-5564-4a72-b252-5c6549f3964e', 1, 'Take on the value present at the D (data) input at that clock edge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8de4f8c0-17d6-4e0e-9051-d83550af44a6', '85e7337d-5564-4a72-b252-5c6549f3964e', 2, 'Always reset to 0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f30d4c4-f334-4a96-87c1-e1aba7d75560', '85e7337d-5564-4a72-b252-5c6549f3964e', 3, 'Remain unchanged regardless of D');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('85e7337d-5564-4a72-b252-5c6549f3964e', 'b3c30d08-57c3-498b-8e5f-be8de74fe8cf', 'A D (Data/Delay) flip-flop simply transfers the value present at its D input to its Q output on each active clock edge, effectively ''delaying'' the input by one clock cycle — widely used in registers and synchronous data storage.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0be3394d-e7a9-4de0-9b18-3d66317cb525', '5e47b501-7176-42f8-8137-c5acc30759bc', 80, 'A shift register is primarily used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('344be6ca-54e0-4f01-b5a6-792c1611e90c', '0be3394d-e7a9-4de0-9b18-3d66317cb525', 0, 'Perform arithmetic addition only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('200d85ce-f956-42fe-9585-b57b10e53b91', '0be3394d-e7a9-4de0-9b18-3d66317cb525', 1, 'Store and shift binary data serially or in parallel, one bit position at a time on each clock pulse');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a0ea68a-c61d-4e84-bda3-81abc6c98e56', '0be3394d-e7a9-4de0-9b18-3d66317cb525', 2, 'Generate clock signals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f3074c0f-2f32-4c95-82b5-0c9f74566d4b', '0be3394d-e7a9-4de0-9b18-3d66317cb525', 3, 'Amplify digital signals');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0be3394d-e7a9-4de0-9b18-3d66317cb525', '200d85ce-f956-42fe-9585-b57b10e53b91', 'A shift register, built from a chain of flip-flops, stores binary data and shifts it left or right by one bit position on each clock pulse — used for serial-to-parallel/parallel-to-serial conversion, and as a building block in various digital systems.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a4992622-5b68-44ae-862f-e912bc139557', '5e47b501-7176-42f8-8137-c5acc30759bc', 81, 'A ring counter is a specific type of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b75c2ff3-eaa6-409f-80e7-f70ec9bff204', 'a4992622-5b68-44ae-862f-e912bc139557', 0, 'Combinational logic circuit with no memory');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45dca82f-e90a-45e5-9733-eab386151a88', 'a4992622-5b68-44ae-862f-e912bc139557', 1, 'Shift register configured such that the output is fed back to the input, causing a single ''1'' (or ''0'') bit to circulate through the register');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('970b852a-7790-4e8f-bcbc-d0706cc04d2f', 'a4992622-5b68-44ae-862f-e912bc139557', 2, 'A device used only for analog signal processing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aee6d08c-acc0-44ec-ba5c-8578f6f08155', 'a4992622-5b68-44ae-862f-e912bc139557', 3, 'A type of ADC');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a4992622-5b68-44ae-862f-e912bc139557', '45dca82f-e90a-45e5-9733-eab386151a88', 'A ring counter is a shift register where the output is fed back directly to the input, causing a single active bit (typically a ''1'') to circulate continuously through the register on each clock pulse — used for generating sequential timing signals.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f2aa6d48-2e01-4068-88e1-f787a95bd470', '5e47b501-7176-42f8-8137-c5acc30759bc', 82, 'The primary difference between a synchronous and an asynchronous (ripple) counter is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f0eb3b8-4b41-4a5e-bb7a-b8b34995ec17', 'f2aa6d48-2e01-4068-88e1-f787a95bd470', 0, 'Synchronous counters have all flip-flops clocked simultaneously by a common clock; asynchronous counters have each flip-flop clocked by the output of the previous stage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ecda1e3c-c3f8-4c18-989b-ce2ad3036664', 'f2aa6d48-2e01-4068-88e1-f787a95bd470', 1, 'Asynchronous counters are always faster than synchronous counters');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d7df8fa-023e-401a-a8ca-b76fbb4c3c4f', 'f2aa6d48-2e01-4068-88e1-f787a95bd470', 2, 'Synchronous counters cannot count beyond 2 states');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64f6c4f6-3b8b-45e3-89bb-4bfca1da7525', 'f2aa6d48-2e01-4068-88e1-f787a95bd470', 3, 'There is no meaningful difference');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f2aa6d48-2e01-4068-88e1-f787a95bd470', '2f0eb3b8-4b41-4a5e-bb7a-b8b34995ec17', 'In a synchronous counter, all flip-flops receive the same clock signal simultaneously, avoiding cumulative propagation delay; in an asynchronous (ripple) counter, each flip-flop''s clock input is driven by the output of the preceding stage, causing propagation delays to accumulate (''ripple'') through the chain — making synchronous counters generally faster and more suitable for high-speed applications.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3374ea62-68ca-4b65-8c2a-98f3fe2e29dc', '5e47b501-7176-42f8-8137-c5acc30759bc', 83, 'A decoder circuit in digital electronics is used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d39b3dc-a600-46f6-b8d7-56d5f2c43cc2', '3374ea62-68ca-4b65-8c2a-98f3fe2e29dc', 0, 'Combine multiple input lines into a single output line');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e082b32f-cff0-4de5-8955-916a325c0d0e', '3374ea62-68ca-4b65-8c2a-98f3fe2e29dc', 1, 'Convert a binary-coded input into one of several possible unique output lines being activated');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27990e56-4bd8-4185-95ca-d7a4504c0324', '3374ea62-68ca-4b65-8c2a-98f3fe2e29dc', 2, 'Store data permanently');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e88cdaae-d201-4c0f-9ec1-aabb6f3ee95c', '3374ea62-68ca-4b65-8c2a-98f3fe2e29dc', 3, 'Amplify a weak signal');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3374ea62-68ca-4b65-8c2a-98f3fe2e29dc', 'e082b32f-cff0-4de5-8955-916a325c0d0e', 'A decoder converts an n-bit binary-coded input into activation of one of up to 2^n unique output lines — the functional inverse of an encoder, widely used in memory addressing and instruction decoding.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('97626bce-6079-4218-b1f5-f0397032579c', '5e47b501-7176-42f8-8137-c5acc30759bc', 84, 'An encoder circuit in digital electronics performs the function of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28afc914-ac8a-474a-b10c-6ca1d00a1b10', '97626bce-6079-4218-b1f5-f0397032579c', 0, 'Converting one of several active input lines into a corresponding binary-coded output');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('703e7f76-91c4-4745-b1be-9d8b60e35284', '97626bce-6079-4218-b1f5-f0397032579c', 1, 'Decoding a binary output into multiple lines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2b265d6-0a47-40c2-859d-c47bcb015cf2', '97626bce-6079-4218-b1f5-f0397032579c', 2, 'Amplifying analog signals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8696c05-c3c2-4068-84b8-4a7709ed5893', '97626bce-6079-4218-b1f5-f0397032579c', 3, 'Generating clock pulses');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('97626bce-6079-4218-b1f5-f0397032579c', '28afc914-ac8a-474a-b10c-6ca1d00a1b10', 'An encoder converts one of several active input lines into a corresponding compact binary-coded output — the functional inverse of a decoder, useful for compressing many input signals into a smaller binary representation.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3fd4cde7-8e4a-42d2-8e3c-54c3a70f3d14', '5e47b501-7176-42f8-8137-c5acc30759bc', 85, 'The 2''s complement representation of a negative binary number is primarily used because it:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c8dd112-6823-4112-93b4-8e92053a3fdc', '3fd4cde7-8e4a-42d2-8e3c-54c3a70f3d14', 0, 'Requires a separate subtractor circuit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8691638b-da11-4aca-8469-6cf7e5f50120', '3fd4cde7-8e4a-42d2-8e3c-54c3a70f3d14', 1, 'Allows addition and subtraction to be performed using the same binary adder hardware, without a separate subtraction circuit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eed4352d-bc81-404b-8e83-254a262a2043', '3fd4cde7-8e4a-42d2-8e3c-54c3a70f3d14', 2, 'Only works for positive numbers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3f94aec-26cf-4d4b-a5dd-b2745b029dda', '3fd4cde7-8e4a-42d2-8e3c-54c3a70f3d14', 3, 'Doubles the required memory');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3fd4cde7-8e4a-42d2-8e3c-54c3a70f3d14', '8691638b-da11-4aca-8469-6cf7e5f50120', '2''s complement representation allows subtraction to be performed as addition of a negative number (its 2''s complement), meaning the same binary adder hardware can handle both addition and subtraction — a major simplification in digital arithmetic circuit design.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8da1d94a-1951-46b4-9947-9e552e9bf9c3', '5e47b501-7176-42f8-8137-c5acc30759bc', 86, 'A race condition in a digital sequential circuit refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ec42c36-b865-458e-aa80-5ce6e51562cd', '8da1d94a-1951-46b4-9947-9e552e9bf9c3', 0, 'A deliberate design feature for speed optimization');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('100e5900-dbe5-4ee2-827b-cb2801255f04', '8da1d94a-1951-46b4-9947-9e552e9bf9c3', 1, 'An unintended timing hazard where the final output state depends unpredictably on the relative propagation delays of different signal paths');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58917d90-fd2a-409c-b491-99ae2b014666', '8da1d94a-1951-46b4-9947-9e552e9bf9c3', 2, 'A method for increasing clock speed safely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa9ae39b-49e1-4e1f-935d-e14df7b6fe91', '8da1d94a-1951-46b4-9947-9e552e9bf9c3', 3, 'A type of memory storage element');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8da1d94a-1951-46b4-9947-9e552e9bf9c3', '100e5900-dbe5-4ee2-827b-cb2801255f04', 'A race condition is an unintended, problematic timing hazard where a circuit''s final output state depends on the relative (and often unpredictable) propagation delays of different signal paths — a critical issue to avoid through careful synchronous design practices.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('50dadef0-8759-44e3-b721-b7c3d45885ff', '5e47b501-7176-42f8-8137-c5acc30759bc', 87, 'In digital logic, a ''don''t care'' condition (often denoted ''X'') in a truth table represents:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd2838e6-8b7b-4dcd-b140-8c6fcb30235f', '50dadef0-8759-44e3-b721-b7c3d45885ff', 0, 'An input combination that produces an error');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0b9f810-de8d-49ed-9659-a152c15c6017', '50dadef0-8759-44e3-b721-b7c3d45885ff', 1, 'An input combination that either cannot occur in practice, or whose output value doesn''t matter — giving flexibility during Boolean simplification');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84a291d3-5fb3-4d01-a63c-6f567b4a1b71', '50dadef0-8759-44e3-b721-b7c3d45885ff', 2, 'An input combination that must always output 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca17d16d-2627-4c5d-922f-725a0429f457', '50dadef0-8759-44e3-b721-b7c3d45885ff', 3, 'A malfunction in the circuit');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('50dadef0-8759-44e3-b721-b7c3d45885ff', 'a0b9f810-de8d-49ed-9659-a152c15c6017', 'A ''don''t care'' condition represents an input combination that either physically cannot occur in the actual application, or whose specific output value is irrelevant to correct system operation — these are exploited during K-map simplification to achieve simpler final logic expressions.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('006861a4-68dd-4055-92af-df6f3f60e2fb', '5e47b501-7176-42f8-8137-c5acc30759bc', 88, 'The main function of a comparator circuit (like the 7485 IC) in digital electronics is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5bfe952-a688-4d90-913a-6ce305cad4b1', '006861a4-68dd-4055-92af-df6f3f60e2fb', 0, 'Add two binary numbers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b558671-cb34-43c5-9b2e-e6c066be317d', '006861a4-68dd-4055-92af-df6f3f60e2fb', 1, 'Compare two binary numbers and indicate whether one is greater than, less than, or equal to the other');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4df982b-4722-4c16-8242-c8a52b13b547', '006861a4-68dd-4055-92af-df6f3f60e2fb', 2, 'Store binary data');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9a178fa-ea82-4886-a95d-69f9cecfe161', '006861a4-68dd-4055-92af-df6f3f60e2fb', 3, 'Convert binary to decimal');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('006861a4-68dd-4055-92af-df6f3f60e2fb', '5b558671-cb34-43c5-9b2e-e6c066be317d', 'A digital comparator compares two binary numbers bit by bit and produces outputs indicating whether the first is greater than, less than, or equal to the second — used in applications like address decoding, sorting, and control logic.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('10e68302-51da-4962-9662-ac981f25b91f', '5e47b501-7176-42f8-8137-c5acc30759bc', 89, 'A PLA (Programmable Logic Array) differs from a PROM (Programmable Read-Only Memory) primarily in that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2852f89a-97c1-41db-a0aa-e28b1725be23', '10e68302-51da-4962-9662-ac981f25b91f', 0, 'A PLA has both a programmable AND array and a programmable OR array, while a PROM typically has a fixed AND array and a programmable OR array');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1f77e60-50df-423d-baeb-bcb420952a01', '10e68302-51da-4962-9662-ac981f25b91f', 1, 'A PLA can only store data, not implement logic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9171b7cd-76d8-4ef5-aade-ca440e4d6ac5', '10e68302-51da-4962-9662-ac981f25b91f', 2, 'A PROM is always faster than a PLA');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01088c27-86bd-4583-b330-dde484f50caf', '10e68302-51da-4962-9662-ac981f25b91f', 3, 'There is no meaningful architectural difference');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('10e68302-51da-4962-9662-ac981f25b91f', '2852f89a-97c1-41db-a0aa-e28b1725be23', 'A PLA (Programmable Logic Array) offers greater flexibility with both a programmable AND array and a programmable OR array, whereas a PROM typically has a fixed (non-programmable) AND array (decoding every possible input combination) combined with a programmable OR array — making PLAs generally more efficient for implementing arbitrary logic functions with fewer product terms.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4c5b57ce-50d5-4915-8fe1-d59250615c1f', '5e47b501-7176-42f8-8137-c5acc30759bc', 90, 'The propagation delay of a logic gate refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c8252c4-d4c8-4e00-b6e8-845cf6b5d426', '4c5b57ce-50d5-4915-8fe1-d59250615c1f', 0, 'The time taken for the gate to physically fail');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7247b08-1d0c-4ff9-a7a3-fdc374623f25', '4c5b57ce-50d5-4915-8fe1-d59250615c1f', 1, 'The time delay between an input change and the corresponding output change stabilizing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a373961a-3b03-4e70-8873-5bbf39da4cae', '4c5b57ce-50d5-4915-8fe1-d59250615c1f', 2, 'The gate''s power consumption');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('552c0d11-c55b-4008-8e8e-9920e523228b', '4c5b57ce-50d5-4915-8fe1-d59250615c1f', 3, 'The voltage swing of the gate''s output');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4c5b57ce-50d5-4915-8fe1-d59250615c1f', 'b7247b08-1d0c-4ff9-a7a3-fdc374623f25', 'Propagation delay is the time interval between an input signal change and the corresponding output change stabilizing at its new value — a fundamental parameter limiting the maximum operating speed of digital logic circuits.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('33c30d62-5340-438d-9d5c-be8133ac87fb', '5e47b501-7176-42f8-8137-c5acc30759bc', 91, 'In digital communication, the term ''bit rate'' refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9bdfa9c-26d5-49e7-a3e1-795f6dc2f35f', '33c30d62-5340-438d-9d5c-be8133ac87fb', 0, 'The number of symbols transmitted per second');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d4e88f4-319b-4236-80b0-f7a2446b0cf2', '33c30d62-5340-438d-9d5c-be8133ac87fb', 1, 'The number of bits transmitted per second');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('877fe117-26e4-4b76-8466-fafaa8720849', '33c30d62-5340-438d-9d5c-be8133ac87fb', 2, 'The bandwidth of the channel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18d9b1d8-b25e-4a7d-8ca6-c7ff91806b4a', '33c30d62-5340-438d-9d5c-be8133ac87fb', 3, 'The signal-to-noise ratio');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('33c30d62-5340-438d-9d5c-be8133ac87fb', '0d4e88f4-319b-4236-80b0-f7a2446b0cf2', 'Bit rate is the number of individual binary bits transmitted per second (bps), distinct from ''baud rate'' (symbol rate), which measures the number of signal changes/symbols per second — the two are equal only when each symbol represents exactly 1 bit.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('26a24caf-8c18-47a0-957b-94bb5c56fdd1', '5e47b501-7176-42f8-8137-c5acc30759bc', 92, 'Shannon''s Channel Capacity theorem relates a channel''s maximum theoretical data rate to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f4dbb8f-ce5e-4019-8293-b4a96f0220e6', '26a24caf-8c18-47a0-957b-94bb5c56fdd1', 0, 'Only the channel''s bandwidth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4c8e976-135c-4e5c-b14b-040e99ab5a74', '26a24caf-8c18-47a0-957b-94bb5c56fdd1', 1, 'Both the channel''s bandwidth and its signal-to-noise ratio (SNR)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('902638c5-65cb-4e93-a9a5-46e62973e90a', '26a24caf-8c18-47a0-957b-94bb5c56fdd1', 2, 'Only the transmitter''s power output');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b43d9fe8-cfb3-47cf-9ea1-1763f3683d77', '26a24caf-8c18-47a0-957b-94bb5c56fdd1', 3, 'Only the distance between transmitter and receiver');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('26a24caf-8c18-47a0-957b-94bb5c56fdd1', 'd4c8e976-135c-4e5c-b14b-040e99ab5a74', 'Shannon''s Channel Capacity theorem, C = B log2(1 + SNR), establishes the maximum theoretical error-free data rate of a communication channel as a function of both its bandwidth (B) and signal-to-noise ratio (SNR) — a fundamental limit no practical system can exceed.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c22d0c35-bf80-4db1-b142-6e5446f875ea', '5e47b501-7176-42f8-8137-c5acc30759bc', 93, 'In Frequency Shift Keying (FSK), digital data is transmitted by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b23b4bc-34bc-4d68-ba79-dd068301b6d5', 'c22d0c35-bf80-4db1-b142-6e5446f875ea', 0, 'Varying the amplitude of the carrier');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0fcc20d-42f3-4398-a96f-2a62f76f6221', 'c22d0c35-bf80-4db1-b142-6e5446f875ea', 1, 'Varying the frequency of the carrier between discrete values, corresponding to different digital symbols');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1d1bec9-551b-4c3e-9108-227b08686b77', 'c22d0c35-bf80-4db1-b142-6e5446f875ea', 2, 'Varying the phase of the carrier only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a8925cb-6703-47e6-826c-c37060c05824', 'c22d0c35-bf80-4db1-b142-6e5446f875ea', 3, 'Removing the carrier entirely during transmission');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c22d0c35-bf80-4db1-b142-6e5446f875ea', 'e0fcc20d-42f3-4398-a96f-2a62f76f6221', 'FSK represents digital data by shifting the carrier''s frequency between two (or more) discrete values, each representing a specific digital symbol — a simple, robust digital modulation scheme, though generally less bandwidth-efficient than more advanced schemes like QAM.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('03ca5dd9-92b5-4170-80e7-fceaa1bf5e49', '5e47b501-7176-42f8-8137-c5acc30759bc', 94, 'Phase Shift Keying (PSK) encodes digital data by varying the carrier''s:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7eb646b3-e142-4d89-b7fb-9a40b1e5b5ae', '03ca5dd9-92b5-4170-80e7-fceaa1bf5e49', 0, 'Amplitude');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('426d56f9-af99-4db9-afd2-fef421bcc305', '03ca5dd9-92b5-4170-80e7-fceaa1bf5e49', 1, 'Frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f37d0f5-824e-47ca-a45d-fd9509e09d4c', '03ca5dd9-92b5-4170-80e7-fceaa1bf5e49', 2, 'Phase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f729d234-dcc7-4554-bce8-80c66fb29d31', '03ca5dd9-92b5-4170-80e7-fceaa1bf5e49', 3, 'Wavelength directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('03ca5dd9-92b5-4170-80e7-fceaa1bf5e49', '1f37d0f5-824e-47ca-a45d-fd9509e09d4c', 'PSK represents digital data by varying the carrier signal''s phase among a discrete set of values (e.g., BPSK uses 2 phases, QPSK uses 4) — widely used in modern digital communication systems for its good noise immunity and bandwidth efficiency.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2e65044a-3eaf-453e-85a5-f8211b1e55a2', '5e47b501-7176-42f8-8137-c5acc30759bc', 95, 'In a superheterodyne receiver, the primary purpose of the mixer stage is to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ffbb7b18-c32a-422f-857a-74ba8c9edf5a', '2e65044a-3eaf-453e-85a5-f8211b1e55a2', 0, 'Amplify the received RF signal directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d99853ba-6648-43d1-8bad-6d02446ecd2e', '2e65044a-3eaf-453e-85a5-f8211b1e55a2', 1, 'Convert the received RF signal to a fixed, lower Intermediate Frequency (IF) by combining it with a local oscillator signal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8fd7b26a-52b6-440a-a055-f6524f648c1a', '2e65044a-3eaf-453e-85a5-f8211b1e55a2', 2, 'Demodulate the audio signal directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa197899-ba4f-4d8f-bbda-20bdc8678647', '2e65044a-3eaf-453e-85a5-f8211b1e55a2', 3, 'Generate the transmitted carrier signal');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2e65044a-3eaf-453e-85a5-f8211b1e55a2', 'd99853ba-6648-43d1-8bad-6d02446ecd2e', 'The mixer stage in a superheterodyne receiver combines the incoming RF signal with a local oscillator signal to produce a fixed Intermediate Frequency (IF), regardless of the original RF carrier frequency — this allows subsequent amplification and filtering stages to be optimized for one fixed frequency, greatly simplifying receiver design.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fee8dabe-08de-43bd-ab8d-7b18de3a8e56', '5e47b501-7176-42f8-8137-c5acc30759bc', 96, '''Multiplexing'' in communication systems refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da21e00c-c4a3-4458-b948-d31e84f6c8a0', 'fee8dabe-08de-43bd-ab8d-7b18de3a8e56', 0, 'Combining multiple signals to transmit them simultaneously over a single shared communication channel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8bba0d1-6353-481a-8776-99ed9c7d4754', 'fee8dabe-08de-43bd-ab8d-7b18de3a8e56', 1, 'Removing noise from a signal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70b08e42-bbfc-4d82-80fc-8c5f893cbe6b', 'fee8dabe-08de-43bd-ab8d-7b18de3a8e56', 2, 'Amplifying a weak signal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c6b9251-1eea-4102-8ef1-5deb0a5e1b6c', 'fee8dabe-08de-43bd-ab8d-7b18de3a8e56', 3, 'Converting analog to digital signals only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fee8dabe-08de-43bd-ab8d-7b18de3a8e56', 'da21e00c-c4a3-4458-b948-d31e84f6c8a0', 'Multiplexing is the technique of combining multiple independent signals (e.g., via time, frequency, or code division) to share a single communication channel efficiently, with the corresponding demultiplexing process separating them again at the receiving end.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e9f77ca8-815b-4d8f-95b3-a835a49f84ff', '5e47b501-7176-42f8-8137-c5acc30759bc', 97, 'In satellite communication, a ''geostationary'' satellite orbit is characterized by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1232c6c-fb25-4449-8371-20860ee22351', 'e9f77ca8-815b-4d8f-95b3-a835a49f84ff', 0, 'An orbital period much shorter than Earth''s rotation period');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba332f0b-499c-477f-99aa-312a0c49d9a7', 'e9f77ca8-815b-4d8f-95b3-a835a49f84ff', 1, 'An orbital period exactly matching Earth''s rotational period (about 24 hours), appearing stationary relative to a point on Earth''s surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c8dedf9-856a-4bc5-b76c-079e60637f32', 'e9f77ca8-815b-4d8f-95b3-a835a49f84ff', 2, 'A constantly changing altitude');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca34272f-8974-4ab7-83cb-6933ed869794', 'e9f77ca8-815b-4d8f-95b3-a835a49f84ff', 3, 'An orbit passing directly over the poles only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e9f77ca8-815b-4d8f-95b3-a835a49f84ff', 'ba332f0b-499c-477f-99aa-312a0c49d9a7', 'A geostationary satellite orbits at an altitude (~35,786 km) where its orbital period exactly matches Earth''s rotation period (~24 hours), and orbits directly above the equator — making it appear stationary relative to a fixed point on Earth''s surface, ideal for continuous, fixed-antenna communication and broadcast applications.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('825845f8-d4e3-44ef-9f1c-314eb5799c5f', '5e47b501-7176-42f8-8137-c5acc30759bc', 98, 'The Nyquist sampling rate for a signal with maximum frequency component of 4 kHz is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1fa32919-46e2-4ff6-923a-80f07d04fd48', '825845f8-d4e3-44ef-9f1c-314eb5799c5f', 0, '4 kHz');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7dd46db-18aa-4cb4-a91e-2f5f7c648711', '825845f8-d4e3-44ef-9f1c-314eb5799c5f', 1, '8 kHz');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b92132a-c5dc-4981-8083-c77134bfc48d', '825845f8-d4e3-44ef-9f1c-314eb5799c5f', 2, '2 kHz');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9b674f2-ef8c-47f4-86e8-07497ef535e6', '825845f8-d4e3-44ef-9f1c-314eb5799c5f', 3, '16 kHz');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('825845f8-d4e3-44ef-9f1c-314eb5799c5f', 'd7dd46db-18aa-4cb4-a91e-2f5f7c648711', 'The Nyquist sampling theorem requires a sampling rate of at least twice the signal''s maximum frequency component — for a 4 kHz maximum frequency, the minimum (Nyquist) sampling rate is 8 kHz.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('44cfae93-9031-4c6c-9dd1-3d1c3b174188', '5e47b501-7176-42f8-8137-c5acc30759bc', 99, 'Optical fiber communication primarily transmits information using:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d4cf8c2-99c5-457f-9a42-4bdae7bc119a', '44cfae93-9031-4c6c-9dd1-3d1c3b174188', 0, 'Radio waves through a copper conductor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c43e6ba-9244-4384-942f-85554220bb4a', '44cfae93-9031-4c6c-9dd1-3d1c3b174188', 1, 'Light signals (typically infrared) propagating through a glass or plastic fiber core, via total internal reflection');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7de28f8e-7fab-4ba9-b047-e592dc441e4a', '44cfae93-9031-4c6c-9dd1-3d1c3b174188', 2, 'Sound waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b79d1764-6b54-469e-83dc-f44a971953b8', '44cfae93-9031-4c6c-9dd1-3d1c3b174188', 3, 'Electrical current through the fiber directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('44cfae93-9031-4c6c-9dd1-3d1c3b174188', '4c43e6ba-9244-4384-942f-85554220bb4a', 'Optical fiber communication transmits information encoded as light signals (typically in the infrared spectrum) that propagate along a thin glass or plastic fiber core via total internal reflection — offering very high bandwidth, low signal loss over distance, and immunity to electromagnetic interference compared to copper-based transmission.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3f50d226-0f55-468c-b01d-726f1165a525', '5e47b501-7176-42f8-8137-c5acc30759bc', 100, 'The primary advantage of digital communication systems over analog systems is generally:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63ca60fb-0eb1-4946-b894-0c98ddc9ebfa', '3f50d226-0f55-468c-b01d-726f1165a525', 0, 'Digital systems are always simpler and cheaper to implement in every case');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a89fe414-48e9-4e47-ac79-92ad69c580b3', '3f50d226-0f55-468c-b01d-726f1165a525', 1, 'Digital systems offer better noise immunity, since a degraded signal can often be exactly regenerated (rather than accumulating noise progressively)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('499da7a9-6dab-460b-8d7f-34da3ebfb5ba', '3f50d226-0f55-468c-b01d-726f1165a525', 2, 'Digital systems require no error correction whatsoever');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77c7d497-6af1-49cf-934d-caf1b7bbaa60', '3f50d226-0f55-468c-b01d-726f1165a525', 3, 'Analog systems always have higher bandwidth efficiency');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3f50d226-0f55-468c-b01d-726f1165a525', 'a89fe414-48e9-4e47-ac79-92ad69c580b3', 'Digital signals, being represented by discrete levels, can be regenerated (restored to their exact original values) at intermediate repeater stages before noise accumulates to an ambiguous level — unlike analog signals, where noise picked up during transmission accumulates and degrades the signal progressively and irreversibly.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('55572873-a208-4a1d-8626-0c4b2d804cbc', '5e47b501-7176-42f8-8137-c5acc30759bc', 101, '''Bandwidth'' of a communication channel refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd2b2edf-3977-47f3-a328-0af5c5d6a6f6', '55572873-a208-4a1d-8626-0c4b2d804cbc', 0, 'The maximum signal amplitude the channel can carry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2990bd58-22a7-4a84-bb42-4f5d5dcbcee2', '55572873-a208-4a1d-8626-0c4b2d804cbc', 1, 'The range of frequencies the channel can effectively transmit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a760d62-9beb-43c2-ab90-11d26a5ff3ab', '55572873-a208-4a1d-8626-0c4b2d804cbc', 2, 'The physical length of the transmission medium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce6a2fe6-cb48-40c4-84c0-1634b7300c43', '55572873-a208-4a1d-8626-0c4b2d804cbc', 3, 'The number of users the channel can support simultaneously, regardless of frequency');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('55572873-a208-4a1d-8626-0c4b2d804cbc', '2990bd58-22a7-4a84-bb42-4f5d5dcbcee2', 'Bandwidth is the range of frequencies (the difference between the highest and lowest frequency) that a communication channel can effectively transmit — a fundamental parameter limiting the maximum achievable data rate, per Shannon''s Channel Capacity theorem.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1e8d71a6-164a-4da6-b6ca-2335cfe02be4', '5e47b501-7176-42f8-8137-c5acc30759bc', 102, 'Time Division Multiple Access (TDMA), used in some cellular communication standards, allows multiple users to share a channel by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f119730-d557-4ac3-b04c-d9bda6467f94', '1e8d71a6-164a-4da6-b6ca-2335cfe02be4', 0, 'Assigning each user a distinct, non-overlapping time slot on the same frequency channel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f928eb9-b496-456b-9778-b45902f10342', '1e8d71a6-164a-4da6-b6ca-2335cfe02be4', 1, 'Assigning each user a completely separate physical cable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a55d644-a452-4a82-9877-84cacb7ea922', '1e8d71a6-164a-4da6-b6ca-2335cfe02be4', 2, 'Requiring only one user to communicate at any given time system-wide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4115a31e-5f1c-47ce-bb69-8bfb66d1301d', '1e8d71a6-164a-4da6-b6ca-2335cfe02be4', 3, 'Assigning each user a unique code, with all users transmitting simultaneously on the same frequency and time');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1e8d71a6-164a-4da6-b6ca-2335cfe02be4', '1f119730-d557-4ac3-b04c-d9bda6467f94', 'TDMA allows multiple users to share the same frequency channel by allocating each user a distinct, repeating time slot — distinct from FDMA (which separates users by frequency) and CDMA (which separates users by unique spreading codes, allowing simultaneous transmission).', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3d8d7a09-bb9c-4105-9d85-87c86ebfb424', '5e47b501-7176-42f8-8137-c5acc30759bc', 103, 'In error detection for digital communication, a Cyclic Redundancy Check (CRC) works by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89dc2542-a516-4b2b-9054-d0d1994f1705', '3d8d7a09-bb9c-4105-9d85-87c86ebfb424', 0, 'Simply retransmitting the data multiple times');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5bf73440-1b77-4e86-9664-6112b3f1af9c', '3d8d7a09-bb9c-4105-9d85-87c86ebfb424', 1, 'Appending a calculated checksum (based on polynomial division of the data) to the transmitted data, which the receiver recalculates and compares to detect errors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cbf96dd9-8012-415e-b2ce-c2a23e0b1be4', '3d8d7a09-bb9c-4105-9d85-87c86ebfb424', 2, 'Encrypting the data completely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46d753bb-b182-4b1f-bb8b-e6edea9d4352', '3d8d7a09-bb9c-4105-9d85-87c86ebfb424', 3, 'Reducing the data rate to zero');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3d8d7a09-bb9c-4105-9d85-87c86ebfb424', '5bf73440-1b77-4e86-9664-6112b3f1af9c', 'CRC computes a checksum by treating the data as a polynomial and performing a specific polynomial division, appending the remainder to the transmitted data — the receiver performs the same calculation and compares results, effectively detecting most transmission errors (particularly burst errors) without requiring the overhead of full retransmission-based schemes.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0aa65697-f12d-4c11-9cf8-da68b34da8c0', '5e47b501-7176-42f8-8137-c5acc30759bc', 104, 'The ''noise figure'' of a receiver amplifier is a measure of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b59c0e6-4a15-4540-af5d-b13e6bea65d1', '0aa65697-f12d-4c11-9cf8-da68b34da8c0', 0, 'The amplifier''s power output');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15d28f1f-acdd-4e54-9617-4bd3f48c84f2', '0aa65697-f12d-4c11-9cf8-da68b34da8c0', 1, 'How much a receiver''s amplifier degrades the signal-to-noise ratio of the signal it processes, compared to an ideal (noiseless) amplifier');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05564106-fdc3-4b6c-8e7e-4f94a8dbd291', '0aa65697-f12d-4c11-9cf8-da68b34da8c0', 2, 'The amplifier''s physical size');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ecf208fa-f29c-4add-9495-9f7fd6339b34', '0aa65697-f12d-4c11-9cf8-da68b34da8c0', 3, 'The amplifier''s operating frequency range');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0aa65697-f12d-4c11-9cf8-da68b34da8c0', '15d28f1f-acdd-4e54-9617-4bd3f48c84f2', 'Noise figure quantifies how much a real amplifier degrades the signal-to-noise ratio of the signal passing through it, compared to a theoretical ideal (noiseless) amplifier — a lower noise figure indicates a receiver front-end that adds less unwanted noise, critical for weak-signal reception applications like satellite communication and radio astronomy.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('133b2906-6bee-486c-a32b-f47daeefe7fc', '5e47b501-7176-42f8-8137-c5acc30759bc', 105, '''Line of sight'' (LOS) propagation, relevant to microwave and higher-frequency communication, requires:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('055fe4e2-018d-4468-8b1d-a6f61e17c60e', '133b2906-6bee-486c-a32b-f47daeefe7fc', 0, 'The transmitting and receiving antennas to have an unobstructed direct path between them, since these frequencies do not diffract significantly around obstacles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f73d2149-14bf-44e5-b1cf-8dcd6bfda650', '133b2906-6bee-486c-a32b-f47daeefe7fc', 1, 'No antennas at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e91f912c-1bf3-4441-8f8a-f4707e31c592', '133b2906-6bee-486c-a32b-f47daeefe7fc', 2, 'The signal to bounce off the ionosphere for every transmission');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f0caef5-393f-4591-9812-94f963215b75', '133b2906-6bee-486c-a32b-f47daeefe7fc', 3, 'Frequencies below 1 MHz only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('133b2906-6bee-486c-a32b-f47daeefe7fc', '055fe4e2-018d-4468-8b1d-a6f61e17c60e', 'At microwave and higher frequencies, radio waves travel largely in straight lines and don''t diffract significantly around obstacles (unlike lower-frequency signals, which can follow the Earth''s curvature or reflect off the ionosphere) — requiring a direct, largely unobstructed ''line of sight'' path between transmitting and receiving antennas for reliable communication.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e1b7c1c2-e611-4249-b94e-bb38f29a5f3b', '5e47b501-7176-42f8-8137-c5acc30759bc', 106, 'Maxwell''s equations collectively describe the fundamental relationship between:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f696629-1646-4202-9f0b-66d8260ae1c0', 'e1b7c1c2-e611-4249-b94e-bb38f29a5f3b', 0, 'Mechanical force and motion only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e36f14c-c8d2-455d-aa81-5c015fe728f4', 'e1b7c1c2-e611-4249-b94e-bb38f29a5f3b', 1, 'Electric and magnetic fields, and their generation by charges and currents');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43d37ed6-543f-4db9-8380-219248fdeefc', 'e1b7c1c2-e611-4249-b94e-bb38f29a5f3b', 2, 'Thermodynamic processes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d88d5530-64e3-4e0c-a457-c86d7a54734c', 'e1b7c1c2-e611-4249-b94e-bb38f29a5f3b', 3, 'Chemical reactions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e1b7c1c2-e611-4249-b94e-bb38f29a5f3b', '1e36f14c-c8d2-455d-aa81-5c015fe728f4', 'Maxwell''s four equations form the foundational mathematical framework of classical electromagnetism, describing how electric and magnetic fields are generated by electric charges, currents, and by each other''s time variation — predicting the existence and behavior of electromagnetic waves.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6ccbfa47-b87e-41a6-85bf-0b89d5fd29c5', '5e47b501-7176-42f8-8137-c5acc30759bc', 107, 'The characteristic impedance of free space (used in antenna and EM wave propagation calculations) is approximately:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0370c559-26b5-4970-b604-ef6c5d503ec9', '6ccbfa47-b87e-41a6-85bf-0b89d5fd29c5', 0, '50 ohms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bfdc4206-a868-4841-875b-8926aa68a08e', '6ccbfa47-b87e-41a6-85bf-0b89d5fd29c5', 1, '75 ohms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea0f39b2-35c3-47ba-9804-231af7d33cc7', '6ccbfa47-b87e-41a6-85bf-0b89d5fd29c5', 2, '377 ohms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4b6246c-c299-4049-aba8-d6530df65228', '6ccbfa47-b87e-41a6-85bf-0b89d5fd29c5', 3, '600 ohms');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6ccbfa47-b87e-41a6-85bf-0b89d5fd29c5', 'ea0f39b2-35c3-47ba-9804-231af7d33cc7', 'The characteristic (intrinsic) impedance of free space is approximately 377 ohms (√(μ0/ε0)) — a fundamental constant relating the electric and magnetic field magnitudes of an electromagnetic wave propagating in a vacuum.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d6867385-f91a-4470-ad5b-147b2646eb6b', '5e47b501-7176-42f8-8137-c5acc30759bc', 108, 'A half-wave dipole antenna has a physical length of approximately:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd3f8f48-29d5-4283-bc11-1c5bb782b8d5', 'd6867385-f91a-4470-ad5b-147b2646eb6b', 0, 'A full wavelength of the operating frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c00264ce-a22d-4cc3-ba0b-60c011269d26', 'd6867385-f91a-4470-ad5b-147b2646eb6b', 1, 'Half the wavelength of the operating frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('107d3a5c-d67e-44ac-8f57-540e563175ca', 'd6867385-f91a-4470-ad5b-147b2646eb6b', 2, 'A quarter of the wavelength');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20126738-9e9a-4c47-90db-c34c3575a72f', 'd6867385-f91a-4470-ad5b-147b2646eb6b', 3, 'Twice the wavelength');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d6867385-f91a-4470-ad5b-147b2646eb6b', 'c00264ce-a22d-4cc3-ba0b-60c011269d26', 'A half-wave dipole antenna, as its name indicates, has a physical length approximately equal to half the wavelength of its intended operating frequency — one of the most fundamental and widely-used antenna designs.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6461126e-514d-4877-8af1-4e7ee0b671e4', '5e47b501-7176-42f8-8137-c5acc30759bc', 109, 'The ''gain'' of an antenna is a measure of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d8e2c93-f9c6-4b3e-959b-a8702bed7c09', '6461126e-514d-4877-8af1-4e7ee0b671e4', 0, 'The antenna''s physical size');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c65abdc2-a2da-4b12-9389-d15312b8edf2', '6461126e-514d-4877-8af1-4e7ee0b671e4', 1, 'How effectively the antenna directs/concentrates radiated power in a particular direction, compared to a reference (typically isotropic) antenna');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92929c81-a98e-4f99-824a-845d9ce7b960', '6461126e-514d-4877-8af1-4e7ee0b671e4', 2, 'The antenna''s operating frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57f6c9f0-3960-415f-8281-0521a5abd8c1', '6461126e-514d-4877-8af1-4e7ee0b671e4', 3, 'The antenna''s material cost');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6461126e-514d-4877-8af1-4e7ee0b671e4', 'c65abdc2-a2da-4b12-9389-d15312b8edf2', 'Antenna gain measures how effectively the antenna concentrates radiated power in a specific desired direction, compared to a theoretical reference antenna (commonly an isotropic radiator, which radiates equally in all directions) — a higher gain means more focused, directional radiation.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f4d3f86a-26d9-4b90-b935-631016c49669', '5e47b501-7176-42f8-8137-c5acc30759bc', 110, 'Skywave propagation, used by certain lower-frequency (HF) radio signals for long-distance communication, relies on:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5032fe72-5bea-483e-ad30-931b16b4773a', 'f4d3f86a-26d9-4b90-b935-631016c49669', 0, 'Direct line-of-sight travel only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b359ab5-247c-4316-a371-e3507c06f18d', 'f4d3f86a-26d9-4b90-b935-631016c49669', 1, 'Reflection/refraction of radio waves off the ionosphere back toward Earth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69d3f7fa-b59f-4025-815e-bcfcd0be6b92', 'f4d3f86a-26d9-4b90-b935-631016c49669', 2, 'Signals traveling through the Earth''s crust');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cd39f34-7b85-435d-ac20-a645ad998146', 'f4d3f86a-26d9-4b90-b935-631016c49669', 3, 'Underwater cable transmission');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f4d3f86a-26d9-4b90-b935-631016c49669', '3b359ab5-247c-4316-a371-e3507c06f18d', 'Skywave (ionospheric) propagation relies on HF radio waves being refracted (effectively reflected) by the ionosphere back toward the Earth''s surface, enabling long-distance communication well beyond the horizon without requiring relay stations — this is frequency-dependent and affected by time of day and solar activity.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ba833baa-702f-4f1c-9514-736012be67ba', '5e47b501-7176-42f8-8137-c5acc30759bc', 111, 'Groundwave propagation is the dominant propagation mode primarily for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4cb78f3-b0e3-4a1b-b3e3-d1cb083824fe', 'ba833baa-702f-4f1c-9514-736012be67ba', 0, 'Very high frequencies (VHF) and above');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a715c046-fe7e-45ea-a1a0-6555513c5ffa', 'ba833baa-702f-4f1c-9514-736012be67ba', 1, 'Lower frequencies (LF/MF), where the wave follows the Earth''s curved surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b0452c8-b956-4e7f-a3f3-f855f11b0905', 'ba833baa-702f-4f1c-9514-736012be67ba', 2, 'Only satellite communication');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e2c653e-a4a2-433b-bca9-126ee2c675de', 'ba833baa-702f-4f1c-9514-736012be67ba', 3, 'Only optical fiber communication');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ba833baa-702f-4f1c-9514-736012be67ba', 'a715c046-fe7e-45ea-a1a0-6555513c5ffa', 'Groundwave propagation, where the radio wave follows the Earth''s curved surface (diffracting around it), is the dominant propagation mode for lower frequencies (LF/MF, like AM broadcast radio) — this mode becomes progressively less effective at higher frequencies.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('22010b3e-7699-4410-a47c-0b70adaa7f26', '5e47b501-7176-42f8-8137-c5acc30759bc', 112, 'The polarization of an electromagnetic wave refers to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa344586-6c5d-4941-ae5b-4bd817fef490', '22010b3e-7699-4410-a47c-0b70adaa7f26', 0, 'The wave''s frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3389e002-d2af-4e23-b623-528f999a7549', '22010b3e-7699-4410-a47c-0b70adaa7f26', 1, 'The orientation of the wave''s electric field vector as it propagates');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84db7d92-ee95-47ba-aee1-2500a5e4cd18', '22010b3e-7699-4410-a47c-0b70adaa7f26', 2, 'The wave''s amplitude only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('555c4cc1-26e6-4a8d-b7cd-f258b6bf3a75', '22010b3e-7699-4410-a47c-0b70adaa7f26', 3, 'The wave''s propagation speed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('22010b3e-7699-4410-a47c-0b70adaa7f26', '3389e002-d2af-4e23-b623-528f999a7549', 'Polarization describes the orientation and behavior of an electromagnetic wave''s electric field vector as it propagates (e.g., linear/vertical, linear/horizontal, or circular polarization) — antennas must generally be polarization-matched with the transmitted signal for efficient reception.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('82ed5660-1bd9-4342-825d-85c69f7f9c81', '5e47b501-7176-42f8-8137-c5acc30759bc', 113, 'A parabolic (dish) antenna achieves high directional gain primarily because:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5667456-8063-4f79-8f1e-ebe0a1d9bb8f', '82ed5660-1bd9-4342-825d-85c69f7f9c81', 0, 'It uses more power than other antenna types');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c03a2b5-6c76-4d7f-ac21-8153deef5246', '82ed5660-1bd9-4342-825d-85c69f7f9c81', 1, 'Its parabolic reflector shape focuses incoming/outgoing electromagnetic waves to/from a single focal point, concentrating energy in a narrow beam');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('608d4aca-4bb0-472f-94e7-54a5357142d7', '82ed5660-1bd9-4342-825d-85c69f7f9c81', 2, 'It operates only at very low frequencies');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76b43abf-623b-4357-ae72-a4f939ec09f9', '82ed5660-1bd9-4342-825d-85c69f7f9c81', 3, 'It has no directional properties at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('82ed5660-1bd9-4342-825d-85c69f7f9c81', '2c03a2b5-6c76-4d7f-ac21-8153deef5246', 'A parabolic reflector''s geometric shape ensures that all incoming parallel rays reflect to converge at a single focal point (where the feed antenna is placed), or conversely, that energy radiated from the focal point reflects into a narrow, highly directional parallel beam — this property is what gives dish antennas their characteristic high gain and narrow beamwidth.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3e540372-69c3-4890-bf03-5864a1fe9309', '5e47b501-7176-42f8-8137-c5acc30759bc', 114, 'The ''far field'' region of an antenna is the region where:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc2222f7-90b1-4e9c-9cf4-92810e878492', '3e540372-69c3-4890-bf03-5864a1fe9309', 0, 'The radiated field''s angular distribution is essentially independent of distance from the antenna');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('771b9624-7a41-45e3-b34b-b8e9c4de2869', '3e540372-69c3-4890-bf03-5864a1fe9309', 1, 'The field strength is at its absolute maximum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06587430-fac8-4ea1-a86f-c2ad7e20986d', '3e540372-69c3-4890-bf03-5864a1fe9309', 2, 'No electromagnetic radiation exists');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32233cdc-fb96-45ff-a8af-9e3b17d8bca8', '3e540372-69c3-4890-bf03-5864a1fe9309', 3, 'The antenna''s near-field reactive components dominate');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3e540372-69c3-4890-bf03-5864a1fe9309', 'fc2222f7-90b1-4e9c-9cf4-92810e878492', 'The far field (radiation) region is where the electromagnetic field''s angular pattern becomes essentially independent of the distance from the antenna, and the field behaves as a simple radiating wave — most practical antenna measurements and communication link analysis are conducted in this region, as opposed to the more complex near-field region close to the antenna.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0f3d9e22-d48f-4d78-9994-c977d097d558', '5e47b501-7176-42f8-8137-c5acc30759bc', 115, 'An electromagnetic wave traveling in free space has its electric field (E) and magnetic field (H) vectors oriented:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d74c242-e42a-4852-b5fc-7e456434d846', '0f3d9e22-d48f-4d78-9994-c977d097d558', 0, 'Parallel to each other and to the direction of propagation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15ecd7a6-b5f3-4715-8116-defd7fe7f859', '0f3d9e22-d48f-4d78-9994-c977d097d558', 1, 'Perpendicular to each other, and both perpendicular to the direction of propagation (a transverse wave)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17e61ccc-6d1e-4b21-adef-057841cee5cb', '0f3d9e22-d48f-4d78-9994-c977d097d558', 2, 'Perpendicular to each other but parallel to the direction of propagation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d8cc200-a282-4167-973f-9f3c8fa38244', '0f3d9e22-d48f-4d78-9994-c977d097d558', 3, 'There is no fixed relationship between E, H, and propagation direction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0f3d9e22-d48f-4d78-9994-c977d097d558', '15ecd7a6-b5f3-4715-8116-defd7fe7f859', 'An electromagnetic wave in free space is a transverse wave — its electric field (E) and magnetic field (H) vectors are mutually perpendicular to each other, and both are perpendicular to the direction of wave propagation.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('75cb239a-cd64-4776-997c-b85703d5431f', '5e47b501-7176-42f8-8137-c5acc30759bc', 116, 'A system is said to be ''time-invariant'' if:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20aaa473-3516-4564-b0b6-fcba04f1bd21', '75cb239a-cd64-4776-997c-b85703d5431f', 0, 'Its output changes over time regardless of the input');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c97f122-4396-4538-9fce-e3394bd81a6b', '75cb239a-cd64-4776-997c-b85703d5431f', 1, 'A time shift in the input produces an identical time shift in the output, with no other change in output shape');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5c0c9c6-b89c-494d-b7d7-0e3d2fc1c6f6', '75cb239a-cd64-4776-997c-b85703d5431f', 2, 'The system has no memory');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1be111cf-4ae1-45fc-b6fa-f0340760ae5d', '75cb239a-cd64-4776-997c-b85703d5431f', 3, 'The system''s transfer function changes with each use');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('75cb239a-cd64-4776-997c-b85703d5431f', '6c97f122-4396-4538-9fce-e3394bd81a6b', 'A time-invariant system''s behavior/characteristics don''t change over time — shifting the input signal in time results in an identically-shaped output, shifted by the same amount, with no other distortion introduced.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9e7ee423-e4e0-4cac-8812-e60a0a741cee', '5e47b501-7176-42f8-8137-c5acc30759bc', 117, 'Convolution of two signals in the time domain corresponds to which operation in the frequency domain?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c553c5c-8749-42c6-a98f-2251a733c6cd', '9e7ee423-e4e0-4cac-8812-e60a0a741cee', 0, 'Addition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4df3570d-e459-4c76-8f53-5fa4da975c6a', '9e7ee423-e4e0-4cac-8812-e60a0a741cee', 1, 'Multiplication');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ba3cb7d-3072-4075-b870-59f66435354f', '9e7ee423-e4e0-4cac-8812-e60a0a741cee', 2, 'Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5b76ff0-1ec3-4cc2-8942-64d189a8e20d', '9e7ee423-e4e0-4cac-8812-e60a0a741cee', 3, 'Subtraction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9e7ee423-e4e0-4cac-8812-e60a0a741cee', '4df3570d-e459-4c76-8f53-5fa4da975c6a', 'Time-domain convolution corresponds to simple multiplication in the frequency domain (and vice versa) — a fundamental property (the Convolution Theorem) extensively used in signal processing and system analysis via the Fourier/Laplace transform.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4079de28-5a58-453e-a2c0-c7a75256a85e', '5e47b501-7176-42f8-8137-c5acc30759bc', 118, 'The impulse response of a Linear Time-Invariant (LTI) system, combined with an arbitrary input signal via convolution, is used to determine:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b10e4ac-19d1-4fb4-b98d-e57e47641b0a', '4079de28-5a58-453e-a2c0-c7a75256a85e', 0, 'The system''s power consumption');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3efead50-78e9-475b-80b4-cd657acef22b', '4079de28-5a58-453e-a2c0-c7a75256a85e', 1, 'The system''s complete output response to that input signal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0a587e6-06c4-4578-8e04-7abca81316c8', '4079de28-5a58-453e-a2c0-c7a75256a85e', 2, 'The system''s physical dimensions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9821857-3718-4b15-8424-51064a055b1b', '4079de28-5a58-453e-a2c0-c7a75256a85e', 3, 'The system''s manufacturing cost');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4079de28-5a58-453e-a2c0-c7a75256a85e', '3efead50-78e9-475b-80b4-cd657acef22b', 'For an LTI system, convolving the input signal with the system''s impulse response yields the system''s complete output response — this is a foundational result in linear systems theory, since the impulse response fully characterizes an LTI system''s behavior.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7ec26470-49ea-4109-814d-c835d9115d40', '5e47b501-7176-42f8-8137-c5acc30759bc', 119, 'The Laplace Transform is particularly useful in signals and systems analysis because it:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d49f45b0-a78d-4798-868c-755a341050d7', '7ec26470-49ea-4109-814d-c835d9115d40', 0, 'Only works for periodic signals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ce7356c-6787-4a70-8a98-5101cdb7f65d', '7ec26470-49ea-4109-814d-c835d9115d40', 1, 'Converts differential equations describing a system into algebraic equations, simplifying analysis (particularly for transient and stability behavior)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f329bc5-908b-419c-b758-0cd1712398c5', '7ec26470-49ea-4109-814d-c835d9115d40', 2, 'Only applies to digital systems');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67facdba-58e2-431e-b6df-e00a85244d03', '7ec26470-49ea-4109-814d-c835d9115d40', 3, 'Cannot handle initial conditions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7ec26470-49ea-4109-814d-c835d9115d40', '2ce7356c-6787-4a70-8a98-5101cdb7f65d', 'The Laplace Transform converts linear differential equations (describing continuous-time system dynamics) into algebraic equations in the complex frequency domain (s-domain), greatly simplifying analysis of transient response, stability, and transfer functions — particularly valuable since it naturally incorporates initial conditions.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2ec89bd7-21b6-4d42-8e41-79aa0390b9b3', '5e47b501-7176-42f8-8137-c5acc30759bc', 120, 'The Z-Transform serves the same fundamental role for discrete-time systems that the Laplace Transform serves for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69cc1d2b-65fe-4b6a-83cc-35ae449c0226', '2ec89bd7-21b6-4d42-8e41-79aa0390b9b3', 0, 'Only digital image processing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a02327fc-955f-4c5c-9f00-f4701c350007', '2ec89bd7-21b6-4d42-8e41-79aa0390b9b3', 1, 'Continuous-time systems');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5154cd7e-55eb-4a7e-ba1d-d43789759076', '2ec89bd7-21b6-4d42-8e41-79aa0390b9b3', 2, 'Only mechanical systems');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb9d9b1c-65c4-4aec-a6f4-3042dcfd700a', '2ec89bd7-21b6-4d42-8e41-79aa0390b9b3', 3, 'Only thermal systems');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2ec89bd7-21b6-4d42-8e41-79aa0390b9b3', 'a02327fc-955f-4c5c-9f00-f4701c350007', 'The Z-Transform is the discrete-time counterpart to the Laplace Transform, converting difference equations (describing discrete-time/digital system dynamics) into algebraic equations in the z-domain, simplifying analysis of discrete-time systems analogous to how the Laplace Transform simplifies continuous-time system analysis.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f0fd337b-8b88-4376-9d34-d296aeaf5c6e', '5e47b501-7176-42f8-8137-c5acc30759bc', 121, 'A signal is classified as ''periodic'' if:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('267c3739-07e9-4535-a6b6-9110cb8c5500', 'f0fd337b-8b88-4376-9d34-d296aeaf5c6e', 0, 'It never repeats');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aec84ab7-1a37-49db-b5ef-a046cdc97e11', 'f0fd337b-8b88-4376-9d34-d296aeaf5c6e', 1, 'It repeats identically after a fixed time interval (the period), for all time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ade584f-7ae8-4df8-8df9-36b7df245562', 'f0fd337b-8b88-4376-9d34-d296aeaf5c6e', 2, 'It exists only for a finite duration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e5f940a-49f0-4002-912d-361e50fbbcb1', 'f0fd337b-8b88-4376-9d34-d296aeaf5c6e', 3, 'Its amplitude is always constant');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f0fd337b-8b88-4376-9d34-d296aeaf5c6e', 'aec84ab7-1a37-49db-b5ef-a046cdc97e11', 'A periodic signal repeats its exact waveform pattern after a fixed time interval called the period (T), for all time (theoretically extending infinitely in both directions) — sinusoids are the canonical example of periodic signals.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3402625e-b5d3-48e5-894a-5613ec8684dd', '5e47b501-7176-42f8-8137-c5acc30759bc', 122, 'The Fourier Series is used to represent:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36ab0498-c919-42f5-a9ca-bd7a29bbbd2b', '3402625e-b5d3-48e5-894a-5613ec8684dd', 0, 'Only non-periodic (aperiodic) signals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('488dcfe5-a496-4ad3-8200-433b948b4902', '3402625e-b5d3-48e5-894a-5613ec8684dd', 1, 'A periodic signal as a sum of sinusoids (harmonics) at integer multiples of the fundamental frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb4bce62-d07d-4efb-9b4a-ff17547cb9f6', '3402625e-b5d3-48e5-894a-5613ec8684dd', 2, 'Only digital signals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47843f74-7d9f-4961-9e92-b0d228426114', '3402625e-b5d3-48e5-894a-5613ec8684dd', 3, 'Only signals with zero frequency content');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3402625e-b5d3-48e5-894a-5613ec8684dd', '488dcfe5-a496-4ad3-8200-433b948b4902', 'The Fourier Series represents any well-behaved periodic signal as a (potentially infinite) sum of sinusoidal components (harmonics) at frequencies that are integer multiples of the signal''s fundamental frequency — a foundational tool for analyzing periodic signals'' frequency content.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ce9074b7-b793-4b59-b3be-63ef4a07df6c', '5e47b501-7176-42f8-8137-c5acc30759bc', 123, 'A system is ''stable'' in the Bounded-Input, Bounded-Output (BIBO) sense if:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05691741-49c6-4300-a606-54cf9fc0e51f', 'ce9074b7-b793-4b59-b3be-63ef4a07df6c', 0, 'Every bounded input produces a bounded output');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74d17caa-7d0b-4917-a059-df06149f9fe3', 'ce9074b7-b793-4b59-b3be-63ef4a07df6c', 1, 'Every input produces an unbounded output');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6010abb-2381-4666-91d2-0504187ab577', 'ce9074b7-b793-4b59-b3be-63ef4a07df6c', 2, 'The system has no output at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae0bf01f-c0aa-4c97-9d00-e1adbb9d85e7', 'ce9074b7-b793-4b59-b3be-63ef4a07df6c', 3, 'The system''s impulse response is infinite in duration always');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ce9074b7-b793-4b59-b3be-63ef4a07df6c', '05691741-49c6-4300-a606-54cf9fc0e51f', 'BIBO stability requires that every bounded (finite-amplitude) input signal produces a correspondingly bounded (finite-amplitude) output signal — a fundamental practical requirement for any usable real-world system.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('82fd4a3a-9011-4eaa-bc17-4d31861d630d', '5e47b501-7176-42f8-8137-c5acc30759bc', 124, 'Aliasing in signal sampling occurs when:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f7981ff-6505-4e1c-94d0-8b6997644eea', '82fd4a3a-9011-4eaa-bc17-4d31861d630d', 0, 'The sampling rate is much higher than necessary');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3212a10e-5369-4f18-8f90-72a36fa3a357', '82fd4a3a-9011-4eaa-bc17-4d31861d630d', 1, 'A signal is sampled at a rate below the Nyquist rate (less than twice its highest frequency component), causing high-frequency content to be misrepresented as lower frequencies');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8927bc14-cadc-4f90-8d38-f72e01950b89', '82fd4a3a-9011-4eaa-bc17-4d31861d630d', 2, 'The signal has zero amplitude');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b816f3a-32ce-4b86-8f3c-38748a6be3d4', '82fd4a3a-9011-4eaa-bc17-4d31861d630d', 3, 'The signal is purely DC');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('82fd4a3a-9011-4eaa-bc17-4d31861d630d', '3212a10e-5369-4f18-8f90-72a36fa3a357', 'Aliasing occurs when a signal is sampled at a rate below its Nyquist rate, causing high-frequency components to be indistinguishable from (and misrepresented as) lower-frequency components in the sampled signal — an irreversible distortion, prevented in practice by using an anti-aliasing low-pass filter before sampling.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('232bc612-ec61-425e-aad0-106dbf5e4d50', '5e47b501-7176-42f8-8137-c5acc30759bc', 125, 'The ''unit step function'' u(t), commonly used in signals and systems analysis, is defined as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff7e6bce-1559-41fb-84ee-ad6f455ef111', '232bc612-ec61-425e-aad0-106dbf5e4d50', 0, 'u(t) = 0 for all t');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2872cea1-9818-414f-a263-bb0b33dc8283', '232bc612-ec61-425e-aad0-106dbf5e4d50', 1, 'u(t) = 1 for t ≥ 0, and u(t) = 0 for t < 0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df351599-110f-41c0-a131-80da49e2eb0f', '232bc612-ec61-425e-aad0-106dbf5e4d50', 2, 'u(t) = t for all t');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('135068fb-c0cb-47e5-8d64-dc4602c10385', '232bc612-ec61-425e-aad0-106dbf5e4d50', 3, 'u(t) is always negative');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('232bc612-ec61-425e-aad0-106dbf5e4d50', '2872cea1-9818-414f-a263-bb0b33dc8283', 'The unit step function u(t) is defined as 0 for negative time and 1 for time zero and beyond — a fundamental, widely-used test signal for analyzing a system''s transient step response.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e01f5377-9aee-4512-81b0-d62f767cf003', '5e47b501-7176-42f8-8137-c5acc30759bc', 126, 'The transfer function of a control system is the ratio of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb4c765d-805c-4f76-ae78-b064ab7eeab5', 'e01f5377-9aee-4512-81b0-d62f767cf003', 0, 'Input to output in the time domain directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77c1b6a5-2d62-42ff-ac0f-c2119cd4aa87', 'e01f5377-9aee-4512-81b0-d62f767cf003', 1, 'The Laplace transform of the output to the Laplace transform of the input, under zero initial conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a9f2bce-605c-4797-8fa7-75aac440cb0e', 'e01f5377-9aee-4512-81b0-d62f767cf003', 2, 'The system''s power to its weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f13d988-2d8d-4451-8341-2668cbdbdecd', 'e01f5377-9aee-4512-81b0-d62f767cf003', 3, 'The steady-state error to the input signal');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e01f5377-9aee-4512-81b0-d62f767cf003', '77c1b6a5-2d62-42ff-ac0f-c2119cd4aa87', 'A transfer function is defined in the Laplace (s-domain) as C(s)/R(s), the ratio of the output''s Laplace transform to the input''s Laplace transform, assuming zero initial conditions.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('33b50b53-2bf6-4d5e-8a59-02fc6c109d00', '5e47b501-7176-42f8-8137-c5acc30759bc', 127, 'For a system to be BIBO stable, all poles of its transfer function must lie:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('260bf935-0b3f-4332-a31a-6af8b8f55dce', '33b50b53-2bf6-4d5e-8a59-02fc6c109d00', 0, 'In the right half of the s-plane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b41a74a4-bc15-47b1-9f8e-472fa5326d05', '33b50b53-2bf6-4d5e-8a59-02fc6c109d00', 1, 'In the left half of the s-plane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8127123b-5c4c-4549-81ea-afac68d4409f', '33b50b53-2bf6-4d5e-8a59-02fc6c109d00', 2, 'On the imaginary axis exactly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d1edee7-6493-4cb9-a9fd-680beb57feae', '33b50b53-2bf6-4d5e-8a59-02fc6c109d00', 3, 'Anywhere, stability doesn''t depend on pole location');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('33b50b53-2bf6-4d5e-8a59-02fc6c109d00', 'b41a74a4-bc15-47b1-9f8e-472fa5326d05', 'For BIBO stability, every pole of the transfer function must lie strictly in the left half of the s-plane — a pole in the right half plane (or a repeated pole on the imaginary axis) results in an unbounded response to a bounded input.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bc9a4732-1678-4b93-b63b-9f30eaed0048', '5e47b501-7176-42f8-8137-c5acc30759bc', 128, 'A PID controller combines which three control actions?');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f13aad55-7560-4aa0-9131-0fe6169bdbe2', 'bc9a4732-1678-4b93-b63b-9f30eaed0048', 0, 'Power, Impedance, Damping');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd7e842e-192c-412c-af46-b612675cd450', 'bc9a4732-1678-4b93-b63b-9f30eaed0048', 1, 'Proportional, Integral, Derivative');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c70848f-b69e-465f-a7d1-54d3bfe443ef', 'bc9a4732-1678-4b93-b63b-9f30eaed0048', 2, 'Phase, Inductance, Delay');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('312648e7-6a59-4ed0-93f0-a9d316dd228f', 'bc9a4732-1678-4b93-b63b-9f30eaed0048', 3, 'Position, Inertia, Direction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bc9a4732-1678-4b93-b63b-9f30eaed0048', 'cd7e842e-192c-412c-af46-b612675cd450', 'PID stands for Proportional-Integral-Derivative control, combining a term proportional to current error, an integral term that eliminates steady-state error, and a derivative term that anticipates future error trends to improve transient response.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8b984508-d70f-40fc-9d4d-b137c1cb99be', '5e47b501-7176-42f8-8137-c5acc30759bc', 129, 'Negative feedback in a control system is primarily used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9702faf8-f836-4610-af57-7b8da37da576', '8b984508-d70f-40fc-9d4d-b137c1cb99be', 0, 'Increase the system''s sensitivity to parameter variations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7b707a4-580d-40bb-9b66-500cdb825835', '8b984508-d70f-40fc-9d4d-b137c1cb99be', 1, 'Reduce sensitivity to disturbances and parameter variations, improving accuracy and robustness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8360eff1-f8a7-420f-ae55-56cc7bb948c6', '8b984508-d70f-40fc-9d4d-b137c1cb99be', 2, 'Eliminate the need for a controller entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d30794f2-7436-40dc-8b03-f349f6071c7e', '8b984508-d70f-40fc-9d4d-b137c1cb99be', 3, 'Always increase bandwidth without limit');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8b984508-d70f-40fc-9d4d-b137c1cb99be', 'b7b707a4-580d-40bb-9b66-500cdb825835', 'Negative feedback continuously compares the actual output to the desired reference and corrects for the difference, significantly reducing the system''s sensitivity to external disturbances and internal parameter variations — a fundamental advantage over open-loop control.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('78a91c68-09ea-49e0-b051-6fff2dd4d438', '5e47b501-7176-42f8-8137-c5acc30759bc', 130, 'The Routh-Hurwitz criterion is used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4a313ee-1f92-465f-87f3-7caaa59c1a09', '78a91c68-09ea-49e0-b051-6fff2dd4d438', 0, 'Directly compute a system''s frequency response');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77239c46-3d04-493a-be52-0318786a2d04', '78a91c68-09ea-49e0-b051-6fff2dd4d438', 1, 'Determine the number of roots of the characteristic equation in the right half of the s-plane, without actually solving for the roots');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f8ebaa0-7134-421c-915a-86e3aad7e08e', '78a91c68-09ea-49e0-b051-6fff2dd4d438', 2, 'Calculate a system''s transfer function from scratch');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a3152cf-fa43-492d-a016-47d473a47dd9', '78a91c68-09ea-49e0-b051-6fff2dd4d438', 3, 'Measure a system''s power consumption');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('78a91c68-09ea-49e0-b051-6fff2dd4d438', '77239c46-3d04-493a-be52-0318786a2d04', 'The Routh-Hurwitz criterion is an algebraic method that determines the number of characteristic equation roots lying in the right half of the s-plane (indicating instability) directly from the equation''s coefficients, without requiring the roots to be explicitly computed.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d9660e1b-71b9-4d1f-b4d0-dabfa33621ad', '5e47b501-7176-42f8-8137-c5acc30759bc', 131, 'A second-order underdamped control system has a damping ratio (ζ) in the range:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0bf2b572-2517-401d-8dbb-e58c839280f5', 'd9660e1b-71b9-4d1f-b4d0-dabfa33621ad', 0, 'ζ = 0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b200fe03-5235-40c5-b549-c0fe2116af58', 'd9660e1b-71b9-4d1f-b4d0-dabfa33621ad', 1, '0 < ζ < 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dee87f39-61c8-48a0-8f39-6e19e423311c', 'd9660e1b-71b9-4d1f-b4d0-dabfa33621ad', 2, 'ζ = 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f155a8c-65be-4525-a6b1-6c8b8b74bc2a', 'd9660e1b-71b9-4d1f-b4d0-dabfa33621ad', 3, 'ζ > 1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d9660e1b-71b9-4d1f-b4d0-dabfa33621ad', 'b200fe03-5235-40c5-b549-c0fe2116af58', 'An underdamped second-order system has 0 < ζ < 1, resulting in a decaying oscillatory response — ζ=0 is undamped (sustained oscillation), ζ=1 is critically damped, and ζ>1 is overdamped.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9256791f-390c-47b2-b9ac-edc5fc4a14ae', '5e47b501-7176-42f8-8137-c5acc30759bc', 132, 'A Bode plot represents system frequency response using:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3823264c-bf5a-47c2-840e-23c979c821e7', '9256791f-390c-47b2-b9ac-edc5fc4a14ae', 0, 'Only a single combined magnitude-and-phase plot');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad87003a-8d3a-4f73-9b7b-69bff253e93b', '9256791f-390c-47b2-b9ac-edc5fc4a14ae', 1, 'Separate magnitude (in dB) and phase (in degrees) plots, both against frequency on a logarithmic scale');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68be08b7-9423-460b-87ea-882d71011c4d', '9256791f-390c-47b2-b9ac-edc5fc4a14ae', 2, 'A plot of pole locations only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16fe473d-2ff2-4d1c-8345-6eb23528a25f', '9256791f-390c-47b2-b9ac-edc5fc4a14ae', 3, 'A plot of time-domain step response only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9256791f-390c-47b2-b9ac-edc5fc4a14ae', 'ad87003a-8d3a-4f73-9b7b-69bff253e93b', 'A Bode plot consists of two separate graphs — magnitude (in decibels) and phase (in degrees) — both plotted against frequency on a logarithmic scale, providing a practical graphical tool for stability analysis via gain and phase margins.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c6aed9c2-80ce-4b37-9fe9-d2a2733e3f97', '5e47b501-7176-42f8-8137-c5acc30759bc', 133, 'The ''type'' of a control system (Type 0, 1, 2) is determined by:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bda137be-8c82-4db4-b684-017547bd3428', 'c6aed9c2-80ce-4b37-9fe9-d2a2733e3f97', 0, 'The number of poles located at the origin of the open-loop transfer function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('565e7abc-37d9-4b8b-a9db-96a8615ca08f', 'c6aed9c2-80ce-4b37-9fe9-d2a2733e3f97', 1, 'The number of zeros in the closed-loop transfer function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6fc990a-3117-46d0-903a-ad05331b2a7e', 'c6aed9c2-80ce-4b37-9fe9-d2a2733e3f97', 2, 'The system''s physical size');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7834a47a-93fd-4474-94fe-35a7ad24c797', 'c6aed9c2-80ce-4b37-9fe9-d2a2733e3f97', 3, 'The number of feedback loops');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c6aed9c2-80ce-4b37-9fe9-d2a2733e3f97', 'bda137be-8c82-4db4-b684-017547bd3428', 'System type is defined by the number of poles at the origin (s=0) in the open-loop transfer function — this directly determines the system''s steady-state error characteristics for step, ramp, and parabolic reference inputs.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b9fa8cee-d27f-4c2f-8381-aa2783c14a4b', '5e47b501-7176-42f8-8137-c5acc30759bc', 134, 'Root locus analysis is used to study:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e49a15e3-6101-4612-94f5-127ad7bb1e22', 'b9fa8cee-d27f-4c2f-8381-aa2783c14a4b', 0, 'How closed-loop pole locations move in the s-plane as a system parameter (typically loop gain K) is varied');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25e49264-1746-4ebd-add4-a7d91b540f86', 'b9fa8cee-d27f-4c2f-8381-aa2783c14a4b', 1, 'A system''s exact numerical output for a given input');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3e77d7d-6b7a-4ada-ad27-f1e0babe0251', 'b9fa8cee-d27f-4c2f-8381-aa2783c14a4b', 2, 'The physical layout of circuit components');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('450d40e9-8e70-41fc-a1ca-cec9cc38a16b', 'b9fa8cee-d27f-4c2f-8381-aa2783c14a4b', 3, 'Power supply ripple');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b9fa8cee-d27f-4c2f-8381-aa2783c14a4b', 'e49a15e3-6101-4612-94f5-127ad7bb1e22', 'Root locus is a graphical technique showing how the closed-loop poles of a system move within the s-plane as a chosen parameter (most commonly the loop gain K) is varied from 0 to infinity, directly informing stability margins and transient response design.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8421d9a8-8b62-4fb8-b791-14822d4926c7', '5e47b501-7176-42f8-8137-c5acc30759bc', 135, 'State-space representation of a control system, compared to a transfer-function representation, offers the advantage of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ec4cd5f-52d0-441c-a1fa-ebd9cde47f5c', '8421d9a8-8b62-4fb8-b791-14822d4926c7', 0, 'Being limited to single-input, single-output systems only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd36267b-9510-4f80-849f-3b7b9042475c', '8421d9a8-8b62-4fb8-b791-14822d4926c7', 1, 'Naturally handling multiple-input, multiple-output (MIMO) systems and providing internal state information, not just input-output behavior');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('832d965c-b07b-464e-b2e0-90a91f39a034', '8421d9a8-8b62-4fb8-b791-14822d4926c7', 2, 'Not requiring any mathematical modeling at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfd65130-46ee-4cb2-adbe-f68ab89ff8e2', '8421d9a8-8b62-4fb8-b791-14822d4926c7', 3, 'Being applicable only to purely static systems');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8421d9a8-8b62-4fb8-b791-14822d4926c7', 'cd36267b-9510-4f80-849f-3b7b9042475c', 'State-space representation naturally extends to multiple-input, multiple-output (MIMO) systems, and provides insight into a system''s internal states (not just its external input-output relationship, as a transfer function does) — a significant advantage for complex, modern control system design and analysis.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c9033b86-97e6-44ab-8a78-c329d644baaa', '5e47b501-7176-42f8-8137-c5acc30759bc', 136, 'A microprocessor, in contrast to a microcontroller, is best described as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6175ab68-e2e8-47aa-aaba-e40909558f4c', 'c9033b86-97e6-44ab-8a78-c329d644baaa', 0, 'A complete standalone computing system with built-in RAM, ROM, and I/O on a single chip');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0fbb00e-d6ca-4f09-a69e-da001b74d7b4', 'c9033b86-97e6-44ab-8a78-c329d644baaa', 1, 'A CPU on a single chip, requiring external memory and I/O peripheral chips to form a complete functioning system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9af58fe1-9132-40d7-a749-f4857315c444', 'c9033b86-97e6-44ab-8a78-c329d644baaa', 2, 'A device with no arithmetic capability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d01f76dc-d808-457f-b888-4419e27fa07b', 'c9033b86-97e6-44ab-8a78-c329d644baaa', 3, 'A purely analog device');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c9033b86-97e6-44ab-8a78-c329d644baaa', 'c0fbb00e-d6ca-4f09-a69e-da001b74d7b4', 'A microprocessor is essentially just a CPU (arithmetic/logic and control unit) on a single chip, requiring external memory (RAM/ROM) and I/O peripheral chips to build a complete system; a microcontroller, by contrast, integrates a CPU along with RAM, ROM, and I/O peripherals all on a single chip — making it a self-contained embedded computing solution.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e0342f5b-575f-4be5-b322-79c2a2691182', '5e47b501-7176-42f8-8137-c5acc30759bc', 137, 'The ''program counter'' (PC) register in a microprocessor holds:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ecd9020e-a09d-4b67-b6cd-046d7ebe0ebf', 'e0342f5b-575f-4be5-b322-79c2a2691182', 0, 'The current data being processed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a5f4e5a-ac13-41f6-bc26-e280ee05f35e', 'e0342f5b-575f-4be5-b322-79c2a2691182', 1, 'The memory address of the next instruction to be fetched and executed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('14ddb7c7-e58a-476d-867f-38b2606aeb9f', 'e0342f5b-575f-4be5-b322-79c2a2691182', 2, 'The result of the last arithmetic operation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a720d1ce-1696-4c1f-b68d-ca630179f940', 'e0342f5b-575f-4be5-b322-79c2a2691182', 3, 'The processor''s clock frequency');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e0342f5b-575f-4be5-b322-79c2a2691182', '8a5f4e5a-ac13-41f6-bc26-e280ee05f35e', 'The program counter holds the memory address of the next instruction to be fetched — after each instruction fetch, the PC is automatically incremented (or altered by a jump/branch instruction) to point to the subsequent instruction.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a648a5a6-0ec2-474d-95ac-4c8e87146452', '5e47b501-7176-42f8-8137-c5acc30759bc', 138, 'An ''interrupt'' in microprocessor/microcontroller systems is a mechanism that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16615bb8-9ca5-4db6-9520-e0b15e23e0f7', 'a648a5a6-0ec2-474d-95ac-4c8e87146452', 0, 'Permanently halts the processor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ff40514-ae9b-47f6-80fd-8077334fa1db', 'a648a5a6-0ec2-474d-95ac-4c8e87146452', 1, 'Allows an external event or internal condition to temporarily suspend normal program execution and jump to a specific service routine, then resume');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f621d053-8d9d-4ae8-b14c-d272158eaaf8', 'a648a5a6-0ec2-474d-95ac-4c8e87146452', 2, 'Only works during system startup');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8abd35d2-7f9f-473e-b777-895af7b8cfa7', 'a648a5a6-0ec2-474d-95ac-4c8e87146452', 3, 'Increases the clock speed temporarily');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a648a5a6-0ec2-474d-95ac-4c8e87146452', '3ff40514-ae9b-47f6-80fd-8077334fa1db', 'An interrupt allows an external event (like a peripheral requesting attention) or an internal condition to temporarily suspend the currently executing program, jump to a dedicated interrupt service routine (ISR) to handle the event, and then resume the original program from where it left off — essential for responsive, efficient real-time embedded system design.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cc2708fa-09b2-4877-9a3c-c1bcb08a0612', '5e47b501-7176-42f8-8137-c5acc30759bc', 139, '''DMA'' (Direct Memory Access) in a computer/embedded system allows:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c055192-4c29-4784-b9ce-2bd491e6ba33', 'cc2708fa-09b2-4877-9a3c-c1bcb08a0612', 0, 'The CPU to be involved in every single byte of a data transfer between memory and a peripheral');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('286a0bb9-8dc9-4905-bdc8-125c81d779ce', 'cc2708fa-09b2-4877-9a3c-c1bcb08a0612', 1, 'A peripheral device to transfer data directly to/from memory without continuous CPU involvement for each individual data transfer, freeing the CPU for other tasks');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f3624762-5b50-4993-8923-92f31c7de230', 'cc2708fa-09b2-4877-9a3c-c1bcb08a0612', 2, 'Data to be permanently stored without ever being erased');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1f636ae-fbfd-4c85-a194-f5d9f186da45', 'cc2708fa-09b2-4877-9a3c-c1bcb08a0612', 3, 'The removal of all memory from the system');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cc2708fa-09b2-4877-9a3c-c1bcb08a0612', '286a0bb9-8dc9-4905-bdc8-125c81d779ce', 'DMA allows a peripheral device (like a disk controller or ADC) to transfer blocks of data directly to/from system memory without requiring the CPU to manage each individual byte transfer, significantly freeing up CPU cycles for other processing tasks during large data transfers.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c58c16aa-6102-413e-bfa0-c2007e005b89', '5e47b501-7176-42f8-8137-c5acc30759bc', 140, 'The ''stack'' in a microprocessor system is primarily used for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8cad099-aad7-45df-a91b-0e490e198042', 'c58c16aa-6102-413e-bfa0-c2007e005b89', 0, 'Permanent, non-volatile data storage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27f4b971-ad52-418b-99cb-2bbe0be23444', 'c58c16aa-6102-413e-bfa0-c2007e005b89', 1, 'Temporary storage of return addresses (during subroutine calls) and register values, typically operating on a Last-In-First-Out (LIFO) basis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47e925e6-1bd4-47f2-b53b-9792993e1f7f', 'c58c16aa-6102-413e-bfa0-c2007e005b89', 2, 'Storing the operating system''s source code');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('edb4069c-d791-4b30-aa01-9e24a1be4986', 'c58c16aa-6102-413e-bfa0-c2007e005b89', 3, 'Generating clock signals');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c58c16aa-6102-413e-bfa0-c2007e005b89', '27f4b971-ad52-418b-99cb-2bbe0be23444', 'The stack is a region of memory used for temporary storage, particularly for saving return addresses during subroutine/function calls and preserving register values, operating on a Last-In-First-Out (LIFO) basis — critical for supporting nested function calls and interrupt handling.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ac7ea73f-609b-4899-9605-6fc255eaaea7', '5e47b501-7176-42f8-8137-c5acc30759bc', 141, 'A UART (Universal Asynchronous Receiver/Transmitter) peripheral is primarily used for:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0025b93a-018e-4a9e-8eda-1d4fff2242aa', 'ac7ea73f-609b-4899-9605-6fc255eaaea7', 0, 'Parallel data transmission only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a33f38a4-ad76-419c-88f8-7484ebf532c7', 'ac7ea73f-609b-4899-9605-6fc255eaaea7', 1, 'Serial, asynchronous communication between a microcontroller and another device, without a shared clock signal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9288352f-5233-4a3e-9984-038492b15b50', 'ac7ea73f-609b-4899-9605-6fc255eaaea7', 2, 'Storing program code');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd8340d4-6f17-4ebc-9119-18a66607bde2', 'ac7ea73f-609b-4899-9605-6fc255eaaea7', 3, 'Generating analog output signals');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ac7ea73f-609b-4899-9605-6fc255eaaea7', 'a33f38a4-ad76-419c-88f8-7484ebf532c7', 'A UART enables serial, asynchronous data communication (like the common RS-232/USB-serial protocol) between a microcontroller and another device, without requiring a shared clock signal — timing synchronization is instead achieved via defined start/stop bits and an agreed baud rate.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('49c51e70-ee13-4121-bbc3-6aadab73846c', '5e47b501-7176-42f8-8137-c5acc30759bc', 142, 'An ADC (Analog-to-Digital Converter) peripheral in a microcontroller is used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49d8d132-700a-4b2e-90cf-3819d4e5c727', '49c51e70-ee13-4121-bbc3-6aadab73846c', 0, 'Convert a digital signal into an analog voltage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0ec01ce-9f2c-4561-88ad-f5cd97e8a21c', '49c51e70-ee13-4121-bbc3-6aadab73846c', 1, 'Convert a continuously-varying analog input signal (like a sensor''s voltage output) into a discrete digital value the microcontroller can process');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('413fb403-fd58-49e8-b500-0114692d4164', '49c51e70-ee13-4121-bbc3-6aadab73846c', 2, 'Amplify a digital signal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63fd8ed9-bbb2-4031-98ee-f5b6a26c4362', '49c51e70-ee13-4121-bbc3-6aadab73846c', 3, 'Generate a clock signal');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('49c51e70-ee13-4121-bbc3-6aadab73846c', 'f0ec01ce-9f2c-4561-88ad-f5cd97e8a21c', 'An ADC converts a continuous analog input signal (e.g., from a temperature or pressure sensor) into a discrete digital value that the microcontroller''s CPU can read and process — a fundamental interface for embedded systems interacting with real-world analog sensors.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0f27e5eb-fd5d-4b6f-9dcb-33747cc5bb73', '5e47b501-7176-42f8-8137-c5acc30759bc', 143, '''Pipelining'' in processor architecture is a technique that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6102954b-1e63-4a51-9f11-67ffe8bc791f', '0f27e5eb-fd5d-4b6f-9dcb-33747cc5bb73', 0, 'Executes instructions strictly one at a time, completing each fully before starting the next');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('697ebf0b-ad5f-4a13-9fd2-26772eb4c3e8', '0f27e5eb-fd5d-4b6f-9dcb-33747cc5bb73', 1, 'Overlaps the execution of multiple instructions at different stages (fetch, decode, execute, etc.) simultaneously, improving overall instruction throughput');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6cf59aba-65a9-4fa7-a18a-e81bb65dfa74', '0f27e5eb-fd5d-4b6f-9dcb-33747cc5bb73', 2, 'Only applies to memory access, not instruction execution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('edf4e3b1-9607-4305-9928-4b2660029f6b', '0f27e5eb-fd5d-4b6f-9dcb-33747cc5bb73', 3, 'Reduces the processor''s clock speed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0f27e5eb-fd5d-4b6f-9dcb-33747cc5bb73', '697ebf0b-ad5f-4a13-9fd2-26772eb4c3e8', 'Pipelining overlaps the execution of multiple instructions by breaking instruction processing into stages (e.g., fetch, decode, execute, memory access, write-back) and processing different instructions simultaneously at different stages — significantly improving overall instruction throughput compared to fully sequential (non-pipelined) execution.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a1128b0c-583f-4cd4-8a9e-abb3819088e1', '5e47b501-7176-42f8-8137-c5acc30759bc', 144, 'The primary difference between RISC and CISC processor architectures is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ada5edf-5ad1-4b4d-95c9-c4dd19024c57', 'a1128b0c-583f-4cd4-8a9e-abb3819088e1', 0, 'RISC uses a small set of simple, fixed-length instructions executed in roughly one clock cycle each; CISC uses a larger set of more complex, variable-length instructions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3bfc7d77-2ac7-4f89-b152-84640ab4acda', 'a1128b0c-583f-4cd4-8a9e-abb3819088e1', 1, 'CISC processors have no instruction set at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b2da790-781f-4ffe-a097-5cb115b0347b', 'a1128b0c-583f-4cd4-8a9e-abb3819088e1', 2, 'RISC processors cannot perform arithmetic operations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72f65762-57c7-455c-b80b-e2a224fffe4c', 'a1128b0c-583f-4cd4-8a9e-abb3819088e1', 3, 'There is no meaningful architectural difference');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a1128b0c-583f-4cd4-8a9e-abb3819088e1', '1ada5edf-5ad1-4b4d-95c9-c4dd19024c57', 'RISC (Reduced Instruction Set Computer) architectures use a smaller set of simple, fixed-length instructions, each typically executable in about one clock cycle, favoring simpler hardware and compiler-driven optimization; CISC (Complex Instruction Set Computer) architectures use a larger, more complex instruction set with variable-length instructions, some of which can perform multiple operations in a single instruction.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('46e8d242-fc93-40cf-9b3c-a353ba9b71db', '5e47b501-7176-42f8-8137-c5acc30759bc', 145, 'Watchdog timer in an embedded microcontroller system is primarily used to:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('372b4cc3-a31e-410b-86ea-7d92eb7b36cf', '46e8d242-fc93-40cf-9b3c-a353ba9b71db', 0, 'Measure the ambient temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('744c90f5-66fe-42a0-adde-eba0749c662b', '46e8d242-fc93-40cf-9b3c-a353ba9b71db', 1, 'Automatically reset the system if the software fails to periodically ''service'' (reset) the timer, indicating a software hang or malfunction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('915e8ab9-9ead-41fb-9245-80938abe99c7', '46e8d242-fc93-40cf-9b3c-a353ba9b71db', 2, 'Increase the processor''s clock speed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7319cb50-189d-49b7-a718-3b7c508859fe', '46e8d242-fc93-40cf-9b3c-a353ba9b71db', 3, 'Store program code permanently');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('46e8d242-fc93-40cf-9b3c-a353ba9b71db', '744c90f5-66fe-42a0-adde-eba0749c662b', 'A watchdog timer is a hardware safety mechanism that automatically resets the microcontroller system if the running software fails to periodically reset (''service'' or ''kick'') the timer within a specified time window — a critical fault-recovery mechanism for embedded systems that must recover automatically from software hangs or crashes without human intervention.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e1aceb79-1e2d-4262-b423-7e15bfec5124', '5e47b501-7176-42f8-8137-c5acc30759bc', 146, 'Kirchhoff''s Voltage Law (KVL) is based on the principle of conservation of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7e02e20-e482-4240-b806-cb32e29b3d0e', 'e1aceb79-1e2d-4262-b423-7e15bfec5124', 0, 'Charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a247a11b-59a6-4ca2-b61e-72f86bd4d53e', 'e1aceb79-1e2d-4262-b423-7e15bfec5124', 1, 'Energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ac2de05-64b9-480b-84eb-b3950749daab', 'e1aceb79-1e2d-4262-b423-7e15bfec5124', 2, 'Momentum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1427aeba-ba91-4619-92f1-3782209ceb5a', 'e1aceb79-1e2d-4262-b423-7e15bfec5124', 3, 'Mass');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e1aceb79-1e2d-4262-b423-7e15bfec5124', 'a247a11b-59a6-4ca2-b61e-72f86bd4d53e', 'KVL states that the algebraic sum of voltages around any closed loop in a circuit is zero, a direct consequence of the conservation of energy — the total energy gained and lost by a unit charge traversing a closed loop must be zero.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('21368a3d-1028-47a6-96a6-1e4e7de3c9eb', '5e47b501-7176-42f8-8137-c5acc30759bc', 147, 'Kirchhoff''s Current Law (KCL) is based on the principle of conservation of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('937a4b68-c9a5-4d38-b3b7-baa035064d4d', '21368a3d-1028-47a6-96a6-1e4e7de3c9eb', 0, 'Energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee46d3f1-2e08-4ab5-b18f-69c7beb51647', '21368a3d-1028-47a6-96a6-1e4e7de3c9eb', 1, 'Charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17e36822-3d7d-4aae-812c-6d1ec31ab720', '21368a3d-1028-47a6-96a6-1e4e7de3c9eb', 2, 'Voltage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3e1534d-1bdb-42af-b4a1-e76d801fe567', '21368a3d-1028-47a6-96a6-1e4e7de3c9eb', 3, 'Power');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('21368a3d-1028-47a6-96a6-1e4e7de3c9eb', 'ee46d3f1-2e08-4ab5-b18f-69c7beb51647', 'KCL states that the algebraic sum of currents entering and leaving any node is zero, a direct consequence of the conservation of electric charge — charge cannot accumulate indefinitely at a node under steady-state conditions.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0f531079-9457-4fe1-91ac-07f9a84edb57', '5e47b501-7176-42f8-8137-c5acc30759bc', 148, 'Thevenin''s theorem allows a complex linear network, as seen from two terminals, to be represented as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83304b55-fb65-42b6-b56e-b3e5d284b52b', '0f531079-9457-4fe1-91ac-07f9a84edb57', 0, 'A current source in series with a resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95fd5572-b98e-47c9-9995-11c3289e7781', '0f531079-9457-4fe1-91ac-07f9a84edb57', 1, 'A single voltage source in series with a single resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37163d8d-6411-461d-b567-6570ab79b0bb', '0f531079-9457-4fe1-91ac-07f9a84edb57', 2, 'Two independent voltage sources');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('458cedf8-2c85-48f7-b6c8-da85e93628ab', '0f531079-9457-4fe1-91ac-07f9a84edb57', 3, 'A pure capacitor only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0f531079-9457-4fe1-91ac-07f9a84edb57', '95fd5572-b98e-47c9-9995-11c3289e7781', 'Thevenin''s theorem represents any linear network, as viewed from two output terminals, as a single equivalent voltage source (Thevenin voltage) in series with a single equivalent resistance (Thevenin resistance) — greatly simplifying analysis of the network''s effect on an external load.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d9a46bd3-99be-4ac0-acf2-3098b29398bd', '5e47b501-7176-42f8-8137-c5acc30759bc', 149, 'Two resistors of 8Ω and 4Ω are connected in parallel. The equivalent resistance is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e477e002-fb81-4888-8358-622af01c4d52', 'd9a46bd3-99be-4ac0-acf2-3098b29398bd', 0, '12Ω');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5c255a8-5eb7-4b69-84f3-ebbde933e3cf', 'd9a46bd3-99be-4ac0-acf2-3098b29398bd', 1, '2.67Ω');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2427ae3-1158-4488-8741-ee54f021d05f', 'd9a46bd3-99be-4ac0-acf2-3098b29398bd', 2, '6Ω');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9cbb01c8-042d-4a27-b21a-5adf68cdb628', 'd9a46bd3-99be-4ac0-acf2-3098b29398bd', 3, '32Ω');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d9a46bd3-99be-4ac0-acf2-3098b29398bd', 'b5c255a8-5eb7-4b69-84f3-ebbde933e3cf', 'For parallel resistors: 1/Req = 1/8 + 1/4 = 1/8 + 2/8 = 3/8, so Req = 8/3 ≈ 2.67Ω.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('19bc6338-d080-4e48-a96b-fea9d7e5ed38', '5e47b501-7176-42f8-8137-c5acc30759bc', 150, 'The Superposition theorem is applicable to circuits that are:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7965b6dd-0a66-4fbc-a3df-7f1d9e4aa4d2', '19bc6338-d080-4e48-a96b-fea9d7e5ed38', 0, 'Linear, containing two or more independent sources');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8a3ed18-9363-46b3-a0cf-cc5923039069', '19bc6338-d080-4e48-a96b-fea9d7e5ed38', 1, 'Exclusively nonlinear');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d278a54f-158a-41b3-aaea-1109418cbcf4', '19bc6338-d080-4e48-a96b-fea9d7e5ed38', 2, 'Only DC circuits, never AC circuits');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91dce138-b892-49b5-b8a5-ef953f4c7758', '19bc6338-d080-4e48-a96b-fea9d7e5ed38', 3, 'Only circuits with a single source');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('19bc6338-d080-4e48-a96b-fea9d7e5ed38', '7965b6dd-0a66-4fbc-a3df-7f1d9e4aa4d2', 'The Superposition theorem applies to linear circuits containing two or more independent sources — the total response is found by summing the individual responses to each source acting alone (with all other independent sources deactivated), and it applies equally to both DC and AC linear circuits.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e19674d0-3a30-4aa1-bf91-850a34d7a284', '5e47b501-7176-42f8-8137-c5acc30759bc', 151, 'Maximum power transfer from a source to a load occurs when the load resistance:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d05d59a3-afed-4b4a-ba75-d58416d31788', 'e19674d0-3a30-4aa1-bf91-850a34d7a284', 0, 'Is zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bf617d1-b581-46dc-84a5-34e282439928', 'e19674d0-3a30-4aa1-bf91-850a34d7a284', 1, 'Equals the source''s (Thevenin) internal resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85933c6b-3bef-42c2-927a-2ebef8bd5dab', 'e19674d0-3a30-4aa1-bf91-850a34d7a284', 2, 'Is infinite');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec278b88-2bb5-463b-9e48-f4225cdecf8a', 'e19674d0-3a30-4aa1-bf91-850a34d7a284', 3, 'Is exactly double the source resistance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e19674d0-3a30-4aa1-bf91-850a34d7a284', '2bf617d1-b581-46dc-84a5-34e282439928', 'The Maximum Power Transfer theorem states that maximum power is delivered to a load when the load resistance equals the source''s Thevenin (internal) resistance — though this configuration achieves only 50% power transfer efficiency, since equal power is dissipated in the source resistance itself.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('efced7a0-4b38-4934-8bc3-afec9de786ea', '5e47b501-7176-42f8-8137-c5acc30759bc', 152, 'In a series RLC circuit at resonance, the circuit''s impedance is:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86b2fba2-0e02-486a-a509-31b2b0957b7e', 'efced7a0-4b38-4934-8bc3-afec9de786ea', 0, 'Maximum, and purely reactive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f6260e5-d4e1-4a45-b5a0-20cad7ff7772', 'efced7a0-4b38-4934-8bc3-afec9de786ea', 1, 'Minimum, and purely resistive (equal to R)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('edd6825e-d1f8-4552-8e4b-8b60fa386004', 'efced7a0-4b38-4934-8bc3-afec9de786ea', 2, 'Zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbeea9ff-fab2-4989-a5cc-b48a2c0a9e32', 'efced7a0-4b38-4934-8bc3-afec9de786ea', 3, 'Infinite');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('efced7a0-4b38-4934-8bc3-afec9de786ea', '2f6260e5-d4e1-4a45-b5a0-20cad7ff7772', 'At resonance in a series RLC circuit, the inductive and capacitive reactances cancel exactly (XL = XC), leaving the total impedance at its minimum value, purely resistive (equal to R).', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('38dd13da-c6fa-40e9-84a2-78856fd4e8f9', '5e47b501-7176-42f8-8137-c5acc30759bc', 153, 'The Q-factor of a series resonant RLC circuit is a measure of:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('635d6447-8537-4fdf-b0d0-d3ebd4662ac6', '38dd13da-c6fa-40e9-84a2-78856fd4e8f9', 0, 'The circuit''s power consumption only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc0f309a-4638-448a-8530-bd8a46d2c8a4', '38dd13da-c6fa-40e9-84a2-78856fd4e8f9', 1, 'The sharpness of the resonance peak — the ratio of energy stored to energy dissipated per cycle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15a67c0a-c977-48e9-8099-c3beee4245e2', '38dd13da-c6fa-40e9-84a2-78856fd4e8f9', 2, 'The circuit''s resistance value alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2200aa15-e60b-41c1-abb8-4ef3881aff9f', '38dd13da-c6fa-40e9-84a2-78856fd4e8f9', 3, 'The number of components in the circuit');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('38dd13da-c6fa-40e9-84a2-78856fd4e8f9', 'cc0f309a-4638-448a-8530-bd8a46d2c8a4', 'The Q-factor represents the sharpness of a resonant circuit''s response (the ratio of reactive energy stored to resistive energy dissipated per cycle) — a higher Q indicates a narrower, sharper resonance peak, and lower energy loss relative to energy stored.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d666eede-9339-4108-b910-f864390beab7', '5e47b501-7176-42f8-8137-c5acc30759bc', 154, 'Norton''s theorem represents a linear network, as seen from its terminals, as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5561dd4-747d-40b4-bcc2-50b6264ba5f7', 'd666eede-9339-4108-b910-f864390beab7', 0, 'A voltage source in series with a resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7243bcd9-b7cf-4112-8fa3-5dc16c294bf9', 'd666eede-9339-4108-b910-f864390beab7', 1, 'A current source in parallel with a resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3aaac279-2f8a-4278-bd40-79217b65fa41', 'd666eede-9339-4108-b910-f864390beab7', 2, 'Two resistors in series');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f966896-6ff7-4734-96d0-2370d3d7df46', 'd666eede-9339-4108-b910-f864390beab7', 3, 'A pure inductor only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d666eede-9339-4108-b910-f864390beab7', '7243bcd9-b7cf-4112-8fa3-5dc16c294bf9', 'Norton''s theorem is the current-source dual of Thevenin''s theorem, representing a linear network as a single current source (Norton current) in parallel with a resistance (Norton resistance, numerically equal to the Thevenin resistance).', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6690f71c-2fdc-4338-86cd-ea2f69efe94a', '5e47b501-7176-42f8-8137-c5acc30759bc', 155, 'The time constant of an RC circuit, in seconds, is calculated as:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e116ec4-e8c8-44b0-917e-7988a2541072', '6690f71c-2fdc-4338-86cd-ea2f69efe94a', 0, 'R × C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0d8dccb-4a90-4b6d-9d27-c03dc7603e9f', '6690f71c-2fdc-4338-86cd-ea2f69efe94a', 1, 'R / C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e120b7d-996a-45e2-83ef-e3252360b672', '6690f71c-2fdc-4338-86cd-ea2f69efe94a', 2, 'C / R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e1f9690-1b62-405d-9733-71b6dfe71e30', '6690f71c-2fdc-4338-86cd-ea2f69efe94a', 3, '1 / (R × C)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6690f71c-2fdc-4338-86cd-ea2f69efe94a', '1e116ec4-e8c8-44b0-917e-7988a2541072', 'The time constant (τ) of an RC circuit is simply the product of resistance and capacitance (τ = RC) — representing the time for the capacitor voltage to reach approximately 63.2% of its final value during a charging transient.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('731fcd9c-d3f8-406c-9400-bf536546edf5', '5e47b501-7176-42f8-8137-c5acc30759bc', 156, 'In an AC circuit, the power factor is defined as the cosine of the angle between:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b48876b-37c3-454f-833a-80346581996d', '731fcd9c-d3f8-406c-9400-bf536546edf5', 0, 'Two currents in the circuit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d3df2ae-7184-4c90-bed1-236dd8da9432', '731fcd9c-d3f8-406c-9400-bf536546edf5', 1, 'The voltage and current phasors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3697b720-448f-40a0-9869-2cdac555619c', '731fcd9c-d3f8-406c-9400-bf536546edf5', 2, 'Resistance and reactance values directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('225f1bea-5a1f-47c7-b808-6ee92ec0ac4d', '731fcd9c-d3f8-406c-9400-bf536546edf5', 3, 'Two different frequencies');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('731fcd9c-d3f8-406c-9400-bf536546edf5', '6d3df2ae-7184-4c90-bed1-236dd8da9432', 'Power factor (cos φ) is defined as the cosine of the phase angle between the voltage and current phasors in an AC circuit — a power factor of 1 (unity) indicates voltage and current are perfectly in phase (purely resistive load), while a lower power factor indicates a greater phase difference (more reactive load).', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('574ba5a1-865b-41c5-9f33-1cb0d6cb635c', '5e47b501-7176-42f8-8137-c5acc30759bc', 157, 'A two-port network''s ''ABCD parameters'' relate:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c028421-2f31-478e-871b-10f9c745543e', '574ba5a1-865b-41c5-9f33-1cb0d6cb635c', 0, 'Input power to output power directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd270407-04bd-4cb8-8766-822cb62cc6d1', '574ba5a1-865b-41c5-9f33-1cb0d6cb635c', 1, 'Sending-end voltage and current to receiving-end voltage and current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbb1d748-7d68-44f0-8c4d-f104e591f82c', '574ba5a1-865b-41c5-9f33-1cb0d6cb635c', 2, 'Only the network''s resistance values');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2b96d8a-7e3f-46c7-af80-8863309bfef3', '574ba5a1-865b-41c5-9f33-1cb0d6cb635c', 3, 'Frequency to phase shift only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('574ba5a1-865b-41c5-9f33-1cb0d6cb635c', 'cd270407-04bd-4cb8-8766-822cb62cc6d1', 'ABCD (transmission) parameters express a two-port network''s input (sending-end) voltage and current as linear functions of its output (receiving-end) voltage and current — a standard analytical framework for cascaded two-port networks, including transmission lines and filter sections.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4bc82905-924b-4fff-b831-625298d793ea', '5e47b501-7176-42f8-8137-c5acc30759bc', 158, 'Millman''s theorem is used to determine:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2110398b-08ed-46ea-829f-b2395683e309', '4bc82905-924b-4fff-b831-625298d793ea', 0, 'The total resistance of a series circuit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b95a9d1-876d-472a-a067-6455c8ae21f1', '4bc82905-924b-4fff-b831-625298d793ea', 1, 'The common voltage across multiple parallel branches, each with its own voltage source and series impedance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ffe03717-4f6e-49f1-8296-633f2146e7c2', '4bc82905-924b-4fff-b831-625298d793ea', 2, 'A circuit''s resonant frequency directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70658024-381c-4792-80d5-747d9ff72e2d', '4bc82905-924b-4fff-b831-625298d793ea', 3, 'A transistor''s current gain');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4bc82905-924b-4fff-b831-625298d793ea', '5b95a9d1-876d-472a-a067-6455c8ae21f1', 'Millman''s theorem provides a simplified formula to find the common node voltage across two or more parallel branches, each containing its own voltage source and series impedance, avoiding the need for full nodal or mesh analysis for this specific configuration.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1c673895-88bd-492b-b538-530503f98585', '5e47b501-7176-42f8-8137-c5acc30759bc', 159, 'In a purely inductive AC circuit, current:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ccc91a20-4af5-445a-9c9c-67f4f949a3bd', '1c673895-88bd-492b-b538-530503f98585', 0, 'Leads voltage by 90°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2d67223-a141-4abd-a22b-8578e2ff8164', '1c673895-88bd-492b-b538-530503f98585', 1, 'Lags voltage by 90°');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fdf469be-5a23-4a91-a451-7c7d732b1ac2', '1c673895-88bd-492b-b538-530503f98585', 2, 'Is in phase with voltage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc7f6117-6770-42fb-b8f3-fdfb80f13cab', '1c673895-88bd-492b-b538-530503f98585', 3, 'Lags voltage by 180°');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1c673895-88bd-492b-b538-530503f98585', 'f2d67223-a141-4abd-a22b-8578e2ff8164', 'In a purely inductive circuit, current lags voltage by 90° — commonly remembered via the mnemonic ''ELI'' (in an inductor L, voltage E leads current I).', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2b180b3a-f497-470b-9178-b499e5832b4f', '5e47b501-7176-42f8-8137-c5acc30759bc', 160, 'The ''reciprocity theorem'' in network analysis states that:');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b19d5bd9-750b-4de7-a744-6fbb789625c0', '2b180b3a-f497-470b-9178-b499e5832b4f', 0, 'A network''s response is independent of the applied source entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0f979e0-229e-4dd5-8dc4-ad1b42615bea', '2b180b3a-f497-470b-9178-b499e5832b4f', 1, 'In a linear, bilateral, single-source network, the ratio of response to excitation remains the same even if the positions of the source and the response measurement point are interchanged');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04fb25eb-2dda-4917-be8d-c058fd08f046', '2b180b3a-f497-470b-9178-b499e5832b4f', 2, 'Power is always conserved in a network, regardless of any other conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8b21cba-3b0e-4e87-9dd2-4f40ee61c2d8', '2b180b3a-f497-470b-9178-b499e5832b4f', 3, 'Only resistive networks obey any form of reciprocity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2b180b3a-f497-470b-9178-b499e5832b4f', 'a0f979e0-229e-4dd5-8dc4-ad1b42615bea', 'The Reciprocity theorem states that, for a linear, bilateral network with a single independent source, interchanging the positions of the excitation source and the response measurement point (an ammeter or voltmeter) leaves the ratio of response to excitation unchanged — a useful property in certain circuit analysis and antenna theory applications.', 'Discipline (Electronics & Communication) — technical difficulty based on GATE-pattern questions, not an official HAL paper.');
