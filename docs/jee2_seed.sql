-- ============================================================
-- JEE Main — Full Mock Paper 2
-- Full-Length Practice Paper (75 questions, 180 minutes)
-- Marking: +4 correct / -1 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('68c083dc-12a6-4ea0-b3c9-e6d59e579806', 'jee-main-practice-2', 'JEE Main Full Mock Paper 2', 'jee-main', ARRAY['Physics', 'Chemistry', 'Mathematics', 'NCERT', 'JEE Main']::TEXT[], 75, 'mixed', true, 2, 180, 4, 1);

-- ── Section: Physics (25 questions) — Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ff2f2ff4-7a3f-44cc-b0bf-e3380d39f0ac', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 1, 'The percentage error in the measurement of a quantity Q = A^2*B, if the percentage errors in A and B are 2% and 3% respectively, is:', 'Physics', 'Units and Measurements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c23d8174-5ba1-4922-a164-7a18763c43c8', 'ff2f2ff4-7a3f-44cc-b0bf-e3380d39f0ac', 0, '5%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef9b444b-902e-4271-92a9-0955984d2f62', 'ff2f2ff4-7a3f-44cc-b0bf-e3380d39f0ac', 1, '7%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a4280b0-2042-4685-abfc-e076104e664f', 'ff2f2ff4-7a3f-44cc-b0bf-e3380d39f0ac', 2, '8%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8172e73-ea99-47f8-a60f-124b24137722', 'ff2f2ff4-7a3f-44cc-b0bf-e3380d39f0ac', 3, '4%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ff2f2ff4-7a3f-44cc-b0bf-e3380d39f0ac', 'ef9b444b-902e-4271-92a9-0955984d2f62', 'For Q=A^2*B, the fractional error adds as 2*(dA/A) + (dB/B) = 2*2% + 3% = 7%.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c8e82667-2485-4f5f-b710-59b9e8296abf', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 2, 'A projectile is launched at an angle of 30 degrees with the horizontal with speed 20 m/s. The time of flight (taking g=10 m/s^2) is:', 'Physics', 'Motion in a Plane', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc730806-a4b1-47a4-bc6a-40c978920d9a', 'c8e82667-2485-4f5f-b710-59b9e8296abf', 0, '1s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e662ebd8-cae3-4183-b2ed-418fe6403301', 'c8e82667-2485-4f5f-b710-59b9e8296abf', 1, '2s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f2217c1-bdc8-4254-986d-b88b81976dcb', 'c8e82667-2485-4f5f-b710-59b9e8296abf', 2, '3s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce81da80-fd06-47f6-af29-324eae261b8e', 'c8e82667-2485-4f5f-b710-59b9e8296abf', 3, '4s');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c8e82667-2485-4f5f-b710-59b9e8296abf', 'e662ebd8-cae3-4183-b2ed-418fe6403301', 'Time of flight T = 2*u*sin(theta)/g = 2*20*0.5/10 = 2s.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ec6df5e2-46b1-4258-87f9-cac6b41ac70a', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 3, 'A body of mass 5 kg is acted upon by two perpendicular forces of 3 N and 4 N. The magnitude of its acceleration is:', 'Physics', 'Laws of Motion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c1be18d-0eb3-4524-a351-fa9531b7e419', 'ec6df5e2-46b1-4258-87f9-cac6b41ac70a', 0, '0.6 m/s^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('713dae05-fe8c-42e0-960c-9f3a0fbfde26', 'ec6df5e2-46b1-4258-87f9-cac6b41ac70a', 1, '1 m/s^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('351743a1-10db-4332-af06-cfeca1273ab6', 'ec6df5e2-46b1-4258-87f9-cac6b41ac70a', 2, '1.4 m/s^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10889c0f-4310-43b9-9174-613113d7cf26', 'ec6df5e2-46b1-4258-87f9-cac6b41ac70a', 3, '7 m/s^2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ec6df5e2-46b1-4258-87f9-cac6b41ac70a', '713dae05-fe8c-42e0-960c-9f3a0fbfde26', 'Resultant force = sqrt(3^2+4^2) = 5N; a = F/m = 5/5 = 1 m/s^2.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('90540bfb-ca78-4992-8792-a7c43c766673', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 4, 'A machine delivers 100 J of work every 5 seconds. Its power output is:', 'Physics', 'Work, Energy and Power', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90b3c22c-6f43-4ab0-85f9-cf842f1ead07', '90540bfb-ca78-4992-8792-a7c43c766673', 0, '10 W');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bee9a8e-a7ca-424e-989a-59060c91adb1', '90540bfb-ca78-4992-8792-a7c43c766673', 1, '20 W');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c467fc4-fb60-4af2-9a09-714f82234f6d', '90540bfb-ca78-4992-8792-a7c43c766673', 2, '500 W');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd168b4a-0983-4a0d-ab8a-99a16f8e281f', '90540bfb-ca78-4992-8792-a7c43c766673', 3, '0.05 W');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('90540bfb-ca78-4992-8792-a7c43c766673', '2bee9a8e-a7ca-424e-989a-59060c91adb1', 'Power = Work/time = 100/5 = 20 W.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('76d3808c-7a2b-464f-96d0-89595efeb867', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 5, 'A torque of 10 N.m acts on a body having a moment of inertia of 2 kg.m^2. The resulting angular acceleration is:', 'Physics', 'System of Particles and Rotational Motion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63a1bc61-2643-481c-a439-d7a159b5e84c', '76d3808c-7a2b-464f-96d0-89595efeb867', 0, '2 rad/s^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cef66176-60fd-41b6-aa5c-c8077897fb44', '76d3808c-7a2b-464f-96d0-89595efeb867', 1, '5 rad/s^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c094ee6-a3cc-400e-ba09-ffb8c78859b2', '76d3808c-7a2b-464f-96d0-89595efeb867', 2, '20 rad/s^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0c4e16a-f0cf-462d-a58f-3e2f4a516f88', '76d3808c-7a2b-464f-96d0-89595efeb867', 3, '0.2 rad/s^2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('76d3808c-7a2b-464f-96d0-89595efeb867', 'cef66176-60fd-41b6-aa5c-c8077897fb44', 'alpha = torque/I = 10/2 = 5 rad/s^2.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('56bd44be-12ab-46e7-b6bd-bc4ad7f34ed6', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 6, 'The time period of a satellite orbiting close to the Earth''s surface depends on Earth''s radius R and the acceleration due to gravity g as:', 'Physics', 'Gravitation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de894762-0596-4562-92f7-80a075f39d64', '56bd44be-12ab-46e7-b6bd-bc4ad7f34ed6', 0, 'T = 2*pi*sqrt(R/g)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f1e5b66-fe9c-470e-b35f-21ae0adbd291', '56bd44be-12ab-46e7-b6bd-bc4ad7f34ed6', 1, 'T = 2*pi*sqrt(g/R)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1f0584b-c19a-4dbc-815b-fd5536f6773c', '56bd44be-12ab-46e7-b6bd-bc4ad7f34ed6', 2, 'T = 2*pi*R*g');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f683195f-7fe2-4a05-97fb-453665f06248', '56bd44be-12ab-46e7-b6bd-bc4ad7f34ed6', 3, 'T = 2*pi/(Rg)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('56bd44be-12ab-46e7-b6bd-bc4ad7f34ed6', 'de894762-0596-4562-92f7-80a075f39d64', 'For a near-surface orbit, gravitational force provides centripetal force: mg = mv^2/R, and T = 2*pi*R/v = 2*pi*sqrt(R/g).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9a471c76-7151-4946-97e0-05b353c7816b', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 7, 'Water rises to a height of 4 cm in a capillary tube. If the radius of the tube is doubled, the new height of the water column will be:', 'Physics', 'Mechanical Properties of Fluids', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('beb3f32f-74e8-4ca3-a3d0-0a12552601a2', '9a471c76-7151-4946-97e0-05b353c7816b', 0, '8 cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('746e1431-a463-4747-9dbc-17f4b1fdf876', '9a471c76-7151-4946-97e0-05b353c7816b', 1, '4 cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc9452b3-46db-4644-8246-080bc15d3f43', '9a471c76-7151-4946-97e0-05b353c7816b', 2, '2 cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('921845c2-ba9d-4f21-be12-8f621ca4980a', '9a471c76-7151-4946-97e0-05b353c7816b', 3, '16 cm');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9a471c76-7151-4946-97e0-05b353c7816b', 'dc9452b3-46db-4644-8246-080bc15d3f43', 'Capillary rise h is inversely proportional to radius r; doubling r halves h, giving 4/2 = 2 cm.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0e9e99ba-b6d4-4b30-a940-eb33c3b1841b', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 8, 'A blackbody at temperature 27 degrees Celsius radiates energy at a rate R. If the temperature is increased to 327 degrees Celsius, the new rate of radiation (per Stefan''s law) is approximately:', 'Physics', 'Thermal Properties of Matter', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35f6390e-82dc-4446-b204-30768fd12624', '0e9e99ba-b6d4-4b30-a940-eb33c3b1841b', 0, '2R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e99d6ba2-5e8b-43c5-9f12-e8191ef164df', '0e9e99ba-b6d4-4b30-a940-eb33c3b1841b', 1, '4R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c974cf52-54fe-4d36-ab0a-bd5fbcefea38', '0e9e99ba-b6d4-4b30-a940-eb33c3b1841b', 2, '8R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('521d181d-8885-4e21-ac57-02941db4edd4', '0e9e99ba-b6d4-4b30-a940-eb33c3b1841b', 3, '16R');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0e9e99ba-b6d4-4b30-a940-eb33c3b1841b', '521d181d-8885-4e21-ac57-02941db4edd4', 'Using absolute temperatures: T1=300K, T2=600K; since R is proportional to T^4, the new rate is R*(600/300)^4 = R*2^4 = 16R.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d55bdaf4-212a-43ca-b3b8-f8a3938900fc', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 9, 'In an isochoric process, the work done by the gas is:', 'Physics', 'Thermodynamics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6029851-1c73-4468-9851-360b16cd4450', 'd55bdaf4-212a-43ca-b3b8-f8a3938900fc', 0, 'Positive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9fce245-6eff-47c8-80b3-88d93998371d', 'd55bdaf4-212a-43ca-b3b8-f8a3938900fc', 1, 'Negative');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea04bab4-3f44-4c7e-a480-3a2937efdfee', 'd55bdaf4-212a-43ca-b3b8-f8a3938900fc', 2, 'Zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ae419e9-228c-41fc-9cfb-bbe46e5ad649', 'd55bdaf4-212a-43ca-b3b8-f8a3938900fc', 3, 'Cannot be determined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d55bdaf4-212a-43ca-b3b8-f8a3938900fc', 'ea04bab4-3f44-4c7e-a480-3a2937efdfee', 'An isochoric (constant volume) process involves no change in volume, so W = P*deltaV = 0.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('97c8f7e2-5b69-42d3-be3b-3261ef9c5b15', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 10, 'The time period of a simple pendulum on the surface of the Moon (where g is about 1/6th of Earth''s g) compared to Earth, for the same length, is:', 'Physics', 'Oscillations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12b01d21-29be-4701-b8a1-71b312a2286f', '97c8f7e2-5b69-42d3-be3b-3261ef9c5b15', 0, 'Same as on Earth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84e7bdf6-4cb5-4b93-bb95-cf7184d2149b', '97c8f7e2-5b69-42d3-be3b-3261ef9c5b15', 1, 'sqrt(6) times longer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('867631ea-e2a1-4460-b2f4-e6a71866cc6f', '97c8f7e2-5b69-42d3-be3b-3261ef9c5b15', 2, '6 times longer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36895641-6767-4343-bfb5-4143720b49a7', '97c8f7e2-5b69-42d3-be3b-3261ef9c5b15', 3, '1/6th as long');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('97c8f7e2-5b69-42d3-be3b-3261ef9c5b15', '84e7bdf6-4cb5-4b93-bb95-cf7184d2149b', 'T is proportional to 1/sqrt(g); since g_moon = g_earth/6, T_moon = T_earth*sqrt(6).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3c2bf0a1-2818-4c3d-a6b5-27a52e63b7f2', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 11, 'The speed of sound in air at 0 degrees Celsius is approximately 332 m/s. Using v proportional to sqrt(T), the approximate speed of sound at 273 degrees Celsius (546 K) is:', 'Physics', 'Waves', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1bc024b-0d1b-4cfd-bfca-da747da9d675', '3c2bf0a1-2818-4c3d-a6b5-27a52e63b7f2', 0, '332 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bdc61b64-603e-452a-b7cc-d69579ce1caf', '3c2bf0a1-2818-4c3d-a6b5-27a52e63b7f2', 1, '469 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94d8954e-e1af-4329-89d8-22003ff73cf5', '3c2bf0a1-2818-4c3d-a6b5-27a52e63b7f2', 2, '664 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7c5de97-2a56-40d0-8027-ea142778d8b4', '3c2bf0a1-2818-4c3d-a6b5-27a52e63b7f2', 3, '166 m/s');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3c2bf0a1-2818-4c3d-a6b5-27a52e63b7f2', 'bdc61b64-603e-452a-b7cc-d69579ce1caf', 'v is proportional to sqrt(T in Kelvin); T doubles from 273K (0 degrees C) to 546K (273 degrees C), so v increases by a factor of sqrt(2), giving 332*sqrt(2) ≈ 469 m/s.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('035f825b-babd-4a3e-be63-d655be563adc', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 12, 'The electric flux through a closed surface enclosing a charge of 2 microC is (given epsilon0 = 8.85*10^-12 C^2/N.m^2):', 'Physics', 'Electric Charges and Fields', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db5f6e80-4d7f-40a4-a12e-232fca223e1c', '035f825b-babd-4a3e-be63-d655be563adc', 0, '2.26*10^5 N.m^2/C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38991f23-22f2-46db-8697-0bfb158bc1d2', '035f825b-babd-4a3e-be63-d655be563adc', 1, '1.77*10^-17 N.m^2/C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a15b66c4-08c3-4ae7-9ee5-177cac936faa', '035f825b-babd-4a3e-be63-d655be563adc', 2, '2*10^-6 N.m^2/C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebee86fe-2a45-4ae2-879a-d7cc576eebc9', '035f825b-babd-4a3e-be63-d655be563adc', 3, '8.85*10^-12 N.m^2/C');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('035f825b-babd-4a3e-be63-d655be563adc', 'db5f6e80-4d7f-40a4-a12e-232fca223e1c', 'By Gauss''s law, flux = Q/epsilon0 = (2*10^-6)/(8.85*10^-12) ≈ 2.26*10^5 N.m^2/C.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('74e70100-a1fd-4edd-afae-917ef32e0a3b', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 13, 'Two capacitors of 4 microF and 6 microF are connected in series. The equivalent capacitance is:', 'Physics', 'Electrostatic Potential and Capacitance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67eebb4e-b614-4850-935c-a2e8b6cb39a5', '74e70100-a1fd-4edd-afae-917ef32e0a3b', 0, '10 microF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b994c658-ad63-41aa-85b7-b91d26c82a58', '74e70100-a1fd-4edd-afae-917ef32e0a3b', 1, '2.4 microF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c93ff8c2-0b73-4b5b-83b6-a0c9efb52c35', '74e70100-a1fd-4edd-afae-917ef32e0a3b', 2, '24 microF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4371427d-1515-468b-a441-d1a7a7288db9', '74e70100-a1fd-4edd-afae-917ef32e0a3b', 3, '1.5 microF');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('74e70100-a1fd-4edd-afae-917ef32e0a3b', 'b994c658-ad63-41aa-85b7-b91d26c82a58', '1/C_eq = 1/4 + 1/6 = 3/12+2/12 = 5/12, so C_eq = 12/5 = 2.4 microF.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('91983881-cca2-420f-8c4e-df7b31245e1a', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 14, 'A wire of resistance R is stretched to twice its original length, keeping the volume constant. The new resistance is:', 'Physics', 'Current Electricity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e5978d7-498d-4657-a6c0-efa7f282a9de', '91983881-cca2-420f-8c4e-df7b31245e1a', 0, 'R/2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('088880ae-7c40-47da-909a-e2d14f5246af', '91983881-cca2-420f-8c4e-df7b31245e1a', 1, 'R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a44dffb-1917-403e-8cef-63c494a1aa3b', '91983881-cca2-420f-8c4e-df7b31245e1a', 2, '2R');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a605e1f-71e7-4759-932d-1a76729ceb91', '91983881-cca2-420f-8c4e-df7b31245e1a', 3, '4R');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('91983881-cca2-420f-8c4e-df7b31245e1a', '6a605e1f-71e7-4759-932d-1a76729ceb91', 'Since volume is constant, doubling length halves the cross-sectional area; resistance R=rho*L/A, so new R'' = rho*(2L)/(A/2) = 4*rho*L/A = 4R.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cdf1478b-4af0-4de2-8a99-5cb5f1e1881d', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 15, 'The magnetic field at a distance of 0.1 m from a long straight wire carrying a current of 5 A (mu0=4*pi*10^-7 T.m/A) is approximately:', 'Physics', 'Moving Charges and Magnetism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f64261b5-9056-4392-947b-031085bb4f33', 'cdf1478b-4af0-4de2-8a99-5cb5f1e1881d', 0, '10^-5 T');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62455038-12f9-4af0-867c-4dc34512f8a7', 'cdf1478b-4af0-4de2-8a99-5cb5f1e1881d', 1, '10^-6 T');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aed0d780-4076-4ded-9560-740483b7ce03', 'cdf1478b-4af0-4de2-8a99-5cb5f1e1881d', 2, '10^-4 T');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42507dce-669c-49e7-94c3-4808f7351698', 'cdf1478b-4af0-4de2-8a99-5cb5f1e1881d', 3, '10^-3 T');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cdf1478b-4af0-4de2-8a99-5cb5f1e1881d', 'f64261b5-9056-4392-947b-031085bb4f33', 'B = mu0*I/(2*pi*r) = (4*pi*10^-7 * 5)/(2*pi*0.1) = (2*10^-7*5)/0.1 = 10^-5 T.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ab8a7cb9-7f41-4e68-8afa-bdc56e77ead9', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 16, 'The magnetic flux through a coil changes from 2 Wb to 10 Wb in 4 seconds. The average induced EMF is:', 'Physics', 'Electromagnetic Induction', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('255f82b3-9f0f-49ba-ac31-a7dfe157451d', 'ab8a7cb9-7f41-4e68-8afa-bdc56e77ead9', 0, '0.5 V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38d9fd49-4ae9-45ec-aab8-c42705fc6aa1', 'ab8a7cb9-7f41-4e68-8afa-bdc56e77ead9', 1, '2 V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('892e4232-9554-48cf-860b-7e3d39c7fa30', 'ab8a7cb9-7f41-4e68-8afa-bdc56e77ead9', 2, '8 V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b8df73d-a042-472a-b651-785c951fce67', 'ab8a7cb9-7f41-4e68-8afa-bdc56e77ead9', 3, '4 V');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ab8a7cb9-7f41-4e68-8afa-bdc56e77ead9', '38d9fd49-4ae9-45ec-aab8-c42705fc6aa1', 'EMF = deltaPhi/deltaT = (10-2)/4 = 2 V.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('65a73d00-1a49-4b85-a6c8-e7460bb14414', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 17, 'In a series LCR circuit at resonance, the impedance of the circuit is equal to:', 'Physics', 'Alternating Current', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f0948e4-27b0-40e8-bebb-556f6beabfee', '65a73d00-1a49-4b85-a6c8-e7460bb14414', 0, 'Zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6031059e-d620-48ff-a66d-ebee7c4b3382', '65a73d00-1a49-4b85-a6c8-e7460bb14414', 1, 'The resistance R only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('105ae8f1-5791-4617-9b5b-abe040c7d804', '65a73d00-1a49-4b85-a6c8-e7460bb14414', 2, 'The inductive reactance only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81218f01-d2a9-4a4e-acc5-827fc48acdce', '65a73d00-1a49-4b85-a6c8-e7460bb14414', 3, 'The capacitive reactance only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('65a73d00-1a49-4b85-a6c8-e7460bb14414', '6031059e-d620-48ff-a66d-ebee7c4b3382', 'At resonance, X_L = X_C, so they cancel in the impedance formula Z = sqrt(R^2+(X_L-X_C)^2), leaving Z=R, the minimum possible impedance.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5add7a91-b977-4b8d-a693-3f84b8b9ebb7', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 18, 'A ray of light passes from a medium of refractive index 1.5 into air. The critical angle for total internal reflection (approximately, since sin C=1/1.5) is:', 'Physics', 'Ray Optics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3e39498-1c06-4091-b2b5-988ff6508e73', '5add7a91-b977-4b8d-a693-3f84b8b9ebb7', 0, '30 degrees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59503502-e940-4968-8f32-b463bfdc6b61', '5add7a91-b977-4b8d-a693-3f84b8b9ebb7', 1, '42 degrees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a230dcc7-15b7-4ca9-94f0-f3f4b49e23e5', '5add7a91-b977-4b8d-a693-3f84b8b9ebb7', 2, '48 degrees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b2bbb50-de4e-42dd-89d8-0e51284f4459', '5add7a91-b977-4b8d-a693-3f84b8b9ebb7', 3, '60 degrees');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5add7a91-b977-4b8d-a693-3f84b8b9ebb7', 'a230dcc7-15b7-4ca9-94f0-f3f4b49e23e5', 'sin C = 1/1.5 = 0.667, so C = arcsin(0.667) ≈ 41.8 degrees, closest to 42 degrees.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('08d4eb57-260b-49de-baf8-1131b3386d73', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 19, 'In Young''s double slit experiment, if the slit separation is doubled while keeping other factors constant, the fringe width:', 'Physics', 'Wave Optics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5cb9272-1c01-4baf-b7ce-7a55f4964e83', '08d4eb57-260b-49de-baf8-1131b3386d73', 0, 'Doubles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e053fe83-2c64-4c6b-8f5a-38ccc7eed09c', '08d4eb57-260b-49de-baf8-1131b3386d73', 1, 'Halves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79401ca3-6f6e-413a-a183-cd6d0eebb120', '08d4eb57-260b-49de-baf8-1131b3386d73', 2, 'Remains the same');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31652de8-e718-4ada-961e-59feeffd62b7', '08d4eb57-260b-49de-baf8-1131b3386d73', 3, 'Becomes four times');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('08d4eb57-260b-49de-baf8-1131b3386d73', 'e053fe83-2c64-4c6b-8f5a-38ccc7eed09c', 'Fringe width beta = lambda*D/d; doubling d (slit separation) halves beta.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c15c54fb-2596-4a10-9409-20b4943928a1', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 20, 'A pure semiconductor is doped with a trivalent impurity. The resulting semiconductor is of type:', 'Physics', 'Semiconductor Electronics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('712503bf-a3c5-479e-8481-010111cc2942', 'c15c54fb-2596-4a10-9409-20b4943928a1', 0, 'n-type, with electrons as majority carriers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3bfb842e-625a-4478-bab0-3751ae72be23', 'c15c54fb-2596-4a10-9409-20b4943928a1', 1, 'p-type, with holes as majority carriers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e89c1df1-3ffa-407d-a497-f04c715e032e', 'c15c54fb-2596-4a10-9409-20b4943928a1', 2, 'Intrinsic, with no change');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62a867b4-5f5c-4e50-a5d5-476eff1f4a72', 'c15c54fb-2596-4a10-9409-20b4943928a1', 3, 'Insulating');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c15c54fb-2596-4a10-9409-20b4943928a1', '3bfb842e-625a-4478-bab0-3751ae72be23', 'A trivalent (3-valence-electron) dopant creates a deficiency of one electron in the covalent bonding, producing a hole — this is p-type doping, where holes are the majority charge carriers.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('83482633-53df-40f2-8778-7e24899a5c17', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 21, 'A ball is thrown vertically upward with a speed of 20 m/s (g=10 m/s^2). The maximum height (in metres) reached by the ball is:', 'Physics', 'Motion in a Straight Line — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('83482633-53df-40f2-8778-7e24899a5c17', 20, 'Using v^2=u^2-2gh with v=0: h = u^2/(2g) = 400/20 = 20 m.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7499697e-8c3b-4f6d-bbce-94d8fc34962a', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 22, 'The escape velocity from a planet is 11.2 km/s. If the mass of the planet were the same but its radius were halved, the new escape velocity (in km/s) would be:', 'Physics', 'Gravitation — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('7499697e-8c3b-4f6d-bbce-94d8fc34962a', 15.84, 'Escape velocity v_e = sqrt(2GM/R) is inversely proportional to sqrt(R); halving R increases v_e by sqrt(2), giving 11.2*sqrt(2) ≈ 15.84 km/s.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2336f0b9-f771-4f54-ac85-1e7a4475a85a', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 23, 'Two resistors of 4 ohm and 6 ohm are connected in series with a 10 V battery. The current (in amperes) flowing in the circuit is:', 'Physics', 'Current Electricity — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('2336f0b9-f771-4f54-ac85-1e7a4475a85a', 1, 'Total resistance = 4+6 = 10 ohm; I = V/R = 10/10 = 1 A.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d3d1c540-4d42-474b-b848-95e6161b4422', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 24, 'A wave has a frequency of 50 Hz and a wavelength of 4 m. Its speed (in m/s) is:', 'Physics', 'Waves — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('d3d1c540-4d42-474b-b848-95e6161b4422', 200, 'v = f*lambda = 50*4 = 200 m/s.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a3970388-fb64-4488-81cb-1b841ee3b209', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 25, 'An AC source has a peak voltage of 141.4 V. Its rms voltage (in volts, rounded to the nearest whole number) is:', 'Physics', 'Alternating Current — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('a3970388-fb64-4488-81cb-1b841ee3b209', 100, 'V_rms = V_peak/sqrt(2) = 141.4/1.414 = 100 V.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Chemistry (25 questions) — Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8888cadd-2b62-426d-84a3-9f2322e6752b', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 26, 'The molarity of a solution containing 4 g of NaOH (molar mass 40 g/mol) dissolved in 500 mL of solution is:', 'Chemistry', 'Some Basic Concepts of Chemistry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bac0ae79-568b-4785-aa0e-e99d100b4502', '8888cadd-2b62-426d-84a3-9f2322e6752b', 0, '0.1 M');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0c74c52-ce8b-4a70-be96-28fba7e6aa11', '8888cadd-2b62-426d-84a3-9f2322e6752b', 1, '0.2 M');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd20cb9f-3135-4158-aaaa-d9f74cf5f369', '8888cadd-2b62-426d-84a3-9f2322e6752b', 2, '0.4 M');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39c7b98d-74f2-43e7-8a8c-0e1c47aad84a', '8888cadd-2b62-426d-84a3-9f2322e6752b', 3, '1 M');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8888cadd-2b62-426d-84a3-9f2322e6752b', 'a0c74c52-ce8b-4a70-be96-28fba7e6aa11', 'Moles of NaOH = 4/40 = 0.1 mol; Molarity = moles/volume(L) = 0.1/0.5 = 0.2 M.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8003b1d9-82c8-4adf-bb37-26f77e5a7862', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 27, 'The maximum number of electrons that can occupy the M shell (n=3) of an atom is:', 'Chemistry', 'Structure of Atom', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7220dfb2-54db-4076-b19f-ed93fd2ee8a1', '8003b1d9-82c8-4adf-bb37-26f77e5a7862', 0, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b2954c0-4c92-4f41-bd44-9d64442e925f', '8003b1d9-82c8-4adf-bb37-26f77e5a7862', 1, '18');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('267bc342-832d-45b0-8a36-80fd68410f20', '8003b1d9-82c8-4adf-bb37-26f77e5a7862', 2, '32');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c064dca6-56f5-4f10-ac41-4baa8f832be0', '8003b1d9-82c8-4adf-bb37-26f77e5a7862', 3, '2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8003b1d9-82c8-4adf-bb37-26f77e5a7862', '5b2954c0-4c92-4f41-bd44-9d64442e925f', 'Maximum electrons in a shell = 2n^2; for n=3, this is 2(9)=18.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ee11b50a-5b29-4532-a2b8-f1b54e920d9a', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 28, 'Which of the following elements has the largest atomic radius?', 'Chemistry', 'Classification of Elements and Periodicity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5989d19-1740-4af1-9b33-bb21bcadecc0', 'ee11b50a-5b29-4532-a2b8-f1b54e920d9a', 0, 'Li');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82b5bb42-fa86-4e4e-b5b0-4772fd90b715', 'ee11b50a-5b29-4532-a2b8-f1b54e920d9a', 1, 'Na');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b9098e6-bbd2-4af4-9250-44e599a1ee2a', 'ee11b50a-5b29-4532-a2b8-f1b54e920d9a', 2, 'K');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65bdc36f-d1a5-4d62-9834-576a23a63c1d', 'ee11b50a-5b29-4532-a2b8-f1b54e920d9a', 3, 'Cs');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ee11b50a-5b29-4532-a2b8-f1b54e920d9a', '65bdc36f-d1a5-4d62-9834-576a23a63c1d', 'Atomic radius increases down a group due to the addition of new electron shells; caesium (Cs), at the bottom of Group 1 among these options, has the largest atomic radius.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d570850b-db49-4957-a68f-e742e39b1776', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 29, 'The shape of the ammonia (NH3) molecule, with 3 bond pairs and 1 lone pair on nitrogen, is:', 'Chemistry', 'Chemical Bonding and Molecular Structure', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('820b6a6a-1fa7-4ec0-ad97-5a1813b2a06d', 'd570850b-db49-4957-a68f-e742e39b1776', 0, 'Tetrahedral');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('caeea26f-8390-4d75-b0de-4e32cd04cc23', 'd570850b-db49-4957-a68f-e742e39b1776', 1, 'Trigonal pyramidal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91ba83b0-af7f-4dcc-ad34-faa3af5a76d7', 'd570850b-db49-4957-a68f-e742e39b1776', 2, 'Trigonal planar');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0ceafc9-eeed-45f6-b0ba-5b24c7685a4e', 'd570850b-db49-4957-a68f-e742e39b1776', 3, 'Linear');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d570850b-db49-4957-a68f-e742e39b1776', 'caeea26f-8390-4d75-b0de-4e32cd04cc23', 'NH3 has 3 bonding pairs and 1 lone pair; the lone pair compresses the bond angle, giving a trigonal pyramidal molecular shape.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('165239ab-e7f9-4fd0-bb65-b661166b5127', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 30, 'According to Graham''s law, if gas A diffuses twice as fast as gas B, the ratio of their molar masses (M_A:M_B) is:', 'Chemistry', 'States of Matter', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('949a8430-484b-4756-984a-8b04f967df4e', '165239ab-e7f9-4fd0-bb65-b661166b5127', 0, '4:1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('573139f2-ab2a-4a33-ba8f-b37dcf5bff4d', '165239ab-e7f9-4fd0-bb65-b661166b5127', 1, '1:4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('147b964f-6c37-4935-807f-17d14758c399', '165239ab-e7f9-4fd0-bb65-b661166b5127', 2, '2:1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e30e2bcd-664f-4dab-bc08-2fc267bf743f', '165239ab-e7f9-4fd0-bb65-b661166b5127', 3, '1:2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('165239ab-e7f9-4fd0-bb65-b661166b5127', '573139f2-ab2a-4a33-ba8f-b37dcf5bff4d', 'Rate is inversely proportional to sqrt(molar mass); if rate_A = 2*rate_B, then M_A/M_B = (rate_B/rate_A)^2 = (1/2)^2 = 1/4, so M_A:M_B = 1:4.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0cccbdc1-deaa-48ab-83b9-39a6b6f715d7', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 31, 'The enthalpy of combustion of methane is -890 kJ/mol. The heat released when 2 moles of methane are completely combusted is:', 'Chemistry', 'Thermodynamics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8550e8cd-5e55-43a2-91d6-e35342462ed5', '0cccbdc1-deaa-48ab-83b9-39a6b6f715d7', 0, '445 kJ');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ec37e33-c333-4ed7-838a-439272a9c017', '0cccbdc1-deaa-48ab-83b9-39a6b6f715d7', 1, '890 kJ');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03f9e6d2-7b54-45f3-80c4-bc229f44d5b7', '0cccbdc1-deaa-48ab-83b9-39a6b6f715d7', 2, '1780 kJ');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('310407a2-9c30-4136-aa42-449cc48a9cbd', '0cccbdc1-deaa-48ab-83b9-39a6b6f715d7', 3, '2670 kJ');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0cccbdc1-deaa-48ab-83b9-39a6b6f715d7', '03f9e6d2-7b54-45f3-80c4-bc229f44d5b7', 'Heat released = 2 * 890 kJ = 1780 kJ.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4b343e67-da80-4284-b4e6-da86db13ffe2', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 32, 'The solubility product (Ksp) of AgCl is 1.8*10^-10. The molar solubility of AgCl in pure water is approximately:', 'Chemistry', 'Equilibrium', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f5d9077-8d11-440a-b26c-b695abd027a1', '4b343e67-da80-4284-b4e6-da86db13ffe2', 0, '1.8*10^-10 M');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4bb8f92a-92bc-4b29-ab61-1ca257398105', '4b343e67-da80-4284-b4e6-da86db13ffe2', 1, '1.34*10^-5 M');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e61b77d3-258b-4e61-8075-5c79ed04b4ce', '4b343e67-da80-4284-b4e6-da86db13ffe2', 2, '9*10^-11 M');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f79332a-285b-42dc-a59c-1e56196bf6f1', '4b343e67-da80-4284-b4e6-da86db13ffe2', 3, '3.24*10^-20 M');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4b343e67-da80-4284-b4e6-da86db13ffe2', '4bb8f92a-92bc-4b29-ab61-1ca257398105', 'For AgCl <-> Ag+ + Cl-, Ksp = s^2, so s = sqrt(1.8*10^-10) ≈ 1.34*10^-5 M.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2bc846dc-ae64-4ad7-96f2-18d97eec12b9', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 33, 'The oxidation number of nitrogen in NH4+ is:', 'Chemistry', 'Redox Reactions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36e11e6c-f667-40af-8a84-359c70ec54ef', '2bc846dc-ae64-4ad7-96f2-18d97eec12b9', 0, '-3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f44a961-673f-4bb1-a096-19e539a52a1f', '2bc846dc-ae64-4ad7-96f2-18d97eec12b9', 1, '+3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a598935-4266-4c02-bd37-ce61302a780b', '2bc846dc-ae64-4ad7-96f2-18d97eec12b9', 2, '+5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('14f07394-fee8-41ea-8f2a-5e36b0739c7e', '2bc846dc-ae64-4ad7-96f2-18d97eec12b9', 3, '0');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2bc846dc-ae64-4ad7-96f2-18d97eec12b9', '36e11e6c-f667-40af-8a84-359c70ec54ef', 'Hydrogen is +1 (x4=+4); for the overall +1 charge, x+4=+1, giving x=-3 for nitrogen.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9e61e113-4d0d-4f35-8ab3-6019584e081b', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 34, 'Among the hydrides of Group 15 elements, the one with the highest boiling point (due to hydrogen bonding) is:', 'Chemistry', 'p-Block Elements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35c08fa7-07ac-492e-ad71-b4b2282d796e', '9e61e113-4d0d-4f35-8ab3-6019584e081b', 0, 'PH3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f589cddc-837d-481b-a9aa-98bdc9c1105a', '9e61e113-4d0d-4f35-8ab3-6019584e081b', 1, 'AsH3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6d2904f-b5b5-4146-aab9-df263fe07903', '9e61e113-4d0d-4f35-8ab3-6019584e081b', 2, 'NH3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d50573e-2789-43b2-984c-ab28a463ab38', '9e61e113-4d0d-4f35-8ab3-6019584e081b', 3, 'SbH3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9e61e113-4d0d-4f35-8ab3-6019584e081b', 'd6d2904f-b5b5-4146-aab9-df263fe07903', 'NH3, unlike the other Group 15 hydrides, exhibits strong hydrogen bonding due to nitrogen''s high electronegativity and small size, giving it an anomalously high boiling point among these hydrides.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6e7d8e2e-bb0b-453b-a6d9-f95e6fd108f2', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 35, 'The functional group present in an ester is:', 'Chemistry', 'Organic Chemistry — Basic Principles', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('958b55b0-e0c2-4521-8926-7e6d07c21a21', '6e7d8e2e-bb0b-453b-a6d9-f95e6fd108f2', 0, '-COOH');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa126e05-2b85-4487-ad23-a818a7197ba4', '6e7d8e2e-bb0b-453b-a6d9-f95e6fd108f2', 1, '-COOR');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6418d03-1bdb-43b6-af59-0b72b4ea3509', '6e7d8e2e-bb0b-453b-a6d9-f95e6fd108f2', 2, '-CHO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('116e035c-db4a-4b65-907a-d131ec4fe1d0', '6e7d8e2e-bb0b-453b-a6d9-f95e6fd108f2', 3, '-OH');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6e7d8e2e-bb0b-453b-a6d9-f95e6fd108f2', 'aa126e05-2b85-4487-ad23-a818a7197ba4', 'Esters are characterized by the -COOR functional group, formed from the condensation of a carboxylic acid and an alcohol.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e66d7c4a-715e-4d83-9298-204fda83678d', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 36, 'The number of sigma bonds in a molecule of ethyne (C2H2, HC triple-bond CH) is:', 'Chemistry', 'Hydrocarbons', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb2655e0-c592-47eb-8fd0-521fbe95c307', 'e66d7c4a-715e-4d83-9298-204fda83678d', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a764df3-da74-4cb5-82b0-e0de03300e4e', 'e66d7c4a-715e-4d83-9298-204fda83678d', 1, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8da86f88-6f12-4ca6-8603-d552344f93e5', 'e66d7c4a-715e-4d83-9298-204fda83678d', 2, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b83c2fcb-0678-4022-96e9-7efa49ac466c', 'e66d7c4a-715e-4d83-9298-204fda83678d', 3, '5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e66d7c4a-715e-4d83-9298-204fda83678d', '5a764df3-da74-4cb5-82b0-e0de03300e4e', 'Ethyne has 1 C-C sigma bond, and 2 C-H sigma bonds (one for each carbon), totaling 3 sigma bonds; the triple bond also includes 2 pi bonds, not counted as sigma.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('55b87b39-2f92-44b7-b286-9ccd3729e267', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 37, 'The gas primarily responsible for the greenhouse effect, present in the highest atmospheric concentration among greenhouse gases, is:', 'Chemistry', 'Environmental Chemistry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cef01782-4f10-471c-a627-98deaa543028', '55b87b39-2f92-44b7-b286-9ccd3729e267', 0, 'Methane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8acd1142-8cfe-45c2-a5c3-1761e92a0965', '55b87b39-2f92-44b7-b286-9ccd3729e267', 1, 'Carbon dioxide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cbf502c-a9a6-414f-b6ea-c081f529f88e', '55b87b39-2f92-44b7-b286-9ccd3729e267', 2, 'Nitrous oxide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('681e0b57-3a87-4166-8b6d-2b9c4db7c93a', '55b87b39-2f92-44b7-b286-9ccd3729e267', 3, 'Ozone');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('55b87b39-2f92-44b7-b286-9ccd3729e267', '8acd1142-8cfe-45c2-a5c3-1761e92a0965', 'While several gases contribute to the greenhouse effect, carbon dioxide is present at the highest atmospheric concentration among the major anthropogenic greenhouse gases.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3cf5ff89-b77e-4848-8898-ae257c6f963b', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 38, 'The number of atoms per unit cell in a face-centred cubic (fcc) lattice is:', 'Chemistry', 'Solid State', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abe32b09-43ee-4211-856c-84498f5fdf89', '3cf5ff89-b77e-4848-8898-ae257c6f963b', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a8c0fb8-ddc8-4207-a55a-ff34bef6adc0', '3cf5ff89-b77e-4848-8898-ae257c6f963b', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2a60e27-856a-49e8-bed2-c576808bc684', '3cf5ff89-b77e-4848-8898-ae257c6f963b', 2, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2d006ae-e626-432d-819d-f8cb8d0a7f1a', '3cf5ff89-b77e-4848-8898-ae257c6f963b', 3, '8');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3cf5ff89-b77e-4848-8898-ae257c6f963b', 'c2a60e27-856a-49e8-bed2-c576808bc684', 'An fcc unit cell has 8 corner atoms (each contributing 1/8) plus 6 face-centred atoms (each contributing 1/2): 8*(1/8) + 6*(1/2) = 1+3 = 4.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2101e300-e740-48a8-acee-eeaea3d6ff6e', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 39, 'According to Henry''s law, the solubility of a gas in a liquid is directly proportional to its:', 'Chemistry', 'Solutions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('976b6b6a-35c2-4e46-b9d9-dad4f3253d1b', '2101e300-e740-48a8-acee-eeaea3d6ff6e', 0, 'Temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0e5a4fd-4ecd-4198-b4b4-b97540f4bcc5', '2101e300-e740-48a8-acee-eeaea3d6ff6e', 1, 'Partial pressure above the liquid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebff6dbd-f301-40f3-bec0-0c7c8904c297', '2101e300-e740-48a8-acee-eeaea3d6ff6e', 2, 'Molar mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('edc7f211-d519-414b-b111-2358c2b8aad0', '2101e300-e740-48a8-acee-eeaea3d6ff6e', 3, 'Density');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2101e300-e740-48a8-acee-eeaea3d6ff6e', 'f0e5a4fd-4ecd-4198-b4b4-b97540f4bcc5', 'Henry''s law states that the solubility (or mole fraction) of a gas dissolved in a liquid is directly proportional to the partial pressure of that gas above the liquid, at constant temperature.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('667f76f0-c68b-4a68-b4aa-3e8e107ea8eb', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 40, 'The standard reduction potential of Cu2+/Cu is +0.34 V and Zn2+/Zn is -0.76 V. The standard EMF of the Daniell cell (Zn | Zn2+ || Cu2+ | Cu) is:', 'Chemistry', 'Electrochemistry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9996f6d8-4984-4cee-9d18-3e4e713658ec', '667f76f0-c68b-4a68-b4aa-3e8e107ea8eb', 0, '0.42 V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a664660-65cd-4589-ba8b-1cc22dd86f8f', '667f76f0-c68b-4a68-b4aa-3e8e107ea8eb', 1, '1.10 V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3140769-0c83-49aa-b448-ba0c7cba609a', '667f76f0-c68b-4a68-b4aa-3e8e107ea8eb', 2, '-1.10 V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b81b935c-adb2-48e4-a874-89ac34cd3d63', '667f76f0-c68b-4a68-b4aa-3e8e107ea8eb', 3, '0.76 V');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('667f76f0-c68b-4a68-b4aa-3e8e107ea8eb', '5a664660-65cd-4589-ba8b-1cc22dd86f8f', 'E-cell = E-cathode - E-anode = 0.34 - (-0.76) = 1.10 V.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c2223679-bcf1-4c1a-8a0c-552ba2c28a4f', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 41, 'The rate constant of a reaction doubles when temperature increases from 300K to 310K. This is best explained by the:', 'Chemistry', 'Chemical Kinetics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2da03c2-8a22-4128-af51-cd1c04d8997b', 'c2223679-bcf1-4c1a-8a0c-552ba2c28a4f', 0, 'Collision theory alone, ignoring activation energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19ddf428-f3a8-472f-abe5-c618027bbca5', 'c2223679-bcf1-4c1a-8a0c-552ba2c28a4f', 1, 'Arrhenius equation, since a modest temperature rise substantially increases the fraction of molecules with energy exceeding the activation energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8459ac26-da85-468c-883c-8df1704cbd6d', 'c2223679-bcf1-4c1a-8a0c-552ba2c28a4f', 2, 'Le Chatelier''s principle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1569ae8d-1f7d-41ef-a77d-64f362a4ac16', 'c2223679-bcf1-4c1a-8a0c-552ba2c28a4f', 3, 'Zeroth law of thermodynamics');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c2223679-bcf1-4c1a-8a0c-552ba2c28a4f', '19ddf428-f3a8-472f-abe5-c618027bbca5', 'The Arrhenius equation explains that even a small temperature increase can substantially increase the fraction of molecules with kinetic energy exceeding the activation energy, often approximately doubling the rate constant for a 10K rise, as commonly observed.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d5e78c7b-32ea-4a88-b8dd-009076265b14', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 42, 'The general electronic configuration of the d-block (transition) elements is:', 'Chemistry', 'd and f Block Elements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55ff7beb-d0d3-4596-91f6-5ef56ff9733b', 'd5e78c7b-32ea-4a88-b8dd-009076265b14', 0, '(n-1)d(1-10) ns(1-2)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a737ff96-5c15-4aa5-8d06-3566b0c2f00e', 'd5e78c7b-32ea-4a88-b8dd-009076265b14', 1, 'ns2 np(1-6)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de480b38-d8ce-4de4-b7bc-3310d9778fd8', 'd5e78c7b-32ea-4a88-b8dd-009076265b14', 2, '(n-2)f(1-14)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('989534d3-6838-4f0c-8923-2c1862e14b46', 'd5e78c7b-32ea-4a88-b8dd-009076265b14', 3, 'ns(1-2) only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d5e78c7b-32ea-4a88-b8dd-009076265b14', '55ff7beb-d0d3-4596-91f6-5ef56ff9733b', 'Transition elements are characterized by the progressive filling of the (n-1)d orbitals while the outermost ns orbital typically has 1 or 2 electrons: (n-1)d(1-10) ns(1-2).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('23c74694-df97-4926-a4be-cc06372aba83', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 43, 'In the complex [Ni(CO)4], the oxidation state of nickel is:', 'Chemistry', 'Coordination Compounds', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0a3ffb8-f00e-44f8-855f-667fc3f1619b', '23c74694-df97-4926-a4be-cc06372aba83', 0, '0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd6852b0-d012-4546-89cb-6c8c9797530c', '23c74694-df97-4926-a4be-cc06372aba83', 1, '+2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e26d4156-235b-4f24-a6a4-1797f517d748', '23c74694-df97-4926-a4be-cc06372aba83', 2, '+4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b959907-982e-404e-be55-545ba9b583ee', '23c74694-df97-4926-a4be-cc06372aba83', 3, '-2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('23c74694-df97-4926-a4be-cc06372aba83', 'e0a3ffb8-f00e-44f8-855f-667fc3f1619b', 'CO is a neutral ligand; since the overall complex is neutral, nickel must be in the 0 oxidation state.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7b35703e-2f3f-41a3-9faf-750c375c7700', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 44, 'The reaction of a primary alcohol with concentrated H2SO4 at high temperature (above 170 degrees C) primarily produces:', 'Chemistry', 'Alcohols, Phenols and Ethers', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('463103fc-89e5-4290-87a1-a73716722095', '7b35703e-2f3f-41a3-9faf-750c375c7700', 0, 'An ether via intermolecular dehydration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9322324-793d-4336-8627-c9824d0224a3', '7b35703e-2f3f-41a3-9faf-750c375c7700', 1, 'An alkene via intramolecular dehydration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eaef0c9d-b0c0-453f-b1a3-ab3b17cd9845', '7b35703e-2f3f-41a3-9faf-750c375c7700', 2, 'A carboxylic acid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2185f4c0-038d-4126-a2cc-0cbc4534a7bd', '7b35703e-2f3f-41a3-9faf-750c375c7700', 3, 'An aldehyde');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7b35703e-2f3f-41a3-9faf-750c375c7700', 'a9322324-793d-4336-8627-c9824d0224a3', 'At higher temperatures (above ~170 degrees C), concentrated H2SO4 promotes intramolecular dehydration of an alcohol, eliminating water to form an alkene; at lower temperatures, intermolecular dehydration to form an ether is favored instead.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4649cf4d-3e49-43a6-9198-01a32aa66c2b', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 45, 'The type of linkage joining amino acids together in a protein is called a:', 'Chemistry', 'Biomolecules', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbb5fd91-0be5-4345-8837-8912ba63e7b8', '4649cf4d-3e49-43a6-9198-01a32aa66c2b', 0, 'Glycosidic linkage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb7a6d43-3feb-493a-b5c5-f1ad244dfefb', '4649cf4d-3e49-43a6-9198-01a32aa66c2b', 1, 'Peptide linkage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef441205-1dda-4824-8129-4dd7b8c7ce96', '4649cf4d-3e49-43a6-9198-01a32aa66c2b', 2, 'Phosphodiester linkage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc51a79a-b9e6-49dc-a8ef-26eef57c8e2b', '4649cf4d-3e49-43a6-9198-01a32aa66c2b', 3, 'Hydrogen bond');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4649cf4d-3e49-43a6-9198-01a32aa66c2b', 'fb7a6d43-3feb-493a-b5c5-f1ad244dfefb', 'Amino acids are joined by peptide (amide) linkages, formed via condensation between the carboxyl group of one amino acid and the amino group of the next.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a2d58f30-d012-49a7-bf4a-176b76869195', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 46, 'The number of moles present in 88 grams of CO2 (molar mass 44 g/mol) is:', 'Chemistry', 'Some Basic Concepts of Chemistry — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('a2d58f30-d012-49a7-bf4a-176b76869195', 2, 'Moles = mass/molar mass = 88/44 = 2 mol.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7846529e-fd6c-47df-a644-0b43f2e68f9b', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 47, 'The pOH of a solution with hydroxide ion concentration [OH-] = 10^-4 M is:', 'Chemistry', 'Equilibrium — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('7846529e-fd6c-47df-a644-0b43f2e68f9b', 4, 'pOH = -log[OH-] = -log(10^-4) = 4.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f66412bd-70cc-4bd8-8988-93ab0b2ef2f0', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 48, 'If a system absorbs 800 J of heat and its internal energy increases by 600 J, the work done by the system (in joules) is:', 'Chemistry', 'Thermodynamics — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('f66412bd-70cc-4bd8-8988-93ab0b2ef2f0', 200, 'By the first law, delta U = Q - W, so W = Q - delta U = 800 - 600 = 200 J.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bc5c0500-0df0-4fa8-b299-5e9f00dbb230', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 49, 'Using Faraday''s constant F = 96500 C/mol, the charge (in coulombs) required to deposit 1 mole of a monovalent metal ion is:', 'Chemistry', 'Electrochemistry — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('bc5c0500-0df0-4fa8-b299-5e9f00dbb230', 96500, 'For a monovalent ion (n=1), charge required = n*F = 1*96500 = 96500 C.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ebc26ad0-af98-42ac-8381-563cd8f5a8eb', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 50, 'A first-order reaction has a rate constant of 0.0693 per minute. Its half-life (in minutes) is:', 'Chemistry', 'Chemical Kinetics — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('ebc26ad0-af98-42ac-8381-563cd8f5a8eb', 10, 't(1/2) = 0.693/k = 0.693/0.0693 = 10 minutes.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Mathematics (25 questions) — Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1910b11f-7d5b-47d2-bf56-6edd63230381', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 51, 'If f(x) = 2x+3, then f(f(2)) is:', 'Mathematics', 'Sets, Relations and Functions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c2bfd6d-1831-4763-91a8-25eaee5e49ab', '1910b11f-7d5b-47d2-bf56-6edd63230381', 0, '13');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c170ee9a-0718-44a7-a76b-b54a7062987f', '1910b11f-7d5b-47d2-bf56-6edd63230381', 1, '17');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b744a09-7825-4557-9c7a-9c176b62018a', '1910b11f-7d5b-47d2-bf56-6edd63230381', 2, '19');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02064101-948f-44de-9e0b-c1e26ae2af7b', '1910b11f-7d5b-47d2-bf56-6edd63230381', 3, '21');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1910b11f-7d5b-47d2-bf56-6edd63230381', 'c170ee9a-0718-44a7-a76b-b54a7062987f', 'f(2) = 2(2)+3 = 7; f(7) = 2(7)+3 = 17.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('04bc6230-3597-4a2c-8082-2e0f5c21a56a', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 52, 'The value of i^4n+3, where n is a positive integer and i=sqrt(-1), is:', 'Mathematics', 'Complex Numbers', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81b259cd-3604-403d-8da7-aa9ed94b0398', '04bc6230-3597-4a2c-8082-2e0f5c21a56a', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75f3cc26-b8c4-4759-bded-63f3d0c5a39e', '04bc6230-3597-4a2c-8082-2e0f5c21a56a', 1, '-1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('594de0a4-9122-4386-8b86-a6949a2d5ebe', '04bc6230-3597-4a2c-8082-2e0f5c21a56a', 2, 'i');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a1d0a94-eb95-4a2f-9b20-d467ca22dc5d', '04bc6230-3597-4a2c-8082-2e0f5c21a56a', 3, '-i');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('04bc6230-3597-4a2c-8082-2e0f5c21a56a', '3a1d0a94-eb95-4a2f-9b20-d467ca22dc5d', 'i^4n = 1 for any integer n; i^(4n+3) = i^4n * i^3 = 1 * (-i) = -i.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4e65c0c7-2554-491d-9bed-04025402c4e2', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 53, 'For the quadratic equation x^2 - 5x + 6 = 0, the roots are:', 'Mathematics', 'Quadratic Equations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f65a107e-ed82-4135-a83d-4d6fb3c733d2', '4e65c0c7-2554-491d-9bed-04025402c4e2', 0, '1, 6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2944affc-472d-4499-b9fd-1160a8c4920d', '4e65c0c7-2554-491d-9bed-04025402c4e2', 1, '2, 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9fc68a2-c6b8-429f-b89d-61b0719bf91d', '4e65c0c7-2554-491d-9bed-04025402c4e2', 2, '-2, -3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13b5018e-3c3d-4dc3-b74b-50200714ea0d', '4e65c0c7-2554-491d-9bed-04025402c4e2', 3, '5, 1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4e65c0c7-2554-491d-9bed-04025402c4e2', '2944affc-472d-4499-b9fd-1160a8c4920d', 'Factoring: (x-2)(x-3)=0, giving roots x=2 and x=3.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cf9dd233-b43b-468a-9450-294a515a9d04', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 54, 'The number of permutations of the letters of the word ''CAT'' is:', 'Mathematics', 'Permutations and Combinations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31d1a6dd-c3db-459b-9f72-1128b3339995', 'cf9dd233-b43b-468a-9450-294a515a9d04', 0, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3be2a15e-b401-4440-9c1c-130b428eb068', 'cf9dd233-b43b-468a-9450-294a515a9d04', 1, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82b465a8-a0a9-455a-a728-674b193cf887', 'cf9dd233-b43b-468a-9450-294a515a9d04', 2, '9');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a159237e-efed-4c53-95af-543f8de0f980', 'cf9dd233-b43b-468a-9450-294a515a9d04', 3, '27');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cf9dd233-b43b-468a-9450-294a515a9d04', '3be2a15e-b401-4440-9c1c-130b428eb068', 'For 3 distinct letters, the number of permutations is 3! = 6.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('77b062af-5dd5-4fa4-8250-ce05cb2a4a49', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 55, 'The coefficient of x^2 in the expansion of (1+x)^5 is:', 'Mathematics', 'Binomial Theorem', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('edf1d4dc-9b6b-40da-8746-3361599dce89', '77b062af-5dd5-4fa4-8250-ce05cb2a4a49', 0, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('191da418-add6-4271-8d5d-d3a0d7dc4ee2', '77b062af-5dd5-4fa4-8250-ce05cb2a4a49', 1, '10');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24d2ce48-c49e-46d9-82e9-ad0079f32a6c', '77b062af-5dd5-4fa4-8250-ce05cb2a4a49', 2, '15');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b73e4658-5b76-4738-9f32-02ddb182e632', '77b062af-5dd5-4fa4-8250-ce05cb2a4a49', 3, '20');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('77b062af-5dd5-4fa4-8250-ce05cb2a4a49', '191da418-add6-4271-8d5d-d3a0d7dc4ee2', 'The coefficient of x^r in (1+x)^n is C(n,r); here C(5,2) = 10.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('dc897863-a7a9-4b6c-912c-c6b91059626f', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 56, 'The sum to infinity of the geometric series 1 + 1/2 + 1/4 + 1/8 + ... is:', 'Mathematics', 'Sequences and Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1103fae-36df-4c84-9ad5-13646b8fc956', 'dc897863-a7a9-4b6c-912c-c6b91059626f', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf57a95d-88c8-490f-8658-5d0b2396b1a4', 'dc897863-a7a9-4b6c-912c-c6b91059626f', 1, '1.5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4462352-b931-4f50-b491-1d9e3dff7e0b', 'dc897863-a7a9-4b6c-912c-c6b91059626f', 2, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6eec1f7a-f444-4ee6-8911-d870d6808404', 'dc897863-a7a9-4b6c-912c-c6b91059626f', 3, 'infinity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dc897863-a7a9-4b6c-912c-c6b91059626f', 'f4462352-b931-4f50-b491-1d9e3dff7e0b', 'For |r|<1, sum to infinity = a/(1-r) = 1/(1-0.5) = 2.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0b373fdb-ab26-4a41-9c9f-fe5e1c7f88f7', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 57, 'The derivative of x^3 with respect to x is:', 'Mathematics', 'Limits, Continuity and Differentiability', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a42b3471-df4d-41b2-8825-34d402163824', '0b373fdb-ab26-4a41-9c9f-fe5e1c7f88f7', 0, 'x^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23307776-0635-4f5f-9b65-eddd28c13cc5', '0b373fdb-ab26-4a41-9c9f-fe5e1c7f88f7', 1, '3x');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9efe7c8f-c7ea-48ae-b2eb-d1373594d949', '0b373fdb-ab26-4a41-9c9f-fe5e1c7f88f7', 2, '3x^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19dd689a-a47e-416b-8285-d28dacfa7e3a', '0b373fdb-ab26-4a41-9c9f-fe5e1c7f88f7', 3, 'x^3/3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0b373fdb-ab26-4a41-9c9f-fe5e1c7f88f7', '9efe7c8f-c7ea-48ae-b2eb-d1373594d949', 'd/dx(x^n) = n*x^(n-1); for n=3, this gives 3x^2.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('12ff46c7-fe1b-45b8-a3a2-079e7970f58a', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 58, 'The integral of cos(x) dx is:', 'Mathematics', 'Integral Calculus', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c1305b5-995d-4934-b2d4-222266281926', '12ff46c7-fe1b-45b8-a3a2-079e7970f58a', 0, 'sin(x) + C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bf67602b-a8d5-4670-9975-63ebcaca3351', '12ff46c7-fe1b-45b8-a3a2-079e7970f58a', 1, '-sin(x) + C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68fc33ec-4e15-4fa9-97c9-78d963981fa7', '12ff46c7-fe1b-45b8-a3a2-079e7970f58a', 2, '-cos(x) + C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7988ee1-21db-49f8-8cfe-77c426af5ddd', '12ff46c7-fe1b-45b8-a3a2-079e7970f58a', 3, 'tan(x) + C');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('12ff46c7-fe1b-45b8-a3a2-079e7970f58a', '4c1305b5-995d-4934-b2d4-222266281926', 'The standard integral of cos(x) is sin(x) + C.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('00cfd612-9d38-4992-a83b-8b387f3b60fa', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 59, 'The differential equation dy/dx = y is a linear differential equation whose general solution is:', 'Mathematics', 'Differential Equations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a7b14eb-90cb-4d96-ab51-f4856b4acfb0', '00cfd612-9d38-4992-a83b-8b387f3b60fa', 0, 'y = Ce^x');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4e3bdeb-bb72-4b3c-8a17-8606b5ef8dea', '00cfd612-9d38-4992-a83b-8b387f3b60fa', 1, 'y = Cx');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('957103b5-67c1-4900-9c0b-e0da47a49a0b', '00cfd612-9d38-4992-a83b-8b387f3b60fa', 2, 'y = C/x');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82bcee87-8261-491f-aff2-4de55cd50297', '00cfd612-9d38-4992-a83b-8b387f3b60fa', 3, 'y = C*sin(x)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('00cfd612-9d38-4992-a83b-8b387f3b60fa', '6a7b14eb-90cb-4d96-ab51-f4856b4acfb0', 'Separating variables: dy/y = dx, integrating gives ln(y) = x + c, so y = Ce^x.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7b8e6a6e-2803-4a44-b215-917b440d7367', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 60, 'The equation of a line with slope 2 passing through the point (1,3) is:', 'Mathematics', 'Coordinate Geometry — Straight Lines', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ace32cd-c7c3-427a-b21f-0a24b7b90b17', '7b8e6a6e-2803-4a44-b215-917b440d7367', 0, 'y = 2x + 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3b1df13-baeb-4b84-8bd4-8a27a9b935af', '7b8e6a6e-2803-4a44-b215-917b440d7367', 1, 'y = 2x - 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4366127b-a8cc-4a86-ad1b-d148731a18bb', '7b8e6a6e-2803-4a44-b215-917b440d7367', 2, 'y = 2x + 3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('757af658-ff0c-491e-a1c8-b2dc8c2fbeea', '7b8e6a6e-2803-4a44-b215-917b440d7367', 3, 'y = 2x + 5');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7b8e6a6e-2803-4a44-b215-917b440d7367', '0ace32cd-c7c3-427a-b21f-0a24b7b90b17', 'Using point-slope form: y - 3 = 2(x - 1), which simplifies to y = 2x - 2 + 3 = 2x + 1.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ad5aba41-6313-4955-86fa-c9cf591537b8', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 61, 'The radius of the circle x^2 + y^2 - 6x - 8y = 0 is:', 'Mathematics', 'Coordinate Geometry — Circles', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('61a1e922-9c6a-46c1-9632-cb47aa7ec06e', 'ad5aba41-6313-4955-86fa-c9cf591537b8', 0, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e250338d-532a-4b6f-9ebc-2726eff367b4', 'ad5aba41-6313-4955-86fa-c9cf591537b8', 1, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb0601f8-1345-4f05-95e0-38020aa3ae23', 'ad5aba41-6313-4955-86fa-c9cf591537b8', 2, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02368141-40e8-4103-b7b7-a049b90f6084', 'ad5aba41-6313-4955-86fa-c9cf591537b8', 3, '10');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ad5aba41-6313-4955-86fa-c9cf591537b8', 'eb0601f8-1345-4f05-95e0-38020aa3ae23', 'Rewriting: (x-3)^2 + (y-4)^2 = 9+16 = 25, so radius = sqrt(25) = 5.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('da2ac4ac-cdc6-411f-acf2-07724ad10065', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 62, 'For the ellipse x^2/25 + y^2/16 = 1, the length of the major axis is:', 'Mathematics', 'Conic Sections — Ellipse', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e91ea462-cb5a-48b6-9897-35d91c22b1ac', 'da2ac4ac-cdc6-411f-acf2-07724ad10065', 0, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e49d46e1-aff3-498e-a134-f0b80aa80d5f', 'da2ac4ac-cdc6-411f-acf2-07724ad10065', 1, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0e27a93-1a8c-4d38-91e7-44b98c23dfb2', 'da2ac4ac-cdc6-411f-acf2-07724ad10065', 2, '10');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41cfe36d-b7c2-449f-b9ca-d4dc1123d994', 'da2ac4ac-cdc6-411f-acf2-07724ad10065', 3, '16');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('da2ac4ac-cdc6-411f-acf2-07724ad10065', 'a0e27a93-1a8c-4d38-91e7-44b98c23dfb2', 'Since a^2=25 (a=5) is larger than b^2=16, the major axis length is 2a = 10.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('44afffa6-44d7-46f5-b91e-839583277a19', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 63, 'The direction cosines of the x-axis are:', 'Mathematics', '3D Geometry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f24c6699-da6b-45eb-997f-cbd444e2da59', '44afffa6-44d7-46f5-b91e-839583277a19', 0, '(1,0,0)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd4e86aa-c148-4a1b-924f-763de88aad4d', '44afffa6-44d7-46f5-b91e-839583277a19', 1, '(0,1,0)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('acdd4304-9bd0-4da1-ba35-3b66e80578f0', '44afffa6-44d7-46f5-b91e-839583277a19', 2, '(0,0,1)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2148c781-0af3-4e04-9010-abd0025e03f3', '44afffa6-44d7-46f5-b91e-839583277a19', 3, '(1,1,1)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('44afffa6-44d7-46f5-b91e-839583277a19', 'f24c6699-da6b-45eb-997f-cbd444e2da59', 'The x-axis makes an angle of 0 degrees with itself and 90 degrees with the y and z axes, giving direction cosines (cos0, cos90, cos90) = (1,0,0).', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('dc5ff501-047d-401c-a82b-67b46d1c2308', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 64, 'The magnitude of the vector a = 2i - 3j + 6k is:', 'Mathematics', 'Vector Algebra', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f19ac9c1-e90d-443f-a4dd-184fc0758345', 'dc5ff501-047d-401c-a82b-67b46d1c2308', 0, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c4fefe0-c9f8-4f8d-94c8-1c151d5c8c05', 'dc5ff501-047d-401c-a82b-67b46d1c2308', 1, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec34fee9-5713-4373-8492-8b2b5a5340e2', 'dc5ff501-047d-401c-a82b-67b46d1c2308', 2, '7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d6a3e22-341d-4908-9a3c-88a67ef93cb1', 'dc5ff501-047d-401c-a82b-67b46d1c2308', 3, '11');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dc5ff501-047d-401c-a82b-67b46d1c2308', 'ec34fee9-5713-4373-8492-8b2b5a5340e2', '|a| = sqrt(2^2+(-3)^2+6^2) = sqrt(4+9+36) = sqrt(49) = 7.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('48465560-478a-408d-95a2-48e1d12e3929', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 65, 'Two dice are rolled. The probability of getting a sum of 7 is:', 'Mathematics', 'Statistics and Probability', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2f333d6-a60d-43c8-9bef-1c0a3e724d3a', '48465560-478a-408d-95a2-48e1d12e3929', 0, '1/36');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92acac97-5023-4df0-87c2-f00b335a82ac', '48465560-478a-408d-95a2-48e1d12e3929', 1, '1/6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d08b6e2-f735-4f64-9819-c953de91848b', '48465560-478a-408d-95a2-48e1d12e3929', 2, '1/12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b650a8e1-525f-4b1c-9e68-221857492d0f', '48465560-478a-408d-95a2-48e1d12e3929', 3, '1/9');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('48465560-478a-408d-95a2-48e1d12e3929', '92acac97-5023-4df0-87c2-f00b335a82ac', 'There are 6 favorable outcomes ((1,6),(2,5),(3,4),(4,3),(5,2),(6,1)) out of 36 total outcomes, giving 6/36 = 1/6.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cfca21fb-ed5e-4aac-a700-fe74231aee5e', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 66, 'The value of cos(0 degrees) + sin(90 degrees) is:', 'Mathematics', 'Trigonometry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6f25e03-fd44-486c-b404-39fdd007151b', 'cfca21fb-ed5e-4aac-a700-fe74231aee5e', 0, '0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80afd679-25a1-4c03-bdd6-c0321b78321e', 'cfca21fb-ed5e-4aac-a700-fe74231aee5e', 1, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d92b1dd-a094-4d60-818f-8060b5233dcb', 'cfca21fb-ed5e-4aac-a700-fe74231aee5e', 2, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78e5e46c-a31b-4bdb-9a21-e769149cfece', 'cfca21fb-ed5e-4aac-a700-fe74231aee5e', 3, '-1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cfca21fb-ed5e-4aac-a700-fe74231aee5e', '5d92b1dd-a094-4d60-818f-8060b5233dcb', 'cos(0) = 1 and sin(90) = 1, so their sum is 1+1 = 2.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('dad20dbd-137e-4d99-a1bf-d19123a0aefc', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 67, 'If A is a 2x2 matrix with determinant 5, the determinant of 2A is:', 'Mathematics', 'Matrices and Determinants', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4529b52b-139c-4d8e-a6fe-128bf6b76753', 'dad20dbd-137e-4d99-a1bf-d19123a0aefc', 0, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b312706-52b3-4534-9538-27219a9698d4', 'dad20dbd-137e-4d99-a1bf-d19123a0aefc', 1, '10');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f272da5-cad0-4fb2-9ff4-92ec882dcd0a', 'dad20dbd-137e-4d99-a1bf-d19123a0aefc', 2, '20');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('29ca287f-48bf-4b17-a278-4be9d42c03e1', 'dad20dbd-137e-4d99-a1bf-d19123a0aefc', 3, '25');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dad20dbd-137e-4d99-a1bf-d19123a0aefc', '5f272da5-cad0-4fb2-9ff4-92ec882dcd0a', 'For an n x n matrix, det(kA) = k^n * det(A); here n=2, k=2, so det(2A) = 2^2 * 5 = 20.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cafb34ea-0c3f-4e8f-905a-6aa729e2bee7', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 68, 'The statement ''If it rains, then the ground gets wet'' has the converse:', 'Mathematics', 'Mathematical Reasoning', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28ec4a4b-9696-44b5-a472-b287884f2aae', 'cafb34ea-0c3f-4e8f-905a-6aa729e2bee7', 0, 'If it does not rain, the ground does not get wet');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0543ea4-5e86-40c0-9e4a-1dad33f2a5bc', 'cafb34ea-0c3f-4e8f-905a-6aa729e2bee7', 1, 'If the ground gets wet, then it rains');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfddb38a-8160-43ff-826d-90d0d90a9070', 'cafb34ea-0c3f-4e8f-905a-6aa729e2bee7', 2, 'It does not rain and the ground is wet');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('29eaeb68-91b4-461c-9bde-a983bd9418ca', 'cafb34ea-0c3f-4e8f-905a-6aa729e2bee7', 3, 'If it rains, the ground does not get wet');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cafb34ea-0c3f-4e8f-905a-6aa729e2bee7', 'b0543ea4-5e86-40c0-9e4a-1dad33f2a5bc', 'The converse of ''If P then Q'' is ''If Q then P'' — here, ''If the ground gets wet, then it rains''.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('184f5686-bda3-4c10-8c22-e27b3897867d', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 69, 'The function f(x) = x^3 - 3x has a local maximum at x equal to:', 'Mathematics', 'Application of Derivatives', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('339254c7-bb70-4fc8-adaa-acd3fe740fec', '184f5686-bda3-4c10-8c22-e27b3897867d', 0, '-1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4db316c9-f957-4a3f-ad8c-fc7a29218537', '184f5686-bda3-4c10-8c22-e27b3897867d', 1, '0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('adc4e3b7-55c6-455e-aff7-2b36d248f6c2', '184f5686-bda3-4c10-8c22-e27b3897867d', 2, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1436155f-6cbd-4663-807b-88f018f7cc9d', '184f5686-bda3-4c10-8c22-e27b3897867d', 3, '3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('184f5686-bda3-4c10-8c22-e27b3897867d', '339254c7-bb70-4fc8-adaa-acd3fe740fec', 'f''(x) = 3x^2-3 = 0 at x=±1; f''''(x)=6x, which is negative at x=-1 (confirming a maximum) and positive at x=1 (a minimum).', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5bd75a63-f2c8-48ea-bf38-1faf0cbfdd2d', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 70, 'The area bounded by the curve y=x^2, the x-axis, and the lines x=0 and x=3 is:', 'Mathematics', 'Application of Integrals', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3290f610-b1d8-4d8c-8a06-33589926e907', '5bd75a63-f2c8-48ea-bf38-1faf0cbfdd2d', 0, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be2b2642-fc11-42c4-85c1-32805bfd3592', '5bd75a63-f2c8-48ea-bf38-1faf0cbfdd2d', 1, '9');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f99c85b2-210e-4635-b93e-31cd106f033c', '5bd75a63-f2c8-48ea-bf38-1faf0cbfdd2d', 2, '27');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9edf0d53-0aaa-4b24-8aad-f1b1cbb9af44', '5bd75a63-f2c8-48ea-bf38-1faf0cbfdd2d', 3, '6');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5bd75a63-f2c8-48ea-bf38-1faf0cbfdd2d', 'be2b2642-fc11-42c4-85c1-32805bfd3592', 'Area = integral of x^2 dx from 0 to 3 = [x^3/3] from 0 to 3 = 27/3 - 0 = 9.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8759e284-e697-4cae-aa68-09cf499c1ad1', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 71, 'The sum of the first 5 terms of the geometric series 2, 4, 8, 16, ... is:', 'Mathematics', 'Sequences and Series — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('8759e284-e697-4cae-aa68-09cf499c1ad1', 62, 'S_n = a(r^n - 1)/(r-1) = 2(2^5-1)/(2-1) = 2*31 = 62.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1e888a38-4bbf-43b4-b7e1-d2e14987241a', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 72, 'The value of 5! (5 factorial) is:', 'Mathematics', 'Permutations and Combinations — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('1e888a38-4bbf-43b4-b7e1-d2e14987241a', 120, '5! = 5*4*3*2*1 = 120.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bd8eb8a5-575b-4e80-8280-061bdedd0e6b', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 73, 'The value of the definite integral of 3x^2 dx from 0 to 2 is:', 'Mathematics', 'Integral Calculus — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('bd8eb8a5-575b-4e80-8280-061bdedd0e6b', 8, 'Integral of 3x^2 dx = x^3; evaluating from 0 to 2 gives 8 - 0 = 8.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('60f729d9-3086-46bd-8f7c-5f8124556293', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 74, 'The value of sin^2(30 degrees) + cos^2(30 degrees) is:', 'Mathematics', 'Trigonometry — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('60f729d9-3086-46bd-8f7c-5f8124556293', 1, 'By the Pythagorean identity, sin^2(theta) + cos^2(theta) = 1 for any angle theta.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b90c69ce-ade9-4819-9fad-f972336e1397', '68c083dc-12a6-4ea0-b3c9-e6d59e579806', 75, 'The variance of the numbers 2, 4, 6 (mean 4) is:', 'Mathematics', 'Statistics and Probability — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('b90c69ce-ade9-4819-9fad-f972336e1397', 2.67, 'Variance = [(2-4)^2+(4-4)^2+(6-4)^2]/3 = [4+0+4]/3 = 8/3 ≈ 2.67.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');
