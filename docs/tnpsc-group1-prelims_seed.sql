-- ============================================================
-- TNPSC Group I Prelims — Practice Paper 1
-- Full-Length Practice Paper (40 questions, 36 minutes)
-- Marking: +1.5 correct / -0 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 'tnpsc-group1-prelims-practice-1', 'TNPSC Group I Prelims Practice Paper 1', 'tnpsc-group1', ARRAY['TNPSC', 'Group I', 'Prelims', 'Tamil Nadu', 'Indian Polity', 'Economy', 'History', 'Aptitude']::TEXT[], 40, 'standard', true, 1, 36, 1.5, 0);

-- ── Section: General Studies (20 questions) — General Studies — authored from TNPSC Group I's own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('59a2c6dc-8910-44a7-a1a1-0432e0c89388', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 1, 'The Vandiyur Mariamman Teppakulam, a large temple tank, is located in which Tamil Nadu city?', 'General Studies', 'Tamil Nadu History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('409e516c-feb4-4b5c-b06d-9e23166db9d0', '59a2c6dc-8910-44a7-a1a1-0432e0c89388', 0, 'Madurai');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('660cc4d5-6d51-48f8-b3b9-411cbab09842', '59a2c6dc-8910-44a7-a1a1-0432e0c89388', 1, 'Thanjavur');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('566133f9-6dd0-4367-a104-15b7e6bb105b', '59a2c6dc-8910-44a7-a1a1-0432e0c89388', 2, 'Tiruchirappalli');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4bac74d-b895-4735-ba45-fc0f34616c38', '59a2c6dc-8910-44a7-a1a1-0432e0c89388', 3, 'Kanchipuram');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('59a2c6dc-8910-44a7-a1a1-0432e0c89388', '409e516c-feb4-4b5c-b06d-9e23166db9d0', 'The Vandiyur Mariamman Teppakulam is located in Madurai, built during the Nayak period and associated with the annual Teppam (float) Festival.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8334e7a4-0d63-4b87-bede-851a65c4a2ea', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 2, 'Under which Schedule of the Constitution are the powers, authority, and responsibilities of Panchayats specified?', 'General Studies', 'Indian Polity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55bd6e7f-d040-48a3-98f4-da5acf5b138a', '8334e7a4-0d63-4b87-bede-851a65c4a2ea', 0, 'Ninth Schedule');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8bf4e3ca-1f56-4602-9307-1be26bc084c9', '8334e7a4-0d63-4b87-bede-851a65c4a2ea', 1, 'Tenth Schedule');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b99ba38-425b-4014-99c7-89cb141d69ca', '8334e7a4-0d63-4b87-bede-851a65c4a2ea', 2, 'Eleventh Schedule');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b5e16a2-ddd0-410f-aabe-e7dbd811a8d9', '8334e7a4-0d63-4b87-bede-851a65c4a2ea', 3, 'Twelfth Schedule');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8334e7a4-0d63-4b87-bede-851a65c4a2ea', '9b99ba38-425b-4014-99c7-89cb141d69ca', 'The Eleventh Schedule (added by the 73rd Amendment) lists the 29 subjects within the purview of Panchayati Raj Institutions.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5ff9c686-8c84-43c9-82a9-c39b8a7ee6ad', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 3, 'The Vaikom Satyagraha (1924-25), a movement against untouchability and for temple-road access, took place in which present-day state?', 'General Studies', 'Modern History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aca93460-2474-4cb9-a731-62583a3e03af', '5ff9c686-8c84-43c9-82a9-c39b8a7ee6ad', 0, 'Tamil Nadu');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6f62ac7-e7e7-49ec-bbc8-6d4170f63342', '5ff9c686-8c84-43c9-82a9-c39b8a7ee6ad', 1, 'Kerala');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7538210b-be66-4e14-98b0-2f6c36143c51', '5ff9c686-8c84-43c9-82a9-c39b8a7ee6ad', 2, 'Karnataka');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('22e667e4-e661-46fa-aeec-caf6e003aaad', '5ff9c686-8c84-43c9-82a9-c39b8a7ee6ad', 3, 'Andhra Pradesh');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5ff9c686-8c84-43c9-82a9-c39b8a7ee6ad', 'c6f62ac7-e7e7-49ec-bbc8-6d4170f63342', 'The Vaikom Satyagraha took place in Vaikom, in present-day Kerala, protesting the ban on lower castes using roads near the Vaikom temple.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0e94a29c-3973-474b-b773-9ab67b3b76f0', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 4, 'Which Tamil Nadu city is often referred to as the ''Detroit of India'' due to its automobile manufacturing hub?', 'General Studies', 'Tamil Nadu Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20507c44-d392-4c88-9a6b-ab0a61c5fa46', '0e94a29c-3973-474b-b773-9ab67b3b76f0', 0, 'Coimbatore');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d4ffbf3-4596-41af-88b7-0e877b7e9f40', '0e94a29c-3973-474b-b773-9ab67b3b76f0', 1, 'Chennai');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c282f22c-743d-4edf-904e-3c1e3f081e5f', '0e94a29c-3973-474b-b773-9ab67b3b76f0', 2, 'Madurai');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7afd5dd4-b3ff-454a-b9d1-97a74f0d80cd', '0e94a29c-3973-474b-b773-9ab67b3b76f0', 3, 'Salem');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0e94a29c-3973-474b-b773-9ab67b3b76f0', '0d4ffbf3-4596-41af-88b7-0e877b7e9f40', 'Chennai hosts a major concentration of automobile manufacturing plants, earning it the nickname ''Detroit of India''.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('55e829ec-158b-4a5d-b198-9d2b7b897e74', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 5, 'The concept of ''Constitutional Morality'' has been particularly emphasized by the Supreme Court of India in judgments relating to which of the following?', 'General Studies', 'Indian Polity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd960653-c314-47bb-9aaf-7977369062f9', '55e829ec-158b-4a5d-b198-9d2b7b897e74', 0, 'Fundamental Rights interpretation broadly, including recent personal-liberty judgments');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4bcf497f-7b87-4392-b9b4-5d2295a4d4bd', '55e829ec-158b-4a5d-b198-9d2b7b897e74', 1, 'Only Directive Principles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c20b0e9-d9a5-48e0-b71e-e18bfae8e98b', '55e829ec-158b-4a5d-b198-9d2b7b897e74', 2, 'Only Fundamental Duties');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('920d0ae0-32eb-4fd4-92d1-57113af83efb', '55e829ec-158b-4a5d-b198-9d2b7b897e74', 3, 'Only Money Bills');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('55e829ec-158b-4a5d-b198-9d2b7b897e74', 'fd960653-c314-47bb-9aaf-7977369062f9', 'Constitutional morality — adherence to the Constitution''s core values even against popular sentiment — has been invoked by the Supreme Court in several landmark judgments expanding fundamental-rights interpretation.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8de88eff-e74f-4ae5-a506-1189dfbc1a1c', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 6, 'The Palar, Ponnaiyar, and Cauvery are all examples of which type of river system in Tamil Nadu?', 'General Studies', 'Geography of Tamil Nadu', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('602f8c8f-bad7-4d88-bd9e-a76c5287dfea', '8de88eff-e74f-4ae5-a506-1189dfbc1a1c', 0, 'West-flowing rivers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('389329ba-36bc-431b-a2b4-246be1ccc5b9', '8de88eff-e74f-4ae5-a506-1189dfbc1a1c', 1, 'East-flowing rivers originating in the Western Ghats');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cdfd70f-299d-4fbc-b4bc-774b0b15f9b2', '8de88eff-e74f-4ae5-a506-1189dfbc1a1c', 2, 'Rivers originating outside India');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('199dcb67-3f38-45b1-a2b1-9c5d772c3263', '8de88eff-e74f-4ae5-a506-1189dfbc1a1c', 3, 'Glacier-fed Himalayan rivers');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8de88eff-e74f-4ae5-a506-1189dfbc1a1c', '389329ba-36bc-431b-a2b4-246be1ccc5b9', 'Palar, Ponnaiyar, and Cauvery are all east-flowing peninsular rivers originating in the Western Ghats, draining into the Bay of Bengal.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('838bf51f-5da9-4501-890d-0bef0d9e8286', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 7, 'ISRO''s Satish Dhawan Space Centre, the country''s primary satellite launch site, is located at:', 'General Studies', 'Science & Technology', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78e84528-1ce0-45e7-a7d3-4f6bd15a9a2c', '838bf51f-5da9-4501-890d-0bef0d9e8286', 0, 'Thumba, Kerala');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f89f1ed9-0505-43e5-af0d-d7fe852c755e', '838bf51f-5da9-4501-890d-0bef0d9e8286', 1, 'Sriharikota, Andhra Pradesh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2492c53-7202-4ef6-be06-295cf01d9a73', '838bf51f-5da9-4501-890d-0bef0d9e8286', 2, 'Bengaluru, Karnataka');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb972dcb-a10a-4d38-83b3-49152a5a92ac', '838bf51f-5da9-4501-890d-0bef0d9e8286', 3, 'Mahendragiri, Tamil Nadu');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('838bf51f-5da9-4501-890d-0bef0d9e8286', 'f89f1ed9-0505-43e5-af0d-d7fe852c755e', 'The Satish Dhawan Space Centre is located at Sriharikota, Andhra Pradesh, though ISRO also has a major liquid-propulsion testing facility at Mahendragiri, Tamil Nadu.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c83a6a38-6c20-49b6-b922-ac1d58b360cb', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 8, 'The Self-Respect Movement, which challenged caste hierarchy and Brahmanical dominance in Tamil society, was founded by:', 'General Studies', 'Modern History — Tamil Nadu', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('470508b9-1324-40ce-851f-3ed8beb65692', 'c83a6a38-6c20-49b6-b922-ac1d58b360cb', 0, 'C. N. Annadurai');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d092348-3ed8-4ac6-9e1d-1b73d8fd06b9', 'c83a6a38-6c20-49b6-b922-ac1d58b360cb', 1, 'Periyar E. V. Ramasamy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8a3fb9f-e6fc-4b63-8c1c-b8edcd77cf62', 'c83a6a38-6c20-49b6-b922-ac1d58b360cb', 2, 'Kamaraj');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37487402-6c6a-4c44-ab93-55b5b39e97c3', 'c83a6a38-6c20-49b6-b922-ac1d58b360cb', 3, 'V. O. Chidambaram Pillai');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c83a6a38-6c20-49b6-b922-ac1d58b360cb', '8d092348-3ed8-4ac6-9e1d-1b73d8fd06b9', 'Periyar E. V. Ramasamy founded the Self-Respect Movement in 1925, a foundational influence on Dravidian politics in Tamil Nadu.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d472e0cc-6db6-4d44-ace3-fb9529d61a7b', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 9, 'The Goods and Services Tax (GST) Council, which recommends GST rates and rules, is chaired by:', 'General Studies', 'Indian Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f313fb6-165d-424a-aaac-c49a053ce6b3', 'd472e0cc-6db6-4d44-ace3-fb9529d61a7b', 0, 'The Prime Minister');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f4332e7-c76b-449e-b59e-933ac6042a28', 'd472e0cc-6db6-4d44-ace3-fb9529d61a7b', 1, 'The Finance Minister of India');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69df2285-3377-4a67-9e5d-c7b8d9dd3740', 'd472e0cc-6db6-4d44-ace3-fb9529d61a7b', 2, 'The RBI Governor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd42b9fd-8937-41b7-be3b-5d7d9ee589f0', 'd472e0cc-6db6-4d44-ace3-fb9529d61a7b', 3, 'The Chief Economic Advisor');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d472e0cc-6db6-4d44-ace3-fb9529d61a7b', '2f4332e7-c76b-449e-b59e-933ac6042a28', 'The GST Council is chaired by the Union Finance Minister, with state finance ministers as members.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ae21b7cd-593a-45cc-89f4-0a9c7bf075c4', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 10, 'The ''Ease of Doing Business'' rankings, historically published by the World Bank, assessed countries on parameters including:', 'General Studies', 'Current Affairs — Governance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b38dad0-c4b7-4796-b50e-17faef043ed5', 'ae21b7cd-593a-45cc-89f4-0a9c7bf075c4', 0, 'Only tax rates');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c4d504d-e99e-49cc-b100-df7b7746ec17', 'ae21b7cd-593a-45cc-89f4-0a9c7bf075c4', 1, 'Starting a business, construction permits, credit access, contract enforcement, among others');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('368b5605-ecc0-4d46-af54-aa6d25b7b5bb', 'ae21b7cd-593a-45cc-89f4-0a9c7bf075c4', 2, 'Only labor law flexibility');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77418ed3-3065-4123-91d5-a72788c254b4', 'ae21b7cd-593a-45cc-89f4-0a9c7bf075c4', 3, 'Only foreign investment caps');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ae21b7cd-593a-45cc-89f4-0a9c7bf075c4', '5c4d504d-e99e-49cc-b100-df7b7746ec17', 'The Ease of Doing Business index assessed multiple parameters including starting a business, construction permits, getting credit, and contract enforcement, among others.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('74bc0145-477a-4810-ac5c-72bb2b19a4f4', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 11, 'Bharatanatyam, one of India''s oldest classical dance forms, originated in which state''s temple tradition?', 'General Studies', 'Tamil Nadu Culture', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35ce1edd-0957-4475-b9cd-7ec5aac5f2ba', '74bc0145-477a-4810-ac5c-72bb2b19a4f4', 0, 'Kerala');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4189b612-9563-42f0-ba5e-1a893e064da5', '74bc0145-477a-4810-ac5c-72bb2b19a4f4', 1, 'Tamil Nadu');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fdbe8c94-4e54-4b71-9fb9-6b6b1b32fa1e', '74bc0145-477a-4810-ac5c-72bb2b19a4f4', 2, 'Odisha');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b7b3e4b-14cf-46c7-ae21-638ed74a5716', '74bc0145-477a-4810-ac5c-72bb2b19a4f4', 3, 'Andhra Pradesh');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('74bc0145-477a-4810-ac5c-72bb2b19a4f4', '4189b612-9563-42f0-ba5e-1a893e064da5', 'Bharatanatyam originated in Tamil Nadu''s temple dance tradition (Sadir), later codified and popularized in the 20th century.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5ae4d1b8-54de-4e2e-83a9-1a1733477c7b', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 12, 'Under which Article can the President declare a National Emergency on grounds of war, external aggression, or armed rebellion?', 'General Studies', 'Indian Polity — Emergency Provisions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8595f4c-5e8a-4c20-8168-5571d70c9113', '5ae4d1b8-54de-4e2e-83a9-1a1733477c7b', 0, 'Article 352');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07cd8411-4c11-47b3-85bf-1303bd6a114a', '5ae4d1b8-54de-4e2e-83a9-1a1733477c7b', 1, 'Article 356');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf1ddf06-5292-4fa1-91ed-c11518c4a2ae', '5ae4d1b8-54de-4e2e-83a9-1a1733477c7b', 2, 'Article 360');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9af7ab5-4cf3-467f-9851-80f5c260daed', '5ae4d1b8-54de-4e2e-83a9-1a1733477c7b', 3, 'Article 368');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5ae4d1b8-54de-4e2e-83a9-1a1733477c7b', 'c8595f4c-5e8a-4c20-8168-5571d70c9113', 'Article 352 provides for the President''s declaration of a National Emergency on grounds of war, external aggression, or armed rebellion.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('def98681-1959-4090-aee4-a198918e03d8', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 13, 'Tamil Nadu receives a significant share of its annual rainfall from which monsoon, unlike most of the rest of India?', 'General Studies', 'Geography — Climate', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ee5a406-d92b-44bf-8310-37155bc45499', 'def98681-1959-4090-aee4-a198918e03d8', 0, 'Southwest monsoon only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d65a271c-bced-4770-82cd-127c378f794e', 'def98681-1959-4090-aee4-a198918e03d8', 1, 'Northeast monsoon (retreating monsoon)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('769cc838-a0b0-4591-9d6d-3a65413290e2', 'def98681-1959-4090-aee4-a198918e03d8', 2, 'Western disturbances');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a52a0db6-8109-48f7-8761-45917a93de1e', 'def98681-1959-4090-aee4-a198918e03d8', 3, 'No monsoon influence at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('def98681-1959-4090-aee4-a198918e03d8', 'd65a271c-bced-4770-82cd-127c378f794e', 'Unlike most of India (which depends primarily on the southwest monsoon), Tamil Nadu receives a substantial share of its rainfall from the Northeast (retreating) monsoon, October-December.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('238cd0ee-6532-4bc2-8624-8b73950b9132', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 14, 'The Champaran Satyagraha (1917), Gandhi''s first major civil disobedience campaign in India, addressed the grievances of which group?', 'General Studies', 'Modern History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b108dbb0-c8ea-48d8-a4a6-eafd929aa41a', '238cd0ee-6532-4bc2-8624-8b73950b9132', 0, 'Salt traders');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2983256-b157-4a47-8421-9a76c97b9fe2', '238cd0ee-6532-4bc2-8624-8b73950b9132', 1, 'Indigo cultivators');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8a81aac-47d6-45a6-9ab7-0f40d09800c3', '238cd0ee-6532-4bc2-8624-8b73950b9132', 2, 'Textile mill workers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08a9f1ef-73e7-45c0-b3e0-68c32d39f8b8', '238cd0ee-6532-4bc2-8624-8b73950b9132', 3, 'Railway employees');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('238cd0ee-6532-4bc2-8624-8b73950b9132', 'c2983256-b157-4a47-8421-9a76c97b9fe2', 'The Champaran Satyagraha addressed the exploitative conditions faced by indigo cultivators in Bihar under British planters.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6ab09934-98f3-41d5-90b0-43660a59d4d8', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 15, 'NITI Aayog, which replaced the Planning Commission in 2015, functions primarily as a:', 'General Studies', 'Indian Economy — Planning', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33a53db0-dbc7-47c3-95e7-47d400f7cd72', '6ab09934-98f3-41d5-90b0-43660a59d4d8', 0, 'Statutory financial regulator');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('561be94d-967d-4f98-beac-377031bdb00c', '6ab09934-98f3-41d5-90b0-43660a59d4d8', 1, 'Policy think tank and advisory body');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90ea1604-5ca1-4a5e-9029-ea54a3ec1da3', '6ab09934-98f3-41d5-90b0-43660a59d4d8', 2, 'Constitutional body with veto power over state budgets');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cae5866e-0481-47db-9109-b8f3a1cc7c9f', '6ab09934-98f3-41d5-90b0-43660a59d4d8', 3, 'Judicial appellate body');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6ab09934-98f3-41d5-90b0-43660a59d4d8', '561be94d-967d-4f98-beac-377031bdb00c', 'NITI Aayog functions as a policy think tank and advisory body to the government, unlike the Planning Commission''s more directive, fund-allocating role.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8ea64009-2e2e-4806-ad52-b3b592910bc0', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 16, 'The ''Amma Unavagam'' initiative, a subsidized meal scheme launched in Tamil Nadu, primarily provides:', 'General Studies', 'Tamil Nadu Government Schemes', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86ea827a-a564-4181-bd66-3bb22fc18644', '8ea64009-2e2e-4806-ad52-b3b592910bc0', 0, 'Free school uniforms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43c01349-cdba-4846-bf31-d8234b43a77d', '8ea64009-2e2e-4806-ad52-b3b592910bc0', 1, 'Subsidized nutritious meals to the public at low cost');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8c9a51d-c382-4c26-9114-4ece05a14450', '8ea64009-2e2e-4806-ad52-b3b592910bc0', 2, 'Free healthcare checkups');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e03c6d1-6779-490a-8016-379c81a1df00', '8ea64009-2e2e-4806-ad52-b3b592910bc0', 3, 'Housing subsidies');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8ea64009-2e2e-4806-ad52-b3b592910bc0', '43c01349-cdba-4846-bf31-d8234b43a77d', 'Amma Unavagam (''Amma Canteens'') provided subsidized, hygienic meals to the general public at very low cost, a flagship Tamil Nadu welfare initiative.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9aa1f2dd-388a-4c64-b67c-b9b9da5fa783', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 17, 'India''s indigenous GPS-equivalent satellite navigation system is called:', 'General Studies', 'Science & Technology', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('108d3f26-64a1-46aa-801a-5a2bd4a47895', '9aa1f2dd-388a-4c64-b67c-b9b9da5fa783', 0, 'INSAT');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c0e5ee0-a10b-4bb9-ba90-5e8ffab5158f', '9aa1f2dd-388a-4c64-b67c-b9b9da5fa783', 1, 'NavIC');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da835c00-404e-4bed-9f68-8af308459a60', '9aa1f2dd-388a-4c64-b67c-b9b9da5fa783', 2, 'IRNSS-Only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5430470f-984d-4f1a-b674-160ab43e42f0', '9aa1f2dd-388a-4c64-b67c-b9b9da5fa783', 3, 'GAGAN-Prime');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9aa1f2dd-388a-4c64-b67c-b9b9da5fa783', '2c0e5ee0-a10b-4bb9-ba90-5e8ffab5158f', 'NavIC (Navigation with Indian Constellation), built on the IRNSS satellite constellation, is India''s own regional satellite navigation system.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('339aefe8-2760-4f18-aea2-c4f3fc01adcd', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 18, 'Public Interest Litigation (PIL) in India allows:', 'General Studies', 'Indian Polity — Judiciary', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c69f149-fc67-44c2-baa1-910e13142dc8', '339aefe8-2760-4f18-aea2-c4f3fc01adcd', 0, 'Only the aggrieved party to approach courts');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a9a9a08-69f8-441c-b9f5-0e0129c41e06', '339aefe8-2760-4f18-aea2-c4f3fc01adcd', 1, 'Any public-spirited citizen to approach courts on behalf of those unable to do so themselves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ff89559-b1d0-4fde-be54-58f1e2958c18', '339aefe8-2760-4f18-aea2-c4f3fc01adcd', 2, 'Only government bodies to file cases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12c2e136-84d7-4527-96e6-449ce2244620', '339aefe8-2760-4f18-aea2-c4f3fc01adcd', 3, 'Only registered NGOs to file cases');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('339aefe8-2760-4f18-aea2-c4f3fc01adcd', '6a9a9a08-69f8-441c-b9f5-0e0129c41e06', 'PIL relaxed the traditional standing requirement, allowing any public-spirited person or organization to approach courts on behalf of those unable to access justice themselves.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a69c8d44-263e-404a-b57b-c30ecfbc8bb3', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 19, 'The Nilgiri Biosphere Reserve, one of India''s first biosphere reserves, spans parts of Tamil Nadu, Kerala, and which other state?', 'General Studies', 'Geography — Tamil Nadu', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5dcd2113-51db-4244-9908-803329e9147a', 'a69c8d44-263e-404a-b57b-c30ecfbc8bb3', 0, 'Andhra Pradesh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('931295bd-4837-4614-b417-1eabf9065251', 'a69c8d44-263e-404a-b57b-c30ecfbc8bb3', 1, 'Karnataka');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f8097b5-4812-4fa1-a1ba-7ec377be2451', 'a69c8d44-263e-404a-b57b-c30ecfbc8bb3', 2, 'Telangana');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8f3df29-fb92-444f-8e57-a8a9c849f069', 'a69c8d44-263e-404a-b57b-c30ecfbc8bb3', 3, 'Goa');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a69c8d44-263e-404a-b57b-c30ecfbc8bb3', '931295bd-4837-4614-b417-1eabf9065251', 'The Nilgiri Biosphere Reserve spans parts of Tamil Nadu, Kerala, and Karnataka, covering the Western Ghats'' Nilgiri hill range.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4d1b0807-831b-4af7-829e-28c2f75cc3d0', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 20, 'V. O. Chidambaram Pillai, a prominent Tamil freedom fighter, is particularly remembered for founding:', 'General Studies', 'Modern History — Freedom Struggle', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1dfb5ab6-df9d-4314-941a-f9ca5aa77d63', '4d1b0807-831b-4af7-829e-28c2f75cc3d0', 0, 'The Swadeshi Steam Navigation Company');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca4cd417-4c9b-4ad4-8fda-0c3f5f935882', '4d1b0807-831b-4af7-829e-28c2f75cc3d0', 1, 'The Indian National Army');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4629e0c-577c-496a-a984-1ddc42a86130', '4d1b0807-831b-4af7-829e-28c2f75cc3d0', 2, 'The Ghadar Party');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec7d1e47-cdf3-4dd1-a197-371f2399a22d', '4d1b0807-831b-4af7-829e-28c2f75cc3d0', 3, 'The Home Rule League');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4d1b0807-831b-4af7-829e-28c2f75cc3d0', '1dfb5ab6-df9d-4314-941a-f9ca5aa77d63', 'V. O. Chidambaram Pillai founded the Swadeshi Steam Navigation Company (1906) to compete with British shipping monopolies, a significant swadeshi-era economic initiative.', 'General Studies — authored from TNPSC Group I''s own published Prelims syllabus (Indian Polity, Indian Economy, Modern History of India, Tamil Nadu History & Culture, Geography, Science & Technology, Current Affairs); not copied from any official TNPSC question paper.');

-- ── Section: Aptitude and Mental Ability (20 questions) — Aptitude & Mental Ability — authored from TNPSC's own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d9378788-9d45-4620-87b9-d1de77f13a50', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 21, 'If 30% of a number is 90, what is 60% of the same number?', 'Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5d1f087-1090-4a27-987a-3e9bbecb5d25', 'd9378788-9d45-4620-87b9-d1de77f13a50', 0, '150');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ba066ef-9f9c-4940-8556-5d74725fb0f2', 'd9378788-9d45-4620-87b9-d1de77f13a50', 1, '160');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01d8ae64-113b-49e3-bbbe-b5bf65e285c6', 'd9378788-9d45-4620-87b9-d1de77f13a50', 2, '170');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4975a0c8-613e-42ea-bac1-cc742634b9fd', 'd9378788-9d45-4620-87b9-d1de77f13a50', 3, '180');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d9378788-9d45-4620-87b9-d1de77f13a50', '4975a0c8-613e-42ea-bac1-cc742634b9fd', '30% of x=90 means x=300; 60% of 300=180.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1da7c057-a2b3-4e9e-ba42-bf4483c62c3c', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 22, 'Simplify: 25 × 4 − 15 ÷ 3', 'Aptitude', 'Simplification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57c9673b-8195-43a9-b947-1bb656601733', '1da7c057-a2b3-4e9e-ba42-bf4483c62c3c', 0, '90');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4afbdf9a-ecc9-476e-9103-f5bd275c72dc', '1da7c057-a2b3-4e9e-ba42-bf4483c62c3c', 1, '95');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2aab3e8-223c-46ce-87b4-e9709a525294', '1da7c057-a2b3-4e9e-ba42-bf4483c62c3c', 2, '100');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97790c7c-f983-474b-877f-1c6e6bb65890', '1da7c057-a2b3-4e9e-ba42-bf4483c62c3c', 3, '105');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1da7c057-a2b3-4e9e-ba42-bf4483c62c3c', '4afbdf9a-ecc9-476e-9103-f5bd275c72dc', '25×4=100; 15/3=5; 100−5=95.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6519b6ca-db94-4ac5-a8fa-783d00e0c102', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 23, 'Find the LCM of 15 and 20.', 'Aptitude', 'HCF and LCM', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2b540af-8d6c-493a-ac9f-5abfe5fe6fcf', '6519b6ca-db94-4ac5-a8fa-783d00e0c102', 0, '30');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa972c39-cb53-40c9-91df-506a340fd90b', '6519b6ca-db94-4ac5-a8fa-783d00e0c102', 1, '45');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('430303f4-f137-441f-b48c-25056af9e77a', '6519b6ca-db94-4ac5-a8fa-783d00e0c102', 2, '60');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ba4f612-9ec9-4a37-9d21-7eadc5c4d7bc', '6519b6ca-db94-4ac5-a8fa-783d00e0c102', 3, '75');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6519b6ca-db94-4ac5-a8fa-783d00e0c102', '430303f4-f137-441f-b48c-25056af9e77a', 'Multiples of 15: 15,30,45,60; multiples of 20: 20,40,60 — LCM=60.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('50f0f903-964e-4352-89b1-e0fe951d560a', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 24, 'If the ratio of two numbers is 5:7 and their sum is 144, find the larger number.', 'Aptitude', 'Ratio and Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8f78df9-8733-4cdf-adb2-f7c82f9b2ffb', '50f0f903-964e-4352-89b1-e0fe951d560a', 0, '60');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d60e3b65-febd-4777-b541-3ae42718bec7', '50f0f903-964e-4352-89b1-e0fe951d560a', 1, '72');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c85ec7f-0cb5-4fcd-a618-bcedf26e0929', '50f0f903-964e-4352-89b1-e0fe951d560a', 2, '84');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de7cf550-8360-468e-a19b-18f9b04decd8', '50f0f903-964e-4352-89b1-e0fe951d560a', 3, '90');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('50f0f903-964e-4352-89b1-e0fe951d560a', '8c85ec7f-0cb5-4fcd-a618-bcedf26e0929', 'Total parts=5+7=12; larger number = (7/12)×144 = 84.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('df271e1b-6039-4252-91e4-4d638d93f199', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 25, 'Find the simple interest on ₹4000 at 6% per annum for 2 years.', 'Aptitude', 'Simple Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d58bb98f-599e-486b-aca4-a293aa9a0f8a', 'df271e1b-6039-4252-91e4-4d638d93f199', 0, '₹360');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02ae22da-965a-4cb1-8eec-a2eb9d4a0133', 'df271e1b-6039-4252-91e4-4d638d93f199', 1, '₹420');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('132972d5-a8ec-48c2-83cc-c2dcea3da771', 'df271e1b-6039-4252-91e4-4d638d93f199', 2, '₹480');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfa63e9b-0858-41b3-b0c1-64d0d4f1de25', 'df271e1b-6039-4252-91e4-4d638d93f199', 3, '₹540');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('df271e1b-6039-4252-91e4-4d638d93f199', '132972d5-a8ec-48c2-83cc-c2dcea3da771', 'SI = (P×R×T)/100 = (4000×6×2)/100 = ₹480.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9c09f362-617b-42e4-a781-8637f666b889', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 26, 'A can finish a job in 8 days, B in 12 days. Together, how many days will they take?', 'Aptitude', 'Time and Work', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('884613d7-c59b-4509-aeb5-fead6cddf46c', '9c09f362-617b-42e4-a781-8637f666b889', 0, '4.5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a106378c-cd5a-4c6c-9c63-2f64e0790993', '9c09f362-617b-42e4-a781-8637f666b889', 1, '4.8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f1afc44-c85a-4418-9bad-e9032eb833bf', '9c09f362-617b-42e4-a781-8637f666b889', 2, '5.2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42ca744d-07ca-4483-9f74-d6304c69270e', '9c09f362-617b-42e4-a781-8637f666b889', 3, '5.6');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9c09f362-617b-42e4-a781-8637f666b889', 'a106378c-cd5a-4c6c-9c63-2f64e0790993', 'Combined rate = 1/8+1/12 = 3/24+2/24=5/24 per day; time = 24/5 = 4.8 days.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ff07734b-b143-4477-8ab5-0332d1038c4f', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 27, 'Find the area of a rectangle with length 14m and breadth 9m.', 'Aptitude', 'Mensuration', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7f32bb7-bd98-49d4-9e64-0219db90c673', 'ff07734b-b143-4477-8ab5-0332d1038c4f', 0, '112 sq m');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4fba9d86-831e-4e1f-a31c-79cf423f6fcf', 'ff07734b-b143-4477-8ab5-0332d1038c4f', 1, '126 sq m');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76c1c51c-a740-437d-8827-35b45a4e4f7b', 'ff07734b-b143-4477-8ab5-0332d1038c4f', 2, '136 sq m');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e370a4f-94c9-4c1f-bf62-77ce2b5492cf', 'ff07734b-b143-4477-8ab5-0332d1038c4f', 3, '144 sq m');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ff07734b-b143-4477-8ab5-0332d1038c4f', '4fba9d86-831e-4e1f-a31c-79cf423f6fcf', 'Area = length × breadth = 14×9 = 126 sq m.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('893028c9-c2f2-4c12-8695-9648ca153ff7', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 28, 'Find the average of 12, 18, 24, 30, and 36.', 'Aptitude', 'Average', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d7a14f4-3ac8-4be4-bc53-f858c3863204', '893028c9-c2f2-4c12-8695-9648ca153ff7', 0, '22');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45bca9dd-5b7e-4e95-9e57-cb60ef0223bb', '893028c9-c2f2-4c12-8695-9648ca153ff7', 1, '24');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4325d8e6-25e4-4641-a2fa-d7aedda05a1b', '893028c9-c2f2-4c12-8695-9648ca153ff7', 2, '26');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a900469-8c41-48e7-ba6a-75088fa8d562', '893028c9-c2f2-4c12-8695-9648ca153ff7', 3, '28');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('893028c9-c2f2-4c12-8695-9648ca153ff7', '45bca9dd-5b7e-4e95-9e57-cb60ef0223bb', 'Sum = 12+18+24+30+36=120; average = 120/5=24.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ef5fb1d0-ffe8-402f-9fc6-02970797d8d5', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 29, 'Find the compound interest on ₹5000 at 8% per annum for 2 years, compounded annually.', 'Aptitude', 'Compound Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76228f09-b164-4850-b0fd-1d6ef123edcd', 'ef5fb1d0-ffe8-402f-9fc6-02970797d8d5', 0, '₹800');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f22e05c-091a-411b-b695-b5ce91eb642d', 'ef5fb1d0-ffe8-402f-9fc6-02970797d8d5', 1, '₹832');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7ee7f75-aaa6-4d4e-ae87-2e19de8399aa', 'ef5fb1d0-ffe8-402f-9fc6-02970797d8d5', 2, '₹850');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebfb7f58-a694-435b-a39f-487ed7c36182', 'ef5fb1d0-ffe8-402f-9fc6-02970797d8d5', 3, '₹864');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ef5fb1d0-ffe8-402f-9fc6-02970797d8d5', '4f22e05c-091a-411b-b695-b5ce91eb642d', 'Amount = 5000×(1.08)² = 5000×1.1664 = ₹5832; CI = 5832−5000 = ₹832.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('62d84359-4968-4b76-8049-16e072f4b1ea', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 30, 'A cyclist covers 45km in 3 hours. What is the speed in km/h?', 'Aptitude', 'Speed, Distance, Time', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be0a4ffa-08c1-4224-ab9b-fe26f357e0b2', '62d84359-4968-4b76-8049-16e072f4b1ea', 0, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c68be748-abdc-45c6-956d-adb4cbfc2da3', '62d84359-4968-4b76-8049-16e072f4b1ea', 1, '13');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('065d5c8f-21c5-42f6-8d77-3295fb3c9e9b', '62d84359-4968-4b76-8049-16e072f4b1ea', 2, '14');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05537e3c-7b19-4505-876c-0ba2d122f96f', '62d84359-4968-4b76-8049-16e072f4b1ea', 3, '15');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('62d84359-4968-4b76-8049-16e072f4b1ea', '05537e3c-7b19-4505-876c-0ba2d122f96f', 'Speed = distance/time = 45/3 = 15 km/h.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b26d3411-7f4a-4e13-b94e-94b0a38081e0', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 31, 'Find the next term: 4, 9, 16, 25, 36, ?', 'Aptitude', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f458c83a-d16e-4198-8abb-a4cc4ca651cf', 'b26d3411-7f4a-4e13-b94e-94b0a38081e0', 0, '42');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6021078-daef-4941-9e41-fbfe10cc6a21', 'b26d3411-7f4a-4e13-b94e-94b0a38081e0', 1, '45');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e25b8410-e12c-4c0f-8791-85043eb740ed', 'b26d3411-7f4a-4e13-b94e-94b0a38081e0', 2, '49');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a11e40d7-802e-4c7e-8d55-46b8fb9cf397', 'b26d3411-7f4a-4e13-b94e-94b0a38081e0', 3, '52');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b26d3411-7f4a-4e13-b94e-94b0a38081e0', 'e25b8410-e12c-4c0f-8791-85043eb740ed', 'These are perfect squares (2²,3²,4²,5²,6²); next is 7²=49.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2eff1923-fc77-4097-823f-0e922b9406a0', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 32, 'An item bought for ₹500 is sold for ₹575. What is the profit percentage?', 'Aptitude', 'Profit and Loss', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd59222f-103d-49ec-b11b-97c777b0f4a7', '2eff1923-fc77-4097-823f-0e922b9406a0', 0, '12%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b38f5631-15ab-4db3-b2f9-981c20b0a195', '2eff1923-fc77-4097-823f-0e922b9406a0', 1, '15%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69b034bf-4ed8-4091-93c0-e08e31cf2674', '2eff1923-fc77-4097-823f-0e922b9406a0', 2, '18%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39761207-0fd0-412f-9c00-235b2fa0e10a', '2eff1923-fc77-4097-823f-0e922b9406a0', 3, '20%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2eff1923-fc77-4097-823f-0e922b9406a0', 'b38f5631-15ab-4db3-b2f9-981c20b0a195', 'Profit = 575−500=75; profit% = (75/500)×100 = 15%.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('75822c15-2f36-4eb3-b6a8-4b4b9bc16fb5', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 33, 'If A is B''s father and C is A''s mother, how is C related to B?', 'Aptitude', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0f4c82b-3af9-4cd1-b5ea-0047aa7bda06', '75822c15-2f36-4eb3-b6a8-4b4b9bc16fb5', 0, 'Mother');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06e2df13-ddef-4221-9b0f-1cde8c83d47b', '75822c15-2f36-4eb3-b6a8-4b4b9bc16fb5', 1, 'Grandmother');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c03807f1-272c-439e-8c85-41b38e7b1ec1', '75822c15-2f36-4eb3-b6a8-4b4b9bc16fb5', 2, 'Aunt');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2f23751-8766-4929-bbf1-534aa2e91860', '75822c15-2f36-4eb3-b6a8-4b4b9bc16fb5', 3, 'Sister');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('75822c15-2f36-4eb3-b6a8-4b4b9bc16fb5', '06e2df13-ddef-4221-9b0f-1cde8c83d47b', 'C is A''s mother, and A is B''s father — so C is B''s paternal grandmother.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('03b34ed8-3f32-4b2d-91e5-aeadd7540acb', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 34, 'A person walks 5km east, then 5km south. What is the shortest distance to the starting point?', 'Aptitude', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('055a6d23-a86e-4065-a21e-e32cedb07545', '03b34ed8-3f32-4b2d-91e5-aeadd7540acb', 0, '5√2 km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74d855f8-afc5-48df-b058-8897118d8794', '03b34ed8-3f32-4b2d-91e5-aeadd7540acb', 1, '10km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('671fdb66-ce6b-4ed7-8c49-24278035a324', '03b34ed8-3f32-4b2d-91e5-aeadd7540acb', 2, '7.5km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f297465a-d3c6-44eb-bf92-bce97e6a410e', '03b34ed8-3f32-4b2d-91e5-aeadd7540acb', 3, '5km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('03b34ed8-3f32-4b2d-91e5-aeadd7540acb', '055a6d23-a86e-4065-a21e-e32cedb07545', 'This forms a right triangle with equal legs of 5km; distance = sqrt(5²+5²) = 5√2 km ≈ 7.07km.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('aab7cad2-5b63-4b70-acb3-2210beef808a', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 35, 'If in a code, CAT is written as DBU (each letter shifted forward by 1), how is DOG written?', 'Aptitude', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0ba6a08-97d0-48ad-b526-2ed7e753ad91', 'aab7cad2-5b63-4b70-acb3-2210beef808a', 0, 'EPH');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70f351f1-4e7e-47bf-b288-bd4d3a69ec28', 'aab7cad2-5b63-4b70-acb3-2210beef808a', 1, 'EPI');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6950dfcc-31de-47cb-b59c-c6478e06753b', 'aab7cad2-5b63-4b70-acb3-2210beef808a', 2, 'FPH');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f34fa3bc-cb83-498d-890a-683b5dbd3c98', 'aab7cad2-5b63-4b70-acb3-2210beef808a', 3, 'EOH');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aab7cad2-5b63-4b70-acb3-2210beef808a', 'a0ba6a08-97d0-48ad-b526-2ed7e753ad91', 'Shifting each letter forward by 1: D→E, O→P, G→H, giving EPH.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fb78324f-1dff-4e2a-ad7f-80bb97f55f8e', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 36, 'What is the smallest number that, when divided by 4, 5, and 6, leaves a remainder of 3 in each case?', 'Aptitude', 'Number System', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('955ac58f-57d2-4755-b1ed-bc7c4631d5ea', 'fb78324f-1dff-4e2a-ad7f-80bb97f55f8e', 0, '60');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f78f6f4-b550-41e6-bd56-acfe5a74a0ba', 'fb78324f-1dff-4e2a-ad7f-80bb97f55f8e', 1, '63');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a3189cb-fd1d-49a8-b4da-9f54a87a55b9', 'fb78324f-1dff-4e2a-ad7f-80bb97f55f8e', 2, '65');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67019ec0-4871-4349-af4e-09442bbc06a9', 'fb78324f-1dff-4e2a-ad7f-80bb97f55f8e', 3, '67');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fb78324f-1dff-4e2a-ad7f-80bb97f55f8e', '3f78f6f4-b550-41e6-bd56-acfe5a74a0ba', 'LCM of 4,5,6 = 60; adding the common remainder 3 gives 63.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d601a5be-9d92-490d-9129-98e902590369', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 37, 'Find the area of a circle with radius 14cm (use π=22/7).', 'Aptitude', 'Mensuration — Circle', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac38db1c-4d95-40f0-a52b-b1d7cc14ab84', 'd601a5be-9d92-490d-9129-98e902590369', 0, '576 sq cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f1b743f-aace-43c8-bbc4-ef3859138968', 'd601a5be-9d92-490d-9129-98e902590369', 1, '600 sq cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4183bc7-a72f-4206-ab47-2a2798976872', 'd601a5be-9d92-490d-9129-98e902590369', 2, '616 sq cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13b874fb-2992-40f9-bc79-d92a72ff8a02', 'd601a5be-9d92-490d-9129-98e902590369', 3, '630 sq cm');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d601a5be-9d92-490d-9129-98e902590369', 'c4183bc7-a72f-4206-ab47-2a2798976872', 'Area = πr² = (22/7)×14×14 = 616 sq cm.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d326fd9b-3407-4675-9ae3-0a3485d801ac', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 38, 'In a queue of 50 people, a person is 22nd from the front. What is his position from the back?', 'Aptitude', 'Ranking', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5128cfb9-5db2-469f-b75a-b6c10ade94f8', 'd326fd9b-3407-4675-9ae3-0a3485d801ac', 0, '28');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3918124-4b56-4b42-9ee7-3ed02f5cfd0c', 'd326fd9b-3407-4675-9ae3-0a3485d801ac', 1, '29');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13e7f4c8-90ee-4c21-b9b1-b3e48ba5ab44', 'd326fd9b-3407-4675-9ae3-0a3485d801ac', 2, '30');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1973f34-f2f6-406b-9763-2362fc8ff22d', 'd326fd9b-3407-4675-9ae3-0a3485d801ac', 3, '31');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d326fd9b-3407-4675-9ae3-0a3485d801ac', 'c3918124-4b56-4b42-9ee7-3ed02f5cfd0c', 'Position from back = total − position from front + 1 = 50−22+1 = 29.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0cf54316-555a-4c1e-b167-176021dcea27', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 39, 'A price is increased by 25% and then decreased by 20%. What is the net percentage change?', 'Aptitude', 'Percentage — Successive', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('082a209c-3f26-436a-9ba2-78c9696760dc', '0cf54316-555a-4c1e-b167-176021dcea27', 0, 'No change');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36e9314c-0cbd-45b6-bfd2-6d36ca2f140a', '0cf54316-555a-4c1e-b167-176021dcea27', 1, '5% increase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb36271f-5d8a-4250-8080-7fabb581a5b7', '0cf54316-555a-4c1e-b167-176021dcea27', 2, '5% decrease');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96496b39-8830-4836-b2de-df5f01ee724f', '0cf54316-555a-4c1e-b167-176021dcea27', 3, '2% increase');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0cf54316-555a-4c1e-b167-176021dcea27', '082a209c-3f26-436a-9ba2-78c9696760dc', 'Net change = 25 − 20 − (25×20)/100 = 5 − 5 = 0% — no net change.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3687242b-4c0d-4a1f-b27f-eed2e121ad89', '56db6c75-4c2a-4245-8bb5-a8b05403c6d2', 40, 'A father is 4 times as old as his son. After 5 years, the father will be 3 times as old as the son. Find the son''s present age.', 'Aptitude', 'Age Puzzle', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8fae54a3-a81c-422f-9eec-26a5228e2daa', '3687242b-4c0d-4a1f-b27f-eed2e121ad89', 0, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('426ce4e6-d8c7-4a54-9463-33062e006275', '3687242b-4c0d-4a1f-b27f-eed2e121ad89', 1, '10');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9493bdfb-607e-4397-a8be-0c7389924cd2', '3687242b-4c0d-4a1f-b27f-eed2e121ad89', 2, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c97b8e5-dc0c-4ecc-9e08-d20e95263f1d', '3687242b-4c0d-4a1f-b27f-eed2e121ad89', 3, '14');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3687242b-4c0d-4a1f-b27f-eed2e121ad89', '426ce4e6-d8c7-4a54-9463-33062e006275', 'Let son=x, father=4x. After 5 years: 4x+5=3(x+5) → 4x+5=3x+15 → x=10.', 'Aptitude & Mental Ability — authored from TNPSC''s own published SSLC-level aptitude syllabus (simplification, percentage, HCF/LCM, ratio-proportion, simple/compound interest, time-work, mensuration); not copied from any official TNPSC question paper.');
