-- ============================================================
-- CTET Paper II — Practice Paper 1
-- Full-Length Practice Paper (24 questions, 35 minutes)
-- Marking: +1 correct / -0 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('93eb8fa9-9340-4304-998a-c406b29629a7', 'ctet-paper2-practice-1', 'CTET Paper II Practice Paper 1', 'ctet-paper2', ARRAY['CTET', 'Paper 2', 'Child Development', 'Pedagogy', 'Language', 'Science', 'Elementary Teaching']::TEXT[], 24, 'standard', true, 1, 35, 1, 0);

-- ── Section: Child Development and Pedagogy (7 questions) — Real CTET previous-year Child Development & Pedagogy question -- shared pedagogy-theory syllabus with Paper I, cross-verified via gkseries.com's CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b13ad45d-2896-4258-925b-e4f34986d17c', '93eb8fa9-9340-4304-998a-c406b29629a7', 1, 'Mastery-oriented learners typically attribute success to ________ and failure to ________.', 'CDP', 'Attribution Theory', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04acb5df-d74c-47c4-b78c-1baa16ad75f2', 'b13ad45d-2896-4258-925b-e4f34986d17c', 0, 'Ability and good luck; task difficulty');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c10418a-5d38-4b64-a1cb-506ca37e7c9a', 'b13ad45d-2896-4258-925b-e4f34986d17c', 1, 'Ability and effort; bad luck');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec84c5b3-28a6-4875-9d79-986c80c9697c', 'b13ad45d-2896-4258-925b-e4f34986d17c', 2, 'Ability and good luck; low ability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c5dd1f4-7703-4def-aae2-9f45f486eba8', 'b13ad45d-2896-4258-925b-e4f34986d17c', 3, 'Ability and effort; insufficient effort');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b13ad45d-2896-4258-925b-e4f34986d17c', '3c5dd1f4-7703-4def-aae2-9f45f486eba8', 'Mastery-oriented learners attribute success to ability and effort, and failure to insufficient (fixable) effort rather than fixed low ability -- what sustains their motivation to keep trying.', 'Real CTET previous-year Child Development & Pedagogy question -- shared pedagogy-theory syllabus with Paper I, cross-verified via gkseries.com''s CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f167f24f-77e9-478e-a932-b36f8c88c97c', '93eb8fa9-9340-4304-998a-c406b29629a7', 2, 'Which of the following is a characteristic of a gifted learner?', 'CDP', 'Gifted Learners', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88dbff1e-f722-4a87-b20b-65785429fd8b', 'f167f24f-77e9-478e-a932-b36f8c88c97c', 0, 'He gets aggressive and frustrated');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('facd828c-5916-4f56-8153-eed8b265b57c', 'f167f24f-77e9-478e-a932-b36f8c88c97c', 1, 'He can feel under-stimulated and bored if class activities are not challenging enough');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78d0f245-49f4-41ad-b5a3-8e2bb019e7c5', 'f167f24f-77e9-478e-a932-b36f8c88c97c', 2, 'He is highly temperamental');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c009c6f6-1498-41dc-b591-15e49902f39d', 'f167f24f-77e9-478e-a932-b36f8c88c97c', 3, 'He engages in ritualistic behaviour like hand flapping, rocking, etc.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f167f24f-77e9-478e-a932-b36f8c88c97c', 'facd828c-5916-4f56-8153-eed8b265b57c', 'Under-stimulation and boredom with insufficiently challenging work is a well-documented real characteristic of gifted learners specifically -- the other options describe unrelated or different conditions.', 'Real CTET previous-year Child Development & Pedagogy question -- shared pedagogy-theory syllabus with Paper I, cross-verified via gkseries.com''s CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('24774a9e-21a2-4b95-b962-43c68a4f6274', '93eb8fa9-9340-4304-998a-c406b29629a7', 3, '"Having a diverse classroom with varied social, economic and cultural backgrounds enriches the learning experiences of all students." This statement is', 'CDP', 'Diverse Classrooms', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b0688ae-6e1c-4811-aa34-e0fc7651836d', '24774a9e-21a2-4b95-b962-43c68a4f6274', 0, 'incorrect, because it can confuse the children and they may feel lost');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd6814d6-366d-4b9b-b22d-656b5dcf2ad6', '24774a9e-21a2-4b95-b962-43c68a4f6274', 1, 'correct, because children learn many skills from their peers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('727c75e9-88b4-4553-9a74-f4dac87f9b60', '24774a9e-21a2-4b95-b962-43c68a4f6274', 2, 'correct, because it makes the classroom more hierarchical');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e05cfe1d-b951-4d64-b0d1-c3e29db89ee8', '24774a9e-21a2-4b95-b962-43c68a4f6274', 3, 'incorrect, because it leads to unnecessary competition');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('24774a9e-21a2-4b95-b962-43c68a4f6274', 'cd6814d6-366d-4b9b-b22d-656b5dcf2ad6', 'Genuine diversity enriches learning because students learn real skills and perspectives from peer interaction across difference -- not because it creates hierarchy or confusion.', 'Real CTET previous-year Child Development & Pedagogy question -- shared pedagogy-theory syllabus with Paper I, cross-verified via gkseries.com''s CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('68c18f7e-175c-4a7c-91df-a303e9487d2a', '93eb8fa9-9340-4304-998a-c406b29629a7', 4, 'A child with hearing impairment:', 'CDP', 'Inclusive Education — Hearing Impairment', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ffa5cc48-8488-4068-9fea-469222debf11', '68c18f7e-175c-4a7c-91df-a303e9487d2a', 0, 'should be sent only to a school for the hearing impaired and not to a regular school');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a17dc8a8-6cf5-4c0f-ba3e-409b5c9e6dc4', '68c18f7e-175c-4a7c-91df-a303e9487d2a', 1, 'will not benefit from academic education only and should be given vocational training instead');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6158b813-bd01-498e-9ff4-e9c79084558d', '68c18f7e-175c-4a7c-91df-a303e9487d2a', 2, 'can do very well in a regular school if suitable facilitation and resources are provided');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96b6c565-aa66-4efc-8253-ab8ca0b282fe', '68c18f7e-175c-4a7c-91df-a303e9487d2a', 3, 'will never be able to perform on a par with classmates in a regular school');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('68c18f7e-175c-4a7c-91df-a303e9487d2a', '6158b813-bd01-498e-9ff4-e9c79084558d', 'With appropriate facilitation and resources, a child with hearing impairment can genuinely succeed in a regular (inclusive) school setting -- segregation or assuming permanent underperformance are not supported inclusive-education positions.', 'Real CTET previous-year Child Development & Pedagogy question -- shared pedagogy-theory syllabus with Paper I, cross-verified via gkseries.com''s CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0ae8b62d-db4f-44e2-b33b-5a4f01defba0', '93eb8fa9-9340-4304-998a-c406b29629a7', 5, 'A teacher can enhance learning in her effective elementary classroom by:', 'CDP', 'Enhancing Learning', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8b8de1d-7cac-44cb-82d0-bb040e0f7469', '0ae8b62d-db4f-44e2-b33b-5a4f01defba0', 0, 'offering rewards for small steps in learning');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e930c2ea-8fec-4148-8309-10ad200d8b2e', '0ae8b62d-db4f-44e2-b33b-5a4f01defba0', 1, 'drill and practice competition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5cac6140-1ac8-46fd-b6fd-7c5dd9ef49bd', '0ae8b62d-db4f-44e2-b33b-5a4f01defba0', 2, 'encouraging amongst her students');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('14109627-eb5e-4865-abf9-998943c25c4c', '0ae8b62d-db4f-44e2-b33b-5a4f01defba0', 3, 'connecting the content to the lives of the students');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0ae8b62d-db4f-44e2-b33b-5a4f01defba0', '14109627-eb5e-4865-abf9-998943c25c4c', 'Connecting content to students'' real lives is a genuinely effective, well-supported pedagogical strategy for elementary learning -- more so than reward-for-small-steps, drilling, or vague ''encouragement'' alone.', 'Real CTET previous-year Child Development & Pedagogy question -- shared pedagogy-theory syllabus with Paper I, cross-verified via gkseries.com''s CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c18aa6d4-b49b-43b4-9f8a-7998b6807a05', '93eb8fa9-9340-4304-998a-c406b29629a7', 6, 'As a teacher who firmly believes in the social constructivist theory of Lev Vygotsky, which of the following methods would you prefer for assessing your students?', 'CDP', 'Vygotsky — Assessment Methods', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68dee1cd-70e2-4fb7-afe2-c2373cff2923', 'c18aa6d4-b49b-43b4-9f8a-7998b6807a05', 0, 'Collaborative projects');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e56fb877-afd7-45c9-a9e5-81fcc57a42a0', 'c18aa6d4-b49b-43b4-9f8a-7998b6807a05', 1, 'Standardized tests');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('383a08ac-c385-4da5-a2ef-1dc3722e3b23', 'c18aa6d4-b49b-43b4-9f8a-7998b6807a05', 2, 'Fact-based recall questions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a03da83-c076-4191-8134-64f494bfd2e1', 'c18aa6d4-b49b-43b4-9f8a-7998b6807a05', 3, 'Objective multiple-choice type questions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c18aa6d4-b49b-43b4-9f8a-7998b6807a05', '68dee1cd-70e2-4fb7-afe2-c2373cff2923', 'Social constructivism holds knowledge is built through social interaction -- collaborative projects assess learning consistent with that theory, unlike isolated individual recall-based testing.', 'Real CTET previous-year Child Development & Pedagogy question -- shared pedagogy-theory syllabus with Paper I, cross-verified via gkseries.com''s CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('74ff2ac8-e694-4515-9a39-ab5e6a8d8723', '93eb8fa9-9340-4304-998a-c406b29629a7', 7, 'Assessment is purposeful if:', 'CDP', 'Purpose of Assessment', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9538616-3f06-450f-a986-925f1e51c0dd', '74ff2ac8-e694-4515-9a39-ab5e6a8d8723', 0, 'it induces fear and stress among the students');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df05782f-4858-44b9-9359-e86dcba932a7', '74ff2ac8-e694-4515-9a39-ab5e6a8d8723', 1, 'it serves as feedback for the students as well as the teachers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f474c4e-c9f1-413e-9d76-70fdf862a536', '74ff2ac8-e694-4515-9a39-ab5e6a8d8723', 2, 'it is done only once at the end of the year');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('617f695f-815b-4517-b6a1-eeb82ae01d78', '74ff2ac8-e694-4515-9a39-ab5e6a8d8723', 3, 'comparative evaluations are made to differentiate between students'' achievements');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('74ff2ac8-e694-4515-9a39-ab5e6a8d8723', 'df05782f-4858-44b9-9359-e86dcba932a7', 'Purposeful assessment functions as two-way feedback for both learner and teacher, not as a one-time, fear-inducing, or purely comparative exercise.', 'Real CTET previous-year Child Development & Pedagogy question -- shared pedagogy-theory syllabus with Paper I, cross-verified via gkseries.com''s CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

-- ── Section: Language Pedagogy (7 questions) — Real CTET previous-year English/Language Pedagogy question -- shared pedagogy-theory syllabus with Paper I, sourced from testbook.com's CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e6ff5259-b488-41d3-bea0-33412e6d50e3', '93eb8fa9-9340-4304-998a-c406b29629a7', 8, 'In language learning, the ''Language through Literature'' approach helps learners achieve their main aim of improving knowledge and proficiency in English. Literary texts stimulate language activities because:', 'Language Pedagogy', 'Language through Literature', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3fd203f-eda2-4a38-b810-87bd05287f85', 'e6ff5259-b488-41d3-bea0-33412e6d50e3', 0, 'Literature provides learners with concrete context for language use');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0077fd99-b3b2-4e15-8fdd-e6a14cbaa0f2', 'e6ff5259-b488-41d3-bea0-33412e6d50e3', 1, 'They present different aspects of humanity, broadening learners'' perspective');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2cc1dbbc-81d2-432f-9354-d3c71c08db63', 'e6ff5259-b488-41d3-bea0-33412e6d50e3', 2, 'Literary language suits development of learners'' language abilities');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('014cbf27-c571-4aa4-bb0b-6d77eed1e3bf', 'e6ff5259-b488-41d3-bea0-33412e6d50e3', 3, 'All of the above');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e6ff5259-b488-41d3-bea0-33412e6d50e3', '014cbf27-c571-4aa4-bb0b-6d77eed1e3bf', 'All three reasons genuinely contribute to why literary texts are pedagogically effective -- concrete context, broadened perspective, and developmentally appropriate language, together.', 'Real CTET previous-year English/Language Pedagogy question -- shared pedagogy-theory syllabus with Paper I, sourced from testbook.com''s CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('06b9de37-c154-478d-8f74-3af0923d30bc', '93eb8fa9-9340-4304-998a-c406b29629a7', 9, '''Pedagogical Grammar'' means:', 'Language Pedagogy', 'Pedagogical Grammar', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f47f2235-d2b1-4801-b647-831cb7c9d99d', '06b9de37-c154-478d-8f74-3af0923d30bc', 0, 'Begin from form and move on to use');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3810603-d146-49ac-a4d3-1add71b29ce0', '06b9de37-c154-478d-8f74-3af0923d30bc', 1, 'Teaching through immersion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa46dca7-b23e-4697-88cc-7b11e855b983', '06b9de37-c154-478d-8f74-3af0923d30bc', 2, 'All grammar teaching should be rule focused');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8714f29-19c8-4500-9abc-90d57a6942f3', '06b9de37-c154-478d-8f74-3af0923d30bc', 3, 'Teaching grammar in context');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('06b9de37-c154-478d-8f74-3af0923d30bc', 'f8714f29-19c8-4500-9abc-90d57a6942f3', 'Pedagogical grammar specifically means teaching grammar embedded in meaningful context, not as isolated rules divorced from actual use.', 'Real CTET previous-year English/Language Pedagogy question -- shared pedagogy-theory syllabus with Paper I, sourced from testbook.com''s CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9ca438ab-3f09-4c76-9915-681eaad4584e', '93eb8fa9-9340-4304-998a-c406b29629a7', 10, 'When a child learns language naturally, without much conscious effort or practice, it is called:', 'Language Pedagogy', 'Acquisition Definition', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85f8f9aa-99f1-4b50-a19d-6fe05e18b673', '9ca438ab-3f09-4c76-9915-681eaad4584e', 0, 'Language adaptation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aaf50862-ca5e-4f80-bd40-5723bd1c83f1', '9ca438ab-3f09-4c76-9915-681eaad4584e', 1, 'Language learning');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de318f55-2717-4c7f-8ff1-5e5620d9f77a', '9ca438ab-3f09-4c76-9915-681eaad4584e', 2, 'Language acquisition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ece24ac-0007-42fd-b90f-83d4d975e89b', '9ca438ab-3f09-4c76-9915-681eaad4584e', 3, 'Language generalization');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9ca438ab-3f09-4c76-9915-681eaad4584e', 'de318f55-2717-4c7f-8ff1-5e5620d9f77a', 'Natural, low-effort language development is termed language acquisition, distinct from deliberate, effortful ''learning'' in language-pedagogy theory.', 'Real CTET previous-year English/Language Pedagogy question -- shared pedagogy-theory syllabus with Paper I, sourced from testbook.com''s CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a9e2e519-2241-4e3d-8367-0cf462d45b5f', '93eb8fa9-9340-4304-998a-c406b29629a7', 11, 'Continuous comprehensive evaluation is:', 'Language Pedagogy', 'Continuous Comprehensive Evaluation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3146b0b2-6181-413a-9049-40df0e43f32e', 'a9e2e519-2241-4e3d-8367-0cf462d45b5f', 0, 'Continuous testing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5868f1bf-1532-4601-8168-1b111c3654e9', 'a9e2e519-2241-4e3d-8367-0cf462d45b5f', 1, 'Continuous assessment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c6950f1-4b8c-445a-93ce-24dfd9957568', 'a9e2e519-2241-4e3d-8367-0cf462d45b5f', 2, 'Assessment of learners while learning');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c5a6c7c-4719-47f5-9f92-89a4ad0aeda4', 'a9e2e519-2241-4e3d-8367-0cf462d45b5f', 3, 'Periodic conduct of exams');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a9e2e519-2241-4e3d-8367-0cf462d45b5f', '3c6950f1-4b8c-445a-93ce-24dfd9957568', 'CCE means genuinely ongoing assessment integrated into the learning process, not more frequent testing or periodic formal exams.', 'Real CTET previous-year English/Language Pedagogy question -- shared pedagogy-theory syllabus with Paper I, sourced from testbook.com''s CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a7e3bef8-3737-4d6e-9935-7167c5aaac1f', '93eb8fa9-9340-4304-998a-c406b29629a7', 12, 'A language teacher asks learners to write a paragraph on ''scarcity of water.'' Learners gather information from science and social science books before writing. This task aims at:', 'Language Pedagogy', 'Language Across the Curriculum', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00c2a523-ae3d-4551-b31c-d36381afc2a3', 'a7e3bef8-3737-4d6e-9935-7167c5aaac1f', 0, 'Developing scientific attitude');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5bba83ca-5f82-4b81-864a-2df9d3883210', 'a7e3bef8-3737-4d6e-9935-7167c5aaac1f', 1, 'Completing syllabus of other subjects simultaneously');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2777e0a-1b7a-4be9-97eb-c85cf00b064d', 'a7e3bef8-3737-4d6e-9935-7167c5aaac1f', 2, 'Achieving language learning across the curriculum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb24c566-da5f-4f29-8017-400dc9bbc6b4', 'a7e3bef8-3737-4d6e-9935-7167c5aaac1f', 3, 'Enhancing co-curricular skills');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a7e3bef8-3737-4d6e-9935-7167c5aaac1f', 'a2777e0a-1b7a-4be9-97eb-c85cf00b064d', 'Drawing content from other subject areas into a language-writing task exemplifies ''language across the curriculum'' -- language as a vehicle across subjects, not covering other syllabi.', 'Real CTET previous-year English/Language Pedagogy question -- shared pedagogy-theory syllabus with Paper I, sourced from testbook.com''s CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b08cc3a8-9e48-4870-9c03-f552cf0a7dd6', '93eb8fa9-9340-4304-998a-c406b29629a7', 13, 'A good language textbook should: (A) Contain learner-centered materials (B) Contain teacher-friendly instruction (C) Incorporate language skills throughout (D) Have more syntactical items. Which statements are true?', 'Language Pedagogy', 'Good Language Textbooks', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6278125-96e7-4f48-b025-1722e76432e0', 'b08cc3a8-9e48-4870-9c03-f552cf0a7dd6', 0, 'A, C and D');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06c17620-a84c-44cc-bfa0-e883b9639929', 'b08cc3a8-9e48-4870-9c03-f552cf0a7dd6', 1, 'B, C and D');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4205dd3-709b-40cf-a4ca-33a4e19269e8', 'b08cc3a8-9e48-4870-9c03-f552cf0a7dd6', 2, 'A, B and C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('368d8a11-fa73-4eed-9416-91cc9813d94d', 'b08cc3a8-9e48-4870-9c03-f552cf0a7dd6', 3, 'A, B and D');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b08cc3a8-9e48-4870-9c03-f552cf0a7dd6', 'e4205dd3-709b-40cf-a4ca-33a4e19269e8', 'A, B, and C describe genuine desirable textbook qualities; D (heavy isolated syntactical items) is not a marker of a good language textbook.', 'Real CTET previous-year English/Language Pedagogy question -- shared pedagogy-theory syllabus with Paper I, sourced from testbook.com''s CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('064077d1-4363-4341-8976-1223479a640c', '93eb8fa9-9340-4304-998a-c406b29629a7', 14, 'When a teacher quietly observes students during a collaborative grammar activity, the activity plays a ________ role.', 'Language Pedagogy', 'Diagnostic Observation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac1b7a21-b79a-42ea-9d98-ecc52cb2cca6', '064077d1-4363-4341-8976-1223479a640c', 0, 'Diagnostic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd21bfbd-d0d3-4e9b-99cb-16030f78e3ce', '064077d1-4363-4341-8976-1223479a640c', 1, 'Evaluative');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa6a5929-24a3-4b6f-a261-033b81980993', '064077d1-4363-4341-8976-1223479a640c', 2, 'Interactive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68c63d64-7622-4da9-84f2-3c2a8e5b7d30', '064077d1-4363-4341-8976-1223479a640c', 3, 'Record keeping');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('064077d1-4363-4341-8976-1223479a640c', 'ac1b7a21-b79a-42ea-9d98-ecc52cb2cca6', 'Quiet observation to understand where students currently stand functions diagnostically -- identifying needs/gaps -- rather than formally evaluative.', 'Real CTET previous-year English/Language Pedagogy question -- shared pedagogy-theory syllabus with Paper I, sourced from testbook.com''s CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

-- ── Section: Science and Pedagogy (10 questions) — Real CTET/TET previous-year Science Pedagogy question, sourced from testbook.com's dedicated Science Pedagogy MCQ solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f5302c17-d9d7-4f59-9fa8-c7145f0eddfe', '93eb8fa9-9340-4304-998a-c406b29629a7', 15, 'Why is it important to use a child''s immediate surroundings and local resources in teaching science?', 'Science Pedagogy', 'Local Resources in Science Teaching', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81662b2a-63bf-4e0e-9a07-982623918767', 'f5302c17-d9d7-4f59-9fa8-c7145f0eddfe', 0, 'Because it limits science learning to only local examples and immediate environment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10912cc2-f1a9-484a-9643-6ff1e12f5d9e', 'f5302c17-d9d7-4f59-9fa8-c7145f0eddfe', 1, 'Because it reduces the need for textbooks and laboratories');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d07b3e7-fd07-4fbd-9939-a1528cf3fbaf', 'f5302c17-d9d7-4f59-9fa8-c7145f0eddfe', 2, 'Because children''s daily life experiences and interactions help develop scientific attitudes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44d9a453-786e-4d84-92bd-e55c7f1774b2', 'f5302c17-d9d7-4f59-9fa8-c7145f0eddfe', 3, 'Because it allows teachers to avoid planning lessons and teaching materials in advance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f5302c17-d9d7-4f59-9fa8-c7145f0eddfe', '8d07b3e7-fd07-4fbd-9939-a1528cf3fbaf', 'Using local, familiar experiences genuinely helps children develop scientific attitudes by grounding abstract concepts in what they already know, not as a shortcut around lesson planning or a limitation on scope.', 'Real CTET/TET previous-year Science Pedagogy question, sourced from testbook.com''s dedicated Science Pedagogy MCQ solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7f399089-f9bf-45fd-8c1c-015fc6a8e4e0', '93eb8fa9-9340-4304-998a-c406b29629a7', 16, 'Which of the following best describes the approach of a Science Club?', 'Science Pedagogy', 'Science Clubs', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a9dd03b-cb30-4aac-a98c-70c28319ab40', '7f399089-f9bf-45fd-8c1c-015fc6a8e4e0', 0, 'Ignoring new ideas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e458ffb-ef92-47e1-9626-a294d0df5edd', '7f399089-f9bf-45fd-8c1c-015fc6a8e4e0', 1, 'Learning Science with fun');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d59a486-7ea8-436e-880d-955c408ee404', '7f399089-f9bf-45fd-8c1c-015fc6a8e4e0', 2, 'Focusing on rote learning');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0be98e45-66a0-4d20-ae70-d8c23a5c1bff', '7f399089-f9bf-45fd-8c1c-015fc6a8e4e0', 3, 'Discouraging questions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7f399089-f9bf-45fd-8c1c-015fc6a8e4e0', '5e458ffb-ef92-47e1-9626-a294d0df5edd', 'Science clubs are pedagogically meant to make science engaging and enjoyable, explicitly the opposite of rote learning or discouraging curiosity.', 'Real CTET/TET previous-year Science Pedagogy question, sourced from testbook.com''s dedicated Science Pedagogy MCQ solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('002fde93-2369-45f9-af00-b11c00d4ad50', '93eb8fa9-9340-4304-998a-c406b29629a7', 17, 'A science kit in school education is primarily needed to:', 'Science Pedagogy', 'Science Kits', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('387c355c-958a-4ad6-b964-bba5dd9bf014', '002fde93-2369-45f9-af00-b11c00d4ad50', 0, 'Emphasise memorisation of scientific definitions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b7ec49c-4c52-4d48-9725-e00352d5a775', '002fde93-2369-45f9-af00-b11c00d4ad50', 1, 'Replace classroom teaching and teacher guidance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64f638ab-87de-4699-8cce-e461b4ce8f3a', '002fde93-2369-45f9-af00-b11c00d4ad50', 2, 'Support hands-on learning of basic scientific concepts');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e127f7be-bbc5-41da-a9e9-71f30de3cec7', '002fde93-2369-45f9-af00-b11c00d4ad50', 3, 'Limit learning to textbook-based instruction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('002fde93-2369-45f9-af00-b11c00d4ad50', '64f638ab-87de-4699-8cce-e461b4ce8f3a', 'A science kit''s real pedagogical purpose is enabling hands-on, experiential learning of concepts -- not replacing the teacher or promoting rote memorization.', 'Real CTET/TET previous-year Science Pedagogy question, sourced from testbook.com''s dedicated Science Pedagogy MCQ solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f600141e-0804-4266-86d0-f6010d5d2b4b', '93eb8fa9-9340-4304-998a-c406b29629a7', 18, 'Which of the following best describes the nature of science as a discipline?', 'Science Pedagogy', 'Nature of Science', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc18930c-03d0-46bb-a019-3a6f318ff78d', 'f600141e-0804-4266-86d0-f6010d5d2b4b', 0, 'Science never changes its theories');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6cf4581-8c57-48dd-a50b-8a89db1be66c', 'f600141e-0804-4266-86d0-f6010d5d2b4b', 1, 'Science is based on myths and beliefs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d1fe21a-7ce5-4734-bfb4-1842987e4b80', 'f600141e-0804-4266-86d0-f6010d5d2b4b', 2, 'Science only studies living things');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd755f24-65fc-4ce3-99ec-d0deeae4b9a5', 'f600141e-0804-4266-86d0-f6010d5d2b4b', 3, 'Science is based on observation and experimentation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f600141e-0804-4266-86d0-f6010d5d2b4b', 'fd755f24-65fc-4ce3-99ec-d0deeae4b9a5', 'The defining nature of science as a discipline is its grounding in observation and experimentation -- not fixed, unchanging theory, myth, or a restriction to living things only.', 'Real CTET/TET previous-year Science Pedagogy question, sourced from testbook.com''s dedicated Science Pedagogy MCQ solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('20a36af2-85a8-472d-bd7d-183bcc321faa', '93eb8fa9-9340-4304-998a-c406b29629a7', 19, 'Which aspect best demonstrates the self-correcting nature of science as a discipline?', 'Science Pedagogy', 'Self-Correcting Nature of Science', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('818895fa-91b7-4493-96a6-9ba0a0802c7d', '20a36af2-85a8-472d-bd7d-183bcc321faa', 0, 'Personal opinions of scientists');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b21d4be1-00f1-4e8f-bbca-63ac1d49291c', '20a36af2-85a8-472d-bd7d-183bcc321faa', 1, 'Peer review and replication of studies');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a6c0e65-e7c7-4c49-bc8d-57320ee7e05f', '20a36af2-85a8-472d-bd7d-183bcc321faa', 2, 'Use of traditional beliefs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbfafeca-7cd9-4c65-90dd-933cc4622b45', '20a36af2-85a8-472d-bd7d-183bcc321faa', 3, 'Random selection of observations');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('20a36af2-85a8-472d-bd7d-183bcc321faa', 'b21d4be1-00f1-4e8f-bbca-63ac1d49291c', 'Peer review and replication are the actual mechanisms by which science corrects its own errors over time -- not personal opinion, tradition, or unsystematic observation.', 'Real CTET/TET previous-year Science Pedagogy question, sourced from testbook.com''s dedicated Science Pedagogy MCQ solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9a342ef9-95d8-46a0-91d1-cd87b38a2e87', '93eb8fa9-9340-4304-998a-c406b29629a7', 20, 'Which of the following statements best describes the nature of science?', 'Science Pedagogy', 'Social Nature of Science', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff93e0fe-97e3-430d-aa18-d2faa20c1cae', '9a342ef9-95d8-46a0-91d1-cd87b38a2e87', 0, 'Scientists are totally objective in their work');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d15d39f-c008-427d-9d35-95487e97475d', '9a342ef9-95d8-46a0-91d1-cd87b38a2e87', 1, 'The scientific method is the only guide for conducting research');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70309d6c-8a69-4466-91fd-3f210076300e', '9a342ef9-95d8-46a0-91d1-cd87b38a2e87', 2, 'Science is a system of beliefs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58e4fe0d-b4e3-4858-9a6d-2958c1541468', '9a342ef9-95d8-46a0-91d1-cd87b38a2e87', 3, 'Science is social in nature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9a342ef9-95d8-46a0-91d1-cd87b38a2e87', '58e4fe0d-b4e3-4858-9a6d-2958c1541468', 'Contemporary understanding of science''s nature emphasizes its social character (collaborative, community-validated), rather than claiming scientists are perfectly objective or that there''s one single rigid ''scientific method.''', 'Real CTET/TET previous-year Science Pedagogy question, sourced from testbook.com''s dedicated Science Pedagogy MCQ solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b1ba1b5a-8fce-49e8-a3bf-fe65246818b0', '93eb8fa9-9340-4304-998a-c406b29629a7', 21, 'Continuous and comprehensive evaluation in science means—', 'Science Pedagogy', 'Continuous and Comprehensive Evaluation in Science', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e7b4f1f-9bc4-4ee3-adb4-5ebba7416ae0', 'b1ba1b5a-8fce-49e8-a3bf-fe65246818b0', 0, 'Summative and formative assessment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8db2872f-3a16-41f0-bc70-d99f23e06805', 'b1ba1b5a-8fce-49e8-a3bf-fe65246818b0', 1, 'More frequent tests and examinations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92535aac-b496-4609-b5d0-716107fb06ca', 'b1ba1b5a-8fce-49e8-a3bf-fe65246818b0', 2, 'Routine activities and exercises to assess learning');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3349e336-13ee-48a1-88da-2d4c64fbda9c', 'b1ba1b5a-8fce-49e8-a3bf-fe65246818b0', 3, 'Evaluation of all aspects of science');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b1ba1b5a-8fce-49e8-a3bf-fe65246818b0', '3349e336-13ee-48a1-88da-2d4c64fbda9c', 'CCE in science is meant to evaluate all aspects of a learner''s engagement with science (concepts, skills, attitudes), not just more frequent testing or a narrow routine-exercise view.', 'Real CTET/TET previous-year Science Pedagogy question, sourced from testbook.com''s dedicated Science Pedagogy MCQ solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e073760a-c63f-449f-b1ef-92b3ac63a663', '93eb8fa9-9340-4304-998a-c406b29629a7', 22, 'The value of Science for nature is', 'Science Pedagogy', 'Values of Science', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6680be6-4379-45f9-9a1a-e0d32d198a74', 'e073760a-c63f-449f-b1ef-92b3ac63a663', 0, 'Possibility');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1269670d-f7c3-4a54-8588-44c17d78003f', 'e073760a-c63f-449f-b1ef-92b3ac63a663', 1, 'Reality');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0502b3cc-3278-443e-893e-22d00d609605', 'e073760a-c63f-449f-b1ef-92b3ac63a663', 2, 'Interim');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2340f813-638a-4c59-8356-7b343f02aab4', 'e073760a-c63f-449f-b1ef-92b3ac63a663', 3, 'Uncertainty');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e073760a-c63f-449f-b1ef-92b3ac63a663', '1269670d-f7c3-4a54-8588-44c17d78003f', 'Science''s value in relation to nature is grounded in seeking an accurate account of reality -- the actual, verifiable state of the natural world.', 'Real CTET/TET previous-year Science Pedagogy question, sourced from testbook.com''s dedicated Science Pedagogy MCQ solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a3f161e2-2343-4810-90ca-b05e8316e0de', '93eb8fa9-9340-4304-998a-c406b29629a7', 23, 'The full form of ''GSM'' technology used in mobile phones is', 'Science Pedagogy', 'GSM Technology', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8e29f0c-5bb8-4d1d-a3cc-bf7a4cc3ac65', 'a3f161e2-2343-4810-90ca-b05e8316e0de', 0, 'Geo Satellite for Mobile');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5661edc4-0610-4d1a-9d7c-dd11c9423d26', 'a3f161e2-2343-4810-90ca-b05e8316e0de', 1, 'Global System for Mobility');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af9e6ad1-24b1-4ae8-b5d6-91c474cd0821', 'a3f161e2-2343-4810-90ca-b05e8316e0de', 2, 'Global System for Mobile');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff204753-0ce6-4e0e-8816-0e37f5a4d0ca', 'a3f161e2-2343-4810-90ca-b05e8316e0de', 3, 'Geo Station for Mobility');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a3f161e2-2343-4810-90ca-b05e8316e0de', 'af9e6ad1-24b1-4ae8-b5d6-91c474cd0821', 'GSM stands for Global System for Mobile (Communications) -- a factual technology-general-knowledge item within the Science section.', 'Real CTET/TET previous-year Science Pedagogy question, sourced from testbook.com''s dedicated Science Pedagogy MCQ solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('02a02749-ff4c-43a0-8b1a-02c1f422583c', '93eb8fa9-9340-4304-998a-c406b29629a7', 24, 'Shyam informs his teacher in an online class that he was asked by his father to provide food to neighboring poor children during the Covid lockdown. This behaviour will be recorded in which of the following tools to assess the co-scholastic aspect?', 'Science Pedagogy', 'Co-Scholastic Assessment Tools', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d27f70af-3226-4888-b9e6-fa71d9d5459d', '02a02749-ff4c-43a0-8b1a-02c1f422583c', 0, 'Rating scale');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('042ab90e-ba08-47b6-8b89-2f1314c51a20', '02a02749-ff4c-43a0-8b1a-02c1f422583c', 1, 'Observation schedule');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e635b42e-f9d3-4a27-9bd0-ef5ab9a5cb43', '02a02749-ff4c-43a0-8b1a-02c1f422583c', 2, 'Portfolio');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bfbe77d5-aa22-4790-b887-764fea7ea302', '02a02749-ff4c-43a0-8b1a-02c1f422583c', 3, 'Anecdotal Record');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('02a02749-ff4c-43a0-8b1a-02c1f422583c', 'bfbe77d5-aa22-4790-b887-764fea7ea302', 'A specific, spontaneously-reported incident of a child''s behaviour is recorded as an anecdotal record -- a narrative account of a specific event, not a rating scale, observation schedule, or portfolio (which serve different assessment purposes).', 'Real CTET/TET previous-year Science Pedagogy question, sourced from testbook.com''s dedicated Science Pedagogy MCQ solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');
