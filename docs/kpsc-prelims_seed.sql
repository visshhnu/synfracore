-- ============================================================
-- KPSC KAS Prelims — Practice Paper 1
-- Full-Length Practice Paper (10 questions, 9 minutes)
-- Marking: +2 correct / -0.25 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('04e9e539-ca12-4705-a9df-dfd16fe99bab', 'kpsc-kas-prelims-practice-1', 'KPSC KAS Prelims Practice Paper 1', 'kpsc', ARRAY['KPSC', 'KAS', 'Prelims', 'Karnataka', 'General Studies']::TEXT[], 10, 'standard', true, 1, 9, 2, 0.25);

-- ── Section: General Studies (10 questions) — General Studies — authored from KPSC KAS's own published Prelims syllabus (Karnataka history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official KPSC question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('14d74b90-925d-4db3-9fdd-40e2ead6742f', '04e9e539-ca12-4705-a9df-dfd16fe99bab', 1, 'The Vijayanagara Empire, one of South India''s greatest medieval empires, had its capital at:', 'General Studies', 'Karnataka History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e1cb28b-b4c3-46ad-a3e9-22df6986e4ae', '14d74b90-925d-4db3-9fdd-40e2ead6742f', 0, 'Mysuru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a74ec7ec-e7bd-4c76-b9c8-a45a8457c919', '14d74b90-925d-4db3-9fdd-40e2ead6742f', 1, 'Hampi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9e08d0a-c4d3-4c61-9f36-4b687c85eca6', '14d74b90-925d-4db3-9fdd-40e2ead6742f', 2, 'Belur');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7531d027-6671-4207-96a1-42ad880d3a5c', '14d74b90-925d-4db3-9fdd-40e2ead6742f', 3, 'Badami');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('14d74b90-925d-4db3-9fdd-40e2ead6742f', 'a74ec7ec-e7bd-4c76-b9c8-a45a8457c919', 'Hampi served as the capital of the Vijayanagara Empire (14th-17th century), now a UNESCO World Heritage Site.', 'General Studies — authored from KPSC KAS''s own published Prelims syllabus (Karnataka history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official KPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f7aab09f-dd21-4714-a6a7-cd13c92e3fc6', '04e9e539-ca12-4705-a9df-dfd16fe99bab', 2, 'The Western Ghats section running through Karnataka, known for coffee cultivation and biodiversity, is locally called:', 'General Studies', 'Karnataka Geography', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a143da15-e380-44c6-b948-80f6d6a0ba8c', 'f7aab09f-dd21-4714-a6a7-cd13c92e3fc6', 0, 'Nilgiris');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5dc35542-f166-4811-8141-2003c4ed4d24', 'f7aab09f-dd21-4714-a6a7-cd13c92e3fc6', 1, 'Malnad');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b70eb7ba-c360-4715-904a-57eb8b5fd9d4', 'f7aab09f-dd21-4714-a6a7-cd13c92e3fc6', 2, 'Deccan Plateau');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dcb5b3e7-696c-419e-a583-ec84cc00499a', 'f7aab09f-dd21-4714-a6a7-cd13c92e3fc6', 3, 'Coorg Hills only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f7aab09f-dd21-4714-a6a7-cd13c92e3fc6', '5dc35542-f166-4811-8141-2003c4ed4d24', 'The Western Ghats region in Karnataka is locally referred to as Malnad (''land of hills''), known for its high rainfall, coffee cultivation, and biodiversity.', 'General Studies — authored from KPSC KAS''s own published Prelims syllabus (Karnataka history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official KPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d551cd37-51ac-45c2-9b31-a7fa9f2aa9f7', '04e9e539-ca12-4705-a9df-dfd16fe99bab', 3, 'The Union Public Service Commission''s members are appointed by:', 'General Studies', 'Indian Polity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ded1b419-ffa6-456b-9c2d-bb88df65a828', 'd551cd37-51ac-45c2-9b31-a7fa9f2aa9f7', 0, 'The Prime Minister');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25a19348-b82d-489a-bcb8-d326b7ff21a3', 'd551cd37-51ac-45c2-9b31-a7fa9f2aa9f7', 1, 'The President of India');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7fdd513-39f3-464c-99ce-718fe60e9e7c', 'd551cd37-51ac-45c2-9b31-a7fa9f2aa9f7', 2, 'The Parliament');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6f43691-d6cf-4dc7-b935-d50e9dcea0bc', 'd551cd37-51ac-45c2-9b31-a7fa9f2aa9f7', 3, 'The Chief Justice of India');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d551cd37-51ac-45c2-9b31-a7fa9f2aa9f7', '25a19348-b82d-489a-bcb8-d326b7ff21a3', 'Members of the UPSC (and similarly, State PSCs by the Governor) are appointed by the President of India.', 'General Studies — authored from KPSC KAS''s own published Prelims syllabus (Karnataka history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official KPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a8299143-fa46-4ee4-9aff-083f275b6f87', '04e9e539-ca12-4705-a9df-dfd16fe99bab', 4, 'Bengaluru is often referred to as the ''Silicon Valley of India'' primarily due to its concentration of which industry?', 'General Studies', 'Karnataka Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99377b90-8342-46ef-9a0e-43a69198ea0c', 'a8299143-fa46-4ee4-9aff-083f275b6f87', 0, 'Textile manufacturing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('910e9290-4604-48d9-b14e-84801bc34e0f', 'a8299143-fa46-4ee4-9aff-083f275b6f87', 1, 'Information Technology');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68072d44-56be-4864-9a16-2b9085529b45', 'a8299143-fa46-4ee4-9aff-083f275b6f87', 2, 'Automobile manufacturing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da4183f1-b737-4ec3-b192-55f3140be2d1', 'a8299143-fa46-4ee4-9aff-083f275b6f87', 3, 'Steel production');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a8299143-fa46-4ee4-9aff-083f275b6f87', '910e9290-4604-48d9-b14e-84801bc34e0f', 'Bengaluru hosts a major concentration of IT and software companies, earning it the nickname ''Silicon Valley of India''.', 'General Studies — authored from KPSC KAS''s own published Prelims syllabus (Karnataka history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official KPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c9dc5092-0aca-4b5f-94dd-6e798e22d01d', '04e9e539-ca12-4705-a9df-dfd16fe99bab', 5, 'The Indian Institute of Science (IISc), one of India''s premier research institutions, is located in:', 'General Studies', 'Science & Technology', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b64570c-5f3d-4302-93f7-17b80723b831', 'c9dc5092-0aca-4b5f-94dd-6e798e22d01d', 0, 'Mysuru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8493debe-04cf-4d13-930f-ad61f842f88c', 'c9dc5092-0aca-4b5f-94dd-6e798e22d01d', 1, 'Bengaluru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9854139e-7e13-4b55-a121-e9f420a9efd3', 'c9dc5092-0aca-4b5f-94dd-6e798e22d01d', 2, 'Mangaluru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e4762a4-ff1f-45aa-a778-a6a1258456be', 'c9dc5092-0aca-4b5f-94dd-6e798e22d01d', 3, 'Hubballi');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c9dc5092-0aca-4b5f-94dd-6e798e22d01d', '8493debe-04cf-4d13-930f-ad61f842f88c', 'IISc is located in Bengaluru, established in 1909, and remains one of India''s foremost research and higher-education institutions.', 'General Studies — authored from KPSC KAS''s own published Prelims syllabus (Karnataka history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official KPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5fb335ec-cacd-4bf0-bfa4-37323857fa3b', '04e9e539-ca12-4705-a9df-dfd16fe99bab', 6, 'Yakshagana, a traditional theatre form combining dance, music, and dialogue, is native to which region of Karnataka?', 'General Studies', 'Karnataka Culture', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02d2501d-8ca7-429e-897b-0044524d2c9f', '5fb335ec-cacd-4bf0-bfa4-37323857fa3b', 0, 'Coastal Karnataka (Karavali/Malnad)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c97b60b-53c5-4792-b644-294208de5271', '5fb335ec-cacd-4bf0-bfa4-37323857fa3b', 1, 'North Karnataka only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3a5153e-6dcb-4a63-9228-c56ac13a5df3', '5fb335ec-cacd-4bf0-bfa4-37323857fa3b', 2, 'Bengaluru urban region');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0cd18de0-d2a1-4853-874d-0341c04b86d1', '5fb335ec-cacd-4bf0-bfa4-37323857fa3b', 3, 'Kodagu exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5fb335ec-cacd-4bf0-bfa4-37323857fa3b', '02d2501d-8ca7-429e-897b-0044524d2c9f', 'Yakshagana is a traditional theatre form native to coastal Karnataka (Karavali) and the adjoining Malnad region.', 'General Studies — authored from KPSC KAS''s own published Prelims syllabus (Karnataka history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official KPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fbe8f1a1-e263-4e0c-99c7-1c21aa5f028f', '04e9e539-ca12-4705-a9df-dfd16fe99bab', 7, 'Which of the following best describes ''Repo Rate''?', 'General Studies', 'Indian Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95f596f9-76a4-480f-9bb0-c9183b824b42', 'fbe8f1a1-e263-4e0c-99c7-1c21aa5f028f', 0, 'The rate at which RBI lends to commercial banks');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb277020-d44f-4a5c-baad-e1ee5d50d1fa', 'fbe8f1a1-e263-4e0c-99c7-1c21aa5f028f', 1, 'The rate at which commercial banks lend to RBI');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2247d090-6cba-43be-a9f6-cddf6c0b7354', 'fbe8f1a1-e263-4e0c-99c7-1c21aa5f028f', 2, 'The interest rate on savings accounts');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aca17b59-1cb5-41de-a457-b7296a741b9a', 'fbe8f1a1-e263-4e0c-99c7-1c21aa5f028f', 3, 'The rate of GST on essential goods');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fbe8f1a1-e263-4e0c-99c7-1c21aa5f028f', '95f596f9-76a4-480f-9bb0-c9183b824b42', 'The Repo Rate is the rate at which the RBI lends short-term funds to commercial banks against government securities.', 'General Studies — authored from KPSC KAS''s own published Prelims syllabus (Karnataka history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official KPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('15884594-b655-41bf-94ea-571bc27913ad', '04e9e539-ca12-4705-a9df-dfd16fe99bab', 8, 'Karnataka''s state legislature, like Maharashtra''s, has which structure?', 'General Studies', 'Karnataka Polity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43671e88-5f33-463d-9251-60ec11cd15b0', '15884594-b655-41bf-94ea-571bc27913ad', 0, 'Unicameral (only Vidhan Sabha)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc90e19c-2193-49b0-b2a4-e242cba9ce22', '15884594-b655-41bf-94ea-571bc27913ad', 1, 'Bicameral (Vidhan Sabha and Vidhan Parishad)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a7d7f09-3318-43c3-8df4-d3ef4c4333dc', '15884594-b655-41bf-94ea-571bc27913ad', 2, 'Tricameral');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d5e3f1f-e62e-4f50-8155-f2800cec07a0', '15884594-b655-41bf-94ea-571bc27913ad', 3, 'No elected legislature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('15884594-b655-41bf-94ea-571bc27913ad', 'fc90e19c-2193-49b0-b2a4-e242cba9ce22', 'Karnataka has a bicameral legislature, with both a Legislative Assembly (Vidhan Sabha) and a Legislative Council (Vidhan Parishad).', 'General Studies — authored from KPSC KAS''s own published Prelims syllabus (Karnataka history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official KPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('97355834-bc67-458a-9a4f-c9e3c4311fa7', '04e9e539-ca12-4705-a9df-dfd16fe99bab', 9, 'The Kittur Rebellion (1824), an early armed uprising against British annexation, was led by:', 'General Studies', 'Karnataka History — Freedom Struggle', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eff67aa6-7bb5-434c-aedd-125b11543422', '97355834-bc67-458a-9a4f-c9e3c4311fa7', 0, 'Rani Chennamma');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bff2a4ee-14bd-44b3-888c-264e09f88114', '97355834-bc67-458a-9a4f-c9e3c4311fa7', 1, 'Rani Abbakka');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f12e4b7b-6235-4728-84e7-c6d255787a8a', '97355834-bc67-458a-9a4f-c9e3c4311fa7', 2, 'Onake Obavva');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('736b027b-9d68-4f0d-9c08-fcb8f6bd3cd2', '97355834-bc67-458a-9a4f-c9e3c4311fa7', 3, 'Kittur Chennabasavanna alone');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('97355834-bc67-458a-9a4f-c9e3c4311fa7', 'eff67aa6-7bb5-434c-aedd-125b11543422', 'Rani Chennamma of Kittur led an armed rebellion against the British East India Company in 1824, one of the earliest armed resistances to British rule in India.', 'General Studies — authored from KPSC KAS''s own published Prelims syllabus (Karnataka history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official KPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f549f928-2568-4239-993b-c17080730d94', '04e9e539-ca12-4705-a9df-dfd16fe99bab', 10, 'The ''Anna Bhagya'' scheme, providing free rice to below-poverty-line families, is a flagship initiative of which state government?', 'General Studies', 'Current Affairs — Schemes', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ccd0978a-5eb0-4820-be0b-983201d74302', 'f549f928-2568-4239-993b-c17080730d94', 0, 'Tamil Nadu');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce65d35b-5d7e-41d0-a902-0b43b1b6de50', 'f549f928-2568-4239-993b-c17080730d94', 1, 'Karnataka');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c2ac796-6353-4e8e-9ae2-41e0a328ff57', 'f549f928-2568-4239-993b-c17080730d94', 2, 'Andhra Pradesh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b87e513-1af0-4462-aa95-d70c03d3b215', 'f549f928-2568-4239-993b-c17080730d94', 3, 'Telangana');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f549f928-2568-4239-993b-c17080730d94', 'ce65d35b-5d7e-41d0-a902-0b43b1b6de50', 'Anna Bhagya is a Karnataka state government scheme providing free rice to BPL families.', 'General Studies — authored from KPSC KAS''s own published Prelims syllabus (Karnataka history/geography/economy/culture, Indian polity, economy, science & technology, current affairs); not copied from any official KPSC question paper.');
