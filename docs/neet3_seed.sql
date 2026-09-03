-- ============================================================
-- NEET UG — Full Mock Paper 3
-- Full-Length Practice Paper (180 questions, 180 minutes)
-- Marking: +4 correct / -1 incorrect (official NEET UG scheme)
-- Run this AFTER docs/add-question-subject-marking.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('3f466e21-da51-45e3-98f9-c6b771faa1ea', 'neet-practice-3', 'NEET UG Full Mock Paper 3', 'neet', ARRAY['Physics', 'Chemistry', 'Biology', 'Botany', 'Zoology', 'NCERT', 'NEET UG']::TEXT[], 180, 'mixed', true, 3, 180, 4, 1);

-- ── Section: Physics (45 questions) — Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('86f60789-56e9-492f-9924-efef7394a77f', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 1, 'Which of the following pairs has the same dimensional formula?', 'Physics', 'Units and Measurements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef480a11-7301-4781-8667-214f5742f4ab', '86f60789-56e9-492f-9924-efef7394a77f', 0, 'Work and torque');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aca13480-11e9-4ea5-983d-8e8659af6807', '86f60789-56e9-492f-9924-efef7394a77f', 1, 'Force and pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a60bae7e-ca98-433e-95ff-8bbaa79b93f5', '86f60789-56e9-492f-9924-efef7394a77f', 2, 'Momentum and impulse only by coincidence, never dimensionally');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d673d4b2-12e8-4fdd-97da-6f45d385b950', '86f60789-56e9-492f-9924-efef7394a77f', 3, 'Energy and power');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('86f60789-56e9-492f-9924-efef7394a77f', 'ef480a11-7301-4781-8667-214f5742f4ab', 'Both work (F.d) and torque (F x r) have the dimensional formula [ML^2T^-2], even though they are conceptually different (scalar vs vector-like quantities).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5665c74a-82f4-41b0-9058-94de38fab57f', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 2, 'The area under a velocity-time graph represents:', 'Physics', 'Motion in a Straight Line');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e484c77-bc86-417d-882c-6ae69e47b2b6', '5665c74a-82f4-41b0-9058-94de38fab57f', 0, 'Acceleration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d45ce12-b774-4351-9978-19f09f418fc6', '5665c74a-82f4-41b0-9058-94de38fab57f', 1, 'Displacement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e68d71e6-c34c-477b-93c7-435ec0c6953e', '5665c74a-82f4-41b0-9058-94de38fab57f', 2, 'Jerk');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10c2ec38-0446-43ef-8df3-cee0abb1de63', '5665c74a-82f4-41b0-9058-94de38fab57f', 3, 'Force');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5665c74a-82f4-41b0-9058-94de38fab57f', '6d45ce12-b774-4351-9978-19f09f418fc6', 'The area enclosed between the velocity-time curve and the time axis gives the displacement of the object over that time interval.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d8c9f23e-3093-45f0-a359-729aaff77e0c', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 3, 'A person standing in a lift feels heavier than usual when the lift is:', 'Physics', 'Laws of Motion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4946e101-4bb7-43a5-9c70-9c177e8f1505', 'd8c9f23e-3093-45f0-a359-729aaff77e0c', 0, 'Moving upward with constant velocity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e83acee3-5fb3-485a-9560-b6b2d9a819ec', 'd8c9f23e-3093-45f0-a359-729aaff77e0c', 1, 'Accelerating upward (or decelerating while moving downward)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e40fd57-a672-4e10-bc52-fd2a5e9e19a3', 'd8c9f23e-3093-45f0-a359-729aaff77e0c', 2, 'In free fall');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d6a7e9f-f75d-4d2a-8259-95f755772433', 'd8c9f23e-3093-45f0-a359-729aaff77e0c', 3, 'Stationary only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d8c9f23e-3093-45f0-a359-729aaff77e0c', 'e83acee3-5fb3-485a-9560-b6b2d9a819ec', 'When the lift accelerates upward, the normal (apparent) reaction force from the floor must exceed the person''s weight to also provide the net upward acceleration, making them feel heavier.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5e9dd2ca-32eb-4116-8f39-63f980fa9128', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 4, 'The kinetic energy of an object of mass m moving with velocity v is given by:', 'Physics', 'Work, Energy and Power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('010572a9-d092-4f88-90ad-94e9a2942793', '5e9dd2ca-32eb-4116-8f39-63f980fa9128', 0, 'mv');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('704175a2-91b9-43d5-855b-3e2466833c3a', '5e9dd2ca-32eb-4116-8f39-63f980fa9128', 1, '(1/2)mv');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4ff7726-a286-4552-aa61-7f5e66698708', '5e9dd2ca-32eb-4116-8f39-63f980fa9128', 2, '(1/2)mv^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88741a29-eba1-471c-a388-63937566408d', '5e9dd2ca-32eb-4116-8f39-63f980fa9128', 3, 'mv^2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5e9dd2ca-32eb-4116-8f39-63f980fa9128', 'f4ff7726-a286-4552-aa61-7f5e66698708', 'Kinetic energy KE = (1/2)mv^2, derived from the work-energy theorem for a body accelerated from rest to velocity v.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('239fcb4d-8ba1-49e3-8c94-2b03a8ff0c0f', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 5, 'The moment of inertia of a thin uniform ring of mass M and radius R about an axis through its centre, perpendicular to its plane, is:', 'Physics', 'System of Particles and Rotational Motion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5514245-f3c1-4e8f-964e-b5d8ce607862', '239fcb4d-8ba1-49e3-8c94-2b03a8ff0c0f', 0, 'MR^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af651d3a-9e78-4bd5-82a5-ef55f9cdf391', '239fcb4d-8ba1-49e3-8c94-2b03a8ff0c0f', 1, '(1/2)MR^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7042d0f3-0246-4c3b-b33c-724c0ba3ff2b', '239fcb4d-8ba1-49e3-8c94-2b03a8ff0c0f', 2, '(2/5)MR^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfaa949a-1988-4922-8c01-5d4955a60e30', '239fcb4d-8ba1-49e3-8c94-2b03a8ff0c0f', 3, '(1/4)MR^2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('239fcb4d-8ba1-49e3-8c94-2b03a8ff0c0f', 'a5514245-f3c1-4e8f-964e-b5d8ce607862', 'For a thin ring, all mass lies at radius R from the axis, giving I = MR^2 directly, unlike a solid disc ((1/2)MR^2) where mass is distributed inward.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('fe937468-58cf-4145-954e-6e08a0b4f464', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 6, 'The orbital velocity of a satellite in a circular orbit close to Earth''s surface is approximately:', 'Physics', 'Gravitation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80683b86-ad10-4a70-a499-26ad7f5a9d87', 'fe937468-58cf-4145-954e-6e08a0b4f464', 0, '11.2 km/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a83158c1-5e21-48f4-887e-17eb5ecd390c', 'fe937468-58cf-4145-954e-6e08a0b4f464', 1, '7.9 km/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c05616ab-cf03-476f-89b5-dac8ac4a590b', 'fe937468-58cf-4145-954e-6e08a0b4f464', 2, '3.1 km/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a19a463-d683-4aa4-bafa-13ab0bc31338', 'fe937468-58cf-4145-954e-6e08a0b4f464', 3, '9.8 km/s');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fe937468-58cf-4145-954e-6e08a0b4f464', 'a83158c1-5e21-48f4-887e-17eb5ecd390c', 'The orbital velocity for a near-surface circular orbit, v = sqrt(gR), is approximately 7.9 km/s for Earth, distinct from the escape velocity of about 11.2 km/s.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('abcea018-d33c-4536-9dbf-88c60eb462ce', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 7, 'Within the elastic limit, the ratio of stress to strain for a given material is:', 'Physics', 'Mechanical Properties of Solids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd406266-74fe-4829-bf63-4dd4a72ff3ec', 'abcea018-d33c-4536-9dbf-88c60eb462ce', 0, 'Always zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc3489a6-edfc-4db4-b1a8-82c842f2d8fb', 'abcea018-d33c-4536-9dbf-88c60eb462ce', 1, 'A constant, known as the modulus of elasticity for that type of deformation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('754792eb-7d53-4295-8a25-4adc505b591c', 'abcea018-d33c-4536-9dbf-88c60eb462ce', 2, 'Dependent on the applied force''s direction only, not the material');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92e01906-e209-488d-9156-8a66a9d48a36', 'abcea018-d33c-4536-9dbf-88c60eb462ce', 3, 'Infinite');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('abcea018-d33c-4536-9dbf-88c60eb462ce', 'dc3489a6-edfc-4db4-b1a8-82c842f2d8fb', 'Within the elastic limit, stress is proportional to strain (Hooke''s law), and their constant ratio defines the relevant modulus of elasticity (Young''s, shear, or bulk modulus depending on deformation type).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a77d00c4-075f-4f96-874a-a3f5e59438d7', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 8, 'According to the equation of continuity for an incompressible fluid in streamline flow, as the cross-sectional area of a pipe decreases, the fluid''s velocity:', 'Physics', 'Mechanical Properties of Fluids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac7bc348-2558-4b70-9635-7c4926d1ecc1', 'a77d00c4-075f-4f96-874a-a3f5e59438d7', 0, 'Decreases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a28d042-0b74-40b7-8361-61e8c82f7fab', 'a77d00c4-075f-4f96-874a-a3f5e59438d7', 1, 'Increases, since A*v must remain constant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7fa2ef1-84cb-4c18-8395-9cfe4297cfce', 'a77d00c4-075f-4f96-874a-a3f5e59438d7', 2, 'Remains unchanged');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28809f12-6a70-44c2-ba26-989f5201e45b', 'a77d00c4-075f-4f96-874a-a3f5e59438d7', 3, 'Becomes exactly zero');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a77d00c4-075f-4f96-874a-a3f5e59438d7', '2a28d042-0b74-40b7-8361-61e8c82f7fab', 'The continuity equation A1*v1 = A2*v2 requires velocity to increase where the cross-sectional area decreases, keeping the volume flow rate constant for an incompressible fluid.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('659a8119-0849-4375-bb57-0e1973d1c5d7', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 9, 'The Celsius and Fahrenheit temperature scales are related such that 0 degrees Celsius corresponds to:', 'Physics', 'Thermal Properties of Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f7fc59f-5133-42d2-90a8-d2515e46c4df', '659a8119-0849-4375-bb57-0e1973d1c5d7', 0, '0 degrees Fahrenheit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8250b62-fcec-4027-9432-b6f171e77e2a', '659a8119-0849-4375-bb57-0e1973d1c5d7', 1, '32 degrees Fahrenheit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38407572-ee66-4cf5-9c61-604e31a4cf4c', '659a8119-0849-4375-bb57-0e1973d1c5d7', 2, '100 degrees Fahrenheit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a6225e5-e183-40c7-bdfd-703001cd9772', '659a8119-0849-4375-bb57-0e1973d1c5d7', 3, '273 degrees Fahrenheit');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('659a8119-0849-4375-bb57-0e1973d1c5d7', 'd8250b62-fcec-4027-9432-b6f171e77e2a', 'The freezing point of water, 0 degrees C, corresponds to 32 degrees F, following the conversion F = (9/5)C + 32.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5999aaa1-26b2-4b16-a354-982332c33a5a', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 10, 'The first law of thermodynamics is essentially a statement of the conservation of:', 'Physics', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff641cab-2b6c-4980-8058-3dd3f382774c', '5999aaa1-26b2-4b16-a354-982332c33a5a', 0, 'Momentum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9968a0f7-c86a-4fc1-baee-2caf36a6b0b3', '5999aaa1-26b2-4b16-a354-982332c33a5a', 1, 'Energy (delta U = Q - W)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4297f65-9112-4666-8ec8-8475e05510a2', '5999aaa1-26b2-4b16-a354-982332c33a5a', 2, 'Mass only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6402903e-15d9-4146-8c34-93d497e7f8af', '5999aaa1-26b2-4b16-a354-982332c33a5a', 3, 'Entropy');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5999aaa1-26b2-4b16-a354-982332c33a5a', '9968a0f7-c86a-4fc1-baee-2caf36a6b0b3', 'The first law states that the change in internal energy of a system equals heat added minus work done by the system — a direct statement of energy conservation applied to thermodynamic systems.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7f7e3375-db0b-4d14-87ef-e4e6ac732c0e', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 11, 'The root mean square (rms) speed of gas molecules is directly proportional to the square root of:', 'Physics', 'Kinetic Theory');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42863ae1-73ee-458f-8c12-6231b04a8cb6', '7f7e3375-db0b-4d14-87ef-e4e6ac732c0e', 0, 'Pressure only, independent of temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94987ad1-be0c-44b8-a88f-2aabf096917f', '7f7e3375-db0b-4d14-87ef-e4e6ac732c0e', 1, 'Absolute temperature, and inversely to the square root of molar mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37cf942d-1d4a-407e-9f7a-d42f5b14e326', '7f7e3375-db0b-4d14-87ef-e4e6ac732c0e', 2, 'Volume of the container');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4f5b441-d331-40b4-b072-fa9bc2ae5c60', '7f7e3375-db0b-4d14-87ef-e4e6ac732c0e', 3, 'The number of molecules present');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7f7e3375-db0b-4d14-87ef-e4e6ac732c0e', '94987ad1-be0c-44b8-a88f-2aabf096917f', 'The rms speed formula v_rms = sqrt(3RT/M) shows direct proportionality to sqrt(T) and inverse proportionality to sqrt(M), the molar mass of the gas.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('721146e6-0a0e-4464-8cb3-506bae9a873c', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 12, 'The frequency of oscillation of a mass-spring system (mass m, spring constant k) is given by:', 'Physics', 'Oscillations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c9c1066-3ce7-4191-8ad7-eb77fe089db9', '721146e6-0a0e-4464-8cb3-506bae9a873c', 0, 'f = (1/2*pi)*sqrt(k/m)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6be8147-85f8-4337-b0dc-7aa33288be12', '721146e6-0a0e-4464-8cb3-506bae9a873c', 1, 'f = 2*pi*sqrt(m/k)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55d54757-93e9-479c-b10e-873002cce52c', '721146e6-0a0e-4464-8cb3-506bae9a873c', 2, 'f = sqrt(k/m)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e020b928-7b04-43a3-af08-6b6fa9964dc3', '721146e6-0a0e-4464-8cb3-506bae9a873c', 3, 'f = (1/2*pi)*sqrt(m/k)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('721146e6-0a0e-4464-8cb3-506bae9a873c', '9c9c1066-3ce7-4191-8ad7-eb77fe089db9', 'For a mass-spring SHM system, angular frequency omega = sqrt(k/m), and frequency f = omega/(2*pi) = (1/2*pi)*sqrt(k/m).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6d90f9de-752f-4de9-bd5f-d7df7d37c830', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 13, 'The intensity of sound is measured on a logarithmic scale in units of:', 'Physics', 'Waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05d8e43f-5a36-4685-a42b-c27672b595ca', '6d90f9de-752f-4de9-bd5f-d7df7d37c830', 0, 'Hertz');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3137e781-eea5-46e7-a1b5-95e0812bf1cb', '6d90f9de-752f-4de9-bd5f-d7df7d37c830', 1, 'Decibels');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cacd378f-1985-4917-97f1-ba57809dc27a', '6d90f9de-752f-4de9-bd5f-d7df7d37c830', 2, 'Newtons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dca851ce-468b-4a34-84eb-a78be721f67b', '6d90f9de-752f-4de9-bd5f-d7df7d37c830', 3, 'Watts per second');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6d90f9de-752f-4de9-bd5f-d7df7d37c830', '3137e781-eea5-46e7-a1b5-95e0812bf1cb', 'Sound intensity level is expressed in decibels (dB), a logarithmic unit that compresses the huge range of audible sound intensities into a more manageable scale.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9e94c632-2654-44f8-b648-c425dd51eb9f', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 14, 'The SI unit of electric field intensity is:', 'Physics', 'Electric Charges and Fields');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a01050bc-1903-4844-b1c1-4a96e018c306', '9e94c632-2654-44f8-b648-c425dd51eb9f', 0, 'Coulomb');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('faeedb18-8a69-4159-b919-95e766b35c5e', '9e94c632-2654-44f8-b648-c425dd51eb9f', 1, 'Newton per coulomb (or volt per metre)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f3c1564c-5110-4f9b-89a3-6b8d54dd4760', '9e94c632-2654-44f8-b648-c425dd51eb9f', 2, 'Farad');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43dabbac-afb6-45b9-86bb-e3b356994252', '9e94c632-2654-44f8-b648-c425dd51eb9f', 3, 'Ohm');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9e94c632-2654-44f8-b648-c425dd51eb9f', 'faeedb18-8a69-4159-b919-95e766b35c5e', 'Electric field intensity E is force per unit charge, measured in N/C, which is dimensionally equivalent to V/m.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('545b29ff-9988-49fd-8f9e-4400fae0f032', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 15, 'Energy stored in a charged capacitor of capacitance C, charged to potential V, is given by:', 'Physics', 'Electrostatic Potential and Capacitance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd8f3f5a-3ce0-43ba-8f3c-ee673ae6b1b9', '545b29ff-9988-49fd-8f9e-4400fae0f032', 0, 'CV');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('880490df-1485-46d6-82a3-70a9fe1eb593', '545b29ff-9988-49fd-8f9e-4400fae0f032', 1, '(1/2)CV^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2934ce17-56c6-4cf7-bbb5-4282c0352038', '545b29ff-9988-49fd-8f9e-4400fae0f032', 2, 'CV^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('227a592b-38f2-4bef-96a7-2057886b91c7', '545b29ff-9988-49fd-8f9e-4400fae0f032', 3, 'C/V');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('545b29ff-9988-49fd-8f9e-4400fae0f032', '880490df-1485-46d6-82a3-70a9fe1eb593', 'Energy stored in a capacitor: U = (1/2)CV^2 = Q^2/(2C) = (1/2)QV.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a70ff12e-83b1-477c-ad73-9761534ecd19', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 16, 'Resistivity of a conductor depends on:', 'Physics', 'Current Electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6ee5652-f2f5-43a0-bc2f-dab47f0170c9', 'a70ff12e-83b1-477c-ad73-9761534ecd19', 0, 'The length of the conductor only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d0c62f3-a491-4ed9-a432-45457da464c9', 'a70ff12e-83b1-477c-ad73-9761534ecd19', 1, 'The material of the conductor and its temperature, but not its dimensions (length/area)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33276b22-838f-411d-99ab-e8463e9c60bf', 'a70ff12e-83b1-477c-ad73-9761534ecd19', 2, 'The cross-sectional area only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d25ca50-9cdb-4310-b471-ead7e260c417', 'a70ff12e-83b1-477c-ad73-9761534ecd19', 3, 'The current flowing through it');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a70ff12e-83b1-477c-ad73-9761534ecd19', '3d0c62f3-a491-4ed9-a432-45457da464c9', 'Resistivity (rho) is an intrinsic material property depending on the material''s nature and temperature, unlike resistance itself (R = rho*L/A), which does depend on the conductor''s dimensions.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c84e0291-d2f5-4f29-9957-aff39e238858', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 17, 'Two long, straight, parallel current-carrying conductors carrying current in the same direction will:', 'Physics', 'Moving Charges and Magnetism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12316d9e-657e-4774-ade6-c5e8f96e5fbc', 'c84e0291-d2f5-4f29-9957-aff39e238858', 0, 'Repel each other');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63329dcd-da76-4d3d-ad01-cefc6a11f9c0', 'c84e0291-d2f5-4f29-9957-aff39e238858', 1, 'Attract each other');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('949b61ba-70c7-4f9f-926e-29529f887270', 'c84e0291-d2f5-4f29-9957-aff39e238858', 2, 'Experience no force at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37e3196a-c633-4a9e-8f05-8909c1b15cf5', 'c84e0291-d2f5-4f29-9957-aff39e238858', 3, 'Rotate perpendicular to each other');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c84e0291-d2f5-4f29-9957-aff39e238858', '63329dcd-da76-4d3d-ad01-cefc6a11f9c0', 'Parallel conductors carrying current in the SAME direction attract each other, while currents in opposite directions repel — this defines the SI unit ampere via the force per unit length between such conductors.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4ebfd8a4-61f1-489f-93f7-ae781e1f7956', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 18, 'The magnetic field lines inside a bar magnet run from:', 'Physics', 'Magnetism and Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5e464bd-4ef1-4201-861a-bb67a45b4b2a', '4ebfd8a4-61f1-489f-93f7-ae781e1f7956', 0, 'North pole to south pole, same as outside the magnet');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0c2749e-88f0-4c46-ac5a-59bc6d4639a0', '4ebfd8a4-61f1-489f-93f7-ae781e1f7956', 1, 'South pole to north pole, inside the magnet (forming closed loops with the external field)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1f026fa-f047-4700-b14d-b57cc1199b76', '4ebfd8a4-61f1-489f-93f7-ae781e1f7956', 2, 'There are no field lines inside a magnet');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68157fbe-10e9-4191-a5f6-f2f06a7ae82f', '4ebfd8a4-61f1-489f-93f7-ae781e1f7956', 3, 'Only in a random, non-continuous pattern');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4ebfd8a4-61f1-489f-93f7-ae781e1f7956', 'b0c2749e-88f0-4c46-ac5a-59bc6d4639a0', 'Magnetic field lines are continuous closed loops: outside a bar magnet they run from N to S, and INSIDE the magnet they continue from S back to N, completing the loop.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5f848cea-cc01-4d18-8381-77352d177d02', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 19, 'The SI unit of magnetic flux is the:', 'Physics', 'Electromagnetic Induction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6dcef636-f1d2-46d8-a754-eff3e4aa316e', '5f848cea-cc01-4d18-8381-77352d177d02', 0, 'Tesla');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f5b0e8d-ce37-4fb0-9625-5b1004f4d875', '5f848cea-cc01-4d18-8381-77352d177d02', 1, 'Weber');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59b88e30-cfbf-438d-8808-32aa2fcc39a2', '5f848cea-cc01-4d18-8381-77352d177d02', 2, 'Henry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8fcb5086-659d-4d3c-a647-94d930f7c467', '5f848cea-cc01-4d18-8381-77352d177d02', 3, 'Gauss');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5f848cea-cc01-4d18-8381-77352d177d02', '6f5b0e8d-ce37-4fb0-9625-5b1004f4d875', 'Magnetic flux (phi = B.A) is measured in webers (Wb); tesla is the unit of magnetic field (flux density), and henry is the unit of inductance.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6c0eb909-6fb1-421f-a3db-c698845077f1', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 20, 'In a purely inductive AC circuit, the current:', 'Physics', 'Alternating Current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6915368b-6919-4ec9-adb0-12d3f6f96438', '6c0eb909-6fb1-421f-a3db-c698845077f1', 0, 'Leads the voltage by 90 degrees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe9b1a9c-22c2-4cfc-bbcb-d8e0e8756265', '6c0eb909-6fb1-421f-a3db-c698845077f1', 1, 'Lags behind the voltage by 90 degrees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb028f4f-8786-47ea-9b51-9f7e5a79f715', '6c0eb909-6fb1-421f-a3db-c698845077f1', 2, 'Is exactly in phase with the voltage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('395bbbdc-2a83-4a20-994e-b3c603f37537', '6c0eb909-6fb1-421f-a3db-c698845077f1', 3, 'Is always zero');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6c0eb909-6fb1-421f-a3db-c698845077f1', 'fe9b1a9c-22c2-4cfc-bbcb-d8e0e8756265', 'In a purely inductive AC circuit, current lags voltage by a phase angle of 90 degrees (pi/2 radians), the opposite phase relationship to a purely capacitive circuit.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d7a2e381-cd67-41a9-b809-ea0c767af121', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 21, 'The refractive index of a medium is defined as the ratio of:', 'Physics', 'Ray Optics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a77ea449-4e1d-4d59-be61-d96c18f92e1c', 'd7a2e381-cd67-41a9-b809-ea0c767af121', 0, 'The speed of light in vacuum to the speed of light in that medium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('743ab6e3-2f22-43dc-9fc4-57b0548f693b', 'd7a2e381-cd67-41a9-b809-ea0c767af121', 1, 'The speed of light in that medium to the speed of light in vacuum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39fecad9-ba36-4cd9-9142-d9526854c149', 'd7a2e381-cd67-41a9-b809-ea0c767af121', 2, 'The wavelength in vacuum to the frequency in the medium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bf86c231-102e-4941-a511-7cebe56b5877', 'd7a2e381-cd67-41a9-b809-ea0c767af121', 3, 'The angle of incidence to the angle of reflection');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d7a2e381-cd67-41a9-b809-ea0c767af121', 'a77ea449-4e1d-4d59-be61-d96c18f92e1c', 'Refractive index n = c/v, where c is the speed of light in vacuum and v is its speed in the given medium — always greater than or equal to 1 for a denser medium.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b49cdab0-6e16-4f21-9b0d-ea1b44816fd2', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 22, 'Polarization is a phenomenon exhibited by:', 'Physics', 'Wave Optics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57081050-afc9-421f-b181-6958ee03b114', 'b49cdab0-6e16-4f21-9b0d-ea1b44816fd2', 0, 'Both longitudinal and transverse waves equally');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a3297e1-e6b9-43c8-ab64-5da32c92a43b', 'b49cdab0-6e16-4f21-9b0d-ea1b44816fd2', 1, 'Transverse waves only, since it involves restricting oscillations to a single plane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('864deff6-3acc-42dc-b973-e691f4de3c07', 'b49cdab0-6e16-4f21-9b0d-ea1b44816fd2', 2, 'Longitudinal waves only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('607aedcd-4a9b-4cc7-ad09-22388894dac6', 'b49cdab0-6e16-4f21-9b0d-ea1b44816fd2', 3, 'Sound waves in air');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b49cdab0-6e16-4f21-9b0d-ea1b44816fd2', '8a3297e1-e6b9-43c8-ab64-5da32c92a43b', 'Polarization, which restricts the oscillation of a wave''s disturbance to a single plane, is a property unique to transverse waves (like light); longitudinal waves (like sound in air) cannot be polarized.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f1cf471d-a90f-416e-a73b-bf5ed68dc72e', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 23, 'According to Einstein''s photoelectric equation, if the frequency of incident light is below the threshold frequency of the metal, then:', 'Physics', 'Dual Nature of Radiation and Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5921963-de1e-444a-b7a6-da16c14cc71b', 'f1cf471d-a90f-416e-a73b-bf5ed68dc72e', 0, 'Photoelectric emission occurs regardless of frequency, as long as intensity is high enough');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43cf6215-a46a-4f79-b0f6-5a7206af1f7a', 'f1cf471d-a90f-416e-a73b-bf5ed68dc72e', 1, 'No photoelectric emission occurs, no matter how intense the light');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1492bd54-7c4f-4296-83d1-a3afe7622093', 'f1cf471d-a90f-416e-a73b-bf5ed68dc72e', 2, 'Emission occurs but with zero kinetic energy electrons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8cc2934a-c072-4c27-977e-3fdce3a1c548', 'f1cf471d-a90f-416e-a73b-bf5ed68dc72e', 3, 'The metal melts instead of emitting electrons');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f1cf471d-a90f-416e-a73b-bf5ed68dc72e', '43cf6215-a46a-4f79-b0f6-5a7206af1f7a', 'Below the threshold frequency, individual photons lack sufficient energy (hf < work function) to eject even a single electron, regardless of the light''s intensity — a key experimental fact only explained by Einstein''s photon model, not classical wave theory.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('160e61a1-02c4-44eb-8820-0458fe6887a5', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 24, 'The radius of the first Bohr orbit of the hydrogen atom (n=1) is approximately:', 'Physics', 'Atoms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82e4ece6-258c-418e-93be-1c0468b62c9d', '160e61a1-02c4-44eb-8820-0458fe6887a5', 0, '0.529 Angstrom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e30efd8-549e-4685-a984-318c724173d7', '160e61a1-02c4-44eb-8820-0458fe6887a5', 1, '5.29 Angstrom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e50295e0-d8ab-4a2e-a69b-e6c4db882206', '160e61a1-02c4-44eb-8820-0458fe6887a5', 2, '0.0529 Angstrom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a920361-7df5-4ffb-bf9d-15c78ffaaba2', '160e61a1-02c4-44eb-8820-0458fe6887a5', 3, '52.9 Angstrom');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('160e61a1-02c4-44eb-8820-0458fe6887a5', '82e4ece6-258c-418e-93be-1c0468b62c9d', 'The Bohr radius, a0 = 0.529 Angstrom, is the radius of the innermost (n=1, ground state) orbit of the hydrogen atom in Bohr''s model.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b8c57204-ee0e-47aa-b4b9-f8c545d9380c', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 25, 'The mass defect of a nucleus refers to the difference between:', 'Physics', 'Nuclei');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18cef316-2f25-4a32-aaab-6d87d574e417', 'b8c57204-ee0e-47aa-b4b9-f8c545d9380c', 0, 'The nucleus''s mass and its atomic number');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0593df08-1693-420d-8f17-db86166fad1c', 'b8c57204-ee0e-47aa-b4b9-f8c545d9380c', 1, 'The sum of the masses of individual free nucleons and the actual mass of the bound nucleus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e58cd933-0f46-419a-b54e-3072756bbaa3', 'b8c57204-ee0e-47aa-b4b9-f8c545d9380c', 2, 'The mass of protons and mass of electrons only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31ea9323-ab3a-4516-ad07-af8922b88dc4', 'b8c57204-ee0e-47aa-b4b9-f8c545d9380c', 3, 'The nucleus''s mass before and after a chemical reaction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b8c57204-ee0e-47aa-b4b9-f8c545d9380c', '0593df08-1693-420d-8f17-db86166fad1c', 'Mass defect is the small difference between the total mass of the separate constituent nucleons and the actual (lower) mass of the bound nucleus; this ''missing'' mass, via E=mc^2, corresponds to the nuclear binding energy.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5974326c-6843-48a9-a423-b18348247bd8', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 26, 'In an intrinsic (pure) semiconductor at absolute zero temperature, the conduction band is:', 'Physics', 'Semiconductor Electronics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a1da49e-c535-4216-988f-1c3368d23a90', '5974326c-6843-48a9-a423-b18348247bd8', 0, 'Completely filled with electrons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a16ed926-c0f4-4bb2-b3aa-12d7db4832fc', '5974326c-6843-48a9-a423-b18348247bd8', 1, 'Completely empty, since no electrons have enough thermal energy to cross the band gap from the valence band');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75512289-797d-44b7-ae4b-de34484a33cc', '5974326c-6843-48a9-a423-b18348247bd8', 2, 'Overlapping entirely with the valence band');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b39fc9c-7560-416d-abd2-bf829b900bce', '5974326c-6843-48a9-a423-b18348247bd8', 3, 'Filled with holes only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5974326c-6843-48a9-a423-b18348247bd8', 'a16ed926-c0f4-4bb2-b3aa-12d7db4832fc', 'At absolute zero, an intrinsic semiconductor behaves like an insulator: all electrons remain in the fully filled valence band, and the conduction band is empty since none have thermal energy to bridge the band gap.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c775bdc5-71aa-4cd3-b3ac-1a2c396111b9', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 27, 'The ''line of sight'' propagation mode is characteristic of which type of electromagnetic wave communication?', 'Physics', 'Communication Systems');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a756892c-c501-41e1-9a70-b1152e88473a', 'c775bdc5-71aa-4cd3-b3ac-1a2c396111b9', 0, 'Ground wave propagation of low-frequency AM radio');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1d9a475-b388-4d20-adfe-01a9e8c9ae37', 'c775bdc5-71aa-4cd3-b3ac-1a2c396111b9', 1, 'Sky wave propagation via ionospheric reflection');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbb509e3-603a-49bf-860e-4b9d54b8a238', 'c775bdc5-71aa-4cd3-b3ac-1a2c396111b9', 2, 'Space wave propagation of high-frequency signals like TV and FM broadcasts, limited by Earth''s curvature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abfa0d50-2ab6-4b70-bc98-1be8e3f4bc36', 'c775bdc5-71aa-4cd3-b3ac-1a2c396111b9', 3, 'Only propagation through fibre-optic cables');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c775bdc5-71aa-4cd3-b3ac-1a2c396111b9', 'bbb509e3-603a-49bf-860e-4b9d54b8a238', 'High-frequency signals (VHF/UHF, e.g., TV, FM, satellite) travel by direct line-of-sight (space wave) propagation and are limited by the curvature of the Earth and antenna heights, unlike lower-frequency ground/sky waves.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('48fceda3-0652-4691-8975-9d6fb845e339', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 28, 'The horizontal range of a projectile depends on:', 'Physics', 'Motion in a Plane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48176b97-8082-4c73-bb98-1ff0887b800f', '48fceda3-0652-4691-8975-9d6fb845e339', 0, 'Initial speed and angle of projection only, assuming no air resistance and level ground');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b679198-bbc5-4944-929f-d2397b1f469b', '48fceda3-0652-4691-8975-9d6fb845e339', 1, 'Only the mass of the projectile');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6b27352-f0cb-416c-96ec-a349c5b8d907', '48fceda3-0652-4691-8975-9d6fb845e339', 2, 'The color of the projectile');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('254a5584-596f-4935-9d20-bcd57fc83e13', '48fceda3-0652-4691-8975-9d6fb845e339', 3, 'The projectile''s shape exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('48fceda3-0652-4691-8975-9d6fb845e339', '48176b97-8082-4c73-bb98-1ff0887b800f', 'In the idealized case (no air resistance, launch and landing at same height), the range R = u^2*sin(2*theta)/g depends only on initial speed u and launch angle theta (and g), not mass.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1f693871-6399-48f1-bb2a-55dda71e4576', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 29, 'A cyclic process is one in which the system:', 'Physics', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a95aa54-2091-45d3-886e-c2730c6add5c', '1f693871-6399-48f1-bb2a-55dda71e4576', 0, 'Ends in a completely different state from where it started');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebdd4c5e-5a75-4dbb-97da-c5c55bd39e64', '1f693871-6399-48f1-bb2a-55dda71e4576', 1, 'Returns to its initial state after undergoing a series of changes, so the net change in internal energy over the cycle is zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('114910f9-48b3-4297-9011-2d68775199c3', '1f693871-6399-48f1-bb2a-55dda71e4576', 2, 'Never returns to equilibrium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15b75ee0-64e9-4ad3-b05d-dd262a3f7c9c', '1f693871-6399-48f1-bb2a-55dda71e4576', 3, 'Always has zero net work done');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1f693871-6399-48f1-bb2a-55dda71e4576', 'ebdd4c5e-5a75-4dbb-97da-c5c55bd39e64', 'In a cyclic process, since internal energy is a state function, the system returning to its initial state means the net change in internal energy over the full cycle is exactly zero (though net work and heat exchanged need not be zero).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('dbb229db-bd9b-42d1-99b7-b0c00d269d41', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 30, 'Kirchhoff''s junction rule (first law) is a statement of the conservation of:', 'Physics', 'Current Electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2e95de0-ba93-48a8-a007-5a2aae54124c', 'dbb229db-bd9b-42d1-99b7-b0c00d269d41', 0, 'Energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('050f630e-9755-4955-a1fd-356dd2666a29', 'dbb229db-bd9b-42d1-99b7-b0c00d269d41', 1, 'Electric charge — the sum of currents entering a junction equals the sum of currents leaving it');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bed0e384-9f0c-4644-b25b-e0140c1d7764', 'dbb229db-bd9b-42d1-99b7-b0c00d269d41', 2, 'Magnetic flux');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d9c26ee-b648-4fd5-a2b7-83393585ebea', 'dbb229db-bd9b-42d1-99b7-b0c00d269d41', 3, 'Voltage');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dbb229db-bd9b-42d1-99b7-b0c00d269d41', '050f630e-9755-4955-a1fd-356dd2666a29', 'Kirchhoff''s current law states that at any junction, total current entering equals total current leaving, reflecting the fundamental conservation of electric charge (no charge accumulates at a junction in steady state).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2f6d5a59-bf17-4a02-a1e9-77f0e4d49c01', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 31, 'Electromagnetic waves, unlike mechanical waves, can travel through:', 'Physics', 'Electromagnetic Waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('942dd2c8-8a88-4e6d-b935-daa931e42895', '2f6d5a59-bf17-4a02-a1e9-77f0e4d49c01', 0, 'Only solid media');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3804a0a1-cee2-40b0-8f9c-e6f49890b0d1', '2f6d5a59-bf17-4a02-a1e9-77f0e4d49c01', 1, 'Vacuum, since they do not require a material medium to propagate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39d0d9aa-576f-451d-b3f0-6aff72911f1c', '2f6d5a59-bf17-4a02-a1e9-77f0e4d49c01', 2, 'Only liquids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8796077e-d6a6-4ecf-abf0-aab6d610e7ae', '2f6d5a59-bf17-4a02-a1e9-77f0e4d49c01', 3, 'No medium of any kind, including vacuum');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2f6d5a59-bf17-4a02-a1e9-77f0e4d49c01', '3804a0a1-cee2-40b0-8f9c-e6f49890b0d1', 'Electromagnetic waves consist of oscillating electric and magnetic fields that can self-propagate through a vacuum, unlike mechanical waves (sound, water waves) which require a material medium.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('104871ea-2c0e-4ead-81e1-3cbe167c54e2', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 32, 'A compound microscope achieves high magnification through the combined effect of:', 'Physics', 'Ray Optics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4133a75f-efc8-4493-aca1-7f714b6a9ea5', '104871ea-2c0e-4ead-81e1-3cbe167c54e2', 0, 'A single convex lens only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a02d7fc-86cb-43f2-9261-a0094036751b', '104871ea-2c0e-4ead-81e1-3cbe167c54e2', 1, 'Two convex lenses — an objective lens (forming a real, magnified image) and an eyepiece (acting as a simple magnifier on that image)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59c24720-65c7-440e-8f8e-841abe38f02d', '104871ea-2c0e-4ead-81e1-3cbe167c54e2', 2, 'A single concave mirror');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb200687-1f21-40e7-b045-b32f599a5e74', '104871ea-2c0e-4ead-81e1-3cbe167c54e2', 3, 'A prism alone, with no lenses');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('104871ea-2c0e-4ead-81e1-3cbe167c54e2', '3a02d7fc-86cb-43f2-9261-a0094036751b', 'A compound microscope uses a short-focal-length objective lens to form a real, enlarged intermediate image, which the eyepiece (acting as a simple magnifying lens) further magnifies, giving overall magnification greater than either lens alone.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c08f434d-9c42-42b2-a6b1-b3000a55e154', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 33, 'Weightlessness experienced by astronauts in an orbiting spacecraft occurs because:', 'Physics', 'Gravitation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d0f1d8e-26bb-4216-96ef-0a127dadd2a6', 'c08f434d-9c42-42b2-a6b1-b3000a55e154', 0, 'There is no gravity at all in orbit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45c7d8eb-0d0b-4241-a21c-a68c6acbbfc6', 'c08f434d-9c42-42b2-a6b1-b3000a55e154', 1, 'The spacecraft and astronaut are both in continuous free fall toward Earth, so there is no normal reaction force between them');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7988a2a7-6596-4f68-bee3-f99df8f9b872', 'c08f434d-9c42-42b2-a6b1-b3000a55e154', 2, 'The spacecraft actively cancels gravity using engines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5816f5b7-b7cd-4e59-95e3-f2b125701fc2', 'c08f434d-9c42-42b2-a6b1-b3000a55e154', 3, 'Gravity only acts on the spacecraft, not the astronaut');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c08f434d-9c42-42b2-a6b1-b3000a55e154', '45c7d8eb-0d0b-4241-a21c-a68c6acbbfc6', 'In orbit, both the spacecraft and its occupants are in continuous free fall under gravity (which is still very much present and provides the centripetal force for the orbit), so there is no relative normal force between astronaut and spacecraft, producing the sensation of weightlessness.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7ab913a2-cd1e-4176-ad04-efc02b2356a4', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 34, 'The fundamental frequency (first harmonic) of a stretched string fixed at both ends, of length L and wave speed v, is given by:', 'Physics', 'Waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59380f06-7cae-4737-8727-df3f2df5b767', '7ab913a2-cd1e-4176-ad04-efc02b2356a4', 0, 'v/(2L)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19776edd-5aec-4ce1-8e01-5a3ba14ca084', '7ab913a2-cd1e-4176-ad04-efc02b2356a4', 1, 'v/L');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a778281-f6e8-4f0b-b47f-3a1ed4ac508f', '7ab913a2-cd1e-4176-ad04-efc02b2356a4', 2, '2v/L');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb775b74-52de-468a-9b45-c643f0bffa99', '7ab913a2-cd1e-4176-ad04-efc02b2356a4', 3, 'v/(4L)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7ab913a2-cd1e-4176-ad04-efc02b2356a4', '59380f06-7cae-4737-8727-df3f2df5b767', 'For a string fixed at both ends, the fundamental mode has a wavelength of 2L, giving fundamental frequency f1 = v/(2L).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('490a0007-1b3d-47e6-abc0-67b84d2d9ab7', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 35, 'Poisson''s ratio for a material is defined as the ratio of:', 'Physics', 'Mechanical Properties of Solids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f53dc5b8-8876-4e37-a368-770c4207bd4a', '490a0007-1b3d-47e6-abc0-67b84d2d9ab7', 0, 'Longitudinal stress to longitudinal strain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6730589e-9387-4b9e-be0c-5bba1ab6af39', '490a0007-1b3d-47e6-abc0-67b84d2d9ab7', 1, 'Lateral strain to longitudinal strain (with a negative sign convention), when a material is stretched or compressed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ecf6f598-61b1-469f-a9ce-71056b2acd4f', '490a0007-1b3d-47e6-abc0-67b84d2d9ab7', 2, 'Shear stress to shear strain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b985369-dd4f-443b-b629-09f7cb8ec19b', '490a0007-1b3d-47e6-abc0-67b84d2d9ab7', 3, 'Volume stress to volume strain');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('490a0007-1b3d-47e6-abc0-67b84d2d9ab7', '6730589e-9387-4b9e-be0c-5bba1ab6af39', 'Poisson''s ratio quantifies how much a material contracts laterally (perpendicular to the applied force) relative to how much it stretches longitudinally, typically expressed as the negative ratio of lateral to longitudinal strain.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b90d720d-6a06-4436-87d1-10b2831e2c29', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 36, 'According to the kinetic theory of gases, at a given temperature, lighter gas molecules (lower molar mass) have, on average:', 'Physics', 'Kinetic Theory');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1314e8f1-30a4-4769-b752-c81895d3530a', 'b90d720d-6a06-4436-87d1-10b2831e2c29', 0, 'Lower kinetic energy than heavier molecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4394b8f-2f48-47a8-8dc6-edd385a43283', 'b90d720d-6a06-4436-87d1-10b2831e2c29', 1, 'The same average kinetic energy as heavier molecules, but higher average speed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c49c08ee-30bb-4ddd-a885-2ab420a9c7c2', 'b90d720d-6a06-4436-87d1-10b2831e2c29', 2, 'Higher kinetic energy than heavier molecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2304c22f-0231-47a7-865c-3413b7011dab', 'b90d720d-6a06-4436-87d1-10b2831e2c29', 3, 'Zero average speed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b90d720d-6a06-4436-87d1-10b2831e2c29', 'c4394b8f-2f48-47a8-8dc6-edd385a43283', 'At the same temperature, all ideal gas molecules (regardless of mass) have the same average translational kinetic energy ((3/2)kT); however, lighter molecules must move FASTER on average to have this same kinetic energy, since KE = (1/2)mv^2.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('588d1180-3fc9-4083-aeba-b1c0d80d414e', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 37, 'An equipotential surface is a surface on which:', 'Physics', 'Electrostatic Potential and Capacitance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b4a9cb1-8041-4540-82c0-0f9b0ebecfc9', '588d1180-3fc9-4083-aeba-b1c0d80d414e', 0, 'The electric field is maximum everywhere');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b53b451a-e5f2-4b81-9c3f-4e3027205da5', '588d1180-3fc9-4083-aeba-b1c0d80d414e', 1, 'The electric potential has the same value at every point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9537551b-c7d9-4f95-8403-9ed7b3259fee', '588d1180-3fc9-4083-aeba-b1c0d80d414e', 2, 'Charge density varies continuously');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7cb22779-a78b-43aa-90fe-8cac07716d04', '588d1180-3fc9-4083-aeba-b1c0d80d414e', 3, 'Electric field lines are always parallel to the surface');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('588d1180-3fc9-4083-aeba-b1c0d80d414e', 'b53b451a-e5f2-4b81-9c3f-4e3027205da5', 'An equipotential surface, by definition, has the same electric potential at every point on it; electric field lines are always perpendicular to such surfaces, never parallel or tangential.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('613b5de4-cda7-4a9b-b468-e20aa5e564ac', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 38, 'The heating effect of current (Joule heating) in a resistor is given by the formula:', 'Physics', 'Current Electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c3c1de7-55f4-4cf2-b7b9-905f87fee4a1', '613b5de4-cda7-4a9b-b468-e20aa5e564ac', 0, 'H = IRt');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b42fdd5-60d6-4054-915e-ea806a092170', '613b5de4-cda7-4a9b-b468-e20aa5e564ac', 1, 'H = I^2Rt');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45a5236f-c6c4-407e-b2fb-efb43bd6adf9', '613b5de4-cda7-4a9b-b468-e20aa5e564ac', 2, 'H = IR^2t');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a70c4d3-a9c1-4794-818d-d7f739dd2a2c', '613b5de4-cda7-4a9b-b468-e20aa5e564ac', 3, 'H = I^2R/t');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('613b5de4-cda7-4a9b-b468-e20aa5e564ac', '1b42fdd5-60d6-4054-915e-ea806a092170', 'Joule''s law of heating: H = I^2Rt, where I is current, R is resistance, and t is time — heat generated is proportional to the square of the current.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('86914e80-03dc-43e1-ab81-3b96fce7a598', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 39, 'Ampere''s circuital law relates the line integral of the magnetic field around a closed loop to:', 'Physics', 'Moving Charges and Magnetism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08e03f0a-7a80-49ba-96e8-ffca3bad1bd7', '86914e80-03dc-43e1-ab81-3b96fce7a598', 0, 'The electric flux through the loop');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c6a6a47-f11f-4d2b-96d8-d43c0aa39905', '86914e80-03dc-43e1-ab81-3b96fce7a598', 1, 'The total (steady) current enclosed by that loop, times the permeability of free space');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a547a74c-ee1b-4751-908a-bfacf082ee14', '86914e80-03dc-43e1-ab81-3b96fce7a598', 2, 'The area of the loop only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8324b31d-3a21-47a8-91b3-258334c04c7d', '86914e80-03dc-43e1-ab81-3b96fce7a598', 3, 'The magnetic flux density at a single point');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('86914e80-03dc-43e1-ab81-3b96fce7a598', '2c6a6a47-f11f-4d2b-96d8-d43c0aa39905', 'Ampere''s circuital law: the closed line integral of B.dl around a loop equals mu0 times the net steady current enclosed by that loop — a magnetic analogue to Gauss''s law for electric fields.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('842ec5cd-0827-4cf3-aa80-070c2f9350d7', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 40, 'A full-wave rectifier, compared to a half-wave rectifier, converts AC to DC with:', 'Physics', 'Semiconductor Electronics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c563135-9e1b-4cb1-83c2-d4d290b0f67b', '842ec5cd-0827-4cf3-aa80-070c2f9350d7', 0, 'Lower efficiency and more ripple');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2629e00-ecf7-435d-ba6b-ec25e512d938', '842ec5cd-0827-4cf3-aa80-070c2f9350d7', 1, 'Higher efficiency and less ripple, since it utilizes both halves of the AC input cycle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b869ce79-7b71-4d58-9125-fdd5dd596eed', '842ec5cd-0827-4cf3-aa80-070c2f9350d7', 2, 'No difference at all in performance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7bd8ddd-2cd4-4050-a4d5-b266e12657c0', '842ec5cd-0827-4cf3-aa80-070c2f9350d7', 3, 'Only negative half-cycles utilized');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('842ec5cd-0827-4cf3-aa80-070c2f9350d7', 'b2629e00-ecf7-435d-ba6b-ec25e512d938', 'A full-wave rectifier uses both the positive and negative half-cycles of the AC input (via two diodes or a bridge configuration), giving higher average output and smoother (less rippled) DC compared to a half-wave rectifier, which discards half the input cycle.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('81d395c3-cc3f-4eb1-b45d-3326c918f387', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 41, 'Nuclear fusion, the process powering the Sun, involves:', 'Physics', 'Nuclei');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04ba76ed-7a3f-4107-b3e4-eccfcb200cfb', '81d395c3-cc3f-4eb1-b45d-3326c918f387', 0, 'The splitting of a heavy nucleus into two lighter nuclei');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4d08597-06c8-4d4a-9008-25e5828a1845', '81d395c3-cc3f-4eb1-b45d-3326c918f387', 1, 'The combination of two light nuclei to form a heavier nucleus, releasing energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16045763-e246-4175-a09f-4dbcdf124976', '81d395c3-cc3f-4eb1-b45d-3326c918f387', 2, 'The complete conversion of mass into energy with no residual matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ccb3d46-c288-4b9c-94c7-cf6626b00487', '81d395c3-cc3f-4eb1-b45d-3326c918f387', 3, 'A chemical reaction between hydrogen atoms, not a nuclear one');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('81d395c3-cc3f-4eb1-b45d-3326c918f387', 'd4d08597-06c8-4d4a-9008-25e5828a1845', 'Nuclear fusion combines light nuclei (e.g., hydrogen isotopes) into a heavier nucleus (e.g., helium); since the products lie closer to the peak of the binding-energy curve, energy is released — the process powering stars including our Sun.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('57efeb25-27b0-4581-b078-1cfb93acd6db', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 42, 'The coefficient of linear expansion of a solid describes the fractional change in its length per unit:', 'Physics', 'Thermal Properties of Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06da638d-6ac5-45d3-82ed-700c6f8916a4', '57efeb25-27b0-4581-b078-1cfb93acd6db', 0, 'Change in pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ebf74c3-1eb0-4541-bc3d-92294608b311', '57efeb25-27b0-4581-b078-1cfb93acd6db', 1, 'Change in temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbc8e744-ba65-482d-b14e-bf98871566e3', '57efeb25-27b0-4581-b078-1cfb93acd6db', 2, 'Change in volume');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37ac81e3-0ab6-446a-baf9-ba81efdbee7e', '57efeb25-27b0-4581-b078-1cfb93acd6db', 3, 'Change in mass');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('57efeb25-27b0-4581-b078-1cfb93acd6db', '1ebf74c3-1eb0-4541-bc3d-92294608b311', 'The coefficient of linear expansion (alpha) is defined as the fractional increase in length per unit rise in temperature, a key material property for thermal expansion calculations.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('26563693-a122-43bf-8c93-414c1420051b', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 43, 'A solid cylinder and a solid sphere of the same mass and radius are released from rest at the top of an identical incline and allowed to roll without slipping. Which reaches the bottom first?', 'Physics', 'System of Particles and Rotational Motion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dafba32d-ca09-4905-bc10-cd5146165486', '26563693-a122-43bf-8c93-414c1420051b', 0, 'The cylinder, since it has a smaller moment of inertia fraction (1/2 MR^2) than the sphere''s (2/5 MR^2)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6d6e0af-b04a-40c8-8a3e-002393e9d8a4', '26563693-a122-43bf-8c93-414c1420051b', 1, 'The sphere, since it has a smaller moment of inertia coefficient, converting more of its PE into translational KE');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f32d6149-fab6-4670-bf84-0a1ef186556a', '26563693-a122-43bf-8c93-414c1420051b', 2, 'They arrive at exactly the same time regardless of shape');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c4c40ae-1ce4-41ed-b2e2-7d956ed967f4', '26563693-a122-43bf-8c93-414c1420051b', 3, 'Neither reaches the bottom; both remain stationary');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('26563693-a122-43bf-8c93-414c1420051b', 'f6d6e0af-b04a-40c8-8a3e-002393e9d8a4', 'For rolling without slipping, an object with a smaller moment-of-inertia coefficient (k^2 in I=kMR^2) converts more gravitational PE into translational KE rather than rotational KE, accelerating faster; the sphere''s coefficient (2/5) is smaller than the cylinder''s (1/2), so the sphere wins the race.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a90bf2ba-81f6-4627-989a-d00de29a507e', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 44, 'An electric dipole consists of two equal and opposite charges separated by a small distance. The dipole moment is a vector quantity directed:', 'Physics', 'Electric Charges and Fields');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40ce0da9-db29-4165-bb3f-799e8c1bd6ce', 'a90bf2ba-81f6-4627-989a-d00de29a507e', 0, 'From the positive charge to the negative charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94a84d41-2fac-4def-a687-f5c2d591d3eb', 'a90bf2ba-81f6-4627-989a-d00de29a507e', 1, 'From the negative charge to the positive charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48c2d7ee-59a1-4ce5-902b-aa3715534563', 'a90bf2ba-81f6-4627-989a-d00de29a507e', 2, 'Perpendicular to the line joining the charges');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c8b5784-ba57-4181-85d3-dc95e614167c', 'a90bf2ba-81f6-4627-989a-d00de29a507e', 3, 'Undefined, since dipoles have no net charge');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a90bf2ba-81f6-4627-989a-d00de29a507e', '94a84d41-2fac-4def-a687-f5c2d591d3eb', 'By convention, the electric dipole moment vector p = q*d points from the negative charge toward the positive charge, with magnitude equal to charge times separation distance.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d0b92308-f070-4259-b9c1-9f0609fc32f6', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 45, 'The phenomenon of resonance in a series LCR AC circuit occurs when:', 'Physics', 'Alternating Current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f28623aa-0c09-4157-9852-fa798f0181d4', 'd0b92308-f070-4259-b9c1-9f0609fc32f6', 0, 'The inductive reactance and capacitive reactance are equal, minimizing total impedance to just the resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c87713dd-01d9-414e-8390-e56ebfca0a7c', 'd0b92308-f070-4259-b9c1-9f0609fc32f6', 1, 'The resistance in the circuit becomes zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a771348-5deb-47b9-86d4-f8f66f590ecf', 'd0b92308-f070-4259-b9c1-9f0609fc32f6', 2, 'The frequency of the AC source is zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('492ccc44-3b3e-4212-81ff-f82f97875a82', 'd0b92308-f070-4259-b9c1-9f0609fc32f6', 3, 'The capacitor is completely disconnected from the circuit');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d0b92308-f070-4259-b9c1-9f0609fc32f6', 'f28623aa-0c09-4157-9852-fa798f0181d4', 'At the resonant frequency, inductive reactance (X_L) equals capacitive reactance (X_C), so they cancel in the impedance formula, leaving impedance at its minimum value (equal to resistance R) and current at its maximum.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Chemistry (45 questions) — Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d4f3b4b5-4304-499a-bd36-8ed6a117e3a9', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 46, 'The law of multiple proportions states that when two elements combine to form more than one compound, the masses of one element that combine with a fixed mass of the other are:', 'Chemistry', 'Some Basic Concepts of Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e88816d5-ee24-4224-9d76-f11437ffa30c', 'd4f3b4b5-4304-499a-bd36-8ed6a117e3a9', 0, 'Always equal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b269845c-33d6-4324-bd1f-e2964e7cb2c3', 'd4f3b4b5-4304-499a-bd36-8ed6a117e3a9', 1, 'In a ratio of small whole numbers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b7066ff-f264-4988-a5bb-a76c1d0320d5', 'd4f3b4b5-4304-499a-bd36-8ed6a117e3a9', 2, 'Never related by any simple ratio');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33acb758-ffca-488b-a11f-28c9967ebfe2', 'd4f3b4b5-4304-499a-bd36-8ed6a117e3a9', 3, 'Always in a 1:1 ratio');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d4f3b4b5-4304-499a-bd36-8ed6a117e3a9', 'b269845c-33d6-4324-bd1f-e2964e7cb2c3', 'Dalton''s law of multiple proportions: when two elements form multiple compounds, the different masses of one element that combine with a fixed mass of the other bear a ratio of small whole numbers to each other.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2fd137f8-868d-4259-9d4e-4fcabbb2ab0c', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 47, 'The Aufbau principle states that electrons are filled into atomic orbitals:', 'Chemistry', 'Structure of Atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e23af94-fa9d-4aea-8d72-d808c4fa7715', '2fd137f8-868d-4259-9d4e-4fcabbb2ab0c', 0, 'Randomly, with no particular order');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9ef3a06-452c-4cab-a719-3db8b9867780', '2fd137f8-868d-4259-9d4e-4fcabbb2ab0c', 1, 'In order of increasing orbital energy, filling lower-energy orbitals first');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd957d7f-49ff-4f47-8344-79ae9dc40c3a', '2fd137f8-868d-4259-9d4e-4fcabbb2ab0c', 2, 'Starting from the highest energy orbital first');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4315431d-6f87-4336-ad1c-c02a9046e5e7', '2fd137f8-868d-4259-9d4e-4fcabbb2ab0c', 3, 'Only into s-orbitals, regardless of element');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2fd137f8-868d-4259-9d4e-4fcabbb2ab0c', 'e9ef3a06-452c-4cab-a719-3db8b9867780', 'The Aufbau (''building up'') principle states that electrons occupy the lowest-energy available orbitals first before filling higher-energy ones, subject to the Pauli exclusion principle and Hund''s rule.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5be6e26f-1e09-4111-800b-130678e43ffe', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 48, 'Metallic character of elements generally:', 'Chemistry', 'Classification of Elements and Periodicity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6912942a-5d3a-41fc-a5a2-c8cf932ad10a', '5be6e26f-1e09-4111-800b-130678e43ffe', 0, 'Increases across a period and decreases down a group');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('899336fb-25fe-4e20-81e8-11c9f1faf055', '5be6e26f-1e09-4111-800b-130678e43ffe', 1, 'Decreases across a period (left to right) and increases down a group');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('505231d9-25fb-4462-8ffa-a8ae686744b7', '5be6e26f-1e09-4111-800b-130678e43ffe', 2, 'Remains constant throughout the periodic table');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d15d6944-6070-4d25-bfb7-343624e0b581', '5be6e26f-1e09-4111-800b-130678e43ffe', 3, 'Is unrelated to position in the periodic table');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5be6e26f-1e09-4111-800b-130678e43ffe', '899336fb-25fe-4e20-81e8-11c9f1faf055', 'As you move across a period, elements become less metallic (more non-metallic) due to increasing ionization energy/electronegativity; down a group, metallic character increases as ionization energy decreases.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('27caf5c5-5226-4818-9803-d52d40d8548b', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 49, 'A coordinate (dative) covalent bond differs from a normal covalent bond in that:', 'Chemistry', 'Chemical Bonding and Molecular Structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce6743d8-08a1-4982-8500-fd7cdf0509b4', '27caf5c5-5226-4818-9803-d52d40d8548b', 0, 'Both bonding electrons come from the same atom, rather than one from each atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2649cf2d-6636-4ec9-b2ae-e883e97f2e45', '27caf5c5-5226-4818-9803-d52d40d8548b', 1, 'It involves no sharing of electrons at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0fe5b226-b06f-448c-b3ed-5bfb182dc1d7', '27caf5c5-5226-4818-9803-d52d40d8548b', 2, 'It only occurs between two identical atoms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b07c432-d788-4b39-aa45-ad7dcf6d503a', '27caf5c5-5226-4818-9803-d52d40d8548b', 3, 'It is much weaker than an ionic bond in every case');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('27caf5c5-5226-4818-9803-d52d40d8548b', 'ce6743d8-08a1-4982-8500-fd7cdf0509b4', 'In a coordinate covalent bond, both electrons of the shared pair are donated by a single atom (the donor) to another atom/ion (the acceptor), unlike a normal covalent bond where each atom contributes one electron.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('76238578-a922-43e8-a2f6-d13e61d6d07f', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 50, 'Dalton''s law of partial pressures states that the total pressure of a mixture of non-reacting gases is:', 'Chemistry', 'States of Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74ce6895-ee0c-4b90-a1be-78fbfb8b0852', '76238578-a922-43e8-a2f6-d13e61d6d07f', 0, 'Equal to the pressure of the gas present in the largest amount only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d710fc5-278b-42b8-bc88-a1c62e2f50e8', '76238578-a922-43e8-a2f6-d13e61d6d07f', 1, 'The sum of the partial pressures that each individual gas would exert if it alone occupied the same volume');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df1cad84-8717-488f-872a-182f1c0a47a6', '76238578-a922-43e8-a2f6-d13e61d6d07f', 2, 'Always less than the sum of the individual partial pressures');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a25f8650-6f7f-4e07-97ba-80e50596ba65', '76238578-a922-43e8-a2f6-d13e61d6d07f', 3, 'Independent of the number of gases in the mixture');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('76238578-a922-43e8-a2f6-d13e61d6d07f', '9d710fc5-278b-42b8-bc88-a1c62e2f50e8', 'Dalton''s law: total pressure = sum of partial pressures of each component gas, valid for a mixture of non-reacting ideal gases occupying the same volume at the same temperature.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('10a1de3c-33ea-41af-8aa5-c6ff5bfa359c', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 51, 'A process occurring without any exchange of matter or energy with the surroundings takes place in a(n):', 'Chemistry', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce2e655f-4314-4839-aa73-87d465ecbd4d', '10a1de3c-33ea-41af-8aa5-c6ff5bfa359c', 0, 'Open system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02dc754a-0973-4e2d-92f9-9cd5d27909ad', '10a1de3c-33ea-41af-8aa5-c6ff5bfa359c', 1, 'Closed system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a30523c-3758-4a9d-8f69-5cb70efbf8cb', '10a1de3c-33ea-41af-8aa5-c6ff5bfa359c', 2, 'Isolated system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92a7722f-7943-4cef-9b6c-de445eba682b', '10a1de3c-33ea-41af-8aa5-c6ff5bfa359c', 3, 'Homogeneous system');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('10a1de3c-33ea-41af-8aa5-c6ff5bfa359c', '0a30523c-3758-4a9d-8f69-5cb70efbf8cb', 'An isolated system exchanges neither matter nor energy with its surroundings; a closed system can exchange energy but not matter, and an open system can exchange both.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('86c57d96-d6f8-4eb7-bc48-ddca9cec2d16', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 52, 'A conjugate acid-base pair, as defined by the Bronsted-Lowry theory, differs from each other by:', 'Chemistry', 'Equilibrium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5712c64e-2d80-4693-b855-5b1c33e4176e', '86c57d96-d6f8-4eb7-bc48-ddca9cec2d16', 0, 'The gain or loss of an electron');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ccf40c2-8ae5-4edf-b74b-2e506dd1f5e3', '86c57d96-d6f8-4eb7-bc48-ddca9cec2d16', 1, 'The gain or loss of a single proton (H+)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cae58a64-d2c9-4165-8e77-1c04c3fccc48', '86c57d96-d6f8-4eb7-bc48-ddca9cec2d16', 2, 'A completely different elemental composition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07852646-4689-4569-93ef-ddb80aa16648', '86c57d96-d6f8-4eb7-bc48-ddca9cec2d16', 3, 'The gain or loss of a hydroxide ion');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('86c57d96-d6f8-4eb7-bc48-ddca9cec2d16', '9ccf40c2-8ae5-4edf-b74b-2e506dd1f5e3', 'In Bronsted-Lowry theory, a conjugate acid-base pair differs by exactly one proton — the acid loses a proton to become its conjugate base, and vice versa.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1bd2fc50-e001-454c-a1e8-0e238d2bb64e', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 53, 'The oxidation number of oxygen in most compounds is -2, but in peroxides (like H2O2) it is:', 'Chemistry', 'Redox Reactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('673229a6-9fc6-4331-a79b-69a246179005', '1bd2fc50-e001-454c-a1e8-0e238d2bb64e', 0, '-1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('126cb152-e2cf-44fa-a46f-3b6f18191f9b', '1bd2fc50-e001-454c-a1e8-0e238d2bb64e', 1, '-2, same as usual');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8b0fae9-79dc-420b-8683-d345b66170db', '1bd2fc50-e001-454c-a1e8-0e238d2bb64e', 2, '0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bd512c0-2463-4eaf-9139-e1c833fe62b6', '1bd2fc50-e001-454c-a1e8-0e238d2bb64e', 3, '+2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1bd2fc50-e001-454c-a1e8-0e238d2bb64e', '673229a6-9fc6-4331-a79b-69a246179005', 'In peroxides, the O-O single bond means each oxygen atom is assigned an oxidation state of -1, differing from the usual -2 seen in most other oxygen-containing compounds.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('14cf1c7e-cc1f-49e8-bf07-a74c5f18819c', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 54, 'Heavy water (D2O) differs from ordinary water (H2O) in that hydrogen is replaced by:', 'Chemistry', 'Hydrogen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7b61830-72a1-4521-ac39-33b0cfa65f6f', '14cf1c7e-cc1f-49e8-bf07-a74c5f18819c', 0, 'Tritium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af6705f1-8c7f-4b1a-bd93-bac5c3d2d9df', '14cf1c7e-cc1f-49e8-bf07-a74c5f18819c', 1, 'Deuterium, the hydrogen isotope with one proton and one neutron');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e396a70-6f94-4a6e-90a3-01327529d50c', '14cf1c7e-cc1f-49e8-bf07-a74c5f18819c', 2, 'Helium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7c8f250-e8f4-445e-a61a-50d09a4fcee4', '14cf1c7e-cc1f-49e8-bf07-a74c5f18819c', 3, 'An oxygen isotope');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('14cf1c7e-cc1f-49e8-bf07-a74c5f18819c', 'af6705f1-8c7f-4b1a-bd93-bac5c3d2d9df', 'Heavy water contains deuterium (2H or D), a stable hydrogen isotope with an extra neutron compared to ordinary hydrogen (protium), giving D2O a higher molecular mass and slightly different physical properties.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('757d287d-d525-45a7-b7cf-f6c38f8c4639', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 55, 'The characteristic flame test color of sodium compounds is:', 'Chemistry', 's-Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6235a50-0f10-49eb-922e-28c6fca95aa4', '757d287d-d525-45a7-b7cf-f6c38f8c4639', 0, 'Crimson red');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f217437f-ca93-4fb7-926c-4e2a589c2633', '757d287d-d525-45a7-b7cf-f6c38f8c4639', 1, 'Golden yellow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e10cc4f4-9bbc-4620-b03d-01f4fff58fae', '757d287d-d525-45a7-b7cf-f6c38f8c4639', 2, 'Lilac (violet)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bce4e846-2633-4a1e-966e-5963f47b05b9', '757d287d-d525-45a7-b7cf-f6c38f8c4639', 3, 'Brick red');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('757d287d-d525-45a7-b7cf-f6c38f8c4639', 'f217437f-ca93-4fb7-926c-4e2a589c2633', 'Sodium compounds impart a characteristic golden/persistent yellow color to a flame, used as a classic qualitative test for the presence of sodium.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f5da9670-d121-45d1-8f91-7b3b00f047c9', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 56, 'The IUPAC preferred name of the compound CH3-CH2-CHO is:', 'Chemistry', 'Organic Chemistry — Basic Principles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b47d6f5a-6c8f-42d7-8399-f9235e56080c', 'f5da9670-d121-45d1-8f91-7b3b00f047c9', 0, 'Propanol');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3decb8c1-5d12-46ca-a8ac-83b59d114cbe', 'f5da9670-d121-45d1-8f91-7b3b00f047c9', 1, 'Propanal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9994b0b1-8346-4124-b950-42d17333afa8', 'f5da9670-d121-45d1-8f91-7b3b00f047c9', 2, 'Propanone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12867302-7630-4a34-a7e2-6eb9f98467a7', 'f5da9670-d121-45d1-8f91-7b3b00f047c9', 3, 'Propanoic acid');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f5da9670-d121-45d1-8f91-7b3b00f047c9', '3decb8c1-5d12-46ca-a8ac-83b59d114cbe', 'CH3-CH2-CHO is propanal (an aldehyde, suffix ''-al''); propanol would be an alcohol (-OH), propanone a ketone, and propanoic acid a carboxylic acid.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('fb809d4b-5db1-449f-a4d5-229d3555549a', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 57, 'Which of the following is an example of a Friedel-Crafts alkylation reaction?', 'Chemistry', 'Hydrocarbons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('427b9ca6-90a2-4f7a-80f9-cf4034e7f674', 'fb809d4b-5db1-449f-a4d5-229d3555549a', 0, 'Reaction of benzene with an alkyl halide in the presence of anhydrous AlCl3, introducing an alkyl group onto the ring');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a407209f-298e-4ee9-9c71-e1cbd3216904', 'fb809d4b-5db1-449f-a4d5-229d3555549a', 1, 'Simple combustion of benzene in air');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94bba668-ad67-49d5-b382-54cff4d62a63', 'fb809d4b-5db1-449f-a4d5-229d3555549a', 2, 'Hydrogenation of benzene to cyclohexane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('deca013d-3f89-4116-a33d-1614b6531a11', 'fb809d4b-5db1-449f-a4d5-229d3555549a', 3, 'Nitration of benzene using concentrated HNO3/H2SO4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fb809d4b-5db1-449f-a4d5-229d3555549a', '427b9ca6-90a2-4f7a-80f9-cf4034e7f674', 'Friedel-Crafts alkylation is the electrophilic substitution of an aromatic ring with an alkyl group, using an alkyl halide and a Lewis acid catalyst (typically anhydrous AlCl3) to generate the electrophilic carbocation.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0a58549b-e525-48c8-9dbd-f3450b124783', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 58, 'Acid rain is primarily caused by atmospheric pollutants such as:', 'Chemistry', 'Environmental Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19fc4bdb-6eb7-471f-bd46-133ae64aa658', '0a58549b-e525-48c8-9dbd-f3450b124783', 0, 'Carbon dioxide and water vapor only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4a55f10-b14e-46ad-93b7-b92e46d828b9', '0a58549b-e525-48c8-9dbd-f3450b124783', 1, 'Oxides of sulfur and nitrogen (SOx and NOx), which form sulfuric and nitric acid in the atmosphere');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37283bdc-68a6-4f0d-b41e-afd52955bd46', '0a58549b-e525-48c8-9dbd-f3450b124783', 2, 'Only particulate matter with no gaseous component');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15f4e6d5-66af-461d-b960-38c81b03475c', '0a58549b-e525-48c8-9dbd-f3450b124783', 3, 'Chlorofluorocarbons exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0a58549b-e525-48c8-9dbd-f3450b124783', 'd4a55f10-b14e-46ad-93b7-b92e46d828b9', 'Acid rain forms when sulfur and nitrogen oxides (released mainly from fossil fuel combustion) react with atmospheric water vapor to form sulfuric and nitric acids, which fall as acidic precipitation.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c6dacc47-d61c-40ad-8fea-5312b650f4c9', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 59, 'A crystalline solid, unlike an amorphous solid, is characterized by:', 'Chemistry', 'Solid State');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be33eb68-f715-453d-9abc-d6fb0d3d37cf', 'c6dacc47-d61c-40ad-8fea-5312b650f4c9', 0, 'A completely random, disordered arrangement of particles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb8771ee-d4fb-4377-910d-89f8cf65f88a', 'c6dacc47-d61c-40ad-8fea-5312b650f4c9', 1, 'A long-range, regularly repeating (periodic) arrangement of constituent particles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eda5a11b-c11e-47fa-873b-d2ddfc7ca6b1', 'c6dacc47-d61c-40ad-8fea-5312b650f4c9', 2, 'The complete absence of any melting point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98e40a3d-00a7-479f-9060-767bda215cd9', 'c6dacc47-d61c-40ad-8fea-5312b650f4c9', 3, 'Isotropic physical properties in all directions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c6dacc47-d61c-40ad-8fea-5312b650f4c9', 'fb8771ee-d4fb-4377-910d-89f8cf65f88a', 'Crystalline solids have a highly ordered, long-range repeating internal structure (a lattice), giving them a sharp melting point and often anisotropic properties, unlike amorphous solids which lack this long-range order.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3c225d8a-2c46-40df-917d-24158275b79c', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 60, 'Henry''s law relates the solubility of a gas in a liquid to:', 'Chemistry', 'Solutions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('091c63c4-59e0-4578-9022-ea355ae9f70a', '3c225d8a-2c46-40df-917d-24158275b79c', 0, 'The temperature of the liquid only, with no pressure dependence');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ded60ba5-a203-414d-a361-334b727462f1', '3c225d8a-2c46-40df-917d-24158275b79c', 1, 'The partial pressure of the gas above the liquid — solubility is directly proportional to partial pressure at constant temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd659749-2547-4496-82cb-a9269bfd4cde', '3c225d8a-2c46-40df-917d-24158275b79c', 2, 'The color of the gas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45338a80-4d9b-4fea-a198-56ccd4c35449', '3c225d8a-2c46-40df-917d-24158275b79c', 3, 'The volume of the container only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3c225d8a-2c46-40df-917d-24158275b79c', 'ded60ba5-a203-414d-a361-334b727462f1', 'Henry''s law: the solubility (or mole fraction) of a gas dissolved in a liquid is directly proportional to the partial pressure of that gas above the liquid surface, at a given temperature.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1bc166df-39f5-40a5-b304-542f094965c1', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 61, 'A salt bridge in a galvanic (Daniell) cell serves the primary purpose of:', 'Chemistry', 'Electrochemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb775660-ccff-46cb-baf3-dcf0929c2c82', '1bc166df-39f5-40a5-b304-542f094965c1', 0, 'Generating additional electrical current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1be481d8-67ba-4c60-8f99-6975aad8e5fe', '1bc166df-39f5-40a5-b304-542f094965c1', 1, 'Maintaining electrical neutrality in both half-cells by allowing ion flow, completing the internal circuit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8b1b1b1-dabe-440d-b284-b7191c565fee', '1bc166df-39f5-40a5-b304-542f094965c1', 2, 'Preventing any current flow between the half-cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e6ed380-5c25-4d96-9d45-5655689779d3', '1bc166df-39f5-40a5-b304-542f094965c1', 3, 'Cooling the electrolyte solutions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1bc166df-39f5-40a5-b304-542f094965c1', '1be481d8-67ba-4c60-8f99-6975aad8e5fe', 'The salt bridge allows ions to migrate between the two half-cells, balancing the charge buildup caused by electron flow through the external circuit, and thereby completing the internal circuit necessary for continuous cell operation.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('fea6330d-0546-4fe8-8d88-fe943962a051', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 62, 'The order of a chemical reaction is determined:', 'Chemistry', 'Chemical Kinetics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2aac1c6d-ad64-4455-8301-53171d6d9843', 'fea6330d-0546-4fe8-8d88-fe943962a051', 0, 'From the stoichiometric coefficients in the balanced chemical equation directly, always');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a9ff42e-4099-4c5b-9055-9523e5175938', 'fea6330d-0546-4fe8-8d88-fe943962a051', 1, 'Experimentally, from the observed dependence of rate on reactant concentrations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('988812b3-2cba-4280-9c7c-a5f66536e983', 'fea6330d-0546-4fe8-8d88-fe943962a051', 2, 'By the number of atoms in the reactants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81b861c6-3984-4dcf-84d2-68bf1c5636ad', 'fea6330d-0546-4fe8-8d88-fe943962a051', 3, 'It is always equal to the molecularity of the reaction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fea6330d-0546-4fe8-8d88-fe943962a051', '4a9ff42e-4099-4c5b-9055-9523e5175938', 'Reaction order must be determined experimentally (via rate law data) and can differ from the stoichiometric coefficients or molecularity, especially for complex, multi-step reaction mechanisms.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('19bb74d1-0124-4f11-8f1b-1acfe9b90b14', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 63, 'In the extraction of iron in a blast furnace, coke serves primarily as:', 'Chemistry', 'General Principles of Isolation of Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('acc0f75b-f78d-4624-9a32-635f2eda9801', '19bb74d1-0124-4f11-8f1b-1acfe9b90b14', 0, 'An oxidizing agent only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a95660ed-bfb0-4219-bcd7-da2e231b62c0', '19bb74d1-0124-4f11-8f1b-1acfe9b90b14', 1, 'A reducing agent (via CO formation) and a source of heat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('176e8cbd-bffc-4fb3-b334-bf39cbe3468e', '19bb74d1-0124-4f11-8f1b-1acfe9b90b14', 2, 'A flux to remove impurities exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32f9be90-3ec5-40e3-8aad-cd7700cd73e8', '19bb74d1-0124-4f11-8f1b-1acfe9b90b14', 3, 'A catalyst with no chemical consumption');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('19bb74d1-0124-4f11-8f1b-1acfe9b90b14', 'a95660ed-bfb0-4219-bcd7-da2e231b62c0', 'Coke burns to generate heat and also produces carbon monoxide, which acts as the actual reducing agent converting iron oxide ores to molten iron in the blast furnace.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('fbe35bfa-a25d-44d8-b037-31dcf3144335', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 64, 'Interhalogen compounds, such as ClF3 or IF5, are formed by the combination of:', 'Chemistry', 'p-Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('effe55c2-17a1-455e-aee6-65cfb94fbef4', 'fbe35bfa-a25d-44d8-b037-31dcf3144335', 0, 'Two atoms of the same halogen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('048d50a8-c1ed-403f-83ac-f6d404624dc7', 'fbe35bfa-a25d-44d8-b037-31dcf3144335', 1, 'Two different halogens, with the larger halogen usually acting as the central atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c6b3772-05b4-442d-b11c-69d46104308f', 'fbe35bfa-a25d-44d8-b037-31dcf3144335', 2, 'A halogen with a noble gas exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d30904de-0b25-49c2-9a99-71d1f794d3f1', 'fbe35bfa-a25d-44d8-b037-31dcf3144335', 3, 'A halogen with hydrogen only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fbe35bfa-a25d-44d8-b037-31dcf3144335', '048d50a8-c1ed-403f-83ac-f6d404624dc7', 'Interhalogen compounds form between two different halogen elements, typically with the larger, less electronegative halogen at the center surrounded by the smaller, more electronegative halogen atoms.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('34e2b1b9-b6a5-43e9-8fce-666c2d2930aa', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 65, 'Transition metals and their compounds often act as effective catalysts due to their ability to:', 'Chemistry', 'd and f Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1257eaea-57b9-4865-af9a-fc6ccc745511', '34e2b1b9-b6a5-43e9-8fce-666c2d2930aa', 0, 'Remain in a single, fixed oxidation state permanently');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d8e702f-e7ab-49b5-ad74-70e724f315a7', '34e2b1b9-b6a5-43e9-8fce-666c2d2930aa', 1, 'Exhibit variable oxidation states and form intermediate complexes with reactants, providing an alternative reaction pathway');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40f39cfe-87f9-46db-92d7-94ce01011dfe', '34e2b1b9-b6a5-43e9-8fce-666c2d2930aa', 2, 'Have completely filled and inert d-orbitals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0bd29de3-675a-47ba-bbd1-e3fac163b35f', '34e2b1b9-b6a5-43e9-8fce-666c2d2930aa', 3, 'Never interact with reactant molecules');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('34e2b1b9-b6a5-43e9-8fce-666c2d2930aa', '7d8e702f-e7ab-49b5-ad74-70e724f315a7', 'Transition metals'' ability to adopt multiple oxidation states and readily form complexes with reactant molecules allows them to provide surfaces/intermediates for reactions to proceed via a lower-activation-energy pathway, explaining their common catalytic activity.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0fb18ce2-f800-4650-8700-0848f6ebc010', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 66, 'The IUPAC naming convention for coordination compounds requires that, within the coordination sphere, ligands are named:', 'Chemistry', 'Coordination Compounds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17ade24d-9e74-4773-b75d-5532118a1af5', '0fb18ce2-f800-4650-8700-0848f6ebc010', 0, 'In no particular order, however preferred');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bebf8346-5008-4549-8d36-e6de43dbd576', '0fb18ce2-f800-4650-8700-0848f6ebc010', 1, 'In alphabetical order, before the name of the central metal atom/ion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d319a167-3ea0-4f4f-a67b-73221765a478', '0fb18ce2-f800-4650-8700-0848f6ebc010', 2, 'Only after the metal name, never before');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59c8d0c7-24e2-43b2-9e06-413bb881ff30', '0fb18ce2-f800-4650-8700-0848f6ebc010', 3, 'Using only their common (non-systematic) names');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0fb18ce2-f800-4650-8700-0848f6ebc010', 'bebf8346-5008-4549-8d36-e6de43dbd576', 'IUPAC nomenclature rules require ligands to be listed in alphabetical order (regardless of charge or number) before the name of the central metal ion within the complex''s name.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('dcf2428f-f3b8-4688-8899-faf3d445d417', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 67, 'Chlorofluorocarbons (CFCs), once widely used as refrigerants, are now regulated because they:', 'Chemistry', 'Haloalkanes and Haloarenes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51575396-fabb-4528-85d5-55def5a8b238', 'dcf2428f-f3b8-4688-8899-faf3d445d417', 0, 'Are highly flammable and explosive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a16ceeff-d1dd-4cf0-a502-03ea56465bb5', 'dcf2428f-f3b8-4688-8899-faf3d445d417', 1, 'Release chlorine radicals in the stratosphere that catalytically destroy ozone molecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a434791a-a779-4b15-8b0c-b91ae7c3db30', 'dcf2428f-f3b8-4688-8899-faf3d445d417', 2, 'Are extremely toxic to touch');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('14dd699e-f10d-404c-bf47-0ec61eb7530c', 'dcf2428f-f3b8-4688-8899-faf3d445d417', 3, 'Cause acid rain directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dcf2428f-f3b8-4688-8899-faf3d445d417', 'a16ceeff-d1dd-4cf0-a502-03ea56465bb5', 'CFCs are chemically stable in the lower atmosphere but photodissociate in the stratosphere under UV radiation, releasing chlorine atoms that catalytically destroy many ozone molecules, driving their international regulation under the Montreal Protocol.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('fe6079e8-1896-475e-8902-fa734fec9216', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 68, 'The Lucas test, used to distinguish between primary, secondary, and tertiary alcohols, is based on the differing reaction rates with:', 'Chemistry', 'Alcohols, Phenols and Ethers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4be0987-ce75-4390-a6c1-50a46e49ece3', 'fe6079e8-1896-475e-8902-fa734fec9216', 0, 'Sodium metal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d91889c1-d22a-4701-9bfa-9c2fab0480fa', 'fe6079e8-1896-475e-8902-fa734fec9216', 1, 'Lucas reagent (a mixture of anhydrous ZnCl2 and concentrated HCl), which reacts fastest with tertiary alcohols');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00c7aec1-ea8e-4e90-abbe-b1773e89a01d', 'fe6079e8-1896-475e-8902-fa734fec9216', 2, 'Potassium permanganate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7923f34-df5c-4a31-ab92-68db71f14c9e', 'fe6079e8-1896-475e-8902-fa734fec9216', 3, 'Only heat, with no reagent needed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fe6079e8-1896-475e-8902-fa734fec9216', 'd91889c1-d22a-4701-9bfa-9c2fab0480fa', 'The Lucas test exploits the differing rates at which primary, secondary, and tertiary alcohols form alkyl chlorides (via an SN1-like mechanism favored by more stable carbocations) with Lucas reagent — tertiary alcohols react almost instantly (turbidity), secondary more slowly, and primary very slowly or not at all at room temperature.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('434882c4-69e9-4576-9c47-69b5bc8c30f0', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 69, 'The Cannizzaro reaction occurs specifically with aldehydes that:', 'Chemistry', 'Aldehydes, Ketones and Carboxylic Acids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60eeaa40-6932-4449-865a-736d4697351a', '434882c4-69e9-4576-9c47-69b5bc8c30f0', 0, 'Have an alpha-hydrogen atom available');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65b6ed48-61bc-491a-9dd0-f25c697fdbe8', '434882c4-69e9-4576-9c47-69b5bc8c30f0', 1, 'Lack an alpha-hydrogen atom (e.g., formaldehyde, benzaldehyde), undergoing base-catalyzed self-oxidation-reduction (disproportionation)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27bd56e3-8946-4f5a-bba9-bc45d2c1408f', '434882c4-69e9-4576-9c47-69b5bc8c30f0', 2, 'Are always aliphatic with long carbon chains');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9e0abcd-cbcc-43ad-ac88-af8c3533c5e1', '434882c4-69e9-4576-9c47-69b5bc8c30f0', 3, 'Contain a halogen substituent, which is required for the reaction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('434882c4-69e9-4576-9c47-69b5bc8c30f0', '65b6ed48-61bc-491a-9dd0-f25c697fdbe8', 'Cannizzaro reaction requires aldehydes lacking an alpha-hydrogen (so they cannot undergo aldol condensation); under strong base, one molecule is oxidized to a carboxylate while another is reduced to an alcohol, in a disproportionation reaction.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('881329b6-d64c-443c-b939-bd74a0bec285', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 70, 'The Hofmann bromamide degradation reaction converts an amide into an amine with:', 'Chemistry', 'Amines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43ee75f4-3ec3-4c05-87f5-8a5e9725c5e0', '881329b6-d64c-443c-b939-bd74a0bec285', 0, 'Two more carbon atoms than the original amide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c45d0de-8eb1-44d5-bd3f-7a74f6ad869f', '881329b6-d64c-443c-b939-bd74a0bec285', 1, 'One less carbon atom than the original amide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2bd8aee-6fee-4f5e-bb56-615ef0aaaa3d', '881329b6-d64c-443c-b939-bd74a0bec285', 2, 'The same number of carbon atoms as the amide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('975f489e-90ea-448e-81d4-fc0075ce34f5', '881329b6-d64c-443c-b939-bd74a0bec285', 3, 'No nitrogen atom remaining');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('881329b6-d64c-443c-b939-bd74a0bec285', '0c45d0de-8eb1-44d5-bd3f-7a74f6ad869f', 'Hofmann degradation converts RCONH2 into RNH2, losing the carbonyl carbon as CO2 in the process — the resulting amine has one fewer carbon atom than the starting amide.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('97b2c30f-a928-44ae-a4ee-9f808c27f2db', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 71, 'Vitamins are classified as fat-soluble or water-soluble; which of the following is a fat-soluble vitamin?', 'Chemistry', 'Biomolecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('972e1aca-0c06-494f-abab-8504a98d24f7', '97b2c30f-a928-44ae-a4ee-9f808c27f2db', 0, 'Vitamin C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f546a4c0-93b8-43e9-acee-91f8de3778cb', '97b2c30f-a928-44ae-a4ee-9f808c27f2db', 1, 'Vitamin B1 (thiamine)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('232390b4-902e-4cbf-b195-4a267daac07f', '97b2c30f-a928-44ae-a4ee-9f808c27f2db', 2, 'Vitamin A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84fb7238-fb16-4076-81ce-bb6227a60aa5', '97b2c30f-a928-44ae-a4ee-9f808c27f2db', 3, 'Vitamin B12');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('97b2c30f-a928-44ae-a4ee-9f808c27f2db', '232390b4-902e-4cbf-b195-4a267daac07f', 'Fat-soluble vitamins include A, D, E, and K, which are stored in body fat; water-soluble vitamins (B-complex and C) are generally not stored and need regular dietary intake.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('28accd5a-d0c8-46fd-a3bd-897ca0dc3380', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 72, 'Biodegradable polymers, such as PHBV (poly-beta-hydroxybutyrate-co-beta-hydroxyvalerate), are of environmental interest because they:', 'Chemistry', 'Polymers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9683f163-8767-43e2-9d6f-0e9aa0ba9d27', '28accd5a-d0c8-46fd-a3bd-897ca0dc3380', 0, 'Persist indefinitely in the environment without decomposing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0e50189-6b41-4921-b2cb-32574c3baf4a', '28accd5a-d0c8-46fd-a3bd-897ca0dc3380', 1, 'Can be broken down by microorganisms in the environment, unlike many conventional plastics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb63bc3b-502f-4554-afae-606ee9605692', '28accd5a-d0c8-46fd-a3bd-897ca0dc3380', 2, 'Are more toxic than conventional plastics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4213a885-f3e7-4113-9c9a-014af2e562b5', '28accd5a-d0c8-46fd-a3bd-897ca0dc3380', 3, 'Cannot be used for any practical packaging application');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('28accd5a-d0c8-46fd-a3bd-897ca0dc3380', 'c0e50189-6b41-4921-b2cb-32574c3baf4a', 'Biodegradable polymers like PHBV can be enzymatically degraded by microorganisms in the environment, offering a more environmentally sustainable alternative to persistent conventional plastics.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1399be44-c02f-460a-85a5-e5756d4ce83f', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 73, 'Broad-spectrum antibiotics are those that are effective against:', 'Chemistry', 'Chemistry in Everyday Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a03f2c2-cd6d-4e4c-b143-f07645acbe99', '1399be44-c02f-460a-85a5-e5756d4ce83f', 0, 'Only Gram-positive bacteria');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aab9fe8a-3639-4cc3-89d7-ea874ce02428', '1399be44-c02f-460a-85a5-e5756d4ce83f', 1, 'Only Gram-negative bacteria');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59ca2e55-597f-406a-abd9-164eb8e85de1', '1399be44-c02f-460a-85a5-e5756d4ce83f', 2, 'A wide range of both Gram-positive and Gram-negative bacteria');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1408fc6b-a370-4b96-bc4f-d2cb03f00d65', '1399be44-c02f-460a-85a5-e5756d4ce83f', 3, 'Only viruses, not bacteria');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1399be44-c02f-460a-85a5-e5756d4ce83f', '59ca2e55-597f-406a-abd9-164eb8e85de1', 'Broad-spectrum antibiotics act against a wide variety of bacteria (both Gram-positive and Gram-negative), unlike narrow-spectrum antibiotics effective against only a limited group; antibiotics in general do not act against viruses.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f99ef318-4759-4cd1-8fcc-eda2e81bba62', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 74, 'For a strong acid-strong base titration, the pH at the exact equivalence point is:', 'Chemistry', 'Equilibrium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('032952da-45a5-4528-a869-0f29d6665a87', 'f99ef318-4759-4cd1-8fcc-eda2e81bba62', 0, 'Always acidic (pH less than 7)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfcd5b19-7677-4533-bb8e-79343487f146', 'f99ef318-4759-4cd1-8fcc-eda2e81bba62', 1, 'Neutral, at pH = 7 (at 25 degrees C)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16fd0969-47bb-456e-b1e1-94fc84bb55ab', 'f99ef318-4759-4cd1-8fcc-eda2e81bba62', 2, 'Always basic (pH greater than 7)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c10c7ac4-ba20-4d8a-af8f-0d2ebf6978f9', 'f99ef318-4759-4cd1-8fcc-eda2e81bba62', 3, 'Undefined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f99ef318-4759-4cd1-8fcc-eda2e81bba62', 'dfcd5b19-7677-4533-bb8e-79343487f146', 'For a strong acid neutralizing a strong base in exact stoichiometric amounts, the resulting salt does not hydrolyze, giving a neutral solution with pH = 7 at 25 degrees C at the equivalence point.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9dfe9fa6-6855-4b4e-a292-11353f0929e4', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 75, 'According to molecular orbital theory, the bond order of the N2 molecule is:', 'Chemistry', 'Chemical Bonding and Molecular Structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47dca5e9-028e-4405-ac8f-e736dc25cf22', '9dfe9fa6-6855-4b4e-a292-11353f0929e4', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('057ce4a9-954a-4600-b077-e79e9f2489a8', '9dfe9fa6-6855-4b4e-a292-11353f0929e4', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('390d968b-4d82-4eb2-adef-4c624f6c8bb4', '9dfe9fa6-6855-4b4e-a292-11353f0929e4', 2, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8f2bc93-7660-4679-a858-07021288c1b7', '9dfe9fa6-6855-4b4e-a292-11353f0929e4', 3, '0');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9dfe9fa6-6855-4b4e-a292-11353f0929e4', '390d968b-4d82-4eb2-adef-4c624f6c8bb4', 'Nitrogen''s molecular orbital configuration gives a bond order of 3 (one sigma and two pi bonds), consistent with the very high bond dissociation energy and short bond length of the N2 triple bond.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('fd1d3ccf-4473-47aa-be0d-fda76126689a', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 76, 'Hund''s rule of maximum multiplicity states that electrons are distributed among degenerate (equal-energy) orbitals such that:', 'Chemistry', 'Structure of Atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79ca2f4d-4304-41ef-9f1f-cec75142610f', 'fd1d3ccf-4473-47aa-be0d-fda76126689a', 0, 'They pair up in the same orbital as quickly as possible');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e81f079-472c-413f-828a-5a6a0134c8fc', 'fd1d3ccf-4473-47aa-be0d-fda76126689a', 1, 'Each orbital is singly occupied first, with parallel spins, before any orbital receives a second electron');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64aaff3d-eed7-4b6a-a56b-e0a28072cc24', 'fd1d3ccf-4473-47aa-be0d-fda76126689a', 2, 'All electrons must have opposite spins');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c103fff-d59a-4aee-8870-9574cdb21a6b', 'fd1d3ccf-4473-47aa-be0d-fda76126689a', 3, 'Only s-orbitals can hold more than one electron');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fd1d3ccf-4473-47aa-be0d-fda76126689a', '5e81f079-472c-413f-828a-5a6a0134c8fc', 'Hund''s rule states that degenerate orbitals (e.g., the three 2p orbitals) are each singly filled with parallel-spin electrons before any pairing occurs, minimizing electron-electron repulsion and maximizing total spin multiplicity.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('43e32629-b138-4a17-af0d-875d114de6fa', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 77, 'Balancing redox reactions by the ion-electron (half-reaction) method involves separately balancing:', 'Chemistry', 'Redox Reactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48fa7592-8338-46c8-8088-c07c600aa1cc', '43e32629-b138-4a17-af0d-875d114de6fa', 0, 'Only the atoms, ignoring charge entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e59f9cae-1ed9-4498-abf7-8eb3f6726d90', '43e32629-b138-4a17-af0d-875d114de6fa', 1, 'The oxidation half-reaction and reduction half-reaction separately (for both atoms and charge), then combining them so electrons cancel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54b494ee-4895-47e2-93ad-baf5618aad02', '43e32629-b138-4a17-af0d-875d114de6fa', 2, 'Only the oxidation half-reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1788ec08-47b0-40b2-b813-6dad30484d9e', '43e32629-b138-4a17-af0d-875d114de6fa', 3, 'Neither half-reaction; only the overall equation matters');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('43e32629-b138-4a17-af0d-875d114de6fa', 'e59f9cae-1ed9-4498-abf7-8eb3f6726d90', 'The ion-electron method splits a redox reaction into its oxidation and reduction half-reactions, balances each for atoms and charge independently, then combines them (after multiplying to equalize electron transfer) so that electrons lost equal electrons gained.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d79b7f38-e968-42e1-a496-1b89983c45af', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 78, 'The Freundlich adsorption isotherm is an empirical relationship describing how the extent of adsorption of a gas on a solid varies with:', 'Chemistry', 'Surface Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50c4a3ae-b511-4709-94de-9c98238346ff', 'd79b7f38-e968-42e1-a496-1b89983c45af', 0, 'Temperature alone, with no pressure dependence');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80c456ea-6142-4cb0-9489-6e4e750c2e9c', 'd79b7f38-e968-42e1-a496-1b89983c45af', 1, 'Pressure (or concentration) of the adsorbate at a given constant temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2789a8ea-a39b-4c9b-ac54-d0c677e87772', 'd79b7f38-e968-42e1-a496-1b89983c45af', 2, 'The color of the solid adsorbent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b5718d9-6dcc-4af3-8daa-a71c09ab53a7', 'd79b7f38-e968-42e1-a496-1b89983c45af', 3, 'The atomic number of the solid');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d79b7f38-e968-42e1-a496-1b89983c45af', '80c456ea-6142-4cb0-9489-6e4e750c2e9c', 'The Freundlich isotherm empirically relates the amount of gas/solute adsorbed per unit mass of adsorbent to the equilibrium pressure/concentration of the adsorbate at a fixed temperature.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e34d86db-91ad-4f80-b31d-650bd5b20324', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 79, 'Wurtz reaction is used to prepare higher alkanes by reacting alkyl halides with:', 'Chemistry', 'Hydrocarbons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('388f988a-abd5-416c-993d-958cccce0529', 'e34d86db-91ad-4f80-b31d-650bd5b20324', 0, 'Sodium metal in dry ether');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6fd91db5-5349-437e-8cca-dd8159beae97', 'e34d86db-91ad-4f80-b31d-650bd5b20324', 1, 'Concentrated sulfuric acid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad0f8a20-5cec-45b3-a9af-f19cb01ca365', 'e34d86db-91ad-4f80-b31d-650bd5b20324', 2, 'Aqueous sodium hydroxide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8434ffe5-66ba-4a58-89c5-dd60cd7d465d', 'e34d86db-91ad-4f80-b31d-650bd5b20324', 3, 'Hydrogen gas with a nickel catalyst');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e34d86db-91ad-4f80-b31d-650bd5b20324', '388f988a-abd5-416c-993d-958cccce0529', 'The Wurtz reaction couples two alkyl halide molecules using sodium metal in dry ether, forming a higher alkane with double the carbon chain length (when both alkyl groups are identical) via a free-radical mechanism.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1feeb60d-f340-45a6-88d5-66e83235268c', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 80, 'Entropy (S) is best described as a thermodynamic measure of:', 'Chemistry', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82218103-f711-4f9b-8bbc-025b482ae5b8', '1feeb60d-f340-45a6-88d5-66e83235268c', 0, 'The total energy content of a system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f59c215-1ccc-4752-9cbd-eee171194494', '1feeb60d-f340-45a6-88d5-66e83235268c', 1, 'The degree of randomness or disorder in a system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6cf5a966-6971-463c-9ee5-d4031833845a', '1feeb60d-f340-45a6-88d5-66e83235268c', 2, 'The temperature of a system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a01e1ed-a385-4de4-b710-7d71417f6cb6', '1feeb60d-f340-45a6-88d5-66e83235268c', 3, 'The pressure exerted by a system');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1feeb60d-f340-45a6-88d5-66e83235268c', '3f59c215-1ccc-4752-9cbd-eee171194494', 'Entropy is a state function that quantifies the degree of disorder/randomness (or, in statistical terms, the number of accessible microstates) of a system.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e446f9ce-7679-426c-b1d8-6a5df6b75836', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 81, 'Plaster of Paris, used in making casts and molds, is chemically:', 'Chemistry', 's-Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03c069d0-ef1f-46b7-b8bb-e40ce88cc669', 'e446f9ce-7679-426c-b1d8-6a5df6b75836', 0, 'Calcium carbonate (CaCO3)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ab40c33-f135-468e-b5e2-fcbc7d649d47', 'e446f9ce-7679-426c-b1d8-6a5df6b75836', 1, 'Calcium sulfate hemihydrate (CaSO4.1/2H2O)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09919959-0d3e-468f-ae72-f42bb0682aa6', 'e446f9ce-7679-426c-b1d8-6a5df6b75836', 2, 'Calcium oxide (CaO)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad3403c0-adc9-4892-8892-c872b46d8f2d', 'e446f9ce-7679-426c-b1d8-6a5df6b75836', 3, 'Sodium carbonate (Na2CO3)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e446f9ce-7679-426c-b1d8-6a5df6b75836', '3ab40c33-f135-468e-b5e2-fcbc7d649d47', 'Plaster of Paris is calcium sulfate hemihydrate, formed by partially dehydrating gypsum (CaSO4.2H2O); it sets by re-absorbing water to reform gypsum, which is why it''s useful for casts.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e3f5bac2-9248-4d26-b505-97a22bcd09f8', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 82, 'A molecule with a net dipole moment of zero, despite having polar bonds, is described as:', 'Chemistry', 'Chemical Bonding and Molecular Structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1f54903-42d2-488e-93f1-535564565d2f', 'e3f5bac2-9248-4d26-b505-97a22bcd09f8', 0, 'Ionic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43bd3f4c-37e1-4276-a530-578c90309a6c', 'e3f5bac2-9248-4d26-b505-97a22bcd09f8', 1, 'Non-polar overall, due to the symmetrical cancellation of individual bond dipoles (e.g., CO2)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9f55877-b9f1-4d43-bd09-1c1ecf8bb415', 'e3f5bac2-9248-4d26-b505-97a22bcd09f8', 2, 'Impossible; any molecule with polar bonds must have a net dipole');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a086ce0-98a8-4cb3-8849-d92ea5169692', 'e3f5bac2-9248-4d26-b505-97a22bcd09f8', 3, 'Radioactive');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e3f5bac2-9248-4d26-b505-97a22bcd09f8', '43bd3f4c-37e1-4276-a530-578c90309a6c', 'In molecules like CO2 (linear, symmetric), the individual C=O bond dipoles are equal in magnitude and point in exactly opposite directions, so they cancel out, giving zero net molecular dipole moment despite each bond being polar.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3014abd1-d069-405f-91b7-a018732de3b3', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 83, 'The common ion effect refers to the suppression of ionization of a weak electrolyte when:', 'Chemistry', 'Equilibrium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a94d4e5-e2da-44df-a006-c25856baa405', '3014abd1-d069-405f-91b7-a018732de3b3', 0, 'A completely unrelated ion is added to the solution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3abbc30-9f74-49b6-84e3-15d97771c9b3', '3014abd1-d069-405f-91b7-a018732de3b3', 1, 'An ion common to the weak electrolyte''s own dissociation is added from another (usually strong) source');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7170c51-f859-4d30-bd40-897a885edb9a', '3014abd1-d069-405f-91b7-a018732de3b3', 2, 'The temperature of the solution is raised');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db6d5318-3a56-4572-8918-d2bd627e3158', '3014abd1-d069-405f-91b7-a018732de3b3', 3, 'The solution is diluted with pure water');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3014abd1-d069-405f-91b7-a018732de3b3', 'e3abbc30-9f74-49b6-84e3-15d97771c9b3', 'Adding a strong electrolyte that shares a common ion with a weak electrolyte shifts the weak electrolyte''s equilibrium backward (per Le Chatelier''s principle), suppressing its degree of ionization — the common ion effect.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1d473d06-9468-4d32-a702-edb10ebb6e42', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 84, 'Molarity of a solution is defined as:', 'Chemistry', 'Some Basic Concepts of Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe286b5e-5af4-4fdb-b8d5-00dd0bb802dd', '1d473d06-9468-4d32-a702-edb10ebb6e42', 0, 'Moles of solute per kilogram of solvent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84df280b-d3ba-4226-87f5-8d14e928297c', '1d473d06-9468-4d32-a702-edb10ebb6e42', 1, 'Moles of solute per litre of solution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('252edd22-0c50-4676-b71a-4a73b9ac031e', '1d473d06-9468-4d32-a702-edb10ebb6e42', 2, 'Grams of solute per litre of solution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a34bf4a5-fa9a-4b0e-9932-14de4b2ee0a2', '1d473d06-9468-4d32-a702-edb10ebb6e42', 3, 'Moles of solute per mole of solvent');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1d473d06-9468-4d32-a702-edb10ebb6e42', '84df280b-d3ba-4226-87f5-8d14e928297c', 'Molarity (M) = moles of solute / volume of solution in litres — a temperature-dependent concentration unit since volume changes slightly with temperature, unlike molality.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5bddbf15-486c-4a14-a7f9-6a7740bca4b6', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 85, 'The modern periodic law, as proposed by Moseley, states that the properties of elements are a periodic function of their:', 'Chemistry', 'Classification of Elements and Periodicity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f12c863d-24ef-4dc6-a486-06f8a9c5a0a4', '5bddbf15-486c-4a14-a7f9-6a7740bca4b6', 0, 'Atomic mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6cb2772d-6fe2-45ff-bfd9-0f25175662a9', '5bddbf15-486c-4a14-a7f9-6a7740bca4b6', 1, 'Atomic number');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d853d43-9523-443a-837f-1afe0975b181', '5bddbf15-486c-4a14-a7f9-6a7740bca4b6', 2, 'Number of neutrons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a64d1681-b2fc-499a-aa94-a4baad05ab19', '5bddbf15-486c-4a14-a7f9-6a7740bca4b6', 3, 'Melting point');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5bddbf15-486c-4a14-a7f9-6a7740bca4b6', '6cb2772d-6fe2-45ff-bfd9-0f25175662a9', 'Moseley''s modern periodic law corrected Mendeleev''s atomic-mass-based law, establishing that elemental properties repeat periodically when elements are arranged by increasing ATOMIC NUMBER (proton count), resolving several anomalies in the older mass-based ordering.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3c428e94-9fb7-4493-a6b2-d4fe0d438067', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 86, 'For an ideal gas, the internal energy depends only on:', 'Chemistry', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c0e7dc4-4be4-4ac6-bbb8-23855a293ece', '3c428e94-9fb7-4493-a6b2-d4fe0d438067', 0, 'Its pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('227d78bd-1a39-4bbd-b659-a84d9d270469', '3c428e94-9fb7-4493-a6b2-d4fe0d438067', 1, 'Its volume');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae77e565-0624-4846-bcfd-a3f898da7e04', '3c428e94-9fb7-4493-a6b2-d4fe0d438067', 2, 'Its absolute temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54103a0b-f298-4ae1-a4f5-14c6813354cb', '3c428e94-9fb7-4493-a6b2-d4fe0d438067', 3, 'Both pressure and volume equally, but not temperature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3c428e94-9fb7-4493-a6b2-d4fe0d438067', 'ae77e565-0624-4846-bcfd-a3f898da7e04', 'For an ideal gas, internal energy is a function of temperature alone (since there are no intermolecular forces), independent of pressure or volume changes at constant temperature — a key simplifying assumption in ideal gas thermodynamics.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7402c746-7713-409d-843d-7a105da02870', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 87, 'An electrophile is a species that:', 'Chemistry', 'Organic Chemistry — Basic Principles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('524a5709-e3cc-4c83-ad66-de70631d36c7', '7402c746-7713-409d-843d-7a105da02870', 0, 'Is electron-rich and donates an electron pair');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9534273a-b226-49ce-b075-ee5136df4980', '7402c746-7713-409d-843d-7a105da02870', 1, 'Is electron-deficient and seeks an electron pair to form a new bond');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6645330d-be7b-43e3-9919-1feab0feb97b', '7402c746-7713-409d-843d-7a105da02870', 2, 'Always carries a negative charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('499fd172-9545-44b4-b54e-cafef5ea37c3', '7402c746-7713-409d-843d-7a105da02870', 3, 'Cannot react with nucleophiles');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7402c746-7713-409d-843d-7a105da02870', '9534273a-b226-49ce-b075-ee5136df4980', 'Electrophiles (''electron-loving'') are electron-deficient species (cations or neutral molecules with an incomplete octet or an electropositive centre) that accept an electron pair from a nucleophile to form a new bond.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('461de1d5-ed93-4d83-984a-5b04b0f1407b', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 88, 'Interstitial compounds formed by transition metals with small atoms like carbon, nitrogen, or hydrogen occupying the gaps in the metal lattice typically result in the metal becoming:', 'Chemistry', 'd and f Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a42aa256-7494-416b-baa8-f7f06c881acc', '461de1d5-ed93-4d83-984a-5b04b0f1407b', 0, 'Softer and more brittle in all cases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b30038b-c487-4d58-b950-490f8bc7ad43', '461de1d5-ed93-4d83-984a-5b04b0f1407b', 1, 'Harder and more resistant to wear, often retaining metallic conductivity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca67c5a2-cae4-49ad-99a5-c6a449b6c713', '461de1d5-ed93-4d83-984a-5b04b0f1407b', 2, 'Non-conductive to electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00cbe5e5-2838-401c-87fb-d46718941bc5', '461de1d5-ed93-4d83-984a-5b04b0f1407b', 3, 'Non-metallic in appearance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('461de1d5-ed93-4d83-984a-5b04b0f1407b', '9b30038b-c487-4d58-b950-490f8bc7ad43', 'Interstitial compounds (e.g., tungsten carbide, iron carbide) typically increase the hardness and mechanical/chemical resistance of the parent metal, while the metallic lattice largely retains its characteristic conductivity.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3bd72f3c-6cd9-4189-8476-1cfae5488a67', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 89, 'The relative rate of SN2 reactions for alkyl halides generally follows the order:', 'Chemistry', 'Haloalkanes and Haloarenes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10232f85-59ca-4bf7-8125-d4f1d37c09c3', '3bd72f3c-6cd9-4189-8476-1cfae5488a67', 0, 'Tertiary > secondary > primary > methyl');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8100c4a7-96e4-4999-961b-485c80138f9d', '3bd72f3c-6cd9-4189-8476-1cfae5488a67', 1, 'Methyl > primary > secondary > tertiary, due to decreasing steric hindrance around the reaction centre');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd010e2f-f059-4935-9ed4-c919760a4ffb', '3bd72f3c-6cd9-4189-8476-1cfae5488a67', 2, 'All alkyl halides react at exactly the same rate in SN2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd8ae306-810f-4e8b-ad44-99554c1cf16e', '3bd72f3c-6cd9-4189-8476-1cfae5488a67', 3, 'Tertiary halides react fastest via SN2 due to more stable carbocations');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3bd72f3c-6cd9-4189-8476-1cfae5488a67', '8100c4a7-96e4-4999-961b-485c80138f9d', 'SN2 reactions proceed via a single-step backside attack that is highly sensitive to steric hindrance around the carbon bearing the leaving group; methyl and primary halides (least hindered) react fastest, while bulky tertiary halides react extremely slowly (or not at all) via this mechanism.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b67ebf34-7fe6-4c7a-a14c-943efc660aef', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 90, 'A Frenkel defect in an ionic crystal occurs when:', 'Chemistry', 'Solid State');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e627fca7-abdd-4b1a-be92-4a85e6c46247', 'b67ebf34-7fe6-4c7a-a14c-943efc660aef', 0, 'An ion leaves its normal lattice site and occupies an interstitial position, leaving a vacancy behind, with no change in overall density');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60cb88b2-feae-41d2-94ab-31c9d4396cb6', 'b67ebf34-7fe6-4c7a-a14c-943efc660aef', 1, 'A pair of oppositely charged ions is entirely missing from the lattice');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0240ac3b-bc7a-40bd-bb53-1ed08b61731f', 'b67ebf34-7fe6-4c7a-a14c-943efc660aef', 2, 'An extra ion is added to the crystal from outside');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc0dcb04-6390-4159-888d-c058b6a2330f', 'b67ebf34-7fe6-4c7a-a14c-943efc660aef', 3, 'The crystal completely loses its lattice structure');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b67ebf34-7fe6-4c7a-a14c-943efc660aef', 'e627fca7-abdd-4b1a-be92-4a85e6c46247', 'A Frenkel defect arises when a smaller ion (typically the cation) is displaced from its normal lattice site into an interstitial site, creating a vacancy at the original site without changing the crystal''s overall density (unlike a Schottky defect, which does reduce density).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Biology (90 questions) — Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a32db80d-6f35-4772-86c2-d3acf388bd66', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 91, 'A herbarium is a facility that maintains:', 'Biology', 'The Living World');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a0c03e3-db7b-4da6-b325-cf288bd2839c', 'a32db80d-6f35-4772-86c2-d3acf388bd66', 0, 'Living plants arranged for public viewing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e3f6779-4237-4b10-aa03-f881a417fd94', 'a32db80d-6f35-4772-86c2-d3acf388bd66', 1, 'Dried, pressed, and preserved plant specimens mounted on sheets, along with taxonomic labels');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('634f076e-c468-4123-838a-dc7a5d8da3dd', 'a32db80d-6f35-4772-86c2-d3acf388bd66', 2, 'Only seeds of endangered species');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4968c0a4-6b2d-4c37-9d21-973b2894119c', 'a32db80d-6f35-4772-86c2-d3acf388bd66', 3, 'Aquatic organisms in tanks');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a32db80d-6f35-4772-86c2-d3acf388bd66', '9e3f6779-4237-4b10-aa03-f881a417fd94', 'A herbarium is a repository of dried, pressed plant specimens systematically arranged and labeled, serving as an important taxonomic reference collection, distinct from a botanical garden (living plants) or a zoo.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c49dfffb-f41c-42b1-8b2c-7dcc89f6c71d', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 92, 'Viruses are generally considered non-living outside a host cell because they:', 'Biology', 'Biological Classification');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44fd6758-a718-4940-9182-4260ef9ea757', 'c49dfffb-f41c-42b1-8b2c-7dcc89f6c71d', 0, 'Have their own independent metabolic machinery');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07f64009-21d6-474f-a9f0-f08ef8fb4596', 'c49dfffb-f41c-42b1-8b2c-7dcc89f6c71d', 1, 'Lack an independent metabolic system and can replicate only by using the host cell''s machinery');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa693d44-66fc-4aba-9090-0b6eda14c848', 'c49dfffb-f41c-42b1-8b2c-7dcc89f6c71d', 2, 'Are always larger than bacteria');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d404de97-b3a6-4e1d-83ad-67c14c8aadd9', 'c49dfffb-f41c-42b1-8b2c-7dcc89f6c71d', 3, 'Contain both DNA and RNA simultaneously');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c49dfffb-f41c-42b1-8b2c-7dcc89f6c71d', '07f64009-21d6-474f-a9f0-f08ef8fb4596', 'Viruses have no independent metabolism or ribosomal machinery of their own; they are obligate intracellular parasites that can only replicate by hijacking the host cell''s biosynthetic machinery, blurring the line between living and non-living.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('632c4c3e-95f2-43cd-a31e-27a2dee980b5', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 93, 'In the moss (bryophyte) life cycle, the leafy, green, photosynthetic structure commonly seen is the:', 'Biology', 'Plant Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6958b52e-732d-4bfa-993a-999fb6bdd5cc', '632c4c3e-95f2-43cd-a31e-27a2dee980b5', 0, 'Sporophyte');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('daf5ab32-df42-4c3e-8385-dc61657bb2aa', '632c4c3e-95f2-43cd-a31e-27a2dee980b5', 1, 'Gametophyte');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('361ef32d-5958-46e2-ad6d-6f260dfd87fe', '632c4c3e-95f2-43cd-a31e-27a2dee980b5', 2, 'Sporangium alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c4b709b-e3ba-4170-81b8-57994a688a22', '632c4c3e-95f2-43cd-a31e-27a2dee980b5', 3, 'Seed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('632c4c3e-95f2-43cd-a31e-27a2dee980b5', 'daf5ab32-df42-4c3e-8385-dc61657bb2aa', 'In bryophytes (mosses), the dominant, independent, photosynthetic generation is the haploid gametophyte; the sporophyte remains attached to and dependent on the gametophyte for nutrition.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7c53f97d-77ea-4fb6-979e-36c14ee6f32a', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 94, 'A compound leaf, unlike a simple leaf, is characterized by:', 'Biology', 'Morphology of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7d44206-ad7a-4ea6-8e46-32b31d2b12d4', '7c53f97d-77ea-4fb6-979e-36c14ee6f32a', 0, 'A single, undivided lamina');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8b3ae3d-e83a-4855-baba-946eb4378c37', '7c53f97d-77ea-4fb6-979e-36c14ee6f32a', 1, 'A lamina divided into several leaflets, with an axillary bud present only at the base of the petiole, not at the base of each leaflet');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0f28e3d-bd79-4274-b6fe-8b85c8658add', '7c53f97d-77ea-4fb6-979e-36c14ee6f32a', 2, 'The complete absence of a petiole');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c78280db-000c-4ca5-815d-86041ed5bf10', '7c53f97d-77ea-4fb6-979e-36c14ee6f32a', 3, 'Being found only in monocots');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7c53f97d-77ea-4fb6-979e-36c14ee6f32a', 'f8b3ae3d-e83a-4855-baba-946eb4378c37', 'In a compound leaf, the lamina is divided into distinct leaflets; the key distinguishing feature is that an axillary bud is present at the base of the whole leaf (petiole) but NOT at the base of individual leaflets, unlike a branch bearing multiple simple leaves.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('057f91c9-69a1-4cbc-b911-ff42bbc4afd1', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 95, 'In monocot stems, the vascular bundles are typically:', 'Biology', 'Anatomy of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7f57c3b-3094-4d0c-b809-27568932e1e2', '057f91c9-69a1-4cbc-b911-ff42bbc4afd1', 0, 'Arranged in a single ring, with a well-defined cambium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('526ab229-9a0d-4baf-b396-1484297fcb7e', '057f91c9-69a1-4cbc-b911-ff42bbc4afd1', 1, 'Scattered throughout the ground tissue, and are generally without cambium (closed bundles)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e75db24c-2558-45f5-93bf-5a45769e3232', '057f91c9-69a1-4cbc-b911-ff42bbc4afd1', 2, 'Absent entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f0f5a94-33d3-4dd0-891f-96a26746bc41', '057f91c9-69a1-4cbc-b911-ff42bbc4afd1', 3, 'Arranged only at the very centre of the stem');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('057f91c9-69a1-4cbc-b911-ff42bbc4afd1', '526ab229-9a0d-4baf-b396-1484297fcb7e', 'Monocot stems typically show scattered vascular bundles throughout the ground tissue, and each bundle is ''closed'' (lacking cambium), which is why most monocots do not show secondary growth — a key anatomical contrast with dicot stems.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('520235c2-7ff3-4c48-8b32-b34e0bc1e050', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 96, 'The nucleolus, found within the nucleus, is primarily the site of:', 'Biology', 'Cell — The Unit of Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('092c7a67-4a0d-46c4-a3bb-64bf22a2394b', '520235c2-7ff3-4c48-8b32-b34e0bc1e050', 0, 'DNA replication exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9cd4ca40-083e-45ac-94fd-ad42e370c6f9', '520235c2-7ff3-4c48-8b32-b34e0bc1e050', 1, 'Ribosomal RNA (rRNA) synthesis and ribosome subunit assembly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f3cef63f-2d61-487d-9e26-942abd8a20bc', '520235c2-7ff3-4c48-8b32-b34e0bc1e050', 2, 'Protein synthesis directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('022bd62e-33f5-46cc-875b-9af543002753', '520235c2-7ff3-4c48-8b32-b34e0bc1e050', 3, 'ATP production');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('520235c2-7ff3-4c48-8b32-b34e0bc1e050', '9cd4ca40-083e-45ac-94fd-ad42e370c6f9', 'The nucleolus is a dense, non-membrane-bound region within the nucleus specialized for transcribing rRNA genes and assembling ribosomal subunits, which are then exported to the cytoplasm.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f582bb90-8b32-472d-8e24-93e1a94c1d09', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 97, 'Lipids, unlike carbohydrates and proteins, are characteristically:', 'Biology', 'Biomolecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7cc2abc4-13e7-4a4c-911e-1ad25750a86e', 'f582bb90-8b32-472d-8e24-93e1a94c1d09', 0, 'Highly soluble in water');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c18aecdd-414b-4c5c-bba7-eac4cbd40df1', 'f582bb90-8b32-472d-8e24-93e1a94c1d09', 1, 'Insoluble (or poorly soluble) in water but soluble in organic solvents');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ccc36019-1a54-4c72-9549-76a18919a255', 'f582bb90-8b32-472d-8e24-93e1a94c1d09', 2, 'Composed exclusively of amino acids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1d151c8-8928-4550-8498-2740b13efc48', 'f582bb90-8b32-472d-8e24-93e1a94c1d09', 3, 'Always found only in animal cells, never plants');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f582bb90-8b32-472d-8e24-93e1a94c1d09', 'c18aecdd-414b-4c5c-bba7-eac4cbd40df1', 'Lipids are largely hydrophobic (non-polar), making them poorly soluble in water but readily soluble in organic solvents like chloroform or ether — a defining physical property distinguishing them from the generally more water-soluble carbohydrates and many proteins.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('22cbe5a5-94ab-49b0-bbef-3091e89998c3', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 98, 'In meiosis II, the separation event that occurs is analogous to that seen in mitosis, namely the separation of:', 'Biology', 'Cell Cycle and Cell Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72715920-2cfd-4fba-948a-1037ced02883', '22cbe5a5-94ab-49b0-bbef-3091e89998c3', 0, 'Homologous chromosomes from each other');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03bbabfe-2343-48ca-aae7-aa16831e3970', '22cbe5a5-94ab-49b0-bbef-3091e89998c3', 1, 'Sister chromatids of each chromosome, moving to opposite poles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3375b01c-6d14-4206-9faf-a09fe63da548', '22cbe5a5-94ab-49b0-bbef-3091e89998c3', 2, 'Entire cells splitting into four simultaneously without any chromatid separation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e39690c-836e-4602-a693-85d1da501c6f', '22cbe5a5-94ab-49b0-bbef-3091e89998c3', 3, 'Only the nucleolus divides, not the chromosomes');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('22cbe5a5-94ab-49b0-bbef-3091e89998c3', '03bbabfe-2343-48ca-aae7-aa16831e3970', 'Meiosis II resembles a mitotic division: sister chromatids of each (already-haploid) chromosome are separated and pulled to opposite poles, ultimately producing four haploid daughter cells from the original diploid cell after both meiotic divisions.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ed01642d-2e8a-4a53-8a3c-955014d37821', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 99, 'In C4 plants, the CO2 fixed initially in mesophyll cells (as a 4-carbon compound) is subsequently transported to which cells for entry into the Calvin cycle?', 'Biology', 'Photosynthesis in Higher Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc588291-1f97-40d0-aa68-58c46e29fc42', 'ed01642d-2e8a-4a53-8a3c-955014d37821', 0, 'Epidermal cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b63cfa64-3b6d-4274-99ca-a36172af649f', 'ed01642d-2e8a-4a53-8a3c-955014d37821', 1, 'Bundle sheath cells, where RuBisCO and the Calvin cycle actually operate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5774410-3023-45e2-a6e3-1740033f9632', 'ed01642d-2e8a-4a53-8a3c-955014d37821', 2, 'Root cortex cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95512a65-dd36-4bf7-aec5-e1249acc06be', 'ed01642d-2e8a-4a53-8a3c-955014d37821', 3, 'Xylem vessel cells');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ed01642d-2e8a-4a53-8a3c-955014d37821', 'b63cfa64-3b6d-4274-99ca-a36172af649f', 'In C4 plants, the 4-carbon compound (oxaloacetate/malate) formed in mesophyll cells is transported into the bundle sheath cells, where it is decarboxylated to release CO2 for fixation by RuBisCO in the Calvin cycle, minimizing photorespiration.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('073f46d1-0d89-4eb7-b80f-f2ab835f2054', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 100, 'The electron transport chain (ETC) in aerobic respiration, located in the inner mitochondrial membrane, ultimately transfers electrons to:', 'Biology', 'Respiration in Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('218212aa-5bb9-4646-bf82-62d0cc9600de', '073f46d1-0d89-4eb7-b80f-f2ab835f2054', 0, 'Carbon dioxide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c3c0106-2ed3-4e5f-b83a-5dc7a7d99a59', '073f46d1-0d89-4eb7-b80f-f2ab835f2054', 1, 'Oxygen, the final electron acceptor, forming water');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69f5273a-f726-48c0-825e-bf93c05c9b8d', '073f46d1-0d89-4eb7-b80f-f2ab835f2054', 2, 'Glucose directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6415661b-775d-449d-987a-8382c4f634a7', '073f46d1-0d89-4eb7-b80f-f2ab835f2054', 3, 'ADP');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('073f46d1-0d89-4eb7-b80f-f2ab835f2054', '3c3c0106-2ed3-4e5f-b83a-5dc7a7d99a59', 'In the ETC, electrons are passed through a series of carriers and ultimately transferred to molecular oxygen (the terminal electron acceptor), which combines with these electrons and protons to form water — this step is essential for aerobic ATP production via oxidative phosphorylation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('854ab1e7-b0f1-4fa9-b66b-ee4dbfc2b6da', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 101, 'Cytokinins, a class of plant hormones, are particularly well known for promoting:', 'Biology', 'Plant Growth and Development');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ddbe2615-d505-4da6-8736-3c715e1a5626', '854ab1e7-b0f1-4fa9-b66b-ee4dbfc2b6da', 0, 'Leaf senescence and abscission');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65ab9389-8ab0-4d39-93d9-f2b3511d546a', '854ab1e7-b0f1-4fa9-b66b-ee4dbfc2b6da', 1, 'Cell division (cytokinesis) and delaying senescence');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1011bd5-3102-4303-8be5-005315b7a90e', '854ab1e7-b0f1-4fa9-b66b-ee4dbfc2b6da', 2, 'Stomatal closure under stress');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e674e029-0a1d-40f3-b2be-78ae3b81f045', '854ab1e7-b0f1-4fa9-b66b-ee4dbfc2b6da', 3, 'Fruit ripening');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('854ab1e7-b0f1-4fa9-b66b-ee4dbfc2b6da', '65ab9389-8ab0-4d39-93d9-f2b3511d546a', 'Cytokinins primarily stimulate cell division and, notably, DELAY senescence (aging) of plant organs like leaves — the opposite effect of ethylene, which promotes senescence and abscission.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e28f4b18-8456-4bb8-a9e6-862d77ac817f', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 102, 'The megaspore mother cell within the ovule undergoes meiosis to produce:', 'Biology', 'Sexual Reproduction in Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bf1e3db-e99c-4b8d-823f-9003bf9ad6a2', 'e28f4b18-8456-4bb8-a9e6-862d77ac817f', 0, 'Four diploid megaspores');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('174aaccd-fe92-420c-9ffc-61b22c7007b5', 'e28f4b18-8456-4bb8-a9e6-862d77ac817f', 1, 'Four haploid megaspores, of which typically only one survives to form the female gametophyte (embryo sac)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfd2ccb8-30bb-4c29-a9f4-79fad8d805e1', 'e28f4b18-8456-4bb8-a9e6-862d77ac817f', 2, 'A single diploid cell with no further division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8d7a301-566b-47d1-b30f-f6b677f95659', 'e28f4b18-8456-4bb8-a9e6-862d77ac817f', 3, 'Two identical diploid daughter cells');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e28f4b18-8456-4bb8-a9e6-862d77ac817f', '174aaccd-fe92-420c-9ffc-61b22c7007b5', 'Meiotic division of the diploid megaspore mother cell produces four haploid megaspores; in most angiosperms, three degenerate and only one functional megaspore survives to develop (through further mitotic divisions) into the mature embryo sac.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('844f247b-5a2a-4326-896a-e9f07150556c', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 103, 'Multiple alleles, as seen in the human ABO blood group system, refer to a situation where:', 'Biology', 'Principles of Inheritance and Variation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08fbe992-a314-42cb-9da3-8f2759e90903', '844f247b-5a2a-4326-896a-e9f07150556c', 0, 'A single gene has only two possible allelic forms in the population');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a9fdb9f-a544-442e-a8fe-9d048e17fe3c', '844f247b-5a2a-4326-896a-e9f07150556c', 1, 'A single gene locus has more than two allelic forms existing in the population (though any individual carries only two)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16a47983-5954-4acf-9ad6-dad28b5b2ff1', '844f247b-5a2a-4326-896a-e9f07150556c', 2, 'Multiple genes control the same trait independently');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b71ba1e-f151-40c5-bde8-ba5bb8678727', '844f247b-5a2a-4326-896a-e9f07150556c', 3, 'Alleles are inherited only from the mother');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('844f247b-5a2a-4326-896a-e9f07150556c', '6a9fdb9f-a544-442e-a8fe-9d048e17fe3c', 'Multiple allelism describes a gene locus (like the ABO locus, with IA, IB, and i alleles) having more than two allelic variants present across the population as a whole, even though any single diploid individual can carry at most two of these alleles.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5b248245-4e87-4197-a7da-b43cae2d5cfa', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 104, 'The Meselson and Stahl experiment, using nitrogen isotopes, provided direct experimental evidence that DNA replication is:', 'Biology', 'Molecular Basis of Inheritance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a75d6dc8-c5c8-4cf0-8450-36b9b71d9383', '5b248245-4e87-4197-a7da-b43cae2d5cfa', 0, 'Conservative, producing one fully old and one fully new DNA molecule');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5fa0814-cb39-47c2-b874-583effe8b20f', '5b248245-4e87-4197-a7da-b43cae2d5cfa', 1, 'Semi-conservative, with each daughter DNA molecule containing one old (parental) strand and one newly synthesized strand');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb6d3050-2740-4711-be1f-692c01f113c9', '5b248245-4e87-4197-a7da-b43cae2d5cfa', 2, 'Dispersive, with old and new DNA randomly mixed within each strand');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e926f2c-584a-447a-bd9c-382a600c7647', '5b248245-4e87-4197-a7da-b43cae2d5cfa', 3, 'Non-existent; DNA does not actually replicate');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5b248245-4e87-4197-a7da-b43cae2d5cfa', 'e5fa0814-cb39-47c2-b874-583effe8b20f', 'The Meselson-Stahl experiment tracked heavy (15N) and light (14N) DNA through generations of bacterial replication, confirming the semi-conservative model — each new DNA duplex retains one original parental strand paired with one newly synthesized strand.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c74ddfd9-c99e-49b2-8359-122fd898aee8', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 105, 'Industrial melanism in the peppered moth (Biston betularia), where dark-colored moths became more common in polluted, soot-darkened areas, is a well-documented example of:', 'Biology', 'Evolution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef9ce130-38f6-4cf5-b997-cfd3285c9e0a', 'c74ddfd9-c99e-49b2-8359-122fd898aee8', 0, 'Genetic drift with no selective advantage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3aba9a5-c16c-4a9b-a314-de393cb8c673', 'c74ddfd9-c99e-49b2-8359-122fd898aee8', 1, 'Natural selection acting on an existing heritable variation (moth color) in response to a changed environment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df351809-6678-4643-bc39-f34024068732', 'c74ddfd9-c99e-49b2-8359-122fd898aee8', 2, 'Artificial selection by breeders');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49ffc42e-ea73-4c23-a537-208e67b57c76', 'c74ddfd9-c99e-49b2-8359-122fd898aee8', 3, 'A case with no evolutionary significance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c74ddfd9-c99e-49b2-8359-122fd898aee8', 'd3aba9a5-c16c-4a9b-a314-de393cb8c673', 'The rise of the dark (melanic) form in polluted, soot-darkened habitats — where it was better camouflaged from predators than the light form — is a classic, well-documented case of natural selection acting on pre-existing color variation in response to environmental change.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1cd00c7c-204c-41de-9ad7-a47ca3b77656', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 106, 'Inbreeding depression, a risk associated with continued inbreeding in animal husbandry, refers to:', 'Biology', 'Strategies for Enhancement in Food Production');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c1dda38-7e60-49ff-a1df-ec622d35d27d', '1cd00c7c-204c-41de-9ad7-a47ca3b77656', 0, 'An increase in vigor and fertility over successive inbred generations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1a3a687-1617-43b6-9924-142bf1bc35f3', '1cd00c7c-204c-41de-9ad7-a47ca3b77656', 1, 'A reduction in fertility and productivity resulting from increased homozygosity of harmful recessive alleles over successive inbred generations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fea0d582-6aad-4e39-bdd5-b43e73b72e8b', '1cd00c7c-204c-41de-9ad7-a47ca3b77656', 2, 'A phenomenon that only affects plants, not animals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db323fa3-b1a8-49f4-841f-52d32b197a41', '1cd00c7c-204c-41de-9ad7-a47ca3b77656', 3, 'Complete sterility after a single generation of inbreeding');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1cd00c7c-204c-41de-9ad7-a47ca3b77656', 'c1a3a687-1617-43b6-9924-142bf1bc35f3', 'Continued inbreeding increases homozygosity, including at loci carrying deleterious recessive alleles, which can accumulate and reduce overall fitness, fertility, and productivity — inbreeding depression — requiring periodic outcrossing to counteract.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d9477192-7a5b-45bc-896d-228b1f3cf330', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 107, 'Penicillin, the first antibiotic discovered by Alexander Fleming, is naturally produced by a species of:', 'Biology', 'Microbes in Human Welfare');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b655893c-41bf-4cac-9309-df5f22175850', 'd9477192-7a5b-45bc-896d-228b1f3cf330', 0, 'Bacteria (Lactobacillus)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77b1d766-1c2d-4ad3-95f2-fe0cc215ca31', 'd9477192-7a5b-45bc-896d-228b1f3cf330', 1, 'Fungus (Penicillium notatum)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a669874-9d27-4291-a236-1755e9a7e01c', 'd9477192-7a5b-45bc-896d-228b1f3cf330', 2, 'Virus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f2e853e-e6dd-4959-812d-0ef5ea69b43a', 'd9477192-7a5b-45bc-896d-228b1f3cf330', 3, 'Protozoan');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d9477192-7a5b-45bc-896d-228b1f3cf330', '77b1d766-1c2d-4ad3-95f2-fe0cc215ca31', 'Penicillin is a secondary metabolite naturally produced by the fungus Penicillium notatum (and related species), discovered by Fleming when it inhibited bacterial growth on a contaminated culture plate.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7f692d9d-6797-49f5-92f3-ae41990e0584', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 108, 'Gel electrophoresis is a technique used to separate DNA fragments based primarily on their:', 'Biology', 'Biotechnology — Principles and Processes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc2e2f16-2dc5-4d35-84d3-359a09196985', '7f692d9d-6797-49f5-92f3-ae41990e0584', 0, 'Color');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6607e1b3-37db-4bba-939d-2f8df0418eb7', '7f692d9d-6797-49f5-92f3-ae41990e0584', 1, 'Size, since smaller fragments migrate faster through the gel matrix toward the positive electrode');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b8a783c-1d6e-425e-a6ee-f8c487fd6cdb', '7f692d9d-6797-49f5-92f3-ae41990e0584', 2, 'Nitrogenous base composition only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b5fe928-1ce7-4507-9776-67cbb0e35e44', '7f692d9d-6797-49f5-92f3-ae41990e0584', 3, 'Weight in grams, unrelated to size');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7f692d9d-6797-49f5-92f3-ae41990e0584', '6607e1b3-37db-4bba-939d-2f8df0418eb7', 'In gel electrophoresis, negatively charged DNA fragments migrate through a porous gel matrix toward the positive electrode when an electric field is applied; smaller fragments move faster and farther than larger ones, achieving size-based separation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b905b98b-2d47-480c-9e6c-46bf96a67613', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 109, 'Recombinant human insulin, marketed as Humulin, is produced using genetically engineered:', 'Biology', 'Biotechnology and Its Applications');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e6bee2f-f1f0-4ba3-b918-fd4ed7b6fcb5', 'b905b98b-2d47-480c-9e6c-46bf96a67613', 0, 'Human pancreatic cells extracted directly from donors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('203d82e2-3db2-48a3-a120-1770ecf44502', 'b905b98b-2d47-480c-9e6c-46bf96a67613', 1, 'Escherichia coli (or yeast) bacteria engineered to express the human insulin gene');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b852f7b9-94f6-4c3b-81ff-6fed033368cc', 'b905b98b-2d47-480c-9e6c-46bf96a67613', 2, 'Bovine (cow) pancreas tissue exclusively, unmodified');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0990eb19-5a84-44cc-a13d-04f1789d4bba', 'b905b98b-2d47-480c-9e6c-46bf96a67613', 3, 'Only chemical synthesis with no biological process involved');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b905b98b-2d47-480c-9e6c-46bf96a67613', '203d82e2-3db2-48a3-a120-1770ecf44502', 'Humulin was the first recombinant DNA-derived pharmaceutical, produced by inserting the human insulin gene into E. coli (or yeast), which then express and produce human insulin, avoiding the immunogenicity issues of older animal-derived insulin.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('367d5ca0-3459-4539-936d-56d00d415a61', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 110, 'In population growth models, ''carrying capacity'' (K) refers to:', 'Biology', 'Organisms and Populations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef220790-f992-4a8e-aa2f-be6999f3518c', '367d5ca0-3459-4539-936d-56d00d415a61', 0, 'The maximum possible growth rate of a population under ideal conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70cded45-8ef8-44eb-b423-bbb9d5fafce0', '367d5ca0-3459-4539-936d-56d00d415a61', 1, 'The maximum population size that a given environment can sustainably support given its resources');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89ca5856-185c-421c-b524-5ac6bba081d4', '367d5ca0-3459-4539-936d-56d00d415a61', 2, 'The minimum population size needed for survival');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1b632f6-9d2b-4a70-8822-a7d9c4cbd2a7', '367d5ca0-3459-4539-936d-56d00d415a61', 3, 'The rate at which individuals are born into a population');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('367d5ca0-3459-4539-936d-56d00d415a61', '70cded45-8ef8-44eb-b423-bbb9d5fafce0', 'Carrying capacity (K) represents the population size an environment can sustain indefinitely given available resources (food, space, etc.); the logistic growth model shows population growth slowing as it approaches K.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('182727c0-741e-4610-8451-9f8f235ce400', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 111, 'Decomposers, such as bacteria and fungi, play a critical ecological role by:', 'Biology', 'Ecosystem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f1d1e68-ff90-49cc-9c88-40907bab5ce8', '182727c0-741e-4610-8451-9f8f235ce400', 0, 'Producing organic matter from inorganic sources via photosynthesis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06db469b-5bb0-4a8e-8be6-de8fc66a044a', '182727c0-741e-4610-8451-9f8f235ce400', 1, 'Breaking down complex organic matter from dead organisms into simpler inorganic substances, releasing nutrients back into the ecosystem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('484c74c0-fba8-409a-89d0-be6f74dbe6d5', '182727c0-741e-4610-8451-9f8f235ce400', 2, 'Directly consuming living producers only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('936cc9a6-9a87-4be8-99e6-450888b259d6', '182727c0-741e-4610-8451-9f8f235ce400', 3, 'Having no role in nutrient cycling');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('182727c0-741e-4610-8451-9f8f235ce400', '06db469b-5bb0-4a8e-8be6-de8fc66a044a', 'Decomposers break down dead organic matter (detritus) into simpler inorganic compounds through decomposition, releasing essential nutrients back into the soil/environment for reuse by producers — a critical step in biogeochemical nutrient cycling.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('243107b6-701b-4c3a-a36e-01eb59a7ac2d', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 112, 'Alpha diversity refers to:', 'Biology', 'Biodiversity and Conservation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3ae2e58-9f7a-42b6-8969-37ce20ad7713', '243107b6-701b-4c3a-a36e-01eb59a7ac2d', 0, 'The number of species present within a particular community or habitat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f932d05-666e-4d39-acb8-ea3c74c895b7', '243107b6-701b-4c3a-a36e-01eb59a7ac2d', 1, 'The rate of species turnover between two different communities');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27763475-8fe8-4bbb-86b2-750e8ef6e6d9', '243107b6-701b-4c3a-a36e-01eb59a7ac2d', 2, 'The total number of ecosystems on Earth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9011c5e3-2fed-4308-a2f0-426a52ca70d4', '243107b6-701b-4c3a-a36e-01eb59a7ac2d', 3, 'Genetic diversity within a single species only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('243107b6-701b-4c3a-a36e-01eb59a7ac2d', 'a3ae2e58-9f7a-42b6-8969-37ce20ad7713', 'Alpha diversity measures species richness within a single community/habitat, distinct from beta diversity (species turnover between habitats) and gamma diversity (total diversity across a larger landscape/region).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('935456df-1259-4f7e-bb38-95df66116646', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 113, 'Eutrophication of a water body refers to:', 'Biology', 'Environmental Issues');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1014e75-f84c-4c42-836b-07e02631cc43', '935456df-1259-4f7e-bb38-95df66116646', 0, 'A decrease in nutrient levels leading to reduced algal growth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e9b591b-3ba3-45d4-8144-fa52a404429f', '935456df-1259-4f7e-bb38-95df66116646', 1, 'Excessive nutrient enrichment (often from agricultural runoff/sewage) causing dense algal blooms that eventually deplete dissolved oxygen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3b96059-2688-4bb5-b494-a371c28e1fdd', '935456df-1259-4f7e-bb38-95df66116646', 2, 'The natural purification of polluted water without any human intervention');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74757a0d-8499-49c4-86ca-a67c8063b2de', '935456df-1259-4f7e-bb38-95df66116646', 3, 'An increase in water clarity due to reduced nutrients');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('935456df-1259-4f7e-bb38-95df66116646', '9e9b591b-3ba3-45d4-8144-fa52a404429f', 'Eutrophication occurs when excess nutrients (especially nitrogen and phosphorus from fertilizer runoff or sewage) enter a water body, triggering algal blooms; when these algae die and decompose, the process consumes dissolved oxygen, often causing fish kills and ''dead zones''.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9ec3debe-f1da-46ae-a91f-dda5f8bcbe65', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 114, 'Coralloid roots, specialized structures found in cycads (a group of gymnosperms), house symbiotic:', 'Biology', 'Plant Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b175d02-8306-48f3-9efa-2466988e7971', '9ec3debe-f1da-46ae-a91f-dda5f8bcbe65', 0, 'Mycorrhizal fungi exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7dd25340-09db-4175-b28e-3e13a7f47efa', '9ec3debe-f1da-46ae-a91f-dda5f8bcbe65', 1, 'Nitrogen-fixing cyanobacteria');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2230aed0-8eff-4956-a981-63d072b6246b', '9ec3debe-f1da-46ae-a91f-dda5f8bcbe65', 2, 'Parasitic bacteria that harm the plant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('010aab69-4719-4b21-97b1-05a2cbfb0f06', '9ec3debe-f1da-46ae-a91f-dda5f8bcbe65', 3, 'Insect larvae');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9ec3debe-f1da-46ae-a91f-dda5f8bcbe65', '7dd25340-09db-4175-b28e-3e13a7f47efa', 'Coralloid roots in cycads form a mutualistic association with nitrogen-fixing cyanobacteria, helping the plant obtain fixed nitrogen from these symbiotic microorganisms.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ef1cf132-7a34-4dec-824c-f235cbe681fb', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 115, 'A ''species'' in taxonomy is generally defined as a group of organisms that:', 'Biology', 'The Living World');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da92e39c-90a8-48a6-a1cf-c9a06be636ed', 'ef1cf132-7a34-4dec-824c-f235cbe681fb', 0, 'Look identical to each other in every respect');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9921a0ff-f628-4337-ba42-fbb88b867b6d', 'ef1cf132-7a34-4dec-824c-f235cbe681fb', 1, 'Can actually or potentially interbreed to produce fertile offspring, and are reproductively isolated from other such groups');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('764418b9-6893-45f6-90d8-f825ff4f6a72', 'ef1cf132-7a34-4dec-824c-f235cbe681fb', 2, 'Belong to completely different genera');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09dc682d-75e1-48d3-af4a-827396588a68', 'ef1cf132-7a34-4dec-824c-f235cbe681fb', 3, 'Live only in the exact same geographic location');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ef1cf132-7a34-4dec-824c-f235cbe681fb', '9921a0ff-f628-4337-ba42-fbb88b867b6d', 'The biological species concept defines a species as a group of actually or potentially interbreeding natural populations that produce fertile offspring and are reproductively isolated from other such groups.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3bdfe21a-87dc-4c05-af7e-1d402a799b2d', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 116, 'The five-kingdom classification system proposed by R.H. Whittaker uses which criteria, among others, to classify organisms?', 'Biology', 'Biological Classification');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd01fe98-b365-4470-ad4e-86fc19e03a74', '3bdfe21a-87dc-4c05-af7e-1d402a799b2d', 0, 'Cell structure, mode of nutrition, body organization, and phylogenetic relationships');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4650c497-eb89-4b01-a1bc-875217abbe87', '3bdfe21a-87dc-4c05-af7e-1d402a799b2d', 1, 'Only the color of the organism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2773deb-fc7f-4b7f-8adb-f428f3782c31', '3bdfe21a-87dc-4c05-af7e-1d402a799b2d', 2, 'Only whether the organism can fly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44767913-85c0-4a31-8190-97fb49efa8be', '3bdfe21a-87dc-4c05-af7e-1d402a799b2d', 3, 'Only the geographic location where it is found');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3bdfe21a-87dc-4c05-af7e-1d402a799b2d', 'fd01fe98-b365-4470-ad4e-86fc19e03a74', 'Whittaker''s five-kingdom system (Monera, Protista, Fungi, Plantae, Animalia) classifies organisms using multiple criteria including cell structure (prokaryotic/eukaryotic), body organization, mode of nutrition, and phylogenetic relationships.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('315cbc01-ba0e-44c2-993d-581201d8b0ad', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 117, 'A flower that can be divided into two equal halves by only one vertical plane is described as having which type of symmetry?', 'Biology', 'Morphology of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee34c66e-e811-4b7c-9ee0-755ea99c62ce', '315cbc01-ba0e-44c2-993d-581201d8b0ad', 0, 'Actinomorphic (radial) symmetry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30b5b87a-f72b-48e4-94ae-39619ceefcf7', '315cbc01-ba0e-44c2-993d-581201d8b0ad', 1, 'Zygomorphic (bilateral) symmetry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a3b96f8-aa3a-4019-a435-268eba352b15', '315cbc01-ba0e-44c2-993d-581201d8b0ad', 2, 'Asymmetric, with no plane of division possible');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b73619b1-e4b8-405d-b802-ddba36d78dd3', '315cbc01-ba0e-44c2-993d-581201d8b0ad', 3, 'Both radial and bilateral simultaneously');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('315cbc01-ba0e-44c2-993d-581201d8b0ad', '30b5b87a-f72b-48e4-94ae-39619ceefcf7', 'A zygomorphic flower can be divided into two equal (mirror-image) halves along only one specific vertical plane (e.g., pea flower), unlike an actinomorphic flower, which can be divided equally along any vertical plane passing through the centre (e.g., mustard flower).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f52bfafb-ae07-4373-9c98-3556a99dc6b4', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 118, 'The apical meristem, located at the tips of roots and shoots, is responsible for:', 'Biology', 'Anatomy of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('339e4856-e7d4-4c96-b515-0c81004cef7b', 'f52bfafb-ae07-4373-9c98-3556a99dc6b4', 0, 'Secondary growth (increase in girth) only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb454d1c-3f1e-48f0-9ca7-12fecee46631', 'f52bfafb-ae07-4373-9c98-3556a99dc6b4', 1, 'Primary growth — the increase in the length of roots and shoots');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c892484-8fcf-4e59-81dc-04e4a5cc9ada', 'f52bfafb-ae07-4373-9c98-3556a99dc6b4', 2, 'Producing flowers directly with no other function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('200a076c-e06a-4d7d-a1b8-2f976c86c21c', 'f52bfafb-ae07-4373-9c98-3556a99dc6b4', 3, 'Storing food reserves exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f52bfafb-ae07-4373-9c98-3556a99dc6b4', 'bb454d1c-3f1e-48f0-9ca7-12fecee46631', 'Apical meristems at root and shoot tips are responsible for primary growth, increasing the length of the plant body through continuous cell division and subsequent differentiation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d1ad80f8-0eed-4318-9d02-ccb3a33b3f62', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 119, 'The Golgi apparatus (Golgi body) primarily functions in:', 'Biology', 'Cell — The Unit of Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('afbaeda8-f13c-4c44-ac7f-805aa374da82', 'd1ad80f8-0eed-4318-9d02-ccb3a33b3f62', 0, 'ATP synthesis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('102462e3-4553-4ec6-80cb-22057c83820a', 'd1ad80f8-0eed-4318-9d02-ccb3a33b3f62', 1, 'Modification, packaging, and sorting of proteins and lipids for secretion or delivery to other organelles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d199449-bf01-4b78-93d7-8c3948c84996', 'd1ad80f8-0eed-4318-9d02-ccb3a33b3f62', 2, 'DNA replication');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67ea692c-1acc-4094-9d9d-9d4094e40f25', 'd1ad80f8-0eed-4318-9d02-ccb3a33b3f62', 3, 'Photosynthesis in plant cells');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d1ad80f8-0eed-4318-9d02-ccb3a33b3f62', '102462e3-4553-4ec6-80cb-22057c83820a', 'The Golgi apparatus receives proteins/lipids from the endoplasmic reticulum, chemically modifies them (e.g., glycosylation), and packages them into vesicles for secretion or transport to their correct cellular destination.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('21399bf2-882e-4ab4-ace5-5184952e8fb1', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 120, 'The secondary structure of a protein, such as the alpha-helix, is primarily stabilized by:', 'Biology', 'Biomolecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9978256a-301d-41cc-b6f1-63eb90d1d033', '21399bf2-882e-4ab4-ace5-5184952e8fb1', 0, 'Peptide bonds between adjacent amino acids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('992345d7-cc31-4806-8661-6c0e28cd1eaf', '21399bf2-882e-4ab4-ace5-5184952e8fb1', 1, 'Hydrogen bonds between the backbone carbonyl and amide groups of the polypeptide chain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8f9aa1b-2d25-45df-a6c8-dcb2703783c8', '21399bf2-882e-4ab4-ace5-5184952e8fb1', 2, 'Disulfide bonds exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42a8034b-c6ef-4023-b2db-fa76d9e26b93', '21399bf2-882e-4ab4-ace5-5184952e8fb1', 3, 'Ionic bonds between side chains only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('21399bf2-882e-4ab4-ace5-5184952e8fb1', '992345d7-cc31-4806-8661-6c0e28cd1eaf', 'Secondary protein structures like the alpha-helix and beta-sheet are stabilized primarily by regular hydrogen bonding patterns between the backbone C=O and N-H groups of the polypeptide chain.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f4036bb9-783f-42e7-aadf-a8fdf631eccc', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 121, 'Cells that have permanently exited the cell cycle and will not divide again (e.g., most mature neurons) are said to be in which phase?', 'Biology', 'Cell Cycle and Cell Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06b2abfd-550c-40f9-a517-f64b3f91dd15', 'f4036bb9-783f-42e7-aadf-a8fdf631eccc', 0, 'S phase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82a8e36f-80eb-4df2-bd7b-9a2d5ccb3bd0', 'f4036bb9-783f-42e7-aadf-a8fdf631eccc', 1, 'G0 (quiescent) phase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e743b86-8262-42bb-9333-5af82f41f42d', 'f4036bb9-783f-42e7-aadf-a8fdf631eccc', 2, 'M phase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2fc75a3-4a42-4f68-bff7-4b2bdd39051e', 'f4036bb9-783f-42e7-aadf-a8fdf631eccc', 3, 'G2 phase');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f4036bb9-783f-42e7-aadf-a8fdf631eccc', '82a8e36f-80eb-4df2-bd7b-9a2d5ccb3bd0', 'G0 is a resting/quiescent state outside the active cell cycle; many highly differentiated cells (like mature neurons and cardiac muscle cells) permanently remain in G0 and do not re-enter the cycle to divide.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('67b49f3a-2269-4910-9099-4baf86c20610', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 122, 'The cyclic photophosphorylation pathway in photosynthesis, involving only Photosystem I, produces:', 'Biology', 'Photosynthesis in Higher Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b285214-1f84-486d-8104-5e5078d50748', '67b49f3a-2269-4910-9099-4baf86c20610', 0, 'Both ATP and NADPH in equal amounts');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb5811e3-3af6-43c4-afd4-71f77d5f8b28', '67b49f3a-2269-4910-9099-4baf86c20610', 1, 'Only ATP, with no NADPH production and no oxygen evolution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e20c82b1-bbcf-4f49-8c30-c3dc94d56266', '67b49f3a-2269-4910-9099-4baf86c20610', 2, 'Only NADPH, with no ATP');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('307157a6-6b26-4c33-9531-9717d8019ace', '67b49f3a-2269-4910-9099-4baf86c20610', 3, 'Only oxygen gas, with no ATP or NADPH');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('67b49f3a-2269-4910-9099-4baf86c20610', 'cb5811e3-3af6-43c4-afd4-71f77d5f8b28', 'In cyclic photophosphorylation, electrons cycle back to Photosystem I itself rather than being passed to NADP+, so only ATP is generated — no NADPH is produced and no water is split (hence no O2 released), unlike the standard non-cyclic pathway.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5d2fe4ee-9374-49bb-891c-b6a6fa158de1', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 123, 'The oxidative decarboxylation of pyruvate to acetyl-CoA, linking glycolysis to the Krebs cycle, occurs in the:', 'Biology', 'Respiration in Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95560d77-e265-4d67-9cfa-71f5eb5b1e49', '5d2fe4ee-9374-49bb-891c-b6a6fa158de1', 0, 'Cytoplasm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66f939ba-98b9-4d0f-9e94-4a304cea8890', '5d2fe4ee-9374-49bb-891c-b6a6fa158de1', 1, 'Mitochondrial matrix, catalyzed by the pyruvate dehydrogenase complex');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('270a42fb-3116-4cfc-a227-07c4a3bebe01', '5d2fe4ee-9374-49bb-891c-b6a6fa158de1', 2, 'Nucleus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c82272a5-20b7-4950-b37a-0f1249dedc15', '5d2fe4ee-9374-49bb-891c-b6a6fa158de1', 3, 'Chloroplast stroma');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5d2fe4ee-9374-49bb-891c-b6a6fa158de1', '66f939ba-98b9-4d0f-9e94-4a304cea8890', 'Pyruvate produced by cytoplasmic glycolysis is transported into the mitochondrial matrix, where the pyruvate dehydrogenase complex oxidizes and decarboxylates it into acetyl-CoA, linking glycolysis to the Krebs cycle.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('67335806-0ed1-41f2-bc7a-a48bafe33ea0', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 124, 'The phenomenon of apical dominance, in which the growing shoot tip inhibits the growth of lateral (axillary) buds, is primarily attributed to the hormone:', 'Biology', 'Plant Growth and Development');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('370b843e-1acb-41cd-bb6a-75b682ad698a', '67335806-0ed1-41f2-bc7a-a48bafe33ea0', 0, 'Gibberellin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ffc84d53-a7db-4870-b9d5-b14224c3ba69', '67335806-0ed1-41f2-bc7a-a48bafe33ea0', 1, 'Auxin, produced by the apical bud, suppressing lateral bud growth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7b02070-75a3-49bc-9254-47a27949ae87', '67335806-0ed1-41f2-bc7a-a48bafe33ea0', 2, 'Abscisic acid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c69ab03c-0800-4fd7-9eb7-548bce32d80f', '67335806-0ed1-41f2-bc7a-a48bafe33ea0', 3, 'Ethylene');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('67335806-0ed1-41f2-bc7a-a48bafe33ea0', 'ffc84d53-a7db-4870-b9d5-b14224c3ba69', 'Auxin produced by the actively growing apical (shoot tip) bud moves downward and suppresses the growth of lateral buds — removing the apical bud (e.g., by pruning/pinching) releases this inhibition, promoting bushier lateral growth.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('bbafc33a-4325-4c08-886e-ca8d8b90d630', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 125, 'Self-incompatibility, a genetic mechanism in some flowering plants, prevents:', 'Biology', 'Sexual Reproduction in Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9821df0a-06c6-4fd0-8d2c-40f1699fa2b3', 'bbafc33a-4325-4c08-886e-ca8d8b90d630', 0, 'Cross-pollination between genetically different plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06516ebe-bdaf-4c23-b741-d485d638aad6', 'bbafc33a-4325-4c08-886e-ca8d8b90d630', 1, 'Self-pollination from resulting in fertilization/seed set, even though viable pollen may land on the stigma');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8bb3a3b-df25-41bc-9dd1-7a9afb34d4c9', 'bbafc33a-4325-4c08-886e-ca8d8b90d630', 2, 'Any pollen germination whatsoever, from any source');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1c592bd-54dd-47b7-aa24-2a49635a1e03', 'bbafc33a-4325-4c08-886e-ca8d8b90d630', 3, 'Formation of any type of fruit');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bbafc33a-4325-4c08-886e-ca8d8b90d630', '06516ebe-bdaf-4c23-b741-d485d638aad6', 'Self-incompatibility is a genetic mechanism preventing self-pollen (or pollen from genetically similar plants) from developing normally on the stigma/style, blocking self-fertilization and promoting genetic diversity through obligate cross-pollination.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('01fb700c-c221-4ec7-8dad-434033b406fc', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 126, 'Linkage between two genes located close together on the same chromosome results in:', 'Biology', 'Principles of Inheritance and Variation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17529f47-2704-4b1a-9b46-3822cd38f60b', '01fb700c-c221-4ec7-8dad-434033b406fc', 0, 'Their alleles assorting completely independently, exactly as if on different chromosomes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15b1fc9b-b771-470b-accd-8185e91f542d', '01fb700c-c221-4ec7-8dad-434033b406fc', 1, 'Their alleles tending to be inherited together more often than expected by independent assortment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('56df797d-6b47-40b0-b0a3-279da09adaca', '01fb700c-c221-4ec7-8dad-434033b406fc', 2, 'Complete inability of any recombination between them');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('781a488d-905d-49c3-a08e-fe49ab2a556f', '01fb700c-c221-4ec7-8dad-434033b406fc', 3, 'Their alleles never separating under any circumstances, including crossing over');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('01fb700c-c221-4ec7-8dad-434033b406fc', '15b1fc9b-b771-470b-accd-8185e91f542d', 'Genes located close together on the same chromosome show linkage — their alleles are inherited together more frequently than predicted by independent assortment, though crossing over during meiosis can still occasionally recombine them (recombination frequency correlates with distance apart).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('db89e08e-c848-476a-bd43-068eb06781a9', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 127, 'The lac operon in E. coli, a classic model of gene regulation, is induced (switched on) in the presence of:', 'Biology', 'Molecular Basis of Inheritance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15b02e8f-2c22-4c2f-890b-f728c11536ed', 'db89e08e-c848-476a-bd43-068eb06781a9', 0, 'Glucose only, regardless of lactose availability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f596f42-08fc-4864-86e4-7f6e53f90c20', 'db89e08e-c848-476a-bd43-068eb06781a9', 1, 'Lactose (or an inducer derived from it), which inactivates the repressor protein bound to the operator');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1babcd70-0676-428d-8f55-b20040b4f707', 'db89e08e-c848-476a-bd43-068eb06781a9', 2, 'Complete absence of any sugar');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27d8b5c5-988b-4eae-9667-7e87140a7fe3', 'db89e08e-c848-476a-bd43-068eb06781a9', 3, 'Only in eukaryotic cells, not in bacteria');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('db89e08e-c848-476a-bd43-068eb06781a9', '1f596f42-08fc-4864-86e4-7f6e53f90c20', 'In the lac operon, lactose (via its metabolite allolactose) binds to and inactivates the lac repressor, releasing it from the operator and allowing RNA polymerase to transcribe the structural genes needed for lactose metabolism — a classic example of negative inducible gene regulation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('908cabf8-8f36-41b5-8e72-f94053cd6e31', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 128, 'Convergent evolution, where unrelated species independently evolve similar traits, is best illustrated by the similar streamlined body shape seen in:', 'Biology', 'Evolution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('105ed20c-5bb2-4342-b9bc-f983fb9cb6ec', '908cabf8-8f36-41b5-8e72-f94053cd6e31', 0, 'A dog and a wolf, which share a recent common ancestor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b74e7baf-b11b-4dea-8fee-15ad77e424b2', '908cabf8-8f36-41b5-8e72-f94053cd6e31', 1, 'Sharks (fish) and dolphins (mammals), both adapted to fast aquatic locomotion despite very different ancestries');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8955890f-d1c3-4b40-b47f-cd6ce1c59627', '908cabf8-8f36-41b5-8e72-f94053cd6e31', 2, 'Two subspecies of the same bird');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5ef9a83-1c43-467d-a118-9a45ba66dfb3', '908cabf8-8f36-41b5-8e72-f94053cd6e31', 3, 'Identical twins');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('908cabf8-8f36-41b5-8e72-f94053cd6e31', 'b74e7baf-b11b-4dea-8fee-15ad77e424b2', 'Sharks and dolphins are only distantly related (fish vs. mammal) but have independently evolved remarkably similar streamlined body shapes as an adaptation for efficient swimming — a hallmark example of convergent evolution driven by similar selective pressures, not common ancestry.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('15724a91-39c7-4bf7-b702-55501053125b', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 129, 'Pisciculture refers to the practice of:', 'Biology', 'Strategies for Enhancement in Food Production');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c83aa41-69d8-43ed-9e07-306e952378c2', '15724a91-39c7-4bf7-b702-55501053125b', 0, 'Rearing silkworms for silk production');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4fc26e1-cd65-4ab2-aa2c-2ae473fee421', '15724a91-39c7-4bf7-b702-55501053125b', 1, 'Farming/culturing fish, often in controlled ponds, for food production');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b9655b9-9028-404d-a0c1-4d0b681389bf', '15724a91-39c7-4bf7-b702-55501053125b', 2, 'Beekeeping for honey');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1840ea43-1cad-4ecc-b666-514770f0bec5', '15724a91-39c7-4bf7-b702-55501053125b', 3, 'Cultivating mushrooms');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('15724a91-39c7-4bf7-b702-55501053125b', 'e4fc26e1-cd65-4ab2-aa2c-2ae473fee421', 'Pisciculture is the controlled breeding, rearing, and farming of fish (and sometimes other aquatic organisms) for food, sport, or ornamental purposes.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('942374c3-7958-4861-91c4-4df85a0e0b4f', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 130, 'The fungus Saccharomyces cerevisiae (baker''s/brewer''s yeast) is industrially important primarily for its role in:', 'Biology', 'Microbes in Human Welfare');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('429668b0-c338-476b-9bec-d5cee55f5cc5', '942374c3-7958-4861-91c4-4df85a0e0b4f', 0, 'Antibiotic production only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91f5522a-25b0-46a2-a584-7af83e1323ad', '942374c3-7958-4861-91c4-4df85a0e0b4f', 1, 'Fermentation processes producing ethanol and CO2, used in baking and alcoholic beverage production');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3d70131-9320-4944-9894-ad742b302df1', '942374c3-7958-4861-91c4-4df85a0e0b4f', 2, 'Nitrogen fixation in soil');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74ef4860-67de-4e00-b974-07a829fce6d5', '942374c3-7958-4861-91c4-4df85a0e0b4f', 3, 'Causing plant diseases exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('942374c3-7958-4861-91c4-4df85a0e0b4f', '91f5522a-25b0-46a2-a584-7af83e1323ad', 'Saccharomyces cerevisiae ferments sugars into ethanol and carbon dioxide; the CO2 causes bread dough to rise (baking), while the ethanol is the basis of beer and wine production (brewing/winemaking).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('fca660ab-cecf-47ce-90a2-da1c3b87bad6', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 131, 'A bioreactor, used in the large-scale production of biotechnology products, primarily functions to:', 'Biology', 'Biotechnology — Principles and Processes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3c5362e-5cca-4d45-96ea-582952c02e83', 'fca660ab-cecf-47ce-90a2-da1c3b87bad6', 0, 'Isolate and sequence DNA fragments only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4bfc08f3-2d48-4c92-a9b5-ce6b9a4c2016', 'fca660ab-cecf-47ce-90a2-da1c3b87bad6', 1, 'Provide optimal, controlled conditions (nutrients, temperature, pH, oxygen, agitation) for large-scale growth of microorganisms/cells and product formation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f34cf61-39e8-4103-81a8-ea038f3587cb', 'fca660ab-cecf-47ce-90a2-da1c3b87bad6', 2, 'Only store finished chemical products');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9fe1d109-1e52-457f-afcc-85385797444a', 'fca660ab-cecf-47ce-90a2-da1c3b87bad6', 3, 'Cut DNA at specific restriction sites');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fca660ab-cecf-47ce-90a2-da1c3b87bad6', '4bfc08f3-2d48-4c92-a9b5-ce6b9a4c2016', 'Bioreactors provide a large-volume, tightly controlled environment (temperature, pH, aeration, nutrient supply) allowing microorganisms or cultured cells to grow and produce the desired biotechnological product (e.g., an enzyme, antibiotic, or recombinant protein) at industrial scale.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3ec8d741-3ded-4ad3-aa96-ed09e6dc752d', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 132, 'In population interactions, competition refers to a relationship in which:', 'Biology', 'Organisms and Populations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b971753-88a6-4646-91e4-5f1edf530936', '3ec8d741-3ded-4ad3-aa96-ed09e6dc752d', 0, 'Both interacting species benefit equally');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bea82111-72a1-4d7d-ba2a-c08376569eca', '3ec8d741-3ded-4ad3-aa96-ed09e6dc752d', 1, 'Two species that require the same limited resource are negatively affected by the presence of the other, since neither obtains as much of that resource');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9df121f5-aff5-4c4e-9199-365d3828ae14', '3ec8d741-3ded-4ad3-aa96-ed09e6dc752d', 2, 'One species always drives the other to complete extinction immediately');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4907a221-ba78-4b04-a686-01665239014b', '3ec8d741-3ded-4ad3-aa96-ed09e6dc752d', 3, 'Neither species is affected by the presence of the other');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3ec8d741-3ded-4ad3-aa96-ed09e6dc752d', 'bea82111-72a1-4d7d-ba2a-c08376569eca', 'Competition is a (-,-) interaction in which two species vying for the same limited resource (food, space, light) both experience reduced growth, survival, or reproduction as a result — distinct from interactions like predation or parasitism, which are asymmetric (+,-).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9113294e-abd7-4af9-9663-8809d3380f97', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 133, 'A food web, as opposed to a single food chain, better represents natural ecosystems because it depicts:', 'Biology', 'Ecosystem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51f7b18d-7c65-4e20-a971-3d4c746e9c98', '9113294e-abd7-4af9-9663-8809d3380f97', 0, 'A single, strictly linear sequence of feeding relationships');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('591d8982-cd8f-4d10-be7a-92843d875858', '9113294e-abd7-4af9-9663-8809d3380f97', 1, 'The interconnected network of multiple, overlapping food chains within a community, since most organisms feed on and are fed upon by more than one species');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0aade49f-ee34-437e-af9e-74c4efbb6043', '9113294e-abd7-4af9-9663-8809d3380f97', 2, 'Only the producers in an ecosystem, ignoring consumers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be9808a5-1e29-4147-98da-05e6fb64ddbc', '9113294e-abd7-4af9-9663-8809d3380f97', 3, 'A relationship that never actually occurs in real ecosystems');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9113294e-abd7-4af9-9663-8809d3380f97', '591d8982-cd8f-4d10-be7a-92843d875858', 'Real ecosystems rarely have simple, isolated linear food chains — instead, multiple food chains interconnect and overlap (since most organisms have multiple food sources and predators), forming a complex food web that more realistically models energy flow and species interdependence.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('02d4ae4a-dc72-468b-8e30-939239a9e929', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 134, 'Endemic species are those that are:', 'Biology', 'Biodiversity and Conservation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b196eae-97ad-496d-bc4b-69f792a08f0c', '02d4ae4a-dc72-468b-8e30-939239a9e929', 0, 'Found in every part of the world with no geographic restriction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('915f2f31-29c3-439f-8e22-ad2c441f3af5', '02d4ae4a-dc72-468b-8e30-939239a9e929', 1, 'Naturally found only in a particular, restricted geographic area and nowhere else');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc12c96f-fd86-4de9-a0f5-a694665d95b3', '02d4ae4a-dc72-468b-8e30-939239a9e929', 2, 'Always extinct in the wild');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('801a1d54-9147-4c7b-b99f-20e2bfdc8383', '02d4ae4a-dc72-468b-8e30-939239a9e929', 3, 'Only found in captivity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('02d4ae4a-dc72-468b-8e30-939239a9e929', '915f2f31-29c3-439f-8e22-ad2c441f3af5', 'Endemic species are native to and found exclusively within a specific, often geographically restricted, region — their limited range often makes them especially vulnerable to habitat loss and extinction.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3264e135-094b-423e-a1f2-1ef6af968948', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 135, 'Particulate matter (PM2.5), a major air pollutant of concern in urban areas, refers to particles with a diameter:', 'Biology', 'Environmental Issues');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9ef3bba-a912-4de3-ad29-7edcffbd34a9', '3264e135-094b-423e-a1f2-1ef6af968948', 0, 'Greater than 10 micrometres');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a577876-5622-4adf-b1a6-a596a1ec35d7', '3264e135-094b-423e-a1f2-1ef6af968948', 1, 'Less than or equal to 2.5 micrometres, small enough to penetrate deep into the lungs and even enter the bloodstream');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3761eaa1-1a78-48c8-bc60-1727288586a8', '3264e135-094b-423e-a1f2-1ef6af968948', 2, 'Exactly 2.5 millimetres');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19ebc5ae-d732-49cb-ab2b-6c9076df07db', '3264e135-094b-423e-a1f2-1ef6af968948', 3, 'Only visible to the naked eye');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3264e135-094b-423e-a1f2-1ef6af968948', '3a577876-5622-4adf-b1a6-a596a1ec35d7', 'PM2.5 refers to fine particulate matter with a diameter of 2.5 micrometres or smaller — small enough to bypass upper respiratory defenses, penetrate deep into lung alveoli, and even cross into the bloodstream, making it a significant health hazard.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f86482a0-9e60-4587-beaa-d9fcac4b1850', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 136, 'Phylum Platyhelminthes (flatworms) are characterized by a body plan that is:', 'Biology', 'Animal Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d73348b4-bda3-4e61-8ca8-0acdf50aecca', 'f86482a0-9e60-4587-beaa-d9fcac4b1850', 0, 'Triploblastic, acoelomate, and dorsoventrally flattened');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a48df8de-1911-4f30-9d99-51774cf8ea25', 'f86482a0-9e60-4587-beaa-d9fcac4b1850', 1, 'Diploblastic with true coelom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7dbabdd5-e103-4d29-bf55-405f6a5b30a2', 'f86482a0-9e60-4587-beaa-d9fcac4b1850', 2, 'Radially symmetrical with no organ systems');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d635ffe-65a7-42fb-9dda-6b2842a0cea4', 'f86482a0-9e60-4587-beaa-d9fcac4b1850', 3, 'Segmented, with a true coelom, like annelids');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f86482a0-9e60-4587-beaa-d9fcac4b1850', 'd73348b4-bda3-4e61-8ca8-0acdf50aecca', 'Flatworms (e.g., Planaria, tapeworms) are triploblastic (three germ layers) but acoelomate (no true body cavity between the gut and body wall), with a characteristic flattened, unsegmented body.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1d54d888-9b97-4c1d-8f86-edd72217c501', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 137, 'Class Aves (birds), a group within Phylum Chordata, is characterized by:', 'Biology', 'Animal Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1adde445-1d55-4fcc-bad3-3470fa18d60e', '1d54d888-9b97-4c1d-8f86-edd72217c501', 0, 'Cold-blooded metabolism and scaly skin with no feathers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('adb3ee6c-7178-47fb-8be3-95887db8e991', '1d54d888-9b97-4c1d-8f86-edd72217c501', 1, 'Warm-bloodedness, feathers, and forelimbs typically modified into wings');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('505412ee-3614-45fa-a1a1-41632099545a', '1d54d888-9b97-4c1d-8f86-edd72217c501', 2, 'Exclusively aquatic respiration via gills');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a74a7845-6521-4b04-8c95-4d443d048c10', '1d54d888-9b97-4c1d-8f86-edd72217c501', 3, 'A three-chambered heart, same as reptiles');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1d54d888-9b97-4c1d-8f86-edd72217c501', 'adb3ee6c-7178-47fb-8be3-95887db8e991', 'Birds are endothermic (warm-blooded), covered in feathers, typically have forelimbs modified into wings, and possess a fully divided four-chambered heart, distinguishing them from ectothermic reptiles.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7e6c8e40-7483-47af-846a-4c392443303f', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 138, 'Areolar connective tissue, found beneath the skin, primarily functions to:', 'Biology', 'Structural Organisation in Animals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc162f15-cce7-4f80-85eb-b45c18c3bb30', '7e6c8e40-7483-47af-846a-4c392443303f', 0, 'Provide the main structural rigidity of bones');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9244b823-aa6e-4942-8ddf-ca108104454a', '7e6c8e40-7483-47af-846a-4c392443303f', 1, 'Fill spaces inside organs, support internal organs, and attach the skin to underlying muscles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea833664-e262-425b-af7c-5ebef7ac9018', '7e6c8e40-7483-47af-846a-4c392443303f', 2, 'Transmit nerve impulses');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('367fb53c-2e5c-4948-9c86-94de968a604c', '7e6c8e40-7483-47af-846a-4c392443303f', 3, 'Contract to produce movement');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7e6c8e40-7483-47af-846a-4c392443303f', '9244b823-aa6e-4942-8ddf-ca108104454a', 'Areolar tissue is a loose connective tissue that fills spaces between organs, provides a supportive matrix, and attaches skin to underlying tissues, while allowing some flexibility.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('80ff92a3-da13-45a1-b523-06f4a4a57c70', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 139, 'The partial pressure of oxygen (pO2) is highest in which of the following, under normal physiological conditions?', 'Biology', 'Breathing and Exchange of Gases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bd58bb0-04e6-457c-9cb8-a7a0b8088cc6', '80ff92a3-da13-45a1-b523-06f4a4a57c70', 0, 'Deoxygenated venous blood returning to the heart');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c18ba6a-8d90-49fd-bd68-4f74e945f590', '80ff92a3-da13-45a1-b523-06f4a4a57c70', 1, 'Alveolar air in the lungs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4487dcc4-eb60-4045-bd24-ffedc52df4c3', '80ff92a3-da13-45a1-b523-06f4a4a57c70', 2, 'Tissue cells actively respiring');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0fd6d578-979c-4c39-91d9-eacf80560fd0', '80ff92a3-da13-45a1-b523-06f4a4a57c70', 3, 'Deep muscle tissue during intense exercise');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('80ff92a3-da13-45a1-b523-06f4a4a57c70', '7c18ba6a-8d90-49fd-bd68-4f74e945f590', 'Alveolar air has the highest pO2 in the respiratory/circulatory pathway, driving the diffusion gradient that oxygenates blood in the pulmonary capillaries before it is distributed to tissues, where pO2 progressively decreases as oxygen is consumed.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ca46c04d-7784-43b2-a232-d95e1bbb0aba', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 140, 'The pulmonary circulation carries deoxygenated blood from the heart to the lungs via the:', 'Biology', 'Body Fluids and Circulation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5fe8ea85-5387-4fae-9ded-c8f389b55cd6', 'ca46c04d-7784-43b2-a232-d95e1bbb0aba', 0, 'Aorta');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1c51014-de45-4266-b5f6-8d193efc7ef3', 'ca46c04d-7784-43b2-a232-d95e1bbb0aba', 1, 'Pulmonary artery');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16003be6-2d11-44cc-8a64-ad651e3b7cdb', 'ca46c04d-7784-43b2-a232-d95e1bbb0aba', 2, 'Pulmonary vein');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1bed4a8d-886b-4c92-b1b1-8ea2ab009070', 'ca46c04d-7784-43b2-a232-d95e1bbb0aba', 3, 'Vena cava');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ca46c04d-7784-43b2-a232-d95e1bbb0aba', 'c1c51014-de45-4266-b5f6-8d193efc7ef3', 'The pulmonary artery carries deoxygenated blood from the right ventricle to the lungs for oxygenation — notably, this is an exception to the general rule that arteries carry oxygenated blood, since ''artery'' simply denotes vessels carrying blood away from the heart.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7d1dc68e-ddf5-4960-83bf-e20d5e86e267', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 141, 'Uricotelic organisms, which excrete nitrogenous waste mainly as uric acid, include:', 'Biology', 'Excretory Products and Their Elimination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1044fd67-d7e0-481d-a7ea-fa24f8ec00c0', '7d1dc68e-ddf5-4960-83bf-e20d5e86e267', 0, 'Bony fish');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7b62cef-50c0-43a1-be69-2f58082cd950', '7d1dc68e-ddf5-4960-83bf-e20d5e86e267', 1, 'Birds and reptiles, an adaptation conserving water since uric acid is insoluble and can be excreted as a semi-solid paste');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c6ab380-ea9a-4bd2-ac67-03ffd9434c0e', '7d1dc68e-ddf5-4960-83bf-e20d5e86e267', 2, 'Aquatic amphibians only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfe25788-d5ed-46b1-9c0f-535fb8b435a5', '7d1dc68e-ddf5-4960-83bf-e20d5e86e267', 3, 'Only mammals');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7d1dc68e-ddf5-4960-83bf-e20d5e86e267', 'f7b62cef-50c0-43a1-be69-2f58082cd950', 'Birds and reptiles excrete uric acid, which is largely insoluble in water and can be excreted as a semi-solid paste with minimal water loss — an important water-conservation adaptation, especially relevant for egg-laying species and desert-dwelling reptiles.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b6b159dd-9c74-4761-b0b2-f44767bf6bfb', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 142, 'The human vertebral column normally consists of how many vertebrae?', 'Biology', 'Locomotion and Movement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('392b89f4-e19f-4915-9c77-47d7e51bc4a3', 'b6b159dd-9c74-4761-b0b2-f44767bf6bfb', 0, '24');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('842c9c3d-b383-4f8e-809a-bbb5b05d93e7', 'b6b159dd-9c74-4761-b0b2-f44767bf6bfb', 1, '26');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab14d537-39c5-4198-bd10-8d6459d95fe6', 'b6b159dd-9c74-4761-b0b2-f44767bf6bfb', 2, '33 (fused in the adult to a functional 26)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('857f5e08-10c3-48c5-8d35-94ae6d512b8a', 'b6b159dd-9c74-4761-b0b2-f44767bf6bfb', 3, '12');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b6b159dd-9c74-4761-b0b2-f44767bf6bfb', 'ab14d537-39c5-4198-bd10-8d6459d95fe6', 'The vertebral column has 33 vertebrae during development (7 cervical, 12 thoracic, 5 lumbar, 5 sacral, 4 coccygeal), but the sacral and coccygeal vertebrae fuse in adults into the sacrum and coccyx, giving a functional count of 26 separate bones.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4f85f23a-46c9-4234-8469-130077343246', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 143, 'The autonomic nervous system, which regulates involuntary functions, is divided into two main divisions:', 'Biology', 'Neural Control and Coordination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af2dff91-25c4-4725-ad05-ae15c9d6da12', '4f85f23a-46c9-4234-8469-130077343246', 0, 'Central and peripheral');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('693daed0-1df1-4e6d-b977-d47ed214e034', '4f85f23a-46c9-4234-8469-130077343246', 1, 'Sympathetic and parasympathetic, which generally have opposing (antagonistic) effects on target organs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c65f1b00-9611-43a3-ae0b-92304c114b7a', '4f85f23a-46c9-4234-8469-130077343246', 2, 'Sensory and motor only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ecc0fb83-1a0b-4360-a813-a3f964f2b284', '4f85f23a-46c9-4234-8469-130077343246', 3, 'Cranial and spinal only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4f85f23a-46c9-4234-8469-130077343246', '693daed0-1df1-4e6d-b977-d47ed214e034', 'The autonomic nervous system consists of the sympathetic division (generally ''fight or flight'', increasing heart rate etc.) and the parasympathetic division (generally ''rest and digest'', decreasing heart rate etc.), which typically act antagonistically on the same target organs.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('20603909-8ac6-42de-90b0-3d39f86f25f1', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 144, 'Parathyroid hormone (PTH), secreted by the parathyroid glands, functions to:', 'Biology', 'Chemical Coordination and Integration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2b15f68-b1f7-44ff-90e5-0108a9044cee', '20603909-8ac6-42de-90b0-3d39f86f25f1', 0, 'Decrease blood calcium levels');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b0672ae-9113-4caf-b09c-75a1098c8f50', '20603909-8ac6-42de-90b0-3d39f86f25f1', 1, 'Increase blood calcium levels by promoting bone resorption, renal reabsorption of calcium, and activation of vitamin D');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1c840fe-f2a9-48de-bc9f-24cb2eb4427d', '20603909-8ac6-42de-90b0-3d39f86f25f1', 2, 'Regulate blood glucose exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c87f546-1a7c-4ff5-9870-c9ea1aefbd20', '20603909-8ac6-42de-90b0-3d39f86f25f1', 3, 'Control heart rate directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('20603909-8ac6-42de-90b0-3d39f86f25f1', '8b0672ae-9113-4caf-b09c-75a1098c8f50', 'PTH raises blood calcium levels through multiple mechanisms: stimulating osteoclast-mediated bone resorption, increasing renal calcium reabsorption, and promoting activation of vitamin D (which enhances intestinal calcium absorption) — the opposite effect to calcitonin.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5de26dcc-44ae-409f-9a54-78f154ea7f3e', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 145, 'The vas deferens (ductus deferens) functions to transport mature sperm from the:', 'Biology', 'Human Reproduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f450e2c-06a8-45fd-b088-55ed6d7a63b4', '5de26dcc-44ae-409f-9a54-78f154ea7f3e', 0, 'Testis directly to the urethra, bypassing the epididymis entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0c1d479-c6ed-4df1-a6fc-41829eabaf5a', '5de26dcc-44ae-409f-9a54-78f154ea7f3e', 1, 'Epididymis toward the urethra, during ejaculation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f105cafc-bd70-4e03-badd-a3f44320ccda', '5de26dcc-44ae-409f-9a54-78f154ea7f3e', 2, 'Seminal vesicle to the prostate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a8a0ea3-bc64-4995-a602-f3f7154872c4', '5de26dcc-44ae-409f-9a54-78f154ea7f3e', 3, 'Urinary bladder to the testis');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5de26dcc-44ae-409f-9a54-78f154ea7f3e', 'b0c1d479-c6ed-4df1-a6fc-41829eabaf5a', 'Sperm mature and are stored in the epididymis, and during ejaculation are propelled through the vas deferens toward the ejaculatory duct and urethra, mixing with secretions from the seminal vesicles and prostate along the way.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2a3bf045-68a9-49d9-b3e2-0e76a3cae0b0', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 146, 'The menstrual cycle phase during which the endometrium is shed, resulting in menstrual bleeding, occurs due to:', 'Biology', 'Human Reproduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3a4a758-b3a7-4ac2-a1c4-b1b410f938c5', '2a3bf045-68a9-49d9-b3e2-0e76a3cae0b0', 0, 'A sharp rise in progesterone and estrogen levels');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e442850e-bd5c-4347-a918-e423813cd3d8', '2a3bf045-68a9-49d9-b3e2-0e76a3cae0b0', 1, 'A sharp decline in progesterone (and estrogen) levels following degeneration of the corpus luteum, in the absence of fertilization/implantation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b25a79f-2ca7-4647-9d17-032cfb5804f6', '2a3bf045-68a9-49d9-b3e2-0e76a3cae0b0', 2, 'A sudden surge in LH');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd77dfd3-b104-48f2-9d7a-85475ef684b1', '2a3bf045-68a9-49d9-b3e2-0e76a3cae0b0', 3, 'Fertilization of the egg');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2a3bf045-68a9-49d9-b3e2-0e76a3cae0b0', 'e442850e-bd5c-4347-a918-e423813cd3d8', 'If fertilization/implantation does not occur, the corpus luteum degenerates, causing progesterone and estrogen levels to fall sharply; this withdrawal of hormonal support for the endometrium triggers its breakdown and shedding as menstrual flow.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b2d9bec7-58fd-41ae-8fee-58dd9f18655d', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 147, 'Tubectomy and vasectomy are surgical sterilization methods of contraception performed, respectively, on:', 'Biology', 'Reproductive Health');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24ce59b8-f6a6-4502-a456-4c00c2b9655f', 'b2d9bec7-58fd-41ae-8fee-58dd9f18655d', 0, 'Only males, for both procedures');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9067e964-f381-4396-a1da-8daa20cd4e54', 'b2d9bec7-58fd-41ae-8fee-58dd9f18655d', 1, 'Females (tubectomy, blocking the fallopian tubes) and males (vasectomy, blocking the vas deferens)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf1625e8-9494-45c7-8612-8af318d08118', 'b2d9bec7-58fd-41ae-8fee-58dd9f18655d', 2, 'Only females, for both procedures');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('912232b0-c153-4585-bd23-d450e762005f', 'b2d9bec7-58fd-41ae-8fee-58dd9f18655d', 3, 'Neither is a surgical procedure; both are hormonal methods');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b2d9bec7-58fd-41ae-8fee-58dd9f18655d', '9067e964-f381-4396-a1da-8daa20cd4e54', 'Tubectomy involves surgically cutting/blocking the fallopian tubes in females to prevent the egg from meeting sperm, while vasectomy involves cutting/blocking the vas deferens in males to prevent sperm from being included in the ejaculate — both are permanent surgical sterilization methods.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d87056be-9491-4529-87d0-46ed282d04df', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 148, 'Vaccination works by inducing the immune system to develop:', 'Biology', 'Human Health and Disease');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39ce6b2f-4476-41e6-9c91-5b9af5566c03', 'd87056be-9491-4529-87d0-46ed282d04df', 0, 'Only a temporary, passive protection lasting a few hours');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('017ce5c0-1e8b-45ee-951e-8c11f74b4be8', 'd87056be-9491-4529-87d0-46ed282d04df', 1, 'Active immunity via the production of memory cells and antibodies specific to an antigen (often a weakened/inactivated pathogen), without causing full-blown disease');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7fb88e0-5ce6-4b85-84d0-baab036c29f1', 'd87056be-9491-4529-87d0-46ed282d04df', 2, 'Complete and permanent destruction of the immune system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24d5c178-581a-46c3-9b9a-217261040be0', 'd87056be-9491-4529-87d0-46ed282d04df', 3, 'No lasting immune memory at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d87056be-9491-4529-87d0-46ed282d04df', '017ce5c0-1e8b-45ee-951e-8c11f74b4be8', 'Vaccines expose the immune system to a harmless form of an antigen (weakened, killed, or a fragment of the pathogen), triggering active immunity — production of specific antibodies and, critically, memory cells that provide rapid, robust protection upon future exposure to the actual pathogen.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('edc1c53e-9fd2-476e-8a56-3d4770ec0575', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 149, 'Elephantiasis (filariasis), a chronic disease affecting the lymphatic system, is caused by infection with a parasitic:', 'Biology', 'Human Health and Disease');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91b70958-7fa9-4a70-bf3c-8b9d09a5394a', 'edc1c53e-9fd2-476e-8a56-3d4770ec0575', 0, 'Bacterium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2a2ef9a-e0ff-4ba2-bb2c-ca41e361ce1d', 'edc1c53e-9fd2-476e-8a56-3d4770ec0575', 1, 'Nematode worm (e.g., Wuchereria bancrofti), transmitted by mosquito bites');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('660bc4e4-741f-4fe1-b7da-c7b90cd2cc1d', 'edc1c53e-9fd2-476e-8a56-3d4770ec0575', 2, 'Fungus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce9ef5b1-504f-4930-a766-c61e52e8b2d9', 'edc1c53e-9fd2-476e-8a56-3d4770ec0575', 3, 'Virus');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('edc1c53e-9fd2-476e-8a56-3d4770ec0575', 'a2a2ef9a-e0ff-4ba2-bb2c-ca41e361ce1d', 'Filariasis is caused by thread-like filarial nematode worms (e.g., Wuchereria bancrofti) transmitted through the bite of infected mosquitoes, causing chronic inflammation and blockage of lymphatic vessels leading to characteristic swelling.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('87704807-8735-4321-863b-e573a40c2095', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 150, 'In organisms exhibiting external fertilization (e.g., many aquatic species like fish and frogs), fertilization occurs:', 'Biology', 'Reproduction in Organisms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('167d8255-86c5-40ff-9ba1-4ef1308a038c', '87704807-8735-4321-863b-e573a40c2095', 0, 'Inside the female''s body');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b75a948-1dd1-4cd6-bbb3-0db8749d08f8', '87704807-8735-4321-863b-e573a40c2095', 1, 'Outside the body of the organism, typically in the surrounding water medium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b35495a-cfc4-4231-9512-be9b0567dfe4', '87704807-8735-4321-863b-e573a40c2095', 2, 'Only in a specialized internal organ');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84709c62-4197-4604-bd23-973894ae1032', '87704807-8735-4321-863b-e573a40c2095', 3, 'Never actually results in offspring');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('87704807-8735-4321-863b-e573a40c2095', '9b75a948-1dd1-4cd6-bbb3-0db8749d08f8', 'External fertilization occurs when gametes (eggs and sperm) are released by parent organisms into the external environment (usually water), where fertilization takes place outside the body — common in many fish and amphibians, and typically producing large numbers of gametes to compensate for lower fertilization success.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('99ff7df3-6b99-486b-ae45-640fb0ffa557', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 151, 'Down syndrome in humans is caused by:', 'Biology', 'Genetics and Evolution — Human Genetics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ded17f96-c45d-42de-8b00-25cdc19ae582', '99ff7df3-6b99-486b-ae45-640fb0ffa557', 0, 'A single gene point mutation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10c16ab4-9f71-4bc0-9a78-345d9c08ca9e', '99ff7df3-6b99-486b-ae45-640fb0ffa557', 1, 'Trisomy of chromosome 21 (an extra copy, giving three copies instead of the normal two)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fff6add5-599b-432f-a46b-186d785a3738', '99ff7df3-6b99-486b-ae45-640fb0ffa557', 2, 'Complete absence of an entire chromosome');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebb49b0c-ebae-4a5f-9052-83d0cea5b8f2', '99ff7df3-6b99-486b-ae45-640fb0ffa557', 3, 'A translocation between the X and Y chromosomes exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('99ff7df3-6b99-486b-ae45-640fb0ffa557', '10c16ab4-9f71-4bc0-9a78-345d9c08ca9e', 'Down syndrome results from trisomy 21 — the presence of an extra (third) copy of chromosome 21, usually arising from non-disjunction during meiosis, and is associated with characteristic developmental and physical features.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5143b5db-9128-47df-a95d-de8fadd1a805', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 152, 'Sickle-cell anemia, unlike colour blindness and haemophilia, is inherited as an:', 'Biology', 'Genetics and Evolution — Sex-linked Disorders');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4809c01-24a5-4f80-95d5-f5b276ea8e20', '5143b5db-9128-47df-a95d-de8fadd1a805', 0, 'X-linked recessive disorder');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e847b487-e3ca-4d3c-9534-2d9ee24267a1', '5143b5db-9128-47df-a95d-de8fadd1a805', 1, 'Autosomal recessive disorder, caused by a point mutation in the beta-globin gene');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed542668-c358-4943-9cd7-2f870448432a', '5143b5db-9128-47df-a95d-de8fadd1a805', 2, 'Y-linked disorder');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2166b124-9347-412e-8437-c45d8753985c', '5143b5db-9128-47df-a95d-de8fadd1a805', 3, 'Mitochondrial (maternally inherited only) disorder');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5143b5db-9128-47df-a95d-de8fadd1a805', 'e847b487-e3ca-4d3c-9534-2d9ee24267a1', 'Sickle-cell anemia results from a point mutation in the autosomal beta-globin gene (on chromosome 11) and follows autosomal recessive inheritance, distinguishing it from the X-linked recessive pattern of colour blindness and haemophilia.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('228157b5-b771-4db0-82e5-b5707e6c7a22', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 153, 'Homo sapiens, the modern human species, is generally believed by the ''Out of Africa'' model to have originated:', 'Biology', 'Evolution — Human Evolution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6dae9430-fe4e-46e7-80d9-e9508f24333d', '228157b5-b771-4db0-82e5-b5707e6c7a22', 0, 'Simultaneously and independently across multiple continents');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40808626-9a54-462d-b7b0-952dc6629337', '228157b5-b771-4db0-82e5-b5707e6c7a22', 1, 'In Africa, subsequently migrating to other parts of the world and replacing earlier hominid populations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('271f05a5-01f5-4bfb-9f26-488f5294acb5', '228157b5-b771-4db0-82e5-b5707e6c7a22', 2, 'Only in Asia, with no African origin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa093c65-cf57-47a7-83dc-fddbf2585334', '228157b5-b771-4db0-82e5-b5707e6c7a22', 3, 'From modern great apes directly, within the last few hundred years');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('228157b5-b771-4db0-82e5-b5707e6c7a22', '40808626-9a54-462d-b7b0-952dc6629337', 'The widely supported ''Out of Africa'' (recent African origin) model proposes that anatomically modern Homo sapiens evolved in Africa roughly 200,000-300,000 years ago and later dispersed to populate the rest of the world.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('89f87aa6-d48b-4764-ac94-536100734e34', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 154, 'Bt toxin genes used in genetically modified crops confer resistance specifically to:', 'Biology', 'Biotechnology and Its Applications — GM Crops');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24a03a34-cb43-4cc7-9759-f5b8fe54f509', '89f87aa6-d48b-4764-ac94-536100734e34', 0, 'Fungal infections');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e59a268-78f5-445b-ae6b-a76961fcb734', '89f87aa6-d48b-4764-ac94-536100734e34', 1, 'Certain insect pests, since the Cry protein is toxic to specific insect larvae upon ingestion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a29f79ee-b80d-4bb6-92ce-846a554380aa', '89f87aa6-d48b-4764-ac94-536100734e34', 2, 'Viral infections');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96b378ff-d177-4ce9-9f7c-dfab48f7d9bd', '89f87aa6-d48b-4764-ac94-536100734e34', 3, 'Drought conditions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('89f87aa6-d48b-4764-ac94-536100734e34', '3e59a268-78f5-445b-ae6b-a76961fcb734', 'Bt (Bacillus thuringiensis) Cry toxin genes, when expressed in a GM crop, produce a protein that is specifically toxic when ingested by certain insect larvae (its gut environment activates the toxin), providing built-in pest resistance without broadly toxic chemical insecticides.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('56ee1813-ec32-4a92-9282-67cf1540fdf0', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 155, 'Predation, as an ecological interaction, benefits the predator while:', 'Biology', 'Organisms and Populations — Interactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fdf0c64b-a1fa-4851-9816-bfae0e373106', '56ee1813-ec32-4a92-9282-67cf1540fdf0', 0, 'Also benefiting the prey species equally');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b89dca46-2e7b-4c44-a473-d993dc123a60', '56ee1813-ec32-4a92-9282-67cf1540fdf0', 1, 'Harming (typically killing) the prey individual, though at the population level predation can help regulate prey population size and maintain diversity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8fac8662-217d-4e1c-b010-164c1cc53519', '56ee1813-ec32-4a92-9282-67cf1540fdf0', 2, 'Having absolutely no ecological significance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51876fcd-e1c5-4caa-bba3-1a961bdd24d3', '56ee1813-ec32-4a92-9282-67cf1540fdf0', 3, 'Occurring only between members of the same species');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('56ee1813-ec32-4a92-9282-67cf1540fdf0', 'b89dca46-2e7b-4c44-a473-d993dc123a60', 'Predation directly harms (usually kills) the individual prey organism, an asymmetric (+,-) interaction; at the population/community level, however, predators can play an important regulatory role, controlling prey population size and even promoting overall species diversity (e.g., keystone predator effects).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a36ea784-3780-4e97-923a-e8ee447b1e47', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 156, 'Gross Primary Productivity (GPP) of an ecosystem refers to:', 'Biology', 'Ecosystem — Productivity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c1444ef-153a-4327-ac15-8d6069e2032b', 'a36ea784-3780-4e97-923a-e8ee447b1e47', 0, 'The rate of energy loss through respiration by producers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7afa039-dd6a-46cb-82b5-49c8aa579621', 'a36ea784-3780-4e97-923a-e8ee447b1e47', 1, 'The total rate of organic matter/biomass production by producers via photosynthesis, before subtracting respiratory losses');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a9deb47-30d8-4b9f-a869-ea8edfec4b1d', 'a36ea784-3780-4e97-923a-e8ee447b1e47', 2, 'Only the productivity of consumers, not producers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4d9f5f7-19c0-495e-9b3f-4c2bfe9f645c', 'a36ea784-3780-4e97-923a-e8ee447b1e47', 3, 'The productivity remaining after all trophic levels have fed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a36ea784-3780-4e97-923a-e8ee447b1e47', 'a7afa039-dd6a-46cb-82b5-49c8aa579621', 'GPP is the total amount of organic matter (biomass/energy) produced by primary producers through photosynthesis; Net Primary Productivity (NPP) is GPP minus the energy producers use for their own respiration — a key distinction in ecosystem energetics.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4e7d5a81-29f6-4826-8a3a-48df8f7a0d75', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 157, 'A biosphere reserve typically consists of which characteristic zonation?', 'Biology', 'Biodiversity and Conservation — Biosphere Reserves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa0b1b61-7984-4760-af11-0aeb54dc9303', '4e7d5a81-29f6-4826-8a3a-48df8f7a0d75', 0, 'A single uniform zone with identical rules throughout');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebb5442b-71b1-41b5-9076-0eacbffe8ecf', '4e7d5a81-29f6-4826-8a3a-48df8f7a0d75', 1, 'A core zone (strictly protected), a buffer zone (limited human activity), and a transition zone (sustainable use permitted)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30202eec-4300-4f3a-91fc-f76d7a76a8fc', '4e7d5a81-29f6-4826-8a3a-48df8f7a0d75', 2, 'Only urban areas with no natural habitat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6fa087fe-e9df-4874-8756-6220373d1852', '4e7d5a81-29f6-4826-8a3a-48df8f7a0d75', 3, 'Zones defined purely by administrative boundaries with no ecological basis');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4e7d5a81-29f6-4826-8a3a-48df8f7a0d75', 'ebb5442b-71b1-41b5-9076-0eacbffe8ecf', 'Biosphere reserves are typically zoned into a strictly protected core area, a surrounding buffer zone allowing limited, regulated activities, and an outer transition zone where sustainable resource use and human habitation are permitted, balancing conservation with local livelihoods.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6dce5529-2965-4ba9-96b8-3afd2271e1f1', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 158, 'Trypsin, a proteolytic enzyme secreted by the pancreas (as inactive trypsinogen), is activated in the small intestine by:', 'Biology', 'Digestion and Absorption');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d80d841-71b4-4a39-ad5a-980a59275d30', '6dce5529-2965-4ba9-96b8-3afd2271e1f1', 0, 'Stomach acid (HCl) directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc393066-7970-4e54-8031-c160c6a5400f', '6dce5529-2965-4ba9-96b8-3afd2271e1f1', 1, 'Enterokinase (enteropeptidase), an enzyme secreted by the intestinal mucosa');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e34e300b-f848-4a12-900e-10a141bda840', '6dce5529-2965-4ba9-96b8-3afd2271e1f1', 2, 'Bile salts alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e04aaec-4e72-4e30-9623-4adbaa5afc72', '6dce5529-2965-4ba9-96b8-3afd2271e1f1', 3, 'Salivary amylase');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6dce5529-2965-4ba9-96b8-3afd2271e1f1', 'dc393066-7970-4e54-8031-c160c6a5400f', 'Pancreatic trypsinogen is converted to its active form, trypsin, by enterokinase (enteropeptidase) secreted by the intestinal mucosal cells; active trypsin can then also autocatalytically activate more trypsinogen and other pancreatic zymogens.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ac8f6306-912b-4f09-948f-321b44deacb1', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 159, 'Asthma, a common respiratory disorder, is characterized by:', 'Biology', 'Breathing and Exchange of Gases — Disorders');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72ba8b8b-5cdc-44d3-bb91-2dfeed3c02f5', 'ac8f6306-912b-4f09-948f-321b44deacb1', 0, 'Permanent destruction of alveolar walls');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73ae3295-c95a-47b6-9b14-bfc24b6f5173', 'ac8f6306-912b-4f09-948f-321b44deacb1', 1, 'Difficulty in breathing caused by inflammation and constriction (spasm) of the bronchioles/bronchi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84d86e1f-3b1b-475a-a2f6-c848d8f0f3e2', 'ac8f6306-912b-4f09-948f-321b44deacb1', 2, 'Complete paralysis of the diaphragm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db4c1e29-620a-4e47-9a51-57e241c8aead', 'ac8f6306-912b-4f09-948f-321b44deacb1', 3, 'Excess oxygen in the blood');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ac8f6306-912b-4f09-948f-321b44deacb1', '73ae3295-c95a-47b6-9b14-bfc24b6f5173', 'Asthma involves inflammation and reversible narrowing (bronchoconstriction) of the bronchi and bronchioles, often triggered by allergens or irritants, causing wheezing and difficulty breathing — distinct from emphysema, which involves irreversible alveolar wall destruction.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('252a4679-ecc3-411d-ad9a-441e2e8a1dbb', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 160, 'During muscle contraction, calcium ions released from the sarcoplasmic reticulum bind to which protein, initiating the contraction process?', 'Biology', 'Locomotion and Movement — Muscle Contraction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92c13693-8cfe-4afc-82dc-d22113467702', '252a4679-ecc3-411d-ad9a-441e2e8a1dbb', 0, 'Myosin directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d0e4fda-629f-4010-b7dc-50cdf19b51ff', '252a4679-ecc3-411d-ad9a-441e2e8a1dbb', 1, 'Troponin, which shifts tropomyosin to expose the myosin-binding sites on actin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b02c4e38-45c3-4bd2-8bc3-0ebdb2a3756b', '252a4679-ecc3-411d-ad9a-441e2e8a1dbb', 2, 'Actin directly, with no intermediary protein');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c2fb033-c128-4954-9b4a-679d72ae1eae', '252a4679-ecc3-411d-ad9a-441e2e8a1dbb', 3, 'ATP synthase');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('252a4679-ecc3-411d-ad9a-441e2e8a1dbb', '3d0e4fda-629f-4010-b7dc-50cdf19b51ff', 'Released Ca2+ binds to troponin, causing a conformational change that shifts tropomyosin away from the myosin-binding sites on the actin filament, allowing the myosin heads to bind actin and initiate the cross-bridge cycling of contraction.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8a459b53-1afa-481e-ab79-b83cbc8dff8f', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 161, 'The pancreas functions as both an exocrine and endocrine gland; its endocrine role, via the islets of Langerhans, involves secreting:', 'Biology', 'Chemical Coordination and Integration — Pancreas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f6b0911-7245-4485-b2de-d683b47e90fa', '8a459b53-1afa-481e-ab79-b83cbc8dff8f', 0, 'Only digestive enzymes into the duodenum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('acddcecf-17ea-4b6b-8f83-33b143b24fa9', '8a459b53-1afa-481e-ab79-b83cbc8dff8f', 1, 'Hormones such as insulin and glucagon directly into the bloodstream');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74257f80-ac5d-446b-9a7c-d6869c3a7eae', '8a459b53-1afa-481e-ab79-b83cbc8dff8f', 2, 'Bile for fat digestion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b98fe0d1-28d2-4dfd-bbd5-8c02a47fcfc4', '8a459b53-1afa-481e-ab79-b83cbc8dff8f', 3, 'Only mucus for lubrication');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8a459b53-1afa-481e-ab79-b83cbc8dff8f', 'acddcecf-17ea-4b6b-8f83-33b143b24fa9', 'The pancreas''s endocrine function is carried out by the islets of Langerhans, which secrete hormones (insulin from beta cells, glucagon from alpha cells) directly into the blood, distinct from its exocrine acinar cells that secrete digestive enzymes into the pancreatic duct.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('009df147-b807-466f-9335-c931e8798f96', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 162, 'Passive immunity, such as that provided to a newborn via antibodies in breast milk (colostrum), is characterized by:', 'Biology', 'Human Health and Disease — Immunity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05f6485b-ba23-4652-8c3c-400072ddae41', '009df147-b807-466f-9335-c931e8798f96', 0, 'The infant''s own immune system actively producing the antibodies');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8296a3c-f407-4af7-8bb9-1ea13ad38220', '009df147-b807-466f-9335-c931e8798f96', 1, 'Direct transfer of pre-formed antibodies from another source, providing immediate but relatively short-lived protection');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e82d07b-b43a-4948-a777-2953f44f9b89', '009df147-b807-466f-9335-c931e8798f96', 2, 'Permanent, lifelong immunity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8dff79c5-38aa-4c4b-82f1-ce553eda89b6', '009df147-b807-466f-9335-c931e8798f96', 3, 'No protective effect whatsoever');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('009df147-b807-466f-9335-c931e8798f96', 'b8296a3c-f407-4af7-8bb9-1ea13ad38220', 'Passive immunity involves receiving ready-made antibodies from an external source (like maternal colostrum or antivenom) rather than the individual''s own immune system producing them — offering immediate protection, but typically shorter-lived since no memory cells are generated.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b7c0b6b2-4a51-4606-8f3a-a797b2c743ca', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 163, 'In females, meiosis II of oogenesis is completed only if:', 'Biology', 'Human Reproduction — Gametogenesis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45036a1d-1bb2-4413-8473-d91d5430e830', 'b7c0b6b2-4a51-4606-8f3a-a797b2c743ca', 0, 'The secondary oocyte is fertilized by a sperm cell');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1afbf547-fd0e-458c-b019-56af3f712e7a', 'b7c0b6b2-4a51-4606-8f3a-a797b2c743ca', 1, 'Ovulation occurs, regardless of fertilization');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93b96c93-c280-40c5-92c1-383eadb8b3e4', 'b7c0b6b2-4a51-4606-8f3a-a797b2c743ca', 2, 'The individual reaches menopause');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e192253d-74a5-498b-8076-336edd86b74f', 'b7c0b6b2-4a51-4606-8f3a-a797b2c743ca', 3, 'It never completes under any circumstance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b7c0b6b2-4a51-4606-8f3a-a797b2c743ca', '45036a1d-1bb2-4413-8473-d91d5430e830', 'The secondary oocyte released at ovulation is arrested in metaphase II; meiosis II only completes (producing the mature ovum and second polar body) if the oocyte is actually fertilized by a sperm cell — otherwise it degenerates without completing this final division.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('45eea3e8-b74d-4c3c-892a-ac929c7f8e6d', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 164, 'Non-disjunction, the failure of homologous chromosomes (or sister chromatids) to separate properly during meiosis, can result in gametes with:', 'Biology', 'Genetics and Evolution — Chromosomal Disorders');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6804d597-c8d6-484b-83ef-ad36fe76cea4', '45eea3e8-b74d-4c3c-892a-ac929c7f8e6d', 0, 'A guaranteed normal chromosome number');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d97d6046-9fd1-4fb0-9e99-81ea34aaf207', '45eea3e8-b74d-4c3c-892a-ac929c7f8e6d', 1, 'An abnormal chromosome number (aneuploidy) — either one extra or one missing chromosome');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77987fa6-5391-4458-bbf4-513737a5fd11', '45eea3e8-b74d-4c3c-892a-ac929c7f8e6d', 2, 'Exactly double the normal chromosome number in all cases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eeb45899-2f21-46a8-92c7-d6a159fba349', '45eea3e8-b74d-4c3c-892a-ac929c7f8e6d', 3, 'No chromosomes at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('45eea3e8-b74d-4c3c-892a-ac929c7f8e6d', 'd97d6046-9fd1-4fb0-9e99-81ea34aaf207', 'Non-disjunction causes some gametes to receive an extra chromosome (n+1) and others to lack one (n-1); fertilization involving such a gamete produces aneuploid offspring (e.g., trisomy or monosomy conditions like Down or Turner syndrome).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e89e77d4-d606-47a8-9e87-e858c5f4a394', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 165, 'Plasmids used as cloning vectors in genetic engineering are naturally occurring:', 'Biology', 'Biotechnology — Principles and Processes — Cloning Vectors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('742f919e-98d3-4378-b6d3-af58f3aa2314', 'e89e77d4-d606-47a8-9e87-e858c5f4a394', 0, 'Linear chromosomal DNA found only in eukaryotic cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebe116ac-b2ba-4f5a-b733-2684184202eb', 'e89e77d4-d606-47a8-9e87-e858c5f4a394', 1, 'Small, circular, extra-chromosomal, self-replicating DNA molecules found in bacteria');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a6a3833-034e-4187-824e-6a5e502cc93e', 'e89e77d4-d606-47a8-9e87-e858c5f4a394', 2, 'RNA molecules found in viruses only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('043a5aff-7d59-4c18-b52e-47f7e78eb15f', 'e89e77d4-d606-47a8-9e87-e858c5f4a394', 3, 'Protein complexes with no DNA content');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e89e77d4-d606-47a8-9e87-e858c5f4a394', 'ebe116ac-b2ba-4f5a-b733-2684184202eb', 'Plasmids are small, circular, double-stranded DNA molecules that exist independently of the bacterial chromosome and can replicate autonomously, making them ideal, naturally occurring vectors for carrying foreign DNA inserts in recombinant DNA technology.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('cf9b4190-cefd-4345-acd1-3644e8440954', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 166, 'Hibernation, seen in animals like certain bears and ground squirrels during winter, is best described as an adaptation that:', 'Biology', 'Organisms and Populations — Adaptations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80d8fa07-9170-4493-a1b3-d42195a05bfd', 'cf9b4190-cefd-4345-acd1-3644e8440954', 0, 'Increases metabolic rate to generate more body heat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d3031cf-b381-46c5-a00a-a4b411f8b3e8', 'cf9b4190-cefd-4345-acd1-3644e8440954', 1, 'Involves a state of dramatically reduced metabolic rate and body temperature to conserve energy during periods of food/resource scarcity and cold');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e637d9d5-03cb-491c-8115-0290dcaae0d0', 'cf9b4190-cefd-4345-acd1-3644e8440954', 2, 'Only occurs in cold-blooded (ectothermic) animals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ec93520-1fc6-4416-8daa-7c5abdd1db53', 'cf9b4190-cefd-4345-acd1-3644e8440954', 3, 'Has no connection to seasonal resource availability');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cf9b4190-cefd-4345-acd1-3644e8440954', '8d3031cf-b381-46c5-a00a-a4b411f8b3e8', 'Hibernation is a physiological adaptation in which an animal''s metabolic rate, heart rate, and body temperature drop substantially, conserving energy during a season (typically winter) when food is scarce and environmental conditions are harsh.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2475e10b-758d-4270-bef4-18b695e43588', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 167, 'Phylum Mollusca, the second largest animal phylum, is characterized by a soft body typically featuring:', 'Biology', 'Animal Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('115234b2-f847-4372-aacd-ab5c7e173b0c', '2475e10b-758d-4270-bef4-18b695e43588', 0, 'A rigid exoskeleton made of chitin, as in arthropods');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79f1bade-050d-4ac6-be4f-281d42dbb2dd', '2475e10b-758d-4270-bef4-18b695e43588', 1, 'A muscular foot, a visceral mass, and (in most groups) a mantle that may secrete a calcareous shell');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3fc3c424-2cc6-4801-bfbb-05128d0250b2', '2475e10b-758d-4270-bef4-18b695e43588', 2, 'Radial symmetry with no head region');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06bae533-eb95-432e-a9aa-797b73fc2b54', '2475e10b-758d-4270-bef4-18b695e43588', 3, 'A notochord present throughout life');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2475e10b-758d-4270-bef4-18b695e43588', '79f1bade-050d-4ac6-be4f-281d42dbb2dd', 'Molluscs (snails, clams, octopuses) share a body plan built around a muscular foot for locomotion, a visceral mass containing organs, and a mantle — a fold of tissue that, in many groups, secretes a protective calcareous shell.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2b6a7be3-c881-43cb-86b4-d0a683c6d83d', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 168, 'In the earthworm, respiration (gaseous exchange) occurs primarily through the:', 'Biology', 'Structural Organisation in Animals — Earthworm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee862955-f567-4dbd-99f8-d82698d8d9ac', '2b6a7be3-c881-43cb-86b4-d0a683c6d83d', 0, 'Lungs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9e53db7-26ca-4163-b2a6-0729abac6f01', '2b6a7be3-c881-43cb-86b4-d0a683c6d83d', 1, 'Moist, vascularized skin (cutaneous respiration)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('381d8b77-6b7c-43d9-949d-213a9c1eec99', '2b6a7be3-c881-43cb-86b4-d0a683c6d83d', 2, 'Gills');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5042da14-4387-4602-a695-0047aa7fb8bb', '2b6a7be3-c881-43cb-86b4-d0a683c6d83d', 3, 'Tracheal tubes, as in insects');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2b6a7be3-c881-43cb-86b4-d0a683c6d83d', 'a9e53db7-26ca-4163-b2a6-0729abac6f01', 'Earthworms lack specialized respiratory organs; gas exchange occurs by simple diffusion across their thin, moist, richly vascularized skin, which is why they require damp soil conditions to survive.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9da88326-12f1-4239-be35-77769f38051f', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 169, 'The Rh factor, another blood group antigen system besides ABO, is medically significant particularly in cases of:', 'Biology', 'Body Fluids and Circulation — Blood Groups');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('820d2bb2-dee9-4565-8519-6aa3d5372063', '9da88326-12f1-4239-be35-77769f38051f', 0, 'Blood clotting disorders only, unrelated to pregnancy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('409ca11a-2ac1-4395-959b-0a1724b8bfc2', '9da88326-12f1-4239-be35-77769f38051f', 1, 'Rh incompatibility between an Rh-negative mother and an Rh-positive fetus, which can cause haemolytic disease of the newborn in subsequent pregnancies');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c07cacfb-39e8-4ca6-9b55-042dc544a2aa', '9da88326-12f1-4239-be35-77769f38051f', 2, 'Digestive disorders');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65983337-68a3-4120-99e4-c444112b5787', '9da88326-12f1-4239-be35-77769f38051f', 3, 'Muscle contraction abnormalities');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9da88326-12f1-4239-be35-77769f38051f', '409ca11a-2ac1-4395-959b-0a1724b8bfc2', 'If an Rh-negative mother carries an Rh-positive fetus, exposure to fetal Rh-positive blood (often during delivery) can sensitize her immune system to produce anti-Rh antibodies, which in a SUBSEQUENT Rh-positive pregnancy can cross the placenta and cause haemolytic disease of the newborn.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('fde4155c-b470-4c4c-adf8-b518a4af27cf', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 170, 'The renal pelvis of the kidney functions to:', 'Biology', 'Excretory Products and Their Elimination — Kidney Structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74a3d214-e51a-4414-af39-2babd54b566c', 'fde4155c-b470-4c4c-adf8-b518a4af27cf', 0, 'Filter blood directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2deadc54-347b-4e55-a6f7-9a135a3a6897', 'fde4155c-b470-4c4c-adf8-b518a4af27cf', 1, 'Collect urine from the major calyces before it passes into the ureter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15097d29-90fc-493e-8e79-96c4f8cc0599', 'fde4155c-b470-4c4c-adf8-b518a4af27cf', 2, 'Produce erythropoietin exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62204223-a96c-441b-90bf-e45a2ddf1466', 'fde4155c-b470-4c4c-adf8-b518a4af27cf', 3, 'Reabsorb glucose from the filtrate');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fde4155c-b470-4c4c-adf8-b518a4af27cf', '2deadc54-347b-4e55-a6f7-9a135a3a6897', 'Urine formed in the nephrons drains into collecting ducts, then into the minor and major calyces, which converge into the funnel-shaped renal pelvis — from there it passes into the ureter toward the urinary bladder.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('086adb20-321a-4ae6-8a70-80a2b31b0ab0', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 171, 'The myelin sheath surrounding certain axons is formed by which cells in the peripheral nervous system?', 'Biology', 'Neural Control and Coordination — Neuron Structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5d77998-1d2f-4ff4-add0-4f0fdd51636e', '086adb20-321a-4ae6-8a70-80a2b31b0ab0', 0, 'Astrocytes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('989c120f-282f-47d4-a123-1152ccfb90bc', '086adb20-321a-4ae6-8a70-80a2b31b0ab0', 1, 'Schwann cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbc2eca9-9b21-47b8-8fac-46eb8206f570', '086adb20-321a-4ae6-8a70-80a2b31b0ab0', 2, 'Microglia');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abcd296c-290a-42bd-9d1c-48631951f1d1', '086adb20-321a-4ae6-8a70-80a2b31b0ab0', 3, 'Oligodendrocytes (these myelinate the CNS, not PNS)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('086adb20-321a-4ae6-8a70-80a2b31b0ab0', '989c120f-282f-47d4-a123-1152ccfb90bc', 'In the peripheral nervous system, Schwann cells wrap around axons to form the myelin sheath, which insulates the axon and enables faster saltatory conduction of nerve impulses (oligodendrocytes perform the analogous role in the central nervous system).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9177e358-77a5-4959-95ca-8382c96de308', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 172, 'The placenta, formed during pregnancy, serves the developing fetus primarily by:', 'Biology', 'Human Reproduction — Placenta');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e28fb2b-5865-4f16-a9a6-3947ef648fe0', '9177e358-77a5-4959-95ca-8382c96de308', 0, 'Directly mixing maternal and fetal blood together');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a035ed9c-4f3a-4ee1-9761-88909968ce76', '9177e358-77a5-4959-95ca-8382c96de308', 1, 'Facilitating exchange of nutrients, oxygen, and waste products between maternal and fetal blood without the two blood supplies actually mixing, and secreting pregnancy-supporting hormones');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94c4ab17-da91-432e-80e2-ae489e495b2d', '9177e358-77a5-4959-95ca-8382c96de308', 2, 'Producing sperm for future use');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d83ac32b-87b1-4c86-8c76-e7e50b7f2b06', '9177e358-77a5-4959-95ca-8382c96de308', 3, 'Preventing all hormone production during pregnancy');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9177e358-77a5-4959-95ca-8382c96de308', 'a035ed9c-4f3a-4ee1-9761-88909968ce76', 'The placenta is a specialized organ that allows physiological exchange (nutrients, gases, wastes) between separate maternal and fetal circulations across a thin membrane barrier, and also functions as an endocrine organ, secreting hormones like hCG, estrogen, and progesterone essential for maintaining pregnancy.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('66f3b010-a41a-4f70-aa76-114907935006', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 173, 'Biopsy, a diagnostic technique for detecting cancer, involves:', 'Biology', 'Human Health and Disease — Cancer Detection');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ae0cd44-768c-4e27-a7d6-7ec09f0b6758', '66f3b010-a41a-4f70-aa76-114907935006', 0, 'Only imaging techniques like X-rays, with no tissue removal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76df9d88-87bf-4e0a-97a7-1250d201d74b', '66f3b010-a41a-4f70-aa76-114907935006', 1, 'Removing a small sample of suspected tissue for microscopic (histopathological) examination to check for malignant cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('491617d5-3b2a-4a96-96e2-fd02b1c72fab', '66f3b010-a41a-4f70-aa76-114907935006', 2, 'Only blood tests, with no tissue sampling');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37c5984a-2ef1-41f2-a45f-13389ba357ed', '66f3b010-a41a-4f70-aa76-114907935006', 3, 'Complete surgical removal of the entire organ as the first diagnostic step');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('66f3b010-a41a-4f70-aa76-114907935006', '76df9d88-87bf-4e0a-97a7-1250d201d74b', 'Biopsy involves surgically or needle-extracting a small tissue sample from a suspicious growth, which a pathologist then examines microscopically to determine whether the cells are malignant (cancerous) or benign.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7b4db92e-b0e3-411e-bfbf-28c97337618b', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 174, 'Binary fission, a common mode of asexual reproduction in unicellular organisms like Amoeba and bacteria, involves:', 'Biology', 'Reproduction in Organisms — Asexual Reproduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79e6c67f-efc0-4123-8a0f-53d3841090da', '7b4db92e-b0e3-411e-bfbf-28c97337618b', 0, 'The fusion of two parent cells to form one offspring');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad54814a-1f1c-4202-a85e-6ba8f26f2f44', '7b4db92e-b0e3-411e-bfbf-28c97337618b', 1, 'A single parent cell dividing into two, approximately equal-sized, genetically identical daughter cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ce25888-19e6-4758-bcb2-b1f976e4291f', '7b4db92e-b0e3-411e-bfbf-28c97337618b', 2, 'Formation of a multicellular bud');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5dccc32-5d80-42c7-a261-741b5fce7f5e', '7b4db92e-b0e3-411e-bfbf-28c97337618b', 3, 'Production of spores within a specialized structure');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7b4db92e-b0e3-411e-bfbf-28c97337618b', 'ad54814a-1f1c-4202-a85e-6ba8f26f2f44', 'Binary fission is the simplest form of asexual reproduction, in which a single-celled parent organism divides directly into two independent, genetically identical daughter cells of roughly equal size.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7998704e-c0e2-47c3-87d2-2f8533342d2a', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 175, 'Phenylketonuria (PKU), an inborn error of metabolism, results from a deficiency of the enzyme needed to metabolize:', 'Biology', 'Genetics and Evolution — Genetic Disorders');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5541debd-d5e4-40e7-a732-c62a149c3a61', '7998704e-c0e2-47c3-87d2-2f8533342d2a', 0, 'Glucose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09bc944b-fc86-4574-a9f1-e6fb6f13922e', '7998704e-c0e2-47c3-87d2-2f8533342d2a', 1, 'The amino acid phenylalanine, which accumulates and can cause intellectual disability if untreated');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('009d8a57-a533-44e4-a1b5-fd1595fbf9b8', '7998704e-c0e2-47c3-87d2-2f8533342d2a', 2, 'Fatty acids exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87c3172b-bbaf-4e0d-9abb-6b2fda91d017', '7998704e-c0e2-47c3-87d2-2f8533342d2a', 3, 'Vitamin D');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7998704e-c0e2-47c3-87d2-2f8533342d2a', '09bc944b-fc86-4574-a9f1-e6fb6f13922e', 'PKU is an autosomal recessive metabolic disorder caused by deficiency of phenylalanine hydroxylase, leading to toxic accumulation of phenylalanine; if undetected and untreated (typically via dietary restriction from infancy), it can cause severe intellectual disability.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('bdbf98d0-d333-487e-8467-07a6ffbe776e', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 176, 'Genetic drift, as a mechanism of evolution, refers to:', 'Biology', 'Evolution — Mechanisms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a5ceab0-aca1-4a52-a7d6-af3f7d344d14', 'bdbf98d0-d333-487e-8467-07a6ffbe776e', 0, 'Directional, predictable changes in allele frequency driven entirely by natural selection');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5392d474-006e-4139-95b6-707b02ea25e0', 'bdbf98d0-d333-487e-8467-07a6ffbe776e', 1, 'Random fluctuations in allele frequencies within a population, having a proportionally greater effect in small populations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41214b13-6e6f-4847-9c4e-c076cb9d4b03', 'bdbf98d0-d333-487e-8467-07a6ffbe776e', 2, 'A process that only occurs in very large populations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a2e24cb-d3d3-4a7c-b2ae-1d4e51fa67cd', 'bdbf98d0-d333-487e-8467-07a6ffbe776e', 3, 'The complete elimination of all genetic variation instantly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bdbf98d0-d333-487e-8467-07a6ffbe776e', '5392d474-006e-4139-95b6-707b02ea25e0', 'Genetic drift is a random, chance-driven change in allele frequencies from one generation to the next, unrelated to selective advantage — its effects are much more pronounced in small populations, where chance sampling errors have a proportionally larger impact.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0dcbc0e2-92f1-40f8-9726-65745d3ceebc', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 177, 'Transgenic animals, such as mice engineered to carry a human gene, are primarily used in research to:', 'Biology', 'Biotechnology and Its Applications — Transgenic Animals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('784b5ab8-2424-4779-a215-f0987cab06e9', '0dcbc0e2-92f1-40f8-9726-65745d3ceebc', 0, 'Replace all traditional laboratory animal models entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e50c4c0b-3bca-4136-9c45-f4ce4fc58c8a', '0dcbc0e2-92f1-40f8-9726-65745d3ceebc', 1, 'Study gene function, model human diseases, and test the safety/efficacy of biological products before human trials');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9cc6578a-52da-4446-8f33-4e5327453eae', '0dcbc0e2-92f1-40f8-9726-65745d3ceebc', 2, 'Only serve as pets');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ecf57839-d76a-4b23-aa64-d701e09b2e01', '0dcbc0e2-92f1-40f8-9726-65745d3ceebc', 3, 'Produce food with no research application');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0dcbc0e2-92f1-40f8-9726-65745d3ceebc', 'e50c4c0b-3bca-4136-9c45-f4ce4fc58c8a', 'Transgenic animals carrying inserted foreign genes are valuable tools for studying gene function, creating disease models (e.g., for cancer or genetic disorders), and testing the biological safety and efficacy of drugs/vaccines before human clinical trials.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c2853c4c-d297-40e1-b3ba-0bbf470ad1ec', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 178, 'The process of decomposition of detritus in an ecosystem proceeds through several steps, generally beginning with:', 'Biology', 'Ecosystem — Decomposition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('407e5aea-87f3-4647-9707-0c973797b5ab', 'c2853c4c-d297-40e1-b3ba-0bbf470ad1ec', 0, 'Humification, immediately forming stable humus with no prior breakdown');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef4bcd7d-55c9-4e11-bf5f-43d7c0a3ba15', 'c2853c4c-d297-40e1-b3ba-0bbf470ad1ec', 1, 'Fragmentation of detritus into smaller particles by detritivores (e.g., earthworms), followed by further microbial breakdown');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e122163-a7ad-4e53-80ae-b790de15ac5b', 'c2853c4c-d297-40e1-b3ba-0bbf470ad1ec', 2, 'Mineralization occurring before any physical breakdown');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8903d69f-62b8-4f22-a881-ee8368bb7620', 'c2853c4c-d297-40e1-b3ba-0bbf470ad1ec', 3, 'Leaching occurring only after complete decomposition is finished');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c2853c4c-d297-40e1-b3ba-0bbf470ad1ec', 'ef4bcd7d-55c9-4e11-bf5f-43d7c0a3ba15', 'Decomposition typically begins with detritivores (like earthworms) physically fragmenting dead organic matter into smaller pieces, increasing surface area for further leaching, microbial catabolism, and eventual humification/mineralization.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('39c00a50-3681-4d59-b563-f0bcc830488f', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 179, 'The species-area relationship, a well-documented ecological pattern, generally shows that:', 'Biology', 'Biodiversity and Conservation — Global Patterns');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('22a2d694-fd70-4847-84d5-c0b7566ec33c', '39c00a50-3681-4d59-b563-f0bcc830488f', 0, 'Species richness decreases as the area of a habitat sampled increases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b35cde0-7051-4ffc-9c1b-aba4e9386acb', '39c00a50-3681-4d59-b563-f0bcc830488f', 1, 'Species richness increases with increasing area of the habitat sampled, though the rate of increase slows at very large areas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f47b715-1d04-49d9-9166-9d0276526834', '39c00a50-3681-4d59-b563-f0bcc830488f', 2, 'There is no relationship between habitat area and species richness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f241c494-94ef-4e08-b7f1-9a793dfde7c8', '39c00a50-3681-4d59-b563-f0bcc830488f', 3, 'Species richness is always exactly proportional to area with no curvature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('39c00a50-3681-4d59-b563-f0bcc830488f', '2b35cde0-7051-4ffc-9c1b-aba4e9386acb', 'The species-area relationship shows that larger sampled areas generally contain more species, following a roughly log-log linear pattern that flattens somewhat at very large scales — a foundational pattern in community ecology and conservation biogeography.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('139ce417-9b4e-4f36-80ac-99286b834449', '3f466e21-da51-45e3-98f9-c6b771faa1ea', 180, 'The human skull articulates with the vertebral column at the:', 'Biology', 'Locomotion and Movement — Skeletal System');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d80a208-f93a-4475-b16b-aa1ed05c7cae', '139ce417-9b4e-4f36-80ac-99286b834449', 0, 'Atlas vertebra, via a pivot joint allowing ''no'' head movement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8baa301-e845-45ba-ad92-5b96d6e04651', '139ce417-9b4e-4f36-80ac-99286b834449', 1, 'Atlanto-occipital joint, between the occipital condyles of the skull and the atlas (first cervical vertebra)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c1853e6-2959-422d-9bf9-42e91da3f1b2', '139ce417-9b4e-4f36-80ac-99286b834449', 2, 'Sacrum directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1e0c8ac-e673-49d3-bd5c-7fd37da91108', '139ce417-9b4e-4f36-80ac-99286b834449', 3, 'Coccyx');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('139ce417-9b4e-4f36-80ac-99286b834449', 'c8baa301-e845-45ba-ad92-5b96d6e04651', 'The skull articulates with the vertebral column at the atlanto-occipital joint, where the occipital condyles of the skull rest on the atlas (C1), allowing the characteristic nodding (yes) movement of the head; the atlanto-axial joint (atlas-axis) separately allows head rotation (no movement).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');
