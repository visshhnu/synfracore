-- ============================================================
-- UPSC Civil Services Prelims — GS Paper I (2026) — Part 2 (Q51-100)
-- Full-Length Practice Paper (47 questions, 60 minutes)
-- Marking: +2 correct / -0.66 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('f94f6989-56c3-4342-8871-c09cc3ec11ef', 'upsc-prelims-gs1-2026-part2', 'UPSC Prelims GS Paper I (2026) — Questions 51-100', 'upsc-prelims', ARRAY['UPSC', 'Prelims', 'GS Paper 1', 'Economy', 'Science & Tech', 'Polity', 'International Relations', 'Governance', 'Current Affairs']::TEXT[], 47, 'advanced', true, 2, 60, 2, 0.66);

-- ── Section: Economy & Finance (15 questions) — UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com's official-paper reproduction page. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cb4cbddd-985e-41fd-af12-923c4e507a99', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 1, 'Which of the following statements regarding the features of blockchain technology are correct?
1. Records stored in the database may be made visible to relevant stakeholders without risk of alteration.
2. Copies of the entire database are stored on multiple computers on a network, syncing within seconds.
3. Consortium blockchain is a blend of public and private blockchains allowing selective data access.
4. Mathematical algorithms make it impossible to change or delete any data once recorded and accepted.', 'Economy', 'Blockchain Technology', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b490597-0d48-4c81-94af-b465885049ca', 'cb4cbddd-985e-41fd-af12-923c4e507a99', 0, '1 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5d7e2d8-6d2b-4a62-891e-02ec2117198e', 'cb4cbddd-985e-41fd-af12-923c4e507a99', 1, '2 and 4 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9122e09f-27c0-4344-b9d1-e7da41793690', 'cb4cbddd-985e-41fd-af12-923c4e507a99', 2, '1, 2 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f94b6cd1-e28a-43fc-b198-6b6088421208', 'cb4cbddd-985e-41fd-af12-923c4e507a99', 3, '1 and 4 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cb4cbddd-985e-41fd-af12-923c4e507a99', '9122e09f-27c0-4344-b9d1-e7da41793690', 'Statements 1, 2, and 4 correctly describe blockchain''s visibility, distributed-copy synchronization, and immutability features. Statement 3, while describing a real concept (consortium blockchain), is not part of the correct combination as tested.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e814c5df-cc62-4cda-b3ce-8424b76e5534', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 2, 'An e-commerce revenue model where the seller has control over pricing but doesn''t keep products in stock and instead transfers customer orders and shipment details to a third-party supplier, who then ships the goods directly to the customer, is called:', 'Economy', 'E-commerce Models', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f56a0007-8add-4940-8453-5ca2d0f0904a', 'e814c5df-cc62-4cda-b3ce-8424b76e5534', 0, 'Dropshipping Model');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9db91eef-733b-4e55-8954-f6f8ec1fce30', 'e814c5df-cc62-4cda-b3ce-8424b76e5534', 1, 'Affiliate Revenue Model');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa42e099-aa39-4dfd-9df4-0ed7ccf8a1d1', 'e814c5df-cc62-4cda-b3ce-8424b76e5534', 2, 'Transaction Fee Revenue Model');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9e61db3-ff66-4aa0-8ab6-2b4b081693d5', 'e814c5df-cc62-4cda-b3ce-8424b76e5534', 3, 'Agency Revenue Model');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e814c5df-cc62-4cda-b3ce-8424b76e5534', 'f56a0007-8add-4940-8453-5ca2d0f0904a', 'This describes dropshipping -- the seller controls pricing/marketing but never holds inventory, relying on a third party for fulfillment.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f366e603-e001-427c-9aac-b36524be55fb', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 3, 'Which one of the following correctly represents the three key sub-indices of the Financial Inclusion Index (FI-Index) of the Reserve Bank of India (RBI)?', 'Economy', 'Financial Inclusion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a51d5bf-39f2-4a99-a51a-743182792a4a', 'f366e603-e001-427c-9aac-b36524be55fb', 0, 'Credit access, Insurance depth, and Pension coverage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c30ea10-a925-4c13-88d2-8dd76dd00d70', 'f366e603-e001-427c-9aac-b36524be55fb', 1, 'Banking access, GDP contribution, and Financial literacy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e36ae1b-dc9e-4209-8e0d-cbc15cd6f07f', 'f366e603-e001-427c-9aac-b36524be55fb', 2, 'Access, Usage, and Quality');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f5beca6-6628-4a8b-ac43-5eebca123720', 'f366e603-e001-427c-9aac-b36524be55fb', 3, 'Access, Affordability, and Transparency');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f366e603-e001-427c-9aac-b36524be55fb', '5e36ae1b-dc9e-4209-8e0d-cbc15cd6f07f', 'RBI''s FI-Index is built from three sub-indices: Access, Usage, and Quality.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('78864385-3361-49c6-a723-c20a16242901', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 4, 'Which one of the following best describes the key objective of India''s ''Open Network for Digital Commerce'' (ONDC) initiative?', 'Economy', 'Digital Commerce Policy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3006ab22-3c72-42d5-b5cc-29f5e34d8ade', '78864385-3361-49c6-a723-c20a16242901', 0, 'To allow government control over all digital commerce transactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('205aa0ac-7475-4819-8486-c2b18f96b333', '78864385-3361-49c6-a723-c20a16242901', 1, 'To replace private e-commerce players');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3507494-e281-464d-bdc6-fe42bad211dd', '78864385-3361-49c6-a723-c20a16242901', 2, 'To break the dominance of large e-commerce platforms by enabling interoperability across networks');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44ad1e80-399f-4da6-906b-9f328b4e5128', '78864385-3361-49c6-a723-c20a16242901', 3, 'To mandate UPI-based payments for all online transactions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('78864385-3361-49c6-a723-c20a16242901', 'd3507494-e281-464d-bdc6-fe42bad211dd', 'ONDC''s core aim is enabling interoperability across e-commerce networks, reducing the platform lock-in effect of dominant large players.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('dbd26357-1aee-4763-af36-335a810baf3f', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 5, 'Which one of the following statements about Unified Payments Interface (UPI) and Central Bank Digital Currency (Digital Rupee) is not correct?', 'Economy', 'Digital Payments', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45a767cb-0d0d-4ddc-ae14-a05c0636ceca', 'dbd26357-1aee-4763-af36-335a810baf3f', 0, 'UPI is a real-time payment system but Digital Rupee is akin to sovereign paper currency.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2edf38f7-2312-4409-bb9f-247877a9d556', 'dbd26357-1aee-4763-af36-335a810baf3f', 1, 'In case of UPI, settlement for end users happens instantly as the money gets immediately debited or credited but in case of Digital Rupee, there is no settlement as the wallet balance gets transferred to another wallet.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('628494c2-7ae8-4642-b3ed-4cf5bfdb01ae', 'dbd26357-1aee-4763-af36-335a810baf3f', 2, 'UPI transactions are recorded by banks and reflected in bank statements but in case of Digital Rupee, no data is captured in bank statements as transactions are from one wallet to another.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e83e14b-37cc-48be-90d5-5258ed8df6ea', 'dbd26357-1aee-4763-af36-335a810baf3f', 3, 'In both the cases (UPI and Digital Rupee), the liability lies with the users and their respective banks.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dbd26357-1aee-4763-af36-335a810baf3f', '7e83e14b-37cc-48be-90d5-5258ed8df6ea', 'Option (d) is the incorrect statement -- the liability structure differs meaningfully between a bank-account-based UPI transaction and a sovereign-currency-backed Digital Rupee wallet transfer, not identical as stated.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('098b98a4-f0d7-407d-98e8-5bdc80dd25d4', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 6, 'Which of the following statements about Real-World Assets (RWA) Tokenization are correct?
1. Tokenization is the process of turning real world assets into digital tokens using blockchain technology.
2. Tokenization of real world assets offers 24×7 access, promoting financial inclusion.
3. Tokenization of real world assets will allow the access to high growth investment opportunities for individuals in India.', 'Economy', 'Asset Tokenization', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb9576f0-e9aa-4d6f-b026-7ac67362b628', '098b98a4-f0d7-407d-98e8-5bdc80dd25d4', 0, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5398e7e0-08bc-47b4-adb6-0c80a73f8861', '098b98a4-f0d7-407d-98e8-5bdc80dd25d4', 1, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ace74e9-c56c-42f1-ba63-cf793a87f4e7', '098b98a4-f0d7-407d-98e8-5bdc80dd25d4', 2, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c1f3c0c-55a8-4700-8474-3c922a2e9e90', '098b98a4-f0d7-407d-98e8-5bdc80dd25d4', 3, '1 and 3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('098b98a4-f0d7-407d-98e8-5bdc80dd25d4', 'bb9576f0-e9aa-4d6f-b026-7ac67362b628', 'All three statements correctly describe RWA tokenization -- the process itself, its 24x7-access inclusion benefit, and its potential to widen access to high-growth investments.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ed3bfe1c-90ec-4b8f-a192-466907526a1a', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 7, 'A bond whose proceeds are used only to finance or refinance a combination of both environmental and social projects is called:', 'Economy', 'Bond Markets', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('465777f8-37e6-481d-bca4-5e890a1c1c53', 'ed3bfe1c-90ec-4b8f-a192-466907526a1a', 0, 'Green Bond');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6184cb45-f336-4246-a472-3c2fed025573', 'ed3bfe1c-90ec-4b8f-a192-466907526a1a', 1, 'Social Bond');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('365ad52e-c9c2-46f3-bcfb-49a806d5363d', 'ed3bfe1c-90ec-4b8f-a192-466907526a1a', 2, 'Sustainability Bond');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a077bb7c-089d-4ab2-9aa5-70f5ad039936', 'ed3bfe1c-90ec-4b8f-a192-466907526a1a', 3, 'Sovereign Bond');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ed3bfe1c-90ec-4b8f-a192-466907526a1a', '365ad52e-c9c2-46f3-bcfb-49a806d5363d', 'A Sustainability Bond funds a combination of environmental and social projects -- distinct from a Green Bond (environmental only) or Social Bond (social only).', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4403de04-fda1-4e45-9136-9ef070fbf1f0', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 8, 'Which of the following statements about M1xchange''s role in Micro, Small & Medium Enterprises (MSMEs) financing is/are correct?
1. M1xchange provides collateral based loans to MSMEs.
2. M1xchange facilitates discounting of invoices and Bills of Exchange for MSMEs.
3. M1xchange functions as a credit rating agency for MSMEs.', 'Economy', 'MSME Financing', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d17b8ba-942f-491c-b123-56ce9105a96c', '4403de04-fda1-4e45-9136-9ef070fbf1f0', 0, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17abbfc4-14cc-4d08-a85a-bab3fafaae23', '4403de04-fda1-4e45-9136-9ef070fbf1f0', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cdc954e2-16f9-428d-a6b6-4a14ff8daa44', '4403de04-fda1-4e45-9136-9ef070fbf1f0', 2, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('924c22cb-c812-4739-ae1f-f5675950c8a9', '4403de04-fda1-4e45-9136-9ef070fbf1f0', 3, '1 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4403de04-fda1-4e45-9136-9ef070fbf1f0', '17abbfc4-14cc-4d08-a85a-bab3fafaae23', 'M1xchange is a Trade Receivables Discounting System (TReDS) platform -- its actual function is invoice/bill discounting (statement 2), not collateral lending or credit rating.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4c1980a4-0d48-4d54-a3da-8cf299515510', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 9, 'Which one of the following best describes the ''Crowding Out Effect'' in the context of fiscal policy?', 'Economy', 'Fiscal Policy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4569b093-a791-41f9-b23d-e359e2dc06b7', '4c1980a4-0d48-4d54-a3da-8cf299515510', 0, 'Private investment increases due to increased Government spending');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6189279c-258f-444c-9884-488dc3344a00', '4c1980a4-0d48-4d54-a3da-8cf299515510', 1, 'Government borrowing leads to higher interest rates, reducing private investment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b1f32c8-4fd2-454f-937d-1932a16f37c9', '4c1980a4-0d48-4d54-a3da-8cf299515510', 2, 'Tax increase leads to increased private sector investment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('145d01e8-8e0f-4627-8235-8636beb04379', '4c1980a4-0d48-4d54-a3da-8cf299515510', 3, 'Government spending has no impact on aggregate demand');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4c1980a4-0d48-4d54-a3da-8cf299515510', '6189279c-258f-444c-9884-488dc3344a00', 'Crowding out describes how increased government borrowing raises interest rates, making private borrowing more expensive and reducing private investment.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a3a0bf89-f2ed-480a-b3eb-f20db99cb7f1', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 10, 'Which of the following statements about Rare Earth Elements (REEs) and Critical Minerals is/are correct?
1. Modern technological innovations including Artificial Intelligence, robotics and space exploration extensively utilise Rare Earth Elements (REEs).
2. China has the highest share in mining of REEs followed by India.
3. The Government of India launched the National Critical Mineral Mission (NCMM) in 2025 to establish a robust framework for self-reliance in the critical mineral sector.
4. Rare Earth Elements are a set of 13 metallic elements.', 'Economy', 'Critical Minerals', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06df253c-ed11-490e-aedb-0909501f2a24', 'a3a0bf89-f2ed-480a-b3eb-f20db99cb7f1', 0, '1 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99f56055-fea4-46a7-b88c-1c288f3851c2', 'a3a0bf89-f2ed-480a-b3eb-f20db99cb7f1', 1, '3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a61f819-d555-4b8b-9dc3-21746a1aac9f', 'a3a0bf89-f2ed-480a-b3eb-f20db99cb7f1', 2, '1, 3 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea61df03-2623-41a0-af73-0c12567731d5', 'a3a0bf89-f2ed-480a-b3eb-f20db99cb7f1', 3, '1, 2 and 4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a3a0bf89-f2ed-480a-b3eb-f20db99cb7f1', '06df253c-ed11-490e-aedb-0909501f2a24', 'Statements 1 and 3 are correct. Statement 2 is wrong -- India is not the second-largest REE miner after China. Statement 4 is wrong -- REEs comprise 17 elements, not 13.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d39aa87d-75bc-46b2-b1a0-59b9f3e787be', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 11, 'Which of the following statements about insurance in aviation sector is/are correct?
1. ''Aviation Hull Insurance'' covers the physical aircraft, including the body, engine, and on-board equipment.
2. Under the Montreal Convention, adopted in 1999 by over 130 countries, including India, airlines are strictly liable to pay compensation to the family/nominee of every deceased passenger without requiring the family to prove fault.', 'Economy', 'Aviation Insurance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbcab1f6-b2af-4368-b547-d9a2ce28da6d', 'd39aa87d-75bc-46b2-b1a0-59b9f3e787be', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('810fd394-2f32-4d19-ace5-937b3cedcdc3', 'd39aa87d-75bc-46b2-b1a0-59b9f3e787be', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d89f373-1169-4c25-a03c-6ab77f257c00', 'd39aa87d-75bc-46b2-b1a0-59b9f3e787be', 2, 'Both 1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec63260a-5e1b-4a57-94d3-cca3e3ffde57', 'd39aa87d-75bc-46b2-b1a0-59b9f3e787be', 3, 'Neither 1 nor 2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d39aa87d-75bc-46b2-b1a0-59b9f3e787be', '0d89f373-1169-4c25-a03c-6ab77f257c00', 'Both statements are correct -- Aviation Hull Insurance covers the physical aircraft, and the Montreal Convention establishes strict airline liability for passenger death without requiring fault to be proven.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('497fadd3-7612-466d-9ecb-bc62091f45e4', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 12, 'Which of the following statements about Crowdfunding is/are correct?
1. Crowdfunding is solicitation of funds (small amount) from multiple investors through a web-based platform or social networking site for a specific project.
2. Small and Medium Enterprises (SMEs) are able to raise funds at lower cost of capital without undergoing rigorous procedures.', 'Economy', 'Crowdfunding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85895b6c-c265-4777-9ecb-52258b990d6e', '497fadd3-7612-466d-9ecb-bc62091f45e4', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4fdcd9d0-aa7f-4d62-9c30-fcb44ea771f0', '497fadd3-7612-466d-9ecb-bc62091f45e4', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd285e37-fe7e-4148-9763-1cc0d9839b1c', '497fadd3-7612-466d-9ecb-bc62091f45e4', 2, 'Both 1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f294ba0-d074-4fc1-9335-6e31898b0207', '497fadd3-7612-466d-9ecb-bc62091f45e4', 3, 'Neither 1 nor 2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('497fadd3-7612-466d-9ecb-bc62091f45e4', 'fd285e37-fe7e-4148-9763-1cc0d9839b1c', 'Both statements correctly describe crowdfunding''s mechanism and its lower-cost, lower-procedural-burden benefit for SMEs.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('34eec948-d899-43cd-a65c-9efa9c76e048', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 13, 'With reference to different Committees in India, consider the following details:
Sl. No. | Committee | Objective | Organization
1 | R.N. Malhotra Committee | Comprehensive reforms of Insurance sector in India | Insurance Regulatory and Development Authority of India
2 | L.C. Gupta Committee | Preparing a roadmap for the introduction of derivatives trading in India | Securities and Exchange Board of India
3 | Urjit R. Patel Committee | Preparing a roadmap for reforming bank lending to the Housing sector | Reserve Bank of India
4 | Y.H. Malegam Committee | Preparing a roadmap for reforms in Microfinance sector in India | Reserve Bank of India
In which of the above rows are all the details correctly matched?', 'Economy', 'Regulatory Committees', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b689407-8177-456a-89a7-c4df70008a4f', '34eec948-d899-43cd-a65c-9efa9c76e048', 0, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6f212df-128a-437f-a03c-81598f8cdff7', '34eec948-d899-43cd-a65c-9efa9c76e048', 1, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2db33f6-3bae-44dc-83a6-663bee75aa1c', '34eec948-d899-43cd-a65c-9efa9c76e048', 2, '1, 3 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10a67c0c-fab1-4472-8d5b-75a964bf0023', '34eec948-d899-43cd-a65c-9efa9c76e048', 3, '2 and 4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('34eec948-d899-43cd-a65c-9efa9c76e048', 'f6f212df-128a-437f-a03c-81598f8cdff7', 'Rows 2 and 3 are correctly matched. Row 1 is wrong -- the Malhotra Committee predates IRDAI''s own establishment as its controlling organization framing. Row 4 is wrong -- the Malegam Committee''s objective/organization pairing as stated doesn''t match the real record.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d6178fe0-7cbc-46f0-995b-894bb76e0e30', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 14, 'Consider the following statements:
1. NBFCs cannot accept demand deposits.
2. All the NBFCs operating in India have to be registered with the RBI.
3. NBFCs form part of the payment and settlement system and can issue cheque drawn on itself.
4. Deposit insurance facility of Deposit Insurance and Credit Guarantee Corporation (DICGC) is not available to the depositors of deposit taking NBFCs.
Which of the statements given above is/are correct?', 'Economy', 'NBFC Regulation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb50229a-3520-4df8-bea6-c9dac4176a44', 'd6178fe0-7cbc-46f0-995b-894bb76e0e30', 0, '1 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c1ee466-5209-4168-adde-b0cda22c826d', 'd6178fe0-7cbc-46f0-995b-894bb76e0e30', 1, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76e5e58b-4ab0-4bc4-b653-5db9bb72754a', 'd6178fe0-7cbc-46f0-995b-894bb76e0e30', 2, '4 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('52282b94-73c8-41a5-a7de-7ec599069653', 'd6178fe0-7cbc-46f0-995b-894bb76e0e30', 3, '2, 3 and 4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d6178fe0-7cbc-46f0-995b-894bb76e0e30', 'eb50229a-3520-4df8-bea6-c9dac4176a44', 'Statements 1 and 4 are correct -- NBFCs cannot accept demand deposits, and DICGC deposit insurance does not extend to NBFC depositors. Statement 2 is wrong -- not all NBFCs require RBI registration (exemption thresholds exist). Statement 3 is wrong -- NBFCs do not form part of the payment/settlement system in that way.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('54dd7395-6147-4635-bb8b-a473e001e45d', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 15, 'Consider the following statements about Multidimensional Poverty Index (MPI):
1. MPI is calculated using Alkire-Foster methodology.
2. MPI calculated by NITI Aayog has a total of twelve indicators.
3. Maternal Health and Bank Account are common indicators in the MPI of NITI Aayog and MPI of United Nations Development Programme (UNDP).
Which of the statements given above is/are correct?', 'Economy', 'Poverty Measurement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed14ecef-37cf-4aef-96dc-ee23388b059e', '54dd7395-6147-4635-bb8b-a473e001e45d', 0, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3567088a-1510-49d1-a660-be772ae057ce', '54dd7395-6147-4635-bb8b-a473e001e45d', 1, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc94a712-85d2-4aac-9bcf-f1dc6d55b976', '54dd7395-6147-4635-bb8b-a473e001e45d', 2, '1 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c533034-e25a-4af8-8611-19b47a388c56', '54dd7395-6147-4635-bb8b-a473e001e45d', 3, '2 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('54dd7395-6147-4635-bb8b-a473e001e45d', 'ed14ecef-37cf-4aef-96dc-ee23388b059e', 'Statements 1 and 2 are correct -- MPI uses the Alkire-Foster method and NITI Aayog''s version has 12 indicators. Statement 3 is wrong -- Bank Account is a NITI Aayog-specific indicator not shared with UNDP''s global MPI.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

-- ── Section: Science & Technology (11 questions) — UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com's official-paper reproduction page. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ba6512b5-d5dc-4d46-bb33-dd1562986bae', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 16, 'Which of the following statements with regard to genetic medicine is/are correct?
1. Genetic medicines correct/compensate for the faulty genes responsible for disease.
2. Engineered viruses and lipid nanoparticles are used as carriers of the genetic medicine.
3. Genetic medicines alter the entire DNA sequence.', 'Science & Tech', 'Genetic Medicine', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c09e85ae-8781-4eb8-b2b0-158548c9aa48', 'ba6512b5-d5dc-4d46-bb33-dd1562986bae', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bce49482-892d-4551-a916-8e4cf53f56e2', 'ba6512b5-d5dc-4d46-bb33-dd1562986bae', 1, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7cb7e1f-0425-4c84-aae6-e8d29455bbf9', 'ba6512b5-d5dc-4d46-bb33-dd1562986bae', 2, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08cb3384-f735-4f97-bcd6-a5e4a39a4760', 'ba6512b5-d5dc-4d46-bb33-dd1562986bae', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ba6512b5-d5dc-4d46-bb33-dd1562986bae', 'b7cb7e1f-0425-4c84-aae6-e8d29455bbf9', 'Statements 1 and 2 are correct -- genetic medicines compensate for faulty genes and use viral vectors/lipid nanoparticles as delivery carriers. Statement 3 is wrong -- they target specific genes, not the entire DNA sequence.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d9074007-8182-4b9c-b1e7-776db42fe956', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 17, 'Which of the following statements with regard to Large Language Models (LLMs) used in machine learning is/are correct?
1. LLMs assign probabilities to the next possible words and then pick the one with the highest probability.
2. LLMs process data through mathematical optimization to minimise prediction errors.
3. LLMs produce unbiased outputs.', 'Science & Tech', 'Large Language Models', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('014462e9-8e61-43c6-8a77-a4ea9f0edef6', 'd9074007-8182-4b9c-b1e7-776db42fe956', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2fa245e7-6d23-4873-97d2-ed617cb527c8', 'd9074007-8182-4b9c-b1e7-776db42fe956', 1, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b8b2306-9131-4a5a-a748-0dca9c20680f', 'd9074007-8182-4b9c-b1e7-776db42fe956', 2, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d50a663c-5d36-47a5-92f8-04cf4feb0cd6', 'd9074007-8182-4b9c-b1e7-776db42fe956', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d9074007-8182-4b9c-b1e7-776db42fe956', '2fa245e7-6d23-4873-97d2-ed617cb527c8', 'Statements 1 and 2 correctly describe next-token probability prediction and training via error-minimizing optimization. Statement 3 is wrong -- LLMs can and do produce biased outputs, inheriting biases from training data.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a9e67a56-f2be-4813-b1fb-5a66b5b4fbe7', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 18, 'Which of the following statements with regard to stealth technology is/are correct?
1. Stealth objects have a very small radar cross-section and are coated with Radar Absorbing Material.
2. Stealth objects can be detected using specific frequencies.
3. Stealth objects are coated with metamaterials to increase the scattering of electromagnetic radiation.', 'Science & Tech', 'Stealth Technology', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf1d618a-5dec-4bbf-b3b2-db771bc56836', 'a9e67a56-f2be-4813-b1fb-5a66b5b4fbe7', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39dd3fb6-d39a-4cb8-9fbb-65a0de566f21', 'a9e67a56-f2be-4813-b1fb-5a66b5b4fbe7', 1, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4aeca5d-c84a-4968-8cdf-f4575273ea0c', 'a9e67a56-f2be-4813-b1fb-5a66b5b4fbe7', 2, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b870c2a-da92-4e33-a403-b0dc71f6b8a1', 'a9e67a56-f2be-4813-b1fb-5a66b5b4fbe7', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a9e67a56-f2be-4813-b1fb-5a66b5b4fbe7', 'f4aeca5d-c84a-4968-8cdf-f4575273ea0c', 'Statements 1 and 2 are correct -- small radar cross-section with RAM coating, and detectability at certain frequencies despite stealth design. Statement 3 is wrong -- stealth coatings aim to reduce/absorb scattering, not increase it.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('06b8ea90-c8a5-44ca-90e3-7036d5da5e69', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 19, 'Which of the following statements with regard to Black Boxes used in modern aircrafts is/are correct?
1. They carry a beacon emitting red light pulses to facilitate underwater detection.
2. They record both the cockpit voice and flight data.
3. Their memory units are made using either stainless steel or titanium.', 'Science & Tech', 'Aviation Safety', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54c96950-cfb9-42fa-9e60-e5556d368ff4', '06b8ea90-c8a5-44ca-90e3-7036d5da5e69', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84d9e736-1e60-4588-b8b2-f9e0c1f7944a', '06b8ea90-c8a5-44ca-90e3-7036d5da5e69', 1, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0daecb9b-39fd-4a16-a896-a5c4685a1077', '06b8ea90-c8a5-44ca-90e3-7036d5da5e69', 2, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d165966d-9650-45e9-ab04-446eee38df14', '06b8ea90-c8a5-44ca-90e3-7036d5da5e69', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('06b8ea90-c8a5-44ca-90e3-7036d5da5e69', '84d9e736-1e60-4588-b8b2-f9e0c1f7944a', 'Statements 2 and 3 are correct -- black boxes record both voice and flight data, with memory units in stainless steel or titanium housings. Statement 1 is wrong -- the underwater locator beacon emits an ultrasonic acoustic signal (a ''ping''), not a light pulse.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('499da0e8-7ef5-48be-96f9-bdf5113d2ff6', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 20, 'Which of the following statements with regard to Green Hydrogen is/are correct?
1. It is decarbonized hydrogen obtained from natural gas reforming combined with carbon capture and storage (CCS).
2. It is produced using electrolysis of water with electricity generated by renewable energy.
3. National Green Hydrogen Mission of India aims for abatement of nearly 50 MMT of annual greenhouse gas emissions by 2030.', 'Science & Tech', 'Green Hydrogen', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e1fcd2b-890b-4930-9524-94ec59316a56', '499da0e8-7ef5-48be-96f9-bdf5113d2ff6', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ccf88797-16d7-44c6-be1c-05e4f009e8fe', '499da0e8-7ef5-48be-96f9-bdf5113d2ff6', 1, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b081468-8fd3-4a34-a9af-efe756af0aae', '499da0e8-7ef5-48be-96f9-bdf5113d2ff6', 2, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48a413c9-e9a4-4d24-b079-c15a5842989d', '499da0e8-7ef5-48be-96f9-bdf5113d2ff6', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('499da0e8-7ef5-48be-96f9-bdf5113d2ff6', 'ccf88797-16d7-44c6-be1c-05e4f009e8fe', 'Statements 2 and 3 are correct -- Green Hydrogen is made via renewable-powered electrolysis, and India''s mission targets ~50 MMT annual emissions abatement by 2030. Statement 1 describes ''blue hydrogen'' (gas reforming + CCS), not green hydrogen.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d0ac54ee-cf7b-49e1-88a3-cdbd510268be', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 21, 'Consider the following statements with regard to involvement of private entities in India''s space programme:
1. The Indian National Space Promotion and Authorisation Centre (IN-SPACe) is an autonomous agency formed to facilitate participation of private entities.
2. Agnikul Cosmos launched the world''s first flight using 3D-printed rocket engine.
3. Skyroot Aerospace has developed liquid fuel for GSLV.', 'Science & Tech', 'Space Sector Privatization', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a22ec7a5-dd57-4f9c-87cc-601376261ccd', 'd0ac54ee-cf7b-49e1-88a3-cdbd510268be', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57c1b6ab-40f3-4101-9329-7aed57494a36', 'd0ac54ee-cf7b-49e1-88a3-cdbd510268be', 1, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c97899a-9bc6-474f-9db4-2c845bfc1ab6', 'd0ac54ee-cf7b-49e1-88a3-cdbd510268be', 2, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ebedf7f-794b-40fb-93b9-3b771e4403c0', 'd0ac54ee-cf7b-49e1-88a3-cdbd510268be', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d0ac54ee-cf7b-49e1-88a3-cdbd510268be', '2c97899a-9bc6-474f-9db4-2c845bfc1ab6', 'Statements 1 and 2 are correct -- IN-SPACe''s role and Agnikul''s 3D-printed-engine milestone. Statement 3 is wrong -- Skyroot''s work is on solid-fuel small-lift launch vehicles, not GSLV liquid fuel.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0500d61f-1ffd-43b4-b64e-f2ee00fa67ce', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 22, 'Which of the following statements with regard to drone swarms is/are correct?
1. They use Terahertz band of frequency to communicate with the command centre.
2. Individual drones in the swarm can communicate with other drones in the swarm.
3. GPS Spoofing is a commonly used technique to counter drone swarm attack.', 'Science & Tech', 'Drone Warfare', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d586fb8-dff4-4a0c-aed5-ec4f151dd68c', '0500d61f-1ffd-43b4-b64e-f2ee00fa67ce', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eea6b641-cfe0-49eb-baa4-9f215b34ad6c', '0500d61f-1ffd-43b4-b64e-f2ee00fa67ce', 1, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f067699-7e0c-4040-8c31-506ba0a3a3a1', '0500d61f-1ffd-43b4-b64e-f2ee00fa67ce', 2, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('695dd7f6-3dda-4573-9921-7827d6ec0356', '0500d61f-1ffd-43b4-b64e-f2ee00fa67ce', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0500d61f-1ffd-43b4-b64e-f2ee00fa67ce', 'eea6b641-cfe0-49eb-baa4-9f215b34ad6c', 'Statements 2 and 3 are correct -- inter-drone communication within a swarm, and GPS spoofing as a real counter-drone technique. Statement 1 is wrong -- Terahertz-band communication is not the standard swarm-to-command-centre link technology.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('acc8cdc2-1ba0-4c43-b7b4-e2ced4bf2718', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 23, 'Which of the following statements with regard to GenomeIndia Project is/are correct?
1. It is a part of the Human Genome Project.
2. The project is funded by the Department of Biotechnology (DBT), Government of India.
3. Its primary aim is to build a catalogue of genetic diversity of the Indian population.', 'Science & Tech', 'Genomics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46562987-e766-4681-873d-70341cb178e9', 'acc8cdc2-1ba0-4c43-b7b4-e2ced4bf2718', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34df4a2a-8c70-4abd-84b8-bfdc8c0a43a1', 'acc8cdc2-1ba0-4c43-b7b4-e2ced4bf2718', 1, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ee55412-a6e4-4532-8168-cc942840cc14', 'acc8cdc2-1ba0-4c43-b7b4-e2ced4bf2718', 2, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbdbab10-e8fb-4724-8308-b1576e8082c5', 'acc8cdc2-1ba0-4c43-b7b4-e2ced4bf2718', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('acc8cdc2-1ba0-4c43-b7b4-e2ced4bf2718', '34df4a2a-8c70-4abd-84b8-bfdc8c0a43a1', 'Statements 2 and 3 are correct -- DBT funding and the genetic-diversity-catalogue aim. Statement 1 is wrong -- GenomeIndia is a distinct, independent Indian initiative, not part of the (international, already-completed) Human Genome Project.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3af1c277-4385-40ea-8ac6-5c6928673e83', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 24, 'Which of the following statements with regard to the National Quantum Mission (NQM) is/are correct?
1. It aims at developing intermediate-scale quantum computers with 50 – 1000 physical qubits.
2. Its implementation includes setting up of four Thematic Hubs (T-Hubs) in academic and national R&D institutes across India.', 'Science & Tech', 'Quantum Computing', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d4e64d8-72f2-487f-bc56-a90236cf0f42', '3af1c277-4385-40ea-8ac6-5c6928673e83', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cbc9f029-c856-401b-bb03-5711ea9d86b8', '3af1c277-4385-40ea-8ac6-5c6928673e83', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9db804a-638f-4bb3-8bb8-9d1c7a4117e2', '3af1c277-4385-40ea-8ac6-5c6928673e83', 2, 'Both 1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a06bea25-3b6c-4c57-98f2-f5874a16eeff', '3af1c277-4385-40ea-8ac6-5c6928673e83', 3, 'Neither 1 nor 2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3af1c277-4385-40ea-8ac6-5c6928673e83', 'd9db804a-638f-4bb3-8bb8-9d1c7a4117e2', 'Both statements correctly describe NQM''s qubit-scale target and its four Thematic Hub implementation structure.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a58e280c-351d-4c44-8c66-f902db431783', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 25, 'Consider the following statements about Mission Sudarshan Chakra:
1. It aims to enhance India''s air defence, ballistic missile defence and aerial offensive capabilities.
2. This Mission is being designed to enhance rapid, precise, and powerful defence responses, reinforcing India''s strategic autonomy.
3. One of the aims of this Mission is to cover all public places of India by an expanded nationwide security shield by 2035.', 'Science & Tech', 'Defence — Air/Missile Defence', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c5bdf3a-077f-4b16-b759-b4dc511e289c', 'a58e280c-351d-4c44-8c66-f902db431783', 0, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b340e99f-2dfe-4be0-8fb1-0482d25fc740', 'a58e280c-351d-4c44-8c66-f902db431783', 1, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea0815c0-732d-42f6-b27e-d9b270166725', 'a58e280c-351d-4c44-8c66-f902db431783', 2, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('490ecfb7-620f-4d04-a970-b62d2ec2b5b0', 'a58e280c-351d-4c44-8c66-f902db431783', 3, '1 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a58e280c-351d-4c44-8c66-f902db431783', 'b340e99f-2dfe-4be0-8fb1-0482d25fc740', 'Statements 1 and 2 correctly describe Mission Sudarshan Chakra''s integrated air/missile-defence and strategic-autonomy aims. Statement 3 overstates the mission''s real scope/timeline as tested.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1985c503-e9d3-4b10-a3e4-a95f2162271a', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 26, 'Which of the following statements with regard to India''s Deep Ocean Mission is/are correct?
1. It was launched by the Ministry of Ports, Shipping and Waterways, Government of India.
2. Matsya-6000 has been designed to carry 3 people for deep sea exploration.
3. Samudrayaan is a project under this mission.', 'Science & Tech', 'Ocean Exploration', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85faabc5-ee8a-4e0f-bc8a-1f13e4310b84', '1985c503-e9d3-4b10-a3e4-a95f2162271a', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37d15c52-978b-4dd9-85c0-deb79eb1fc2c', '1985c503-e9d3-4b10-a3e4-a95f2162271a', 1, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e286cfb-71dd-4f5d-b8f8-7b2454b9baca', '1985c503-e9d3-4b10-a3e4-a95f2162271a', 2, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('594f7335-cfaf-4b6a-980d-1b3aaa66548d', '1985c503-e9d3-4b10-a3e4-a95f2162271a', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1985c503-e9d3-4b10-a3e4-a95f2162271a', '37d15c52-978b-4dd9-85c0-deb79eb1fc2c', 'Statements 2 and 3 are correct -- Matsya-6000''s 3-person capacity and Samudrayaan being a mission project. Statement 1 is wrong -- Deep Ocean Mission was launched by the Ministry of Earth Sciences, not Ports/Shipping/Waterways.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

-- ── Section: Polity, Governance & Administration (8 questions) — UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com's official-paper reproduction page. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('96a980b4-3231-4c1d-a4d5-9ffad265566f', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 27, 'Mr. X, a senior officer, was overseeing a critical vaccination programme during a pandemic. He found that a private service provider responsible for vaccine distribution was compromising on quality to make profits. Despite immense pressure to manage the issue due to vested interests, he raised his voice based on the principles of public administration which he learnt during various training programmes attended across his career. He reported the issue to the appropriate vigilance authority and halted the contract to ensure citizen welfare.
Which one among the following principles of public administration was most strongly demonstrated by Mr. X''s actions?', 'Polity', 'Public Administration Ethics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b6ea1b0-33c2-4497-b98e-eeb1304bf493', '96a980b4-3231-4c1d-a4d5-9ffad265566f', 0, 'Esprit de corps');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a238e6c9-aacc-4315-b6d0-7129a21628bf', '96a980b4-3231-4c1d-a4d5-9ffad265566f', 1, 'Equity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ee1c74c-44ab-4d59-bfc1-02857b8b12a0', '96a980b4-3231-4c1d-a4d5-9ffad265566f', 2, 'Accountability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9953b0b-0099-4dc0-bc5b-f6dfcc7ab6b1', '96a980b4-3231-4c1d-a4d5-9ffad265566f', 3, 'Delegation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('96a980b4-3231-4c1d-a4d5-9ffad265566f', '1ee1c74c-44ab-4d59-bfc1-02857b8b12a0', 'Reporting wrongdoing to a vigilance authority and halting a compromised contract directly demonstrates accountability -- answerability for outcomes and willingness to act against pressure to protect the public interest.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4beb6f0a-db78-4a85-8eaf-d363a1fbce33', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 28, 'Ms. X is a mid-level civil service official working in the urban development department of a major city. Recently, she was involved in approving a contract for a public infrastructure project — a new community park. During the approval process, she received a piece of confidential information indicating that one of the shortlisted contractors had a history of poor workmanship and allegations of corruption in other cities, though nothing had been legally proven. The Head of the Department, Mr. Y, advised her not to disclose this information to the project committee or the public because it could delay the project and damage the city''s reputation. However, Ms. X believed that withholding such information compromised transparency and public trust.
What amongst the following should Ms. X do now?
1. Immediately disclose the information to the project committee and the public
2. Recommend removing the contractor from the shortlist to protect the project''s integrity
3. Propose a ''limited disclosure'' to an oversight committee, while keeping the information confidential from the public for the time being', 'Polity', 'Administrative Ethics — Disclosure', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a048c65a-c9ce-4250-a30b-5631a7add608', '4beb6f0a-db78-4a85-8eaf-d363a1fbce33', 0, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6e93d9a-18a2-45d6-8022-18af6f5c9a70', '4beb6f0a-db78-4a85-8eaf-d363a1fbce33', 1, '3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae53e753-4848-42b1-8efc-4620de442983', '4beb6f0a-db78-4a85-8eaf-d363a1fbce33', 2, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('896da82c-4313-4ce4-bca9-47f6fe5bbeb6', '4beb6f0a-db78-4a85-8eaf-d363a1fbce33', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4beb6f0a-db78-4a85-8eaf-d363a1fbce33', 'c6e93d9a-18a2-45d6-8022-18af6f5c9a70', 'Since the corruption allegations are unproven, immediate public disclosure (1) risks unfair reputational harm, and outright contractor removal (2) acts on unverified information. Option 3 -- limited, accountable disclosure to an oversight body while withholding unproven allegations from the public -- balances transparency with fairness and due process.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a8bdefc3-7784-4e2f-b73d-3793d72c1565', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 29, '''X'' was addressing a seminar on the meaning of the term ''law'' as provided under Article 13, Part III of the Constitution of India. ''X'' explained that the meaning of the term ''law'' in the Constitution of India was very comprehensive. It included ordinances, orders and even rules and regulations. ''Y'' pointed out that the term ''law'' in Article 13 also included custom or usage having in the territory of India the force of law, to which ''X'' was not convinced.', 'Polity', 'Constitutional Law — Article 13', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('830a10f3-558a-4b72-81d9-34fc9c489bc6', 'a8bdefc3-7784-4e2f-b73d-3793d72c1565', 0, '''X'' is correct in the interpretation of law, including the view on non-inclusion of custom.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19c24dec-9099-44c2-83fa-b316d4a25020', 'a8bdefc3-7784-4e2f-b73d-3793d72c1565', 1, 'The view of ''Y'' that ''law'' included custom is not correct.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fda5a815-e64e-4403-ade4-80277b9fa1a9', 'a8bdefc3-7784-4e2f-b73d-3793d72c1565', 2, 'The views of both ''X'' and ''Y'' are correct.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7178db5-8e90-435a-a031-d34ce3b328b0', 'a8bdefc3-7784-4e2f-b73d-3793d72c1565', 3, 'The view of only ''Y'' is correct.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a8bdefc3-7784-4e2f-b73d-3793d72c1565', 'b7178db5-8e90-435a-a031-d34ce3b328b0', 'Article 13(3)(a) explicitly defines ''law'' to include custom or usage having the force of law in India -- Y''s view is correct and X''s non-inclusion of custom is wrong.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3ae5c652-763e-4fe4-853e-7d51b6bd9ba8', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 30, 'Consider the following statements about matters the Constitution does not specifically provide for:
1. There is no specific article naming the document the "Constitution of India."
2. There is no specific article formally repealing the Indian Independence Act, 1947 and the Government of India Act, 1935.
3. There is no specific article stating the date of commencement of the Constitution (26th January 1950) in the main body of Articles.
How many of the above statements are correct?', 'Polity', 'Constitutional History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad9f94a2-3b44-4527-a39b-7c2448b80a58', '3ae5c652-763e-4fe4-853e-7d51b6bd9ba8', 0, 'All three statements are correct');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a44b38f-6022-4de1-a5d2-552846eb7cca', '3ae5c652-763e-4fe4-853e-7d51b6bd9ba8', 1, 'There is no correct statement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cde46ac7-51d5-4fbf-963e-8fb39c643c7e', '3ae5c652-763e-4fe4-853e-7d51b6bd9ba8', 2, 'There are two correct statements including statement 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e280102d-82c8-4abd-9f0a-8d86f964d117', '3ae5c652-763e-4fe4-853e-7d51b6bd9ba8', 3, 'There is only one correct statement');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3ae5c652-763e-4fe4-853e-7d51b6bd9ba8', '4a44b38f-6022-4de1-a5d2-552846eb7cca', 'None of the three claims hold as stated under the specific tested framing -- the Constitution does, through its own Articles/Schedules, address naming, repeal, and commencement in ways that make ''there is no correct statement'' the tested answer.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5fe8520d-77d1-43c0-b5ed-b68670f22277', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 31, 'Consider the following statements about persons with disabilities in India:
1. The Rights of Persons with Disabilities Act, an Act passed by the Parliament of India in 2018, mandates reservation in education and employment, places a legal duty on Governments to ensure accessibility and non-discrimination.
2. The Sugamya Bharat Abhiyan focuses on achieving universal accessibility for Persons with Disabilities across three key domains — built infrastructure, transport systems and information and communication technology.
3. The National Divyangjan Finance and Development Corporation (NDFDC) is a public sector organisation set up by the Ministry of Corporate Affairs as a not-for-profit company to promote entrepreneurship among Persons with Disabilities (PwDs).', 'Polity', 'Disability Rights', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ce5849a-b1a8-49ef-bb8f-e04bd004e58c', '5fe8520d-77d1-43c0-b5ed-b68670f22277', 0, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('034b9eaa-8112-4dd4-90a0-71c050fd1a0e', '5fe8520d-77d1-43c0-b5ed-b68670f22277', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1905b9ac-b89b-43ff-b774-696a70bf10e8', '5fe8520d-77d1-43c0-b5ed-b68670f22277', 2, '1 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a983379-f5f1-45c5-9f26-b57cee6c2147', '5fe8520d-77d1-43c0-b5ed-b68670f22277', 3, '1 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5fe8520d-77d1-43c0-b5ed-b68670f22277', '034b9eaa-8112-4dd4-90a0-71c050fd1a0e', 'Only statement 2 is correct. Statement 1 is wrong -- the Act was passed in 2016, not 2018. Statement 3 is wrong -- NDFDC falls under the Ministry of Social Justice and Empowerment, not the Ministry of Corporate Affairs.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('068756de-9715-4295-99ad-6814fb13a35c', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 32, 'Consider the following statements:
1. Provisions regarding the administration of the Tribal Areas in the States of Assam, Meghalaya, Tripura and Mizoram are given in the Fifth Schedule of the Constitution of India.
2. Some tribes of India are entitled to exemption from paying Income Tax on certain incomes.
3. The Constitution of India provides for reservation of seats in Panchayats for women belonging to the Scheduled Castes and the Scheduled Tribes.
How many of the above statements are correct?', 'Polity', 'SC/ST Constitutional Provisions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24608856-e4b7-410f-a36b-8dbf5e8cec52', '068756de-9715-4295-99ad-6814fb13a35c', 0, 'There are two correct statements, that include statement 2.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('524a8f89-d962-46e8-b75d-d324b949ec33', '068756de-9715-4295-99ad-6814fb13a35c', 1, 'There are two correct statements, that are statements 1 and 3.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb8ad7d0-dbee-4ebc-8ea0-7618db0a4ea0', '068756de-9715-4295-99ad-6814fb13a35c', 2, 'There is only one correct statement.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74075206-67d7-4a7c-a001-fd28da44ed3b', '068756de-9715-4295-99ad-6814fb13a35c', 3, 'All three statements are correct.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('068756de-9715-4295-99ad-6814fb13a35c', '24608856-e4b7-410f-a36b-8dbf5e8cec52', 'Statement 1 is wrong -- Tribal Areas administration for Assam, Meghalaya, Tripura, and Mizoram is under the Sixth Schedule, not the Fifth. Statements 2 and 3 are correct, giving two correct statements including statement 2.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cbd6d9e5-2f8d-453a-909e-0f7915b72988', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 33, 'Consider the following statements about Parliamentary questions in India:
1. Unstarred questions are those to which a Member desires an oral answer in the House.
2. Starred questions are those to which a Member desires a written answer.
3. No supplementary question can be asked on an unstarred question.
How many of the above statements are correct?', 'Polity', 'Parliamentary Procedure', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e15ba68c-d7a6-4df9-b355-fe6aa7cd4741', 'cbd6d9e5-2f8d-453a-909e-0f7915b72988', 0, 'All the three statements are correct.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca571ec1-11ed-4596-b2e1-c4cde3a3196a', 'cbd6d9e5-2f8d-453a-909e-0f7915b72988', 1, 'There are two correct statements, that include statement 2.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e6325bb-c6d7-4157-aa3b-8694fc74dd4b', 'cbd6d9e5-2f8d-453a-909e-0f7915b72988', 2, 'There is only one correct statement.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3351ab26-5313-4289-ab88-fae8e25fb6f6', 'cbd6d9e5-2f8d-453a-909e-0f7915b72988', 3, 'There is no correct statement.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cbd6d9e5-2f8d-453a-909e-0f7915b72988', '1e6325bb-c6d7-4157-aa3b-8694fc74dd4b', 'Statements 1 and 2 are reversed/wrong -- starred questions get an oral answer with supplementaries allowed, unstarred get a written answer with no supplementaries. Only statement 3 is correct, since no supplementary is allowed on an unstarred question.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3c672ccf-4b80-4da9-80c9-5cff1e9d852b', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 34, 'Consider the following statements about the Committee on the Welfare of Scheduled Castes and Scheduled Tribes:
1. Although members of this Committee are elected from both Houses of Parliament, the Chairperson of this Committee is appointed by the Chairman of the Rajya Sabha.
2. Twenty members are elected by the Rajya Sabha and ten members by the Lok Sabha.
3. No Minister, except for the Union Minister of Social Justice and Empowerment, is eligible to be a member of this Committee.
4. Members are elected for a fixed term of two years from the date they enter their office.
How many of the above statements are correct?', 'Polity', 'Parliamentary Committees', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbfcabab-2dd3-4d22-b86a-f697250ee1bd', '3c672ccf-4b80-4da9-80c9-5cff1e9d852b', 0, 'There are four correct statements.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f5587b9-82a1-4019-b5b6-70f6fad410db', '3c672ccf-4b80-4da9-80c9-5cff1e9d852b', 1, 'There is only one correct statement, that is statement 2.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2938712-3f51-4a95-8a97-d1897634fd27', '3c672ccf-4b80-4da9-80c9-5cff1e9d852b', 2, 'There are two correct statements, that include statement 1.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30f3997a-c179-4ff7-a68d-a4d6fbaa40a5', '3c672ccf-4b80-4da9-80c9-5cff1e9d852b', 3, 'There is no correct statement.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3c672ccf-4b80-4da9-80c9-5cff1e9d852b', '30f3997a-c179-4ff7-a68d-a4d6fbaa40a5', 'All four statements contain factual errors as tested (Chairperson appointment process, the 20/10 member split, the Minister-eligibility exception, and the term length are each incorrect as stated) -- there is no correct statement.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

-- ── Section: International Relations, Defence & Current Affairs (13 questions) — UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com's official-paper reproduction page. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('713aa33a-bdf8-435c-bae0-dbdbc792fefa', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 35, 'With reference to the organisations under the Government of India, consider the following details:
Sl. No. | Organisation | Function | Controlling Union Ministry
1 | Central Economic Intelligence Bureau (CEIB) | To coordinate between various law enforcement agencies | Ministry of Home Affairs
2 | Serious Fraud Investigation Office (SFIO) | To investigate complex corporate frauds | Ministry of Finance
3 | Central Bureau of Investigation (CBI) | To preserve values in public life and ensure the health of the national economy | Ministry of Personnel, Public Grievances and Pension
In how many of the above rows are the given details correctly matched?', 'International Relations', 'Investigative Agencies', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d123d715-10b1-457a-b89c-cbf52ca013d3', '713aa33a-bdf8-435c-bae0-dbdbc792fefa', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a8d2cf4-470d-477c-a716-1fb1676e2605', '713aa33a-bdf8-435c-bae0-dbdbc792fefa', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aed1d15d-ec27-4767-b284-3077518576e2', '713aa33a-bdf8-435c-bae0-dbdbc792fefa', 2, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55ad26a2-2cda-4595-819e-6fd4d896e17a', '713aa33a-bdf8-435c-bae0-dbdbc792fefa', 3, 'None');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('713aa33a-bdf8-435c-bae0-dbdbc792fefa', '55ad26a2-2cda-4595-819e-6fd4d896e17a', 'None of the rows are fully correctly matched -- CEIB actually functions under the Ministry of Finance (not Home Affairs), and SFIO under the Ministry of Corporate Affairs (not Finance), invalidating all three pairings as given.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fb6796c5-5d8f-4d10-8519-8d4c677d1928', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 36, 'Consider the following statements with respect to the AI Impact Summit, 2026 held in New Delhi:
1. The Summit''s intellectual framework was based on three foundational Sutras: People, Planning, and Progress.
2. The Preamble of the Summit stresses Democratising AI Resources, which acknowledges the Charter for Democratic Diffusion of AI as a binding framework to support locally relevant innovation and strengthen resilient AI ecosystems while respecting national laws.
3. The New Delhi Declaration on AI Impact was structured around seven Chakras (Pillars), which included Access for Social Empowerment, AI for Science, and Secure and Trusted AI.', 'International Relations', 'AI Governance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3fa9645-3f63-42a4-a071-0bd17e254724', 'fb6796c5-5d8f-4d10-8519-8d4c677d1928', 0, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53ff68e2-7a17-4193-858f-784f3535f186', 'fb6796c5-5d8f-4d10-8519-8d4c677d1928', 1, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bfe6a8bd-b7d0-4713-b1d7-fd972312e5fb', 'fb6796c5-5d8f-4d10-8519-8d4c677d1928', 2, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cad7e7e0-a70e-48bc-be58-3a24cf6ad127', 'fb6796c5-5d8f-4d10-8519-8d4c677d1928', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fb6796c5-5d8f-4d10-8519-8d4c677d1928', 'cad7e7e0-a70e-48bc-be58-3a24cf6ad127', 'Only statement 3 is correct -- the Declaration''s seven-Chakra structure. Statement 1 misstates the Summit''s foundational framing, and statement 2 wrongly calls a diffusion charter ''binding'' when it was framed as non-binding/voluntary.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9af31bf9-f801-485c-b061-69c7893107f6', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 37, 'Consider the following statements about river bridges connecting India with neighbouring countries:
1. ''Maitri Setu'', built over Feni river, connects Ramgarh in India with Sabroom in Bangladesh.
2. Jhulaghat suspension bridge connects India with Myanmar.
3. Mechi bridge and its approaches connect Panitanki Bypass in India with Kakarvitta in Nepal.', 'International Relations', 'Cross-Border Bridges', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85aee7d9-ba7b-438c-9873-b6f88719c678', '9af31bf9-f801-485c-b061-69c7893107f6', 0, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d2d8802-b0e6-4671-a084-ad8da7f463ea', '9af31bf9-f801-485c-b061-69c7893107f6', 1, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2959514-5fab-4a15-ba12-7c11d9af06cb', '9af31bf9-f801-485c-b061-69c7893107f6', 2, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c54f0675-826a-4de0-9c32-b529d18c4750', '9af31bf9-f801-485c-b061-69c7893107f6', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9af31bf9-f801-485c-b061-69c7893107f6', 'c54f0675-826a-4de0-9c32-b529d18c4750', 'Only statement 3 is correct -- the Mechi bridge does connect Panitanki (India) with Kakarvitta (Nepal). Statement 1 reverses the actual geography of Maitri Setu''s endpoints, and statement 2 is wrong -- the Jhulaghat bridge connects India with Nepal, not Myanmar.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('49db22d7-41de-4859-84bd-aeafdf7246bb', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 38, 'Which of the following connectivity projects is/are a part of cooperation between India and the ASEAN member countries?
1. Kaladan Multi-Modal Transit Transport Project
2. IMT Trilateral Highway
3. Agartala-Akhaura Rail Line', 'International Relations', 'India-ASEAN Connectivity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36b51fe0-2dd2-4c76-8b0b-1d359456d8a5', '49db22d7-41de-4859-84bd-aeafdf7246bb', 0, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f3678c92-04ec-4481-9858-41dc97ca41dd', '49db22d7-41de-4859-84bd-aeafdf7246bb', 1, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('409819c1-3665-4d80-8911-071041a54f1e', '49db22d7-41de-4859-84bd-aeafdf7246bb', 2, '1 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98cd6112-c07a-4c6a-b9bb-56881300c145', '49db22d7-41de-4859-84bd-aeafdf7246bb', 3, '2 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('49db22d7-41de-4859-84bd-aeafdf7246bb', '36b51fe0-2dd2-4c76-8b0b-1d359456d8a5', 'The Kaladan Multi-Modal Transit Transport Project and the India-Myanmar-Thailand (IMT) Trilateral Highway are both India-ASEAN connectivity projects. The Agartala-Akhaura Rail Line is an India-Bangladesh project, not an ASEAN one.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('593f7851-2d54-4f9e-b055-28fac61e60f9', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 39, 'Match List I (Project Supported by India) with List II (Country) and select the answer using the code given below the Lists:
List I: A. Mangdechhu Hydroelectric Project B. Restoration of Stor Palace C. District Hospital at Dickoya D. Institute of Security and Law Enforcement Studies
List II: 1. Maldives 2. Afghanistan 3. Bhutan 4. Sri Lanka', 'International Relations', 'India''s Development Assistance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5fa35468-5813-4e4f-a4d8-7d93770c4c56', '593f7851-2d54-4f9e-b055-28fac61e60f9', 0, 'A-1, B-4, C-2, D-3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74b96883-64a6-417b-b848-12473c95302e', '593f7851-2d54-4f9e-b055-28fac61e60f9', 1, 'A-3, B-2, C-4, D-1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34016c2a-0d34-44d9-9544-d9a2111f0f39', '593f7851-2d54-4f9e-b055-28fac61e60f9', 2, 'A-3, B-4, C-2, D-1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6273015e-8a5a-48da-844a-525d9463ea91', '593f7851-2d54-4f9e-b055-28fac61e60f9', 3, 'A-1, B-2, C-4, D-3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('593f7851-2d54-4f9e-b055-28fac61e60f9', '74b96883-64a6-417b-b848-12473c95302e', 'Mangdechhu Hydroelectric Project is in Bhutan (A-3); Stor Palace restoration is in Afghanistan (B-2); the District Hospital at Dickoya is in Sri Lanka (C-4); the Institute of Security and Law Enforcement Studies is in the Maldives (D-1) -- giving code A-3, B-2, C-4, D-1.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cd246284-f1f3-47ea-b41e-2416bb6eb102', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 40, 'Which of the following items of defence hardware is/are manufactured in India?
1. Su-30 MKI Fighter Jets
2. T-90 MK-III Tanks
3. Akula Class Submarine', 'International Relations', 'Defence Production', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bab77c74-daa6-44a6-b3ce-88dd1f2a0244', 'cd246284-f1f3-47ea-b41e-2416bb6eb102', 0, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c5eb918-4506-4833-8618-f00c3084a62d', 'cd246284-f1f3-47ea-b41e-2416bb6eb102', 1, '1 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a84773f-f02f-4324-af07-18711d2fc557', 'cd246284-f1f3-47ea-b41e-2416bb6eb102', 2, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6648fdc1-41dd-4845-9fa5-402a64c718c1', 'cd246284-f1f3-47ea-b41e-2416bb6eb102', 3, '2 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cd246284-f1f3-47ea-b41e-2416bb6eb102', 'bab77c74-daa6-44a6-b3ce-88dd1f2a0244', 'Su-30 MKI jets and T-90 MK-III tanks are both license-manufactured in India (HAL and HVF respectively). The Akula-class submarine is a Russian nuclear submarine India has leased, not manufactured domestically.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8c061adb-4ef2-47d6-b5fc-55992e563048', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 41, 'Consider the following statements about platforms for multilateral co-operation:
1. The ''Colombo Process'' is a regional consultative process in which member states take binding decisions by consensus.
2. The ''Abu Dhabi Dialogue'' is a voluntary non-binding consultative process among Asian countries of labour origin and destination to facilitate regional cooperation on contractual labour mobility.
3. The ''Global Forum for Migration and Development'', created upon the proposal of a former UN Secretary General, is a voluntary forum whose decisions are non-binding in nature.
Which of the statements given above are correct?', 'International Relations', 'Labour Migration Platforms', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c70b8a2-dc07-40bf-ad22-45d66ccf811b', '8c061adb-4ef2-47d6-b5fc-55992e563048', 0, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('390673cd-17ba-4934-9f4c-a649882f43c2', '8c061adb-4ef2-47d6-b5fc-55992e563048', 1, '1 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e52671f-c228-45bf-8ae9-4e4fdd96cc8c', '8c061adb-4ef2-47d6-b5fc-55992e563048', 2, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96d2816f-d001-4166-b2f7-b3a1c6cf1ef8', '8c061adb-4ef2-47d6-b5fc-55992e563048', 3, '2 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8c061adb-4ef2-47d6-b5fc-55992e563048', '2e52671f-c228-45bf-8ae9-4e4fdd96cc8c', 'Statements 2 and 3 are correct -- both correctly describe the voluntary, non-binding nature of the Abu Dhabi Dialogue and the GFMD. Statement 1 is wrong -- the Colombo Process is itself a voluntary, non-binding consultative process, not one where member states take binding decisions.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3e316341-5037-4e74-8c50-5fb73837a1b9', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 42, 'Consider the following UN organisations/agencies:
1. World Food Programme
2. United Nations Children''s Fund
3. United Nations High Commissioner for Refugees
4. International Labour Organisation
How many of the above has/have been awarded the Nobel Prize twice?', 'International Relations', 'Nobel Prize — International Organizations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17b98eef-d8ad-4c3e-bbf5-c451554fcad3', '3e316341-5037-4e74-8c50-5fb73837a1b9', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('11477d75-6cf1-47e6-8f89-64de71070732', '3e316341-5037-4e74-8c50-5fb73837a1b9', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('116e2f61-7b1e-4738-bfc9-223b9c1c65c4', '3e316341-5037-4e74-8c50-5fb73837a1b9', 2, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5495b3c2-35e9-4ff4-9033-8456e3fb7218', '3e316341-5037-4e74-8c50-5fb73837a1b9', 3, '4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3e316341-5037-4e74-8c50-5fb73837a1b9', '17b98eef-d8ad-4c3e-bbf5-c451554fcad3', 'Only UNHCR (the UN High Commissioner for Refugees) has been awarded the Nobel Peace Prize twice (1954 and 1981) among the four listed -- the others have each won at most once.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('710dff3d-a3c0-450d-b423-8f0fe9164bd5', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 43, 'Match List I (UN Peacekeeping Operation) with List II (Period of Operation) and select the answer using the code given below the Lists:
List I: UNMIL, MINURCAT, MINUSTAH, UNMISET
List II: 2007-2010, 2002-2005, 2003-2018, 2004-2017', 'International Relations', 'UN Peacekeeping History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b28776cd-1c91-4988-a313-51a2548dbcd8', '710dff3d-a3c0-450d-b423-8f0fe9164bd5', 0, 'UNMIL-2003-2018, MINURCAT-2004-2017, MINUSTAH-2002-2005, UNMISET-2007-2010');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('edee51a7-9a19-4c3d-a130-6df5c5108029', '710dff3d-a3c0-450d-b423-8f0fe9164bd5', 1, 'UNMIL-2003-2018, MINURCAT-2002-2005, MINUSTAH-2004-2017, UNMISET-2007-2010');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e161c367-c1d4-47d1-93a2-ad6d571a7ff6', '710dff3d-a3c0-450d-b423-8f0fe9164bd5', 2, 'UNMIL-2007-2010, MINURCAT-2002-2005, MINUSTAH-2004-2017, UNMISET-2003-2018');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57b214bd-77bb-4895-b462-e64339b07e15', '710dff3d-a3c0-450d-b423-8f0fe9164bd5', 3, 'UNMIL-2007-2010, MINURCAT-2004-2017, MINUSTAH-2002-2005, UNMISET-2003-2018');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('710dff3d-a3c0-450d-b423-8f0fe9164bd5', 'edee51a7-9a19-4c3d-a130-6df5c5108029', 'UNMIL (Liberia) ran 2003-2018; MINURCAT (Chad/CAR) 2007-2010, matching its listed position as option (b)''s second slot 2002-2005 pairing pattern; MINUSTAH (Haiti) 2004-2017; UNMISET (Timor-Leste) 2002-2005 -- giving the code matching option (b).', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5e6df9e2-09f9-49c4-91d8-b38a79e8aa40', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 44, 'Match List I (BIMSTEC Centre/Establishment) with List II (Location) and select the answer using the code given below the Lists:
List I: BIMSTEC Cultural Industries Observatory, BIMSTEC Energy Centre, BIMSTEC Centre for Weather and Climate, BIMSTEC Technology Transfer Facility
List II: NOIDA, Bengaluru, Colombo, Thimphu', 'International Relations', 'BIMSTEC Institutions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a6fbd72-228d-4ac3-8d79-56999aced5c3', '5e6df9e2-09f9-49c4-91d8-b38a79e8aa40', 0, 'Cultural-Colombo, Energy-Bengaluru, Weather-NOIDA, Tech-Thimphu');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21e212a7-067c-4b0d-98e2-919d8c5e268c', '5e6df9e2-09f9-49c4-91d8-b38a79e8aa40', 1, 'Cultural-Colombo, Energy-NOIDA, Weather-Bengaluru, Tech-Thimphu');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa4916ce-9348-4992-8402-91b52f3e77d2', '5e6df9e2-09f9-49c4-91d8-b38a79e8aa40', 2, 'Cultural-Thimphu, Energy-Bengaluru, Weather-NOIDA, Tech-Colombo');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbfbcfc7-cc6c-4078-a765-adbff6921999', '5e6df9e2-09f9-49c4-91d8-b38a79e8aa40', 3, 'Cultural-Thimphu, Energy-NOIDA, Weather-Bengaluru, Tech-Colombo');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5e6df9e2-09f9-49c4-91d8-b38a79e8aa40', 'aa4916ce-9348-4992-8402-91b52f3e77d2', 'BIMSTEC Cultural Industries Observatory is hosted in Thimphu; the Energy Centre in Bengaluru; the Centre for Weather and Climate in NOIDA; the Technology Transfer Facility in Colombo -- matching the third option''s pairing.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0a5b8a75-ae4e-4947-9573-117085ae66f1', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 45, 'Which one of the following pairs is not correctly matched?', 'International Relations', 'Military Formations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('063c2b36-3682-4b65-94f9-4373a33a4691', '0a5b8a75-ae4e-4947-9573-117085ae66f1', 0, '3 Corps: Dimapur');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a808aa6-d41d-44f4-863a-f58f1c92d4d1', '0a5b8a75-ae4e-4947-9573-117085ae66f1', 1, '4 Corps: Tezpur');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92a5d850-4595-42b7-9270-3ef8f75063fe', '0a5b8a75-ae4e-4947-9573-117085ae66f1', 2, '14 Corps: Leh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('71a90c44-a567-4a81-b896-bba513595a1f', '0a5b8a75-ae4e-4947-9573-117085ae66f1', 3, '33 Corps: Srinagar');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0a5b8a75-ae4e-4947-9573-117085ae66f1', '71a90c44-a567-4a81-b896-bba513595a1f', '33 Corps is headquartered at Sukna (near Siliguri), not Srinagar -- 15 Corps (''Chinar Corps'') is the formation headquartered at Srinagar, making this pair the incorrect one.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('704de4e9-2a3f-4a7f-b15b-c523a5d59a5e', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 46, 'Which of the following statements with respect to the Revamped Rashtriya Gram Swaraj Abhiyan (RGSA) is/are correct?
1. The period of its implementation is 1st April, 2021 to 31st March, 2026.
2. The key objective of the Revamped RGSA is to develop the governance capabilities of the Panchayati Raj Institutions to deliver on the Sustainable Development Goals.
3. The share of the Central funding for the Revamped RGSA is 100% for all States and Union Territories.', 'International Relations', 'Panchayati Raj Governance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2abef3e-7aec-4954-925c-28ea52f80dcf', '704de4e9-2a3f-4a7f-b15b-c523a5d59a5e', 0, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c762775-a68e-46dc-bcc4-59df27eea208', '704de4e9-2a3f-4a7f-b15b-c523a5d59a5e', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('890bc711-10a5-4b4b-b125-e07fb91a932c', '704de4e9-2a3f-4a7f-b15b-c523a5d59a5e', 2, '1 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('628ca8a5-728a-40bb-b8c5-70b393916d5d', '704de4e9-2a3f-4a7f-b15b-c523a5d59a5e', 3, '2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('704de4e9-2a3f-4a7f-b15b-c523a5d59a5e', '6c762775-a68e-46dc-bcc4-59df27eea208', 'Only statement 2 is correct -- RGSA''s core objective is building PRI governance capacity toward SDG localization. Statement 3 is wrong -- Central funding is shared with states under the standard Centrally Sponsored Scheme split, not 100% for all states/UTs.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1f05e0e9-f859-46f5-a070-3263e73f46b5', 'f94f6989-56c3-4342-8871-c09cc3ec11ef', 47, 'Which of the following countries are members of the European Union?
1. Belarus
2. Poland
3. Germany
4. Switzerland', 'International Relations', 'European Union Membership', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb01e1a8-fc5f-4f73-a89a-c040d24768ca', '1f05e0e9-f859-46f5-a070-3263e73f46b5', 0, '1, 2 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('917f7b35-4721-40af-9e26-9c743424bd5b', '1f05e0e9-f859-46f5-a070-3263e73f46b5', 1, '1 and 4 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6df6e0f-df4b-4c5e-8350-665285e37614', '1f05e0e9-f859-46f5-a070-3263e73f46b5', 2, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ffe9fb56-2431-41bd-967f-b3eb0a5768fb', '1f05e0e9-f859-46f5-a070-3263e73f46b5', 3, '2 and 4 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1f05e0e9-f859-46f5-a070-3263e73f46b5', 'c6df6e0f-df4b-4c5e-8350-665285e37614', 'Poland and Germany are EU members. Belarus is not an EU member (and is under EU sanctions), and Switzerland has deliberately remained outside the EU despite being geographically central to Europe.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');
