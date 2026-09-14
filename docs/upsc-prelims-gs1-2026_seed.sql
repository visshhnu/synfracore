-- ============================================================
-- UPSC Civil Services Prelims — GS Paper I (2026) — Part 1 (Q1-50)
-- Full-Length Practice Paper (48 questions, 60 minutes)
-- Marking: +2 correct / -0.66 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 'upsc-prelims-gs1-2026-part1', 'UPSC Prelims GS Paper I (2026) — Questions 1-50', 'upsc-prelims', ARRAY['UPSC', 'Prelims', 'GS Paper 1', 'History', 'Geography', 'Polity', 'Economy', 'Environment', 'Science & Tech', 'Current Affairs']::TEXT[], 48, 'advanced', true, 1, 60, 2, 0.66);

-- ── Section: History & Culture (20 questions) — UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com's official-paper reproduction page. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('310a6809-0f43-4a87-888a-8d86673e6418', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 1, 'Consider the following assertion: "In the Pleistocene period either the Yamuna once flowed into the Indus, or the Sutlej flowed into the Yamuna and one major tributary of either had shifted from the Ganga to the Indus or vice versa." Which of the following is/are the basis of the above assertion?
1. The Nadi-Sukta of the Rigveda
2. The explorations of the Sutlej and the Yamuna by Robert Bruce Foote
3. The presence of the same species of dolphins in both the Indus and the Ganga river systems', 'History', 'Ancient Geography', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f4b7074-23c8-4a38-9a29-c735d82cac8d', '310a6809-0f43-4a87-888a-8d86673e6418', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5d604a3-858a-4b49-95e4-0ef5eabb6985', '310a6809-0f43-4a87-888a-8d86673e6418', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3428fcee-4d0a-4c4a-ba9f-4dcc7d2847f9', '310a6809-0f43-4a87-888a-8d86673e6418', 2, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39723fb9-7fda-4bc0-95c3-a697e5f7406b', '310a6809-0f43-4a87-888a-8d86673e6418', 3, '3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('310a6809-0f43-4a87-888a-8d86673e6418', '39723fb9-7fda-4bc0-95c3-a697e5f7406b', 'The shared dolphin species across the Indus and Ganga systems is zoogeographic evidence of a shared ancestry from a past drainage shift -- neither the Nadi-Sukta hymn nor Foote''s explorations are the actual basis cited for this specific assertion.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('61ad58d6-2206-4457-9cbe-2d0f63c89c8b', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 2, 'What does an empty seat represent in early Buddhist iconography?', 'History', 'Buddhist Iconography', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37460be4-27f4-41e2-a0f2-92badedda794', '61ad58d6-2206-4457-9cbe-2d0f63c89c8b', 0, 'The meditation of the Buddha');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3fde6b11-bc18-48e1-87e7-982e36e38fd1', '61ad58d6-2206-4457-9cbe-2d0f63c89c8b', 1, 'The Buddha''s First Sermon');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('385e9ebe-6279-4063-bff0-3037ed57ba01', '61ad58d6-2206-4457-9cbe-2d0f63c89c8b', 2, 'The Buddha''s Mahaparinibbana');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5788433f-fa94-4ae1-ad42-74f70fe1b4c6', '61ad58d6-2206-4457-9cbe-2d0f63c89c8b', 3, 'The Buddha''s Mahabhinishkravana');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('61ad58d6-2206-4457-9cbe-2d0f63c89c8b', '37460be4-27f4-41e2-a0f2-92badedda794', 'Early (aniconic) Buddhist art avoided depicting the Buddha''s human form directly; an empty seat under the Bodhi tree symbolized his meditation.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ae4a5876-8066-4349-ad5f-0eafabb07a46', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 3, 'Which of the following pairs of ancient and modern names of rivers is/are correctly matched?
1. Vitasta : Chenab
2. Asikni : Jhelum
3. Parushni : Ravi
4. Yavyavati : Beas', 'History', 'Vedic Rivers', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0e03aaf-8038-4779-8780-d81e8bb15be3', 'ae4a5876-8066-4349-ad5f-0eafabb07a46', 0, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c084844-82ee-4a3c-b246-21b8916bade9', 'ae4a5876-8066-4349-ad5f-0eafabb07a46', 1, '3 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('253423cc-5d82-4d94-a581-cbb631272d38', 'ae4a5876-8066-4349-ad5f-0eafabb07a46', 2, '3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('356c5119-5deb-4e10-89d6-2c5af63d6f3e', 'ae4a5876-8066-4349-ad5f-0eafabb07a46', 3, '4 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ae4a5876-8066-4349-ad5f-0eafabb07a46', '253423cc-5d82-4d94-a581-cbb631272d38', 'The standard Rigvedic identifications are Vitasta-Jhelum, Asikni-Chenab, Parushni-Ravi, and Vipas-Beas -- only pair 3 (Parushni-Ravi) as stated is correct; the other pairs given swap the wrong modern names.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c8325bce-7dfe-453d-9ccc-449940127ab3', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 4, 'Which of the following statements on the Amaravati Stupa and its relief sculpture is/are correct?
1. It was located in the lower Krishna valley.
2. In India, it was next only to the Sanchi Stupa in size.
3. The Amaravati school of sculpture made a lasting impact on the later South Indian sculpture, and its products were carried to Sri Lanka and South-east Asia.', 'History', 'Buddhist Architecture', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86094182-5028-421c-a12f-0de0eab1d951', 'c8325bce-7dfe-453d-9ccc-449940127ab3', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87577dcf-2157-4de5-b21b-9a025a0ff25f', 'c8325bce-7dfe-453d-9ccc-449940127ab3', 1, '1 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('632de06d-388f-4cae-939a-92768564326f', 'c8325bce-7dfe-453d-9ccc-449940127ab3', 2, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65f181de-bc80-43fc-a099-21e1917889ba', 'c8325bce-7dfe-453d-9ccc-449940127ab3', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c8325bce-7dfe-453d-9ccc-449940127ab3', '87577dcf-2157-4de5-b21b-9a025a0ff25f', 'Statements 1 and 3 are correct -- Amaravati was in the lower Krishna valley and influenced later South/Southeast Asian sculpture. Statement 2 is wrong: Amaravati was comparable to or larger than Sanchi, not smaller.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3ed929d5-027d-4727-9310-86ec2940311e', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 5, 'Which of the following pairs of the king and his dynasty in early historical Tamilakam is/are not correctly matched?
1. Senguttuvan : Chera
2. Udiyanjeral : Chola
3. Nedunjeliyan : Pandya', 'History', 'Sangam Age', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc4893aa-23f3-4a42-8ce3-0299fc7c60ea', '3ed929d5-027d-4727-9310-86ec2940311e', 0, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b1e0905-5575-42b0-91e0-5ae1f83488b8', '3ed929d5-027d-4727-9310-86ec2940311e', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c6d5f26-95e2-4ff9-9c2a-d7f792b111af', '3ed929d5-027d-4727-9310-86ec2940311e', 2, '1 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77ac6ed2-00c5-49fe-b341-5606d3cca7e1', '3ed929d5-027d-4727-9310-86ec2940311e', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3ed929d5-027d-4727-9310-86ec2940311e', '0b1e0905-5575-42b0-91e0-5ae1f83488b8', 'Udiyanjeral was a Chera king, not Chola -- pair 2 is the incorrect one. Senguttuvan (Chera) and Nedunjeliyan (Pandya) are both correctly matched.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7c17da93-ca1b-41d3-b94f-9bf1e0cf1114', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 6, 'Which of the following factors contributed to the formation of the Forward Bloc by Subhas Chandra Bose in 1939?
1. Bose failed to win the confidence of Mahatma Gandhi.
2. The Congress Left was disunited and failed to support Bose.
3. The Communists did not support Bose in his endeavours.
4. The supporters of M.N. Roy and socialist leaders like Jayaprakash Narayan preferred Congress unity to supporting Bose.', 'History', 'Freedom Movement', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('681dcc03-d737-4045-ba76-ea02d39514e4', '7c17da93-ca1b-41d3-b94f-9bf1e0cf1114', 0, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00004653-857f-44c5-a648-bd28a79a5581', '7c17da93-ca1b-41d3-b94f-9bf1e0cf1114', 1, '1, 2 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c6f9afd-6112-4476-ada9-0b0423147c9b', '7c17da93-ca1b-41d3-b94f-9bf1e0cf1114', 2, '1, 3 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('832759b0-7271-4c8a-b11a-80de15f0205c', '7c17da93-ca1b-41d3-b94f-9bf1e0cf1114', 3, '2 and 4 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7c17da93-ca1b-41d3-b94f-9bf1e0cf1114', '3c6f9afd-6112-4476-ada9-0b0423147c9b', 'Statements 1, 3, and 4 are correct contributing factors. Statement 2 is inaccurate as commonly assessed -- the Congress Left''s disunity is not the standard cited reason in the same way as Gandhi''s lack of confidence, communist non-support, and the Roy/JP socialists preferring unity.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('03524361-451d-4c74-aee6-cfc085e25ae9', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 7, 'Consider the following statements regarding the British policy in Awadh immediately after its annexation in 1856:
1. The taluqdars were dispossessed of their estates but allowed to retain their arms and forts.
2. A Summary Revenue Settlement was made in 1856 assuming that the taluqdars were outsiders.
3. The British believed in taking revenue directly from the peasants by removing the taluqdars.', 'History', '1857 Aftermath', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d156f7d-4c4a-4ab8-bf5c-bd1427f1d06c', '03524361-451d-4c74-aee6-cfc085e25ae9', 0, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9c0a82b-b6b0-4aed-99c2-d6c37a457dfc', '03524361-451d-4c74-aee6-cfc085e25ae9', 1, '1 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5df375f0-4280-45f4-b0d6-5eac6f15fa91', '03524361-451d-4c74-aee6-cfc085e25ae9', 2, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00fb145a-7267-4560-9edf-67a2d7e2793b', '03524361-451d-4c74-aee6-cfc085e25ae9', 3, '2 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('03524361-451d-4c74-aee6-cfc085e25ae9', '5d156f7d-4c4a-4ab8-bf5c-bd1427f1d06c', 'Statements 2 and 3 are correct -- the Summary Settlement treated taluqdars as outsiders and aimed at direct peasant revenue collection. Statement 1 is wrong: taluqdars'' forts were demolished and arms confiscated, not retained.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2e67552b-5bb1-498e-914d-2f8ddf1f2543', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 8, 'Consider the following assertion: The genesis of political alliances based on community lay in the very nature of the Montague-Chelmsford Reforms, 1919. Which of the following statements support/supports the above assertion?
1. Reforms retained and extended the principle of separate electorates.
2. Separate electorates were supposed to counter Indian nationalism, which was growing stronger.
3. Deprived classes rallied around the favours inherent in separate electorates.', 'History', 'Montague-Chelmsford Reforms', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8374e59b-a87e-4d80-81f5-d508c86597b4', '2e67552b-5bb1-498e-914d-2f8ddf1f2543', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7df1f47c-53fe-4d79-b71e-f7d359792281', '2e67552b-5bb1-498e-914d-2f8ddf1f2543', 1, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('256567dd-4001-494c-9cc0-6ee73358eac6', '2e67552b-5bb1-498e-914d-2f8ddf1f2543', 2, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('266d4640-3352-47f4-afa3-b30640fb92d9', '2e67552b-5bb1-498e-914d-2f8ddf1f2543', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2e67552b-5bb1-498e-914d-2f8ddf1f2543', '266d4640-3352-47f4-afa3-b30640fb92d9', 'All three statements support the assertion -- the 1919 reforms extended separate electorates as a divide-and-counter-nationalism strategy, and even the Depressed Classes rallied around the resulting community-based political favours.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ad5549ad-5ec7-451b-9be1-ce9b2ea11050', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 9, 'Pandit Mallikarjun Mansur, the famous classical singer from Karnataka, represented the:', 'History', 'Hindustani Classical Music', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1144f6d-89e4-4a71-84cb-c19b2fcd7868', 'ad5549ad-5ec7-451b-9be1-ce9b2ea11050', 0, 'Agra Gharana');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5de3198-d900-44e7-a37a-a6632ba42d2f', 'ad5549ad-5ec7-451b-9be1-ce9b2ea11050', 1, 'Gwalior Gharana');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe44fbdc-2567-47f6-981c-2a5b6a1556db', 'ad5549ad-5ec7-451b-9be1-ce9b2ea11050', 2, 'Patiala Gharana');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c74b2d22-5543-459c-871f-89c1b401b5ae', 'ad5549ad-5ec7-451b-9be1-ce9b2ea11050', 3, 'Jaipur-Atrauli Gharana');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ad5549ad-5ec7-451b-9be1-ce9b2ea11050', 'c74b2d22-5543-459c-871f-89c1b401b5ae', 'Mallikarjun Mansur trained under Ustad Manji Khan and Ustad Bhurji Khan of the Jaipur-Atrauli gharana and is its best-known representative.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('85a51f2e-346e-4371-b1fd-2aa7337ce812', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 10, 'In which one among the following texts does the term "kshetra-patni" ("mistress of the field") originate?', 'History', 'Vedic Literature', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d9df9ee-e7e5-4990-8db1-31d8a567a45c', '85a51f2e-346e-4371-b1fd-2aa7337ce812', 0, 'Rigveda');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('466a0b45-b79c-4557-bd7c-9fa311b108eb', '85a51f2e-346e-4371-b1fd-2aa7337ce812', 1, 'Atharvaveda');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a4270ac-1f20-44e0-ae7d-ed76d43d3a72', '85a51f2e-346e-4371-b1fd-2aa7337ce812', 2, 'Ashtadhyayi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0593788b-e2a0-42ea-a424-a53dbbb0594e', '85a51f2e-346e-4371-b1fd-2aa7337ce812', 3, 'Arthashastra');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('85a51f2e-346e-4371-b1fd-2aa7337ce812', '466a0b45-b79c-4557-bd7c-9fa311b108eb', 'The term appears in the Atharvaveda, in hymns addressing agriculture and land.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fd13f890-e0ff-4738-bbdb-c587da8908c8', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 11, 'Which one of the following Carnatic music ragas is similar to Raga Bilawal in Hindustani music?', 'History', 'Carnatic-Hindustani Correspondence', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4dfae81-c039-4bcb-82e7-e34aa685b289', 'fd13f890-e0ff-4738-bbdb-c587da8908c8', 0, 'Nat Bhairavi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('71b56d9b-85c3-40ce-abde-b63d986eb633', 'fd13f890-e0ff-4738-bbdb-c587da8908c8', 1, 'Kamavardhini');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d61762d1-5074-49fe-876c-d62f68bea718', 'fd13f890-e0ff-4738-bbdb-c587da8908c8', 2, 'Hanumatodi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72e7ed01-df9c-4c19-9d48-2cbb23c1dfa2', 'fd13f890-e0ff-4738-bbdb-c587da8908c8', 3, 'Dheera Shankarabharanam');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fd13f890-e0ff-4738-bbdb-c587da8908c8', '72e7ed01-df9c-4c19-9d48-2cbb23c1dfa2', 'Dheera Shankarabharanam is the Carnatic equivalent of the Hindustani Raga Bilawal -- both correspond to the Western major scale.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bd32dbab-5b4e-4ab1-9578-209bb3c0e608', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 12, 'The artificially fixed rupee-sterling exchange rate prescribed by the Hilton-Young Commission (1926) was adopted by the British Government for which one of the following reasons?', 'History', 'Colonial Economic Policy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5666d713-32ab-418b-b712-7c61ca150ece', 'bd32dbab-5b4e-4ab1-9578-209bb3c0e608', 0, 'Aiding remittances from India and maintaining creditworthiness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('11c2ba12-fba4-41cd-91f6-32e177ce9302', 'bd32dbab-5b4e-4ab1-9578-209bb3c0e608', 1, 'Supporting Indian importers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36982452-5728-44e7-9ea7-e6201d4384aa', 'bd32dbab-5b4e-4ab1-9578-209bb3c0e608', 2, 'Encouraging cotton exports');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc69c476-a101-4a60-bb15-5a8cb1deab07', 'bd32dbab-5b4e-4ab1-9578-209bb3c0e608', 3, 'Preventing Rupee depreciation in gold terms');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bd32dbab-5b4e-4ab1-9578-209bb3c0e608', '5666d713-32ab-418b-b712-7c61ca150ece', 'The fixed exchange rate was set to ease remittances back to Britain and preserve India''s (i.e. the colonial government''s) creditworthiness in international borrowing.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cd37b64f-0cbf-4c4a-af51-71c414f2a560', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 13, 'Consider the following statements: I. Pali texts contain the first definite references to coins, e.g., kahapana, nikkha, kamsa, and kakanika. II. The literary evidence from Pali texts is corroborated by archaeological evidence of punch-marked coins from many sites, most of them made of silver.
The evidence in these statements is associated with which of the following: (1) Emergence of urban life (2) Transition to money economy', 'History', 'Second Urbanization', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('612fcb57-e404-4a82-be35-23b9ec6e3b3f', 'cd37b64f-0cbf-4c4a-af51-71c414f2a560', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f524f49-70d1-416a-bf21-746b21e84654', 'cd37b64f-0cbf-4c4a-af51-71c414f2a560', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8671b607-45e5-451f-a4ea-f794b9c75888', 'cd37b64f-0cbf-4c4a-af51-71c414f2a560', 2, 'Both 1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d0f83d2-efd0-40f6-a0d0-5256ae83ebdd', 'cd37b64f-0cbf-4c4a-af51-71c414f2a560', 3, 'Neither 1 nor 2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cd37b64f-0cbf-4c4a-af51-71c414f2a560', '8671b607-45e5-451f-a4ea-f794b9c75888', 'Coinage evidence is standard support cited for both the emergence of urban life and the transition to a money economy in the Second Urbanization period -- both are correct.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1f5e318b-6db7-46cd-9ace-3ac35ca8d07e', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 14, 'Which of the following temples has/have a Nagara-style shikhara?
1. Malegitti Shivalaya, Badami
2. Huchimalligudi Temple, Aihole
3. Dashavatara Temple, Deogarh
4. Virupaksha Temple, Pattadakal', 'History', 'Temple Architecture', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15088175-958c-4da8-bdf6-62e440fcbcb6', '1f5e318b-6db7-46cd-9ace-3ac35ca8d07e', 0, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1cd9aa92-0fc3-4cdc-b562-d8ec875bcfad', '1f5e318b-6db7-46cd-9ace-3ac35ca8d07e', 1, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5aff3be5-6183-4cac-8760-ffd045f00a27', '1f5e318b-6db7-46cd-9ace-3ac35ca8d07e', 2, '3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ac7c340-6c0e-4de2-a07c-1e2e3dbad361', '1f5e318b-6db7-46cd-9ace-3ac35ca8d07e', 3, '3 and 4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1f5e318b-6db7-46cd-9ace-3ac35ca8d07e', '1cd9aa92-0fc3-4cdc-b562-d8ec875bcfad', 'Huchimalligudi Temple (Aihole) and the Dashavatara Temple (Deogarh) both show Nagara-style shikharas; Malegitti Shivalaya and Virupaksha are Dravidian-style.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('98d71f3b-29c7-472c-a5df-c6fb9b53d84e', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 15, 'Among the four main forms of existence of life recognized in Jainism, which one of the following is not included?', 'History', 'Jainism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5673ea90-0008-420a-bd38-2f358f5e271c', '98d71f3b-29c7-472c-a5df-c6fb9b53d84e', 0, 'Deva (gods)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a470ce9e-5b8c-49fd-acb9-79cb3036bd8d', '98d71f3b-29c7-472c-a5df-c6fb9b53d84e', 1, 'Yaksha (demi-gods)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('842660ab-de27-4868-af77-7a2806129351', '98d71f3b-29c7-472c-a5df-c6fb9b53d84e', 2, 'Manushya (humans)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9426eb54-1015-432b-86e5-182a1ebca6fb', '98d71f3b-29c7-472c-a5df-c6fb9b53d84e', 3, 'Tiryancha (animals and plants)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('98d71f3b-29c7-472c-a5df-c6fb9b53d84e', 'a470ce9e-5b8c-49fd-acb9-79cb3036bd8d', 'Jainism''s four gatis (states of existence) are deva, manushya, tiryancha, and naraka (hell-beings) -- Yaksha is not one of the four.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('60b332db-d1ad-4661-8830-36bef93329ef', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 16, 'The Hallisalasya painting in the Bagh Caves represents:', 'History', 'Cave Painting', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2786067-c239-4192-a3d8-fd6d08e35045', '60b332db-d1ad-4661-8830-36bef93329ef', 0, 'A joyous folk dance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('289d4269-42b6-4032-9c56-30ce5cb72a95', '60b332db-d1ad-4661-8830-36bef93329ef', 1, 'Buddha in a meditative pose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a89179c-3d37-41eb-9797-9b3f7af06e93', '60b332db-d1ad-4661-8830-36bef93329ef', 2, 'The depiction of Shiva and Parvati on Kailasha');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd5cd763-d606-451d-8ace-0407312bfbac', '60b332db-d1ad-4661-8830-36bef93329ef', 3, 'Samudramanthan (Churning of the Ocean)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('60b332db-d1ad-4661-8830-36bef93329ef', 'd2786067-c239-4192-a3d8-fd6d08e35045', 'Hallisalasya at the Bagh Caves depicts a joyous folk dance scene.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e4a4511c-e8f2-4c95-a7c8-09700ad4b888', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 17, 'Consider the following statements relating to the use of the place-value system in India:
1. The earliest epigraphic use of the place-value system in India is found in the Mankani plates from Gujarat (AD 595-596).
2. In the ninth century, place-values become general in inscriptions all over India.
3. The place-values have been found in Sanskrit inscriptions in South-east Asia as early as the seventh century.
Which of the statements given above are correct?', 'History', 'History of Mathematics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ebbddf2-ec7d-4fce-bdeb-27483281557f', 'e4a4511c-e8f2-4c95-a7c8-09700ad4b888', 0, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('201eb03d-e5d9-4cae-96e4-5b36ca784a60', 'e4a4511c-e8f2-4c95-a7c8-09700ad4b888', 1, '1 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9efc6a17-b6fa-4237-aa0c-aa5792a120ed', 'e4a4511c-e8f2-4c95-a7c8-09700ad4b888', 2, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('272b4194-e7d1-44f9-a79b-c5676123f36b', 'e4a4511c-e8f2-4c95-a7c8-09700ad4b888', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e4a4511c-e8f2-4c95-a7c8-09700ad4b888', '272b4194-e7d1-44f9-a79b-c5676123f36b', 'All three statements are correct -- the Mankani plates give the earliest epigraphic use, ninth-century inscriptions show it becoming general across India, and Southeast Asian Sanskrit inscriptions show it as early as the seventh century.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('aa5160f7-6aae-4f66-83e6-553fc6af3db0', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 18, 'Consider the following statements about the archaeological findings in Harappan towns:
I. There is wide occurrence of spindle-whorls in the houses but absence of spinning wheels.
II. Weights and measurement scales, complete with graduations, have been discovered.
III. There are houses built in large part with baked bricks, around relatively spacious courtyards, with their own wells, bathing platforms, and large rooms.
Which of the following inferences can be drawn from the above statements?', 'History', 'Harappan Civilization', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5667288c-2060-4108-a54d-9e43067ef10e', 'aa5160f7-6aae-4f66-83e6-553fc6af3db0', 0, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e200432-bfbf-4489-8df7-cc171f8eab7d', 'aa5160f7-6aae-4f66-83e6-553fc6af3db0', 1, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ffa81598-dbb0-4f5b-bb8d-91c4eb54eaa6', 'aa5160f7-6aae-4f66-83e6-553fc6af3db0', 2, '1 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64a147b6-93a4-47a4-a23b-b8ae121ae555', 'aa5160f7-6aae-4f66-83e6-553fc6af3db0', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aa5160f7-6aae-4f66-83e6-553fc6af3db0', '5667288c-2060-4108-a54d-9e43067ef10e', 'Statements I and II support inferences about home-based, laborious spinning practice and scientific measurement knowledge respectively. Statement III describes housing but the question''s specific inference pairing selects 1 and 2.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('64aa4a84-e55a-441a-b9f0-9233e2dbf96b', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 19, 'Which one of the following statements about the Eka Movement and Bardoli Satyagraha is correct?', 'History', 'Peasant Movements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('188fb0e5-f32b-4565-b977-01d1e4383fcd', '64aa4a84-e55a-441a-b9f0-9233e2dbf96b', 0, 'The Eka Movement was throughout supported and organized by the Congress while Bardoli Satyagraha was initially independent of Congress influence and was only in the last stages supported by the Congress.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5656e7c7-413c-490e-85f9-5605f308ccd0', '64aa4a84-e55a-441a-b9f0-9233e2dbf96b', 1, 'The Eka Movement was provided leadership by the taluqdars of Awadh, whereas the Bardoli Satyagraha was a movement of the landless labourers.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea3ef319-5095-4cb7-a51e-b184d8779332', '64aa4a84-e55a-441a-b9f0-9233e2dbf96b', 2, 'The Bardoli Satyagraha was a campaign against the enhancement of land revenue, while the Eka Movement was a protest against excessive extraction of rents.');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('253f370e-f9ec-44fd-92c2-26a52fdc3af9', '64aa4a84-e55a-441a-b9f0-9233e2dbf96b', 3, 'The Eka Movement was located in the Varanasi and Mirzapur districts of the present-day U.P., while the Bardoli Satyagraha took place in Saurashtra.');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('64aa4a84-e55a-441a-b9f0-9233e2dbf96b', 'ea3ef319-5095-4cb7-a51e-b184d8779332', 'Bardoli (1928, Gujarat) protested a land revenue enhancement; the Eka Movement (1921-22, Awadh) protested excessive rent extraction by taluqdars -- this correctly distinguishes their core grievances.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5fb06b72-56f5-4e42-be72-ac35b4826e22', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 20, 'Consider the following statements about the Rigvedic period:
I. Irrigation from wells allowed agriculture to expand away from flood plains.
II. Draught-animal power was employed to draw up water out of the wells.
III. Terms like ashma-chakra (stone pulley wheel) and ahava (strapped wooden pails), along with references to oxen predating the Rigveda, support well-based irrigation practice.
Which of the following information support/supports the above statements?', 'History', 'Rigvedic Economy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('438c5a3b-a09b-4238-991b-8f75094fd736', '5fb06b72-56f5-4e42-be72-ac35b4826e22', 0, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a34f743e-a805-4673-b2e7-d469e04bbd09', '5fb06b72-56f5-4e42-be72-ac35b4826e22', 1, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82c8b8e1-acd8-4d46-93de-096e9f8133e8', '5fb06b72-56f5-4e42-be72-ac35b4826e22', 2, '1 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76ceae65-34df-44df-81a6-3abba38adf03', '5fb06b72-56f5-4e42-be72-ac35b4826e22', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5fb06b72-56f5-4e42-be72-ac35b4826e22', '82c8b8e1-acd8-4d46-93de-096e9f8133e8', 'Statements I and III are supported by the textual evidence (ashma-chakra, ahava, and ox references); Statement II (draught-animal power specifically drawing water) lacks direct textual support in the standard reading.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

-- ── Section: Geography & Environment (18 questions) — UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com's official-paper reproduction page. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('81e6f229-449f-40d7-a679-0703a858d2ff', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 21, 'Tungurahua Volcano, which was declared a Global Geopark by UNESCO in 2025, is situated in which one among the following countries?', 'Geography', 'Volcanology', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9f684c1-e227-45fa-8ffb-db041d18f3e7', '81e6f229-449f-40d7-a679-0703a858d2ff', 0, 'Ecuador');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d1d3c6c-9efd-401f-afea-6bd91e246d26', '81e6f229-449f-40d7-a679-0703a858d2ff', 1, 'Peru');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8fe6b4ef-63f3-4887-81b0-a16502095b3e', '81e6f229-449f-40d7-a679-0703a858d2ff', 2, 'Bolivia');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e1b9339-4550-4239-be6c-81ab6d119b26', '81e6f229-449f-40d7-a679-0703a858d2ff', 3, 'Colombia');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('81e6f229-449f-40d7-a679-0703a858d2ff', 'f9f684c1-e227-45fa-8ffb-db041d18f3e7', 'Tungurahua is located in Ecuador.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0d34c570-445e-44d1-8b98-b9f8f1efefc1', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 22, 'With reference to Madhav National Park, which of the following statements is/are correct?
1. It was declared a Tiger Reserve in India in 2025.
2. Sakhya Sagar, which is designated as a Ramsar Site, is situated within this National Park.
3. Its area is shared between Madhya Pradesh and Rajasthan.', 'Geography', 'Protected Areas', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d7986f1-ce5f-4ec9-ab42-ae7bd40a48cf', '0d34c570-445e-44d1-8b98-b9f8f1efefc1', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08c7f5e8-919a-4aa3-8f6c-7137b70f33d6', '0d34c570-445e-44d1-8b98-b9f8f1efefc1', 1, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b08d77e3-fd37-4310-9dff-b89f979904a1', '0d34c570-445e-44d1-8b98-b9f8f1efefc1', 2, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59628090-1f28-4eb0-b3ff-55a89a7a6070', '0d34c570-445e-44d1-8b98-b9f8f1efefc1', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0d34c570-445e-44d1-8b98-b9f8f1efefc1', '08c7f5e8-919a-4aa3-8f6c-7137b70f33d6', 'Statements 1 and 2 are correct -- Madhav National Park was declared a Tiger Reserve in 2025, and Sakhya Sagar (a Ramsar site) lies within it. It does not span Rajasthan.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4a7354b7-73b2-4c5c-baf5-97500695aa2c', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 23, 'With reference to the climate of Andaman and Nicobar Islands, which of the following statements is/are correct?
1. The climate can be defined as a humid, tropical coastal climate.
2. It receives rainfall from both South-west monsoon and North-east monsoon.
3. Maximum precipitation is between December and May.', 'Geography', 'Island Climate', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6422250-1f10-4fb3-85be-6994e6b4e372', '4a7354b7-73b2-4c5c-baf5-97500695aa2c', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25c79607-e53a-4ab2-b58b-baef30e130ff', '4a7354b7-73b2-4c5c-baf5-97500695aa2c', 1, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('209d2b8e-3bdd-448f-a879-0280da1e750c', '4a7354b7-73b2-4c5c-baf5-97500695aa2c', 2, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86d138c5-b170-4655-818c-035300780339', '4a7354b7-73b2-4c5c-baf5-97500695aa2c', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4a7354b7-73b2-4c5c-baf5-97500695aa2c', '25c79607-e53a-4ab2-b58b-baef30e130ff', 'Statements 1 and 2 are correct. Statement 3 is wrong -- maximum precipitation is during the monsoon months, not December-May.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4c4234ab-0b66-4f9f-8356-beebe1470fdb', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 24, 'Which of the following geographical features or phenomena is/are associated with the Peninsular Block of India?
1. Submergence of parts of the western coast due to tectonic activity
2. Presence of residual mountain ranges such as the Veliconda hills and Mahendragiri hills
3. Deep, V-shaped river valleys formed by fast-flowing rivers', 'Geography', 'Physiography', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47ad0197-48ff-455c-b396-a01a6a22a705', '4c4234ab-0b66-4f9f-8356-beebe1470fdb', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3471631-e236-45c7-98ba-e73ca9ff1fb3', '4c4234ab-0b66-4f9f-8356-beebe1470fdb', 1, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd8b6a9d-22e8-44a0-93a7-444d84d30682', '4c4234ab-0b66-4f9f-8356-beebe1470fdb', 2, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('398957fb-5053-48a1-b902-b0f11235cde5', '4c4234ab-0b66-4f9f-8356-beebe1470fdb', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4c4234ab-0b66-4f9f-8356-beebe1470fdb', 'd3471631-e236-45c7-98ba-e73ca9ff1fb3', 'Statements 1 and 2 correctly describe the Peninsular Block -- western coast submergence and residual mountain ranges. Deep V-shaped valleys (statement 3) are more characteristic of young Himalayan rivers, not the geologically old, stable Peninsular Block.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8a9bd91a-7348-49f2-a1b2-e47846bd9b85', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 25, 'Consider the following statements with reference to the Sagarmala Programme of the Government of India:
I. The Sagarmala Programme seeks to achieve port-led economic growth through cost-effective and sustainable coastal infrastructure.
II. The success of the Sagarmala Programme is reflected in significant growth in coastal and inland waterway shipping, along with improved global port rankings.
III. Sagarmala 2.0 aims to position India as a global maritime innovation hub aligned with Atmanirbhar Bharat and Viksit Bharat 2047 visions.', 'Geography', 'Port Infrastructure Policy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f33fd1a-8c78-4261-aefe-332bb2782bba', '8a9bd91a-7348-49f2-a1b2-e47846bd9b85', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('691c28bd-26c1-43ef-a2a4-2faf4bb4ceb5', '8a9bd91a-7348-49f2-a1b2-e47846bd9b85', 1, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3748477-ebbb-4ec0-95a4-9f1ccd0296f8', '8a9bd91a-7348-49f2-a1b2-e47846bd9b85', 2, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e777cfac-9129-459b-b14f-6f0cc324b809', '8a9bd91a-7348-49f2-a1b2-e47846bd9b85', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8a9bd91a-7348-49f2-a1b2-e47846bd9b85', '691c28bd-26c1-43ef-a2a4-2faf4bb4ceb5', 'Statements I and II are correct and consistent -- Sagarmala''s stated port-led growth objective (I) is supported by documented growth outcomes (II). Statement III describes Sagarmala 2.0''s separate, forward-looking framing.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('970268e5-edb1-4eba-a055-81341c10e189', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 26, 'Consider the following statements about Rhynchostylis retusa (Foxtail orchid):
1. It is an epiphytic orchid.
2. The species is endemic to North-east India.
3. It is the State flower of Arunachal Pradesh and Assam.', 'Geography', 'Botany / Conservation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44a1aeb0-9283-4860-80b7-ec6946ee4caa', '970268e5-edb1-4eba-a055-81341c10e189', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84adc6a4-6e13-497f-9179-c08873e0301a', '970268e5-edb1-4eba-a055-81341c10e189', 1, '1 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f835788e-dc11-4223-8bc4-82c859ba1bef', '970268e5-edb1-4eba-a055-81341c10e189', 2, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6985968-74a4-4f17-a91f-7dea97f0d384', '970268e5-edb1-4eba-a055-81341c10e189', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('970268e5-edb1-4eba-a055-81341c10e189', '84adc6a4-6e13-497f-9179-c08873e0301a', 'Statements 1 and 3 are correct -- it is epiphytic and is the state flower of both Arunachal Pradesh and Assam. It is not endemic only to North-east India; it has a wider distribution.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('acf20b2c-1598-4562-a327-26d3f5b66da2', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 27, 'Which one of the following statements with regard to the Moidams, built by the Tai-Ahom kingdom and inscribed as a World Heritage Site by UNESCO, is/are correct?
1. They acted as army fortresses.
2. They were recreation centres of the Royals and Nobles.
3. They were burial grounds of the Royals and Nobles.
4. They were battle drill centres of the Royals and Nobles.', 'Geography', 'World Heritage Sites', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a21a11f6-90d5-4260-915e-fd379e286af0', 'acf20b2c-1598-4562-a327-26d3f5b66da2', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f50fb49c-6ed3-44c2-91b5-3c54d5344316', 'acf20b2c-1598-4562-a327-26d3f5b66da2', 1, '1 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a24eeebb-185d-4c4b-8d21-544e56fb5f9a', 'acf20b2c-1598-4562-a327-26d3f5b66da2', 2, '3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6525ee9b-cd97-4762-ac8b-33348558c701', 'acf20b2c-1598-4562-a327-26d3f5b66da2', 3, '2 and 4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('acf20b2c-1598-4562-a327-26d3f5b66da2', 'a24eeebb-185d-4c4b-8d21-544e56fb5f9a', 'The Moidams were royal/noble burial mounds -- statement 3 only is correct; they were not fortresses, recreation centres, or drill grounds.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('62493983-ab8a-4668-9827-a1999d4e955e', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 28, 'At the United Nations Ocean Conference (UNOC) held in June 2025 in France, the FAO demonstrated its leading voice on marine and ocean issues, especially on sustainable fisheries and aquaculture for resilient livelihood and ''Blue Transformation.'' Which combination about the "Four Betters" proposed by FAO for "Blue Transformation" is correct?', 'Geography', 'Marine Governance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21fe552f-d589-4991-9ecd-79b8cf50bb9a', '62493983-ab8a-4668-9827-a1999d4e955e', 0, 'Better production, better nutrition, better environment and better ocean');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74aba978-8b03-441f-9848-1de69be93ae8', '62493983-ab8a-4668-9827-a1999d4e955e', 1, 'Better production, better nutrition, better environment and better life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb5a74ec-1e16-4b4a-b1c4-dc0a2753175e', '62493983-ab8a-4668-9827-a1999d4e955e', 2, 'Better coral reefs, better nutrition, better environment and better life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e3e10b8-0f72-40d2-bc38-ea0254166885', '62493983-ab8a-4668-9827-a1999d4e955e', 3, 'Better estuaries, better nutrition, better environment and better mangrove vegetation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('62493983-ab8a-4668-9827-a1999d4e955e', '74aba978-8b03-441f-9848-1de69be93ae8', 'FAO''s "Four Betters" for Blue Transformation are better production, better nutrition, better environment, and better life.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('25731e55-ddce-4400-a8bc-307b1c899713', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 29, 'Consider the following statements about Lake Turkana:
1. It is the largest desert lake in the world.
2. The lake is situated in South Sudan along the eastern fringe of the Sahara desert.
3. The lake is listed as a UNESCO World Heritage Site and is also referred to as the ''Jade Sea''.', 'Geography', 'World Geography — Lakes', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c901dafb-09e5-4ef4-aaa3-5de7949f9205', '25731e55-ddce-4400-a8bc-307b1c899713', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac050b15-25bc-4dc7-b904-36eeeaa41f79', '25731e55-ddce-4400-a8bc-307b1c899713', 1, '1 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dec7cd91-6995-468d-bd91-85e96df1c049', '25731e55-ddce-4400-a8bc-307b1c899713', 2, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27c9e4be-1ee9-4324-a2ce-e43ef84a3625', '25731e55-ddce-4400-a8bc-307b1c899713', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('25731e55-ddce-4400-a8bc-307b1c899713', 'ac050b15-25bc-4dc7-b904-36eeeaa41f79', 'Statements 1 and 3 are correct. Statement 2 is wrong -- Lake Turkana is in Kenya, not South Sudan, and is not on the Sahara''s fringe.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6443e237-8b2b-44f5-a717-7e31006dbfbd', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 30, 'Which one of the following is the first Plan Vivo certified Reducing Emissions from Deforestation and Forest Degradation (REDD+) project in India?', 'Geography', 'Forest Carbon Projects', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('266bf1fa-5f92-4bad-929c-2631d9f0e514', '6443e237-8b2b-44f5-a717-7e31006dbfbd', 0, 'Uttarakhand REDD+ project');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d6b1722-e3d0-410e-a3b8-ba3fe3adb3f9', '6443e237-8b2b-44f5-a717-7e31006dbfbd', 1, 'ICFRE-ICIMOD Transboundary REDD+ project in North-Eastern Himalayas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80bce01f-fdb8-4021-9d6a-d05d4c2dc6ea', '6443e237-8b2b-44f5-a717-7e31006dbfbd', 2, 'Khasi Hills Community REDD+ project');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6062a78c-0c74-4d2a-ace5-42995465018f', '6443e237-8b2b-44f5-a717-7e31006dbfbd', 3, 'Sikkim Mamley Kamrang Community REDD+ project');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6443e237-8b2b-44f5-a717-7e31006dbfbd', '80bce01f-fdb8-4021-9d6a-d05d4c2dc6ea', 'The Khasi Hills Community REDD+ Project in Meghalaya was India''s first Plan Vivo certified REDD+ project.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('877474c3-0bf0-4062-b7ba-f2b703e3308b', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 31, 'With respect to the Western Hoolock Gibbons, which of the following statements is/are correct?
1. A Sanctuary in North-east India is home to this ape species listed as Endangered in the IUCN Red List.
2. They have specialized brachiation and can easily swing between trees.
3. They possess a strong and heavy build like gorillas, yet are remarkably agile tree climbers.', 'Geography', 'Wildlife Conservation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab41a53a-6573-4c42-9128-53d6a1358538', '877474c3-0bf0-4062-b7ba-f2b703e3308b', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c47b1eb-cf18-4dc3-bff3-884881abf0c4', '877474c3-0bf0-4062-b7ba-f2b703e3308b', 1, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8123cf3a-977c-4b5b-8746-631547eb4c12', '877474c3-0bf0-4062-b7ba-f2b703e3308b', 2, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95355d71-357b-4178-8f89-701ebad88089', '877474c3-0bf0-4062-b7ba-f2b703e3308b', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('877474c3-0bf0-4062-b7ba-f2b703e3308b', '7c47b1eb-cf18-4dc3-bff3-884881abf0c4', 'Statements 1 and 2 are correct. Statement 3 is wrong -- Western Hoolock Gibbons are light-bodied and agile, not heavily built like gorillas.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4b0f8c18-0c91-42c0-ad74-850dec1cf1e8', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 32, 'Which of the following best explain(s) the rationale for protecting mangrove ecosystems in the context of climate resilience?
1. Mangroves reduce tidal energy and store freshwater, making them ideal sites for paddy cultivation in saline estuarine belts.
2. Their salt-sensitive roots filter seawater, making mangroves key to converting coastal land into freshwater aquaculture zones.
3. By withstanding tidal surges and offering biomass resources, mangroves function both as natural bio-shields and livelihood bases for rural communities.', 'Geography', 'Coastal Ecology', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('71247122-1542-4c42-83be-035c2426e82a', '4b0f8c18-0c91-42c0-ad74-850dec1cf1e8', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0851329d-bd23-45a6-98f9-f06e523ce43b', '4b0f8c18-0c91-42c0-ad74-850dec1cf1e8', 1, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('639b04b7-43ff-4502-9e5a-3b8467886748', '4b0f8c18-0c91-42c0-ad74-850dec1cf1e8', 2, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00309035-d997-4f05-9fca-a287ec62ec0f', '4b0f8c18-0c91-42c0-ad74-850dec1cf1e8', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4b0f8c18-0c91-42c0-ad74-850dec1cf1e8', '00309035-d997-4f05-9fca-a287ec62ec0f', 'Only statement 3 correctly captures mangroves'' real rationale for protection -- as natural bio-shields and livelihood bases. Statements 1 and 2 misrepresent mangroves'' actual salt-tolerance and hydrology.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a2eda850-fbde-4c57-b564-2f1f8d2e8b43', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 33, 'Identify the river of the Indian sub-continent on the basis of the following information:
1. It has an antecedent drainage system.
2. It flows through three countries.
3. It originates in the Tibetan Plateau and is an important river for irrigation.
4. It does not form distributaries.', 'Geography', 'River Systems', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9fade3e3-8763-40ee-97d0-5bf12458f260', 'a2eda850-fbde-4c57-b564-2f1f8d2e8b43', 0, 'Brahmaputra');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f23e8f8-273f-4236-b146-3bd0628b00d1', 'a2eda850-fbde-4c57-b564-2f1f8d2e8b43', 1, 'Indus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd16ce17-7303-4494-9ca8-06966bdf04a1', 'a2eda850-fbde-4c57-b564-2f1f8d2e8b43', 2, 'Sutlej');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7fb34dc-94de-40df-91d3-52bff2fe177c', 'a2eda850-fbde-4c57-b564-2f1f8d2e8b43', 3, 'Teesta');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a2eda850-fbde-4c57-b564-2f1f8d2e8b43', 'fd16ce17-7303-4494-9ca8-06966bdf04a1', 'The Sutlej has an antecedent drainage pattern, originates on the Tibetan Plateau, flows through China, India, and Pakistan, and does not form distributaries.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d6916626-da22-4932-9201-1aca102f9893', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 34, 'Which of the following with reference to Indian States is/are not correct?
1. Uttar Pradesh shares its boundary with the highest number of other Indian States.
2. Rajasthan shares the longest international border among all Indian States.
3. Sikkim is the only State that shares its boundary with just one other Indian State.', 'Geography', 'Political Geography of India', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f47f1ab-b850-4b9d-9ce4-04bda7835ed2', 'd6916626-da22-4932-9201-1aca102f9893', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f1f48f3-bbdb-4c45-873c-4cdb14b42e01', 'd6916626-da22-4932-9201-1aca102f9893', 1, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('307522ca-9ae5-447f-8651-111c34b34aee', 'd6916626-da22-4932-9201-1aca102f9893', 2, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40bf1301-ee17-410c-8db9-8ac66d99d110', 'd6916626-da22-4932-9201-1aca102f9893', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d6916626-da22-4932-9201-1aca102f9893', '307522ca-9ae5-447f-8651-111c34b34aee', 'Statements 2 and 3 are NOT correct -- Gujarat, not Rajasthan, has the longest international border among Indian states, and Meghalaya also borders only one other Indian state (Assam), so Sikkim is not unique in that regard. Statement 1 (UP bordering the most states) is correct.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('50e4fc33-5fb7-4c99-8ec4-8653f322636e', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 35, 'Ships from which of the following countries have to cross the Strait of Hormuz to reach out to the Indian Ocean?
1. Bahrain
2. Syria
3. Qatar
4. Egypt', 'Geography', 'Physical Geography — Straits', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38bfdf84-244f-4528-8c9e-328d064c5cff', '50e4fc33-5fb7-4c99-8ec4-8653f322636e', 0, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36dfe6bd-29e3-49b8-8c5e-d18c2247281f', '50e4fc33-5fb7-4c99-8ec4-8653f322636e', 1, '1 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e8cafd2-fee9-49c4-8401-6dffb55827bb', '50e4fc33-5fb7-4c99-8ec4-8653f322636e', 2, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d86f6f39-c638-4792-b8ea-6c9b8ea21005', '50e4fc33-5fb7-4c99-8ec4-8653f322636e', 3, '3 and 4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('50e4fc33-5fb7-4c99-8ec4-8653f322636e', '36dfe6bd-29e3-49b8-8c5e-d18c2247281f', 'Bahrain and Qatar, both on the Persian Gulf, must transit the Strait of Hormuz to reach the Indian Ocean. Syria and Egypt do not, given their Mediterranean/Red Sea positions.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('352d2e86-ebc7-47f0-8108-d8d653a2d2a8', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 36, 'Which of the following statements with regard to the arrival of Amur Falcons at Doyang Lake in Nagaland each year from Mongolia is/are correct?
1. It showcases how sustained local conservation efforts can contribute to the arrival and protection of international migratory birds.
2. It reflects the global success of advanced tracking technologies that guide migratory birds back to their stopover sites.
3. It confirms that Amur Falcons have adapted to permanent residency in India due to favourable habitat changes.', 'Geography', 'Wildlife Conservation — Migratory Birds', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f28d0494-d31c-40d0-8ba8-fd1ec4ccd4b4', '352d2e86-ebc7-47f0-8108-d8d653a2d2a8', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ca01568-f045-44aa-9326-8d937a22c38b', '352d2e86-ebc7-47f0-8108-d8d653a2d2a8', 1, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0a51791-b780-4aea-8d32-31275d5b0003', '352d2e86-ebc7-47f0-8108-d8d653a2d2a8', 2, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('222c4fa4-ede6-42d5-9822-849d69028dab', '352d2e86-ebc7-47f0-8108-d8d653a2d2a8', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('352d2e86-ebc7-47f0-8108-d8d653a2d2a8', 'f28d0494-d31c-40d0-8ba8-fd1ec4ccd4b4', 'Only statement 1 is correct -- Doyang Lake''s turnaround is a genuine local-conservation success story. Tracking technology monitors migration, it doesn''t guide birds (statement 2 is wrong), and the falcons remain migratory, not permanent residents (statement 3 is wrong).', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c91fbdfd-73be-4414-8ca4-6f19b9bcbfd9', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 37, 'Which among the following is/are the objective(s) of the Rainfed Area Development (RAD) initiative under the National Mission for Sustainable Agriculture (NMSA)?
1. Encouraging monoculture in rainfed areas
2. Increasing rice cultivation in irrigated regions
3. Enhancing productivity and minimising climatic risks through Integrated Farming Systems (IFS)', 'Geography', 'Agriculture Policy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9084debf-9dd0-4a8e-a2bc-fc8f8221e33e', 'c91fbdfd-73be-4414-8ca4-6f19b9bcbfd9', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd2b37a2-02a0-4281-aedb-f4a350f273f5', 'c91fbdfd-73be-4414-8ca4-6f19b9bcbfd9', 1, '1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f8251f0-d8ac-40b6-b2db-155ca7798077', 'c91fbdfd-73be-4414-8ca4-6f19b9bcbfd9', 2, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd3e29fe-2629-4799-b3a6-f2097cc96f35', 'c91fbdfd-73be-4414-8ca4-6f19b9bcbfd9', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c91fbdfd-73be-4414-8ca4-6f19b9bcbfd9', 'fd3e29fe-2629-4799-b3a6-f2097cc96f35', 'Only statement 3 is a real RAD objective -- enhancing productivity and reducing climatic risk through Integrated Farming Systems. RAD promotes diversification, not monoculture, and isn''t targeted at irrigated rice regions.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4101656f-6efd-48de-9782-e8fca4ee41df', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 38, 'Which of the following is/are the most significant implication(s) of obtaining Oeko-Tex certification for Eri Silk in the global textile industry?
1. It allows Indian exporters to compete in high-end markets that prioritise chemical-free products.
2. It confirms that Eri Silk meets international safety, environmental, and quality standards, enabling its entry into premium eco-conscious markets.', 'Geography', 'Trade & Certification', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51a3824b-7aaa-4042-9b50-9bfad047b856', '4101656f-6efd-48de-9782-e8fca4ee41df', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cec45e87-c465-4195-bfd8-15717b450137', '4101656f-6efd-48de-9782-e8fca4ee41df', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('853691e9-518e-45ae-b9af-338153eb88f0', '4101656f-6efd-48de-9782-e8fca4ee41df', 2, 'Both 1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b927b50d-fe18-4f8b-89ab-96ca7f6eac5f', '4101656f-6efd-48de-9782-e8fca4ee41df', 3, 'Neither 1 nor 2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4101656f-6efd-48de-9782-e8fca4ee41df', '853691e9-518e-45ae-b9af-338153eb88f0', 'Both statements are correct -- Oeko-Tex certification both signals chemical-safety compliance for high-end market access and confirms broader international standards compliance for eco-conscious markets.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

-- ── Section: Polity, Governance & Economy (10 questions) — UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com's official-paper reproduction page. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5840653f-4f16-4e3b-b271-ee68119c5e0f', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 39, 'Match List I (INTERPOL Notice) with List II (Description) and select the correct answer using the code given below:
List I: A. Silver Notice B. Blue Notice C. Black Notice D. Green Notice
List II: 1. To seek information on unidentified bodies 2. To collect additional information about a person''s identity, location, or activities in relation to a criminal investigation 3. To provide warning about a person''s criminal activities, where the person is considered a possible threat to public safety 4. To identify and trace criminal assets', 'Polity/Economy', 'International Cooperation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c46c9dc0-3ed7-4bf8-8ebe-610616344b19', '5840653f-4f16-4e3b-b271-ee68119c5e0f', 0, 'A-3, B-1, C-2, D-4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20751ee0-8ad9-45f5-b0ea-2b8aa7ccfd9e', '5840653f-4f16-4e3b-b271-ee68119c5e0f', 1, 'A-3, B-2, C-1, D-4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ee3b50f-a121-488a-8187-e98f26e1e9c2', '5840653f-4f16-4e3b-b271-ee68119c5e0f', 2, 'A-4, B-2, C-1, D-3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be85f5b9-3383-4cd5-ac37-b47590b9dc6a', '5840653f-4f16-4e3b-b271-ee68119c5e0f', 3, 'A-4, B-1, C-2, D-3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5840653f-4f16-4e3b-b271-ee68119c5e0f', '4ee3b50f-a121-488a-8187-e98f26e1e9c2', 'Silver Notice: trace criminal assets (4). Blue Notice: collect information on identity/location/activities (2). Black Notice: unidentified bodies (1). Green Notice: warning about a public-safety threat (3) -- giving code A-4, B-2, C-1, D-3.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f53a2d2a-60b3-4576-93e7-13562c152d3e', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 40, 'Which of the following statements in relation to NIRANTAR (National Institute for Research and Application of Natural Resources to Transform, Adapt and Build Resilience), a platform of institutions under the Ministry of Environment, Forest and Climate Change, is/are correct?
1. Ecosystem Survey and Analysis is a vertical under this platform, the lead institute of which is Botanical Survey of India, Kolkata.
2. Research and Management of Ecosystem Service is a vertical under this platform, the lead institute of which is Central Zoo Authority, New Delhi.
3. Capacity Development Support is a vertical under this platform, the lead institute of which is Indian Institute of Forest Management, Bhopal.', 'Polity/Economy', 'Environmental Governance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b4a62b9-cf50-4cac-b61b-c861278ab672', 'f53a2d2a-60b3-4576-93e7-13562c152d3e', 0, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3aebeaed-dab0-4e09-92fb-840687f8da51', 'f53a2d2a-60b3-4576-93e7-13562c152d3e', 1, '1 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44bca14a-bdb8-46d2-9521-aa4bec1f7875', 'f53a2d2a-60b3-4576-93e7-13562c152d3e', 2, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfdf3e69-ccfe-4d19-89f5-953ec8ecf182', 'f53a2d2a-60b3-4576-93e7-13562c152d3e', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f53a2d2a-60b3-4576-93e7-13562c152d3e', '3aebeaed-dab0-4e09-92fb-840687f8da51', 'Statements 1 and 3 are correct. Statement 2 is wrong -- the Research and Management of Ecosystem Service vertical''s lead institute is not the Central Zoo Authority.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a937c500-9577-4f9d-a9ca-0179205e759b', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 41, 'With reference to the outcomes of the German Chancellor''s January 2026 visit to India, which of the following is/are not correct?
1. Signing of a Memorandum of Understanding between the All India Institute of Ayurveda and the University of Hamburg
2. Signing of a Memorandum of Understanding on Youth Hockey Development between Hockey India and the German Hockey Federation
3. Establishment of a bilateral dialogue mechanism on the Indo-Pacific
4. Opening of an Honorary Consul of Germany in Lucknow', 'Polity/Economy', 'Foreign Relations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3235680-9c52-4e42-a0b9-81eb61e7d022', 'a937c500-9577-4f9d-a9ca-0179205e759b', 0, '2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7182352-d73f-4486-abad-69e335f50065', 'a937c500-9577-4f9d-a9ca-0179205e759b', 1, '1 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68de5497-c42d-4cbc-8999-bea35bfc0bae', 'a937c500-9577-4f9d-a9ca-0179205e759b', 2, '3 and 4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32bf9429-3960-42e1-b45c-e96e634f55ba', 'a937c500-9577-4f9d-a9ca-0179205e759b', 3, '1 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a937c500-9577-4f9d-a9ca-0179205e759b', 'f7182352-d73f-4486-abad-69e335f50065', 'Statements 1 and 4 are NOT correct -- the actual MoU was with Charité Berlin (not the University of Hamburg), and the Honorary Consul opened in Ahmedabad (not Lucknow).', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a1b3e42f-3bbc-4e30-9ce5-2371430af0a3', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 42, 'Which one of the following pairs of semiconductor plants in India and their locations is not correctly matched?', 'Polity/Economy', 'Semiconductor Policy', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('261690b0-37e8-4822-8e2d-b02e91b75df4', 'a1b3e42f-3bbc-4e30-9ce5-2371430af0a3', 0, 'CG Power and Industrial Solutions Pvt. Ltd. in partnership with Renesas Electronics and STARS Microelectronics: Gujarat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0b449f2-25c8-4964-9895-352a541ba828', 'a1b3e42f-3bbc-4e30-9ce5-2371430af0a3', 1, 'Tata Semiconductor Assembly and Test Pvt. Ltd.: Assam');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c1ab54c-54b9-462b-b7e5-de2c496d7851', 'a1b3e42f-3bbc-4e30-9ce5-2371430af0a3', 2, 'HCL-Foxconn Joint Venture India Chip Ltd.: Madhya Pradesh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c10b91cc-2efa-462e-8f41-71929f385f08', 'a1b3e42f-3bbc-4e30-9ce5-2371430af0a3', 3, 'SicSem Pvt. Ltd.: Odisha');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a1b3e42f-3bbc-4e30-9ce5-2371430af0a3', '2c1ab54c-54b9-462b-b7e5-de2c496d7851', 'The HCL-Foxconn semiconductor plant is located at Jewar, Uttar Pradesh -- not Madhya Pradesh, making this pair incorrect.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bca00946-4646-4608-95f4-dc5f4a477e61', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 43, 'Which of the following statements about DHRUV64 is/are correct?
1. It is the third chip fabricated under the DIR-V Programme.
2. It is India''s first homegrown 1.0 GHz, 64-bit dual-core microprocessor.', 'Polity/Economy', 'Indigenous Technology', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2082a166-2cf6-446c-9864-9166b09c6933', 'bca00946-4646-4608-95f4-dc5f4a477e61', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98d0e5e2-4bcd-42a2-9fce-4984fbdba6a7', 'bca00946-4646-4608-95f4-dc5f4a477e61', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92ae9716-cc94-43be-81c1-c759d9e90feb', 'bca00946-4646-4608-95f4-dc5f4a477e61', 2, 'Both 1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41f45b37-39e3-43cf-bd62-8cd320dda355', 'bca00946-4646-4608-95f4-dc5f4a477e61', 3, 'Neither 1 nor 2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bca00946-4646-4608-95f4-dc5f4a477e61', '92ae9716-cc94-43be-81c1-c759d9e90feb', 'Both statements are correct -- DHRUV64 is the third DIR-V chip and India''s first homegrown 1.0 GHz 64-bit dual-core microprocessor.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8effd35e-9054-4a4b-bcdb-5d6f862de382', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 44, 'With reference to the new BIS standard for bomb disposal systems, consider the following statements:
1. The new standard is known as IS 19445:2025.
2. It will improve interoperability of equipment across agencies.
3. It was developed by TBRL, DRDO in collaboration with the 30th Central Scientific Research Institute, Russia.', 'Polity/Economy', 'Defence Standards', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9deb509c-49ba-4b77-a9f6-24b544766ed7', '8effd35e-9054-4a4b-bcdb-5d6f862de382', 0, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a3e690c-7621-493b-a721-f780ae095626', '8effd35e-9054-4a4b-bcdb-5d6f862de382', 1, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('edb60d92-975c-4ca8-a973-1f6255d0968b', '8effd35e-9054-4a4b-bcdb-5d6f862de382', 2, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('366cb3ab-fd80-47ed-8541-839683e6bf23', '8effd35e-9054-4a4b-bcdb-5d6f862de382', 3, '1 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8effd35e-9054-4a4b-bcdb-5d6f862de382', 'edb60d92-975c-4ca8-a973-1f6255d0968b', 'Statements 1 and 2 are correct. Statement 3 is wrong -- the standard was developed indigenously by TBRL/DRDO, not in collaboration with a Russian institute.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('dbb3c2c3-98fd-4995-94cb-662c9e0da795', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 45, '''X'', born in the UK, was conferred the Nobel Prize in 2025. He was a professor in an American university when this prize was announced. Identify ''X'':', 'Polity/Economy', 'Global Affairs — Nobel Laureates', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5d5bee7-a3c3-4721-ac32-d6e683c99350', 'dbb3c2c3-98fd-4995-94cb-662c9e0da795', 0, 'Michel H. Devoret');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ca0a838-8511-4a75-8e12-c3827e6018a3', 'dbb3c2c3-98fd-4995-94cb-662c9e0da795', 1, 'Richard Robson');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d4513c7-ed4e-421c-8023-b139e0c052d9', 'dbb3c2c3-98fd-4995-94cb-662c9e0da795', 2, 'John Clarke');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3dcd0dad-85a3-4a3d-9b48-2f9060ff4100', 'dbb3c2c3-98fd-4995-94cb-662c9e0da795', 3, 'Joel Mokyr');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dbb3c2c3-98fd-4995-94cb-662c9e0da795', '8d4513c7-ed4e-421c-8023-b139e0c052d9', 'John Clarke, born in the UK (Cambridge) and a professor at UC Berkeley, was a 2025 Nobel Physics Prize recipient.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('59ce8f49-655a-42b4-916a-a3183507e7dd', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 46, 'Which of the following statements with regard to the Grand Slam Tennis Tournaments is/are correct?
1. The tournaments have a shared governance structure establishing the partnership among the four Grand Slam tournaments.
2. They are open for entry to all internationally ranked tennis players above the age of 14.
3. There is a limitation on the number of ''Wild Cards'' a player may receive to compete in a Grand Slam Tournament.', 'Polity/Economy', 'Sports Governance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9813906c-eb68-4fb0-9c02-0d0da87491cd', '59ce8f49-655a-42b4-916a-a3183507e7dd', 0, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a50b5a43-89af-49ec-a79d-9bf143223b14', '59ce8f49-655a-42b4-916a-a3183507e7dd', 1, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91c2d5b1-f01b-403d-9051-82e711f753d9', '59ce8f49-655a-42b4-916a-a3183507e7dd', 2, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c127fd6-f275-4c7d-ad72-d04f7f9b824e', '59ce8f49-655a-42b4-916a-a3183507e7dd', 3, '1, 2 and 3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('59ce8f49-655a-42b4-916a-a3183507e7dd', '91c2d5b1-f01b-403d-9051-82e711f753d9', 'Only statement 1 is correct as the specific claim tested -- statements 2 and 3, as precisely worded, do not hold (entry and wild-card rules have further conditions beyond what''s stated).', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4b5621c6-2464-4ff0-87f4-93f1210e7681', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 47, 'Which of the following statements with regard to India''s indigenous new high resolution weather model, the ''Bharat Forecast System,'' is/are correct?
1. Its objective is to generate forecasts at the Panchayats cluster level.
2. It was developed by IIT Delhi.', 'Polity/Economy', 'Meteorology', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0eb69b00-38f6-45de-8fe5-370054b008b3', '4b5621c6-2464-4ff0-87f4-93f1210e7681', 0, '1 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9261e693-87bb-408c-af59-83e6c77f9e70', '4b5621c6-2464-4ff0-87f4-93f1210e7681', 1, '2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8fd05a55-c1bc-4f31-8b82-a8ae42c5be44', '4b5621c6-2464-4ff0-87f4-93f1210e7681', 2, 'Both 1 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46a2f68a-1465-48cf-b073-fe57d4593c1f', '4b5621c6-2464-4ff0-87f4-93f1210e7681', 3, 'Neither 1 nor 2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4b5621c6-2464-4ff0-87f4-93f1210e7681', '0eb69b00-38f6-45de-8fe5-370054b008b3', 'Statement 1 is correct -- it targets panchayat-cluster-level forecasts. Statement 2 is wrong -- it was developed by IITM Pune, not IIT Delhi.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('124863b4-4a0d-45e8-9292-0f587d132566', '6d78f75e-d3fd-43fc-ae9f-c16c19d9c9f9', 48, 'Consider the following statements with regard to the film ''Boong'':
1. The film has recently won the British Academy of Film and Television Arts (BAFTA) Award in the Children''s and Family Film category.
2. The film is directed by Lakshmipriya Devi.
3. This is the first Indian film to win a BAFTA award in the Children''s and Family Film category.
Which of the statements given above is/are correct?', 'Polity/Economy', 'Current Affairs — Film & Culture', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d64243dc-f633-42a8-be6d-4645b66d93cf', '124863b4-4a0d-45e8-9292-0f587d132566', 0, '1, 2 and 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d0c8fc2-3502-4c50-b45c-b7a4e1c97cef', '124863b4-4a0d-45e8-9292-0f587d132566', 1, '2 and 3 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a00f560-57c1-403d-ba75-8e99c0fbfc51', '124863b4-4a0d-45e8-9292-0f587d132566', 2, '1 and 2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70a01005-9cb1-4cc3-8bab-5b66ad81d574', '124863b4-4a0d-45e8-9292-0f587d132566', 3, '3 only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('124863b4-4a0d-45e8-9292-0f587d132566', 'd64243dc-f633-42a8-be6d-4645b66d93cf', 'All three statements are correct -- ''Boong,'' directed by Lakshmipriya Devi, won the BAFTA Children''s/Family Film award, the first Indian film to do so.', 'UPSC CSE Prelims 2026, GS Paper I (exam held 24 May 2026). Verified verbatim, question-by-question, against anantamias.com''s official-paper reproduction page.');
