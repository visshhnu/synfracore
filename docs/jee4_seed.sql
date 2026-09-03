-- ============================================================
-- JEE Main — Full Mock Paper 4
-- Full-Length Practice Paper (75 questions, 180 minutes)
-- Marking: +4 correct / -1 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('011d3a8c-0cff-4170-ba23-59c383912f41', 'jee-main-practice-4', 'JEE Main Full Mock Paper 4', 'jee-main', ARRAY['Physics', 'Chemistry', 'Mathematics', 'NCERT', 'JEE Main']::TEXT[], 75, 'mixed', true, 4, 180, 4, 1);

-- ── Section: Physics (25 questions) — Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('258945ff-81a0-409a-826d-daee112a42c4', '011d3a8c-0cff-4170-ba23-59c383912f41', 1, 'Which of the following pairs has different dimensions?', 'Physics', 'Units and Measurements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8064513-4d2b-412f-82bc-6bdea51d28f3', '258945ff-81a0-409a-826d-daee112a42c4', 0, 'Impulse and momentum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da2e151e-8913-4b64-aafe-8f275104bad1', '258945ff-81a0-409a-826d-daee112a42c4', 1, 'Work and torque');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c49230d-8963-4741-8fa3-dcd1329663ac', '258945ff-81a0-409a-826d-daee112a42c4', 2, 'Pressure and stress');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44e2f6a5-3e4e-4301-a977-7b8e155232b6', '258945ff-81a0-409a-826d-daee112a42c4', 3, 'Force and pressure');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('258945ff-81a0-409a-826d-daee112a42c4', '44e2f6a5-3e4e-4301-a977-7b8e155232b6', 'Force has dimensions [MLT^-2] while pressure has dimensions [ML^-1T^-2] (force/area) — these are different, unlike the other listed pairs, which are dimensionally identical.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('50a57013-73c8-4564-a02e-60c514907bc1', '011d3a8c-0cff-4170-ba23-59c383912f41', 2, 'For a projectile launched at an angle theta, the maximum height reached is given by:', 'Physics', 'Motion in a Plane', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d929e417-4558-4044-bfa0-5080a9cf83bb', '50a57013-73c8-4564-a02e-60c514907bc1', 0, 'u^2*sin^2(theta)/(2g)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca648fab-4846-44d6-af52-d69e94b56b46', '50a57013-73c8-4564-a02e-60c514907bc1', 1, 'u^2*sin(2*theta)/g');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('133c6117-e96b-4827-9279-3eef9ed33a4c', '50a57013-73c8-4564-a02e-60c514907bc1', 2, 'u*sin(theta)/g');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8aa5a0ef-89a4-4734-80f7-bd5a9b2e852b', '50a57013-73c8-4564-a02e-60c514907bc1', 3, 'u^2*cos^2(theta)/(2g)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('50a57013-73c8-4564-a02e-60c514907bc1', 'd929e417-4558-4044-bfa0-5080a9cf83bb', 'Maximum height H = u^2*sin^2(theta)/(2g), derived from the vertical component of initial velocity and v^2=u^2-2gh at the peak.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3c89f84b-f402-47cc-a935-5a7ec01ddd88', '011d3a8c-0cff-4170-ba23-59c383912f41', 3, 'According to Newton''s first law of motion, a body remains in its state of rest or uniform motion unless acted upon by:', 'Physics', 'Laws of Motion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d87cd36-6ad8-4567-a82e-bd96e9bb8b83', '3c89f84b-f402-47cc-a935-5a7ec01ddd88', 0, 'Gravity alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b873b29d-039c-4afb-8bba-b280b3f2507f', '3c89f84b-f402-47cc-a935-5a7ec01ddd88', 1, 'A net external force');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6122322-d726-4199-aed3-c6626e8d2832', '3c89f84b-f402-47cc-a935-5a7ec01ddd88', 2, 'Friction only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5294113c-174b-4793-87bd-a927e31f4836', '3c89f84b-f402-47cc-a935-5a7ec01ddd88', 3, 'Air resistance only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3c89f84b-f402-47cc-a935-5a7ec01ddd88', 'b873b29d-039c-4afb-8bba-b280b3f2507f', 'Newton''s first law (the law of inertia) states that a body maintains its state of rest or uniform velocity unless acted upon by a net external unbalanced force.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ec1cdd56-ca62-4def-b1d1-0b9342f0b3e0', '011d3a8c-0cff-4170-ba23-59c383912f41', 4, 'The work done by a conservative force around any closed path is:', 'Physics', 'Work, Energy and Power', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df4cd08f-8b48-429b-bc81-dd6d3d97f1c5', 'ec1cdd56-ca62-4def-b1d1-0b9342f0b3e0', 0, 'Positive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b9ce25c-1586-490c-93c6-39f2162db50a', 'ec1cdd56-ca62-4def-b1d1-0b9342f0b3e0', 1, 'Negative');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed690eb7-cf4a-41ad-89bb-f745a54ec575', 'ec1cdd56-ca62-4def-b1d1-0b9342f0b3e0', 2, 'Zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6dc93e83-fb32-42a7-8807-10952111f92b', 'ec1cdd56-ca62-4def-b1d1-0b9342f0b3e0', 3, 'Dependent on the path taken');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ec1cdd56-ca62-4def-b1d1-0b9342f0b3e0', 'ed690eb7-cf4a-41ad-89bb-f745a54ec575', 'A defining property of a conservative force is that the net work done around any closed path is exactly zero, independent of the path taken.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7593647f-de57-4805-bded-875ef9927089', '011d3a8c-0cff-4170-ba23-59c383912f41', 5, 'The centre of mass of a uniform triangular lamina lies at its:', 'Physics', 'System of Particles and Rotational Motion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8091255f-3eea-4140-a793-941a28eb703d', '7593647f-de57-4805-bded-875ef9927089', 0, 'Circumcentre');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('afa3da6b-8662-40eb-ab63-c5c7c56afa31', '7593647f-de57-4805-bded-875ef9927089', 1, 'Incentre');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d9e1a41-436d-469e-af61-9e279a4cf789', '7593647f-de57-4805-bded-875ef9927089', 2, 'Centroid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d4a9b26-49f1-4e56-b29f-86a6610c8074', '7593647f-de57-4805-bded-875ef9927089', 3, 'Orthocentre');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7593647f-de57-4805-bded-875ef9927089', '0d9e1a41-436d-469e-af61-9e279a4cf789', 'For a uniform triangular lamina, the centre of mass coincides with the geometric centroid, the point of intersection of the medians.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4a1bc1a4-fd18-4ed5-ac14-a562a9392f77', '011d3a8c-0cff-4170-ba23-59c383912f41', 6, 'The gravitational potential energy of a body of mass m at a height h above Earth''s surface (h << R) is approximately:', 'Physics', 'Gravitation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd9cae64-70d3-4fa5-a241-dbe3163fdc31', '4a1bc1a4-fd18-4ed5-ac14-a562a9392f77', 0, '-GMm/R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85306f11-1603-4907-8c71-aa558feb6530', '4a1bc1a4-fd18-4ed5-ac14-a562a9392f77', 1, 'mgh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67600570-6551-496f-af1e-354a7cc887cc', '4a1bc1a4-fd18-4ed5-ac14-a562a9392f77', 2, 'GMm/(R+h)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58b4b726-69a6-4241-bc3e-daff8daeed70', '4a1bc1a4-fd18-4ed5-ac14-a562a9392f77', 3, '-GMm/(R+h)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4a1bc1a4-fd18-4ed5-ac14-a562a9392f77', '85306f11-1603-4907-8c71-aa558feb6530', 'Near Earth''s surface, where g is approximately constant, gravitational potential energy relative to the surface is U ≈ mgh.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e4a69c5a-1f00-43f8-aadb-8c2e5c7f00d5', '011d3a8c-0cff-4170-ba23-59c383912f41', 7, 'Elastic fatigue refers to the phenomenon where a material:', 'Physics', 'Mechanical Properties of Solids', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8c19132-eefb-4cf7-bd7b-7ea52362781d', 'e4a69c5a-1f00-43f8-aadb-8c2e5c7f00d5', 0, 'Becomes stronger under repeated stress');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb7a7af0-6636-47a3-b9e5-c6a251af481f', 'e4a69c5a-1f00-43f8-aadb-8c2e5c7f00d5', 1, 'Loses its elastic properties due to repeated loading and unloading over time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b79feba8-43d3-4076-baaf-fd7fc7e432c9', 'e4a69c5a-1f00-43f8-aadb-8c2e5c7f00d5', 2, 'Increases in volume under stress');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ad45b66-724d-4796-908e-71a5ff32a75b', 'e4a69c5a-1f00-43f8-aadb-8c2e5c7f00d5', 3, 'Becomes more ductile with repeated stress');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e4a69c5a-1f00-43f8-aadb-8c2e5c7f00d5', 'cb7a7af0-6636-47a3-b9e5-c6a251af481f', 'Elastic fatigue describes the gradual loss of elastic strength/properties in a material subjected to repeated cycles of stress and strain over time.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('39b9f5a8-754e-4ec8-8ecf-f08ef0e46a75', '011d3a8c-0cff-4170-ba23-59c383912f41', 8, 'The process of heat transfer that does not require a material medium is:', 'Physics', 'Thermal Properties of Matter', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96496798-1d71-4021-a426-23b23193de79', '39b9f5a8-754e-4ec8-8ecf-f08ef0e46a75', 0, 'Conduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5cfb682-bf4c-43da-9f32-5eeea5f61ea2', '39b9f5a8-754e-4ec8-8ecf-f08ef0e46a75', 1, 'Convection');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9487318e-ac15-4b81-918e-0468f2498220', '39b9f5a8-754e-4ec8-8ecf-f08ef0e46a75', 2, 'Radiation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25aebfc8-cadc-4514-9a48-ce49ccd18991', '39b9f5a8-754e-4ec8-8ecf-f08ef0e46a75', 3, 'Conduction and convection both');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('39b9f5a8-754e-4ec8-8ecf-f08ef0e46a75', '9487318e-ac15-4b81-918e-0468f2498220', 'Radiation transfers heat via electromagnetic waves and does not require any material medium, unlike conduction and convection, both of which need a medium.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('45ea3f8e-f2f4-4672-98af-5200a10bce30', '011d3a8c-0cff-4170-ba23-59c383912f41', 9, 'The change in entropy of the universe for any real (irreversible) process is:', 'Physics', 'Thermodynamics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ccd059e-3bca-4e1c-a4d4-e8e96dd701f0', '45ea3f8e-f2f4-4672-98af-5200a10bce30', 0, 'Always negative');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('542d41b4-cb5c-4cfd-ac8d-fc623e548d66', '45ea3f8e-f2f4-4672-98af-5200a10bce30', 1, 'Always zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5c8b4f5-26d2-410c-ba03-1100c1be5beb', '45ea3f8e-f2f4-4672-98af-5200a10bce30', 2, 'Always positive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35d5636e-afeb-482c-b73d-92e8acbe185f', '45ea3f8e-f2f4-4672-98af-5200a10bce30', 3, 'Always undefined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('45ea3f8e-f2f4-4672-98af-5200a10bce30', 'f5c8b4f5-26d2-410c-ba03-1100c1be5beb', 'The second law of thermodynamics states that the entropy of the universe increases for any real, irreversible process — a positive change.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2d90753c-bb7c-4c97-9e4c-2944cd88f5b0', '011d3a8c-0cff-4170-ba23-59c383912f41', 10, 'The pressure exerted by an ideal gas, according to kinetic theory, is directly proportional to:', 'Physics', 'Kinetic Theory', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c280da3b-8b6c-4a07-8436-d591a6bf585c', '2d90753c-bb7c-4c97-9e4c-2944cd88f5b0', 0, 'The volume of the container only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('486f9a9a-52e2-4c00-a00c-b95a81dddc92', '2d90753c-bb7c-4c97-9e4c-2944cd88f5b0', 1, 'The mean square speed of the gas molecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5bd4c4a-f5c3-45c1-984a-dc840bb4926d', '2d90753c-bb7c-4c97-9e4c-2944cd88f5b0', 2, 'The temperature only, independent of speed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6fab9a2e-625e-477f-aec4-db5844f8ab24', '2d90753c-bb7c-4c97-9e4c-2944cd88f5b0', 3, 'The number of moles only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2d90753c-bb7c-4c97-9e4c-2944cd88f5b0', '486f9a9a-52e2-4c00-a00c-b95a81dddc92', 'Kinetic theory derives P = (1/3)*(mn/V)*v_rms^2, showing pressure is directly proportional to the mean square speed of the molecules (and their number density and mass).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4520a82e-37c0-4d17-91c3-9f6e72ee0190', '011d3a8c-0cff-4170-ba23-59c383912f41', 11, 'The total energy of a particle executing SHM is proportional to:', 'Physics', 'Oscillations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13c475b1-b9a7-49f3-a307-c4209048cc12', '4520a82e-37c0-4d17-91c3-9f6e72ee0190', 0, 'The amplitude');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62ccde27-4fc8-4185-ae64-46719f08b554', '4520a82e-37c0-4d17-91c3-9f6e72ee0190', 1, 'The square of the amplitude');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('939d9dee-7a9d-43d1-bf2b-74a24b4ce89a', '4520a82e-37c0-4d17-91c3-9f6e72ee0190', 2, 'The square root of the amplitude');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2cf7913-50b9-47be-823d-6d8d26a81c21', '4520a82e-37c0-4d17-91c3-9f6e72ee0190', 3, 'The angular frequency only, independent of amplitude');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4520a82e-37c0-4d17-91c3-9f6e72ee0190', '62ccde27-4fc8-4185-ae64-46719f08b554', 'Total energy in SHM, E = (1/2)*m*omega^2*A^2, is proportional to the square of the amplitude.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c6fb3398-488a-41db-8270-ce61b547a2c8', '011d3a8c-0cff-4170-ba23-59c383912f41', 12, 'The Doppler effect for sound describes the apparent change in frequency due to relative motion between:', 'Physics', 'Waves', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('190e9afe-f8c6-4823-851e-e656d53a0dd9', 'c6fb3398-488a-41db-8270-ce61b547a2c8', 0, 'Two stationary observers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e265eb6-3b06-479c-ba75-e7755a5c45dc', 'c6fb3398-488a-41db-8270-ce61b547a2c8', 1, 'The source and the observer (or the medium)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6c1af29-2c5d-496d-8106-d171ef11c4cc', 'c6fb3398-488a-41db-8270-ce61b547a2c8', 2, 'Only the medium, with source and observer stationary');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc6e496c-8666-4741-b95d-d98c3b004e3f', 'c6fb3398-488a-41db-8270-ce61b547a2c8', 3, 'Two different media');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c6fb3398-488a-41db-8270-ce61b547a2c8', '7e265eb6-3b06-479c-ba75-e7755a5c45dc', 'The Doppler effect arises from relative motion between the sound source and the observer (or the medium through which sound travels), causing an apparent shift in the observed frequency.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7012f0a6-8000-4bb3-b68b-b1f4708b3298', '011d3a8c-0cff-4170-ba23-59c383912f41', 13, 'The SI unit of electric dipole moment is:', 'Physics', 'Electric Charges and Fields', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7da12642-6e05-4f76-ade2-5b0841e130af', '7012f0a6-8000-4bb3-b68b-b1f4708b3298', 0, 'Coulomb');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46d556c9-ba2a-4273-a1c3-ef2bebd33ceb', '7012f0a6-8000-4bb3-b68b-b1f4708b3298', 1, 'Coulomb-metre');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01ed88f4-aaca-4696-869d-f7d1f9b9841f', '7012f0a6-8000-4bb3-b68b-b1f4708b3298', 2, 'Newton-metre');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a237b13a-6a14-4ec3-8448-143217a4c5de', '7012f0a6-8000-4bb3-b68b-b1f4708b3298', 3, 'Volt-metre');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7012f0a6-8000-4bb3-b68b-b1f4708b3298', '46d556c9-ba2a-4273-a1c3-ef2bebd33ceb', 'Electric dipole moment p = q*d, with units of charge times distance, i.e., coulomb-metre (C.m).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5de5d660-048f-43a3-bc6e-ff6fe327b2c2', '011d3a8c-0cff-4170-ba23-59c383912f41', 14, 'Work done in moving a charge along an equipotential surface is:', 'Physics', 'Electrostatic Potential and Capacitance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd27f1be-b4ff-4bd6-84a9-102ad5210e7d', '5de5d660-048f-43a3-bc6e-ff6fe327b2c2', 0, 'Maximum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44288c9b-5c9a-4f93-b7ca-572e432721d4', '5de5d660-048f-43a3-bc6e-ff6fe327b2c2', 1, 'Zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e56b609-750c-4da1-836c-8754ed865ae7', '5de5d660-048f-43a3-bc6e-ff6fe327b2c2', 2, 'Dependent on the path length');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9557cf81-273d-44ab-ab02-ff6921e3fb85', '5de5d660-048f-43a3-bc6e-ff6fe327b2c2', 3, 'Equal to the charge''s potential energy');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5de5d660-048f-43a3-bc6e-ff6fe327b2c2', '44288c9b-5c9a-4f93-b7ca-572e432721d4', 'Since all points on an equipotential surface have the same potential, no work is done in moving a charge along it (W = q*deltaV = q*0 = 0).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ac96c274-fa4c-495e-b560-0f8d04b76a72', '011d3a8c-0cff-4170-ba23-59c383912f41', 15, 'The resistivity of a conductor generally _____ with an increase in temperature.', 'Physics', 'Current Electricity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cc788e4-79ce-4c37-8355-34d732b444f0', 'ac96c274-fa4c-495e-b560-0f8d04b76a72', 0, 'Increases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a155c194-6bff-4582-8034-068d88434cf9', 'ac96c274-fa4c-495e-b560-0f8d04b76a72', 1, 'Decreases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58c322d7-c2fe-426f-9270-28ae5c55f446', 'ac96c274-fa4c-495e-b560-0f8d04b76a72', 2, 'Remains constant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff0cdf43-e51a-45bc-a943-32a333accfb2', 'ac96c274-fa4c-495e-b560-0f8d04b76a72', 3, 'Becomes zero');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ac96c274-fa4c-495e-b560-0f8d04b76a72', '4cc788e4-79ce-4c37-8355-34d732b444f0', 'For most metallic conductors, resistivity increases with temperature due to increased lattice vibrations impeding electron flow.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f22c0da5-ff0b-49e6-8e43-76bbec7ef1f5', '011d3a8c-0cff-4170-ba23-59c383912f41', 16, 'A cyclotron is a device used to:', 'Physics', 'Moving Charges and Magnetism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19e246d7-01f2-44ed-a4c3-eb8733d764b9', 'f22c0da5-ff0b-49e6-8e43-76bbec7ef1f5', 0, 'Generate electricity from mechanical motion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00cd3ac9-480e-427a-887e-b488b5e3a40f', 'f22c0da5-ff0b-49e6-8e43-76bbec7ef1f5', 1, 'Accelerate charged particles to high energies using a combination of electric and magnetic fields');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4746570c-1342-4d87-b4d2-514edaa96b1a', 'f22c0da5-ff0b-49e6-8e43-76bbec7ef1f5', 2, 'Measure magnetic field strength directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c895fea-ab78-4b43-9a9c-4afb76e15ddf', 'f22c0da5-ff0b-49e6-8e43-76bbec7ef1f5', 3, 'Store electrical charge');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f22c0da5-ff0b-49e6-8e43-76bbec7ef1f5', '00cd3ac9-480e-427a-887e-b488b5e3a40f', 'A cyclotron accelerates charged particles (like protons) to high kinetic energies by repeatedly applying an alternating electric field while a magnetic field constrains them to a spiral path.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('378cdeb0-e5db-49bb-b014-3199b17bff02', '011d3a8c-0cff-4170-ba23-59c383912f41', 17, 'The magnetic susceptibility of a diamagnetic material is:', 'Physics', 'Magnetism and Matter', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8498174-d808-439c-8102-8757b1ccd2df', '378cdeb0-e5db-49bb-b014-3199b17bff02', 0, 'Positive and large');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5bad09d2-7a70-4385-a3ad-7fcd268e2126', '378cdeb0-e5db-49bb-b014-3199b17bff02', 1, 'Small and negative');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe04e398-09db-47ea-82c1-4d695f926073', '378cdeb0-e5db-49bb-b014-3199b17bff02', 2, 'Zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68d56056-e477-4b60-9fbb-2644179a72f4', '378cdeb0-e5db-49bb-b014-3199b17bff02', 3, 'Large and negative');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('378cdeb0-e5db-49bb-b014-3199b17bff02', '5bad09d2-7a70-4385-a3ad-7fcd268e2126', 'Diamagnetic materials have a small, negative magnetic susceptibility, reflecting their weak magnetization opposite to an applied field.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7b65ce5d-b5b8-4b60-b3d0-f8262ebb8448', '011d3a8c-0cff-4170-ba23-59c383912f41', 18, 'The phenomenon of self-induction occurs in a coil due to a change in:', 'Physics', 'Electromagnetic Induction', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('839c1c52-b648-4f4a-b0f5-e268a5803337', '7b65ce5d-b5b8-4b60-b3d0-f8262ebb8448', 0, 'The resistance of the coil');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('101fd46c-c638-449c-9b3a-297468b62abb', '7b65ce5d-b5b8-4b60-b3d0-f8262ebb8448', 1, 'The current flowing through the coil itself, and the resulting change in its own magnetic flux');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c160663-7e24-47ec-800f-92ee86d4f56b', '7b65ce5d-b5b8-4b60-b3d0-f8262ebb8448', 2, 'The coil''s physical length');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1cdd0fe-797c-4824-9379-d9c4cf884e36', '7b65ce5d-b5b8-4b60-b3d0-f8262ebb8448', 3, 'The ambient temperature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7b65ce5d-b5b8-4b60-b3d0-f8262ebb8448', '101fd46c-c638-449c-9b3a-297468b62abb', 'Self-induction is the induction of an EMF in a coil due to a change in the current flowing through the SAME coil, which changes the magnetic flux linked with it.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0d740897-0874-4855-90be-2433dc8c37e4', '011d3a8c-0cff-4170-ba23-59c383912f41', 19, 'The power factor of a purely resistive AC circuit is:', 'Physics', 'Alternating Current', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b19328b8-63b6-4eed-bc8c-54316a8c81a2', '0d740897-0874-4855-90be-2433dc8c37e4', 0, '0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85b39350-59e8-42c0-9adf-0934266845f2', '0d740897-0874-4855-90be-2433dc8c37e4', 1, '0.5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e28f3006-6e68-4f8c-837d-a60fe951664c', '0d740897-0874-4855-90be-2433dc8c37e4', 2, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c9960e3-f818-42ef-ac64-cca02a6c1732', '0d740897-0874-4855-90be-2433dc8c37e4', 3, 'Undefined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0d740897-0874-4855-90be-2433dc8c37e4', 'e28f3006-6e68-4f8c-837d-a60fe951664c', 'In a purely resistive circuit, voltage and current are in phase (phase angle = 0), so the power factor cos(phi) = cos(0) = 1.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('da30d043-5ffe-4690-ba17-9af967417e81', '011d3a8c-0cff-4170-ba23-59c383912f41', 20, 'Photoelectric emission occurs only when the frequency of incident light exceeds the metal''s:', 'Physics', 'Dual Nature of Radiation and Matter', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce75bc87-9b0f-4a9c-bae7-2dda0df03d97', 'da30d043-5ffe-4690-ba17-9af967417e81', 0, 'Melting point frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8624107d-b14d-40f3-a106-f1de88120759', 'da30d043-5ffe-4690-ba17-9af967417e81', 1, 'Threshold frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8ee4b76-8b20-4122-82c9-c796f6418765', 'da30d043-5ffe-4690-ba17-9af967417e81', 2, 'Resonant frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76897b6e-8717-4bc6-83e4-bab8f63370b8', 'da30d043-5ffe-4690-ba17-9af967417e81', 3, 'Natural frequency of vibration');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('da30d043-5ffe-4690-ba17-9af967417e81', '8624107d-b14d-40f3-a106-f1de88120759', 'Photoelectric emission requires the incident light''s frequency to exceed the metal''s threshold frequency, below which no emission occurs regardless of intensity.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4ddb8b05-6387-4be5-abb7-9b5e9b7b6acf', '011d3a8c-0cff-4170-ba23-59c383912f41', 21, 'A car travels 60 km in 1.5 hours at constant speed. Its speed (in km/h) is:', 'Physics', 'Motion in a Straight Line — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('4ddb8b05-6387-4be5-abb7-9b5e9b7b6acf', 40, 'Speed = distance/time = 60/1.5 = 40 km/h.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3bad591d-55c8-4daa-aebb-d3cc716fe988', '011d3a8c-0cff-4170-ba23-59c383912f41', 22, 'A force of 20 N acts on a mass of 4 kg initially at rest. The velocity (in m/s) of the mass after 3 seconds is:', 'Physics', 'Laws of Motion — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('3bad591d-55c8-4daa-aebb-d3cc716fe988', 15, 'a = F/m = 20/4 = 5 m/s^2; v = u + at = 0 + 5*3 = 15 m/s.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2fb811ae-e0eb-4802-a370-b98e780f138a', '011d3a8c-0cff-4170-ba23-59c383912f41', 23, 'A capacitor of 10 microF is charged to a potential of 100 V. The charge (in microcoulombs) stored is:', 'Physics', 'Electrostatic Potential and Capacitance — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('2fb811ae-e0eb-4802-a370-b98e780f138a', 1000, 'Q = CV = 10*100 = 1000 microcoulombs.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('97b23ba8-df26-47a9-a85b-9885aaab5158', '011d3a8c-0cff-4170-ba23-59c383912f41', 24, 'A wire carries a current of 3 A for 2 minutes. The total charge (in coulombs) that flows through the wire is:', 'Physics', 'Current Electricity — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('97b23ba8-df26-47a9-a85b-9885aaab5158', 360, 'Q = I*t = 3*(2*60) = 3*120 = 360 coulombs.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8df3e530-f624-4be7-8294-c13f40970455', '011d3a8c-0cff-4170-ba23-59c383912f41', 25, 'In a series LCR circuit, the inductive reactance is 50 ohm and the capacitive reactance is 30 ohm. The net reactance (in ohms) of the circuit is:', 'Physics', 'Alternating Current — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('8df3e530-f624-4be7-8294-c13f40970455', 20, 'Net reactance = X_L - X_C = 50 - 30 = 20 ohm.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Chemistry (25 questions) — Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ac7229c1-5445-49e5-94cd-863997fa0f5b', '011d3a8c-0cff-4170-ba23-59c383912f41', 26, 'The empirical formula of a compound with 40% carbon, 6.7% hydrogen, and 53.3% oxygen by mass is:', 'Chemistry', 'Some Basic Concepts of Chemistry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75e217f1-74da-4da6-81e0-fbf41fc10785', 'ac7229c1-5445-49e5-94cd-863997fa0f5b', 0, 'CH2O');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e4d4627-c1c5-4253-8fca-f38e86dd37ef', 'ac7229c1-5445-49e5-94cd-863997fa0f5b', 1, 'C2H4O2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b348c24-3ef8-4d66-abbf-d1ba83632bff', 'ac7229c1-5445-49e5-94cd-863997fa0f5b', 2, 'CHO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a94f7c5-a27a-4a0e-bbe7-a3148c9300fa', 'ac7229c1-5445-49e5-94cd-863997fa0f5b', 3, 'C2H6O');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ac7229c1-5445-49e5-94cd-863997fa0f5b', '75e217f1-74da-4da6-81e0-fbf41fc10785', 'Converting mass % to moles: C=40/12=3.33, H=6.7/1=6.7, O=53.3/16=3.33; dividing by the smallest (3.33) gives a ratio of approximately 1:2:1, giving empirical formula CH2O.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fa17e2fb-1fc4-4331-8021-85af7d13808e', '011d3a8c-0cff-4170-ba23-59c383912f41', 27, 'The electronic configuration of the Na+ ion (Z=11 for Na) is:', 'Chemistry', 'Structure of Atom', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfc61f77-1a91-49f7-810b-4b9d2e33af40', 'fa17e2fb-1fc4-4331-8021-85af7d13808e', 0, '1s2 2s2 2p6 3s1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('647d84b9-97c6-4bd6-9009-ec5e359fc09d', 'fa17e2fb-1fc4-4331-8021-85af7d13808e', 1, '1s2 2s2 2p6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4821400e-5aee-4235-964f-7c405f9dcc47', 'fa17e2fb-1fc4-4331-8021-85af7d13808e', 2, '1s2 2s2 2p5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b960d29-f32d-4839-8b53-8c6044cf4d99', 'fa17e2fb-1fc4-4331-8021-85af7d13808e', 3, '1s2 2s2 2p6 3s2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fa17e2fb-1fc4-4331-8021-85af7d13808e', '647d84b9-97c6-4bd6-9009-ec5e359fc09d', 'Na (Z=11) has configuration 1s2 2s2 2p6 3s1; losing one electron to form Na+ gives 1s2 2s2 2p6, isoelectronic with neon.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f725a18e-54f4-42d1-bd9a-f1dd2dc4db96', '011d3a8c-0cff-4170-ba23-59c383912f41', 28, 'The element with the smallest atomic radius among the following is:', 'Chemistry', 'Classification of Elements and Periodicity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75e3ae89-23c6-417e-9eca-38e540948817', 'f725a18e-54f4-42d1-bd9a-f1dd2dc4db96', 0, 'Na');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2dd72115-74e7-4a28-b24a-c8630069a2d9', 'f725a18e-54f4-42d1-bd9a-f1dd2dc4db96', 1, 'Mg');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2811d658-6391-48e3-b38a-14933522f6f4', 'f725a18e-54f4-42d1-bd9a-f1dd2dc4db96', 2, 'Al');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1591c38b-748d-4345-a25a-b1f07d694690', 'f725a18e-54f4-42d1-bd9a-f1dd2dc4db96', 3, 'Si');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f725a18e-54f4-42d1-bd9a-f1dd2dc4db96', '1591c38b-748d-4345-a25a-b1f07d694690', 'Atomic radius decreases across Period 3 from Na to Si due to increasing effective nuclear charge; silicon, being furthest right among these, has the smallest radius.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('229f924b-c676-4b0a-b9d2-d9e4f26a23b9', '011d3a8c-0cff-4170-ba23-59c383912f41', 29, 'The type of bond formed between two atoms of similar electronegativity, involving equal sharing of electrons, is called a:', 'Chemistry', 'Chemical Bonding and Molecular Structure', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cbf263a-b7b6-4b2e-86b3-59880e46e4a7', '229f924b-c676-4b0a-b9d2-d9e4f26a23b9', 0, 'Ionic bond');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1081a36f-8f3f-4ec5-a184-5912ff0625fe', '229f924b-c676-4b0a-b9d2-d9e4f26a23b9', 1, 'Non-polar covalent bond');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc277830-f89f-443d-95db-8ddb5595c7b1', '229f924b-c676-4b0a-b9d2-d9e4f26a23b9', 2, 'Polar covalent bond');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76c09c93-c2f3-4532-815a-71518728bd18', '229f924b-c676-4b0a-b9d2-d9e4f26a23b9', 3, 'Coordinate bond');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('229f924b-c676-4b0a-b9d2-d9e4f26a23b9', '1081a36f-8f3f-4ec5-a184-5912ff0625fe', 'When two atoms of similar (or identical) electronegativity share electrons roughly equally, the resulting bond is a non-polar covalent bond.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('588278b8-5369-4e05-908f-b14dd6e8567d', '011d3a8c-0cff-4170-ba23-59c383912f41', 30, 'At the critical point of a substance, the distinction between liquid and vapor phases:', 'Chemistry', 'States of Matter', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77f6c7e8-234c-47c4-a018-7ee1d25e32bf', '588278b8-5369-4e05-908f-b14dd6e8567d', 0, 'Becomes more distinct');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('770b5b8c-639b-490e-8069-5a10114a322b', '588278b8-5369-4e05-908f-b14dd6e8567d', 1, 'Disappears');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f032c10-b572-4203-9721-17cec94e70a3', '588278b8-5369-4e05-908f-b14dd6e8567d', 2, 'Is unaffected');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d54e5c4-7c16-44e7-8606-c614dabfae92', '588278b8-5369-4e05-908f-b14dd6e8567d', 3, 'Only exists for ideal gases');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('588278b8-5369-4e05-908f-b14dd6e8567d', '770b5b8c-639b-490e-8069-5a10114a322b', 'At the critical point, the densities of the liquid and vapor phases become equal, and the distinction between them disappears entirely.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ddbe4a8a-6a49-498d-9e60-4938ea31a600', '011d3a8c-0cff-4170-ba23-59c383912f41', 31, 'Hess''s law is a consequence of the fact that enthalpy is a:', 'Chemistry', 'Thermodynamics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a2c879d-979f-43f9-bc80-5090d3405a63', 'ddbe4a8a-6a49-498d-9e60-4938ea31a600', 0, 'Path function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b933a858-ef9f-4a9c-aec5-d777e8749ee7', 'ddbe4a8a-6a49-498d-9e60-4938ea31a600', 1, 'State function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('058b4a86-c01b-48c3-8682-5b61a2b83878', 'ddbe4a8a-6a49-498d-9e60-4938ea31a600', 2, 'Path-independent process only for exothermic reactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f124801e-206a-4231-9f56-4e1af5ed0c44', 'ddbe4a8a-6a49-498d-9e60-4938ea31a600', 3, 'Non-measurable quantity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ddbe4a8a-6a49-498d-9e60-4938ea31a600', 'b933a858-ef9f-4a9c-aec5-d777e8749ee7', 'Hess''s law follows directly from enthalpy being a state function — its value depends only on the initial and final states, not the path taken.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2d5721a6-dc5d-46f8-8e54-762c19feff64', '011d3a8c-0cff-4170-ba23-59c383912f41', 32, 'A buffer solution made of a weak acid and its conjugate base resists changes in pH because it can neutralize small additions of:', 'Chemistry', 'Equilibrium', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('afadb214-4293-416b-8116-6f87d3fbe22f', '2d5721a6-dc5d-46f8-8e54-762c19feff64', 0, 'Only added acid, not base');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8d34379-478b-4ac4-9554-fa6174d879f1', '2d5721a6-dc5d-46f8-8e54-762c19feff64', 1, 'Only added base, not acid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('adde44c8-0336-4483-a904-188085c3c885', '2d5721a6-dc5d-46f8-8e54-762c19feff64', 2, 'Both added acid and added base');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('56095fde-f051-4caf-9f9c-d51496ac7319', '2d5721a6-dc5d-46f8-8e54-762c19feff64', 3, 'Neither acid nor base');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2d5721a6-dc5d-46f8-8e54-762c19feff64', 'adde44c8-0336-4483-a904-188085c3c885', 'A buffer contains both a weak acid (to neutralize added base) and its conjugate base (to neutralize added acid), allowing it to resist pH changes from either direction.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8b0066a5-2885-4fff-92f8-40a30bb8b9ac', '011d3a8c-0cff-4170-ba23-59c383912f41', 33, 'The half-reaction Fe2+ -> Fe3+ + e- represents:', 'Chemistry', 'Redox Reactions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8bc39fc-ec9c-4073-8536-82c474a72c4f', '8b0066a5-2885-4fff-92f8-40a30bb8b9ac', 0, 'Reduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('422f7a74-5b8c-4278-bcd7-5a238733f0e3', '8b0066a5-2885-4fff-92f8-40a30bb8b9ac', 1, 'Oxidation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('971afed2-a3eb-4dc4-96a0-782c15462fc1', '8b0066a5-2885-4fff-92f8-40a30bb8b9ac', 2, 'Neutralization');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e8ebf8a-8bf5-4b0b-87cf-168c73048995', '8b0066a5-2885-4fff-92f8-40a30bb8b9ac', 3, 'Hydrolysis');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8b0066a5-2885-4fff-92f8-40a30bb8b9ac', '422f7a74-5b8c-4278-bcd7-5a238733f0e3', 'The loss of an electron (Fe2+ becoming Fe3+) is, by definition, oxidation.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c4070e1a-f2f7-4e08-a40f-7110562f92c4', '011d3a8c-0cff-4170-ba23-59c383912f41', 34, 'Which of the following alkaline earth metal compounds is used as a drying agent (anhydrous form)?', 'Chemistry', 's-Block Elements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4282f409-5d7a-44f3-9f87-db4aa6a3f2bb', 'c4070e1a-f2f7-4e08-a40f-7110562f92c4', 0, 'CaCl2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0143f6f9-3121-4b27-b52b-d8037e42d5eb', 'c4070e1a-f2f7-4e08-a40f-7110562f92c4', 1, 'MgSO4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9335b5b-4a2a-4167-a8f0-dcff414115d9', 'c4070e1a-f2f7-4e08-a40f-7110562f92c4', 2, 'BaCl2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('661984ce-eefe-47c9-8bea-d0bd4c2dce3a', 'c4070e1a-f2f7-4e08-a40f-7110562f92c4', 3, 'SrCl2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c4070e1a-f2f7-4e08-a40f-7110562f92c4', '4282f409-5d7a-44f3-9f87-db4aa6a3f2bb', 'Anhydrous calcium chloride (CaCl2) is commonly used as a desiccant/drying agent due to its strong hygroscopic (water-absorbing) properties.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('70ae1168-e216-4521-8482-124afd914712', '011d3a8c-0cff-4170-ba23-59c383912f41', 35, 'Diamond and graphite are both allotropes of carbon but differ significantly in properties because of differences in their:', 'Chemistry', 'p-Block Elements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5bd05ea7-ac79-471f-8061-d215a4e0daef', '70ae1168-e216-4521-8482-124afd914712', 0, 'Chemical composition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('527a0e6b-1c3c-4d34-b230-33a3d1417862', '70ae1168-e216-4521-8482-124afd914712', 1, 'Crystal structure and bonding arrangement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65836967-e81f-4e51-9490-5ed1d7c8d0e5', '70ae1168-e216-4521-8482-124afd914712', 2, 'Atomic number');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('888f315e-a410-4a24-a063-0d77216efb00', '70ae1168-e216-4521-8482-124afd914712', 3, 'Isotopic composition');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('70ae1168-e216-4521-8482-124afd914712', '527a0e6b-1c3c-4d34-b230-33a3d1417862', 'Diamond and graphite are both pure carbon but have vastly different structures — diamond''s rigid 3D tetrahedral (sp3) network versus graphite''s layered, planar (sp2) sheets — explaining their very different physical properties.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f88b6720-1688-4745-bb9b-7c2d699e9639', '011d3a8c-0cff-4170-ba23-59c383912f41', 36, 'Structural isomers that differ in the position of a functional group on the same carbon skeleton are called:', 'Chemistry', 'Organic Chemistry — Basic Principles', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e95af8f-14c1-48dd-9e05-2fbc35bad1f1', 'f88b6720-1688-4745-bb9b-7c2d699e9639', 0, 'Chain isomers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('194a182c-9ab7-4153-9957-4242decef5fb', 'f88b6720-1688-4745-bb9b-7c2d699e9639', 1, 'Position isomers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10bfd8b5-32e6-4abd-8978-c68acb81b770', 'f88b6720-1688-4745-bb9b-7c2d699e9639', 2, 'Functional isomers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e16c0b0-9ca0-43ae-b6df-66996f22768a', 'f88b6720-1688-4745-bb9b-7c2d699e9639', 3, 'Metamers');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f88b6720-1688-4745-bb9b-7c2d699e9639', '194a182c-9ab7-4153-9957-4242decef5fb', 'Position isomers have the same carbon skeleton and functional group, but the functional group is located at a different position along the chain.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1aa7dda5-02e9-496f-90ae-3b999f46c83c', '011d3a8c-0cff-4170-ba23-59c383912f41', 37, 'Alkynes, characterized by a carbon-carbon triple bond, have the general formula:', 'Chemistry', 'Hydrocarbons', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a14930a-9f47-4fde-b024-bb2a5328e034', '1aa7dda5-02e9-496f-90ae-3b999f46c83c', 0, 'CnH2n');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e90deec4-e776-4cf6-842b-1069bf181491', '1aa7dda5-02e9-496f-90ae-3b999f46c83c', 1, 'CnH2n+2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f022414e-55f3-4e8f-9ea9-30d8727f548d', '1aa7dda5-02e9-496f-90ae-3b999f46c83c', 2, 'CnH2n-2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be6dc234-4c36-405e-b197-88e56de2d70b', '1aa7dda5-02e9-496f-90ae-3b999f46c83c', 3, 'CnH2n-4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1aa7dda5-02e9-496f-90ae-3b999f46c83c', 'f022414e-55f3-4e8f-9ea9-30d8727f548d', 'Alkynes (with one triple bond) follow the general formula CnH2n-2, reflecting the greater degree of unsaturation compared to alkanes and alkenes.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ae825627-a9ed-4d1a-8c0a-019ff89a985f', '011d3a8c-0cff-4170-ba23-59c383912f41', 38, 'Acid rain primarily damages structures and monuments made of which material, due to a direct chemical reaction with the acid?', 'Chemistry', 'Environmental Chemistry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('013f211d-5d3f-40b5-9b83-a93ca6b781c9', 'ae825627-a9ed-4d1a-8c0a-019ff89a985f', 0, 'Steel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f77432f8-6707-45f0-8810-45baf57e8787', 'ae825627-a9ed-4d1a-8c0a-019ff89a985f', 1, 'Marble (calcium carbonate)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27eaff34-61b1-49bd-b108-8343547da74d', 'ae825627-a9ed-4d1a-8c0a-019ff89a985f', 2, 'Glass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f580be0-13d1-4f4b-86a6-a9d315b1c5f6', 'ae825627-a9ed-4d1a-8c0a-019ff89a985f', 3, 'Plastic');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ae825627-a9ed-4d1a-8c0a-019ff89a985f', 'f77432f8-6707-45f0-8810-45baf57e8787', 'Marble (calcium carbonate) reacts chemically with the sulfuric/nitric acid in acid rain, dissolving and eroding stone monuments and structures over time.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3df85920-daf9-4003-a187-429838e5f37e', '011d3a8c-0cff-4170-ba23-59c383912f41', 39, 'The packing efficiency of a body-centred cubic (bcc) unit cell is approximately:', 'Chemistry', 'Solid State', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3f85a37-93fb-425f-a988-b0a17eeadbe0', '3df85920-daf9-4003-a187-429838e5f37e', 0, '52%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3100b672-640a-4450-b544-a90a2320d18b', '3df85920-daf9-4003-a187-429838e5f37e', 1, '68%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a90417fa-47b5-495c-87e2-d1863689d648', '3df85920-daf9-4003-a187-429838e5f37e', 2, '74%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c53a569d-8be3-42c8-bbd4-90dd25394dba', '3df85920-daf9-4003-a187-429838e5f37e', 3, '100%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3df85920-daf9-4003-a187-429838e5f37e', '3100b672-640a-4450-b544-a90a2320d18b', 'The bcc structure has a packing efficiency of approximately 68%, less than the 74% achieved by close-packed structures (fcc/hcp).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('defaf0d6-0693-4380-baad-1287f0aa9d0d', '011d3a8c-0cff-4170-ba23-59c383912f41', 40, 'Molality of a solution, unlike molarity, is independent of:', 'Chemistry', 'Solutions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e33a3d3-5d6b-4750-81e0-42f879c15eac', 'defaf0d6-0693-4380-baad-1287f0aa9d0d', 0, 'The mass of the solute');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97dac935-63b2-49eb-aa82-e07152817bcc', 'defaf0d6-0693-4380-baad-1287f0aa9d0d', 1, 'The mass of the solvent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9993651e-6b59-47b9-bf45-83e9c47baa1d', 'defaf0d6-0693-4380-baad-1287f0aa9d0d', 2, 'Temperature, since it uses mass rather than volume');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69f6b74b-8ec8-4695-a846-a2c9e3e487f4', 'defaf0d6-0693-4380-baad-1287f0aa9d0d', 3, 'The identity of the solute');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('defaf0d6-0693-4380-baad-1287f0aa9d0d', '9993651e-6b59-47b9-bf45-83e9c47baa1d', 'Molality is defined using the mass of the solvent (not its volume), making it independent of temperature-induced volume changes, unlike molarity, which is volume-based and does vary slightly with temperature.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('33d016c2-a965-4418-9c07-ef3361c50a28', '011d3a8c-0cff-4170-ba23-59c383912f41', 41, 'The specific conductance of an electrolytic solution generally _____ with dilution.', 'Chemistry', 'Electrochemistry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbff8451-058f-4bd8-87e5-91bf54b8ec84', '33d016c2-a965-4418-9c07-ef3361c50a28', 0, 'Increases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea229243-534a-402b-94ae-62684955129d', '33d016c2-a965-4418-9c07-ef3361c50a28', 1, 'Decreases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42b165c5-8f46-4af0-b868-2566eb09d63e', '33d016c2-a965-4418-9c07-ef3361c50a28', 2, 'Remains constant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1fd7b305-2a65-47c0-bbff-e4a145e32e72', '33d016c2-a965-4418-9c07-ef3361c50a28', 3, 'Becomes infinite');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('33d016c2-a965-4418-9c07-ef3361c50a28', 'ea229243-534a-402b-94ae-62684955129d', 'Specific conductance (conductivity) decreases with dilution because the number of ions per unit volume decreases, even though molar conductivity increases.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('af18e144-99ff-41fa-8498-7eaa1ece001f', '011d3a8c-0cff-4170-ba23-59c383912f41', 42, 'A catalyst increases the rate of a reaction without being consumed by:', 'Chemistry', 'Chemical Kinetics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('562d27db-e3f9-4bd6-afa1-1f1ba6d0cbe1', 'af18e144-99ff-41fa-8498-7eaa1ece001f', 0, 'Increasing the temperature of the reaction mixture');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a65e728d-e1ce-40ec-b9c8-5260d6d3e387', 'af18e144-99ff-41fa-8498-7eaa1ece001f', 1, 'Providing an alternative reaction pathway with lower activation energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02a4fc2a-bc20-40c4-b46b-e1b033be1084', 'af18e144-99ff-41fa-8498-7eaa1ece001f', 2, 'Shifting the position of equilibrium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c16bd577-3f7b-40ec-a66a-eff5d30d0464', 'af18e144-99ff-41fa-8498-7eaa1ece001f', 3, 'Increasing the concentration of reactants');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('af18e144-99ff-41fa-8498-7eaa1ece001f', 'a65e728d-e1ce-40ec-b9c8-5260d6d3e387', 'A catalyst provides an alternative reaction mechanism/pathway with a lower activation energy, speeding up the reaction rate without being permanently consumed, and without shifting the equilibrium position.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f81ddb12-1eda-4aca-b07e-08bd9ef7d0a5', '011d3a8c-0cff-4170-ba23-59c383912f41', 43, 'Which of the following properties is generally NOT characteristic of transition metals?', 'Chemistry', 'd and f Block Elements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('004b72f0-84d3-4a8c-9061-37cd116773c7', 'f81ddb12-1eda-4aca-b07e-08bd9ef7d0a5', 0, 'Formation of colored compounds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f5bedaf-386b-4e67-a712-55aff6c1a979', 'f81ddb12-1eda-4aca-b07e-08bd9ef7d0a5', 1, 'Variable oxidation states');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('baf47316-b041-4eb8-8d26-e2c7f9a7951e', 'f81ddb12-1eda-4aca-b07e-08bd9ef7d0a5', 2, 'Catalytic activity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bd72487-68df-49a5-991e-88a1ca9fd0d0', 'f81ddb12-1eda-4aca-b07e-08bd9ef7d0a5', 3, 'Formation of exclusively colorless compounds');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f81ddb12-1eda-4aca-b07e-08bd9ef7d0a5', '2bd72487-68df-49a5-991e-88a1ca9fd0d0', 'Transition metals characteristically form colored compounds (due to d-d transitions), exhibit variable oxidation states, and show catalytic activity — the exclusive formation of colorless compounds is NOT a characteristic transition-metal property (Zn2+/Sc3+ being notable exceptions with no color).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d2e4c5e6-998c-44dd-b8a5-22a85839cea2', '011d3a8c-0cff-4170-ba23-59c383912f41', 44, 'A ligand that can bind to a central metal ion through two donor atoms simultaneously is called a:', 'Chemistry', 'Coordination Compounds', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('046ef985-83f4-4d11-9cc6-fcb32ac1da77', 'd2e4c5e6-998c-44dd-b8a5-22a85839cea2', 0, 'Monodentate ligand');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13b7c6d9-c13c-4ce6-873c-546f72d8e3dd', 'd2e4c5e6-998c-44dd-b8a5-22a85839cea2', 1, 'Bidentate ligand');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('557caaaf-c80c-454b-852e-65c1dec7cc34', 'd2e4c5e6-998c-44dd-b8a5-22a85839cea2', 2, 'Ambidentate ligand');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d30a62b-a91e-43a9-8e57-5d1e43d18293', 'd2e4c5e6-998c-44dd-b8a5-22a85839cea2', 3, 'Chelating agent only in aqueous solution');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d2e4c5e6-998c-44dd-b8a5-22a85839cea2', '13b7c6d9-c13c-4ce6-873c-546f72d8e3dd', 'A bidentate ligand has two donor atoms that can simultaneously coordinate to the same central metal ion, forming a ring structure (a chelate).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e6931512-f265-485a-aae5-ce339addd574', '011d3a8c-0cff-4170-ba23-59c383912f41', 45, 'The polysaccharide that serves as the primary storage form of glucose in plants is:', 'Chemistry', 'Biomolecules', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('129bb13a-47b9-41fb-9022-45f99552eefd', 'e6931512-f265-485a-aae5-ce339addd574', 0, 'Cellulose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5e44044-2e33-4969-8d35-048d1b566fbe', 'e6931512-f265-485a-aae5-ce339addd574', 1, 'Starch');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23062841-af2c-4493-b0cc-068eff1fc450', 'e6931512-f265-485a-aae5-ce339addd574', 2, 'Glycogen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6654b2ad-098a-4d3d-b658-3b3f16bbe2fe', 'e6931512-f265-485a-aae5-ce339addd574', 3, 'Chitin');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e6931512-f265-485a-aae5-ce339addd574', 'b5e44044-2e33-4969-8d35-048d1b566fbe', 'Starch is the primary glucose-storage polysaccharide in plants, while glycogen serves the analogous role in animals; cellulose is a structural polysaccharide, not a storage form.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f3f75131-ca9d-4fc7-9214-f95b1bf0cb69', '011d3a8c-0cff-4170-ba23-59c383912f41', 46, 'The molar mass (in g/mol) of water (H2O), given atomic masses H=1 and O=16, is:', 'Chemistry', 'Some Basic Concepts of Chemistry — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('f3f75131-ca9d-4fc7-9214-f95b1bf0cb69', 18, 'Molar mass of H2O = 2(1) + 16 = 2 + 16 = 18 g/mol.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3fac88b4-acb4-4bc7-b808-314bacfd4aa0', '011d3a8c-0cff-4170-ba23-59c383912f41', 47, 'The pH of a solution is 4. Its hydrogen ion concentration [H+] (in units of 10^-4 mol/L, expressed as a numeric multiple) is:', 'Chemistry', 'Equilibrium — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('3fac88b4-acb4-4bc7-b808-314bacfd4aa0', 1, '[H+] = 10^-pH = 10^-4 M, so the numeric multiple of 10^-4 is 1.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('531acb15-4882-46f4-a375-ebf04c473a72', '011d3a8c-0cff-4170-ba23-59c383912f41', 48, 'A reaction has delta H = -50 kJ/mol and delta S = +100 J/(mol.K). The temperature (in Kelvin) at which delta G = 0 is:', 'Chemistry', 'Thermodynamics — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('531acb15-4882-46f4-a375-ebf04c473a72', 500, 'Setting delta G = delta H - T*delta S = 0 gives T = delta H/delta S. Converting delta H to joules (-50000 J) and dividing: T = 50000 J / 100 J/K = 500 K.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3fe7b88b-d9d8-4760-923c-9e6f35760ebe', '011d3a8c-0cff-4170-ba23-59c383912f41', 49, 'A 2 molar solution of NaCl has a volume of 500 mL. The number of moles of NaCl present is:', 'Chemistry', 'Solutions — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('3fe7b88b-d9d8-4760-923c-9e6f35760ebe', 1, 'Moles = Molarity * Volume(L) = 2 * 0.5 = 1 mol.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f3e3d15b-98b4-48c9-8b8a-8305aff3baa9', '011d3a8c-0cff-4170-ba23-59c383912f41', 50, 'The rate of a reaction increases by a factor of 4 when the concentration of a reactant is doubled. The order of the reaction with respect to that reactant is:', 'Chemistry', 'Chemical Kinetics — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('f3e3d15b-98b4-48c9-8b8a-8305aff3baa9', 2, 'Rate is proportional to [A]^n; if doubling [A] quadruples the rate, then 2^n=4, giving n=2.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Mathematics (25 questions) — Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('353aed73-f803-4f6f-ae2e-34893a3296c6', '011d3a8c-0cff-4170-ba23-59c383912f41', 51, 'A relation R on a set A is said to be reflexive if:', 'Mathematics', 'Sets, Relations and Functions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c9a256d-e138-4b1e-ae71-b2c1e55e2a06', '353aed73-f803-4f6f-ae2e-34893a3296c6', 0, '(a,a) belongs to R for every a in A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9e80510-9ab1-47fc-977f-fe79313c5205', '353aed73-f803-4f6f-ae2e-34893a3296c6', 1, '(a,b) in R implies (b,a) in R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd60b7b1-ac6e-4380-8f44-9f59eeda03df', '353aed73-f803-4f6f-ae2e-34893a3296c6', 2, '(a,b) and (b,c) in R implies (a,c) in R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1aee500-bae6-489b-976e-33c47d91f4b4', '353aed73-f803-4f6f-ae2e-34893a3296c6', 3, 'R contains no elements');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('353aed73-f803-4f6f-ae2e-34893a3296c6', '7c9a256d-e138-4b1e-ae71-b2c1e55e2a06', 'A reflexive relation requires that every element of the set is related to itself, i.e., (a,a) is in R for all a in A.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('440e5738-5132-406e-a10f-6f05b07f1b1f', '011d3a8c-0cff-4170-ba23-59c383912f41', 52, 'The product of a complex number z=a+bi and its conjugate z-bar=a-bi is:', 'Mathematics', 'Complex Numbers', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d35247c-1038-47be-baa9-07b3e52b4d6d', '440e5738-5132-406e-a10f-6f05b07f1b1f', 0, '2a');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7fa92dd5-0fe6-497f-8d5e-3bda1ef9e23f', '440e5738-5132-406e-a10f-6f05b07f1b1f', 1, '2bi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be7c93d6-0862-4c56-94de-7889da7540e7', '440e5738-5132-406e-a10f-6f05b07f1b1f', 2, 'a^2+b^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6988a01c-d612-4b50-a77d-557aa856e823', '440e5738-5132-406e-a10f-6f05b07f1b1f', 3, 'a^2-b^2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('440e5738-5132-406e-a10f-6f05b07f1b1f', 'be7c93d6-0862-4c56-94de-7889da7540e7', 'z * z-bar = (a+bi)(a-bi) = a^2 - (bi)^2 = a^2 + b^2, since i^2=-1.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5b66ab19-9725-42c4-8d53-0e80191b83d3', '011d3a8c-0cff-4170-ba23-59c383912f41', 53, 'If the roots of a quadratic equation are equal, the discriminant must be:', 'Mathematics', 'Quadratic Equations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a85ec6d8-6aed-4b98-b14e-c60b3c35b673', '5b66ab19-9725-42c4-8d53-0e80191b83d3', 0, 'Positive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3897c7c2-d9e8-46a4-a20f-d3640b8292d4', '5b66ab19-9725-42c4-8d53-0e80191b83d3', 1, 'Negative');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc5a21ea-9639-41a5-8a9c-2bbcd9b6073a', '5b66ab19-9725-42c4-8d53-0e80191b83d3', 2, 'Zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31ba13a2-2e03-4da2-899a-5860e488bab8', '5b66ab19-9725-42c4-8d53-0e80191b83d3', 3, 'Undefined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5b66ab19-9725-42c4-8d53-0e80191b83d3', 'bc5a21ea-9639-41a5-8a9c-2bbcd9b6073a', 'Equal (repeated) roots occur precisely when the discriminant b^2-4ac equals zero.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3abeb12e-97ac-4c4e-93fc-62730c66a9eb', '011d3a8c-0cff-4170-ba23-59c383912f41', 54, 'The relationship between permutations P(n,r) and combinations C(n,r) is given by:', 'Mathematics', 'Permutations and Combinations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5c40a7c-78fb-4d6a-aa6a-6e32596f568f', '3abeb12e-97ac-4c4e-93fc-62730c66a9eb', 0, 'P(n,r) = C(n,r)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('324d278c-aac2-493c-95e1-ad10bb24dc97', '3abeb12e-97ac-4c4e-93fc-62730c66a9eb', 1, 'P(n,r) = C(n,r) * r!');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c94c9fb4-6e5c-44cf-8a28-d4b2e6480853', '3abeb12e-97ac-4c4e-93fc-62730c66a9eb', 2, 'P(n,r) = C(n,r) / r!');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('724e7e99-d8b2-4ed7-ba79-d177967e2198', '3abeb12e-97ac-4c4e-93fc-62730c66a9eb', 3, 'P(n,r) = C(n,r) + r!');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3abeb12e-97ac-4c4e-93fc-62730c66a9eb', '324d278c-aac2-493c-95e1-ad10bb24dc97', 'Since permutations count ordered arrangements and combinations count unordered selections, P(n,r) = C(n,r) * r! (each combination can be arranged in r! ways).', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f7a97d66-4f3f-4b63-b503-841e3f233b66', '011d3a8c-0cff-4170-ba23-59c383912f41', 55, 'The general term (r+1th term) in the binomial expansion of (x+y)^n is given by:', 'Mathematics', 'Binomial Theorem', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f67172c7-47fe-42c5-8e51-8a72d9fe7f43', 'f7a97d66-4f3f-4b63-b503-841e3f233b66', 0, 'C(n,r) * x^(n-r) * y^r');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8efbc228-e6b4-47ea-8889-45d8e8272612', 'f7a97d66-4f3f-4b63-b503-841e3f233b66', 1, 'C(n,r) * x^r * y^(n-r)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b393efbe-ef86-49e9-83dd-fa29f0514e88', 'f7a97d66-4f3f-4b63-b503-841e3f233b66', 2, 'n! * x^n * y^r');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9c79b65-2f40-4273-9742-6aa28e528269', 'f7a97d66-4f3f-4b63-b503-841e3f233b66', 3, 'C(n,r) * x^n * y^n');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f7a97d66-4f3f-4b63-b503-841e3f233b66', 'f67172c7-47fe-42c5-8e51-8a72d9fe7f43', 'The general (r+1)th term in the expansion of (x+y)^n is T(r+1) = C(n,r) * x^(n-r) * y^r.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('62e19aea-1219-49f4-abbd-da5d953c340a', '011d3a8c-0cff-4170-ba23-59c383912f41', 56, 'In a geometric progression, if the first term is 5 and the common ratio is 3, the 3rd term is:', 'Mathematics', 'Sequences and Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('431e33d6-8500-40b6-94fc-fb271e21182b', '62e19aea-1219-49f4-abbd-da5d953c340a', 0, '15');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ceadee8-4908-4392-9376-ec9fed75ad5c', '62e19aea-1219-49f4-abbd-da5d953c340a', 1, '45');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51ea11c1-fc48-4017-be07-3b21216e1695', '62e19aea-1219-49f4-abbd-da5d953c340a', 2, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b9e1dbc-2073-45f6-a218-81e61fa30a41', '62e19aea-1219-49f4-abbd-da5d953c340a', 3, '135');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('62e19aea-1219-49f4-abbd-da5d953c340a', '0ceadee8-4908-4392-9376-ec9fed75ad5c', 'a_3 = a*r^(3-1) = 5*3^2 = 5*9 = 45.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a033f0b6-1ad8-4f9f-a287-9f8323870969', '011d3a8c-0cff-4170-ba23-59c383912f41', 57, 'A function that is differentiable at a point is necessarily also:', 'Mathematics', 'Limits, Continuity and Differentiability', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84257c56-5a04-48a3-b90d-193603c8e0a4', 'a033f0b6-1ad8-4f9f-a287-9f8323870969', 0, 'Discontinuous at that point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9aa5fca-6b6e-45a1-ad22-cdc28bff5ba3', 'a033f0b6-1ad8-4f9f-a287-9f8323870969', 1, 'Continuous at that point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ba996d0-7335-47a3-bb15-1a6d1a26b8a1', 'a033f0b6-1ad8-4f9f-a287-9f8323870969', 2, 'Constant at that point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72f032ad-2208-4831-adba-9c21c5fa2206', 'a033f0b6-1ad8-4f9f-a287-9f8323870969', 3, 'Undefined at that point');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a033f0b6-1ad8-4f9f-a287-9f8323870969', 'd9aa5fca-6b6e-45a1-ad22-cdc28bff5ba3', 'Differentiability at a point implies continuity at that point (though the converse is not true — a function can be continuous but not differentiable, e.g., |x| at x=0).', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f47b9c6f-15c5-4563-8f8a-dd4519319815', '011d3a8c-0cff-4170-ba23-59c383912f41', 58, 'The integral of 1/x dx (for x>0) is:', 'Mathematics', 'Integral Calculus', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1058fa87-27a1-44b4-b0e7-7b3d6671522b', 'f47b9c6f-15c5-4563-8f8a-dd4519319815', 0, 'x^2/2 + C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7d0abf5-91e6-47d9-b3b1-fa2bd8b3963f', 'f47b9c6f-15c5-4563-8f8a-dd4519319815', 1, 'ln|x| + C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e95152d1-9061-4cf0-a22e-5c935744279f', 'f47b9c6f-15c5-4563-8f8a-dd4519319815', 2, '1/x^2 + C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7571a993-a5c2-4f4a-bb71-4626625910f8', 'f47b9c6f-15c5-4563-8f8a-dd4519319815', 3, '-1/x^2 + C');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f47b9c6f-15c5-4563-8f8a-dd4519319815', 'b7d0abf5-91e6-47d9-b3b1-fa2bd8b3963f', 'The standard integral of 1/x dx is ln|x| + C.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8669ef3a-31b8-439a-a2dc-2dd999c671aa', '011d3a8c-0cff-4170-ba23-59c383912f41', 59, 'A differential equation is called linear if the dependent variable and its derivatives occur:', 'Mathematics', 'Differential Equations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('633b0c4a-6447-4a46-b18b-2f2d459707f8', '8669ef3a-31b8-439a-a2dc-2dd999c671aa', 0, 'Only to the first degree, and not multiplied together');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('783d7905-ad71-4787-a3db-604eaa302553', '8669ef3a-31b8-439a-a2dc-2dd999c671aa', 1, 'Only to the second degree');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86fc1aff-e3b6-4dae-a4b4-c287a7b646f1', '8669ef3a-31b8-439a-a2dc-2dd999c671aa', 2, 'As products of each other');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2dc7d75a-6ebb-4128-8436-a87adfda24d6', '8669ef3a-31b8-439a-a2dc-2dd999c671aa', 3, 'Raised to any power');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8669ef3a-31b8-439a-a2dc-2dd999c671aa', '633b0c4a-6447-4a46-b18b-2f2d459707f8', 'A linear differential equation has the dependent variable and its derivatives appearing only to the first degree, with no products between them.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('11a3c092-38cc-4508-acc2-2a954e204546', '011d3a8c-0cff-4170-ba23-59c383912f41', 60, 'The distance of the point (3,4) from the line 3x+4y-10=0 is:', 'Mathematics', 'Coordinate Geometry — Straight Lines', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f4ec7af-de8e-4c99-8110-ba4054c2c8c3', '11a3c092-38cc-4508-acc2-2a954e204546', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a87bb11a-cd2e-46f9-9999-e193f4d36c0e', '11a3c092-38cc-4508-acc2-2a954e204546', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d113e097-376c-480b-a877-6f323f4767f9', '11a3c092-38cc-4508-acc2-2a954e204546', 2, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d39042a8-a01b-46d2-b853-2a857aa3e202', '11a3c092-38cc-4508-acc2-2a954e204546', 3, '5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('11a3c092-38cc-4508-acc2-2a954e204546', 'd113e097-376c-480b-a877-6f323f4767f9', 'Distance = |3(3)+4(4)-10|/sqrt(3^2+4^2) = |9+16-10|/5 = 15/5 = 3.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0f61fbaf-0c07-47aa-95ce-03dcbdce4167', '011d3a8c-0cff-4170-ba23-59c383912f41', 61, 'Two circles are said to be concentric if they have:', 'Mathematics', 'Coordinate Geometry — Circles', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('651309ae-e43e-4193-a4ac-454a4b51321c', '0f61fbaf-0c07-47aa-95ce-03dcbdce4167', 0, 'The same radius but different centres');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03ab02c6-f35c-4fb2-a2b5-e522b43cb0a7', '0f61fbaf-0c07-47aa-95ce-03dcbdce4167', 1, 'The same centre but different radii');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3e377ec-0ddf-4863-bcb8-26c626241012', '0f61fbaf-0c07-47aa-95ce-03dcbdce4167', 2, 'Equal areas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f62032f-4f17-42ad-8125-a8a485701a22', '0f61fbaf-0c07-47aa-95ce-03dcbdce4167', 3, 'No common points');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0f61fbaf-0c07-47aa-95ce-03dcbdce4167', '03ab02c6-f35c-4fb2-a2b5-e522b43cb0a7', 'Concentric circles share the same centre point but have different radii.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('acbc062a-5206-4434-bbc9-efff14ece890', '011d3a8c-0cff-4170-ba23-59c383912f41', 62, 'The vertex of the parabola y^2 = 12x is located at:', 'Mathematics', 'Conic Sections — Parabola', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3415340f-ef7a-4a9e-a7d5-9c66729b016d', 'acbc062a-5206-4434-bbc9-efff14ece890', 0, '(0,0)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88e34ad5-36ac-4ad0-8630-f8cf50c66e98', 'acbc062a-5206-4434-bbc9-efff14ece890', 1, '(3,0)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f35583e-16cf-4831-8cbc-1a64c78387e4', 'acbc062a-5206-4434-bbc9-efff14ece890', 2, '(0,3)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9df94a58-4e1a-4d97-86ea-cdb1d346fbfb', 'acbc062a-5206-4434-bbc9-efff14ece890', 3, '(-3,0)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('acbc062a-5206-4434-bbc9-efff14ece890', '3415340f-ef7a-4a9e-a7d5-9c66729b016d', 'For the standard parabola y^2=4ax, the vertex is at the origin (0,0).', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fc1291c1-4a4a-4c39-a2ca-f775f57d67ee', '011d3a8c-0cff-4170-ba23-59c383912f41', 63, 'The angle between two lines with direction ratios (1,0,0) and (0,1,0) is:', 'Mathematics', '3D Geometry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('971f2adf-2a45-451d-aab7-7f7b43438541', 'fc1291c1-4a4a-4c39-a2ca-f775f57d67ee', 0, '0 degrees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff529ce1-e399-44ae-a782-268e40fbb3cf', 'fc1291c1-4a4a-4c39-a2ca-f775f57d67ee', 1, '45 degrees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1e15009-4c71-4419-b930-230a85d775cf', 'fc1291c1-4a4a-4c39-a2ca-f775f57d67ee', 2, '90 degrees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('56ef85bf-e52c-423a-aa54-92dfa56cf39f', 'fc1291c1-4a4a-4c39-a2ca-f775f57d67ee', 3, '180 degrees');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fc1291c1-4a4a-4c39-a2ca-f775f57d67ee', 'f1e15009-4c71-4419-b930-230a85d775cf', 'The direction ratios (1,0,0) and (0,1,0) correspond to the x-axis and y-axis respectively, which are perpendicular, giving an angle of 90 degrees.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e23eecdb-cc8d-4b03-9f40-0da48d752dde', '011d3a8c-0cff-4170-ba23-59c383912f41', 64, 'The cross product of two parallel (or anti-parallel) vectors is:', 'Mathematics', 'Vector Algebra', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac94de8b-64cd-40e3-9fa7-d027be4bde2b', 'e23eecdb-cc8d-4b03-9f40-0da48d752dde', 0, 'Maximum in magnitude');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5cc3872-f79a-4e98-aae4-33462c29a2ed', 'e23eecdb-cc8d-4b03-9f40-0da48d752dde', 1, 'The zero vector');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32335ea2-30b2-43ec-9565-525e7c0dee70', 'e23eecdb-cc8d-4b03-9f40-0da48d752dde', 2, 'Equal to their dot product');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2aefc5c9-215a-4406-9126-2723c479eca4', 'e23eecdb-cc8d-4b03-9f40-0da48d752dde', 3, 'Undefined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e23eecdb-cc8d-4b03-9f40-0da48d752dde', 'c5cc3872-f79a-4e98-aae4-33462c29a2ed', 'For parallel or anti-parallel vectors, the angle between them is 0 or 180 degrees, and since |a x b| = |a||b|sin(theta), sin(0)=sin(180)=0, giving a zero cross product.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5566107e-953e-4e7f-aff7-dbb2c0bcbb3e', '011d3a8c-0cff-4170-ba23-59c383912f41', 65, 'If P(A) = 0.4 and P(B) = 0.3, and A and B are independent events, then P(A and B) is:', 'Mathematics', 'Statistics and Probability', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a19e564e-eb20-48e6-9b45-878e54f1b7e0', '5566107e-953e-4e7f-aff7-dbb2c0bcbb3e', 0, '0.7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b553e72b-f294-453a-82b6-49a3c3b8539c', '5566107e-953e-4e7f-aff7-dbb2c0bcbb3e', 1, '0.12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83a57b81-a2bc-440e-bc0e-64ee108c1c07', '5566107e-953e-4e7f-aff7-dbb2c0bcbb3e', 2, '0.1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0659d0f-cd67-4097-9672-561a1e508cd7', '5566107e-953e-4e7f-aff7-dbb2c0bcbb3e', 3, '1.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5566107e-953e-4e7f-aff7-dbb2c0bcbb3e', 'b553e72b-f294-453a-82b6-49a3c3b8539c', 'For independent events, P(A and B) = P(A)*P(B) = 0.4*0.3 = 0.12.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8b6bcd93-217b-43ce-9dbd-1e7c7673a89a', '011d3a8c-0cff-4170-ba23-59c383912f41', 66, 'The value of cos(90 degrees - theta) is equal to:', 'Mathematics', 'Trigonometry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7dc0acc6-a53c-45da-9e0d-6d61ef5c2442', '8b6bcd93-217b-43ce-9dbd-1e7c7673a89a', 0, 'cos(theta)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49b47436-235f-4bfd-ae70-ed0c4400ba57', '8b6bcd93-217b-43ce-9dbd-1e7c7673a89a', 1, 'sin(theta)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c34891c-3ac1-4722-bd9e-75c3ab46647e', '8b6bcd93-217b-43ce-9dbd-1e7c7673a89a', 2, '-sin(theta)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('035523ef-3bbb-4de0-822d-536566358247', '8b6bcd93-217b-43ce-9dbd-1e7c7673a89a', 3, '-cos(theta)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8b6bcd93-217b-43ce-9dbd-1e7c7673a89a', '49b47436-235f-4bfd-ae70-ed0c4400ba57', 'By the co-function identity, cos(90 degrees - theta) = sin(theta).', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5916c781-71c8-4564-89e2-39615a3faffc', '011d3a8c-0cff-4170-ba23-59c383912f41', 67, 'The identity matrix I of order 2 satisfies, for any 2x2 matrix A:', 'Mathematics', 'Matrices and Determinants', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4b43f9d-f17d-4e0b-8c2e-a392d36e7b90', '5916c781-71c8-4564-89e2-39615a3faffc', 0, 'AI = A but IA is not equal to A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e634b80f-3d61-4b5d-bd66-a181bf26fca2', '5916c781-71c8-4564-89e2-39615a3faffc', 1, 'AI = IA = A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16f93e9a-5ef3-4730-b2cc-31e67277fbfc', '5916c781-71c8-4564-89e2-39615a3faffc', 2, 'AI = 0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53070bb4-054d-401d-9bc2-9b48de25d213', '5916c781-71c8-4564-89e2-39615a3faffc', 3, 'IA = -A');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5916c781-71c8-4564-89e2-39615a3faffc', 'e634b80f-3d61-4b5d-bd66-a181bf26fca2', 'The identity matrix I acts as the multiplicative identity: AI = IA = A for any compatible matrix A.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f0c81746-afaa-4837-bed3-0cbf227260da', '011d3a8c-0cff-4170-ba23-59c383912f41', 68, 'The disjunction (OR) of two statements p and q, written p v q, is false only when:', 'Mathematics', 'Mathematical Reasoning', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('906ca141-e7d9-4037-940f-6986b6dd109f', 'f0c81746-afaa-4837-bed3-0cbf227260da', 0, 'At least one of p or q is true');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98ebe2b9-0778-4502-8770-b330eabb431b', 'f0c81746-afaa-4837-bed3-0cbf227260da', 1, 'Both p and q are true');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b1282f7-e8db-45d0-aa6c-e4b66fb1ff3d', 'f0c81746-afaa-4837-bed3-0cbf227260da', 2, 'Both p and q are false');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d97c013-3744-4e0e-a97f-3c681e6c1274', 'f0c81746-afaa-4837-bed3-0cbf227260da', 3, 'Exactly one of p or q is true');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f0c81746-afaa-4837-bed3-0cbf227260da', '9b1282f7-e8db-45d0-aa6c-e4b66fb1ff3d', 'The logical disjunction (OR) of two statements is false only when both statements are false; it is true in every other case.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('69b4ef0e-efd0-4ccf-8672-932e37b44ef8', '011d3a8c-0cff-4170-ba23-59c383912f41', 69, 'The rate of change of the area of a circle with respect to its radius r is given by:', 'Mathematics', 'Application of Derivatives', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('644c2f1d-27d8-456c-a677-4e02431998f6', '69b4ef0e-efd0-4ccf-8672-932e37b44ef8', 0, 'pi*r');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40ff6749-cf4e-4c9c-baff-b65008e9bef5', '69b4ef0e-efd0-4ccf-8672-932e37b44ef8', 1, '2*pi*r');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0467aabc-209e-415f-b7f5-4f3c32927a2a', '69b4ef0e-efd0-4ccf-8672-932e37b44ef8', 2, 'pi*r^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e847891a-630b-45f8-bb98-f3f4305ddd41', '69b4ef0e-efd0-4ccf-8672-932e37b44ef8', 3, '2*pi');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('69b4ef0e-efd0-4ccf-8672-932e37b44ef8', '40ff6749-cf4e-4c9c-baff-b65008e9bef5', 'Area A = pi*r^2; dA/dr = 2*pi*r, the circumference — the rate of change of area with respect to radius equals the circle''s circumference.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('eaec53c1-e02f-495f-b762-69054910d9de', '011d3a8c-0cff-4170-ba23-59c383912f41', 70, 'The area enclosed between the curve y=4-x^2 and the x-axis, between its roots x=-2 and x=2, is:', 'Mathematics', 'Application of Integrals', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83942cca-e326-4f8a-9462-23bf8dd99e0d', 'eaec53c1-e02f-495f-b762-69054910d9de', 0, '32/3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c97d9d1c-f52d-4dfd-9395-0f17bb54bb2f', 'eaec53c1-e02f-495f-b762-69054910d9de', 1, '16/3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cced57e-ea35-45c2-981c-2a163fa09253', 'eaec53c1-e02f-495f-b762-69054910d9de', 2, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('641ad2a0-9672-44a5-a02a-4b0dbbc6bdab', 'eaec53c1-e02f-495f-b762-69054910d9de', 3, '4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('eaec53c1-e02f-495f-b762-69054910d9de', '83942cca-e326-4f8a-9462-23bf8dd99e0d', 'Area = integral of (4-x^2) dx from -2 to 2 = [4x - x^3/3] from -2 to 2 = (8 - 8/3) - (-8 + 8/3) = 16 - 16/3 = 32/3.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a2f42c15-2217-4c37-8fe3-701faca329ca', '011d3a8c-0cff-4170-ba23-59c383912f41', 71, 'The common difference of the arithmetic progression 7, 12, 17, 22, ... is:', 'Mathematics', 'Sequences and Series — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('a2f42c15-2217-4c37-8fe3-701faca329ca', 5, 'Common difference = 12 - 7 = 5 (consistent throughout the sequence).', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2705b596-5fa7-40a5-9e99-8096d27ae0cf', '011d3a8c-0cff-4170-ba23-59c383912f41', 72, 'The number of ways to select a committee of 2 people from a group of 5 people is:', 'Mathematics', 'Permutations and Combinations — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('2705b596-5fa7-40a5-9e99-8096d27ae0cf', 10, 'C(5,2) = 5!/(2!*3!) = (5*4)/2 = 10.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('516344ad-829e-4310-9536-5ddeb157673c', '011d3a8c-0cff-4170-ba23-59c383912f41', 73, 'The value of the definite integral of 6x^2 dx from 1 to 2 is:', 'Mathematics', 'Integral Calculus — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('516344ad-829e-4310-9536-5ddeb157673c', 14, 'Integral of 6x^2 dx = 2x^3; evaluating from 1 to 2 gives 2(8) - 2(1) = 16 - 2 = 14.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('980df77a-fb52-4cb5-b8df-8b74653be743', '011d3a8c-0cff-4170-ba23-59c383912f41', 74, 'The value of 2*sin(30 degrees)*cos(30 degrees) is equal to sin(60 degrees), which numerically equals (rounded to 2 decimal places):', 'Mathematics', 'Trigonometry — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('980df77a-fb52-4cb5-b8df-8b74653be743', 0.87, 'Using the double-angle identity, 2*sin(30)*cos(30) = sin(60 degrees) = sqrt(3)/2 ≈ 0.87.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2025733c-54ab-4403-8b69-918e60c69891', '011d3a8c-0cff-4170-ba23-59c383912f41', 75, 'A bag contains 3 red and 2 blue balls. The probability of drawing a red ball (as a decimal) is:', 'Mathematics', 'Statistics and Probability — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('2025733c-54ab-4403-8b69-918e60c69891', 0.6, 'Probability = favorable outcomes/total outcomes = 3/5 = 0.6.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');
