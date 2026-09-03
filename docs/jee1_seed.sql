-- ============================================================
-- JEE Main — Full Mock Paper 1
-- Full-Length Practice Paper (75 questions, 180 minutes)
-- Marking: +4 correct / -1 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('3d50423e-abe5-4e1f-bc95-b54265aa5462', 'jee-main-practice-1', 'JEE Main Full Mock Paper 1', 'jee-main', ARRAY['Physics', 'Chemistry', 'Mathematics', 'NCERT', 'JEE Main']::TEXT[], 75, 'mixed', true, 1, 180, 4, 1);

-- ── Section: Physics (25 questions) — Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3eed70da-f496-4197-9020-915c27259db4', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 1, 'The dimensional formula of Planck''s constant is the same as that of:', 'Physics', 'Units and Measurements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1805aaa3-54d5-48b7-8807-9463b4f784dc', '3eed70da-f496-4197-9020-915c27259db4', 0, 'Energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20b2232f-d9dc-417b-badf-1fc41271057b', '3eed70da-f496-4197-9020-915c27259db4', 1, 'Angular momentum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b6c5177-3384-48a0-b4ed-297d08edb06a', '3eed70da-f496-4197-9020-915c27259db4', 2, 'Force');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e40ab19-4a7c-49bb-bbf6-e556a7e4183f', '3eed70da-f496-4197-9020-915c27259db4', 3, 'Power');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3eed70da-f496-4197-9020-915c27259db4', '20b2232f-d9dc-417b-badf-1fc41271057b', 'Planck''s constant h has units of J.s, identical to the dimensional formula of angular momentum [ML^2T^-1].', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1911d09b-2af9-48d2-85f2-12eb47488101', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 2, 'A particle moves along a straight line such that its displacement varies as s = t^3 - 6t^2 + 9t. The time at which its velocity is zero is:', 'Physics', 'Kinematics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47a98c5e-cbf3-4b87-8938-e6ea6d07772d', '1911d09b-2af9-48d2-85f2-12eb47488101', 0, 't=1s only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46795a4e-4bca-485c-8153-443e77f64ab5', '1911d09b-2af9-48d2-85f2-12eb47488101', 1, 't=1s and t=3s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66d51327-363f-4ecf-a464-3293310a26c8', '1911d09b-2af9-48d2-85f2-12eb47488101', 2, 't=0 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c8a098e-178e-4b7f-8b76-2e9ddef773e1', '1911d09b-2af9-48d2-85f2-12eb47488101', 3, 't=2s only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1911d09b-2af9-48d2-85f2-12eb47488101', '46795a4e-4bca-485c-8153-443e77f64ab5', 'v = ds/dt = 3t^2 - 12t + 9 = 3(t-1)(t-3); v=0 at t=1s and t=3s.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ac86c84e-b215-44a2-8340-0d95cbbdd4ef', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 3, 'A block of mass 2 kg rests on a frictionless surface and is acted on by a horizontal force of 10 N. The acceleration of the block is:', 'Physics', 'Laws of Motion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c06d4106-8917-4d92-9381-04be92836a56', 'ac86c84e-b215-44a2-8340-0d95cbbdd4ef', 0, '2 m/s^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d70e68c-0b40-4e96-b133-ffef274f21a0', 'ac86c84e-b215-44a2-8340-0d95cbbdd4ef', 1, '5 m/s^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04e931ab-e168-4f8f-bca3-41109c610b95', 'ac86c84e-b215-44a2-8340-0d95cbbdd4ef', 2, '10 m/s^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67e30dfe-03e4-465c-a599-c4ae3aa22edb', 'ac86c84e-b215-44a2-8340-0d95cbbdd4ef', 3, '20 m/s^2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ac86c84e-b215-44a2-8340-0d95cbbdd4ef', '3d70e68c-0b40-4e96-b133-ffef274f21a0', 'a = F/m = 10/2 = 5 m/s^2, by Newton''s second law.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('04b583b3-4055-40b4-90d0-8834dcf33e45', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 4, 'A body of mass 1 kg is dropped from a height of 5 m. Its kinetic energy just before hitting the ground (taking g=10 m/s^2) is:', 'Physics', 'Work, Energy and Power', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91138e62-06a6-4286-926c-c185622ae159', '04b583b3-4055-40b4-90d0-8834dcf33e45', 0, '25 J');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0dbc95a0-c03b-451b-badc-83e673f38bb4', '04b583b3-4055-40b4-90d0-8834dcf33e45', 1, '50 J');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('71085595-49e8-4b1d-9eec-c553c5cb223c', '04b583b3-4055-40b4-90d0-8834dcf33e45', 2, '100 J');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59f0e213-604f-4b0f-9d19-e88c82e71f58', '04b583b3-4055-40b4-90d0-8834dcf33e45', 3, '10 J');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('04b583b3-4055-40b4-90d0-8834dcf33e45', '0dbc95a0-c03b-451b-badc-83e673f38bb4', 'By conservation of energy, KE = mgh = 1*10*5 = 50 J.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7954544d-134c-4500-a707-cf02d59dd0e3', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 5, 'The moment of inertia of a solid sphere of mass M and radius R about a tangent to its surface is:', 'Physics', 'System of Particles and Rotational Motion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5b9ddf4-71c2-4bae-a6f8-9cf8467003d5', '7954544d-134c-4500-a707-cf02d59dd0e3', 0, '(2/5)MR^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8cd0d5b1-c2c0-4808-a0eb-ba975a51643d', '7954544d-134c-4500-a707-cf02d59dd0e3', 1, '(7/5)MR^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('869a9aa6-0f4c-4f14-b2fa-397b67262f2a', '7954544d-134c-4500-a707-cf02d59dd0e3', 2, '(2/3)MR^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0f5324b-f7a5-4830-b047-03190f2bf21a', '7954544d-134c-4500-a707-cf02d59dd0e3', 3, 'MR^2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7954544d-134c-4500-a707-cf02d59dd0e3', '8cd0d5b1-c2c0-4808-a0eb-ba975a51643d', 'Using the parallel axis theorem: I_tangent = I_center + MR^2 = (2/5)MR^2 + MR^2 = (7/5)MR^2.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('60cc8a99-3b03-4df5-a2e3-fb656ea90221', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 6, 'If the radius of the Earth were to shrink by 1% while its mass remains constant, the acceleration due to gravity on its surface would:', 'Physics', 'Gravitation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98bd9239-f0b9-402b-971f-bf2c9e478f1b', '60cc8a99-3b03-4df5-a2e3-fb656ea90221', 0, 'Decrease by about 1%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef65ca39-0260-491e-a7c7-caa71f3dfa55', '60cc8a99-3b03-4df5-a2e3-fb656ea90221', 1, 'Decrease by about 2%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d54d35ee-7228-42c5-8ee3-12bd7657b19f', '60cc8a99-3b03-4df5-a2e3-fb656ea90221', 2, 'Increase by about 2%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26e215fa-6a55-4b4b-8f7f-f26861eae0f8', '60cc8a99-3b03-4df5-a2e3-fb656ea90221', 3, 'Remain unchanged');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('60cc8a99-3b03-4df5-a2e3-fb656ea90221', 'd54d35ee-7228-42c5-8ee3-12bd7657b19f', 'g = GM/R^2; since g is inversely proportional to R^2, a 1% decrease in R increases g by approximately 2% (differentiating: dg/g = -2dR/R).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('dd376ee5-c94d-470b-aeb8-55cce26559b6', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 7, 'A wire of length L and cross-sectional area A is stretched by a force F, producing an extension x. Young''s modulus of the wire''s material is given by:', 'Physics', 'Mechanical Properties of Solids', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ac09ef8-af4f-4eb2-ab38-cd149ae45fed', 'dd376ee5-c94d-470b-aeb8-55cce26559b6', 0, 'FL/(Ax)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f083ff4c-06fe-4042-ab2c-e2ffbbb7e67d', 'dd376ee5-c94d-470b-aeb8-55cce26559b6', 1, 'Fx/(AL)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a757094-72db-499b-ab2f-b884a2f220df', 'dd376ee5-c94d-470b-aeb8-55cce26559b6', 2, 'FA/(Lx)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c5608e2-d5f1-4da9-9ee0-9a55d4bfeb14', 'dd376ee5-c94d-470b-aeb8-55cce26559b6', 3, 'F/(ALx)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dd376ee5-c94d-470b-aeb8-55cce26559b6', '5ac09ef8-af4f-4eb2-ab38-cd149ae45fed', 'Y = (F/A)/(x/L) = FL/(Ax), the standard definition of Young''s modulus.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d40ea321-e7f0-4060-b8b6-278e359b1fd4', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 8, 'Two rods of the same material and cross-sectional area but different lengths L and 2L are connected in series between two heat reservoirs at different temperatures. In steady state, the ratio of the temperature drop across the shorter rod to that across the longer rod is:', 'Physics', 'Thermal Properties of Matter', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bfad1b05-eaef-4ca3-962f-8692b6cb828b', 'd40ea321-e7f0-4060-b8b6-278e359b1fd4', 0, '1:2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d53fbd3-3bcb-44fe-9626-2cda600daab4', 'd40ea321-e7f0-4060-b8b6-278e359b1fd4', 1, '2:1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e234c28-1125-4a26-a497-b5da1e52f272', 'd40ea321-e7f0-4060-b8b6-278e359b1fd4', 2, '1:1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62438b3a-b7ef-49f4-8bbc-59298f8285b9', 'd40ea321-e7f0-4060-b8b6-278e359b1fd4', 3, '1:4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d40ea321-e7f0-4060-b8b6-278e359b1fd4', 'bfad1b05-eaef-4ca3-962f-8692b6cb828b', 'In steady-state series conduction, the same heat current flows through both rods; since thermal resistance is proportional to length, the temperature drop is also proportional to length, giving a ratio of L:2L = 1:2.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0b77845a-4bde-42f8-b5b0-988ad06ed8cb', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 9, 'For an ideal monatomic gas undergoing an adiabatic process, the relationship between pressure P and volume V is given by PV^gamma = constant, where gamma equals:', 'Physics', 'Thermodynamics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86dc1b8a-c3a3-4272-a18b-3e3e00fef4ae', '0b77845a-4bde-42f8-b5b0-988ad06ed8cb', 0, '1.4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d94faaab-fee2-4487-9942-afbc1aa0c7fe', '0b77845a-4bde-42f8-b5b0-988ad06ed8cb', 1, '1.67');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e5475df-dd90-476a-8b12-115d522e70f3', '0b77845a-4bde-42f8-b5b0-988ad06ed8cb', 2, '1.33');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89c96d49-6858-47d4-ba10-98644bfe4af1', '0b77845a-4bde-42f8-b5b0-988ad06ed8cb', 3, '1.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0b77845a-4bde-42f8-b5b0-988ad06ed8cb', 'd94faaab-fee2-4487-9942-afbc1aa0c7fe', 'For a monatomic ideal gas, gamma = Cp/Cv = (5/2R)/(3/2R) = 5/3 ≈ 1.67.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8180b4bb-b7dc-4f27-9dd2-61c267f5ea60', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 10, 'At what temperature will the root mean square speed of oxygen molecules be double its value at 27 degrees Celsius, all other conditions remaining constant?', 'Physics', 'Kinetic Theory', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cdc7986b-3a73-47c0-bc98-7e6b66201c65', '8180b4bb-b7dc-4f27-9dd2-61c267f5ea60', 0, '1200 K');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f908a56a-0cde-4b5f-bfb0-e2de0ffe3571', '8180b4bb-b7dc-4f27-9dd2-61c267f5ea60', 1, '927 degrees Celsius');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43e9010d-3185-4ce0-b38d-03088510d2e6', '8180b4bb-b7dc-4f27-9dd2-61c267f5ea60', 2, '600 K');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('417168a3-a4a1-4b5d-8c8d-d9bfdc4aa91a', '8180b4bb-b7dc-4f27-9dd2-61c267f5ea60', 3, '54 degrees Celsius');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8180b4bb-b7dc-4f27-9dd2-61c267f5ea60', 'f908a56a-0cde-4b5f-bfb0-e2de0ffe3571', 'v_rms is proportional to sqrt(T); to double v_rms, T must quadruple. 27C = 300K, so 4*300K = 1200K = 927 degrees Celsius.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('53c3346c-af73-42f9-bbf2-4cab9f8cf5bb', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 11, 'A particle executes SHM with amplitude A and angular frequency omega. Its speed at a displacement of A/2 from the mean position is:', 'Physics', 'Oscillations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01af9d23-c7c5-420c-baeb-77a252bba459', '53c3346c-af73-42f9-bbf2-4cab9f8cf5bb', 0, 'omega*A*sqrt(3)/2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4ea701e-9d3d-4289-8afd-4769f8191e5e', '53c3346c-af73-42f9-bbf2-4cab9f8cf5bb', 1, 'omega*A/2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5681ec91-1346-47ba-ada2-e6f2f20a17e7', '53c3346c-af73-42f9-bbf2-4cab9f8cf5bb', 2, 'omega*A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2523969f-3152-451c-bef8-44299e95ddb2', '53c3346c-af73-42f9-bbf2-4cab9f8cf5bb', 3, 'omega*A*sqrt(3)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('53c3346c-af73-42f9-bbf2-4cab9f8cf5bb', '01af9d23-c7c5-420c-baeb-77a252bba459', 'v = omega*sqrt(A^2 - x^2); at x=A/2, v = omega*sqrt(A^2 - A^2/4) = omega*A*sqrt(3)/2.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c889ebf3-25d3-4273-96b0-514980abbc98', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 12, 'Two sound waves of frequencies 256 Hz and 260 Hz are sounded together. The number of beats heard per second is:', 'Physics', 'Waves', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12f6bcc1-7702-4570-bddf-2f565e191e22', 'c889ebf3-25d3-4273-96b0-514980abbc98', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea339c78-37f9-4793-9be7-2975e090f2b0', 'c889ebf3-25d3-4273-96b0-514980abbc98', 1, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eae21f31-1486-44d5-b5cc-cb4177994675', 'c889ebf3-25d3-4273-96b0-514980abbc98', 2, '256');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1cbc8a79-13c1-4101-898a-dbc6b3fa082d', 'c889ebf3-25d3-4273-96b0-514980abbc98', 3, '516');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c889ebf3-25d3-4273-96b0-514980abbc98', 'ea339c78-37f9-4793-9be7-2975e090f2b0', 'Beat frequency = |f1 - f2| = |260 - 256| = 4 beats per second.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('32ad1b17-150c-4540-861a-a5f7f873d95f', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 13, 'Two point charges of +4 microC and +9 microC are placed at a distance d apart. At what distance from the +4 microC charge, on the line joining them, is the net electric field zero?', 'Physics', 'Electric Charges and Fields', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e2904797-1782-47a1-8ea5-82106e36d9f1', '32ad1b17-150c-4540-861a-a5f7f873d95f', 0, '0.4d');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbe899fa-5ff3-489f-8c64-c446f1da4494', '32ad1b17-150c-4540-861a-a5f7f873d95f', 1, '0.5d');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aef7e829-202d-428b-95f2-f40ef531e359', '32ad1b17-150c-4540-861a-a5f7f873d95f', 2, '0.6d');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96ac6e5c-8ffd-4238-8657-8cd5c8657723', '32ad1b17-150c-4540-861a-a5f7f873d95f', 3, '2d/3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('32ad1b17-150c-4540-861a-a5f7f873d95f', 'e2904797-1782-47a1-8ea5-82106e36d9f1', 'Setting the fields equal: k(4)/x^2 = k(9)/(d-x)^2, giving 2/x = 3/(d-x) (taking square roots, since both charges are positive the null point lies between them), so 2(d-x) = 3x, 2d = 5x, x = 0.4d.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('71e48562-50ff-414b-b659-b40a925c1299', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 14, 'Three resistors of 2 ohm, 3 ohm, and 6 ohm are connected in parallel. The equivalent resistance of the combination is:', 'Physics', 'Current Electricity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac30f755-c21b-4a50-9910-f1faef8438f7', '71e48562-50ff-414b-b659-b40a925c1299', 0, '1 ohm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae130276-10d1-4394-915e-979c99f6efb4', '71e48562-50ff-414b-b659-b40a925c1299', 1, '11 ohm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('751a8bf8-cc1c-42ed-95fb-6ea27580128d', '71e48562-50ff-414b-b659-b40a925c1299', 2, '2 ohm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c552dfb-8cf4-48b0-abf7-6ec75730bc8b', '71e48562-50ff-414b-b659-b40a925c1299', 3, '0.5 ohm');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('71e48562-50ff-414b-b659-b40a925c1299', 'ac30f755-c21b-4a50-9910-f1faef8438f7', '1/R_eq = 1/2 + 1/3 + 1/6 = 3/6 + 2/6 + 1/6 = 6/6 = 1, so R_eq = 1 ohm.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4e057f21-9a23-4518-8cad-989ae65fbf41', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 15, 'A charged particle moving with velocity v enters a uniform magnetic field B perpendicular to its velocity. The radius of its circular path is given by:', 'Physics', 'Moving Charges and Magnetism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4d9679b-1fba-41fd-9b1c-a96a13e49dfb', '4e057f21-9a23-4518-8cad-989ae65fbf41', 0, 'r = mv/(qB)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('180b2f82-a69c-4192-96fd-24a13baae3a5', '4e057f21-9a23-4518-8cad-989ae65fbf41', 1, 'r = qB/(mv)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('498b9435-a30e-4da0-b6f5-897723bc5a36', '4e057f21-9a23-4518-8cad-989ae65fbf41', 2, 'r = mB/(qv)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5ab9c95-5dd5-4bad-9425-675efba0ff7b', '4e057f21-9a23-4518-8cad-989ae65fbf41', 3, 'r = qv/(mB)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4e057f21-9a23-4518-8cad-989ae65fbf41', 'd4d9679b-1fba-41fd-9b1c-a96a13e49dfb', 'Setting magnetic force equal to centripetal force: qvB = mv^2/r, giving r = mv/(qB).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1575a441-1ff4-4822-9622-2d3dcd10150c', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 16, 'A conducting rod of length L moves with velocity v perpendicular to a uniform magnetic field B, and also perpendicular to its own length. The EMF induced across the ends of the rod is:', 'Physics', 'Electromagnetic Induction', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f0b20b4-4640-4ccb-9286-5438c7a68447', '1575a441-1ff4-4822-9622-2d3dcd10150c', 0, 'BLv');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc777fa6-cd69-4dcd-b82a-29e685ce5ee2', '1575a441-1ff4-4822-9622-2d3dcd10150c', 1, 'BL/v');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1bfbbff-c17b-40f3-8aa5-522b7798f4ec', '1575a441-1ff4-4822-9622-2d3dcd10150c', 2, 'Bv/L');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72141152-2044-4fae-b7f2-32ecd2b863f6', '1575a441-1ff4-4822-9622-2d3dcd10150c', 3, 'BLv^2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1575a441-1ff4-4822-9622-2d3dcd10150c', '3f0b20b4-4640-4ccb-9286-5438c7a68447', 'Motional EMF induced in a rod moving perpendicular to a magnetic field: EMF = BLv.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5bc6f9f9-643c-41a8-bc0f-3f3148186058', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 17, 'In an AC circuit, the peak value of the voltage is 220*sqrt(2) volts. The rms value of the voltage is:', 'Physics', 'Alternating Current', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4fd33d5f-1c07-4613-a763-10484ebf3a96', '5bc6f9f9-643c-41a8-bc0f-3f3148186058', 0, '110 V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('100b5dfa-aa34-40c7-b68c-ff7a3ddf6061', '5bc6f9f9-643c-41a8-bc0f-3f3148186058', 1, '220 V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5e267cd-8455-42e0-a108-9e2748c6f0a3', '5bc6f9f9-643c-41a8-bc0f-3f3148186058', 2, '220*sqrt(2) V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e416099d-1571-4484-9880-3a56ca0fb1f5', '5bc6f9f9-643c-41a8-bc0f-3f3148186058', 3, '440 V');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5bc6f9f9-643c-41a8-bc0f-3f3148186058', '100b5dfa-aa34-40c7-b68c-ff7a3ddf6061', 'V_rms = V_peak/sqrt(2) = 220*sqrt(2)/sqrt(2) = 220 V.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fbf42134-cfbe-4647-8a63-a7e80d2312ad', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 18, 'An object is placed at a distance of 20 cm from a convex lens of focal length 10 cm. The image is formed at a distance from the lens of:', 'Physics', 'Ray Optics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9eb22293-f033-4172-86f7-fa74d716fab4', 'fbf42134-cfbe-4647-8a63-a7e80d2312ad', 0, '10 cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34af5442-1df7-40e4-92bd-bc58f5db67a0', 'fbf42134-cfbe-4647-8a63-a7e80d2312ad', 1, '20 cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34f44024-2a0e-4df0-90e0-162986014ecd', 'fbf42134-cfbe-4647-8a63-a7e80d2312ad', 2, '30 cm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53a37508-1acc-4ef8-8688-f6b52befc712', 'fbf42134-cfbe-4647-8a63-a7e80d2312ad', 3, '40 cm');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fbf42134-cfbe-4647-8a63-a7e80d2312ad', '34af5442-1df7-40e4-92bd-bc58f5db67a0', 'Using 1/v - 1/u = 1/f with u=-20cm, f=10cm: 1/v = 1/10 - 1/20 = 1/20, so v=20cm.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('196ef044-f62b-4d72-ba95-5aa5168a1f35', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 19, 'The de Broglie wavelength of an electron accelerated through a potential difference V is inversely proportional to:', 'Physics', 'Dual Nature of Radiation and Matter', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98cdb030-8f0c-4e2c-8793-1b7cb020a298', '196ef044-f62b-4d72-ba95-5aa5168a1f35', 0, 'V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd13aea3-7381-4287-9200-870790d4aea8', '196ef044-f62b-4d72-ba95-5aa5168a1f35', 1, 'sqrt(V)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3708671-dcdf-4d12-8563-09afac93f0f1', '196ef044-f62b-4d72-ba95-5aa5168a1f35', 2, 'V^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('868dbd28-533d-4d4d-a1f0-3d8610cd49d7', '196ef044-f62b-4d72-ba95-5aa5168a1f35', 3, '1/V');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('196ef044-f62b-4d72-ba95-5aa5168a1f35', 'fd13aea3-7381-4287-9200-870790d4aea8', 'KE = qV = p^2/2m, so p is proportional to sqrt(V); since lambda = h/p, lambda is inversely proportional to sqrt(V).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('897d0b54-16d4-4855-b6dd-73e1215fd75a', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 20, 'The half-life of a radioactive sample is 10 days. The fraction of the sample remaining undecayed after 30 days is:', 'Physics', 'Atoms and Nuclei', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2960244d-f053-405a-a260-8506e1b45f96', '897d0b54-16d4-4855-b6dd-73e1215fd75a', 0, '1/2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5132cb76-077b-4fda-95dd-e77366bb05fb', '897d0b54-16d4-4855-b6dd-73e1215fd75a', 1, '1/4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('406b35ae-7846-4bca-94dd-633e09fc8141', '897d0b54-16d4-4855-b6dd-73e1215fd75a', 2, '1/8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd40c3ca-f55e-4326-a443-19442231e43a', '897d0b54-16d4-4855-b6dd-73e1215fd75a', 3, '1/16');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('897d0b54-16d4-4855-b6dd-73e1215fd75a', '406b35ae-7846-4bca-94dd-633e09fc8141', '30 days = 3 half-lives, so the remaining fraction is (1/2)^3 = 1/8.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7ed2eef2-f462-47b2-b272-748b43d505a8', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 21, 'A car starts from rest and accelerates uniformly at 2 m/s^2 for 5 seconds. The distance (in metres) covered by the car in this time is:', 'Physics', 'Kinematics — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('7ed2eef2-f462-47b2-b272-748b43d505a8', 25, 's = ut + (1/2)at^2 = 0 + (1/2)(2)(5^2) = 25 m.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('53641e4f-d723-4975-9e37-c4628868df9f', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 22, 'A spring with force constant 200 N/m is compressed by 0.1 m. The elastic potential energy (in joules) stored in the spring is:', 'Physics', 'Work, Energy and Power — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('53641e4f-d723-4975-9e37-c4628868df9f', 1, 'PE = (1/2)kx^2 = (1/2)(200)(0.1)^2 = (1/2)(200)(0.01) = 1 J.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6be16234-1c80-47d2-b4f1-517d485b57b3', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 23, 'A cell of EMF 6 V and internal resistance 1 ohm is connected to an external resistance of 2 ohm. The current (in amperes) flowing in the circuit is:', 'Physics', 'Current Electricity — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('6be16234-1c80-47d2-b4f1-517d485b57b3', 2, 'I = EMF/(R+r) = 6/(2+1) = 2 A.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6084afd7-e0fb-4f39-b38b-fa33dea981fb', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 24, 'A concave mirror has a radius of curvature of 20 cm. Its focal length (in centimetres) is:', 'Physics', 'Ray Optics — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('6084afd7-e0fb-4f39-b38b-fa33dea981fb', 10, 'f = R/2 = 20/2 = 10 cm.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bf9edd0c-e879-4b48-9043-acbb09d41e20', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 25, 'An ideal gas absorbs 500 J of heat and does 200 J of work on its surroundings. The change in internal energy (in joules) of the gas is:', 'Physics', 'Thermodynamics — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('bf9edd0c-e879-4b48-9043-acbb09d41e20', 300, 'By the first law, delta U = Q - W = 500 - 200 = 300 J.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Chemistry (25 questions) — Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c2de8538-f228-431b-bd9a-dcdb1245853c', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 26, 'The number of moles of oxygen atoms present in 1 mole of Ca(NO3)2 is:', 'Chemistry', 'Some Basic Concepts of Chemistry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('995a2286-9c32-4402-8e22-b185c8a0d4bc', 'c2de8538-f228-431b-bd9a-dcdb1245853c', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cbfe8cfa-bf61-46d4-87d0-0db16b21251a', 'c2de8538-f228-431b-bd9a-dcdb1245853c', 1, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eadf0e07-0baf-4a95-aabc-c28656c0fa84', 'c2de8538-f228-431b-bd9a-dcdb1245853c', 2, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('758477f4-0381-4d3d-89d6-c2791d75bfd0', 'c2de8538-f228-431b-bd9a-dcdb1245853c', 3, '9');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c2de8538-f228-431b-bd9a-dcdb1245853c', 'eadf0e07-0baf-4a95-aabc-c28656c0fa84', 'Ca(NO3)2 has 2 nitrate groups, each with 3 oxygen atoms, giving 6 oxygen atoms per formula unit, hence 6 moles of oxygen atoms per mole of compound.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('40c4aa2c-30ce-4723-a038-4defd42135d5', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 27, 'The number of unpaired electrons in the ground-state electronic configuration of chromium (Z=24, [Ar]3d5 4s1) is:', 'Chemistry', 'Structure of Atom', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85d853f5-2ad8-477f-b8fa-8e79a52181e8', '40c4aa2c-30ce-4723-a038-4defd42135d5', 0, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04908e15-b7f9-457d-9923-befc4840a72b', '40c4aa2c-30ce-4723-a038-4defd42135d5', 1, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('410b8a1c-2f67-44fe-87d2-90d9b0ce7bec', '40c4aa2c-30ce-4723-a038-4defd42135d5', 2, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cdb109db-1b92-486b-9e04-5f0deabcfced', '40c4aa2c-30ce-4723-a038-4defd42135d5', 3, '1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('40c4aa2c-30ce-4723-a038-4defd42135d5', '410b8a1c-2f67-44fe-87d2-90d9b0ce7bec', 'Chromium''s anomalous configuration [Ar]3d5 4s1 places one electron in each of the five 3d orbitals plus one in the 4s orbital, all with parallel spin per Hund''s rule, giving 6 unpaired electrons total.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('848377e0-5c2b-4330-b21d-5f1a06954a83', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 28, 'The correct order of increasing atomic radius for the elements Na, Mg, Al, Si (all Period 3) is:', 'Chemistry', 'Classification of Elements and Periodicity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e33c409-1dc7-458f-b689-e169048379e9', '848377e0-5c2b-4330-b21d-5f1a06954a83', 0, 'Na < Mg < Al < Si');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca0d1d8e-685f-4643-a5cd-7a6c5587a07c', '848377e0-5c2b-4330-b21d-5f1a06954a83', 1, 'Si < Al < Mg < Na');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06492ad6-e7dd-43f1-a269-bb7e38283a4e', '848377e0-5c2b-4330-b21d-5f1a06954a83', 2, 'Mg < Na < Si < Al');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7281e47-3e64-4652-a91f-f2a133927b78', '848377e0-5c2b-4330-b21d-5f1a06954a83', 3, 'Al < Si < Na < Mg');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('848377e0-5c2b-4330-b21d-5f1a06954a83', 'ca0d1d8e-685f-4643-a5cd-7a6c5587a07c', 'Atomic radius decreases across a period due to increasing effective nuclear charge, so the increasing order is Si < Al < Mg < Na.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0f1b1f25-3aac-461f-9017-0c3e502e9950', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 29, 'The hybridization of the central sulfur atom in SF6 is:', 'Chemistry', 'Chemical Bonding and Molecular Structure', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ff914bb-2a33-4bba-ae3c-ee276ab342a1', '0f1b1f25-3aac-461f-9017-0c3e502e9950', 0, 'sp3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a787ef6-2870-499c-aaac-3bf031e6180b', '0f1b1f25-3aac-461f-9017-0c3e502e9950', 1, 'sp3d');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('56376f2d-65bd-4c66-861f-781a62ba61a0', '0f1b1f25-3aac-461f-9017-0c3e502e9950', 2, 'sp3d2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65e11d57-8b42-4d93-bf79-5c5bdded3ca8', '0f1b1f25-3aac-461f-9017-0c3e502e9950', 3, 'sp2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0f1b1f25-3aac-461f-9017-0c3e502e9950', '56376f2d-65bd-4c66-861f-781a62ba61a0', 'SF6 has 6 bond pairs and 0 lone pairs around sulfur, requiring sp3d2 hybridization for an octahedral geometry.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7cb10dc5-a1bb-4de1-a8c2-683551d66b82', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 30, 'At STP, the volume occupied by 1 mole of an ideal gas is approximately:', 'Chemistry', 'States of Matter', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e97e56af-bb15-46e7-906d-02224a03f566', '7cb10dc5-a1bb-4de1-a8c2-683551d66b82', 0, '11.2 L');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b376633-f810-4430-86f4-1a6a049e22ed', '7cb10dc5-a1bb-4de1-a8c2-683551d66b82', 1, '22.4 L');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('337135e0-1e07-4d16-a040-ce5302cd8157', '7cb10dc5-a1bb-4de1-a8c2-683551d66b82', 2, '44.8 L');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b6af8f4-6277-4df0-b64b-93b80b2eb6ee', '7cb10dc5-a1bb-4de1-a8c2-683551d66b82', 3, '1 L');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7cb10dc5-a1bb-4de1-a8c2-683551d66b82', '1b376633-f810-4430-86f4-1a6a049e22ed', 'At STP (0 degrees C, 1 atm), 1 mole of an ideal gas occupies 22.4 L, the molar volume.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('155e2522-dfaf-4c43-bf23-d0bd19b11eaf', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 31, 'For a reaction to be spontaneous at all temperatures, the signs of delta H and delta S must be:', 'Chemistry', 'Thermodynamics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bcc2fa5b-19ae-4a0f-b58d-2fe79df0cf10', '155e2522-dfaf-4c43-bf23-d0bd19b11eaf', 0, 'delta H negative, delta S positive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b343b8f9-69bd-4c44-a954-db72a1ef5a63', '155e2522-dfaf-4c43-bf23-d0bd19b11eaf', 1, 'delta H positive, delta S negative');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e186110f-dd9e-47c2-805a-2a7b08732abc', '155e2522-dfaf-4c43-bf23-d0bd19b11eaf', 2, 'delta H positive, delta S positive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc1f436f-fc98-4fb6-9962-444d0bb0a34c', '155e2522-dfaf-4c43-bf23-d0bd19b11eaf', 3, 'delta H negative, delta S negative');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('155e2522-dfaf-4c43-bf23-d0bd19b11eaf', 'bcc2fa5b-19ae-4a0f-b58d-2fe79df0cf10', 'delta G = delta H - T*delta S; if delta H is negative and delta S is positive, delta G is negative at every temperature, guaranteeing spontaneity at all T.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ef793b6c-e231-410c-a41d-69985895aa39', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 32, 'For the reaction N2 + 3H2 <-> 2NH3, if the equilibrium concentrations are [N2]=1M, [H2]=2M, [NH3]=4M, the equilibrium constant Kc is:', 'Chemistry', 'Equilibrium', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04f979dc-036e-473f-af45-a9e8729bf3bc', 'ef793b6c-e231-410c-a41d-69985895aa39', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be90e08e-d452-4827-a6e0-feed1d15c671', 'ef793b6c-e231-410c-a41d-69985895aa39', 1, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4286c80e-64fa-42a8-8048-dba046bad2a4', 'ef793b6c-e231-410c-a41d-69985895aa39', 2, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10c74495-4b9e-4c7d-a83c-b3c9564be657', 'ef793b6c-e231-410c-a41d-69985895aa39', 3, '16');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ef793b6c-e231-410c-a41d-69985895aa39', '04f979dc-036e-473f-af45-a9e8729bf3bc', 'Kc = [NH3]^2 / ([N2][H2]^3) = (4)^2 / (1 * 2^3) = 16/8 = 2.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8506bcd9-d89b-4cc3-bf00-ec97f788454a', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 33, 'The oxidation number of chromium in K2Cr2O7 is:', 'Chemistry', 'Redox Reactions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('541bbc21-8239-4154-8a62-bcbee2cf02b9', '8506bcd9-d89b-4cc3-bf00-ec97f788454a', 0, '+3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e4e7b99-8618-4811-bb5f-3292b3c5b46f', '8506bcd9-d89b-4cc3-bf00-ec97f788454a', 1, '+6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d07cd0b-ec8d-4bb4-b940-ae8891b02416', '8506bcd9-d89b-4cc3-bf00-ec97f788454a', 2, '+7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b16dd77-9e52-4381-993c-b335488fe387', '8506bcd9-d89b-4cc3-bf00-ec97f788454a', 3, '+2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8506bcd9-d89b-4cc3-bf00-ec97f788454a', '3e4e7b99-8618-4811-bb5f-3292b3c5b46f', 'K is +1 (x2=+2), O is -2 (x7=-14); for neutrality, 2 + 2x - 14 = 0, giving x = +6 for each chromium atom.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f8eafd54-0d73-452d-b3c6-4c9d22c83f24', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 34, 'Among the alkali metals, the one with the highest first ionization enthalpy is:', 'Chemistry', 's-Block Elements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9e295b0-1e51-4300-a01e-d2776c47929d', 'f8eafd54-0d73-452d-b3c6-4c9d22c83f24', 0, 'Li');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ae2fa9c-103e-4492-9a5e-4228c678f19a', 'f8eafd54-0d73-452d-b3c6-4c9d22c83f24', 1, 'Na');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a9792cf-ba04-42d5-b1e6-d0586ea641ad', 'f8eafd54-0d73-452d-b3c6-4c9d22c83f24', 2, 'K');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c51bb7d-38d5-41a7-bbdf-4b09f65871aa', 'f8eafd54-0d73-452d-b3c6-4c9d22c83f24', 3, 'Cs');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f8eafd54-0d73-452d-b3c6-4c9d22c83f24', 'e9e295b0-1e51-4300-a01e-d2776c47929d', 'Ionization enthalpy decreases down a group as atomic size increases; lithium, the smallest alkali metal, has the highest first ionization enthalpy among them.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7cdfa946-211c-4641-9656-00d4191ebcf9', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 35, 'The IUPAC name of the compound CH3-CH(CH3)-CH2-CH3 is:', 'Chemistry', 'Organic Chemistry — Basic Principles', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69fcb022-4424-41e4-a778-f10842de3284', '7cdfa946-211c-4641-9656-00d4191ebcf9', 0, 'n-Butane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb8d55f6-b9d2-4097-bbf4-d50892e9664b', '7cdfa946-211c-4641-9656-00d4191ebcf9', 1, '2-Methylbutane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2adf1788-e342-4006-b3f8-3d9525fac62f', '7cdfa946-211c-4641-9656-00d4191ebcf9', 2, '2,2-Dimethylpropane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c1ceefc-00d3-422a-89db-0cd32f8078df', '7cdfa946-211c-4641-9656-00d4191ebcf9', 3, 'Pentane');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7cdfa946-211c-4641-9656-00d4191ebcf9', 'cb8d55f6-b9d2-4097-bbf4-d50892e9664b', 'The longest chain has 4 carbons with a methyl substituent at position 2, giving the IUPAC name 2-methylbutane.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4599ef6f-7895-48da-bda1-ee7924f31a23', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 36, 'The reaction of an alkene with HBr in the presence of peroxides follows anti-Markovnikov addition, known as the:', 'Chemistry', 'Hydrocarbons', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ed07a4c-6044-4bdd-835a-2b3da60e8801', '4599ef6f-7895-48da-bda1-ee7924f31a23', 0, 'Wurtz reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('afbfb1e3-7b3e-4b0c-9db0-fb1512bf6dbf', '4599ef6f-7895-48da-bda1-ee7924f31a23', 1, 'Kharasch effect (peroxide effect)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76066739-45fb-419d-b94d-5aec5b596477', '4599ef6f-7895-48da-bda1-ee7924f31a23', 2, 'Friedel-Crafts reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8684662e-24fd-44e7-bd65-cada1a7353c9', '4599ef6f-7895-48da-bda1-ee7924f31a23', 3, 'Cannizzaro reaction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4599ef6f-7895-48da-bda1-ee7924f31a23', 'afbfb1e3-7b3e-4b0c-9db0-fb1512bf6dbf', 'The Kharasch (peroxide) effect describes anti-Markovnikov addition of HBr to alkenes in the presence of peroxides, proceeding via a free-radical mechanism — notably, this reversal is observed only for HBr, not HCl or HI.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cbaefa68-ccb4-4c69-86ee-41edfa509adb', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 37, 'The primary pollutant responsible for the formation of classical (London-type) smog is:', 'Chemistry', 'Environmental Chemistry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70fbb946-f306-49f4-a1f4-346b9a2cea69', 'cbaefa68-ccb4-4c69-86ee-41edfa509adb', 0, 'Ozone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5dc47c2-f2e5-481d-b8c5-52942fa8afdd', 'cbaefa68-ccb4-4c69-86ee-41edfa509adb', 1, 'Sulfur dioxide, combined with fog and smoke');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e326b946-55e1-49a2-b672-08370bf526a9', 'cbaefa68-ccb4-4c69-86ee-41edfa509adb', 2, 'Nitrogen dioxide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4613228e-e20d-4ad1-8740-797129e7eb86', 'cbaefa68-ccb4-4c69-86ee-41edfa509adb', 3, 'Carbon monoxide');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cbaefa68-ccb4-4c69-86ee-41edfa509adb', 'a5dc47c2-f2e5-481d-b8c5-52942fa8afdd', 'Classical/London smog forms from a combination of smoke, fog, and sulfur dioxide, common in cold, humid climates with high coal combustion — distinct from photochemical smog, which forms from NOx/hydrocarbons under sunlight.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f23efea9-7a30-4b18-947c-1b318411613f', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 38, 'In a simple cubic unit cell, the number of atoms per unit cell is:', 'Chemistry', 'Solid State', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d92cf6f5-5363-426f-a745-db40403b1f6c', 'f23efea9-7a30-4b18-947c-1b318411613f', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd629f64-74e0-4737-9ada-8aad4ac821a0', 'f23efea9-7a30-4b18-947c-1b318411613f', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87fc6828-d9da-43c5-be65-b3de7cc44de0', 'f23efea9-7a30-4b18-947c-1b318411613f', 2, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e18bdf8b-d9b0-40bc-8d21-f236ecf94c98', 'f23efea9-7a30-4b18-947c-1b318411613f', 3, '8');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f23efea9-7a30-4b18-947c-1b318411613f', 'd92cf6f5-5363-426f-a745-db40403b1f6c', 'A simple cubic cell has 8 corner atoms, each shared among 8 unit cells, contributing 8*(1/8) = 1 atom per unit cell.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('284ba2e9-119f-458f-a431-2ec4f46be482', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 39, 'The boiling point of a solution is always _____ the boiling point of the pure solvent, for a non-volatile solute.', 'Chemistry', 'Solutions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46487dbc-833f-41c3-bf5f-5bfba54d8cfc', '284ba2e9-119f-458f-a431-2ec4f46be482', 0, 'Lower than');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0221260-b74e-45c2-b096-28335fb0159a', '284ba2e9-119f-458f-a431-2ec4f46be482', 1, 'Higher than');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('531eb239-39fd-4f90-94bf-dc26d0817956', '284ba2e9-119f-458f-a431-2ec4f46be482', 2, 'Equal to');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e232513-fd2f-4a41-97af-a8730446b84c', '284ba2e9-119f-458f-a431-2ec4f46be482', 3, 'Unrelated to');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('284ba2e9-119f-458f-a431-2ec4f46be482', 'd0221260-b74e-45c2-b096-28335fb0159a', 'Dissolving a non-volatile solute lowers the solvent''s vapour pressure, requiring a higher temperature to reach the external pressure needed for boiling — hence boiling point elevation.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f0735fcb-6642-4aec-82d9-901be2b6fb9d', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 40, 'The standard EMF of a cell is related to its equilibrium constant K by the equation:', 'Chemistry', 'Electrochemistry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('340e3c53-9c17-4e1b-bf83-b9aa03f7fbbb', 'f0735fcb-6642-4aec-82d9-901be2b6fb9d', 0, 'E-cell = (RT/nF) ln K');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7cddc25e-45e2-4b14-8f6c-1169bc43b5aa', 'f0735fcb-6642-4aec-82d9-901be2b6fb9d', 1, 'E-cell = -(RT/nF) ln K');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e41af997-9890-4043-9285-228a75ccd7eb', 'f0735fcb-6642-4aec-82d9-901be2b6fb9d', 2, 'E-cell = nF ln K');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0027a12a-c89b-4509-909e-dba696abc119', 'f0735fcb-6642-4aec-82d9-901be2b6fb9d', 3, 'E-cell = RT/K');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f0735fcb-6642-4aec-82d9-901be2b6fb9d', '340e3c53-9c17-4e1b-bf83-b9aa03f7fbbb', 'At equilibrium, delta G = -nFE-cell = -RT ln K, giving E-cell = (RT/nF) ln K.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4c3a7e71-4645-4223-8f5e-61ceee5d8431', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 41, 'For a first-order reaction, a plot of ln[A] versus time gives a straight line with slope:', 'Chemistry', 'Chemical Kinetics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8dd4090-9a19-43c1-8cab-6684019f1d14', '4c3a7e71-4645-4223-8f5e-61ceee5d8431', 0, '+k');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa60cc0e-09b1-44c9-a728-2bd19f0121ec', '4c3a7e71-4645-4223-8f5e-61ceee5d8431', 1, '-k');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc36ac78-dc32-4863-9aa2-b3f48d80289d', '4c3a7e71-4645-4223-8f5e-61ceee5d8431', 2, 'k^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33d01ea6-9405-420b-b031-0e6a4d2c6283', '4c3a7e71-4645-4223-8f5e-61ceee5d8431', 3, '1/k');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4c3a7e71-4645-4223-8f5e-61ceee5d8431', 'fa60cc0e-09b1-44c9-a728-2bd19f0121ec', 'The integrated first-order rate law is ln[A] = ln[A]0 - kt, so a plot of ln[A] vs t is linear with slope -k.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d942ec30-d134-4b92-96df-afcbf4c939bd', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 42, 'Which of the following ions is expected to be colorless in aqueous solution?', 'Chemistry', 'd and f Block Elements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2415d15-479b-4a43-8054-915d1d99f7fa', 'd942ec30-d134-4b92-96df-afcbf4c939bd', 0, 'Cu2+');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0333d0f-67c0-49c0-a2c3-42d0e3395ad9', 'd942ec30-d134-4b92-96df-afcbf4c939bd', 1, 'Fe2+');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a04a8549-055a-49c5-9694-96095e8d1137', 'd942ec30-d134-4b92-96df-afcbf4c939bd', 2, 'Zn2+');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ef81a78-a158-4f03-8309-c6087a370abb', 'd942ec30-d134-4b92-96df-afcbf4c939bd', 3, 'Ti3+');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d942ec30-d134-4b92-96df-afcbf4c939bd', 'a04a8549-055a-49c5-9694-96095e8d1137', 'Zn2+ has a completely filled 3d10 configuration, so no d-d electronic transitions are possible, making it colorless — unlike Cu2+, Fe2+, and Ti3+, which have partially filled d-orbitals.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('08941141-5da4-4b58-b771-4a1dc04d1caf', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 43, 'The coordination number of the central metal ion in [Co(en)3]3+ (en = ethylenediamine, a bidentate ligand) is:', 'Chemistry', 'Coordination Compounds', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('851fe6de-e4a8-4c9b-b2cd-cedd706053ed', '08941141-5da4-4b58-b771-4a1dc04d1caf', 0, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99ecde40-550a-44df-ab0d-40c635addd1b', '08941141-5da4-4b58-b771-4a1dc04d1caf', 1, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fca7ad5a-8c37-4daa-a18c-5476fca77029', '08941141-5da4-4b58-b771-4a1dc04d1caf', 2, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8913ca38-d8a9-4ed8-94a0-b4c3708bbfd0', '08941141-5da4-4b58-b771-4a1dc04d1caf', 3, '9');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('08941141-5da4-4b58-b771-4a1dc04d1caf', '99ecde40-550a-44df-ab0d-40c635addd1b', 'Each ethylenediamine (en) ligand is bidentate, binding through 2 donor atoms; 3 en ligands contribute 3*2 = 6, giving a coordination number of 6.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('167df885-2df0-424f-9867-c5b79fce1be0', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 44, 'The reagent used to distinguish between an aldehyde and a ketone via a positive/negative color-change test is:', 'Chemistry', 'Aldehydes, Ketones and Carboxylic Acids', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4103b4ef-a87a-48b2-972a-e490e69eb6cf', '167df885-2df0-424f-9867-c5b79fce1be0', 0, 'Tollens'' reagent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9264290-73b0-43a9-8fcf-c9bc548c883c', '167df885-2df0-424f-9867-c5b79fce1be0', 1, 'Sodium hydroxide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4eee28f8-7037-4627-b67f-85cdc7c2f21b', '167df885-2df0-424f-9867-c5b79fce1be0', 2, 'Dilute HCl');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1adb771-6ea0-4951-a98c-ff5b0a4cd58a', '167df885-2df0-424f-9867-c5b79fce1be0', 3, 'Bromine water only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('167df885-2df0-424f-9867-c5b79fce1be0', '4103b4ef-a87a-48b2-972a-e490e69eb6cf', 'Tollens'' reagent gives a positive silver-mirror test with aldehydes (which are oxidized) but generally not with ketones, providing a reliable distinguishing test.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fa6fbdd4-6db7-48aa-9fe4-66ad345cce39', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 45, 'Aniline reacts with acetic anhydride to form:', 'Chemistry', 'Amines', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed61d833-30ae-45fa-90fb-f2699c2295be', 'fa6fbdd4-6db7-48aa-9fe4-66ad345cce39', 0, 'Acetanilide, via acetylation of the amine group');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2a6dabc-8f88-46f3-9ed8-b4a3dc1546ed', 'fa6fbdd4-6db7-48aa-9fe4-66ad345cce39', 1, 'Aniline hydrochloride');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88996c97-f540-495d-ba0f-f11beee7efe8', 'fa6fbdd4-6db7-48aa-9fe4-66ad345cce39', 2, 'Benzene');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e87b052b-2bbe-4c37-8776-f5bca0461089', 'fa6fbdd4-6db7-48aa-9fe4-66ad345cce39', 3, 'Nitrobenzene');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fa6fbdd4-6db7-48aa-9fe4-66ad345cce39', 'ed61d833-30ae-45fa-90fb-f2699c2295be', 'Acetylation of aniline''s -NH2 group with acetic anhydride produces acetanilide (N-phenylacetamide), releasing acetic acid as a byproduct.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d72ac5d2-1ed3-4cf7-94c1-507ad79d79c4', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 46, 'The number of moles of NaOH (molar mass 40 g/mol) present in 4 grams of NaOH is:', 'Chemistry', 'Some Basic Concepts of Chemistry — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('d72ac5d2-1ed3-4cf7-94c1-507ad79d79c4', 0.1, 'Moles = mass/molar mass = 4/40 = 0.1 mol.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3b369393-8742-4ff5-bb60-541f3d322071', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 47, 'The pH of a solution with hydrogen ion concentration [H+] = 10^-3 M is:', 'Chemistry', 'Equilibrium — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('3b369393-8742-4ff5-bb60-541f3d322071', 3, 'pH = -log[H+] = -log(10^-3) = 3.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4705e0eb-bf6d-497f-9b18-c012aebc0b8c', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 48, 'If 2 moles of an ideal gas expand isothermally and reversibly, doing 1000 J of work, and no heat is lost to friction, the heat absorbed by the gas (in joules) is:', 'Chemistry', 'Thermodynamics — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('4705e0eb-bf6d-497f-9b18-c012aebc0b8c', 1000, 'For an isothermal process, delta U = 0, so by the first law, Q = W = 1000 J.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('dc5bdb0f-43e6-477c-b949-9ebba3c4ac6b', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 49, 'A solution is prepared by dissolving 0.5 mole of solute in 500 mL of solution. The molarity (in mol/L) of the solution is:', 'Chemistry', 'Solutions — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('dc5bdb0f-43e6-477c-b949-9ebba3c4ac6b', 1, 'Molarity = moles/volume(L) = 0.5/0.5 = 1 mol/L.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('abbaf0e9-d957-4a6f-aae9-c8db5be532f8', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 50, 'A current of 2 amperes is passed through a solution for 500 seconds. The total charge (in coulombs) passed is:', 'Chemistry', 'Electrochemistry — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('abbaf0e9-d957-4a6f-aae9-c8db5be532f8', 1000, 'Q = I*t = 2*500 = 1000 coulombs.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Mathematics (25 questions) — Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a7044e79-83b9-49a4-aabe-632238f89fae', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 51, 'If A = {1,2,3} and B = {3,4}, then the number of elements in A union B is:', 'Mathematics', 'Sets, Relations and Functions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('689fc8e8-9fd0-4acf-a664-ab56ced983ef', 'a7044e79-83b9-49a4-aabe-632238f89fae', 0, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2da04a98-b24b-4ca7-aa0e-780d1121d30a', 'a7044e79-83b9-49a4-aabe-632238f89fae', 1, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc924940-718e-414b-b240-c7bed4512d15', 'a7044e79-83b9-49a4-aabe-632238f89fae', 2, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c49976a-da48-41b4-95d7-0ce615826337', 'a7044e79-83b9-49a4-aabe-632238f89fae', 3, '6');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a7044e79-83b9-49a4-aabe-632238f89fae', '2da04a98-b24b-4ca7-aa0e-780d1121d30a', 'A union B = {1,2,3,4}, which has 4 distinct elements.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f3472e2a-2318-45e3-a533-cd0a0dcc9292', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 52, 'The modulus of the complex number z = 3 + 4i is:', 'Mathematics', 'Complex Numbers', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68259e26-12ec-4235-9ad2-32dffd50d0df', 'f3472e2a-2318-45e3-a533-cd0a0dcc9292', 0, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4bf319a1-bb61-4647-bf78-a0d734d0a091', 'f3472e2a-2318-45e3-a533-cd0a0dcc9292', 1, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b870ceb-baef-4bdc-9b98-ef63523c48c9', 'f3472e2a-2318-45e3-a533-cd0a0dcc9292', 2, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd6fda7d-08ed-46dc-a806-58887275974f', 'f3472e2a-2318-45e3-a533-cd0a0dcc9292', 3, '7');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f3472e2a-2318-45e3-a533-cd0a0dcc9292', '6b870ceb-baef-4bdc-9b98-ef63523c48c9', '|z| = sqrt(3^2 + 4^2) = sqrt(9+16) = sqrt(25) = 5.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('664bf38b-a46f-490f-b4e3-9d8b381d0387', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 53, 'The sum of the roots of the quadratic equation 2x^2 - 6x + 3 = 0 is:', 'Mathematics', 'Quadratic Equations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25891ce6-c9e1-4643-8633-9fcce063780e', '664bf38b-a46f-490f-b4e3-9d8b381d0387', 0, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f00bf571-0912-4bce-aae6-4578f52474ad', '664bf38b-a46f-490f-b4e3-9d8b381d0387', 1, '-3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a1db3a8-b163-4683-93c7-563900ed1f4f', '664bf38b-a46f-490f-b4e3-9d8b381d0387', 2, '3/2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2c2b8f0-1ed6-4d46-be1d-de8888026ea5', '664bf38b-a46f-490f-b4e3-9d8b381d0387', 3, '-3/2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('664bf38b-a46f-490f-b4e3-9d8b381d0387', '25891ce6-c9e1-4643-8633-9fcce063780e', 'For ax^2+bx+c=0, sum of roots = -b/a = -(-6)/2 = 3.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('54c7d7ba-a7a4-413b-9c84-3ea4fda2e7ef', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 54, 'The number of ways to select 3 objects out of 6 distinct objects is:', 'Mathematics', 'Permutations and Combinations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60ddad71-7dc5-4039-8aa6-dcf930683bb8', '54c7d7ba-a7a4-413b-9c84-3ea4fda2e7ef', 0, '18');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8452d02a-1f93-45d3-a72c-1eeaa36593d0', '54c7d7ba-a7a4-413b-9c84-3ea4fda2e7ef', 1, '20');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7fb3ce9b-412d-4bd5-ba5b-24b3c63edbac', '54c7d7ba-a7a4-413b-9c84-3ea4fda2e7ef', 2, '120');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7900c172-8f34-4779-9956-29e07e195b92', '54c7d7ba-a7a4-413b-9c84-3ea4fda2e7ef', 3, '216');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('54c7d7ba-a7a4-413b-9c84-3ea4fda2e7ef', '8452d02a-1f93-45d3-a72c-1eeaa36593d0', 'C(6,3) = 6!/(3!3!) = 720/(6*6) = 20.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3e8a22c4-f6ac-4b1a-8841-c56b2ae5a6a9', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 55, 'The number of terms in the binomial expansion of (x+y)^10 is:', 'Mathematics', 'Binomial Theorem', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0165e916-725c-4355-8274-ae2d57ba3d81', '3e8a22c4-f6ac-4b1a-8841-c56b2ae5a6a9', 0, '9');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5828f151-b46e-4fd2-9a8f-2260e2042ad6', '3e8a22c4-f6ac-4b1a-8841-c56b2ae5a6a9', 1, '10');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe2d6a58-3ad2-4a96-b8d7-0376c175267b', '3e8a22c4-f6ac-4b1a-8841-c56b2ae5a6a9', 2, '11');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b6e6ba3-3494-4633-9ec8-1e23d6d714c3', '3e8a22c4-f6ac-4b1a-8841-c56b2ae5a6a9', 3, '20');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3e8a22c4-f6ac-4b1a-8841-c56b2ae5a6a9', 'fe2d6a58-3ad2-4a96-b8d7-0376c175267b', 'The expansion of (x+y)^n has (n+1) terms, so (x+y)^10 has 11 terms.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c27e3bbb-011f-4252-969d-5b29081ebcea', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 56, 'The sum of the first 10 terms of the arithmetic progression 2, 4, 6, 8, ... is:', 'Mathematics', 'Sequences and Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6235c98-97d5-4a8c-9108-79d5d85331b7', 'c27e3bbb-011f-4252-969d-5b29081ebcea', 0, '100');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a79c5df5-c182-4d1a-8f4e-5580cf3becca', 'c27e3bbb-011f-4252-969d-5b29081ebcea', 1, '110');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9bed42ec-1039-4385-852c-d0e19e489406', 'c27e3bbb-011f-4252-969d-5b29081ebcea', 2, '90');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e91e62f4-89ca-4b02-b04f-10059eaf4558', 'c27e3bbb-011f-4252-969d-5b29081ebcea', 3, '120');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c27e3bbb-011f-4252-969d-5b29081ebcea', 'a79c5df5-c182-4d1a-8f4e-5580cf3becca', 'S_n = n/2 * (2a + (n-1)d) = 10/2 * (4 + 9*2) = 5*22 = 110.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4b8dcfc7-dc76-43ed-9525-bbe65cb5ae4b', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 57, 'The value of the limit as x approaches 0 of (sin x)/x is:', 'Mathematics', 'Limits, Continuity and Differentiability', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df3ae6ef-821e-446a-9272-dbbf3c8c11b0', '4b8dcfc7-dc76-43ed-9525-bbe65cb5ae4b', 0, '0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95599db3-d2b8-4e98-9753-5280eb8a53e3', '4b8dcfc7-dc76-43ed-9525-bbe65cb5ae4b', 1, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64186c6d-0751-4696-868f-60c9c3a2730a', '4b8dcfc7-dc76-43ed-9525-bbe65cb5ae4b', 2, 'infinity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86f8b4d3-0eb8-4f86-a700-84d1bbc36cef', '4b8dcfc7-dc76-43ed-9525-bbe65cb5ae4b', 3, 'undefined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4b8dcfc7-dc76-43ed-9525-bbe65cb5ae4b', '95599db3-d2b8-4e98-9753-5280eb8a53e3', 'This is a standard limit: lim(x->0) sin(x)/x = 1.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d6620dea-1c13-437e-a1db-87699aa620ad', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 58, 'The value of the definite integral of x from 0 to 2 (i.e., integral of x dx from 0 to 2) is:', 'Mathematics', 'Integral Calculus', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('222dabbf-cf8c-4066-a9bf-3a456727db8c', 'd6620dea-1c13-437e-a1db-87699aa620ad', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('baf7010c-f009-4687-9874-7cbf3774e7b3', 'd6620dea-1c13-437e-a1db-87699aa620ad', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('547fbc60-606c-4754-b73b-b368714b1b95', 'd6620dea-1c13-437e-a1db-87699aa620ad', 2, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4e47663-af81-42ff-af2e-0f668557e16d', 'd6620dea-1c13-437e-a1db-87699aa620ad', 3, '8');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d6620dea-1c13-437e-a1db-87699aa620ad', 'baf7010c-f009-4687-9874-7cbf3774e7b3', 'Integral of x dx = x^2/2; evaluating from 0 to 2 gives 4/2 - 0 = 2.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ee199af9-b869-4d1b-afe8-9940764be5b9', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 59, 'The order of the differential equation (d^2y/dx^2) + (dy/dx)^3 + y = 0 is:', 'Mathematics', 'Differential Equations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1840c87-1f51-4b5e-87bd-2c1665782bf0', 'ee199af9-b869-4d1b-afe8-9940764be5b9', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de712afb-ead1-4f20-ab53-61fad4e24441', 'ee199af9-b869-4d1b-afe8-9940764be5b9', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ddfa397-da51-4f9d-9257-beba25ceca81', 'ee199af9-b869-4d1b-afe8-9940764be5b9', 2, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9aed28d-0079-4349-848d-69084e4621ed', 'ee199af9-b869-4d1b-afe8-9940764be5b9', 3, '4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ee199af9-b869-4d1b-afe8-9940764be5b9', 'de712afb-ead1-4f20-ab53-61fad4e24441', 'The order of a differential equation is the order of the highest derivative present; here it is the second derivative, so the order is 2.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('934f6eba-ba11-46d6-9850-e8c80f8f138e', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 60, 'The slope of the line passing through the points (1,2) and (3,8) is:', 'Mathematics', 'Coordinate Geometry — Straight Lines', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff71937f-38a1-4730-80bb-a515f0aed9c7', '934f6eba-ba11-46d6-9850-e8c80f8f138e', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5dbbe45d-3227-40b2-b6d5-4cb5717c6f6d', '934f6eba-ba11-46d6-9850-e8c80f8f138e', 1, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9bb49809-cca4-42d6-a052-9ed3b5450e06', '934f6eba-ba11-46d6-9850-e8c80f8f138e', 2, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbc981a9-85a9-41ef-b66a-ccf34d870bad', '934f6eba-ba11-46d6-9850-e8c80f8f138e', 3, '6');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('934f6eba-ba11-46d6-9850-e8c80f8f138e', '5dbbe45d-3227-40b2-b6d5-4cb5717c6f6d', 'Slope = (y2-y1)/(x2-x1) = (8-2)/(3-1) = 6/2 = 3.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8c1bc43d-ae26-4d64-b7fd-003a5a6846ec', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 61, 'The equation of a circle with center at the origin and radius 5 is:', 'Mathematics', 'Coordinate Geometry — Circles', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5618bf9-5811-4009-bc88-7899852c3f21', '8c1bc43d-ae26-4d64-b7fd-003a5a6846ec', 0, 'x^2+y^2=5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a6b080a-87d7-47c2-b55d-37e343ffc260', '8c1bc43d-ae26-4d64-b7fd-003a5a6846ec', 1, 'x^2+y^2=25');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0c706fb-84e0-4285-ba76-20908357c942', '8c1bc43d-ae26-4d64-b7fd-003a5a6846ec', 2, 'x+y=25');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01d48094-a451-44b8-9076-fd6389789cc7', '8c1bc43d-ae26-4d64-b7fd-003a5a6846ec', 3, 'x^2-y^2=25');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8c1bc43d-ae26-4d64-b7fd-003a5a6846ec', '4a6b080a-87d7-47c2-b55d-37e343ffc260', 'The standard equation of a circle centered at the origin is x^2+y^2=r^2; with r=5, this is x^2+y^2=25.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a699348b-b16d-449f-84b7-df5b5a96afad', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 62, 'The equation y^2 = 8x represents a parabola with the length of its latus rectum equal to:', 'Mathematics', 'Conic Sections — Parabola', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00d7e922-ae89-46b7-94e8-f12f08819234', 'a699348b-b16d-449f-84b7-df5b5a96afad', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a40407f-38fc-49e6-b4ad-4d1bd38d9629', 'a699348b-b16d-449f-84b7-df5b5a96afad', 1, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8c7a0e1-54f3-43da-a755-ba4265ae503e', 'a699348b-b16d-449f-84b7-df5b5a96afad', 2, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('307c2e41-ff04-4a6a-b95a-9df591ce6997', 'a699348b-b16d-449f-84b7-df5b5a96afad', 3, '16');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a699348b-b16d-449f-84b7-df5b5a96afad', 'c8c7a0e1-54f3-43da-a755-ba4265ae503e', 'For y^2=4ax, the latus rectum length is 4a. Here 4a=8, so a=2, and the latus rectum itself is 4a=8.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d820801f-019f-4de4-8df2-9fe6db47d839', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 63, 'The distance between the points (1,2,3) and (4,6,3) in three-dimensional space is:', 'Mathematics', '3D Geometry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87c6a9a4-f5ca-4e22-b24b-a852bbf24d95', 'd820801f-019f-4de4-8df2-9fe6db47d839', 0, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aecfc26b-b327-4dfa-b29e-3806fbe8f0e7', 'd820801f-019f-4de4-8df2-9fe6db47d839', 1, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6521f9d-cdb7-4cc4-b7c2-9e11f89550e8', 'd820801f-019f-4de4-8df2-9fe6db47d839', 2, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2acdf5ef-0e70-40dc-8e0a-fbb55c9abf5c', 'd820801f-019f-4de4-8df2-9fe6db47d839', 3, '7');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d820801f-019f-4de4-8df2-9fe6db47d839', 'd6521f9d-cdb7-4cc4-b7c2-9e11f89550e8', 'Distance = sqrt((4-1)^2+(6-2)^2+(3-3)^2) = sqrt(9+16+0) = sqrt(25) = 5.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8a9d43dc-e31f-4542-ab49-5f2e4dd778be', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 64, 'If vector a = 3i + 4j and vector b = 4i + 3j, the dot product a.b is:', 'Mathematics', 'Vector Algebra', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0de684f6-0609-4574-a7c8-5746be9cf58a', '8a9d43dc-e31f-4542-ab49-5f2e4dd778be', 0, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33941ed4-cb07-45e4-ac0b-eac384388603', '8a9d43dc-e31f-4542-ab49-5f2e4dd778be', 1, '24');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9669d198-b0e8-41a2-8580-86ad2fc91152', '8a9d43dc-e31f-4542-ab49-5f2e4dd778be', 2, '25');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('976cf0ed-9f29-45d1-97bf-27713e1ca502', '8a9d43dc-e31f-4542-ab49-5f2e4dd778be', 3, '7');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8a9d43dc-e31f-4542-ab49-5f2e4dd778be', '33941ed4-cb07-45e4-ac0b-eac384388603', 'a.b = (3)(4) + (4)(3) = 12 + 12 = 24.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f917c220-472e-4598-8ff5-05b417e95096', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 65, 'The probability of getting an even number when a fair six-sided die is rolled once is:', 'Mathematics', 'Statistics and Probability', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c16f4fc-08f1-425c-aec4-390e3b969528', 'f917c220-472e-4598-8ff5-05b417e95096', 0, '1/6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b2b287b-b59a-46d8-a849-0d5da667daa8', 'f917c220-472e-4598-8ff5-05b417e95096', 1, '1/3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a883567-5f96-4499-94d5-51b86af7396f', 'f917c220-472e-4598-8ff5-05b417e95096', 2, '1/2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('289359df-6764-48f1-ab80-d4ea9229b6b0', 'f917c220-472e-4598-8ff5-05b417e95096', 3, '2/3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f917c220-472e-4598-8ff5-05b417e95096', '2a883567-5f96-4499-94d5-51b86af7396f', 'There are 3 even numbers (2,4,6) out of 6 equally likely outcomes, giving a probability of 3/6 = 1/2.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cd2c3ec8-611b-4081-9eb8-ff1f1951b12c', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 66, 'The value of sin(30 degrees) + cos(60 degrees) is:', 'Mathematics', 'Trigonometry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58ee29be-563a-45ce-aeeb-3e3b7c4fee7f', 'cd2c3ec8-611b-4081-9eb8-ff1f1951b12c', 0, '0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6d62bfa-9a5e-4e59-8aa6-5c78e81985d5', 'cd2c3ec8-611b-4081-9eb8-ff1f1951b12c', 1, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31247421-9125-4be0-b2de-b5610b998ffb', 'cd2c3ec8-611b-4081-9eb8-ff1f1951b12c', 2, '1.5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72492960-cf00-4665-9bf3-b14f7a4f16fa', 'cd2c3ec8-611b-4081-9eb8-ff1f1951b12c', 3, '2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cd2c3ec8-611b-4081-9eb8-ff1f1951b12c', 'a6d62bfa-9a5e-4e59-8aa6-5c78e81985d5', 'sin(30) = 0.5 and cos(60) = 0.5, so their sum is 0.5+0.5 = 1.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a75bf2bd-8716-4e10-baee-5c719e090c7c', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 67, 'The determinant of the 2x2 matrix [[2,3],[1,4]] is:', 'Mathematics', 'Matrices and Determinants', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33f0e609-d534-415b-af5f-ab0f2566b8b5', 'a75bf2bd-8716-4e10-baee-5c719e090c7c', 0, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb0e5167-cae6-4108-b250-2f627c8bfc28', 'a75bf2bd-8716-4e10-baee-5c719e090c7c', 1, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('772a1c74-2079-4ba7-b372-658707ae8dfa', 'a75bf2bd-8716-4e10-baee-5c719e090c7c', 2, '11');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('11082243-38ee-4c7a-bb9b-a4e34b6de941', 'a75bf2bd-8716-4e10-baee-5c719e090c7c', 3, '6');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a75bf2bd-8716-4e10-baee-5c719e090c7c', '33f0e609-d534-415b-af5f-ab0f2566b8b5', 'Determinant = (2)(4) - (3)(1) = 8 - 3 = 5.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f45ab485-8fc9-417e-8dff-dc111f022a49', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 68, 'The negation of the statement ''All students passed the exam'' is:', 'Mathematics', 'Mathematical Reasoning', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('647fdeaa-2186-46ed-9d30-f732b95698b7', 'f45ab485-8fc9-417e-8dff-dc111f022a49', 0, 'All students failed the exam');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc06d801-6d6e-49c9-8bcb-2dc0d8fa5d02', 'f45ab485-8fc9-417e-8dff-dc111f022a49', 1, 'No student passed the exam');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('094af937-15b6-4f6b-a7de-f2535015ebba', 'f45ab485-8fc9-417e-8dff-dc111f022a49', 2, 'At least one student did not pass the exam');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83860f82-17fa-4719-b4c6-79a7e7f5a2d7', 'f45ab485-8fc9-417e-8dff-dc111f022a49', 3, 'Every student did not pass the exam');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f45ab485-8fc9-417e-8dff-dc111f022a49', '094af937-15b6-4f6b-a7de-f2535015ebba', 'The negation of a universal statement ''All X are Y'' is ''There exists at least one X that is not Y'' — i.e., at least one student did not pass.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4f391d81-9c95-40de-945d-96745f78cab5', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 69, 'The function f(x) = x^2 has a minimum value at x equal to:', 'Mathematics', 'Application of Derivatives', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be9ab050-4de2-4e21-b577-3e2876b774a6', '4f391d81-9c95-40de-945d-96745f78cab5', 0, '-1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('449df405-97b1-4e8a-83f3-b28106cd3a80', '4f391d81-9c95-40de-945d-96745f78cab5', 1, '0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('406dad28-dca3-4e76-af15-39aeff1efece', '4f391d81-9c95-40de-945d-96745f78cab5', 2, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9db65ff3-395f-4b20-8ec6-f25d8084f59f', '4f391d81-9c95-40de-945d-96745f78cab5', 3, '2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4f391d81-9c95-40de-945d-96745f78cab5', '449df405-97b1-4e8a-83f3-b28106cd3a80', 'f''(x) = 2x = 0 at x=0; f''''(x)=2>0, confirming a minimum at x=0.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('96069429-e752-4541-88fd-04812229a3a1', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 70, 'The area under the curve y=x from x=0 to x=4, bounded by the x-axis, is:', 'Mathematics', 'Application of Integrals', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('29964bdb-110d-4c19-94e8-c6e0fccdcb8a', '96069429-e752-4541-88fd-04812229a3a1', 0, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('161f7612-d24b-407b-9e9b-9b1a226b70ac', '96069429-e752-4541-88fd-04812229a3a1', 1, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9405764-8ec1-44b9-b666-d2655918f2cc', '96069429-e752-4541-88fd-04812229a3a1', 2, '16');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7985c9f3-1f9f-447d-a112-68639ca98fe1', '96069429-e752-4541-88fd-04812229a3a1', 3, '2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('96069429-e752-4541-88fd-04812229a3a1', '161f7612-d24b-407b-9e9b-9b1a226b70ac', 'Area = integral of x dx from 0 to 4 = [x^2/2] from 0 to 4 = 16/2 - 0 = 8.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5fd73d2d-0cfd-424b-86cb-be774e6bdd0e', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 71, 'The 10th term of the arithmetic progression with first term 3 and common difference 2 is:', 'Mathematics', 'Sequences and Series — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('5fd73d2d-0cfd-424b-86cb-be774e6bdd0e', 21, 'a_n = a + (n-1)d = 3 + 9*2 = 3 + 18 = 21.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d4952213-d5fe-46ac-bac3-d4eb4b3875e9', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 72, 'The number of ways to arrange 4 distinct books on a shelf is:', 'Mathematics', 'Permutations and Combinations — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('d4952213-d5fe-46ac-bac3-d4eb4b3875e9', 24, 'Number of arrangements = 4! = 4*3*2*1 = 24.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0908e956-c048-43b3-8b04-7aed1dd5f404', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 73, 'The value of the definite integral of 2x dx from 1 to 3 is:', 'Mathematics', 'Integral Calculus — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('0908e956-c048-43b3-8b04-7aed1dd5f404', 8, 'Integral of 2x dx = x^2; evaluating from 1 to 3 gives 9 - 1 = 8.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('60cb3ecc-fb09-4bad-91a7-e4bb40540bf3', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 74, 'The value of tan(45 degrees) is:', 'Mathematics', 'Trigonometry — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('60cb3ecc-fb09-4bad-91a7-e4bb40540bf3', 1, 'tan(45 degrees) = 1, a standard trigonometric value.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('dc612770-fcf5-437f-a20d-3a35ad46e1d0', '3d50423e-abe5-4e1f-bc95-b54265aa5462', 75, 'The mean of the numbers 2, 4, 6, 8, 10 is:', 'Mathematics', 'Statistics and Probability — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('dc612770-fcf5-437f-a20d-3a35ad46e1d0', 6, 'Mean = (2+4+6+8+10)/5 = 30/5 = 6.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');
