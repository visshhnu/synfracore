-- ============================================================
-- JEE Main — Full Mock Paper 3
-- Full-Length Practice Paper (75 questions, 180 minutes)
-- Marking: +4 correct / -1 incorrect
-- Run this AFTER docs/add-numeric-answer-type.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('7984b7da-2946-453b-861a-b4c7b276643b', 'jee-main-practice-3', 'JEE Main Full Mock Paper 3', 'jee-main', ARRAY['Physics', 'Chemistry', 'Mathematics', 'NCERT', 'JEE Main']::TEXT[], 75, 'mixed', true, 3, 180, 4, 1);

-- ── Section: Physics (25 questions) — Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a0657f09-16bc-46f2-a052-a7345279eec6', '7984b7da-2946-453b-861a-b4c7b276643b', 1, 'Which of the following is a dimensionless quantity?', 'Physics', 'Units and Measurements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebf34b1d-9930-4bb8-9fdc-861b79a487fb', 'a0657f09-16bc-46f2-a052-a7345279eec6', 0, 'Velocity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('393d52bb-906a-4676-9430-6af4b16978c5', 'a0657f09-16bc-46f2-a052-a7345279eec6', 1, 'Strain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd1ee631-75c1-44df-a62f-c07b22e56757', 'a0657f09-16bc-46f2-a052-a7345279eec6', 2, 'Force');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c2949e7-1448-4fe3-9c20-65ea29fa683a', 'a0657f09-16bc-46f2-a052-a7345279eec6', 3, 'Momentum');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a0657f09-16bc-46f2-a052-a7345279eec6', '393d52bb-906a-4676-9430-6af4b16978c5', 'Strain is defined as a ratio of two lengths (change in length/original length), making it dimensionless.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('30800e26-0dd8-4805-929f-7322356a0912', '7984b7da-2946-453b-861a-b4c7b276643b', 2, 'A body moving with uniform velocity has:', 'Physics', 'Motion in a Straight Line', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8185b285-6ab4-4aef-b0e0-1eca6e701b20', '30800e26-0dd8-4805-929f-7322356a0912', 0, 'Non-zero acceleration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b802362b-0d5a-419a-9e48-fc205c1e5a26', '30800e26-0dd8-4805-929f-7322356a0912', 1, 'Zero acceleration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95081701-de45-4cc5-a56d-ee2aa046488c', '30800e26-0dd8-4805-929f-7322356a0912', 2, 'Increasing velocity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee05f637-7c8e-4f67-aaf6-e7bde7a64889', '30800e26-0dd8-4805-929f-7322356a0912', 3, 'Decreasing velocity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('30800e26-0dd8-4805-929f-7322356a0912', 'b802362b-0d5a-419a-9e48-fc205c1e5a26', 'Uniform velocity means constant velocity (no change in speed or direction), so acceleration is zero.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('96784676-a419-4de1-82d0-1aeb6f96c610', '7984b7da-2946-453b-861a-b4c7b276643b', 3, 'The recoil velocity of a gun of mass 5 kg firing a bullet of mass 0.05 kg with a velocity of 200 m/s is:', 'Physics', 'Laws of Motion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('028bc866-1958-4f56-8d48-9cced59c3ae4', '96784676-a419-4de1-82d0-1aeb6f96c610', 0, '1 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbcda792-3e0c-4949-bc14-a864d1a93aeb', '96784676-a419-4de1-82d0-1aeb6f96c610', 1, '2 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d52e023b-1aad-4102-a087-8e213331c8cb', '96784676-a419-4de1-82d0-1aeb6f96c610', 2, '0.5 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd6927fb-e182-4cbd-a538-0d1a221eab74', '96784676-a419-4de1-82d0-1aeb6f96c610', 3, '20 m/s');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('96784676-a419-4de1-82d0-1aeb6f96c610', 'fbcda792-3e0c-4949-bc14-a864d1a93aeb', 'By conservation of momentum: 5*v = 0.05*200, so v = 10/5 = 2 m/s.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('820ab8d7-c3df-4926-9c62-41957b7c3677', '7984b7da-2946-453b-861a-b4c7b276643b', 4, 'A ball of mass 0.5 kg moving with velocity 4 m/s collides with a stationary ball of the same mass and comes to rest, transferring all its momentum. The velocity of the second ball after collision is:', 'Physics', 'Work, Energy and Power', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62f78b22-e41e-475e-bf41-4310791004c1', '820ab8d7-c3df-4926-9c62-41957b7c3677', 0, '2 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc8a29f0-b120-4da0-a0ca-45d33e9a0b9e', '820ab8d7-c3df-4926-9c62-41957b7c3677', 1, '4 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('943249d3-0c26-45fb-ba80-21bf14def378', '820ab8d7-c3df-4926-9c62-41957b7c3677', 2, '8 m/s');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6992bc53-6e62-46de-bc2a-ec63f6178849', '820ab8d7-c3df-4926-9c62-41957b7c3677', 3, '1 m/s');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('820ab8d7-c3df-4926-9c62-41957b7c3677', 'dc8a29f0-b120-4da0-a0ca-45d33e9a0b9e', 'By conservation of momentum, since the first ball stops completely and both masses are equal, the second ball moves off with the same velocity, 4 m/s (a perfectly elastic collision between equal masses).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('afda2c38-300b-472a-a048-57436f0b0fca', '7984b7da-2946-453b-861a-b4c7b276643b', 5, 'Angular momentum is conserved in a system when:', 'Physics', 'System of Particles and Rotational Motion', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9fb76e40-9dd1-4b96-bc2b-1e42fd9b120c', 'afda2c38-300b-472a-a048-57436f0b0fca', 0, 'Net external force is zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82990700-4526-46de-9db5-e8439d7a806c', 'afda2c38-300b-472a-a048-57436f0b0fca', 1, 'Net external torque is zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd67e907-2543-4d41-bf5c-71e4fa6446b0', 'afda2c38-300b-472a-a048-57436f0b0fca', 2, 'Kinetic energy is constant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb9bad27-e11b-46e2-951a-102be7f06760', 'afda2c38-300b-472a-a048-57436f0b0fca', 3, 'Linear momentum changes');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('afda2c38-300b-472a-a048-57436f0b0fca', '82990700-4526-46de-9db5-e8439d7a806c', 'Angular momentum is conserved specifically when the net external torque acting on the system is zero.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a29e63e6-563f-490d-a3d0-21dec5714ee2', '7984b7da-2946-453b-861a-b4c7b276643b', 6, 'The value of acceleration due to gravity at the centre of the Earth is:', 'Physics', 'Gravitation', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0330fd9d-9bb0-40bb-ac4d-86790aa2f59f', 'a29e63e6-563f-490d-a3d0-21dec5714ee2', 0, 'Maximum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('327b5f4a-7672-4eca-8eed-6de95a190939', 'a29e63e6-563f-490d-a3d0-21dec5714ee2', 1, 'Equal to g at the surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3b21c60-74e9-42e0-8515-d4246d12c6ca', 'a29e63e6-563f-490d-a3d0-21dec5714ee2', 2, 'Zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5435d148-f85d-4bf1-92cb-82fdbbe54824', 'a29e63e6-563f-490d-a3d0-21dec5714ee2', 3, 'Infinite');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a29e63e6-563f-490d-a3d0-21dec5714ee2', 'd3b21c60-74e9-42e0-8515-d4246d12c6ca', 'At the centre of the Earth, the gravitational contributions from all surrounding mass cancel out symmetrically, making the net gravitational field (and hence g) zero.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fdc4a0fb-7561-4d66-80ee-60f80bba2bd2', '7984b7da-2946-453b-861a-b4c7b276643b', 7, 'The SI unit of Young''s modulus is the same as that of:', 'Physics', 'Mechanical Properties of Solids', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc3c3327-b123-4efa-9792-5522a707373e', 'fdc4a0fb-7561-4d66-80ee-60f80bba2bd2', 0, 'Force');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ca1b7ac-2c66-479d-b7b5-b0d9085dea8a', 'fdc4a0fb-7561-4d66-80ee-60f80bba2bd2', 1, 'Pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f3f0db3-c576-45c1-8ba2-fba954441518', 'fdc4a0fb-7561-4d66-80ee-60f80bba2bd2', 2, 'Energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15cbc95c-272a-48bb-8df3-43bf3e5b565e', 'fdc4a0fb-7561-4d66-80ee-60f80bba2bd2', 3, 'Strain');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fdc4a0fb-7561-4d66-80ee-60f80bba2bd2', '3ca1b7ac-2c66-479d-b7b5-b0d9085dea8a', 'Young''s modulus has units of stress (force/area), which is dimensionally identical to pressure (N/m^2, or pascal).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2114cf57-ae5a-4ca9-953a-ca2f22db7575', '7984b7da-2946-453b-861a-b4c7b276643b', 8, 'According to Pascal''s law, pressure applied to an enclosed, incompressible fluid is transmitted:', 'Physics', 'Mechanical Properties of Fluids', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62ff86c1-a2c7-4fa1-ae26-64c75fad587e', '2114cf57-ae5a-4ca9-953a-ca2f22db7575', 0, 'Only in the direction of application');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d87b227b-d9e8-475b-b07e-ef726920ec75', '2114cf57-ae5a-4ca9-953a-ca2f22db7575', 1, 'Equally in all directions throughout the fluid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e121306e-4af2-4ab4-8613-54c9efdbf5ed', '2114cf57-ae5a-4ca9-953a-ca2f22db7575', 2, 'Only to the bottom of the container');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1ad1ca4-ac85-4569-95ac-006585f6b978', '2114cf57-ae5a-4ca9-953a-ca2f22db7575', 3, 'Only to the walls of the container');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2114cf57-ae5a-4ca9-953a-ca2f22db7575', 'd87b227b-d9e8-475b-b07e-ef726920ec75', 'Pascal''s law states that pressure applied at any point in a confined, incompressible fluid is transmitted equally and undiminished in all directions throughout the fluid.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f1fdfb07-fb67-4753-8fd7-43b73c826faf', '7984b7da-2946-453b-861a-b4c7b276643b', 9, 'The specific heat capacity of water is approximately:', 'Physics', 'Thermal Properties of Matter', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4c51950-0cef-423f-8ba1-420cb015bac9', 'f1fdfb07-fb67-4753-8fd7-43b73c826faf', 0, '1 cal/(g.C)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a8bd01f-0713-4d17-a191-e8879ecffcdd', 'f1fdfb07-fb67-4753-8fd7-43b73c826faf', 1, '0.5 cal/(g.C)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a0ea349-3fed-47a1-8db1-6133e453b53e', 'f1fdfb07-fb67-4753-8fd7-43b73c826faf', 2, '2 cal/(g.C)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57c20c49-c98a-4dfe-81f5-7768990a995b', 'f1fdfb07-fb67-4753-8fd7-43b73c826faf', 3, '4.2 cal/(g.C)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f1fdfb07-fb67-4753-8fd7-43b73c826faf', 'a4c51950-0cef-423f-8ba1-420cb015bac9', 'Water''s specific heat capacity is approximately 1 cal/(g.degree C), or equivalently about 4.2 J/(g.degree C) — a notably high value compared to most substances.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f6a4a333-9972-4b80-858f-32627c1b0539', '7984b7da-2946-453b-861a-b4c7b276643b', 10, 'The efficiency of a Carnot engine operating between a source at 500K and a sink at 300K is:', 'Physics', 'Thermodynamics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0d47d59-cf8b-4b0b-8305-b4058797c755', 'f6a4a333-9972-4b80-858f-32627c1b0539', 0, '20%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eff07930-3994-4b82-8a5e-19abe92ee0bf', 'f6a4a333-9972-4b80-858f-32627c1b0539', 1, '40%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6e7b4b5-15a8-49bb-90c2-19d686a7673b', 'f6a4a333-9972-4b80-858f-32627c1b0539', 2, '60%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8195258-45ec-45b2-9ef0-6cd36353223c', 'f6a4a333-9972-4b80-858f-32627c1b0539', 3, '80%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f6a4a333-9972-4b80-858f-32627c1b0539', 'eff07930-3994-4b82-8a5e-19abe92ee0bf', 'Efficiency = 1 - T2/T1 = 1 - 300/500 = 1 - 0.6 = 0.4 = 40%.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3d857b3d-361f-4f86-876b-d49b757150a9', '7984b7da-2946-453b-861a-b4c7b276643b', 11, 'The average kinetic energy of a gas molecule at absolute temperature T is given by:', 'Physics', 'Kinetic Theory', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88ac1cef-aa14-4980-a3a2-d4dd6d950c10', '3d857b3d-361f-4f86-876b-d49b757150a9', 0, '(1/2)kT');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9420dc8-1a13-4bd5-8c19-497cc8c611a2', '3d857b3d-361f-4f86-876b-d49b757150a9', 1, 'kT');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bcdbbf5e-5c0b-404e-97a5-bbb9e7ee3900', '3d857b3d-361f-4f86-876b-d49b757150a9', 2, '(3/2)kT');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1036abb-20d1-4d33-a413-907139e489f3', '3d857b3d-361f-4f86-876b-d49b757150a9', 3, '2kT');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3d857b3d-361f-4f86-876b-d49b757150a9', 'bcdbbf5e-5c0b-404e-97a5-bbb9e7ee3900', 'The average translational kinetic energy per molecule of an ideal gas is (3/2)kT, where k is Boltzmann''s constant.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b8f4c0fa-3a99-49a3-b76d-8ecd0db495ad', '7984b7da-2946-453b-861a-b4c7b276643b', 12, 'The maximum acceleration of a particle in SHM with amplitude A and angular frequency omega is:', 'Physics', 'Oscillations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('320f0441-39a1-4f24-a806-950cea7fe11e', 'b8f4c0fa-3a99-49a3-b76d-8ecd0db495ad', 0, 'omega*A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7198bc1f-147f-4586-a865-adfcf18871f9', 'b8f4c0fa-3a99-49a3-b76d-8ecd0db495ad', 1, 'omega^2*A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99bbf8e8-ce44-4067-af66-2d5ce1ca0eb1', 'b8f4c0fa-3a99-49a3-b76d-8ecd0db495ad', 2, 'omega^2/A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1686212a-784a-4aa4-8e0a-d08f8d4453dd', 'b8f4c0fa-3a99-49a3-b76d-8ecd0db495ad', 3, 'A/omega');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b8f4c0fa-3a99-49a3-b76d-8ecd0db495ad', '7198bc1f-147f-4586-a865-adfcf18871f9', 'In SHM, acceleration a = -omega^2*x; the maximum magnitude occurs at x=A, giving a_max = omega^2*A.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d44edc5a-34a8-4bf6-8822-16fc073e20bc', '7984b7da-2946-453b-861a-b4c7b276643b', 13, 'The phenomenon of formation of stationary waves requires the superposition of two waves that are:', 'Physics', 'Waves', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15d9f711-3b41-4c48-b8fc-851a625462f0', 'd44edc5a-34a8-4bf6-8822-16fc073e20bc', 0, 'Of different frequencies travelling in the same direction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7dae5248-8b52-49ca-b89e-707034e903a1', 'd44edc5a-34a8-4bf6-8822-16fc073e20bc', 1, 'Of the same frequency and amplitude travelling in opposite directions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca20b744-6f9b-476e-a8fe-e21a4ba98d22', 'd44edc5a-34a8-4bf6-8822-16fc073e20bc', 2, 'Travelling in the same direction with different amplitudes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6519db81-b1c6-4451-ac39-cff937a07341', 'd44edc5a-34a8-4bf6-8822-16fc073e20bc', 3, 'Of different wavelengths');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d44edc5a-34a8-4bf6-8822-16fc073e20bc', '7dae5248-8b52-49ca-b89e-707034e903a1', 'Stationary (standing) waves form from the superposition of two waves of identical frequency and amplitude travelling in opposite directions.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0be7fbd5-1171-4890-9a68-953ff7fb899e', '7984b7da-2946-453b-861a-b4c7b276643b', 14, 'Coulomb''s law is analogous in form to which other fundamental force law?', 'Physics', 'Electric Charges and Fields', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7bf48f12-c125-46db-9df2-c1e83475209c', '0be7fbd5-1171-4890-9a68-953ff7fb899e', 0, 'Newton''s law of gravitation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92b7c3bb-3913-4f91-8837-c8fa146d12d4', '0be7fbd5-1171-4890-9a68-953ff7fb899e', 1, 'Hooke''s law');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17bfb8b9-2450-4254-9fcf-129b944ce195', '0be7fbd5-1171-4890-9a68-953ff7fb899e', 2, 'Ohm''s law');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f3c7de9-d74c-4a12-944d-76e5e7506a06', '0be7fbd5-1171-4890-9a68-953ff7fb899e', 3, 'Faraday''s law');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0be7fbd5-1171-4890-9a68-953ff7fb899e', '7bf48f12-c125-46db-9df2-c1e83475209c', 'Both Coulomb''s law (F=kq1q2/r^2) and Newton''s law of gravitation (F=Gm1m2/r^2) follow the same inverse-square-law mathematical form.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('706e55d5-dfb5-4bd1-9d38-5f4d2817f536', '7984b7da-2946-453b-861a-b4c7b276643b', 15, 'The capacitance of a parallel plate capacitor is inversely proportional to the:', 'Physics', 'Electrostatic Potential and Capacitance', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd7791a1-26d5-4e28-b8e7-2ef5531dcfcf', '706e55d5-dfb5-4bd1-9d38-5f4d2817f536', 0, 'Area of the plates');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f163c04-47e6-461e-a447-8b8b3430255e', '706e55d5-dfb5-4bd1-9d38-5f4d2817f536', 1, 'Distance between the plates');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6af136b0-ff12-43a1-bb19-66d9846b0845', '706e55d5-dfb5-4bd1-9d38-5f4d2817f536', 2, 'Permittivity of the medium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68491849-e3b1-4610-8961-4b1860c26f72', '706e55d5-dfb5-4bd1-9d38-5f4d2817f536', 3, 'Charge on the plates');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('706e55d5-dfb5-4bd1-9d38-5f4d2817f536', '2f163c04-47e6-461e-a447-8b8b3430255e', 'C = epsilon0*A/d for a parallel plate capacitor; capacitance is inversely proportional to the plate separation d.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('030e84b9-f79c-4fb0-a7aa-3ee799812156', '7984b7da-2946-453b-861a-b4c7b276643b', 16, 'Ohm''s law is applicable to:', 'Physics', 'Current Electricity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8c184fc-f931-4445-811e-1ebc296223f1', '030e84b9-f79c-4fb0-a7aa-3ee799812156', 0, 'All electrical devices without exception');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44794a98-c735-46f0-9e5a-fc2f8a75a052', '030e84b9-f79c-4fb0-a7aa-3ee799812156', 1, 'Ohmic conductors only, under constant physical conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3aab48d6-c79a-49c2-bc7f-f4ecf84652b3', '030e84b9-f79c-4fb0-a7aa-3ee799812156', 2, 'Only semiconductors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6dd5c728-9c51-4b81-b69d-686060763f2f', '030e84b9-f79c-4fb0-a7aa-3ee799812156', 3, 'Only superconductors');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('030e84b9-f79c-4fb0-a7aa-3ee799812156', '44794a98-c735-46f0-9e5a-fc2f8a75a052', 'Ohm''s law (V=IR with constant R) applies specifically to ohmic conductors under constant physical conditions like temperature; many devices (diodes, transistors) are non-ohmic and do not obey it.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('622ba363-9b50-4772-99ee-b94f363ab7c1', '7984b7da-2946-453b-861a-b4c7b276643b', 17, 'A moving charge produces:', 'Physics', 'Moving Charges and Magnetism', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d41868f4-0221-4c2c-96f0-eb9e3a8968d5', '622ba363-9b50-4772-99ee-b94f363ab7c1', 0, 'An electric field only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10b42ff4-e18f-4175-b5e0-aa88c9261e36', '622ba363-9b50-4772-99ee-b94f363ab7c1', 1, 'A magnetic field only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8ef351f-80fe-4052-b1aa-df02bca9d0c7', '622ba363-9b50-4772-99ee-b94f363ab7c1', 2, 'Both electric and magnetic fields');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c164c64-5dfc-4bb2-a537-0e0e9a442698', '622ba363-9b50-4772-99ee-b94f363ab7c1', 3, 'Neither field');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('622ba363-9b50-4772-99ee-b94f363ab7c1', 'f8ef351f-80fe-4052-b1aa-df02bca9d0c7', 'A moving charge produces both an electric field (due to its charge) and a magnetic field (due to its motion/current).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('fa980b96-94e9-4816-9696-408674fe6767', '7984b7da-2946-453b-861a-b4c7b276643b', 18, 'A ferromagnetic material loses its ferromagnetism above its:', 'Physics', 'Magnetism and Matter', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f3755b87-c269-4b80-8a56-2f7392055c73', 'fa980b96-94e9-4816-9696-408674fe6767', 0, 'Melting point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a52ed78-3518-41ac-9576-4be434bbbdfc', 'fa980b96-94e9-4816-9696-408674fe6767', 1, 'Curie temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3557b802-b155-4c7d-b39a-7d48312abc22', 'fa980b96-94e9-4816-9696-408674fe6767', 2, 'Boiling point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b399f45c-8a99-4cad-9b63-f6df1845b527', 'fa980b96-94e9-4816-9696-408674fe6767', 3, 'Freezing point');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fa980b96-94e9-4816-9696-408674fe6767', '8a52ed78-3518-41ac-9576-4be434bbbdfc', 'Above the Curie temperature, thermal agitation disrupts magnetic domain alignment, and a ferromagnetic material transitions to paramagnetic behavior.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a62621f2-d314-4802-96a0-12cac128fd38', '7984b7da-2946-453b-861a-b4c7b276643b', 19, 'Lenz''s law is a statement of conservation of:', 'Physics', 'Electromagnetic Induction', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ba1a239-d763-4567-9d42-099f609b954f', 'a62621f2-d314-4802-96a0-12cac128fd38', 0, 'Charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('040f65d4-f019-428a-9686-3150ef42c740', 'a62621f2-d314-4802-96a0-12cac128fd38', 1, 'Energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90ed5286-b013-4ef0-85dc-db3fcd343a31', 'a62621f2-d314-4802-96a0-12cac128fd38', 2, 'Mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44ed5b54-a09d-4c59-986d-de77663a96b0', 'a62621f2-d314-4802-96a0-12cac128fd38', 3, 'Momentum only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a62621f2-d314-4802-96a0-12cac128fd38', '040f65d4-f019-428a-9686-3150ef42c740', 'Lenz''s law, which states that induced current opposes the change producing it, is a direct consequence of the law of conservation of energy.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('08b46df1-91fc-4a0c-bca0-340e295db1bf', '7984b7da-2946-453b-861a-b4c7b276643b', 20, 'The energy gap between the valence band and conduction band is largest for:', 'Physics', 'Semiconductor Electronics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6ef14cb-e179-4dd2-91ed-7a9b970a7e31', '08b46df1-91fc-4a0c-bca0-340e295db1bf', 0, 'Conductors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5af37d1-dd39-4997-a2b3-b7eaf3fb6fb3', '08b46df1-91fc-4a0c-bca0-340e295db1bf', 1, 'Semiconductors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c04133ad-643f-46a6-8299-bdb5ae9df4ea', '08b46df1-91fc-4a0c-bca0-340e295db1bf', 2, 'Insulators');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('566a79ae-135f-415f-a9b9-eeee9c4dd4a7', '08b46df1-91fc-4a0c-bca0-340e295db1bf', 3, 'Superconductors');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('08b46df1-91fc-4a0c-bca0-340e295db1bf', 'c04133ad-643f-46a6-8299-bdb5ae9df4ea', 'Insulators have the largest band gap, making it very difficult for electrons to be excited into the conduction band; semiconductors have a smaller gap, and conductors have overlapping or no gap.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b4ec4633-64b7-4b74-a687-1716012fedae', '7984b7da-2946-453b-861a-b4c7b276643b', 21, 'A body starts from rest and covers a distance of 100 m in 10 seconds with uniform acceleration. The acceleration (in m/s^2) is:', 'Physics', 'Kinematics — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('b4ec4633-64b7-4b74-a687-1716012fedae', 2, 's=ut+(1/2)at^2; 100=0+(1/2)a(100), so a=200/100=2 m/s^2.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('843ffa44-4509-4b60-bedb-153645da65db', '7984b7da-2946-453b-861a-b4c7b276643b', 22, 'A body of mass 2 kg moving with velocity 3 m/s has a kinetic energy (in joules) of:', 'Physics', 'Work, Energy and Power — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('843ffa44-4509-4b60-bedb-153645da65db', 9, 'KE = (1/2)mv^2 = (1/2)(2)(3^2) = (1/2)(2)(9) = 9 J.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('58de7e1a-12d0-4051-85a9-afe42e32355e', '7984b7da-2946-453b-861a-b4c7b276643b', 23, 'A resistor of 5 ohm carries a current of 4 A. The power dissipated (in watts) is:', 'Physics', 'Current Electricity — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('58de7e1a-12d0-4051-85a9-afe42e32355e', 80, 'P = I^2*R = (4^2)(5) = 16*5 = 80 W.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f4a77d84-2f0d-49c9-a61e-5495de9f0913', '7984b7da-2946-453b-861a-b4c7b276643b', 24, 'The amount of heat (in calories) required to raise the temperature of 200 g of water by 5 degrees Celsius (specific heat = 1 cal/g.C) is:', 'Physics', 'Thermal Properties of Matter — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('f4a77d84-2f0d-49c9-a61e-5495de9f0913', 1000, 'Q = mc*deltaT = 200*1*5 = 1000 calories.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7ccac682-c757-4585-86db-46b6af50c1cb', '7984b7da-2946-453b-861a-b4c7b276643b', 25, 'A simple pendulum has a time period of 2 seconds on Earth (g=10 m/s^2). Its length (in metres, rounded to nearest whole number using pi^2≈10) is:', 'Physics', 'Oscillations — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('7ccac682-c757-4585-86db-46b6af50c1cb', 1, 'T=2*pi*sqrt(L/g); T^2 = 4*pi^2*L/g; L = T^2*g/(4*pi^2) = 4*10/(4*10) = 1 m (using pi^2≈10).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Chemistry (25 questions) — Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('62cffc98-91ce-40f2-b592-70694a132f05', '7984b7da-2946-453b-861a-b4c7b276643b', 26, 'The number of significant figures in the measurement 0.00450 is:', 'Chemistry', 'Some Basic Concepts of Chemistry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9da0aa2e-b24a-41a1-ab5e-f527e99e4a47', '62cffc98-91ce-40f2-b592-70694a132f05', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('223675e9-785d-4f45-baf4-d3f29bc1a7c9', '62cffc98-91ce-40f2-b592-70694a132f05', 1, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e9af780-e640-4f81-bc0e-301d82f53c85', '62cffc98-91ce-40f2-b592-70694a132f05', 2, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f3e0d07-c8cc-40d9-a8d7-e0d4b8bc3a5a', '62cffc98-91ce-40f2-b592-70694a132f05', 3, '6');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('62cffc98-91ce-40f2-b592-70694a132f05', '223675e9-785d-4f45-baf4-d3f29bc1a7c9', 'Leading zeros are not significant; the digits 4, 5, 0 (the trailing zero after a decimal is significant) give 3 significant figures.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('798057a2-41ed-4634-96d5-6a94beabcbea', '7984b7da-2946-453b-861a-b4c7b276643b', 27, 'Isotopes of an element differ in their:', 'Chemistry', 'Structure of Atom', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b49aff54-88dc-4e95-b433-5c46febf5d24', '798057a2-41ed-4634-96d5-6a94beabcbea', 0, 'Number of protons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6324324e-5ca0-4488-9795-791663bbc4fc', '798057a2-41ed-4634-96d5-6a94beabcbea', 1, 'Number of neutrons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42a1ccdd-bf9a-4de1-a8c6-dd23e4a2ac06', '798057a2-41ed-4634-96d5-6a94beabcbea', 2, 'Number of electrons in a neutral atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('161c5d07-b24b-46c4-877c-d492361f2a3b', '798057a2-41ed-4634-96d5-6a94beabcbea', 3, 'Chemical properties fundamentally');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('798057a2-41ed-4634-96d5-6a94beabcbea', '6324324e-5ca0-4488-9795-791663bbc4fc', 'Isotopes share the same number of protons but differ in the number of neutrons, giving different mass numbers.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('1185afa3-6c09-4e7b-a100-2102abace1f9', '7984b7da-2946-453b-861a-b4c7b276643b', 28, 'Which of the following has the highest electronegativity?', 'Chemistry', 'Classification of Elements and Periodicity', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dedc7697-9e8e-4e47-b9a7-5a59bf596f49', '1185afa3-6c09-4e7b-a100-2102abace1f9', 0, 'Fluorine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d623d544-99cb-4354-b9a2-3de7a5d44d45', '1185afa3-6c09-4e7b-a100-2102abace1f9', 1, 'Chlorine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6caf623-2075-4ee6-bb19-a00566b8ccea', '1185afa3-6c09-4e7b-a100-2102abace1f9', 2, 'Oxygen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('548d5cfb-5f4d-46ed-a866-580f0ba6888f', '1185afa3-6c09-4e7b-a100-2102abace1f9', 3, 'Nitrogen');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1185afa3-6c09-4e7b-a100-2102abace1f9', 'dedc7697-9e8e-4e47-b9a7-5a59bf596f49', 'Fluorine has the highest electronegativity of all elements, per the Pauling scale.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('3d248ced-50dd-4824-9c3f-8ecf7b63b6ee', '7984b7da-2946-453b-861a-b4c7b276643b', 29, 'The bond order of the O2 molecule, per molecular orbital theory, is:', 'Chemistry', 'Chemical Bonding and Molecular Structure', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d139534e-59b5-44f6-89c3-0c9c49d47c10', '3d248ced-50dd-4824-9c3f-8ecf7b63b6ee', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2013120b-7e9b-4cf2-8ade-ce33c57a3ac9', '3d248ced-50dd-4824-9c3f-8ecf7b63b6ee', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f880364-da3f-4903-a327-9af3e20b2eb2', '3d248ced-50dd-4824-9c3f-8ecf7b63b6ee', 2, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95bd8f68-09ae-418d-b865-c9858c19959b', '3d248ced-50dd-4824-9c3f-8ecf7b63b6ee', 3, '0');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3d248ced-50dd-4824-9c3f-8ecf7b63b6ee', '2013120b-7e9b-4cf2-8ade-ce33c57a3ac9', 'Molecular orbital theory gives O2 a bond order of 2, consistent with its double-bond character and observed paramagnetism (due to two unpaired electrons in antibonding pi* orbitals).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f3e6dbeb-344d-46fe-a654-4001d14285d3', '7984b7da-2946-453b-861a-b4c7b276643b', 30, 'The ideal gas equation is given by:', 'Chemistry', 'States of Matter', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e9b4f54-bfc6-4d9b-a0c1-f88e261e0afc', 'f3e6dbeb-344d-46fe-a654-4001d14285d3', 0, 'PV = nRT');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd34c51d-9962-4473-bbe2-f4c2d8fae16f', 'f3e6dbeb-344d-46fe-a654-4001d14285d3', 1, 'PV = nR/T');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bba23c09-17d5-4fb5-8f09-8b583bf4251a', 'f3e6dbeb-344d-46fe-a654-4001d14285d3', 2, 'P/V = nRT');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12bda521-8c82-4f6c-8a2e-3dae359aba8e', 'f3e6dbeb-344d-46fe-a654-4001d14285d3', 3, 'PVT = nR');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f3e6dbeb-344d-46fe-a654-4001d14285d3', '4e9b4f54-bfc6-4d9b-a0c1-f88e261e0afc', 'The ideal gas equation is PV=nRT, relating pressure, volume, moles, and temperature via the gas constant R.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bf306801-e8df-444d-96c1-9b0f1b99f36c', '7984b7da-2946-453b-861a-b4c7b276643b', 31, 'A process occurring at constant pressure is called:', 'Chemistry', 'Thermodynamics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47518fa4-4299-41db-8b8c-dcc681e8385f', 'bf306801-e8df-444d-96c1-9b0f1b99f36c', 0, 'Isothermal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('162f4c71-e366-40b9-805c-fdc1fed003b2', 'bf306801-e8df-444d-96c1-9b0f1b99f36c', 1, 'Isobaric');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9461e79b-dbb9-43ad-a0aa-18d2011f1a73', 'bf306801-e8df-444d-96c1-9b0f1b99f36c', 2, 'Isochoric');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('241eb2b0-6503-4ba1-adae-85f24343fa7e', 'bf306801-e8df-444d-96c1-9b0f1b99f36c', 3, 'Adiabatic');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bf306801-e8df-444d-96c1-9b0f1b99f36c', '162f4c71-e366-40b9-805c-fdc1fed003b2', 'An isobaric process occurs at constant pressure, as distinguished from isothermal (constant T), isochoric (constant V), and adiabatic (no heat exchange) processes.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('408b2021-d14e-4170-84a8-d3d446c6a745', '7984b7da-2946-453b-861a-b4c7b276643b', 32, 'Le Chatelier''s principle states that if a system at equilibrium is subjected to a change, the equilibrium shifts to:', 'Chemistry', 'Equilibrium', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e9a6d90-6982-4e0b-b93d-d9998900120c', '408b2021-d14e-4170-84a8-d3d446c6a745', 0, 'Increase the disturbance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53ae119c-a422-46da-9c92-0776fdaa4f95', '408b2021-d14e-4170-84a8-d3d446c6a745', 1, 'Counteract the disturbance and restore a new equilibrium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e50a85e-a22b-4890-8f83-798fded4ba52', '408b2021-d14e-4170-84a8-d3d446c6a745', 2, 'Have no effect at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd342dd8-102f-402b-8dcb-96f5324c1fe6', '408b2021-d14e-4170-84a8-d3d446c6a745', 3, 'Completely stop the reaction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('408b2021-d14e-4170-84a8-d3d446c6a745', '53ae119c-a422-46da-9c92-0776fdaa4f95', 'Le Chatelier''s principle states that a system at equilibrium responds to an imposed change (in concentration, pressure, or temperature) by shifting in the direction that partially counteracts that change.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c6d16576-8157-4cf0-8168-84cc61ee6de6', '7984b7da-2946-453b-861a-b4c7b276643b', 33, 'In the reaction Zn + CuSO4 -> ZnSO4 + Cu, zinc acts as the:', 'Chemistry', 'Redox Reactions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f947f574-1b67-4ba6-8f43-2a051d6f387b', 'c6d16576-8157-4cf0-8168-84cc61ee6de6', 0, 'Oxidizing agent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60873048-3dae-4e99-8008-f469f8583fc4', 'c6d16576-8157-4cf0-8168-84cc61ee6de6', 1, 'Reducing agent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c72e55f-d44a-4d72-bd64-df9625fc81c2', 'c6d16576-8157-4cf0-8168-84cc61ee6de6', 2, 'Catalyst');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb12ae35-da36-461b-8040-ffad9e8e122f', 'c6d16576-8157-4cf0-8168-84cc61ee6de6', 3, 'Neither oxidizing nor reducing agent');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c6d16576-8157-4cf0-8168-84cc61ee6de6', '60873048-3dae-4e99-8008-f469f8583fc4', 'Zinc loses electrons (is oxidized) and thereby reduces Cu2+ to Cu, making zinc the reducing agent in this reaction.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('487d5894-f8a7-4e6f-ae93-3f108710e100', '7984b7da-2946-453b-861a-b4c7b276643b', 34, 'Sodium carbonate (Na2CO3) is commonly known as:', 'Chemistry', 's-Block Elements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0deec6ca-0f92-4c2b-a00f-cb91672a8c79', '487d5894-f8a7-4e6f-ae93-3f108710e100', 0, 'Baking soda');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('beb9206d-f8a1-4d43-9820-b4bdce7fb713', '487d5894-f8a7-4e6f-ae93-3f108710e100', 1, 'Washing soda');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09604664-de93-4ba2-a799-f6d52786fe10', '487d5894-f8a7-4e6f-ae93-3f108710e100', 2, 'Caustic soda');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee70fbea-c279-4f49-b1c4-ff298087d4ce', '487d5894-f8a7-4e6f-ae93-3f108710e100', 3, 'Slaked lime');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('487d5894-f8a7-4e6f-ae93-3f108710e100', 'beb9206d-f8a1-4d43-9820-b4bdce7fb713', 'Na2CO3 is commonly known as washing soda; baking soda is NaHCO3, and caustic soda is NaOH.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c5b24b02-e926-4ae5-ace6-074f28d6b323', '7984b7da-2946-453b-861a-b4c7b276643b', 35, 'The most abundant element in the Earth''s atmosphere by volume is:', 'Chemistry', 'p-Block Elements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7760aae9-46df-4867-814e-c1bd3f21785c', 'c5b24b02-e926-4ae5-ace6-074f28d6b323', 0, 'Oxygen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36214487-6e44-41c1-91b6-1a4976f3411b', 'c5b24b02-e926-4ae5-ace6-074f28d6b323', 1, 'Nitrogen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2b749bb-4899-4a90-a73a-07ffe45e0629', 'c5b24b02-e926-4ae5-ace6-074f28d6b323', 2, 'Carbon dioxide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5979123f-95eb-4c1a-8b3b-22cbe25982d2', 'c5b24b02-e926-4ae5-ace6-074f28d6b323', 3, 'Argon');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c5b24b02-e926-4ae5-ace6-074f28d6b323', '36214487-6e44-41c1-91b6-1a4976f3411b', 'Nitrogen makes up approximately 78% of the Earth''s atmosphere by volume, the most abundant atmospheric gas.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a5518ce0-1ca9-43ca-a9e6-8c43765af233', '7984b7da-2946-453b-861a-b4c7b276643b', 36, 'The general formula of an alkane is:', 'Chemistry', 'Organic Chemistry — Basic Principles', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8269d3c1-f743-4108-8d6c-474cdcec37e8', 'a5518ce0-1ca9-43ca-a9e6-8c43765af233', 0, 'CnH2n');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a0c27e7-9398-45b8-910f-cd5c6379c8be', 'a5518ce0-1ca9-43ca-a9e6-8c43765af233', 1, 'CnH2n+2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee2d8b96-921f-4b78-85a7-48f5a882283a', 'a5518ce0-1ca9-43ca-a9e6-8c43765af233', 2, 'CnH2n-2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e857865d-01f7-46d0-b049-5c1fd0ddc2de', 'a5518ce0-1ca9-43ca-a9e6-8c43765af233', 3, 'CnHn');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a5518ce0-1ca9-43ca-a9e6-8c43765af233', '0a0c27e7-9398-45b8-910f-cd5c6379c8be', 'Alkanes (saturated hydrocarbons) follow the general formula CnH2n+2.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('78492c1c-b418-414d-9b17-685335da277d', '7984b7da-2946-453b-861a-b4c7b276643b', 37, 'Benzene (C6H6) is an example of a(n):', 'Chemistry', 'Hydrocarbons', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd766c3d-c248-41e4-ba76-5f3bf5c04a5b', '78492c1c-b418-414d-9b17-685335da277d', 0, 'Saturated hydrocarbon');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f47870e-f1de-4f55-aa52-f28f6d474a3a', '78492c1c-b418-414d-9b17-685335da277d', 1, 'Aromatic hydrocarbon');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('200654bf-e09d-4a7c-9b03-3692ff365f23', '78492c1c-b418-414d-9b17-685335da277d', 2, 'Alkene');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('023017e9-7429-4625-b49e-e54ee008d19e', '78492c1c-b418-414d-9b17-685335da277d', 3, 'Alkyne');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('78492c1c-b418-414d-9b17-685335da277d', '2f47870e-f1de-4f55-aa52-f28f6d474a3a', 'Benzene is the simplest aromatic hydrocarbon, characterized by a cyclic, planar, conjugated ring with delocalized pi electrons obeying Huckel''s rule.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('862b79cb-a68b-4bc1-9c02-debd803488ef', '7984b7da-2946-453b-861a-b4c7b276643b', 38, 'The layer of the atmosphere that contains the ozone layer, which protects Earth from harmful UV radiation, is the:', 'Chemistry', 'Environmental Chemistry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca5b2b4e-5a9d-4737-abe9-2b2df94e0d6d', '862b79cb-a68b-4bc1-9c02-debd803488ef', 0, 'Troposphere');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c7f69a1-5374-43bc-84d3-0abacc597ec3', '862b79cb-a68b-4bc1-9c02-debd803488ef', 1, 'Stratosphere');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4a44bd8-8e7f-43b6-bada-b131b6b8068d', '862b79cb-a68b-4bc1-9c02-debd803488ef', 2, 'Mesosphere');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65cc0c1d-7544-4193-8638-6a8bd2ef090e', '862b79cb-a68b-4bc1-9c02-debd803488ef', 3, 'Thermosphere');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('862b79cb-a68b-4bc1-9c02-debd803488ef', '3c7f69a1-5374-43bc-84d3-0abacc597ec3', 'The ozone layer is located in the stratosphere, roughly 15-35 km above Earth''s surface, where it absorbs most of the Sun''s harmful UV radiation.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('d590cf78-17bd-4a30-93d3-f48f2eefb3f0', '7984b7da-2946-453b-861a-b4c7b276643b', 39, 'Ionic solids are generally characterized by:', 'Chemistry', 'Solid State', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ef6a0e0-d913-4894-92ec-0a59e58eb676', 'd590cf78-17bd-4a30-93d3-f48f2eefb3f0', 0, 'Low melting points and good electrical conductivity in solid state');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48190ae4-b325-429d-9c73-0b3ab957d799', 'd590cf78-17bd-4a30-93d3-f48f2eefb3f0', 1, 'High melting points and electrical conductivity only when molten or dissolved');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a53ba973-802c-4d07-b1a1-e1364cededa7', 'd590cf78-17bd-4a30-93d3-f48f2eefb3f0', 2, 'Softness and low melting points');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1324df2-d801-4a2d-8066-8b540d52ac3d', 'd590cf78-17bd-4a30-93d3-f48f2eefb3f0', 3, 'Good electrical conductivity in solid state only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d590cf78-17bd-4a30-93d3-f48f2eefb3f0', '48190ae4-b325-429d-9c73-0b3ab957d799', 'Ionic solids have high melting points (due to strong electrostatic lattice forces) and conduct electricity only when the ions are mobile — i.e., when molten or dissolved in a suitable solvent, not in the rigid solid state.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('46022c2d-bcea-4012-b5a6-2b93a93f208e', '7984b7da-2946-453b-861a-b4c7b276643b', 40, 'The colligative property used to determine the molar mass of a polymer (which has a very high molar mass) is most suitably:', 'Chemistry', 'Solutions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce92884a-c009-4fe1-bfb9-66cacea33a4e', '46022c2d-bcea-4012-b5a6-2b93a93f208e', 0, 'Relative lowering of vapor pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('987e086f-99e9-45a8-96fc-27a6b1bdda1d', '46022c2d-bcea-4012-b5a6-2b93a93f208e', 1, 'Osmotic pressure, since it produces a measurable effect even at very low, non-degrading concentrations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6efe693e-c5cb-4325-aedb-7eba82e8821d', '46022c2d-bcea-4012-b5a6-2b93a93f208e', 2, 'Boiling point elevation, since it is unaffected by molar mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5145a907-acb5-4ef8-ac83-fe6ed2be17aa', '46022c2d-bcea-4012-b5a6-2b93a93f208e', 3, 'Freezing point depression exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('46022c2d-bcea-4012-b5a6-2b93a93f208e', '987e086f-99e9-45a8-96fc-27a6b1bdda1d', 'Osmotic pressure is particularly sensitive and measurable even at the very low concentrations required for large, fragile molecules like polymers, making it the preferred colligative property for determining their molar mass.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2d969184-1476-4597-97eb-ff8a3a2920ed', '7984b7da-2946-453b-861a-b4c7b276643b', 41, 'A device that converts chemical energy directly into electrical energy through a spontaneous redox reaction is called a:', 'Chemistry', 'Electrochemistry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd3997d7-2b9c-4ef0-98e4-271ee876f981', '2d969184-1476-4597-97eb-ff8a3a2920ed', 0, 'Electrolytic cell');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b34dd90-55ae-46ef-b439-188d59544100', '2d969184-1476-4597-97eb-ff8a3a2920ed', 1, 'Galvanic (voltaic) cell');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2dd89799-d898-43e1-b78d-8b43712fecce', '2d969184-1476-4597-97eb-ff8a3a2920ed', 2, 'Capacitor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d952db8-e470-4013-a59a-7f8e2ecd19ad', '2d969184-1476-4597-97eb-ff8a3a2920ed', 3, 'Transformer');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2d969184-1476-4597-97eb-ff8a3a2920ed', '4b34dd90-55ae-46ef-b439-188d59544100', 'A galvanic (voltaic) cell converts the chemical energy of a spontaneous redox reaction directly into electrical energy; an electrolytic cell does the reverse, using electrical energy to drive a non-spontaneous reaction.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c9af2fb6-99d2-42af-865e-7af8033708dc', '7984b7da-2946-453b-861a-b4c7b276643b', 42, 'The molecularity of an elementary reaction refers to:', 'Chemistry', 'Chemical Kinetics', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23c9ceb1-029d-4692-a9bf-338db4228efc', 'c9af2fb6-99d2-42af-865e-7af8033708dc', 0, 'The experimentally determined order of the reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c050b27b-7f58-4359-a984-4776d9a21538', 'c9af2fb6-99d2-42af-865e-7af8033708dc', 1, 'The number of reactant molecules taking part in a single elementary step');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0fcb7423-bd69-45ff-b6b1-b9e11dc5943b', 'c9af2fb6-99d2-42af-865e-7af8033708dc', 2, 'The rate constant of the reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94d8c8b4-5d9c-47cc-b9b9-f834ab91c986', 'c9af2fb6-99d2-42af-865e-7af8033708dc', 3, 'The activation energy of the reaction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c9af2fb6-99d2-42af-865e-7af8033708dc', 'c050b27b-7f58-4359-a984-4776d9a21538', 'Molecularity is a theoretical concept referring to the number of reacting molecular species (atoms, ions, or molecules) that collide simultaneously in a single elementary reaction step — unlike order, which is always experimentally determined.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2aaf462e-606e-43c3-813d-869513ed142a', '7984b7da-2946-453b-861a-b4c7b276643b', 43, 'Transition metals commonly form colored compounds due to:', 'Chemistry', 'd and f Block Elements', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c07fa1c-10ed-47b7-bd0c-9453ae2de176', '2aaf462e-606e-43c3-813d-869513ed142a', 0, 'Their high density');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d46e2e0d-f32c-4fcb-b3b2-d70860f0752c', '2aaf462e-606e-43c3-813d-869513ed142a', 1, 'd-d electronic transitions absorbing specific wavelengths of visible light');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45d055d9-36c9-42f2-b235-ce2eb97167e9', '2aaf462e-606e-43c3-813d-869513ed142a', 2, 'Their high melting points');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64aa366f-e02e-4a41-a510-9aba2086d6af', '2aaf462e-606e-43c3-813d-869513ed142a', 3, 'Their magnetic properties alone');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2aaf462e-606e-43c3-813d-869513ed142a', 'd46e2e0d-f32c-4fcb-b3b2-d70860f0752c', 'Colored transition-metal compounds typically arise from d-d electronic transitions, where absorption of specific visible-light wavelengths (promoting electrons between split d-orbital levels) leaves a complementary color to be observed.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('47c83329-6341-4d60-88d3-fd7f3b5ecda8', '7984b7da-2946-453b-861a-b4c7b276643b', 44, 'The SN1 reaction mechanism is favored by:', 'Chemistry', 'Haloalkanes and Haloarenes', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a65e20d-d991-4aa4-914b-3e7ad202be7d', '47c83329-6341-4d60-88d3-fd7f3b5ecda8', 0, 'Primary alkyl halides and strong nucleophiles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9491d191-1de6-4dcd-87f2-bb01b37aaa5e', '47c83329-6341-4d60-88d3-fd7f3b5ecda8', 1, 'Tertiary alkyl halides, due to the greater stability of the resulting carbocation intermediate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59aea2e6-c0af-468e-9edc-3ad77cd038da', '47c83329-6341-4d60-88d3-fd7f3b5ecda8', 2, 'Only methyl halides');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3990ecb-e252-49ea-a0bd-26d8ae452c85', '47c83329-6341-4d60-88d3-fd7f3b5ecda8', 3, 'Only aryl halides');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('47c83329-6341-4d60-88d3-fd7f3b5ecda8', '9491d191-1de6-4dcd-87f2-bb01b37aaa5e', 'SN1 reactions proceed via a carbocation intermediate; tertiary alkyl halides favor SN1 because the resulting tertiary carbocation is significantly more stable than primary or secondary carbocations.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('614a8108-b09a-45f6-b7fd-8a2d20d813df', '7984b7da-2946-453b-861a-b4c7b276643b', 45, 'The reaction of a primary amine with nitrous acid (HNO2) at low temperature, in the case of aromatic primary amines, produces a:', 'Chemistry', 'Amines', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('402f4954-29f5-4859-a2c7-7bc08dd489ff', '614a8108-b09a-45f6-b7fd-8a2d20d813df', 0, 'Diazonium salt');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ddf168c6-291e-4582-a6a7-53e9e41135de', '614a8108-b09a-45f6-b7fd-8a2d20d813df', 1, 'Secondary amine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36548a20-772b-494f-b058-33822d5b6431', '614a8108-b09a-45f6-b7fd-8a2d20d813df', 2, 'Nitro compound');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c78be3c3-87ee-4636-9957-86f64a6df8d6', '614a8108-b09a-45f6-b7fd-8a2d20d813df', 3, 'Alcohol directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('614a8108-b09a-45f6-b7fd-8a2d20d813df', '402f4954-29f5-4859-a2c7-7bc08dd489ff', 'Aromatic primary amines react with nitrous acid at low temperature (0-5 degrees C) to form a relatively stable diazonium salt, an important synthetic intermediate.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('0bc9c801-adfd-4be4-9e34-78377000f6c2', '7984b7da-2946-453b-861a-b4c7b276643b', 46, 'The number of atoms present in 2 moles of oxygen gas (O2) is closest to (in units of 10^23, using Avogadro''s number ≈ 6.022*10^23), expressed as a numeric multiple:', 'Chemistry', 'Some Basic Concepts of Chemistry — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('0bc9c801-adfd-4be4-9e34-78377000f6c2', 24.088, '2 moles of O2 = 4 moles of oxygen atoms; 4 * 6.022*10^23 = 24.088*10^23 atoms, so the numeric multiple is 24.088.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b75153d2-3c30-4a63-b359-87461b894166', '7984b7da-2946-453b-861a-b4c7b276643b', 47, 'For a reaction with Kc = 100 at a given temperature, if the reaction quotient Qc = 10, the reaction will proceed in the forward direction. What is the value of Kc/Qc?', 'Chemistry', 'Equilibrium — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('b75153d2-3c30-4a63-b359-87461b894166', 10, 'Kc/Qc = 100/10 = 10; since Qc < Kc, the reaction proceeds forward to reach equilibrium.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('5cf45617-8977-4c43-b3bb-61fca960a691', '7984b7da-2946-453b-861a-b4c7b276643b', 48, 'The standard enthalpy of formation of an element in its most stable state is, by convention, equal to (in kJ/mol):', 'Chemistry', 'Thermodynamics — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('5cf45617-8977-4c43-b3bb-61fca960a691', 0, 'By convention, the standard enthalpy of formation of any element in its most stable state under standard conditions is defined as zero.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6bbee977-ce3f-4023-a17c-08e17b516253', '7984b7da-2946-453b-861a-b4c7b276643b', 49, 'For a zero-order reaction, if the rate constant k = 0.05 mol/(L.s), the rate of the reaction (in mol/(L.s)) is:', 'Chemistry', 'Chemical Kinetics — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('6bbee977-ce3f-4023-a17c-08e17b516253', 0.05, 'For a zero-order reaction, rate = k[A]^0 = k, independent of concentration; so the rate equals the rate constant, 0.05 mol/(L.s).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('7964c6d8-9220-4759-ace3-b8bbeac5ecd2', '7984b7da-2946-453b-861a-b4c7b276643b', 50, 'A solution has a mole fraction of solute equal to 0.2. The mole fraction of the solvent is:', 'Chemistry', 'Solutions — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('7964c6d8-9220-4759-ace3-b8bbeac5ecd2', 0.8, 'Since mole fractions of all components sum to 1, mole fraction of solvent = 1 - 0.2 = 0.8.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Mathematics (25 questions) — Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('18fdd47b-64a0-4429-a6e5-b6dce1716f00', '7984b7da-2946-453b-861a-b4c7b276643b', 51, 'If A = {1,2,3,4} and B = {2,4,6}, then A intersection B is:', 'Mathematics', 'Sets, Relations and Functions', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a43ec47-ee99-403a-91a2-091eab80ab2b', '18fdd47b-64a0-4429-a6e5-b6dce1716f00', 0, '{2,4}');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f9109ba-6d53-417d-a390-099dc48372f5', '18fdd47b-64a0-4429-a6e5-b6dce1716f00', 1, '{1,2,3,4,6}');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c89a679-d3ff-461e-8703-ead88c33a3eb', '18fdd47b-64a0-4429-a6e5-b6dce1716f00', 2, '{1,3}');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('259f892b-6469-4909-b799-d5cc3e2281b4', '18fdd47b-64a0-4429-a6e5-b6dce1716f00', 3, '{6}');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('18fdd47b-64a0-4429-a6e5-b6dce1716f00', '3a43ec47-ee99-403a-91a2-091eab80ab2b', 'The intersection contains elements common to both sets: {2,4}.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8233cac8-754e-4d08-8ee0-bf372dcdec48', '7984b7da-2946-453b-861a-b4c7b276643b', 52, 'The conjugate of the complex number z = 5 - 3i is:', 'Mathematics', 'Complex Numbers', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2c9876d-3e9c-420e-a489-49b1f17b4111', '8233cac8-754e-4d08-8ee0-bf372dcdec48', 0, '5+3i');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85aea59d-f28a-47ce-9dd5-13c266cd2367', '8233cac8-754e-4d08-8ee0-bf372dcdec48', 1, '-5-3i');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3322e3a1-795d-4564-930e-b89fbe7a17a2', '8233cac8-754e-4d08-8ee0-bf372dcdec48', 2, '-5+3i');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c84f8ef-cbfb-4577-a607-424c96685c83', '8233cac8-754e-4d08-8ee0-bf372dcdec48', 3, '3-5i');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8233cac8-754e-4d08-8ee0-bf372dcdec48', 'f2c9876d-3e9c-420e-a489-49b1f17b4111', 'The conjugate of a+bi is a-bi; for z=5-3i, the conjugate is 5+3i.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a4715819-3946-4d98-b044-f034ce540a18', '7984b7da-2946-453b-861a-b4c7b276643b', 53, 'The discriminant of the quadratic equation x^2 + 4x + 4 = 0 is:', 'Mathematics', 'Quadratic Equations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9989f615-d73a-4486-a6ca-27634631a6eb', 'a4715819-3946-4d98-b044-f034ce540a18', 0, '0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38dc92db-bd47-40eb-8a9f-a0a24a7d83c7', 'a4715819-3946-4d98-b044-f034ce540a18', 1, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fced7731-99fd-41d6-b70a-1289a51cb37d', 'a4715819-3946-4d98-b044-f034ce540a18', 2, '16');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5889707-e5df-41c5-bf21-68a78ee5255b', 'a4715819-3946-4d98-b044-f034ce540a18', 3, '-16');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a4715819-3946-4d98-b044-f034ce540a18', '9989f615-d73a-4486-a6ca-27634631a6eb', 'Discriminant = b^2-4ac = 16 - 4(1)(4) = 16-16 = 0, indicating equal (repeated) real roots.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e0bb3257-3813-417a-9d77-58852ab5f426', '7984b7da-2946-453b-861a-b4c7b276643b', 54, 'The number of ways to arrange the letters of the word ''LEVEL'' (with repeated letters) is:', 'Mathematics', 'Permutations and Combinations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe1f7c1d-1191-46ff-a7d3-fbe2b310254c', 'e0bb3257-3813-417a-9d77-58852ab5f426', 0, '30');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dffcd933-1591-4b02-b14f-dd2b6adda60e', 'e0bb3257-3813-417a-9d77-58852ab5f426', 1, '60');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b4a43dad-2c31-4ece-a949-7c7e79952cbe', 'e0bb3257-3813-417a-9d77-58852ab5f426', 2, '120');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50b4ab17-3634-44da-882d-cc282dfe8592', 'e0bb3257-3813-417a-9d77-58852ab5f426', 3, '20');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e0bb3257-3813-417a-9d77-58852ab5f426', 'fe1f7c1d-1191-46ff-a7d3-fbe2b310254c', 'LEVEL has 5 letters with L repeated twice and E repeated twice; number of arrangements = 5!/(2!2!) = 120/4 = 30.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('29a1577b-62d3-4ca3-948e-5e012acd0dc7', '7984b7da-2946-453b-861a-b4c7b276643b', 55, 'The middle term in the expansion of (x+y)^4 is the:', 'Mathematics', 'Binomial Theorem', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5bd0041-0c8a-4a53-a4e3-041d7b580310', '29a1577b-62d3-4ca3-948e-5e012acd0dc7', 0, '1st term');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93c65291-1a95-4c9e-9018-f251c4f376d0', '29a1577b-62d3-4ca3-948e-5e012acd0dc7', 1, '2nd term');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da568715-eb36-4da8-b6c4-a7a69bf9ac48', '29a1577b-62d3-4ca3-948e-5e012acd0dc7', 2, '3rd term');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dcf55d49-60f9-4d9e-bc6e-0eafa92c6710', '29a1577b-62d3-4ca3-948e-5e012acd0dc7', 3, '5th term');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('29a1577b-62d3-4ca3-948e-5e012acd0dc7', 'da568715-eb36-4da8-b6c4-a7a69bf9ac48', 'For (x+y)^n with n even, there are n+1=5 terms, and the middle term is the ((n/2)+1)th = 3rd term.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('bc1be54f-5750-45f3-9dcd-d4837f6d94c8', '7984b7da-2946-453b-861a-b4c7b276643b', 56, 'If the nth term of a sequence is given by a_n = 3n+2, the 5th term is:', 'Mathematics', 'Sequences and Series', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4d46020-46db-4d74-bb1b-eb53492ed567', 'bc1be54f-5750-45f3-9dcd-d4837f6d94c8', 0, '15');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ffbdf1d-3208-4232-b28b-aebe5dddaacd', 'bc1be54f-5750-45f3-9dcd-d4837f6d94c8', 1, '17');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('019c130c-aeaf-4c0b-ab61-b5b6685b46e7', 'bc1be54f-5750-45f3-9dcd-d4837f6d94c8', 2, '13');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('efbee9c7-3809-4037-ac5d-1c90d8618984', 'bc1be54f-5750-45f3-9dcd-d4837f6d94c8', 3, '20');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bc1be54f-5750-45f3-9dcd-d4837f6d94c8', '1ffbdf1d-3208-4232-b28b-aebe5dddaacd', 'a_5 = 3(5)+2 = 15+2 = 17.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c7f774ed-ddfa-457f-8889-f47c49e4a306', '7984b7da-2946-453b-861a-b4c7b276643b', 57, 'A function f(x) is said to be continuous at x=a if:', 'Mathematics', 'Limits, Continuity and Differentiability', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c67c32ff-39c7-4e7b-b20f-6e495e9f22fc', 'c7f774ed-ddfa-457f-8889-f47c49e4a306', 0, 'f(a) is defined only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c601cdd-fdb5-4e5b-95b3-f5d84820bd57', 'c7f774ed-ddfa-457f-8889-f47c49e4a306', 1, 'The limit of f(x) as x approaches a equals f(a)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('209f5b59-17a5-42d9-ad69-8bb2a6cd15af', 'c7f774ed-ddfa-457f-8889-f47c49e4a306', 2, 'f(x) is differentiable at x=a');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2831861f-b0ca-473a-9454-0ad0f92cf6b3', 'c7f774ed-ddfa-457f-8889-f47c49e4a306', 3, 'f(x) is a polynomial');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c7f774ed-ddfa-457f-8889-f47c49e4a306', '9c601cdd-fdb5-4e5b-95b3-f5d84820bd57', 'Continuity at x=a requires that the limit of f(x) as x approaches a exists and equals f(a).', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('8373afd9-75be-4620-bd63-df5ce64f0169', '7984b7da-2946-453b-861a-b4c7b276643b', 58, 'The integral of e^x dx is:', 'Mathematics', 'Integral Calculus', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18a774c9-73d3-4112-a9bb-224deb5486af', '8373afd9-75be-4620-bd63-df5ce64f0169', 0, 'e^x + C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ce06fe8-0e79-4818-a2db-58f5ca65e4ac', '8373afd9-75be-4620-bd63-df5ce64f0169', 1, 'x*e^x + C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('101b413a-dbbc-4b95-a806-45cec2b6f1b1', '8373afd9-75be-4620-bd63-df5ce64f0169', 2, 'e^x/x + C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39009d5e-78e5-41e9-b0ae-ec047b1863bb', '8373afd9-75be-4620-bd63-df5ce64f0169', 3, 'ln(x) + C');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8373afd9-75be-4620-bd63-df5ce64f0169', '18a774c9-73d3-4112-a9bb-224deb5486af', 'The exponential function e^x is its own antiderivative: integral of e^x dx = e^x + C.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('55f9f284-c42d-4c82-8e2a-652326c2e379', '7984b7da-2946-453b-861a-b4c7b276643b', 59, 'The degree of the differential equation (dy/dx)^2 + y = x is:', 'Mathematics', 'Differential Equations', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f25c6f8c-ef26-4292-8691-9b7dd9344846', '55f9f284-c42d-4c82-8e2a-652326c2e379', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7117c8bc-472f-45a5-8d32-542844f45278', '55f9f284-c42d-4c82-8e2a-652326c2e379', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a29278d7-447b-4650-b13f-0b26889596c8', '55f9f284-c42d-4c82-8e2a-652326c2e379', 2, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fcbd2c98-12bc-4692-b429-4aaaab4e785a', '55f9f284-c42d-4c82-8e2a-652326c2e379', 3, '0');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('55f9f284-c42d-4c82-8e2a-652326c2e379', '7117c8bc-472f-45a5-8d32-542844f45278', 'The degree is the power of the highest-order derivative present, once the equation is a polynomial in derivatives; here (dy/dx) is raised to the power 2, giving degree 2.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('31afae17-7ba5-4bf7-b032-57249c30fdde', '7984b7da-2946-453b-861a-b4c7b276643b', 60, 'Two lines with slopes m1=2 and m2=-1/2 are:', 'Mathematics', 'Coordinate Geometry — Straight Lines', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6260e778-b5b9-4464-b72b-44cf95de9e47', '31afae17-7ba5-4bf7-b032-57249c30fdde', 0, 'Parallel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a43a238-e4be-4465-a83e-e09e896f428c', '31afae17-7ba5-4bf7-b032-57249c30fdde', 1, 'Perpendicular');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9cd243ca-614b-4339-9746-dc535d58f6fd', '31afae17-7ba5-4bf7-b032-57249c30fdde', 2, 'Coincident');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b9bfa5e-6cda-4816-b51e-61ba89c6b110', '31afae17-7ba5-4bf7-b032-57249c30fdde', 3, 'Intersecting at the origin only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('31afae17-7ba5-4bf7-b032-57249c30fdde', '2a43a238-e4be-4465-a83e-e09e896f428c', 'Two lines are perpendicular if the product of their slopes equals -1; here m1*m2 = 2*(-1/2) = -1, confirming perpendicularity.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('db57d88b-e992-455e-86eb-456d55d0322b', '7984b7da-2946-453b-861a-b4c7b276643b', 61, 'The centre of the circle (x-2)^2 + (y+3)^2 = 16 is:', 'Mathematics', 'Coordinate Geometry — Circles', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05cfca40-eff7-438a-add3-29722cd37720', 'db57d88b-e992-455e-86eb-456d55d0322b', 0, '(2,-3)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ad7ea4d-88ac-47e9-8a49-add1cfbcfde9', 'db57d88b-e992-455e-86eb-456d55d0322b', 1, '(-2,3)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12717d5e-8d7c-4987-9432-a16285583a10', 'db57d88b-e992-455e-86eb-456d55d0322b', 2, '(2,3)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('236be3c8-7af5-4b61-bb2b-49319281f6f4', 'db57d88b-e992-455e-86eb-456d55d0322b', 3, '(-2,-3)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('db57d88b-e992-455e-86eb-456d55d0322b', '05cfca40-eff7-438a-add3-29722cd37720', 'For the standard form (x-h)^2+(y-k)^2=r^2, the centre is (h,k); here h=2, k=-3, giving centre (2,-3).', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b4d1e56b-49f3-46fc-a964-c18a78989528', '7984b7da-2946-453b-861a-b4c7b276643b', 62, 'For the hyperbola x^2/9 - y^2/16 = 1, the value of a^2 is:', 'Mathematics', 'Conic Sections — Hyperbola', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('741b0d93-7f10-4bb5-a917-8451964130b8', 'b4d1e56b-49f3-46fc-a964-c18a78989528', 0, '9');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab3f1015-8ee7-4d9d-9dc0-13b7b5055c02', 'b4d1e56b-49f3-46fc-a964-c18a78989528', 1, '16');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e161b265-c380-4fb5-8670-c91dd4fd345a', 'b4d1e56b-49f3-46fc-a964-c18a78989528', 2, '25');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7470669a-62ef-4bda-b068-52cfb57599f9', 'b4d1e56b-49f3-46fc-a964-c18a78989528', 3, '7');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b4d1e56b-49f3-46fc-a964-c18a78989528', '741b0d93-7f10-4bb5-a917-8451964130b8', 'Comparing with the standard form x^2/a^2 - y^2/b^2 = 1, a^2 = 9.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('91329638-da6e-4253-9bf2-27e231cfb376', '7984b7da-2946-453b-861a-b4c7b276643b', 63, 'The equation of the xy-plane in three-dimensional coordinate geometry is:', 'Mathematics', '3D Geometry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b20b8656-5218-4932-bc43-5ef0d7d1fa93', '91329638-da6e-4253-9bf2-27e231cfb376', 0, 'x=0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('547a46dd-4eb6-4010-b71f-11ce5c327033', '91329638-da6e-4253-9bf2-27e231cfb376', 1, 'y=0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d24c33c8-dca9-45ce-9925-6597fd716f3d', '91329638-da6e-4253-9bf2-27e231cfb376', 2, 'z=0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98f112ee-8c73-491f-9819-26e5e89603ae', '91329638-da6e-4253-9bf2-27e231cfb376', 3, 'x=y=z');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('91329638-da6e-4253-9bf2-27e231cfb376', 'd24c33c8-dca9-45ce-9925-6597fd716f3d', 'The xy-plane consists of all points where the z-coordinate is zero, so its equation is z=0.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c64f582b-cc09-40aa-aff0-087bdd106a3c', '7984b7da-2946-453b-861a-b4c7b276643b', 64, 'Two vectors are said to be orthogonal (perpendicular) if their dot product is:', 'Mathematics', 'Vector Algebra', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2901ddbb-804f-4d84-89c0-78c26598b079', 'c64f582b-cc09-40aa-aff0-087bdd106a3c', 0, 'Maximum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c152511-4b37-4038-9255-af85408c8869', 'c64f582b-cc09-40aa-aff0-087bdd106a3c', 1, 'Zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('937c8af1-3df4-4423-a67a-3a44d33614d4', 'c64f582b-cc09-40aa-aff0-087bdd106a3c', 2, 'Equal to the product of their magnitudes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63643a7b-4149-4fa9-95d2-9d260459e408', 'c64f582b-cc09-40aa-aff0-087bdd106a3c', 3, 'Negative');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c64f582b-cc09-40aa-aff0-087bdd106a3c', '2c152511-4b37-4038-9255-af85408c8869', 'Two vectors are orthogonal when the angle between them is 90 degrees, making cos(90)=0 and hence their dot product zero.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('32dbe91e-fe24-44b9-9d63-70f294976b4f', '7984b7da-2946-453b-861a-b4c7b276643b', 65, 'If two events A and B are mutually exclusive, then P(A union B) equals:', 'Mathematics', 'Statistics and Probability', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7cc23e1-77d6-4a02-9ef6-b56895c57976', '32dbe91e-fe24-44b9-9d63-70f294976b4f', 0, 'P(A) * P(B)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('831be597-9c45-48ef-936c-f642c363b4ed', '32dbe91e-fe24-44b9-9d63-70f294976b4f', 1, 'P(A) + P(B)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7710b768-bb8f-4ee7-93a8-8d5656461afb', '32dbe91e-fe24-44b9-9d63-70f294976b4f', 2, 'P(A) - P(B)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec91ca7d-8553-4726-bbf9-5aff46360e94', '32dbe91e-fe24-44b9-9d63-70f294976b4f', 3, 'P(A)/P(B)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('32dbe91e-fe24-44b9-9d63-70f294976b4f', '831be597-9c45-48ef-936c-f642c363b4ed', 'For mutually exclusive events (which cannot occur simultaneously, so P(A intersection B)=0), P(A union B) = P(A) + P(B).', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('e24508f4-e49e-4404-b7cc-6893c3efb45d', '7984b7da-2946-453b-861a-b4c7b276643b', 66, 'The value of tan(0 degrees) is:', 'Mathematics', 'Trigonometry', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be42f9dc-ecba-4abb-bf18-538f8be34a8c', 'e24508f4-e49e-4404-b7cc-6893c3efb45d', 0, '0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f77e09d-84e4-4aa3-9f04-8a95b0bc50e3', 'e24508f4-e49e-4404-b7cc-6893c3efb45d', 1, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b236d1b9-eb3e-4a04-a532-0e9210107fdb', 'e24508f4-e49e-4404-b7cc-6893c3efb45d', 2, 'Undefined');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd97c99c-4e9e-4c62-b16c-a3bc4b24d8bb', 'e24508f4-e49e-4404-b7cc-6893c3efb45d', 3, '-1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e24508f4-e49e-4404-b7cc-6893c3efb45d', 'be42f9dc-ecba-4abb-bf18-538f8be34a8c', 'tan(0 degrees) = sin(0)/cos(0) = 0/1 = 0.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a26a4de8-c14c-4838-b0bd-11b1a147610f', '7984b7da-2946-453b-861a-b4c7b276643b', 67, 'A square matrix A is said to be singular if:', 'Mathematics', 'Matrices and Determinants', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de00675c-e1e5-4ecc-b79c-6316009efece', 'a26a4de8-c14c-4838-b0bd-11b1a147610f', 0, 'det(A) = 0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e27564a-34cb-4533-bdfb-7fb65373d208', 'a26a4de8-c14c-4838-b0bd-11b1a147610f', 1, 'det(A) = 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63594015-32e7-452c-b90b-41b5fdd06835', 'a26a4de8-c14c-4838-b0bd-11b1a147610f', 2, 'A is a diagonal matrix');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89ff6ee6-cf71-42c6-a427-2f0daf389380', 'a26a4de8-c14c-4838-b0bd-11b1a147610f', 3, 'A is symmetric');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a26a4de8-c14c-4838-b0bd-11b1a147610f', 'de00675c-e1e5-4ecc-b79c-6316009efece', 'A square matrix is singular (non-invertible) precisely when its determinant is zero.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('c72bd0d6-f40f-49ee-95dc-12d494bf58eb', '7984b7da-2946-453b-861a-b4c7b276643b', 68, 'The compound statement ''p AND q'' (p ^ q) is true only when:', 'Mathematics', 'Mathematical Reasoning', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06eccfed-d1ea-43a5-89bf-bccc842e4214', 'c72bd0d6-f40f-49ee-95dc-12d494bf58eb', 0, 'At least one of p or q is true');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9400419-d5be-420c-a8b5-3f958ff9008a', 'c72bd0d6-f40f-49ee-95dc-12d494bf58eb', 1, 'Both p and q are true');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c5616dc-fa44-41ea-9fdf-5f3a36cda315', 'c72bd0d6-f40f-49ee-95dc-12d494bf58eb', 2, 'Both p and q are false');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21ce2346-6933-4975-a54f-47f7e2882ce7', 'c72bd0d6-f40f-49ee-95dc-12d494bf58eb', 3, 'Exactly one of p or q is true');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c72bd0d6-f40f-49ee-95dc-12d494bf58eb', 'e9400419-d5be-420c-a8b5-3f958ff9008a', 'The logical conjunction (AND) of two statements is true if and only if both individual statements are true.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('6377c638-1cce-4b81-a0af-2e794cb984e3', '7984b7da-2946-453b-861a-b4c7b276643b', 69, 'The slope of the tangent to the curve y=x^2 at the point (2,4) is:', 'Mathematics', 'Application of Derivatives', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e0aa7fc-6481-45ec-9e90-321d15dd48f7', '6377c638-1cce-4b81-a0af-2e794cb984e3', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3792e103-1901-40c1-abec-46297d3abcad', '6377c638-1cce-4b81-a0af-2e794cb984e3', 1, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0a13218-2eeb-40b7-af20-57eab7d1324d', '6377c638-1cce-4b81-a0af-2e794cb984e3', 2, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b855835-bd84-4e54-a520-2cd6bc82ecbe', '6377c638-1cce-4b81-a0af-2e794cb984e3', 3, '16');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6377c638-1cce-4b81-a0af-2e794cb984e3', '3792e103-1901-40c1-abec-46297d3abcad', 'dy/dx = 2x; at x=2, the slope is 2(2)=4.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f0d0bf21-e1d3-4126-8131-43d6c8e5ba19', '7984b7da-2946-453b-861a-b4c7b276643b', 70, 'The area of the region enclosed between the curve y=sin(x) and the x-axis from x=0 to x=pi is:', 'Mathematics', 'Application of Integrals', 'mcq');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4481b214-84c7-40c0-9606-becfaf745459', 'f0d0bf21-e1d3-4126-8131-43d6c8e5ba19', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df1623dd-111c-4e0a-bade-db2ecdb647c6', 'f0d0bf21-e1d3-4126-8131-43d6c8e5ba19', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ff21005-fd48-4d13-8c79-753de0e755bb', 'f0d0bf21-e1d3-4126-8131-43d6c8e5ba19', 2, 'pi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ec3701b-dc3f-42bb-af58-90fbbd4cd860', 'f0d0bf21-e1d3-4126-8131-43d6c8e5ba19', 3, 'pi/2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f0d0bf21-e1d3-4126-8131-43d6c8e5ba19', 'df1623dd-111c-4e0a-bade-db2ecdb647c6', 'Area = integral of sin(x) dx from 0 to pi = [-cos(x)] from 0 to pi = -cos(pi)-(-cos(0)) = 1+1 = 2.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('a5723992-f535-4c13-b8b4-9499a1fb60a0', '7984b7da-2946-453b-861a-b4c7b276643b', 71, 'The sum of the first 20 natural numbers (1+2+3+...+20) is:', 'Mathematics', 'Sequences and Series — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('a5723992-f535-4c13-b8b4-9499a1fb60a0', 210, 'Sum = n(n+1)/2 = 20*21/2 = 210.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('b926abf6-9081-465a-8f61-e23588e5fe42', '7984b7da-2946-453b-861a-b4c7b276643b', 72, 'The value of C(10,2) (10 choose 2) is:', 'Mathematics', 'Permutations and Combinations — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('b926abf6-9081-465a-8f61-e23588e5fe42', 45, 'C(10,2) = 10!/(2!*8!) = (10*9)/2 = 45.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('481ebc80-5b9d-467b-a4ef-eb66da4ef707', '7984b7da-2946-453b-861a-b4c7b276643b', 73, 'The value of the definite integral of 4x^3 dx from 0 to 1 is:', 'Mathematics', 'Integral Calculus — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('481ebc80-5b9d-467b-a4ef-eb66da4ef707', 1, 'Integral of 4x^3 dx = x^4; evaluating from 0 to 1 gives 1 - 0 = 1.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('f0a5b44e-bcc5-4868-afd7-acd6247b384b', '7984b7da-2946-453b-861a-b4c7b276643b', 74, 'The distance between the points (0,0) and (3,4) in a Cartesian plane is:', 'Mathematics', 'Coordinate Geometry — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('f0a5b44e-bcc5-4868-afd7-acd6247b384b', 5, 'Distance = sqrt(3^2+4^2) = sqrt(9+16) = sqrt(25) = 5.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic, answer_type)
VALUES ('2ccb0300-df03-4e27-aa53-dc9aeabe9cbb', '7984b7da-2946-453b-861a-b4c7b276643b', 75, 'A fair coin is tossed 3 times. The number of possible outcomes in the sample space is:', 'Mathematics', 'Statistics and Probability — NVQ', 'numeric');
INSERT INTO question_answers (question_id, correct_numeric_answer, explanation, source_note)
VALUES ('2ccb0300-df03-4e27-aa53-dc9aeabe9cbb', 8, 'Each toss has 2 outcomes; for 3 tosses, total outcomes = 2^3 = 8.', 'Mathematics — authored from NCERT Class 11/12 Mathematics textbooks (the JEE Main-prescribed syllabus); not copied from any official NTA question paper.');
