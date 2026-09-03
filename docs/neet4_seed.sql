-- ============================================================
-- NEET UG — Full Mock Paper 4
-- Full-Length Practice Paper (180 questions, 180 minutes)
-- Marking: +4 correct / -1 incorrect (official NEET UG scheme)
-- Run this AFTER docs/add-question-subject-marking.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('0149f54c-cf0b-492a-b9ee-8708ff2076e8', 'neet-practice-4', 'NEET UG Full Mock Paper 4', 'neet', ARRAY['Physics', 'Chemistry', 'Biology', 'Botany', 'Zoology', 'NCERT', 'NEET UG']::TEXT[], 180, 'mixed', true, 4, 180, 4, 1);

-- ── Section: Physics (45 questions) — Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('668f1f1a-bb49-417d-a7b2-e14c338be9e0', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 1, 'Which of the following is a derived, not a fundamental, SI unit?', 'Physics', 'Units and Measurements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('168c459e-c9ff-4798-9c8b-d9e360121e84', '668f1f1a-bb49-417d-a7b2-e14c338be9e0', 0, 'Kilogram');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d6c63e4-f2d5-4dd6-8500-fbabf0691bf9', '668f1f1a-bb49-417d-a7b2-e14c338be9e0', 1, 'Newton');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb8b5604-1ad6-4d3d-857d-e2e30063f489', '668f1f1a-bb49-417d-a7b2-e14c338be9e0', 2, 'Second');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('666a7289-5613-4776-b9d2-87ac26fe1d0f', '668f1f1a-bb49-417d-a7b2-e14c338be9e0', 3, 'Kelvin');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('668f1f1a-bb49-417d-a7b2-e14c338be9e0', '1d6c63e4-f2d5-4dd6-8500-fbabf0691bf9', 'The newton (force) is a derived unit (kg.m/s^2), built from the fundamental SI units kilogram, metre, and second; kilogram, second, and kelvin are themselves fundamental (base) SI units.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('224a0ca2-dd6c-48c4-b178-29be4b1ad2be', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 2, 'For a body under uniform acceleration a, starting with initial velocity u, the displacement after time t is given by:', 'Physics', 'Motion in a Straight Line');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0fb7ab6e-a57d-48b7-ad14-62d42608e1a4', '224a0ca2-dd6c-48c4-b178-29be4b1ad2be', 0, 's = ut + (1/2)at^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cc0f7f9-2189-4e75-8f23-eb1074434d84', '224a0ca2-dd6c-48c4-b178-29be4b1ad2be', 1, 's = ut - (1/2)at^2 always');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b974c9cd-dcf4-4d2b-b1ef-e674c02fa800', '224a0ca2-dd6c-48c4-b178-29be4b1ad2be', 2, 's = at^2 only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('439c18d9-c826-48dd-8190-284f8fd5ce9b', '224a0ca2-dd6c-48c4-b178-29be4b1ad2be', 3, 's = u + at');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('224a0ca2-dd6c-48c4-b178-29be4b1ad2be', '0fb7ab6e-a57d-48b7-ad14-62d42608e1a4', 'The standard second equation of motion under uniform acceleration: s = ut + (1/2)at^2 (with sign convention for a depending on whether it is speeding up or slowing down).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b23c9b71-a380-45d6-8d32-285ffd7ba954', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 3, 'The maximum static friction force between two surfaces is generally found to be:', 'Physics', 'Laws of Motion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e2c279c0-1f2a-41aa-a695-eb8c367bd040', 'b23c9b71-a380-45d6-8d32-285ffd7ba954', 0, 'Independent of the normal reaction force between the surfaces');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f01e09a3-fa88-49ab-b5fc-5407ef739252', 'b23c9b71-a380-45d6-8d32-285ffd7ba954', 1, 'Directly proportional to the normal reaction force between the surfaces (F_max = mu_s * N)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1585aa6-f31e-47ca-9e6d-325e7271bed6', 'b23c9b71-a380-45d6-8d32-285ffd7ba954', 2, 'Inversely proportional to the normal force');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0290c4e6-3305-4d7f-9358-6e4ed65666bc', 'b23c9b71-a380-45d6-8d32-285ffd7ba954', 3, 'Equal to the applied force at all times, regardless of magnitude');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b23c9b71-a380-45d6-8d32-285ffd7ba954', 'f01e09a3-fa88-49ab-b5fc-5407ef739252', 'Maximum static friction is proportional to the normal reaction force, F_max = mu_s * N, where mu_s is the coefficient of static friction — a key relationship in analyzing whether an object begins to slide.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a451420c-3c8d-4a25-b7bd-8a965e8f66cc', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 4, 'Power is defined as the rate of doing work, mathematically expressed for constant force and velocity as:', 'Physics', 'Work, Energy and Power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb6bb842-9225-4db4-a45b-1b8fc0e39bcf', 'a451420c-3c8d-4a25-b7bd-8a965e8f66cc', 0, 'P = F/v');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5179b50e-1cf0-46ca-9673-24ff2cc69808', 'a451420c-3c8d-4a25-b7bd-8a965e8f66cc', 1, 'P = F.v (dot product of force and velocity)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b56b1c4-0932-4fe5-b87a-d815fe65197c', 'a451420c-3c8d-4a25-b7bd-8a965e8f66cc', 2, 'P = F + v');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c0dcfeb-3b76-4376-92ac-7e167f6b3c99', 'a451420c-3c8d-4a25-b7bd-8a965e8f66cc', 3, 'P = F - v');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a451420c-3c8d-4a25-b7bd-8a965e8f66cc', '5179b50e-1cf0-46ca-9673-24ff2cc69808', 'Instantaneous power delivered by a force is P = F.v (the dot product of force and velocity vectors), reducing to P = Fv*cos(theta) where theta is the angle between them.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1b786f5e-d00a-47fe-af21-29667b1c051a', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 5, 'For a rigid body in rotational equilibrium, the net external torque acting on it must be:', 'Physics', 'System of Particles and Rotational Motion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b1d49cb-0523-49fa-9b90-f56603d2e154', '1b786f5e-d00a-47fe-af21-29667b1c051a', 0, 'Non-zero and constant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b53a15f-213e-44ef-aca7-27ab920c8f70', '1b786f5e-d00a-47fe-af21-29667b1c051a', 1, 'Zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('695885bf-b07e-45cc-baab-eb0eac0f292b', '1b786f5e-d00a-47fe-af21-29667b1c051a', 2, 'Always equal to its moment of inertia');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff42c91b-435f-4494-9414-6f34a4bc203d', '1b786f5e-d00a-47fe-af21-29667b1c051a', 3, 'Equal to its angular momentum');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1b786f5e-d00a-47fe-af21-29667b1c051a', '3b53a15f-213e-44ef-aca7-27ab920c8f70', 'Rotational equilibrium (no angular acceleration) requires the net external torque on the body to be exactly zero, analogous to the zero net force condition for translational equilibrium.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5c7c54f6-9e6c-4811-987f-85eef6c9a223', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 6, 'Kepler''s second law (the law of areas) states that the line joining a planet to the Sun sweeps out:', 'Physics', 'Gravitation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5b5973b-4590-43c9-bce4-2c93c270eec7', '5c7c54f6-9e6c-4811-987f-85eef6c9a223', 0, 'Equal areas in equal intervals of time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12e82f13-d1d2-45ad-a87c-45dba1e5a914', '5c7c54f6-9e6c-4811-987f-85eef6c9a223', 1, 'Equal angles in equal intervals of time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57f49737-9fa6-4574-96c6-c83069991d31', '5c7c54f6-9e6c-4811-987f-85eef6c9a223', 2, 'A constant area regardless of time elapsed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e722d899-b301-4ec5-a8cd-82dec9a250b0', '5c7c54f6-9e6c-4811-987f-85eef6c9a223', 3, 'Decreasing area over time as the planet slows');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5c7c54f6-9e6c-4811-987f-85eef6c9a223', 'f5b5973b-4590-43c9-bce4-2c93c270eec7', 'Kepler''s second law: the radius vector from the Sun to a planet sweeps out equal areas in equal time intervals — a direct consequence of the conservation of angular momentum for a planet orbiting under a central gravitational force.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7088a6c8-a37c-40f8-919a-fa0e21860f25', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 7, 'The bulk modulus of a material relates:', 'Physics', 'Mechanical Properties of Solids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bf6c0b93-9e34-4906-bffd-1ceff8cdbcc1', '7088a6c8-a37c-40f8-919a-fa0e21860f25', 0, 'Shear stress to shear strain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('faf58be9-e644-46e7-a1c0-686b07d0cc49', '7088a6c8-a37c-40f8-919a-fa0e21860f25', 1, 'Volumetric (hydraulic) stress to the resulting fractional change in volume');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6fd6aa0-5128-4ee8-a6b8-12cc2c722180', '7088a6c8-a37c-40f8-919a-fa0e21860f25', 2, 'Only tensile stress in a wire');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d000609-37a4-403d-b031-f2cfc8df76a0', '7088a6c8-a37c-40f8-919a-fa0e21860f25', 3, 'Torque to angular displacement');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7088a6c8-a37c-40f8-919a-fa0e21860f25', 'faf58be9-e644-46e7-a1c0-686b07d0cc49', 'Bulk modulus K = (volumetric stress)/(volumetric strain), describing a material''s resistance to uniform compression from all sides, such as under hydraulic pressure.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7c339110-504b-4c74-8e0a-143016c61cb6', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 8, 'Surface tension of a liquid is the property responsible for:', 'Physics', 'Mechanical Properties of Fluids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f37ca5c-61dd-4193-8170-a2c484842db0', '7c339110-504b-4c74-8e0a-143016c61cb6', 0, 'A liquid''s tendency to minimize its surface area, behaving as if covered by a stretched elastic membrane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc73c26d-6621-4446-b1ea-0f23811a0043', '7c339110-504b-4c74-8e0a-143016c61cb6', 1, 'A liquid''s viscosity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85e79dcf-b05e-495d-9742-94cedac723c9', '7c339110-504b-4c74-8e0a-143016c61cb6', 2, 'The buoyant force on submerged objects');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b761f9c5-2767-479d-9bd0-d5992065e003', '7c339110-504b-4c74-8e0a-143016c61cb6', 3, 'The compressibility of the liquid');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7c339110-504b-4c74-8e0a-143016c61cb6', '5f37ca5c-61dd-4193-8170-a2c484842db0', 'Surface tension arises from cohesive forces between liquid molecules at the surface, causing the liquid surface to behave like a stretched elastic membrane that tends to minimize its area — explaining phenomena like droplet formation and capillary rise.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e6463e21-57aa-48bf-b0b9-20cc24971eef', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 9, 'The process by which a solid changes directly into vapor, without passing through the liquid state, is called:', 'Physics', 'Thermal Properties of Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8217e7b0-4ad2-4665-bf30-e647d8126877', 'e6463e21-57aa-48bf-b0b9-20cc24971eef', 0, 'Fusion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('753f955d-e912-440d-907a-1e674a00fbc1', 'e6463e21-57aa-48bf-b0b9-20cc24971eef', 1, 'Vaporization');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f382f9b-f7d1-45ce-b524-ad0d26a7d35e', 'e6463e21-57aa-48bf-b0b9-20cc24971eef', 2, 'Sublimation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2dfe44ca-79dd-4ce6-8833-3effbb51f09c', 'e6463e21-57aa-48bf-b0b9-20cc24971eef', 3, 'Condensation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e6463e21-57aa-48bf-b0b9-20cc24971eef', '2f382f9b-f7d1-45ce-b524-ad0d26a7d35e', 'Sublimation is the direct solid-to-gas phase transition (e.g., dry ice/solid CO2 sublimating), bypassing the liquid state entirely.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e82ba1a3-78dc-4421-a2ff-12d7d943b3d4', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 10, 'According to the second law of thermodynamics, it is impossible to construct a heat engine that:', 'Physics', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72075418-dba1-499b-bfbb-2d480c963845', 'e82ba1a3-78dc-4421-a2ff-12d7d943b3d4', 0, 'Converts some heat into work');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26090e44-0bcd-4646-a11c-d9f3689fd9c1', 'e82ba1a3-78dc-4421-a2ff-12d7d943b3d4', 1, 'Converts ALL the heat absorbed from a hot reservoir completely into work with 100% efficiency, with no waste heat rejected');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2eab5249-247c-490d-bb6a-027b47f6323f', 'e82ba1a3-78dc-4421-a2ff-12d7d943b3d4', 2, 'Uses two different temperature reservoirs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50277b05-a5cb-49ef-aebf-25bd8329fbe3', 'e82ba1a3-78dc-4421-a2ff-12d7d943b3d4', 3, 'Involves any mechanical moving parts');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e82ba1a3-78dc-4421-a2ff-12d7d943b3d4', '26090e44-0bcd-4646-a11c-d9f3689fd9c1', 'The second law (Kelvin-Planck statement) forbids a heat engine operating in a cycle from converting 100% of absorbed heat into work — some heat must always be rejected to a cold reservoir.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e5535a99-7e4f-451d-b2c6-e8114fbea84b', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 11, 'The mean free path of a gas molecule refers to:', 'Physics', 'Kinetic Theory');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2effd055-19c2-4783-a01c-7b46e1cd0827', 'e5535a99-7e4f-451d-b2c6-e8114fbea84b', 0, 'The total distance traveled by a molecule during a fixed time period');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2601992-cd12-4aac-8e2e-1a7ad93d81ff', 'e5535a99-7e4f-451d-b2c6-e8114fbea84b', 1, 'The average distance a molecule travels between successive collisions with other molecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78ae915d-6707-45c0-b2d0-7ba2831b66f8', 'e5535a99-7e4f-451d-b2c6-e8114fbea84b', 2, 'The radius of the gas container');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('82fc2abe-0a9e-4d1b-881e-68ff345d4ad1', 'e5535a99-7e4f-451d-b2c6-e8114fbea84b', 3, 'The distance a molecule travels in exactly one second');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e5535a99-7e4f-451d-b2c6-e8114fbea84b', 'f2601992-cd12-4aac-8e2e-1a7ad93d81ff', 'Mean free path is the average distance a gas molecule covers between one collision and the next, depending on molecular density and size — it decreases as pressure/density increases.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('298e61d4-115f-4ca6-959b-d83780791e77', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 12, 'Damped oscillations occur when a system experiences:', 'Physics', 'Oscillations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f67e56e-54af-4a0e-8258-d0ae13cf6ccc', '298e61d4-115f-4ca6-959b-d83780791e77', 0, 'No resistive/frictional forces at all, oscillating forever with constant amplitude');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e77d142e-b64f-429a-bfda-7534c457133c', '298e61d4-115f-4ca6-959b-d83780791e77', 1, 'A resistive force that progressively reduces the amplitude of oscillation over time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c3230b6-1dc3-40c2-bdb1-0f8c7d70e220', '298e61d4-115f-4ca6-959b-d83780791e77', 2, 'An external periodic driving force at resonance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1083739-8e0d-451a-86d0-397e8cbf619e', '298e61d4-115f-4ca6-959b-d83780791e77', 3, 'Infinite amplitude growth over time');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('298e61d4-115f-4ca6-959b-d83780791e77', 'e77d142e-b64f-429a-bfda-7534c457133c', 'Damped oscillations occur when a dissipative force (like friction or air resistance) is present, causing the oscillation amplitude to progressively decrease over time as energy is lost from the system.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7036b2ad-0069-4461-a6cd-2bb753211c9c', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 13, 'The pitch of a musical note, as perceived by the human ear, is primarily determined by the sound wave''s:', 'Physics', 'Waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36143c5f-8b80-4abc-8559-2fcd6fa6127f', '7036b2ad-0069-4461-a6cd-2bb753211c9c', 0, 'Amplitude');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ecddeee3-0ac7-40c5-af9d-3b5da3b6631e', '7036b2ad-0069-4461-a6cd-2bb753211c9c', 1, 'Frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f6b3041-b542-4ea3-a183-98bda6a53dc2', '7036b2ad-0069-4461-a6cd-2bb753211c9c', 2, 'Waveform/quality only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93fff9f7-fbf0-4d5c-bfc8-7a2159255ae1', '7036b2ad-0069-4461-a6cd-2bb753211c9c', 3, 'Speed of propagation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7036b2ad-0069-4461-a6cd-2bb753211c9c', 'ecddeee3-0ac7-40c5-af9d-3b5da3b6631e', 'Pitch, the perceived ''highness'' or ''lowness'' of a musical note, is primarily determined by the frequency of the sound wave — higher frequency corresponds to higher perceived pitch.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d01d0459-a5ee-411b-952c-354f3a05bd70', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 14, 'The principle of superposition, as applied to electric fields due to multiple point charges, states that the net field at a point is:', 'Physics', 'Electric Charges and Fields');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7c1b375-73d6-4dbb-9609-5963170e568b', 'd01d0459-a5ee-411b-952c-354f3a05bd70', 0, 'Equal to the field due to the nearest charge only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d4bc5c3-6913-4d51-8479-438c4f2d6321', 'd01d0459-a5ee-411b-952c-354f3a05bd70', 1, 'The vector sum of the individual electric fields due to each charge, calculated as if the others were absent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('874635a4-a79e-4a6c-842b-94985e1bfec4', 'd01d0459-a5ee-411b-952c-354f3a05bd70', 2, 'Always zero when more than one charge is present');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36fdaaa8-657b-4cbd-af0e-71b1d793e10f', 'd01d0459-a5ee-411b-952c-354f3a05bd70', 3, 'The scalar (arithmetic) sum of field magnitudes only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d01d0459-a5ee-411b-952c-354f3a05bd70', '9d4bc5c3-6913-4d51-8479-438c4f2d6321', 'The superposition principle for electric fields states that the total field at any point is the vector sum of the individual fields produced independently by each source charge, unaffected by the presence of other charges.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7a8585ca-6cc2-495e-88b5-de8fac281f89', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 15, 'Dielectric materials are used between the plates of a capacitor primarily to:', 'Physics', 'Electrostatic Potential and Capacitance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d071a74-3505-416e-a9e2-25bbb337a500', '7a8585ca-6cc2-495e-88b5-de8fac281f89', 0, 'Decrease the capacitance of the capacitor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fef62fbb-ef86-41c3-9f52-bca903c2acd0', '7a8585ca-6cc2-495e-88b5-de8fac281f89', 1, 'Increase the capacitance and also allow a higher operating voltage before dielectric breakdown');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93e43591-192e-4dcf-bcfd-220c376bceba', '7a8585ca-6cc2-495e-88b5-de8fac281f89', 2, 'Make the capacitor conduct current continuously');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd89e39c-64bd-4008-9960-67c567adaebf', '7a8585ca-6cc2-495e-88b5-de8fac281f89', 3, 'Eliminate the need for two separate plates');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7a8585ca-6cc2-495e-88b5-de8fac281f89', 'fef62fbb-ef86-41c3-9f52-bca903c2acd0', 'Inserting a dielectric between capacitor plates increases capacitance (by a factor of the dielectric constant) and typically also increases the maximum voltage the capacitor can withstand before electrical breakdown occurs.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('66b924e4-af54-43a2-9796-f1ce1423daae', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 16, 'The equivalent EMF of two identical cells connected in series (aiding each other) is:', 'Physics', 'Current Electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5be2f421-f23f-4326-a776-f69b70f37e21', '66b924e4-af54-43a2-9796-f1ce1423daae', 0, 'The same as a single cell''s EMF');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca95b030-242d-474b-8047-b357388f5481', '66b924e4-af54-43a2-9796-f1ce1423daae', 1, 'Twice the EMF of a single cell');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4652ec53-7f02-496d-b24f-bcaed27de16a', '66b924e4-af54-43a2-9796-f1ce1423daae', 2, 'Half the EMF of a single cell');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f42af0d-64be-42bd-8b25-5f6e44e58fff', '66b924e4-af54-43a2-9796-f1ce1423daae', 3, 'Zero');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('66b924e4-af54-43a2-9796-f1ce1423daae', 'ca95b030-242d-474b-8047-b357388f5481', 'When identical cells are connected in series with their EMFs aiding (positive terminal of one to negative of the next), the total EMF is the simple sum — for two identical cells, this is double the EMF of a single cell.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('daa3e36b-c45b-4ea2-a7a0-dd1ae8419e20', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 17, 'A current-carrying loop placed in a uniform external magnetic field experiences:', 'Physics', 'Moving Charges and Magnetism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de889f5a-ebdc-4326-884a-33e907ed0e5c', 'daa3e36b-c45b-4ea2-a7a0-dd1ae8419e20', 0, 'No force or torque at all under any orientation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4972a9ab-8e47-477d-b702-80c33c7d542a', 'daa3e36b-c45b-4ea2-a7a0-dd1ae8419e20', 1, 'A net torque that tends to align the loop''s magnetic moment with the external field (unless already aligned, and no net translational force in a uniform field)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cef28ebe-c095-4ebe-93cf-4ea0bb61aa57', 'daa3e36b-c45b-4ea2-a7a0-dd1ae8419e20', 2, 'Only a net translational force, never a torque');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db57703e-58c6-4339-a497-e3506c1d0328', 'daa3e36b-c45b-4ea2-a7a0-dd1ae8419e20', 3, 'A force that always pushes it out of the field entirely');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('daa3e36b-c45b-4ea2-a7a0-dd1ae8419e20', '4972a9ab-8e47-477d-b702-80c33c7d542a', 'In a UNIFORM magnetic field, a current loop experiences zero net translational force (forces on opposite sides cancel) but does experience a net torque tau = m x B, tending to rotate/align its magnetic moment vector with the field.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('628caba8-6e2e-41f1-aeca-d59ef5c95ca6', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 18, 'Paramagnetic substances, when placed in an external magnetic field, become:', 'Physics', 'Magnetism and Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd966ea7-9b97-4717-a14f-c0849e0753e5', '628caba8-6e2e-41f1-aeca-d59ef5c95ca6', 0, 'Weakly magnetized in the direction of the applied field, and are weakly attracted to regions of stronger field');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c591b85c-d090-4e14-8cc4-a8751458dfe7', '628caba8-6e2e-41f1-aeca-d59ef5c95ca6', 1, 'Strongly magnetized permanently, retaining magnetism after the field is removed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5bbdaec-7f26-4bca-a8e7-1b736701c1de', '628caba8-6e2e-41f1-aeca-d59ef5c95ca6', 2, 'Weakly magnetized opposite to the applied field');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44e61f51-836f-4917-bcdb-8c30e0b6a0d6', '628caba8-6e2e-41f1-aeca-d59ef5c95ca6', 3, 'Completely unaffected by any magnetic field');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('628caba8-6e2e-41f1-aeca-d59ef5c95ca6', 'dd966ea7-9b97-4717-a14f-c0849e0753e5', 'Paramagnetic materials (e.g., aluminium, platinum) become weakly magnetized IN THE SAME direction as an applied external field and are weakly attracted toward stronger field regions, losing this magnetization once the field is removed.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('18f95db8-ccb9-486d-aea9-915c57d9a4a6', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 19, 'A transformer works on the principle of:', 'Physics', 'Electromagnetic Induction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2b6669f-6baa-4cd3-8fd8-3286805bc196', '18f95db8-ccb9-486d-aea9-915c57d9a4a6', 0, 'Electrostatic induction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3136dfdf-d1a9-4bc9-a5c8-7e389820e6c7', '18f95db8-ccb9-486d-aea9-915c57d9a4a6', 1, 'Mutual electromagnetic induction between two coils linked by a common changing magnetic flux');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3eb5741e-96c8-4b84-a0f9-cb7479199bb7', '18f95db8-ccb9-486d-aea9-915c57d9a4a6', 2, 'Thermoelectric effect');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f625f6ba-f910-4e68-9ee2-cce2ad18e3c1', '18f95db8-ccb9-486d-aea9-915c57d9a4a6', 3, 'Piezoelectric effect');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('18f95db8-ccb9-486d-aea9-915c57d9a4a6', '3136dfdf-d1a9-4bc9-a5c8-7e389820e6c7', 'A transformer operates via mutual induction: an alternating current in the primary coil creates a changing magnetic flux that links the secondary coil (via a common iron core), inducing an EMF in the secondary — it works only with AC, not DC, since DC produces no changing flux.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('14357c26-92aa-4549-a66d-bde94d984f92', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 20, 'The average value of a sinusoidal AC current over a complete cycle is:', 'Physics', 'Alternating Current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c98e1e9c-9204-4f40-93ee-8e02a4fa1ad3', '14357c26-92aa-4549-a66d-bde94d984f92', 0, 'Equal to its peak value');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c225d04-bd67-43bf-8a6b-0af5a159ca01', '14357c26-92aa-4549-a66d-bde94d984f92', 1, 'Zero, since positive and negative half-cycles cancel out');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05a1f0a4-c553-47bb-8b26-ebbcdc273191', '14357c26-92aa-4549-a66d-bde94d984f92', 2, 'Equal to its rms value');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6007a35d-252c-4125-9506-68e7126ef365', '14357c26-92aa-4549-a66d-bde94d984f92', 3, 'Always negative');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('14357c26-92aa-4549-a66d-bde94d984f92', '1c225d04-bd67-43bf-8a6b-0af5a159ca01', 'Over one full sinusoidal cycle, the positive and negative half-cycles are symmetric and exactly cancel when averaged, giving a mean value of zero — this is why rms (root mean square) value is used instead to characterize AC''s effective magnitude.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7fff8d1f-303d-47f8-958a-e76a5bc456ed', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 21, 'The image formed by a plane mirror is always:', 'Physics', 'Ray Optics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dff0aa28-707d-4800-a994-2751f0509eee', '7fff8d1f-303d-47f8-958a-e76a5bc456ed', 0, 'Real and inverted');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2896b132-d43d-49f4-9b48-204d84c00dbc', '7fff8d1f-303d-47f8-958a-e76a5bc456ed', 1, 'Virtual, erect, and of the same size as the object, laterally inverted');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80e819e4-ffad-4741-b8c2-83658c7d08b6', '7fff8d1f-303d-47f8-958a-e76a5bc456ed', 2, 'Real, erect, and magnified');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19f3496b-3bbf-4b3a-8d63-296969921da5', '7fff8d1f-303d-47f8-958a-e76a5bc456ed', 3, 'Virtual and diminished');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7fff8d1f-303d-47f8-958a-e76a5bc456ed', '2896b132-d43d-49f4-9b48-204d84c00dbc', 'A plane mirror always forms a virtual, erect image of the same size as the object, positioned as far behind the mirror as the object is in front — though laterally inverted (left-right reversed).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2b4053b6-c46e-4066-99e3-5b7b55e32526', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 22, 'Huygens'' principle states that every point on a wavefront acts as a source of:', 'Physics', 'Wave Optics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c699f599-7d7f-4bb7-9704-f7f76477ec1c', '2b4053b6-c46e-4066-99e3-5b7b55e32526', 0, 'A completely new, independent wave unrelated to the original');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8001e189-4722-440f-8db0-fb8a8376140b', '2b4053b6-c46e-4066-99e3-5b7b55e32526', 1, 'Secondary wavelets that spread out in all directions with the same speed as the original wave');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5d5e834-faf0-451b-b9a2-24cf35092bf4', '2b4053b6-c46e-4066-99e3-5b7b55e32526', 2, 'Only reflected light, never transmitted');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8efc03f-c9b4-4d16-abc6-041514f522a8', '2b4053b6-c46e-4066-99e3-5b7b55e32526', 3, 'Heat energy exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2b4053b6-c46e-4066-99e3-5b7b55e32526', '8001e189-4722-440f-8db0-fb8a8376140b', 'Huygens'' principle treats every point on an existing wavefront as a source of secondary spherical wavelets; the new wavefront at a later time is the envelope (tangent surface) of these wavelets, a geometric method for predicting wave propagation, reflection, and refraction.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d36284da-b7d9-413e-8d19-becda576f3b0', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 23, 'Photoelectric current, once emission has begun, increases with an increase in the:', 'Physics', 'Dual Nature of Radiation and Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0da995e1-c661-42fb-8c4a-eb5334235dc7', 'd36284da-b7d9-413e-8d19-becda576f3b0', 0, 'Frequency of incident light, regardless of intensity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d15ee487-e361-47f3-8c72-c93d9f0234b1', 'd36284da-b7d9-413e-8d19-becda576f3b0', 1, 'Intensity of incident light (above threshold frequency), since more photons eject more photoelectrons per second');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c74bd9a-f61e-470c-ad9e-3aa8a94661bb', 'd36284da-b7d9-413e-8d19-becda576f3b0', 2, 'Work function of the metal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f3838f20-e829-4f8f-95b8-dd01121ce879', 'd36284da-b7d9-413e-8d19-becda576f3b0', 3, 'Stopping potential applied');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d36284da-b7d9-413e-8d19-becda576f3b0', 'd15ee487-e361-47f3-8c72-c93d9f0234b1', 'Once the incident light frequency exceeds the metal''s threshold frequency, increasing the light''s INTENSITY increases the number of photons striking the surface per second, ejecting more photoelectrons and thus increasing the photoelectric current (though not the maximum KE of each electron).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3347c8a9-8fc3-43b9-896a-dfebef89b268', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 24, 'The energy of an electron in the nth orbit of a hydrogen atom, according to Bohr''s model, is:', 'Physics', 'Atoms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc3d5eb6-9a41-4314-a534-1156ee5ce43b', '3347c8a9-8fc3-43b9-896a-dfebef89b268', 0, 'Directly proportional to n');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4eb5459-5d91-4a5b-90bf-b9089c07f021', '3347c8a9-8fc3-43b9-896a-dfebef89b268', 1, 'Inversely proportional to n^2, and negative (bound state)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d3f0f30-5e0e-439c-9567-7abc0dd3b2c4', '3347c8a9-8fc3-43b9-896a-dfebef89b268', 2, 'Independent of n entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7bd2243e-ded0-4bb5-91e6-6b47a584b259', '3347c8a9-8fc3-43b9-896a-dfebef89b268', 3, 'Directly proportional to n^2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3347c8a9-8fc3-43b9-896a-dfebef89b268', 'c4eb5459-5d91-4a5b-90bf-b9089c07f021', 'Bohr''s model gives E_n = -13.6/n^2 eV for hydrogen, showing energy is inversely proportional to n^2 and negative (indicating a bound electron), with energy becoming less negative (higher) as n increases.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('038202ad-972e-4ec8-87d3-ea4b6e8921ef', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 25, 'Nuclear forces holding nucleons together within the nucleus are characterized as:', 'Physics', 'Nuclei');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d94d8428-1610-468c-a8b4-2cd476270e6e', '038202ad-972e-4ec8-87d3-ea4b6e8921ef', 0, 'Long-range forces, similar to gravity, acting over macroscopic distances');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad465add-5faa-4975-b3a3-0f5aeddf246e', '038202ad-972e-4ec8-87d3-ea4b6e8921ef', 1, 'Short-range, extremely strong forces effective only over distances comparable to nuclear dimensions (a few femtometres)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74d7c224-fc2d-4876-b708-61537870448d', '038202ad-972e-4ec8-87d3-ea4b6e8921ef', 2, 'Purely electrostatic (Coulombic) forces of attraction between protons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('22e49e16-e616-411c-ba66-15053c0025bb', '038202ad-972e-4ec8-87d3-ea4b6e8921ef', 3, 'Weak forces, much weaker than electrostatic repulsion between protons');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('038202ad-972e-4ec8-87d3-ea4b6e8921ef', 'ad465add-5faa-4975-b3a3-0f5aeddf246e', 'The strong nuclear force is short-range (effective only within about 1-3 femtometres) but extremely powerful at that range, strong enough to overcome the electrostatic repulsion between closely packed protons and hold the nucleus together.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8ad49064-07c9-4e37-8ffd-dc5050b6000d', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 26, 'Doping a pure (intrinsic) semiconductor with a pentavalent impurity (e.g., phosphorus in silicon) creates a(n):', 'Physics', 'Semiconductor Electronics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bdd77f58-3ab5-4428-927a-d668b607d778', '8ad49064-07c9-4e37-8ffd-dc5050b6000d', 0, 'p-type semiconductor, with holes as majority carriers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d00040d5-2291-4d41-9143-ce89e128de65', '8ad49064-07c9-4e37-8ffd-dc5050b6000d', 1, 'n-type semiconductor, with electrons as majority charge carriers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93f96953-e1fb-4e31-9bc1-8d36a082bb98', '8ad49064-07c9-4e37-8ffd-dc5050b6000d', 2, 'Perfectly intrinsic semiconductor with no change');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad86bdf0-3ab9-4ce6-a0b6-2832023db6ed', '8ad49064-07c9-4e37-8ffd-dc5050b6000d', 3, 'Insulator with no charge carriers at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8ad49064-07c9-4e37-8ffd-dc5050b6000d', 'd00040d5-2291-4d41-9143-ce89e128de65', 'A pentavalent (5-valence-electron) dopant contributes an extra ''free'' electron beyond what''s needed for covalent bonding with the tetravalent semiconductor lattice, creating an n-type semiconductor where electrons are the majority charge carriers.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('39f485b5-14f4-4849-a845-af2a330141ef', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 27, 'The bandwidth of a signal refers to:', 'Physics', 'Communication Systems');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abbc1f6e-48f7-4c4e-82fb-3ca3f572f52d', '39f485b5-14f4-4849-a845-af2a330141ef', 0, 'The maximum amplitude the signal can achieve');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36e30a30-4981-4e2e-aaad-c72cedc3dbff', '39f485b5-14f4-4849-a845-af2a330141ef', 1, 'The range of frequencies over which the signal''s essential frequency components are contained');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5283040-1c74-4fd0-8dfa-a3f948557838', '39f485b5-14f4-4849-a845-af2a330141ef', 2, 'The total distance the signal can travel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b96011f6-3707-494d-9e4f-9ddb13a2ce91', '39f485b5-14f4-4849-a845-af2a330141ef', 3, 'The exact frequency of the carrier wave only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('39f485b5-14f4-4849-a845-af2a330141ef', '36e30a30-4981-4e2e-aaad-c72cedc3dbff', 'Bandwidth is the range (span) of frequencies that a signal occupies or that a communication channel can carry — a key parameter determining information-carrying capacity and helping decide the required carrier frequency spacing.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('258e5d01-fc85-4853-aab5-01d68d7a4290', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 28, 'Relative velocity of object A with respect to object B is calculated as:', 'Physics', 'Motion in a Plane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('892232b1-3442-4d06-a79d-f4b7052cbc88', '258e5d01-fc85-4853-aab5-01d68d7a4290', 0, 'The velocity of A plus the velocity of B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fe279711-ac94-4ec9-a2f4-e3846959c33f', '258e5d01-fc85-4853-aab5-01d68d7a4290', 1, 'The vector difference: velocity of A minus velocity of B');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6d3414d-1009-4308-b5c5-4b808c1a03a1', '258e5d01-fc85-4853-aab5-01d68d7a4290', 2, 'Always zero if both are moving');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0842cec7-1504-45fa-88f1-5a9f78b5c76e', '258e5d01-fc85-4853-aab5-01d68d7a4290', 3, 'The average of the two velocities');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('258e5d01-fc85-4853-aab5-01d68d7a4290', 'fe279711-ac94-4ec9-a2f4-e3846959c33f', 'Relative velocity of A with respect to B, v(A/B) = v(A) - v(B), a vector subtraction giving the velocity of A as observed from a reference frame moving with B.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('608ef74a-ffc1-440e-acde-ea1f3e84a78b', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 29, 'An isochoric (isovolumetric) process is one that occurs at constant:', 'Physics', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27ab9116-b81a-44aa-b3d7-71fb89bbe911', '608ef74a-ffc1-440e-acde-ea1f3e84a78b', 0, 'Pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c12374d8-3ff0-4abb-9305-37a32829ec58', '608ef74a-ffc1-440e-acde-ea1f3e84a78b', 1, 'Volume');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('561f3d29-9fc2-4236-a6b9-97a0a5a09bf0', '608ef74a-ffc1-440e-acde-ea1f3e84a78b', 2, 'Temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04b0be2e-1dcc-4a3b-8bd3-ffea81cfe7be', '608ef74a-ffc1-440e-acde-ea1f3e84a78b', 3, 'Entropy');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('608ef74a-ffc1-440e-acde-ea1f3e84a78b', 'c12374d8-3ff0-4abb-9305-37a32829ec58', 'An isochoric process occurs at constant volume; since no volume change occurs, no work (PdV) is done by or on the gas during this process — all heat added goes directly into changing internal energy.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2c9519ec-f623-4342-8328-b548ab59bd14', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 30, 'A metre bridge (slide-wire bridge) is a practical application of the principle of the:', 'Physics', 'Current Electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('738f1987-a090-4f2e-b1c0-bfbd6dc8fca2', '2c9519ec-f623-4342-8328-b548ab59bd14', 0, 'Potentiometer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bebda2ad-7d88-4c0a-b628-ce528628ede9', '2c9519ec-f623-4342-8328-b548ab59bd14', 1, 'Wheatstone bridge, used to determine an unknown resistance via a balance point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c4c4c69-394b-4cdf-9c7b-d6697c21c428', '2c9519ec-f623-4342-8328-b548ab59bd14', 2, 'Galvanometer alone, with no bridge circuit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0cb3dacf-cf24-406f-96b9-9cdf93301dad', '2c9519ec-f623-4342-8328-b548ab59bd14', 3, 'Voltmeter');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2c9519ec-f623-4342-8328-b548ab59bd14', 'bebda2ad-7d88-4c0a-b628-ce528628ede9', 'The metre bridge is a practical, laboratory-friendly implementation of the Wheatstone bridge principle, using a uniform slide wire to locate the balance (null) point and thereby calculate an unknown resistance.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4b05398d-ab92-4f92-9a39-58182b7c7e74', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 31, 'The magnetic field inside a long, ideal solenoid carrying current is:', 'Physics', 'Moving Charges and Magnetism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('52aee045-5dad-4e84-8ccb-1faec10714d1', '4b05398d-ab92-4f92-9a39-58182b7c7e74', 0, 'Zero everywhere inside');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77f4ee4b-6a71-4617-b362-e941df6ed388', '4b05398d-ab92-4f92-9a39-58182b7c7e74', 1, 'Nearly uniform in magnitude and direction along the axis, away from the ends');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7a9c4c6-ecde-4c43-a9d3-f7a09179c90e', '4b05398d-ab92-4f92-9a39-58182b7c7e74', 2, 'Maximum at the very centre of each turn only, dropping to zero between turns');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('433c29b4-bd72-4847-bdc2-615c99750c54', '4b05398d-ab92-4f92-9a39-58182b7c7e74', 3, 'Directed radially outward from the axis');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4b05398d-ab92-4f92-9a39-58182b7c7e74', '77f4ee4b-6a71-4617-b362-e941df6ed388', 'Deep inside a long, tightly wound solenoid, the magnetic field is nearly uniform in magnitude and directed along the solenoid''s axis, given by B = mu0*n*I, where n is turns per unit length — this uniform-field approximation breaks down only near the solenoid''s ends.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7e09a453-e36d-40f8-9a39-6f13c20f95d7', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 32, 'A rainbow is formed in the sky primarily due to which optical phenomena occurring within raindrops?', 'Physics', 'Ray Optics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da122174-2951-41bd-aae4-f9e23f6d4304', '7e09a453-e36d-40f8-9a39-6f13c20f95d7', 0, 'Diffraction and interference only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3307f4f0-8444-46b6-8adb-4ee7f5298ea7', '7e09a453-e36d-40f8-9a39-6f13c20f95d7', 1, 'Refraction, total internal reflection, and dispersion of sunlight within suspended water droplets');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('478c9b09-b42f-4366-86a0-52aab8031ccb', '7e09a453-e36d-40f8-9a39-6f13c20f95d7', 2, 'Simple reflection off the surface of the droplets, with no refraction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8f94279-68ed-48b2-84e5-8507c4251b53', '7e09a453-e36d-40f8-9a39-6f13c20f95d7', 3, 'Polarization alone');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7e09a453-e36d-40f8-9a39-6f13c20f95d7', '3307f4f0-8444-46b6-8adb-4ee7f5298ea7', 'A rainbow forms when sunlight entering raindrops undergoes refraction (bending) upon entry, total internal reflection off the droplet''s inner back surface, and further refraction upon exit — with dispersion (different wavelengths refracting by slightly different amounts) separating the light into its component colours.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('78f1ecf3-fcc9-45e8-9af6-15811f59e1ce', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 33, 'The speed of all electromagnetic waves in vacuum, regardless of their frequency or wavelength, is:', 'Physics', 'Electromagnetic Waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abd721fa-fbbf-4f14-b1b6-16b27bf293b4', '78f1ecf3-fcc9-45e8-9af6-15811f59e1ce', 0, 'Different for each type of EM wave, with gamma rays traveling fastest');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('add2beca-5023-4336-9476-b2bec65c2bc0', '78f1ecf3-fcc9-45e8-9af6-15811f59e1ce', 1, 'The same constant value, c (approximately 3 x 10^8 m/s)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c4fd0e4-a291-4524-890a-6b00c4a67f9d', '78f1ecf3-fcc9-45e8-9af6-15811f59e1ce', 2, 'Dependent on the source generating them');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12f6a66f-1501-4efa-82d4-99174dc94f1c', '78f1ecf3-fcc9-45e8-9af6-15811f59e1ce', 3, 'Zero, since EM waves cannot exist in a true vacuum');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('78f1ecf3-fcc9-45e8-9af6-15811f59e1ce', 'add2beca-5023-4336-9476-b2bec65c2bc0', 'All electromagnetic waves, regardless of frequency/wavelength (radio through gamma rays), travel at the same speed c in vacuum — a fundamental postulate of electromagnetism and special relativity.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4f265855-352f-4146-ac6b-b6e9f9c55a57', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 34, 'The gravitational field intensity at a point is defined as:', 'Physics', 'Gravitation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec946294-22f8-4992-a4bb-332c1e43b3ce', '4f265855-352f-4146-ac6b-b6e9f9c55a57', 0, 'The gravitational potential energy at that point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb5b2629-2e6d-4f42-94da-02134bd52aeb', '4f265855-352f-4146-ac6b-b6e9f9c55a57', 1, 'The gravitational force experienced per unit mass placed at that point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da2698a4-7ac3-4e62-99c3-a10abf5733ab', '4f265855-352f-4146-ac6b-b6e9f9c55a57', 2, 'The distance from the source mass to that point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8923e243-0f91-456f-a8f4-68c918876d6b', '4f265855-352f-4146-ac6b-b6e9f9c55a57', 3, 'The mass of the object placed at that point');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4f265855-352f-4146-ac6b-b6e9f9c55a57', 'fb5b2629-2e6d-4f42-94da-02134bd52aeb', 'Gravitational field intensity (g) at a point is defined as the gravitational force per unit mass that would act on a small test mass placed at that point, a vector quantity directed toward the source mass.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1cb37b00-139c-4fb4-bd9d-530ec1948917', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 35, 'For a simple pendulum, if the length is quadrupled while g remains constant, the time period will:', 'Physics', 'Oscillations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57dc9fe0-8559-4b79-87b6-d12027cfe02f', '1cb37b00-139c-4fb4-bd9d-530ec1948917', 0, 'Remain unchanged');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0be26fa8-64f5-4141-adbd-ea791ec0e3cb', '1cb37b00-139c-4fb4-bd9d-530ec1948917', 1, 'Double');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bb441be-b2b7-483c-96f8-975a3a0bb864', '1cb37b00-139c-4fb4-bd9d-530ec1948917', 2, 'Quadruple');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e2b9efd-e169-488f-9776-ebb705bc0a08', '1cb37b00-139c-4fb4-bd9d-530ec1948917', 3, 'Become one-fourth of the original');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1cb37b00-139c-4fb4-bd9d-530ec1948917', '0be26fa8-64f5-4141-adbd-ea791ec0e3cb', 'Since T is proportional to sqrt(L), quadrupling L increases T by a factor of sqrt(4) = 2, so the time period doubles.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8abe2c39-b8d9-4ad4-a7ab-02fac6e4063e', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 36, 'Superconductors are materials that, below a certain critical temperature, exhibit:', 'Physics', 'Current Electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a180d20b-589b-495c-b47d-0492570d0b20', '8abe2c39-b8d9-4ad4-a7ab-02fac6e4063e', 0, 'Extremely high electrical resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('539443ac-6e44-49c6-928b-5f57c1b7f26f', '8abe2c39-b8d9-4ad4-a7ab-02fac6e4063e', 1, 'Exactly zero electrical resistance to the flow of direct current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18628ffe-8815-4493-aa9f-3932bb9b7527', '8abe2c39-b8d9-4ad4-a7ab-02fac6e4063e', 2, 'Resistance that increases linearly with temperature, same as normal conductors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4f563c2-9292-4a76-870e-526b95e88103', '8abe2c39-b8d9-4ad4-a7ab-02fac6e4063e', 3, 'No ability to conduct electricity at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8abe2c39-b8d9-4ad4-a7ab-02fac6e4063e', '539443ac-6e44-49c6-928b-5f57c1b7f26f', 'Superconductors, below their characteristic critical temperature, exhibit exactly zero electrical resistance, allowing persistent current flow without any energy dissipation — a phenomenon with no classical analogue among normal conductors.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3a7db734-8512-4391-82ef-258e78785d50', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 37, 'Avogadro''s law states that equal volumes of all ideal gases, at the same temperature and pressure, contain:', 'Physics', 'Kinetic Theory');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8af3f97-d57c-4def-a212-39de1b103b9c', '3a7db734-8512-4391-82ef-258e78785d50', 0, 'Equal masses');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a05a56ff-6aae-4b44-b84c-7dfad2b19185', '3a7db734-8512-4391-82ef-258e78785d50', 1, 'Equal numbers of molecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f9504f4-9d14-4a47-916a-fd8107a0d662', '3a7db734-8512-4391-82ef-258e78785d50', 2, 'Equal numbers of atoms only, not molecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c65c76a-55fe-4a5e-8e3a-70f837ffc564', '3a7db734-8512-4391-82ef-258e78785d50', 3, 'Different numbers of molecules depending on the gas''s identity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3a7db734-8512-4391-82ef-258e78785d50', 'a05a56ff-6aae-4b44-b84c-7dfad2b19185', 'Avogadro''s law: equal volumes of different ideal gases under the same conditions of temperature and pressure contain equal numbers of molecules, regardless of the gas''s chemical identity or molar mass.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('35a1992b-984e-42a2-b284-d91f40672aa0', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 38, 'In a photodiode, operated in reverse bias, an increase in incident light intensity causes:', 'Physics', 'Semiconductor Electronics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40634e82-483f-416e-be1c-a8821d11edd2', '35a1992b-984e-42a2-b284-d91f40672aa0', 0, 'A decrease in reverse current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46254679-9d7c-4375-9c31-c763cb41ba0b', '35a1992b-984e-42a2-b284-d91f40672aa0', 1, 'An increase in reverse current, due to more electron-hole pairs being generated by absorbed photons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('deb854db-55fe-4593-bcc9-4054884e9bdf', '35a1992b-984e-42a2-b284-d91f40672aa0', 2, 'No change in current at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1296d848-dbe2-4310-b08b-c8c8001dbfc9', '35a1992b-984e-42a2-b284-d91f40672aa0', 3, 'The diode to stop conducting entirely');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('35a1992b-984e-42a2-b284-d91f40672aa0', '46254679-9d7c-4375-9c31-c763cb41ba0b', 'A photodiode''s reverse (leakage) current increases with incident light intensity, since more photons generate more electron-hole pairs in the depletion region, which are then swept across by the reverse bias field — this photocurrent forms the basis of light-sensing applications.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0372d9ba-ad4d-41a1-9397-f0b12f37f373', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 39, 'A rocket accelerates forward by expelling exhaust gases backward at high speed. This is a direct application of:', 'Physics', 'Laws of Motion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cbfc199d-46cd-453f-9e19-1c27a9b917bf', '0372d9ba-ad4d-41a1-9397-f0b12f37f373', 0, 'Newton''s first law of motion only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53b050d7-97a9-482e-b0d5-a052c4b111b8', '0372d9ba-ad4d-41a1-9397-f0b12f37f373', 1, 'Newton''s third law of motion (and the principle of conservation of momentum)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c14361d-10a6-438d-a67c-9f318c081c58', '0372d9ba-ad4d-41a1-9397-f0b12f37f373', 2, 'The law of gravitation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8629243e-9dda-4921-a862-30bbc17092a7', '0372d9ba-ad4d-41a1-9397-f0b12f37f373', 3, 'Bernoulli''s principle');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0372d9ba-ad4d-41a1-9397-f0b12f37f373', '53b050d7-97a9-482e-b0d5-a052c4b111b8', 'Rocket propulsion works via Newton''s third law: the rocket exerts a backward force on the expelled exhaust gases, and the gases exert an equal and opposite forward force (thrust) on the rocket — consistent with overall momentum conservation of the rocket-exhaust system.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e0c42bfa-17bd-4f52-a98d-cbe6373d8eff', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 40, 'The area under a force-displacement (F-x) graph represents:', 'Physics', 'Work, Energy and Power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15854196-37bb-4cab-98ba-0f3060e3625f', 'e0c42bfa-17bd-4f52-a98d-cbe6373d8eff', 0, 'The impulse imparted to the body');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ce81301-0821-4ccc-96de-9948f4d35aa0', 'e0c42bfa-17bd-4f52-a98d-cbe6373d8eff', 1, 'The work done by the force over that displacement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b913b4ac-b183-4132-a935-ad06c36fdbfd', 'e0c42bfa-17bd-4f52-a98d-cbe6373d8eff', 2, 'The instantaneous power delivered');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e84416e-455a-42c3-860f-55a1111629dc', 'e0c42bfa-17bd-4f52-a98d-cbe6373d8eff', 3, 'The average acceleration of the body');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e0c42bfa-17bd-4f52-a98d-cbe6373d8eff', '9ce81301-0821-4ccc-96de-9948f4d35aa0', 'The area under a force vs. displacement graph gives the work done, W = integral of F dx, since work is the product of force and displacement (for a constant force) or the integral for a variable force.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1749c07f-b444-44ad-8eef-f9cf1f7eaf0d', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 41, 'An echo is heard due to:', 'Physics', 'Waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a29cdd29-763b-40df-b4c3-1e1b4512e76b', '1749c07f-b444-44ad-8eef-f9cf1f7eaf0d', 0, 'Refraction of sound waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8ce894a-3e71-4607-a7e6-d1f72d348a6c', '1749c07f-b444-44ad-8eef-f9cf1f7eaf0d', 1, 'Reflection of sound waves off a distant, hard surface, reaching the listener after the direct sound with a perceptible time delay');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d24725a3-fff9-4888-a775-675518114fdf', '1749c07f-b444-44ad-8eef-f9cf1f7eaf0d', 2, 'Diffraction of sound around obstacles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d0a5f22-6c67-4033-b890-9616a5b4a608', '1749c07f-b444-44ad-8eef-f9cf1f7eaf0d', 3, 'Resonance between two tuning forks');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1749c07f-b444-44ad-8eef-f9cf1f7eaf0d', 'c8ce894a-3e71-4607-a7e6-d1f72d348a6c', 'An echo is the perceived repetition of a sound caused by reflection off a distant surface (e.g., a cliff or wall); the human ear can distinguish it as a separate sound if the reflected wave arrives at least about 0.1 seconds after the direct sound.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9df136ce-4c47-4383-8c6d-2953fe238170', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 42, 'The temperature coefficient of resistance for most pure metals is:', 'Physics', 'Current Electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34db9c1b-4f16-4fd2-83f5-3829cf3c10c4', '9df136ce-4c47-4383-8c6d-2953fe238170', 0, 'Negative, so resistance decreases as temperature rises');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9885426a-565d-4356-b2a7-4f56064c41b6', '9df136ce-4c47-4383-8c6d-2953fe238170', 1, 'Positive, so resistance increases as temperature rises, due to increased lattice vibrations impeding electron flow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('815f9600-cd87-4094-b2e5-6538fd3c4365', '9df136ce-4c47-4383-8c6d-2953fe238170', 2, 'Exactly zero for all metals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8492177-5e96-44b5-a7e8-79cef825bf2e', '9df136ce-4c47-4383-8c6d-2953fe238170', 3, 'Undefined at any temperature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9df136ce-4c47-4383-8c6d-2953fe238170', '9885426a-565d-4356-b2a7-4f56064c41b6', 'For most pure metallic conductors, resistance increases with temperature (positive temperature coefficient) as increased thermal vibration of the metal lattice ions impedes the drift of conduction electrons — the opposite trend to that of semiconductors, whose resistance typically decreases with rising temperature.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a662e384-07f4-4e52-b861-a129601d25c6', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 43, 'Myopia (near-sightedness), a common vision defect, occurs when the eye''s image of a distant object forms:', 'Physics', 'Ray Optics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0cb0f7c7-fa2c-4394-8d2e-e41f6e45ca56', 'a662e384-07f4-4e52-b861-a129601d25c6', 0, 'Exactly on the retina, as in normal vision');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3be5e148-f4fb-426d-ab89-7e1cf2ef07f8', 'a662e384-07f4-4e52-b861-a129601d25c6', 1, 'In front of the retina, correctable using a diverging (concave) lens');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1315d89f-70e4-4908-9382-c2538a8d759f', 'a662e384-07f4-4e52-b861-a129601d25c6', 2, 'Behind the retina, correctable using a converging (convex) lens');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95f7503e-8a02-4d77-9785-a0ee70f07858', 'a662e384-07f4-4e52-b861-a129601d25c6', 3, 'Nowhere at all, with no image formed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a662e384-07f4-4e52-b861-a129601d25c6', '3be5e148-f4fb-426d-ab89-7e1cf2ef07f8', 'Myopia occurs when the eyeball is elongated or the lens is too strongly converging, focusing distant object images in front of the retina rather than on it; a concave (diverging) lens is used to correct this by diverging the incoming rays slightly before they enter the eye.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8e27314a-b9a0-4947-b3de-596dc67bcb56', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 44, 'The electric potential due to an isolated point charge Q at a distance r is given by:', 'Physics', 'Electrostatic Potential and Capacitance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b1e5b48-c7c2-4a79-86fc-1af4ea72c3f4', '8e27314a-b9a0-4947-b3de-596dc67bcb56', 0, 'V = kQ/r');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a064aa4-5bf6-40eb-b45e-b77e304ba4cb', '8e27314a-b9a0-4947-b3de-596dc67bcb56', 1, 'V = kQ/r^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5409b93a-f923-4c36-8632-10ffd336ae46', '8e27314a-b9a0-4947-b3de-596dc67bcb56', 2, 'V = kQr');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6326e4cc-962c-4b6f-af18-5d5694b3d79c', '8e27314a-b9a0-4947-b3de-596dc67bcb56', 3, 'V = kQ^2/r');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8e27314a-b9a0-4947-b3de-596dc67bcb56', '6b1e5b48-c7c2-4a79-86fc-1af4ea72c3f4', 'Electric potential due to a point charge: V = kQ/r = Q/(4*pi*epsilon0*r), decreasing inversely with distance (unlike the electric field, which decreases as 1/r^2).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('46bdbfbd-637b-4212-9da0-af870773bd05', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 45, 'Viscosity of a liquid is a measure of its:', 'Physics', 'Mechanical Properties of Fluids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('165ba885-5c20-493d-bc41-c14e10c1ffeb', '46bdbfbd-637b-4212-9da0-af870773bd05', 0, 'Internal resistance to relative flow between adjacent layers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39a3bab5-4d22-4907-99f4-3383325c8ae0', '46bdbfbd-637b-4212-9da0-af870773bd05', 1, 'Tendency to minimize surface area');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b2f12dc-f677-47a8-81fb-90a29c75c4cb', '46bdbfbd-637b-4212-9da0-af870773bd05', 2, 'Buoyant force on submerged objects');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b50b87d-b319-475b-925c-26ac7f8c3bf9', '46bdbfbd-637b-4212-9da0-af870773bd05', 3, 'Ability to dissolve solutes');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('46bdbfbd-637b-4212-9da0-af870773bd05', '165ba885-5c20-493d-bc41-c14e10c1ffeb', 'Viscosity quantifies a fluid''s internal friction — the resistance offered by adjacent layers of fluid to relative motion between them, which is why more viscous fluids (like honey) flow more slowly than less viscous ones (like water).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Chemistry (45 questions) — Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ef24dba1-3278-4c4a-9647-6ca088c705ef', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 46, 'Gay-Lussac''s law of gaseous volumes states that when gases react, the volumes of reactants and gaseous products, at the same temperature and pressure, bear a ratio of:', 'Chemistry', 'Some Basic Concepts of Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be970758-62a0-42a2-a186-63e5837fb352', 'ef24dba1-3278-4c4a-9647-6ca088c705ef', 0, 'Random, non-simple numbers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b3d6281-3c75-42be-9b51-9033850cee5c', 'ef24dba1-3278-4c4a-9647-6ca088c705ef', 1, 'Simple whole numbers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25a31eac-8fe2-4ccb-af7d-3f005b28ed0f', 'ef24dba1-3278-4c4a-9647-6ca088c705ef', 2, 'Always exactly 1:1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8005fb1e-9dcb-47a6-a9f1-23e8deeeed4b', 'ef24dba1-3278-4c4a-9647-6ca088c705ef', 3, 'No fixed relationship at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ef24dba1-3278-4c4a-9647-6ca088c705ef', '3b3d6281-3c75-42be-9b51-9033850cee5c', 'Gay-Lussac''s law states that gas volumes involved in a chemical reaction (at constant temperature/pressure) are in the ratio of small whole numbers, a result later explained by Avogadro''s hypothesis.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('639b1948-b6eb-459e-a7d1-a018db1bc951', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 47, 'Cathode ray experiments, conducted by J.J. Thomson, led to the discovery of the:', 'Chemistry', 'Structure of Atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f38e4c31-07b3-480c-88ca-4281bc0f5bab', '639b1948-b6eb-459e-a7d1-a018db1bc951', 0, 'Proton');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7214f90d-c472-4f24-a984-e956f7ded71a', '639b1948-b6eb-459e-a7d1-a018db1bc951', 1, 'Electron, along with a determination of its charge-to-mass ratio');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01d5fd3a-7fb3-438d-aed2-20d301bb12c4', '639b1948-b6eb-459e-a7d1-a018db1bc951', 2, 'Neutron');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('853076e6-fc3d-462b-980f-a3d4de076faf', '639b1948-b6eb-459e-a7d1-a018db1bc951', 3, 'Nucleus');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('639b1948-b6eb-459e-a7d1-a018db1bc951', '7214f90d-c472-4f24-a984-e956f7ded71a', 'Thomson''s cathode ray tube experiments demonstrated the existence of negatively charged particles (electrons) present in all atoms, and allowed determination of their charge-to-mass ratio (e/m).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('fd1d2e23-665f-4276-adde-4d067b6c5ab0', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 48, 'Noble gases (Group 18) have very high ionization enthalpies and are generally chemically inert because they possess:', 'Chemistry', 'Classification of Elements and Periodicity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfe0c502-5b78-4370-8218-adcc813d7a27', 'fd1d2e23-665f-4276-adde-4d067b6c5ab0', 0, 'An incomplete outer electron shell, making them highly reactive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67a40326-7575-41bf-869d-08891066ce6e', 'fd1d2e23-665f-4276-adde-4d067b6c5ab0', 1, 'A completely filled outermost electron shell (stable octet, except helium''s duet), giving them minimal tendency to gain, lose, or share electrons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ac48b48-0016-44f1-8586-2bef69c79f68', 'fd1d2e23-665f-4276-adde-4d067b6c5ab0', 2, 'No electrons in their outer shell at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7d06b7a-c2df-4fe3-bb46-c6fb45511525', 'fd1d2e23-665f-4276-adde-4d067b6c5ab0', 3, 'A very small atomic radius, smaller than any other group');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fd1d2e23-665f-4276-adde-4d067b6c5ab0', '67a40326-7575-41bf-869d-08891066ce6e', 'Noble gases have a completely filled valence electron shell (a stable octet, or duet for helium), giving them very high ionization energies and minimal chemical reactivity, since there is little energetic incentive to gain, lose, or share electrons.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1714ae54-2480-4db5-bb86-c3f0b9f5972b', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 49, 'The bond angle in a water molecule (H2O), which has two lone pairs on the central oxygen, is approximately:', 'Chemistry', 'Chemical Bonding and Molecular Structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a5e1c5a-96f6-4f36-bad5-0ddf40006cb8', '1714ae54-2480-4db5-bb86-c3f0b9f5972b', 0, '180 degrees (linear)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbd6807d-a3e9-40fc-bd98-77b18eb13aee', '1714ae54-2480-4db5-bb86-c3f0b9f5972b', 1, '104.5 degrees, slightly less than the ideal tetrahedral angle due to lone pair-lone pair repulsion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ecb36b6-3abd-4b93-9ce7-311868428950', '1714ae54-2480-4db5-bb86-c3f0b9f5972b', 2, '120 degrees exactly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0316b1b-a22d-4fcc-9166-278b86969002', '1714ae54-2480-4db5-bb86-c3f0b9f5972b', 3, '90 degrees exactly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1714ae54-2480-4db5-bb86-c3f0b9f5972b', 'bbd6807d-a3e9-40fc-bd98-77b18eb13aee', 'Water''s H-O-H bond angle (~104.5 degrees) is compressed slightly from the ideal tetrahedral angle of 109.5 degrees, since the two lone pairs on oxygen exert greater repulsion than bonding pairs, pushing the bonding pairs (and hence the H atoms) closer together.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4ba8bd96-a745-4212-94cd-6b1db9302156', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 50, 'The van der Waals equation modifies the ideal gas equation to account for:', 'Chemistry', 'States of Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a6146a2-5514-4f5d-b161-aebe6b92da46', '4ba8bd96-a745-4212-94cd-6b1db9302156', 0, 'The exact atomic number of gas molecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37986170-9c0c-4b44-af96-535df8697b02', '4ba8bd96-a745-4212-94cd-6b1db9302156', 1, 'The finite volume occupied by gas molecules and the intermolecular forces of attraction between them');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10002ab5-5a05-4b78-ada5-6991f5dcdc26', '4ba8bd96-a745-4212-94cd-6b1db9302156', 2, 'Only the temperature of the gas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5871f3d1-d836-4e31-8901-c5cb97d7a9f0', '4ba8bd96-a745-4212-94cd-6b1db9302156', 3, 'The color of the gas');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4ba8bd96-a745-4212-94cd-6b1db9302156', '37986170-9c0c-4b44-af96-535df8697b02', 'Van der Waals introduced correction terms to the ideal gas law: one accounting for the actual (non-negligible) volume of gas molecules, and another accounting for intermolecular attractive forces — both ignored in the simple ideal gas model.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('cf302feb-66ef-4191-b7a6-294b2339ed80', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 51, 'The enthalpy of neutralization for the reaction between a strong acid and a strong base is generally found to be nearly constant (approximately -57.1 kJ/mol) because:', 'Chemistry', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76120f53-30d3-423e-8dac-1d42be924a2e', 'cf302feb-66ef-4191-b7a6-294b2339ed80', 0, 'It varies wildly depending on the specific strong acid/base pair used');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7cd6b0e-2517-4a73-a735-a084bd9f099c', 'cf302feb-66ef-4191-b7a6-294b2339ed80', 1, 'The reaction, in dilute aqueous solution, essentially always involves the same net ionic process: H+(aq) + OH-(aq) -> H2O(l)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32027949-19cc-40d5-b70b-f73adc3db8fa', 'cf302feb-66ef-4191-b7a6-294b2339ed80', 2, 'No heat is actually released in any neutralization reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('747ab946-24b7-4d32-92f7-5d56d1985cc3', 'cf302feb-66ef-4191-b7a6-294b2339ed80', 3, 'Only weak acids show this constant value');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cf302feb-66ef-4191-b7a6-294b2339ed80', 'c7cd6b0e-2517-4a73-a735-a084bd9f099c', 'Since strong acids and strong bases are essentially fully ionized in dilute solution, the net reaction is always the same: combination of H+ and OH- ions to form water — giving a nearly constant enthalpy of neutralization regardless of which specific strong acid/base pair is used.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1acd2f14-526c-4cef-9424-1f6c3e7f61db', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 52, 'The degree of dissociation of a weak electrolyte increases upon:', 'Chemistry', 'Equilibrium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d7636dd-66ae-4aab-b0ee-35b19164125f', '1acd2f14-526c-4cef-9424-1f6c3e7f61db', 0, 'Increasing its concentration in solution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cd44182-4217-4d51-8549-7cae202f475e', '1acd2f14-526c-4cef-9424-1f6c3e7f61db', 1, 'Diluting the solution (per Ostwald''s dilution law)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c7c6b24-d90a-4998-9ff7-96a7c01ae6b9', '1acd2f14-526c-4cef-9424-1f6c3e7f61db', 2, 'Adding a common ion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('874fd4b2-f995-44c9-a082-7c42859262dd', '1acd2f14-526c-4cef-9424-1f6c3e7f61db', 3, 'Cooling the solution to a very low temperature in all cases');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1acd2f14-526c-4cef-9424-1f6c3e7f61db', '3cd44182-4217-4d51-8549-7cae202f475e', 'Ostwald''s dilution law shows that as a weak electrolyte solution is diluted, its degree of dissociation increases, since there is proportionally more solvent available to stabilize the separated ions, shifting the dissociation equilibrium forward.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c6e64033-69ab-48ad-b9a3-a74d9587df46', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 53, 'In the reaction 2KMnO4 + 5Na2SO3 + 3H2SO4 -> K2SO4 + 2MnSO4 + 5Na2SO4 + 3H2O, the substance being reduced is:', 'Chemistry', 'Redox Reactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0aa14f12-c5e4-4219-ba5f-7953b2593c21', 'c6e64033-69ab-48ad-b9a3-a74d9587df46', 0, 'Na2SO3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6141402-bb8a-48a6-8b9c-0de42ed2de74', 'c6e64033-69ab-48ad-b9a3-a74d9587df46', 1, 'KMnO4, where manganese goes from +7 to +2 oxidation state');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19c607db-f697-4548-b18c-93129f86206c', 'c6e64033-69ab-48ad-b9a3-a74d9587df46', 2, 'H2SO4, which acts as a spectator');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e095e5fe-2bd6-4506-8b75-df633a8fe5e8', 'c6e64033-69ab-48ad-b9a3-a74d9587df46', 3, 'Na2SO4, a product only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c6e64033-69ab-48ad-b9a3-a74d9587df46', 'f6141402-bb8a-48a6-8b9c-0de42ed2de74', 'In this reaction, manganese in KMnO4 is reduced from +7 to +2 oxidation state (gaining electrons), while sulfur in Na2SO3 is oxidized from +4 to +6 in Na2SO4, with KMnO4 acting as the oxidizing agent.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('745ee09a-0cb3-4085-aaf3-b6e6d8ceb0ca', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 54, 'Hydrogen can form three types of binary hydrides depending on the element it combines with; ionic (saline) hydrides are typically formed with:', 'Chemistry', 'Hydrogen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e145bcd-d2d6-4377-b912-4e082902de36', '745ee09a-0cb3-4085-aaf3-b6e6d8ceb0ca', 0, 'Highly electronegative non-metals like fluorine or oxygen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac7aafa8-14df-4066-8bc7-6c593a64625a', '745ee09a-0cb3-4085-aaf3-b6e6d8ceb0ca', 1, 'Highly electropositive s-block metals like sodium or calcium, where hydrogen exists as the hydride ion H-');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2bab6a8-70f6-4001-a58a-2cb2c0e6b235', '745ee09a-0cb3-4085-aaf3-b6e6d8ceb0ca', 2, 'Transition metals exclusively, forming interstitial hydrides');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f02077f-f304-46eb-8765-92881e2e0e73', '745ee09a-0cb3-4085-aaf3-b6e6d8ceb0ca', 3, 'Noble gases');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('745ee09a-0cb3-4085-aaf3-b6e6d8ceb0ca', 'ac7aafa8-14df-4066-8bc7-6c593a64625a', 'Ionic (saline) hydrides form when hydrogen combines with highly electropositive alkali/alkaline earth metals; the metal transfers an electron to hydrogen, forming the hydride ion H- and an ionic lattice, e.g., NaH, CaH2.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a9882a71-c47c-402e-9200-3f2aa287a62b', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 55, 'The solubility of alkaline earth metal hydroxides in water generally:', 'Chemistry', 's-Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1a71117-9a57-4867-91e9-f31f38bb7c99', 'a9882a71-c47c-402e-9200-3f2aa287a62b', 0, 'Decreases down the group, from Be(OH)2 to Ba(OH)2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af4e0dab-f786-4c5a-9be4-7b6e34e8f4d3', 'a9882a71-c47c-402e-9200-3f2aa287a62b', 1, 'Increases down the group, from Be(OH)2 to Ba(OH)2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('52769ec2-6d3c-4c54-be83-7befb82158b9', 'a9882a71-c47c-402e-9200-3f2aa287a62b', 2, 'Remains exactly constant down the group');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a67d5c0e-cacb-4fbb-8458-a69b5a755c81', 'a9882a71-c47c-402e-9200-3f2aa287a62b', 3, 'Is unrelated to the group trend');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a9882a71-c47c-402e-9200-3f2aa287a62b', 'af4e0dab-f786-4c5a-9be4-7b6e34e8f4d3', 'Solubility of Group 2 hydroxides increases down the group (Be(OH)2 nearly insoluble, Ba(OH)2 fairly soluble) — the opposite trend to Group 2 sulfates, which decrease in solubility down the group.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('433786b7-6a74-4ee7-9a1e-885ca41c87c2', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 56, 'Resonance structures of a molecule (like benzene) differ from each other only in the:', 'Chemistry', 'Organic Chemistry — Basic Principles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('150e7679-019e-442c-9d5a-51e9e1f7069d', '433786b7-6a74-4ee7-9a1e-885ca41c87c2', 0, 'Arrangement of atomic nuclei, which must move between structures');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0007eff3-6a4e-41ae-bdc1-1de153542375', '433786b7-6a74-4ee7-9a1e-885ca41c87c2', 1, 'Distribution/arrangement of electrons (particularly pi electrons), with the nuclear framework staying fixed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbeae1b6-aa0f-4b2f-8325-3e9c5a546195', '433786b7-6a74-4ee7-9a1e-885ca41c87c2', 2, 'Total number of atoms present');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad1f47e7-91bd-4fbe-80dc-4c4360cdc897', '433786b7-6a74-4ee7-9a1e-885ca41c87c2', 3, 'Overall molecular formula');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('433786b7-6a74-4ee7-9a1e-885ca41c87c2', '0007eff3-6a4e-41ae-bdc1-1de153542375', 'Resonance structures represent different ways of distributing electrons (especially delocalized pi electrons) within a FIXED nuclear/atomic framework — the actual molecule is a hybrid, not any single resonance structure, and the nuclei do not physically move between the depicted structures.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('db4e8078-ecb9-44ab-ae17-68eba5988003', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 57, 'Catalytic hydrogenation of an alkene, converting it into the corresponding alkane, typically uses a catalyst such as:', 'Chemistry', 'Hydrocarbons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0822c271-dbb7-4d95-8990-af7eb616334c', 'db4e8078-ecb9-44ab-ae17-68eba5988003', 0, 'Concentrated sulfuric acid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7e2cb57-65fb-4a05-afca-945cc6ec9dab', 'db4e8078-ecb9-44ab-ae17-68eba5988003', 1, 'Finely divided nickel, palladium, or platinum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7fcf502-4081-4a0a-8b27-6b066e9a85bd', 'db4e8078-ecb9-44ab-ae17-68eba5988003', 2, 'Sodium metal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e18be8e-39f6-43f4-a410-fe9971f33276', 'db4e8078-ecb9-44ab-ae17-68eba5988003', 3, 'Potassium permanganate');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('db4e8078-ecb9-44ab-ae17-68eba5988003', 'b7e2cb57-65fb-4a05-afca-945cc6ec9dab', 'Catalytic hydrogenation adds H2 across a carbon-carbon double bond in the presence of a finely divided transition metal catalyst (Ni, Pd, or Pt), converting an unsaturated alkene into a saturated alkane.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8b0142fe-94ff-400a-bfb9-42a7a6fd4771', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 58, 'Green chemistry, as an emerging approach in chemical practice, primarily aims to:', 'Chemistry', 'Environmental Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97239b86-c59c-4cb1-85dd-6504fb65d0e8', '8b0142fe-94ff-400a-bfb9-42a7a6fd4771', 0, 'Maximize the use of toxic solvents for greater reaction efficiency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b3dac3a-8b5d-4f39-8b6f-7fda307be4c4', '8b0142fe-94ff-400a-bfb9-42a7a6fd4771', 1, 'Design chemical products and processes that minimize the use and generation of hazardous substances');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('537f0871-2a88-4a66-97cb-591ec55dc436', '8b0142fe-94ff-400a-bfb9-42a7a6fd4771', 2, 'Increase industrial waste production for economic growth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('617b7689-1191-4985-bd0c-2a34b9fe01c4', '8b0142fe-94ff-400a-bfb9-42a7a6fd4771', 3, 'Focus exclusively on the color of chemical products');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8b0142fe-94ff-400a-bfb9-42a7a6fd4771', '7b3dac3a-8b5d-4f39-8b6f-7fda307be4c4', 'Green chemistry is the design of chemical products and processes that reduce or eliminate the use and generation of hazardous substances, promoting environmentally benign synthesis routes, safer solvents, and energy-efficient processes.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4f32fbc7-8d45-4baf-a55d-4bab30ef7bf5', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 59, 'The packing efficiency of atoms in a face-centred cubic (fcc) unit cell (cubic close packing) is approximately:', 'Chemistry', 'Solid State');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d28f3054-f020-45f4-b7d4-adee5cf16ac1', '4f32fbc7-8d45-4baf-a55d-4bab30ef7bf5', 0, '52%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7be68ca7-675b-4b6d-a45c-02504ba93c63', '4f32fbc7-8d45-4baf-a55d-4bab30ef7bf5', 1, '68%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b345e1d1-8fd4-48fd-84cd-6a0449acae73', '4f32fbc7-8d45-4baf-a55d-4bab30ef7bf5', 2, '74%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23821373-e65a-495a-b9ac-d5ff2a5da151', '4f32fbc7-8d45-4baf-a55d-4bab30ef7bf5', 3, '100%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4f32fbc7-8d45-4baf-a55d-4bab30ef7bf5', 'b345e1d1-8fd4-48fd-84cd-6a0449acae73', 'The fcc (cubic close-packed) arrangement achieves a packing efficiency of about 74%, the highest possible for identical spheres, matching hexagonal close packing (hcp) in packing density.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('13d47d63-66bf-4c12-9bd6-b111aa161ca4', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 60, 'An ideal solution, as defined in solution thermodynamics, is one that obeys Raoult''s law over the:', 'Chemistry', 'Solutions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbb43721-61d7-4978-9c41-ad19d186d78f', '13d47d63-66bf-4c12-9bd6-b111aa161ca4', 0, 'Entire range of concentration, at all temperatures');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc9d33a2-aa0a-4c16-a40b-1bd8b985eead', '13d47d63-66bf-4c12-9bd6-b111aa161ca4', 1, 'Only at extremely high dilution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1132266b-da36-40af-892b-baf094bdfd72', '13d47d63-66bf-4c12-9bd6-b111aa161ca4', 2, 'Never obeys Raoult''s law under any conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4a05779-3d96-4698-aa82-8a638fbc6fb2', '13d47d63-66bf-4c12-9bd6-b111aa161ca4', 3, 'Only when one component is a solid');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('13d47d63-66bf-4c12-9bd6-b111aa161ca4', 'fbb43721-61d7-4978-9c41-ad19d186d78f', 'An ideal solution is defined as one that obeys Raoult''s law across the entire concentration range for all components, implying similar intermolecular forces between all pairs of molecules (solute-solute, solvent-solvent, solute-solvent).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ae2ba68a-40fe-4ec5-91a3-355b89503b47', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 61, 'A fuel cell, such as the hydrogen-oxygen fuel cell used in spacecraft, generates electricity through the:', 'Chemistry', 'Electrochemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b176202-8af6-4a15-91ee-e9b783b66b22', 'ae2ba68a-40fe-4ec5-91a3-355b89503b47', 0, 'Combustion of fuel with an open flame');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f60ae0df-6931-4ce2-b910-e716db6a7066', 'ae2ba68a-40fe-4ec5-91a3-355b89503b47', 1, 'Continuous electrochemical oxidation of a fuel (like hydrogen) at the anode and reduction of oxygen at the cathode, without combustion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('847fd134-5f52-4e8d-93f4-8ac5de8b1c9b', 'ae2ba68a-40fe-4ec5-91a3-355b89503b47', 2, 'Radioactive decay of a fuel source');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('362b2534-898c-4d41-8435-ba1b7184608d', 'ae2ba68a-40fe-4ec5-91a3-355b89503b47', 3, 'Purely mechanical generation with no chemical reaction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ae2ba68a-40fe-4ec5-91a3-355b89503b47', 'f60ae0df-6931-4ce2-b910-e716db6a7066', 'Fuel cells generate electrical energy directly from the controlled electrochemical reaction of a continuously supplied fuel (e.g., H2, oxidized at the anode) with an oxidant (e.g., O2, reduced at the cathode), without the inefficiencies of combustion-based heat engines.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5993891e-af81-470a-a451-3e455119d35a', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 62, 'The half-life of a first-order reaction is:', 'Chemistry', 'Chemical Kinetics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51f542b9-bcd5-4251-9047-dde0f8821dd5', '5993891e-af81-470a-a451-3e455119d35a', 0, 'Dependent on the initial concentration of the reactant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c2752b9-da5f-42e6-a786-7f32ff4065ed', '5993891e-af81-470a-a451-3e455119d35a', 1, 'Independent of the initial concentration of the reactant, and a constant for a given rate constant k');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9e343ad-aa7e-441f-93b6-5a0e534643a7', '5993891e-af81-470a-a451-3e455119d35a', 2, 'Directly proportional to the initial concentration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19a2e1d3-6988-4830-baa5-c7ae52a1d971', '5993891e-af81-470a-a451-3e455119d35a', 3, 'Undefined for first-order reactions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5993891e-af81-470a-a451-3e455119d35a', '5c2752b9-da5f-42e6-a786-7f32ff4065ed', 'For a first-order reaction, t(1/2) = 0.693/k, a constant value independent of the starting reactant concentration — a defining, testable characteristic distinguishing first-order kinetics from zero- or second-order reactions.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('927a026a-4bf5-4e3f-bd02-a404e8f67014', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 63, 'Emulsions can be stabilized against separation by adding a small quantity of a substance called an:', 'Chemistry', 'Surface Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a02c9ac-b21f-409b-b4b4-4b9ca2496282', '927a026a-4bf5-4e3f-bd02-a404e8f67014', 0, 'Oxidizing agent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('979e8ec0-201f-4e85-a0ed-a8b28d6be8ff', '927a026a-4bf5-4e3f-bd02-a404e8f67014', 1, 'Emulsifying agent (emulsifier), such as soap, which stabilizes the interface between the two immiscible liquid phases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1972c88-ad7d-4cdd-87f7-0240d0a7a3a0', '927a026a-4bf5-4e3f-bd02-a404e8f67014', 2, 'Reducing agent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('729fa923-acea-4916-87dd-6422a25a5154', '927a026a-4bf5-4e3f-bd02-a404e8f67014', 3, 'Inert gas');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('927a026a-4bf5-4e3f-bd02-a404e8f67014', '979e8ec0-201f-4e85-a0ed-a8b28d6be8ff', 'An emulsifying agent (e.g., soap, or proteins in milk) stabilizes an emulsion by reducing interfacial tension and forming a protective layer around dispersed droplets, preventing them from coalescing and the emulsion from separating.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('dbddb86e-49fc-48ff-8b89-733d0c3a7c6f', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 64, 'The Hall-Heroult process is an industrial method used for the extraction of:', 'Chemistry', 'General Principles of Isolation of Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48fef08b-d39e-4b6b-a420-51619fd50b81', 'dbddb86e-49fc-48ff-8b89-733d0c3a7c6f', 0, 'Iron from its oxide ore');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a66fa85-3f90-41fe-9eb1-22f9a6b3eaec', 'dbddb86e-49fc-48ff-8b89-733d0c3a7c6f', 1, 'Aluminium, via electrolysis of alumina dissolved in molten cryolite');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45be39e1-3969-46b2-b13f-e51b980cc1f2', 'dbddb86e-49fc-48ff-8b89-733d0c3a7c6f', 2, 'Copper via bio-leaching');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b579c1f6-478f-4242-83a4-f1e67a4693ce', 'dbddb86e-49fc-48ff-8b89-733d0c3a7c6f', 3, 'Zinc via roasting and reduction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dbddb86e-49fc-48ff-8b89-733d0c3a7c6f', '7a66fa85-3f90-41fe-9eb1-22f9a6b3eaec', 'The Hall-Heroult process extracts aluminium by electrolyzing alumina (Al2O3) dissolved in molten cryolite (Na3AlF6, which lowers the melting point and improves conductivity), depositing molten aluminium at the cathode.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('56d6df4c-5dc6-43d2-bc73-08d1562e8998', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 65, 'Ozone (O3), an allotrope of oxygen, is used as a strong oxidizing agent and for water purification because it:', 'Chemistry', 'p-Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4bb950ac-96e8-4320-9e41-9e9a07fedea8', '56d6df4c-5dc6-43d2-bc73-08d1562e8998', 0, 'Is completely unreactive, like a noble gas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2c7eb98-b67e-4181-8b68-1a1c2d05ec72', '56d6df4c-5dc6-43d2-bc73-08d1562e8998', 1, 'Readily decomposes to release nascent (highly reactive) oxygen, a powerful oxidizing/disinfecting species');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f47074e9-f976-44ba-8aff-af3899fe5d22', '56d6df4c-5dc6-43d2-bc73-08d1562e8998', 2, 'Only exists at extremely low temperatures');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57f8654c-c220-4cc4-9c7a-4fe59ccd5070', '56d6df4c-5dc6-43d2-bc73-08d1562e8998', 3, 'Is chemically identical to O2 in reactivity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('56d6df4c-5dc6-43d2-bc73-08d1562e8998', 'd2c7eb98-b67e-4181-8b68-1a1c2d05ec72', 'Ozone decomposes to release molecular oxygen and highly reactive nascent (atomic) oxygen, which is a strong oxidizing agent — the basis for ozone''s use in water/air purification and bleaching applications.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1db5e865-bb57-4cf1-8d5c-0f6320ae5e34', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 66, 'The +2 oxidation state is common and relatively stable for most first-row transition metals, primarily because it corresponds to the loss of electrons from the:', 'Chemistry', 'd and f Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c50bdcbb-04da-4a16-909b-6ea06a5b7e75', '1db5e865-bb57-4cf1-8d5c-0f6320ae5e34', 0, 'Inner (n-1)d orbitals only, with the 4s orbital untouched');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb810d94-98cb-42c4-a46b-ae9708ebc36f', '1db5e865-bb57-4cf1-8d5c-0f6320ae5e34', 1, 'Outermost ns orbital (typically 4s in the first transition series), which is generally lost before the (n-1)d electrons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('990553c6-906c-4268-8ddb-b5b340e33a86', '1db5e865-bb57-4cf1-8d5c-0f6320ae5e34', 2, '1s orbital');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4bd8e738-31e7-4944-8298-1e24eac71e76', '1db5e865-bb57-4cf1-8d5c-0f6320ae5e34', 3, 'Nucleus directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1db5e865-bb57-4cf1-8d5c-0f6320ae5e34', 'eb810d94-98cb-42c4-a46b-ae9708ebc36f', 'For first-row transition metals, the outer 4s electrons are generally lost first (before 3d electrons) upon ionization, so the +2 oxidation state (loss of both 4s electrons) is common and often relatively stable across the series.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('def57704-540e-4b69-846e-a032a9ac534f', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 67, 'Chelate complexes, formed by polydentate ligands (like EDTA) binding to a central metal ion at multiple points, are generally:', 'Chemistry', 'Coordination Compounds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('886215af-c5e4-4d3f-80c0-709d4168b4df', 'def57704-540e-4b69-846e-a032a9ac534f', 0, 'Less stable than complexes with equivalent monodentate ligands');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83181d23-bec9-4d13-9919-c2fe95a11da6', 'def57704-540e-4b69-846e-a032a9ac534f', 1, 'More stable than analogous complexes with monodentate ligands, an effect known as the chelate effect');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e8d6660-89a3-445a-b2f9-146b6d6fa9e7', 'def57704-540e-4b69-846e-a032a9ac534f', 2, 'Unable to form at all with transition metals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9379af8-c4da-41da-a3aa-4d1b81710dd9', 'def57704-540e-4b69-846e-a032a9ac534f', 3, 'Always insoluble in water');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('def57704-540e-4b69-846e-a032a9ac534f', '83181d23-bec9-4d13-9919-c2fe95a11da6', 'The chelate effect describes the enhanced thermodynamic stability of complexes formed with polydentate (chelating) ligands compared to similar complexes with an equivalent number of monodentate ligands, largely due to entropy factors.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('dd05073b-e8bc-4b1e-a65f-afaf58f1789c', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 68, 'The dehydrohalogenation of an alkyl halide (elimination of HX) using alcoholic KOH produces:', 'Chemistry', 'Haloalkanes and Haloarenes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f3a689e-0ac0-4368-a8e9-7f91313a1110', 'dd05073b-e8bc-4b1e-a65f-afaf58f1789c', 0, 'An alcohol');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3dbc2b0-c372-405f-9912-9499adb6c0ca', 'dd05073b-e8bc-4b1e-a65f-afaf58f1789c', 1, 'An alkene, via removal of a hydrogen and the halogen from adjacent carbons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53342986-639a-49d6-a0d5-9dd559bf4c65', 'dd05073b-e8bc-4b1e-a65f-afaf58f1789c', 2, 'A carboxylic acid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57018d45-bddc-45d6-9d75-766692f9b30f', 'dd05073b-e8bc-4b1e-a65f-afaf58f1789c', 3, 'An ether');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dd05073b-e8bc-4b1e-a65f-afaf58f1789c', 'd3dbc2b0-c372-405f-9912-9499adb6c0ca', 'Treatment of an alkyl halide with alcoholic (not aqueous) KOH favors an elimination reaction, removing H and X from adjacent carbon atoms to form a carbon-carbon double bond (alkene) — aqueous KOH instead favors substitution to form an alcohol.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d8775829-8dde-4c5b-81c2-317cef8df6a1', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 69, 'Phenol reacts with bromine water (without any catalyst) to readily give:', 'Chemistry', 'Alcohols, Phenols and Ethers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('52ed2687-8c10-48d5-8850-ae7c536c9f0d', 'd8775829-8dde-4c5b-81c2-317cef8df6a1', 0, 'Monobromophenol only, requiring a Lewis acid catalyst');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7d42efb-be03-41ed-b96c-bfddebf0a137', 'd8775829-8dde-4c5b-81c2-317cef8df6a1', 1, '2,4,6-tribromophenol as a white precipitate, due to the strong activating and ortho/para-directing effect of the -OH group');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('400c6eb0-0ef9-49af-9d91-80ab04cef560', 'd8775829-8dde-4c5b-81c2-317cef8df6a1', 2, 'No reaction at all under these conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('231bdb06-3443-4018-8b52-d7a5eff3c1fb', 'd8775829-8dde-4c5b-81c2-317cef8df6a1', 3, 'A completely different, non-aromatic product');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d8775829-8dde-4c5b-81c2-317cef8df6a1', 'c7d42efb-be03-41ed-b96c-bfddebf0a137', 'The -OH group on phenol strongly activates the aromatic ring toward electrophilic substitution and directs incoming groups to ortho/para positions; this activation is strong enough that phenol reacts readily with bromine water alone (no catalyst needed) to give the tribrominated product as a white precipitate.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e086ba7f-7902-495f-bdd7-93466afb0e94', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 70, 'The Fehling''s test, used to distinguish aliphatic aldehydes from ketones, involves the reduction of Cu2+ (blue) to Cu2O (a brick-red precipitate) by:', 'Chemistry', 'Aldehydes, Ketones and Carboxylic Acids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df764118-d8a0-433d-8966-9a427dca5cfa', 'e086ba7f-7902-495f-bdd7-93466afb0e94', 0, 'Ketones only, not aldehydes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfad73de-b3fe-4cec-89f8-3f034b79e214', 'e086ba7f-7902-495f-bdd7-93466afb0e94', 1, 'Aliphatic aldehydes (a positive test), while aromatic aldehydes and ketones generally give a negative test');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45e3952b-5944-4f64-8023-0275a00596cc', 'e086ba7f-7902-495f-bdd7-93466afb0e94', 2, 'Only tertiary alcohols');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53a6f7b3-3fa9-4406-97fa-5aae52141c06', 'e086ba7f-7902-495f-bdd7-93466afb0e94', 3, 'All carbonyl compounds equally, regardless of structure');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e086ba7f-7902-495f-bdd7-93466afb0e94', 'cfad73de-b3fe-4cec-89f8-3f034b79e214', 'Fehling''s solution is reduced by aliphatic aldehydes (giving a brick-red Cu2O precipitate, positive test), but aromatic aldehydes (like benzaldehyde) and ketones generally do NOT give a positive Fehling''s test, making it a useful distinguishing tool.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('beb03d19-4fc1-42cf-9df1-5cfa55132f7d', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 71, 'The basic character of amines in the gas phase (unaffected by solvation effects) generally follows the order:', 'Chemistry', 'Amines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0e27e0e-3e2f-40a6-8f8a-fbed890252cd', 'beb03d19-4fc1-42cf-9df1-5cfa55132f7d', 0, 'Primary < secondary < tertiary, purely based on inductive electron donation by alkyl groups');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('afa6d037-be8b-48ba-9adf-4910afbfe68f', 'beb03d19-4fc1-42cf-9df1-5cfa55132f7d', 1, 'Tertiary < secondary < primary, the reverse of the gas-phase order due to steric factors dominating');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a598c03-6d67-4cdd-91e8-333a18f94626', 'beb03d19-4fc1-42cf-9df1-5cfa55132f7d', 2, 'All amines show identical basicity in the gas phase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ddf7dd31-b8a4-4474-b2ee-14e83dc4ece0', 'beb03d19-4fc1-42cf-9df1-5cfa55132f7d', 3, 'Amines show no basic character in the gas phase at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('beb03d19-4fc1-42cf-9df1-5cfa55132f7d', 'b0e27e0e-3e2f-40a6-8f8a-fbed890252cd', 'In the gas phase (removing solvation/steric complications present in aqueous solution), basicity generally increases with the number of electron-donating alkyl groups: primary < secondary < tertiary, purely reflecting the inductive effect increasing electron density at nitrogen.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('958011cf-1821-4cb1-9b4f-bf1e22531c42', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 72, 'DNA and RNA differ from each other in several ways, including that RNA contains the sugar ribose (with a 2''-OH group) while DNA contains:', 'Chemistry', 'Biomolecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('938c2faf-5c90-44ab-a2dc-9c8302fa3420', '958011cf-1821-4cb1-9b4f-bf1e22531c42', 0, 'The same ribose sugar as RNA');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b35ae768-c69e-4248-9b2c-b494266906cd', '958011cf-1821-4cb1-9b4f-bf1e22531c42', 1, 'Deoxyribose, which lacks the 2''-OH group present in ribose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('556b684f-41e3-4256-bf7a-42ddc739f2ed', '958011cf-1821-4cb1-9b4f-bf1e22531c42', 2, 'No sugar component at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d46ba8d-e45f-4ffa-b3ac-37d9b10e2a71', '958011cf-1821-4cb1-9b4f-bf1e22531c42', 3, 'Only phosphate groups with no sugar');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('958011cf-1821-4cb1-9b4f-bf1e22531c42', 'b35ae768-c69e-4248-9b2c-b494266906cd', 'DNA''s sugar is deoxyribose (lacking the 2''-hydroxyl group found in ribose), which is part of why DNA is chemically more stable than RNA — RNA''s extra 2''-OH group makes its phosphodiester backbone more susceptible to hydrolysis.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d5dbdaa6-e4f5-4025-bc35-6178bfc40899', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 73, 'Vulcanization of natural rubber, a process discovered by Charles Goodyear, involves heating rubber with:', 'Chemistry', 'Polymers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51b2edbe-330b-42d1-872e-3090fa2fcf99', 'd5dbdaa6-e4f5-4025-bc35-6178bfc40899', 0, 'Pure oxygen gas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e67b263-f93f-44d9-9144-d50d260a70d0', 'd5dbdaa6-e4f5-4025-bc35-6178bfc40899', 1, 'Sulfur, which introduces cross-links between polymer chains, improving elasticity and reducing tackiness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c9db492-ead3-4c4a-8208-e6458b5893d9', 'd5dbdaa6-e4f5-4025-bc35-6178bfc40899', 2, 'Only water at high pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9622ff53-9e7f-40dd-8523-caeb64355a2d', 'd5dbdaa6-e4f5-4025-bc35-6178bfc40899', 3, 'Nitrogen gas');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d5dbdaa6-e4f5-4025-bc35-6178bfc40899', '6e67b263-f93f-44d9-9144-d50d260a70d0', 'Vulcanization heats natural rubber with sulfur, forming sulfur cross-links between adjacent polyisoprene chains; this significantly improves the rubber''s mechanical properties (elasticity, strength, resistance to temperature changes) and reduces its natural tackiness.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5fd8fce3-a6f8-4c03-ab7e-63b230b81fb8', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 74, 'Artificial sweeteners like aspartame and saccharin are valued in food chemistry because they provide sweetness while:', 'Chemistry', 'Chemistry in Everyday Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a042877-4a57-4724-87e5-320748821589', '5fd8fce3-a6f8-4c03-ab7e-63b230b81fb8', 0, 'Contributing significant caloric content, same as sugar');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa76e234-5a37-43ed-90d2-ffc4c9b343c0', '5fd8fce3-a6f8-4c03-ab7e-63b230b81fb8', 1, 'Contributing little to no caloric value, making them useful for calorie-conscious diets and diabetics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3f83833-5e93-4a86-ba59-0707b1ee8ff8', '5fd8fce3-a6f8-4c03-ab7e-63b230b81fb8', 2, 'Being chemically identical to sucrose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9127bdcf-e79d-4f2d-bfae-e01bf81d784c', '5fd8fce3-a6f8-4c03-ab7e-63b230b81fb8', 3, 'Only being usable in cooking at very high temperatures');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5fd8fce3-a6f8-4c03-ab7e-63b230b81fb8', 'aa76e234-5a37-43ed-90d2-ffc4c9b343c0', 'Artificial sweeteners are typically many times sweeter than sucrose by weight but contribute negligible calories, making them useful sugar substitutes for weight management and blood-sugar control (e.g., in diabetic diets).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('21a64813-eeca-4409-b0a2-01821ebeb36e', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 75, 'According to the VSEPR model, the shape of a molecule with 2 bond pairs and 3 lone pairs on the central atom (AB2E3 type, like XeF2) is:', 'Chemistry', 'Chemical Bonding and Molecular Structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1ac2ad9-4b39-4c42-a760-107ab4b634e9', '21a64813-eeca-4409-b0a2-01821ebeb36e', 0, 'Bent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('901f6bb0-220d-4de1-b57c-9e847b0c7ce0', '21a64813-eeca-4409-b0a2-01821ebeb36e', 1, 'Linear, since the three lone pairs occupy equatorial positions in a trigonal bipyramidal electron geometry, leaving the two bonded atoms in a straight line');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('104b0ea3-2b87-4f35-aebc-0860a2aeca7f', '21a64813-eeca-4409-b0a2-01821ebeb36e', 2, 'Tetrahedral');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfda68eb-4e6c-4e81-8c6d-1e26198e059b', '21a64813-eeca-4409-b0a2-01821ebeb36e', 3, 'T-shaped');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('21a64813-eeca-4409-b0a2-01821ebeb36e', '901f6bb0-220d-4de1-b57c-9e847b0c7ce0', 'With 5 total electron domains arranged in a trigonal bipyramidal geometry, placing all three lone pairs in the less-crowded equatorial positions (minimizing repulsion) leaves the two bonding pairs in the axial positions — resulting in a linear molecular shape, as seen in XeF2.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('34685d14-60ec-4157-8635-cc4f79e49ac2', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 76, 'Standard enthalpy of combustion is defined as the enthalpy change when one mole of a substance is:', 'Chemistry', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd280242-4be1-4399-9ea9-a8ecaac7dbd5', '34685d14-60ec-4157-8635-cc4f79e49ac2', 0, 'Formed from its constituent elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3fea69d-2ce0-477d-bd01-f547139cab89', '34685d14-60ec-4157-8635-cc4f79e49ac2', 1, 'Completely burnt (combusted) in excess oxygen under standard conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a95ac5ce-bcec-4427-acb8-f3d72017c1cf', '34685d14-60ec-4157-8635-cc4f79e49ac2', 2, 'Dissolved completely in water');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f35cdb26-af16-4dec-b21a-6897b2af8993', '34685d14-60ec-4157-8635-cc4f79e49ac2', 3, 'Neutralized by a base');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('34685d14-60ec-4157-8635-cc4f79e49ac2', 'e3fea69d-2ce0-477d-bd01-f547139cab89', 'Standard enthalpy of combustion refers specifically to the heat released when exactly one mole of a substance undergoes complete combustion in excess oxygen, with all reactants and products in their standard states.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b3dfba00-c505-4396-a36d-572acbaa1dc2', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 77, 'The Pauli exclusion principle states that no two electrons in the same atom can have:', 'Chemistry', 'Structure of Atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8352ae2b-45e9-4d8b-9900-f1250496db77', 'b3dfba00-c505-4396-a36d-572acbaa1dc2', 0, 'The same principal quantum number');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('641202df-75bd-4434-a26c-ed308491561e', 'b3dfba00-c505-4396-a36d-572acbaa1dc2', 1, 'The same set of all four quantum numbers (n, l, m_l, m_s)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f6e3ec5-95e3-44ac-8e75-70523691ba67', 'b3dfba00-c505-4396-a36d-572acbaa1dc2', 2, 'Different spin quantum numbers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca96ccd5-d699-4caf-b9e3-61590ccb6bdd', 'b3dfba00-c505-4396-a36d-572acbaa1dc2', 3, 'The same azimuthal quantum number only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b3dfba00-c505-4396-a36d-572acbaa1dc2', '641202df-75bd-4434-a26c-ed308491561e', 'The Pauli exclusion principle states that within a single atom, no two electrons can have an identical set of all four quantum numbers — meaning any orbital (fixed n, l, m_l) can hold at most two electrons, and those two must have opposite spins.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d154b27e-9c64-4667-827d-b11bd13a481c', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 78, 'A comproportionation reaction is one in which:', 'Chemistry', 'Redox Reactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ebc49f2-2424-47f6-8dab-cb8e25044da3', 'd154b27e-9c64-4667-827d-b11bd13a481c', 0, 'A single element in two different oxidation states in the reactants combines to form a single product with an intermediate oxidation state');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf3b7cbd-5612-45df-8fd7-89242fc2df0e', 'd154b27e-9c64-4667-827d-b11bd13a481c', 1, 'One element is simultaneously oxidized and reduced from a single starting oxidation state');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd8d5380-07d4-4e06-9b04-3a80e2c2bcdc', 'd154b27e-9c64-4667-827d-b11bd13a481c', 2, 'No change in oxidation number occurs anywhere in the reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1dd8ca6d-1421-46ef-b689-bb4f1f065fe1', 'd154b27e-9c64-4667-827d-b11bd13a481c', 3, 'Only reduction occurs throughout');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d154b27e-9c64-4667-827d-b11bd13a481c', '6ebc49f2-2424-47f6-8dab-cb8e25044da3', 'Comproportionation is the reverse of disproportionation: two species with the same element in different oxidation states react to form a single product in which that element has an intermediate oxidation state (e.g., Ag+ and Ag reacting is not quite this, but Mn2+ and MnO4- forming MnO2 is a classic example).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('39e60444-b21f-4ce8-9645-4b6ee687dacb', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 79, 'Baking soda (sodium bicarbonate, NaHCO3) decomposes on heating to release carbon dioxide, which is used in baking to make dough rise. The other products of this decomposition are:', 'Chemistry', 's-Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25cfc1f7-4e49-4fda-b13a-22d309e78f26', '39e60444-b21f-4ce8-9645-4b6ee687dacb', 0, 'Only oxygen gas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('364d2650-6558-4835-a5a8-a1828ea39a7d', '39e60444-b21f-4ce8-9645-4b6ee687dacb', 1, 'Sodium carbonate and water');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b4498222-da5d-4593-9932-0e2ce1663520', '39e60444-b21f-4ce8-9645-4b6ee687dacb', 2, 'Sodium metal and hydrogen gas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e357883-2192-4451-bfe1-6b32ee6474a7', '39e60444-b21f-4ce8-9645-4b6ee687dacb', 3, 'Only water, with sodium remaining as a solid metal');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('39e60444-b21f-4ce8-9645-4b6ee687dacb', '364d2650-6558-4835-a5a8-a1828ea39a7d', 'Heating sodium bicarbonate decomposes it into sodium carbonate, water, and carbon dioxide (2NaHCO3 -> Na2CO3 + H2O + CO2); the released CO2 gas is what causes baked goods to rise.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('680422ff-a880-45ee-b857-c26ec5a101ba', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 80, 'The number of moles in 22 grams of carbon dioxide (CO2, molar mass 44 g/mol) is:', 'Chemistry', 'Some Basic Concepts of Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4578f362-eb04-4ddf-a55e-1441180d16a3', '680422ff-a880-45ee-b857-c26ec5a101ba', 0, '0.5 mol');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b52493dd-191f-45d3-9d3a-ddb555e00fea', '680422ff-a880-45ee-b857-c26ec5a101ba', 1, '1 mol');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6632bdc-71a6-4512-9a78-dd16938ac535', '680422ff-a880-45ee-b857-c26ec5a101ba', 2, '2 mol');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8faa0874-7910-4da6-b704-bdd3bce79d58', '680422ff-a880-45ee-b857-c26ec5a101ba', 3, '22 mol');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('680422ff-a880-45ee-b857-c26ec5a101ba', '4578f362-eb04-4ddf-a55e-1441180d16a3', 'Moles = given mass / molar mass = 22g / 44 g/mol = 0.5 mol.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('89ed1b0a-8eae-4670-8bc2-3caadd770f8a', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 81, 'The photoelectric effect, in which light of sufficient frequency ejects electrons from a metal surface, provided key experimental evidence for the:', 'Chemistry', 'Structure of Atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('146a4a55-4086-4038-bd18-9821e378eff5', '89ed1b0a-8eae-4670-8bc2-3caadd770f8a', 0, 'Wave nature of light exclusively, ruling out any particle behavior');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f47ec9da-5dcd-4a17-9772-7288d90cb518', '89ed1b0a-8eae-4670-8bc2-3caadd770f8a', 1, 'Particle (photon) nature of light, since the effect could not be explained by classical wave theory');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80a18b34-77f4-4c6e-bab8-cb3d5de24d37', '89ed1b0a-8eae-4670-8bc2-3caadd770f8a', 2, 'Existence of the neutron');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca0a5719-4223-42d7-a6de-24bf57e5720b', '89ed1b0a-8eae-4670-8bc2-3caadd770f8a', 3, 'Bohr model of the atom directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('89ed1b0a-8eae-4670-8bc2-3caadd770f8a', 'f47ec9da-5dcd-4a17-9772-7288d90cb518', 'The photoelectric effect''s key features (instantaneous emission, threshold frequency, KE independent of intensity) could not be explained by classical wave theory of light, but were successfully explained by Einstein''s photon (particle) model of light — a landmark piece of evidence for quantum theory.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('754717dc-41da-41c5-a9db-eed06e531d57', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 82, 'Diagonal relationship in the periodic table refers to the similarity in properties observed between certain elements of Period 2 and the element diagonally below-right of them in Period 3, such as between:', 'Chemistry', 'Classification of Elements and Periodicity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0edcc435-0a9b-4784-9878-e96055bf4b48', '754717dc-41da-41c5-a9db-eed06e531d57', 0, 'Sodium and magnesium (same period)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('218cf100-a736-4c9e-88e3-7aa091e46844', '754717dc-41da-41c5-a9db-eed06e531d57', 1, 'Lithium and magnesium, or beryllium and aluminium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96ebf81c-eda3-4d5d-ad10-75d1eb951da1', '754717dc-41da-41c5-a9db-eed06e531d57', 2, 'Any two elements in the same group');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99689518-0211-43b4-8a5e-c4b5be38e8ae', '754717dc-41da-41c5-a9db-eed06e531d57', 3, 'Only noble gases');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('754717dc-41da-41c5-a9db-eed06e531d57', '218cf100-a736-4c9e-88e3-7aa091e46844', 'Diagonal relationships arise from similar polarizing power/charge density between certain Period 2 and Period 3 elements (e.g., Li and Mg, or Be and Al), giving them notably similar chemical properties despite being in different groups.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7e16e28e-9433-491e-a329-90f36cee9af2', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 83, 'Ionic compounds typically have high melting and boiling points because:', 'Chemistry', 'Chemical Bonding and Molecular Structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e1e11e7-7aea-4d34-a497-9f0b5825639c', '7e16e28e-9433-491e-a329-90f36cee9af2', 0, 'The covalent bonds within them are extremely weak');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('889e066f-259b-4f09-81b3-35846aad1fc1', '7e16e28e-9433-491e-a329-90f36cee9af2', 1, 'Strong electrostatic forces of attraction exist throughout the crystal lattice between oppositely charged ions, requiring significant energy to overcome');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66ef915d-a587-4498-92f5-6005ba133441', '7e16e28e-9433-491e-a329-90f36cee9af2', 2, 'They exist only as gases at room temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04d64d96-5c84-4c73-85ff-07f92cc29897', '7e16e28e-9433-491e-a329-90f36cee9af2', 3, 'They lack any regular crystal structure');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7e16e28e-9433-491e-a329-90f36cee9af2', '889e066f-259b-4f09-81b3-35846aad1fc1', 'Ionic solids are held together by strong, non-directional electrostatic (Coulombic) forces extending throughout the crystal lattice; a large amount of thermal energy is required to overcome this lattice energy and separate the ions, giving high melting/boiling points.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('856a1b73-269d-4d4d-8ee3-00af32bb49b0', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 84, 'A reaction with a negative delta H (exothermic) and a positive delta S (increasing entropy/disorder) will be:', 'Chemistry', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('395418c4-6ac9-424a-9c9d-1e0e11e9698a', '856a1b73-269d-4d4d-8ee3-00af32bb49b0', 0, 'Spontaneous at all temperatures, since delta G is always negative under these conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85827606-8b72-40a2-9af3-71f54117d135', '856a1b73-269d-4d4d-8ee3-00af32bb49b0', 1, 'Non-spontaneous at all temperatures');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0fc87e5f-d626-40cc-834c-69985ffdb281', '856a1b73-269d-4d4d-8ee3-00af32bb49b0', 2, 'Spontaneous only at very low temperatures');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2fa40aee-f5a0-4dea-bab3-8a2f643b8d08', '856a1b73-269d-4d4d-8ee3-00af32bb49b0', 3, 'Spontaneous only at very high temperatures');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('856a1b73-269d-4d4d-8ee3-00af32bb49b0', '395418c4-6ac9-424a-9c9d-1e0e11e9698a', 'Using delta G = delta H - T*delta S: if delta H is negative and delta S is positive, then -T*delta S is also negative for any positive T, making delta G negative (spontaneous) at ALL temperatures — the most favorable combination for spontaneity.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d8d44175-aed8-4b21-8b23-9eeb4b802d94', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 85, 'Adding an inert gas to a gaseous equilibrium system at constant VOLUME will:', 'Chemistry', 'Equilibrium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a59aa14-afe4-4898-abe0-f7068c8ac24d', 'd8d44175-aed8-4b21-8b23-9eeb4b802d94', 0, 'Shift the equilibrium significantly toward products');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1fb8a90-c5a8-451a-a7f9-b8c74ce7d5c9', 'd8d44175-aed8-4b21-8b23-9eeb4b802d94', 1, 'Have no effect on the equilibrium position, since partial pressures of the reacting species remain unchanged');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d3dc121-0617-42f3-abb2-db4016879200', 'd8d44175-aed8-4b21-8b23-9eeb4b802d94', 2, 'Shift the equilibrium significantly toward reactants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('afa59c8c-eb5b-45f7-8708-f21ce14f529a', 'd8d44175-aed8-4b21-8b23-9eeb4b802d94', 3, 'Always increase the value of the equilibrium constant Kp');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d8d44175-aed8-4b21-8b23-9eeb4b802d94', 'e1fb8a90-c5a8-451a-a7f9-b8c74ce7d5c9', 'Adding an inert gas at CONSTANT VOLUME increases total pressure but does not change the partial pressures (or concentrations) of the actual reacting gases, so the equilibrium position is unaffected (this differs from adding inert gas at constant pressure, which does shift equilibrium by effectively diluting the system).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0fb807f0-6d72-4c06-8522-11d1d2a8ad1a', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 86, 'Water (H2O) exhibits an unusually high boiling point compared to other hydrides of Group 16 elements (like H2S) primarily due to:', 'Chemistry', 'Hydrogen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7cc2890-7d5e-4dea-8818-7574285ac12c', '0fb807f0-6d72-4c06-8522-11d1d2a8ad1a', 0, 'Its low molecular mass alone, with no other factor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8845252-6309-47ae-b82a-253085ca5e52', '0fb807f0-6d72-4c06-8522-11d1d2a8ad1a', 1, 'Extensive hydrogen bonding between water molecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5dc7a954-61c2-4f63-9171-393c45e829a5', '0fb807f0-6d72-4c06-8522-11d1d2a8ad1a', 2, 'The presence of covalent bonds within the water molecule');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51b4dbd8-25f5-477e-9b24-7a46ae79c637', '0fb807f0-6d72-4c06-8522-11d1d2a8ad1a', 3, 'Water having a larger molecular size than H2S');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0fb807f0-6d72-4c06-8522-11d1d2a8ad1a', 'c8845252-6309-47ae-b82a-253085ca5e52', 'Despite its low molecular mass, water has an unusually high boiling point because of extensive intermolecular hydrogen bonding, requiring significantly more energy to separate molecules into the vapor phase compared to H2S, which cannot hydrogen-bond as effectively.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b3681809-cae0-4aa7-aca6-5f1138254c67', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 87, 'The greenhouse effect, which contributes to global warming, is primarily caused by certain atmospheric gases that:', 'Chemistry', 'Environmental Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13a2dafc-cf74-4ae0-bcc5-2002a8b813ac', 'b3681809-cae0-4aa7-aca6-5f1138254c67', 0, 'Reflect all incoming solar radiation back to space, cooling the planet');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9660cc5f-611f-4500-941b-e4d56c95147d', 'b3681809-cae0-4aa7-aca6-5f1138254c67', 1, 'Absorb and re-radiate infrared (heat) radiation emitted by Earth''s surface, trapping heat within the atmosphere');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e36d956c-6463-448b-9f5c-06b40fb5b6a3', 'b3681809-cae0-4aa7-aca6-5f1138254c67', 2, 'Block all ultraviolet radiation from reaching Earth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc7355e5-a9e0-43b3-99bd-afee32dbb311', 'b3681809-cae0-4aa7-aca6-5f1138254c67', 3, 'Have absolutely no interaction with any form of radiation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b3681809-cae0-4aa7-aca6-5f1138254c67', '9660cc5f-611f-4500-941b-e4d56c95147d', 'Greenhouse gases (CO2, methane, water vapor, etc.) are largely transparent to incoming shorter-wavelength solar radiation but absorb and re-emit the longer-wavelength infrared radiation emitted by Earth''s warmed surface, trapping heat and warming the atmosphere — the natural greenhouse effect, intensified by human emissions.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a0dd836e-bf6b-478e-b29d-1580e868b261', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 88, 'Zone refining, a purification technique used for semiconductors like silicon and germanium, works on the principle that:', 'Chemistry', 'General Principles of Isolation of Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a9ea9ee-9040-4a02-b925-d1679e5a48fe', 'a0dd836e-bf6b-478e-b29d-1580e868b261', 0, 'Impurities are always less soluble in the solid phase than in the melt, so they concentrate in the molten zone as it moves along the rod');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30e4a85c-7afb-436f-b7a8-c0caf46114e8', 'a0dd836e-bf6b-478e-b29d-1580e868b261', 1, 'Impurities evaporate completely at room temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('330e73f3-37ac-4cd4-9d66-15d211af0868', 'a0dd836e-bf6b-478e-b29d-1580e868b261', 2, 'The technique only works for liquids, not solids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc583d58-1801-4e53-adb2-6eda36d1077a', 'a0dd836e-bf6b-478e-b29d-1580e868b261', 3, 'All impurities are magnetically removed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a0dd836e-bf6b-478e-b29d-1580e868b261', '7a9ea9ee-9040-4a02-b925-d1679e5a48fe', 'Zone refining passes a molten zone along a rod of impure material; impurities, being more soluble in the liquid phase, concentrate in this molten zone and are swept to one end as the zone moves along, leaving increasingly pure solid behind — used to obtain ultra-pure semiconductor-grade silicon/germanium.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('77dd754a-9793-4b3a-beb5-935eaf995f37', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 89, 'Silica (SiO2), unlike carbon dioxide (CO2), exists as a hard, high-melting-point solid at room temperature because:', 'Chemistry', 'p-Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b8b0073-0150-4e45-bec5-b8de687d4629', '77dd754a-9793-4b3a-beb5-935eaf995f37', 0, 'Silicon cannot form pi bonds effectively, so SiO2 forms an extended covalent network solid (with Si-O single bonds throughout) rather than discrete molecules like CO2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb409b8b-b95d-4226-a771-d8c92242d4d5', '77dd754a-9793-4b3a-beb5-935eaf995f37', 1, 'Silicon is a metal, unlike carbon');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b008f9a-d543-4f71-8344-d15ebaa53fec', '77dd754a-9793-4b3a-beb5-935eaf995f37', 2, 'SiO2 has a lower molecular mass than CO2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d830f3e-90ca-4148-ab6f-0ae1c1cd75d4', '77dd754a-9793-4b3a-beb5-935eaf995f37', 3, 'Silica contains ionic bonds only, with no covalent character');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('77dd754a-9793-4b3a-beb5-935eaf995f37', '6b8b0073-0150-4e45-bec5-b8de687d4629', 'Unlike carbon, silicon''s larger size makes effective p-pi/p-pi overlap (needed for strong Si=O double bonds) very weak; instead, silicon forms an extended three-dimensional network of single Si-O bonds (as in SiO2''s covalent network structure), giving it a very high melting point unlike the discrete, small, gaseous CO2 molecule.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a077458f-db95-493a-bdb0-4113c5ff87d2', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 90, 'The Arrhenius equation, k = A*e^(-Ea/RT), shows that the rate constant k of a reaction:', 'Chemistry', 'Chemical Kinetics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd99f841-de43-40fa-9322-f8635bb29099', 'a077458f-db95-493a-bdb0-4113c5ff87d2', 0, 'Decreases as temperature increases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32ab1e0e-5499-40cd-aa17-0a86c3c907d0', 'a077458f-db95-493a-bdb0-4113c5ff87d2', 1, 'Increases exponentially as temperature increases, due to a greater fraction of molecules overcoming the activation energy barrier');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef3c2cc2-18ec-4d20-a66f-a084f6d27a21', 'a077458f-db95-493a-bdb0-4113c5ff87d2', 2, 'Is completely independent of temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('347aab44-8807-41e8-9aaa-c788db6af688', 'a077458f-db95-493a-bdb0-4113c5ff87d2', 3, 'Is directly proportional to temperature in a strictly linear fashion');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a077458f-db95-493a-bdb0-4113c5ff87d2', '32ab1e0e-5499-40cd-aa17-0a86c3c907d0', 'The Arrhenius equation shows that the rate constant k increases exponentially with temperature, since a higher T causes exponentially more molecules to have kinetic energy exceeding the activation energy Ea, consistent with the empirical observation that reaction rates typically roughly double for every 10 degree C rise.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Biology (90 questions) — Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c8cd7ce0-145c-42b4-8378-a1823d1aa2fa', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 91, 'Systematics, as a branch of biology, is concerned with:', 'Biology', 'The Living World');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4df5ff68-71a3-493f-96d0-6fbafd2f77f9', 'c8cd7ce0-145c-42b4-8378-a1823d1aa2fa', 0, 'Only naming organisms with no reference to classification');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0117f55-14ba-4f87-b22e-b0cbf3f6ce67', 'c8cd7ce0-145c-42b4-8378-a1823d1aa2fa', 1, 'The scientific study of the diversity of organisms and their evolutionary relationships, including classification');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6e343b8-7335-4334-94ed-bfa91f7e4ced', 'c8cd7ce0-145c-42b4-8378-a1823d1aa2fa', 2, 'Only the study of a single organism''s anatomy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5866879d-f894-4028-9ccc-8409d1197349', 'c8cd7ce0-145c-42b4-8378-a1823d1aa2fa', 3, 'Predicting future climate patterns');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c8cd7ce0-145c-42b4-8378-a1823d1aa2fa', 'b0117f55-14ba-4f87-b22e-b0cbf3f6ce67', 'Systematics encompasses classification, nomenclature, and identification of organisms in light of their diversity and evolutionary (phylogenetic) relationships — broader than taxonomy alone.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e98259be-428d-4369-bfbb-46f57c9137f5', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 92, 'Kingdom Protista includes a diverse group of eukaryotic organisms that are generally:', 'Biology', 'Biological Classification');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65dcf25d-90c8-4fc0-9b30-5ad87ac919e0', 'e98259be-428d-4369-bfbb-46f57c9137f5', 0, 'Multicellular with complex tissue organization, like plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8c8de31-5c0e-49f2-afd9-ae0418e7ad07', 'e98259be-428d-4369-bfbb-46f57c9137f5', 1, 'Unicellular (or simple colonial/multicellular) and cannot be strictly grouped with plants, animals, or fungi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d35af951-6e82-44ea-a5de-334a81bcf4a4', 'e98259be-428d-4369-bfbb-46f57c9137f5', 2, 'Prokaryotic, like bacteria');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbd646ac-4ef2-40d5-83a7-533d1a90cba5', 'e98259be-428d-4369-bfbb-46f57c9137f5', 3, 'Exclusively parasitic');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e98259be-428d-4369-bfbb-46f57c9137f5', 'c8c8de31-5c0e-49f2-afd9-ae0418e7ad07', 'Protists are a diverse, largely unicellular (some colonial) eukaryotic group that don''t fit neatly into the plant, animal, or fungal kingdoms — a somewhat catch-all group unified more by exclusion than by shared derived features.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('11b94e6e-a0ae-46ee-b527-4c4f47f86827', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 93, 'In angiosperms, the endosperm serves the important function of:', 'Biology', 'Plant Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85c50e85-b14f-4046-9f6f-8f0e879616bc', '11b94e6e-a0ae-46ee-b527-4c4f47f86827', 0, 'Protecting the ovule before fertilization');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51fdaac7-c809-4744-9fab-544eda077812', '11b94e6e-a0ae-46ee-b527-4c4f47f86827', 1, 'Providing nutrition to the developing embryo within the seed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2866bea-0f32-4b5e-bceb-eaa6fdd02979', '11b94e6e-a0ae-46ee-b527-4c4f47f86827', 2, 'Attracting pollinators');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5558835-63ea-4f97-8cab-3a81f1faa543', '11b94e6e-a0ae-46ee-b527-4c4f47f86827', 3, 'Forming the outer seed coat');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('11b94e6e-a0ae-46ee-b527-4c4f47f86827', '51fdaac7-c809-4744-9fab-544eda077812', 'The triploid endosperm, formed via the second fertilization event (double fertilization), serves as a nutritive tissue that nourishes the developing embryo, either being consumed before seed maturity (non-endospermic seeds) or persisting in the mature seed (endospermic seeds).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0c781a87-7b1e-474b-9356-97a563d96de0', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 94, 'Reticulate venation, characterized by a network-like pattern of veins in the leaf lamina, is typically found in:', 'Biology', 'Morphology of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96da6534-9938-4236-8e3e-5a106e2bdc8c', '0c781a87-7b1e-474b-9356-97a563d96de0', 0, 'Monocotyledonous plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b268ba0-457c-42da-82da-2aa39cb82fb1', '0c781a87-7b1e-474b-9356-97a563d96de0', 1, 'Dicotyledonous plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('edf9a212-719d-4033-abbe-ab8230fd6ae9', '0c781a87-7b1e-474b-9356-97a563d96de0', 2, 'Only in gymnosperms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e53177f9-64a5-4db7-89d7-e8758dd59578', '0c781a87-7b1e-474b-9356-97a563d96de0', 3, 'Only in algae');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0c781a87-7b1e-474b-9356-97a563d96de0', '2b268ba0-457c-42da-82da-2aa39cb82fb1', 'Reticulate (net-like) venation is characteristic of dicot leaves, while parallel venation (veins running parallel to each other) is characteristic of monocot leaves — a useful diagnostic feature distinguishing the two major angiosperm groups.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('93cbb8d7-bbf5-4acd-ae0e-f89810da059e', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 95, 'The epidermis, the outermost layer of a plant''s primary body, is typically covered by a waxy, protective layer called the:', 'Biology', 'Anatomy of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87f73257-3aa7-450f-be18-eac20ae56bbb', '93cbb8d7-bbf5-4acd-ae0e-f89810da059e', 0, 'Cork');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41dde389-7d63-483d-8ea5-5a93a5721c35', '93cbb8d7-bbf5-4acd-ae0e-f89810da059e', 1, 'Cuticle, which helps prevent excessive water loss');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be3e3548-2957-4f82-ac8d-5701c4fe8ffc', '93cbb8d7-bbf5-4acd-ae0e-f89810da059e', 2, 'Cambium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df987e3e-2500-442d-9284-4b12c6738a29', '93cbb8d7-bbf5-4acd-ae0e-f89810da059e', 3, 'Phloem');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('93cbb8d7-bbf5-4acd-ae0e-f89810da059e', '41dde389-7d63-483d-8ea5-5a93a5721c35', 'The epidermis is usually covered by a waxy cuticle, secreted by the epidermal cells, which minimizes water loss from aerial plant parts and provides a degree of protection against pathogens.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b48fda8d-7edd-4067-b302-c78ae2334035', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 96, 'Peroxisomes, small membrane-bound organelles found in both plant and animal cells, are primarily involved in:', 'Biology', 'Cell — The Unit of Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bed644d8-5c38-4262-b429-a6a43b4ffa26', 'b48fda8d-7edd-4067-b302-c78ae2334035', 0, 'Photosynthesis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d682d7d5-d3a8-4d91-a692-ef0445a30343', 'b48fda8d-7edd-4067-b302-c78ae2334035', 1, 'Oxidative reactions that produce and then break down hydrogen peroxide, and lipid metabolism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('14f9ea4e-d8bd-4075-970d-cf095d10d2bc', 'b48fda8d-7edd-4067-b302-c78ae2334035', 2, 'DNA replication');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69e2a390-ce19-4e9d-b324-9e4e8a75c390', 'b48fda8d-7edd-4067-b302-c78ae2334035', 3, 'Cell division');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b48fda8d-7edd-4067-b302-c78ae2334035', 'd682d7d5-d3a8-4d91-a692-ef0445a30343', 'Peroxisomes contain oxidative enzymes that generate hydrogen peroxide as a byproduct of reactions like fatty acid oxidation, along with catalase to safely break down that H2O2 into water and oxygen, preventing cellular damage from this reactive compound.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f67bd2dd-56e7-49ec-bfef-e3525061d00c', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 97, 'The tertiary structure of a globular protein refers to:', 'Biology', 'Biomolecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9af1d402-48bf-4ee3-a082-2e7088c560fa', 'f67bd2dd-56e7-49ec-bfef-e3525061d00c', 0, 'Its linear amino acid sequence only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85a43f26-104d-4fd6-869d-c953974ec7e0', 'f67bd2dd-56e7-49ec-bfef-e3525061d00c', 1, 'The overall three-dimensional folding of the entire polypeptide chain, stabilized by various interactions between distant amino acid side chains');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3fa994b2-551e-49ee-bc12-ca2b8211d648', 'f67bd2dd-56e7-49ec-bfef-e3525061d00c', 2, 'The arrangement of multiple separate polypeptide subunits');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38d505d8-2e59-4e2b-9618-7e8fc10b709e', 'f67bd2dd-56e7-49ec-bfef-e3525061d00c', 3, 'Only the alpha-helix regions of the protein');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f67bd2dd-56e7-49ec-bfef-e3525061d00c', '85a43f26-104d-4fd6-869d-c953974ec7e0', 'Tertiary structure describes the complete 3D folded shape of a single polypeptide chain, stabilized by interactions (hydrogen bonds, disulfide bridges, hydrophobic interactions, ionic bonds) between amino acid side chains that may be far apart in the primary sequence but close together once folded.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d3ed8c56-4f71-4c03-89fa-135507989c4f', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 98, 'During anaphase of mitosis, the key event that occurs is:', 'Biology', 'Cell Cycle and Cell Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65c7f129-7555-4930-884a-d01c51c1ca68', 'd3ed8c56-4f71-4c03-89fa-135507989c4f', 0, 'Chromosomes condensing for the first time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09b5527c-a841-40f2-b0e0-ea68a74199fa', 'd3ed8c56-4f71-4c03-89fa-135507989c4f', 1, 'The splitting of the centromere and separation of sister chromatids, which move toward opposite poles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3335bac0-f63d-4675-9bab-13174dab5179', 'd3ed8c56-4f71-4c03-89fa-135507989c4f', 2, 'Formation of the nuclear envelope around a single mass of chromosomes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('808c027b-a0c5-45c4-be62-9c5f19bd0844', 'd3ed8c56-4f71-4c03-89fa-135507989c4f', 3, 'The cell dividing into four daughter cells simultaneously');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d3ed8c56-4f71-4c03-89fa-135507989c4f', '09b5527c-a841-40f2-b0e0-ea68a74199fa', 'In anaphase, the centromere holding sister chromatids together splits, and the spindle fibres pull the now-separate sister chromatids (each now considered an individual chromosome) toward opposite poles of the cell.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('87cdfa5f-5cfe-4043-814f-cd1f8718c3a7', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 99, 'The Emerson enhancement effect, an important discovery in photosynthesis research, demonstrated that:', 'Biology', 'Photosynthesis in Higher Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b3866b1-c231-42d4-b223-ffe73ccf0fe1', '87cdfa5f-5cfe-4043-814f-cd1f8718c3a7', 0, 'A single wavelength of light is always more efficient than a combination of two wavelengths');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5c17acc-4478-4671-88f2-0f7619cf49d1', '87cdfa5f-5cfe-4043-814f-cd1f8718c3a7', 1, 'Photosynthetic efficiency is greater when plants are illuminated with a combination of two different wavelengths of light together than the sum of their individual effects, providing evidence for two distinct photosystems');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ee29157-6885-45ae-acfc-2b3086141b97', '87cdfa5f-5cfe-4043-814f-cd1f8718c3a7', 2, 'Photosynthesis does not require light at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9a64ec2-f1dd-4333-b317-7a468a60ad2c', '87cdfa5f-5cfe-4043-814f-cd1f8718c3a7', 3, 'Only red light can drive photosynthesis');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('87cdfa5f-5cfe-4043-814f-cd1f8718c3a7', 'd5c17acc-4478-4671-88f2-0f7619cf49d1', 'Emerson found that combining far-red light with shorter-wavelength red light gave photosynthetic rates greater than the sum of the rates for each wavelength alone — this enhancement effect provided key evidence for the existence of two distinct photosystems (I and II) working together.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0f5d6a86-84ca-41d7-a80d-d04c3bd3b7ba', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 100, 'Anaerobic respiration (fermentation) in yeast cells produces which end products from pyruvate?', 'Biology', 'Respiration in Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21f05070-57b4-48b8-bd44-e5c2ed1385fb', '0f5d6a86-84ca-41d7-a80d-d04c3bd3b7ba', 0, 'Lactic acid only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('054e39b1-aeb6-4341-9079-07609c7d5b56', '0f5d6a86-84ca-41d7-a80d-d04c3bd3b7ba', 1, 'Ethanol and carbon dioxide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3afe78f3-d224-4907-bf63-1e1661296dbf', '0f5d6a86-84ca-41d7-a80d-d04c3bd3b7ba', 2, 'Only carbon dioxide, with no other product');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e72f880-f4c1-4a13-8936-52d63afe47d2', '0f5d6a86-84ca-41d7-a80d-d04c3bd3b7ba', 3, 'Water and oxygen');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0f5d6a86-84ca-41d7-a80d-d04c3bd3b7ba', '054e39b1-aeb6-4341-9079-07609c7d5b56', 'Yeast cells (and some plant tissues under low-oxygen conditions) carry out alcoholic fermentation, converting pyruvate into ethanol and CO2, regenerating NAD+ needed to sustain glycolysis in the absence of oxygen.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6d1bdf43-319d-4c13-b6d1-6c02c000a8b1', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 101, 'The phenomenon of photoperiodism refers to a plant''s physiological response to:', 'Biology', 'Plant Growth and Development');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('575aa8f6-3fa6-497c-8db0-34b3f86d7d32', '6d1bdf43-319d-4c13-b6d1-6c02c000a8b1', 0, 'The intensity of light only, regardless of duration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66f5ef62-b019-4694-ad10-c640c2dfc345', '6d1bdf43-319d-4c13-b6d1-6c02c000a8b1', 1, 'The relative length of day and night (photoperiod), which regulates processes like flowering in many species');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fdbc75ff-0e11-4653-a1c6-6d69f856df78', '6d1bdf43-319d-4c13-b6d1-6c02c000a8b1', 2, 'Temperature fluctuations exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('360c7569-4775-449c-8b31-12648107d49d', '6d1bdf43-319d-4c13-b6d1-6c02c000a8b1', 3, 'Soil moisture content');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6d1bdf43-319d-4c13-b6d1-6c02c000a8b1', '66f5ef62-b019-4694-ad10-c640c2dfc345', 'Photoperiodism describes how plants respond to the relative duration of light and darkness in a 24-hour cycle, a key environmental cue regulating flowering time in short-day, long-day, and day-neutral plants.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7d4a5438-fd4e-4d5f-b2a4-cb0aad94e72f', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 102, 'Triple fusion, part of the double fertilization process in angiosperms, involves the fusion of a male gamete with:', 'Biology', 'Sexual Reproduction in Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('776324b0-d11c-459b-ae1e-e66343b16af4', '7d4a5438-fd4e-4d5f-b2a4-cb0aad94e72f', 0, 'The egg cell alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5cc72705-6b08-498e-8fa8-bebf750a0d41', '7d4a5438-fd4e-4d5f-b2a4-cb0aad94e72f', 1, 'The two polar nuclei of the central cell, forming the triploid primary endosperm nucleus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b366f8e4-bb1d-4ad4-b3d1-13b5f76962ba', '7d4a5438-fd4e-4d5f-b2a4-cb0aad94e72f', 2, 'The synergid cells only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec26d491-2aea-4505-9875-15cd2f1e00b7', '7d4a5438-fd4e-4d5f-b2a4-cb0aad94e72f', 3, 'The antipodal cells');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7d4a5438-fd4e-4d5f-b2a4-cb0aad94e72f', '5cc72705-6b08-498e-8fa8-bebf750a0d41', 'Triple fusion is the fusion of one male gamete with the two polar nuclei located in the central cell of the embryo sac, producing the triploid (3n) primary endosperm nucleus, which develops into the nutritive endosperm tissue.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c543dd3e-72cb-4c44-9e64-cb9726a8d3cc', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 103, 'Pleiotropy refers to a phenomenon in genetics where:', 'Biology', 'Principles of Inheritance and Variation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97d61820-6f82-4aab-b54c-54a48b5df11d', 'c543dd3e-72cb-4c44-9e64-cb9726a8d3cc', 0, 'A single gene has multiple, seemingly unrelated phenotypic effects');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0bc15b60-dcd3-49a9-9aa6-fbe94e283aa8', 'c543dd3e-72cb-4c44-9e64-cb9726a8d3cc', 1, 'Multiple genes together control a single trait');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90e5a4fc-3e61-42bf-a2db-db5898cee7ee', 'c543dd3e-72cb-4c44-9e64-cb9726a8d3cc', 2, 'A gene has no phenotypic effect at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('172d48fc-cf3b-4b16-9792-ac2d4038784c', 'c543dd3e-72cb-4c44-9e64-cb9726a8d3cc', 3, 'Two alleles blend completely to create an intermediate phenotype');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c543dd3e-72cb-4c44-9e64-cb9726a8d3cc', '97d61820-6f82-4aab-b54c-54a48b5df11d', 'Pleiotropy describes a single gene influencing multiple, sometimes apparently unrelated, phenotypic traits — for example, the gene responsible for sickle-cell anemia also confers some resistance to malaria.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8751db99-c49c-409c-a532-2eaee2ee7e8e', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 104, 'The Human Genome Project revealed that protein-coding genes constitute what approximate fraction of the total human genome?', 'Biology', 'Molecular Basis of Inheritance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('699004e3-01ed-404c-989c-349268dffd3f', '8751db99-c49c-409c-a532-2eaee2ee7e8e', 0, 'Nearly 100%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4c15cc2-3b30-4b52-bf92-55f315c3b535', '8751db99-c49c-409c-a532-2eaee2ee7e8e', 1, 'A small fraction (roughly 1-2%), with the vast majority being non-coding DNA');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a2dec58-9e30-431f-a5dc-af1ce7831593', '8751db99-c49c-409c-a532-2eaee2ee7e8e', 2, 'Exactly 50%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c15c1d0-d81d-4242-99eb-8fb2558c1051', '8751db99-c49c-409c-a532-2eaee2ee7e8e', 3, 'Zero percent; humans have no protein-coding genes');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8751db99-c49c-409c-a532-2eaee2ee7e8e', 'f4c15cc2-3b30-4b52-bf92-55f315c3b535', 'Surprisingly, the Human Genome Project revealed that protein-coding sequences make up only a small fraction (roughly 1-2%) of the total human genome, with the majority consisting of non-coding DNA, including regulatory sequences, introns, and repetitive elements.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7a0255ac-a106-4206-9a1a-efde84f739fb', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 105, 'Homology-based classification, as used in constructing phylogenetic trees, relies primarily on identifying:', 'Biology', 'Evolution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7e88b55-1ca9-4807-82e4-6862126f1968', '7a0255ac-a106-4206-9a1a-efde84f739fb', 0, 'Superficial similarities in appearance regardless of ancestry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('515cb8a1-0aa8-4ff7-9720-b2241be5d865', '7a0255ac-a106-4206-9a1a-efde84f739fb', 1, 'Shared derived characteristics inherited from a common ancestor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e065c068-59e6-4756-81b6-cf7151cfc945', '7a0255ac-a106-4206-9a1a-efde84f739fb', 2, 'Random genetic mutations with no evolutionary significance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf7e8d4c-0929-4ed7-938c-70f545a72c06', '7a0255ac-a106-4206-9a1a-efde84f739fb', 3, 'Geographic proximity between species');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7a0255ac-a106-4206-9a1a-efde84f739fb', '515cb8a1-0aa8-4ff7-9720-b2241be5d865', 'Modern phylogenetic classification is built around identifying homologous characteristics — features shared due to common ancestry (not mere superficial resemblance, which could instead reflect convergent evolution) — to reconstruct evolutionary relationships.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('bf7b8e63-05f0-4c52-b47d-8861f7693fa6', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 106, 'Biofortification, an approach to improving crop nutritional value, refers to:', 'Biology', 'Strategies for Enhancement in Food Production');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c948f891-acaf-4cc8-a7d3-13bfeebb0431', 'bf7b8e63-05f0-4c52-b47d-8861f7693fa6', 0, 'Adding synthetic vitamins to processed food after harvest');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('30e5b398-83b5-4a9e-9e03-973bd62f6379', 'bf7b8e63-05f0-4c52-b47d-8861f7693fa6', 1, 'Breeding (or genetically engineering) crop varieties with enhanced levels of vitamins, minerals, or proteins directly in the edible plant tissue');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cdc74206-73c3-45f8-bc47-a7d633408e38', 'bf7b8e63-05f0-4c52-b47d-8861f7693fa6', 2, 'Only applying chemical fertilizers to soil');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dcee260d-fcc8-455e-9478-ad5122d8adec', 'bf7b8e63-05f0-4c52-b47d-8861f7693fa6', 3, 'Removing all nutrients from a crop to extend shelf life');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bf7b8e63-05f0-4c52-b47d-8861f7693fa6', '30e5b398-83b5-4a9e-9e03-973bd62f6379', 'Biofortification aims to increase the nutritional content (vitamins, minerals, protein) of crops through breeding or genetic engineering at the source, so that the harvested food itself is more nutritious — Golden Rice being a well-known example.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3654fc1e-3016-41e7-9c06-e540ab2f3f45', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 107, 'Biological control of pests, an eco-friendly pest management strategy, involves using:', 'Biology', 'Microbes in Human Welfare');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90ff1189-24c7-4e70-9d1b-36128270f031', '3654fc1e-3016-41e7-9c06-e540ab2f3f45', 0, 'Only synthetic chemical pesticides');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e455a5d-336c-4b30-9365-05429f2feab6', '3654fc1e-3016-41e7-9c06-e540ab2f3f45', 1, 'Natural predators, parasites, or pathogens of the pest species to reduce its population');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5b04814-f9d7-403e-8eb4-18e2311eed68', '3654fc1e-3016-41e7-9c06-e540ab2f3f45', 2, 'Complete habitat destruction of the pest''s environment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c2964d4-df86-4202-a11e-283b8601991a', '3654fc1e-3016-41e7-9c06-e540ab2f3f45', 3, 'Genetically identical clones of the pest itself with no other organism involved');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3654fc1e-3016-41e7-9c06-e540ab2f3f45', '7e455a5d-336c-4b30-9365-05429f2feab6', 'Biological pest control uses the pest''s natural enemies (predators, parasitoids, or pathogenic microorganisms) to suppress pest populations, offering an environmentally friendlier alternative (or supplement) to synthetic chemical pesticides.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('beae131d-8404-46c4-8cf8-197335ab1dd8', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 108, 'The technique of DNA fingerprinting, widely used in forensic science and paternity testing, exploits variation in:', 'Biology', 'Biotechnology — Principles and Processes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b13ab1c9-e12e-4afb-8f8d-836e06321884', 'beae131d-8404-46c4-8cf8-197335ab1dd8', 0, 'The total amount of DNA present in every human cell, which varies widely between individuals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12193565-4c58-4f74-98af-38c6edd332a1', 'beae131d-8404-46c4-8cf8-197335ab1dd8', 1, 'Highly variable, repetitive non-coding DNA sequences (like VNTRs/STRs) that differ between individuals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2516b8de-e479-46b3-a97d-a4d031efbad3', 'beae131d-8404-46c4-8cf8-197335ab1dd8', 2, 'Only the coding sequences of genes, which are identical between all humans');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26252b67-c229-40e1-92ce-a2ad6ce7e544', 'beae131d-8404-46c4-8cf8-197335ab1dd8', 3, 'Blood type alone, with no DNA analysis involved');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('beae131d-8404-46c4-8cf8-197335ab1dd8', '12193565-4c58-4f74-98af-38c6edd332a1', 'DNA fingerprinting analyzes highly variable, repetitive non-coding regions (like Variable Number Tandem Repeats or Short Tandem Repeats), which differ substantially between unrelated individuals, providing a nearly unique genetic identifier useful in forensics and parentage testing.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d6c1d464-f28c-49a6-bd5a-6632f7b616c7', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 109, 'Molecular diagnosis techniques like PCR are especially valuable in detecting diseases early because they can:', 'Biology', 'Biotechnology and Its Applications');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cdc1092-874c-4db5-84f1-72a357822834', 'd6c1d464-f28c-49a6-bd5a-6632f7b616c7', 0, 'Only detect diseases after severe symptoms have already appeared');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('919d880b-b848-4f0c-b23b-c66f2767b176', 'd6c1d464-f28c-49a6-bd5a-6632f7b616c7', 1, 'Detect the presence of a pathogen''s nucleic acid even when present in very low, otherwise undetectable, quantities, by amplifying it');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d39e337-8f9f-4fb1-88fe-7ef44297641a', 'd6c1d464-f28c-49a6-bd5a-6632f7b616c7', 2, 'Only work on bacterial infections, never viral');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53d7f957-f5f7-4c64-8049-a602f6d8f413', 'd6c1d464-f28c-49a6-bd5a-6632f7b616c7', 3, 'Replace the need for any other diagnostic test entirely');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d6c1d464-f28c-49a6-bd5a-6632f7b616c7', '919d880b-b848-4f0c-b23b-c66f2767b176', 'PCR-based molecular diagnosis can amplify even minute quantities of a pathogen''s DNA/RNA to detectable levels, allowing very early and sensitive disease detection — often well before antibody-based tests would show a positive result or before symptoms fully manifest.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('fed416ad-cbe0-435c-bfa5-065b4fa9095c', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 110, 'Age pyramids, used to represent the age structure of a population, showing a broad base and narrow top, typically indicate a:', 'Biology', 'Organisms and Populations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54074896-06da-4c7d-871a-f3550954f14e', 'fed416ad-cbe0-435c-bfa5-065b4fa9095c', 0, 'Declining population with more older than younger individuals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd3f3c74-12a8-4253-9dd9-71cfd508ae2e', 'fed416ad-cbe0-435c-bfa5-065b4fa9095c', 1, 'Rapidly expanding/growing population with a high proportion of pre-reproductive (young) individuals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cce8d3dc-48ba-4b14-9530-ccad175d3fcb', 'fed416ad-cbe0-435c-bfa5-065b4fa9095c', 2, 'Stable population with equal representation across all ages');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10c8e0c0-c169-486f-82ba-3a71db4b440b', 'fed416ad-cbe0-435c-bfa5-065b4fa9095c', 3, 'Population with zero reproduction occurring');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fed416ad-cbe0-435c-bfa5-065b4fa9095c', 'dd3f3c74-12a8-4253-9dd9-71cfd508ae2e', 'An age pyramid with a broad base (many young, pre-reproductive individuals) and a narrowing top (fewer older individuals) is characteristic of a rapidly expanding population, since a large young cohort implies substantial future reproductive potential.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ba4a7fcf-4b88-4eee-a5d9-3cda508c6cb6', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 111, 'Standing crop, a term used in ecosystem ecology, refers to:', 'Biology', 'Ecosystem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('339925c2-5f61-4b61-8df1-793e373e1d92', 'ba4a7fcf-4b88-4eee-a5d9-3cda508c6cb6', 0, 'The amount of biomass present at a particular trophic level at a given point in time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a03eb190-8e24-438e-b1ea-e02483714bcd', 'ba4a7fcf-4b88-4eee-a5d9-3cda508c6cb6', 1, 'The total energy input from the sun over a year');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('622388c4-0d0f-4c11-ba20-50430c361ebb', 'ba4a7fcf-4b88-4eee-a5d9-3cda508c6cb6', 2, 'Only the crops actively being harvested by farmers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ad32fc2-5928-4608-a716-c12ce225278e', 'ba4a7fcf-4b88-4eee-a5d9-3cda508c6cb6', 3, 'The number of decomposers present');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ba4a7fcf-4b88-4eee-a5d9-3cda508c6cb6', '339925c2-5f61-4b61-8df1-793e373e1d92', 'Standing crop describes the mass of living organisms (biomass) present at a particular trophic level at any given instant, usually measured as fresh or dry weight per unit area.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('22381c5e-b8ec-4d84-87a1-734c9724db5c', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 112, 'Keystone species, in ecological terminology, are species whose impact on their ecosystem is:', 'Biology', 'Biodiversity and Conservation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b5a7498-6da6-453b-894d-9a71b11a896c', '22381c5e-b8ec-4d84-87a1-734c9724db5c', 0, 'Negligible, regardless of their abundance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b454dc9-e734-4639-be37-28704240d488', '22381c5e-b8ec-4d84-87a1-734c9724db5c', 1, 'Disproportionately large relative to their abundance, such that their removal can dramatically alter the structure of the entire community');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5cbd2d34-8caa-4da6-9887-e627ce0d1e93', '22381c5e-b8ec-4d84-87a1-734c9724db5c', 2, 'Only relevant in aquatic ecosystems');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1dfb9993-6462-4002-9135-fb4d2c096e93', '22381c5e-b8ec-4d84-87a1-734c9724db5c', 3, 'Limited strictly to producer-level organisms');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('22381c5e-b8ec-4d84-87a1-734c9724db5c', '7b454dc9-e734-4639-be37-28704240d488', 'A keystone species exerts an ecological influence far greater than would be predicted from its relative abundance; its removal can trigger dramatic, cascading changes throughout the ecosystem''s structure and species composition (e.g., sea otters in kelp forest ecosystems).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('05497983-f219-4446-a40c-455a424fdc56', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 113, 'The use of catalytic converters in automobile exhaust systems primarily helps reduce emissions of:', 'Biology', 'Environmental Issues');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85e118d3-b8fb-44c4-aba1-dd9c23a7f017', '05497983-f219-4446-a40c-455a424fdc56', 0, 'Water vapor only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a5d0ff7c-f94f-452d-b40b-dcbba05e1413', '05497983-f219-4446-a40c-455a424fdc56', 1, 'Carbon monoxide, unburnt hydrocarbons, and nitrogen oxides, by converting them into less harmful gases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('567dc2f9-d6c3-4a8b-b221-3bd969aeaba1', '05497983-f219-4446-a40c-455a424fdc56', 2, 'Only carbon dioxide, with no effect on other pollutants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('951b489d-22df-47a6-944c-b404cd14d231', '05497983-f219-4446-a40c-455a424fdc56', 3, 'Sound pollution from the engine');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('05497983-f219-4446-a40c-455a424fdc56', 'a5d0ff7c-f94f-452d-b40b-dcbba05e1413', 'Catalytic converters use catalysts (often platinum, palladium, rhodium) to convert harmful exhaust gases — carbon monoxide, unburnt hydrocarbons, and nitrogen oxides — into less harmful carbon dioxide, water vapor, and nitrogen gas.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('57bb1b57-c2b1-4744-8bc9-ee225e47b968', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 114, 'A taxonomic key is a tool used by biologists primarily to:', 'Biology', 'The Living World');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ddd3aac2-0299-4724-b6a5-2867a3e4bbf8', '57bb1b57-c2b1-4744-8bc9-ee225e47b968', 0, 'Store preserved specimens for long-term reference');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4dacd30b-70a8-4946-b9cc-a7000246d824', '57bb1b57-c2b1-4744-8bc9-ee225e47b968', 1, 'Aid in the identification of an unknown organism based on a series of contrasting choices about its characteristics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c7a093b-9526-4f11-a402-179455570484', '57bb1b57-c2b1-4744-8bc9-ee225e47b968', 2, 'Generate random species names');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0fa37fb-c441-4f34-b6d6-1f45625b10bc', '57bb1b57-c2b1-4744-8bc9-ee225e47b968', 3, 'Measure the biomass of an ecosystem');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('57bb1b57-c2b1-4744-8bc9-ee225e47b968', '4dacd30b-70a8-4946-b9cc-a7000246d824', 'A taxonomic key (often dichotomous) presents a sequence of paired, contrasting statements about an organism''s characteristics, guiding the user step-by-step toward correctly identifying its taxonomic group.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f2851799-134d-4677-9bf7-1490a1e98262', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 115, 'In pteridophytes (ferns), the sporangia (spore-producing structures) are typically found in clusters on the underside of leaves, known as:', 'Biology', 'Plant Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19e5fb8b-77f1-43d0-9725-a745b84ab54d', 'f2851799-134d-4677-9bf7-1490a1e98262', 0, 'Sori');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94ee00c5-7df4-4232-8f1f-95ba28f03236', 'f2851799-134d-4677-9bf7-1490a1e98262', 1, 'Cones');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e297325a-9ffc-4765-963f-f0d285721ac0', 'f2851799-134d-4677-9bf7-1490a1e98262', 2, 'Thallus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('469163a8-68c8-4727-9d50-956d9a92b87e', 'f2851799-134d-4677-9bf7-1490a1e98262', 3, 'Rhizoids');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f2851799-134d-4677-9bf7-1490a1e98262', '19e5fb8b-77f1-43d0-9725-a745b84ab54d', 'Sori are clusters of sporangia found on the underside (or margins) of fern fronds, often covered by a protective flap called the indusium, where meiosis produces the haploid spores.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a4cc7b04-8a63-401a-a3ce-a4896b445810', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 116, 'The corolla, one of the four floral whorls, is composed of individual units called:', 'Biology', 'Morphology of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d3e651a-4a94-4d92-baa6-f5a3051f7a1d', 'a4cc7b04-8a63-401a-a3ce-a4896b445810', 0, 'Sepals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a68712eb-ee48-4fac-91af-9db290c0a360', 'a4cc7b04-8a63-401a-a3ce-a4896b445810', 1, 'Petals, typically the most colourful whorl, attracting pollinators');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8dd1989d-05ed-4a72-ade7-da1d8a6ed949', 'a4cc7b04-8a63-401a-a3ce-a4896b445810', 2, 'Stamens');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18d9dd48-2b5d-4af2-96f2-4f7646d4cd80', 'a4cc7b04-8a63-401a-a3ce-a4896b445810', 3, 'Carpels');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a4cc7b04-8a63-401a-a3ce-a4896b445810', 'a68712eb-ee48-4fac-91af-9db290c0a360', 'The corolla consists of petals, usually the most conspicuous and colourful part of the flower, primarily functioning to attract pollinators (in insect-pollinated species).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f0f951cb-1db3-4288-9b45-ce6879132c03', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 117, 'Lenticels, small pore-like openings found on the bark of woody stems, primarily function for:', 'Biology', 'Anatomy of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b39a9133-8729-4674-9f4f-35eccf2cace4', 'f0f951cb-1db3-4288-9b45-ce6879132c03', 0, 'Water absorption from soil');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3e4013b-f7a5-4fd2-8042-ddfb50b6c14d', 'f0f951cb-1db3-4288-9b45-ce6879132c03', 1, 'Gaseous exchange between the internal stem tissues and the atmosphere, replacing the function of stomata once the epidermis is replaced by bark');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1ff9d74-9fd8-494a-b066-d1248a1f206e', 'f0f951cb-1db3-4288-9b45-ce6879132c03', 2, 'Light absorption for photosynthesis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ae4498c-258b-4ae1-bd5f-d463d6821601', 'f0f951cb-1db3-4288-9b45-ce6879132c03', 3, 'Attracting pollinators');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f0f951cb-1db3-4288-9b45-ce6879132c03', 'e3e4013b-f7a5-4fd2-8042-ddfb50b6c14d', 'As secondary growth replaces the epidermis with a periderm/bark that lacks stomata, lenticels develop as loosely packed regions allowing continued gas exchange between the living inner tissues and the atmosphere.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('dfc65d18-e951-4ab6-9878-35befb9273bb', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 118, 'Chloroplasts, the site of photosynthesis in plant cells, are described as semi-autonomous organelles because they contain:', 'Biology', 'Cell — The Unit of Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ebe9bf9-18d7-485e-a8cb-0ff2665a6354', 'dfc65d18-e951-4ab6-9878-35befb9273bb', 0, 'No genetic material of their own');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c7021b2-65e4-4177-902c-760d3bd6f29f', 'dfc65d18-e951-4ab6-9878-35befb9273bb', 1, 'Their own circular DNA and ribosomes, allowing limited independent protein synthesis and division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0676391a-b7f8-4e88-b363-a712a727e9ce', 'dfc65d18-e951-4ab6-9878-35befb9273bb', 2, 'Only proteins imported entirely from the nucleus, with no internal synthesis capacity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97c0a0fc-ba0e-4622-a886-90ae8646d04c', 'dfc65d18-e951-4ab6-9878-35befb9273bb', 3, 'A complete, self-sufficient genome requiring no nuclear genes at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dfc65d18-e951-4ab6-9878-35befb9273bb', '8c7021b2-65e4-4177-902c-760d3bd6f29f', 'Chloroplasts (like mitochondria) contain their own circular DNA and 70S ribosomes, enabling them to synthesize some of their own proteins and divide somewhat independently — though they still rely on many nuclear-encoded proteins, making them ''semi-autonomous'' rather than fully independent.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('63efed1d-befd-41e8-a64c-cbc96d195d1c', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 119, 'Amino acids, the building blocks of proteins, are characterized by having both an amino group and a carboxyl group attached to the same:', 'Biology', 'Biomolecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e508470c-2e01-4e87-9b77-7c46ea4b4206', '63efed1d-befd-41e8-a64c-cbc96d195d1c', 0, 'Nitrogen atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9bf7b4ae-3407-46d8-a6f0-983a6446ea71', '63efed1d-befd-41e8-a64c-cbc96d195d1c', 1, 'Alpha-carbon atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bed694f3-1197-46f7-b8f9-ba3c4d0a2953', '63efed1d-befd-41e8-a64c-cbc96d195d1c', 2, 'Oxygen atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2df1cfde-7723-411e-ac80-448095b592f4', '63efed1d-befd-41e8-a64c-cbc96d195d1c', 3, 'Sulfur atom');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('63efed1d-befd-41e8-a64c-cbc96d195d1c', '9bf7b4ae-3407-46d8-a6f0-983a6446ea71', 'In a standard amino acid, both the amino (-NH2) and carboxyl (-COOH) functional groups, along with a side chain (R group) and a hydrogen, are attached to a central alpha-carbon atom.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('869c3ce6-774d-4f45-a0c1-160685b9a966', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 120, 'The synaptonemal complex, a protein structure formed during meiosis, functions to:', 'Biology', 'Cell Cycle and Cell Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40f9516f-4966-437b-a6ae-9ad52992626f', '869c3ce6-774d-4f45-a0c1-160685b9a966', 0, 'Prevent any pairing between homologous chromosomes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f26b219b-43d9-4393-8f7d-9cc4ddbe8b80', '869c3ce6-774d-4f45-a0c1-160685b9a966', 1, 'Facilitate the close pairing (synapsis) of homologous chromosomes during prophase I, enabling crossing over');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79975f6c-a164-4102-85b8-af5d56f1ea34', '869c3ce6-774d-4f45-a0c1-160685b9a966', 2, 'Only appear during mitosis, not meiosis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3008ef01-d0cf-4fef-8c6e-e9864f6c5223', '869c3ce6-774d-4f45-a0c1-160685b9a966', 3, 'Break down all chromosomes into individual genes');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('869c3ce6-774d-4f45-a0c1-160685b9a966', 'f26b219b-43d9-4393-8f7d-9cc4ddbe8b80', 'The synaptonemal complex is a protein scaffold that forms between paired homologous chromosomes during the pachytene stage of prophase I in meiosis, holding them in close alignment and facilitating the crossing-over process.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('247928ad-6077-400c-a6e0-fe50cc23c75c', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 121, 'CAM (Crassulacean Acid Metabolism) plants, adapted to arid environments, typically open their stomata for gas exchange during the:', 'Biology', 'Photosynthesis in Higher Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c995135-47f5-4bb1-a177-c34fba02528d', '247928ad-6077-400c-a6e0-fe50cc23c75c', 0, 'Day, same as most plants, to maximize photosynthesis under bright light');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3733d73a-b830-4204-99fd-bef889bfc8d1', '247928ad-6077-400c-a6e0-fe50cc23c75c', 1, 'Night, minimizing water loss during the hot, dry daytime while still fixing CO2 for later use in photosynthesis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21aee792-8c10-4129-87e1-b3c92287bf22', '247928ad-6077-400c-a6e0-fe50cc23c75c', 2, 'Neither day nor night; CAM plants have no stomata');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fad9ce60-c830-4a77-a6dc-810095f786a1', '247928ad-6077-400c-a6e0-fe50cc23c75c', 3, 'Only during rainfall events');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('247928ad-6077-400c-a6e0-fe50cc23c75c', '3733d73a-b830-4204-99fd-bef889bfc8d1', 'CAM plants (e.g., cacti, pineapple) open their stomata at night to take up and fix CO2 (stored as an organic acid), then close them during the hot day to conserve water, using the stored carbon for the light-dependent Calvin cycle reactions during daylight — a key water-conservation adaptation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e8e44569-287f-4065-b345-2c729d37cb19', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 122, 'The overall balanced equation for aerobic respiration of glucose can be summarized as:', 'Biology', 'Respiration in Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fac00dc2-b940-466b-91d6-78f5ffa3a79d', 'e8e44569-287f-4065-b345-2c729d37cb19', 0, '6CO2 + 6H2O -> C6H12O6 + 6O2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee46d0ce-5c59-45a4-963e-d51350196e38', 'e8e44569-287f-4065-b345-2c729d37cb19', 1, 'C6H12O6 + 6O2 -> 6CO2 + 6H2O + energy (ATP)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f23e456-8fd5-4ca5-ab38-e0c7d3f4aef0', 'e8e44569-287f-4065-b345-2c729d37cb19', 2, 'C6H12O6 -> 2C2H5OH + 2CO2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99675d51-5feb-49ff-98ed-ec995e0cf4a3', 'e8e44569-287f-4065-b345-2c729d37cb19', 3, '6CO2 + 12H2O -> C6H12O6 + 6O2 + 6H2O');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e8e44569-287f-4065-b345-2c729d37cb19', 'ee46d0ce-5c59-45a4-963e-d51350196e38', 'Aerobic respiration is essentially the reverse of photosynthesis at the overall equation level: glucose plus oxygen yields carbon dioxide, water, and released energy (captured largely as ATP).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d4f8afa7-e240-4f90-93f5-05f9d56a5e5b', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 123, 'Seed dormancy, a state in which a viable seed fails to germinate even under favorable conditions, can serve the ecological function of:', 'Biology', 'Plant Growth and Development');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85e376ab-8033-4b4a-b1c5-9cb1330272eb', 'd4f8afa7-e240-4f90-93f5-05f9d56a5e5b', 0, 'Immediately germinating the seed regardless of season');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79a84ebe-46d2-4dcc-b992-0a0f393ab336', 'd4f8afa7-e240-4f90-93f5-05f9d56a5e5b', 1, 'Ensuring germination is delayed until environmental conditions (season, moisture) are truly favorable for seedling survival');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66791248-bb30-46c8-97fa-774849b8b3d2', 'd4f8afa7-e240-4f90-93f5-05f9d56a5e5b', 2, 'Permanently preventing the seed from ever germinating');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('15a29676-816e-4003-8ae2-324a881bb0d0', 'd4f8afa7-e240-4f90-93f5-05f9d56a5e5b', 3, 'Reducing the seed''s viability to zero');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d4f8afa7-e240-4f90-93f5-05f9d56a5e5b', '79a84ebe-46d2-4dcc-b992-0a0f393ab336', 'Seed dormancy is an adaptive mechanism preventing premature germination, ensuring seeds germinate only when environmental cues (adequate moisture, appropriate temperature/season, sufficient light) signal favorable conditions for seedling establishment and survival.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e654263f-e5ac-46c7-bdc0-dcdd6da53abf', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 124, 'The synergid cells, part of the egg apparatus within the embryo sac, are thought to play a role in:', 'Biology', 'Sexual Reproduction in Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e393c1ef-5b87-46d0-b5ed-a6fecfe2e785', 'e654263f-e5ac-46c7-bdc0-dcdd6da53abf', 0, 'Producing pollen grains');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca057f7d-2026-46a5-bfdd-365562b7f916', 'e654263f-e5ac-46c7-bdc0-dcdd6da53abf', 1, 'Guiding the growing pollen tube toward the egg apparatus and facilitating discharge of the male gametes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f041c02a-6ac1-48e8-8c23-b69bf6cd305e', 'e654263f-e5ac-46c7-bdc0-dcdd6da53abf', 2, 'Forming the seed coat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0326a89-0eb8-4b37-8132-f68ac2809915', 'e654263f-e5ac-46c7-bdc0-dcdd6da53abf', 3, 'Photosynthesis within the ovule');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e654263f-e5ac-46c7-bdc0-dcdd6da53abf', 'ca057f7d-2026-46a5-bfdd-365562b7f916', 'The two synergid cells flanking the egg cell in the mature embryo sac are believed to secrete chemical signals that guide the growing pollen tube toward the embryo sac, and one synergid typically degenerates to receive the pollen tube''s discharge of male gametes.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('24c096d0-e445-4c76-ac52-7c846c1e573f', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 125, 'Polygenic inheritance, as seen in traits like human skin color or height, involves:', 'Biology', 'Principles of Inheritance and Variation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6df19507-ce17-49c3-a0bb-9d4a02cf0a0d', '24c096d0-e445-4c76-ac52-7c846c1e573f', 0, 'A single gene with complete dominance determining the entire phenotype');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47bb5bb9-0775-45b1-8d00-f223b7f94890', '24c096d0-e445-4c76-ac52-7c846c1e573f', 1, 'Multiple genes, each contributing a small additive effect, together producing a continuous range of phenotypic variation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b977e31b-07e6-4814-ad9f-239828a76082', '24c096d0-e445-4c76-ac52-7c846c1e573f', 2, 'No genetic contribution at all, purely environmental');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b43be2dc-fea5-4f3c-b9ce-fee0ed1ba817', '24c096d0-e445-4c76-ac52-7c846c1e573f', 3, 'A single gene showing simple recessive inheritance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('24c096d0-e445-4c76-ac52-7c846c1e573f', '47bb5bb9-0775-45b1-8d00-f223b7f94890', 'Polygenic traits are controlled by the combined additive effects of multiple genes (each often with a relatively small individual effect), producing a continuous, often bell-curve-shaped distribution of phenotypes in a population, rather than the discrete categories seen in simple Mendelian traits.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('572ef81e-8afc-4e41-b11f-3c291c88c9fe', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 126, 'Exons, in the structure of a eukaryotic gene, refer to the sequences that:', 'Biology', 'Molecular Basis of Inheritance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cacfded5-11c6-42ef-b882-d9e5d53d1a06', '572ef81e-8afc-4e41-b11f-3c291c88c9fe', 0, 'Are removed during RNA splicing and do not code for the final protein');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1ae88e2-1b77-457f-8311-4984750fe3d9', '572ef81e-8afc-4e41-b11f-3c291c88c9fe', 1, 'Are retained in the mature mRNA after splicing and are actually translated into protein (or are part of coding mRNA)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8cc9f291-8b51-4ff4-bd12-3dbd634cfa36', '572ef81e-8afc-4e41-b11f-3c291c88c9fe', 2, 'Are found only in prokaryotic genes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91d9c3da-9b23-46ab-9eec-69dbaac19bea', '572ef81e-8afc-4e41-b11f-3c291c88c9fe', 3, 'Never appear in the primary RNA transcript at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('572ef81e-8afc-4e41-b11f-3c291c88c9fe', 'c1ae88e2-1b77-457f-8311-4984750fe3d9', 'Exons are the coding (expressed) sequences of a gene that are retained in the mature mRNA after the removal of introns (non-coding intervening sequences) during RNA splicing, ultimately being translated into the protein product.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b1423a1e-7382-42cc-8bc6-9b52b025d272', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 127, 'The concept of ''survival of the fittest,'' often associated with Darwin''s theory, refers to the idea that:', 'Biology', 'Evolution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5df6fe40-5e46-4ff8-9aef-6060c18b0ae4', 'b1423a1e-7382-42cc-8bc6-9b52b025d272', 0, 'Only the physically strongest individuals in a population ever survive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9cca8dc7-37a2-49b6-a9f8-f2d0eaec510a', 'b1423a1e-7382-42cc-8bc6-9b52b025d272', 1, 'Individuals best adapted to their specific environment tend to survive and reproduce more successfully, passing on their heritable traits');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dba599e9-de67-48e7-a9d5-a9e3524164cb', 'b1423a1e-7382-42cc-8bc6-9b52b025d272', 2, 'All individuals in a population have exactly equal chances of survival regardless of traits');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('56568fba-3cb8-49cc-a0b4-d91de787e573', 'b1423a1e-7382-42cc-8bc6-9b52b025d272', 3, 'Fitness refers only to physical strength, unrelated to reproductive success');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b1423a1e-7382-42cc-8bc6-9b52b025d272', '9cca8dc7-37a2-49b6-a9f8-f2d0eaec510a', '''Fitness'' in an evolutionary sense refers to an organism''s reproductive success relative to others in the population, tied to how well its heritable traits suit it to its particular environment — not necessarily physical strength or size.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('de38f41e-e2cf-4d9a-b20e-897196186756', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 128, 'Mutation breeding, a technique for crop improvement, involves:', 'Biology', 'Strategies for Enhancement in Food Production');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53c942da-bc55-416e-bf59-7444bcc967c3', 'de38f41e-e2cf-4d9a-b20e-897196186756', 0, 'Crossing two different plant varieties conventionally');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ed8046c-f995-4a94-91d2-6faf5f95cf05', 'de38f41e-e2cf-4d9a-b20e-897196186756', 1, 'Inducing mutations artificially (e.g., via chemicals or radiation) in plant material to generate new, potentially useful genetic variation for selection');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98292f27-b3d4-4e60-bd49-55864f8bfe02', 'de38f41e-e2cf-4d9a-b20e-897196186756', 2, 'Only using naturally occurring mutations with no artificial induction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64dfb965-5755-453b-a759-5dd09bded84a', 'de38f41e-e2cf-4d9a-b20e-897196186756', 3, 'Cloning an already superior plant variety with no genetic change');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('de38f41e-e2cf-4d9a-b20e-897196186756', '8ed8046c-f995-4a94-91d2-6faf5f95cf05', 'Mutation breeding deliberately exposes plant material to mutagens (radiation or chemical agents) to induce novel genetic variations, from which breeders can then select individuals with desirable new traits not present in the original population.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('58c413f0-bbf6-4612-b12a-18827dfe64f1', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 129, 'Sewage treatment plants use microorganisms in the secondary (biological) treatment stage primarily to:', 'Biology', 'Microbes in Human Welfare');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e750e6e-4fe3-4392-8a91-6ed2b96b4687', '58c413f0-bbf6-4612-b12a-18827dfe64f1', 0, 'Add color to the treated water');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f2a8065-e49b-47c4-873f-adcea52f751a', '58c413f0-bbf6-4612-b12a-18827dfe64f1', 1, 'Break down and reduce the organic matter/biological oxygen demand (BOD) content of sewage through microbial degradation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e9c6602-2543-4ee7-a06c-2caa18cc9c9a', '58c413f0-bbf6-4612-b12a-18827dfe64f1', 2, 'Increase the sewage''s BOD before final release');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a142e8e7-677c-40fe-9488-66fe12ba48db', '58c413f0-bbf6-4612-b12a-18827dfe64f1', 3, 'Filter out only large solid debris, a purely physical process');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('58c413f0-bbf6-4612-b12a-18827dfe64f1', '6f2a8065-e49b-47c4-873f-adcea52f751a', 'Secondary sewage treatment relies on aerobic microorganisms (in activated sludge or similar processes) to consume and break down dissolved/suspended organic matter, significantly reducing the sewage''s biological oxygen demand (BOD) before the treated water is released or further processed.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a8e35d80-ce00-48ae-b732-f0c0c61f7abd', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 130, 'The blunt ends or sticky ends generated by different restriction enzymes when cutting DNA refer to:', 'Biology', 'Biotechnology — Principles and Processes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f62ba73c-9dd5-4fff-a660-6125598334ef', 'a8e35d80-ce00-48ae-b732-f0c0c61f7abd', 0, 'Whether the cut produces single-stranded overhangs (sticky ends) or a flush double-stranded cut (blunt ends)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8477faae-8495-4dec-bcf4-03486b1b9189', 'a8e35d80-ce00-48ae-b732-f0c0c61f7abd', 1, 'The color of the resulting DNA fragments');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d67d5d5-8961-4a49-8125-e22904cba7f7', 'a8e35d80-ce00-48ae-b732-f0c0c61f7abd', 2, 'Whether the DNA fragment is circular or linear');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0a6f251-d4ff-4bec-b0e4-016f019661e7', 'a8e35d80-ce00-48ae-b732-f0c0c61f7abd', 3, 'The temperature at which the enzyme was used');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a8e35d80-ce00-48ae-b732-f0c0c61f7abd', 'f62ba73c-9dd5-4fff-a660-6125598334ef', 'Restriction enzymes that cut both DNA strands at the exact same position produce ''blunt ends,'' while those that cut at staggered positions leave short single-stranded overhangs called ''sticky ends'' — sticky ends are often preferred in cloning since they can base-pair with complementary sticky ends on other DNA fragments.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ca8d006b-8903-4189-97af-baa06d5f8802', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 131, 'Natality (birth rate) and mortality (death rate) are two key parameters, along with immigration and emigration, that together determine changes in:', 'Biology', 'Organisms and Populations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('096e8f44-a95f-42d4-99a8-452324016f02', 'ca8d006b-8903-4189-97af-baa06d5f8802', 0, 'The genetic diversity of a single organism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb3c782f-1582-4af3-be9e-6238e86b1529', 'ca8d006b-8903-4189-97af-baa06d5f8802', 1, 'Population size over time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53c3a939-7d11-43ca-a524-626757f81d99', 'ca8d006b-8903-4189-97af-baa06d5f8802', 2, 'The metabolic rate of an individual organism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ac72d9c-c298-4fed-9cd0-53c5d6e464b9', 'ca8d006b-8903-4189-97af-baa06d5f8802', 3, 'The taxonomic classification of a species');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ca8d006b-8903-4189-97af-baa06d5f8802', 'cb3c782f-1582-4af3-be9e-6238e86b1529', 'Population size at any time is governed by the balance of births (natality) and deaths (mortality) within the population, along with immigration (individuals entering) and emigration (individuals leaving) — the four fundamental parameters of population dynamics.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e6c11fd3-696b-4a99-bceb-baa7f95de889', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 132, 'Detritivores, organisms that feed on partially decomposed organic matter, differ from decomposers (like bacteria and fungi) primarily in that detritivores:', 'Biology', 'Ecosystem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('904ec924-c4d1-4e3c-9d12-dcee31558658', 'e6c11fd3-696b-4a99-bceb-baa7f95de889', 0, 'Break down organic matter using extracellular enzymes secreted into the environment, exactly like bacteria and fungi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3e0bfbf-f69f-486f-bc4a-52c49c8a4d0c', 'e6c11fd3-696b-4a99-bceb-baa7f95de889', 1, 'Physically ingest detritus, breaking it down internally, rather than secreting extracellular enzymes onto it');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('419f1457-385d-485f-941d-e38b6ef82fb7', 'e6c11fd3-696b-4a99-bceb-baa7f95de889', 2, 'Are always plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba5d181e-24d2-4f21-be77-da813394e7b7', 'e6c11fd3-696b-4a99-bceb-baa7f95de889', 3, 'Do not participate in the decomposition process at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e6c11fd3-696b-4a99-bceb-baa7f95de889', 'a3e0bfbf-f69f-486f-bc4a-52c49c8a4d0c', 'Detritivores (e.g., earthworms, some insects, millipedes) physically ingest fragmented organic matter and digest it internally within their gut, whereas true decomposers (bacteria, fungi) typically secrete digestive enzymes externally onto organic matter and absorb the resulting simpler molecules.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('dce79322-c5e8-48e1-81b1-4465199f20ab', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 133, 'Heartwood and sapwood, both regions of secondary xylem in an old tree trunk, differ in that heartwood is:', 'Biology', 'Anatomy of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b77fb8c-e8d6-4f2d-94f0-296deae6a0e8', 'dce79322-c5e8-48e1-81b1-4465199f20ab', 0, 'The outer, functionally active water-conducting region');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1c921fb-afd3-4991-abcb-f41d72e92fd5', 'dce79322-c5e8-48e1-81b1-4465199f20ab', 1, 'The inner, older wood that has become non-functional in water conduction (often infused with tannins/resins), providing mainly mechanical support');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23e37d35-dfa1-4466-b165-da603a4521c1', 'dce79322-c5e8-48e1-81b1-4465199f20ab', 2, 'Composed entirely of phloem tissue');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81bbc162-18b6-4838-8a74-f1344ccb0e31', 'dce79322-c5e8-48e1-81b1-4465199f20ab', 3, 'Only present in monocot stems');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dce79322-c5e8-48e1-81b1-4465199f20ab', 'd1c921fb-afd3-4991-abcb-f41d72e92fd5', 'Heartwood is the older, central wood of a tree trunk that has become clogged (with tyloses, resins, tannins) and no longer conducts water, serving mainly a structural/mechanical role; sapwood, the outer, younger wood, remains functional in water and mineral conduction.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('441c6713-7e7f-4524-81ce-e2b1bb6e28c3', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 134, 'The central vacuole, a large organelle prominent in mature plant cells, primarily functions to:', 'Biology', 'Cell — The Unit of Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21243502-33b7-4dc0-ace6-d31e0adc8688', '441c6713-7e7f-4524-81ce-e2b1bb6e28c3', 0, 'Synthesize proteins');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db57e807-b115-4ce2-b4d8-d68cb8915777', '441c6713-7e7f-4524-81ce-e2b1bb6e28c3', 1, 'Maintain turgor pressure (cell rigidity) by storing water and dissolved substances, and to sequester waste products');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ecad30f-db1a-4cca-a542-8f03b137164b', '441c6713-7e7f-4524-81ce-e2b1bb6e28c3', 2, 'Produce ATP through cellular respiration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86fc04b1-3eb0-4fd8-80b1-c048c74e90e5', '441c6713-7e7f-4524-81ce-e2b1bb6e28c3', 3, 'Replicate the cell''s DNA');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('441c6713-7e7f-4524-81ce-e2b1bb6e28c3', 'db57e807-b115-4ce2-b4d8-d68cb8915777', 'The large central vacuole in mature plant cells stores water, ions, and metabolites, generating turgor pressure that maintains cell rigidity and supports the overall plant structure, and also serves as a storage site for pigments and waste products.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('cb591031-8643-4bd8-9313-8364a99d35ba', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 135, 'The ''triple response'' in etiolated (dark-grown) pea seedlings — reduced stem elongation, increased stem thickening, and horizontal growth — is a classic bioassay used to detect the presence of:', 'Biology', 'Plant Growth and Development');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73623dc5-9cfa-427c-bb56-c99693c6feb1', 'cb591031-8643-4bd8-9313-8364a99d35ba', 0, 'Auxin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21d1354a-ce8b-40e0-b295-cd6c3a1d5cd4', 'cb591031-8643-4bd8-9313-8364a99d35ba', 1, 'Ethylene');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eafab6c4-7d5b-4107-a7f3-202afe876ee3', 'cb591031-8643-4bd8-9313-8364a99d35ba', 2, 'Cytokinin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1377b4f6-3ea9-460e-9642-1a4a267647ef', 'cb591031-8643-4bd8-9313-8364a99d35ba', 3, 'Abscisic acid');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cb591031-8643-4bd8-9313-8364a99d35ba', '21d1354a-ce8b-40e0-b295-cd6c3a1d5cd4', 'The characteristic ''triple response'' (inhibited elongation, radial swelling, and horizontal/diageotropic growth) in dark-grown pea seedlings is a classic, sensitive bioassay historically used to detect and quantify ethylene.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('cb993eb4-5ee2-4321-9495-52a025348228', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 136, 'Phylum Cnidaria (e.g., Hydra, jellyfish) is characterized by the presence of specialized stinging cells called:', 'Biology', 'Animal Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e7f96ca-2f86-48ea-9c0e-d521b1a387a1', 'cb993eb4-5ee2-4321-9495-52a025348228', 0, 'Choanocytes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca77e0ce-6dcb-4d24-8ac9-fb263eca66c8', 'cb993eb4-5ee2-4321-9495-52a025348228', 1, 'Cnidoblasts (nematocysts), used for defense and capturing prey');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc7c2923-561a-4226-9ac1-1fe399e7d1d1', 'cb993eb4-5ee2-4321-9495-52a025348228', 2, 'Flame cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68c5f7fb-aa3a-40c1-8d6d-346a1bed29bb', 'cb993eb4-5ee2-4321-9495-52a025348228', 3, 'Nephridia');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cb993eb4-5ee2-4321-9495-52a025348228', 'ca77e0ce-6dcb-4d24-8ac9-fb263eca66c8', 'Cnidarians possess unique stinging cells (cnidoblasts) containing nematocysts, specialized organelles that discharge a thread capable of injecting toxins, used primarily for capturing prey and defense.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4ccc4c9a-336c-41ec-8fa1-a1fffdf551cb', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 137, 'Class Reptilia is generally distinguished by having:', 'Biology', 'Animal Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b342483-3506-457a-90af-3c666a22bc59', '4ccc4c9a-336c-41ec-8fa1-a1fffdf551cb', 0, 'Moist, glandular skin lacking scales');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cf6a972-2194-4b2d-9a30-539b3d28b3a6', '4ccc4c9a-336c-41ec-8fa1-a1fffdf551cb', 1, 'Dry skin covered with epidermal scales, and are typically ectothermic (cold-blooded)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6a9ec91-21e1-4132-9313-f968c7d3ead0', '4ccc4c9a-336c-41ec-8fa1-a1fffdf551cb', 2, 'Feathers covering the entire body');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69cb0a23-acc7-4415-a4c5-02748d6edd01', '4ccc4c9a-336c-41ec-8fa1-a1fffdf551cb', 3, 'Mammary glands for feeding young');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4ccc4c9a-336c-41ec-8fa1-a1fffdf551cb', '3cf6a972-2194-4b2d-9a30-539b3d28b3a6', 'Reptiles typically have dry, scaly skin (reducing water loss, an adaptation to terrestrial life) and are ectothermic, relying on external sources to regulate body temperature, unlike the endothermic birds and mammals.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2d60d3ad-7658-4735-8027-c1dbfc81f728', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 138, 'Compound epithelium, made of multiple layers of cells, is best suited to its role of:', 'Biology', 'Structural Organisation in Animals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d9f0589-ada2-4072-9efa-c3633807cad2', '2d60d3ad-7658-4735-8027-c1dbfc81f728', 0, 'Rapid diffusion of gases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('52d70d03-f62f-4989-9823-442915e02bce', '2d60d3ad-7658-4735-8027-c1dbfc81f728', 1, 'Providing protection against mechanical and chemical stress, as found in the skin''s epidermis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1fbf329c-c049-46a4-a2b1-fc1be680d1d9', '2d60d3ad-7658-4735-8027-c1dbfc81f728', 2, 'Secretion of large volumes of mucus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70de07e1-3df3-4314-9603-fac764340d1c', '2d60d3ad-7658-4735-8027-c1dbfc81f728', 3, 'Absorption of nutrients in the intestine');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2d60d3ad-7658-4735-8027-c1dbfc81f728', '52d70d03-f62f-4989-9823-442915e02bce', 'Compound (stratified) epithelium''s multiple cell layers provide strong protection against wear, abrasion, and chemical damage, which is why it lines surfaces like the skin''s outer epidermis subject to considerable mechanical stress.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('cefddea3-ee5f-4e59-a004-cd8bc14c967c', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 139, 'The lung disorder emphysema is characterized by:', 'Biology', 'Breathing and Exchange of Gases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f338ff49-bcf4-41d8-9a66-a74d98ec5828', 'cefddea3-ee5f-4e59-a004-cd8bc14c967c', 0, 'Excess mucus production with no structural damage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c91240f-fd95-4a40-8c5c-48645745251d', 'cefddea3-ee5f-4e59-a004-cd8bc14c967c', 1, 'Permanent destructive enlargement of the alveolar air spaces, reducing the surface area available for gas exchange');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('880e65a1-2e20-4ec9-9592-b48f36338a3e', 'cefddea3-ee5f-4e59-a004-cd8bc14c967c', 2, 'Complete blockage of the trachea only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1c6546a-5214-4b97-9a31-84d73a8090a6', 'cefddea3-ee5f-4e59-a004-cd8bc14c967c', 3, 'Increased elasticity of lung tissue');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cefddea3-ee5f-4e59-a004-cd8bc14c967c', '6c91240f-fd95-4a40-8c5c-48645745251d', 'Emphysema involves irreversible destruction of alveolar walls, merging smaller air sacs into larger, less efficient spaces and drastically reducing the total surface area available for gas exchange, often associated with long-term smoking.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7202890b-ee47-46d1-b900-b3fbcf952464', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 140, 'The double circulation system found in mammals, where blood passes through the heart twice per complete circuit, ensures:', 'Biology', 'Body Fluids and Circulation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9491898a-7f21-484e-8546-38322f87e96a', '7202890b-ee47-46d1-b900-b3fbcf952464', 0, 'Mixing of oxygenated and deoxygenated blood for efficiency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6c4ba72d-2913-4a71-8f1a-3a1c04cf5ea4', '7202890b-ee47-46d1-b900-b3fbcf952464', 1, 'Complete separation of oxygenated and deoxygenated blood, maintaining higher blood pressure and more efficient oxygen delivery to tissues');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc5cf28c-f022-4a77-9b4b-f156fadc7673', '7202890b-ee47-46d1-b900-b3fbcf952464', 2, 'Blood only passes through the heart once per circuit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('055fbe4e-450b-429b-865e-b78a1ac26e05', '7202890b-ee47-46d1-b900-b3fbcf952464', 3, 'The heart pumps blood directly to the lungs and body simultaneously through a single chamber');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7202890b-ee47-46d1-b900-b3fbcf952464', '6c4ba72d-2913-4a71-8f1a-3a1c04cf5ea4', 'In mammals'' double circulation (systemic and pulmonary circuits, each passing through the heart), the four-chambered heart keeps oxygenated and deoxygenated blood completely separate, allowing higher, more efficient oxygen delivery to body tissues compared to animals with incomplete separation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ba343153-379f-4c93-8fb1-7b8eeaf9bd63', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 141, 'The glomerular filtration rate (GFR) refers to:', 'Biology', 'Excretory Products and Their Elimination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef5eaea6-e938-44a9-b610-6f71e2706936', 'ba343153-379f-4c93-8fb1-7b8eeaf9bd63', 0, 'The volume of urine excreted per day');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77cbc45d-bfca-40db-908b-227744b0d6e6', 'ba343153-379f-4c93-8fb1-7b8eeaf9bd63', 1, 'The volume of filtrate formed by the kidneys (both together) per minute');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('22d0f49d-0d54-4687-a1d6-7669073163d1', 'ba343153-379f-4c93-8fb1-7b8eeaf9bd63', 2, 'The concentration of glucose in urine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('081b91d2-fad2-4a41-ae33-37ab7116e73b', 'ba343153-379f-4c93-8fb1-7b8eeaf9bd63', 3, 'The rate of blood flow through the renal vein only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ba343153-379f-4c93-8fb1-7b8eeaf9bd63', '77cbc45d-bfca-40db-908b-227744b0d6e6', 'GFR is the total volume of glomerular filtrate formed by both kidneys per minute (normally around 125 mL/min in humans), an important clinical indicator of overall kidney function.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('89df8b57-8143-4f11-873a-3ce394c202a9', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 142, 'A ball-and-socket joint like the hip joint permits movement in how many planes/directions, compared to a hinge joint like the knee?', 'Biology', 'Locomotion and Movement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('caab0d39-0541-44b0-a642-9bac97b15f38', '89df8b57-8143-4f11-873a-3ce394c202a9', 0, 'Fewer planes than a hinge joint');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1ce5358-a93a-45a5-8a94-14fd3878fea2', '89df8b57-8143-4f11-873a-3ce394c202a9', 1, 'Multiple planes (flexion, extension, abduction, adduction, rotation), more than the single-plane movement of a hinge joint');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfd5120c-5ea8-4597-80de-132efdf81bfe', '89df8b57-8143-4f11-873a-3ce394c202a9', 2, 'Exactly the same range of motion as a hinge joint');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8e28880-66b5-4c85-9247-1073e09ff3d9', '89df8b57-8143-4f11-873a-3ce394c202a9', 3, 'No movement at all; it is a fixed (fibrous) joint');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('89df8b57-8143-4f11-873a-3ce394c202a9', 'b1ce5358-a93a-45a5-8a94-14fd3878fea2', 'Ball-and-socket joints (hip, shoulder) allow multi-axial movement in several planes, including rotation, offering a much wider range of motion than hinge joints (knee, elbow), which are largely restricted to flexion and extension in a single plane.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('983a3bd8-6245-458a-99ba-37f6254085ac', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 143, 'The all-or-none principle, as applied to nerve impulse conduction, states that:', 'Biology', 'Neural Control and Coordination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a0fe236-ceb8-4456-aa46-8775c1628318', '983a3bd8-6245-458a-99ba-37f6254085ac', 0, 'A stimulus produces a response proportional to its strength, with graded impulse sizes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8463abe-ec4c-4e7c-9a78-2d3d79d756ce', '983a3bd8-6245-458a-99ba-37f6254085ac', 1, 'Once the stimulus reaches threshold, a nerve fibre generates a full-strength action potential regardless of any further increase in stimulus intensity above threshold');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4d4f5ed-b3fc-441f-8cfd-896272ff507d', '983a3bd8-6245-458a-99ba-37f6254085ac', 2, 'Below-threshold stimuli always produce a partial action potential');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b85064ca-885b-41bb-bdfc-aac7f16a2751', '983a3bd8-6245-458a-99ba-37f6254085ac', 3, 'The action potential''s amplitude increases with stronger stimuli');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('983a3bd8-6245-458a-99ba-37f6254085ac', 'e8463abe-ec4c-4e7c-9a78-2d3d79d756ce', 'The all-or-none law states that a neuron either fires a full-magnitude action potential (once threshold is reached) or does not fire at all — the action potential''s amplitude does not vary with stimulus strength above threshold; instead, stronger stimuli increase firing FREQUENCY, not individual impulse size.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b0bfb6de-dcc1-4ac0-90f6-e83f8262a3a2', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 144, 'Melatonin, secreted by the pineal gland, plays a key role in regulating:', 'Biology', 'Chemical Coordination and Integration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2cfd750-24e9-4e7e-ad2a-3ee08add2be5', 'b0bfb6de-dcc1-4ac0-90f6-e83f8262a3a2', 0, 'Blood clotting');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('354ec460-30ab-441b-825b-1a4bbebb14f7', 'b0bfb6de-dcc1-4ac0-90f6-e83f8262a3a2', 1, 'Circadian (day-night) rhythms and sleep-wake cycles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c6cf918-d9a9-4acd-988d-b6c2be4841cf', 'b0bfb6de-dcc1-4ac0-90f6-e83f8262a3a2', 2, 'Blood glucose levels');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('570bb4a6-fea8-42ac-8eca-299ca22a4c56', 'b0bfb6de-dcc1-4ac0-90f6-e83f8262a3a2', 3, 'Bone growth');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b0bfb6de-dcc1-4ac0-90f6-e83f8262a3a2', '354ec460-30ab-441b-825b-1a4bbebb14f7', 'Melatonin secretion by the pineal gland varies with the light-dark cycle (higher at night), helping regulate the body''s circadian rhythms and influence sleep-wake patterns.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('aa59add8-2208-4d71-91b9-2d3f9b8d58f8', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 145, 'The scrotum, a pouch of skin containing the testes, is positioned outside the main body cavity because:', 'Biology', 'Human Reproduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c2c640d-66b9-4b88-819f-050bc8f2f91a', 'aa59add8-2208-4d71-91b9-2d3f9b8d58f8', 0, 'It is purely a vestigial structure with no function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f22d5cd8-99aa-49c7-aec3-f6491ed9f566', 'aa59add8-2208-4d71-91b9-2d3f9b8d58f8', 1, 'Normal spermatogenesis requires a temperature slightly lower than core body temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('609d183c-5d24-46c0-a15c-b1e2694335b7', 'aa59add8-2208-4d71-91b9-2d3f9b8d58f8', 2, 'It helps regulate blood pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87f66112-44c5-4fda-b712-8c569b3f8840', 'aa59add8-2208-4d71-91b9-2d3f9b8d58f8', 3, 'It aids in digestion');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aa59add8-2208-4d71-91b9-2d3f9b8d58f8', 'f22d5cd8-99aa-49c7-aec3-f6491ed9f566', 'The scrotum''s external position keeps the testes about 2-3 degrees C cooler than core body temperature, a requirement for normal, efficient spermatogenesis — testes that fail to descend (cryptorchidism) typically show impaired sperm production.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('26f6ccd2-136d-474f-abcc-e76db79c8430', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 146, 'The zona pellucida, a glycoprotein layer surrounding the mammalian egg, plays a key role in:', 'Biology', 'Human Reproduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e248a41-c94c-453f-a774-7f435662f318', '26f6ccd2-136d-474f-abcc-e76db79c8430', 0, 'Providing energy to the egg');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('145874aa-da70-4a47-9d0d-716cd8650180', '26f6ccd2-136d-474f-abcc-e76db79c8430', 1, 'Species-specific recognition and binding of sperm during fertilization, and later preventing polyspermy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8d23fd1-0ac3-4d7a-9489-cfa763cda08c', '26f6ccd2-136d-474f-abcc-e76db79c8430', 2, 'Transporting the egg through the fallopian tube');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3fef82ab-dda2-481b-a9c9-879df915b1aa', '26f6ccd2-136d-474f-abcc-e76db79c8430', 3, 'Producing progesterone');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('26f6ccd2-136d-474f-abcc-e76db79c8430', '145874aa-da70-4a47-9d0d-716cd8650180', 'The zona pellucida mediates species-specific sperm-egg recognition/binding, and after one sperm successfully fertilizes the egg, undergoes a ''zona reaction'' that hardens it, blocking additional sperm from penetrating (preventing polyspermy).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b30a8eb9-3663-4d46-9540-4526efe20e0c', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 147, 'Medical Termination of Pregnancy (MTP), where legally and medically permissible, is generally considered safer when performed:', 'Biology', 'Reproductive Health');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f2427ca-50e2-4047-9f70-adcd8805b61c', 'b30a8eb9-3663-4d46-9540-4526efe20e0c', 0, 'At any stage of pregnancy with equal safety');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27060351-f3dc-4c52-8799-ca2792cbbe55', 'b30a8eb9-3663-4d46-9540-4526efe20e0c', 1, 'During the earlier stages of pregnancy (first trimester) rather than later');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8dae5c0-a6d6-4346-92bc-8aa5fb4e00e0', 'b30a8eb9-3663-4d46-9540-4526efe20e0c', 2, 'Only after full-term delivery');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f612931-b829-4220-8f3e-c2cfc667e2a0', 'b30a8eb9-3663-4d46-9540-4526efe20e0c', 3, 'Without any medical supervision');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b30a8eb9-3663-4d46-9540-4526efe20e0c', '27060351-f3dc-4c52-8799-ca2792cbbe55', 'MTP procedures carry progressively higher medical risk as pregnancy advances; performing the procedure during the first trimester (within the legally permitted early window) is generally associated with fewer complications than later-stage termination.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8e09e621-4da9-4f7c-b4c9-f9339c325ac1', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 148, 'Allergies, such as hay fever, are caused by an exaggerated immune response of the body to certain:', 'Biology', 'Human Health and Disease');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01f2ed5d-99e0-4c02-9fb7-ad89da344eb2', '8e09e621-4da9-4f7c-b4c9-f9339c325ac1', 0, 'Self-antigens present on the body''s own cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02016b6b-a20c-4b4f-be4c-31ade9be032c', '8e09e621-4da9-4f7c-b4c9-f9339c325ac1', 1, 'Otherwise harmless environmental substances (allergens), such as pollen or dust, mediated largely by IgE antibodies');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb09fe2d-4040-4a46-ae20-3354aababcfa', '8e09e621-4da9-4f7c-b4c9-f9339c325ac1', 2, 'Bacterial toxins exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fdd52196-4726-466c-8daa-71a52c4fe770', '8e09e621-4da9-4f7c-b4c9-f9339c325ac1', 3, 'Genetic mutations with no external trigger');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8e09e621-4da9-4f7c-b4c9-f9339c325ac1', '02016b6b-a20c-4b4f-be4c-31ade9be032c', 'Allergic reactions occur when the immune system mounts an exaggerated response (largely mediated by IgE antibodies binding to mast cells) against normally harmless environmental substances (allergens) like pollen, dust mites, or certain foods.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e73abe85-2763-4580-994e-27815cf5b405', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 149, 'Amoebiasis, an intestinal infection, is caused by the protozoan parasite:', 'Biology', 'Human Health and Disease');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('713d5e7a-3104-4e19-901e-62552e572b24', 'e73abe85-2763-4580-994e-27815cf5b405', 0, 'Plasmodium vivax');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a3f810f-690a-4cbf-ba54-24ee4828e155', 'e73abe85-2763-4580-994e-27815cf5b405', 1, 'Entamoeba histolytica');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c7cad2c-db67-4e10-b0f3-5ff9088111f7', 'e73abe85-2763-4580-994e-27815cf5b405', 2, 'Trypanosoma');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e08b228-a451-4a33-bb2e-0ac6ee01209d', 'e73abe85-2763-4580-994e-27815cf5b405', 3, 'Giardia lamblia');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e73abe85-2763-4580-994e-27815cf5b405', '0a3f810f-690a-4cbf-ba54-24ee4828e155', 'Amoebiasis (amoebic dysentery) is caused by the protozoan Entamoeba histolytica, typically transmitted via contaminated food or water, causing intestinal ulceration and, in severe cases, extraintestinal complications like liver abscess.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5ebf4370-360d-4b1e-ad72-9879b1c82f5a', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 150, 'In organisms exhibiting internal fertilization (e.g., reptiles, birds, mammals), the fusion of gametes occurs:', 'Biology', 'Reproduction in Organisms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99ac5352-ed84-4cab-b802-a66b5d5ebf8a', '5ebf4370-360d-4b1e-ad72-9879b1c82f5a', 0, 'Outside the body, in the external environment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86763745-07c0-4986-9626-853c17231e0c', '5ebf4370-360d-4b1e-ad72-9879b1c82f5a', 1, 'Inside the body of the female organism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0e2d029-2f24-499f-9b65-a7b3d1d8857e', '5ebf4370-360d-4b1e-ad72-9879b1c82f5a', 2, 'Only in a laboratory setting');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd33de80-793c-48de-9c40-2b15d39dceff', '5ebf4370-360d-4b1e-ad72-9879b1c82f5a', 3, 'Simultaneously in both parent organisms'' bodies');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5ebf4370-360d-4b1e-ad72-9879b1c82f5a', '86763745-07c0-4986-9626-853c17231e0c', 'Internal fertilization occurs within the female''s reproductive tract, typically following copulation or specialized sperm transfer mechanisms, generally associated with production of fewer gametes but higher fertilization success and often greater parental investment/protection of offspring compared to external fertilization.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('41fee355-0b4c-4a91-a2a3-5c3caf9c0148', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 151, 'In birds, unlike in mammals, the sex-determining mechanism is generally described as the:', 'Biology', 'Genetics and Evolution — Sex Determination Systems');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a50ce785-65ca-4318-9c61-cc955b715214', '41fee355-0b4c-4a91-a2a3-5c3caf9c0148', 0, 'XY system, same as mammals, with males being heterogametic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2261bca4-a0d4-458f-be8b-5ea7068981c0', '41fee355-0b4c-4a91-a2a3-5c3caf9c0148', 1, 'ZW system, where the FEMALE is the heterogametic sex (ZW) and the male is homogametic (ZZ)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5dd99b0-b606-4093-91d3-e44a5badaa41', '41fee355-0b4c-4a91-a2a3-5c3caf9c0148', 2, 'Haplodiploidy, as seen in bees');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('704a0fe2-bce9-48ec-bab0-e6ec0648e783', '41fee355-0b4c-4a91-a2a3-5c3caf9c0148', 3, 'No genetic sex determination at all; it is purely environmental');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('41fee355-0b4c-4a91-a2a3-5c3caf9c0148', '2261bca4-a0d4-458f-be8b-5ea7068981c0', 'Birds use the ZW sex-determination system, the reverse of mammals'' XY system in terms of which sex is heterogametic: female birds are ZW (heterogametic) and males are ZZ (homogametic).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9bbc2fe5-4c36-4528-a3d5-34cc3694b27c', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 152, 'According to the Hardy-Weinberg equation p^2 + 2pq + q^2 = 1, the term ''2pq'' represents the expected frequency of:', 'Biology', 'Evolution — Population Genetics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e56d6ab9-03c6-4e45-9c92-74cb7da3c4d7', '9bbc2fe5-4c36-4528-a3d5-34cc3694b27c', 0, 'Homozygous dominant individuals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e878c010-65ce-4804-a8d3-d236fb8a4a01', '9bbc2fe5-4c36-4528-a3d5-34cc3694b27c', 1, 'Heterozygous individuals in the population');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f27e4ea5-1463-4db8-8cb7-abd733c4b330', '9bbc2fe5-4c36-4528-a3d5-34cc3694b27c', 2, 'Homozygous recessive individuals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81066997-7c27-4f32-923b-af411be22313', '9bbc2fe5-4c36-4528-a3d5-34cc3694b27c', 3, 'The total allele frequency');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9bbc2fe5-4c36-4528-a3d5-34cc3694b27c', 'e878c010-65ce-4804-a8d3-d236fb8a4a01', 'In the Hardy-Weinberg equation, p^2 represents homozygous dominant genotype frequency, q^2 represents homozygous recessive frequency, and 2pq represents the expected frequency of heterozygous individuals in a population at genetic equilibrium.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3bd2a6cb-592a-47cd-be34-1f8511181029', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 153, 'Stem cells are notable in biology and medicine primarily because of their unique ability to:', 'Biology', 'Biotechnology and Its Applications — Stem Cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7bab1fd-b9a6-47ce-ac51-e7a2f41150e5', '3bd2a6cb-592a-47cd-be34-1f8511181029', 0, 'Only ever differentiate into a single, fixed cell type');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8c21094-0101-4caf-8ce2-95dec90b60d5', '3bd2a6cb-592a-47cd-be34-1f8511181029', 1, 'Self-renew (divide to produce more stem cells) and differentiate into one or more specialized cell types');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35c51203-921a-4fe0-b9fe-e8d01ce07d11', '3bd2a6cb-592a-47cd-be34-1f8511181029', 2, 'Never divide once formed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48bdc4fb-afbb-45c4-9562-b7bc0a6500f9', '3bd2a6cb-592a-47cd-be34-1f8511181029', 3, 'Function only outside a living organism');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3bd2a6cb-592a-47cd-be34-1f8511181029', 'a8c21094-0101-4caf-8ce2-95dec90b60d5', 'Stem cells are defined by their dual capacity for self-renewal (continued division producing more stem cells) and potency — the ability to differentiate into one or more types of specialized cells, making them of major interest for regenerative medicine.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4717ef9e-fc46-485f-8c83-8e23c3437d94', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 154, 'Estivation, a state of dormancy in some animals, is best described as an adaptation to survive:', 'Biology', 'Organisms and Populations — Adaptations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('daa1bfc7-442b-42bb-a156-ad39dea0ccb1', '4717ef9e-fc46-485f-8c83-8e23c3437d94', 0, 'Extreme cold during winter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f59ab515-86af-45f7-8864-fbb06a5e9eac', '4717ef9e-fc46-485f-8c83-8e23c3437d94', 1, 'Extreme heat and dryness, typically during summer, by entering a dormant, low-metabolism state');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e848dc28-4692-48d0-b67e-cd45820fa25f', '4717ef9e-fc46-485f-8c83-8e23c3437d94', 2, 'High-altitude, low-oxygen environments only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02389704-2e99-4ea8-a49f-9f0449e8f1a0', '4717ef9e-fc46-485f-8c83-8e23c3437d94', 3, 'Excessive rainfall');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4717ef9e-fc46-485f-8c83-8e23c3437d94', 'f59ab515-86af-45f7-8864-fbb06a5e9eac', 'Estivation is a period of dormancy or torpor undertaken by some animals (e.g., certain snails, lungfish) to survive hot, dry conditions typically encountered during summer, involving a substantial reduction in metabolic activity to conserve resources.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4bad3f48-7802-45b2-b808-bf46d7328dbd', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 155, 'The phosphorus cycle differs notably from the carbon and nitrogen cycles in that it lacks a significant:', 'Biology', 'Ecosystem — Biogeochemical Cycles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89be0ceb-4d37-491e-a8b1-9ba4199554bb', '4bad3f48-7802-45b2-b808-bf46d7328dbd', 0, 'Sedimentary/rock reservoir component');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5d535553-e3cd-4f3d-8ef3-c5bdcddf8c8a', '4bad3f48-7802-45b2-b808-bf46d7328dbd', 1, 'Atmospheric gaseous phase, since phosphorus compounds are not typically found as gases at normal biological temperatures');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23aff4e0-92a4-4a44-87b1-a713962dfea5', '4bad3f48-7802-45b2-b808-bf46d7328dbd', 2, 'Biological component involving living organisms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72463b05-5d5e-42a3-a846-19c0113d14d3', '4bad3f48-7802-45b2-b808-bf46d7328dbd', 3, 'Role in forming nucleic acids and ATP');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4bad3f48-7802-45b2-b808-bf46d7328dbd', '5d535553-e3cd-4f3d-8ef3-c5bdcddf8c8a', 'Unlike carbon and nitrogen (which have significant atmospheric gas phases — CO2, N2), phosphorus cycles almost entirely through the lithosphere/hydrosphere and biological components, since phosphorus compounds are not normally found in a gaseous form under standard environmental conditions.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('506890ba-df13-47b1-a23b-b32cae647fe5', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 156, 'The Convention on Biological Diversity (CBD), an international treaty, primarily aims to promote:', 'Biology', 'Biodiversity and Conservation — Global Frameworks');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c557a80-3a75-40f5-af6d-2019773a3d97', '506890ba-df13-47b1-a23b-b32cae647fe5', 0, 'Unrestricted commercial exploitation of biological resources by any nation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab71c248-c2f8-4ee1-b031-bfab7d24dfbd', '506890ba-df13-47b1-a23b-b32cae647fe5', 1, 'The conservation of biological diversity, the sustainable use of its components, and fair/equitable sharing of benefits from genetic resources');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b87d3f54-b0cd-4c21-b83e-238754de4897', '506890ba-df13-47b1-a23b-b32cae647fe5', 2, 'Only the protection of a single named endangered species');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba99a76d-94b8-4ddf-864d-630bdf3e5286', '506890ba-df13-47b1-a23b-b32cae647fe5', 3, 'The complete prohibition of all international trade');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('506890ba-df13-47b1-a23b-b32cae647fe5', 'ab71c248-c2f8-4ee1-b031-bfab7d24dfbd', 'The CBD (adopted at the 1992 Rio Earth Summit) has three main objectives: conservation of biodiversity, sustainable use of its components, and fair and equitable sharing of benefits arising from the use of genetic resources.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('43b66fa5-b918-4415-b27f-c43a418bb284', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 157, 'Bile pigments, such as bilirubin, are produced primarily from the breakdown of:', 'Biology', 'Digestion and Absorption');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48de5137-3db3-4565-8cca-79b7d24f92a8', '43b66fa5-b918-4415-b27f-c43a418bb284', 0, 'Dietary carbohydrates');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1bc3f3bc-eace-4ee8-a1d8-1b45b3b2e7e2', '43b66fa5-b918-4415-b27f-c43a418bb284', 1, 'Haemoglobin, from the breakdown of old/damaged red blood cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f351f8e-0faf-4f6d-bfcb-903b927efa54', '43b66fa5-b918-4415-b27f-c43a418bb284', 2, 'Dietary fats');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb7d7844-d560-4e3a-835f-dd9a18251085', '43b66fa5-b918-4415-b27f-c43a418bb284', 3, 'Amino acids from protein digestion');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('43b66fa5-b918-4415-b27f-c43a418bb284', '1bc3f3bc-eace-4ee8-a1d8-1b45b3b2e7e2', 'Bilirubin, the major bile pigment, is a breakdown product of haemoglobin released from senescent or damaged red blood cells, processed by the liver and excreted in bile — its accumulation in blood causes the yellowish discoloration seen in jaundice.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('07afcb5c-01ac-4346-a5fa-39ca85fb88f0', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 158, 'Systolic blood pressure specifically refers to the arterial pressure recorded during:', 'Biology', 'Body Fluids and Circulation — Blood Pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8195682-d40f-4d54-a05e-a0986ea823b5', '07afcb5c-01ac-4346-a5fa-39ca85fb88f0', 0, 'Ventricular relaxation (diastole)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a0b406d-8077-429a-acc8-d5d6d746ec25', '07afcb5c-01ac-4346-a5fa-39ca85fb88f0', 1, 'Ventricular contraction, when blood is being actively pumped out of the heart into the arteries');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc3548a8-62f4-4718-8daa-0ee3ce2fbe31', '07afcb5c-01ac-4346-a5fa-39ca85fb88f0', 2, 'Atrial contraction only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f9b16dc-a8f0-4636-aa67-2cdddf1d70b2', '07afcb5c-01ac-4346-a5fa-39ca85fb88f0', 3, 'The complete cardiac pause between beats');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('07afcb5c-01ac-4346-a5fa-39ca85fb88f0', '0a0b406d-8077-429a-acc8-d5d6d746ec25', 'Systolic pressure is the higher of the two blood pressure readings, measured during ventricular systole (contraction), when the heart actively ejects blood into the arterial system, producing the peak arterial pressure of the cardiac cycle.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('40c27a09-ea99-4daa-9665-07b04a7e64a5', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 159, 'Tobacco smoke contains nicotine, a highly addictive substance that acts primarily by:', 'Biology', 'Human Health and Disease — Substance Abuse');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('476160cf-ccc2-48f4-99fd-b47b567dfbd5', '40c27a09-ea99-4daa-9665-07b04a7e64a5', 0, 'Blocking all neurotransmitter activity in the brain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9386973c-f08f-41b6-a1e7-e468c56c490a', '40c27a09-ea99-4daa-9665-07b04a7e64a5', 1, 'Stimulating the release of adrenaline and affecting central nervous system reward pathways, contributing to its addictive potential');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cab086f0-b165-4e76-a7b2-62a721319527', '40c27a09-ea99-4daa-9665-07b04a7e64a5', 2, 'Having no effect on the nervous system whatsoever');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('156c3b34-e02a-445d-bd95-5c698a71e7fb', '40c27a09-ea99-4daa-9665-07b04a7e64a5', 3, 'Only affecting the digestive system');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('40c27a09-ea99-4daa-9665-07b04a7e64a5', '9386973c-f08f-41b6-a1e7-e468c56c490a', 'Nicotine stimulates the release of adrenaline (increasing heart rate/blood pressure) and acts on the brain''s reward pathways (dopamine release), contributing significantly to its highly addictive nature, in addition to the numerous other harmful compounds in tobacco smoke.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f91367ef-a236-462a-9037-b9568ba8728d', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 160, 'Myasthenia gravis, an autoimmune disorder affecting the neuromuscular junction, results in:', 'Biology', 'Locomotion and Movement — Disorders');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac43d6fa-f897-4930-ae60-0ef649d59497', 'f91367ef-a236-462a-9037-b9568ba8728d', 0, 'Excessive muscle contraction with no fatigue');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e61be81-33a7-48cc-a970-962dcf47a118', 'f91367ef-a236-462a-9037-b9568ba8728d', 1, 'Progressive muscle weakness and fatigue, due to antibodies attacking acetylcholine receptors at the neuromuscular junction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('41063d1f-4084-48fe-a607-88493d6339a0', 'f91367ef-a236-462a-9037-b9568ba8728d', 2, 'Complete loss of all sensation, with muscles unaffected');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4477aa61-c596-4dc0-96e7-f94e369e2a02', 'f91367ef-a236-462a-9037-b9568ba8728d', 3, 'Increased bone density');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f91367ef-a236-462a-9037-b9568ba8728d', '7e61be81-33a7-48cc-a970-962dcf47a118', 'In myasthenia gravis, the immune system produces antibodies against acetylcholine receptors at the neuromuscular junction, impairing effective transmission of nerve signals to muscle and causing progressive muscular weakness and fatigability.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('980c85ec-bc10-43f2-a832-779f08c80306', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 161, 'Phylum Nematoda (roundworms) is distinguished from Platyhelminthes by the presence of a:', 'Biology', 'Animal Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d04b6527-d47b-480d-a01b-88eae608412a', '980c85ec-bc10-43f2-a832-779f08c80306', 0, 'True coelom, fully lined by mesoderm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2fb36c7-3793-41e8-8f58-6338296530b8', '980c85ec-bc10-43f2-a832-779f08c80306', 1, 'Pseudocoelom (a body cavity not fully lined by mesoderm), along with a complete alimentary canal with two openings');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('740d9861-a1f2-4e85-b625-f5b3643d1df7', '980c85ec-bc10-43f2-a832-779f08c80306', 2, 'Complete absence of any body cavity, exactly like flatworms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a33807c-4835-43ac-aed0-d01dbda72f2e', '980c85ec-bc10-43f2-a832-779f08c80306', 3, 'Segmented body, like annelids');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('980c85ec-bc10-43f2-a832-779f08c80306', 'c2fb36c7-3793-41e8-8f58-6338296530b8', 'Nematodes possess a pseudocoelomate body plan (a body cavity present but not fully lined by mesoderm) and a complete digestive tract with both a mouth and anus, distinguishing them from the acoelomate, blind-gut flatworms.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('553a5505-05e9-41f0-add6-037ac60694e1', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 162, 'The frog, a commonly studied representative amphibian, exhibits which type of respiration during its aquatic tadpole stage?', 'Biology', 'Structural Organisation in Animals — Frog');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f802c22e-1e99-46b9-a090-e5ea48a9b0a8', '553a5505-05e9-41f0-add6-037ac60694e1', 0, 'Lung respiration exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce3897cb-389a-4713-a7f9-31875ab7d52d', '553a5505-05e9-41f0-add6-037ac60694e1', 1, 'Gill respiration, later replaced predominantly by lung and cutaneous respiration in the adult');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('063c2f55-0f75-49ba-baf6-b8942ec09cf8', '553a5505-05e9-41f0-add6-037ac60694e1', 2, 'Tracheal respiration, as in insects');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64067a23-5424-4664-bf07-4fb8e46ddd7c', '553a5505-05e9-41f0-add6-037ac60694e1', 3, 'No respiration occurs during the tadpole stage');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('553a5505-05e9-41f0-add6-037ac60694e1', 'ce3897cb-389a-4713-a7f9-31875ab7d52d', 'Tadpoles (the aquatic larval stage of frogs) respire using gills, similar to fish; as metamorphosis progresses toward the adult (largely terrestrial) form, gills are lost and lungs (supplemented by cutaneous/skin respiration) become the primary respiratory organs.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('151534c1-a920-4571-9747-4706faffd2db', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 163, 'Haemoglobin''s affinity for oxygen is influenced by several factors; an increase in blood CO2 concentration and a decrease in pH (the Bohr effect) generally:', 'Biology', 'Breathing and Exchange of Gases — Transport');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d81a6c0-8e32-4006-8a1b-f9343d8ed727', '151534c1-a920-4571-9747-4706faffd2db', 0, 'Increases haemoglobin''s affinity for oxygen, promoting oxygen loading');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('683700ec-15a2-41fd-a226-a3991279587e', '151534c1-a920-4571-9747-4706faffd2db', 1, 'Decreases haemoglobin''s affinity for oxygen, promoting oxygen unloading/release to actively respiring tissues');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26de8e68-bd7c-4d95-b8d5-70d2a202d7a0', '151534c1-a920-4571-9747-4706faffd2db', 2, 'Has no effect on oxygen binding at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f926e4c-5fff-4988-97c9-6391987bfb48', '151534c1-a920-4571-9747-4706faffd2db', 3, 'Only affects carbon dioxide transport, not oxygen');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('151534c1-a920-4571-9747-4706faffd2db', '683700ec-15a2-41fd-a226-a3991279587e', 'The Bohr effect describes how increased CO2/decreased pH (conditions found in actively respiring, oxygen-demanding tissues) reduce haemoglobin''s oxygen affinity, promoting oxygen release precisely where it is most needed.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('512ff74a-fac6-46f3-bf0e-ac0f4443278b', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 164, 'Veins, unlike arteries, generally possess:', 'Biology', 'Body Fluids and Circulation — Vessels');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2598910-9a12-4259-9004-29a9f03e3eb7', '512ff74a-fac6-46f3-bf0e-ac0f4443278b', 0, 'Much thicker, more muscular walls to withstand high pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('657c0672-95b6-480e-b34d-cadf69ea5c26', '512ff74a-fac6-46f3-bf0e-ac0f4443278b', 1, 'Valves that prevent the backflow of blood, an adaptation important since venous blood pressure is low');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bb9e0f75-b247-41db-8024-114362f44875', '512ff74a-fac6-46f3-bf0e-ac0f4443278b', 2, 'A pulse that can be easily felt, just like arteries');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('805219e6-e6d3-4760-bbf0-aa4f0d51b2cb', '512ff74a-fac6-46f3-bf0e-ac0f4443278b', 3, 'No lumen at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('512ff74a-fac6-46f3-bf0e-ac0f4443278b', '657c0672-95b6-480e-b34d-cadf69ea5c26', 'Veins carry blood at relatively low pressure back toward the heart and possess valves (particularly in limbs) that prevent backflow, working alongside surrounding skeletal muscle contraction to assist venous return — a feature arteries, which experience high pulsatile pressure, do not need.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1d7b1262-f07d-4d5b-a934-0939296d9d88', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 165, 'Antidiuretic hormone (ADH, vasopressin), released by the posterior pituitary, acts on the kidney to:', 'Biology', 'Excretory Products and Their Elimination — Regulation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1709e01b-9420-476a-a950-d8319fb7793d', '1d7b1262-f07d-4d5b-a934-0939296d9d88', 0, 'Decrease water reabsorption, producing more dilute urine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('035f4131-a2f3-43ca-bdff-035b3491ad04', '1d7b1262-f07d-4d5b-a934-0939296d9d88', 1, 'Increase the permeability of the collecting duct to water, promoting water reabsorption and producing more concentrated urine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0954c00b-ac35-46d7-92a2-19a3c7a3fb01', '1d7b1262-f07d-4d5b-a934-0939296d9d88', 2, 'Have no effect on urine concentration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3027ac8f-86f2-43c5-b795-a7541188e40b', '1d7b1262-f07d-4d5b-a934-0939296d9d88', 3, 'Only regulate sodium excretion, unrelated to water');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1d7b1262-f07d-4d5b-a934-0939296d9d88', '035f4131-a2f3-43ca-bdff-035b3491ad04', 'ADH increases the water permeability of the distal tubule and collecting duct, promoting reabsorption of water back into the blood, which conserves body water and results in a smaller volume of more concentrated urine — its release increases during dehydration.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('890380d1-6429-4dd3-ba81-e95bf42cf616', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 166, 'A reflex arc, the pathway of a rapid, involuntary response, minimally involves:', 'Biology', 'Neural Control and Coordination — Reflex Arc');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('061173c9-c04f-4b2a-8f0e-aa2a7ebecd9e', '890380d1-6429-4dd3-ba81-e95bf42cf616', 0, 'Only the brain, with no spinal cord involvement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e4f8830-7656-4642-8e2b-89849aa4c78b', '890380d1-6429-4dd3-ba81-e95bf42cf616', 1, 'A receptor, sensory neuron, integrating centre (often the spinal cord), motor neuron, and effector');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63e89859-a1c8-428d-a1cc-fcde75c5af22', '890380d1-6429-4dd3-ba81-e95bf42cf616', 2, 'Only a single neuron with no synapse involved');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98572069-beea-4270-a638-1f60a3110b62', '890380d1-6429-4dd3-ba81-e95bf42cf616', 3, 'Muscles only, with no nervous involvement at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('890380d1-6429-4dd3-ba81-e95bf42cf616', '2e4f8830-7656-4642-8e2b-89849aa4c78b', 'A basic reflex arc pathway involves: a receptor detecting the stimulus, a sensory (afferent) neuron carrying the signal to an integrating centre (often the spinal cord, allowing a fast response bypassing the brain), a motor (efferent) neuron, and an effector (muscle/gland) producing the response.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a562e21b-4e8b-4a52-826a-25197f012396', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 167, 'The thymus gland, an important lymphoid organ that is also endocrine in function, is particularly active and relatively large during:', 'Biology', 'Chemical Coordination and Integration — Thymus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7c8ba0b-8402-4b0d-ac72-160cdfa172f6', 'a562e21b-4e8b-4a52-826a-25197f012396', 0, 'Old age, when it reaches maximum size');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02ed8b29-1c7e-4b79-9b30-7ae47ddf642e', 'a562e21b-4e8b-4a52-826a-25197f012396', 1, 'Childhood, gradually shrinking (involuting) after puberty');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27cf2435-41fe-4a2d-94e5-67697208eb99', 'a562e21b-4e8b-4a52-826a-25197f012396', 2, 'Only during pregnancy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ca2f9e7-a1f8-4f9c-b7f5-87d3c497ee4b', 'a562e21b-4e8b-4a52-826a-25197f012396', 3, 'It remains a constant size throughout life');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a562e21b-4e8b-4a52-826a-25197f012396', '02ed8b29-1c7e-4b79-9b30-7ae47ddf642e', 'The thymus is relatively large and highly active during childhood, playing a crucial role in the maturation of T-lymphocytes, and progressively shrinks (involutes) after puberty, being largely replaced by fatty tissue in adults.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('715cda77-44d1-4503-adc4-b68a38e09c49', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 168, 'Seminal vesicles, a pair of male accessory reproductive glands, contribute seminal fluid rich in:', 'Biology', 'Human Reproduction — Accessory Glands');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec1bfbbc-e962-4d1e-bfac-297ef15523ea', '715cda77-44d1-4503-adc4-b68a38e09c49', 0, 'Sperm cells themselves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a9546fa-5d91-431f-b2e4-63e5c9271c9a', '715cda77-44d1-4503-adc4-b68a38e09c49', 1, 'Fructose, which provides an energy source for sperm motility, among other secretions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6bf24781-90a1-487f-8ebb-9fc5952e35f3', '715cda77-44d1-4503-adc4-b68a38e09c49', 2, 'Only water, with no other components');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('392b33d5-5938-46d0-bc9f-d20bc1fc3bc9', '715cda77-44d1-4503-adc4-b68a38e09c49', 3, 'Digestive enzymes for the stomach');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('715cda77-44d1-4503-adc4-b68a38e09c49', '3a9546fa-5d91-431f-b2e4-63e5c9271c9a', 'Seminal vesicles secrete a fructose-rich fluid (along with other substances like prostaglandins) that provides an energy source supporting sperm motility and viability after ejaculation, forming a substantial portion of the semen''s volume.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c27b0c71-de6b-4de7-ae3c-b01cef298b1a', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 169, 'Assisted Reproductive Technologies (ART) such as ZIFT (Zygote Intra-Fallopian Transfer) involve:', 'Biology', 'Reproductive Health — Infertility');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c67147e0-2ef7-4dc8-8993-952730367207', 'c27b0c71-de6b-4de7-ae3c-b01cef298b1a', 0, 'Transferring an embryo formed in vitro directly into the fallopian tube, rather than the uterus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8c3bb65-ceec-4215-9aa9-157f83ad090f', 'c27b0c71-de6b-4de7-ae3c-b01cef298b1a', 1, 'Transferring unfertilized eggs into the testis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0e47573-c007-4391-968e-bb76586f7e95', 'c27b0c71-de6b-4de7-ae3c-b01cef298b1a', 2, 'A purely hormonal treatment with no embryo transfer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89ef1ca6-7b34-42d1-bfed-bdfadf2a8c8e', 'c27b0c71-de6b-4de7-ae3c-b01cef298b1a', 3, 'Injecting sperm directly into the ovary');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c27b0c71-de6b-4de7-ae3c-b01cef298b1a', 'c67147e0-2ef7-4dc8-8993-952730367207', 'In ZIFT, a zygote formed via in vitro fertilization is transferred into the fallopian tube (rather than directly into the uterus as in standard IVF embryo transfer), allowing it to travel and implant more naturally.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('057007fe-90a2-404a-aa26-6bb5f51241a4', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 170, 'Radiotherapy, a common cancer treatment, works by using controlled doses of radiation to:', 'Biology', 'Human Health and Disease — Cancer Treatment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38f945e9-eaf3-45b5-a859-629dc3308f4d', '057007fe-90a2-404a-aa26-6bb5f51241a4', 0, 'Stimulate faster growth of cancerous cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c63a2694-2a7e-4a3d-9a78-4090aaecd3dc', '057007fe-90a2-404a-aa26-6bb5f51241a4', 1, 'Damage the DNA of rapidly dividing cancer cells, impairing their ability to grow and divide further');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dca5e86e-2fe3-494c-b473-2e7a935ebf8e', '057007fe-90a2-404a-aa26-6bb5f51241a4', 2, 'Only relieve pain, with no direct effect on tumour cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a3da738-a27d-4981-9583-994d22ff9d83', '057007fe-90a2-404a-aa26-6bb5f51241a4', 3, 'Boost the patient''s immune system exclusively, with no direct tumour targeting');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('057007fe-90a2-404a-aa26-6bb5f51241a4', 'c63a2694-2a7e-4a3d-9a78-4090aaecd3dc', 'Radiotherapy uses targeted, controlled doses of ionizing radiation to damage the DNA of rapidly dividing cancer cells, impairing their ability to continue dividing and often triggering their death, while efforts are made to spare as much surrounding healthy tissue as possible.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7ed7f1f8-cf0c-4bc3-a333-e3d7e67b6c21', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 171, 'Parthenogenesis, observed in some insects and reptiles, refers to:', 'Biology', 'Reproduction in Organisms — Parthenogenesis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('305618df-988c-4809-9014-6558bfd9f24e', '7ed7f1f8-cf0c-4bc3-a333-e3d7e67b6c21', 0, 'Development of a new individual from a fertilized egg, exactly as in normal sexual reproduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ad66992-c1ee-428a-84ed-d50ea64dae1b', '7ed7f1f8-cf0c-4bc3-a333-e3d7e67b6c21', 1, 'Development of a new individual from an unfertilized egg');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7c79b05-f90b-469d-bd4f-7aebbdb074e5', '7ed7f1f8-cf0c-4bc3-a333-e3d7e67b6c21', 2, 'A form of vegetative propagation seen only in plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b542abf0-4d48-456e-9b84-bd74eca4865b', '7ed7f1f8-cf0c-4bc3-a333-e3d7e67b6c21', 3, 'Fusion of two unfertilized eggs');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7ed7f1f8-cf0c-4bc3-a333-e3d7e67b6c21', '4ad66992-c1ee-428a-84ed-d50ea64dae1b', 'Parthenogenesis is a natural form of asexual reproduction in which an embryo develops from an unfertilized egg, observed in various insects (like some bees/wasps) and a few reptile and fish species, producing offspring without the involvement of sperm.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('dee9b06c-f5c4-4c59-9f8d-a8d9e5b6781c', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 172, 'Genetic counselling is a service primarily aimed at helping individuals or couples:', 'Biology', 'Genetics and Evolution — Genetic Counselling');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba59082b-a5a4-4395-a100-d35aa80dba85', 'dee9b06c-f5c4-4c59-9f8d-a8d9e5b6781c', 0, 'Undergo unrelated medical surgeries');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c98d1a3-9a51-4274-a844-fbf9ea2dbc34', 'dee9b06c-f5c4-4c59-9f8d-a8d9e5b6781c', 1, 'Understand the risk of inherited disorders occurring or recurring in their family, based on pedigree and genetic testing information');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85313ddb-24c1-41be-ae42-5c90752240cf', 'dee9b06c-f5c4-4c59-9f8d-a8d9e5b6781c', 2, 'Change their own genetic makeup directly through counselling sessions alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5bc86047-23f2-4ea8-a2de-694e13e9c8f1', 'dee9b06c-f5c4-4c59-9f8d-a8d9e5b6781c', 3, 'Avoid all forms of medical testing');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dee9b06c-f5c4-4c59-9f8d-a8d9e5b6781c', '4c98d1a3-9a51-4274-a844-fbf9ea2dbc34', 'Genetic counselling helps individuals/couples understand the risks and implications of genetic conditions in their family (often via pedigree analysis and genetic testing), supporting informed reproductive and health-related decision-making — it does not itself alter genetic makeup.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('41eac916-72a3-4b98-a2cf-a4e7a6c3603c', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 173, 'Allopatric speciation, a common mode of speciation, occurs when populations of a species become:', 'Biology', 'Evolution — Speciation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e10ba67-6b79-44a7-a54f-af234581ca3f', '41eac916-72a3-4b98-a2cf-a4e7a6c3603c', 0, 'Geographically isolated from each other, accumulating independent genetic changes over time until reproductive isolation develops');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e031b960-0db2-4210-930c-86e99c860f0c', '41eac916-72a3-4b98-a2cf-a4e7a6c3603c', 1, 'Kept in exactly the same location with continuous gene flow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('22583d82-6178-421d-a1a0-d251962eb7be', '41eac916-72a3-4b98-a2cf-a4e7a6c3603c', 2, 'Genetically identical despite living in different locations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59630ca6-253a-42b8-9801-0c7f87753b2a', '41eac916-72a3-4b98-a2cf-a4e7a6c3603c', 3, 'Immediately and instantly transformed into a new species with no time required');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('41eac916-72a3-4b98-a2cf-a4e7a6c3603c', '7e10ba67-6b79-44a7-a54f-af234581ca3f', 'Allopatric speciation occurs when a geographic barrier separates populations, preventing gene flow between them; over time, each population accumulates independent genetic changes (via mutation, drift, and differing selection pressures), eventually leading to reproductive isolation and the formation of distinct species.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('05a6e99e-f777-46b7-97e9-6a59ba26edd3', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 174, 'Molecular pharming (using genetically modified plants or animals to produce pharmaceutical proteins) offers a potential advantage of:', 'Biology', 'Biotechnology and Its Applications — Molecular Farming');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da55dac7-e166-4d85-87d0-08ac9b628a5d', '05a6e99e-f777-46b7-97e9-6a59ba26edd3', 0, 'Being more expensive and lower-yield than conventional pharmaceutical manufacturing in every case');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96fcec62-ea15-4dac-9166-754f3163b93e', '05a6e99e-f777-46b7-97e9-6a59ba26edd3', 1, 'Potentially large-scale, cost-effective production of complex therapeutic proteins using agricultural-style cultivation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b078f62-3be9-4622-b5b4-eef9f47afea9', '05a6e99e-f777-46b7-97e9-6a59ba26edd3', 2, 'Only being applicable to non-protein drugs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bf50adba-afe9-4da8-b480-9e8ae33ddf94', '05a6e99e-f777-46b7-97e9-6a59ba26edd3', 3, 'Eliminating the need for any regulatory oversight');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('05a6e99e-f777-46b7-97e9-6a59ba26edd3', '96fcec62-ea15-4dac-9166-754f3163b93e', 'Molecular pharming exploits genetically engineered plants or animals as ''bioreactors'' to produce complex pharmaceutical proteins (like antibodies or vaccines) potentially at large scale and lower cost using established agricultural cultivation methods, compared to some conventional cell-culture-based manufacturing.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d84942ce-c1cd-4ca4-b417-420a3ac02740', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 175, 'r-selected species, a life-history strategy category, are generally characterized by:', 'Biology', 'Organisms and Populations — Life History Strategies');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa6ca2a6-01f5-4776-add3-81f42343b9f1', 'd84942ce-c1cd-4ca4-b417-420a3ac02740', 0, 'Few offspring, extensive parental care, and long lifespans');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64b1795c-a0e3-4ada-852d-a32f7a874aaa', 'd84942ce-c1cd-4ca4-b417-420a3ac02740', 1, 'Many offspring, minimal parental care, rapid development, and short lifespans, adapted to exploit unstable/unpredictable environments');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c8c911f-ab68-45f5-953e-fc7894a5cf2a', 'd84942ce-c1cd-4ca4-b417-420a3ac02740', 2, 'Exactly identical traits to K-selected species');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f204f151-c915-4748-86ba-beb86614f21d', 'd84942ce-c1cd-4ca4-b417-420a3ac02740', 3, 'Zero reproductive output over their lifetime');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d84942ce-c1cd-4ca4-b417-420a3ac02740', '64b1795c-a0e3-4ada-852d-a32f7a874aaa', 'r-selected species (e.g., many insects, weeds) typically produce numerous offspring with minimal individual parental investment, mature and reproduce quickly, and have short lifespans — a strategy favored in unstable, unpredictable, or resource-fluctuating environments, contrasting with the more stable-environment-adapted K-selected strategy.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2057e52d-c9b0-4e81-b989-e674290800b0', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 176, 'Secondary consumers in a typical food chain are organisms that feed directly on:', 'Biology', 'Ecosystem — Trophic Levels');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1cbec33-5571-4f16-9c1d-2701df9a593b', '2057e52d-c9b0-4e81-b989-e674290800b0', 0, 'Producers (autotrophs) only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da63f775-6277-4638-a2be-4dfb5dcf5364', '2057e52d-c9b0-4e81-b989-e674290800b0', 1, 'Primary consumers (herbivores)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af338f78-2ba5-4e30-aaa4-41e585ff0f6c', '2057e52d-c9b0-4e81-b989-e674290800b0', 2, 'Only decomposers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd5394a6-9b3b-4585-af81-6fb37063d5e7', '2057e52d-c9b0-4e81-b989-e674290800b0', 3, 'Abiotic components of the environment');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2057e52d-c9b0-4e81-b989-e674290800b0', 'da63f775-6277-4638-a2be-4dfb5dcf5364', 'Secondary consumers occupy the third trophic level, feeding directly on primary consumers (herbivores) — for example, a snake eating a mouse that itself fed on plant material.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0d4acfcc-0f20-4b99-968c-6cad4b7f76b2', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 177, 'Habitat fragmentation, a major threat to biodiversity, refers to:', 'Biology', 'Biodiversity and Conservation — Threats');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95f35d67-f1de-4cde-a0d9-7dd4eae1627e', '0d4acfcc-0f20-4b99-968c-6cad4b7f76b2', 0, 'The complete expansion of a single large, continuous habitat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e72df65-8311-402c-b07e-4387ec8a3a45', '0d4acfcc-0f20-4b99-968c-6cad4b7f76b2', 1, 'The breaking up of a large, continuous habitat into smaller, isolated patches, often due to human land-use changes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('464ddf29-c0f6-4bd1-87d7-91b567ecef35', '0d4acfcc-0f20-4b99-968c-6cad4b7f76b2', 2, 'An increase in overall habitat connectivity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('092fb3a0-57db-4a1a-ad31-3c6d15511a29', '0d4acfcc-0f20-4b99-968c-6cad4b7f76b2', 3, 'A phenomenon that only benefits wildlife with no negative effects');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0d4acfcc-0f20-4b99-968c-6cad4b7f76b2', '0e72df65-8311-402c-b07e-4387ec8a3a45', 'Habitat fragmentation divides a once-continuous habitat into smaller, often isolated patches (frequently due to roads, agriculture, or urban development), which can restrict species movement/gene flow, reduce effective population sizes, and increase vulnerability to local extinction.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('387cfa5b-90ce-4e18-848b-2d2b22fec929', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 178, 'The inner surface of the small intestine is highly folded into finger-like projections called villi, which primarily function to:', 'Biology', 'Digestion and Absorption — Small Intestine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0288324-20fc-40c5-85d0-93e16ecbaef3', '387cfa5b-90ce-4e18-848b-2d2b22fec929', 0, 'Secrete digestive enzymes into the stomach');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c25d5dbf-1a50-4aa4-819a-ab80533dc6be', '387cfa5b-90ce-4e18-848b-2d2b22fec929', 1, 'Greatly increase the surface area available for absorption of digested nutrients into the bloodstream/lymph');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86b81023-0a0c-477b-a5df-5c2e3d3945ae', '387cfa5b-90ce-4e18-848b-2d2b22fec929', 2, 'Store undigested food temporarily');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('452c7636-eb6e-452a-ba81-f54409ce6888', '387cfa5b-90ce-4e18-848b-2d2b22fec929', 3, 'Produce bile for fat digestion');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('387cfa5b-90ce-4e18-848b-2d2b22fec929', 'c25d5dbf-1a50-4aa4-819a-ab80533dc6be', 'Villi (and the even smaller microvilli on their surface cells) dramatically increase the small intestine''s internal surface area, maximizing the efficiency of nutrient absorption into the underlying blood capillaries and lacteals (lymphatic vessels).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ec519550-dc4d-4597-a24f-5560d4544f4f', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 179, 'Kwashiorkor, a form of malnutrition seen especially in young children, results primarily from a severe deficiency of:', 'Biology', 'Human Health and Disease — Nutritional Disorders');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0fa5acc1-a461-4869-8f7d-8eb446bb47d4', 'ec519550-dc4d-4597-a24f-5560d4544f4f', 0, 'Dietary carbohydrates, with adequate protein');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73eaa25c-7867-4df9-83cc-6dc010996a2b', 'ec519550-dc4d-4597-a24f-5560d4544f4f', 1, 'Dietary protein, despite often adequate caloric (carbohydrate) intake');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c89f4181-eac8-49f9-bd5f-6eb48166a5b0', 'ec519550-dc4d-4597-a24f-5560d4544f4f', 2, 'Only vitamin C');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6093f7b-22aa-4fdb-8c97-29741d4ed2ce', 'ec519550-dc4d-4597-a24f-5560d4544f4f', 3, 'Excess protein intake');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ec519550-dc4d-4597-a24f-5560d4544f4f', '73eaa25c-7867-4df9-83cc-6dc010996a2b', 'Kwashiorkor is a form of severe protein malnutrition, occurring even when overall caloric intake may be reasonably adequate, often characterized by edema (fluid retention causing a swollen abdomen), growth failure, and impaired immune function.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('80b18167-6378-4f49-a5a8-bbc4f895b49f', '0149f54c-cf0b-492a-b9ee-8708ff2076e8', 180, 'Cartilage, a specialized connective tissue found at joints and other locations, differs from bone primarily in that cartilage:', 'Biology', 'Locomotion and Movement — Bone vs Cartilage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f0f841c0-e884-4bc2-a775-6691fb82ee66', '80b18167-6378-4f49-a5a8-bbc4f895b49f', 0, 'Is more rigid and heavily mineralized with calcium salts than bone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee0ac2be-27e7-419c-892e-45afae122735', '80b18167-6378-4f49-a5a8-bbc4f895b49f', 1, 'Has a solid but flexible (non-mineralized, or less mineralized) matrix, lacking the extensive blood supply typical of bone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18bfa70e-69ac-407c-b36c-0b7794cd51e3', '80b18167-6378-4f49-a5a8-bbc4f895b49f', 2, 'Contains no cells at all, unlike bone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0dce7cec-ce17-4585-85a6-b88147c9cb4c', '80b18167-6378-4f49-a5a8-bbc4f895b49f', 3, 'Cannot be found anywhere in the adult human body');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('80b18167-6378-4f49-a5a8-bbc4f895b49f', 'ee0ac2be-27e7-419c-892e-45afae122735', 'Cartilage has a firm yet flexible matrix (chondrin) and is typically avascular (relying on diffusion for nutrients), unlike the heavily mineralized, well-vascularized bone tissue — providing cushioning and flexible support at joints and other locations like the nose and ears.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');
