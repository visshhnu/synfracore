-- ============================================================
-- NEET UG — Full Mock Paper 1
-- Full-Length Practice Paper (180 questions, 180 minutes)
-- Marking: +4 correct / -1 incorrect (official NEET UG scheme)
-- Run this AFTER docs/add-question-subject-marking.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('2b148a4e-4b79-4c1b-b7e2-500e2975012f', 'neet-practice-1', 'NEET UG Full Mock Paper 1', 'neet', ARRAY['Physics', 'Chemistry', 'Biology', 'Botany', 'Zoology', 'NCERT', 'NEET UG']::TEXT[], 180, 'mixed', true, 1, 180, 4, 1);

-- ── Section: Physics (45 questions) — Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('06c1641b-ab06-43d2-ba23-dfa9966e91f6', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 1, 'The dimensional formula for angular momentum is:', 'Physics', 'Units and Measurements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c50fb48b-b070-408b-bc47-c91a6e46d6ab', '06c1641b-ab06-43d2-ba23-dfa9966e91f6', 0, '[ML^2T^-1]');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('107d509f-bde1-48d3-a219-f70712307576', '06c1641b-ab06-43d2-ba23-dfa9966e91f6', 1, '[MLT^-1]');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6cd1acc7-e7e7-41d0-bdf7-4615d071ee2e', '06c1641b-ab06-43d2-ba23-dfa9966e91f6', 2, '[ML^2T^-2]');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e76a2106-3f75-45b4-9b45-65ea3ff02f41', '06c1641b-ab06-43d2-ba23-dfa9966e91f6', 3, '[MLT^-2]');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('06c1641b-ab06-43d2-ba23-dfa9966e91f6', 'c50fb48b-b070-408b-bc47-c91a6e46d6ab', 'Angular momentum L = mvr, so [M][LT^-1][L] = [ML^2T^-1].', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6c9496fe-d306-4716-992e-b81695c17ab5', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 2, 'A body is thrown vertically upward with velocity u. The time taken to reach maximum height is:', 'Physics', 'Kinematics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0034eafb-1be8-4a01-88b2-7814459ca65a', '6c9496fe-d306-4716-992e-b81695c17ab5', 0, 'u/g');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db859f60-fede-44ed-b4fe-7fdc4628d5b0', '6c9496fe-d306-4716-992e-b81695c17ab5', 1, '2u/g');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d54f910-a1c6-469b-997b-3bd4390dfbcb', '6c9496fe-d306-4716-992e-b81695c17ab5', 2, 'u^2/2g');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43d2ac59-f209-4e79-b50e-00ac7ce58e87', '6c9496fe-d306-4716-992e-b81695c17ab5', 3, 'g/u');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6c9496fe-d306-4716-992e-b81695c17ab5', '0034eafb-1be8-4a01-88b2-7814459ca65a', 'At maximum height, final velocity = 0, so 0 = u - gt, giving t = u/g.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('db961c31-becc-4076-bf49-b779a213d134', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 3, 'A particle moves with constant acceleration. If its velocity-time graph is plotted, the graph is:', 'Physics', 'Kinematics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53a974a2-70d8-4d32-857a-2fdc6334e4e5', 'db961c31-becc-4076-bf49-b779a213d134', 0, 'A straight line with non-zero slope');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0dfa0fe-345d-4665-bc36-264f5a9b9268', 'db961c31-becc-4076-bf49-b779a213d134', 1, 'A parabola');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1fc815a-7084-4572-9cd2-fed9dd212eac', 'db961c31-becc-4076-bf49-b779a213d134', 2, 'A horizontal straight line');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d7fa8fc-64d7-4ae1-8c0a-ca20dc7f5d8e', 'db961c31-becc-4076-bf49-b779a213d134', 3, 'A hyperbola');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('db961c31-becc-4076-bf49-b779a213d134', '53a974a2-70d8-4d32-857a-2fdc6334e4e5', 'For constant acceleration, v = u + at is linear in t, giving a straight line with slope equal to the acceleration.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c3d54fa8-991a-4e99-9ece-54ca1bcc2bf0', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 4, 'A block of mass m rests on a rough horizontal surface with coefficient of static friction mu. The minimum horizontal force needed to just move the block is:', 'Physics', 'Laws of Motion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95b224c4-34ef-49d0-9871-02df2808f7ec', 'c3d54fa8-991a-4e99-9ece-54ca1bcc2bf0', 0, 'mu*mg');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b24e23b2-918d-4c9f-b859-3ed9e31063dc', 'c3d54fa8-991a-4e99-9ece-54ca1bcc2bf0', 1, 'mg/mu');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d56a000c-aff4-40f5-b725-9c6647fef707', 'c3d54fa8-991a-4e99-9ece-54ca1bcc2bf0', 2, 'mu*m/g');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aac4a3a3-b0a1-46e5-86d4-60b6716d492f', 'c3d54fa8-991a-4e99-9ece-54ca1bcc2bf0', 3, 'm/(mu*g)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c3d54fa8-991a-4e99-9ece-54ca1bcc2bf0', '95b224c4-34ef-49d0-9871-02df2808f7ec', 'The block just begins to move when the applied force equals the maximum static friction, f_max = mu*N = mu*mg on a horizontal surface.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('85f00f12-7d75-40ad-8b6c-68c9f39ae404', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 5, 'Newton''s third law states that for every action there is an equal and opposite reaction. These action-reaction forces:', 'Physics', 'Laws of Motion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a7a9dfd-7884-430b-a03b-298e4212fbc1', '85f00f12-7d75-40ad-8b6c-68c9f39ae404', 0, 'Act on the same body and hence cancel out');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be3641bf-1702-49c8-b09e-3ea68eafbd2f', '85f00f12-7d75-40ad-8b6c-68c9f39ae404', 1, 'Act on two different bodies and therefore do not cancel each other');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd9384d3-45c1-4f62-8331-3bbc684e42d7', '85f00f12-7d75-40ad-8b6c-68c9f39ae404', 2, 'Only apply to contact forces, not gravitational forces');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b34ae58d-bd10-4536-ba15-06c83b810342', '85f00f12-7d75-40ad-8b6c-68c9f39ae404', 3, 'Apply only when both bodies are in motion');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('85f00f12-7d75-40ad-8b6c-68c9f39ae404', 'be3641bf-1702-49c8-b09e-3ea68eafbd2f', 'Action and reaction act on two DIFFERENT bodies, so they never cancel for either individual body''s equation of motion; they apply to all forces, including gravity, and regardless of motion state.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ff966538-4e75-43b1-add6-af24e07f06d2', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 6, 'A spring of force constant k is stretched by a distance x. The potential energy stored in the spring is:', 'Physics', 'Work, Energy and Power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bf54c1e-c9fd-4139-96d5-79a1725a35ab', 'ff966538-4e75-43b1-add6-af24e07f06d2', 0, 'kx');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2511ee5c-7fd6-4bcb-a5c3-dd0ee91fa2f5', 'ff966538-4e75-43b1-add6-af24e07f06d2', 1, '(1/2)kx');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa1385c0-4061-4f51-a087-c33bc395c258', 'ff966538-4e75-43b1-add6-af24e07f06d2', 2, '(1/2)kx^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d089a8f-2959-480f-a756-b41489a3dec4', 'ff966538-4e75-43b1-add6-af24e07f06d2', 3, 'kx^2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ff966538-4e75-43b1-add6-af24e07f06d2', 'aa1385c0-4061-4f51-a087-c33bc395c258', 'Elastic potential energy stored in a spring stretched by x is U = (1/2)kx^2.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('16f8a3f3-c626-4a37-be65-9ba2a56d3b23', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 7, 'The work-energy theorem states that the work done by the net force on a body equals:', 'Physics', 'Work, Energy and Power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('425d84cd-7a67-4155-97bc-6f0fb0ffcf24', '16f8a3f3-c626-4a37-be65-9ba2a56d3b23', 0, 'The change in its momentum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd598b89-ea07-4ed0-808f-6efd62a780d3', '16f8a3f3-c626-4a37-be65-9ba2a56d3b23', 1, 'The change in its kinetic energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26f2a583-efe2-43e6-aed8-b6b5a6c1b0c6', '16f8a3f3-c626-4a37-be65-9ba2a56d3b23', 2, 'The change in its potential energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2c10532-71d2-4cea-bc16-5fc5a17f5c77', '16f8a3f3-c626-4a37-be65-9ba2a56d3b23', 3, 'The total mechanical energy of the body');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('16f8a3f3-c626-4a37-be65-9ba2a56d3b23', 'bd598b89-ea07-4ed0-808f-6efd62a780d3', 'Work-energy theorem: W_net = delta(KE), the change in kinetic energy of the body.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('31c5c28c-ec22-4f7c-9bea-a890affc424f', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 8, 'The moment of inertia of a uniform solid sphere of mass M and radius R about an axis through its centre is:', 'Physics', 'System of Particles and Rotational Motion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e4437de-a280-431d-acc1-29890b825cb2', '31c5c28c-ec22-4f7c-9bea-a890affc424f', 0, '(2/5)MR^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f8072ac-b3fc-48f4-8230-1a7680ba2620', '31c5c28c-ec22-4f7c-9bea-a890affc424f', 1, '(2/3)MR^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7f32580-ba5a-4cbe-9bbd-1894071089a2', '31c5c28c-ec22-4f7c-9bea-a890affc424f', 2, 'MR^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2906698-2b7e-4c8d-ad75-16e0beb41ce2', '31c5c28c-ec22-4f7c-9bea-a890affc424f', 3, '(1/2)MR^2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('31c5c28c-ec22-4f7c-9bea-a890affc424f', '7e4437de-a280-431d-acc1-29890b825cb2', 'Standard result for a uniform solid sphere about a diameter: I = (2/5)MR^2.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('09a82e28-da74-4688-8eae-0bc4979a3514', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 9, 'Angular momentum of a system is conserved when:', 'Physics', 'System of Particles and Rotational Motion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e1f027c-3519-4aee-89b5-ff0fbd6f6441', '09a82e28-da74-4688-8eae-0bc4979a3514', 0, 'The net force on the system is zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17dd73ac-f6be-4c56-8cb2-dc20a0fb8d9f', '09a82e28-da74-4688-8eae-0bc4979a3514', 1, 'The net external torque on the system is zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df4563c5-f6f7-47d4-9041-4b41169f4da6', '09a82e28-da74-4688-8eae-0bc4979a3514', 2, 'The system is at rest');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('079286e8-4720-40a9-8feb-2f1b3359a8d5', '09a82e28-da74-4688-8eae-0bc4979a3514', 3, 'The moment of inertia is constant');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('09a82e28-da74-4688-8eae-0bc4979a3514', '17dd73ac-f6be-4c56-8cb2-dc20a0fb8d9f', 'Conservation of angular momentum requires zero net external torque, analogous to conservation of linear momentum requiring zero net force.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('aac657d3-8b82-410f-a597-447480ab0f12', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 10, 'According to Kepler''s third law, the square of the time period of a planet''s revolution around the Sun is proportional to:', 'Physics', 'Gravitation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ff64cc7-618e-4dc8-ae53-affd264b9be8', 'aac657d3-8b82-410f-a597-447480ab0f12', 0, 'The square of the semi-major axis of its orbit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d39507c1-ffc6-4bb9-9622-39ea9962f9dd', 'aac657d3-8b82-410f-a597-447480ab0f12', 1, 'The cube of the semi-major axis of its orbit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0beef0af-8c55-44f4-9b77-4b5580edcaa2', 'aac657d3-8b82-410f-a597-447480ab0f12', 2, 'The semi-major axis of its orbit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8789fc7-d358-4bba-817c-b33c32512778', 'aac657d3-8b82-410f-a597-447480ab0f12', 3, 'The square root of the semi-major axis of its orbit');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aac657d3-8b82-410f-a597-447480ab0f12', 'd39507c1-ffc6-4bb9-9622-39ea9962f9dd', 'Kepler''s third law: T^2 is proportional to a^3, where a is the semi-major axis.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('42da8063-45bc-4c07-a40a-7e0d71a135b6', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 11, 'The escape velocity of a body from Earth''s surface does NOT depend on:', 'Physics', 'Gravitation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('765c1214-b589-4b21-b662-8c3b8b682f59', '42da8063-45bc-4c07-a40a-7e0d71a135b6', 0, 'The mass of Earth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('214d9f23-8684-4377-b4fc-9321b66f1bc5', '42da8063-45bc-4c07-a40a-7e0d71a135b6', 1, 'The radius of Earth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b68c457-1a90-4387-9137-f7d99d3aca81', '42da8063-45bc-4c07-a40a-7e0d71a135b6', 2, 'The mass of the body being launched');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6398613d-b5a9-43bf-8bc3-ac22284effec', '42da8063-45bc-4c07-a40a-7e0d71a135b6', 3, 'The value of the gravitational constant G');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('42da8063-45bc-4c07-a40a-7e0d71a135b6', '8b68c457-1a90-4387-9137-f7d99d3aca81', 'Escape velocity v_e = sqrt(2GM/R) depends on Earth''s mass M and radius R (and G), but is independent of the mass of the escaping body.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d2c7f67b-d83a-4a89-b7df-6e8980c48d6b', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 12, 'Young''s modulus of a material relates:', 'Physics', 'Mechanical Properties of Solids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d40d564b-4027-4c33-b3c0-d507e0ba8be3', 'd2c7f67b-d83a-4a89-b7df-6e8980c48d6b', 0, 'Shear stress to shear strain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('acc36cca-e1ef-4e80-90e4-f9c51433091f', 'd2c7f67b-d83a-4a89-b7df-6e8980c48d6b', 1, 'Longitudinal stress to longitudinal strain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4dfa4cd9-3f47-40e8-8ec8-f880a2fe61cf', 'd2c7f67b-d83a-4a89-b7df-6e8980c48d6b', 2, 'Volumetric stress to volumetric strain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e76ebb3f-2949-44c3-a6f4-a7b87019e890', 'd2c7f67b-d83a-4a89-b7df-6e8980c48d6b', 3, 'Pressure to volume change only in gases');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d2c7f67b-d83a-4a89-b7df-6e8980c48d6b', 'acc36cca-e1ef-4e80-90e4-f9c51433091f', 'Young''s modulus Y = longitudinal stress / longitudinal strain, applicable to a wire or rod under tensile/compressive load.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('46fb9582-340f-4396-9633-e821fa01868d', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 13, 'According to Bernoulli''s principle, in a streamline flow, as the velocity of a fluid increases, its pressure:', 'Physics', 'Mechanical Properties of Fluids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d1ad029-0e03-47bb-aa0a-f2b8e6d9e535', '46fb9582-340f-4396-9633-e821fa01868d', 0, 'Increases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce722118-840a-4cee-bbd1-af5ba3c78ad3', '46fb9582-340f-4396-9633-e821fa01868d', 1, 'Decreases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e7f6433-37d4-4bf5-9273-9c620bfd42ae', '46fb9582-340f-4396-9633-e821fa01868d', 2, 'Remains constant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c282423-34fb-4fef-add1-78dbe774f24c', '46fb9582-340f-4396-9633-e821fa01868d', 3, 'Becomes zero');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('46fb9582-340f-4396-9633-e821fa01868d', 'ce722118-840a-4cee-bbd1-af5ba3c78ad3', 'Bernoulli''s equation shows pressure and velocity are inversely related along a streamline for an ideal, incompressible, non-viscous fluid at constant height.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3041ce74-6a90-4679-ae10-adde79fc8066', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 14, 'The SI unit of specific heat capacity is:', 'Physics', 'Thermal Properties of Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aca96898-16ed-4de3-a2de-056a717ffcf8', '3041ce74-6a90-4679-ae10-adde79fc8066', 0, 'J/kg');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50e58bfe-a5fb-4463-a56a-5bf13d5d109a', '3041ce74-6a90-4679-ae10-adde79fc8066', 1, 'J/(kg K)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b90c6d31-0b29-40f9-ba0f-c09ec40980b4', '3041ce74-6a90-4679-ae10-adde79fc8066', 2, 'J K');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f3589ef4-caef-4f31-98c6-40e7c7eaaa26', '3041ce74-6a90-4679-ae10-adde79fc8066', 3, 'J/K');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3041ce74-6a90-4679-ae10-adde79fc8066', '50e58bfe-a5fb-4463-a56a-5bf13d5d109a', 'Specific heat capacity c is defined by Q = mc*deltaT, so its SI unit is J/(kg K).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e9f78d61-b2a3-45bd-825e-821e037e3624', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 15, 'In an adiabatic process, which of the following is true?', 'Physics', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d11f8293-c17b-459e-ad17-9854517ed2cc', 'e9f78d61-b2a3-45bd-825e-821e037e3624', 0, 'Temperature remains constant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72843cdc-7edd-4d2d-b9f6-ee1f07450e43', 'e9f78d61-b2a3-45bd-825e-821e037e3624', 1, 'No heat is exchanged with the surroundings');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de711833-0635-4059-8806-76784037487f', 'e9f78d61-b2a3-45bd-825e-821e037e3624', 2, 'Pressure remains constant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28f4a145-ebd2-480e-8f41-102235f9ef08', 'e9f78d61-b2a3-45bd-825e-821e037e3624', 3, 'Volume remains constant');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e9f78d61-b2a3-45bd-825e-821e037e3624', '72843cdc-7edd-4d2d-b9f6-ee1f07450e43', 'An adiabatic process is defined by Q = 0 — no heat exchange with the surroundings; pressure, volume and temperature can all change.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e5db33a7-a68e-4fe5-b1d7-a9f938ce3cef', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 16, 'The efficiency of a Carnot engine operating between temperatures T1 (hot) and T2 (cold) is given by:', 'Physics', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4db44a1a-b5a1-41e0-8f35-19aa4206bb47', 'e5db33a7-a68e-4fe5-b1d7-a9f938ce3cef', 0, 'T2/T1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abb09335-770a-4d68-b997-8baca35392c3', 'e5db33a7-a68e-4fe5-b1d7-a9f938ce3cef', 1, '1 - T2/T1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c9bd592-c75a-438f-bf27-6c76df5a3f74', 'e5db33a7-a68e-4fe5-b1d7-a9f938ce3cef', 2, 'T1/T2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05c87f96-3cb2-4f8e-8e17-11832a8aacfb', 'e5db33a7-a68e-4fe5-b1d7-a9f938ce3cef', 3, '1 - T1/T2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e5db33a7-a68e-4fe5-b1d7-a9f938ce3cef', 'abb09335-770a-4d68-b997-8baca35392c3', 'Carnot efficiency = 1 - T2/T1, where T1 and T2 are absolute temperatures of the hot and cold reservoirs.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1aecef04-3f75-41d6-ba40-bfd0856aa3f3', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 17, 'According to the kinetic theory of gases, the average kinetic energy of a gas molecule is directly proportional to:', 'Physics', 'Kinetic Theory');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3519b319-7d5e-4e59-b9dc-3d5fab177205', '1aecef04-3f75-41d6-ba40-bfd0856aa3f3', 0, 'The pressure of the gas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2606dcff-aa2e-496f-8220-d660eaf29e6d', '1aecef04-3f75-41d6-ba40-bfd0856aa3f3', 1, 'The volume of the gas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fdb069d7-bf0b-4587-9312-8fb94c863b2d', '1aecef04-3f75-41d6-ba40-bfd0856aa3f3', 2, 'The absolute temperature of the gas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4681885-ef93-4b8c-8567-954863072a88', '1aecef04-3f75-41d6-ba40-bfd0856aa3f3', 3, 'The molar mass of the gas');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1aecef04-3f75-41d6-ba40-bfd0856aa3f3', 'fdb069d7-bf0b-4587-9312-8fb94c863b2d', 'Average KE per molecule = (3/2)kT, directly proportional to the absolute temperature T, independent of the gas''s molar mass.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('36a3af44-86f6-4fe6-84ed-1be096ba5dc8', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 18, 'The time period of a simple pendulum of length L in a region with acceleration due to gravity g is:', 'Physics', 'Oscillations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa4eba82-307f-427b-8e6a-89e3456eec1e', '36a3af44-86f6-4fe6-84ed-1be096ba5dc8', 0, '2*pi*sqrt(L/g)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7d8c4e1-4b1f-4f47-b9a4-4525212674f0', '36a3af44-86f6-4fe6-84ed-1be096ba5dc8', 1, '2*pi*sqrt(g/L)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('227355eb-ac66-4da6-8ced-b2ee694f055c', '36a3af44-86f6-4fe6-84ed-1be096ba5dc8', 2, '(1/2*pi)*sqrt(L/g)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ec3f3ec-af43-46f5-a9a5-ea0219aee592', '36a3af44-86f6-4fe6-84ed-1be096ba5dc8', 3, '2*pi*(L/g)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('36a3af44-86f6-4fe6-84ed-1be096ba5dc8', 'aa4eba82-307f-427b-8e6a-89e3456eec1e', 'For small oscillations, the simple pendulum time period is T = 2*pi*sqrt(L/g).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('fb984d6d-17fa-4fb7-af7d-7a71054be18b', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 19, 'The speed of a transverse wave on a stretched string depends on:', 'Physics', 'Waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee7d2e79-6d1a-448c-877d-6422cfa4a40b', 'fb984d6d-17fa-4fb7-af7d-7a71054be18b', 0, 'The frequency of the wave only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ee9b888-e5cd-4b9f-9356-461f27e2fb04', 'fb984d6d-17fa-4fb7-af7d-7a71054be18b', 1, 'The tension in the string and its mass per unit length');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('028a1502-c4ed-4a18-8be9-de1b575b7f31', 'fb984d6d-17fa-4fb7-af7d-7a71054be18b', 2, 'The amplitude of the wave');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7c863a4-a600-497a-98b8-bdd90d1b31d6', 'fb984d6d-17fa-4fb7-af7d-7a71054be18b', 3, 'The wavelength only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fb984d6d-17fa-4fb7-af7d-7a71054be18b', '9ee9b888-e5cd-4b9f-9356-461f27e2fb04', 'Wave speed on a string v = sqrt(T/mu), where T is tension and mu is linear mass density — independent of frequency and amplitude.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8919a005-e063-4ea9-a90b-b841ced5a148', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 20, 'Beats are produced when two sound waves of:', 'Physics', 'Waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('581399c9-1c21-4419-93d4-fc1d31830534', '8919a005-e063-4ea9-a90b-b841ced5a148', 0, 'Equal frequencies and equal amplitudes superpose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10c9c55c-b092-42bc-8d56-a64e8ab45054', '8919a005-e063-4ea9-a90b-b841ced5a148', 1, 'Slightly different frequencies superpose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cdd0138-7b38-4c9a-94c7-74443af21544', '8919a005-e063-4ea9-a90b-b841ced5a148', 2, 'Very different frequencies (differing by more than 20 Hz) superpose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('336ab3ce-aeb2-47a8-8bf4-cc3e1663dabf', '8919a005-e063-4ea9-a90b-b841ced5a148', 3, 'Same frequency but opposite phase superpose');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8919a005-e063-4ea9-a90b-b841ced5a148', '10c9c55c-b092-42bc-8d56-a64e8ab45054', 'Beats arise from the superposition of two waves of slightly different frequencies, producing a periodic variation in amplitude at the beat frequency |f1 - f2|.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b92f296d-6093-4068-ad78-eee82c7b06dd', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 21, 'Coulomb''s law states that the force between two point charges is:', 'Physics', 'Electric Charges and Fields');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ff2a70a-ebdd-4168-9a5c-6a040f568057', 'b92f296d-6093-4068-ad78-eee82c7b06dd', 0, 'Directly proportional to the product of charges and inversely proportional to the square of the distance between them');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('648bbf7e-4302-44c1-b746-3fbcfd77eefe', 'b92f296d-6093-4068-ad78-eee82c7b06dd', 1, 'Directly proportional to the distance between them');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2fe3ddf7-361e-4a43-abea-6a37009ee7e9', 'b92f296d-6093-4068-ad78-eee82c7b06dd', 2, 'Inversely proportional to the product of charges');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e812a814-095d-479b-bd79-42c182379cde', 'b92f296d-6093-4068-ad78-eee82c7b06dd', 3, 'Independent of the medium between the charges');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b92f296d-6093-4068-ad78-eee82c7b06dd', '8ff2a70a-ebdd-4168-9a5c-6a040f568057', 'Coulomb''s law: F = kq1q2/r^2 — proportional to the product of the charges and inversely proportional to r^2; it does depend on the medium (via permittivity).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5b5abcd4-975e-4f04-8846-72999a0909bd', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 22, 'The capacitance of a parallel plate capacitor increases when:', 'Physics', 'Electrostatic Potential and Capacitance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24c2c9f6-fdd7-462f-be1b-67972f95b5fa', '5b5abcd4-975e-4f04-8846-72999a0909bd', 0, 'The distance between the plates is increased');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('52c4d9f8-1d44-4a0e-a3b6-c661be97bf75', '5b5abcd4-975e-4f04-8846-72999a0909bd', 1, 'A dielectric medium is inserted between the plates');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c22595a-c4d5-4a41-b0bd-9eb2ee297e2e', '5b5abcd4-975e-4f04-8846-72999a0909bd', 2, 'The area of the plates is decreased');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a77c7484-c7f2-4c64-8d63-aeedbe611856', '5b5abcd4-975e-4f04-8846-72999a0909bd', 3, 'The plates are moved further apart in vacuum');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5b5abcd4-975e-4f04-8846-72999a0909bd', '52c4d9f8-1d44-4a0e-a3b6-c661be97bf75', 'C = k*epsilon0*A/d — capacitance increases when a dielectric (k>1) is inserted, or when area A increases, or when separation d decreases.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2874b038-7aa0-492c-b963-5933d89667dd', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 23, 'Ohm''s law states that the current through a conductor is directly proportional to the potential difference across it, provided:', 'Physics', 'Current Electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5fdd377c-6996-4589-827e-15512ea72aa2', '2874b038-7aa0-492c-b963-5933d89667dd', 0, 'The temperature and other physical conditions remain constant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2efe2a60-3636-4bc0-a96a-d6c189a89321', '2874b038-7aa0-492c-b963-5933d89667dd', 1, 'The current is alternating');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7696d465-9357-484d-9f04-418aa8cc925d', '2874b038-7aa0-492c-b963-5933d89667dd', 2, 'The conductor is a semiconductor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b1fbbd6-2f14-4756-8720-88557b98803b', '2874b038-7aa0-492c-b963-5933d89667dd', 3, 'The resistance varies with current');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2874b038-7aa0-492c-b963-5933d89667dd', '5fdd377c-6996-4589-827e-15512ea72aa2', 'Ohm''s law V = IR holds for ohmic conductors at constant physical conditions (notably temperature); non-ohmic devices like diodes do not obey it.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0b01dcfd-fd72-4604-89a8-bff5e4faeeaa', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 24, 'When resistors are connected in series, the equivalent resistance is:', 'Physics', 'Current Electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0dd92af5-00cf-4628-881f-72b0848fa369', '0b01dcfd-fd72-4604-89a8-bff5e4faeeaa', 0, 'Less than the smallest individual resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8334c59c-4d93-4bfe-8325-0c3c6f7f27d3', '0b01dcfd-fd72-4604-89a8-bff5e4faeeaa', 1, 'Equal to the sum of the individual resistances');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e55fe15d-de2f-47b3-bb36-d5546b29b387', '0b01dcfd-fd72-4604-89a8-bff5e4faeeaa', 2, 'Equal to the reciprocal of the sum of reciprocals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e54fb8c-3c68-460b-a037-5196cec1e045', '0b01dcfd-fd72-4604-89a8-bff5e4faeeaa', 3, 'Always equal regardless of arrangement');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0b01dcfd-fd72-4604-89a8-bff5e4faeeaa', '8334c59c-4d93-4bfe-8325-0c3c6f7f27d3', 'For series combination, R_eq = R1 + R2 + ... , always greater than the largest individual resistor.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6bf75a56-9bcf-4c39-97cd-afb30b330f2a', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 25, 'The magnetic field at the centre of a circular current-carrying loop of radius R carrying current I is:', 'Physics', 'Moving Charges and Magnetism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5aba611-3e4d-45cb-ba8f-5df4b7e6b114', '6bf75a56-9bcf-4c39-97cd-afb30b330f2a', 0, 'mu0*I/(2R)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b04db621-3b5f-4d87-827d-047bd9a729e2', '6bf75a56-9bcf-4c39-97cd-afb30b330f2a', 1, 'mu0*I/(2*pi*R)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0ab7de7-31ce-402e-8391-b99a89715b88', '6bf75a56-9bcf-4c39-97cd-afb30b330f2a', 2, 'mu0*I*R/2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78b1356f-25e7-46bf-8f8a-3aa1011a4262', '6bf75a56-9bcf-4c39-97cd-afb30b330f2a', 3, 'mu0*I/(4*pi*R)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6bf75a56-9bcf-4c39-97cd-afb30b330f2a', 'f5aba611-3e4d-45cb-ba8f-5df4b7e6b114', 'Magnetic field at the centre of a circular loop: B = mu0*I/(2R).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4afb83e4-2f61-4732-a279-3d3dd0d75151', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 26, 'A diamagnetic material, when placed in an external magnetic field, gets:', 'Physics', 'Magnetism and Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2672cca-2c9f-4cf6-8a6c-5c9c8ab204b8', '4afb83e4-2f61-4732-a279-3d3dd0d75151', 0, 'Strongly magnetized in the direction of the field');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db57fe0e-bb2c-4ef7-b3d2-e9385c90c364', '4afb83e4-2f61-4732-a279-3d3dd0d75151', 1, 'Weakly magnetized opposite to the direction of the field');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7471dc21-0c91-47ae-8679-6b3fd06b229f', '4afb83e4-2f61-4732-a279-3d3dd0d75151', 2, 'Weakly magnetized in the direction of the field');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d52dac74-a791-4d93-8f80-cfefeaaa59b8', '4afb83e4-2f61-4732-a279-3d3dd0d75151', 3, 'Permanently magnetized');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4afb83e4-2f61-4732-a279-3d3dd0d75151', 'db57fe0e-bb2c-4ef7-b3d2-e9385c90c364', 'Diamagnetic materials acquire a weak magnetization opposite to the applied field and are repelled by it (unlike paramagnetic/ferromagnetic materials).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('71236acc-d424-4028-b0f7-4f2652968cac', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 27, 'Faraday''s law of electromagnetic induction states that the induced EMF is:', 'Physics', 'Electromagnetic Induction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81525b10-f1b8-4ec0-b5a2-81438e99d440', '71236acc-d424-4028-b0f7-4f2652968cac', 0, 'Directly proportional to the magnetic flux through the circuit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c6d6577-efb3-48ba-9dc8-fb91c0ded008', '71236acc-d424-4028-b0f7-4f2652968cac', 1, 'Directly proportional to the rate of change of magnetic flux through the circuit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a73107ef-3926-4dda-9e87-a98a1348d997', '71236acc-d424-4028-b0f7-4f2652968cac', 2, 'Inversely proportional to the rate of change of magnetic flux');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('079b4438-8768-41ed-a58d-02186f656d70', '71236acc-d424-4028-b0f7-4f2652968cac', 3, 'Independent of the area of the circuit');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('71236acc-d424-4028-b0f7-4f2652968cac', '9c6d6577-efb3-48ba-9dc8-fb91c0ded008', 'Faraday''s law: EMF = -d(phi)/dt, proportional to the rate of change of magnetic flux, not the flux itself.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('bf926a88-b155-49eb-b490-8f9ea804134e', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 28, 'In a purely resistive AC circuit, the phase difference between voltage and current is:', 'Physics', 'Alternating Current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('603ebbed-8fba-4cd6-99be-668d15d20e4d', 'bf926a88-b155-49eb-b490-8f9ea804134e', 0, '90 degrees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5334fc2c-0203-476e-b139-b537222047f0', 'bf926a88-b155-49eb-b490-8f9ea804134e', 1, '180 degrees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99cdf577-add0-49a1-b107-6b3e5d63ea82', 'bf926a88-b155-49eb-b490-8f9ea804134e', 2, '0 degrees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87752055-268d-4b0a-a657-a03fa58e48b8', 'bf926a88-b155-49eb-b490-8f9ea804134e', 3, '45 degrees');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bf926a88-b155-49eb-b490-8f9ea804134e', '99cdf577-add0-49a1-b107-6b3e5d63ea82', 'In a purely resistive AC circuit, voltage and current are in phase (phase difference = 0).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0cfedd5a-3951-40cd-b489-84a314e2356d', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 29, 'Electromagnetic waves are produced by:', 'Physics', 'Electromagnetic Waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('286c979a-d05b-431b-a306-b9853abb3935', '0cfedd5a-3951-40cd-b489-84a314e2356d', 0, 'Stationary charges');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f118f867-1d68-4a2b-93a2-f5a4d1df2060', '0cfedd5a-3951-40cd-b489-84a314e2356d', 1, 'Charges moving with uniform velocity only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d235be0-7465-44b7-9a59-a6ab4de4d23d', '0cfedd5a-3951-40cd-b489-84a314e2356d', 2, 'Accelerating charges');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9003f3f-13a6-46e4-a8d6-15a7de2d2b55', '0cfedd5a-3951-40cd-b489-84a314e2356d', 3, 'Neutral, uncharged particles');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0cfedd5a-3951-40cd-b489-84a314e2356d', '2d235be0-7465-44b7-9a59-a6ab4de4d23d', 'Accelerating (including oscillating) charges radiate electromagnetic waves; stationary or uniformly moving charges do not radiate.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('34f4d103-21f0-46ea-b661-709dd0c27e8b', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 30, 'The mirror formula relating object distance u, image distance v, and focal length f is:', 'Physics', 'Ray Optics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe1c8d85-5571-4ab7-91aa-46e716e88cb9', '34f4d103-21f0-46ea-b661-709dd0c27e8b', 0, '1/v + 1/u = 1/f');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1706c29e-7764-4bd9-9ed3-4284dd157e96', '34f4d103-21f0-46ea-b661-709dd0c27e8b', 1, '1/v - 1/u = 1/f');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bfbb87c4-6acd-456f-9dcf-1f88a8b38029', '34f4d103-21f0-46ea-b661-709dd0c27e8b', 2, 'v + u = f');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b274153c-ace5-4152-9fce-ee309e9e4c7b', '34f4d103-21f0-46ea-b661-709dd0c27e8b', 3, 'vu = f');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('34f4d103-21f0-46ea-b661-709dd0c27e8b', 'fe1c8d85-5571-4ab7-91aa-46e716e88cb9', 'The mirror formula is 1/v + 1/u = 1/f, using the standard sign convention.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7c82a447-cb61-4e36-8c99-b91fa8b7a1b8', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 31, 'A convex lens forms a real, inverted, and diminished image when the object is placed:', 'Physics', 'Ray Optics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f1c4fa5-c4a5-4f22-988f-b50b7d06653f', '7c82a447-cb61-4e36-8c99-b91fa8b7a1b8', 0, 'Between the focus and the lens');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6b57455-8b8e-466d-b683-2a8bd9f7571b', '7c82a447-cb61-4e36-8c99-b91fa8b7a1b8', 1, 'At the focus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('939bdb05-e492-461b-88fe-17b0403830ed', '7c82a447-cb61-4e36-8c99-b91fa8b7a1b8', 2, 'Beyond twice the focal length (2F)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9841f65d-7fbe-437f-80ed-51161ccff4e4', '7c82a447-cb61-4e36-8c99-b91fa8b7a1b8', 3, 'At twice the focal length exactly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7c82a447-cb61-4e36-8c99-b91fa8b7a1b8', '939bdb05-e492-461b-88fe-17b0403830ed', 'For an object placed beyond 2F of a convex lens, the image formed is real, inverted, and diminished, located between F and 2F on the other side.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b006d5e5-0ffe-4559-82b0-8667d911f6fc', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 32, 'In Young''s double slit experiment, the fringe width is given by:', 'Physics', 'Wave Optics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d669240-26cb-442b-a9d6-845d778b7da8', 'b006d5e5-0ffe-4559-82b0-8667d911f6fc', 0, 'lambda*D/d');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5d62c21-3fe0-46eb-b283-a1e7808a7a6b', 'b006d5e5-0ffe-4559-82b0-8667d911f6fc', 1, 'lambda*d/D');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('359e0404-e3b8-4bce-9b15-090a1f120389', 'b006d5e5-0ffe-4559-82b0-8667d911f6fc', 2, 'D*d/lambda');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42b8282f-dc5b-4c3f-9963-d598513602c5', 'b006d5e5-0ffe-4559-82b0-8667d911f6fc', 3, 'lambda/(D*d)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b006d5e5-0ffe-4559-82b0-8667d911f6fc', '9d669240-26cb-442b-a9d6-845d778b7da8', 'Fringe width beta = lambda*D/d, where D is slit-to-screen distance, d is slit separation, and lambda is wavelength.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b109e161-1dfe-4d83-ba0b-e1570a1a23a7', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 33, 'The de Broglie wavelength associated with a moving particle of momentum p is given by:', 'Physics', 'Dual Nature of Radiation and Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8850b165-2756-429b-ac8d-06e976885e0d', 'b109e161-1dfe-4d83-ba0b-e1570a1a23a7', 0, 'h*p');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f16c5ab-d3ab-453f-8db5-e00c6dead9de', 'b109e161-1dfe-4d83-ba0b-e1570a1a23a7', 1, 'h/p');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63148de3-6168-4b3e-96f0-63e68c3861c2', 'b109e161-1dfe-4d83-ba0b-e1570a1a23a7', 2, 'p/h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13b2c28a-a797-4b88-8ca8-52fa24a1c975', 'b109e161-1dfe-4d83-ba0b-e1570a1a23a7', 3, 'hp^2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b109e161-1dfe-4d83-ba0b-e1570a1a23a7', '3f16c5ab-d3ab-453f-8db5-e00c6dead9de', 'De Broglie wavelength: lambda = h/p, where h is Planck''s constant.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7e1eed92-28af-4ecf-ae6c-c3768bcca573', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 34, 'In the photoelectric effect, the maximum kinetic energy of emitted electrons depends on:', 'Physics', 'Dual Nature of Radiation and Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('901b1ceb-9911-4dbd-9533-7b235503811a', '7e1eed92-28af-4ecf-ae6c-c3768bcca573', 0, 'The intensity of incident light only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a59c5e1-849b-48e0-83c1-0f379d370dc8', '7e1eed92-28af-4ecf-ae6c-c3768bcca573', 1, 'The frequency of incident light and the work function of the metal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff2177f5-05b3-4172-91e4-295e16f0d081', '7e1eed92-28af-4ecf-ae6c-c3768bcca573', 2, 'The area of the metal surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5095b10-73e6-4007-a235-44e87f2cfd1f', '7e1eed92-28af-4ecf-ae6c-c3768bcca573', 3, 'The distance between the light source and the metal');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7e1eed92-28af-4ecf-ae6c-c3768bcca573', '6a59c5e1-849b-48e0-83c1-0f379d370dc8', 'Einstein''s photoelectric equation: KE_max = hf - phi (work function) — depends on frequency and the metal''s work function, not intensity (which affects the number of photoelectrons, not their max KE).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2b7e24b9-326b-4dc6-8e83-66f2e453fc15', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 35, 'According to Bohr''s model of the hydrogen atom, electrons revolve in orbits where their angular momentum is:', 'Physics', 'Atoms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad65fc27-3b7b-46c4-b2f4-8da913a607c7', '2b7e24b9-326b-4dc6-8e83-66f2e453fc15', 0, 'Continuous and can take any value');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c641263-e2b6-406c-974a-6020f72b7c42', '2b7e24b9-326b-4dc6-8e83-66f2e453fc15', 1, 'Quantized in integral multiples of h/(2*pi)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e08cec3a-afa4-416a-bbe5-2b7b2691eb8f', '2b7e24b9-326b-4dc6-8e83-66f2e453fc15', 2, 'Always equal to h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4392fd14-7e2d-4b9e-aaef-1b1b12e13f6c', '2b7e24b9-326b-4dc6-8e83-66f2e453fc15', 3, 'Zero');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2b7e24b9-326b-4dc6-8e83-66f2e453fc15', '1c641263-e2b6-406c-974a-6020f72b7c42', 'Bohr''s quantization condition: angular momentum mvr = n*h/(2*pi), where n is a positive integer.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ae1e7607-2a4f-4471-8ebe-a064a63e94ba', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 36, 'The binding energy per nucleon curve shows that nuclei with intermediate mass numbers (around A = 56, e.g. iron) are:', 'Physics', 'Nuclei');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17cb9f59-d1bb-4e82-b61f-508d3bcda04c', 'ae1e7607-2a4f-4471-8ebe-a064a63e94ba', 0, 'The least stable nuclei');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a67703c4-8852-4077-8ddd-d81331e21e1f', 'ae1e7607-2a4f-4471-8ebe-a064a63e94ba', 1, 'The most stable nuclei, with the highest binding energy per nucleon');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4735d6e-f891-4731-a904-e78d64d8b595', 'ae1e7607-2a4f-4471-8ebe-a064a63e94ba', 2, 'Unstable and radioactive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5aa8cd9-df90-4f76-98ef-267ab6517958', 'ae1e7607-2a4f-4471-8ebe-a064a63e94ba', 3, 'Only found in artificial reactors');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ae1e7607-2a4f-4471-8ebe-a064a63e94ba', 'a67703c4-8852-4077-8ddd-d81331e21e1f', 'The binding-energy-per-nucleon curve peaks around iron (A~56), making mid-mass nuclei the most stable — this is why both fission (heavy nuclei) and fusion (light nuclei) release energy, moving toward this peak.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('26805be5-deb7-4ad4-ad89-fcd127994246', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 37, 'Radioactive decay follows which law?', 'Physics', 'Nuclei');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08cb4021-423d-4740-b416-767f26339138', '26805be5-deb7-4ad4-ad89-fcd127994246', 0, 'N = N0*e^(-lambda*t) (exponential decay)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64786339-4565-4f5b-b2f7-4e3d62531403', '26805be5-deb7-4ad4-ad89-fcd127994246', 1, 'N = N0*t (linear decay)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d76c4580-b606-45a1-ae82-b07e444a3a57', '26805be5-deb7-4ad4-ad89-fcd127994246', 2, 'N = N0*t^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07408ee2-0e8b-4f9b-8a33-c1f8f8aa59d8', '26805be5-deb7-4ad4-ad89-fcd127994246', 3, 'N remains constant over time');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('26805be5-deb7-4ad4-ad89-fcd127994246', '08cb4021-423d-4740-b416-767f26339138', 'Radioactive decay is exponential: N = N0*e^(-lambda*t), where lambda is the decay constant.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('38138e36-3c53-419c-a60a-2263c1b8dabc', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 38, 'In a p-n junction diode, the depletion region is formed due to:', 'Physics', 'Semiconductor Electronics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d32d9b42-4835-4aec-a2a2-81f6ce94a0e7', '38138e36-3c53-419c-a60a-2263c1b8dabc', 0, 'The diffusion of majority charge carriers across the junction, leaving behind immobile ions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04c92711-75cf-4e52-a554-63b32ae4a2f5', '38138e36-3c53-419c-a60a-2263c1b8dabc', 1, 'The application of an external battery only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b20e9c57-3285-4aed-b1ea-38a12b9d2535', '38138e36-3c53-419c-a60a-2263c1b8dabc', 2, 'The absence of any charge carriers in the semiconductor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6031e282-72f7-4515-b8d8-4046d70d43d4', '38138e36-3c53-419c-a60a-2263c1b8dabc', 3, 'Heating of the junction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('38138e36-3c53-419c-a60a-2263c1b8dabc', 'd32d9b42-4835-4aec-a2a2-81f6ce94a0e7', 'At the junction, diffusion of electrons and holes across it leaves behind immobile ionized dopant atoms, creating the depletion region even with no external bias.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('cbd375c3-a898-448c-a940-4abed98679f2', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 39, 'A p-n junction diode is said to be forward biased when:', 'Physics', 'Semiconductor Electronics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e41096c-6fd1-4941-b137-f64c04ccb001', 'cbd375c3-a898-448c-a940-4abed98679f2', 0, 'The p-side is connected to the negative terminal and n-side to the positive terminal of the battery');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('797597a8-c938-4f52-9036-1c22a1a3cecd', 'cbd375c3-a898-448c-a940-4abed98679f2', 1, 'The p-side is connected to the positive terminal and n-side to the negative terminal of the battery');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09a179e5-b654-4eec-ac65-a187368511ac', 'cbd375c3-a898-448c-a940-4abed98679f2', 2, 'Both sides are connected to the same terminal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f09a61f-ce61-4675-8eb7-28489388fd5b', 'cbd375c3-a898-448c-a940-4abed98679f2', 3, 'No battery is connected');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cbd375c3-a898-448c-a940-4abed98679f2', '797597a8-c938-4f52-9036-1c22a1a3cecd', 'Forward bias: p-side to positive terminal, n-side to negative terminal — this reduces the depletion region width and allows current to flow easily.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e4371129-f163-4813-bb62-e174014ecaf3', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 40, 'For a projectile launched at angle theta with initial speed u, the range is maximum when theta equals:', 'Physics', 'Motion in a Plane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2d3c0b8-ec38-480a-98a0-aa3d89519505', 'e4371129-f163-4813-bb62-e174014ecaf3', 0, '30 degrees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36d4917e-0d67-45bf-ba4a-19bdb617a401', 'e4371129-f163-4813-bb62-e174014ecaf3', 1, '45 degrees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce204ffa-c837-4969-bdbc-a20c86535ff2', 'e4371129-f163-4813-bb62-e174014ecaf3', 2, '60 degrees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88c8df85-a502-4f21-8550-3ac3a0b71104', 'e4371129-f163-4813-bb62-e174014ecaf3', 3, '90 degrees');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e4371129-f163-4813-bb62-e174014ecaf3', '36d4917e-0d67-45bf-ba4a-19bdb617a401', 'Range R = u^2*sin(2*theta)/g is maximized when sin(2*theta) = 1, i.e., theta = 45 degrees.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6bacce81-1449-4a39-bffc-8284d4d851ba', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 41, 'Two vectors of equal magnitude A acting at an angle of 120 degrees to each other have a resultant of magnitude:', 'Physics', 'Motion in a Plane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c561f2a-bdb3-4df4-90ca-c71afb7ef71b', '6bacce81-1449-4a39-bffc-8284d4d851ba', 0, '2A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8a5ec7b-a0d1-4714-8e72-8383324a01b4', '6bacce81-1449-4a39-bffc-8284d4d851ba', 1, 'A');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7c4b8d3-4da1-4e5a-8811-e2fd9e818e23', '6bacce81-1449-4a39-bffc-8284d4d851ba', 2, 'A*sqrt(2)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2cbb1f0e-e6df-4918-96a6-1e4c46c2547d', '6bacce81-1449-4a39-bffc-8284d4d851ba', 3, 'A*sqrt(3)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6bacce81-1449-4a39-bffc-8284d4d851ba', 'f8a5ec7b-a0d1-4714-8e72-8383324a01b4', 'Resultant = sqrt(A^2 + A^2 + 2A^2*cos(120)) = sqrt(2A^2 - A^2) = A, since cos(120) = -0.5.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5ab66be3-e356-4e7f-97b3-b34decf762e8', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 42, 'The phenomenon by which heat is transferred through a vacuum is:', 'Physics', 'Thermal Properties of Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34bd04c6-7030-420d-9261-ffcb5e410942', '5ab66be3-e356-4e7f-97b3-b34decf762e8', 0, 'Conduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90e7090f-acb6-4327-9d80-45a60db13666', '5ab66be3-e356-4e7f-97b3-b34decf762e8', 1, 'Convection');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6ba609a-bfb8-43ca-bd12-dbd720bc52f9', '5ab66be3-e356-4e7f-97b3-b34decf762e8', 2, 'Radiation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a005f64-9c6e-4c23-8014-3b9b74daf330', '5ab66be3-e356-4e7f-97b3-b34decf762e8', 3, 'Diffusion');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5ab66be3-e356-4e7f-97b3-b34decf762e8', 'e6ba609a-bfb8-43ca-bd12-dbd720bc52f9', 'Radiation is the only mode of heat transfer that does not require a material medium and can occur through a vacuum.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c586cadb-0946-477c-b2ea-4d23cb3c44b6', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 43, 'A Wheatstone bridge is used to accurately measure:', 'Physics', 'Current Electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('633f2eab-faa6-4a79-903a-e60a97f1d797', 'c586cadb-0946-477c-b2ea-4d23cb3c44b6', 0, 'EMF of a cell');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28f468c6-d081-4797-b666-4e251a69978b', 'c586cadb-0946-477c-b2ea-4d23cb3c44b6', 1, 'Unknown resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33946643-78dc-4e64-8028-d2c2bdb7e9d7', 'c586cadb-0946-477c-b2ea-4d23cb3c44b6', 2, 'Capacitance of a capacitor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75813bf8-ff9b-4742-ace6-d390195e8164', 'c586cadb-0946-477c-b2ea-4d23cb3c44b6', 3, 'Frequency of AC supply');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c586cadb-0946-477c-b2ea-4d23cb3c44b6', '28f468c6-d081-4797-b666-4e251a69978b', 'The Wheatstone bridge is a null-deflection method used to precisely determine an unknown resistance by balancing a bridge circuit.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('208dfd93-a8b9-40cc-bbca-f639d46ba0f1', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 44, 'Total internal reflection occurs when light travels from a denser medium to a rarer medium and the angle of incidence:', 'Physics', 'Ray Optics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9bb34fad-e30d-4ee3-a8d7-3e8feb26bfac', '208dfd93-a8b9-40cc-bbca-f639d46ba0f1', 0, 'Is less than the critical angle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('576662ce-bfae-45ed-a619-51a29bcfdacc', '208dfd93-a8b9-40cc-bbca-f639d46ba0f1', 1, 'Equals zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f4886cd-136c-4b25-9e48-58d72ff73ebb', '208dfd93-a8b9-40cc-bbca-f639d46ba0f1', 2, 'Exceeds the critical angle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e2822d6-039f-46f1-9adc-fd7670f95d9f', '208dfd93-a8b9-40cc-bbca-f639d46ba0f1', 3, 'Equals 90 degrees exactly at the interface');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('208dfd93-a8b9-40cc-bbca-f639d46ba0f1', '3f4886cd-136c-4b25-9e48-58d72ff73ebb', 'Total internal reflection occurs only when going from denser to rarer medium AND the angle of incidence exceeds the critical angle (beyond which refraction cannot occur, per Snell''s law).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a678d665-fdc9-49d8-a2ea-9caed41b0c14', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 45, 'Lenz''s law is a consequence of which fundamental principle?', 'Physics', 'Electromagnetic Induction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c9a6921-8bf6-42e2-8231-10d7a6c7cfca', 'a678d665-fdc9-49d8-a2ea-9caed41b0c14', 0, 'Conservation of charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c95f90be-dfc3-4121-af12-cefb25b84b3c', 'a678d665-fdc9-49d8-a2ea-9caed41b0c14', 1, 'Conservation of energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47308f57-0db0-42e7-84a4-4dd1639c9f18', 'a678d665-fdc9-49d8-a2ea-9caed41b0c14', 2, 'Conservation of linear momentum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c267275-d115-481a-bce1-539ccb749365', 'a678d665-fdc9-49d8-a2ea-9caed41b0c14', 3, 'Conservation of angular momentum');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a678d665-fdc9-49d8-a2ea-9caed41b0c14', 'c95f90be-dfc3-4121-af12-cefb25b84b3c', 'Lenz''s law (induced current opposes the change causing it) is a statement of the conservation of energy applied to electromagnetic induction.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Chemistry (45 questions) — Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c417575d-d20e-4f16-bc27-9687d48abeb0', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 46, 'One mole of any substance contains how many elementary entities (Avogadro''s number)?', 'Chemistry', 'Some Basic Concepts of Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5dbdd27-841d-4f49-92a5-2105c29aad26', 'c417575d-d20e-4f16-bc27-9687d48abeb0', 0, '6.022 x 10^22');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45f84e25-1302-481f-910c-40c2125b4313', 'c417575d-d20e-4f16-bc27-9687d48abeb0', 1, '6.022 x 10^23');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f93d50b-b40e-42fc-88f9-664d70d432ab', 'c417575d-d20e-4f16-bc27-9687d48abeb0', 2, '3.011 x 10^23');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86116735-bbd7-429c-bde9-f3f0d4e7f9f0', 'c417575d-d20e-4f16-bc27-9687d48abeb0', 3, '1.660 x 10^-24');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c417575d-d20e-4f16-bc27-9687d48abeb0', '45f84e25-1302-481f-910c-40c2125b4313', 'Avogadro''s number, N_A = 6.022 x 10^23 per mole, is the number of elementary entities in one mole of a substance.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('55733b49-31bf-4fb3-815d-a6f513aa821a', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 47, 'The electronic configuration of an element with atomic number 17 (chlorine) is:', 'Chemistry', 'Structure of Atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07402cb7-cf07-487c-b097-4362fb6b57e3', '55733b49-31bf-4fb3-815d-a6f513aa821a', 0, '2, 8, 7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f21c93b-050a-4457-983c-50778e71a843', '55733b49-31bf-4fb3-815d-a6f513aa821a', 1, '2, 8, 8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('690c1e47-beba-4f1e-8140-588d329b6466', '55733b49-31bf-4fb3-815d-a6f513aa821a', 2, '2, 7, 8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b53aa6d-54ec-4440-b53c-81b89716eb41', '55733b49-31bf-4fb3-815d-a6f513aa821a', 3, '8, 8, 1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('55733b49-31bf-4fb3-815d-a6f513aa821a', '07402cb7-cf07-487c-b097-4362fb6b57e3', 'Chlorine (Z=17): 1s2 2s2 2p6 3s2 3p5, i.e., shell distribution 2, 8, 7.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('098186e8-6b69-46c3-ba5e-971b5c0323ea', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 48, 'According to the Heisenberg Uncertainty Principle, it is impossible to simultaneously determine with absolute precision:', 'Chemistry', 'Structure of Atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94c61826-1768-4b17-a6e5-a4408f907011', '098186e8-6b69-46c3-ba5e-971b5c0323ea', 0, 'The mass and charge of an electron');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8cf84e8-54f3-4484-a454-79aa9e73bd6d', '098186e8-6b69-46c3-ba5e-971b5c0323ea', 1, 'The position and momentum of a microscopic particle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebd69801-420a-40a3-a3b7-dcb4178ab233', '098186e8-6b69-46c3-ba5e-971b5c0323ea', 2, 'The energy and frequency of a photon');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d543c885-1f83-4cfe-9e29-d25396f31991', '098186e8-6b69-46c3-ba5e-971b5c0323ea', 3, 'The wavelength and speed of light');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('098186e8-6b69-46c3-ba5e-971b5c0323ea', 'a8cf84e8-54f3-4484-a454-79aa9e73bd6d', 'Heisenberg''s principle: delta(x)*delta(p) >= h/(4*pi) — position and momentum of a particle cannot both be known with arbitrary precision simultaneously.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2551384f-bdf7-4544-b40d-8a119bb83ca1', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 49, 'On moving from left to right across a period in the periodic table, atomic radius generally:', 'Chemistry', 'Classification of Elements and Periodicity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e54d40fb-47b7-4bb9-82f2-ad11cf60f477', '2551384f-bdf7-4544-b40d-8a119bb83ca1', 0, 'Increases due to increasing nuclear charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2894cc7f-e2e0-4c59-b5bb-bfb554ee86fc', '2551384f-bdf7-4544-b40d-8a119bb83ca1', 1, 'Decreases due to increasing effective nuclear charge pulling electrons closer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d776b859-dc22-4505-b2c3-2a49707b120d', '2551384f-bdf7-4544-b40d-8a119bb83ca1', 2, 'Remains constant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0259ea33-ef2e-4d21-8467-c7e9c676cc87', '2551384f-bdf7-4544-b40d-8a119bb83ca1', 3, 'Increases due to increasing number of shells');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2551384f-bdf7-4544-b40d-8a119bb83ca1', '2894cc7f-e2e0-4c59-b5bb-bfb554ee86fc', 'Across a period, electrons are added to the same shell while nuclear charge increases, so effective nuclear charge increases and pulls the electron cloud inward, decreasing atomic radius.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('79aed0d1-acd1-4a6b-9df9-759ddc7e5bbe', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 50, 'Ionization enthalpy generally increases across a period and decreases down a group because:', 'Chemistry', 'Classification of Elements and Periodicity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf56f231-8fc3-4842-8e44-d22bd7684a54', '79aed0d1-acd1-4a6b-9df9-759ddc7e5bbe', 0, 'Atomic size decreases across a period (harder to remove electron) and increases down a group (easier to remove electron)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('306f75b2-7ded-4f1b-bdf6-dce902431adb', '79aed0d1-acd1-4a6b-9df9-759ddc7e5bbe', 1, 'Nuclear charge decreases across a period');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa411c89-3656-48be-a965-a2267cf94300', '79aed0d1-acd1-4a6b-9df9-759ddc7e5bbe', 2, 'Electrons are added to a new shell across a period');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aaade3ff-c612-426b-b249-bbb60f6dedac', '79aed0d1-acd1-4a6b-9df9-759ddc7e5bbe', 3, 'It is unrelated to atomic size');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('79aed0d1-acd1-4a6b-9df9-759ddc7e5bbe', 'cf56f231-8fc3-4842-8e44-d22bd7684a54', 'Smaller atomic radius across a period means the outermost electron is held more tightly (higher ionization enthalpy); larger radius down a group means the outer electron is farther from the nucleus and easier to remove.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c8a41767-f81d-4238-9341-a39baf34e0f4', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 51, 'According to VSEPR theory, the shape of a molecule with 4 bond pairs and 0 lone pairs around the central atom is:', 'Chemistry', 'Chemical Bonding and Molecular Structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6bb6acf-0cc8-41b8-9f3f-c4d821b82ddc', 'c8a41767-f81d-4238-9341-a39baf34e0f4', 0, 'Trigonal planar');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be97709f-d38b-4f54-b515-dff47a774a78', 'c8a41767-f81d-4238-9341-a39baf34e0f4', 1, 'Tetrahedral');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6c06e50-2a58-4526-bf90-d95ec0913694', 'c8a41767-f81d-4238-9341-a39baf34e0f4', 2, 'Linear');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc9792d9-e4d3-4acc-b68e-273ba1a09211', 'c8a41767-f81d-4238-9341-a39baf34e0f4', 3, 'Square planar');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c8a41767-f81d-4238-9341-a39baf34e0f4', 'be97709f-d38b-4f54-b515-dff47a774a78', '4 bond pairs and 0 lone pairs (AB4 type) gives a tetrahedral geometry, e.g., CH4.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('acaffd43-66fe-45d4-af4d-9bfe1b8ca7e3', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 52, 'The hybridization of carbon in ethyne (C2H2), which contains a carbon-carbon triple bond, is:', 'Chemistry', 'Chemical Bonding and Molecular Structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6c58f99-5b69-473d-891a-af4e71a72a9a', 'acaffd43-66fe-45d4-af4d-9bfe1b8ca7e3', 0, 'sp3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6320abc-95bb-45de-9ac5-32533047b020', 'acaffd43-66fe-45d4-af4d-9bfe1b8ca7e3', 1, 'sp2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c8ecbc7-8668-4b68-aa90-51229c784c8d', 'acaffd43-66fe-45d4-af4d-9bfe1b8ca7e3', 2, 'sp');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39f6228c-39ea-4e4f-a37b-e8120bcf2fc5', 'acaffd43-66fe-45d4-af4d-9bfe1b8ca7e3', 3, 'dsp2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('acaffd43-66fe-45d4-af4d-9bfe1b8ca7e3', '4c8ecbc7-8668-4b68-aa90-51229c784c8d', 'Each carbon in ethyne is sp hybridized, forming one sigma bond to the other carbon, one sigma bond to hydrogen, and two pi bonds making up the triple bond.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9a888bee-6ae1-40ec-b251-4bc1072014d6', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 53, 'According to the ideal gas equation PV = nRT, at constant temperature and number of moles, pressure and volume are related by:', 'Chemistry', 'States of Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('faf1df28-578e-4eb6-9a98-0eb44a0af734', '9a888bee-6ae1-40ec-b251-4bc1072014d6', 0, 'Direct proportionality (Charles''s law)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8c6d58e-a66c-48f3-925a-e2eb119f6c95', '9a888bee-6ae1-40ec-b251-4bc1072014d6', 1, 'Inverse proportionality (Boyle''s law)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('181d76f6-0712-4e35-ab24-a7f8a03f33bb', '9a888bee-6ae1-40ec-b251-4bc1072014d6', 2, 'No relationship');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15a4cc5e-7b05-4d7a-8a3b-85614505dae2', '9a888bee-6ae1-40ec-b251-4bc1072014d6', 3, 'Direct proportionality to the square of volume');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9a888bee-6ae1-40ec-b251-4bc1072014d6', 'a8c6d58e-a66c-48f3-925a-e2eb119f6c95', 'At constant T and n, PV = constant, so P is inversely proportional to V — this is Boyle''s law.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e13471cb-1410-4ec6-ac44-6b23d1e9d4c3', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 54, 'For an exothermic reaction, the enthalpy change (delta H) is:', 'Chemistry', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6495389-ef76-448e-a98e-5fbea8797caf', 'e13471cb-1410-4ec6-ac44-6b23d1e9d4c3', 0, 'Positive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a29ba012-0088-4717-9561-4d9e5b1b6358', 'e13471cb-1410-4ec6-ac44-6b23d1e9d4c3', 1, 'Negative');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1dddd851-1f2c-4e69-9851-389e7af2f456', 'e13471cb-1410-4ec6-ac44-6b23d1e9d4c3', 2, 'Zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6682f8e4-ad49-40ab-b81c-9f4f01bab73b', 'e13471cb-1410-4ec6-ac44-6b23d1e9d4c3', 3, 'Undefined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e13471cb-1410-4ec6-ac44-6b23d1e9d4c3', 'a29ba012-0088-4717-9561-4d9e5b1b6358', 'In an exothermic reaction, heat is released to the surroundings, so the enthalpy of the products is lower than reactants, giving delta H < 0.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('916bbfe6-5b9d-4853-863b-e8e70ecbd502', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 55, 'The second law of thermodynamics states that the entropy of an isolated system:', 'Chemistry', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('463956fb-2205-4b8d-8441-053503ca2dc1', '916bbfe6-5b9d-4853-863b-e8e70ecbd502', 0, 'Always decreases spontaneously');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('414e9191-4885-4055-bf64-5a072bc0c9a9', '916bbfe6-5b9d-4853-863b-e8e70ecbd502', 1, 'Always increases or remains constant for a spontaneous process');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfb9172c-ab85-4014-b64c-4764eae5a03d', '916bbfe6-5b9d-4853-863b-e8e70ecbd502', 2, 'Remains constant in all processes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75c48727-e7fb-44d8-ba8c-37239b693645', '916bbfe6-5b9d-4853-863b-e8e70ecbd502', 3, 'Is always zero');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('916bbfe6-5b9d-4853-863b-e8e70ecbd502', '414e9191-4885-4055-bf64-5a072bc0c9a9', 'The second law states that entropy of an isolated system tends to increase for spontaneous (irreversible) processes and stays constant only for reversible processes.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('56f324cf-4081-410a-8ecd-68ecf8f267be', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 56, 'According to Le Chatelier''s principle, if the pressure on a gaseous equilibrium system is increased, the equilibrium shifts toward the side with:', 'Chemistry', 'Equilibrium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('859229b8-329b-4b43-a461-66b51b32cfd4', '56f324cf-4081-410a-8ecd-68ecf8f267be', 0, 'Fewer moles of gas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd7e91bb-3580-485a-a864-6bae8225ca21', '56f324cf-4081-410a-8ecd-68ecf8f267be', 1, 'More moles of gas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d663386f-a6f7-44f8-acaf-24ec1134d0e5', '56f324cf-4081-410a-8ecd-68ecf8f267be', 2, 'No change regardless of moles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f924eee-5392-4b62-94b0-61dd0737cc35', '56f324cf-4081-410a-8ecd-68ecf8f267be', 3, 'Only the reactant side, regardless of moles');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('56f324cf-4081-410a-8ecd-68ecf8f267be', '859229b8-329b-4b43-a461-66b51b32cfd4', 'Increasing pressure shifts equilibrium toward the side with fewer gas moles, to partially counteract the pressure increase, per Le Chatelier''s principle.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c3318296-3355-44df-be2b-8621e0e96544', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 57, 'A buffer solution resists change in pH upon addition of small amounts of acid or base because it contains:', 'Chemistry', 'Equilibrium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c710e10-bf97-4a80-87f6-ef3c7cb82c03', 'c3318296-3355-44df-be2b-8621e0e96544', 0, 'Only a strong acid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('190ebf56-f17b-4e13-8246-fd9ed2eca5af', 'c3318296-3355-44df-be2b-8621e0e96544', 1, 'A weak acid/base and its conjugate base/acid in comparable amounts');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bfd27ddd-8f46-4c67-b694-4ce20434a7d8', 'c3318296-3355-44df-be2b-8621e0e96544', 2, 'Pure water only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('134dd3a1-2772-4eb3-ad3e-594a7f319e6d', 'c3318296-3355-44df-be2b-8621e0e96544', 3, 'Only a strong base');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c3318296-3355-44df-be2b-8621e0e96544', '190ebf56-f17b-4e13-8246-fd9ed2eca5af', 'A buffer (e.g., weak acid + its conjugate base) can neutralize small added amounts of H+ or OH- without a large pH shift, because both components are present in significant quantity.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('75e55b81-7be1-415b-a860-21fbb39cad84', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 58, 'In the reaction Zn + Cu2+ -> Zn2+ + Cu, zinc is:', 'Chemistry', 'Redox Reactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c91dcd29-2f1a-40f1-86ee-c5b2edbfa5b5', '75e55b81-7be1-415b-a860-21fbb39cad84', 0, 'Reduced, since it loses electrons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b2487f3-f4ae-4277-a20c-7b9dcfe050a9', '75e55b81-7be1-415b-a860-21fbb39cad84', 1, 'Oxidized, since it loses electrons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7553797b-2a75-42c1-9829-00f054bcc175', '75e55b81-7be1-415b-a860-21fbb39cad84', 2, 'Neither oxidized nor reduced');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abf881e8-e2b8-4f6d-85b8-fe62d615037a', '75e55b81-7be1-415b-a860-21fbb39cad84', 3, 'Acting as an oxidizing agent');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('75e55b81-7be1-415b-a860-21fbb39cad84', '6b2487f3-f4ae-4277-a20c-7b9dcfe050a9', 'Zinc loses electrons (Zn -> Zn2+ + 2e-), which is oxidation; it acts as the reducing agent since Cu2+ is reduced by gaining those electrons.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ea560172-2d71-4a0a-bf50-bf0b9913c371', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 59, 'Inductive effect refers to:', 'Chemistry', 'Organic Chemistry — Basic Principles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62c08b24-abe9-4e94-a373-bf8cf947632e', 'ea560172-2d71-4a0a-bf50-bf0b9913c371', 0, 'The permanent displacement of pi electrons in a conjugated system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0678fed-e627-44d2-9c3d-63779956db80', 'ea560172-2d71-4a0a-bf50-bf0b9913c371', 1, 'The permanent displacement of sigma electrons along a chain due to electronegativity differences');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4cd209e-efd1-473b-96df-c67f0e7d242f', 'ea560172-2d71-4a0a-bf50-bf0b9913c371', 2, 'The temporary polarization of a bond under attack by a reagent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88bc9c89-5b17-43bd-a763-d894eeb0a44e', 'ea560172-2d71-4a0a-bf50-bf0b9913c371', 3, 'Resonance stabilization of a carbocation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ea560172-2d71-4a0a-bf50-bf0b9913c371', 'c0678fed-e627-44d2-9c3d-63779956db80', 'The inductive effect is the permanent polarization of sigma bonds caused by an electronegative (or electropositive) atom/group, transmitted (with decreasing effect) along a carbon chain.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4bcc7585-2bf5-47f2-9a45-3e76f7f75025', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 60, 'A nucleophile is a species that:', 'Chemistry', 'Organic Chemistry — Basic Principles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b74d4bad-93ee-4f86-b1cf-9621824334f6', '4bcc7585-2bf5-47f2-9a45-3e76f7f75025', 0, 'Is electron-deficient and seeks electrons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3846c3c8-724f-4eaf-bb98-fedcc126ed69', '4bcc7585-2bf5-47f2-9a45-3e76f7f75025', 1, 'Is electron-rich and donates an electron pair to form a new bond');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e4bcbee-681e-4133-af8a-565d5c65956e', '4bcc7585-2bf5-47f2-9a45-3e76f7f75025', 2, 'Always carries a positive charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3849bbf-6688-4be2-9066-7d4e11158b3d', '4bcc7585-2bf5-47f2-9a45-3e76f7f75025', 3, 'Cannot react with carbocations');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4bcc7585-2bf5-47f2-9a45-3e76f7f75025', '3846c3c8-724f-4eaf-bb98-fedcc126ed69', 'Nucleophiles (''nucleus-loving'') are electron-rich species (anions or neutral molecules with lone pairs) that donate an electron pair to an electrophilic centre.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('112b9dbc-4f48-4c6b-92cc-de725e3587fc', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 61, 'Alkanes undergo which characteristic type of reaction with halogens in the presence of sunlight or heat?', 'Chemistry', 'Hydrocarbons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('332246b8-0fd5-4ee5-9cc8-ed90dd301f28', '112b9dbc-4f48-4c6b-92cc-de725e3587fc', 0, 'Addition reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec10d9f0-179f-41bd-8ef3-4063b19f72b6', '112b9dbc-4f48-4c6b-92cc-de725e3587fc', 1, 'Free radical substitution reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69724c61-ca34-4b03-aa75-5f73d996adbe', '112b9dbc-4f48-4c6b-92cc-de725e3587fc', 2, 'Electrophilic addition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d395fc58-63ac-4082-b03c-cc8cbcab0bdb', '112b9dbc-4f48-4c6b-92cc-de725e3587fc', 3, 'Nucleophilic substitution');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('112b9dbc-4f48-4c6b-92cc-de725e3587fc', 'ec10d9f0-179f-41bd-8ef3-4063b19f72b6', 'Saturated alkanes undergo free-radical halogenation (substitution) under UV light/heat, since they lack pi bonds for addition reactions.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b886e48b-3d34-492a-997e-6c0dcf8e58cc', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 62, 'Markovnikov''s rule for the addition of HX to an unsymmetrical alkene states that:', 'Chemistry', 'Hydrocarbons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1476f36c-b5d8-4e34-ba62-62436888c2aa', 'b886e48b-3d34-492a-997e-6c0dcf8e58cc', 0, 'Hydrogen adds to the carbon with fewer hydrogens already attached');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ac4bc07-ba40-4beb-95f2-520b2d8b3781', 'b886e48b-3d34-492a-997e-6c0dcf8e58cc', 1, 'Hydrogen adds to the carbon already bearing the greater number of hydrogen atoms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0676ee0a-96b3-4569-b819-9838514afd74', 'b886e48b-3d34-492a-997e-6c0dcf8e58cc', 2, 'The halogen always adds to the terminal carbon');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed0c32c2-a187-4328-a852-4ce90bcab6f9', 'b886e48b-3d34-492a-997e-6c0dcf8e58cc', 3, 'The reaction proceeds only via a free-radical mechanism');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b886e48b-3d34-492a-997e-6c0dcf8e58cc', '2ac4bc07-ba40-4beb-95f2-520b2d8b3781', 'Markovnikov''s rule: H adds to the carbon of the double bond that already has more H atoms, and X adds to the more substituted carbon (via the more stable carbocation intermediate).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6246358d-7e8f-44bd-ab4e-2e89767ae2eb', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 63, 'The depletion of the ozone layer is primarily caused by:', 'Chemistry', 'Environmental Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3afa6c3b-f7bb-4366-b6f5-02ffef1db14c', '6246358d-7e8f-44bd-ab4e-2e89767ae2eb', 0, 'Carbon dioxide emissions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('742538a3-8fdb-437a-a004-131215691ed0', '6246358d-7e8f-44bd-ab4e-2e89767ae2eb', 1, 'Chlorofluorocarbons (CFCs)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef6bab64-7789-496d-b0a4-c72ce25819a3', '6246358d-7e8f-44bd-ab4e-2e89767ae2eb', 2, 'Sulfur dioxide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4c49017-e7a6-49e6-80ec-60fc8c11ee85', '6246358d-7e8f-44bd-ab4e-2e89767ae2eb', 3, 'Water vapor');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6246358d-7e8f-44bd-ab4e-2e89767ae2eb', '742538a3-8fdb-437a-a004-131215691ed0', 'CFCs release chlorine atoms in the stratosphere under UV light, which catalytically destroy ozone molecules, causing ozone layer depletion.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('af481175-e4b4-40c3-a814-8ad487b5817f', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 64, 'In a body-centred cubic (bcc) unit cell, the number of atoms per unit cell is:', 'Chemistry', 'Solid State');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd08d67e-4639-4263-aa45-19c05f8bbb97', 'af481175-e4b4-40c3-a814-8ad487b5817f', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41de8c7d-ebb9-46a9-80fc-30c5b2e6fa82', 'af481175-e4b4-40c3-a814-8ad487b5817f', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('234db351-bb4c-429e-9d42-d81d04b31ea0', 'af481175-e4b4-40c3-a814-8ad487b5817f', 2, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ddd33e78-be72-4848-8f57-26c9f750726c', 'af481175-e4b4-40c3-a814-8ad487b5817f', 3, '6');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('af481175-e4b4-40c3-a814-8ad487b5817f', '41de8c7d-ebb9-46a9-80fc-30c5b2e6fa82', 'A bcc unit cell has 8 corner atoms (each contributing 1/8) plus 1 body-centre atom (contributing fully), giving 8*(1/8) + 1 = 2 atoms per unit cell.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('11a67bbf-cc0d-4812-ad10-7de684e4852a', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 65, 'According to Raoult''s law, the vapour pressure of a solution containing a non-volatile solute is:', 'Chemistry', 'Solutions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7978aa85-deb4-40e9-953c-36f0bd7efea6', '11a67bbf-cc0d-4812-ad10-7de684e4852a', 0, 'Higher than that of the pure solvent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27f92305-2186-47d2-bb2b-db3f74102ca2', '11a67bbf-cc0d-4812-ad10-7de684e4852a', 1, 'Lower than that of the pure solvent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8bb68ab5-8d44-4b90-8d5f-c2259d09cf59', '11a67bbf-cc0d-4812-ad10-7de684e4852a', 2, 'Equal to that of the pure solvent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd707f1d-f360-4366-9b3e-c5fd84abd517', '11a67bbf-cc0d-4812-ad10-7de684e4852a', 3, 'Independent of the solvent''s mole fraction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('11a67bbf-cc0d-4812-ad10-7de684e4852a', '27f92305-2186-47d2-bb2b-db3f74102ca2', 'Raoult''s law: partial vapour pressure of solvent = mole fraction of solvent x vapour pressure of pure solvent — since mole fraction of solvent < 1, the solution''s vapour pressure is lower than the pure solvent''s.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9ef5b203-3ad1-4f98-8844-4685c9b79449', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 66, 'In a galvanic cell, oxidation occurs at the:', 'Chemistry', 'Electrochemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa79523b-92b1-49d8-8693-a5b6f786d7eb', '9ef5b203-3ad1-4f98-8844-4685c9b79449', 0, 'Cathode');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c33237d9-60b2-4bc8-8470-286d88679f38', '9ef5b203-3ad1-4f98-8844-4685c9b79449', 1, 'Anode');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89f9ae81-dfdf-414d-ab50-35ce2930d073', '9ef5b203-3ad1-4f98-8844-4685c9b79449', 2, 'Salt bridge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64d04e60-f8b1-401a-9029-9d1ef7f4ba0a', '9ef5b203-3ad1-4f98-8844-4685c9b79449', 3, 'External circuit only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9ef5b203-3ad1-4f98-8844-4685c9b79449', 'c33237d9-60b2-4bc8-8470-286d88679f38', 'By convention, oxidation occurs at the anode and reduction at the cathode in both galvanic and electrolytic cells.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b055b808-d24a-4fec-9dff-c981188ce91b', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 67, 'The rate of a chemical reaction generally increases with an increase in temperature because:', 'Chemistry', 'Chemical Kinetics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d959c771-0718-464d-87e7-89ecfdd74a54', 'b055b808-d24a-4fec-9dff-c981188ce91b', 0, 'The activation energy of the reaction decreases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97ed889d-fcf1-4fa3-8648-f242e473dd8c', 'b055b808-d24a-4fec-9dff-c981188ce91b', 1, 'A greater fraction of molecules acquire energy equal to or greater than the activation energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c572178d-10c9-4547-aea0-9f3767f809b8', 'b055b808-d24a-4fec-9dff-c981188ce91b', 2, 'The concentration of reactants increases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ab76477-a5c5-4e74-99a6-3bc6685fa30b', 'b055b808-d24a-4fec-9dff-c981188ce91b', 3, 'The reaction becomes exothermic');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b055b808-d24a-4fec-9dff-c981188ce91b', '97ed889d-fcf1-4fa3-8648-f242e473dd8c', 'Per the Arrhenius/collision theory, raising temperature increases the fraction of molecules with kinetic energy >= activation energy, increasing the rate — the activation energy itself is unchanged by temperature.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5d02a335-6626-4dd8-b829-6571aca00fa5', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 68, 'Adsorption in which gas molecules are held on a solid surface by weak van der Waals forces is called:', 'Chemistry', 'Surface Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9cd62b47-2842-49c5-92a6-b71becce347f', '5d02a335-6626-4dd8-b829-6571aca00fa5', 0, 'Chemisorption');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3495ad7-a9c3-4edc-b75a-2968c1197a52', '5d02a335-6626-4dd8-b829-6571aca00fa5', 1, 'Physisorption');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2272b0f-fb73-40e4-b647-92e7a98f8d9f', '5d02a335-6626-4dd8-b829-6571aca00fa5', 2, 'Absorption');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ac7d114-0b0e-4d27-be16-53ddce460391', '5d02a335-6626-4dd8-b829-6571aca00fa5', 3, 'Ionization');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5d02a335-6626-4dd8-b829-6571aca00fa5', 'e3495ad7-a9c3-4edc-b75a-2968c1197a52', 'Physisorption (physical adsorption) involves weak van der Waals forces and is generally reversible, unlike chemisorption which involves strong chemical bond formation.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('403989f9-1fe6-42b7-a82f-5f269a9b23be', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 69, 'The process of roasting in metallurgy involves:', 'Chemistry', 'General Principles of Isolation of Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f4ffe36-46a0-4caf-9515-bfbe7d14fbe8', '403989f9-1fe6-42b7-a82f-5f269a9b23be', 0, 'Heating an ore strongly in the absence of air');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3afa93d5-f976-460c-bacd-54f42e6b65d1', '403989f9-1fe6-42b7-a82f-5f269a9b23be', 1, 'Heating a sulfide ore in the presence of excess air/oxygen to convert it to an oxide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3211ca1d-93e3-4881-a2c0-cdbf64639b2a', '403989f9-1fe6-42b7-a82f-5f269a9b23be', 2, 'Dissolving the ore in a suitable solvent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f5920a8-a847-4688-967f-3549296b75c1', '403989f9-1fe6-42b7-a82f-5f269a9b23be', 3, 'Reducing the ore using carbon in a blast furnace');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('403989f9-1fe6-42b7-a82f-5f269a9b23be', '3afa93d5-f976-460c-bacd-54f42e6b65d1', 'Roasting is heating a sulfide ore in excess air, converting sulfides to oxides (and releasing SO2); calcination, in contrast, is heating in limited/no air, typically for carbonate/hydroxide ores.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ba3327a0-9248-45f5-9e13-c992614adbc0', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 70, 'Which allotrope of phosphorus is more reactive and stored under water due to its instability in air?', 'Chemistry', 'p-Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89a9d2c5-2605-4f65-a584-24826c446fff', 'ba3327a0-9248-45f5-9e13-c992614adbc0', 0, 'Red phosphorus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0aa9cf45-4e6f-4512-a827-e5a2e420ea73', 'ba3327a0-9248-45f5-9e13-c992614adbc0', 1, 'Black phosphorus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('783851e1-8341-4a31-a309-f170eb725538', 'ba3327a0-9248-45f5-9e13-c992614adbc0', 2, 'White phosphorus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6d15a12-a27e-4cbe-bcd5-e564be393bf4', 'ba3327a0-9248-45f5-9e13-c992614adbc0', 3, 'Violet phosphorus');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ba3327a0-9248-45f5-9e13-c992614adbc0', '783851e1-8341-4a31-a309-f170eb725538', 'White phosphorus is highly reactive, spontaneously flammable in air, and is therefore stored under water; red phosphorus is comparatively far more stable.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('08e4f9a8-32cc-49fe-9d30-a5d437f3ab6b', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 71, 'Transition elements typically show variable oxidation states because:', 'Chemistry', 'd and f Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54b414db-6db9-4615-b523-d4c1e1af4e00', '08e4f9a8-32cc-49fe-9d30-a5d437f3ab6b', 0, 'They have completely filled d-orbitals only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4532735c-2501-4b31-94bf-0c18e4b10d21', '08e4f9a8-32cc-49fe-9d30-a5d437f3ab6b', 1, 'The energy difference between (n-1)d and ns orbitals is small, allowing electrons from both to participate in bonding');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7669184-30a3-406d-aae4-b5c603c26c94', '08e4f9a8-32cc-49fe-9d30-a5d437f3ab6b', 2, 'They lack d-orbitals entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9875bdbf-cbe5-4e3b-9a8b-59674da4b9e5', '08e4f9a8-32cc-49fe-9d30-a5d437f3ab6b', 3, 'Their atomic radius is unusually large');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('08e4f9a8-32cc-49fe-9d30-a5d437f3ab6b', '4532735c-2501-4b31-94bf-0c18e4b10d21', 'The small energy gap between (n-1)d and ns orbitals in transition metals allows a variable number of electrons from both to be involved in bond formation, giving multiple stable oxidation states.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('24f3255f-60bc-4bcc-89fc-265b47472a36', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 72, 'In the coordination compound [Co(NH3)6]Cl3, the coordination number of cobalt is:', 'Chemistry', 'Coordination Compounds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6de1f239-dd85-48e1-9c0c-e6060c969a28', '24f3255f-60bc-4bcc-89fc-265b47472a36', 0, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9c07eb5-ce6c-4256-8ab9-6af7efc2a00e', '24f3255f-60bc-4bcc-89fc-265b47472a36', 1, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2135ea69-2c8a-4181-82e0-19398c0eba74', '24f3255f-60bc-4bcc-89fc-265b47472a36', 2, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5bdd2a15-b899-4c1e-bd8b-9a6bcb05b2e8', '24f3255f-60bc-4bcc-89fc-265b47472a36', 3, '9');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('24f3255f-60bc-4bcc-89fc-265b47472a36', '2135ea69-2c8a-4181-82e0-19398c0eba74', 'Six NH3 ligands are directly bonded to the central Co ion, giving a coordination number of 6; the three Cl- are counter ions, not ligands.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ab0e1877-4f19-4b50-baa1-a415d119ee24', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 73, 'The SN1 reaction mechanism proceeds via which intermediate?', 'Chemistry', 'Haloalkanes and Haloarenes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7cf21d11-6bd1-462f-84a5-f03308078fa0', 'ab0e1877-4f19-4b50-baa1-a415d119ee24', 0, 'A carbanion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d657580-ec94-4c4d-975d-7cb723b06b21', 'ab0e1877-4f19-4b50-baa1-a415d119ee24', 1, 'A carbocation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c777d03-8ccd-4a3f-a9c0-27848a47b3b9', 'ab0e1877-4f19-4b50-baa1-a415d119ee24', 2, 'A free radical');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c25ffa0-1190-4a68-88ac-d9b7d0bcf653', 'ab0e1877-4f19-4b50-baa1-a415d119ee24', 3, 'A carbene');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ab0e1877-4f19-4b50-baa1-a415d119ee24', '3d657580-ec94-4c4d-975d-7cb723b06b21', 'SN1 (unimolecular nucleophilic substitution) proceeds through a carbocation intermediate formed after the leaving group departs, in a rate-determining step independent of nucleophile concentration.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f2bdcbe4-1a44-4701-93b6-837b80a5ae57', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 74, 'Phenol is more acidic than a typical aliphatic alcohol like ethanol because:', 'Chemistry', 'Alcohols, Phenols and Ethers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0fa7e74-746f-445e-8bc6-8c857ed844b0', 'f2bdcbe4-1a44-4701-93b6-837b80a5ae57', 0, 'The phenoxide ion is destabilized by resonance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('625f78d2-8451-48bf-8f0e-729f543ff379', 'f2bdcbe4-1a44-4701-93b6-837b80a5ae57', 1, 'The phenoxide ion formed after deprotonation is stabilized by resonance delocalization into the benzene ring');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b656fe1-6e91-4ec4-992c-3ecae078fb33', 'f2bdcbe4-1a44-4701-93b6-837b80a5ae57', 2, 'Phenol has a smaller molecular mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3424fd3-4651-43b2-8799-fd693f16fc0f', 'f2bdcbe4-1a44-4701-93b6-837b80a5ae57', 3, 'Ethanol has more hydrogen bonding');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f2bdcbe4-1a44-4701-93b6-837b80a5ae57', '625f78d2-8451-48bf-8f0e-729f543ff379', 'The phenoxide ion''s negative charge is delocalized over the aromatic ring by resonance, stabilizing it and making phenol''s O-H bond easier to ionize than an alkoxide from a simple alcohol.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('89ebfe34-bb56-42a5-8efb-cfb834d5e849', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 75, 'The Tollens'' test (silver mirror test) is used to distinguish:', 'Chemistry', 'Aldehydes, Ketones and Carboxylic Acids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('258cc5a2-211d-49a0-acd8-7055f393e0a4', '89ebfe34-bb56-42a5-8efb-cfb834d5e849', 0, 'Alkanes from alkenes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('716d8ccc-6e9c-4cef-8f33-b0ebd9ede493', '89ebfe34-bb56-42a5-8efb-cfb834d5e849', 1, 'Aldehydes (which give a positive test) from ketones (which generally do not)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('947dfe58-6524-43bc-a7b7-320866095d8f', '89ebfe34-bb56-42a5-8efb-cfb834d5e849', 2, 'Alcohols from ethers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9578495d-b26c-409b-83be-6ef10cbbd7a0', '89ebfe34-bb56-42a5-8efb-cfb834d5e849', 3, 'Acids from bases');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('89ebfe34-bb56-42a5-8efb-cfb834d5e849', '716d8ccc-6e9c-4cef-8f33-b0ebd9ede493', 'Tollens'' reagent oxidizes aldehydes to carboxylate ions while being reduced to metallic silver (the ''mirror''); ketones generally do not react (except alpha-hydroxy ketones).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8e01fa1f-e948-420a-bd8b-a3c4a1cb3f93', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 76, 'Aliphatic amines are generally more basic than aniline (an aromatic amine) because:', 'Chemistry', 'Amines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bde2b317-028a-4409-9bb7-20c34baf237b', '8e01fa1f-e948-420a-bd8b-a3c4a1cb3f93', 0, 'The lone pair on nitrogen in aniline is delocalized into the benzene ring, reducing its availability for protonation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e250e803-b8c2-4d0d-bfbd-61ce101e0f4c', '8e01fa1f-e948-420a-bd8b-a3c4a1cb3f93', 1, 'Aliphatic amines have no lone pair on nitrogen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c40fbf2c-fff9-40b4-8c55-f9cb9acc77d5', '8e01fa1f-e948-420a-bd8b-a3c4a1cb3f93', 2, 'Aniline has a stronger inductive effect');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7595596f-bfe3-4b14-8ee1-f13757fd74bc', '8e01fa1f-e948-420a-bd8b-a3c4a1cb3f93', 3, 'Aromatic rings always increase basicity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8e01fa1f-e948-420a-bd8b-a3c4a1cb3f93', 'bde2b317-028a-4409-9bb7-20c34baf237b', 'In aniline, the nitrogen lone pair is conjugated with the aromatic ring, making it less available to accept a proton, hence aniline is a weaker base than aliphatic amines.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c9028b3b-0ee1-45dc-9ba1-95e8614fa1fb', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 77, 'The primary structure of a protein refers to:', 'Chemistry', 'Biomolecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f9014fc-5f9e-4c3e-bc55-ed361c1159ab', 'c9028b3b-0ee1-45dc-9ba1-95e8614fa1fb', 0, 'Its three-dimensional folded shape');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ba3c779-11f4-4463-b928-5c7acc875c76', 'c9028b3b-0ee1-45dc-9ba1-95e8614fa1fb', 1, 'The linear sequence of amino acids joined by peptide bonds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('afa58880-6739-4dc3-8eba-8fae012629ba', 'c9028b3b-0ee1-45dc-9ba1-95e8614fa1fb', 2, 'The alpha-helix and beta-sheet arrangement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0cec322a-3324-4c7a-beb6-873e565f33a0', 'c9028b3b-0ee1-45dc-9ba1-95e8614fa1fb', 3, 'The aggregation of multiple polypeptide subunits');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c9028b3b-0ee1-45dc-9ba1-95e8614fa1fb', '2ba3c779-11f4-4463-b928-5c7acc875c76', 'Primary structure = the specific linear sequence of amino acids in the polypeptide chain; secondary structure refers to alpha-helix/beta-sheet, tertiary to 3D folding, quaternary to subunit assembly.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3a9219c9-77f3-482f-b620-9b8e36c1a739', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 78, 'Glucose and fructose are examples of:', 'Chemistry', 'Biomolecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ca6c317-069d-4ad3-b723-a5ec9217b3ac', '3a9219c9-77f3-482f-b620-9b8e36c1a739', 0, 'Disaccharides');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96def4a6-f3e7-4ffa-9f2d-e3334dc42080', '3a9219c9-77f3-482f-b620-9b8e36c1a739', 1, 'Monosaccharides');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('243c5b15-4462-4808-b074-5c4b1c7ad012', '3a9219c9-77f3-482f-b620-9b8e36c1a739', 2, 'Polysaccharides');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('443edc95-5a33-4e2b-916d-a78f79d2a804', '3a9219c9-77f3-482f-b620-9b8e36c1a739', 3, 'Proteins');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3a9219c9-77f3-482f-b620-9b8e36c1a739', '96def4a6-f3e7-4ffa-9f2d-e3334dc42080', 'Glucose and fructose are both monosaccharides (simple sugars) that cannot be hydrolyzed into simpler carbohydrate units.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9673210f-7037-4f33-b79b-3e462e05544d', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 79, 'Natural rubber is a polymer of:', 'Chemistry', 'Polymers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c65a5c1e-28a3-4f04-9065-3bca6a526a8a', '9673210f-7037-4f33-b79b-3e462e05544d', 0, 'Ethylene');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a86dd26d-a6dd-45aa-af3d-ca5c09705e45', '9673210f-7037-4f33-b79b-3e462e05544d', 1, 'Isoprene (2-methyl-1,3-butadiene)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9abc15e1-9579-408d-9bdd-6c93f8d237c9', '9673210f-7037-4f33-b79b-3e462e05544d', 2, 'Styrene');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cac8645-6905-465b-a281-bbae25f8821a', '9673210f-7037-4f33-b79b-3e462e05544d', 3, 'Vinyl chloride');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9673210f-7037-4f33-b79b-3e462e05544d', 'a86dd26d-a6dd-45aa-af3d-ca5c09705e45', 'Natural rubber (polyisoprene) is formed by the polymerization of isoprene units, primarily in the cis configuration.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d5f95f43-1b78-4724-a591-4aaa96a0baa4', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 80, 'Antipyretics are drugs used to:', 'Chemistry', 'Chemistry in Everyday Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a61eda6-5565-4323-b687-a7fcf8f50e9f', 'd5f95f43-1b78-4724-a591-4aaa96a0baa4', 0, 'Relieve pain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4f09edb-ed77-455d-b0c8-601e08feb9e2', 'd5f95f43-1b78-4724-a591-4aaa96a0baa4', 1, 'Reduce fever');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fcf3bdf2-662b-44f1-bf7b-9a58a64b2031', 'd5f95f43-1b78-4724-a591-4aaa96a0baa4', 2, 'Kill bacteria');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34ff02ef-5579-4432-a41b-d0a5f8f1825f', 'd5f95f43-1b78-4724-a591-4aaa96a0baa4', 3, 'Reduce inflammation only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d5f95f43-1b78-4724-a591-4aaa96a0baa4', 'd4f09edb-ed77-455d-b0c8-601e08feb9e2', 'Antipyretics specifically act to reduce fever (elevated body temperature); analgesics relieve pain and antibiotics kill/inhibit bacteria.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8feeb997-babe-40b0-967e-b6ede6d25cf3', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 81, 'A molecule with 3 bond pairs and 1 lone pair around the central atom (AB3E type) has a molecular shape described as:', 'Chemistry', 'Chemical Bonding and Molecular Structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bec2c8d7-0453-4ab2-b363-65dc406a9603', '8feeb997-babe-40b0-967e-b6ede6d25cf3', 0, 'Tetrahedral');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f6275ff-182b-4f59-8ca2-acd41bb49109', '8feeb997-babe-40b0-967e-b6ede6d25cf3', 1, 'Trigonal pyramidal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cef98c7-f68e-4421-9561-ff8a0f23bbde', '8feeb997-babe-40b0-967e-b6ede6d25cf3', 2, 'T-shaped');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb2bf5c0-ae32-42ac-9bcb-c8cb09d2a279', '8feeb997-babe-40b0-967e-b6ede6d25cf3', 3, 'Trigonal planar');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8feeb997-babe-40b0-967e-b6ede6d25cf3', '2f6275ff-182b-4f59-8ca2-acd41bb49109', 'With one lone pair pushing the three bond pairs together, the electron geometry is tetrahedral but the molecular shape (ignoring the lone pair) is trigonal pyramidal, e.g., NH3.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('dbf7f1fc-eb7d-447b-a564-ecc2220e8369', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 82, 'At the critical temperature of a gas, the distinction between liquid and gas phases:', 'Chemistry', 'States of Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33c97c80-dec2-4689-a8e8-fdd1a0fb3d44', 'dbf7f1fc-eb7d-447b-a564-ecc2220e8369', 0, 'Becomes more pronounced');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53a3b70b-19b0-4b7a-bb6b-9bb983278112', 'dbf7f1fc-eb7d-447b-a564-ecc2220e8369', 1, 'Disappears — the gas cannot be liquefied above this temperature regardless of pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6fe2b997-3293-442f-b5fc-a4c2d13d1a5a', 'dbf7f1fc-eb7d-447b-a564-ecc2220e8369', 2, 'Is unaffected');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60adec17-2256-4d40-b6c5-a3d60af6f8f0', 'dbf7f1fc-eb7d-447b-a564-ecc2220e8369', 3, 'Only applies to ideal gases');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dbf7f1fc-eb7d-447b-a564-ecc2220e8369', '53a3b70b-19b0-4b7a-bb6b-9bb983278112', 'Above the critical temperature, no amount of pressure can liquefy a gas — the liquid and gas phases become indistinguishable (critical point behavior).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6d9e2c3f-22b9-4f8a-9c64-53dde023541e', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 83, 'The pH of a neutral aqueous solution at 25 degrees Celsius is:', 'Chemistry', 'Equilibrium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5080e947-2983-4b08-9193-2e27c49459d1', '6d9e2c3f-22b9-4f8a-9c64-53dde023541e', 0, '0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75771210-de18-4008-b1e5-8c996d26bcca', '6d9e2c3f-22b9-4f8a-9c64-53dde023541e', 1, '7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b4504caa-3f57-454e-be07-9f0623f92ebc', '6d9e2c3f-22b9-4f8a-9c64-53dde023541e', 2, '14');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c056d0e-4820-4777-b015-d47b2d81b870', '6d9e2c3f-22b9-4f8a-9c64-53dde023541e', 3, '1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6d9e2c3f-22b9-4f8a-9c64-53dde023541e', '75771210-de18-4008-b1e5-8c996d26bcca', 'At 25 degrees C, pure water has [H+] = [OH-] = 10^-7 M, giving pH = 7, defined as neutral.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('17342648-25d7-4187-ac19-011b39bd6bdd', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 84, 'The oxidation number of manganese in KMnO4 is:', 'Chemistry', 'Redox Reactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('025001ed-f1a0-42ab-8ac6-efacc9e845c3', '17342648-25d7-4187-ac19-011b39bd6bdd', 0, '+2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bcaa2cd3-35e6-434c-9cb2-13935f56eb01', '17342648-25d7-4187-ac19-011b39bd6bdd', 1, '+4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3743895-4201-4c03-9e5e-73680f91aec7', '17342648-25d7-4187-ac19-011b39bd6bdd', 2, '+6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b539154a-128b-4d3a-a0ba-d9388bfdf1e8', '17342648-25d7-4187-ac19-011b39bd6bdd', 3, '+7');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('17342648-25d7-4187-ac19-011b39bd6bdd', 'b539154a-128b-4d3a-a0ba-d9388bfdf1e8', 'K is +1, O is -2 (x4 = -8); for overall neutrality, +1 + Mn + (-8) = 0, so Mn = +7.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8a6218b7-f6fc-44c6-b71f-d72b9fdc14f6', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 85, 'The IUPAC name for the functional group -COOH is:', 'Chemistry', 'Organic Chemistry — Basic Principles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d59ec23-ad7e-4d87-b4bc-6b7661ff7a3e', '8a6218b7-f6fc-44c6-b71f-d72b9fdc14f6', 0, 'Aldehyde');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0aacb2c6-b88c-4abf-b34a-0b3536b92f8e', '8a6218b7-f6fc-44c6-b71f-d72b9fdc14f6', 1, 'Ketone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0893dae2-21eb-4c6f-a1fc-34348abb66df', '8a6218b7-f6fc-44c6-b71f-d72b9fdc14f6', 2, 'Carboxylic acid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d03da2d-644e-40bd-af98-3412b56a5363', '8a6218b7-f6fc-44c6-b71f-d72b9fdc14f6', 3, 'Ester');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8a6218b7-f6fc-44c6-b71f-d72b9fdc14f6', '0893dae2-21eb-4c6f-a1fc-34348abb66df', '-COOH is the carboxyl group, characteristic of carboxylic acids.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b933957c-41eb-4b64-bec3-c768d9c831cd', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 86, 'A spontaneous process at constant temperature and pressure is characterized by:', 'Chemistry', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62919e33-42b8-4fc5-a0e2-3bb9c99d1e87', 'b933957c-41eb-4b64-bec3-c768d9c831cd', 0, 'Positive Gibbs free energy change (delta G > 0)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b955cbb0-444c-4af4-b846-20a0b8b71b1d', 'b933957c-41eb-4b64-bec3-c768d9c831cd', 1, 'Negative Gibbs free energy change (delta G < 0)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e682a1f-c847-458e-bfc6-91358f90ad06', 'b933957c-41eb-4b64-bec3-c768d9c831cd', 2, 'Zero Gibbs free energy change always');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('345ea507-6ce7-4e0c-920f-e0661c6ffde7', 'b933957c-41eb-4b64-bec3-c768d9c831cd', 3, 'Positive enthalpy change only, regardless of entropy');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b933957c-41eb-4b64-bec3-c768d9c831cd', 'b955cbb0-444c-4af4-b846-20a0b8b71b1d', 'delta G = delta H - T*delta S; a process is spontaneous at constant T and P when delta G is negative.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6f39f9a3-cab5-4234-a328-08005f3dec1f', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 87, 'Molality of a solution is defined as:', 'Chemistry', 'Solutions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe71d7ec-560b-49d0-8b82-d4494e31a9e4', '6f39f9a3-cab5-4234-a328-08005f3dec1f', 0, 'Moles of solute per litre of solution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b228637-7ed3-4827-993c-acef02fc800e', '6f39f9a3-cab5-4234-a328-08005f3dec1f', 1, 'Moles of solute per kilogram of solvent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ed496f3-9b6f-4e77-bc5f-14051ed4ceac', '6f39f9a3-cab5-4234-a328-08005f3dec1f', 2, 'Grams of solute per litre of solvent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b97ea156-d55e-4056-b203-dd70b70c662d', '6f39f9a3-cab5-4234-a328-08005f3dec1f', 3, 'Moles of solute per mole of solvent');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6f39f9a3-cab5-4234-a328-08005f3dec1f', '0b228637-7ed3-4827-993c-acef02fc800e', 'Molality (m) = moles of solute / mass of solvent in kg — unlike molarity, it is temperature-independent since it uses mass, not volume.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('de65ca37-8287-4d02-b3c0-f5a13ef8f8ad', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 88, 'The maximum number of electrons that can be accommodated in the ''n=3'' shell is:', 'Chemistry', 'Structure of Atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f57e24a-82a2-480c-a0ee-1ab143823885', 'de65ca37-8287-4d02-b3c0-f5a13ef8f8ad', 0, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b9535f0-fd37-4b7a-8240-505dff0725bf', 'de65ca37-8287-4d02-b3c0-f5a13ef8f8ad', 1, '18');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60b79eb2-532c-46ef-b222-83a47a8a78bb', 'de65ca37-8287-4d02-b3c0-f5a13ef8f8ad', 2, '32');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a93fbfd7-13bd-48a9-aa4e-286969f3ca60', 'de65ca37-8287-4d02-b3c0-f5a13ef8f8ad', 3, '2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('de65ca37-8287-4d02-b3c0-f5a13ef8f8ad', '5b9535f0-fd37-4b7a-8240-505dff0725bf', 'Maximum electrons in a shell = 2n^2; for n=3, this is 2(3)^2 = 18.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('697e0cd2-2d1c-4ded-8d36-6cc3b9e1e923', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 89, 'Elements in the same group of the periodic table have similar chemical properties primarily because they have the same:', 'Chemistry', 'Classification of Elements and Periodicity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7af85bea-6684-4be8-9efc-8b3ca5aa6091', '697e0cd2-2d1c-4ded-8d36-6cc3b9e1e923', 0, 'Atomic mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8103d23c-9a2f-41e8-bfbd-4b587eba390a', '697e0cd2-2d1c-4ded-8d36-6cc3b9e1e923', 1, 'Number of valence electrons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e2fd584a-f492-4474-923d-d970db92d6aa', '697e0cd2-2d1c-4ded-8d36-6cc3b9e1e923', 2, 'Number of neutrons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3edc96e9-23d6-482f-bbf2-1885894bcbb7', '697e0cd2-2d1c-4ded-8d36-6cc3b9e1e923', 3, 'Atomic radius');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('697e0cd2-2d1c-4ded-8d36-6cc3b9e1e923', '8103d23c-9a2f-41e8-bfbd-4b587eba390a', 'Elements in a group share the same number of valence electrons, which determines their characteristic chemical behavior and bonding patterns.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('973a4056-f09f-4c39-b44a-fd4736e9c588', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 90, 'A colloid in which both the dispersed phase and dispersion medium are liquids is called:', 'Chemistry', 'Surface Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91856df8-1cec-46f5-9e7e-f6bc7e7cc122', '973a4056-f09f-4c39-b44a-fd4736e9c588', 0, 'Sol');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ddd5f95-3d8d-47a5-9858-43d1bb26e4f6', '973a4056-f09f-4c39-b44a-fd4736e9c588', 1, 'Emulsion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3506c8e6-3319-4c0a-9786-c80eb0027436', '973a4056-f09f-4c39-b44a-fd4736e9c588', 2, 'Foam');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7fd19b2-9ed2-489e-a274-93307a42305c', '973a4056-f09f-4c39-b44a-fd4736e9c588', 3, 'Aerosol');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('973a4056-f09f-4c39-b44a-fd4736e9c588', '2ddd5f95-3d8d-47a5-9858-43d1bb26e4f6', 'An emulsion is a colloidal system of one liquid dispersed in another immiscible liquid, e.g., milk (fat droplets dispersed in water).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Biology (90 questions) — Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f1b41498-c6a7-4f03-96f4-0389202967e3', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 91, 'Taxonomic hierarchy arranges categories from the most inclusive to the least inclusive as:', 'Biology', 'The Living World');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b1ed499-9d24-4178-b98b-d05b27266412', 'f1b41498-c6a7-4f03-96f4-0389202967e3', 0, 'Species -> Genus -> Family -> Order -> Class -> Phylum -> Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c292b402-d08d-4c24-ab8a-ea17877dacb8', 'f1b41498-c6a7-4f03-96f4-0389202967e3', 1, 'Kingdom -> Phylum -> Class -> Order -> Family -> Genus -> Species');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c180d352-535c-43ef-9023-37e417375b84', 'f1b41498-c6a7-4f03-96f4-0389202967e3', 2, 'Genus -> Species -> Kingdom -> Phylum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('913326fc-0262-498b-97db-679063dd73de', 'f1b41498-c6a7-4f03-96f4-0389202967e3', 3, 'Family -> Kingdom -> Genus -> Species');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f1b41498-c6a7-4f03-96f4-0389202967e3', 'c292b402-d08d-4c24-ab8a-ea17877dacb8', 'The taxonomic hierarchy proceeds from the broadest category (Kingdom) down to the most specific (Species): Kingdom, Phylum, Class, Order, Family, Genus, Species.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b93fe5f7-1b00-4905-bc69-55cbd359585c', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 92, 'Members of Kingdom Monera lack a well-defined nucleus and are described as:', 'Biology', 'Biological Classification');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0fefb2b-5951-42b8-807a-85813f1f7984', 'b93fe5f7-1b00-4905-bc69-55cbd359585c', 0, 'Eukaryotic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4980a9c5-1363-4872-8432-08dfc6025301', 'b93fe5f7-1b00-4905-bc69-55cbd359585c', 1, 'Prokaryotic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c69856e8-b2fc-47cf-b7ae-9adb85471210', 'b93fe5f7-1b00-4905-bc69-55cbd359585c', 2, 'Multicellular only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1de10c5-946c-4802-9535-adbe2b454adc', 'b93fe5f7-1b00-4905-bc69-55cbd359585c', 3, 'Photosynthetic only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b93fe5f7-1b00-4905-bc69-55cbd359585c', '4980a9c5-1363-4872-8432-08dfc6025301', 'Monera comprises prokaryotes (bacteria and archaea/cyanobacteria) that lack a membrane-bound nucleus and other membrane-bound organelles.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('fbf99f97-3a79-4241-8cb3-e0d18e851236', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 93, 'Bryophytes are often called the ''amphibians of the plant kingdom'' because:', 'Biology', 'Plant Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d84e12f4-e678-463e-95b2-efb13563b856', 'fbf99f97-3a79-4241-8cb3-e0d18e851236', 0, 'They live only in water');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e03097d3-275e-4611-8c0d-520429de3476', 'fbf99f97-3a79-4241-8cb3-e0d18e851236', 1, 'They require water for fertilization despite being able to live on land');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('367b2d04-f842-426a-a004-15b74a3d3252', 'fbf99f97-3a79-4241-8cb3-e0d18e851236', 2, 'They lack chlorophyll');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d196c167-5f20-4b26-ae95-2a2fec4465a7', 'fbf99f97-3a79-4241-8cb3-e0d18e851236', 3, 'They reproduce only asexually');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fbf99f97-3a79-4241-8cb3-e0d18e851236', 'e03097d3-275e-4611-8c0d-520429de3476', 'Bryophytes can grow on land but need external water for the motile male gametes to reach the egg during fertilization, similar to amphibians needing water to reproduce.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3064f787-c81f-4a6b-a811-1ea6134373fa', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 94, 'The dominant, independent generation in a fern (pteridophyte) life cycle is the:', 'Biology', 'Plant Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f6ada36-13cc-42d5-a0ae-daaad99ee569', '3064f787-c81f-4a6b-a811-1ea6134373fa', 0, 'Gametophyte');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('769342ad-fdf5-4b3b-8f9d-0a5fa9d9a075', '3064f787-c81f-4a6b-a811-1ea6134373fa', 1, 'Sporophyte');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ffe57b50-9227-4ece-b78e-135871f2d1f0', '3064f787-c81f-4a6b-a811-1ea6134373fa', 2, 'Prothallus only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83ddf3f9-b0f9-45f7-9c98-201d6011580a', '3064f787-c81f-4a6b-a811-1ea6134373fa', 3, 'Zygote');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3064f787-c81f-4a6b-a811-1ea6134373fa', '769342ad-fdf5-4b3b-8f9d-0a5fa9d9a075', 'In pteridophytes (unlike bryophytes), the sporophyte is the dominant, conspicuous, independent generation, while the gametophyte (prothallus) is small and short-lived.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8c8da942-6528-46ef-9dc0-1479494db383', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 95, 'Gymnosperms are characterized by seeds that are:', 'Biology', 'Plant Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04ef7c6d-c1aa-4bc5-854c-4e231fd88417', '8c8da942-6528-46ef-9dc0-1479494db383', 0, 'Enclosed within a fruit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b8eccba-3047-458b-9887-c0c0a2989634', '8c8da942-6528-46ef-9dc0-1479494db383', 1, 'Naked, not enclosed within an ovary/fruit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f85270f-7d9b-4d46-ad9f-79bf24809ace', '8c8da942-6528-46ef-9dc0-1479494db383', 2, 'Absent entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a72b3ff-1a37-47fc-b354-5ef77cf5ae39', '8c8da942-6528-46ef-9dc0-1479494db383', 3, 'Formed without fertilization');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8c8da942-6528-46ef-9dc0-1479494db383', '4b8eccba-3047-458b-9887-c0c0a2989634', '''Gymnosperm'' means ''naked seed'' — the ovules and resulting seeds are not enclosed within an ovary wall, unlike angiosperms.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('87e3a4c6-0d74-402b-9f72-2a8c0e1c172a', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 96, 'The root modification found in carrot, where the root itself is swollen for food storage, is called:', 'Biology', 'Morphology of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25a89d8f-4a1d-4328-802d-c475cc187783', '87e3a4c6-0d74-402b-9f72-2a8c0e1c172a', 0, 'Fibrous root');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e10c656-c882-46e5-89cc-2e5ae7223854', '87e3a4c6-0d74-402b-9f72-2a8c0e1c172a', 1, 'Tap root modified into a storage root (e.g., conical/napiform)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7efdc0b0-d50b-4886-bdae-7979c7d07394', '87e3a4c6-0d74-402b-9f72-2a8c0e1c172a', 2, 'Adventitious prop root');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2a86abf-411f-4ff9-b178-1ec094afab47', '87e3a4c6-0d74-402b-9f72-2a8c0e1c172a', 3, 'Pneumatophore');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('87e3a4c6-0d74-402b-9f72-2a8c0e1c172a', '7e10c656-c882-46e5-89cc-2e5ae7223854', 'In carrot, the primary tap root swells and stores food, forming a conical storage root — a common tap-root modification.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d4b584f4-01d3-44d9-b8e6-d6996c1c8f8b', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 97, 'A racemose inflorescence differs from a cymose inflorescence in that:', 'Biology', 'Morphology of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('afb5285a-358e-4003-9206-6af2570c6ff0', 'd4b584f4-01d3-44d9-b8e6-d6996c1c8f8b', 0, 'The main axis continues to grow and produces flowers laterally in acropetal succession');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f4653e2-7125-4441-b047-08b71f062c6a', 'd4b584f4-01d3-44d9-b8e6-d6996c1c8f8b', 1, 'The main axis terminates in a flower, and growth continues via lateral branches');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cceb7162-ad1c-4835-b392-c77327c1119b', 'd4b584f4-01d3-44d9-b8e6-d6996c1c8f8b', 2, 'It never has more than one flower');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5830d0de-3974-4800-838a-b46fc811971e', 'd4b584f4-01d3-44d9-b8e6-d6996c1c8f8b', 3, 'It is found only in gymnosperms');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d4b584f4-01d3-44d9-b8e6-d6996c1c8f8b', 'afb5285a-358e-4003-9206-6af2570c6ff0', 'In racemose inflorescences, the main axis keeps growing indefinitely and produces flowers laterally, with younger flowers near the apex (acropetal order); in cymose types, the main axis ends in a flower, limiting further apical growth.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('89c1fd6f-decd-495a-a4dd-94c1b287ed7d', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 98, 'The tissue responsible for secondary growth (increase in girth) in dicot stems is the:', 'Biology', 'Anatomy of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a05b0f28-f3b7-40f2-a59d-f3e78677de1c', '89c1fd6f-decd-495a-a4dd-94c1b287ed7d', 0, 'Apical meristem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0c76197-e3f7-4c7d-9259-6dd606e9886c', '89c1fd6f-decd-495a-a4dd-94c1b287ed7d', 1, 'Vascular cambium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('037e30b1-2f35-4bff-b2c7-07307b9b78c8', '89c1fd6f-decd-495a-a4dd-94c1b287ed7d', 2, 'Protoderm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3719a464-23ef-41f6-a641-8f7b9a9b8648', '89c1fd6f-decd-495a-a4dd-94c1b287ed7d', 3, 'Root cap');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('89c1fd6f-decd-495a-a4dd-94c1b287ed7d', 'd0c76197-e3f7-4c7d-9259-6dd606e9886c', 'Vascular cambium, a lateral meristem, produces secondary xylem and phloem, causing the increase in girth known as secondary growth.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b695f3ac-eef4-433a-95a1-50f393b588b5', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 99, 'Xylem tissue is primarily responsible for:', 'Biology', 'Anatomy of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a25d2326-2edd-49ab-8d10-694f3d66176a', 'b695f3ac-eef4-433a-95a1-50f393b588b5', 0, 'Transport of manufactured food (sugars)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1c4beaa-76c7-4aac-90ff-fded34b0082f', 'b695f3ac-eef4-433a-95a1-50f393b588b5', 1, 'Conduction of water and minerals from roots to other plant parts');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f5b5656-16dc-4438-818f-004933bcaff1', 'b695f3ac-eef4-433a-95a1-50f393b588b5', 2, 'Photosynthesis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1d387f2-16e6-484d-bc18-5020c66ae41e', 'b695f3ac-eef4-433a-95a1-50f393b588b5', 3, 'Gaseous exchange');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b695f3ac-eef4-433a-95a1-50f393b588b5', 'c1c4beaa-76c7-4aac-90ff-fded34b0082f', 'Xylem conducts water and dissolved minerals upward from roots; phloem is responsible for translocating photosynthetic products (food).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('610b7477-b0bd-4e45-a407-ceda0dbb9230', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 100, 'Which cell organelle is known as the ''powerhouse of the cell''?', 'Biology', 'Cell — The Unit of Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b566879-7b37-4ad3-b7ac-c74e01987d62', '610b7477-b0bd-4e45-a407-ceda0dbb9230', 0, 'Golgi apparatus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e8b42b1-f696-40a7-999b-6a2a87a2c817', '610b7477-b0bd-4e45-a407-ceda0dbb9230', 1, 'Mitochondria');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c65a927-a0a1-4a2b-b1ec-0dfacb2df827', '610b7477-b0bd-4e45-a407-ceda0dbb9230', 2, 'Lysosome');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23b806ee-33a1-4504-84e5-0751cb9dbc0e', '610b7477-b0bd-4e45-a407-ceda0dbb9230', 3, 'Ribosome');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('610b7477-b0bd-4e45-a407-ceda0dbb9230', '2e8b42b1-f696-40a7-999b-6a2a87a2c817', 'Mitochondria carry out aerobic respiration, producing most of the cell''s ATP, earning them the nickname ''powerhouse of the cell''.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('997c0201-a159-4a47-a638-77296262cd11', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 101, 'The fluid mosaic model of the plasma membrane, proposed by Singer and Nicolson, describes the membrane as composed of:', 'Biology', 'Cell — The Unit of Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('71f5a43f-cb5c-4248-8868-f7f303548d13', '997c0201-a159-4a47-a638-77296262cd11', 0, 'A rigid, static bilayer of proteins only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16f50723-dc87-4aad-bb1b-04ea6de763f1', '997c0201-a159-4a47-a638-77296262cd11', 1, 'A lipid bilayer with proteins that can move laterally within the fluid lipid matrix');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b058da95-61c2-484d-9fbf-6afdc4657a21', '997c0201-a159-4a47-a638-77296262cd11', 2, 'A single layer of carbohydrates');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f50f3309-2b2a-4fc0-a217-01883cad0fdc', '997c0201-a159-4a47-a638-77296262cd11', 3, 'A cellulose wall with no lipids');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('997c0201-a159-4a47-a638-77296262cd11', '16f50723-dc87-4aad-bb1b-04ea6de763f1', 'The fluid mosaic model describes the membrane as a dynamic, fluid lipid bilayer in which proteins are embedded and can move laterally, giving a ''mosaic'' pattern.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f4f495be-a181-4312-a70b-6dcdf1a0e904', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 102, 'Enzymes act as biological catalysts primarily by:', 'Biology', 'Biomolecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96726c07-3ee9-4d94-9f3e-26d55f47bc3b', 'f4f495be-a181-4312-a70b-6dcdf1a0e904', 0, 'Increasing the free energy of the products');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26f36c09-4e0b-432a-adf5-365f61a716a7', 'f4f495be-a181-4312-a70b-6dcdf1a0e904', 1, 'Lowering the activation energy required for a reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16d503b7-d61a-4af6-952a-01ee4b85ee24', 'f4f495be-a181-4312-a70b-6dcdf1a0e904', 2, 'Being consumed in the reaction they catalyze');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad36f300-f561-4c97-8351-691f7a27f881', 'f4f495be-a181-4312-a70b-6dcdf1a0e904', 3, 'Making reactions endothermic');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f4f495be-a181-4312-a70b-6dcdf1a0e904', '26f36c09-4e0b-432a-adf5-365f61a716a7', 'Enzymes speed up reactions by lowering the activation energy needed, without being consumed or altering the overall thermodynamics (delta G) of the reaction.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b3b97a10-ae74-4f7c-a520-2c9b3861e4d5', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 103, 'During which phase of mitosis do chromosomes align at the equatorial plate (metaphase plate)?', 'Biology', 'Cell Cycle and Cell Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c0df44c-c017-4117-a14c-fa512b4cf01f', 'b3b97a10-ae74-4f7c-a520-2c9b3861e4d5', 0, 'Prophase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96cc6aad-7cf0-49c3-a314-ac08dfbe5274', 'b3b97a10-ae74-4f7c-a520-2c9b3861e4d5', 1, 'Metaphase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe0e7219-2820-4517-95b4-8f5ab060feaa', 'b3b97a10-ae74-4f7c-a520-2c9b3861e4d5', 2, 'Anaphase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed010594-8e54-42a2-8138-cada27e818f1', 'b3b97a10-ae74-4f7c-a520-2c9b3861e4d5', 3, 'Telophase');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b3b97a10-ae74-4f7c-a520-2c9b3861e4d5', '96cc6aad-7cf0-49c3-a314-ac08dfbe5274', 'In metaphase, chromosomes (each with two chromatids) align at the cell''s equatorial plane, attached to spindle fibres via kinetochores.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c77d6599-2d5a-45c2-a3c0-35f7cb2788d5', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 104, 'Meiosis results in the formation of gametes with:', 'Biology', 'Cell Cycle and Cell Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c225f2e9-3851-4972-9aaf-c8770d843c78', 'c77d6599-2d5a-45c2-a3c0-35f7cb2788d5', 0, 'The same chromosome number as the parent cell (2n)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ca2ac9f-8a14-4ba4-8f85-f492c433cfe3', 'c77d6599-2d5a-45c2-a3c0-35f7cb2788d5', 1, 'Half the chromosome number of the parent cell (n), introducing genetic variation via crossing over');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9347b15d-af7e-4f97-b20e-6ae2b8f3bba8', 'c77d6599-2d5a-45c2-a3c0-35f7cb2788d5', 2, 'Double the chromosome number');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ace78465-ed45-4ce4-a52c-d55fcc9aca43', 'c77d6599-2d5a-45c2-a3c0-35f7cb2788d5', 3, 'No chromosomes at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c77d6599-2d5a-45c2-a3c0-35f7cb2788d5', '5ca2ac9f-8a14-4ba4-8f85-f492c433cfe3', 'Meiosis is a reductional division producing haploid (n) gametes from diploid (2n) parent cells, with crossing over during prophase I introducing genetic variation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ca8328d4-62f3-4866-878f-88695f2836bc', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 105, 'The light-dependent reactions of photosynthesis occur in the:', 'Biology', 'Photosynthesis in Higher Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9acab4f-fcc8-4255-b0bf-64afd691ccf8', 'ca8328d4-62f3-4866-878f-88695f2836bc', 0, 'Stroma of the chloroplast');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f110ccf1-0825-47de-bc09-802c3d168dc6', 'ca8328d4-62f3-4866-878f-88695f2836bc', 1, 'Thylakoid membrane of the chloroplast');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25b18168-8bf9-4f20-be2b-ead94cb4d210', 'ca8328d4-62f3-4866-878f-88695f2836bc', 2, 'Cytoplasm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8279507b-dae3-4c7b-a880-f523b0726266', 'ca8328d4-62f3-4866-878f-88695f2836bc', 3, 'Mitochondrial matrix');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ca8328d4-62f3-4866-878f-88695f2836bc', 'f110ccf1-0825-47de-bc09-802c3d168dc6', 'Light reactions (photolysis of water, electron transport, ATP/NADPH generation) occur in the thylakoid membranes; the Calvin cycle (dark/light-independent reactions) occurs in the stroma.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3c2f5f82-9bca-4fd4-8749-8c6b282fa708', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 106, 'In C4 plants, the primary CO2 acceptor in mesophyll cells is:', 'Biology', 'Photosynthesis in Higher Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92485575-c53e-4e1b-8ea9-08521ad1435a', '3c2f5f82-9bca-4fd4-8749-8c6b282fa708', 0, 'RuBP (ribulose bisphosphate)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f45e1602-9147-4f5a-b4c1-fb5a7010a756', '3c2f5f82-9bca-4fd4-8749-8c6b282fa708', 1, 'PEP (phosphoenolpyruvate)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07d241d4-4c23-46bb-bcd9-4230a837319d', '3c2f5f82-9bca-4fd4-8749-8c6b282fa708', 2, 'Glucose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dca154c3-6440-4bbb-92c9-4efc235b2211', '3c2f5f82-9bca-4fd4-8749-8c6b282fa708', 3, 'Oxaloacetate directly from the atmosphere');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3c2f5f82-9bca-4fd4-8749-8c6b282fa708', 'f45e1602-9147-4f5a-b4c1-fb5a7010a756', 'C4 plants first fix CO2 using PEP carboxylase, with PEP as the acceptor, forming oxaloacetate (a 4-carbon compound) — distinct from C3 plants, which use RuBP directly via RuBisCO.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('009b34f2-8087-4904-8e1a-6edc239cfa6a', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 107, 'Glycolysis, the first stage of cellular respiration, occurs in the:', 'Biology', 'Respiration in Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e223fc7-a2c2-4105-8ed3-e7fde43535c9', '009b34f2-8087-4904-8e1a-6edc239cfa6a', 0, 'Mitochondrial matrix');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b53f2cb-6576-477e-87f8-67631e2c40cd', '009b34f2-8087-4904-8e1a-6edc239cfa6a', 1, 'Cytoplasm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('532698e6-d1ad-473d-bbac-3424f337d5df', '009b34f2-8087-4904-8e1a-6edc239cfa6a', 2, 'Nucleus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c48c638-1857-4329-b793-9ce41a987821', '009b34f2-8087-4904-8e1a-6edc239cfa6a', 3, 'Chloroplast');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('009b34f2-8087-4904-8e1a-6edc239cfa6a', '2b53f2cb-6576-477e-87f8-67631e2c40cd', 'Glycolysis (breakdown of glucose to pyruvate) takes place in the cytoplasm/cytosol, independent of oxygen availability, prior to the Krebs cycle occurring in the mitochondrial matrix.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2753d324-2339-46a6-a2c2-df055c7c307a', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 108, 'The complete aerobic oxidation of one molecule of glucose yields approximately how many net ATP molecules (as commonly cited in NCERT)?', 'Biology', 'Respiration in Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b4a5cf1-058c-4f04-8233-4b2bffafbec9', '2753d324-2339-46a6-a2c2-df055c7c307a', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac4567b8-8511-41e4-a025-44cc4b561143', '2753d324-2339-46a6-a2c2-df055c7c307a', 1, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('932b13bd-6807-415e-b70b-639581af27eb', '2753d324-2339-46a6-a2c2-df055c7c307a', 2, '36-38');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('469c1347-8c1e-41b9-9fbd-15faecd94420', '2753d324-2339-46a6-a2c2-df055c7c307a', 3, '100');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2753d324-2339-46a6-a2c2-df055c7c307a', '932b13bd-6807-415e-b70b-639581af27eb', 'NCERT''s commonly cited approximate net yield from complete aerobic respiration of one glucose molecule is about 36-38 ATP, accounting for glycolysis, Krebs cycle, and oxidative phosphorylation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c2e3d686-b69f-4acf-923f-d341fad475aa', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 109, 'Auxins, a class of plant hormones, are primarily known for promoting:', 'Biology', 'Plant Growth and Development');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('865b50a3-d79e-447c-a98b-20abce0e1013', 'c2e3d686-b69f-4acf-923f-d341fad475aa', 0, 'Leaf senescence only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ea8f344-400e-441d-9cac-1215f1d69af0', 'c2e3d686-b69f-4acf-923f-d341fad475aa', 1, 'Cell elongation and apical dominance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d9122af-b646-4f60-b99f-6a1c3471a626', 'c2e3d686-b69f-4acf-923f-d341fad475aa', 2, 'Seed dormancy exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e398462f-5c86-497f-8604-0d5c0372d775', 'c2e3d686-b69f-4acf-923f-d341fad475aa', 3, 'Stomatal closure only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c2e3d686-b69f-4acf-923f-d341fad475aa', '0ea8f344-400e-441d-9cac-1215f1d69af0', 'Auxins promote cell elongation (especially in shoots) and are responsible for apical dominance — suppression of lateral bud growth by the terminal bud.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('48b4b81a-2c5e-4e0e-875a-3b0f41cc6083', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 110, 'Gibberellins are well known for their role in:', 'Biology', 'Plant Growth and Development');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89f17a6d-5858-49a0-8b0c-049348b63191', '48b4b81a-2c5e-4e0e-875a-3b0f41cc6083', 0, 'Causing stem elongation (''bolting'') and breaking seed/bud dormancy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef43c4e3-28c2-49c5-b844-fc784645d613', '48b4b81a-2c5e-4e0e-875a-3b0f41cc6083', 1, 'Inhibiting all growth processes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad07c6ca-be37-4b7c-943b-1b02a7ce6372', '48b4b81a-2c5e-4e0e-875a-3b0f41cc6083', 2, 'Causing leaf abscission exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8cf4d762-2e7e-4846-b32a-bfd3974757d7', '48b4b81a-2c5e-4e0e-875a-3b0f41cc6083', 3, 'Closing stomata under water stress');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('48b4b81a-2c5e-4e0e-875a-3b0f41cc6083', '89f17a6d-5858-49a0-8b0c-049348b63191', 'Gibberellins promote internode/stem elongation (famously demonstrated in genetically dwarf plants) and help break dormancy in seeds and buds.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('033d8eb7-1934-4d9f-8e2c-e8e7334bec05', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 111, 'Double fertilization in angiosperms results in the formation of:', 'Biology', 'Sexual Reproduction in Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87568dfd-940b-46ca-9e71-602dbb5e39ea', '033d8eb7-1934-4d9f-8e2c-e8e7334bec05', 0, 'Only the zygote');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68d26940-4545-4580-848d-e36158181860', '033d8eb7-1934-4d9f-8e2c-e8e7334bec05', 1, 'The diploid zygote and the triploid primary endosperm nucleus (PEN)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c60de8fc-66e9-4492-a4ba-016b973882c7', '033d8eb7-1934-4d9f-8e2c-e8e7334bec05', 2, 'Two identical zygotes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d3c1bc9-1d55-41b6-a7a3-a298d114ba79', '033d8eb7-1934-4d9f-8e2c-e8e7334bec05', 3, 'Only the endosperm, with no zygote');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('033d8eb7-1934-4d9f-8e2c-e8e7334bec05', '68d26940-4545-4580-848d-e36158181860', 'One male gamete fuses with the egg to form the diploid zygote; the second fuses with the two polar nuclei to form the triploid PEN, which develops into the endosperm — this dual fusion event is unique to angiosperms.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('45a495cc-6ab4-4080-a429-b7fd4a4faf36', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 112, 'Pollination in which pollen grains are transferred from the anther to the stigma of the same flower is called:', 'Biology', 'Sexual Reproduction in Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('885fa817-b08e-44c8-814f-d6e3bbc278d1', '45a495cc-6ab4-4080-a429-b7fd4a4faf36', 0, 'Xenogamy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35b0ee0a-c5f5-4fbc-bd99-36fbb6d81c8b', '45a495cc-6ab4-4080-a429-b7fd4a4faf36', 1, 'Geitonogamy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88305528-2b74-4454-b68e-e9e1eb5a2077', '45a495cc-6ab4-4080-a429-b7fd4a4faf36', 2, 'Autogamy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6cb06579-ae35-4876-b080-34e2fb5b5356', '45a495cc-6ab4-4080-a429-b7fd4a4faf36', 3, 'Cross-pollination');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('45a495cc-6ab4-4080-a429-b7fd4a4faf36', '88305528-2b74-4454-b68e-e9e1eb5a2077', 'Autogamy is self-pollination within the same flower; geitonogamy is transfer between different flowers of the same plant; xenogamy is transfer between flowers of genetically different plants.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('267c2855-babc-431d-b9c3-4cf92add1f6e', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 113, 'According to Mendel''s Law of Segregation, the two alleles for a trait:', 'Biology', 'Principles of Inheritance and Variation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55598e9f-24b4-4b75-9045-6d6cd3865773', '267c2855-babc-431d-b9c3-4cf92add1f6e', 0, 'Always blend together in the offspring');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3ade06c-a52b-4a5d-8453-160a09b2889e', '267c2855-babc-431d-b9c3-4cf92add1f6e', 1, 'Segregate from each other during gamete formation, so each gamete receives only one allele');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07e70091-b794-4062-b1cd-4936f540e943', '267c2855-babc-431d-b9c3-4cf92add1f6e', 2, 'Are always identical in a heterozygote');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62a623e3-bd8b-4968-859c-ae62c0ec4677', '267c2855-babc-431d-b9c3-4cf92add1f6e', 3, 'Never separate, staying together in every gamete');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('267c2855-babc-431d-b9c3-4cf92add1f6e', 'a3ade06c-a52b-4a5d-8453-160a09b2889e', 'The Law of Segregation states that allele pairs separate (segregate) during gamete formation, so each gamete carries only one allele for each gene, later re-paired upon fertilization.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3acd002f-65ad-457d-9aae-d8c8f8269902', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 114, 'A cross between a heterozygous tall pea plant (Tt) and a homozygous dwarf pea plant (tt) is an example of a:', 'Biology', 'Principles of Inheritance and Variation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('927f4b5d-940d-4b72-a0fd-79df4e662ff8', '3acd002f-65ad-457d-9aae-d8c8f8269902', 0, 'Dihybrid cross');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af630097-4d0d-486e-a5e3-5db6e5f5e89a', '3acd002f-65ad-457d-9aae-d8c8f8269902', 1, 'Test cross');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('467fa0c9-ff3b-4214-a72f-8bd655f0508a', '3acd002f-65ad-457d-9aae-d8c8f8269902', 2, 'Reciprocal cross only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef68d381-b989-4cc9-8ca3-8046f113f527', '3acd002f-65ad-457d-9aae-d8c8f8269902', 3, 'Back-cross exclusively with F1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3acd002f-65ad-457d-9aae-d8c8f8269902', 'af630097-4d0d-486e-a5e3-5db6e5f5e89a', 'Crossing an individual of unknown/heterozygous genotype with a homozygous recessive individual (tt) is a test cross, used to determine the unknown genotype from the phenotypic ratio of offspring.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c275d9de-6c7a-413b-8965-614a1bc0c874', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 115, 'Human blood group inheritance (ABO system) is an example of which genetic phenomenon, since the IA and IB alleles are both fully expressed in a heterozygote?', 'Biology', 'Principles of Inheritance and Variation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51bb75e8-423b-4999-8d36-48de39863589', 'c275d9de-6c7a-413b-8965-614a1bc0c874', 0, 'Incomplete dominance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('997459cc-5cc2-4501-bb6e-a8ef67911b3e', 'c275d9de-6c7a-413b-8965-614a1bc0c874', 1, 'Codominance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9876129-4b0b-463e-af4c-ab3085f3a857', 'c275d9de-6c7a-413b-8965-614a1bc0c874', 2, 'Complete dominance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('464a8550-dc42-4440-a648-b62011073819', 'c275d9de-6c7a-413b-8965-614a1bc0c874', 3, 'Sex-linked inheritance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c275d9de-6c7a-413b-8965-614a1bc0c874', '997459cc-5cc2-4501-bb6e-a8ef67911b3e', 'In genotype IAIB, both A and B antigens are expressed simultaneously and fully on red blood cells — this is codominance, distinct from incomplete dominance where a blended intermediate phenotype appears.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f2e97f6b-ae86-4e17-84d1-e95ef66df176', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 116, 'The Watson-Crick model of DNA describes it as a double helix in which the two strands are:', 'Biology', 'Molecular Basis of Inheritance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70a4d4ea-27aa-40af-8fb0-6106b34f7011', 'f2e97f6b-ae86-4e17-84d1-e95ef66df176', 0, 'Parallel and identical in sequence');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0be263d1-f33c-4318-a6b6-bb5eef1763d3', 'f2e97f6b-ae86-4e17-84d1-e95ef66df176', 1, 'Antiparallel, held together by hydrogen bonds between complementary base pairs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ca2a38d-a615-450e-b282-2acf04586330', 'f2e97f6b-ae86-4e17-84d1-e95ef66df176', 2, 'Connected only by covalent bonds between bases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42877ca8-ec1d-4b16-af8c-c9c5137d5ab5', 'f2e97f6b-ae86-4e17-84d1-e95ef66df176', 3, 'Single-stranded with no base pairing');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f2e97f6b-ae86-4e17-84d1-e95ef66df176', '0be263d1-f33c-4318-a6b6-bb5eef1763d3', 'DNA''s two strands run antiparallel (5'' to 3'' and 3'' to 5'') and are held together by hydrogen bonds between complementary bases (A-T via 2 bonds, G-C via 3 bonds).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('15e0c515-2ef4-4757-ae47-02801b253508', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 117, 'The process by which the genetic information in mRNA is used to synthesize a protein is called:', 'Biology', 'Molecular Basis of Inheritance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('16dc3379-2edd-415a-a0f4-c3164101817b', '15e0c515-2ef4-4757-ae47-02801b253508', 0, 'Replication');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3eef38d-363f-4900-8ef4-6bae373c6892', '15e0c515-2ef4-4757-ae47-02801b253508', 1, 'Transcription');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('71d81f74-bd7e-4925-8fed-fe37f61425fa', '15e0c515-2ef4-4757-ae47-02801b253508', 2, 'Translation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('786d48e5-5428-4c43-92f4-4713861aa8d4', '15e0c515-2ef4-4757-ae47-02801b253508', 3, 'Transformation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('15e0c515-2ef4-4757-ae47-02801b253508', '71d81f74-bd7e-4925-8fed-fe37f61425fa', 'Translation is the process at the ribosome where mRNA codons are read and translated into a specific sequence of amino acids, forming a polypeptide; transcription is DNA to mRNA.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0e8a61d6-6c34-425e-ac85-9f4193d64988', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 118, 'Darwin''s theory of evolution by natural selection proposes that:', 'Biology', 'Evolution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d31d4fb-fff8-4899-844c-d3dbd641655c', '0e8a61d6-6c34-425e-ac85-9f4193d64988', 0, 'Acquired characteristics during an organism''s life are inherited by offspring');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ed36e37-23ca-42b5-9d3e-fd4127dbeebe', '0e8a61d6-6c34-425e-ac85-9f4193d64988', 1, 'Individuals with heritable variations better suited to the environment tend to survive and reproduce more successfully over generations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5208edf0-05b9-470d-a947-20329637b93c', '0e8a61d6-6c34-425e-ac85-9f4193d64988', 2, 'All species were created independently and do not change');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f4237dd-ebad-4825-b803-8e3fa1368d69', '0e8a61d6-6c34-425e-ac85-9f4193d64988', 3, 'Evolution occurs by the inheritance of use and disuse of organs');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0e8a61d6-6c34-425e-ac85-9f4193d64988', '0ed36e37-23ca-42b5-9d3e-fd4127dbeebe', 'Natural selection: heritable variation exists in populations; individuals with favorable variations for their environment have a survival/reproductive advantage, and these traits become more common over generations — distinct from Lamarck''s discredited inheritance-of-acquired-characteristics idea.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('33abbb0b-a6f0-4416-85a8-e84f4d81b9ea', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 119, 'The Hardy-Weinberg principle describes a population that is NOT evolving, requiring conditions such as:', 'Biology', 'Evolution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24e5ad95-4a25-4f51-8226-1ad6333fc773', '33abbb0b-a6f0-4416-85a8-e84f4d81b9ea', 0, 'Random mating, no mutation, no migration, no natural selection, and a large population size');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7949aa3b-7d75-4899-95f6-d6a8081237bf', '33abbb0b-a6f0-4416-85a8-e84f4d81b9ea', 1, 'Small population size with frequent genetic drift');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e24f6c3a-f2a5-4ff0-a56f-417e40d2618b', '33abbb0b-a6f0-4416-85a8-e84f4d81b9ea', 2, 'Continuous mutation and non-random mating');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9d332f6-bac4-460d-b422-c79bc7684f75', '33abbb0b-a6f0-4416-85a8-e84f4d81b9ea', 3, 'Ongoing natural selection favoring one allele');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('33abbb0b-a6f0-4416-85a8-e84f4d81b9ea', '24e5ad95-4a25-4f51-8226-1ad6333fc773', 'Hardy-Weinberg equilibrium is a theoretical baseline requiring random mating, absence of mutation/migration/selection, and a sufficiently large population — violation of any condition can cause allele frequencies to shift (i.e., evolution).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('30a6ed0e-9051-4360-a19b-b61fcd6fbf92', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 120, 'Apiculture refers to the rearing and management of:', 'Biology', 'Strategies for Enhancement in Food Production');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4acecb92-0e40-4039-a408-dfc2baececef', '30a6ed0e-9051-4360-a19b-b61fcd6fbf92', 0, 'Fish');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a7e78ee-d2e4-432f-9b4d-d626428b0d0e', '30a6ed0e-9051-4360-a19b-b61fcd6fbf92', 1, 'Honeybees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('804be585-0829-4fe8-8794-d823ebd2650f', '30a6ed0e-9051-4360-a19b-b61fcd6fbf92', 2, 'Silkworms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('781234ba-ff40-4a6b-be29-4192a07e70b0', '30a6ed0e-9051-4360-a19b-b61fcd6fbf92', 3, 'Poultry');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('30a6ed0e-9051-4360-a19b-b61fcd6fbf92', '9a7e78ee-d2e4-432f-9b4d-d626428b0d0e', 'Apiculture is beekeeping — the maintenance of honeybee colonies for honey, wax, and pollination services.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6da6254e-d95a-494d-9348-abddbe730dc6', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 121, 'The bacterium commonly used in the commercial production of curd from milk is:', 'Biology', 'Microbes in Human Welfare');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b823b987-16ac-49e1-adf9-c94104d74e01', '6da6254e-d95a-494d-9348-abddbe730dc6', 0, 'Escherichia coli');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfe8de42-aa3c-4434-87a9-589c4cf2a6b0', '6da6254e-d95a-494d-9348-abddbe730dc6', 1, 'Lactobacillus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f357429e-4e2a-441f-8d3e-3e91c03ecb8c', '6da6254e-d95a-494d-9348-abddbe730dc6', 2, 'Saccharomyces cerevisiae');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00f64746-5f0e-4131-8c84-e88839471dc3', '6da6254e-d95a-494d-9348-abddbe730dc6', 3, 'Mycobacterium tuberculosis');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6da6254e-d95a-494d-9348-abddbe730dc6', 'cfe8de42-aa3c-4434-87a9-589c4cf2a6b0', 'Lactobacillus (and related lactic acid bacteria) ferment lactose in milk into lactic acid, coagulating milk proteins to form curd.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9e10a12f-31a4-4f5f-a3e5-6e692999a2a2', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 122, 'Restriction endonucleases used in genetic engineering function by:', 'Biology', 'Biotechnology — Principles and Processes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b6e31c7-d901-42f1-9322-f525612aba19', '9e10a12f-31a4-4f5f-a3e5-6e692999a2a2', 0, 'Joining two DNA fragments together permanently');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1d1c5a4-b645-4e0f-860b-b27ddf9ad4e7', '9e10a12f-31a4-4f5f-a3e5-6e692999a2a2', 1, 'Recognizing specific DNA sequences and cutting the DNA at or near those sites');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f502135f-8bf4-487b-9207-23749ed5b14b', '9e10a12f-31a4-4f5f-a3e5-6e692999a2a2', 2, 'Synthesizing new DNA strands from RNA');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57fd1f26-2742-49f1-bdc9-a43f3677659b', '9e10a12f-31a4-4f5f-a3e5-6e692999a2a2', 3, 'Degrading RNA exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9e10a12f-31a4-4f5f-a3e5-6e692999a2a2', 'f1d1c5a4-b645-4e0f-860b-b27ddf9ad4e7', 'Restriction endonucleases (''molecular scissors'') recognize specific palindromic sequences and cleave DNA there, a key tool for creating recombinant DNA; DNA ligase, not the endonuclease, is used to join fragments.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('25a88ac9-d39c-46e8-8f93-fa3d67e53ede', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 123, 'Bt cotton is genetically engineered to be resistant to certain insects because it expresses a toxin gene derived from:', 'Biology', 'Biotechnology and Its Applications');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1bc7a7b6-3ee2-4280-8cc4-91df43f7988c', '25a88ac9-d39c-46e8-8f93-fa3d67e53ede', 0, 'A virus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7765f19-72cf-4cd7-aaa5-0564b7f4e084', '25a88ac9-d39c-46e8-8f93-fa3d67e53ede', 1, 'The bacterium Bacillus thuringiensis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e49cfcfb-658a-4366-a298-508f72c3dcf1', '25a88ac9-d39c-46e8-8f93-fa3d67e53ede', 2, 'A fungus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f775673c-a144-4ea5-9e43-10f21d263b03', '25a88ac9-d39c-46e8-8f93-fa3d67e53ede', 3, 'Another plant species');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('25a88ac9-d39c-46e8-8f93-fa3d67e53ede', 'c7765f19-72cf-4cd7-aaa5-0564b7f4e084', 'Bt crops carry a gene from the soil bacterium Bacillus thuringiensis that encodes a crystal (Cry) protein toxic to specific insect larvae but safe for the plant and most non-target organisms.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3fc26617-f96e-4023-9e13-6fe6a6627ad1', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 124, 'The range of temperature (or any other factor) within which an organism can survive and reproduce is called its:', 'Biology', 'Organisms and Populations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1326641d-0d9d-424f-96f6-ff239d204c80', '3fc26617-f96e-4023-9e13-6fe6a6627ad1', 0, 'Ecological niche');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8cc67c30-aa94-4d66-ae46-aac9dbcfb240', '3fc26617-f96e-4023-9e13-6fe6a6627ad1', 1, 'Tolerance range');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04c4fb06-cb5c-4d77-bb11-6fed49d9f25c', '3fc26617-f96e-4023-9e13-6fe6a6627ad1', 2, 'Habitat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aca5fb48-88bb-4740-909e-31cd375be221', '3fc26617-f96e-4023-9e13-6fe6a6627ad1', 3, 'Biotic potential');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3fc26617-f96e-4023-9e13-6fe6a6627ad1', '8cc67c30-aa94-4d66-ae46-aac9dbcfb240', 'Tolerance range (or range of tolerance) describes the upper and lower limits of an environmental factor within which a species can survive, often illustrated by a bell-shaped tolerance curve.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e7c5b08c-6e9e-4fd6-85aa-ea48b23e4aab', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 125, 'In population ecology, the exponential growth model (J-shaped curve) assumes:', 'Biology', 'Organisms and Populations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3be0d76-4b70-4a06-a7f0-6a77700e7b78', 'e7c5b08c-6e9e-4fd6-85aa-ea48b23e4aab', 0, 'Resources are limited and growth slows as carrying capacity is approached');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('739984fa-29a7-44d0-92e5-b3a1a0a71fc8', 'e7c5b08c-6e9e-4fd6-85aa-ea48b23e4aab', 1, 'Unlimited resources, allowing the population to grow at its maximum intrinsic rate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3931fd4c-6965-45eb-9311-b2b0669d371f', 'e7c5b08c-6e9e-4fd6-85aa-ea48b23e4aab', 2, 'The population size always remains constant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a539d5d3-b194-4a23-95ab-8bf0cfa88acc', 'e7c5b08c-6e9e-4fd6-85aa-ea48b23e4aab', 3, 'Growth only occurs in the presence of predators');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e7c5b08c-6e9e-4fd6-85aa-ea48b23e4aab', '739984fa-29a7-44d0-92e5-b3a1a0a71fc8', 'The exponential (J-shaped) growth model assumes unlimited resources, contrasting with the logistic (S-shaped) model, which incorporates carrying capacity (K) as resources become limiting.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('91026f39-02b0-4970-83ae-d7e3476eb45d', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 126, 'In an ecosystem, the organisms that convert inorganic substances into organic compounds using sunlight are called:', 'Biology', 'Ecosystem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b56a48c-892f-419b-a3a3-5dfe7642fb1f', '91026f39-02b0-4970-83ae-d7e3476eb45d', 0, 'Decomposers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46b0df87-3fca-4219-96e1-07f10bf389bd', '91026f39-02b0-4970-83ae-d7e3476eb45d', 1, 'Producers (autotrophs)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02d14b03-deb7-4c25-9254-2fae4c9c6e52', '91026f39-02b0-4970-83ae-d7e3476eb45d', 2, 'Primary consumers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a555e339-d8f7-4355-aeaf-2d0b72119827', '91026f39-02b0-4970-83ae-d7e3476eb45d', 3, 'Secondary consumers');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('91026f39-02b0-4970-83ae-d7e3476eb45d', '46b0df87-3fca-4219-96e1-07f10bf389bd', 'Producers (mainly green plants and other photosynthetic autotrophs) fix inorganic carbon into organic compounds using light energy, forming the base of the food chain.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('814c3987-6fd7-420c-ab17-1436939d3e9c', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 127, 'The progressive decrease in energy at each successive trophic level of a food chain is best explained by:', 'Biology', 'Ecosystem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb982f7b-947d-4d58-901c-f039a88d5191', '814c3987-6fd7-420c-ab17-1436939d3e9c', 0, 'The tenth law of thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8581983-fb33-4e13-83e9-384e5cf7b415', '814c3987-6fd7-420c-ab17-1436939d3e9c', 1, 'The second law of thermodynamics — energy is lost as heat at each transfer, so only about 10% passes to the next level');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d51d050-9e76-4cad-975a-3f86196aa8aa', '814c3987-6fd7-420c-ab17-1436939d3e9c', 2, 'Complete transfer of all energy with no loss');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0526770-0d17-467d-8784-6b9091b9cf6e', '814c3987-6fd7-420c-ab17-1436939d3e9c', 3, 'The first law of thermodynamics only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('814c3987-6fd7-420c-ab17-1436939d3e9c', 'c8581983-fb33-4e13-83e9-384e5cf7b415', 'Per the ten percent law (a practical consequence of the second law of thermodynamics), only about 10% of energy at one trophic level is transferred to the next, with the rest lost mainly as metabolic heat.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b88743f7-c648-43f8-978b-6d37176964aa', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 128, '''Biodiversity hotspots'' are regions characterized by:', 'Biology', 'Biodiversity and Conservation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1922a235-8d82-4570-a893-cd8b53fc2471', 'b88743f7-c648-43f8-978b-6d37176964aa', 0, 'Low species richness and low endemism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d2f1dc3-e453-4bf4-a564-5a50107e206f', 'b88743f7-c648-43f8-978b-6d37176964aa', 1, 'Exceptionally high species richness and high levels of endemism, often under significant threat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a03fcbd-b1a1-4d72-93c3-61a2c71eddb4', 'b88743f7-c648-43f8-978b-6d37176964aa', 2, 'Areas with no human habitation at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8259d7de-f5ad-4091-b7f2-c0076590ff40', 'b88743f7-c648-43f8-978b-6d37176964aa', 3, 'Only marine ecosystems');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b88743f7-c648-43f8-978b-6d37176964aa', '7d2f1dc3-e453-4bf4-a564-5a50107e206f', 'Biodiversity hotspots are regions with very high species richness and endemism (species found nowhere else) that are simultaneously experiencing significant habitat loss, making conservation there a priority.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('96409878-ae48-4b98-bb68-f9700c74cd2c', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 129, 'Biological Oxygen Demand (BOD) is used as a measure of:', 'Biology', 'Environmental Issues');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce54a255-a4c4-4ee4-af8f-055ba21edcba', '96409878-ae48-4b98-bb68-f9700c74cd2c', 0, 'The oxygen content of the atmosphere');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f795119-902c-4a3b-8ce7-c8977f5e6a45', '96409878-ae48-4b98-bb68-f9700c74cd2c', 1, 'The amount of organic pollutant matter in water, based on oxygen consumed by microorganisms decomposing it');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2fdf55f8-0408-4904-9a0e-99790fc08f71', '96409878-ae48-4b98-bb68-f9700c74cd2c', 2, 'The temperature of a water body');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d0819d0-b7df-458e-9599-8fcdda1c6ec4', '96409878-ae48-4b98-bb68-f9700c74cd2c', 3, 'The salinity of ocean water');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('96409878-ae48-4b98-bb68-f9700c74cd2c', '5f795119-902c-4a3b-8ce7-c8977f5e6a45', 'BOD measures the oxygen required by microorganisms to decompose organic matter in a water sample — higher BOD indicates greater organic pollution.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('cac1e9d7-42a8-4262-9ceb-5b4a4eaf595b', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 130, 'Heterospory — the production of two kinds of spores (microspores and megaspores) — is a significant evolutionary feature first seen in certain:', 'Biology', 'Plant Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd752026-ad6a-4afd-a0c8-7f8cf44dceb3', 'cac1e9d7-42a8-4262-9ceb-5b4a4eaf595b', 0, 'Algae only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8cd09e8f-dfc4-4585-9236-d6f9f386a9db', 'cac1e9d7-42a8-4262-9ceb-5b4a4eaf595b', 1, 'Pteridophytes (e.g., Selaginella) and all seed plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bec93097-da83-4a90-ab13-29148d8d6860', 'cac1e9d7-42a8-4262-9ceb-5b4a4eaf595b', 2, 'Bryophytes exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('130851e9-02cf-4fa0-be22-c877b8384ae0', 'cac1e9d7-42a8-4262-9ceb-5b4a4eaf595b', 3, 'Fungi');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cac1e9d7-42a8-4262-9ceb-5b4a4eaf595b', '8cd09e8f-dfc4-4585-9236-d6f9f386a9db', 'Heterospory appears in a few pteridophytes (like Selaginella and Salvinia) and is a universal feature of all seed-bearing plants (gymnosperms and angiosperms), considered a key step toward seed habit evolution.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('58ee4fc9-be61-45da-9a5f-3bbba090c52b', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 131, 'A fruit that develops from a fertilized ovary without any accessory floral parts is called a:', 'Biology', 'Morphology of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76af207b-3204-4edd-b8ea-61f5dc1f96b6', '58ee4fc9-be61-45da-9a5f-3bbba090c52b', 0, 'False fruit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f868efb2-8eab-4acd-984f-032e38fcc370', '58ee4fc9-be61-45da-9a5f-3bbba090c52b', 1, 'True fruit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0af77d5-3b9c-45cf-b580-1fc95effd3d1', '58ee4fc9-be61-45da-9a5f-3bbba090c52b', 2, 'Parthenocarpic fruit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8169617-98cb-461a-970c-7cb08a6f9fd0', '58ee4fc9-be61-45da-9a5f-3bbba090c52b', 3, 'Composite fruit');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('58ee4fc9-be61-45da-9a5f-3bbba090c52b', 'f868efb2-8eab-4acd-984f-032e38fcc370', 'A true fruit develops solely from the ovary after fertilization; a false fruit (e.g., apple) develops with contribution from other floral parts like the thalamus.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0925ea7d-a374-4a83-9d3b-e0d817feb973', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 132, 'Ribosomes, the site of protein synthesis, are composed of:', 'Biology', 'Cell — The Unit of Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0dc300c4-7238-4e29-a19c-dbefa89c3a6e', '0925ea7d-a374-4a83-9d3b-e0d817feb973', 0, 'DNA and lipids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d63c42f4-7998-4ffd-b374-91ee313bddeb', '0925ea7d-a374-4a83-9d3b-e0d817feb973', 1, 'Ribosomal RNA (rRNA) and proteins');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f001342-084c-4429-a138-ed38034b7da5', '0925ea7d-a374-4a83-9d3b-e0d817feb973', 2, 'Only proteins with no RNA');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e865dc12-2f2c-4d58-bd90-687bbf62e38b', '0925ea7d-a374-4a83-9d3b-e0d817feb973', 3, 'Carbohydrates only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0925ea7d-a374-4a83-9d3b-e0d817feb973', 'd63c42f4-7998-4ffd-b374-91ee313bddeb', 'Ribosomes are ribonucleoprotein particles made of rRNA and structural/functional proteins, found free in the cytoplasm or bound to the endoplasmic reticulum.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('877ae921-652a-4675-8323-ed7a2a250026', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 133, 'Which of the following is classified as a secondary metabolite in plants, rather than a primary metabolite essential for basic growth?', 'Biology', 'Biomolecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48e8ba53-5277-4975-bead-510cfc789cc3', '877ae921-652a-4675-8323-ed7a2a250026', 0, 'Glucose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b17537b-30e2-4086-afba-b7ebbad8b6d9', '877ae921-652a-4675-8323-ed7a2a250026', 1, 'Amino acids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a81b56d-a88c-4343-b56f-93166bb58c25', '877ae921-652a-4675-8323-ed7a2a250026', 2, 'Alkaloids (e.g., morphine, nicotine)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('070cc2f9-fba5-446f-b5ff-2a1f0b2df11c', '877ae921-652a-4675-8323-ed7a2a250026', 3, 'Proteins');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('877ae921-652a-4675-8323-ed7a2a250026', '7a81b56d-a88c-4343-b56f-93166bb58c25', 'Secondary metabolites like alkaloids, terpenoids, and flavonoids are not directly involved in normal growth/development/reproduction but often serve ecological or defensive roles; glucose, amino acids and proteins are primary metabolites.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('591bca56-4ae3-4c59-a890-8a71c57fb74a', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 134, 'The Casparian strip, a band of suberized material, is found in the:', 'Biology', 'Anatomy of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab4f412e-659c-4d89-ae39-90ceb86e52b6', '591bca56-4ae3-4c59-a890-8a71c57fb74a', 0, 'Epidermis of the leaf');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa04e312-c07c-4ffa-96cf-0d36e3195e58', '591bca56-4ae3-4c59-a890-8a71c57fb74a', 1, 'Endodermis of the root');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7fdd79e-e208-40e4-a3fa-0a771b39e36d', '591bca56-4ae3-4c59-a890-8a71c57fb74a', 2, 'Pith of the stem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37f04a50-fe92-482f-9263-5f9f767e3329', '591bca56-4ae3-4c59-a890-8a71c57fb74a', 3, 'Cortex of the stem');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('591bca56-4ae3-4c59-a890-8a71c57fb74a', 'fa04e312-c07c-4ffa-96cf-0d36e3195e58', 'The Casparian strip is a waxy, suberin-impregnated band in the radial and transverse walls of root endodermal cells, forcing water and minerals to pass through the cell membrane (symplast) rather than between cells, enabling selective uptake.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f30cfd7f-b841-4cdf-a6d2-b68248155066', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 135, 'Fermentation, an anaerobic pathway, converts pyruvate into ethanol and CO2 (or lactic acid) and yields a net gain of how many ATP per glucose molecule, compared to aerobic respiration?', 'Biology', 'Respiration in Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a711e841-f963-4eed-a243-a8028d06657b', 'f30cfd7f-b841-4cdf-a6d2-b68248155066', 0, 'The same as aerobic respiration (36-38 ATP)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7f32ae9-3c9e-4c74-83cd-7d96f8580b21', 'f30cfd7f-b841-4cdf-a6d2-b68248155066', 1, 'Far fewer ATP (a net of 2 ATP from glycolysis only)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b333adcc-84b3-4e40-82f5-540265c006f0', 'f30cfd7f-b841-4cdf-a6d2-b68248155066', 2, 'No ATP at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5786321f-23bf-45bf-bb14-cc70d6a7642d', 'f30cfd7f-b841-4cdf-a6d2-b68248155066', 3, 'More ATP than aerobic respiration');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f30cfd7f-b841-4cdf-a6d2-b68248155066', 'f7f32ae9-3c9e-4c74-83cd-7d96f8580b21', 'Fermentation only completes glycolysis (net 2 ATP) and regenerates NAD+ via reduction of pyruvate, without the far more efficient oxidative phosphorylation of aerobic respiration.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('756e48b3-51a1-407c-9c42-e0dbe92552ca', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 136, 'Animals belonging to Phylum Porifera (sponges) are characterized by:', 'Biology', 'Animal Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7367fae-ecf7-4906-9ca3-860e861c0d37', '756e48b3-51a1-407c-9c42-e0dbe92552ca', 0, 'A true coelom and organ-level organization');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6edf347b-e33a-4a31-905c-53ce9135ce9f', '756e48b3-51a1-407c-9c42-e0dbe92552ca', 1, 'The presence of a unique water-canal (canal) system and choanocytes (collar cells)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec73ea91-1203-4d17-a42a-35b366cf608b', '756e48b3-51a1-407c-9c42-e0dbe92552ca', 2, 'Bilateral symmetry and segmented bodies');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83b0bc39-f503-405d-a2d9-9a4812bdd18e', '756e48b3-51a1-407c-9c42-e0dbe92552ca', 3, 'A well-developed nervous system');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('756e48b3-51a1-407c-9c42-e0dbe92552ca', '6edf347b-e33a-4a31-905c-53ce9135ce9f', 'Sponges possess a distinctive water-canal system driven by flagellated choanocytes (collar cells) that create water currents for feeding and gas exchange; they lack true tissues/organs and show cellular-level organization.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a61bba89-ce96-48a0-abdb-c6e013925414', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 137, 'Phylum Arthropoda, the largest animal phylum, is characterized by:', 'Biology', 'Animal Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c120ed18-10db-4423-93cd-e6227a0010ec', 'a61bba89-ce96-48a0-abdb-c6e013925414', 0, 'A soft, unsegmented body with no appendages');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aee166fa-53ce-43e8-bbc4-0b3d28f6ab73', 'a61bba89-ce96-48a0-abdb-c6e013925414', 1, 'A chitinous exoskeleton, segmented body, and jointed appendages');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af01f261-495b-4581-a0a9-c77a0b52c05e', 'a61bba89-ce96-48a0-abdb-c6e013925414', 2, 'Radial symmetry only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da2b7d89-77e9-4aad-9e25-e02ec9d74bc8', 'a61bba89-ce96-48a0-abdb-c6e013925414', 3, 'The complete absence of a circulatory system');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a61bba89-ce96-48a0-abdb-c6e013925414', 'aee166fa-53ce-43e8-bbc4-0b3d28f6ab73', 'Arthropods (insects, crustaceans, arachnids) share a hard chitinous exoskeleton, metameric (segmented) body plan, and jointed appendages — the phylum''s defining features and the source of its name (''jointed feet'').', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('96671dcf-025c-4c19-8cee-9402f4cae489', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 138, 'Notochord, a defining feature of Phylum Chordata, is best described as:', 'Biology', 'Animal Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4b6b0e2-7647-4d4c-ae07-f132c34789d4', '96671dcf-025c-4c19-8cee-9402f4cae489', 0, 'A bony vertebral column present in all chordates');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea249b33-abbd-42dc-b934-48a1e6537d42', '96671dcf-025c-4c19-8cee-9402f4cae489', 1, 'A flexible, rod-like structure present at some stage of the life cycle, dorsal to the gut and ventral to the nerve cord');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbce302c-7401-491b-990e-efc7af8a7dae', '96671dcf-025c-4c19-8cee-9402f4cae489', 2, 'A type of external skeleton');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0213d32-bc5b-4529-87fa-2a8a230611eb', '96671dcf-025c-4c19-8cee-9402f4cae489', 3, 'Present only in adult vertebrates');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('96671dcf-025c-4c19-8cee-9402f4cae489', 'ea249b33-abbd-42dc-b934-48a1e6537d42', 'The notochord is a defining chordate feature — a supportive, flexible rod present at least during embryonic development, positioned between the gut and the dorsal nerve cord; in vertebrates it is later replaced/surrounded by the vertebral column.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2af540e8-7b06-44c6-afd1-3d6f1285b5dc', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 139, 'Simple squamous epithelium, made of a single layer of flattened cells, is best suited for its role in:', 'Biology', 'Structural Organisation in Animals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c6b12a9-0d81-4860-959c-3e0cf88eb36b', '2af540e8-7b06-44c6-afd1-3d6f1285b5dc', 0, 'Secretion of mucus in large volumes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3480db30-5b9c-4713-890e-8483b5baa477', '2af540e8-7b06-44c6-afd1-3d6f1285b5dc', 1, 'Diffusion and filtration, e.g., in the walls of blood capillaries and alveoli');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8be0f535-ad44-483d-b24c-ff5a92b3ddb2', '2af540e8-7b06-44c6-afd1-3d6f1285b5dc', 2, 'Protection against mechanical abrasion in the skin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e838c66-0bc7-41de-bada-86505f40f6a4', '2af540e8-7b06-44c6-afd1-3d6f1285b5dc', 3, 'Absorption in the small intestine primarily');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2af540e8-7b06-44c6-afd1-3d6f1285b5dc', '3480db30-5b9c-4713-890e-8483b5baa477', 'The thin, flattened single-cell-layer structure of simple squamous epithelium minimizes diffusion distance, making it ideal for gas/fluid exchange sites like capillary walls and alveoli.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5dda4e5b-655f-41b9-8ae9-7ea67b572f6e', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 140, 'In humans, the exchange of oxygen and carbon dioxide between alveolar air and blood occurs primarily by:', 'Biology', 'Breathing and Exchange of Gases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d21139b8-d326-47f8-9423-7b6f688ef6d8', '5dda4e5b-655f-41b9-8ae9-7ea67b572f6e', 0, 'Active transport requiring ATP');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0292d5f2-3771-4afa-83f3-32332857844b', '5dda4e5b-655f-41b9-8ae9-7ea67b572f6e', 1, 'Simple diffusion, driven by the partial pressure gradient of the gases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42301950-eda4-4410-b41d-841fc54fb6a9', '5dda4e5b-655f-41b9-8ae9-7ea67b572f6e', 2, 'Facilitated transport via carrier proteins');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('000de3a8-1893-4cc5-93b2-7eb8e1536051', '5dda4e5b-655f-41b9-8ae9-7ea67b572f6e', 3, 'Osmosis');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5dda4e5b-655f-41b9-8ae9-7ea67b572f6e', '0292d5f2-3771-4afa-83f3-32332857844b', 'Gas exchange at the alveoli (and at tissues) occurs by simple diffusion along partial pressure gradients (O2 from high pO2 alveolar air to lower pO2 blood, and CO2 the reverse) — no ATP or carrier proteins are required for this step.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('87cee422-ec99-4b7e-97ec-ab1a53ea8cfe', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 141, 'The pacemaker of the human heart, which initiates and maintains the rhythmic contraction, is the:', 'Biology', 'Body Fluids and Circulation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb20a9de-bea9-449b-afa6-8e6fba5b691d', '87cee422-ec99-4b7e-97ec-ab1a53ea8cfe', 0, 'Atrioventricular node (AV node)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bcab7a3b-d483-4a7e-bae4-17564d133b8c', '87cee422-ec99-4b7e-97ec-ab1a53ea8cfe', 1, 'Sinoatrial node (SA node)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ddf836f5-be4e-4803-b7c6-8e68084823a0', '87cee422-ec99-4b7e-97ec-ab1a53ea8cfe', 2, 'Bundle of His');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('974176a9-8dc4-4ab3-937a-a92e78c9bdd5', '87cee422-ec99-4b7e-97ec-ab1a53ea8cfe', 3, 'Purkinje fibres');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('87cee422-ec99-4b7e-97ec-ab1a53ea8cfe', 'bcab7a3b-d483-4a7e-bae4-17564d133b8c', 'The SA node, located in the wall of the right atrium, generates the electrical impulses that set the heart''s rhythm and rate, earning it the name ''pacemaker''.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('711595d7-7b64-4d31-9811-47e9fc1c564b', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 142, 'Which blood component is primarily responsible for carrying oxygen throughout the body?', 'Biology', 'Body Fluids and Circulation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd05b3a4-ee77-4031-b5d8-647c9f9c0ada', '711595d7-7b64-4d31-9811-47e9fc1c564b', 0, 'Platelets');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53d8dae6-e643-43c4-addb-7cca79218218', '711595d7-7b64-4d31-9811-47e9fc1c564b', 1, 'Plasma proteins');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ccbabaf-a2f0-4229-99e8-54e6c3e6a0d3', '711595d7-7b64-4d31-9811-47e9fc1c564b', 2, 'Red blood cells (via haemoglobin)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6cccf14f-89cd-4f3b-bcb4-28703ef3e82b', '711595d7-7b64-4d31-9811-47e9fc1c564b', 3, 'White blood cells');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('711595d7-7b64-4d31-9811-47e9fc1c564b', '5ccbabaf-a2f0-4229-99e8-54e6c3e6a0d3', 'Red blood cells contain haemoglobin, which reversibly binds oxygen in the lungs and releases it at tissues; white blood cells are involved in immunity and platelets in clotting.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('926628dc-4495-4a28-aea3-7fed9e2ad8e3', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 143, 'The functional and structural unit of the human kidney is the:', 'Biology', 'Excretory Products and Their Elimination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3aa31067-3992-4957-bbfb-6b2f8deea6cc', '926628dc-4495-4a28-aea3-7fed9e2ad8e3', 0, 'Nephron');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('741ab795-ec84-434e-a6ab-7b19c2279df2', '926628dc-4495-4a28-aea3-7fed9e2ad8e3', 1, 'Neuron');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a70417f-fe9b-485c-8e35-8ba3051a6c40', '926628dc-4495-4a28-aea3-7fed9e2ad8e3', 2, 'Alveolus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41dd79d9-9cc3-44b1-9bc0-3fc2e2990a9a', '926628dc-4495-4a28-aea3-7fed9e2ad8e3', 3, 'Glomerulus alone, without the tubule');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('926628dc-4495-4a28-aea3-7fed9e2ad8e3', '3aa31067-3992-4957-bbfb-6b2f8deea6cc', 'The nephron, comprising the glomerulus, Bowman''s capsule, and a series of tubules, is the basic structural and functional filtering unit of the kidney; the glomerulus alone is only one part of it.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('26668c49-ad46-40c6-acc3-d2c4655e21dc', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 144, 'The sliding filament theory explains muscle contraction as resulting from:', 'Biology', 'Locomotion and Movement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8da0669d-473e-439f-b5a1-2b1637750e82', '26668c49-ad46-40c6-acc3-d2c4655e21dc', 0, 'Shortening of the actin and myosin filaments themselves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd4a3589-21a6-4f82-a285-0da92eb7b199', '26668c49-ad46-40c6-acc3-d2c4655e21dc', 1, 'The sliding of actin filaments over myosin filaments, without the filaments themselves changing length');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('efa6418f-b231-4738-86d8-5849e67c99f0', '26668c49-ad46-40c6-acc3-d2c4655e21dc', 2, 'Complete breakdown of the sarcomere');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d9caf0e-1808-449f-a5f7-a0f285850365', '26668c49-ad46-40c6-acc3-d2c4655e21dc', 3, 'Contraction occurring only in smooth muscle');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('26668c49-ad46-40c6-acc3-d2c4655e21dc', 'bd4a3589-21a6-4f82-a285-0da92eb7b199', 'In the sliding filament model, myosin cross-bridges pull actin filaments inward over themselves, shortening the sarcomere as a whole, while the individual filament lengths remain unchanged.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4c5d3aca-f05c-4d51-86fe-9236f4c91e96', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 145, 'The transmission of a nerve impulse across a chemical synapse is mediated by:', 'Biology', 'Neural Control and Coordination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a4e52ef-6a04-4479-90db-84ad0613128a', '4c5d3aca-f05c-4d51-86fe-9236f4c91e96', 0, 'Direct electrical current flow between neurons only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ecefba8-b40b-4f61-bcd5-8146b3e76da4', '4c5d3aca-f05c-4d51-86fe-9236f4c91e96', 1, 'The release of neurotransmitters from the presynaptic neuron that bind receptors on the postsynaptic membrane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df616c3b-2825-4129-80b9-ec8b90a8b7a7', '4c5d3aca-f05c-4d51-86fe-9236f4c91e96', 2, 'Diffusion of the entire neuron''s cytoplasm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2aca00b4-b1fa-4c94-9b31-07a760279c50', '4c5d3aca-f05c-4d51-86fe-9236f4c91e96', 3, 'Physical fusion of the two neurons into one cell');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4c5d3aca-f05c-4d51-86fe-9236f4c91e96', '1ecefba8-b40b-4f61-bcd5-8146b3e76da4', 'At a chemical synapse, an arriving impulse triggers neurotransmitter release from synaptic vesicles into the synaptic cleft; the neurotransmitter binds receptors on the postsynaptic membrane to propagate (or inhibit) the signal.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2bec538f-663f-4204-b032-968e0593cce7', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 146, 'Insulin, secreted by the beta cells of the pancreatic islets of Langerhans, primarily acts to:', 'Biology', 'Chemical Coordination and Integration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2e85008-0dfb-47e2-92cd-9082b733ba4d', '2bec538f-663f-4204-b032-968e0593cce7', 0, 'Raise blood glucose levels by promoting glycogen breakdown');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('954f4610-28d6-40bf-8e70-c8a1513b9a0f', '2bec538f-663f-4204-b032-968e0593cce7', 1, 'Lower blood glucose levels by promoting cellular glucose uptake and glycogen synthesis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a4f1194-a219-48dd-82b2-507a773e9e35', '2bec538f-663f-4204-b032-968e0593cce7', 2, 'Regulate calcium levels in the blood');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9fa248bf-8a1d-4187-9583-53be55d682c5', '2bec538f-663f-4204-b032-968e0593cce7', 3, 'Stimulate the thyroid gland');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2bec538f-663f-4204-b032-968e0593cce7', '954f4610-28d6-40bf-8e70-c8a1513b9a0f', 'Insulin is the principal hypoglycemic hormone, promoting glucose uptake by cells and glycogenesis (glycogen synthesis) in the liver, lowering blood glucose; glucagon has the opposite, hyperglycemic effect.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4ce754ba-824e-48f0-a7ba-bffa908bc248', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 147, 'Spermatogenesis, the process of sperm formation, occurs in the:', 'Biology', 'Human Reproduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dba19c51-0c0d-445a-846b-0a1fa98f75ed', '4ce754ba-824e-48f0-a7ba-bffa908bc248', 0, 'Vas deferens');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9dcdfeae-0265-45db-a8d6-da9d4ee83210', '4ce754ba-824e-48f0-a7ba-bffa908bc248', 1, 'Seminiferous tubules of the testis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f7e3f8c-653e-4f64-9382-05717fe1e6ce', '4ce754ba-824e-48f0-a7ba-bffa908bc248', 2, 'Epididymis only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9bff7d4-6d58-4cdc-a51b-7df0adb53a45', '4ce754ba-824e-48f0-a7ba-bffa908bc248', 3, 'Prostate gland');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4ce754ba-824e-48f0-a7ba-bffa908bc248', '9dcdfeae-0265-45db-a8d6-da9d4ee83210', 'Spermatogenesis occurs within the seminiferous tubules of the testes, where germ cells undergo mitosis and meiosis, ultimately maturing into spermatozoa (with further maturation continuing in the epididymis).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c189f8eb-9995-4a88-bae3-6a565e796dc7', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 148, 'Fertilization in humans normally occurs in the:', 'Biology', 'Human Reproduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('133bfa81-5b59-45c9-aff0-33aba4fa0378', 'c189f8eb-9995-4a88-bae3-6a565e796dc7', 0, 'Uterus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81b1ca69-7f1e-46cb-a488-0fad096a6aee', 'c189f8eb-9995-4a88-bae3-6a565e796dc7', 1, 'Ampullary region of the fallopian tube (oviduct)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7dab863d-b20f-4f12-a192-c3497390d3c3', 'c189f8eb-9995-4a88-bae3-6a565e796dc7', 2, 'Ovary itself');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c73c094-4b51-4066-b783-6f1247333b14', 'c189f8eb-9995-4a88-bae3-6a565e796dc7', 3, 'Vagina');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c189f8eb-9995-4a88-bae3-6a565e796dc7', '81b1ca69-7f1e-46cb-a488-0fad096a6aee', 'The sperm typically meets and fertilizes the egg in the ampullary region of the fallopian tube, after which the resulting zygote travels to the uterus for implantation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a5b3dec7-959a-4503-8df9-09e6ced3aa77', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 149, 'Amniocentesis, a prenatal diagnostic technique, is legally restricted in India (under the PCPNDT Act) mainly to prevent its misuse for:', 'Biology', 'Reproductive Health');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e51b788-761d-402f-9793-3308936c1f78', 'a5b3dec7-959a-4503-8df9-09e6ced3aa77', 0, 'Detecting genetic disorders only, which is its legitimate medical use');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b09af27-c8d1-4995-9779-562693e573fa', 'a5b3dec7-959a-4503-8df9-09e6ced3aa77', 1, 'Sex determination of the fetus leading to female foeticide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13885a28-b5b5-4a43-9e50-b380d4fd1542', 'a5b3dec7-959a-4503-8df9-09e6ced3aa77', 2, 'Measuring fetal heart rate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40545637-1b9f-46c8-aa51-70db31088ff5', 'a5b3dec7-959a-4503-8df9-09e6ced3aa77', 3, 'Diagnosing gestational diabetes');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a5b3dec7-959a-4503-8df9-09e6ced3aa77', '9b09af27-c8d1-4995-9779-562693e573fa', 'While amniocentesis has legitimate uses in detecting chromosomal/genetic disorders, its potential misuse for sex determination (leading to sex-selective abortion) led to strict legal regulation under India''s PCPNDT Act.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d9274433-0456-4e0e-ba52-67666e146419', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 150, 'Antibodies are proteins produced by which type of white blood cell in response to an antigen?', 'Biology', 'Human Health and Disease');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5865be6b-34fc-4d20-b54f-81334d6ece4f', 'd9274433-0456-4e0e-ba52-67666e146419', 0, 'Neutrophils');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f134f342-50a2-4b5d-a78b-5b34db95c2dd', 'd9274433-0456-4e0e-ba52-67666e146419', 1, 'B-lymphocytes (which differentiate into plasma cells)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f879545-df6d-4657-94a9-e4f4f0e052e0', 'd9274433-0456-4e0e-ba52-67666e146419', 2, 'Basophils');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84cff930-a045-4a86-b986-7800adf36cca', 'd9274433-0456-4e0e-ba52-67666e146419', 3, 'Monocytes only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d9274433-0456-4e0e-ba52-67666e146419', 'f134f342-50a2-4b5d-a78b-5b34db95c2dd', 'B-lymphocytes, upon activation by an antigen (often with T-helper cell assistance), differentiate into plasma cells that secrete large quantities of specific antibodies as part of humoral immunity.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7390c1ea-bcc4-47c9-8550-540078695523', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 151, 'Malaria in humans is caused by a protozoan parasite of the genus Plasmodium, transmitted by the bite of:', 'Biology', 'Human Health and Disease');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e569f051-7ff8-46ac-ae91-ad177f0806b8', '7390c1ea-bcc4-47c9-8550-540078695523', 0, 'Aedes mosquito');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f27bced2-46a0-4361-856d-30867a6145b5', '7390c1ea-bcc4-47c9-8550-540078695523', 1, 'Female Anopheles mosquito');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1687dee-1104-4fae-966b-9ca923958a8e', '7390c1ea-bcc4-47c9-8550-540078695523', 2, 'Culex mosquito');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d12ba68c-8084-41c8-b9e0-da61fb03cc63', '7390c1ea-bcc4-47c9-8550-540078695523', 3, 'Housefly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7390c1ea-bcc4-47c9-8550-540078695523', 'f27bced2-46a0-4361-856d-30867a6145b5', 'Malaria is transmitted specifically by the bite of an infected female Anopheles mosquito, which introduces Plasmodium sporozoites into the human bloodstream.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2a1c9541-bc18-4f87-a94f-b101b3848809', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 152, 'Budding, a form of asexual reproduction seen in Hydra, involves:', 'Biology', 'Reproduction in Organisms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee4336ee-7a16-4a55-8e5d-29e4d0f008fb', '2a1c9541-bc18-4f87-a94f-b101b3848809', 0, 'Division of the parent body into two equal halves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9fc07508-b357-44b1-848a-50cd6c8a234b', '2a1c9541-bc18-4f87-a94f-b101b3848809', 1, 'Formation of a small outgrowth (bud) that develops into a new individual and eventually detaches');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de0cd680-f619-4b1a-a603-5be8e4d86d04', '2a1c9541-bc18-4f87-a94f-b101b3848809', 2, 'Fusion of male and female gametes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('751d27dd-a958-4287-8779-2ed406261d7a', '2a1c9541-bc18-4f87-a94f-b101b3848809', 3, 'Production of spores in a sporangium');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2a1c9541-bc18-4f87-a94f-b101b3848809', '9fc07508-b357-44b1-848a-50cd6c8a234b', 'In budding, a bud forms as an outgrowth from the parent, gradually develops all necessary structures, and eventually detaches (or remains attached in colonial forms) as a new individual — a form of asexual reproduction.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('db521bec-375f-4509-baa2-e9a9975a1fef', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 153, 'A human male with Klinefelter''s syndrome typically has the chromosomal constitution:', 'Biology', 'Genetics and Evolution — Human Genetics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8af6db1-1952-42c0-a428-9928fd9e87a8', 'db521bec-375f-4509-baa2-e9a9975a1fef', 0, '44+XY');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e87adf77-ca4d-4bab-bc66-e1706f0088b3', 'db521bec-375f-4509-baa2-e9a9975a1fef', 1, '44+XXY');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce25f962-ffa6-4b98-8079-a3f714b75342', 'db521bec-375f-4509-baa2-e9a9975a1fef', 2, '44+XO');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40204ad1-035e-4609-86ed-bd17fefd7eb2', 'db521bec-375f-4509-baa2-e9a9975a1fef', 3, '44+XXX');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('db521bec-375f-4509-baa2-e9a9975a1fef', 'e87adf77-ca4d-4bab-bc66-e1706f0088b3', 'Klinefelter''s syndrome results from an extra X chromosome in males, giving a 47,XXY karyotype (44 autosomes + XXY sex chromosomes), associated with characteristic phenotypic features.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('cdbe901d-fe6c-42b2-b7e8-482462d18a07', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 154, 'Colour blindness and haemophilia in humans are both examples of:', 'Biology', 'Genetics and Evolution — Human Genetics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54ca625f-6378-4769-b0e2-67fd53a980a1', 'cdbe901d-fe6c-42b2-b7e8-482462d18a07', 0, 'Autosomal dominant disorders');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('275ce892-f13c-4b38-9378-dadc494e81a9', 'cdbe901d-fe6c-42b2-b7e8-482462d18a07', 1, 'X-linked recessive disorders, more commonly expressed in males');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08fb8ad2-5b49-4bb1-9a37-2ea900501c53', 'cdbe901d-fe6c-42b2-b7e8-482462d18a07', 2, 'Y-linked disorders');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4ebecec-252b-4c74-b02f-030215467cc3', 'cdbe901d-fe6c-42b2-b7e8-482462d18a07', 3, 'Autosomal recessive disorders only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cdbe901d-fe6c-42b2-b7e8-482462d18a07', '275ce892-f13c-4b38-9378-dadc494e81a9', 'Both conditions are caused by recessive alleles on the X chromosome; since males (XY) have only one X, a single recessive allele is sufficient to express the disorder, making them more commonly affected than females (XX).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0f5dfeae-747b-4aa8-b543-d24f7bafadef', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 155, 'Which of these hominid species is generally considered, based on fossil evidence, to be most closely associated with the first confirmed use of fire?', 'Biology', 'Evolution — Human Evolution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e1c1330-944b-468a-871d-397aa49df2d1', '0f5dfeae-747b-4aa8-b543-d24f7bafadef', 0, 'Australopithecus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f79594e-b986-43f2-bd7d-27ce0c771055', '0f5dfeae-747b-4aa8-b543-d24f7bafadef', 1, 'Homo habilis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac8a34e3-696b-4c81-9c2f-5a85fc3516fc', '0f5dfeae-747b-4aa8-b543-d24f7bafadef', 2, 'Homo erectus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cab5c85b-be06-46b8-bf4d-adc679fb86de', '0f5dfeae-747b-4aa8-b543-d24f7bafadef', 3, 'Homo sapiens neanderthalensis only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0f5dfeae-747b-4aa8-b543-d24f7bafadef', 'ac8a34e3-696b-4c81-9c2f-5a85fc3516fc', 'Fossil and archaeological evidence commonly associates Homo erectus with among the earliest confirmed controlled use of fire, alongside more advanced tool use compared to earlier hominids.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3ba7d68b-d680-425b-96d4-6f8ee6f9adcd', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 156, 'Gene therapy for Adenosine Deaminase (ADA) deficiency involves:', 'Biology', 'Biotechnology and Its Applications — Gene Therapy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('056eac7c-53b7-4770-bcb1-048130399515', '3ba7d68b-d680-425b-96d4-6f8ee6f9adcd', 0, 'Surgical removal of the defective gene with no replacement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('033dbef3-e2a2-4e07-bc40-6307e876fcee', '3ba7d68b-d680-425b-96d4-6f8ee6f9adcd', 1, 'Introducing a functional copy of the ADA gene into the patient''s cells (e.g., via a viral vector or ex vivo lymphocyte modification)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06e495ce-b0b3-4d6a-a4e0-8ec0387a957b', '3ba7d68b-d680-425b-96d4-6f8ee6f9adcd', 2, 'Only dietary supplementation of adenosine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2539a4e2-ebc9-445a-93b6-2b13a4710552', '3ba7d68b-d680-425b-96d4-6f8ee6f9adcd', 3, 'Blocking the immune system entirely, permanently');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3ba7d68b-d680-425b-96d4-6f8ee6f9adcd', '033dbef3-e2a2-4e07-bc40-6307e876fcee', 'ADA deficiency gene therapy involves inserting a normal ADA gene copy into the patient''s lymphocytes (historically via a retroviral vector, ex vivo), aiming to restore the missing enzyme''s function.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f36d2050-cad5-464a-96d7-119bea469040', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 157, 'The relationship between a tapeworm living in a human intestine, where the tapeworm benefits and the human is harmed, is called:', 'Biology', 'Organisms and Populations — Interactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e078a087-78e9-4512-accb-d9bfe38ae9f2', 'f36d2050-cad5-464a-96d7-119bea469040', 0, 'Mutualism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c44b065e-1054-4e78-8b90-a51a2bf364f2', 'f36d2050-cad5-464a-96d7-119bea469040', 1, 'Commensalism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1446d2b5-63c1-4338-b45a-c75217d06831', 'f36d2050-cad5-464a-96d7-119bea469040', 2, 'Parasitism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4f83129-2c88-4040-a3d8-a4631c11467b', 'f36d2050-cad5-464a-96d7-119bea469040', 3, 'Competition');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f36d2050-cad5-464a-96d7-119bea469040', '1446d2b5-63c1-4338-b45a-c75217d06831', 'Parasitism describes an interaction where one organism (the parasite, here the tapeworm) benefits at the expense of the host (harmed), distinct from mutualism (both benefit) or commensalism (one benefits, other unaffected).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a474011e-ff44-450f-884f-d8bd1f1da518', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 158, 'In most ecosystems, the pyramid of numbers for a grassland ecosystem (grass -> insects -> frogs -> snakes) is typically:', 'Biology', 'Ecosystem — Ecological Pyramids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54058fac-970c-430b-b1eb-3e35dacfe130', 'a474011e-ff44-450f-884f-d8bd1f1da518', 0, 'Inverted, with fewer producers than consumers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a60c1ca-62fa-4637-8c90-fa96fd7ecbd9', 'a474011e-ff44-450f-884f-d8bd1f1da518', 1, 'Upright, with the greatest number of individuals at the producer level, decreasing at each successive trophic level');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c47a3b84-20cd-4c9f-9b15-788d411ed367', 'a474011e-ff44-450f-884f-d8bd1f1da518', 2, 'A perfect rectangle at every level');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('058b54cc-a4ee-4aff-9f34-ebd2faf10c5a', 'a474011e-ff44-450f-884f-d8bd1f1da518', 3, 'Impossible to construct');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a474011e-ff44-450f-884f-d8bd1f1da518', '1a60c1ca-62fa-4637-8c90-fa96fd7ecbd9', 'In most terrestrial ecosystems (grassland being a classic textbook case), the pyramid of numbers is upright, since a large number of small producers support progressively fewer organisms at each higher trophic level.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2b8e9aaa-2c18-4ba5-8804-fbc8b0c71ea8', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 159, 'The establishment of National Parks and Wildlife Sanctuaries for protecting species within their natural habitat is an example of:', 'Biology', 'Biodiversity and Conservation — In-situ and Ex-situ');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b51a3c6f-39ca-41e2-8213-18c1925d1470', '2b8e9aaa-2c18-4ba5-8804-fbc8b0c71ea8', 0, 'Ex-situ conservation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('471e2dae-def2-477b-8769-fb37b934209d', '2b8e9aaa-2c18-4ba5-8804-fbc8b0c71ea8', 1, 'In-situ conservation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b4cf0dc-9857-45ee-8f6d-ed69d57c0e3d', '2b8e9aaa-2c18-4ba5-8804-fbc8b0c71ea8', 2, 'Cryopreservation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47b0f654-e9cd-4194-a536-145b01e971ec', '2b8e9aaa-2c18-4ba5-8804-fbc8b0c71ea8', 3, 'Captive breeding only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2b8e9aaa-2c18-4ba5-8804-fbc8b0c71ea8', '471e2dae-def2-477b-8769-fb37b934209d', 'In-situ conservation protects species within their natural habitat (e.g., national parks, biosphere reserves, sanctuaries); ex-situ conservation removes organisms from their natural habitat (e.g., zoos, seed banks, botanical gardens).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7bb2be1b-bab5-421a-9836-d3de291ff065', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 160, 'Vermicomposting is a method of solid waste management that uses:', 'Biology', 'Environmental Issues — Solid Waste Management');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a01d515b-ac5b-4337-b138-fd919b517edd', '7bb2be1b-bab5-421a-9836-d3de291ff065', 0, 'High-temperature incineration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a09d9fd-9f2b-4738-9e01-055c8eccaa6b', '7bb2be1b-bab5-421a-9836-d3de291ff065', 1, 'Earthworms to decompose organic waste into nutrient-rich compost');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce474fd9-19e8-4dbc-b097-e65f20b9558e', '7bb2be1b-bab5-421a-9836-d3de291ff065', 2, 'Chemical dissolution of waste');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7982a9e-7832-421d-a5eb-b9c666669b68', '7bb2be1b-bab5-421a-9836-d3de291ff065', 3, 'Landfilling exclusively without any biological process');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7bb2be1b-bab5-421a-9836-d3de291ff065', '7a09d9fd-9f2b-4738-9e01-055c8eccaa6b', 'Vermicomposting uses earthworms (commonly species like Eisenia fetida) to break down organic waste into a nutrient-rich compost, a low-cost, eco-friendly waste management method.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('65a38d60-33dd-430d-909a-fad58955e366', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 161, 'The stage of meiosis I during which crossing over between homologous chromosomes occurs is:', 'Biology', 'Cell Cycle and Cell Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca238e8f-bc40-43b7-81c5-1bcb548e6eeb', '65a38d60-33dd-430d-909a-fad58955e366', 0, 'Prophase I');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e014f92e-62fd-475c-a434-2ec6106add64', '65a38d60-33dd-430d-909a-fad58955e366', 1, 'Metaphase I');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('232d7108-5376-4ce5-a4a2-e79b2f4e2f97', '65a38d60-33dd-430d-909a-fad58955e366', 2, 'Anaphase I');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b832394-2280-420e-a25a-6dab339f7777', '65a38d60-33dd-430d-909a-fad58955e366', 3, 'Telophase I');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('65a38d60-33dd-430d-909a-fad58955e366', 'ca238e8f-bc40-43b7-81c5-1bcb548e6eeb', 'Crossing over, the exchange of genetic material between non-sister chromatids of homologous chromosomes, occurs during the pachytene sub-stage of prophase I in meiosis.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('693a1cfc-f0be-45ed-ba78-08788f022d71', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 162, 'The enzyme pepsin, active in the acidic environment of the stomach, primarily digests:', 'Biology', 'Digestion and Absorption');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67cebacd-f24c-4d93-9c0f-b8ff0443837b', '693a1cfc-f0be-45ed-ba78-08788f022d71', 0, 'Carbohydrates into simple sugars');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e48014b-e96a-45b2-84af-62b9478e2457', '693a1cfc-f0be-45ed-ba78-08788f022d71', 1, 'Proteins into smaller peptides');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07ab6e24-f5cf-49d9-8a29-fa843dabc169', '693a1cfc-f0be-45ed-ba78-08788f022d71', 2, 'Fats into fatty acids and glycerol');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3acd7471-43f1-474d-8625-ba753ecac77f', '693a1cfc-f0be-45ed-ba78-08788f022d71', 3, 'Nucleic acids into nucleotides');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('693a1cfc-f0be-45ed-ba78-08788f022d71', '5e48014b-e96a-45b2-84af-62b9478e2457', 'Pepsin, secreted as inactive pepsinogen and activated by stomach HCl, begins the breakdown of dietary proteins into smaller polypeptides in the stomach''s acidic environment.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1aa70760-e9f2-4f7a-9884-96b864966ba8', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 163, 'A person with blood group AB is often called the ''universal recipient'' because their plasma:', 'Biology', 'Body Fluids and Circulation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1be14518-5a5c-46a2-bffe-f97a1bc5bffb', '1aa70760-e9f2-4f7a-9884-96b864966ba8', 0, 'Contains both anti-A and anti-B antibodies');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ad84cb3-808b-4328-993f-05fa0769c730', '1aa70760-e9f2-4f7a-9884-96b864966ba8', 1, 'Contains neither anti-A nor anti-B antibodies, so it will not agglutinate donor RBCs of any ABO type');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('365fc608-84a2-4176-8bc7-942c23c046f1', '1aa70760-e9f2-4f7a-9884-96b864966ba8', 2, 'Contains only anti-A antibodies');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95e56c2d-b4fe-4d87-80df-4f23b6bbf1c9', '1aa70760-e9f2-4f7a-9884-96b864966ba8', 3, 'Contains only anti-B antibodies');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1aa70760-e9f2-4f7a-9884-96b864966ba8', '3ad84cb3-808b-4328-993f-05fa0769c730', 'AB individuals have both A and B antigens on their RBCs but produce neither anti-A nor anti-B antibodies, so in principle they can receive RBCs from any ABO blood type without an ABO-mismatch agglutination reaction.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9e160260-9471-411a-b73a-6143ee21a541', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 164, 'The primary nitrogenous waste product excreted by humans (a ureotelic organism) is:', 'Biology', 'Excretory Products and Their Elimination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b026f4d-b36e-476a-8c60-92a163966ab6', '9e160260-9471-411a-b73a-6143ee21a541', 0, 'Ammonia');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09dd1c6b-1e15-4a3f-b5cc-90bab5156eca', '9e160260-9471-411a-b73a-6143ee21a541', 1, 'Urea');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c4df9ee-2c7a-4b24-ada6-c16aed1cc0db', '9e160260-9471-411a-b73a-6143ee21a541', 2, 'Uric acid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3cba204-1c69-4429-a412-8f96c5b923b9', '9e160260-9471-411a-b73a-6143ee21a541', 3, 'Creatine');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9e160260-9471-411a-b73a-6143ee21a541', '09dd1c6b-1e15-4a3f-b5cc-90bab5156eca', 'Humans are ureotelic, converting toxic ammonia into the far less toxic urea (via the liver''s ornithine/urea cycle) for excretion, mainly through the kidneys.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d5319b66-3075-4f33-86b8-00006aefbab8', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 165, 'The resting membrane potential of a typical neuron is maintained mainly by the unequal distribution of which ions, aided by the sodium-potassium pump?', 'Biology', 'Neural Control and Coordination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e043f514-09c9-43e6-bbdf-23540a7611df', 'd5319b66-3075-4f33-86b8-00006aefbab8', 0, 'Calcium and chloride only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('614ac535-40ba-4d24-8f7c-9956cbb7826b', 'd5319b66-3075-4f33-86b8-00006aefbab8', 1, 'Sodium (higher outside) and potassium (higher inside)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3bb6bb06-defb-41fb-bcae-7585253feaee', 'd5319b66-3075-4f33-86b8-00006aefbab8', 2, 'Only potassium, with sodium playing no role');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a88e030-6643-4800-bd2f-73ff21aed37c', 'd5319b66-3075-4f33-86b8-00006aefbab8', 3, 'Only chloride ions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d5319b66-3075-4f33-86b8-00006aefbab8', '614ac535-40ba-4d24-8f7c-9956cbb7826b', 'The Na+/K+ ATPase pump actively maintains a higher Na+ concentration outside and higher K+ concentration inside the neuron, and the membrane''s selective K+ permeability at rest establishes the negative resting potential (~-70 mV).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b93d1116-6343-42aa-be34-bb655593cd7b', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 166, 'The hormone primarily responsible for triggering ovulation (the LH surge) in the human menstrual cycle is:', 'Biology', 'Human Reproduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3299e43-ca71-4302-b2a0-36cfbfc3540d', 'b93d1116-6343-42aa-be34-bb655593cd7b', 0, 'Follicle Stimulating Hormone (FSH) alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2c08310-5328-4d41-aed7-d85787b0cff5', 'b93d1116-6343-42aa-be34-bb655593cd7b', 1, 'Luteinizing Hormone (LH)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('782dbbc7-571b-4364-b75c-8be34c28bd70', 'b93d1116-6343-42aa-be34-bb655593cd7b', 2, 'Progesterone alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e6357a2-f415-4c3c-ab0e-a3031b850c34', 'b93d1116-6343-42aa-be34-bb655593cd7b', 3, 'Oxytocin');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b93d1116-6343-42aa-be34-bb655593cd7b', 'b2c08310-5328-4d41-aed7-d85787b0cff5', 'A mid-cycle surge in Luteinizing Hormone (LH), triggered by rising estrogen from the developing follicle, induces rupture of the Graafian follicle and release of the ovum — ovulation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('65865b74-739e-408d-8ded-705a6c4d551d', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 167, 'Active immunity, as opposed to passive immunity, involves:', 'Biology', 'Human Health and Disease — Immunity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('146e5a11-3f32-4b97-bdae-411c9f3dadd5', '65865b74-739e-408d-8ded-705a6c4d551d', 0, 'Directly injecting pre-formed antibodies into the body');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b3e3535-69ae-4968-92f5-28fe2eafc7f6', '65865b74-739e-408d-8ded-705a6c4d551d', 1, 'The body''s own immune system producing antibodies in response to an antigen (e.g., after infection or vaccination)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81af52e1-e75e-47c7-8dce-c7af6d53de66', '65865b74-739e-408d-8ded-705a6c4d551d', 2, 'No immune response at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a4a458a-7e87-4a5e-9994-87f349c65175', '65865b74-739e-408d-8ded-705a6c4d551d', 3, 'Transfer of maternal antibodies to a foetus only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('65865b74-739e-408d-8ded-705a6c4d551d', '2b3e3535-69ae-4968-92f5-28fe2eafc7f6', 'Active immunity develops when the individual''s own immune system is stimulated (by natural infection or vaccination) to produce antibodies and memory cells, giving long-lasting protection, unlike passive immunity''s temporary borrowed antibodies.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e04612b5-e108-4618-b63f-7ee93077a7b1', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 168, 'Intra-Uterine Devices (IUDs) such as Copper-T are a method of contraception that primarily works by:', 'Biology', 'Reproductive Health — Contraception');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f74eda6-d179-4ed8-ba7a-5944fa11d1b7', 'e04612b5-e108-4618-b63f-7ee93077a7b1', 0, 'Preventing ovulation entirely, like hormonal pills');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3009276-01d6-4521-b22b-404dd55d8b71', 'e04612b5-e108-4618-b63f-7ee93077a7b1', 1, 'Creating a hostile intra-uterine environment for sperm and interfering with fertilization/implantation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd88a73c-0005-4ef9-8974-f1563936de0b', 'e04612b5-e108-4618-b63f-7ee93077a7b1', 2, 'Blocking the fallopian tubes surgically');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81875fc0-fe1f-45f9-89e3-a2151027d38e', 'e04612b5-e108-4618-b63f-7ee93077a7b1', 3, 'Killing all sperm before ejaculation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e04612b5-e108-4618-b63f-7ee93077a7b1', 'd3009276-01d6-4521-b22b-404dd55d8b71', 'Copper-releasing IUDs increase phagocytosis of sperm and create an environment in the uterus unfavorable for fertilization and implantation; they are a reversible, non-hormonal (for copper types) contraceptive method distinct from surgical sterilization or hormonal pills.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1f615b4b-24a5-4ab9-ba0d-9cb09715b526', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 169, 'The Human Genome Project aimed to determine, among other goals, the complete sequence of:', 'Biology', 'Molecular Basis of Inheritance — Human Genome');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0df4ca66-48fd-451c-9ead-05e503e5ea00', '1f615b4b-24a5-4ab9-ba0d-9cb09715b526', 0, 'Only the coding genes in the human genome');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db89d807-f31c-4bc6-8c02-1de95368ffbd', '1f615b4b-24a5-4ab9-ba0d-9cb09715b526', 1, 'All the base pairs (approximately 3 billion) that make up human DNA, and identify all genes within it');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b204391e-e8f7-4d86-9e67-e88e704eda17', '1f615b4b-24a5-4ab9-ba0d-9cb09715b526', 2, 'Only mitochondrial DNA');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1033d60-051f-43ba-9d94-20c2c8bfe6d1', '1f615b4b-24a5-4ab9-ba0d-9cb09715b526', 3, 'The genome of a single chromosome only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1f615b4b-24a5-4ab9-ba0d-9cb09715b526', 'db89d807-f31c-4bc6-8c02-1de95368ffbd', 'The Human Genome Project sequenced essentially the entire human genome (~3 billion base pairs) and aimed to identify all the genes present, most of which turned out to be non-coding DNA.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('906a40e1-7251-45af-a51d-b74c7b454d96', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 170, 'Homologous organs, such as the forelimbs of humans, whales, and bats, share the same basic structural plan but different functions. This is considered evidence for:', 'Biology', 'Evolution — Evidence');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e2a7ddad-4ee2-45ac-b2da-c2bc35415d80', '906a40e1-7251-45af-a51d-b74c7b454d96', 0, 'Convergent evolution only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51132242-9803-4186-8000-1f1833bf5246', '906a40e1-7251-45af-a51d-b74c7b454d96', 1, 'Divergent evolution from a common ancestor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b73ed653-0d47-45fa-bada-a48f3f14bf12', '906a40e1-7251-45af-a51d-b74c7b454d96', 2, 'No evolutionary relationship at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('163aa607-c68e-4692-b0f3-ec0d4d9e88fd', '906a40e1-7251-45af-a51d-b74c7b454d96', 3, 'Analogous adaptation without common ancestry');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('906a40e1-7251-45af-a51d-b74c7b454d96', '51132242-9803-4186-8000-1f1833bf5246', 'Homologous structures share fundamental anatomical similarity due to descent from a common ancestor, later diverging in form/function to suit different environments — classic evidence for divergent evolution, distinct from analogous organs (e.g., wings of insects and birds), which show convergent evolution.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c656db8f-3e49-406e-a93c-1e7764c2fe54', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 171, 'The type of joint found at the shoulder, allowing movement in almost all directions, is a:', 'Biology', 'Locomotion and Movement — Skeletal System');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3acec99d-03c7-4b1a-8b88-d4070f183f7e', 'c656db8f-3e49-406e-a93c-1e7764c2fe54', 0, 'Hinge joint');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca42a4e8-ef4d-46c8-ad8e-f2c04678b71b', 'c656db8f-3e49-406e-a93c-1e7764c2fe54', 1, 'Ball-and-socket joint');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04395c10-9b0d-4c2d-9e51-fed34be80e44', 'c656db8f-3e49-406e-a93c-1e7764c2fe54', 2, 'Pivot joint');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa369759-febc-4c5c-bee4-85f6fe89f612', 'c656db8f-3e49-406e-a93c-1e7764c2fe54', 3, 'Gliding joint');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c656db8f-3e49-406e-a93c-1e7764c2fe54', 'ca42a4e8-ef4d-46c8-ad8e-f2c04678b71b', 'The ball-and-socket joint (shoulder, hip) allows the widest range of movement in multiple planes, unlike a hinge joint (elbow, knee) which permits movement in essentially one plane.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('dbd01848-4427-4ac6-a2b2-611bc3889bd8', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 172, 'Iodine deficiency in the diet can lead to goitre because it impairs the synthesis of:', 'Biology', 'Chemical Coordination and Integration — Thyroid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91ad0894-8566-448e-8468-e4a3ee0ec1d0', 'dbd01848-4427-4ac6-a2b2-611bc3889bd8', 0, 'Insulin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2203c99c-5f07-4316-9dd2-5eabf7776f61', 'dbd01848-4427-4ac6-a2b2-611bc3889bd8', 1, 'Thyroid hormones (T3 and T4)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cbed29ed-7024-4c57-bfeb-2b36117f0da1', 'dbd01848-4427-4ac6-a2b2-611bc3889bd8', 2, 'Growth hormone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f55b868-548f-473e-9bf2-855f8d551fd5', 'dbd01848-4427-4ac6-a2b2-611bc3889bd8', 3, 'Cortisol');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dbd01848-4427-4ac6-a2b2-611bc3889bd8', '2203c99c-5f07-4316-9dd2-5eabf7776f61', 'Iodine is an essential structural component of thyroxine (T4) and triiodothyronine (T3); its deficiency reduces thyroid hormone synthesis, causing compensatory TSH-driven enlargement of the thyroid gland (goitre).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c6b2a979-3511-45ac-90cb-9df262b11377', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 173, 'Metastasis, a hallmark of malignant cancer, refers to:', 'Biology', 'Human Health and Disease — Cancer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6233d24c-495e-490a-a379-2e5cda616845', 'c6b2a979-3511-45ac-90cb-9df262b11377', 0, 'The initial, localized growth of a tumour that does not spread');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bae3da9e-ceed-4926-ada2-7b3a90b90089', 'c6b2a979-3511-45ac-90cb-9df262b11377', 1, 'The spread of cancerous cells from the primary site to other parts of the body via blood or lymph');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e3467a2-8a22-4b1b-9f90-f11a2ebd9bc4', 'c6b2a979-3511-45ac-90cb-9df262b11377', 2, 'The process of a tumour becoming completely benign');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8999f89-a1e3-4bce-8481-cbb3780b06f3', 'c6b2a979-3511-45ac-90cb-9df262b11377', 3, 'Programmed cell death of cancer cells');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c6b2a979-3511-45ac-90cb-9df262b11377', 'bae3da9e-ceed-4926-ada2-7b3a90b90089', 'Metastasis is the process by which malignant cells break away from the primary tumour, travel via blood/lymphatic vessels, and establish secondary tumours elsewhere in the body — a defining feature distinguishing malignant from benign tumours.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('da23e102-bf91-42bf-a42f-57d83314a4ea', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 174, 'In humans, oogenesis (formation of the ovum) begins:', 'Biology', 'Reproduction in Organisms — Gametogenesis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6b660c3-dbe6-4223-a325-029d27c93fa7', 'da23e102-bf91-42bf-a42f-57d83314a4ea', 0, 'Only after puberty is reached');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59119250-3cfb-48bb-97ee-13b8a3d42f9c', 'da23e102-bf91-42bf-a42f-57d83314a4ea', 1, 'During the foetal stage, with oogonia formation and initiation of meiosis before birth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85f5bb23-2e2b-4873-aca7-be29a4e255c6', 'da23e102-bf91-42bf-a42f-57d83314a4ea', 2, 'Only during pregnancy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1378ac59-1c65-4581-9706-1556c61863c6', 'da23e102-bf91-42bf-a42f-57d83314a4ea', 3, 'It never actually completes meiosis at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('da23e102-bf91-42bf-a42f-57d83314a4ea', '59119250-3cfb-48bb-97ee-13b8a3d42f9c', 'Oogonia form and begin meiosis I during foetal development, arresting at prophase I until puberty, when a batch resumes development each cycle — unlike spermatogenesis, which begins only at puberty and continues throughout adult life.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1d336ef4-d95b-488a-a22f-fa4f9993d172', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 175, 'Pedigree analysis is a tool used to:', 'Biology', 'Genetics and Evolution — Pedigree Analysis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f26a2dd1-8664-48b8-888c-9f1552c66b3f', '1d336ef4-d95b-488a-a22f-fa4f9993d172', 0, 'Sequence an individual''s entire genome directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('422e1730-97de-4fd7-bd3b-f121893e57b5', '1d336ef4-d95b-488a-a22f-fa4f9993d172', 1, 'Trace the inheritance pattern of a particular trait through several generations of a family');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec243b2b-c4d9-428a-9722-5856d4c4b056', '1d336ef4-d95b-488a-a22f-fa4f9993d172', 2, 'Directly edit genes in an embryo');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3bfb6fc7-bfb1-4839-9c9d-4f5af5a63843', '1d336ef4-d95b-488a-a22f-fa4f9993d172', 3, 'Measure blood pressure across generations');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1d336ef4-d95b-488a-a22f-fa4f9993d172', '422e1730-97de-4fd7-bd3b-f121893e57b5', 'Pedigree charts track a specific trait''s occurrence across a family tree, helping determine whether inheritance is dominant/recessive, autosomal/X-linked, without needing direct DNA sequencing.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d234740c-7333-4c94-af4f-657525988ede', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 176, 'The Polymerase Chain Reaction (PCR) is a technique used to:', 'Biology', 'Biotechnology — Principles and Processes — PCR');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cba758b1-8a56-428a-8d6b-68a57178f1bc', 'd234740c-7333-4c94-af4f-657525988ede', 0, 'Sequence proteins');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1030bc9d-6fa8-4907-85d5-4a41d3798a02', 'd234740c-7333-4c94-af4f-657525988ede', 1, 'Amplify a specific segment of DNA into millions of copies in vitro');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f0d6825-45fc-403d-bb83-8b9c06ccd9f4', 'd234740c-7333-4c94-af4f-657525988ede', 2, 'Separate DNA fragments by size');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5475a16-9baf-4fb4-a4d0-6811e612584e', 'd234740c-7333-4c94-af4f-657525988ede', 3, 'Cut DNA at specific restriction sites');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d234740c-7333-4c94-af4f-657525988ede', '1030bc9d-6fa8-4907-85d5-4a41d3798a02', 'PCR uses repeated cycles of denaturation, annealing, and extension (via a heat-stable DNA polymerase like Taq polymerase) to exponentially amplify a targeted DNA sequence, widely used in diagnostics and forensics.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('626e66d3-99c1-468e-bd92-66663be4515f', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 177, 'Lichens, formed by a symbiotic association between a fungus and a photosynthetic alga/cyanobacterium, are a classic example of:', 'Biology', 'Organisms and Populations — Population Interactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3dacc3e7-7093-42e1-9998-c4cf1d274ba4', '626e66d3-99c1-468e-bd92-66663be4515f', 0, 'Parasitism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb374e85-1795-4021-b907-d1ef53918f83', '626e66d3-99c1-468e-bd92-66663be4515f', 1, 'Mutualism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cb2ea77-ee4e-4e35-9ac8-3f48f0f5708c', '626e66d3-99c1-468e-bd92-66663be4515f', 2, 'Commensalism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3af9f56e-0915-45f5-9789-b39c1e5440ea', '626e66d3-99c1-468e-bd92-66663be4515f', 3, 'Amensalism');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('626e66d3-99c1-468e-bd92-66663be4515f', 'eb374e85-1795-4021-b907-d1ef53918f83', 'In lichens, the fungus provides structure/protection and absorbs water/minerals, while the photosynthetic partner provides organic nutrients — a mutually beneficial (mutualistic) relationship.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('68c99887-42f0-4db4-bbc8-3b46139c1713', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 178, 'In the nitrogen cycle, the process of converting atmospheric nitrogen gas (N2) into ammonia, usable by plants, is called:', 'Biology', 'Ecosystem — Nutrient Cycling');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e2f5de6-25da-4516-8c64-db1b9a02bb34', '68c99887-42f0-4db4-bbc8-3b46139c1713', 0, 'Nitrification');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7bd12dc9-bb31-4ef4-b254-286f5d731554', '68c99887-42f0-4db4-bbc8-3b46139c1713', 1, 'Nitrogen fixation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e6ef44d-4fb0-4ea2-bf0d-fd7db8529f2d', '68c99887-42f0-4db4-bbc8-3b46139c1713', 2, 'Denitrification');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('56e853e2-7a33-4631-821e-1dfa9d050cc8', '68c99887-42f0-4db4-bbc8-3b46139c1713', 3, 'Ammonification');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('68c99887-42f0-4db4-bbc8-3b46139c1713', '7bd12dc9-bb31-4ef4-b254-286f5d731554', 'Nitrogen fixation (via bacteria like Rhizobium, or industrially via the Haber process, or by lightning) converts inert atmospheric N2 into ammonia (NH3), the entry point of nitrogen into biologically usable forms.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('52822a06-796e-4d0b-8b69-531b57c11551', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 179, 'Most of the carbon dioxide transported in human blood from tissues to the lungs is carried in the form of:', 'Biology', 'Breathing and Exchange of Gases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6eadb932-d833-4207-abc0-819ea700d380', '52822a06-796e-4d0b-8b69-531b57c11551', 0, 'Dissolved CO2 gas directly in plasma');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7fff5ea7-b6fb-4bfb-87f3-2c6ccea271db', '52822a06-796e-4d0b-8b69-531b57c11551', 1, 'Bicarbonate ions (HCO3-) in plasma');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06ae1994-ad41-4df2-8feb-72a33d985cf0', '52822a06-796e-4d0b-8b69-531b57c11551', 2, 'Carbaminohaemoglobin only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a37229a-b9f9-4aaf-a325-a887333afd43', '52822a06-796e-4d0b-8b69-531b57c11551', 3, 'CO2 bound tightly and irreversibly to haemoglobin');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('52822a06-796e-4d0b-8b69-531b57c11551', '7fff5ea7-b6fb-4bfb-87f3-2c6ccea271db', 'Roughly 70% of transported CO2 is carried as bicarbonate ions in plasma/RBCs (formed via carbonic anhydrase), a smaller fraction (~20-25%) as carbaminohaemoglobin, and only a small amount dissolved directly in plasma.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('96e3ed4c-af20-4942-9b94-30c2e3fc8a6b', '2b148a4e-4b79-4c1b-b7e2-500e2975012f', 180, 'Cardiac muscle is unique among the three muscle types in that it is:', 'Biology', 'Locomotion and Movement — Muscle Types');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53399b89-04aa-46af-b767-7ef97692a3d3', '96e3ed4c-af20-4942-9b94-30c2e3fc8a6b', 0, 'Voluntary and unstriated');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1d03c23-5403-43e2-b732-a78e1e43ac14', '96e3ed4c-af20-4942-9b94-30c2e3fc8a6b', 1, 'Involuntary and striated, with intercalated discs enabling coordinated contraction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd9bd444-1967-4f46-b23e-2faf6d4bc344', '96e3ed4c-af20-4942-9b94-30c2e3fc8a6b', 2, 'Voluntary and striated, like skeletal muscle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbb00a37-ac20-43c6-aa84-42cea206590f', '96e3ed4c-af20-4942-9b94-30c2e3fc8a6b', 3, 'Involuntary and completely non-contractile');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('96e3ed4c-af20-4942-9b94-30c2e3fc8a6b', 'c1d03c23-5403-43e2-b732-a78e1e43ac14', 'Cardiac muscle combines striated appearance (like skeletal muscle) with involuntary control, and its cells are joined by intercalated discs that allow the heart to contract as a coordinated functional syncytium.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');
