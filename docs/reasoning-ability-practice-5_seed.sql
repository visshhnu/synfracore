-- ============================================================
-- Reasoning Ability — Practice Paper 5
-- Full-Length Practice Paper (20 questions, 15 minutes)
-- Marking: +1 correct / -0.25 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('a301a99d-f426-4b44-a9fa-93d0ba5fce71', 'reasoning-ability-practice-5', 'Reasoning Ability Practice Paper 5', 'reasoning-ability', ARRAY['Reasoning Ability', 'Banking', 'SSC', 'Railways', 'State PSC']::TEXT[], 20, 'standard', true, 5, 15, 1, 0.25);

-- ── Section: Reasoning Ability (20 questions) — Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam's specific paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('dff1a7e0-7841-430e-a251-0c9bb265d358', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 1, 'Seven people sit in a row facing north. A sits fourth from the left. How many people sit to the right of A?', 'Reasoning', 'Puzzles & Seating', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('52ff4f93-fd1f-4548-8612-d0133e33bfe3', 'dff1a7e0-7841-430e-a251-0c9bb265d358', 0, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db1c3ed4-465f-4519-b43a-458932e4e1d2', 'dff1a7e0-7841-430e-a251-0c9bb265d358', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc02c584-ebe8-4524-b410-e32f977f79a4', 'dff1a7e0-7841-430e-a251-0c9bb265d358', 2, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7db92d92-bed1-4c33-9445-1aaec3494109', 'dff1a7e0-7841-430e-a251-0c9bb265d358', 3, '5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dff1a7e0-7841-430e-a251-0c9bb265d358', '52ff4f93-fd1f-4548-8612-d0133e33bfe3', 'With 7 people and A at position 4, the people to the right occupy positions 5, 6, 7 -- 3 people.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7da21bfc-1ebc-41f2-96aa-6cfaac115f77', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 2, 'In a circular arrangement of 8 people facing the center, B sits second to the right of A. If A is at position 1 (numbered clockwise 1-8), find B''s position.', 'Reasoning', 'Puzzles & Seating', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('535ceda1-ca0c-4fcb-9ff2-f4bd6aa742b1', '7da21bfc-1ebc-41f2-96aa-6cfaac115f77', 0, 'Position 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8570d73-9c24-4e67-9aea-d284fbe33e7c', '7da21bfc-1ebc-41f2-96aa-6cfaac115f77', 1, 'Position 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9971ff67-9f44-4390-ad12-27b6b678df95', '7da21bfc-1ebc-41f2-96aa-6cfaac115f77', 2, 'Position 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1d8f5bf-d81d-46b7-9ab8-5170c207c1e9', '7da21bfc-1ebc-41f2-96aa-6cfaac115f77', 3, 'Position 5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7da21bfc-1ebc-41f2-96aa-6cfaac115f77', 'f8570d73-9c24-4e67-9aea-d284fbe33e7c', 'Moving 2 positions clockwise (to the right) from position 1 gives position 3.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e713a00e-33a4-4a1f-8206-fbab64cd0b5c', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 3, 'Statements: All actors are famous. Some famous people are wealthy. Conclusion: Some actors are wealthy. Is this valid?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e612de5-f8e2-4f1f-8b0b-66a481203f09', 'e713a00e-33a4-4a1f-8206-fbab64cd0b5c', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a58c45e1-e2cc-4ebd-aa4b-2d59d0c40524', 'e713a00e-33a4-4a1f-8206-fbab64cd0b5c', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a42a00b0-b9fe-44bf-8c01-fc293eebaee0', 'e713a00e-33a4-4a1f-8206-fbab64cd0b5c', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a36c2797-a86c-4e23-b9e1-91aaddf3f53a', 'e713a00e-33a4-4a1f-8206-fbab64cd0b5c', 3, 'Valid only if reversed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e713a00e-33a4-4a1f-8206-fbab64cd0b5c', 'a58c45e1-e2cc-4ebd-aa4b-2d59d0c40524', 'The wealthy famous people might not overlap with the ones who are actors -- the conclusion isn''t guaranteed.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a0ca521d-43f8-4949-8278-1c9768daa744', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 4, 'Statements: Some artists are musicians. All musicians are creative. Conclusion: Some artists are creative. Is this valid?', 'Reasoning', 'Syllogism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('437eef73-f3b1-412e-a4a6-1f0f3a4e02d0', 'a0ca521d-43f8-4949-8278-1c9768daa744', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9826371f-d218-41b8-9e1f-6828eb37695d', 'a0ca521d-43f8-4949-8278-1c9768daa744', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da564e51-3d78-4c4c-a38e-6e0cdf45809f', 'a0ca521d-43f8-4949-8278-1c9768daa744', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24e7d042-4335-4d84-8605-f963eaa081c8', 'a0ca521d-43f8-4949-8278-1c9768daa744', 3, 'Valid only if reversed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a0ca521d-43f8-4949-8278-1c9768daa744', '437eef73-f3b1-412e-a4a6-1f0f3a4e02d0', 'The artists who are musicians must be creative (since all musicians are creative), so some artists are indeed creative.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d11a7455-bbad-468a-af33-b3432c2b19ed', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 5, 'If SILVER is written as TJMWFS (each letter shifted forward by 1), how is BRONZE coded?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('944a651b-98f0-40db-aafa-4a815c07e4d1', 'd11a7455-bbad-468a-af33-b3432c2b19ed', 0, 'CSPOAF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('29fb9c90-6226-47f9-a57e-99e54ced478b', 'd11a7455-bbad-468a-af33-b3432c2b19ed', 1, 'CSPOAE');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebdf7295-d142-4001-942c-eb413f09804d', 'd11a7455-bbad-468a-af33-b3432c2b19ed', 2, 'CSPOAG');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c043833-1094-4898-8cc5-f781b373d58d', 'd11a7455-bbad-468a-af33-b3432c2b19ed', 3, 'BSPOAF');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d11a7455-bbad-468a-af33-b3432c2b19ed', '944a651b-98f0-40db-aafa-4a815c07e4d1', 'Shifting each letter forward by 1: B->C, R->S, O->P, N->O, Z->A (wraps around), E->F, giving CSPOAF.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ae97ce24-caf1-479b-8aaf-72b1d2198e3c', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 6, 'If FRIEND is coded as HTKGPF (each letter shifted forward by 2), how is MOTHER coded?', 'Reasoning', 'Coding-Decoding', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00d88be5-8225-4b01-9d9b-2817f0b70643', 'ae97ce24-caf1-479b-8aaf-72b1d2198e3c', 0, 'OQVJGT');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c7ea9aa-1a13-4c14-b1a8-67e0854bc9cf', 'ae97ce24-caf1-479b-8aaf-72b1d2198e3c', 1, 'OQVJGS');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce8bc594-1991-4fd7-b90b-e715c4d18f22', 'ae97ce24-caf1-479b-8aaf-72b1d2198e3c', 2, 'NQVJGT');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53042929-8c49-4e69-9c75-74f4336849b3', 'ae97ce24-caf1-479b-8aaf-72b1d2198e3c', 3, 'OQVIGT');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ae97ce24-caf1-479b-8aaf-72b1d2198e3c', '00d88be5-8225-4b01-9d9b-2817f0b70643', 'Shifting each letter forward by 2: M->O, O->Q, T->V, H->J, E->G, R->T, giving OQVJGT.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ae18b1ab-9564-4839-a1b0-96f547771716', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 7, 'A is B''s son. C is A''s sister. D is C''s husband. How is D related to B?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2cd0651c-46fe-4c74-8976-5fb9679fa60a', 'ae18b1ab-9564-4839-a1b0-96f547771716', 0, 'Son-in-law');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cb03275-953f-49b9-9e52-8904611d51c3', 'ae18b1ab-9564-4839-a1b0-96f547771716', 1, 'Son');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40c11555-4836-4698-8ef7-ea355f770c60', 'ae18b1ab-9564-4839-a1b0-96f547771716', 2, 'Brother-in-law');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e2e60e0-ee6b-49cd-9044-288f1a956acc', 'ae18b1ab-9564-4839-a1b0-96f547771716', 3, 'Nephew');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ae18b1ab-9564-4839-a1b0-96f547771716', '2cd0651c-46fe-4c74-8976-5fb9679fa60a', 'C is B''s daughter (A''s sister); D, being C''s husband, is B''s son-in-law.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6a834225-f490-4ef9-8c63-30694c5fa4eb', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 8, 'Pointing to a photograph, a man said, "Her son is my son''s father." How is the woman in the photograph related to the man?', 'Reasoning', 'Blood Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57a766d6-7324-4302-9141-7f4a05e27269', '6a834225-f490-4ef9-8c63-30694c5fa4eb', 0, 'Grandmother');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('754171d8-7c84-4adf-919b-edc8b94c6661', '6a834225-f490-4ef9-8c63-30694c5fa4eb', 1, 'Mother');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9407a8e-6f64-4d46-95b6-51e27038b833', '6a834225-f490-4ef9-8c63-30694c5fa4eb', 2, 'Aunt');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('61fdc42a-bfe4-4a69-9e34-91e15aae4b1b', '6a834225-f490-4ef9-8c63-30694c5fa4eb', 3, 'Sister');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6a834225-f490-4ef9-8c63-30694c5fa4eb', '57a766d6-7324-4302-9141-7f4a05e27269', '"Her son is my son''s father" means her son is the man''s father, making the woman the man''s grandmother.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3e424d68-6328-40ef-a1af-b9d394ac84f0', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 9, 'A person walks 20km north, then 15km east, then 20km south. Find his distance from the starting point.', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3bdb5cb-7f40-4bd6-a0a1-7b8b1f62a689', '3e424d68-6328-40ef-a1af-b9d394ac84f0', 0, '15km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('14b6e445-ce81-4356-96b9-e63d58d60163', '3e424d68-6328-40ef-a1af-b9d394ac84f0', 1, '20km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6ae1def-acfa-4647-84d7-cbbbc43bcf56', '3e424d68-6328-40ef-a1af-b9d394ac84f0', 2, '25km');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73659c61-2bdd-4e3d-ae4d-6effe01e2e93', '3e424d68-6328-40ef-a1af-b9d394ac84f0', 3, '10km');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3e424d68-6328-40ef-a1af-b9d394ac84f0', 'b3bdb5cb-7f40-4bd6-a0a1-7b8b1f62a689', 'The north and south movements (20km each) cancel out, leaving only the 15km eastward displacement.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fb64fed2-3d0c-4d3f-b4c9-4ee3a718a3ee', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 10, 'A man starts facing east, turns 180 degrees, then turns 90 degrees anticlockwise. Which direction does he face now?', 'Reasoning', 'Direction Sense', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0491e1d-d728-41a0-a847-80b9db0e88c8', 'fb64fed2-3d0c-4d3f-b4c9-4ee3a718a3ee', 0, 'South');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('199c0c11-ac62-414a-9611-dc1ce62bdd0d', 'fb64fed2-3d0c-4d3f-b4c9-4ee3a718a3ee', 1, 'North');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32c1be25-7230-43b0-9e5b-4bdcb47ca22b', 'fb64fed2-3d0c-4d3f-b4c9-4ee3a718a3ee', 2, 'East');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f658c2f-3843-4cc1-91a5-cd0c96c55720', 'fb64fed2-3d0c-4d3f-b4c9-4ee3a718a3ee', 3, 'West');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fb64fed2-3d0c-4d3f-b4c9-4ee3a718a3ee', 'b0491e1d-d728-41a0-a847-80b9db0e88c8', 'East (90 deg) + 180 = West (270 deg); turning 90 anticlockwise gives 270-90 = 180 deg, which is South.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ba64c6a2-ac4c-4077-ace3-cf642e2bbb63', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 11, 'Statements: A > B >= C, C > D. Conclusion: A > D. Is this valid?', 'Reasoning', 'Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6711eefb-8d88-48b6-8523-65c94f868737', 'ba64c6a2-ac4c-4077-ace3-cf642e2bbb63', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2951814a-66cb-49c6-91da-c71a1c89976e', 'ba64c6a2-ac4c-4077-ace3-cf642e2bbb63', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('571deb06-b537-4995-94a6-b67883f02cbb', 'ba64c6a2-ac4c-4077-ace3-cf642e2bbb63', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('61e0e292-329b-447e-9d96-b887afb59a8c', 'ba64c6a2-ac4c-4077-ace3-cf642e2bbb63', 3, 'Valid only if B=C');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ba64c6a2-ac4c-4077-ace3-cf642e2bbb63', '6711eefb-8d88-48b6-8523-65c94f868737', 'A>B>=C gives A>C, and combined with C>D, we get A>C>D, so A>D holds.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b51fe32c-8eaa-4354-a73b-36ae790fe37e', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 12, 'Statements: P >= Q, Q >= R, R >= S. Conclusion: P >= S. Is this valid?', 'Reasoning', 'Inequality', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68e5fcf4-dfee-4bf9-bb17-631cb27baa9a', 'b51fe32c-8eaa-4354-a73b-36ae790fe37e', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4caa531-1eee-4bb8-8bc0-d750abf7c48c', 'b51fe32c-8eaa-4354-a73b-36ae790fe37e', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6500ee5e-ac3f-4cee-9ec1-cb7586a034d8', 'b51fe32c-8eaa-4354-a73b-36ae790fe37e', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('681b6396-7d2a-4a12-910c-68ac9632e277', 'b51fe32c-8eaa-4354-a73b-36ae790fe37e', 3, 'Valid only if all equal');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b51fe32c-8eaa-4354-a73b-36ae790fe37e', '68e5fcf4-dfee-4bf9-bb17-631cb27baa9a', 'This follows directly from the transitivity of the >= relation across the whole chain.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('97d982a4-880c-4a32-b3f0-964deb6975c6', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 13, 'Find the next term: 4, 9, 16, 25, 36, ?', 'Reasoning', 'Series & Analogy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f91c48ba-6579-41c0-91fd-f2219b1d8cf9', '97d982a4-880c-4a32-b3f0-964deb6975c6', 0, '49');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dec0903c-11fd-47d7-a2a3-4aeded390a98', '97d982a4-880c-4a32-b3f0-964deb6975c6', 1, '42');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a8f1dc6-90ec-438b-b40d-7b143dd16389', '97d982a4-880c-4a32-b3f0-964deb6975c6', 2, '45');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40314878-b0d4-4658-ad5d-0307afc7ceb7', '97d982a4-880c-4a32-b3f0-964deb6975c6', 3, '48');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('97d982a4-880c-4a32-b3f0-964deb6975c6', 'f91c48ba-6579-41c0-91fd-f2219b1d8cf9', 'These are perfect squares (2^2 to 6^2); the next is 7^2 = 49.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0aeb1785-388b-4c75-9463-9e3fd025bba8', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 14, 'Key is to Lock as Password is to?', 'Reasoning', 'Series & Analogy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25c38d9f-8c4c-45a1-b72c-6586dbd56a48', '0aeb1785-388b-4c75-9463-9e3fd025bba8', 0, 'Account');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64710393-ae0d-43bb-adb3-090a1021b95d', '0aeb1785-388b-4c75-9463-9e3fd025bba8', 1, 'Computer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cdbe9a1b-4c07-450f-beba-b76e542f49c3', '0aeb1785-388b-4c75-9463-9e3fd025bba8', 2, 'Screen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('680149f8-fea0-443d-81ec-581dd0af3bf7', '0aeb1785-388b-4c75-9463-9e3fd025bba8', 3, 'Internet');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0aeb1785-388b-4c75-9463-9e3fd025bba8', '25c38d9f-8c4c-45a1-b72c-6586dbd56a48', 'A key opens a lock; a password grants access to an account, the closest functional parallel.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('91ff60ed-1b48-4c51-ad27-b71911bedb45', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 15, 'Find the odd one out: Rose, Lily, Lotus, Mango.', 'Reasoning', 'Classification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('219984a1-d061-4e84-ad39-0b15c7fc3fad', '91ff60ed-1b48-4c51-ad27-b71911bedb45', 0, 'Rose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc4383fa-6d84-488a-a271-596f166f3027', '91ff60ed-1b48-4c51-ad27-b71911bedb45', 1, 'Lily');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a43636a8-cafa-4697-932f-04d2eda5b8a0', '91ff60ed-1b48-4c51-ad27-b71911bedb45', 2, 'Lotus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51acf82b-ebb7-409c-a5b9-41bf06cd2367', '91ff60ed-1b48-4c51-ad27-b71911bedb45', 3, 'Mango');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('91ff60ed-1b48-4c51-ad27-b71911bedb45', '51acf82b-ebb7-409c-a5b9-41bf06cd2367', 'Mango is a fruit; the others are all flowers.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d9d8395c-cf04-4208-a679-a3bb4b5c9fa7', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 16, 'Find the odd pair: (2,8), (3,27), (4,64), (5,100).', 'Reasoning', 'Classification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('11494e42-07c5-401c-b88a-5c7a51603d8c', 'd9d8395c-cf04-4208-a679-a3bb4b5c9fa7', 0, '(2,8)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41d802fe-868f-42d6-96cb-253e35d18f40', 'd9d8395c-cf04-4208-a679-a3bb4b5c9fa7', 1, '(3,27)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f89efe2-060a-47b8-b7e1-7542dd669714', 'd9d8395c-cf04-4208-a679-a3bb4b5c9fa7', 2, '(4,64)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('566b83b8-15b3-454f-8603-608d8c9a516d', 'd9d8395c-cf04-4208-a679-a3bb4b5c9fa7', 3, '(5,100)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d9d8395c-cf04-4208-a679-a3bb4b5c9fa7', '566b83b8-15b3-454f-8603-608d8c9a516d', 'The pattern is (n, n^3): 2^3=8, 3^3=27, 4^3=64 all fit, but 5^3=125, not 100.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3bb971a6-ec69-49c8-a6ab-3eb1b79e9b0d', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 17, 'Statements: All squares are quadrilaterals. All quadrilaterals are polygons. Conclusion: All squares are polygons. Is this valid?', 'Reasoning', 'Venn & Statement-Conclusion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e6003a1-5c29-442d-8fdc-3e25f049ab58', '3bb971a6-ec69-49c8-a6ab-3eb1b79e9b0d', 0, 'Valid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d91ea82-4eb7-49db-9c45-6c04b2dad257', '3bb971a6-ec69-49c8-a6ab-3eb1b79e9b0d', 1, 'Invalid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66c616d9-c802-4534-8fef-73e56ef6565d', '3bb971a6-ec69-49c8-a6ab-3eb1b79e9b0d', 2, 'Cannot be determined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebd4fdc8-f14e-4a64-80fe-6569dafc691e', '3bb971a6-ec69-49c8-a6ab-3eb1b79e9b0d', 3, 'Valid only partially');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3bb971a6-ec69-49c8-a6ab-3eb1b79e9b0d', '1e6003a1-5c29-442d-8fdc-3e25f049ab58', 'This follows directly by transitivity: squares are quadrilaterals, and all quadrilaterals are polygons.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e56785b7-5d36-4637-bcde-3e95d003d2e8', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 18, 'Three circles represent Singers, Dancers, and Actors. The region common to all three represents:', 'Reasoning', 'Venn & Statement-Conclusion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e22f2b27-b54e-4fc7-b7c5-e629b67580d9', 'e56785b7-5d36-4637-bcde-3e95d003d2e8', 0, 'People who are singers, dancers, and actors all at once');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a0be8b8-d1fd-4e27-bba8-0c458ef4dc19', 'e56785b7-5d36-4637-bcde-3e95d003d2e8', 1, 'People who are only singers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4169b2c-2e20-498a-831a-ff7339ea0bbb', 'e56785b7-5d36-4637-bcde-3e95d003d2e8', 2, 'People who are neither singers, dancers, nor actors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b01a5742-10b3-415c-98fc-e73e93703f0a', 'e56785b7-5d36-4637-bcde-3e95d003d2e8', 3, 'People who are dancers but not singers');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e56785b7-5d36-4637-bcde-3e95d003d2e8', 'e22f2b27-b54e-4fc7-b7c5-e629b67580d9', 'The region where all three circles overlap represents members belonging to all three sets simultaneously.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('583b2609-d418-4675-be8b-57f779979e67', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 19, 'Input: 90 kite 5 ball 27 doll. Step 1 arranges numbers in descending order, keeping words'' relative positions. What is the output?', 'Reasoning', 'Input-Output', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e94655b7-9e4f-43ed-8430-223d0ff8e640', '583b2609-d418-4675-be8b-57f779979e67', 0, '90 kite 27 ball 5 doll');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c40cb48b-ad4b-410a-8437-74d7521b9be3', '583b2609-d418-4675-be8b-57f779979e67', 1, '5 kite 27 ball 90 doll');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24a2b52d-726f-49bf-9ae7-aadc8717c07c', '583b2609-d418-4675-be8b-57f779979e67', 2, 'ball doll kite 90 27 5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9061a51c-d287-4b20-9edc-167381e115b5', '583b2609-d418-4675-be8b-57f779979e67', 3, '90 kite 5 ball 27 doll (unchanged)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('583b2609-d418-4675-be8b-57f779979e67', 'e94655b7-9e4f-43ed-8430-223d0ff8e640', 'The numbers 90, 5, 27 are rearranged in descending order (90, 27, 5), keeping each word in its original relative slot.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7275f106-dea1-41aa-91a6-4dec9844d6ce', 'a301a99d-f426-4b44-a9fa-93d0ba5fce71', 20, 'Using the same machine, Step 2 arranges the words alphabetically, keeping the Step 1 numbers attached to their sequence position. Given Step 1 was "90 kite 27 ball 5 doll", what is the Step 2 output?', 'Reasoning', 'Input-Output', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b156103e-ba4a-440b-98d2-c9d6735247e6', '7275f106-dea1-41aa-91a6-4dec9844d6ce', 0, '90 ball 27 doll 5 kite');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36be6953-abb8-47a2-91ae-d0e247f998b6', '7275f106-dea1-41aa-91a6-4dec9844d6ce', 1, '5 ball 27 doll 90 kite');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83a83bf4-ef6f-4fac-bdc1-4cb5ae84d527', '7275f106-dea1-41aa-91a6-4dec9844d6ce', 2, '90 kite 27 doll 5 ball');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f71e6e5d-e7e2-4794-9a61-aa6e01303a74', '7275f106-dea1-41aa-91a6-4dec9844d6ce', 3, 'ball 90 doll 27 kite 5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7275f106-dea1-41aa-91a6-4dec9844d6ce', 'b156103e-ba4a-440b-98d2-c9d6735247e6', 'Alphabetically, the words become ball, doll, kite; the Step 1 numbers (90, 27, 5) stay attached to their sequence position.', 'Reasoning Ability — authored to match the real reasoning sections tested across Banking (SBI/IBPS), SSC, Railways, and State PSC exams generically; not copied from any official question paper, and not tied to any single exam''s specific paper.');
