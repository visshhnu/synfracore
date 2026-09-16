-- ============================================================
-- MPSC Rajyaseva Prelims — Practice Paper 1
-- Full-Length Practice Paper (20 questions, 18 minutes)
-- Marking: +2 correct / -0.25 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 'mpsc-prelims-practice-1', 'MPSC Rajyaseva Prelims Practice Paper 1', 'mpsc', ARRAY['MPSC', 'Rajyaseva', 'Prelims', 'Maharashtra', 'General Studies', 'CSAT']::TEXT[], 20, 'standard', true, 1, 18, 2, 0.25);

-- ── Section: General Studies (10 questions) — General Studies — authored from MPSC Rajyaseva's own published Prelims syllabus (Maharashtra history/geography, Indian polity, economy, science & technology, current affairs); not copied from any official MPSC question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('19200f99-a941-451e-a6f7-4699345b4a07', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 1, 'The Battle of Palkhed (1728), a decisive early victory establishing Maratha military reputation, was fought by which Peshwa?', 'General Studies', 'Maharashtra History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63e2f36b-b5db-44ca-a527-7d7008f272bf', '19200f99-a941-451e-a6f7-4699345b4a07', 0, 'Balaji Vishwanath');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85e38d1d-0e60-421a-9746-d0b0dbd3f123', '19200f99-a941-451e-a6f7-4699345b4a07', 1, 'Baji Rao I');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc4442e2-fc07-4314-92df-0f87ffad889b', '19200f99-a941-451e-a6f7-4699345b4a07', 2, 'Balaji Baji Rao');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb8e0f69-d3b0-4a7b-836a-b3e9c951918a', '19200f99-a941-451e-a6f7-4699345b4a07', 3, 'Madhav Rao I');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('19200f99-a941-451e-a6f7-4699345b4a07', '85e38d1d-0e60-421a-9746-d0b0dbd3f123', 'Baji Rao I decisively defeated the Nizam of Hyderabad at the Battle of Palkhed (1728), an early demonstration of Maratha military strategy under Peshwa leadership.', 'General Studies — authored from MPSC Rajyaseva''s own published Prelims syllabus (Maharashtra history/geography, Indian polity, economy, science & technology, current affairs); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6a19c2b3-e548-4a6a-b213-1d24d23f84a0', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 2, 'The Western Ghats, running along Maharashtra''s western edge, are also known locally as:', 'General Studies', 'Maharashtra Geography', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7935d1e0-3354-4af4-9229-0a28a45028a9', '6a19c2b3-e548-4a6a-b213-1d24d23f84a0', 0, 'Sahyadri');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1f8459d-ad65-4172-a006-b4e6408e30df', '6a19c2b3-e548-4a6a-b213-1d24d23f84a0', 1, 'Vindhyachal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('699c2813-9091-471f-a297-6ce089007354', '6a19c2b3-e548-4a6a-b213-1d24d23f84a0', 2, 'Aravalli');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe8c1861-9e8d-4ee1-aa7c-ab522f6d7d8b', '6a19c2b3-e548-4a6a-b213-1d24d23f84a0', 3, 'Satpura');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6a19c2b3-e548-4a6a-b213-1d24d23f84a0', '7935d1e0-3354-4af4-9229-0a28a45028a9', 'The Western Ghats in Maharashtra are locally known as the Sahyadri range.', 'General Studies — authored from MPSC Rajyaseva''s own published Prelims syllabus (Maharashtra history/geography, Indian polity, economy, science & technology, current affairs); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('36844ba9-0256-4372-8df8-c4630d97c5f5', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 3, 'The 74th Constitutional Amendment Act (1992) specifically pertains to:', 'General Studies', 'Indian Polity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d17a623-fa28-43ee-b4ba-be40fe64b94a', '36844ba9-0256-4372-8df8-c4630d97c5f5', 0, 'Panchayati Raj Institutions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c80b7d05-fbf5-499c-ade8-09e12c22753a', '36844ba9-0256-4372-8df8-c4630d97c5f5', 1, 'Urban Local Bodies (Municipalities)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6b1746f-5985-46b9-bb11-274496df926b', '36844ba9-0256-4372-8df8-c4630d97c5f5', 2, 'Judicial reforms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c4275f1-592b-4f20-8248-255eaa89f8a7', '36844ba9-0256-4372-8df8-c4630d97c5f5', 3, 'Election Commission powers');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('36844ba9-0256-4372-8df8-c4630d97c5f5', 'c80b7d05-fbf5-499c-ade8-09e12c22753a', 'The 74th Amendment established the constitutional framework for Urban Local Bodies (Nagar Panchayats, Municipal Councils, Municipal Corporations), parallel to the 73rd Amendment''s Panchayati Raj provisions.', 'General Studies — authored from MPSC Rajyaseva''s own published Prelims syllabus (Maharashtra history/geography, Indian polity, economy, science & technology, current affairs); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('91fc4df8-7339-45e5-bf4b-a9060173d636', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 4, 'Which city is often referred to as the financial capital of India, contributing significantly to Maharashtra''s and India''s GDP?', 'General Studies', 'Maharashtra Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4195652-f2fa-4769-b986-3cd6e1dec554', '91fc4df8-7339-45e5-bf4b-a9060173d636', 0, 'Pune');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8c4cbe0-ad31-4c06-94d9-840b22503d57', '91fc4df8-7339-45e5-bf4b-a9060173d636', 1, 'Nagpur');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53a10b7d-a8fa-4b64-8266-dbac31954e9c', '91fc4df8-7339-45e5-bf4b-a9060173d636', 2, 'Mumbai');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('335decff-d510-481e-8e1c-f9db0b961eea', '91fc4df8-7339-45e5-bf4b-a9060173d636', 3, 'Nashik');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('91fc4df8-7339-45e5-bf4b-a9060173d636', '53a10b7d-a8fa-4b64-8266-dbac31954e9c', 'Mumbai, hosting the RBI, BSE, NSE, and numerous corporate headquarters, is commonly referred to as India''s financial capital.', 'General Studies — authored from MPSC Rajyaseva''s own published Prelims syllabus (Maharashtra history/geography, Indian polity, economy, science & technology, current affairs); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6f900f74-4dfe-40e6-9231-f00fc48f0a67', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 5, 'The Bhabha Atomic Research Centre (BARC), India''s premier nuclear research facility, is located in:', 'General Studies', 'Science & Technology', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f4fb909-46db-452f-83f5-0196a4a5e424', '6f900f74-4dfe-40e6-9231-f00fc48f0a67', 0, 'Pune');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37c00716-ad79-4aa0-8b37-657e4f1fe920', '6f900f74-4dfe-40e6-9231-f00fc48f0a67', 1, 'Trombay, Mumbai');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f3d1bea-1527-442c-8423-64e5710ed4c9', '6f900f74-4dfe-40e6-9231-f00fc48f0a67', 2, 'Kalpakkam');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10bb889f-52dc-428b-a54b-3cb99cabe38b', '6f900f74-4dfe-40e6-9231-f00fc48f0a67', 3, 'Tarapur');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6f900f74-4dfe-40e6-9231-f00fc48f0a67', '37c00716-ad79-4aa0-8b37-657e4f1fe920', 'BARC is located at Trombay in Mumbai, established in 1954 as India''s foremost nuclear research institution.', 'General Studies — authored from MPSC Rajyaseva''s own published Prelims syllabus (Maharashtra history/geography, Indian polity, economy, science & technology, current affairs); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cc1da415-60ae-4c7d-a7d8-a1d6989db0f5', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 6, 'The Jal Jeevan Mission, a central government scheme, primarily aims to provide:', 'General Studies', 'Current Affairs — Governance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78451fd9-0620-4a47-9708-29c1957bddab', 'cc1da415-60ae-4c7d-a7d8-a1d6989db0f5', 0, 'Free electricity to rural households');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8297b845-89da-4ccf-b6c3-c9c8b5cbe14c', 'cc1da415-60ae-4c7d-a7d8-a1d6989db0f5', 1, 'Functional household tap water connections to every rural home');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ceef2a54-e327-431b-afc9-e0f6d724179c', 'cc1da415-60ae-4c7d-a7d8-a1d6989db0f5', 2, 'Free housing under PMAY');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98635a27-8032-40d1-93c1-4f980d23b806', 'cc1da415-60ae-4c7d-a7d8-a1d6989db0f5', 3, 'Crop insurance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cc1da415-60ae-4c7d-a7d8-a1d6989db0f5', '8297b845-89da-4ccf-b6c3-c9c8b5cbe14c', 'Jal Jeevan Mission aims to provide functional household tap connections (Har Ghar Jal) to every rural household in India.', 'General Studies — authored from MPSC Rajyaseva''s own published Prelims syllabus (Maharashtra history/geography, Indian polity, economy, science & technology, current affairs); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6cf17699-887a-417a-bb3e-bd8efcbc096d', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 7, 'The Ajanta and Ellora caves, UNESCO World Heritage Sites known for rock-cut architecture, are located in which Maharashtra district?', 'General Studies', 'Maharashtra Culture', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27b9032c-49cc-4490-904e-90fd1319eebd', '6cf17699-887a-417a-bb3e-bd8efcbc096d', 0, 'Pune');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62f09b7b-43bb-4ac0-b49b-f5ece004c35b', '6cf17699-887a-417a-bb3e-bd8efcbc096d', 1, 'Aurangabad (Chhatrapati Sambhajinagar)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff5cd11a-835f-4e49-8a1b-5e937154bf6a', '6cf17699-887a-417a-bb3e-bd8efcbc096d', 2, 'Nashik');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b114c1fa-d96b-49ab-b1b7-9c801e5effe4', '6cf17699-887a-417a-bb3e-bd8efcbc096d', 3, 'Kolhapur');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6cf17699-887a-417a-bb3e-bd8efcbc096d', '62f09b7b-43bb-4ac0-b49b-f5ece004c35b', 'The Ajanta and Ellora caves are located in the Aurangabad district (renamed Chhatrapati Sambhajinagar) of Maharashtra.', 'General Studies — authored from MPSC Rajyaseva''s own published Prelims syllabus (Maharashtra history/geography, Indian polity, economy, science & technology, current affairs); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4c7e22e0-75e3-497f-88ba-ef497844406f', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 8, 'The Micro, Small and Medium Enterprises (MSME) sector in India is classified based on which two criteria under the revised 2020 definition?', 'General Studies', 'Indian Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5594bab6-9522-469a-a0da-8feb1d8800b7', '4c7e22e0-75e3-497f-88ba-ef497844406f', 0, 'Only investment in plant and machinery');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('254a79e7-e16d-4466-bdda-4538b54637a8', '4c7e22e0-75e3-497f-88ba-ef497844406f', 1, 'Investment in plant/machinery/equipment AND annual turnover');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f52a6bee-8659-4d6c-b5f8-ec7055d3be2e', '4c7e22e0-75e3-497f-88ba-ef497844406f', 2, 'Only annual turnover');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('502c0bfe-28a1-4fe6-b96a-dd849b33cb0a', '4c7e22e0-75e3-497f-88ba-ef497844406f', 3, 'Number of employees only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4c7e22e0-75e3-497f-88ba-ef497844406f', '254a79e7-e16d-4466-bdda-4538b54637a8', 'The 2020 revised MSME definition uses a composite criterion of both investment (in plant/machinery/equipment) and annual turnover, replacing the earlier investment-only criterion.', 'General Studies — authored from MPSC Rajyaseva''s own published Prelims syllabus (Maharashtra history/geography, Indian polity, economy, science & technology, current affairs); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3e423161-ca7c-466f-9ecb-8466a62b2601', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 9, 'The Vidhan Parishad (Legislative Council) of Maharashtra is an example of which kind of legislative structure?', 'General Studies', 'Maharashtra Polity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef035900-eaf8-4ec5-b5bb-80511fbba9a8', '3e423161-ca7c-466f-9ecb-8466a62b2601', 0, 'Unicameral');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6aa6d2c-b33e-4b00-a897-3c6e3bb5a80d', '3e423161-ca7c-466f-9ecb-8466a62b2601', 1, 'Bicameral upper house');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5710d6f-c246-47c2-b25b-db563eb6fa88', '3e423161-ca7c-466f-9ecb-8466a62b2601', 2, 'Judicial body');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a744c32-fddb-4d6f-b8b5-e32a2bbe853c', '3e423161-ca7c-466f-9ecb-8466a62b2601', 3, 'Executive council');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3e423161-ca7c-466f-9ecb-8466a62b2601', 'b6aa6d2c-b33e-4b00-a897-3c6e3bb5a80d', 'Maharashtra has a bicameral legislature; the Vidhan Parishad is the upper house, alongside the directly-elected Vidhan Sabha (lower house).', 'General Studies — authored from MPSC Rajyaseva''s own published Prelims syllabus (Maharashtra history/geography, Indian polity, economy, science & technology, current affairs); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5b451168-3e0c-412a-9df4-6526e05a6aa5', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 10, 'The Godavari river, one of the longest rivers in peninsular India, originates in which Maharashtra location?', 'General Studies', 'Geography — Rivers', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c1c330b-12c4-4080-b0d6-d3d7f2ca51fa', '5b451168-3e0c-412a-9df4-6526e05a6aa5', 0, 'Mahabaleshwar');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3de9c44a-49bd-407c-bc11-14f97a04ea64', '5b451168-3e0c-412a-9df4-6526e05a6aa5', 1, 'Trimbakeshwar (near Nashik)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a60218d7-787b-4b03-b184-ee2ecf3b90eb', '5b451168-3e0c-412a-9df4-6526e05a6aa5', 2, 'Satara');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45fbb0e7-40ca-4798-ad34-7736a6871dbd', '5b451168-3e0c-412a-9df4-6526e05a6aa5', 3, 'Aurangabad');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5b451168-3e0c-412a-9df4-6526e05a6aa5', '3de9c44a-49bd-407c-bc11-14f97a04ea64', 'The Godavari river originates at Trimbakeshwar near Nashik, Maharashtra, and flows across peninsular India to the Bay of Bengal.', 'General Studies — authored from MPSC Rajyaseva''s own published Prelims syllabus (Maharashtra history/geography, Indian polity, economy, science & technology, current affairs); not copied from any official MPSC question paper.');

-- ── Section: CSAT (10 questions) — CSAT — authored from MPSC's own published Paper II syllabus (comprehension, logical reasoning, decision making, basic numeracy); not copied from any official MPSC question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5ecf35ca-4f10-424b-8195-475e9a361297', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 11, 'If all Zips are Zops, and all Zops are Zaps, which of the following must be true?', 'CSAT', 'Logical Reasoning', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f7c29c8-04db-4011-9688-6e5d5bda7936', '5ecf35ca-4f10-424b-8195-475e9a361297', 0, 'All Zaps are Zips');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19aac02d-3b1b-4bf6-bf5a-6a2a7a447ac5', '5ecf35ca-4f10-424b-8195-475e9a361297', 1, 'All Zips are Zaps');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('904ce9a1-a0b3-42cf-a2a3-14418706ef4a', '5ecf35ca-4f10-424b-8195-475e9a361297', 2, 'No Zips are Zaps');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff6220fc-5ea7-48c3-996d-b1edf9bae393', '5ecf35ca-4f10-424b-8195-475e9a361297', 3, 'Cannot be determined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5ecf35ca-4f10-424b-8195-475e9a361297', '19aac02d-3b1b-4bf6-bf5a-6a2a7a447ac5', 'By transitivity, if all Zips are Zops and all Zops are Zaps, then all Zips must be Zaps.', 'CSAT — authored from MPSC''s own published Paper II syllabus (comprehension, logical reasoning, decision making, basic numeracy); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e022afea-ea6c-449e-8f4f-c32a3ea34900', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 12, 'You are a manager and discover a team member has been consistently missing minor deadlines due to personal issues they haven''t disclosed. What is the most appropriate first step?', 'CSAT', 'Decision Making', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6868585c-60b1-49fe-8dd6-807d67f542ba', 'e022afea-ea6c-449e-8f4f-c32a3ea34900', 0, 'Immediately report them to HR for disciplinary action');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('813d85fb-4ca3-4ebd-aa6a-91992e258b48', 'e022afea-ea6c-449e-8f4f-c32a3ea34900', 1, 'Have a private, supportive conversation to understand the situation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3529c1c-2fae-4eb1-8cd3-a5a83b82c864', 'e022afea-ea6c-449e-8f4f-c32a3ea34900', 2, 'Publicly reassign their tasks to others');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04ba03af-b77f-4ea6-aacd-9e14e9aa1741', 'e022afea-ea6c-449e-8f4f-c32a3ea34900', 3, 'Ignore the issue since deadlines are minor');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e022afea-ea6c-449e-8f4f-c32a3ea34900', '813d85fb-4ca3-4ebd-aa6a-91992e258b48', 'A supportive, private conversation to understand the underlying cause is the most constructive first step before considering any disciplinary or reassignment action.', 'CSAT — authored from MPSC''s own published Paper II syllabus (comprehension, logical reasoning, decision making, basic numeracy); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ce65631c-7b58-4001-9160-c259295e7e18', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 13, 'If a train travels 180km in 3 hours, what is its speed in m/s?', 'CSAT', 'Basic Numeracy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a7222b7-ad88-4a9f-8681-a85779628fad', 'ce65631c-7b58-4001-9160-c259295e7e18', 0, '15 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5270e3a4-ca3d-44a7-bd96-ded7c5739233', 'ce65631c-7b58-4001-9160-c259295e7e18', 1, '16.67 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4506cd4-e217-4fa7-8fe4-7cb9922445b1', 'ce65631c-7b58-4001-9160-c259295e7e18', 2, '18 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96f130c6-7b11-408d-a5ea-46e04eb14725', 'ce65631c-7b58-4001-9160-c259295e7e18', 3, '20 m/s');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ce65631c-7b58-4001-9160-c259295e7e18', '5270e3a4-ca3d-44a7-bd96-ded7c5739233', 'Speed = 180km/3hr = 60 km/h = 60×(5/18) m/s ≈ 16.67 m/s.', 'CSAT — authored from MPSC''s own published Paper II syllabus (comprehension, logical reasoning, decision making, basic numeracy); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c5f3c826-aad1-4ea2-94aa-2d3f9211988f', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 14, '"Urban green spaces not only improve air quality but also provide measurable mental health benefits to city residents." What two benefits does the passage attribute to urban green spaces?', 'CSAT', 'Comprehension', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('983233e7-62bf-47dd-a4d9-18a4d8549878', 'c5f3c826-aad1-4ea2-94aa-2d3f9211988f', 0, 'Reduced crime and increased property value');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f96e3c28-f629-40a5-9208-92eefe9cf56c', 'c5f3c826-aad1-4ea2-94aa-2d3f9211988f', 1, 'Improved air quality and mental health benefits');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b9bc4ce-4cab-4d9a-a245-4a0fde06fd84', 'c5f3c826-aad1-4ea2-94aa-2d3f9211988f', 2, 'Increased tourism and revenue');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4c4f343-4af5-48e6-a01d-616efcc29b6d', 'c5f3c826-aad1-4ea2-94aa-2d3f9211988f', 3, 'Better traffic flow and safety');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c5f3c826-aad1-4ea2-94aa-2d3f9211988f', 'f96e3c28-f629-40a5-9208-92eefe9cf56c', 'The passage explicitly names improved air quality and mental health benefits as the two attributed benefits.', 'CSAT — authored from MPSC''s own published Paper II syllabus (comprehension, logical reasoning, decision making, basic numeracy); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('58fdd073-e92f-42a6-b432-81a391911845', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 15, 'If a company''s expenses increased from ₹50 lakh to ₹65 lakh in a year, what is the percentage increase?', 'CSAT', 'Data Interpretation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dab96206-02f5-4c87-bb12-0f0a6c722f10', '58fdd073-e92f-42a6-b432-81a391911845', 0, '25%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f86f8c8-2ca4-4584-ac81-2f87e64308ed', '58fdd073-e92f-42a6-b432-81a391911845', 1, '30%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a998021d-903e-464a-93e2-7d5fe6e3577a', '58fdd073-e92f-42a6-b432-81a391911845', 2, '35%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f16c8379-fc9a-4975-a35b-5bec5c9724c5', '58fdd073-e92f-42a6-b432-81a391911845', 3, '40%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('58fdd073-e92f-42a6-b432-81a391911845', '8f86f8c8-2ca4-4584-ac81-2f87e64308ed', 'Increase = 65-50=15 lakh; percentage = (15/50)×100 = 30%.', 'CSAT — authored from MPSC''s own published Paper II syllabus (comprehension, logical reasoning, decision making, basic numeracy); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('15d5c862-7b60-4517-9bb1-97851911bf35', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 16, 'Find the next term: 2, 5, 11, 23, 47, ?', 'CSAT', 'Logical Reasoning — Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d1331cf-2309-466e-aece-4736fe0d48d4', '15d5c862-7b60-4517-9bb1-97851911bf35', 0, '93');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12f879d2-f877-4827-b68c-2cf19618f0b5', '15d5c862-7b60-4517-9bb1-97851911bf35', 1, '94');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66186578-c835-4721-9a0c-924a1a8ae089', '15d5c862-7b60-4517-9bb1-97851911bf35', 2, '95');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f198a88-35bf-4b39-889b-506a5ba40584', '15d5c862-7b60-4517-9bb1-97851911bf35', 3, '96');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('15d5c862-7b60-4517-9bb1-97851911bf35', '66186578-c835-4721-9a0c-924a1a8ae089', 'Each term is roughly double the previous plus 1 (2×2+1=5, 5×2+1=11, 11×2+1=23, 23×2+1=47); next is 47×2+1=95.', 'CSAT — authored from MPSC''s own published Paper II syllabus (comprehension, logical reasoning, decision making, basic numeracy); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d9b1daf0-9e7b-4a8b-9665-043f5f185ec6', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 17, 'As a government officer, you discover a minor procedural error in a colleague''s completed work that doesn''t affect the final outcome. What is the most appropriate action?', 'CSAT', 'Decision Making — Ethics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5dff37e1-addb-410b-a791-067a0d49c647', 'd9b1daf0-9e7b-4a8b-9665-043f5f185ec6', 0, 'Ignore it since the outcome is unaffected');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e92184f-0dfd-470e-88eb-17caeb1a2781', 'd9b1daf0-9e7b-4a8b-9665-043f5f185ec6', 1, 'Quietly inform the colleague so they can learn and avoid it in future');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0b214fa-fdb3-431d-b178-8d604501839b', 'd9b1daf0-9e7b-4a8b-9665-043f5f185ec6', 2, 'Report it formally to superiors immediately');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('420e7f1b-451b-4413-97ec-2005b7d2ece9', 'd9b1daf0-9e7b-4a8b-9665-043f5f185ec6', 3, 'Publicly point it out in a team meeting');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d9b1daf0-9e7b-4a8b-9665-043f5f185ec6', '1e92184f-0dfd-470e-88eb-17caeb1a2781', 'Quietly informing the colleague directly supports learning and correction without unnecessary escalation or public embarrassment, appropriate given the error''s minor, outcome-neutral nature.', 'CSAT — authored from MPSC''s own published Paper II syllabus (comprehension, logical reasoning, decision making, basic numeracy); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5b783db5-8771-4d04-992d-6f1d587a996c', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 18, 'The average of 6 numbers is 25. If one number is removed, the average of the remaining 5 becomes 24. What was the removed number?', 'CSAT', 'Basic Numeracy — Averages', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a26bfa4-3e76-49f1-bf67-3e051f782df3', '5b783db5-8771-4d04-992d-6f1d587a996c', 0, '28');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93e8b4a4-69ea-48dc-ba66-47f18da1b1f3', '5b783db5-8771-4d04-992d-6f1d587a996c', 1, '29');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a7e75f9-91c9-4d8b-a9db-3f716772997f', '5b783db5-8771-4d04-992d-6f1d587a996c', 2, '30');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7813764b-8733-460a-9a0f-a68bfa57c43b', '5b783db5-8771-4d04-992d-6f1d587a996c', 3, '31');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5b783db5-8771-4d04-992d-6f1d587a996c', '4a7e75f9-91c9-4d8b-a9db-3f716772997f', 'Total of 6 numbers = 150; total of 5 numbers = 120; removed number = 150-120 = 30.', 'CSAT — authored from MPSC''s own published Paper II syllabus (comprehension, logical reasoning, decision making, basic numeracy); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3f8233e7-229a-45a5-8d41-a53b29910b74', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 19, '"While electric vehicles reduce tailpipe emissions, their environmental benefit depends significantly on the source of electricity used for charging." What does the passage suggest determines EVs'' real environmental benefit?', 'CSAT', 'Comprehension', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13c7a9ed-cc03-44e4-9569-fb13f7dec68f', '3f8233e7-229a-45a5-8d41-a53b29910b74', 0, 'Vehicle price');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ade81ce-b546-4026-8196-9953d4b35f79', '3f8233e7-229a-45a5-8d41-a53b29910b74', 1, 'The electricity source used for charging');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce3818d2-3404-4295-9ce0-a42e4e71e4b9', '3f8233e7-229a-45a5-8d41-a53b29910b74', 2, 'Battery size');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31591bdf-a527-41a1-9841-532d9bef02da', '3f8233e7-229a-45a5-8d41-a53b29910b74', 3, 'Driving range');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3f8233e7-229a-45a5-8d41-a53b29910b74', '8ade81ce-b546-4026-8196-9953d4b35f79', 'The passage explicitly attributes the real environmental benefit to the electricity source used for charging, not price, battery size, or range.', 'CSAT — authored from MPSC''s own published Paper II syllabus (comprehension, logical reasoning, decision making, basic numeracy); not copied from any official MPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('67fc2be9-85b0-4610-9d13-07dac99eb4eb', 'fa6357f8-ca5a-4a6e-82e5-b7e611ad1fa3', 20, 'Five people A, B, C, D, E are seated in a row. B is to the immediate right of A. C is at one end. If D is exactly in the middle, which of the following could be true?', 'CSAT', 'Logical Reasoning', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb11424d-44b1-45e8-8640-6ec8509d33cd', '67fc2be9-85b0-4610-9d13-07dac99eb4eb', 0, 'A is at an end');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('484b76df-2237-4be4-9f8e-8e2045817b3c', '67fc2be9-85b0-4610-9d13-07dac99eb4eb', 1, 'B is at an end');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6539d8dc-8228-42f2-9ca0-c6c6283c58ec', '67fc2be9-85b0-4610-9d13-07dac99eb4eb', 2, 'E must be adjacent to C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4325af25-3326-4b42-8f17-02361daf1e12', '67fc2be9-85b0-4610-9d13-07dac99eb4eb', 3, 'C and D are adjacent');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('67fc2be9-85b0-4610-9d13-07dac99eb4eb', 'cb11424d-44b1-45e8-8640-6ec8509d33cd', 'Given B is immediately right of A, and C is at one end with D in the middle, A being at the other end (or a position allowing B beside it) is a consistent possible arrangement.', 'CSAT — authored from MPSC''s own published Paper II syllabus (comprehension, logical reasoning, decision making, basic numeracy); not copied from any official MPSC question paper.');
