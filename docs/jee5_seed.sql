-- ============================================================
-- JEE Main — Full Mock Paper 5
-- Full-Length Practice Paper (75 questions, 180 minutes)
-- Marking: +4 correct / -1 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('5187cc7d-28c1-4974-995b-77d8aa5b1633', 'jee-main-practice-5', 'JEE Main Full Mock Paper 5', 'jee-main', ARRAY['Physics', 'Chemistry', 'Mathematics', 'NCERT', 'JEE Main']::TEXT[], 75, 'mixed', true, 5, 180, 4, 1);

-- ── Section: Physics (25 questions) — Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('512a635d-acfa-45ac-9d38-8311ef90420f', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 1, 'The dimensional formula for the universal gravitational constant G is:', 'Physics', 'Units and Measurements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2355fde8-0d21-47cc-9482-a4abd6b7081d', '512a635d-acfa-45ac-9d38-8311ef90420f', 0, '[M^-1L^3T^-2]');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a318c4fa-17f6-4ce3-93a7-e6da81134252', '512a635d-acfa-45ac-9d38-8311ef90420f', 1, '[ML^3T^-2]');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('715591fe-7c15-4856-9138-da0f6db21dba', '512a635d-acfa-45ac-9d38-8311ef90420f', 2, '[M^-1L^2T^-2]');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4fb8b6e-0191-4e5a-82cb-d8f0dab89241', '512a635d-acfa-45ac-9d38-8311ef90420f', 3, '[ML^2T^-2]');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('512a635d-acfa-45ac-9d38-8311ef90420f', '2355fde8-0d21-47cc-9482-a4abd6b7081d', 'From F=GMm/r^2, G=Fr^2/(Mm), giving dimensions [MLT^-2][L^2]/[M^2] = [M^-1L^3T^-2].', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2fbc91fd-a74a-4c08-bbab-c015eaa4736b', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 2, 'The area under an acceleration-time graph represents the:', 'Physics', 'Motion in a Straight Line', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1cadd6d9-4cb7-4182-a2ae-c90bc41b846a', '2fbc91fd-a74a-4c08-bbab-c015eaa4736b', 0, 'Displacement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d927d33-7df7-43d1-a47f-c9bcfb6a8042', '2fbc91fd-a74a-4c08-bbab-c015eaa4736b', 1, 'Change in velocity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fcc6a939-b4e4-4bce-8661-0b368416f72b', '2fbc91fd-a74a-4c08-bbab-c015eaa4736b', 2, 'Change in position');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59acb20b-6931-411a-8d93-505e2e787f7f', '2fbc91fd-a74a-4c08-bbab-c015eaa4736b', 3, 'Jerk');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2fbc91fd-a74a-4c08-bbab-c015eaa4736b', '0d927d33-7df7-43d1-a47f-c9bcfb6a8042', 'The area under an a-t graph gives the change in velocity, since a = dv/dt, and integrating gives delta v.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4a2f490e-8838-4768-b31b-7baa1823ad6f', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 3, 'The tension in a string connecting two masses on a frictionless pulley system depends on:', 'Physics', 'Laws of Motion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb27b589-f4a9-49be-9817-e00c09beb847', '4a2f490e-8838-4768-b31b-7baa1823ad6f', 0, 'Only the total mass of the system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78cccac5-9d74-4f4a-ae4f-14e5ab662bde', '4a2f490e-8838-4768-b31b-7baa1823ad6f', 1, 'The masses of both blocks and the acceleration due to gravity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('351dc192-bb7d-416c-9fc8-ee4f6951b33b', '4a2f490e-8838-4768-b31b-7baa1823ad6f', 2, 'Only the acceleration due to gravity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('879e3f73-26ca-4322-a0d0-2348f33a3c87', '4a2f490e-8838-4768-b31b-7baa1823ad6f', 3, 'Neither mass nor gravity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4a2f490e-8838-4768-b31b-7baa1823ad6f', '78cccac5-9d74-4f4a-ae4f-14e5ab662bde', 'In an Atwood machine-type setup, tension depends on both connected masses and g, derived from applying Newton''s second law to each mass.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('dda0015a-0ec5-4d7e-a420-fdb9986530c5', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 4, 'The work-energy theorem states that the net work done on an object equals its:', 'Physics', 'Work, Energy and Power', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68400347-279a-4503-9b69-b1b6b50a950c', 'dda0015a-0ec5-4d7e-a420-fdb9986530c5', 0, 'Change in momentum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d90b541b-91b5-423f-9b93-8b727fe2019d', 'dda0015a-0ec5-4d7e-a420-fdb9986530c5', 1, 'Change in kinetic energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1838cbaf-5dd9-4ccd-b48b-1ffdd48752c3', 'dda0015a-0ec5-4d7e-a420-fdb9986530c5', 2, 'Change in potential energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df1d04f4-9e01-46a7-9b5e-118332789640', 'dda0015a-0ec5-4d7e-a420-fdb9986530c5', 3, 'Total mechanical energy');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dda0015a-0ec5-4d7e-a420-fdb9986530c5', 'd90b541b-91b5-423f-9b93-8b727fe2019d', 'The work-energy theorem: W_net = delta(KE), the change in the object''s kinetic energy.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('89fc49b3-d7ce-4b82-a50b-10480542bbe0', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 5, 'For a rolling body without slipping, the total kinetic energy is the sum of:', 'Physics', 'System of Particles and Rotational Motion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ccf8142-f889-4941-aeec-16a9763a4969', '89fc49b3-d7ce-4b82-a50b-10480542bbe0', 0, 'Only translational kinetic energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32a9c920-82ac-424d-9f1a-e75ffda906ff', '89fc49b3-d7ce-4b82-a50b-10480542bbe0', 1, 'Only rotational kinetic energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0495e700-c3d2-4928-aa10-b87bd59ee984', '89fc49b3-d7ce-4b82-a50b-10480542bbe0', 2, 'Both translational and rotational kinetic energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6d19977-6547-4ca0-852b-48103ec558eb', '89fc49b3-d7ce-4b82-a50b-10480542bbe0', 3, 'Neither, since rolling requires zero net energy');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('89fc49b3-d7ce-4b82-a50b-10480542bbe0', '0495e700-c3d2-4928-aa10-b87bd59ee984', 'A rolling body''s total KE = (1/2)mv^2 (translational) + (1/2)I*omega^2 (rotational), the sum of both contributions.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a78a6cd8-4fcd-4d4f-8398-0b85d1babcae', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 6, 'A geostationary satellite has an orbital period equal to:', 'Physics', 'Gravitation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23f7a9d8-dcd4-4714-8165-00a2b9cfda5e', 'a78a6cd8-4fcd-4d4f-8398-0b85d1babcae', 0, '24 hours, matching Earth''s rotation period');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a568c272-ca03-479c-b201-b7138bf53e5d', 'a78a6cd8-4fcd-4d4f-8398-0b85d1babcae', 1, '1 hour');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('081cdda8-c48b-4cc1-8b10-1611f9e4236b', 'a78a6cd8-4fcd-4d4f-8398-0b85d1babcae', 2, '365 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('358678af-492f-40fc-b73a-e8ccc2b450f1', 'a78a6cd8-4fcd-4d4f-8398-0b85d1babcae', 3, '1 month');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a78a6cd8-4fcd-4d4f-8398-0b85d1babcae', '23f7a9d8-dcd4-4714-8165-00a2b9cfda5e', 'A geostationary satellite must have an orbital period matching Earth''s rotation period (approximately 24 hours) and orbit in the equatorial plane.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2a5780a4-409c-411b-9f66-6d61e200c6eb', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 7, 'The equation of continuity for an incompressible fluid in steady flow states that:', 'Physics', 'Mechanical Properties of Fluids', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4be237c-e838-4924-8fcd-15b08ca42459', '2a5780a4-409c-411b-9f66-6d61e200c6eb', 0, 'Pressure remains constant throughout the flow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3561346-f919-4365-9722-73546f05e383', '2a5780a4-409c-411b-9f66-6d61e200c6eb', 1, 'The product of cross-sectional area and velocity (A*v) remains constant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32c72dbe-9a1a-4e52-842e-981f9f7907c9', '2a5780a4-409c-411b-9f66-6d61e200c6eb', 2, 'Velocity remains constant regardless of area');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6db74174-aaa3-4eab-8540-af3c8aef6dfe', '2a5780a4-409c-411b-9f66-6d61e200c6eb', 3, 'Density varies along the flow');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2a5780a4-409c-411b-9f66-6d61e200c6eb', 'd3561346-f919-4365-9722-73546f05e383', 'The continuity equation states A1*v1 = A2*v2 = constant for an incompressible fluid in steady flow, reflecting conservation of mass/volume flow rate.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f355fe94-6514-482a-80ae-beab902d8c96', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 8, 'The Celsius and Kelvin temperature scales are related by:', 'Physics', 'Thermal Properties of Matter', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46886a23-f8a3-4b5e-b9f4-92d5a25d77e7', 'f355fe94-6514-482a-80ae-beab902d8c96', 0, 'K = C + 273');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9585364c-bbf5-480f-92b3-5adc877cb078', 'f355fe94-6514-482a-80ae-beab902d8c96', 1, 'K = C - 273');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4215c39d-4d75-4bc2-938f-cb2edfc8ede5', 'f355fe94-6514-482a-80ae-beab902d8c96', 2, 'K = C * 273');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74e67888-381a-4d63-96df-193ac977037d', 'f355fe94-6514-482a-80ae-beab902d8c96', 3, 'K = C / 273');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f355fe94-6514-482a-80ae-beab902d8c96', '46886a23-f8a3-4b5e-b9f4-92d5a25d77e7', 'The Kelvin scale is related to Celsius by K = C + 273 (more precisely +273.15), with 0K being absolute zero.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('dafb68f6-6123-4345-bdd1-aaabdff368e4', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 9, 'In a cyclic process, the net change in internal energy of the system over one complete cycle is:', 'Physics', 'Thermodynamics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1fbf826-fd0a-4e97-8951-957c8f4039bb', 'dafb68f6-6123-4345-bdd1-aaabdff368e4', 0, 'Positive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d731ff9-d8a6-49fc-b983-07bae7247a48', 'dafb68f6-6123-4345-bdd1-aaabdff368e4', 1, 'Negative');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e868a475-4903-4eee-a231-19aaed45ea06', 'dafb68f6-6123-4345-bdd1-aaabdff368e4', 2, 'Zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08a3bef6-6536-44d5-aee6-d12995726211', 'dafb68f6-6123-4345-bdd1-aaabdff368e4', 3, 'Undefined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dafb68f6-6123-4345-bdd1-aaabdff368e4', 'e868a475-4903-4eee-a231-19aaed45ea06', 'Since internal energy is a state function, returning to the initial state after a complete cycle means the net change in internal energy is exactly zero.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5a23effd-cd63-49de-b247-6e4a04c00e74', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 10, 'According to the kinetic theory of gases, the pressure of a gas is due to the:', 'Physics', 'Kinetic Theory', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e05fa0f7-c47b-4bc3-82e7-a89d3a2abd3d', '5a23effd-cd63-49de-b247-6e4a04c00e74', 0, 'Weight of the gas molecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e207053-d373-45d1-a7e6-ca75747c99a3', '5a23effd-cd63-49de-b247-6e4a04c00e74', 1, 'Continuous collision of gas molecules with the container walls');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6abca49-c583-41d8-b3c6-279b7ffaa7a6', '5a23effd-cd63-49de-b247-6e4a04c00e74', 2, 'Chemical bonds between gas molecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b19c80e-796e-4795-9670-5597464f362d', '5a23effd-cd63-49de-b247-6e4a04c00e74', 3, 'Temperature of the container material');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5a23effd-cd63-49de-b247-6e4a04c00e74', '8e207053-d373-45d1-a7e6-ca75747c99a3', 'Gas pressure arises from the continuous, rapid collisions of gas molecules with the walls of their container, transferring momentum upon each impact.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ffaa16ee-208e-4d25-aad9-c0dc1da80776', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 11, 'A mass-spring system undergoing SHM has its potential energy maximum at:', 'Physics', 'Oscillations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86e8ca06-f8c0-4c19-8943-a9d6e3fcd4fb', 'ffaa16ee-208e-4d25-aad9-c0dc1da80776', 0, 'The mean position');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8ead77d-d022-479d-bcc2-290536e411bf', 'ffaa16ee-208e-4d25-aad9-c0dc1da80776', 1, 'The extreme positions (maximum displacement)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81674b55-03e0-4b48-a028-da87e3932463', 'ffaa16ee-208e-4d25-aad9-c0dc1da80776', 2, 'Exactly midway between mean and extreme positions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5061de45-2bdf-472f-941c-7341dd12d7d2', 'ffaa16ee-208e-4d25-aad9-c0dc1da80776', 3, 'Nowhere; PE is always constant');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ffaa16ee-208e-4d25-aad9-c0dc1da80776', 'd8ead77d-d022-479d-bcc2-290536e411bf', 'Potential energy in SHM, U=(1/2)kx^2, is maximum at the extreme positions (x=±A), where displacement is greatest, and zero at the mean position.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c5b97060-133a-4422-b5f9-bfa1006e559f', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 12, 'The fundamental frequency of a closed organ pipe (closed at one end) of length L, with speed of sound v, is given by:', 'Physics', 'Waves', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09bfe26a-301f-47c6-8bde-b695b8e742b1', 'c5b97060-133a-4422-b5f9-bfa1006e559f', 0, 'v/(2L)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6bf9ccaa-a27b-43f8-bd37-e3a54c27c1a9', 'c5b97060-133a-4422-b5f9-bfa1006e559f', 1, 'v/(4L)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef882883-ec54-4bdb-a74b-a125415fd675', 'c5b97060-133a-4422-b5f9-bfa1006e559f', 2, 'v/L');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('469e5895-5a53-421e-9157-0bf0564400d3', 'c5b97060-133a-4422-b5f9-bfa1006e559f', 3, '2v/L');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c5b97060-133a-4422-b5f9-bfa1006e559f', '6bf9ccaa-a27b-43f8-bd37-e3a54c27c1a9', 'A closed pipe (one end closed) supports only odd harmonics, with fundamental frequency f1 = v/(4L), since the fundamental mode has a wavelength of 4L.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5706d319-10e2-4518-9b84-0f9329aa6ae3', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 13, 'The electric field inside a uniformly charged hollow conducting sphere (with no charge inside) is:', 'Physics', 'Electric Charges and Fields', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb9c9544-0e5b-4a69-9be2-372ef5059e84', '5706d319-10e2-4518-9b84-0f9329aa6ae3', 0, 'Maximum at the centre');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04819c47-e9c8-4fb2-9250-0e518e1ac3f6', '5706d319-10e2-4518-9b84-0f9329aa6ae3', 1, 'Zero everywhere inside');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ef93072-eb04-445b-9665-5f6179b13def', '5706d319-10e2-4518-9b84-0f9329aa6ae3', 2, 'Equal to the field just outside the surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e39551c-af38-4133-ac7b-83bd582be7f4', '5706d319-10e2-4518-9b84-0f9329aa6ae3', 3, 'Directed radially inward');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5706d319-10e2-4518-9b84-0f9329aa6ae3', '04819c47-e9c8-4fb2-9250-0e518e1ac3f6', 'By Gauss''s law, since a Gaussian surface inside a hollow conducting sphere encloses zero net charge, the electric field inside is zero everywhere.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f9aff3e2-e2be-4a06-86d7-9d0e8a3a3efc', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 14, 'The energy density of the electric field in a parallel plate capacitor is given by:', 'Physics', 'Electrostatic Potential and Capacitance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee2076a9-d755-4076-b82e-dcfc511810f1', 'f9aff3e2-e2be-4a06-86d7-9d0e8a3a3efc', 0, '(1/2)*epsilon0*E^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa1d3b9a-8cb3-4a74-9972-7137c8f7cdfb', 'f9aff3e2-e2be-4a06-86d7-9d0e8a3a3efc', 1, 'epsilon0*E');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('218f0c4a-8d48-49fc-b004-4508ee17aec4', 'f9aff3e2-e2be-4a06-86d7-9d0e8a3a3efc', 2, 'epsilon0*E^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b6045a1-61d4-4539-9afe-55e2c740d568', 'f9aff3e2-e2be-4a06-86d7-9d0e8a3a3efc', 3, '(1/2)*epsilon0*E');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f9aff3e2-e2be-4a06-86d7-9d0e8a3a3efc', 'ee2076a9-d755-4076-b82e-dcfc511810f1', 'The energy stored per unit volume in an electric field is u = (1/2)*epsilon0*E^2.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7a6400de-6c14-45d6-b598-a7542bd6bb15', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 15, 'The drift velocity of free electrons in a conductor is proportional to the:', 'Physics', 'Current Electricity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e826a2c9-0d4b-48b9-9cd7-048ea9e2ca77', '7a6400de-6c14-45d6-b598-a7542bd6bb15', 0, 'Applied electric field');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('335ba1e1-de63-437e-9fd8-8c21177ecd89', '7a6400de-6c14-45d6-b598-a7542bd6bb15', 1, 'Resistance of the conductor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0de2a737-072f-4d1c-8301-1bfa2e1ac757', '7a6400de-6c14-45d6-b598-a7542bd6bb15', 2, 'Length of the conductor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff095d58-fcd6-4b46-ac59-1f6d0efbaf25', '7a6400de-6c14-45d6-b598-a7542bd6bb15', 3, 'Cross-sectional area');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7a6400de-6c14-45d6-b598-a7542bd6bb15', 'e826a2c9-0d4b-48b9-9cd7-048ea9e2ca77', 'Drift velocity v_d = (eE*tau)/m is directly proportional to the applied electric field E, where tau is the relaxation time.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0c6bc5dc-2262-4b11-b6c6-61be3321e90d', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 16, 'The force on a current-carrying conductor placed in a magnetic field is given by F = BIL*sin(theta), where theta is the angle between:', 'Physics', 'Moving Charges and Magnetism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b95edba-0e48-48f2-badb-c6159c4b4b37', '0c6bc5dc-2262-4b11-b6c6-61be3321e90d', 0, 'The current direction and the magnetic field');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73da1cd7-4ccb-4d5b-a2f8-c5cdfaadffe4', '0c6bc5dc-2262-4b11-b6c6-61be3321e90d', 1, 'The conductor''s length and its own current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73da9b96-b224-40d0-a5b2-43dbdba47392', '0c6bc5dc-2262-4b11-b6c6-61be3321e90d', 2, 'The magnetic field and the force itself');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7c48258-2c73-40e1-8584-de612118bac9', '0c6bc5dc-2262-4b11-b6c6-61be3321e90d', 3, 'The current and the resulting force');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0c6bc5dc-2262-4b11-b6c6-61be3321e90d', '9b95edba-0e48-48f2-badb-c6159c4b4b37', 'The force on a current-carrying conductor, F=BIL*sin(theta), depends on theta, the angle between the direction of current flow and the magnetic field.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f55177dd-8204-4059-a41c-ebe33656327b', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 17, 'An AC generator converts:', 'Physics', 'Electromagnetic Induction', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30e3c355-8459-4224-bc1c-08d5fb58c07f', 'f55177dd-8204-4059-a41c-ebe33656327b', 0, 'Electrical energy into mechanical energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5b297a0-9237-4880-91fb-465cf0e32e6d', 'f55177dd-8204-4059-a41c-ebe33656327b', 1, 'Mechanical energy into electrical energy via electromagnetic induction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4fcdbafc-acba-41e7-9ffc-efe5e8a45ed1', 'f55177dd-8204-4059-a41c-ebe33656327b', 2, 'Chemical energy into electrical energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3efd38bb-599b-46cb-98b3-51cb2227df99', 'f55177dd-8204-4059-a41c-ebe33656327b', 3, 'Thermal energy into electrical energy');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f55177dd-8204-4059-a41c-ebe33656327b', 'e5b297a0-9237-4880-91fb-465cf0e32e6d', 'An AC generator converts mechanical energy (rotating a coil in a magnetic field) into electrical energy via the principle of electromagnetic induction.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('59c2d291-852b-4bf2-9163-94341ab31e64', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 18, 'The reactance of a pure capacitor in an AC circuit decreases with:', 'Physics', 'Alternating Current', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37624c4e-722c-42b9-8416-0ea7d053d106', '59c2d291-852b-4bf2-9163-94341ab31e64', 0, 'Decreasing frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e6c7454-eebb-4f89-b3fc-6b1b5a3d18a9', '59c2d291-852b-4bf2-9163-94341ab31e64', 1, 'Increasing frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e8c7be8-e354-4f1f-b6c7-b18516dc47f4', '59c2d291-852b-4bf2-9163-94341ab31e64', 2, 'Increasing resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f40a6662-c530-4e10-9027-fb5ad4e59032', '59c2d291-852b-4bf2-9163-94341ab31e64', 3, 'Increasing voltage');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('59c2d291-852b-4bf2-9163-94341ab31e64', '4e6c7454-eebb-4f89-b3fc-6b1b5a3d18a9', 'Capacitive reactance X_C = 1/(omega*C) = 1/(2*pi*f*C), which decreases as frequency f increases.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d46aa924-8091-4764-97ac-cabcb14560fb', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 19, 'The process by which a heavy nucleus splits into two lighter nuclei, releasing energy, is called:', 'Physics', 'Atoms and Nuclei', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cccca3a1-b16c-43ea-8d0c-5c79d86a8fe9', 'd46aa924-8091-4764-97ac-cabcb14560fb', 0, 'Nuclear fusion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b21c76e0-769d-4c12-9f03-707d84179314', 'd46aa924-8091-4764-97ac-cabcb14560fb', 1, 'Nuclear fission');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6bbc1bfe-2b86-4385-8bde-fb6962461bd9', 'd46aa924-8091-4764-97ac-cabcb14560fb', 2, 'Radioactive decay');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35a5cc95-b21e-46bd-bc02-3b5014481d4a', 'd46aa924-8091-4764-97ac-cabcb14560fb', 3, 'Beta decay');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d46aa924-8091-4764-97ac-cabcb14560fb', 'b21c76e0-769d-4c12-9f03-707d84179314', 'Nuclear fission is the splitting of a heavy nucleus (like uranium-235) into two lighter nuclei, releasing substantial energy — the basis of nuclear power plants.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('506228b6-72b1-4d17-b430-b4b6538ae643', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 20, 'The depletion region in a p-n junction diode is formed due to:', 'Physics', 'Semiconductor Electronics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d564afe-c6dd-4270-8184-1e1913e87358', '506228b6-72b1-4d17-b430-b4b6538ae643', 0, 'Application of external voltage only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a875001-c0d0-43d8-a773-1ea2f560d9b7', '506228b6-72b1-4d17-b430-b4b6538ae643', 1, 'Diffusion of majority carriers across the junction, leaving behind immobile ions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0cb1049-b80e-48e5-be4b-029c4d81eaed', '506228b6-72b1-4d17-b430-b4b6538ae643', 2, 'Heating of the semiconductor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47722c1c-9d79-4042-87a8-67b6b78bc04c', '506228b6-72b1-4d17-b430-b4b6538ae643', 3, 'Absence of doping');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('506228b6-72b1-4d17-b430-b4b6538ae643', '0a875001-c0d0-43d8-a773-1ea2f560d9b7', 'Diffusion of electrons and holes across the junction (even with no external bias) leaves behind immobile ionized dopant atoms near the junction, forming the depletion region.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('df9450f1-b647-44e5-9aa2-8c732327401a', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 21, 'An object moving with initial velocity 10 m/s decelerates uniformly at 2 m/s^2. The time (in seconds) taken to come to rest is:', 'Physics', 'Kinematics — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('df9450f1-b647-44e5-9aa2-8c732327401a', 5, 'v=u-at; 0=10-2t, so t=10/2=5 seconds.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3256b2d2-9a0d-480f-950c-4f7329606216', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 22, 'A machine does 600 J of work in 20 seconds. Its power output (in watts) is:', 'Physics', 'Work, Energy and Power — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('3256b2d2-9a0d-480f-950c-4f7329606216', 30, 'Power = Work/time = 600/20 = 30 W.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('468bfd33-6c9c-4a88-ace7-14065fb982d6', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 23, 'A charge of 2 C moves with velocity 5 m/s perpendicular to a magnetic field of 0.5 T. The magnetic force (in newtons) on the charge is:', 'Physics', 'Moving Charges and Magnetism — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('468bfd33-6c9c-4a88-ace7-14065fb982d6', 5, 'F = qvB*sin(90) = 2*5*0.5*1 = 5 N.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0dd955c8-e91e-48ae-9501-27e799b43123', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 24, 'A wave travels 340 m in 1 second. Its speed (in m/s) is:', 'Physics', 'Waves — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('0dd955c8-e91e-48ae-9501-27e799b43123', 340, 'Speed = distance/time = 340/1 = 340 m/s.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('77a92617-1996-4165-9111-447858a3eb5f', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 25, 'Two identical capacitors of 5 microF each are connected in parallel. The equivalent capacitance (in microfarads) is:', 'Physics', 'Electrostatic Potential and Capacitance — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('77a92617-1996-4165-9111-447858a3eb5f', 10, 'For capacitors in parallel, C_eq = C1+C2 = 5+5 = 10 microF.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Chemistry (25 questions) — Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ce62b3cc-f08d-4303-a639-d5100119c85d', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 26, 'Avogadro''s number is approximately:', 'Chemistry', 'Some Basic Concepts of Chemistry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9261421f-0ae2-4597-87f4-ef40e6876977', 'ce62b3cc-f08d-4303-a639-d5100119c85d', 0, '6.022 x 10^20');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ba22b22-a724-46c7-941e-14e6425ed676', 'ce62b3cc-f08d-4303-a639-d5100119c85d', 1, '6.022 x 10^23');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3628e4d5-3820-44eb-830d-cd7f62271203', 'ce62b3cc-f08d-4303-a639-d5100119c85d', 2, '6.022 x 10^26');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b71cb8c5-e5a7-439f-baa0-04d136eedd01', 'ce62b3cc-f08d-4303-a639-d5100119c85d', 3, '3.011 x 10^23');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ce62b3cc-f08d-4303-a639-d5100119c85d', '4ba22b22-a724-46c7-941e-14e6425ed676', 'Avogadro''s number, N_A = 6.022 x 10^23 per mole, is the number of entities in one mole of any substance.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9d591a3f-6f9a-4c81-b549-99637309e3e4', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 27, 'According to the Bohr model, the energy of an electron in the nth orbit of a hydrogen atom is proportional to:', 'Chemistry', 'Structure of Atom', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12527e19-d923-47bb-bd28-c02cd7dac10d', '9d591a3f-6f9a-4c81-b549-99637309e3e4', 0, 'n');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35f0b9a1-9c91-48b2-81c1-eeadaa3b2749', '9d591a3f-6f9a-4c81-b549-99637309e3e4', 1, 'n^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4efa9d79-a489-4285-86b6-ef358c3ce843', '9d591a3f-6f9a-4c81-b549-99637309e3e4', 2, '1/n^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79a66e50-97a8-4028-b25d-b6f601e64fc0', '9d591a3f-6f9a-4c81-b549-99637309e3e4', 3, '1/n');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9d591a3f-6f9a-4c81-b549-99637309e3e4', '4efa9d79-a489-4285-86b6-ef358c3ce843', 'Bohr''s model gives E_n = -13.6/n^2 eV for hydrogen, showing energy is proportional to 1/n^2 (and negative, indicating a bound state).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('28931c96-b8c1-414b-a2f8-fda638a729ce', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 28, 'Elements are arranged in the modern periodic table in order of increasing:', 'Chemistry', 'Classification of Elements and Periodicity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06df2584-687a-4b54-9a42-87063a85bb0d', '28931c96-b8c1-414b-a2f8-fda638a729ce', 0, 'Atomic mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27317e8a-bc68-4b70-8d77-b73d61a47a22', '28931c96-b8c1-414b-a2f8-fda638a729ce', 1, 'Atomic number');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0823e81-b32d-4ada-b16c-0fa2efde5543', '28931c96-b8c1-414b-a2f8-fda638a729ce', 2, 'Number of neutrons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a38cda4-ad10-4429-8aba-bdc521e68ef2', '28931c96-b8c1-414b-a2f8-fda638a729ce', 3, 'Melting point');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('28931c96-b8c1-414b-a2f8-fda638a729ce', '27317e8a-bc68-4b70-8d77-b73d61a47a22', 'The modern periodic law (Moseley) arranges elements in order of increasing atomic number, correcting earlier discrepancies from Mendeleev''s atomic-mass-based ordering.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('278e21e5-5774-4d23-a054-ee0d017a5d66', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 29, 'The molecule with a linear shape, per VSEPR theory, among the following is:', 'Chemistry', 'Chemical Bonding and Molecular Structure', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb3df9de-b3d2-4843-993d-a9a94cfecd31', '278e21e5-5774-4d23-a054-ee0d017a5d66', 0, 'H2O');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4639b0ec-9e35-45b4-8433-fc0cb60825b0', '278e21e5-5774-4d23-a054-ee0d017a5d66', 1, 'NH3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f864c360-b987-4b55-b6df-5710aaffcf99', '278e21e5-5774-4d23-a054-ee0d017a5d66', 2, 'CO2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6cef68d-afad-44d1-97da-bea7ffc7e093', '278e21e5-5774-4d23-a054-ee0d017a5d66', 3, 'CH4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('278e21e5-5774-4d23-a054-ee0d017a5d66', 'f864c360-b987-4b55-b6df-5710aaffcf99', 'CO2 has 2 bond pairs and 0 lone pairs (AB2 type) on the central carbon, giving a linear molecular shape.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('71930273-f5cf-480b-93d6-b9ae66d7c122', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 30, 'The kinetic theory of gases assumes that gas molecules undergo collisions that are:', 'Chemistry', 'States of Matter', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cae4f62-dbcd-477f-b63a-21829abc4760', '71930273-f5cf-480b-93d6-b9ae66d7c122', 0, 'Perfectly inelastic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('865a3829-da92-400a-94f2-fb94d0842f4b', '71930273-f5cf-480b-93d6-b9ae66d7c122', 1, 'Perfectly elastic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ee3a7ba-8ef3-4edb-be66-589e8dc27f61', '71930273-f5cf-480b-93d6-b9ae66d7c122', 2, 'Partially elastic, losing energy on each collision');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9d1cfbb-6255-496c-8bd5-30d7d282aa11', '71930273-f5cf-480b-93d6-b9ae66d7c122', 3, 'Non-existent, since molecules never collide');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('71930273-f5cf-480b-93d6-b9ae66d7c122', '865a3829-da92-400a-94f2-fb94d0842f4b', 'The kinetic theory assumes gas molecule collisions (with each other and container walls) are perfectly elastic, conserving total kinetic energy.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('9ba27774-4b4e-49ff-aded-364bf5d06692', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 31, 'An exothermic reaction is one in which:', 'Chemistry', 'Thermodynamics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19ff6ca7-4650-460b-a4da-700d6a1011ca', '9ba27774-4b4e-49ff-aded-364bf5d06692', 0, 'Heat is absorbed from the surroundings');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91a8671d-9f50-4674-b23b-cb9abb147ad2', '9ba27774-4b4e-49ff-aded-364bf5d06692', 1, 'Heat is released to the surroundings');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06032df2-2abf-435e-bdbf-87341160d1fc', '9ba27774-4b4e-49ff-aded-364bf5d06692', 2, 'No heat is exchanged');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7310986-50b9-4770-8e34-5c4e8ede1c10', '9ba27774-4b4e-49ff-aded-364bf5d06692', 3, 'The reaction always proceeds slowly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9ba27774-4b4e-49ff-aded-364bf5d06692', '91a8671d-9f50-4674-b23b-cb9abb147ad2', 'An exothermic reaction releases heat to the surroundings, corresponding to a negative enthalpy change (delta H < 0).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('730c2e00-b977-4456-8d7b-0067d82b1a60', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 32, 'A strong acid is one that:', 'Chemistry', 'Equilibrium', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1553027-2aab-4460-9199-7309b62c5165', '730c2e00-b977-4456-8d7b-0067d82b1a60', 0, 'Ionizes completely in aqueous solution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d8625d0-73d4-4d6c-a4c6-28a7006ae817', '730c2e00-b977-4456-8d7b-0067d82b1a60', 1, 'Ionizes only partially in aqueous solution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0fcb470-8bff-4f4c-9842-35e1be3e36ec', '730c2e00-b977-4456-8d7b-0067d82b1a60', 2, 'Does not ionize at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('319d2caf-7c32-432f-9ff7-3b3a7f01485f', '730c2e00-b977-4456-8d7b-0067d82b1a60', 3, 'Is always a weak electrolyte');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('730c2e00-b977-4456-8d7b-0067d82b1a60', 'c1553027-2aab-4460-9199-7309b62c5165', 'Strong acids (like HCl, H2SO4, HNO3) are defined by their essentially complete ionization/dissociation in aqueous solution.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('18c89e25-23fc-4cf9-bdb9-0465e7e992d6', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 33, 'A reducing agent, in a redox reaction, is a substance that:', 'Chemistry', 'Redox Reactions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1940ef4a-0964-458e-bebc-5a57b102ea5f', '18c89e25-23fc-4cf9-bdb9-0465e7e992d6', 0, 'Gains electrons and is reduced');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aaeef61e-120a-4200-be3e-f766618754c0', '18c89e25-23fc-4cf9-bdb9-0465e7e992d6', 1, 'Loses electrons and is itself oxidized');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad7e1ada-dfc3-43ec-9690-1c0e2901e574', '18c89e25-23fc-4cf9-bdb9-0465e7e992d6', 2, 'Neither gains nor loses electrons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c69b893-1b87-4a7c-a798-3c798a5bf5db', '18c89e25-23fc-4cf9-bdb9-0465e7e992d6', 3, 'Always contains oxygen');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('18c89e25-23fc-4cf9-bdb9-0465e7e992d6', 'aaeef61e-120a-4200-be3e-f766618754c0', 'A reducing agent donates (loses) electrons and is itself oxidized in the process, thereby causing the other reactant to be reduced.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a2f0c336-52e3-429d-a7e1-d74967c4ccfc', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 34, 'The most electronegative element in the periodic table is:', 'Chemistry', 'p-Block Elements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40228c8e-50c4-44bd-9a76-b9d01938035c', 'a2f0c336-52e3-429d-a7e1-d74967c4ccfc', 0, 'Oxygen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bda7fd5-1007-4e2c-a0cd-b30da002a5cd', 'a2f0c336-52e3-429d-a7e1-d74967c4ccfc', 1, 'Chlorine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5f06bf5-cff6-4af1-8d21-e27dd0ad89fc', 'a2f0c336-52e3-429d-a7e1-d74967c4ccfc', 2, 'Fluorine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ccc126d-66c5-46d3-ad5e-c424b26aafcc', 'a2f0c336-52e3-429d-a7e1-d74967c4ccfc', 3, 'Nitrogen');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a2f0c336-52e3-429d-a7e1-d74967c4ccfc', 'b5f06bf5-cff6-4af1-8d21-e27dd0ad89fc', 'Fluorine is the most electronegative element on the Pauling scale, with a value of approximately 4.0.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('72384b06-5c65-42e3-ba65-2d0f4fa1d17c', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 35, 'Homologous series are groups of organic compounds that:', 'Chemistry', 'Organic Chemistry — Basic Principles', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e256f76b-d983-41e4-b368-7e5afccab592', '72384b06-5c65-42e3-ba65-2d0f4fa1d17c', 0, 'Have completely different chemical properties');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e55e6f8a-b1db-4d57-b57a-576876c6bb04', '72384b06-5c65-42e3-ba65-2d0f4fa1d17c', 1, 'Differ by a -CH2- unit and show a gradual change in physical properties with similar chemical properties');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c85c4ad-ed4b-4fe7-952e-da7aa158aa7a', '72384b06-5c65-42e3-ba65-2d0f4fa1d17c', 2, 'Have identical physical properties regardless of chain length');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('939cc05b-f854-4696-81b6-61357ba90532', '72384b06-5c65-42e3-ba65-2d0f4fa1d17c', 3, 'Contain no functional groups');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('72384b06-5c65-42e3-ba65-2d0f4fa1d17c', 'e55e6f8a-b1db-4d57-b57a-576876c6bb04', 'A homologous series consists of compounds with the same general formula and functional group, each differing from the next by a -CH2- unit, showing gradually changing physical properties but similar chemical behavior.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('08121313-287d-450d-8023-6e401cc46fbe', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 36, 'Cracking, an industrially important process in petroleum refining, refers to:', 'Chemistry', 'Hydrocarbons', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13275378-d48d-4bb8-a01b-299d4ce18cf5', '08121313-287d-450d-8023-6e401cc46fbe', 0, 'Combining small hydrocarbon molecules into larger ones');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('480b21b1-ee58-4f2d-b866-03cc16604aaf', '08121313-287d-450d-8023-6e401cc46fbe', 1, 'Breaking down large hydrocarbon molecules into smaller, more useful ones');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf07f37d-c696-4cd9-be27-97121e461232', '08121313-287d-450d-8023-6e401cc46fbe', 2, 'Removing sulfur impurities from petroleum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d08fae9c-4bcd-4717-8539-8693e38e8aff', '08121313-287d-450d-8023-6e401cc46fbe', 3, 'Distilling crude oil into fractions based on boiling point');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('08121313-287d-450d-8023-6e401cc46fbe', '480b21b1-ee58-4f2d-b866-03cc16604aaf', 'Cracking breaks down large, heavy hydrocarbon molecules into smaller, more valuable ones (like gasoline components), typically using heat and/or catalysts.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a31b0caa-18b7-4fbe-8950-1ebb5725d51f', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 37, 'The primary cause of the depletion of the stratospheric ozone layer is the release of:', 'Chemistry', 'Environmental Chemistry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40fd3954-ff8b-4b02-9ac7-8d9026335668', 'a31b0caa-18b7-4fbe-8950-1ebb5725d51f', 0, 'Carbon dioxide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7e6c826-faae-4b3b-95d6-39b8c5195dfd', 'a31b0caa-18b7-4fbe-8950-1ebb5725d51f', 1, 'Chlorofluorocarbons (CFCs)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85f81b76-876b-4ea5-8a57-406fc2c1956e', 'a31b0caa-18b7-4fbe-8950-1ebb5725d51f', 2, 'Water vapor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('073d0079-314a-4496-b669-0b45e5d3d1df', 'a31b0caa-18b7-4fbe-8950-1ebb5725d51f', 3, 'Nitrogen gas');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a31b0caa-18b7-4fbe-8950-1ebb5725d51f', 'd7e6c826-faae-4b3b-95d6-39b8c5195dfd', 'CFCs release chlorine radicals in the stratosphere under UV radiation, which catalytically destroy ozone molecules, driving ozone layer depletion.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b00f9c1b-c1d6-4bbd-b319-137e131004c7', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 38, 'A crystal lattice defect where an ion is missing from its normal lattice site, with no compensating ion elsewhere, is called a:', 'Chemistry', 'Solid State', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4dba21d5-b4d9-4268-970a-3de0c4627775', 'b00f9c1b-c1d6-4bbd-b319-137e131004c7', 0, 'Frenkel defect');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7b6b979-84be-42eb-9024-5ad62784373f', 'b00f9c1b-c1d6-4bbd-b319-137e131004c7', 1, 'Schottky defect (a pair of oppositely charged ion vacancies)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a818b955-5fcf-4b7c-b70a-b01694265514', 'b00f9c1b-c1d6-4bbd-b319-137e131004c7', 2, 'Interstitial defect');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('612b3a79-538e-4454-98f7-dec76cf40d4d', 'b00f9c1b-c1d6-4bbd-b319-137e131004c7', 3, 'Substitutional defect');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b00f9c1b-c1d6-4bbd-b319-137e131004c7', 'a7b6b979-84be-42eb-9024-5ad62784373f', 'A Schottky defect involves a pair of vacancies (a missing cation and a missing anion) to maintain electrical neutrality, reducing the overall density of the crystal — distinct from a Frenkel defect, where a displaced ion moves to an interstitial site rather than leaving the lattice.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0adb89f4-db67-48b8-a203-653f6f800dd2', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 39, 'The vapor pressure of a solution containing a non-volatile solute is always _____ the vapor pressure of the pure solvent.', 'Chemistry', 'Solutions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43454141-17f9-4797-9f85-8c97a074d344', '0adb89f4-db67-48b8-a203-653f6f800dd2', 0, 'Higher than');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('707e59e4-e784-4522-a23b-241c0e71fd6c', '0adb89f4-db67-48b8-a203-653f6f800dd2', 1, 'Lower than');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ec53200-d6e4-46be-96e3-016739cec0a0', '0adb89f4-db67-48b8-a203-653f6f800dd2', 2, 'Equal to');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9480877-4491-4abf-9c6f-94733658ab0c', '0adb89f4-db67-48b8-a203-653f6f800dd2', 3, 'Unrelated to');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0adb89f4-db67-48b8-a203-653f6f800dd2', '707e59e4-e784-4522-a23b-241c0e71fd6c', 'Per Raoult''s law, dissolving a non-volatile solute lowers the solvent''s mole fraction, thereby lowering the solution''s vapor pressure below that of the pure solvent.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('baaacab5-9ba1-47ae-8f89-979db0acea34', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 40, 'In an electrolytic cell, reduction occurs at the:', 'Chemistry', 'Electrochemistry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02fc4c17-11dd-4499-9388-64f76792f0bc', 'baaacab5-9ba1-47ae-8f89-979db0acea34', 0, 'Anode');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b30096c-26ac-48f1-a1cc-3b83ced0cc06', 'baaacab5-9ba1-47ae-8f89-979db0acea34', 1, 'Cathode');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a66f7c98-4eed-488d-869c-a725596b3e7f', 'baaacab5-9ba1-47ae-8f89-979db0acea34', 2, 'Salt bridge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6ebabd0-4075-455f-ab12-abe4924c98ac', 'baaacab5-9ba1-47ae-8f89-979db0acea34', 3, 'External wire');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('baaacab5-9ba1-47ae-8f89-979db0acea34', '8b30096c-26ac-48f1-a1cc-3b83ced0cc06', 'By convention, reduction always occurs at the cathode, in both galvanic and electrolytic cells.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fff19b32-c613-4a10-8375-3d541eb72750', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 41, 'The rate of a chemical reaction is generally expressed in units of:', 'Chemistry', 'Chemical Kinetics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5934ccaa-2887-41ef-b7de-c6b760d9c9fc', 'fff19b32-c613-4a10-8375-3d541eb72750', 0, 'mol/L');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6064f671-ec8a-4857-9dd3-7661c388f49f', 'fff19b32-c613-4a10-8375-3d541eb72750', 1, 'mol/(L.s)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3831ecb6-041a-495f-9eb6-6eff147a6159', 'fff19b32-c613-4a10-8375-3d541eb72750', 2, 'L/(mol.s)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c1525a4-2a60-417c-9d77-941855a0e669', 'fff19b32-c613-4a10-8375-3d541eb72750', 3, 's/mol');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fff19b32-c613-4a10-8375-3d541eb72750', '6064f671-ec8a-4857-9dd3-7661c388f49f', 'Reaction rate is typically expressed as the change in concentration per unit time, giving units of mol/(L.s).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2223cffa-a8c5-4e99-b7a9-18fda16b71a7', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 42, 'Which of the following is generally the most stable oxidation state for manganese in its compounds?', 'Chemistry', 'd and f Block Elements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de13fffe-0b76-444f-b128-8a8381472be3', '2223cffa-a8c5-4e99-b7a9-18fda16b71a7', 0, '+2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8663a6f1-a3c1-4247-871d-715f7a3deaa7', '2223cffa-a8c5-4e99-b7a9-18fda16b71a7', 1, '+4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d1f6480-0038-48a6-921c-740eea63aa07', '2223cffa-a8c5-4e99-b7a9-18fda16b71a7', 2, '+6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b55b50dc-5d8f-4d8c-ae4c-6185adff73ed', '2223cffa-a8c5-4e99-b7a9-18fda16b71a7', 3, '+7 exclusively, with no other stable states');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2223cffa-a8c5-4e99-b7a9-18fda16b71a7', 'de13fffe-0b76-444f-b128-8a8381472be3', 'While manganese exhibits a wide range of oxidation states (+2 to +7), the +2 state is generally the most stable, as seen in the relative stability of Mn2+ compounds.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('491b7a62-1294-48f7-8df1-2273ada04391', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 43, 'The term ''ligand'' in coordination chemistry refers to:', 'Chemistry', 'Coordination Compounds', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f328eac3-4698-4ed3-8a39-6f76a48470d0', '491b7a62-1294-48f7-8df1-2273ada04391', 0, 'The central metal atom or ion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70802613-f83b-4fec-a848-dc6544e2629a', '491b7a62-1294-48f7-8df1-2273ada04391', 1, 'An ion or molecule that donates a pair of electrons to the central metal atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e1303d8-78cc-4794-a608-0e1041200d47', '491b7a62-1294-48f7-8df1-2273ada04391', 2, 'The overall charge of the complex');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94878e65-b7a4-4c89-bdf7-99527183af18', '491b7a62-1294-48f7-8df1-2273ada04391', 3, 'The crystal structure of the compound');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('491b7a62-1294-48f7-8df1-2273ada04391', '70802613-f83b-4fec-a848-dc6544e2629a', 'A ligand is an ion or neutral molecule that donates one or more electron pairs to the central metal atom/ion, forming a coordinate covalent bond.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ad2d5831-855d-4ce5-80f8-3db843968c1e', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 44, 'Amines are generally classified as primary, secondary, or tertiary based on:', 'Chemistry', 'Amines', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb9bde46-8455-4636-84b4-c10bd2592d40', 'ad2d5831-855d-4ce5-80f8-3db843968c1e', 0, 'Their molecular weight');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23c939b3-60f6-4437-980d-897c63580822', 'ad2d5831-855d-4ce5-80f8-3db843968c1e', 1, 'The number of hydrogen atoms on nitrogen replaced by alkyl/aryl groups');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26d81ef7-43ef-4318-b617-a3f9fbbfe126', 'ad2d5831-855d-4ce5-80f8-3db843968c1e', 2, 'Their boiling point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70b9cb8c-c7f8-48a6-9c30-4ef427cfbe01', 'ad2d5831-855d-4ce5-80f8-3db843968c1e', 3, 'The presence of a benzene ring');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ad2d5831-855d-4ce5-80f8-3db843968c1e', '23c939b3-60f6-4437-980d-897c63580822', 'Amines are classified by how many of the three hydrogens on the parent ammonia''s nitrogen have been replaced by alkyl/aryl groups: one (primary), two (secondary), or three (tertiary).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6d563730-848e-4395-a2f0-9aea5c609bff', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 45, 'Enzymes, which act as biological catalysts, are chemically composed primarily of:', 'Chemistry', 'Biomolecules', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38bf0d66-7b3a-4590-b266-ea9cd6fc5167', '6d563730-848e-4395-a2f0-9aea5c609bff', 0, 'Carbohydrates');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1521a77-e00a-4e03-bfe8-19c39abcbd2d', '6d563730-848e-4395-a2f0-9aea5c609bff', 1, 'Proteins');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c63906d8-32d5-4658-b1ea-b2bd4020ca0a', '6d563730-848e-4395-a2f0-9aea5c609bff', 2, 'Lipids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae38157d-47a2-420c-80d1-99c730d1ff45', '6d563730-848e-4395-a2f0-9aea5c609bff', 3, 'Nucleic acids exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6d563730-848e-4395-a2f0-9aea5c609bff', 'd1521a77-e00a-4e03-bfe8-19c39abcbd2d', 'Enzymes are (with a few notable RNA-based exceptions called ribozymes) proteins that catalyze specific biochemical reactions with high specificity.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('61565029-9e69-494b-bc24-f5f29fbe520d', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 46, 'The number of grams in 0.25 mole of CaCO3 (molar mass 100 g/mol) is:', 'Chemistry', 'Some Basic Concepts of Chemistry — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('61565029-9e69-494b-bc24-f5f29fbe520d', 25, 'Mass = moles * molar mass = 0.25 * 100 = 25 g.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('cdde1c42-7ab8-4915-a81e-826d8d4f4949', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 47, 'A solution has [H+] = 10^-5 M. Its pOH (using pH+pOH=14 at 25 degrees C) is:', 'Chemistry', 'Equilibrium — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('cdde1c42-7ab8-4915-a81e-826d8d4f4949', 9, 'pH = -log(10^-5) = 5; pOH = 14 - pH = 14 - 5 = 9.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a7db8063-5512-46b4-b452-d741f5a3a999', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 48, 'The enthalpy of combustion of methane is -890 kJ/mol. The heat released (in kJ) when 0.5 mole of methane is burned is:', 'Chemistry', 'Thermodynamics — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('a7db8063-5512-46b4-b452-d741f5a3a999', 445, 'Heat released = 0.5 * 890 = 445 kJ.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('92c26dae-d6c5-47c7-8dd1-42ec19dcdb24', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 49, 'A solution contains 1 mole of solute dissolved in 1000 g of water. Its molality (in mol/kg) is:', 'Chemistry', 'Solutions — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('92c26dae-d6c5-47c7-8dd1-42ec19dcdb24', 1, 'Molality = moles of solute/mass of solvent(kg) = 1/1 = 1 mol/kg.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('aa07ce9f-6e98-4704-8bee-9a9ad3def514', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 50, 'The initial concentration of a reactant in a zero-order reaction is 0.8 mol/L, and the rate constant is 0.1 mol/(L.min). The concentration (in mol/L) remaining after 2 minutes is:', 'Chemistry', 'Chemical Kinetics — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('aa07ce9f-6e98-4704-8bee-9a9ad3def514', 0.6, 'For a zero-order reaction, [A] = [A]0 - kt = 0.8 - (0.1)(2) = 0.8 - 0.2 = 0.6 mol/L.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Mathematics (25 questions) — Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('61c645dc-bd7f-4ef6-a8a0-d3af36424891', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 51, 'The number of subsets of a set containing 4 elements is:', 'Mathematics', 'Sets, Relations and Functions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6680a2da-86d6-4992-b01f-0dcef126251a', '61c645dc-bd7f-4ef6-a8a0-d3af36424891', 0, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0642d6c1-90d1-49ab-8e7a-c90217f79517', '61c645dc-bd7f-4ef6-a8a0-d3af36424891', 1, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67ee9da9-8930-41b9-b90e-22fba09d57f9', '61c645dc-bd7f-4ef6-a8a0-d3af36424891', 2, '16');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe5e92eb-5182-43eb-8e98-cce66102125d', '61c645dc-bd7f-4ef6-a8a0-d3af36424891', 3, '4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('61c645dc-bd7f-4ef6-a8a0-d3af36424891', '67ee9da9-8930-41b9-b90e-22fba09d57f9', 'A set with n elements has 2^n subsets; for n=4, this is 2^4=16.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('801183aa-0018-4c88-b931-d80f60a974a0', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 52, 'The value of (1+i)^2, where i=sqrt(-1), is:', 'Mathematics', 'Complex Numbers', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36ae7db8-b469-40a9-809f-9fb75db56750', '801183aa-0018-4c88-b931-d80f60a974a0', 0, '2i');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('119bcd3a-8496-4863-946b-b6e0c385444a', '801183aa-0018-4c88-b931-d80f60a974a0', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbead0a4-80ef-4f73-b245-66652aeaf336', '801183aa-0018-4c88-b931-d80f60a974a0', 2, '1+2i');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8215d5e3-322c-4125-9465-2743beef063b', '801183aa-0018-4c88-b931-d80f60a974a0', 3, '-2i');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('801183aa-0018-4c88-b931-d80f60a974a0', '36ae7db8-b469-40a9-809f-9fb75db56750', '(1+i)^2 = 1 + 2i + i^2 = 1 + 2i - 1 = 2i.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b77b899c-9c8f-4bba-be6a-e6dddd381e50', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 53, 'The nature of the roots of the equation x^2 + x + 1 = 0 is:', 'Mathematics', 'Quadratic Equations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2aa40eba-8f6c-44f9-9c0a-ea40429aae5a', 'b77b899c-9c8f-4bba-be6a-e6dddd381e50', 0, 'Real and equal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('932abe78-85d0-4718-bc6d-774a577f4cf9', 'b77b899c-9c8f-4bba-be6a-e6dddd381e50', 1, 'Real and distinct');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ec14024-b956-473c-bb9a-5e0ff95f18c4', 'b77b899c-9c8f-4bba-be6a-e6dddd381e50', 2, 'Complex (non-real)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f9dad1a-e60d-44bb-b9ff-7f1f9e45dc1c', 'b77b899c-9c8f-4bba-be6a-e6dddd381e50', 3, 'Rational');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b77b899c-9c8f-4bba-be6a-e6dddd381e50', '9ec14024-b956-473c-bb9a-5e0ff95f18c4', 'Discriminant = 1^2 - 4(1)(1) = 1-4 = -3, which is negative, indicating complex (non-real) roots.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('94457e71-bc02-4083-9860-23cc4540dcd8', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 54, 'The number of ways to arrange 3 men and 2 women in a row such that all the women sit together (treating the women as one block) is:', 'Mathematics', 'Permutations and Combinations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49876d71-7361-46e7-95cb-11943bd1a3f7', '94457e71-bc02-4083-9860-23cc4540dcd8', 0, '24');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f1267a5-4abd-476a-84a4-61a1e6b34dd6', '94457e71-bc02-4083-9860-23cc4540dcd8', 1, '48');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a496d04-e558-40ce-baf1-6c4608663715', '94457e71-bc02-4083-9860-23cc4540dcd8', 2, '12');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b915462e-8592-459a-883a-fe09df6b8b54', '94457e71-bc02-4083-9860-23cc4540dcd8', 3, '120');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('94457e71-bc02-4083-9860-23cc4540dcd8', '9f1267a5-4abd-476a-84a4-61a1e6b34dd6', 'Treating the 2 women as one block gives 4 units to arrange (3 men + 1 block) = 4! = 24 ways; the 2 women within their block can be arranged in 2! = 2 ways, giving 24*2 = 48.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('56726bdc-73c5-477e-93b5-08bf2f8316fd', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 55, 'The sum of the binomial coefficients in the expansion of (1+x)^n, obtained by setting x=1, is:', 'Mathematics', 'Binomial Theorem', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('400865c4-3a49-42d6-ace2-b715f8f9b1ca', '56726bdc-73c5-477e-93b5-08bf2f8316fd', 0, 'n');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1bb7888-3910-4f5f-9625-91d89185ba21', '56726bdc-73c5-477e-93b5-08bf2f8316fd', 1, '2^n');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f243be57-5279-4485-ad04-3e93187d9822', '56726bdc-73c5-477e-93b5-08bf2f8316fd', 2, 'n^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe872484-2118-4d37-9de4-dc1794095c0f', '56726bdc-73c5-477e-93b5-08bf2f8316fd', 3, '2n');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('56726bdc-73c5-477e-93b5-08bf2f8316fd', 'b1bb7888-3910-4f5f-9625-91d89185ba21', 'Setting x=1 in (1+x)^n gives 2^n = sum of all binomial coefficients C(n,0)+C(n,1)+...+C(n,n).', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('dc36605b-b199-4275-9128-4796eb80bd7b', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 56, 'The 4th term of a geometric progression with first term 2 and common ratio -2 is:', 'Mathematics', 'Sequences and Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06416e7d-e7b2-4490-acf9-dff2e7c1a803', 'dc36605b-b199-4275-9128-4796eb80bd7b', 0, '-16');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('336211e0-1246-4d4d-b025-c10cf1d632e3', 'dc36605b-b199-4275-9128-4796eb80bd7b', 1, '16');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f68b2036-ee34-448d-8e53-24d48910ec46', 'dc36605b-b199-4275-9128-4796eb80bd7b', 2, '-8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1781f5e1-4af9-478d-87b7-62cf53cde085', 'dc36605b-b199-4275-9128-4796eb80bd7b', 3, '8');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dc36605b-b199-4275-9128-4796eb80bd7b', '06416e7d-e7b2-4490-acf9-dff2e7c1a803', 'a_4 = a*r^3 = 2*(-2)^3 = 2*(-8) = -16.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5e5ea0e5-6e78-4c4a-9a58-5247b2052ea4', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 57, 'The value of the limit as x approaches infinity of (1 + 1/x)^x is:', 'Mathematics', 'Limits, Continuity and Differentiability', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c33e2156-d135-41ad-8dcc-9c4b99ff0c9f', '5e5ea0e5-6e78-4c4a-9a58-5247b2052ea4', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e447af3f-a0bc-41ca-bbda-5d7f20f2aeb5', '5e5ea0e5-6e78-4c4a-9a58-5247b2052ea4', 1, 'e');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb962df6-c3b1-4849-90c6-e8923eb22914', '5e5ea0e5-6e78-4c4a-9a58-5247b2052ea4', 2, 'infinity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('390b112f-d98b-497c-a40f-7fd36afa6074', '5e5ea0e5-6e78-4c4a-9a58-5247b2052ea4', 3, '0');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5e5ea0e5-6e78-4c4a-9a58-5247b2052ea4', 'e447af3f-a0bc-41ca-bbda-5d7f20f2aeb5', 'This is the standard limit definition of Euler''s number: lim(x->infinity)(1+1/x)^x = e.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('48ca8ff5-04cc-4f59-8391-823fb5393cd1', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 58, 'The integral of sec^2(x) dx is:', 'Mathematics', 'Integral Calculus', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('798730bc-8acb-477d-b58e-039337173a6e', '48ca8ff5-04cc-4f59-8391-823fb5393cd1', 0, 'tan(x) + C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4c7a66e-1f55-4307-b4cb-1c3602c30468', '48ca8ff5-04cc-4f59-8391-823fb5393cd1', 1, 'sec(x) + C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('29fc0dc3-0c3e-4a06-b981-692167a5f023', '48ca8ff5-04cc-4f59-8391-823fb5393cd1', 2, 'cot(x) + C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28d161ef-0139-4f18-8c81-b34b1c56fcb5', '48ca8ff5-04cc-4f59-8391-823fb5393cd1', 3, '-tan(x) + C');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('48ca8ff5-04cc-4f59-8391-823fb5393cd1', '798730bc-8acb-477d-b58e-039337173a6e', 'The standard integral of sec^2(x) is tan(x) + C, since d/dx(tan x) = sec^2(x).', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0861a13a-8e3d-4078-9ba1-0ac3a5f4c028', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 59, 'A differential equation obtained by eliminating arbitrary constants from a family of curves represents the:', 'Mathematics', 'Differential Equations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89e63c93-c5f2-4233-8fef-1148fb38004d', '0861a13a-8e3d-4078-9ba1-0ac3a5f4c028', 0, 'Particular solution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ae482c3-ea3a-44ee-91a8-4c3123a2ee6e', '0861a13a-8e3d-4078-9ba1-0ac3a5f4c028', 1, 'General solution''s underlying differential equation for that family');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10fa7f1c-6fd7-475c-a546-71d220fce3ae', '0861a13a-8e3d-4078-9ba1-0ac3a5f4c028', 2, 'Singular solution only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4df1e9c9-11f7-4e05-ba7a-65b6ec6ba104', '0861a13a-8e3d-4078-9ba1-0ac3a5f4c028', 3, 'Integrating factor');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0861a13a-8e3d-4078-9ba1-0ac3a5f4c028', '7ae482c3-ea3a-44ee-91a8-4c3123a2ee6e', 'Eliminating the arbitrary constants from the general solution (a family of curves) yields the differential equation whose general solution is that family.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4ca97b5f-4154-47bf-aeee-5ecf655b4c4e', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 60, 'The x-intercept of the line 2x + 3y = 12 is:', 'Mathematics', 'Coordinate Geometry — Straight Lines', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb9cad26-fcb0-4619-b717-7360b7c0e8fd', '4ca97b5f-4154-47bf-aeee-5ecf655b4c4e', 0, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9f85601-684c-4010-9259-a9ef2881344c', '4ca97b5f-4154-47bf-aeee-5ecf655b4c4e', 1, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8488cea1-a62e-4408-9262-feab21611df2', '4ca97b5f-4154-47bf-aeee-5ecf655b4c4e', 2, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ea79735-766e-4394-ad26-b7e24ea884af', '4ca97b5f-4154-47bf-aeee-5ecf655b4c4e', 3, '12');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4ca97b5f-4154-47bf-aeee-5ecf655b4c4e', 'd9f85601-684c-4010-9259-a9ef2881344c', 'Setting y=0: 2x=12, so x=6, the x-intercept.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4d65e143-9217-440a-ad90-8aca302a4d68', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 61, 'A circle passing through the origin with centre (3,4) has a radius equal to:', 'Mathematics', 'Coordinate Geometry — Circles', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c1d8e2f-4999-43c7-be5b-fd70c5f43d79', '4d65e143-9217-440a-ad90-8aca302a4d68', 0, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ee97137-153a-4b4d-b021-80799e4dfa23', '4d65e143-9217-440a-ad90-8aca302a4d68', 1, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93fff8cf-6923-4c0d-914c-122cb180474b', '4d65e143-9217-440a-ad90-8aca302a4d68', 2, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49cba997-309e-4658-8a59-2bb18af3cb7c', '4d65e143-9217-440a-ad90-8aca302a4d68', 3, '7');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4d65e143-9217-440a-ad90-8aca302a4d68', '93fff8cf-6923-4c0d-914c-122cb180474b', 'Radius = distance from centre to the point on the circle (origin) = sqrt(3^2+4^2) = sqrt(25) = 5.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('37c412da-2e86-4ab7-9b9b-69fc44e68776', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 62, 'The eccentricity of a circle (a special case of an ellipse) is:', 'Mathematics', 'Conic Sections — Ellipse', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8bd75de5-a6eb-447c-b89d-215dc19ba7c2', '37c412da-2e86-4ab7-9b9b-69fc44e68776', 0, '0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32c77b9f-de07-4d01-a8da-578bc5ed1c6d', '37c412da-2e86-4ab7-9b9b-69fc44e68776', 1, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b30b8a0-1da8-479b-9ebb-261d6951478e', '37c412da-2e86-4ab7-9b9b-69fc44e68776', 2, '0.5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c8d49a3-d5ff-4e49-af3f-23e1e41d8431', '37c412da-2e86-4ab7-9b9b-69fc44e68776', 3, 'Undefined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('37c412da-2e86-4ab7-9b9b-69fc44e68776', '8bd75de5-a6eb-447c-b89d-215dc19ba7c2', 'A circle is the special case of an ellipse with equal semi-axes (a=b), giving an eccentricity of exactly 0.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8256a91c-05f8-4a70-a60d-bcf8f40984c8', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 63, 'The direction cosines (l,m,n) of any line satisfy the relation:', 'Mathematics', '3D Geometry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98b0c635-457f-4659-b576-29e765cc7194', '8256a91c-05f8-4a70-a60d-bcf8f40984c8', 0, 'l+m+n=1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2192a533-6632-4e7d-90b5-0dde05dac827', '8256a91c-05f8-4a70-a60d-bcf8f40984c8', 1, 'l^2+m^2+n^2=1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7d7c22b-69ed-40e1-ac58-27bc4d2a97b5', '8256a91c-05f8-4a70-a60d-bcf8f40984c8', 2, 'lmn=1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63711f66-f663-4ce4-b169-16ebcae8cdab', '8256a91c-05f8-4a70-a60d-bcf8f40984c8', 3, 'l-m-n=0');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8256a91c-05f8-4a70-a60d-bcf8f40984c8', '2192a533-6632-4e7d-90b5-0dde05dac827', 'For any line, the direction cosines satisfy l^2+m^2+n^2=1, a fundamental identity in 3D coordinate geometry.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('ab0ea358-9253-4154-b219-2853adce7f07', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 64, 'The unit vector in the direction of the vector a=3i+4j is:', 'Mathematics', 'Vector Algebra', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d000b21-0066-4675-8b96-2eac57b854c5', 'ab0ea358-9253-4154-b219-2853adce7f07', 0, '(3i+4j)/5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f33853e-dc31-4a3f-89ae-3688bc6c4682', 'ab0ea358-9253-4154-b219-2853adce7f07', 1, '(3i+4j)/7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eca659af-f87d-4346-ba53-db7f545ed700', 'ab0ea358-9253-4154-b219-2853adce7f07', 2, '3i+4j');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c79f3e4-60c2-4d22-8b03-ac5e8941900b', 'ab0ea358-9253-4154-b219-2853adce7f07', 3, '(3i+4j)/25');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ab0ea358-9253-4154-b219-2853adce7f07', '7d000b21-0066-4675-8b96-2eac57b854c5', '|a| = sqrt(3^2+4^2) = 5; the unit vector is a/|a| = (3i+4j)/5.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d3b7f1d2-b98a-4dd1-b6b1-0d2f151e7fa3', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 65, 'If two events A and B are such that P(A)=0.5, P(B)=0.3, and P(A intersection B)=0.1, then P(A union B) is:', 'Mathematics', 'Statistics and Probability', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c2d736a-74ed-4cc3-bbf4-b7adbaf7813b', 'd3b7f1d2-b98a-4dd1-b6b1-0d2f151e7fa3', 0, '0.6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2072323e-c8dc-4bf4-a904-12a8b8e2ad4b', 'd3b7f1d2-b98a-4dd1-b6b1-0d2f151e7fa3', 1, '0.7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9b4e238-246d-4068-8275-5302fe0a6945', 'd3b7f1d2-b98a-4dd1-b6b1-0d2f151e7fa3', 2, '0.8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9104606-beb8-44a3-88a5-81a5d6a1c9b8', 'd3b7f1d2-b98a-4dd1-b6b1-0d2f151e7fa3', 3, '0.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d3b7f1d2-b98a-4dd1-b6b1-0d2f151e7fa3', '2072323e-c8dc-4bf4-a904-12a8b8e2ad4b', 'P(A union B) = P(A)+P(B)-P(A intersection B) = 0.5+0.3-0.1 = 0.7.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('31df32c5-97b2-401d-a2be-884ddd4714ec', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 66, 'The period of the function f(x) = sin(x) is:', 'Mathematics', 'Trigonometry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0ec216d-b070-40ed-94e7-c89169b79bfe', '31df32c5-97b2-401d-a2be-884ddd4714ec', 0, 'pi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ebb3e30-9c8f-4e0e-b3aa-7a3efd4dca89', '31df32c5-97b2-401d-a2be-884ddd4714ec', 1, '2*pi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('915fd29f-c9b5-4c1b-8791-836fd26dffff', '31df32c5-97b2-401d-a2be-884ddd4714ec', 2, 'pi/2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54391993-07ab-4057-8ebd-634d63b4fe82', '31df32c5-97b2-401d-a2be-884ddd4714ec', 3, '4*pi');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('31df32c5-97b2-401d-a2be-884ddd4714ec', '9ebb3e30-9c8f-4e0e-b3aa-7a3efd4dca89', 'The sine function has a fundamental period of 2*pi, repeating its values every 2*pi radians.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bbc16977-5e60-4413-a5f5-3dcd5782d1d3', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 67, 'A matrix A is called symmetric if:', 'Mathematics', 'Matrices and Determinants', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d9dfa4d-0cb3-4e86-b716-034455b34730', 'bbc16977-5e60-4413-a5f5-3dcd5782d1d3', 0, 'A = -A^T (transpose)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da6e6d2d-0adc-4190-8ffd-d8f65514873f', 'bbc16977-5e60-4413-a5f5-3dcd5782d1d3', 1, 'A = A^T (transpose)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1bb9a49-0382-4ff2-8777-a8a79f6ec802', 'bbc16977-5e60-4413-a5f5-3dcd5782d1d3', 2, 'A is a square matrix with all zero entries');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c61b9bd2-d768-4b0e-8d48-eb0e7c10a2bb', 'bbc16977-5e60-4413-a5f5-3dcd5782d1d3', 3, 'A^2 = A');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bbc16977-5e60-4413-a5f5-3dcd5782d1d3', 'da6e6d2d-0adc-4190-8ffd-d8f65514873f', 'A symmetric matrix satisfies A = A^T, meaning it equals its own transpose (entries are mirrored across the main diagonal).', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f0bd50bd-0599-401d-ab97-4d03a2765784', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 68, 'A statement that is always true, regardless of the truth values of its components, is called a:', 'Mathematics', 'Mathematical Reasoning', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed0eef88-6120-4ffb-9fae-8d6fd6ad45bb', 'f0bd50bd-0599-401d-ab97-4d03a2765784', 0, 'Contradiction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9732c0f-3ec4-4529-b6d1-fc03cbccc8f7', 'f0bd50bd-0599-401d-ab97-4d03a2765784', 1, 'Tautology');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6de0f7ec-152b-4a3c-945a-63e13f8a2ab0', 'f0bd50bd-0599-401d-ab97-4d03a2765784', 2, 'Contingency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28e4e1bb-4e26-4422-a0ef-f81a4557cd87', 'f0bd50bd-0599-401d-ab97-4d03a2765784', 3, 'Negation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f0bd50bd-0599-401d-ab97-4d03a2765784', 'e9732c0f-3ec4-4529-b6d1-fc03cbccc8f7', 'A tautology is a compound statement that is true under every possible truth-value assignment of its component statements.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('009c0b02-50f5-4cea-ba11-a16b365fb35c', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 69, 'For the function f(x)=x^3-3x^2+2, the critical points occur where f''(x)=0. The critical points are at x equal to:', 'Mathematics', 'Application of Derivatives', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6dbdcdd-3d32-4c0b-87d6-c46e68810971', '009c0b02-50f5-4cea-ba11-a16b365fb35c', 0, '0 and 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6efb02b1-fa40-4117-b8c9-4801b508af1a', '009c0b02-50f5-4cea-ba11-a16b365fb35c', 1, '0 and 2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c363df9e-f8fe-4649-9256-1ce7f37b87c9', '009c0b02-50f5-4cea-ba11-a16b365fb35c', 2, '1 and -1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e77346c-0675-4623-a883-2949a1a5f8b6', '009c0b02-50f5-4cea-ba11-a16b365fb35c', 3, '2 and -2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('009c0b02-50f5-4cea-ba11-a16b365fb35c', '6efb02b1-fa40-4117-b8c9-4801b508af1a', 'f''(x) = 3x^2-6x = 3x(x-2) = 0, giving critical points at x=0 and x=2.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('042dedb3-d2ad-4fee-b869-05261b60b203', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 70, 'The area under the curve y=2x from x=1 to x=3 is:', 'Mathematics', 'Application of Integrals', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60121e13-82a5-44bb-8e5b-7a1a12052910', '042dedb3-d2ad-4fee-b869-05261b60b203', 0, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3525f05b-5ae7-4e3d-875c-6618a2dacca3', '042dedb3-d2ad-4fee-b869-05261b60b203', 1, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a90e0dcc-b5dc-475f-a946-3bae881c5272', '042dedb3-d2ad-4fee-b869-05261b60b203', 2, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d99b6c6-5f81-41dc-9219-b1878b4909f1', '042dedb3-d2ad-4fee-b869-05261b60b203', 3, '10');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('042dedb3-d2ad-4fee-b869-05261b60b203', 'a90e0dcc-b5dc-475f-a946-3bae881c5272', 'Area = integral of 2x dx from 1 to 3 = [x^2] from 1 to 3 = 9 - 1 = 8.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('05c5c448-e95f-4d7c-823a-c8642e380846', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 71, 'The sum of the first 15 terms of the arithmetic progression with first term 1 and common difference 1 (i.e., 1+2+3+...+15) is:', 'Mathematics', 'Sequences and Series — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('05c5c448-e95f-4d7c-823a-c8642e380846', 120, 'Sum = n(n+1)/2 = 15*16/2 = 120.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('83674816-8669-44b7-a421-6606dd42c5eb', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 72, 'The value of 6P2 (permutations of 6 items taken 2 at a time) is:', 'Mathematics', 'Permutations and Combinations — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('83674816-8669-44b7-a421-6606dd42c5eb', 30, 'P(n,r) = n!/(n-r)! ; P(6,2) = 6!/4! = 6*5 = 30.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b656df3e-c190-4101-abd8-bde0284db7de', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 73, 'The value of the definite integral of 5 dx from 2 to 6 is:', 'Mathematics', 'Integral Calculus — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('b656df3e-c190-4101-abd8-bde0284db7de', 20, 'Integral of a constant 5 over [2,6] = 5*(6-2) = 5*4 = 20.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('4a95840f-ab67-4a4d-a28b-ecfa9914a42f', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 74, 'The value of cos^2(45 degrees) + sin^2(45 degrees) is:', 'Mathematics', 'Trigonometry — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('4a95840f-ab67-4a4d-a28b-ecfa9914a42f', 1, 'By the Pythagorean identity, sin^2(theta)+cos^2(theta)=1 for any angle, including 45 degrees.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a0607493-58c7-4c3a-a678-8a92c996c46a', '5187cc7d-28c1-4974-995b-77d8aa5b1633', 75, 'The median of the data set 3, 7, 9, 11, 15 is:', 'Mathematics', 'Statistics and Probability — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('a0607493-58c7-4c3a-a678-8a92c996c46a', 9, 'For an odd number of ordered data points, the median is the middle value; here, with 5 values in order, the middle (3rd) value is 9.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');
