-- ============================================================
-- SSC CGL Tier 1 — Full Mock Paper 1
-- Full-Length Practice Paper (100 questions, 60 minutes)
-- Marking: +2 correct / -0.5 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('7c9e6022-c2df-4c55-904c-2555a17cf2e9', 'ssc-cgl-tier1-practice-1', 'SSC CGL Tier 1 Full Mock Paper 1', 'ssc-cgl', ARRAY['Reasoning', 'General Awareness', 'Quantitative Aptitude', 'English', 'SSC CGL', 'Tier 1']::TEXT[], 100, 'mixed', true, 1, 60, 2, 0.5);

-- ── Section: General Intelligence & Reasoning (25 questions) — Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b99f16f5-8776-4bb3-9bbd-33214bcbed22', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 1, 'Find the odd one out: Mango, Banana, Potato, Orange', 'Reasoning', 'Classification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64420b7f-51c2-4614-8c14-e01dd10e1634', 'b99f16f5-8776-4bb3-9bbd-33214bcbed22', 0, 'Mango');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('56438fd0-3566-4103-bbed-02e0921f0e69', 'b99f16f5-8776-4bb3-9bbd-33214bcbed22', 1, 'Banana');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c2e310e-4388-4386-8962-d59b96ee631c', 'b99f16f5-8776-4bb3-9bbd-33214bcbed22', 2, 'Potato');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80f88999-2778-49c4-aee0-4d7ce447b1cd', 'b99f16f5-8776-4bb3-9bbd-33214bcbed22', 3, 'Orange');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b99f16f5-8776-4bb3-9bbd-33214bcbed22', '7c2e310e-4388-4386-8962-d59b96ee631c', 'Potato is a vegetable; the other three are fruits.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('677166b3-f5e8-42be-a02b-229252fb9444', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 2, 'Doctor : Hospital :: Teacher : ?', 'Reasoning', 'Analogy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2678ac15-8d7d-4d2d-a535-4c67f8065e97', '677166b3-f5e8-42be-a02b-229252fb9444', 0, 'Student');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5793145-940d-4712-8f76-ebbee587b6b0', '677166b3-f5e8-42be-a02b-229252fb9444', 1, 'School');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9930f1a-8a09-47bd-b69b-4aec11a85edf', '677166b3-f5e8-42be-a02b-229252fb9444', 2, 'Book');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d30ceef1-2cba-4127-91f8-4f6043b199f5', '677166b3-f5e8-42be-a02b-229252fb9444', 3, 'Class');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('677166b3-f5e8-42be-a02b-229252fb9444', 'e5793145-940d-4712-8f76-ebbee587b6b0', 'A doctor''s characteristic workplace is a hospital; a teacher''s characteristic workplace is a school.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('32cb7428-6ab5-4aa9-ae76-d8f2ecb66a99', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 3, 'Find the next term: 2, 6, 12, 20, 30, ?', 'Reasoning', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1dde16f9-d1b5-4fa6-979a-5a13442b0db0', '32cb7428-6ab5-4aa9-ae76-d8f2ecb66a99', 0, '36');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4114e2f3-ea51-4e19-bf93-4a389793fbd9', '32cb7428-6ab5-4aa9-ae76-d8f2ecb66a99', 1, '40');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d84db63e-50a8-4cd2-82d4-80a84ffdd0fb', '32cb7428-6ab5-4aa9-ae76-d8f2ecb66a99', 2, '42');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db2196aa-26a7-439e-baae-418d28352a38', '32cb7428-6ab5-4aa9-ae76-d8f2ecb66a99', 3, '44');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('32cb7428-6ab5-4aa9-ae76-d8f2ecb66a99', 'd84db63e-50a8-4cd2-82d4-80a84ffdd0fb', 'Differences are 4, 6, 8, 10, 12 — each pair of consecutive integers multiplied (1x2, 2x3, 3x4...). Next term = 30+12=42.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6f7bc0c3-b700-424f-a42f-652a22ae4d28', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 4, 'Find the next term: AZ, BY, CX, DW, ?', 'Reasoning', 'Letter Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f04ca36-2346-4492-9faf-564ddd54fb39', '6f7bc0c3-b700-424f-a42f-652a22ae4d28', 0, 'EV');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26755783-6b46-43ec-a9b8-d864083c3c91', '6f7bc0c3-b700-424f-a42f-652a22ae4d28', 1, 'EU');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('270940e9-35dc-449c-9925-27bb9944cd0f', '6f7bc0c3-b700-424f-a42f-652a22ae4d28', 2, 'FV');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64ad97fd-c4cb-4112-9f08-d411521f7828', '6f7bc0c3-b700-424f-a42f-652a22ae4d28', 3, 'FU');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6f7bc0c3-b700-424f-a42f-652a22ae4d28', '2f04ca36-2346-4492-9faf-564ddd54fb39', 'First letters go forward A,B,C,D,E; second letters go backward Z,Y,X,W,V. Next: EV.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b82f8f8b-35f7-4f5f-bff4-ea375c209021', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 5, 'If CAT is coded as DBU, how is DOG coded?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('112f4961-2135-43e1-b26d-4cec8a1b841f', 'b82f8f8b-35f7-4f5f-bff4-ea375c209021', 0, 'EPH');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf15b1f4-91ea-4558-9c50-80639c849d2f', 'b82f8f8b-35f7-4f5f-bff4-ea375c209021', 1, 'EPI');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb1bfbde-fdde-4108-a17d-f72e56e73e0a', 'b82f8f8b-35f7-4f5f-bff4-ea375c209021', 2, 'FPH');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce8db654-ef61-4c9b-8fc8-c018a8a4f59f', 'b82f8f8b-35f7-4f5f-bff4-ea375c209021', 3, 'EOH');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b82f8f8b-35f7-4f5f-bff4-ea375c209021', '112f4961-2135-43e1-b26d-4cec8a1b841f', 'Each letter shifts forward by 1: D->E, O->P, G->H, giving EPH.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7d3448a0-8b80-44b4-8bb0-bedac0f5e7e0', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 6, 'Pointing to a man, a woman said, ''His mother is the only daughter of my mother.'' How is the man related to the woman?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41072580-23f2-441d-af6e-b94f50513d4d', '7d3448a0-8b80-44b4-8bb0-bedac0f5e7e0', 0, 'Son');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bee65f56-3ad1-4d69-bd9d-accd224d4485', '7d3448a0-8b80-44b4-8bb0-bedac0f5e7e0', 1, 'Brother');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb41069e-4ec1-48e0-844e-7002a9e84e6c', '7d3448a0-8b80-44b4-8bb0-bedac0f5e7e0', 2, 'Nephew');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d4661f5-5046-472e-b173-831d9c09ec9b', '7d3448a0-8b80-44b4-8bb0-bedac0f5e7e0', 3, 'Father');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7d3448a0-8b80-44b4-8bb0-bedac0f5e7e0', '41072580-23f2-441d-af6e-b94f50513d4d', '''Only daughter of my mother'' = the woman herself. So the man''s mother is the woman, meaning the man is her son.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('12f9e860-4977-46e3-bd90-792351db90d7', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 7, 'A man walks 5km north, then 3km east, then 5km south. How far is he from the starting point?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16f30681-90ee-4fa3-a315-a37abc233e11', '12f9e860-4977-46e3-bd90-792351db90d7', 0, '3km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09804a0f-f05b-46a4-a564-eb2749662808', '12f9e860-4977-46e3-bd90-792351db90d7', 1, '5km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2add1b26-b031-402e-8009-734fbaa0725b', '12f9e860-4977-46e3-bd90-792351db90d7', 2, '8km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('358d42b2-14ad-4b14-953e-7278d51ef933', '12f9e860-4977-46e3-bd90-792351db90d7', 3, '13km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('12f9e860-4977-46e3-bd90-792351db90d7', '16f30681-90ee-4fa3-a315-a37abc233e11', 'The 5km north and 5km south cancel out, leaving only the 3km east displacement.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('040ea95a-8ba3-40ab-ab6e-ed81acff8dae', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 8, 'Statement: All pens are pencils. Conclusion: Some pencils are pens. Is the conclusion valid?', 'Reasoning', 'Venn Diagram / Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('159a2739-b3f0-4141-b2fd-4b3c17f2141e', '040ea95a-8ba3-40ab-ab6e-ed81acff8dae', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90b82b28-d6c5-4539-884f-185a1672b1c5', '040ea95a-8ba3-40ab-ab6e-ed81acff8dae', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('566d2989-5dde-4d54-a408-6250f7c7aa0d', '040ea95a-8ba3-40ab-ab6e-ed81acff8dae', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60cf25c0-2d44-4255-a3c6-45e76f81937a', '040ea95a-8ba3-40ab-ab6e-ed81acff8dae', 3, 'Only valid if reversed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('040ea95a-8ba3-40ab-ab6e-ed81acff8dae', '159a2739-b3f0-4141-b2fd-4b3c17f2141e', 'If the entire ''pens'' set lies inside ''pencils'', then at least some pencils (the pen ones) are pens — ''All A are B'' always yields ''Some B are A''.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('05192027-ff36-47d8-b7cd-4a22b9f1f6a4', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 9, 'In a 3x3 magic square where every row, column, and diagonal sums to 15, what is the value of the middle cell?', 'Reasoning', 'Matrix', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4133ba72-cbbf-4401-873d-500364c1fe45', '05192027-ff36-47d8-b7cd-4a22b9f1f6a4', 0, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e89b278e-daa7-4ab5-b97e-02a420e6ca1e', '05192027-ff36-47d8-b7cd-4a22b9f1f6a4', 1, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee9508d6-910a-44a7-ae00-ae03a7c4174a', '05192027-ff36-47d8-b7cd-4a22b9f1f6a4', 2, '7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b3a6852-9380-4ff3-be9b-a8a0a1d67d2a', '05192027-ff36-47d8-b7cd-4a22b9f1f6a4', 3, '9');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('05192027-ff36-47d8-b7cd-4a22b9f1f6a4', 'e89b278e-daa7-4ab5-b97e-02a420e6ca1e', 'For a classic 3x3 magic square, the middle cell always equals total/3 = 15/3 = 5.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7daf6eee-9087-465e-9556-acc2b5ac3967', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 10, 'Which number does not belong: 4, 9, 16, 20, 25, 36', 'Reasoning', 'Series and Analogy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46c77178-56a6-4b97-b3d2-f2695973106a', '7daf6eee-9087-465e-9556-acc2b5ac3967', 0, '16');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('000b80e0-0622-4f19-9369-8c22ae3eb695', '7daf6eee-9087-465e-9556-acc2b5ac3967', 1, '20');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('305d26e4-6d4a-44c1-9991-c99818b3b141', '7daf6eee-9087-465e-9556-acc2b5ac3967', 2, '25');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87cca4dc-8433-4382-bb48-926b40c08471', '7daf6eee-9087-465e-9556-acc2b5ac3967', 3, '36');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7daf6eee-9087-465e-9556-acc2b5ac3967', '000b80e0-0622-4f19-9369-8c22ae3eb695', 'All others are perfect squares (2^2, 3^2, 4^2, 5^2, 6^2); 20 is not a perfect square.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7d3e8768-9787-4916-8ca4-7ebb7aefb9f9', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 11, 'Find the odd one out: Triangle, Square, Circle, Cube', 'Reasoning', 'Classification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f38f5d7c-1039-4354-9ccd-cb9202440654', '7d3e8768-9787-4916-8ca4-7ebb7aefb9f9', 0, 'Triangle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9c099b6-4ef5-433b-bfc6-c08e4e550922', '7d3e8768-9787-4916-8ca4-7ebb7aefb9f9', 1, 'Square');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ee35a9c-dc6c-4569-8be9-56b0b4b1c878', '7d3e8768-9787-4916-8ca4-7ebb7aefb9f9', 2, 'Circle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('962e63d4-e559-4a16-a1f3-e8f2e1972d3d', '7d3e8768-9787-4916-8ca4-7ebb7aefb9f9', 3, 'Cube');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7d3e8768-9787-4916-8ca4-7ebb7aefb9f9', '962e63d4-e559-4a16-a1f3-e8f2e1972d3d', 'Triangle, Square, and Circle are 2D shapes; Cube is a 3D shape.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6aeb7a84-9580-4fad-88e5-22de2cd8a6c0', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 12, 'Author : Book :: Sculptor : ?', 'Reasoning', 'Analogy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35148268-ed66-4c3d-9d3c-0957fb014618', '6aeb7a84-9580-4fad-88e5-22de2cd8a6c0', 0, 'Chisel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1ebaaa9-3f6a-46f9-bfdb-fcdfc9c67287', '6aeb7a84-9580-4fad-88e5-22de2cd8a6c0', 1, 'Statue');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e57dfa77-a832-4c8b-9773-fa04935fe6e2', '6aeb7a84-9580-4fad-88e5-22de2cd8a6c0', 2, 'Marble');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6036fb3d-63d9-495b-a387-dc3cca95d9e9', '6aeb7a84-9580-4fad-88e5-22de2cd8a6c0', 3, 'Museum');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6aeb7a84-9580-4fad-88e5-22de2cd8a6c0', 'b1ebaaa9-3f6a-46f9-bfdb-fcdfc9c67287', 'An author creates a book; a sculptor creates a statue — the relationship is creator to created work, not creator to tool.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bd7960bf-74f8-406f-9123-60884f46fa95', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 13, 'Find the wrong term: 3, 8, 15, 24, 34, 48', 'Reasoning', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a10c20b4-6cbc-48eb-a6e7-a2ae47b6d431', 'bd7960bf-74f8-406f-9123-60884f46fa95', 0, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69435ab5-0917-4ed7-9cf9-29a4d75ba87c', 'bd7960bf-74f8-406f-9123-60884f46fa95', 1, '15');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('977adb27-48f8-4355-9b7e-e3ae869917c0', 'bd7960bf-74f8-406f-9123-60884f46fa95', 2, '34');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58207af5-73a6-47ed-a6d3-437d41aa243c', 'bd7960bf-74f8-406f-9123-60884f46fa95', 3, '48');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bd7960bf-74f8-406f-9123-60884f46fa95', '977adb27-48f8-4355-9b7e-e3ae869917c0', 'The differences between consecutive terms should be consecutive odd numbers: 5, 7, 9, 11, 13, giving the correct series 3, 8, 15, 24, 35, 48. The given series has 34 instead of 35, making 34 the wrong term.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b72865ef-8fd3-482f-8eca-1db04d77c1b2', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 14, 'Find the missing term: B, D, G, K, ?', 'Reasoning', 'Letter Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe1889ec-6a9f-44b8-b48d-2e7c0a62c2a6', 'b72865ef-8fd3-482f-8eca-1db04d77c1b2', 0, 'N');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24e00e03-6aa9-4216-b7f1-eee962c21309', 'b72865ef-8fd3-482f-8eca-1db04d77c1b2', 1, 'O');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('131e900f-fede-4be7-8317-62c5d5fcd807', 'b72865ef-8fd3-482f-8eca-1db04d77c1b2', 2, 'P');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c7df56b-32e7-47dc-8d78-a60581a77144', 'b72865ef-8fd3-482f-8eca-1db04d77c1b2', 3, 'Q');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b72865ef-8fd3-482f-8eca-1db04d77c1b2', '131e900f-fede-4be7-8317-62c5d5fcd807', 'Position values: B=2, D=4, G=7, K=11. Gaps increase by 1 each time: +2, +3, +4, so next gap is +5, giving 11+5=16, which is the letter P.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('96603083-58aa-4470-badf-f86b7729da68', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 15, 'In a certain code, MONEY is written as NPOFZ. How is SMART written?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17c7d51e-8d64-4fe2-bda1-9a39338d4bed', '96603083-58aa-4470-badf-f86b7729da68', 0, 'TNBSU');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27fc0a30-6a8b-4368-a198-e98388de1ede', '96603083-58aa-4470-badf-f86b7729da68', 1, 'TNBTU');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2773373-3496-42a9-a498-a2b5d267ebe9', '96603083-58aa-4470-badf-f86b7729da68', 2, 'TMBSU');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('753c0b7d-45b3-4b3c-8974-8666cec6f703', '96603083-58aa-4470-badf-f86b7729da68', 3, 'TNBSV');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('96603083-58aa-4470-badf-f86b7729da68', '17c7d51e-8d64-4fe2-bda1-9a39338d4bed', 'Each letter shifts forward by 1: S->T, M->N, A->B, R->S, T->U, giving TNBSU.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4f9a582f-e3a5-4e11-b141-adca0bd755f2', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 16, 'A is B''s brother. C is B''s mother. D is C''s father. How is A related to D?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a785268-3831-460c-8bed-8fb729e7927e', '4f9a582f-e3a5-4e11-b141-adca0bd755f2', 0, 'Grandson');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfd6f305-f261-4c0b-accd-d26ce7705f6a', '4f9a582f-e3a5-4e11-b141-adca0bd755f2', 1, 'Son');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('121591cc-0334-4dda-b58c-2a248c32c6dd', '4f9a582f-e3a5-4e11-b141-adca0bd755f2', 2, 'Brother');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6eb68d8c-5924-4a88-b773-3fef9012eb72', '4f9a582f-e3a5-4e11-b141-adca0bd755f2', 3, 'Nephew');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4f9a582f-e3a5-4e11-b141-adca0bd755f2', '2a785268-3831-460c-8bed-8fb729e7927e', 'C is A''s mother (since A and B are siblings sharing mother C). D is C''s father, i.e., A''s maternal grandfather. So A is D''s grandson.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a89b6e84-d494-4364-927b-51f0fa89f4f8', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 17, 'Facing north, a person turns 90 degrees clockwise, then 180 degrees. Which direction does he now face?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80159a17-cab4-4ee3-b351-cb131a41ac2a', 'a89b6e84-d494-4364-927b-51f0fa89f4f8', 0, 'North');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('238fedb5-99e9-4909-af7d-cecd24935e54', 'a89b6e84-d494-4364-927b-51f0fa89f4f8', 1, 'South');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49c7b9f2-afc7-4293-bd89-eb35bbcc98e1', 'a89b6e84-d494-4364-927b-51f0fa89f4f8', 2, 'East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3261338f-0039-4c4d-9873-8e5dd53e2c75', 'a89b6e84-d494-4364-927b-51f0fa89f4f8', 3, 'West');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a89b6e84-d494-4364-927b-51f0fa89f4f8', '3261338f-0039-4c4d-9873-8e5dd53e2c75', 'North -> 90 clockwise -> East -> 180 degrees -> West.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('557b8296-8df4-49e8-9c50-02f991b85277', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 18, 'Statement: No cat is a dog. Conclusion: No dog is a cat. Is this valid?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d687d622-bfb1-400b-9a91-6aec5c49616a', '557b8296-8df4-49e8-9c50-02f991b85277', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d627d2a-53bc-4acb-8d33-677e2cf696aa', '557b8296-8df4-49e8-9c50-02f991b85277', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e20e273d-37a4-47e8-a33a-c9d70a947a61', '557b8296-8df4-49e8-9c50-02f991b85277', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('595ceab0-bc73-43fc-9b66-d6727071a1da', '557b8296-8df4-49e8-9c50-02f991b85277', 3, 'Only partially valid');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('557b8296-8df4-49e8-9c50-02f991b85277', 'd687d622-bfb1-400b-9a91-6aec5c49616a', 'A Universal Negative statement is symmetric: ''No A is B'' is logically equivalent to ''No B is A''.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('33c26a81-fb32-4760-a0f0-b774a795763e', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 19, 'Complete the matrix pattern: Row 1: 2,4,6 | Row 2: 3,6,9 | Row 3: 4,8,?', 'Reasoning', 'Matrix', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e235bb55-ab75-4e13-843f-6c70b6411206', '33c26a81-fb32-4760-a0f0-b774a795763e', 0, '10');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('664fc059-4c3b-420f-bfbf-29536535cbb4', '33c26a81-fb32-4760-a0f0-b774a795763e', 1, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc151935-4962-4644-9574-25f9055e446d', '33c26a81-fb32-4760-a0f0-b774a795763e', 2, '14');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97899030-5cf7-4012-ae58-aa82eed40f42', '33c26a81-fb32-4760-a0f0-b774a795763e', 3, '16');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('33c26a81-fb32-4760-a0f0-b774a795763e', '664fc059-4c3b-420f-bfbf-29536535cbb4', 'Each row follows n, 2n, 3n where n is the row-starting number: Row 3 starts at 4, so 4, 8, 12.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5d0e834a-83db-44ac-925a-8a5dc085dd0b', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 20, 'Petrol : Car :: Food : ?', 'Reasoning', 'Series and Analogy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6e1041e-eb9f-4d3d-bdc1-427d4c31bc4f', '5d0e834a-83db-44ac-925a-8a5dc085dd0b', 0, 'Plate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04b9eede-83bc-4529-bfd2-01bc40f1ee1e', '5d0e834a-83db-44ac-925a-8a5dc085dd0b', 1, 'Human');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc595c66-e508-477b-8778-8b255af0d817', '5d0e834a-83db-44ac-925a-8a5dc085dd0b', 2, 'Kitchen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90ef6276-7e3b-4417-8deb-598903945a9d', '5d0e834a-83db-44ac-925a-8a5dc085dd0b', 3, 'Hunger');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5d0e834a-83db-44ac-925a-8a5dc085dd0b', '04b9eede-83bc-4529-bfd2-01bc40f1ee1e', 'Petrol is fuel for a car; food is fuel (energy source) for a human — the relationship is fuel-to-machine/organism.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5305b063-de5e-49ee-b130-08ffa1b3b835', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 21, 'If a mirror is placed to the right of the word ''SSC'', what will its mirror image show?', 'Reasoning', 'Non-Verbal / Pattern', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7ae8369-39c5-47c8-be32-452bfbccfc9c', '5305b063-de5e-49ee-b130-08ffa1b3b835', 0, 'SSC (unchanged)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a24acbd-9684-43f3-ba0d-cf0942e71340', '5305b063-de5e-49ee-b130-08ffa1b3b835', 1, 'CSS');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9e24a3b-f8d5-4c01-a34e-e980a24c851f', '5305b063-de5e-49ee-b130-08ffa1b3b835', 2, 'The letters reversed in order and laterally inverted');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13e5a269-ef1c-4b6e-9330-c010f1f6004e', '5305b063-de5e-49ee-b130-08ffa1b3b835', 3, 'SCS');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5305b063-de5e-49ee-b130-08ffa1b3b835', 'a9e24a3b-f8d5-4c01-a34e-e980a24c851f', 'A mirror image reverses the order of characters left-to-right AND flips each character laterally — so ''SSC'' becomes a laterally-inverted ''CSS'' shape, not simply reordered.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('77b380ba-5007-40ad-8a17-47d4cce9ea21', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 22, 'Find the odd one out: Delhi, Mumbai, Kolkata, Rajasthan', 'Reasoning', 'Classification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e20d39a-be9d-4deb-a1d8-8f991577aa58', '77b380ba-5007-40ad-8a17-47d4cce9ea21', 0, 'Delhi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9287cf1b-5cff-417a-967e-448ec027cf79', '77b380ba-5007-40ad-8a17-47d4cce9ea21', 1, 'Mumbai');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6dff6ac5-9814-4aca-b7ed-7c3f0f58d807', '77b380ba-5007-40ad-8a17-47d4cce9ea21', 2, 'Kolkata');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7130b17c-d4e3-402a-bbad-c369a3109c5f', '77b380ba-5007-40ad-8a17-47d4cce9ea21', 3, 'Rajasthan');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('77b380ba-5007-40ad-8a17-47d4cce9ea21', '7130b17c-d4e3-402a-bbad-c369a3109c5f', 'Delhi, Mumbai, and Kolkata are cities; Rajasthan is a state.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0c83680a-7199-4888-9f3a-d6a39692f2c9', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 23, 'Find the next term: 1, 4, 9, 16, 25, ?', 'Reasoning', 'Number Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93db0bb7-8b5f-4499-acb7-eaddcccf55a3', '0c83680a-7199-4888-9f3a-d6a39692f2c9', 0, '30');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ffc5af1b-2832-4f88-bc0e-4776253aa33f', '0c83680a-7199-4888-9f3a-d6a39692f2c9', 1, '32');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eec97679-7cde-4ad6-aef2-41ec9708fa6c', '0c83680a-7199-4888-9f3a-d6a39692f2c9', 2, '36');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63418774-a1ac-4900-af6c-c8e9e30c8629', '0c83680a-7199-4888-9f3a-d6a39692f2c9', 3, '49');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0c83680a-7199-4888-9f3a-d6a39692f2c9', 'eec97679-7cde-4ad6-aef2-41ec9708fa6c', 'The series is perfect squares: 1^2, 2^2, 3^2, 4^2, 5^2, so next is 6^2=36.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7867e460-de4b-4a31-a65d-0813fccfe0ca', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 24, 'In a code, if ''A=1, B=2, C=3...Z=26'', what is the code for the word ''CAB''?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b5a24bc-5252-45a5-a306-ba6128388b77', '7867e460-de4b-4a31-a65d-0813fccfe0ca', 0, '3-1-2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('095c4860-7ceb-49d7-b190-ed50c4e7a4df', '7867e460-de4b-4a31-a65d-0813fccfe0ca', 1, '3-2-1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce654466-b660-4af7-986e-b5958603607f', '7867e460-de4b-4a31-a65d-0813fccfe0ca', 2, '1-2-3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6ebc101-91bf-4f1d-b3da-4ac82b0d014a', '7867e460-de4b-4a31-a65d-0813fccfe0ca', 3, '2-1-3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7867e460-de4b-4a31-a65d-0813fccfe0ca', '0b5a24bc-5252-45a5-a306-ba6128388b77', 'C=3, A=1, B=2, so CAB codes to 3-1-2.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('93a0024e-3bdf-43a8-9545-2ea2e6ef0779', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 25, 'A person walks 4km east, then 3km north. How far is he from the starting point?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef0fc9ad-3aa0-4588-b1a9-dc432e56a64c', '93a0024e-3bdf-43a8-9545-2ea2e6ef0779', 0, '5km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8cce2edb-57aa-487b-90e0-4a5fdb1ca65e', '93a0024e-3bdf-43a8-9545-2ea2e6ef0779', 1, '7km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33e92c76-4d8a-4bb7-9697-5e71328ce4ac', '93a0024e-3bdf-43a8-9545-2ea2e6ef0779', 2, '1km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9b9348c-137c-454d-a6ca-cb3e4d4836e0', '93a0024e-3bdf-43a8-9545-2ea2e6ef0779', 3, '12km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('93a0024e-3bdf-43a8-9545-2ea2e6ef0779', 'ef0fc9ad-3aa0-4588-b1a9-dc432e56a64c', 'This forms a right triangle with legs 4 and 3; displacement = sqrt(4^2+3^2) = sqrt(25) = 5km.', 'Reasoning & General Intelligence — authored from standard SSC CGL Tier 1 reasoning topics (classification, analogy, series, coding-decoding, blood relations, direction sense, Venn diagrams, matrix); not copied from any official SSC question paper.');

-- ── Section: General Awareness (25 questions) — General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4098686a-bd1c-4aac-be70-275fc09bdacf', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 26, 'Who was the founder of the Mauryan Empire?', 'General Awareness', 'Indian History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6803fe6b-d345-4472-a062-9f1e6401d9af', '4098686a-bd1c-4aac-be70-275fc09bdacf', 0, 'Ashoka');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4bdab1bd-95a1-4380-8f9c-41b8c0471242', '4098686a-bd1c-4aac-be70-275fc09bdacf', 1, 'Chandragupta Maurya');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba24cab1-8c15-4c68-9d07-d276ca80ab71', '4098686a-bd1c-4aac-be70-275fc09bdacf', 2, 'Bindusara');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('740a18ff-4760-4282-bdb3-3d57b6c920bf', '4098686a-bd1c-4aac-be70-275fc09bdacf', 3, 'Samudragupta');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4098686a-bd1c-4aac-be70-275fc09bdacf', '4bdab1bd-95a1-4380-8f9c-41b8c0471242', 'Chandragupta Maurya founded the Mauryan Empire around 321 BCE.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('555cc554-22fb-49c3-ba00-4a44157141d7', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 27, 'Which Article of the Indian Constitution deals with the Right to Equality?', 'General Awareness', 'Indian Polity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19fd99da-336b-445e-9e58-994cc86f77b5', '555cc554-22fb-49c3-ba00-4a44157141d7', 0, 'Article 14');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0016ab4-c057-4c46-a472-45dc8521372a', '555cc554-22fb-49c3-ba00-4a44157141d7', 1, 'Article 19');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cff78455-3d8c-41cc-9960-b04320b2739e', '555cc554-22fb-49c3-ba00-4a44157141d7', 2, 'Article 21');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('debde3a9-5ac0-40e2-9b1b-156a5aa38e5a', '555cc554-22fb-49c3-ba00-4a44157141d7', 3, 'Article 32');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('555cc554-22fb-49c3-ba00-4a44157141d7', '19fd99da-336b-445e-9e58-994cc86f77b5', 'Article 14 guarantees equality before the law and equal protection of the laws.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c9046141-d527-461e-99fa-cc05b90a771b', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 28, 'Which is the longest river in India?', 'General Awareness', 'Geography', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd5d702f-ef98-482d-98cc-abb8eba416bf', 'c9046141-d527-461e-99fa-cc05b90a771b', 0, 'Yamuna');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('185379b8-72da-4839-8da2-5f2329589703', 'c9046141-d527-461e-99fa-cc05b90a771b', 1, 'Godavari');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8cdaefe3-350f-4894-823a-63f6e2bb96bf', 'c9046141-d527-461e-99fa-cc05b90a771b', 2, 'Ganga');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98e8ec94-b54f-4f8e-bc68-c06dc56eec7e', 'c9046141-d527-461e-99fa-cc05b90a771b', 3, 'Brahmaputra');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c9046141-d527-461e-99fa-cc05b90a771b', '8cdaefe3-350f-4894-823a-63f6e2bb96bf', 'The Ganga is the longest river flowing entirely within India, at approximately 2,525 km.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ecd7f63b-48fa-451e-b796-bc03734a3b0c', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 29, 'Who is the apex regulatory body for the banking sector in India?', 'General Awareness', 'Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f13a470e-1da8-43ff-b742-a97c5704a57b', 'ecd7f63b-48fa-451e-b796-bc03734a3b0c', 0, 'SEBI');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9353508-a012-4200-bdc7-0ebfbac7cd5e', 'ecd7f63b-48fa-451e-b796-bc03734a3b0c', 1, 'RBI');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0bec7f46-2f3e-404a-8475-aaa2766c914b', 'ecd7f63b-48fa-451e-b796-bc03734a3b0c', 2, 'IRDAI');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9fd8f55-a6f0-41ad-98f2-736c6e332d75', 'ecd7f63b-48fa-451e-b796-bc03734a3b0c', 3, 'NABARD');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ecd7f63b-48fa-451e-b796-bc03734a3b0c', 'f9353508-a012-4200-bdc7-0ebfbac7cd5e', 'The Reserve Bank of India (RBI) regulates the banking sector in India.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7f064c78-9f93-48da-b78a-d98a1ff33be8', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 30, 'What is the SI unit of electric current?', 'General Awareness', 'Science - Physics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb37d24d-dd18-4e9d-ba76-100dabeb1792', '7f064c78-9f93-48da-b78a-d98a1ff33be8', 0, 'Volt');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1aedfda7-ebde-4b46-90e2-f30166017183', '7f064c78-9f93-48da-b78a-d98a1ff33be8', 1, 'Watt');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4383f7a8-a39f-4234-acd5-f2fef6e2660d', '7f064c78-9f93-48da-b78a-d98a1ff33be8', 2, 'Ampere');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2975662e-b8ae-4dd2-a4d2-fe517fc736de', '7f064c78-9f93-48da-b78a-d98a1ff33be8', 3, 'Ohm');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7f064c78-9f93-48da-b78a-d98a1ff33be8', '4383f7a8-a39f-4234-acd5-f2fef6e2660d', 'The ampere (A) is the SI base unit of electric current.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('08af29bc-81b1-4e3c-aecf-6e77668b3e62', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 31, 'Bharat Ratna is which category of award?', 'General Awareness', 'Static GK - Awards', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('686daaed-bd8e-4136-98d6-9b79edb8ce0b', '08af29bc-81b1-4e3c-aecf-6e77668b3e62', 0, 'Sports award');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30064c93-e649-4e61-9f52-43c67903748f', '08af29bc-81b1-4e3c-aecf-6e77668b3e62', 1, 'Highest civilian award');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46a7bc2c-b01c-429d-baf4-4416832dba41', '08af29bc-81b1-4e3c-aecf-6e77668b3e62', 2, 'Military award');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6389215c-b3d5-4e37-a472-efd495d95c70', '08af29bc-81b1-4e3c-aecf-6e77668b3e62', 3, 'Literary award');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('08af29bc-81b1-4e3c-aecf-6e77668b3e62', '30064c93-e649-4e61-9f52-43c67903748f', 'The Bharat Ratna is India''s highest civilian award.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f5e2fd33-7358-4c2f-a760-14b7a6c5cdec', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 32, 'The Quit India Movement was launched in which year?', 'General Awareness', 'Indian History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('929b8bae-6a58-4ddb-8e47-62f52e7511f5', 'f5e2fd33-7358-4c2f-a760-14b7a6c5cdec', 0, '1930');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46f25c78-8e37-44ee-a79e-f2ee62517bc3', 'f5e2fd33-7358-4c2f-a760-14b7a6c5cdec', 1, '1942');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6f85f2b-1d35-4e07-b13b-044a0378ec08', 'f5e2fd33-7358-4c2f-a760-14b7a6c5cdec', 2, '1947');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e088f54-042b-4757-990e-2d087e51e69b', 'f5e2fd33-7358-4c2f-a760-14b7a6c5cdec', 3, '1919');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f5e2fd33-7358-4c2f-a760-14b7a6c5cdec', '46f25c78-8e37-44ee-a79e-f2ee62517bc3', 'The Quit India Movement was launched by Mahatma Gandhi on 8 August 1942.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d25bb044-bbea-4bb2-b74c-765f1be5f690', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 33, 'Who is the ceremonial head of the Indian state?', 'General Awareness', 'Indian Polity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76f10efb-1ebe-4359-af40-515382f08211', 'd25bb044-bbea-4bb2-b74c-765f1be5f690', 0, 'Prime Minister');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d6b31be-426f-48ce-aa28-da56e93b0b17', 'd25bb044-bbea-4bb2-b74c-765f1be5f690', 1, 'President');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1ffdb5a-a200-4454-b0c4-aa7136d6bb50', 'd25bb044-bbea-4bb2-b74c-765f1be5f690', 2, 'Chief Justice');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9aa7df8c-299b-4ccd-90f8-8fd2e99141ab', 'd25bb044-bbea-4bb2-b74c-765f1be5f690', 3, 'Speaker of Lok Sabha');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d25bb044-bbea-4bb2-b74c-765f1be5f690', '6d6b31be-426f-48ce-aa28-da56e93b0b17', 'The President of India is the ceremonial head of state, while the Prime Minister is the head of government.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('22171164-e0fd-423d-a52b-853dc42e5394', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 34, 'Mount Kanchenjunga, India''s highest peak, is located in which state?', 'General Awareness', 'Geography', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d5df4ce-b5aa-458a-8438-ef6e51eab441', '22171164-e0fd-423d-a52b-853dc42e5394', 0, 'Uttarakhand');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ba942d8-8d89-4289-9603-bae448b1c4e5', '22171164-e0fd-423d-a52b-853dc42e5394', 1, 'Himachal Pradesh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76b65063-8259-45f1-9c93-399dc1ee7bcc', '22171164-e0fd-423d-a52b-853dc42e5394', 2, 'Sikkim');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18376b8a-f353-458a-acde-a6b478c875d2', '22171164-e0fd-423d-a52b-853dc42e5394', 3, 'Jammu & Kashmir');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('22171164-e0fd-423d-a52b-853dc42e5394', '76b65063-8259-45f1-9c93-399dc1ee7bcc', 'Kanchenjunga is located on the India-Nepal border in Sikkim, and is India''s highest peak.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('87e83705-74ae-4bba-8eeb-78d389ad08c1', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 35, 'What does GDP stand for?', 'General Awareness', 'Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eee3ccf2-68cd-46c7-aa19-a47b5abd5cad', '87e83705-74ae-4bba-8eeb-78d389ad08c1', 0, 'Gross Domestic Product');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b759f07e-eb02-4052-ab2d-008f13ef6532', '87e83705-74ae-4bba-8eeb-78d389ad08c1', 1, 'General Development Plan');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1f8fc9a-17a7-4d8b-857c-c6b59e53d779', '87e83705-74ae-4bba-8eeb-78d389ad08c1', 2, 'Gross Development Price');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9afba7c2-39e7-4741-8f73-70b6ef10b9f1', '87e83705-74ae-4bba-8eeb-78d389ad08c1', 3, 'Government Development Product');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('87e83705-74ae-4bba-8eeb-78d389ad08c1', 'eee3ccf2-68cd-46c7-aa19-a47b5abd5cad', 'GDP stands for Gross Domestic Product, the total value of goods and services produced within a country.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('865a3b58-e6ca-4cfe-b836-d5e52ef3b89d', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 36, 'What is the chemical symbol for Gold?', 'General Awareness', 'Science - Chemistry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cca6e37a-599d-4b83-afe7-90849afdd426', '865a3b58-e6ca-4cfe-b836-d5e52ef3b89d', 0, 'Go');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba19904a-be3e-4952-bdd0-6a6568e0368a', '865a3b58-e6ca-4cfe-b836-d5e52ef3b89d', 1, 'Gd');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f664189-9799-44c2-af83-285abd014367', '865a3b58-e6ca-4cfe-b836-d5e52ef3b89d', 2, 'Au');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57302f65-6267-4630-8adb-bd73e4ebce5a', '865a3b58-e6ca-4cfe-b836-d5e52ef3b89d', 3, 'Ag');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('865a3b58-e6ca-4cfe-b836-d5e52ef3b89d', '8f664189-9799-44c2-af83-285abd014367', 'Au (from Latin ''aurum'') is the chemical symbol for Gold.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('20c6c508-f672-4eb4-a1f4-2e38dec8b73f', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 37, 'Which blood group is known as the universal donor?', 'General Awareness', 'Static GK - Biology', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('14b56c36-4de4-4210-9061-bdbe247d795a', '20c6c508-f672-4eb4-a1f4-2e38dec8b73f', 0, 'A+');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59cf9928-b5f9-4b12-a0db-b865a31cc98e', '20c6c508-f672-4eb4-a1f4-2e38dec8b73f', 1, 'AB+');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9bfef96e-4c36-4f57-b96d-089db8768364', '20c6c508-f672-4eb4-a1f4-2e38dec8b73f', 2, 'O-');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d182e99-ab5d-446c-b612-6194aa35baed', '20c6c508-f672-4eb4-a1f4-2e38dec8b73f', 3, 'B+');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('20c6c508-f672-4eb4-a1f4-2e38dec8b73f', '9bfef96e-4c36-4f57-b96d-089db8768364', 'O- blood is the universal donor since it lacks A, B, and Rh antigens.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ca11e2ef-ce5d-4a78-bf4e-0ad09640f630', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 38, 'Who gave the slogan ''Swaraj is my birthright''?', 'General Awareness', 'Indian History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd2b4c80-2bf8-4850-9b9c-3c1dd6860a45', 'ca11e2ef-ce5d-4a78-bf4e-0ad09640f630', 0, 'Mahatma Gandhi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2b7d63d-6827-4256-99b0-01167d3af9dd', 'ca11e2ef-ce5d-4a78-bf4e-0ad09640f630', 1, 'Bal Gangadhar Tilak');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23f8a05e-2209-4d53-91ac-ecdbd35baaab', 'ca11e2ef-ce5d-4a78-bf4e-0ad09640f630', 2, 'Subhas Chandra Bose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17ecb823-d8e3-4ad7-9719-42012bb69154', 'ca11e2ef-ce5d-4a78-bf4e-0ad09640f630', 3, 'Jawaharlal Nehru');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ca11e2ef-ce5d-4a78-bf4e-0ad09640f630', 'd2b7d63d-6827-4256-99b0-01167d3af9dd', 'Bal Gangadhar Tilak famously said ''Swaraj is my birthright and I shall have it.''', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6aef5aa1-6dec-455d-841a-6ea01b46b83a', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 39, 'How many fundamental rights are guaranteed by the Indian Constitution currently?', 'General Awareness', 'Indian Polity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a300a07-e7ad-4414-b26a-214a6854efef', '6aef5aa1-6dec-455d-841a-6ea01b46b83a', 0, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ada9ccdb-9714-437e-9e29-2709252dd263', '6aef5aa1-6dec-455d-841a-6ea01b46b83a', 1, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd30f899-8104-42dd-85ef-9604c3eb8465', '6aef5aa1-6dec-455d-841a-6ea01b46b83a', 2, '7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78b9187e-5841-4924-8853-4460852de281', '6aef5aa1-6dec-455d-841a-6ea01b46b83a', 3, '8');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6aef5aa1-6dec-455d-841a-6ea01b46b83a', 'ada9ccdb-9714-437e-9e29-2709252dd263', 'Currently there are 6 fundamental rights, after the Right to Property was removed as a fundamental right by the 44th Amendment (1978).', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9faf2d4c-e496-4308-968a-e06ae3db936d', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 40, 'Which is the largest state in India by area?', 'General Awareness', 'Geography', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d4b1f9c-858f-4011-955d-4186797bbb85', '9faf2d4c-e496-4308-968a-e06ae3db936d', 0, 'Madhya Pradesh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f3304aa-c5e5-484e-ae09-5955e570b231', '9faf2d4c-e496-4308-968a-e06ae3db936d', 1, 'Maharashtra');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a30bddf8-6ddf-44fc-a854-0429eb46a4c7', '9faf2d4c-e496-4308-968a-e06ae3db936d', 2, 'Rajasthan');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49c07867-c750-4703-bdfa-4a59b1ee967e', '9faf2d4c-e496-4308-968a-e06ae3db936d', 3, 'Uttar Pradesh');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9faf2d4c-e496-4308-968a-e06ae3db936d', 'a30bddf8-6ddf-44fc-a854-0429eb46a4c7', 'Rajasthan is India''s largest state by area.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('012bf53c-1585-4b00-bd47-439456e57208', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 41, 'The Union Budget of India is presented by which ministry?', 'General Awareness', 'Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c7d5f42-1871-4cf4-93c6-c18cde14b9d4', '012bf53c-1585-4b00-bd47-439456e57208', 0, 'Ministry of Home Affairs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8c1e247-ca36-4917-be3f-c1fb6232d824', '012bf53c-1585-4b00-bd47-439456e57208', 1, 'Ministry of Finance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bdb82825-a4c1-45d3-843c-24c9eb73b90f', '012bf53c-1585-4b00-bd47-439456e57208', 2, 'NITI Aayog');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24e46b3f-52d5-4130-996b-17fe4822300d', '012bf53c-1585-4b00-bd47-439456e57208', 3, 'Ministry of Commerce');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('012bf53c-1585-4b00-bd47-439456e57208', 'd8c1e247-ca36-4917-be3f-c1fb6232d824', 'The Union Budget is presented by the Ministry of Finance, typically on February 1.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('baca5b25-8ea4-407d-9a58-e1275b2e4703', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 42, 'What is the speed of light in a vacuum (approximately)?', 'General Awareness', 'Science - Physics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6402d0a5-ad58-4b28-bfbf-e34d8b8cbe64', 'baca5b25-8ea4-407d-9a58-e1275b2e4703', 0, '3x10^5 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18e22b5b-3881-463a-b532-e8e422818636', 'baca5b25-8ea4-407d-9a58-e1275b2e4703', 1, '3x10^6 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95de1fcb-4c72-4cbf-b49a-cafecfb06625', 'baca5b25-8ea4-407d-9a58-e1275b2e4703', 2, '3x10^8 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03e0020c-cd09-480d-bb25-5e297ae12ed2', 'baca5b25-8ea4-407d-9a58-e1275b2e4703', 3, '3x10^10 m/s');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('baca5b25-8ea4-407d-9a58-e1275b2e4703', '95de1fcb-4c72-4cbf-b49a-cafecfb06625', 'The speed of light in a vacuum is approximately 3x10^8 m/s (299,792,458 m/s).', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a2eb1bbd-de9d-4108-86e3-2b3d7e679379', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 43, 'The Khel Ratna award is India''s highest award in which field?', 'General Awareness', 'Static GK - Sports', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('474e6d0f-f171-41b5-b175-5c387550b6ae', 'a2eb1bbd-de9d-4108-86e3-2b3d7e679379', 0, 'Literature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57114a77-c5a3-4c92-af1c-a17a8383d58e', 'a2eb1bbd-de9d-4108-86e3-2b3d7e679379', 1, 'Science');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6076c426-5870-4dc1-b0d5-b5224635cb69', 'a2eb1bbd-de9d-4108-86e3-2b3d7e679379', 2, 'Sports');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4829b889-e82d-4124-877d-0cc5f6e85e6f', 'a2eb1bbd-de9d-4108-86e3-2b3d7e679379', 3, 'Cinema');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a2eb1bbd-de9d-4108-86e3-2b3d7e679379', '6076c426-5870-4dc1-b0d5-b5224635cb69', 'The Major Dhyan Chand Khel Ratna is India''s highest sporting honor.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4d691fd1-9963-45bd-9f8a-79664122a50d', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 44, 'The Battle of Plassey was fought in which year?', 'General Awareness', 'Indian History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e812aef-c161-432d-afc4-3826b4737826', '4d691fd1-9963-45bd-9f8a-79664122a50d', 0, '1757');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a871cecf-953e-4333-8f22-ccd9d578f489', '4d691fd1-9963-45bd-9f8a-79664122a50d', 1, '1764');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('11da956f-24d6-4027-b8f6-2bcabe1df94b', '4d691fd1-9963-45bd-9f8a-79664122a50d', 2, '1857');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa69eff4-86eb-403a-a76d-956766bc8969', '4d691fd1-9963-45bd-9f8a-79664122a50d', 3, '1707');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4d691fd1-9963-45bd-9f8a-79664122a50d', '7e812aef-c161-432d-afc4-3826b4737826', 'The Battle of Plassey (1757) established British East India Company control over Bengal.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('514433c4-37ae-482b-9a35-44ab6769c1f1', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 45, 'The Indian Constitution was adopted on which date?', 'General Awareness', 'Indian Polity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd126c10-3ed4-44c3-a8cf-78bd7ce4397d', '514433c4-37ae-482b-9a35-44ab6769c1f1', 0, '26 January 1950');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0eda5680-8221-4c1b-8bf5-6ae5e80686cb', '514433c4-37ae-482b-9a35-44ab6769c1f1', 1, '26 November 1949');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b0d9cf1-c00b-4b78-9b1c-d911cb24cbc3', '514433c4-37ae-482b-9a35-44ab6769c1f1', 2, '15 August 1947');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e2a4f6fd-51c7-4ae7-80d0-4c9a9bede420', '514433c4-37ae-482b-9a35-44ab6769c1f1', 3, '26 January 1930');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('514433c4-37ae-482b-9a35-44ab6769c1f1', '0eda5680-8221-4c1b-8bf5-6ae5e80686cb', 'The Constitution was adopted on 26 November 1949 and came into effect on 26 January 1950.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ea13fbc0-7c0d-4ffb-af18-c6028150a8ee', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 46, 'Which is the smallest state in India by area?', 'General Awareness', 'Geography', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b12b10d-95b6-469f-9795-39019f417a4e', 'ea13fbc0-7c0d-4ffb-af18-c6028150a8ee', 0, 'Sikkim');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d070e71a-cfaa-4a7f-927c-b8e08cf2206b', 'ea13fbc0-7c0d-4ffb-af18-c6028150a8ee', 1, 'Tripura');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a422ed9-164c-484e-ad18-3321cadfef45', 'ea13fbc0-7c0d-4ffb-af18-c6028150a8ee', 2, 'Goa');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9e76309-8b77-41ab-a806-0adbb45f4321', 'ea13fbc0-7c0d-4ffb-af18-c6028150a8ee', 3, 'Nagaland');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ea13fbc0-7c0d-4ffb-af18-c6028150a8ee', '7a422ed9-164c-484e-ad18-3321cadfef45', 'Goa is India''s smallest state by area.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('99e38fe2-f745-4b77-b2ce-e5ad4ed2ff58', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 47, 'What does ''repo rate'' refer to?', 'General Awareness', 'Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b724931-f544-4052-87d4-3d6e6d8a10c1', '99e38fe2-f745-4b77-b2ce-e5ad4ed2ff58', 0, 'The rate at which RBI borrows from banks');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1098473-cd57-40af-8d28-ad38eefd9357', '99e38fe2-f745-4b77-b2ce-e5ad4ed2ff58', 1, 'The rate at which RBI lends to commercial banks');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('180c3711-33d1-4b09-a546-ede83a1f3a3b', '99e38fe2-f745-4b77-b2ce-e5ad4ed2ff58', 2, 'The tax rate on repossessed property');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c2bd23e-2e74-4010-ac0f-9e44da0a4b9b', '99e38fe2-f745-4b77-b2ce-e5ad4ed2ff58', 3, 'The interest rate on savings accounts');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('99e38fe2-f745-4b77-b2ce-e5ad4ed2ff58', 'a1098473-cd57-40af-8d28-ad38eefd9357', 'Repo rate is the rate at which RBI lends short-term funds to commercial banks.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('889f806c-d536-4c32-bf20-c921c22e1c67', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 48, 'Which organ in the human body produces insulin?', 'General Awareness', 'Science - Biology', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4be6b6b2-1609-4b4c-bbb5-5dfd2c6d9f61', '889f806c-d536-4c32-bf20-c921c22e1c67', 0, 'Liver');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ef90f29-179c-44d9-85eb-bfe55d02ccec', '889f806c-d536-4c32-bf20-c921c22e1c67', 1, 'Kidney');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c1f91a5-afef-4025-b23e-d32072bfe824', '889f806c-d536-4c32-bf20-c921c22e1c67', 2, 'Pancreas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03be150e-9e23-4297-8fe5-c1c96bb10735', '889f806c-d536-4c32-bf20-c921c22e1c67', 3, 'Spleen');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('889f806c-d536-4c32-bf20-c921c22e1c67', '7c1f91a5-afef-4025-b23e-d32072bfe824', 'The pancreas produces insulin, which regulates blood glucose levels.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9d0f6e4e-c26c-4e91-90a0-6d45abc54395', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 49, 'The Dronacharya Award is given for excellence in which field?', 'General Awareness', 'Static GK - Awards', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9353e380-794c-475b-a878-14544566d3d9', '9d0f6e4e-c26c-4e91-90a0-6d45abc54395', 0, 'Coaching in sports');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('883ee60a-1639-4476-8f34-29584b3bc52a', '9d0f6e4e-c26c-4e91-90a0-6d45abc54395', 1, 'Classical dance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbeda559-eb94-45f6-8698-bf14d6a94956', '9d0f6e4e-c26c-4e91-90a0-6d45abc54395', 2, 'Journalism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5998e731-04be-49aa-bf1f-ac40745d2b05', '9d0f6e4e-c26c-4e91-90a0-6d45abc54395', 3, 'Social service');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9d0f6e4e-c26c-4e91-90a0-6d45abc54395', '9353e380-794c-475b-a878-14544566d3d9', 'The Dronacharya Award recognizes excellence in sports coaching.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5504a84d-e877-41d6-bdfc-a257838ba82a', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 50, 'Who was the first Governor-General of independent India?', 'General Awareness', 'Indian History', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88a04720-0d9a-4dec-97c3-1c8dd50bdad8', '5504a84d-e877-41d6-bdfc-a257838ba82a', 0, 'Jawaharlal Nehru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68027989-3cc5-4afd-89a6-806b5be159d5', '5504a84d-e877-41d6-bdfc-a257838ba82a', 1, 'Lord Mountbatten');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82f1c218-787b-464c-be4f-a5b3a7d0787c', '5504a84d-e877-41d6-bdfc-a257838ba82a', 2, 'C. Rajagopalachari');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('988a9edd-fd61-49f7-bbb5-2e474e96fd9d', '5504a84d-e877-41d6-bdfc-a257838ba82a', 3, 'Dr. Rajendra Prasad');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5504a84d-e877-41d6-bdfc-a257838ba82a', '68027989-3cc5-4afd-89a6-806b5be159d5', 'Lord Mountbatten served as the first Governor-General of independent India (1947-48); C. Rajagopalachari was the first and only Indian to hold the post afterward.', 'General Awareness — authored from standard static GK (history, geography, polity, economy, science) and current-affairs-adjacent topics tested in SSC CGL; not copied from any official SSC question paper.');

-- ── Section: Quantitative Aptitude (25 questions) — Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('88cbd1d3-df25-4ab5-a244-c26d5306150a', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 51, 'What is 25% of 480?', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5176e34-c851-48b2-bf99-f801cfd24837', '88cbd1d3-df25-4ab5-a244-c26d5306150a', 0, '100');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38bbb4da-0f63-43d3-a54b-995d696a51fa', '88cbd1d3-df25-4ab5-a244-c26d5306150a', 1, '110');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a764f949-af31-4bb5-95b2-3c811f4b69f0', '88cbd1d3-df25-4ab5-a244-c26d5306150a', 2, '120');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a191f414-e62b-4ac2-b652-ef0d1fecd9a9', '88cbd1d3-df25-4ab5-a244-c26d5306150a', 3, '130');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('88cbd1d3-df25-4ab5-a244-c26d5306150a', 'a764f949-af31-4bb5-95b2-3c811f4b69f0', '25% of 480 = 480/4 = 120.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e5cd20bb-f903-457f-b49c-e71f0f8b9f70', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 52, 'A shopkeeper buys an item for Rs. 400 and sells it for Rs. 460. What is his profit percentage?', 'Quantitative Aptitude', 'Profit and Loss', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66e7e5bd-91a2-49bf-9bf3-6d026c88d0de', 'e5cd20bb-f903-457f-b49c-e71f0f8b9f70', 0, '10%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e116825-b904-4bc9-8957-98766232632b', 'e5cd20bb-f903-457f-b49c-e71f0f8b9f70', 1, '15%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d03a5a3-61c0-47cb-83a0-51c64a83ee09', 'e5cd20bb-f903-457f-b49c-e71f0f8b9f70', 2, '12%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d73d8c38-7d9e-4b98-8ba3-a7919a458825', 'e5cd20bb-f903-457f-b49c-e71f0f8b9f70', 3, '20%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e5cd20bb-f903-457f-b49c-e71f0f8b9f70', '4e116825-b904-4bc9-8957-98766232632b', 'Profit = 460-400 = 60. Profit% = (60/400)x100 = 15%.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9bde24e5-fed4-412c-a4d6-85c1b27d5c93', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 53, 'Find the simple interest on Rs. 2000 at 5% per annum for 3 years.', 'Quantitative Aptitude', 'Simple Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9987f915-deca-4e7d-af1e-ea08f22ebde2', '9bde24e5-fed4-412c-a4d6-85c1b27d5c93', 0, 'Rs. 250');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76f8f22a-1f62-4c20-a322-ba9a47c5f89d', '9bde24e5-fed4-412c-a4d6-85c1b27d5c93', 1, 'Rs. 300');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7bb770ee-bcaf-4e84-8303-111b2ca5c530', '9bde24e5-fed4-412c-a4d6-85c1b27d5c93', 2, 'Rs. 350');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5db5d2e2-eda5-4965-859e-4de0fc4e5e7f', '9bde24e5-fed4-412c-a4d6-85c1b27d5c93', 3, 'Rs. 400');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9bde24e5-fed4-412c-a4d6-85c1b27d5c93', '76f8f22a-1f62-4c20-a322-ba9a47c5f89d', 'SI = (P x R x T)/100 = (2000x5x3)/100 = Rs. 300.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e93ff768-6b7d-4a4c-adf7-b1a928dda0b7', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 54, 'What is the HCF of 24 and 36?', 'Quantitative Aptitude', 'Number System', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c716fc7-c917-46da-bb3f-73b95728c03e', 'e93ff768-6b7d-4a4c-adf7-b1a928dda0b7', 0, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b85fed69-855b-427d-b4bc-636649d481d2', 'e93ff768-6b7d-4a4c-adf7-b1a928dda0b7', 1, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f90299d-65e1-4c0f-8ac1-a7a8dc098e9b', 'e93ff768-6b7d-4a4c-adf7-b1a928dda0b7', 2, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b607dd41-5bb3-4377-83de-cb94e66a9cc9', 'e93ff768-6b7d-4a4c-adf7-b1a928dda0b7', 3, '18');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e93ff768-6b7d-4a4c-adf7-b1a928dda0b7', '4f90299d-65e1-4c0f-8ac1-a7a8dc098e9b', '24 = 2^3x3, 36 = 2^2x3^2. HCF = 2^2x3 = 12.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7ee16f64-ec34-4838-b1eb-772342ddb3fd', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 55, 'A can complete a work in 10 days, B in 15 days. How many days will they take working together?', 'Quantitative Aptitude', 'Time and Work', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da84ad31-0611-41fe-b88f-92ad4429eab7', '7ee16f64-ec34-4838-b1eb-772342ddb3fd', 0, '5 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86f2b8a5-9f02-4914-a533-ebcd535f7de6', '7ee16f64-ec34-4838-b1eb-772342ddb3fd', 1, '6 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1eebdb6-0fc8-4284-b325-dda7baf8ecab', '7ee16f64-ec34-4838-b1eb-772342ddb3fd', 2, '8 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('046e49cf-2d83-4174-a86c-acfa4702ef3a', '7ee16f64-ec34-4838-b1eb-772342ddb3fd', 3, '12 days');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7ee16f64-ec34-4838-b1eb-772342ddb3fd', '86f2b8a5-9f02-4914-a533-ebcd535f7de6', 'Combined rate = 1/10+1/15 = 1/6, so together they take 6 days.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f938e17c-15f6-435f-8a51-0091c1733eca', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 56, 'A train travels 300km in 5 hours. What is its speed?', 'Quantitative Aptitude', 'Speed, Distance, Time', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2349463e-25cd-4ef7-a1ce-9a7334bf009c', 'f938e17c-15f6-435f-8a51-0091c1733eca', 0, '50 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('722544f4-e144-4057-a22b-1997671dea85', 'f938e17c-15f6-435f-8a51-0091c1733eca', 1, '60 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b186fc1-d3d6-4972-a46d-189e1c4e2643', 'f938e17c-15f6-435f-8a51-0091c1733eca', 2, '65 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9290c21-6072-41de-a73f-be24e6da2b92', 'f938e17c-15f6-435f-8a51-0091c1733eca', 3, '70 km/h');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f938e17c-15f6-435f-8a51-0091c1733eca', '722544f4-e144-4057-a22b-1997671dea85', 'Speed = Distance/Time = 300/5 = 60 km/h.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('69f83900-db12-43a3-8c82-cd7927ae890f', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 57, 'If A:B = 2:3 and B:C = 4:5, find A:B:C.', 'Quantitative Aptitude', 'Ratio and Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75cb53ec-d3ae-48f5-89a6-629a7178b54d', '69f83900-db12-43a3-8c82-cd7927ae890f', 0, '8:12:15');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('314cac45-b681-4e91-860d-f663bc1ccfa9', '69f83900-db12-43a3-8c82-cd7927ae890f', 1, '2:3:5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6087bc64-b020-4fa2-8316-407624a5ef25', '69f83900-db12-43a3-8c82-cd7927ae890f', 2, '8:6:15');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b0a8b49-34d2-458a-b98a-77290c445580', '69f83900-db12-43a3-8c82-cd7927ae890f', 3, '4:6:5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('69f83900-db12-43a3-8c82-cd7927ae890f', '75cb53ec-d3ae-48f5-89a6-629a7178b54d', 'Make B''s value equal: A:B=2:3=8:12, B:C=4:5=12:15. Combined: A:B:C = 8:12:15.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b472b0d0-ed45-4407-8fb7-8c4719a4f3d8', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 58, 'The average of 5 numbers is 20. If one number is excluded, the average becomes 18. Find the excluded number.', 'Quantitative Aptitude', 'Average', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c5134e6-a0fc-4086-bc28-af9414aeb675', 'b472b0d0-ed45-4407-8fb7-8c4719a4f3d8', 0, '24');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34674046-93ce-43c9-85b6-3466bf4075d4', 'b472b0d0-ed45-4407-8fb7-8c4719a4f3d8', 1, '26');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f0f2551-c0bb-4f93-9d31-26b820da49e1', 'b472b0d0-ed45-4407-8fb7-8c4719a4f3d8', 2, '28');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('522ddc8c-5d23-4a6a-b11e-2cde9fc918ff', 'b472b0d0-ed45-4407-8fb7-8c4719a4f3d8', 3, '30');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b472b0d0-ed45-4407-8fb7-8c4719a4f3d8', '0f0f2551-c0bb-4f93-9d31-26b820da49e1', 'Sum of 5 numbers = 100. Sum of 4 numbers = 72. Excluded number = 100-72 = 28.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8c6cfafd-5198-453d-9f64-ceaa0be9e602', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 59, 'Find the compound interest on Rs. 1000 at 10% per annum for 2 years.', 'Quantitative Aptitude', 'Compound Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba6109d4-5eb9-4b2f-80f1-ba918a05ae5f', '8c6cfafd-5198-453d-9f64-ceaa0be9e602', 0, 'Rs. 200');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50333027-3cb1-4250-bfbd-cb48a3a72153', '8c6cfafd-5198-453d-9f64-ceaa0be9e602', 1, 'Rs. 210');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16de16ac-b3e7-4e60-960d-cfa90b78a95f', '8c6cfafd-5198-453d-9f64-ceaa0be9e602', 2, 'Rs. 220');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec143f8f-6f0c-421e-a595-a440aeb2811f', '8c6cfafd-5198-453d-9f64-ceaa0be9e602', 3, 'Rs. 100');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8c6cfafd-5198-453d-9f64-ceaa0be9e602', '50333027-3cb1-4250-bfbd-cb48a3a72153', 'A = 1000(1.1)^2 = 1210. CI = 1210-1000 = Rs. 210.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f1264d01-1cb0-44a4-9596-bfe0fc9fdd54', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 60, 'In a class, 40% of students are girls. If there are 30 boys, how many total students are in the class?', 'Quantitative Aptitude', 'Data Interpretation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27111665-f9ec-4b06-8f87-64b88e9f8305', 'f1264d01-1cb0-44a4-9596-bfe0fc9fdd54', 0, '40');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb55a83e-1447-4d79-9512-d9c15b2eebff', 'f1264d01-1cb0-44a4-9596-bfe0fc9fdd54', 1, '45');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8eb69b5-43eb-4db6-8aa8-8a8444fafde0', 'f1264d01-1cb0-44a4-9596-bfe0fc9fdd54', 2, '50');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b3e9c30-432b-4a3e-b9e2-9cf79775c792', 'f1264d01-1cb0-44a4-9596-bfe0fc9fdd54', 3, '55');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f1264d01-1cb0-44a4-9596-bfe0fc9fdd54', 'd8eb69b5-43eb-4db6-8aa8-8a8444fafde0', '60% are boys = 30 students, so 100% = 30/0.6 = 50 students.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('454f5733-712a-4384-8ade-0b2c54bd50a8', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 61, 'If a number is increased by 20% and then decreased by 20%, what is the net percentage change?', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('afc93312-fc7d-4209-8261-f4fbeb318280', '454f5733-712a-4384-8ade-0b2c54bd50a8', 0, '0%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ffff75da-08e3-4fe6-938f-29262d437461', '454f5733-712a-4384-8ade-0b2c54bd50a8', 1, '-2%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('635fe560-9a5f-4495-a37b-8987b84986ad', '454f5733-712a-4384-8ade-0b2c54bd50a8', 2, '-4%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ceeba18b-c715-49e3-8d15-64050ba5bc3b', '454f5733-712a-4384-8ade-0b2c54bd50a8', 3, '+4%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('454f5733-712a-4384-8ade-0b2c54bd50a8', '635fe560-9a5f-4495-a37b-8987b84986ad', 'Net% = 20+(-20)+(20)(-20)/100 = 0-4 = -4%. The value decreases overall.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('46f4bb9e-4eeb-4c81-8ee8-8dcbcd035bef', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 62, 'A trader marks his goods 40% above cost price and gives a discount of 10%. What is his profit percentage?', 'Quantitative Aptitude', 'Profit and Loss', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('911221dd-2eaa-422d-ad8d-c36a887f7896', '46f4bb9e-4eeb-4c81-8ee8-8dcbcd035bef', 0, '24%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72730d3f-9b95-4c7b-ac40-4b89839be99d', '46f4bb9e-4eeb-4c81-8ee8-8dcbcd035bef', 1, '26%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44341372-1942-45a3-b911-0b1dd982fc81', '46f4bb9e-4eeb-4c81-8ee8-8dcbcd035bef', 2, '28%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c37c8a2-3566-444c-a5c0-c4d674de86f4', '46f4bb9e-4eeb-4c81-8ee8-8dcbcd035bef', 3, '30%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('46f4bb9e-4eeb-4c81-8ee8-8dcbcd035bef', '72730d3f-9b95-4c7b-ac40-4b89839be99d', 'If CP=100, MP=140, SP=140x0.9=126. Profit = 126-100=26. Profit% = 26%.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ee3b5eb2-9c64-4766-b90b-be45e14f0a0b', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 63, 'Find the LCM of 12 and 18.', 'Quantitative Aptitude', 'Number System', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b534c02f-c9f7-424a-8948-d96a11fff778', 'ee3b5eb2-9c64-4766-b90b-be45e14f0a0b', 0, '24');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d88f8635-4574-42bd-aa77-3fbaa0ce7e95', 'ee3b5eb2-9c64-4766-b90b-be45e14f0a0b', 1, '36');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('186445db-2ef5-424f-a7cf-085a976c0cf8', 'ee3b5eb2-9c64-4766-b90b-be45e14f0a0b', 2, '48');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b90d0778-fd94-4eea-8481-3faba00a30c4', 'ee3b5eb2-9c64-4766-b90b-be45e14f0a0b', 3, '72');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ee3b5eb2-9c64-4766-b90b-be45e14f0a0b', 'd88f8635-4574-42bd-aa77-3fbaa0ce7e95', '12=2^2x3, 18=2x3^2. LCM=2^2x3^2=36.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a2008934-aef6-43e7-b3cf-9156318f196c', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 64, 'A pipe can fill a tank in 6 hours. A leak can empty the full tank in 12 hours. If both are open, how long will it take to fill the tank?', 'Quantitative Aptitude', 'Time and Work', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf579ed5-6a03-4e59-9f8d-54f539b94786', 'a2008934-aef6-43e7-b3cf-9156318f196c', 0, '8 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d6df269-e145-4a1d-ade5-eaa41be8deef', 'a2008934-aef6-43e7-b3cf-9156318f196c', 1, '10 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('915a3c8d-3b91-46ac-b724-0d2d4c2f95fb', 'a2008934-aef6-43e7-b3cf-9156318f196c', 2, '12 hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b81edd6-753f-4479-8675-3e7115c9efa7', 'a2008934-aef6-43e7-b3cf-9156318f196c', 3, '14 hours');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a2008934-aef6-43e7-b3cf-9156318f196c', '915a3c8d-3b91-46ac-b724-0d2d4c2f95fb', 'Net rate = 1/6-1/12 = 1/12, so the tank fills in 12 hours.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('21421e39-ad8a-49be-bf67-93dfd60ff102', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 65, 'Two trains 100m and 150m long run in opposite directions at 30 km/h and 20 km/h. How long will they take to cross each other?', 'Quantitative Aptitude', 'Speed, Distance, Time', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('945433ed-27ff-4c22-9326-caf4783bfa72', '21421e39-ad8a-49be-bf67-93dfd60ff102', 0, '12 seconds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3ec1013-8b03-40dd-bcc7-b3899572ae87', '21421e39-ad8a-49be-bf67-93dfd60ff102', 1, '16 seconds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a8490a2-6f98-4d89-8755-1ebf28130104', '21421e39-ad8a-49be-bf67-93dfd60ff102', 2, '18 seconds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc4872c6-44a2-4c3f-b4b9-529207573682', '21421e39-ad8a-49be-bf67-93dfd60ff102', 3, '20 seconds');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('21421e39-ad8a-49be-bf67-93dfd60ff102', '3a8490a2-6f98-4d89-8755-1ebf28130104', 'Relative speed = 50 km/h = 50x5/18 m/s = 13.89 m/s. Total distance = 250m. Time = 250/13.89 ≈ 18 seconds.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f1559fb1-1414-495f-aa24-5edd3521a213', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 66, 'What is the sum of interior angles of a hexagon?', 'Quantitative Aptitude', 'Geometry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0185337-8d0e-44f2-a045-d6f9e053babb', 'f1559fb1-1414-495f-aa24-5edd3521a213', 0, '540 degrees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57b6ff54-219d-4351-8994-0e33d4e00c0a', 'f1559fb1-1414-495f-aa24-5edd3521a213', 1, '720 degrees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a988402-c2a0-49c6-84b6-c8314b8c526e', 'f1559fb1-1414-495f-aa24-5edd3521a213', 2, '900 degrees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('652e4275-4085-44d8-9bc7-037d504685a2', 'f1559fb1-1414-495f-aa24-5edd3521a213', 3, '1080 degrees');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f1559fb1-1414-495f-aa24-5edd3521a213', '57b6ff54-219d-4351-8994-0e33d4e00c0a', 'Sum of interior angles = (n-2)x180 = (6-2)x180 = 720 degrees.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fb6360d0-4dcd-4110-84fe-d963b64ad6ac', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 67, 'What is the value of sin(30 degrees)?', 'Quantitative Aptitude', 'Trigonometry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0be1cfcb-276f-4f65-a0fc-3b7d8da4806c', 'fb6360d0-4dcd-4110-84fe-d963b64ad6ac', 0, '1/2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e1650da-0596-4e1f-b1f2-eaa01d6c0b11', 'fb6360d0-4dcd-4110-84fe-d963b64ad6ac', 1, '1/3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32558f95-87cb-4c54-856c-02e51ea50bb1', 'fb6360d0-4dcd-4110-84fe-d963b64ad6ac', 2, 'sqrt(3)/2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f270a22-bf73-43a2-b3b1-80131e928f3d', 'fb6360d0-4dcd-4110-84fe-d963b64ad6ac', 3, '1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fb6360d0-4dcd-4110-84fe-d963b64ad6ac', '0be1cfcb-276f-4f65-a0fc-3b7d8da4806c', 'sin(30 degrees) = 1/2, a standard trigonometric value.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3999cfb9-6299-48f1-a72b-5d3f86f172c1', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 68, 'A pie chart shows a company''s expenses: Salaries 40%, Rent 25%, Utilities 15%, Others 20%. If total expenses are Rs. 8,00,000, what is the amount spent on Rent?', 'Quantitative Aptitude', 'Data Interpretation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf5956d3-fd27-4549-b167-7ccb742d28c1', '3999cfb9-6299-48f1-a72b-5d3f86f172c1', 0, 'Rs. 1,60,000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7dcb3ba-b7b5-4aa0-ada3-c79193087d38', '3999cfb9-6299-48f1-a72b-5d3f86f172c1', 1, 'Rs. 2,00,000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6836853-e4db-4a5b-9d6d-398ec15904c6', '3999cfb9-6299-48f1-a72b-5d3f86f172c1', 2, 'Rs. 2,40,000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc902547-e4db-4e9c-9686-62a29b7e00fc', '3999cfb9-6299-48f1-a72b-5d3f86f172c1', 3, 'Rs. 3,20,000');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3999cfb9-6299-48f1-a72b-5d3f86f172c1', 'f7dcb3ba-b7b5-4aa0-ada3-c79193087d38', '25% of 8,00,000 = Rs. 2,00,000.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c782668f-f276-49e9-b574-b4b5e80d76c2', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 69, 'In an election, a candidate got 60% of the total votes and won by 4000 votes. What is the total number of votes?', 'Quantitative Aptitude', 'Percentage', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('489c7b3e-1da7-455f-af54-e4c938e515a2', 'c782668f-f276-49e9-b574-b4b5e80d76c2', 0, '16000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e55cde5-f6c7-403c-b5a5-2e5bc63ef010', 'c782668f-f276-49e9-b574-b4b5e80d76c2', 1, '18000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9cb2b19a-0593-4867-8ecd-1dd44b79942f', 'c782668f-f276-49e9-b574-b4b5e80d76c2', 2, '20000');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('252512da-a20d-4a0d-891c-dfbc291e6c29', 'c782668f-f276-49e9-b574-b4b5e80d76c2', 3, '24000');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c782668f-f276-49e9-b574-b4b5e80d76c2', '9cb2b19a-0593-4867-8ecd-1dd44b79942f', 'Winning margin = 60%-40%=20% of total = 4000. Total = 4000/0.2 = 20000.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0774a8e9-406e-4ff8-aef2-e8683f5a8c02', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 70, 'At what rate percent per annum will Rs. 5000 amount to Rs. 6050 in 2 years at compound interest?', 'Quantitative Aptitude', 'Simple/Compound Interest', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e47b34a1-e0b1-45db-bb6f-a7e844eef625', '0774a8e9-406e-4ff8-aef2-e8683f5a8c02', 0, '8%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b754472-4fa5-4c10-b523-9a08979b9269', '0774a8e9-406e-4ff8-aef2-e8683f5a8c02', 1, '10%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f09bf13-f961-4529-87dd-75db9ae651ed', '0774a8e9-406e-4ff8-aef2-e8683f5a8c02', 2, '12%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39060a8b-7f01-43d2-b71f-5dd83412dc8b', '0774a8e9-406e-4ff8-aef2-e8683f5a8c02', 3, '15%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0774a8e9-406e-4ff8-aef2-e8683f5a8c02', '4b754472-4fa5-4c10-b523-9a08979b9269', '6050/5000 = 1.21 = (1+R/100)^2. Since 1.1^2=1.21, R=10%.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('abfe6c39-904c-4232-9436-eefb75bc682c', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 71, 'What is the smallest number that must be added to 1000 to make it a perfect square?', 'Quantitative Aptitude', 'Number System', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('874ef472-eefd-4649-8df6-43007a73fba9', 'abfe6c39-904c-4232-9436-eefb75bc682c', 0, '23');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8d63be1-0d2c-4ec1-859e-7893cfc5b4c8', 'abfe6c39-904c-4232-9436-eefb75bc682c', 1, '24');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8fb793cc-1762-4bbb-8be9-4af39319fba4', 'abfe6c39-904c-4232-9436-eefb75bc682c', 2, '25');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee570bf1-ac4a-4cf9-9f3a-f665b0773df2', 'abfe6c39-904c-4232-9436-eefb75bc682c', 3, '26');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('abfe6c39-904c-4232-9436-eefb75bc682c', 'e8d63be1-0d2c-4ec1-859e-7893cfc5b4c8', '31^2=961, 32^2=1024. 1024-1000=24, so 24 must be added.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('532fff13-0d34-4e9c-ae0f-ed7b9c215d75', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 72, 'Two numbers are in the ratio 3:5. If their sum is 96, find the larger number.', 'Quantitative Aptitude', 'Ratio and Proportion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48c02d0e-6386-4606-bbe1-d493884c3fc6', '532fff13-0d34-4e9c-ae0f-ed7b9c215d75', 0, '36');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b93d5f7e-acf8-42a9-baa3-333530ec5c50', '532fff13-0d34-4e9c-ae0f-ed7b9c215d75', 1, '48');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9044fb66-3a4a-4721-91e8-86f824c66ee0', '532fff13-0d34-4e9c-ae0f-ed7b9c215d75', 2, '60');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31e8e3c6-a1f7-462d-aca8-0f8ee3523223', '532fff13-0d34-4e9c-ae0f-ed7b9c215d75', 3, '72');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('532fff13-0d34-4e9c-ae0f-ed7b9c215d75', '9044fb66-3a4a-4721-91e8-86f824c66ee0', '3x+5x=96, 8x=96, x=12. Larger number = 5x12=60.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e8bd26bd-c4a5-4cf5-8764-050468553bcf', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 73, 'The average weight of 8 people increases by 2.5kg when a new person replaces one weighing 65kg. What is the weight of the new person?', 'Quantitative Aptitude', 'Average', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9473ae7f-d331-4666-add5-8ce67a883109', 'e8bd26bd-c4a5-4cf5-8764-050468553bcf', 0, '75kg');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8145b62-e2c3-49bd-b83c-27b674ec9045', 'e8bd26bd-c4a5-4cf5-8764-050468553bcf', 1, '80kg');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36f9148f-7ea6-4f1a-9cb6-c75bab215627', 'e8bd26bd-c4a5-4cf5-8764-050468553bcf', 2, '85kg');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('735e17a9-0208-4dd5-a758-9822c4494e7d', 'e8bd26bd-c4a5-4cf5-8764-050468553bcf', 3, '90kg');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e8bd26bd-c4a5-4cf5-8764-050468553bcf', '36f9148f-7ea6-4f1a-9cb6-c75bab215627', 'Total weight increase = 8x2.5 = 20kg. New person''s weight = 65+20 = 85kg.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('71380bd6-b2ec-46ab-b785-f95e3a244b84', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 74, 'The area of a circle with radius 7cm is (using pi=22/7):', 'Quantitative Aptitude', 'Geometry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43fc59ca-6072-4ac0-9fda-b1492a85b246', '71380bd6-b2ec-46ab-b785-f95e3a244b84', 0, '144 sq cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47efa1f7-c83c-455b-a1d6-97c7726d2238', '71380bd6-b2ec-46ab-b785-f95e3a244b84', 1, '154 sq cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e9dbfa8-d1ec-4245-a086-be015e2de305', '71380bd6-b2ec-46ab-b785-f95e3a244b84', 2, '164 sq cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ccd85068-c4af-49e4-83da-de78577380f4', '71380bd6-b2ec-46ab-b785-f95e3a244b84', 3, '174 sq cm');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('71380bd6-b2ec-46ab-b785-f95e3a244b84', '47efa1f7-c83c-455b-a1d6-97c7726d2238', 'Area = pi*r^2 = (22/7)x7x7 = 154 sq cm.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('881628ea-100e-4a66-b810-17921e04c2b5', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 75, 'A boat''s speed in still water is 15 km/h and the stream''s speed is 3 km/h. Find the boat''s downstream speed.', 'Quantitative Aptitude', 'Speed, Distance, Time', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef28230c-118b-4049-a6da-0a3be6331750', '881628ea-100e-4a66-b810-17921e04c2b5', 0, '12 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41a8a912-cc60-4c23-9a5e-5d576c3d5d30', '881628ea-100e-4a66-b810-17921e04c2b5', 1, '15 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ab55880-cc63-4bf7-b877-a3e34cbe3aaf', '881628ea-100e-4a66-b810-17921e04c2b5', 2, '18 km/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89094282-b07a-4dec-9fea-d4bfd59aa223', '881628ea-100e-4a66-b810-17921e04c2b5', 3, '21 km/h');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('881628ea-100e-4a66-b810-17921e04c2b5', '5ab55880-cc63-4bf7-b877-a3e34cbe3aaf', 'Downstream speed = boat speed + stream speed = 15+3 = 18 km/h.', 'Quantitative Aptitude — authored from standard SSC CGL Tier 1 quant topics (number system, percentage, profit-loss, SI/CI, time-work, speed-distance, data interpretation, geometry, trigonometry); not copied from any official SSC question paper.');

-- ── Section: English Comprehension (25 questions) — English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('195ebca0-8943-48c2-b97c-b877177c2319', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 76, 'Choose the synonym of ''ABUNDANT'':', 'English', 'Synonym', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44dc0f05-f4d6-4e50-90b8-e6ade7fe0e69', '195ebca0-8943-48c2-b97c-b877177c2319', 0, 'Scarce');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ad838ec-20b1-48e7-842d-4ad2a31c7609', '195ebca0-8943-48c2-b97c-b877177c2319', 1, 'Plentiful');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec9a261b-d4f7-4426-9358-38269114b1b9', '195ebca0-8943-48c2-b97c-b877177c2319', 2, 'Limited');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26a4710a-4491-4165-bd4a-0eb1e090e79f', '195ebca0-8943-48c2-b97c-b877177c2319', 3, 'Rare');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('195ebca0-8943-48c2-b97c-b877177c2319', '0ad838ec-20b1-48e7-842d-4ad2a31c7609', '''Abundant'' means existing in large quantities, which matches ''plentiful''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2d313dcf-b432-43df-826a-af4ba5c4b683', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 77, 'Choose the antonym of ''OPTIMISTIC'':', 'English', 'Antonym', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f3e3b49-2158-4701-a4ca-d18130773bfe', '2d313dcf-b432-43df-826a-af4ba5c4b683', 0, 'Hopeful');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('397dffb9-3182-4a6f-8e69-5755884b76ac', '2d313dcf-b432-43df-826a-af4ba5c4b683', 1, 'Positive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99fcd4aa-8d27-4084-a0f0-5aabc6b03250', '2d313dcf-b432-43df-826a-af4ba5c4b683', 2, 'Pessimistic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb2d4f3e-ea7b-4b7f-8690-5452c2437d7d', '2d313dcf-b432-43df-826a-af4ba5c4b683', 3, 'Confident');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2d313dcf-b432-43df-826a-af4ba5c4b683', '99fcd4aa-8d27-4084-a0f0-5aabc6b03250', '''Optimistic'' means hopeful about the future; its opposite is ''pessimistic''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f605135e-5a30-4263-8030-53883bcf33e6', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 78, 'A person who cannot read or write is called:', 'English', 'One Word Substitution', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4f50e9f-c5ec-45df-a950-391b01bbb85c', 'f605135e-5a30-4263-8030-53883bcf33e6', 0, 'Illiterate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5171b612-c94e-47f4-a197-b9893c318454', 'f605135e-5a30-4263-8030-53883bcf33e6', 1, 'Ignorant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3003df08-5c06-4680-abc9-c3b5dad67245', 'f605135e-5a30-4263-8030-53883bcf33e6', 2, 'Amateur');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a9637e7-4f00-4ac0-b283-1780e8888bea', 'f605135e-5a30-4263-8030-53883bcf33e6', 3, 'Naive');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f605135e-5a30-4263-8030-53883bcf33e6', 'a4f50e9f-c5ec-45df-a950-391b01bbb85c', '''Illiterate'' specifically means unable to read or write.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b2cb6f81-520a-4846-817e-863e7d4a555b', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 79, 'What does the idiom ''to beat around the bush'' mean?', 'English', 'Idiom', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('070d8149-64ae-4127-b48f-c6885a61e8b6', 'b2cb6f81-520a-4846-817e-863e7d4a555b', 0, 'To attack someone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53e5f3e4-e348-400b-bdfe-8c6de40f3a37', 'b2cb6f81-520a-4846-817e-863e7d4a555b', 1, 'To avoid the main topic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9d95337-6e45-402c-aeba-c77106e97634', 'b2cb6f81-520a-4846-817e-863e7d4a555b', 2, 'To work hard');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5239ff0c-d865-4584-a449-b15f3b047061', 'b2cb6f81-520a-4846-817e-863e7d4a555b', 3, 'To celebrate');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b2cb6f81-520a-4846-817e-863e7d4a555b', '53e5f3e4-e348-400b-bdfe-8c6de40f3a37', '''Beat around the bush'' means to avoid speaking directly about the main issue.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a1d79fa9-8eb3-4ec9-892f-e85856c381ba', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 80, 'Find the error: ''Each of the students (A) / have submitted (B) / their assignment (C) / on time. (D)''', 'English', 'Error Spotting', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04a9e592-2a67-482d-8188-f9b6f0139a90', 'a1d79fa9-8eb3-4ec9-892f-e85856c381ba', 0, 'A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a932b2d0-60a1-4122-9e4b-4df0cab61348', 'a1d79fa9-8eb3-4ec9-892f-e85856c381ba', 1, 'B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9680a8b3-d59e-4b14-b368-20e0a29f7872', 'a1d79fa9-8eb3-4ec9-892f-e85856c381ba', 2, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e7635e5-ff4f-4f73-97ec-56b7ea0a3b03', 'a1d79fa9-8eb3-4ec9-892f-e85856c381ba', 3, 'D');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a1d79fa9-8eb3-4ec9-892f-e85856c381ba', 'a932b2d0-60a1-4122-9e4b-4df0cab61348', '''Each'' takes a singular verb — it should be ''has submitted'', not ''have submitted''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('357deaf8-d14a-4e10-ae8f-923c61c102d6', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 81, 'Choose the correctly spelled word:', 'English', 'Spelling', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38f8a0e3-f8b8-499b-ad93-b05019b22d36', '357deaf8-d14a-4e10-ae8f-923c61c102d6', 0, 'Recieve');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ef92a1e-412f-4dc7-be57-93dbe8c7f010', '357deaf8-d14a-4e10-ae8f-923c61c102d6', 1, 'Receive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d687cfa-659b-4184-8130-f0d00d47ae77', '357deaf8-d14a-4e10-ae8f-923c61c102d6', 2, 'Receeve');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42622691-a7d5-414c-814b-faa9c9b64e4c', '357deaf8-d14a-4e10-ae8f-923c61c102d6', 3, 'Receve');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('357deaf8-d14a-4e10-ae8f-923c61c102d6', '5ef92a1e-412f-4dc7-be57-93dbe8c7f010', '''Receive'' follows the ''i before e except after c'' rule correctly.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b209fb30-e180-4dc1-a562-e40249df9490', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 82, 'Choose the synonym of ''BENEVOLENT'':', 'English', 'Synonym', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2aa669d7-866b-4c45-b279-2ad9e37e7f05', 'b209fb30-e180-4dc1-a562-e40249df9490', 0, 'Cruel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76694da5-022f-4045-856b-6c8e382c4601', 'b209fb30-e180-4dc1-a562-e40249df9490', 1, 'Kind');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b948857e-7a4e-46f4-88bd-9ce2b37c6d08', 'b209fb30-e180-4dc1-a562-e40249df9490', 2, 'Selfish');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('340fcade-9972-46c9-9947-0d087fa9b43a', 'b209fb30-e180-4dc1-a562-e40249df9490', 3, 'Arrogant');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b209fb30-e180-4dc1-a562-e40249df9490', '76694da5-022f-4045-856b-6c8e382c4601', '''Benevolent'' means kind and generous.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ff988623-f7b3-4db2-87ba-b97651866d8d', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 83, 'Choose the antonym of ''ANCIENT'':', 'English', 'Antonym', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff6079dd-debe-46e6-8fe5-9021df6b425c', 'ff988623-f7b3-4db2-87ba-b97651866d8d', 0, 'Old');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('322a1014-fab9-4c3b-ae92-54a0cffea666', 'ff988623-f7b3-4db2-87ba-b97651866d8d', 1, 'Modern');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('882d309f-af11-4198-8e8c-118b5153d94f', 'ff988623-f7b3-4db2-87ba-b97651866d8d', 2, 'Historic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7244fcce-0240-4925-82c0-a369d8f8625e', 'ff988623-f7b3-4db2-87ba-b97651866d8d', 3, 'Traditional');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ff988623-f7b3-4db2-87ba-b97651866d8d', '322a1014-fab9-4c3b-ae92-54a0cffea666', '''Ancient'' means very old; its opposite is ''modern''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6ec56706-8a51-40de-be68-1fd2e7e19751', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 84, 'A person who loves books is called:', 'English', 'One Word Substitution', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37f648c6-bdae-409f-a8a4-007d64068f5c', '6ec56706-8a51-40de-be68-1fd2e7e19751', 0, 'Bibliophile');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd64b764-a8a7-4672-a021-6f99195c4818', '6ec56706-8a51-40de-be68-1fd2e7e19751', 1, 'Philanthropist');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8444ede4-412e-46fc-a7cc-aae467f9ec0a', '6ec56706-8a51-40de-be68-1fd2e7e19751', 2, 'Bibliographer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13f15085-10cf-4bf1-b382-984211cb8cc1', '6ec56706-8a51-40de-be68-1fd2e7e19751', 3, 'Linguist');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6ec56706-8a51-40de-be68-1fd2e7e19751', '37f648c6-bdae-409f-a8a4-007d64068f5c', '''Bibliophile'' specifically means a person who loves or collects books.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b6a55920-f020-458d-84f9-934a0063488f', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 85, 'What does ''once in a blue moon'' mean?', 'English', 'Idiom', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0cb95286-467d-4318-8c21-b3ab0fb67093', 'b6a55920-f020-458d-84f9-934a0063488f', 0, 'Every night');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d48ae66f-e3ad-4f67-9b92-755d5d8cba14', 'b6a55920-f020-458d-84f9-934a0063488f', 1, 'Very rarely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e23804aa-0835-4368-9c6c-3bb0ce327fbf', 'b6a55920-f020-458d-84f9-934a0063488f', 2, 'Every month');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e36b3132-3c4f-4382-94e9-1ae31a6c78af', 'b6a55920-f020-458d-84f9-934a0063488f', 3, 'Frequently');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b6a55920-f020-458d-84f9-934a0063488f', 'd48ae66f-e3ad-4f67-9b92-755d5d8cba14', '''Once in a blue moon'' means something that happens very rarely.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c65ebc92-5434-4203-9359-fe27bf6e85fc', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 86, 'Find the error: ''She don''t (A) / like to attend (B) / the meeting (C) / tomorrow. (D)''', 'English', 'Error Spotting', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa77787a-ee5c-4e83-8cc4-dae6b66cf321', 'c65ebc92-5434-4203-9359-fe27bf6e85fc', 0, 'A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6108c0b-e85b-4804-bc0b-44a45caa4b75', 'c65ebc92-5434-4203-9359-fe27bf6e85fc', 1, 'B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f59416e6-ae0d-498b-9b1a-093165e525d0', 'c65ebc92-5434-4203-9359-fe27bf6e85fc', 2, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b368d92-0353-4b25-889b-d9238243f32a', 'c65ebc92-5434-4203-9359-fe27bf6e85fc', 3, 'D');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c65ebc92-5434-4203-9359-fe27bf6e85fc', 'fa77787a-ee5c-4e83-8cc4-dae6b66cf321', '''She'' is third-person singular and requires ''doesn''t'', not ''don''t''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fe996261-c401-441a-9df8-c0e916fe301a', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 87, 'Fill in the blank: ''He is superior ___ his brother in studies.''', 'English', 'Preposition', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f2f6a84-a192-4d25-9e21-d42fad0f6aec', 'fe996261-c401-441a-9df8-c0e916fe301a', 0, 'than');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a389c42-fa82-441b-96ab-e31721c51bf6', 'fe996261-c401-441a-9df8-c0e916fe301a', 1, 'to');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a4effb2-2605-4316-a9a7-78df2828fed5', 'fe996261-c401-441a-9df8-c0e916fe301a', 2, 'from');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eae8edfc-78ab-41ca-aa34-8d7d4a709b4f', 'fe996261-c401-441a-9df8-c0e916fe301a', 3, 'over');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fe996261-c401-441a-9df8-c0e916fe301a', '7a389c42-fa82-441b-96ab-e31721c51bf6', '''Superior'' is followed by the preposition ''to'', not ''than''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ced492aa-8b0a-40ad-967e-53e914fc3807', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 88, 'Choose the synonym of ''METICULOUS'':', 'English', 'Synonym', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8276e490-da2e-4948-bfd4-9da8dd2c34e0', 'ced492aa-8b0a-40ad-967e-53e914fc3807', 0, 'Careless');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b2a760a-ef19-4df8-a438-e4177d55c37f', 'ced492aa-8b0a-40ad-967e-53e914fc3807', 1, 'Careful');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f729176-1016-462a-8470-a754b458f2b9', 'ced492aa-8b0a-40ad-967e-53e914fc3807', 2, 'Quick');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d28546a4-c47c-45de-bb54-25feb9e01a4b', 'ced492aa-8b0a-40ad-967e-53e914fc3807', 3, 'Lazy');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ced492aa-8b0a-40ad-967e-53e914fc3807', '0b2a760a-ef19-4df8-a438-e4177d55c37f', '''Meticulous'' means showing great attention to detail, i.e., very careful.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('062f320f-3394-4f82-9dba-2a741e3b64f4', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 89, 'Choose the antonym of ''TRANSPARENT'':', 'English', 'Antonym', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5da33e2d-da90-49c3-afb2-53c01e45defe', '062f320f-3394-4f82-9dba-2a741e3b64f4', 0, 'Clear');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a50494de-1bb4-4031-84bb-f7c6ae89b721', '062f320f-3394-4f82-9dba-2a741e3b64f4', 1, 'Obvious');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f77af679-1b6f-4292-a8d1-6b1d242c13a6', '062f320f-3394-4f82-9dba-2a741e3b64f4', 2, 'Opaque');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48d982dd-badc-42f4-92ab-d72451966d87', '062f320f-3394-4f82-9dba-2a741e3b64f4', 3, 'Visible');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('062f320f-3394-4f82-9dba-2a741e3b64f4', 'f77af679-1b6f-4292-a8d1-6b1d242c13a6', '''Transparent'' means easily seen through; its opposite is ''opaque''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2461bd39-2d88-4f14-b582-a4c6ea5036ce', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 90, 'Passage: ''Renewable energy sources like solar and wind are becoming more affordable, making them competitive with fossil fuels. However, storage technology remains a challenge for consistent power supply.'' What is the main challenge mentioned for renewable energy?', 'English', 'Reading Comprehension', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('456359d2-6d1f-4e3b-aeeb-0a73b2a49fcb', '2461bd39-2d88-4f14-b582-a4c6ea5036ce', 0, 'High cost');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43c9fdb7-c637-44de-bec9-81392e17e831', '2461bd39-2d88-4f14-b582-a4c6ea5036ce', 1, 'Storage technology');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d90eaa67-5fa1-4e66-9d4d-c3238b77306f', '2461bd39-2d88-4f14-b582-a4c6ea5036ce', 2, 'Lack of demand');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd4e5a49-34bd-487f-8a70-fcd52ab1cb1e', '2461bd39-2d88-4f14-b582-a4c6ea5036ce', 3, 'Government regulations');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2461bd39-2d88-4f14-b582-a4c6ea5036ce', '43c9fdb7-c637-44de-bec9-81392e17e831', 'The passage explicitly states storage technology remains a challenge for consistent power supply.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('438838e5-533f-46dc-a4a7-a71036e736a3', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 91, 'Based on the same passage, why are renewable sources becoming competitive with fossil fuels?', 'English', 'Reading Comprehension', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f3613da-3d00-4d8d-a578-02adb92af7ad', '438838e5-533f-46dc-a4a7-a71036e736a3', 0, 'They are becoming more affordable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb8e74a2-68dc-457d-afe7-ab2a9067c5e5', '438838e5-533f-46dc-a4a7-a71036e736a3', 1, 'Fossil fuels are banned');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5205b2c-6cd8-4284-b241-1c83c2dc3a5f', '438838e5-533f-46dc-a4a7-a71036e736a3', 2, 'They store energy better');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('297008f3-6f1f-4d4d-98dd-bbd298b788bc', '438838e5-533f-46dc-a4a7-a71036e736a3', 3, 'Government subsidies alone');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('438838e5-533f-46dc-a4a7-a71036e736a3', '7f3613da-3d00-4d8d-a578-02adb92af7ad', 'The passage states renewable sources ''are becoming more affordable, making them competitive with fossil fuels.''', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3a35884e-07ba-416b-b2bd-0953d7fbd4f4', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 92, 'A place where birds are kept is called:', 'English', 'One Word Substitution', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1547bf6-0f8b-4881-b0be-a828ce5710a5', '3a35884e-07ba-416b-b2bd-0953d7fbd4f4', 0, 'Aviary');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40194ac9-c123-442e-9a17-462395383f31', '3a35884e-07ba-416b-b2bd-0953d7fbd4f4', 1, 'Apiary');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2f5e70f-0828-4755-9b8a-310ba53ad9cc', '3a35884e-07ba-416b-b2bd-0953d7fbd4f4', 2, 'Aquarium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ade3263a-6e42-44a1-856b-6d9a1f83f084', '3a35884e-07ba-416b-b2bd-0953d7fbd4f4', 3, 'Zoo');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3a35884e-07ba-416b-b2bd-0953d7fbd4f4', 'c1547bf6-0f8b-4881-b0be-a828ce5710a5', '''Aviary'' specifically refers to a large enclosure for keeping birds.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fd4578c0-c18e-437b-be26-19d0c7d09b30', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 93, 'What does ''to let the cat out of the bag'' mean?', 'English', 'Idiom', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c045b3bb-a19e-4326-8e3c-5f6d30da9d52', 'fd4578c0-c18e-437b-be26-19d0c7d09b30', 0, 'To adopt a pet');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97d18a0b-2dcd-46ab-9fdf-204364db6a29', 'fd4578c0-c18e-437b-be26-19d0c7d09b30', 1, 'To reveal a secret');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a9b6648-9102-49ae-a27e-44bd8b5c39fd', 'fd4578c0-c18e-437b-be26-19d0c7d09b30', 2, 'To escape danger');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7bdcef10-6828-4f15-91d0-c8fc949c14c6', 'fd4578c0-c18e-437b-be26-19d0c7d09b30', 3, 'To cause trouble');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fd4578c0-c18e-437b-be26-19d0c7d09b30', '97d18a0b-2dcd-46ab-9fdf-204364db6a29', '''Let the cat out of the bag'' means to accidentally reveal a secret.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3169623e-7220-49ac-afae-5001f8a4fb91', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 94, 'Find the error: ''Neither of the answers (A) / are correct (B) / according to the (C) / answer key. (D)''', 'English', 'Error Spotting', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd7304f3-ab0e-4810-a787-5326e032aff4', '3169623e-7220-49ac-afae-5001f8a4fb91', 0, 'A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('294450fa-2145-450f-b65a-3f3f4473af61', '3169623e-7220-49ac-afae-5001f8a4fb91', 1, 'B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d616793e-d91f-435f-ab90-a5a17aebd2e6', '3169623e-7220-49ac-afae-5001f8a4fb91', 2, 'C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('788ec315-d9c2-4449-a9a8-30f9d3d1d4ba', '3169623e-7220-49ac-afae-5001f8a4fb91', 3, 'D');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3169623e-7220-49ac-afae-5001f8a4fb91', '294450fa-2145-450f-b65a-3f3f4473af61', '''Neither'' takes a singular verb — it should be ''is correct'', not ''are correct''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('59b63266-7fc6-479e-996e-ea6280a61e0a', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 95, 'Fill in the blank: ''He congratulated me ___ my success.''', 'English', 'Preposition', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6613e3f-31d5-4a02-abef-950d3cc87586', '59b63266-7fc6-479e-996e-ea6280a61e0a', 0, 'for');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('979b86ba-2b79-4164-b56f-9ecb430ddf8d', '59b63266-7fc6-479e-996e-ea6280a61e0a', 1, 'on');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('464e50a4-873b-4db8-9bb3-9d2db25dee3d', '59b63266-7fc6-479e-996e-ea6280a61e0a', 2, 'at');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('199d0c42-543e-4150-a047-b00bb606146a', '59b63266-7fc6-479e-996e-ea6280a61e0a', 3, 'with');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('59b63266-7fc6-479e-996e-ea6280a61e0a', '979b86ba-2b79-4164-b56f-9ecb430ddf8d', '''Congratulate'' is idiomatically followed by ''on'', as in ''congratulate someone on something''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('88ab1b4d-1a86-430e-a806-10699f87c5b4', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 96, 'Choose the synonym of ''CANDID'':', 'English', 'Synonym', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb4910e6-12cd-43b4-b19f-5c8b78ead58f', '88ab1b4d-1a86-430e-a806-10699f87c5b4', 0, 'Dishonest');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('037cc64e-a5c2-4a6f-8295-b93b16f576fd', '88ab1b4d-1a86-430e-a806-10699f87c5b4', 1, 'Frank');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04b006cf-639c-4f37-8fc6-1b99c0f38227', '88ab1b4d-1a86-430e-a806-10699f87c5b4', 2, 'Secretive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6efbe034-745b-48e1-8d07-04dbef231c16', '88ab1b4d-1a86-430e-a806-10699f87c5b4', 3, 'Confused');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('88ab1b4d-1a86-430e-a806-10699f87c5b4', '037cc64e-a5c2-4a6f-8295-b93b16f576fd', '''Candid'' means truthful and straightforward, i.e., frank.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b7fc0d92-ca9d-4133-9c9d-b15656a6b5b0', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 97, 'Choose the antonym of ''GENEROUS'':', 'English', 'Antonym', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('806a4930-0f68-4ac0-a163-02c34f5401dc', 'b7fc0d92-ca9d-4133-9c9d-b15656a6b5b0', 0, 'Kind');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee9d581f-6e10-4c32-95a2-4e087bf4618b', 'b7fc0d92-ca9d-4133-9c9d-b15656a6b5b0', 1, 'Stingy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a26fef4b-e94a-4b0f-a514-1aafd0469be2', 'b7fc0d92-ca9d-4133-9c9d-b15656a6b5b0', 2, 'Charitable');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5cfa1039-f0f7-4e25-9466-ac01413c3f5a', 'b7fc0d92-ca9d-4133-9c9d-b15656a6b5b0', 3, 'Giving');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b7fc0d92-ca9d-4133-9c9d-b15656a6b5b0', 'ee9d581f-6e10-4c32-95a2-4e087bf4618b', '''Generous'' means willing to give; its opposite is ''stingy''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3008ec19-6f66-4b98-8007-b3594a74033c', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 98, 'A person who studies the stars and planets is called:', 'English', 'One Word Substitution', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d62099d-75c8-41bc-bb69-52704efd20ba', '3008ec19-6f66-4b98-8007-b3594a74033c', 0, 'Astronomer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e75ff046-598d-4f39-be24-75b73ae60037', '3008ec19-6f66-4b98-8007-b3594a74033c', 1, 'Astrologer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b67577b8-cdcd-405d-8ffd-46ed35ef3115', '3008ec19-6f66-4b98-8007-b3594a74033c', 2, 'Meteorologist');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a409ef6-5b79-4492-80b9-8a8cdcb18ada', '3008ec19-6f66-4b98-8007-b3594a74033c', 3, 'Geologist');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3008ec19-6f66-4b98-8007-b3594a74033c', '3d62099d-75c8-41bc-bb69-52704efd20ba', '''Astronomer'' specifically refers to a scientist who studies celestial objects.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('12edcce2-c8b2-4f48-82d5-3d0a091b2590', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 99, 'Fill in the blank: ''The company''s profits declined last year. ___, it decided to expand into new markets.''', 'English', 'Cloze Test', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('767157bf-0af5-449e-8788-78f3d71fe1d3', '12edcce2-c8b2-4f48-82d5-3d0a091b2590', 0, 'Therefore');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be04bb50-ba6e-4bfe-bcb2-a23ddee5881c', '12edcce2-c8b2-4f48-82d5-3d0a091b2590', 1, 'However');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c443a982-027c-402d-98f9-669e2b2a0b4c', '12edcce2-c8b2-4f48-82d5-3d0a091b2590', 2, 'Moreover');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('826118d1-e48d-460e-a296-beddc9d8be08', '12edcce2-c8b2-4f48-82d5-3d0a091b2590', 3, 'Similarly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('12edcce2-c8b2-4f48-82d5-3d0a091b2590', 'be04bb50-ba6e-4bfe-bcb2-a23ddee5881c', 'Expanding despite declining profits is a contrast, so ''However'' fits, not a result-connector like ''Therefore''.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ee516338-f769-4b9c-9b88-3ff1b82861c0', '7c9e6022-c2df-4c55-904c-2555a17cf2e9', 100, 'What does ''to hit the nail on the head'' mean?', 'English', 'Idiom', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('684a0165-ef95-47f9-932e-04fda8550194', 'ee516338-f769-4b9c-9b88-3ff1b82861c0', 0, 'To make a mistake');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4841fd0b-e15b-4fe8-9113-99a5149c7ced', 'ee516338-f769-4b9c-9b88-3ff1b82861c0', 1, 'To be exactly right');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9cb1ab4a-88a6-41eb-8e83-6eb298731fc9', 'ee516338-f769-4b9c-9b88-3ff1b82861c0', 2, 'To work hard');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a7cef34-f9ba-4d10-ab5e-287387a6d93a', 'ee516338-f769-4b9c-9b88-3ff1b82861c0', 3, 'To argue loudly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ee516338-f769-4b9c-9b88-3ff1b82861c0', '4841fd0b-e15b-4fe8-9113-99a5149c7ced', '''Hit the nail on the head'' means to describe or identify something exactly and accurately.', 'English Comprehension — authored from standard SSC CGL Tier 1 English topics (synonyms, antonyms, idioms, error spotting, one-word substitution, cloze, reading comprehension); not copied from any official SSC question paper.');
