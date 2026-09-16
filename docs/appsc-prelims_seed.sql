-- ============================================================
-- APPSC Group 1 Prelims — Practice Paper 1
-- Full-Length Practice Paper (10 questions, 9 minutes)
-- Marking: +1 correct / -0.33 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('55c95fa9-5e63-4b6b-bee5-bde7d395d1dd', 'appsc-group1-prelims-practice-1', 'APPSC Group 1 Prelims Practice Paper 1', 'appsc', ARRAY['APPSC', 'Group 1', 'Prelims', 'Andhra Pradesh', 'General Studies']::TEXT[], 10, 'standard', true, 1, 9, 1, 0.33);

-- ── Section: General Studies (10 questions) — General Studies — authored from APPSC Group 1's own published Prelims syllabus (Andhra Pradesh history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official APPSC question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('df609860-51c1-4599-8e4a-ca315865d54a', '55c95fa9-5e63-4b6b-bee5-bde7d395d1dd', 1, 'The Amaravati Stupa, a major centre of early Buddhist art and architecture, flourished under the patronage of which dynasty?', 'General Studies', 'Andhra Pradesh History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84835bd3-15a0-4f59-9715-83b16e6dc00d', 'df609860-51c1-4599-8e4a-ca315865d54a', 0, 'Chalukyas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04e002e3-baf8-46dc-881b-0b3732e82ad9', 'df609860-51c1-4599-8e4a-ca315865d54a', 1, 'Satavahanas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33ca7962-00fd-48b7-a493-925e96825446', 'df609860-51c1-4599-8e4a-ca315865d54a', 2, 'Kakatiyas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21fc9413-68c3-4a4d-be93-6dc78597b1cd', 'df609860-51c1-4599-8e4a-ca315865d54a', 3, 'Vijayanagara Empire');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('df609860-51c1-4599-8e4a-ca315865d54a', '04e002e3-baf8-46dc-881b-0b3732e82ad9', 'The Amaravati Stupa developed under the Satavahana dynasty, becoming one of the most important centres of early Buddhist sculpture in India.', 'General Studies — authored from APPSC Group 1''s own published Prelims syllabus (Andhra Pradesh history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official APPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c2c43f62-bd44-44a9-9573-7df6633bc8d3', '55c95fa9-5e63-4b6b-bee5-bde7d395d1dd', 2, 'Andhra Pradesh''s new capital region, Amaravati, is situated on the banks of which river?', 'General Studies', 'Andhra Pradesh Geography', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb2d1dae-c408-4c5a-a549-8c02713cc176', 'c2c43f62-bd44-44a9-9573-7df6633bc8d3', 0, 'Godavari');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9fa73851-ec56-4bd5-897d-52ba840be686', 'c2c43f62-bd44-44a9-9573-7df6633bc8d3', 1, 'Krishna');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae823028-abb6-4fd8-b52b-97f61ba92dd8', 'c2c43f62-bd44-44a9-9573-7df6633bc8d3', 2, 'Penna');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e40479f5-df91-447a-b6ff-b96763458992', 'c2c43f62-bd44-44a9-9573-7df6633bc8d3', 3, 'Tungabhadra');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c2c43f62-bd44-44a9-9573-7df6633bc8d3', '9fa73851-ec56-4bd5-897d-52ba840be686', 'Amaravati, Andhra Pradesh''s planned capital, is located on the banks of the Krishna river.', 'General Studies — authored from APPSC Group 1''s own published Prelims syllabus (Andhra Pradesh history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official APPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4304ca2b-7676-4093-8faf-728c5d17bb49', '55c95fa9-5e63-4b6b-bee5-bde7d395d1dd', 3, 'The bifurcation of Andhra Pradesh to create Telangana was enacted under which Act?', 'General Studies', 'Indian Polity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('badaca21-9fe1-47da-91b8-07ce0d8465bf', '4304ca2b-7676-4093-8faf-728c5d17bb49', 0, 'States Reorganisation Act, 1956');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eebfae1c-a44e-44ab-8069-4e5684182619', '4304ca2b-7676-4093-8faf-728c5d17bb49', 1, 'Andhra Pradesh Reorganisation Act, 2014');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e7812ea-92fb-4ca9-8322-514a63d61b40', '4304ca2b-7676-4093-8faf-728c5d17bb49', 2, 'Andhra State Act, 1953');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3bda5519-d303-4a9a-b985-c672f597c9da', '4304ca2b-7676-4093-8faf-728c5d17bb49', 3, 'Telangana Formation Act, 2013');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4304ca2b-7676-4093-8faf-728c5d17bb49', 'eebfae1c-a44e-44ab-8069-4e5684182619', 'The Andhra Pradesh Reorganisation Act, 2014 formally created Telangana as a separate state from 2 June 2014.', 'General Studies — authored from APPSC Group 1''s own published Prelims syllabus (Andhra Pradesh history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official APPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0e6738cf-ab15-418a-89f0-9009562f225a', '55c95fa9-5e63-4b6b-bee5-bde7d395d1dd', 4, 'Visakhapatnam''s economy is particularly notable for which major industry, alongside its status as a major port?', 'General Studies', 'Andhra Pradesh Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e78fc1dd-cd4a-48f6-8c54-fa2590932640', '0e6738cf-ab15-418a-89f0-9009562f225a', 0, 'Textile manufacturing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5262c232-b0d2-42d2-bd95-f77d17dc4fe9', '0e6738cf-ab15-418a-89f0-9009562f225a', 1, 'Steel and shipbuilding');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4472ea22-b619-4740-a79d-cbb641d4a124', '0e6738cf-ab15-418a-89f0-9009562f225a', 2, 'Automobile assembly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4188126a-aa04-4e8c-8f90-f9ea30d180e4', '0e6738cf-ab15-418a-89f0-9009562f225a', 3, 'Software/IT exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0e6738cf-ab15-418a-89f0-9009562f225a', '5262c232-b0d2-42d2-bd95-f77d17dc4fe9', 'Visakhapatnam hosts a major steel plant (RINL) and shipbuilding facilities, alongside being one of India''s major ports.', 'General Studies — authored from APPSC Group 1''s own published Prelims syllabus (Andhra Pradesh history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official APPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2a54ce54-138d-4238-8aaf-9b7561e577f0', '55c95fa9-5e63-4b6b-bee5-bde7d395d1dd', 5, 'Sriharikota, home to India''s primary satellite launch centre, is located in which Andhra Pradesh district?', 'General Studies', 'Science & Technology', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f069295-1bbd-49be-9648-bd5dff354ed1', '2a54ce54-138d-4238-8aaf-9b7561e577f0', 0, 'Krishna');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ba98316-6e93-462e-adce-b8f68a227c76', '2a54ce54-138d-4238-8aaf-9b7561e577f0', 1, 'Sri Potti Sriramulu Nellore');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9fafc5ee-882a-4c78-8d65-7021a6b7c7da', '2a54ce54-138d-4238-8aaf-9b7561e577f0', 2, 'East Godavari');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8943a28-96da-4fed-a501-d492c264f4a8', '2a54ce54-138d-4238-8aaf-9b7561e577f0', 3, 'Guntur');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2a54ce54-138d-4238-8aaf-9b7561e577f0', '9ba98316-6e93-462e-adce-b8f68a227c76', 'The Satish Dhawan Space Centre at Sriharikota is located in Sri Potti Sriramulu Nellore district, Andhra Pradesh.', 'General Studies — authored from APPSC Group 1''s own published Prelims syllabus (Andhra Pradesh history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official APPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('17e39107-4155-4b33-88e2-56930495ccdd', '55c95fa9-5e63-4b6b-bee5-bde7d395d1dd', 6, 'Kuchipudi, a classical Indian dance form, originated in a village of the same name located in which Andhra Pradesh district?', 'General Studies', 'Andhra Pradesh Culture', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('657781e5-75c0-4b63-843b-682915f2d6a9', '17e39107-4155-4b33-88e2-56930495ccdd', 0, 'Krishna');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f00ee86-2fa8-4329-9dd6-ca6648b3cb2d', '17e39107-4155-4b33-88e2-56930495ccdd', 1, 'Guntur');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('835c4fbc-9f0b-4b15-9796-51371a5a4c10', '17e39107-4155-4b33-88e2-56930495ccdd', 2, 'Godavari');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bcaffec8-f9ed-4a22-ad92-109aea01f5ec', '17e39107-4155-4b33-88e2-56930495ccdd', 3, 'Chittoor');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('17e39107-4155-4b33-88e2-56930495ccdd', '657781e5-75c0-4b63-843b-682915f2d6a9', 'Kuchipudi originated in a village of that name in Krishna district, Andhra Pradesh.', 'General Studies — authored from APPSC Group 1''s own published Prelims syllabus (Andhra Pradesh history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official APPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('96508ad5-95bd-4c42-8bea-d0fb09d46ba7', '55c95fa9-5e63-4b6b-bee5-bde7d395d1dd', 7, 'The Goods and Services Tax (GST), which subsumed most indirect taxes, was implemented in India from which date?', 'General Studies', 'Indian Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a71f180-46ad-469d-be59-18c3267204d8', '96508ad5-95bd-4c42-8bea-d0fb09d46ba7', 0, '1 April 2016');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b4ea4e90-2155-49f5-b7cd-9ffb8d57a9b1', '96508ad5-95bd-4c42-8bea-d0fb09d46ba7', 1, '1 July 2017');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e1a9a90-e16d-4f84-b153-38cd2d802cae', '96508ad5-95bd-4c42-8bea-d0fb09d46ba7', 2, '1 January 2018');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8fc162b-9e45-4978-b554-4579c1b9ed6b', '96508ad5-95bd-4c42-8bea-d0fb09d46ba7', 3, '1 April 2019');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('96508ad5-95bd-4c42-8bea-d0fb09d46ba7', 'b4ea4e90-2155-49f5-b7cd-9ffb8d57a9b1', 'GST was implemented across India from 1 July 2017.', 'General Studies — authored from APPSC Group 1''s own published Prelims syllabus (Andhra Pradesh history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official APPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e471b571-2179-4f23-ae92-672e235d517b', '55c95fa9-5e63-4b6b-bee5-bde7d395d1dd', 8, 'Andhra Pradesh''s state legislature currently has which structure?', 'General Studies', 'Andhra Pradesh Polity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f84af48a-4ed8-46f7-b28a-05e01d104a69', 'e471b571-2179-4f23-ae92-672e235d517b', 0, 'Bicameral (Vidhan Sabha and Vidhan Parishad)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31951572-261c-4f82-9121-88467295fc65', 'e471b571-2179-4f23-ae92-672e235d517b', 1, 'Unicameral (only Legislative Assembly)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc2b53f2-0f0f-4188-afdc-24a0aef3b59e', 'e471b571-2179-4f23-ae92-672e235d517b', 2, 'Tricameral');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63670c8a-1c85-4ff2-9be5-3333c502f4d2', 'e471b571-2179-4f23-ae92-672e235d517b', 3, 'No elected legislature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e471b571-2179-4f23-ae92-672e235d517b', 'f84af48a-4ed8-46f7-b28a-05e01d104a69', 'Andhra Pradesh has a bicameral legislature, with both a Legislative Assembly and a Legislative Council.', 'General Studies — authored from APPSC Group 1''s own published Prelims syllabus (Andhra Pradesh history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official APPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('619fe185-9f10-429e-97ef-eb607094bff6', '55c95fa9-5e63-4b6b-bee5-bde7d395d1dd', 9, 'Alluri Sitarama Raju, who led the Rampa Rebellion against British forest laws, operated primarily in which region?', 'General Studies', 'Andhra Pradesh History — Freedom Struggle', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82b6dc66-55d6-4a38-b9b3-084f0331d9e3', '619fe185-9f10-429e-97ef-eb607094bff6', 0, 'Coastal Andhra plains');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07bf5880-0f2d-4365-ade5-ed808ecfa4e1', '619fe185-9f10-429e-97ef-eb607094bff6', 1, 'Agency tracts of the Eastern Ghats (Godavari region)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec1744fa-98f7-4355-9e26-1484e59a433b', '619fe185-9f10-429e-97ef-eb607094bff6', 2, 'Rayalaseema');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70a2fabe-d181-464c-b56a-c57ba5fe4db3', '619fe185-9f10-429e-97ef-eb607094bff6', 3, 'Nellore coast');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('619fe185-9f10-429e-97ef-eb607094bff6', '07bf5880-0f2d-4365-ade5-ed808ecfa4e1', 'Alluri Sitarama Raju led the Rampa Rebellion (1922-24) among tribal communities in the Agency tracts of the Eastern Ghats in the Godavari region.', 'General Studies — authored from APPSC Group 1''s own published Prelims syllabus (Andhra Pradesh history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official APPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('84b6f1e9-38b2-4d59-9dc0-eead60f6d574', '55c95fa9-5e63-4b6b-bee5-bde7d395d1dd', 10, 'The ''Amma Vodi'' scheme, providing financial assistance to mothers for their children''s education, is a flagship initiative of which state government?', 'General Studies', 'Current Affairs — Schemes', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('29429da0-3ac8-4e6d-b1b6-61442b9987f8', '84b6f1e9-38b2-4d59-9dc0-eead60f6d574', 0, 'Telangana');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('512c56d2-b00b-4f72-814f-41d2f2249a8c', '84b6f1e9-38b2-4d59-9dc0-eead60f6d574', 1, 'Andhra Pradesh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4685561c-1be6-45f0-89ce-b4342a1a79c2', '84b6f1e9-38b2-4d59-9dc0-eead60f6d574', 2, 'Tamil Nadu');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aad0bb7a-ff51-4767-ab4c-20a76ac7434f', '84b6f1e9-38b2-4d59-9dc0-eead60f6d574', 3, 'Karnataka');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('84b6f1e9-38b2-4d59-9dc0-eead60f6d574', '512c56d2-b00b-4f72-814f-41d2f2249a8c', 'Amma Vodi is an Andhra Pradesh state government scheme providing financial assistance to mothers linked to their children''s school attendance.', 'General Studies — authored from APPSC Group 1''s own published Prelims syllabus (Andhra Pradesh history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official APPSC question paper.');
