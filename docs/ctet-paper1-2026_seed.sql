-- ============================================================
-- CTET Paper I — Practice Paper 1
-- Full-Length Practice Paper (37 questions, 45 minutes)
-- Marking: +1 correct / -0 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('d5be807f-06b6-48c2-9227-608b84c5b329', 'ctet-paper1-practice-1', 'CTET Paper I Practice Paper 1', 'ctet-paper1', ARRAY['CTET', 'Paper 1', 'Child Development', 'Pedagogy', 'Language', 'Mathematics', 'EVS', 'Primary Teaching']::TEXT[], 37, 'standard', true, 1, 45, 1, 0);

-- ── Section: Child Development and Pedagogy (10 questions) — Real CTET previous-year Child Development & Pedagogy question, cross-verified via gkseries.com's CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e7ae6e15-5fcc-47de-89fb-2ea0a2397f8b', 'd5be807f-06b6-48c2-9227-608b84c5b329', 1, 'Mastery-oriented learners typically attribute success to ________ and failure to ________.', 'CDP', 'Attribution Theory', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b06f27b5-00cc-4276-8edd-b59f13795df2', 'e7ae6e15-5fcc-47de-89fb-2ea0a2397f8b', 0, 'Ability and good luck; task difficulty');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f500f6a-5290-41d5-8ff3-7edc500d0401', 'e7ae6e15-5fcc-47de-89fb-2ea0a2397f8b', 1, 'Ability and effort; bad luck');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('760c679a-f523-46f2-8b02-30ccaf5e2c66', 'e7ae6e15-5fcc-47de-89fb-2ea0a2397f8b', 2, 'Ability and good luck; low ability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb227084-34ee-4965-ab7b-089116f84253', 'e7ae6e15-5fcc-47de-89fb-2ea0a2397f8b', 3, 'Ability and effort; insufficient effort');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e7ae6e15-5fcc-47de-89fb-2ea0a2397f8b', 'bb227084-34ee-4965-ab7b-089116f84253', 'Mastery-oriented learners attribute success to their own ability and effort, and attribute failure to insufficient effort (something controllable and fixable), not to fixed low ability -- this is what keeps them motivated to keep trying.', 'Real CTET previous-year Child Development & Pedagogy question, cross-verified via gkseries.com''s CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5e2e28b6-94d6-48a8-b2af-99b02de92f44', 'd5be807f-06b6-48c2-9227-608b84c5b329', 2, 'Which of the following statements represents the ''Proximodistal'' principle of development?', 'CDP', 'Developmental Principles', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08f7f4e5-984a-4b61-b293-9efa9674899a', '5e2e28b6-94d6-48a8-b2af-99b02de92f44', 0, 'Development is multidirectional and multidimensional');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d4d3b2f-3e95-4e3a-b5f9-0843ca72b9e8', '5e2e28b6-94d6-48a8-b2af-99b02de92f44', 1, 'Identical twins living in different cultures can develop at different rates');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d03418db-72cc-42fb-ae3f-c5d29b39f58d', '5e2e28b6-94d6-48a8-b2af-99b02de92f44', 2, 'Children develop the ability to grasp a ball before putting beads in a thread');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f22c1fb4-68b9-4ddf-97bf-5f0506cf101b', '5e2e28b6-94d6-48a8-b2af-99b02de92f44', 3, 'Children develop the ability to sit up before standing');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5e2e28b6-94d6-48a8-b2af-99b02de92f44', 'd03418db-72cc-42fb-ae3f-c5d29b39f58d', 'Proximodistal development proceeds from the center (proximal) of the body outward (distal) -- gross arm/shoulder control (grasping) develops before the fine finger control needed for threading beads.', 'Real CTET previous-year Child Development & Pedagogy question, cross-verified via gkseries.com''s CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a048f050-bdc3-4cad-b966-60331e867092', 'd5be807f-06b6-48c2-9227-608b84c5b329', 3, 'According to Vygotsky, children speak to themselves —', 'CDP', 'Vygotsky — Private Speech', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f813602-6fff-4eba-a4c5-de384871ef3b', 'a048f050-bdc3-4cad-b966-60331e867092', 0, 'To provide self-reinforcement when adults are ignoring them');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a611118-1f94-466f-a28d-442073f15347', 'a048f050-bdc3-4cad-b966-60331e867092', 1, 'To aid thought and for self-regulation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aeaa29cb-3c25-4201-b882-2410bfcde913', 'a048f050-bdc3-4cad-b966-60331e867092', 2, 'Because they are egocentric');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d381a0b6-ed5c-4bca-a288-79bbdee8b7c3', 'a048f050-bdc3-4cad-b966-60331e867092', 3, 'Because their thought is illogical');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a048f050-bdc3-4cad-b966-60331e867092', '4a611118-1f94-466f-a28d-442073f15347', 'Vygotsky viewed children''s private/self-directed speech as a genuine cognitive tool aiding thought and self-regulation, not (as Piaget originally framed it) mere immature egocentrism.', 'Real CTET previous-year Child Development & Pedagogy question, cross-verified via gkseries.com''s CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7df7b3db-f89e-4ef5-93ef-671cd71d7280', 'd5be807f-06b6-48c2-9227-608b84c5b329', 4, 'Challenges in social communication are evident in —', 'CDP', 'Inclusive Education — Disability', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('189a6de4-d45e-47dc-aed4-8750260be6f6', '7df7b3db-f89e-4ef5-93ef-671cd71d7280', 0, 'Attention Deficit Hyperactivity Disorder');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7104a470-ca7c-48c4-aee6-e659d8c0d0a9', '7df7b3db-f89e-4ef5-93ef-671cd71d7280', 1, 'Cerebral Palsy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abc28162-961a-4baa-9221-952b018c43b2', '7df7b3db-f89e-4ef5-93ef-671cd71d7280', 2, 'Autism Spectrum Disorder');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5061e3c3-2529-4f0d-88d0-1bb37aebbe8a', '7df7b3db-f89e-4ef5-93ef-671cd71d7280', 3, 'Learning Disabilities');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7df7b3db-f89e-4ef5-93ef-671cd71d7280', 'abc28162-961a-4baa-9221-952b018c43b2', 'Difficulty with social communication and interaction is a core, defining characteristic of Autism Spectrum Disorder specifically, distinguishing it from the other listed conditions.', 'Real CTET previous-year Child Development & Pedagogy question, cross-verified via gkseries.com''s CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('81b2aa7a-a9fe-4dae-8732-d9575f6bea91', 'd5be807f-06b6-48c2-9227-608b84c5b329', 5, 'As a teacher who firmly believes in the social constructivist theory of Lev Vygotsky, which of the following methods would you prefer for assessing your students?', 'CDP', 'Vygotsky — Assessment Methods', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c72e2c19-8a8e-4161-a383-74011fd51eb6', '81b2aa7a-a9fe-4dae-8732-d9575f6bea91', 0, 'Collaborative projects');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0aaf2a20-736e-4370-afd2-c8fbf381ee23', '81b2aa7a-a9fe-4dae-8732-d9575f6bea91', 1, 'Standardized tests');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a240216-f473-4c1a-8f04-c8acb6735c3a', '81b2aa7a-a9fe-4dae-8732-d9575f6bea91', 2, 'Fact-based recall questions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9172aa5-3ba1-4187-81c1-b15b39c92459', '81b2aa7a-a9fe-4dae-8732-d9575f6bea91', 3, 'Objective multiple-choice type questions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('81b2aa7a-a9fe-4dae-8732-d9575f6bea91', 'c72e2c19-8a8e-4161-a383-74011fd51eb6', 'Social constructivism holds that knowledge is built through social interaction -- collaborative projects assess learning in a way consistent with that theory, unlike isolated, individual, recall-based testing formats.', 'Real CTET previous-year Child Development & Pedagogy question, cross-verified via gkseries.com''s CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f1ca2b70-ce76-4ae8-9ba3-745007d37b02', 'd5be807f-06b6-48c2-9227-608b84c5b329', 6, 'To cater to individual differences in his classroom, a teacher should:', 'CDP', 'Individual Differences', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('723cdce6-8e80-42bf-be43-d49f6eff0f86', 'f1ca2b70-ce76-4ae8-9ba3-745007d37b02', 0, 'have uniform and standard ways of teaching and assessment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('639795cf-9537-42db-81d3-6b25c12d9d30', 'f1ca2b70-ce76-4ae8-9ba3-745007d37b02', 1, 'segregate and label children based on their marks');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f32066e-6e86-430d-bc8c-9f804010b4db', 'f1ca2b70-ce76-4ae8-9ba3-745007d37b02', 2, 'engage in a dialogue with students and value their perspectives');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1ff5736-1b2d-4efd-8f64-baf13adaaa99', 'f1ca2b70-ce76-4ae8-9ba3-745007d37b02', 3, 'impose strict rules upon his students');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f1ca2b70-ce76-4ae8-9ba3-745007d37b02', '7f32066e-6e86-430d-bc8c-9f804010b4db', 'Catering to individual differences requires actually engaging with each student''s perspective, not applying one uniform method, labeling by marks, or imposing rigid uniform rules.', 'Real CTET previous-year Child Development & Pedagogy question, cross-verified via gkseries.com''s CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('dcb2b60f-a950-464a-b8e2-a48bbbb53757', 'd5be807f-06b6-48c2-9227-608b84c5b329', 7, 'Assessment is purposeful if:', 'CDP', 'Purpose of Assessment', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a6ef179-e2b6-4068-be59-81256a1dffa9', 'dcb2b60f-a950-464a-b8e2-a48bbbb53757', 0, 'it induces fear and stress among the students');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5bdf70c-a879-4d43-acb7-fb975f120f57', 'dcb2b60f-a950-464a-b8e2-a48bbbb53757', 1, 'it serves as a feedback for the students as well as the teachers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1223dd0-56d6-4099-a26e-cf894b06ab44', 'dcb2b60f-a950-464a-b8e2-a48bbbb53757', 2, 'it is done only once at the end of the year');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d61ef2e3-8374-43ea-913a-b476259a25cb', 'dcb2b60f-a950-464a-b8e2-a48bbbb53757', 3, 'comparative evaluations are made to differentiate between students'' achievements');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dcb2b60f-a950-464a-b8e2-a48bbbb53757', 'd5bdf70c-a879-4d43-acb7-fb975f120f57', 'Purposeful assessment functions as two-way feedback -- informing both the student''s own learning and the teacher''s instruction -- rather than being a one-time, fear-inducing, or purely comparative/ranking exercise.', 'Real CTET previous-year Child Development & Pedagogy question, cross-verified via gkseries.com''s CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6ba97044-bad8-4157-a41a-715afd6ab90c', 'd5be807f-06b6-48c2-9227-608b84c5b329', 8, 'According to NCF, 2005, the role of a teacher has to be', 'CDP', 'NCF 2005 — Teacher''s Role', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2464502-1236-471f-aed9-0272b1e52d6d', '6ba97044-bad8-4157-a41a-715afd6ab90c', 0, 'authoritative');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('11fe1425-0411-4bf7-bd86-1d2a985f8023', '6ba97044-bad8-4157-a41a-715afd6ab90c', 1, 'dictatorial');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('537c7325-a88c-479c-8e03-8eddc54b9419', '6ba97044-bad8-4157-a41a-715afd6ab90c', 2, 'permissive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c165559-fe00-4a54-b5f0-e473134c481e', '6ba97044-bad8-4157-a41a-715afd6ab90c', 3, 'facilitative');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6ba97044-bad8-4157-a41a-715afd6ab90c', '4c165559-fe00-4a54-b5f0-e473134c481e', 'NCF 2005 explicitly frames the teacher''s role as a facilitator of children''s own construction of knowledge, not an authoritative, dictatorial, or purely permissive figure.', 'Real CTET previous-year Child Development & Pedagogy question, cross-verified via gkseries.com''s CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('999f8e7f-5c09-4a34-97d2-fa9370091325', 'd5be807f-06b6-48c2-9227-608b84c5b329', 9, 'Research suggests that in a diverse classroom, a teacher''s expectations from her students ___ their learning.', 'CDP', 'Teacher Expectations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04293dc9-36b0-40aa-a34e-d88188b0cfc8', '999f8e7f-5c09-4a34-97d2-fa9370091325', 0, 'have a significant impact on');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ae3f794-fc43-44d9-a3b5-fd6c50675339', '999f8e7f-5c09-4a34-97d2-fa9370091325', 1, 'are the sole determinant of');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9384bdd-22cf-4429-ada6-f2c3c96b734e', '999f8e7f-5c09-4a34-97d2-fa9370091325', 2, 'should not be correlated with');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f412533f-9c61-4e75-b948-73554ebee5ea', '999f8e7f-5c09-4a34-97d2-fa9370091325', 3, 'do not have any effect on');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('999f8e7f-5c09-4a34-97d2-fa9370091325', '04293dc9-36b0-40aa-a34e-d88188b0cfc8', 'This reflects the well-documented ''teacher expectancy effect'' -- expectations meaningfully influence (though don''t solely determine) student learning outcomes.', 'Real CTET previous-year Child Development & Pedagogy question, cross-verified via gkseries.com''s CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1dc4a47c-a85f-4f18-bb01-3a62182743e4', 'd5be807f-06b6-48c2-9227-608b84c5b329', 10, 'Inclusion of children with special needs', 'CDP', 'Inclusive Education — Attitude', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38eed7a8-56cc-41c4-925c-9a3a28ada88c', '1dc4a47c-a85f-4f18-bb01-3a62182743e4', 0, 'is an unrealistic goal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('112d1bea-4c4a-42b9-bd89-b45778f401a9', '1dc4a47c-a85f-4f18-bb01-3a62182743e4', 1, 'is detrimental to children without disabilities');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27c6e9c5-f964-4b37-a6ec-22f731f0dfbc', '1dc4a47c-a85f-4f18-bb01-3a62182743e4', 2, 'will increase the burden on schools');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d676de6-d4b1-4cfd-ae73-b76e51cf7b9f', '1dc4a47c-a85f-4f18-bb01-3a62182743e4', 3, 'requires a change in attitude, content and approach to teaching');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1dc4a47c-a85f-4f18-bb01-3a62182743e4', '8d676de6-d4b1-4cfd-ae73-b76e51cf7b9f', 'Genuine inclusion requires systemic change -- in attitude, curriculum content, and teaching approach -- not merely placing children with special needs in a classroom unchanged.', 'Real CTET previous-year Child Development & Pedagogy question, cross-verified via gkseries.com''s CTET PYQ compilation and (for the Vygotsky/social-constructivist item) independently corroborated on testbook.com. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

-- ── Section: Language I / II Pedagogy (8 questions) — Real CTET previous-year English/Language Pedagogy question, sourced from testbook.com's CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('674c70de-cb01-4695-959f-b28bff803462', 'd5be807f-06b6-48c2-9227-608b84c5b329', 11, 'In language learning, the ''Language through Literature'' approach helps learners achieve their main aim of improving knowledge and proficiency in English. Literary texts stimulate language activities because:', 'Language Pedagogy', 'Language through Literature', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e264a4a4-926a-4827-92e7-525e98e88898', '674c70de-cb01-4695-959f-b28bff803462', 0, 'Literature provides learners with concrete context for language use');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37010d9a-b635-4caa-ba11-0cdebe4a6e0d', '674c70de-cb01-4695-959f-b28bff803462', 1, 'They present different aspects of humanity, broadening learners'' perspective');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35315bdf-390c-4546-9885-e86e7bd8ca85', '674c70de-cb01-4695-959f-b28bff803462', 2, 'Literary language suits development of learners'' language abilities');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88bcea64-269a-4805-8dbc-fa7b9b720970', '674c70de-cb01-4695-959f-b28bff803462', 3, 'All of the above');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('674c70de-cb01-4695-959f-b28bff803462', '88bcea64-269a-4805-8dbc-fa7b9b720970', 'All three reasons genuinely contribute to why literary texts are effective for language teaching -- concrete context, broadened perspective, and language-development-appropriate style together, not any single one alone.', 'Real CTET previous-year English/Language Pedagogy question, sourced from testbook.com''s CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6281ae42-ef3a-4a28-b897-dadb2831cb13', 'd5be807f-06b6-48c2-9227-608b84c5b329', 12, 'The language learned from environment without explicit teaching is:', 'Language Pedagogy', 'Acquisition vs Learning', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1525fa73-01a6-45a2-97d9-d0ce6270dfbd', '6281ae42-ef3a-4a28-b897-dadb2831cb13', 0, 'Second language');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b25c66e-aaa0-46e7-9cdb-034301b819d6', '6281ae42-ef3a-4a28-b897-dadb2831cb13', 1, 'Third language');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3228ef4d-b1ff-4e4e-ab36-6931a4b00fa0', '6281ae42-ef3a-4a28-b897-dadb2831cb13', 2, 'School language');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e65dcf55-9196-4464-aea1-b056029ec3dd', '6281ae42-ef3a-4a28-b897-dadb2831cb13', 3, 'First language');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6281ae42-ef3a-4a28-b897-dadb2831cb13', 'e65dcf55-9196-4464-aea1-b056029ec3dd', 'A first (native/mother) language is typically acquired naturally from the surrounding environment without deliberate, explicit instruction -- the classic acquisition-vs-learning distinction in language pedagogy.', 'Real CTET previous-year English/Language Pedagogy question, sourced from testbook.com''s CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a71f8375-3c94-4f69-ad6b-23c46e40bce6', 'd5be807f-06b6-48c2-9227-608b84c5b329', 13, '''Pedagogical Grammar'' means:', 'Language Pedagogy', 'Pedagogical Grammar', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6822d59b-4645-499d-b0c6-5651001be3e8', 'a71f8375-3c94-4f69-ad6b-23c46e40bce6', 0, 'Begin from form and move on to use');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2c19227-26d6-428b-8e45-a942eb1f6318', 'a71f8375-3c94-4f69-ad6b-23c46e40bce6', 1, 'Teaching through immersion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b4493a7-692e-4c25-b449-00761af51fdf', 'a71f8375-3c94-4f69-ad6b-23c46e40bce6', 2, 'All grammar teaching should be rule focused');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1cce53f-3e01-4e16-9920-eee04b48eaf4', 'a71f8375-3c94-4f69-ad6b-23c46e40bce6', 3, 'Teaching grammar in context');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a71f8375-3c94-4f69-ad6b-23c46e40bce6', 'e1cce53f-3e01-4e16-9920-eee04b48eaf4', 'Pedagogical grammar specifically means teaching grammar embedded in meaningful context, not as isolated rules taught before or separate from actual language use.', 'Real CTET previous-year English/Language Pedagogy question, sourced from testbook.com''s CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f209e1a6-59eb-4713-a02f-c30e5f575b53', 'd5be807f-06b6-48c2-9227-608b84c5b329', 14, 'When a teacher quietly observes students during a collaborative grammar activity, the activity plays a ________ role.', 'Language Pedagogy', 'Formative Role of Activities', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9abedac0-fc6e-4f29-90b7-7c276f4d7cfe', 'f209e1a6-59eb-4713-a02f-c30e5f575b53', 0, 'Diagnostic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3917adec-31ff-47f7-a648-385c1455e6d2', 'f209e1a6-59eb-4713-a02f-c30e5f575b53', 1, 'Evaluative');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef17e796-89ca-4ca1-8f08-37d0e5a4534a', 'f209e1a6-59eb-4713-a02f-c30e5f575b53', 2, 'Interactive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1cea3709-4a31-485c-b0d7-6c4aa8a3c1d1', 'f209e1a6-59eb-4713-a02f-c30e5f575b53', 3, 'Record keeping');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f209e1a6-59eb-4713-a02f-c30e5f575b53', '9abedac0-fc6e-4f29-90b7-7c276f4d7cfe', 'Quiet observation during an activity, used to understand where students currently stand, functions diagnostically -- identifying gaps/needs -- rather than formally evaluative or purely record-keeping.', 'Real CTET previous-year English/Language Pedagogy question, sourced from testbook.com''s CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('23843413-8b1f-4721-93cd-1bfbaf97660c', 'd5be807f-06b6-48c2-9227-608b84c5b329', 15, 'When a child learns language naturally, without much conscious effort or practice, it is called:', 'Language Pedagogy', 'Acquisition Definition', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e3d46b9-bef8-414d-b100-7929da41e725', '23843413-8b1f-4721-93cd-1bfbaf97660c', 0, 'Language adaptation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90d4fcdd-f9ea-4610-87da-0f5e11bb34da', '23843413-8b1f-4721-93cd-1bfbaf97660c', 1, 'Language learning');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25a2dec3-6dda-4548-9ba5-b8d9752411e1', '23843413-8b1f-4721-93cd-1bfbaf97660c', 2, 'Language acquisition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5c24414-4f4f-4af2-bef4-0ab307de6bb6', '23843413-8b1f-4721-93cd-1bfbaf97660c', 3, 'Language generalization');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('23843413-8b1f-4721-93cd-1bfbaf97660c', '25a2dec3-6dda-4548-9ba5-b8d9752411e1', 'Natural, low-effort language development (as opposed to deliberate, effortful ''learning'') is termed language acquisition in language-pedagogy theory.', 'Real CTET previous-year English/Language Pedagogy question, sourced from testbook.com''s CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('217e0d8c-545d-4ae2-abdb-25077d74f94c', 'd5be807f-06b6-48c2-9227-608b84c5b329', 16, 'A good language textbook should: (A) Contain learner-centered materials (B) Contain teacher-friendly instruction (C) Incorporate language skills throughout (D) Have more syntactical items. Which statements are true?', 'Language Pedagogy', 'Good Language Textbooks', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24688f21-9626-4bd7-a553-99d3eaf3537f', '217e0d8c-545d-4ae2-abdb-25077d74f94c', 0, 'A, C and D');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66d6aaa2-5e61-46c2-8523-351bcc3e32db', '217e0d8c-545d-4ae2-abdb-25077d74f94c', 1, 'B, C and D');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a26a5355-c375-4a2f-bbcf-307f3973c247', '217e0d8c-545d-4ae2-abdb-25077d74f94c', 2, 'A, B and C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('925570ce-1c90-4482-a5a0-00f29127f462', '217e0d8c-545d-4ae2-abdb-25077d74f94c', 3, 'A, B and D');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('217e0d8c-545d-4ae2-abdb-25077d74f94c', 'a26a5355-c375-4a2f-bbcf-307f3973c247', 'A, B, and C describe genuine desirable textbook qualities (learner-centered, teacher-friendly, skills-integrated); D (heavy on isolated syntactical items) is not considered a marker of a good language textbook.', 'Real CTET previous-year English/Language Pedagogy question, sourced from testbook.com''s CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a8a5855e-81aa-4289-b864-c3440248916f', 'd5be807f-06b6-48c2-9227-608b84c5b329', 17, 'Continuous comprehensive evaluation is:', 'Language Pedagogy', 'Continuous Comprehensive Evaluation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('582711b3-c465-48bf-80f3-4ede1bd45dfd', 'a8a5855e-81aa-4289-b864-c3440248916f', 0, 'Continuous testing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4debb555-fd87-4490-af8e-c6de776526f4', 'a8a5855e-81aa-4289-b864-c3440248916f', 1, 'Continuous assessment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc607bd9-c070-442b-849e-5263b2b9d275', 'a8a5855e-81aa-4289-b864-c3440248916f', 2, 'Assessment of learners while learning');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('267883ea-e22e-4f4c-9397-f7bbd10fce60', 'a8a5855e-81aa-4289-b864-c3440248916f', 3, 'Periodic conduct of exams');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a8a5855e-81aa-4289-b864-c3440248916f', 'fc607bd9-c070-442b-849e-5263b2b9d275', 'CCE means genuinely ongoing assessment integrated into the learning process itself, not simply more frequent testing or periodic formal exams.', 'Real CTET previous-year English/Language Pedagogy question, sourced from testbook.com''s CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('13619f09-f8d5-4a30-83b4-4a0a4d122d33', 'd5be807f-06b6-48c2-9227-608b84c5b329', 18, 'A language teacher asks learners to write a paragraph on ''scarcity of water.'' Learners gather information from science and social science books before writing. This task aims at:', 'Language Pedagogy', 'Language Across the Curriculum', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c391db5d-bd15-46ad-8155-b2b34b9e2198', '13619f09-f8d5-4a30-83b4-4a0a4d122d33', 0, 'Developing scientific attitude');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5e0db26-9a06-4aa5-acf5-cd8de2329ec2', '13619f09-f8d5-4a30-83b4-4a0a4d122d33', 1, 'Completing syllabus of other subjects simultaneously');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d512d76c-fbc8-406e-8b6d-cca380cc2d06', '13619f09-f8d5-4a30-83b4-4a0a4d122d33', 2, 'Achieving language learning across the curriculum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('61743803-d5a7-4270-b7e8-dbd953025d08', '13619f09-f8d5-4a30-83b4-4a0a4d122d33', 3, 'Enhancing co-curricular skills');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('13619f09-f8d5-4a30-83b4-4a0a4d122d33', 'd512d76c-fbc8-406e-8b6d-cca380cc2d06', 'Deliberately drawing content from other subject areas into a language-writing task exemplifies ''language across the curriculum'' -- using language skills as a vehicle across subjects, not merely covering other subjects'' syllabi.', 'Real CTET previous-year English/Language Pedagogy question, sourced from testbook.com''s CTET English Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

-- ── Section: Mathematics and Pedagogy (9 questions) — Real CTET previous-year Mathematics Pedagogy question, sourced from testbook.com's CTET Mathematics Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f00e6772-dc1d-410c-bfbc-d93e562f17d6', 'd5be807f-06b6-48c2-9227-608b84c5b329', 19, 'Beads can be used to explain which of the following concepts?', 'Mathematics Pedagogy', 'Concrete Manipulatives', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2b15018-955b-45f9-8326-1c4752f21b48', 'f00e6772-dc1d-410c-bfbc-d93e562f17d6', 0, 'Number sense, fractions, patterns');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1e92c42-7f62-463e-bbaa-72ecbf172a74', 'f00e6772-dc1d-410c-bfbc-d93e562f17d6', 1, 'Fractions, place value, volume');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f581bff-8729-4dfe-b520-350bf23605a2', 'f00e6772-dc1d-410c-bfbc-d93e562f17d6', 2, 'Number sense, patterns, volume');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8fd7f24b-f150-413e-bfcc-1f5287c688e2', 'f00e6772-dc1d-410c-bfbc-d93e562f17d6', 3, 'Number sense, tessellations, place value');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f00e6772-dc1d-410c-bfbc-d93e562f17d6', 'a2b15018-955b-45f9-8326-1c4752f21b48', 'Beads (countable, groupable, sequenceable objects) are well-suited concrete manipulatives for number sense, fractions (grouping), and patterns -- not naturally suited for volume or tessellation concepts.', 'Real CTET previous-year Mathematics Pedagogy question, sourced from testbook.com''s CTET Mathematics Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('927b7c45-99c6-4599-a8dd-eb259a8a0719', 'd5be807f-06b6-48c2-9227-608b84c5b329', 20, 'Which of the following is NOT a process in Geometry?', 'Mathematics Pedagogy', 'Geometry Processes', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('337220c4-43b6-4c11-8996-19e74cf425d3', '927b7c45-99c6-4599-a8dd-eb259a8a0719', 0, 'Measurement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('52047ef9-82d7-45f6-b6ba-9c95b7eb59dd', '927b7c45-99c6-4599-a8dd-eb259a8a0719', 1, 'Representation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d8ec2bd-5bc7-424c-94e4-541886bcf748', '927b7c45-99c6-4599-a8dd-eb259a8a0719', 2, 'Procedural fluency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57b072dc-f211-4ece-a6f5-df54a74cbc23', '927b7c45-99c6-4599-a8dd-eb259a8a0719', 3, 'Reasoning and proof');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('927b7c45-99c6-4599-a8dd-eb259a8a0719', '7d8ec2bd-5bc7-424c-94e4-541886bcf748', 'Measurement, representation, and reasoning/proof are recognized geometry-specific processes; ''procedural fluency'' is a general mathematical-proficiency strand, not a geometry-specific process.', 'Real CTET previous-year Mathematics Pedagogy question, sourced from testbook.com''s CTET Mathematics Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b7714822-8a47-488b-8cca-1ebe824295df', 'd5be807f-06b6-48c2-9227-608b84c5b329', 21, 'To solve 27 × 4, a student uses the following strategy: 27 × 4 → 30 × 4 = 120, then 3 × 4 = 12, then 120 − 12 = 108. Which of the following is most appropriate for the strategy used by the student?', 'Mathematics Pedagogy', 'Mental Math Strategies', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80948e89-9f3d-4da9-9c3f-67b45e4816cb', 'b7714822-8a47-488b-8cca-1ebe824295df', 0, 'The student has estimated the answer through this strategy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('badd6ed8-2299-4032-bc78-6e310fe19d62', 'b7714822-8a47-488b-8cca-1ebe824295df', 1, 'The student has used compensation strategies for multiplication');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f035835-4c17-4a06-97c6-8da69093dabf', 'b7714822-8a47-488b-8cca-1ebe824295df', 2, 'The student has arrived at the answer by hit and trial method');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8186ba5e-7ce2-4fd5-ad5d-25fe0fa85320', 'b7714822-8a47-488b-8cca-1ebe824295df', 3, 'It is an inappropriate algorithm to solve a problem on multiplication');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b7714822-8a47-488b-8cca-1ebe824295df', 'badd6ed8-2299-4032-bc78-6e310fe19d62', 'Rounding 27 up to a friendlier 30, multiplying, then subtracting back the excess (3×4) is a genuine, appropriate mental-math compensation strategy -- not estimation, guessing, or an invalid method.', 'Real CTET previous-year Mathematics Pedagogy question, sourced from testbook.com''s CTET Mathematics Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('76446f20-8ae1-4dd5-a469-be7a941a2f52', 'd5be807f-06b6-48c2-9227-608b84c5b329', 22, 'Which of the following cannot be included in Formative Assessment?', 'Mathematics Pedagogy', 'Formative Assessment', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f06bd84-c602-473c-b716-b6032896cc75', '76446f20-8ae1-4dd5-a469-be7a941a2f52', 0, 'Anecdotal records');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32c1e203-5a9c-4a43-a0ff-a8df8766ab5d', '76446f20-8ae1-4dd5-a469-be7a941a2f52', 1, 'Term-end examination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09e22732-24b5-48a0-ac71-54b4dff1c8c7', '76446f20-8ae1-4dd5-a469-be7a941a2f52', 2, 'Field trips');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8003dd25-50d6-4d76-8655-793531feefb2', '76446f20-8ae1-4dd5-a469-be7a941a2f52', 3, 'Portfolios');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('76446f20-8ae1-4dd5-a469-be7a941a2f52', '32c1e203-5a9c-4a43-a0ff-a8df8766ab5d', 'A term-end examination is summative by nature (a final judgment at the end), not formative (ongoing, feedback-oriented during learning) -- the other three are genuine formative-assessment tools.', 'Real CTET previous-year Mathematics Pedagogy question, sourced from testbook.com''s CTET Mathematics Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9d6ba161-c761-411c-8bf7-bb3359997bc9', 'd5be807f-06b6-48c2-9227-608b84c5b329', 23, 'Which skill is expressed in the following statement that will help a child understand the quantification of objects? "The child mentally includes one in two, two in three, three in four, four in five, and so on."', 'Mathematics Pedagogy', 'Hierarchical Inclusion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2e2aa88-2300-474a-b552-028d22d05e71', '9d6ba161-c761-411c-8bf7-bb3359997bc9', 0, 'Equality');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d47df1d-0ee9-42ab-aa4d-49a94f071c9e', '9d6ba161-c761-411c-8bf7-bb3359997bc9', 1, 'Hierarchical inclusion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('366762f1-227b-49cc-a7c9-9a6255cef78d', '9d6ba161-c761-411c-8bf7-bb3359997bc9', 2, 'Reverse conservation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('168989f9-5afc-4cff-bb05-359457b33e77', '9d6ba161-c761-411c-8bf7-bb3359997bc9', 3, 'Normalization');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9d6ba161-c761-411c-8bf7-bb3359997bc9', '8d47df1d-0ee9-42ab-aa4d-49a94f071c9e', 'Understanding that each number mentally ''contains'' the ones before it (2 contains 1, 3 contains 2 and 1, etc.) is precisely the concept of hierarchical inclusion in early number-sense development.', 'Real CTET previous-year Mathematics Pedagogy question, sourced from testbook.com''s CTET Mathematics Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0a2fcad9-5202-42f8-83d9-0f8052bafa03', 'd5be807f-06b6-48c2-9227-608b84c5b329', 24, 'Which of the following is a desirable feature of a good mathematical question?', 'Mathematics Pedagogy', 'Good Mathematical Questions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9749fe64-37dc-4607-b6cc-019346a7c2bd', '0a2fcad9-5202-42f8-83d9-0f8052bafa03', 0, 'The question should require more than the recall or replication of a fact or procedure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9be7c0d-ab2a-4861-b930-642ba5fd4537', '0a2fcad9-5202-42f8-83d9-0f8052bafa03', 1, 'The question should always be closed-ended as it is easier for the teacher to evaluate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c85f5e48-d8da-4fe0-bf2a-90bc17ed748c', '0a2fcad9-5202-42f8-83d9-0f8052bafa03', 2, 'The question should be devoid of all contextual situations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6999fd3-7943-42ed-bd26-f65a23850acd', '0a2fcad9-5202-42f8-83d9-0f8052bafa03', 3, 'The question should be similar to what is given in the textbook');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0a2fcad9-5202-42f8-83d9-0f8052bafa03', '9749fe64-37dc-4607-b6cc-019346a7c2bd', 'A good mathematical question pushes students beyond rote recall toward genuine reasoning -- the opposite of favoring closed-ended, context-free, textbook-identical questions purely for ease of grading.', 'Real CTET previous-year Mathematics Pedagogy question, sourced from testbook.com''s CTET Mathematics Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('40a804df-e125-4c3b-9f79-db476e76faca', 'd5be807f-06b6-48c2-9227-608b84c5b329', 25, 'Engaging students in mathematical activities at primary level can help in many ways like: (a) Providing opportunities to explore abstract concepts and learn computational strategies (b) Helping utilize free periods in the timetable (c) Helping students deepen mathematical understanding and reasoning (d) Serving as a tool for summative assessment. Choose the correct option:', 'Mathematics Pedagogy', 'Purpose of Math Activities', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab8b851c-7e64-47c6-84f6-da70f82d83c0', '40a804df-e125-4c3b-9f79-db476e76faca', 0, '(a) and (d)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c853076-9d8c-47a8-b80c-528866d1193d', '40a804df-e125-4c3b-9f79-db476e76faca', 1, '(b) and (c)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7700ad10-1001-44c3-9e23-cd814f6f09ab', '40a804df-e125-4c3b-9f79-db476e76faca', 2, '(b) and (d)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a923bc3d-0e3c-4b48-a29f-600f495d1083', '40a804df-e125-4c3b-9f79-db476e76faca', 3, '(a) and (c)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('40a804df-e125-4c3b-9f79-db476e76faca', 'a923bc3d-0e3c-4b48-a29f-600f495d1083', 'Genuine mathematical activities serve real pedagogical purposes -- exploring concepts (a) and deepening reasoning (c) -- not filling free time (b) or functioning as summative assessment tools (d).', 'Real CTET previous-year Mathematics Pedagogy question, sourced from testbook.com''s CTET Mathematics Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f3e833d2-55cf-4c15-8cc5-ef4d6007e9f4', 'd5be807f-06b6-48c2-9227-608b84c5b329', 26, 'In which of the following statements is the number ''four'' used in the cardinal sense?', 'Mathematics Pedagogy', 'Cardinal Number Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1261753b-1a6e-4277-912f-70ddcb9b32a0', 'f3e833d2-55cf-4c15-8cc5-ef4d6007e9f4', 0, 'My office is on the fourth floor of this building');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a79547fa-f0e7-415c-b3a7-36b4da4b2e38', 'f3e833d2-55cf-4c15-8cc5-ef4d6007e9f4', 1, 'My son ranked fourth in the competition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce4088f4-90fe-4fdb-98a1-8f57384e9977', 'f3e833d2-55cf-4c15-8cc5-ef4d6007e9f4', 2, 'The fourth chapter of this book is very interesting');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96bf7810-2455-4d06-b3d9-60433ad85f88', 'f3e833d2-55cf-4c15-8cc5-ef4d6007e9f4', 3, 'Four teams participated in the show');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f3e833d2-55cf-4c15-8cc5-ef4d6007e9f4', '96bf7810-2455-4d06-b3d9-60433ad85f88', 'Cardinal numbers denote quantity/count (''four teams'' = a count of 4); the other options use ''fourth'' in the ordinal sense, denoting position/rank/sequence, not quantity.', 'Real CTET previous-year Mathematics Pedagogy question, sourced from testbook.com''s CTET Mathematics Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('063d2915-23b1-4a55-8298-cf633fadaf04', 'd5be807f-06b6-48c2-9227-608b84c5b329', 27, 'The classroom-based assessment in mathematics should: (a) consider and respect the unique qualities, experience and expertise of all students (b) be presented in a focused, isolated manner different from mathematics instruction (c) reflect on what is being revealed about the thinking process of students. Choose the correct option:', 'Mathematics Pedagogy', 'Classroom-Based Assessment', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b60c321-4873-49f1-a5cc-d0c3770be641', '063d2915-23b1-4a55-8298-cf633fadaf04', 0, 'Only (a)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a357698f-ac8a-4e41-8a57-a18fcf9bc5a5', '063d2915-23b1-4a55-8298-cf633fadaf04', 1, '(b) and (c)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6991c772-d902-4512-bc92-45109bebc438', '063d2915-23b1-4a55-8298-cf633fadaf04', 2, '(a) and (b)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5efbf7f-bb38-4c65-b410-f9790e8cf107', '063d2915-23b1-4a55-8298-cf633fadaf04', 3, '(a) and (c)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('063d2915-23b1-4a55-8298-cf633fadaf04', 'c5efbf7f-bb38-4c65-b410-f9790e8cf107', 'Good classroom-based math assessment respects individual student differences (a) and reveals their actual thinking process (c) -- it should NOT be isolated from instruction (b), which is why (a) and (c) together is correct, not (b).', 'Real CTET previous-year Mathematics Pedagogy question, sourced from testbook.com''s CTET Mathematics Pedagogy solved-question set. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

-- ── Section: Environmental Studies (10 questions) — Real CTET previous-year Environmental Studies (EVS) question, cross-verified via gkseries.com's CTET EVS PYQ compilation. Specific exam session/date not determinable from available sources -- disclosed rather than invented. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3f71e163-6d59-418e-976e-4f568b3209a8', 'd5be807f-06b6-48c2-9227-608b84c5b329', 28, 'As an EVS teacher, you plan to take the students to the zoo. Which of the following activities would you NOT allow the students to undertake?', 'EVS Pedagogy', 'Field Trip Planning', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50aae956-16c5-4f97-99cc-766125e29f6a', '3f71e163-6d59-418e-976e-4f568b3209a8', 0, 'Take along lots of eatables for the animals at the zoo');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ce0f232-5c27-40b5-bd76-e7225fa498b4', '3f71e163-6d59-418e-976e-4f568b3209a8', 1, 'Try to find out the food taken up by different animals at the zoo');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a418533-3969-432d-8bb6-87f8b7a2494d', '3f71e163-6d59-418e-976e-4f568b3209a8', 2, 'Collect photographs of the animals they expect to see at the zoo');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46e7aa0a-ff48-45bd-bf36-707940bef06f', '3f71e163-6d59-418e-976e-4f568b3209a8', 3, 'Take their drawing books along with them to draw what they see at the zoo');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3f71e163-6d59-418e-976e-4f568b3209a8', '50aae956-16c5-4f97-99cc-766125e29f6a', 'Feeding zoo animals with random eatables brought from home is unsafe for the animals and against zoo rules -- the other three are genuine, appropriate observational/creative activities.', 'Real CTET previous-year Environmental Studies (EVS) question, cross-verified via gkseries.com''s CTET EVS PYQ compilation. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6ee62849-697f-4cde-a95e-0460da48022d', 'd5be807f-06b6-48c2-9227-608b84c5b329', 29, 'The concept of ''seed germination'' can be taught best by', 'EVS Pedagogy', 'Teaching Seed Germination', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d6e8502-6d8e-4e20-b64e-9922b3d1a1f9', '6ee62849-697f-4cde-a95e-0460da48022d', 0, 'asking the students to perform an activity to sow seeds, observe different stages and draw them');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c847032-d006-4cdb-aa4c-2e63dd714ec4', '6ee62849-697f-4cde-a95e-0460da48022d', 1, 'showing photographs of seed germination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0542872d-756b-46eb-a0a5-1f8e98bf4fe8', '6ee62849-697f-4cde-a95e-0460da48022d', 2, 'showing germinated seeds to the class and explaining the process');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e897f50a-2d27-408d-b56c-a52e42dc9bf9', '6ee62849-697f-4cde-a95e-0460da48022d', 3, 'presenting the germination stages through drawings on the board');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6ee62849-697f-4cde-a95e-0460da48022d', '0d6e8502-6d8e-4e20-b64e-9922b3d1a1f9', 'Direct hands-on experience -- sowing, observing over time, and recording -- teaches a process-based concept like germination far more effectively than passive photographs, pre-germinated samples, or board drawings alone.', 'Real CTET previous-year Environmental Studies (EVS) question, cross-verified via gkseries.com''s CTET EVS PYQ compilation. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b1d3a6c2-1165-4e4d-a39a-b6757e9e4466', 'd5be807f-06b6-48c2-9227-608b84c5b329', 30, 'Mira and Divya are young girls. Mira likes to eat samosas, cutlets and bread. Divya, on the other hand, takes an iron-deficient diet. Which of the following disorders are Mira and Divya likely to suffer from, respectively?', 'EVS Pedagogy', 'Nutritional Deficiency', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a25d791a-b93a-4595-94c1-cedd75ad5d12', 'b1d3a6c2-1165-4e4d-a39a-b6757e9e4466', 0, 'Obesity and scurvy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b06e2c51-2975-408b-8979-b47c05ee0313', 'b1d3a6c2-1165-4e4d-a39a-b6757e9e4466', 1, 'Scurvy and anaemia');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6140e68-0daf-46fa-a6fa-34f26c8cabf5', 'b1d3a6c2-1165-4e4d-a39a-b6757e9e4466', 2, 'Anaemia and night blindness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03d80914-ab77-4123-892e-9b0bcf9356b0', 'b1d3a6c2-1165-4e4d-a39a-b6757e9e4466', 3, 'Obesity and anaemia');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b1d3a6c2-1165-4e4d-a39a-b6757e9e4466', '03d80914-ab77-4123-892e-9b0bcf9356b0', 'A diet heavy in fried/refined foods (samosas, cutlets, bread) risks obesity; an iron-deficient diet directly causes anaemia -- matching Mira and Divya respectively.', 'Real CTET previous-year Environmental Studies (EVS) question, cross-verified via gkseries.com''s CTET EVS PYQ compilation. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('262eb1f9-4be9-457a-8974-8ae956a058dc', 'd5be807f-06b6-48c2-9227-608b84c5b329', 31, 'To make children aware of different kinds of fuel, a teacher can', 'EVS Pedagogy', 'Teaching Fuel Awareness', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7846991e-298c-4dac-9f87-818b0b890943', '262eb1f9-4be9-457a-8974-8ae956a058dc', 0, 'show some samples of fuels in the class');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6964b92-2765-4ab0-aaad-bf5e187a6812', '262eb1f9-4be9-457a-8974-8ae956a058dc', 1, 'discuss with children about possible kinds of fuel used for cooking, along with a short film');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c496860-3726-413e-9f31-aa38170f0520', '262eb1f9-4be9-457a-8974-8ae956a058dc', 2, 'show pictures of fuels on a chart');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('498e65e3-596c-4c22-9b6d-1e8e076b6867', '262eb1f9-4be9-457a-8974-8ae956a058dc', 3, 'ask children to list different fuels');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('262eb1f9-4be9-457a-8974-8ae956a058dc', 'a6964b92-2765-4ab0-aaad-bf5e187a6812', 'Combining discussion with a short film gives a richer, more engaging, multi-sensory introduction to the concept than static samples, pictures, or an unprompted listing exercise alone.', 'Real CTET previous-year Environmental Studies (EVS) question, cross-verified via gkseries.com''s CTET EVS PYQ compilation. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('543696e8-dd25-4c53-a38d-a531fa369322', 'd5be807f-06b6-48c2-9227-608b84c5b329', 32, 'The skills required to read a map include', 'EVS Pedagogy', 'Map-Reading Skills', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a89d042c-9105-4903-b005-fc0534690e24', '543696e8-dd25-4c53-a38d-a531fa369322', 0, 'excellent communication skills to draw out the expressive ability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9634d930-f6d4-4aab-968b-0bb1ab0441f2', '543696e8-dd25-4c53-a38d-a531fa369322', 1, 'ability to understand relative position of places, distances and directions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31b5fe2f-f0ba-47d3-90ef-7c9e29668b0b', '543696e8-dd25-4c53-a38d-a531fa369322', 2, 'excellent drawing and painting skills');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e26a5e45-735b-4ce8-973c-a4aa966b470c', '543696e8-dd25-4c53-a38d-a531fa369322', 3, 'ability to use calculations and sketch positions on a globe');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('543696e8-dd25-4c53-a38d-a531fa369322', '9634d930-f6d4-4aab-968b-0bb1ab0441f2', 'Map-reading is fundamentally about understanding relative position, distance, and direction -- not communication skill, artistic drawing ability, or globe-specific calculation.', 'Real CTET previous-year Environmental Studies (EVS) question, cross-verified via gkseries.com''s CTET EVS PYQ compilation. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ecb0088c-8edd-4911-af4a-8f9f9b96805c', 'd5be807f-06b6-48c2-9227-608b84c5b329', 33, 'Giving importance to individual experiences of children in an EVS class will benefit the teacher', 'EVS Pedagogy', 'Experiential Learning in EVS', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de0003f4-873f-4db1-b0ae-4a343a6f6988', 'ecb0088c-8edd-4911-af4a-8f9f9b96805c', 0, 'to connect the subject to the learners'' experiential world and promote reflection and learning');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff02abcf-2884-471d-8b73-b205177b9889', 'ecb0088c-8edd-4911-af4a-8f9f9b96805c', 1, 'to save her energy as children enjoy talking');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75c87aab-db8c-485a-bc38-495b72301f9c', 'ecb0088c-8edd-4911-af4a-8f9f9b96805c', 2, 'to know the unique experiences of children');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('090fbf7e-6028-4adb-8a16-e4332ed2607d', 'ecb0088c-8edd-4911-af4a-8f9f9b96805c', 3, 'to help and improve the language and communication skills of the children');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ecb0088c-8edd-4911-af4a-8f9f9b96805c', 'de0003f4-873f-4db1-b0ae-4a343a6f6988', 'The real pedagogical value of valuing individual experience is connecting subject matter to learners'' own world, promoting genuine reflection and learning -- not merely as an energy-saving or communication-skill side effect.', 'Real CTET previous-year Environmental Studies (EVS) question, cross-verified via gkseries.com''s CTET EVS PYQ compilation. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5b272502-4072-4ca4-924e-551878f50fbd', 'd5be807f-06b6-48c2-9227-608b84c5b329', 34, 'It has been observed that the process of digestion is faster inside the stomach than outside because', 'EVS Pedagogy', 'Digestion Rate', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0989ce39-62d0-450d-a822-6efbf4e20cb2', '5b272502-4072-4ca4-924e-551878f50fbd', 0, 'the digestive juices when kept outside the stomach become inactive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6472305c-89e3-444b-9f8f-860ecf888460', '5b272502-4072-4ca4-924e-551878f50fbd', 1, 'the food is churned in the stomach thereby increasing the surface area for quicker enzyme action');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81341bc4-449b-4d2c-9000-0640b898aa88', '5b272502-4072-4ca4-924e-551878f50fbd', 2, 'the digestive juices inside the stomach are acidic, while outside they are alkaline');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eac5556f-b5a8-46f2-b1c2-10dc1bf50304', '5b272502-4072-4ca4-924e-551878f50fbd', 3, 'the amount of digestive juices produced in the stomach in the presence of food is much more');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5b272502-4072-4ca4-924e-551878f50fbd', '6472305c-89e3-444b-9f8f-860ecf888460', 'The stomach''s churning action increases the food''s exposed surface area, letting digestive enzymes act faster -- the actual mechanical reason digestion is faster inside than in a static outside sample.', 'Real CTET previous-year Environmental Studies (EVS) question, cross-verified via gkseries.com''s CTET EVS PYQ compilation. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7c9fb5ad-e236-4c8b-8460-e4e62ec7de14', 'd5be807f-06b6-48c2-9227-608b84c5b329', 35, 'Which of the following statements is NOT an objective of teaching EVS at the primary level?', 'EVS Pedagogy', 'EVS Teaching Objectives', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c443b60-cc19-4b53-965b-0dba4b5c785d', '7c9fb5ad-e236-4c8b-8460-e4e62ec7de14', 0, 'To load learners with terms and definitions for assessment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d89a354-8e0e-4a93-a0b9-f7dd9a41b661', '7c9fb5ad-e236-4c8b-8460-e4e62ec7de14', 1, 'To internalise the values of concern for life and environment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40b8820a-9770-4a28-a7ed-6d32631359ac', '7c9fb5ad-e236-4c8b-8460-e4e62ec7de14', 2, 'Arouse curiosity about the natural and social environment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6def3ef6-b215-4c50-992b-865cffd15104', '7c9fb5ad-e236-4c8b-8460-e4e62ec7de14', 3, 'Engage in exploratory and hands-on activities that lead to the development of cognitive and psychomotor skills');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7c9fb5ad-e236-4c8b-8460-e4e62ec7de14', '3c443b60-cc19-4b53-965b-0dba4b5c785d', 'Rote-loading students with terms/definitions purely for assessment contradicts EVS''s actual stated objectives (curiosity, values, hands-on skill development) -- it''s the odd one out, not a genuine goal.', 'Real CTET previous-year Environmental Studies (EVS) question, cross-verified via gkseries.com''s CTET EVS PYQ compilation. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9051432c-90d5-4863-a411-92eae9dc95e9', 'd5be807f-06b6-48c2-9227-608b84c5b329', 36, 'An egret bird is often seen on a buffalo''s back. This is because the egret', 'EVS Pedagogy', 'Observational Ecology', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('768d9928-9393-46ad-b860-99d30c7679ea', '9051432c-90d5-4863-a411-92eae9dc95e9', 0, 'feeds on parasites on the buffalo''s back');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b1f8815-176d-49ac-a475-3578ad248887', '9051432c-90d5-4863-a411-92eae9dc95e9', 1, 'feeds on insects present in the grass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a00c707-d2d0-4ddc-a227-4cdab04a93b3', '9051432c-90d5-4863-a411-92eae9dc95e9', 2, 'loves to sing while sitting on the buffalo''s back');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5e2b35a-eca4-4690-bc12-07f45d8195ee', '9051432c-90d5-4863-a411-92eae9dc95e9', 3, 'rests after flying for a while');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9051432c-90d5-4863-a411-92eae9dc95e9', '768d9928-9393-46ad-b860-99d30c7679ea', 'Egrets perch on buffaloes specifically to feed on parasites/insects on and stirred up around the animal''s back and feet -- a real, commonly-cited EVS example of mutualistic/commensal ecological relationships.', 'Real CTET previous-year Environmental Studies (EVS) question, cross-verified via gkseries.com''s CTET EVS PYQ compilation. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('12d6f326-d630-4afb-9f5b-4ec1d4c9d706', 'd5be807f-06b6-48c2-9227-608b84c5b329', 37, 'The idea of showing a sample of a railway ticket in the EVS textbook is to', 'EVS Pedagogy', 'Real-World Learning Materials', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('198bfd65-ed4e-4be2-87db-c0181d820c12', '12d6f326-d630-4afb-9f5b-4ec1d4c9d706', 0, 'enhance the skills of students to arrive at conclusions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('041dba91-4e07-41b1-ba22-f889de3109d2', '12d6f326-d630-4afb-9f5b-4ec1d4c9d706', 1, 'give them an opportunity to interact with real information and develop the skill of observation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('673ff3ad-2f6a-45a7-a829-f5daf5cb9543', '12d6f326-d630-4afb-9f5b-4ec1d4c9d706', 2, 'give the students an idea of the rail fare');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('417fb5ab-975d-4762-85bf-28971bcb474b', '12d6f326-d630-4afb-9f5b-4ec1d4c9d706', 3, 'provide them the knowledge of various abbreviations used in the ticket');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('12d6f326-d630-4afb-9f5b-4ec1d4c9d706', '041dba91-4e07-41b1-ba22-f889de3109d2', 'Using a real-world artifact like a railway ticket is meant to develop genuine observational skill through interaction with authentic information, not primarily to teach fare amounts or abbreviation vocabulary.', 'Real CTET previous-year Environmental Studies (EVS) question, cross-verified via gkseries.com''s CTET EVS PYQ compilation. Specific exam session/date not determinable from available sources -- disclosed rather than invented.');
