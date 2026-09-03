-- ============================================================
-- NEET UG — Full Mock Paper 2
-- Full-Length Practice Paper (180 questions, 180 minutes)
-- Marking: +4 correct / -1 incorrect (official NEET UG scheme)
-- Run this AFTER docs/add-question-subject-marking.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('49540965-3805-40bf-b729-7b60123f83aa', 'neet-practice-2', 'NEET UG Full Mock Paper 2', 'neet', ARRAY['Physics', 'Chemistry', 'Biology', 'Botany', 'Zoology', 'NCERT', 'NEET UG']::TEXT[], 180, 'mixed', true, 2, 180, 4, 1);

-- ── Section: Physics (45 questions) — Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9b3f7ef2-8bfc-4369-949c-a497ba2dd229', '49540965-3805-40bf-b729-7b60123f83aa', 1, 'The number of significant figures in the measurement 0.00420 is:', 'Physics', 'Units and Measurements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6af7ee9a-c50e-4980-9fa2-651b85ec60a2', '9b3f7ef2-8bfc-4369-949c-a497ba2dd229', 0, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('982b75be-642c-46fb-a52c-3c6e4d6176ea', '9b3f7ef2-8bfc-4369-949c-a497ba2dd229', 1, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f70545ef-e533-4349-ac55-26c3050ab41d', '9b3f7ef2-8bfc-4369-949c-a497ba2dd229', 2, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8ac4f3c-b631-439c-b799-f2e618aa6c4e', '9b3f7ef2-8bfc-4369-949c-a497ba2dd229', 3, '6');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9b3f7ef2-8bfc-4369-949c-a497ba2dd229', '982b75be-642c-46fb-a52c-3c6e4d6176ea', 'Leading zeros are not significant; the significant digits are 4, 2, 0, giving 3 significant figures.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c9a7b35b-442d-416a-9a7f-ab6efd47e096', '49540965-3805-40bf-b729-7b60123f83aa', 2, 'A car decelerates uniformly from 20 m/s to rest in 5 seconds. The magnitude of its acceleration is:', 'Physics', 'Motion in a Straight Line');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6534fd8-44af-4bbd-a903-3ec90c8a217b', 'c9a7b35b-442d-416a-9a7f-ab6efd47e096', 0, '2 m/s^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d825e89c-7289-4cad-9b61-6c2df44c03b4', 'c9a7b35b-442d-416a-9a7f-ab6efd47e096', 1, '4 m/s^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7a41045-3bdf-442c-a1bb-7cdaf81c3cb2', 'c9a7b35b-442d-416a-9a7f-ab6efd47e096', 2, '5 m/s^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5ee3f7f-b0f5-48dc-86ba-893f0b374a28', 'c9a7b35b-442d-416a-9a7f-ab6efd47e096', 3, '100 m/s^2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c9a7b35b-442d-416a-9a7f-ab6efd47e096', 'd825e89c-7289-4cad-9b61-6c2df44c03b4', 'a = (v-u)/t = (0-20)/5 = -4 m/s^2, so the magnitude of deceleration is 4 m/s^2.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b6996378-794b-4cec-99c3-f79f0cfb03df', '49540965-3805-40bf-b729-7b60123f83aa', 3, 'The principle of conservation of linear momentum for a system of particles holds true when:', 'Physics', 'Laws of Motion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49c99ca7-d630-49d2-bec0-1160db9ef97e', 'b6996378-794b-4cec-99c3-f79f0cfb03df', 0, 'The net external force on the system is zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d49b971f-733b-459e-8500-3d1e8cbc356e', 'b6996378-794b-4cec-99c3-f79f0cfb03df', 1, 'The net internal force is zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5c8fb5d-980d-4cd4-9cf8-36572f45e034', 'b6996378-794b-4cec-99c3-f79f0cfb03df', 2, 'There are no internal forces at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26bffc1c-3c6a-4641-81cc-43f4213ab418', 'b6996378-794b-4cec-99c3-f79f0cfb03df', 3, 'The masses of all particles are equal');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b6996378-794b-4cec-99c3-f79f0cfb03df', '49c99ca7-d630-49d2-bec0-1160db9ef97e', 'Linear momentum of a system is conserved when the net EXTERNAL force acting on it is zero, regardless of internal forces (like collisions) between the particles.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4576075d-36c6-4f19-8139-f567339a86ba', '49540965-3805-40bf-b729-7b60123f83aa', 4, 'One watt is defined as a power of:', 'Physics', 'Work, Energy and Power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2f605c5-dd7e-4ea4-929c-74090d906c35', '4576075d-36c6-4f19-8139-f567339a86ba', 0, '1 joule per second');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('499abe3d-b1ff-4461-878b-8e251c691b94', '4576075d-36c6-4f19-8139-f567339a86ba', 1, '1 newton per second');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f13a9b5-8cd1-424c-9c50-54d72fb01261', '4576075d-36c6-4f19-8139-f567339a86ba', 2, '1 joule per metre');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('242d5cde-1670-4c00-b4fc-a1be4749c2a9', '4576075d-36c6-4f19-8139-f567339a86ba', 3, '1 newton-metre per hour');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4576075d-36c6-4f19-8139-f567339a86ba', 'a2f605c5-dd7e-4ea4-929c-74090d906c35', 'Power P = Work/time; 1 watt = 1 joule/1 second.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('db8c47fd-c491-4aa1-bdbc-a741662b47fa', '49540965-3805-40bf-b729-7b60123f83aa', 5, 'Torque is defined mathematically as:', 'Physics', 'System of Particles and Rotational Motion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('662b372c-bcfa-465e-9265-e752f1f12432', 'db8c47fd-c491-4aa1-bdbc-a741662b47fa', 0, 'The cross product of force and the position vector (r x F)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d78eb54-ec64-49ce-9689-af81ccf118cb', 'db8c47fd-c491-4aa1-bdbc-a741662b47fa', 1, 'The dot product of force and displacement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b77a1b52-ed37-46c1-89ae-94fb300c9910', 'db8c47fd-c491-4aa1-bdbc-a741662b47fa', 2, 'Mass times velocity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2b77bee-f20c-45bc-8650-70e92545e975', 'db8c47fd-c491-4aa1-bdbc-a741662b47fa', 3, 'Force divided by area');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('db8c47fd-c491-4aa1-bdbc-a741662b47fa', '662b372c-bcfa-465e-9265-e752f1f12432', 'Torque (moment of force) is the vector cross product tau = r x F, where r is the position vector from the axis to the point of force application.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3101b1af-27ba-4a2c-857d-d1582b85c8bb', '49540965-3805-40bf-b729-7b60123f83aa', 6, 'The value of acceleration due to gravity ''g'' at a height h above Earth''s surface (h << R) approximately decreases as:', 'Physics', 'Gravitation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('198498e8-346b-4d9d-a73b-5d5bb6daa59e', '3101b1af-27ba-4a2c-857d-d1582b85c8bb', 0, 'g'' = g(1 + 2h/R)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa851e39-3de0-40de-a2b5-0eda31d58186', '3101b1af-27ba-4a2c-857d-d1582b85c8bb', 1, 'g'' = g(1 - 2h/R)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c3cb321-1b8a-42da-8fd5-63d22ce77152', '3101b1af-27ba-4a2c-857d-d1582b85c8bb', 2, 'g'' = g(1 - h/R)^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68414d42-68e7-4d82-a925-9d118e104f8d', '3101b1af-27ba-4a2c-857d-d1582b85c8bb', 3, 'g'' remains exactly constant with height');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3101b1af-27ba-4a2c-857d-d1582b85c8bb', 'aa851e39-3de0-40de-a2b5-0eda31d58186', 'For h << R, g'' is approximately g(1 - 2h/R), showing gravity decreases with altitude near Earth''s surface.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3e777cd4-0c36-4716-a30f-e95b55f9de7a', '49540965-3805-40bf-b729-7b60123f83aa', 7, 'The SI unit of stress is the same as that of:', 'Physics', 'Mechanical Properties of Solids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('049b52ed-fbde-4924-9e99-d82ac36ffb0d', '3e777cd4-0c36-4716-a30f-e95b55f9de7a', 0, 'Force');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64d6499c-12e3-4de7-86e3-5eeef0d4b4bd', '3e777cd4-0c36-4716-a30f-e95b55f9de7a', 1, 'Pressure (N/m^2 or pascal)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24d429f7-619f-49b8-9041-dfc43605c3d6', '3e777cd4-0c36-4716-a30f-e95b55f9de7a', 2, 'Energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('821de7da-1bfe-40af-b98c-c480bfa827c3', '3e777cd4-0c36-4716-a30f-e95b55f9de7a', 3, 'Strain, which is dimensionless');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3e777cd4-0c36-4716-a30f-e95b55f9de7a', '64d6499c-12e3-4de7-86e3-5eeef0d4b4bd', 'Stress = force/area, giving units of N/m^2, identical to the unit of pressure (pascal).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f34b8d2d-a0e5-48f3-830f-ab3adfb62bad', '49540965-3805-40bf-b729-7b60123f83aa', 8, 'The rise of liquid in a narrow capillary tube is an example of the phenomenon of:', 'Physics', 'Mechanical Properties of Fluids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8505a532-17a1-4916-90f2-af96188ee67e', 'f34b8d2d-a0e5-48f3-830f-ab3adfb62bad', 0, 'Viscosity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a50cfc5-9e66-4f07-aa4b-6da7b75deca6', 'f34b8d2d-a0e5-48f3-830f-ab3adfb62bad', 1, 'Capillarity, caused by surface tension');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1bc03156-096e-4392-a9b1-06299666c6c3', 'f34b8d2d-a0e5-48f3-830f-ab3adfb62bad', 2, 'Turbulence');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94171831-4294-4426-8a97-dcc27e757c6c', 'f34b8d2d-a0e5-48f3-830f-ab3adfb62bad', 3, 'Buoyancy');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f34b8d2d-a0e5-48f3-830f-ab3adfb62bad', '9a50cfc5-9e66-4f07-aa4b-6da7b75deca6', 'Capillary rise occurs due to surface tension and adhesive forces between the liquid and tube walls exceeding cohesive forces within the liquid.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('851d4c92-ecb5-4226-93fd-59419dd57e93', '49540965-3805-40bf-b729-7b60123f83aa', 9, 'The transfer of heat through a fluid due to actual movement of the fluid particles is called:', 'Physics', 'Thermal Properties of Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45fd3881-705d-472f-b618-5a6bb6af3b00', '851d4c92-ecb5-4226-93fd-59419dd57e93', 0, 'Conduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('323d63bd-c727-4ab7-b132-ff3eb6800462', '851d4c92-ecb5-4226-93fd-59419dd57e93', 1, 'Convection');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('977e207a-656a-4e5f-973a-98c3a6299818', '851d4c92-ecb5-4226-93fd-59419dd57e93', 2, 'Radiation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a035ed86-1609-477f-8177-77d8b422102e', '851d4c92-ecb5-4226-93fd-59419dd57e93', 3, 'Sublimation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('851d4c92-ecb5-4226-93fd-59419dd57e93', '323d63bd-c727-4ab7-b132-ff3eb6800462', 'Convection is heat transfer via bulk movement of a fluid (liquid or gas), unlike conduction (molecular vibration, no bulk motion) or radiation (electromagnetic waves).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8e0ffb5e-b3a6-4f7b-9c03-19a4dba941a6', '49540965-3805-40bf-b729-7b60123f83aa', 10, 'In an isothermal process, the temperature of the system:', 'Physics', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e3642a8-15f0-4cae-a048-37cbc631a729', '8e0ffb5e-b3a6-4f7b-9c03-19a4dba941a6', 0, 'Increases continuously');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c86e2d8-7282-4bf7-845c-98baf626b42f', '8e0ffb5e-b3a6-4f7b-9c03-19a4dba941a6', 1, 'Remains constant throughout the process');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('24b075c6-fc69-4d70-a762-f937d40e3162', '8e0ffb5e-b3a6-4f7b-9c03-19a4dba941a6', 2, 'Decreases continuously');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0fb61fab-ab24-4a45-ae96-ab0d1ae761d1', '8e0ffb5e-b3a6-4f7b-9c03-19a4dba941a6', 3, 'Is undefined');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8e0ffb5e-b3a6-4f7b-9c03-19a4dba941a6', '4c86e2d8-7282-4bf7-845c-98baf626b42f', 'An isothermal process, by definition, occurs at constant temperature, requiring heat exchange with surroundings to compensate for any work done.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('849c9d15-75b3-4b8c-b1ef-1d7e2a8dcca3', '49540965-3805-40bf-b729-7b60123f83aa', 11, 'The pressure exerted by an ideal gas, according to kinetic theory, arises due to:', 'Physics', 'Kinetic Theory');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c83b428-4e48-4b2d-bea5-cb678963e11b', '849c9d15-75b3-4b8c-b1ef-1d7e2a8dcca3', 0, 'The weight of the gas molecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c60555a-4c89-4bf9-a9c5-be29347a6cb4', '849c9d15-75b3-4b8c-b1ef-1d7e2a8dcca3', 1, 'Continuous collisions of gas molecules with the walls of the container');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12356a9f-85ad-42fa-901d-2e959f13b6d2', '849c9d15-75b3-4b8c-b1ef-1d7e2a8dcca3', 2, 'Chemical reactions between molecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('61ae1a4c-f13e-4c59-af5c-4a5f84ebe4e1', '849c9d15-75b3-4b8c-b1ef-1d7e2a8dcca3', 3, 'The temperature of the container walls alone');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('849c9d15-75b3-4b8c-b1ef-1d7e2a8dcca3', '5c60555a-4c89-4bf9-a9c5-be29347a6cb4', 'Kinetic theory attributes gas pressure to the continuous bombardment (collisions) of rapidly moving molecules against the container walls, transferring momentum.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c843c666-bf8e-4142-b818-585406936570', '49540965-3805-40bf-b729-7b60123f83aa', 12, 'For a body executing simple harmonic motion, the restoring force is:', 'Physics', 'Oscillations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4bd36e4e-5241-4906-bd8a-124304ed10ad', 'c843c666-bf8e-4142-b818-585406936570', 0, 'Constant in magnitude and direction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87f2bb5f-b99c-4947-bd2e-ba9ccabe314c', 'c843c666-bf8e-4142-b818-585406936570', 1, 'Directly proportional to displacement and directed opposite to it (toward the mean position)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d92fdebb-7a72-48ec-b7eb-4cfa210c80d4', 'c843c666-bf8e-4142-b818-585406936570', 2, 'Independent of displacement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d03cb54-8fd2-4587-85b2-10d35ccaba85', 'c843c666-bf8e-4142-b818-585406936570', 3, 'Always directed away from the mean position');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c843c666-bf8e-4142-b818-585406936570', '87f2bb5f-b99c-4947-bd2e-ba9ccabe314c', 'SHM is defined by a restoring force F = -kx, proportional to displacement x and always directed toward the equilibrium (mean) position.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e453e5b5-7df9-4834-ac26-f73020cbb5eb', '49540965-3805-40bf-b729-7b60123f83aa', 13, 'The Doppler effect refers to the apparent change in the frequency of a wave due to:', 'Physics', 'Waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ce6df19-38ec-4477-83ff-637bfe2fc47e', 'e453e5b5-7df9-4834-ac26-f73020cbb5eb', 0, 'Relative motion between the source and the observer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d51d4fd6-8f06-4fc7-824f-ce02016007f6', 'e453e5b5-7df9-4834-ac26-f73020cbb5eb', 1, 'A change in the medium''s temperature only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a3522701-21d2-42a9-8112-f22083e24c56', 'e453e5b5-7df9-4834-ac26-f73020cbb5eb', 2, 'The wave''s amplitude changing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48e38d84-e017-4ff3-ae11-a4726e8d0b12', 'e453e5b5-7df9-4834-ac26-f73020cbb5eb', 3, 'The wavelength being fixed at all times');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e453e5b5-7df9-4834-ac26-f73020cbb5eb', '3ce6df19-38ec-4477-83ff-637bfe2fc47e', 'The Doppler effect describes the apparent shift in observed frequency caused by relative motion between the wave source and the observer (or the medium).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b0b5d3b2-51e4-490c-8890-bc6964279e46', '49540965-3805-40bf-b729-7b60123f83aa', 14, 'Electric field lines around an isolated positive point charge are directed:', 'Physics', 'Electric Charges and Fields');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8457cdbb-32f8-4caa-9c65-4f566e8b42ba', 'b0b5d3b2-51e4-490c-8890-bc6964279e46', 0, 'Toward the charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26c6918f-4470-4b07-a682-7ea8f04ad455', 'b0b5d3b2-51e4-490c-8890-bc6964279e46', 1, 'Radially outward from the charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98ab87d9-d865-4a92-afc3-09bfa4b2413a', 'b0b5d3b2-51e4-490c-8890-bc6964279e46', 2, 'In closed loops around the charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e523362-16e2-4550-a5f6-b89107e69f6b', 'b0b5d3b2-51e4-490c-8890-bc6964279e46', 3, 'Tangential to a circle centered on the charge');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b0b5d3b2-51e4-490c-8890-bc6964279e46', '26c6918f-4470-4b07-a682-7ea8f04ad455', 'Field lines point radially outward from an isolated positive charge (the direction a positive test charge would be pushed) and radially inward toward a negative charge.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0a017859-4b1b-49d9-ae06-681000e88ae6', '49540965-3805-40bf-b729-7b60123f83aa', 15, 'The electric potential due to a point charge at a point on the equatorial line of an electric dipole is:', 'Physics', 'Electrostatic Potential and Capacitance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0af7924b-f41e-4402-9dfb-d6a3f30df367', '0a017859-4b1b-49d9-ae06-681000e88ae6', 0, 'Maximum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('190455ba-2366-47ca-a766-b47e31f6bff6', '0a017859-4b1b-49d9-ae06-681000e88ae6', 1, 'Zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea1ef3ce-bc78-4bf2-adde-387d6af1cfd8', '0a017859-4b1b-49d9-ae06-681000e88ae6', 2, 'Equal to the potential due to a single charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d17e1683-a59d-44b7-86d5-8bd1236260f9', '0a017859-4b1b-49d9-ae06-681000e88ae6', 3, 'Infinite');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0a017859-4b1b-49d9-ae06-681000e88ae6', '190455ba-2366-47ca-a766-b47e31f6bff6', 'On the equatorial (perpendicular bisector) line of a dipole, the potentials due to the +q and -q charges are equal in magnitude and opposite in sign, cancelling to give zero net potential.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('574ceb0a-34bb-4cd3-9fa8-1fe74b6ffdc0', '49540965-3805-40bf-b729-7b60123f83aa', 16, 'The internal resistance of a cell causes:', 'Physics', 'Current Electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65c095b9-b613-4647-b7cb-1c70b704fe32', '574ceb0a-34bb-4cd3-9fa8-1fe74b6ffdc0', 0, 'The terminal voltage to exceed the EMF when current is drawn');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d90b237-e6a6-40e5-9445-fc5de3dd9db4', '574ceb0a-34bb-4cd3-9fa8-1fe74b6ffdc0', 1, 'The terminal voltage to be less than the EMF when current is drawn from the cell');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec0624d4-cf8e-4cc7-b5cd-5042c2c13486', '574ceb0a-34bb-4cd3-9fa8-1fe74b6ffdc0', 2, 'No effect on terminal voltage at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('318c9396-3a12-4faf-b360-c908b4b5dbf1', '574ceb0a-34bb-4cd3-9fa8-1fe74b6ffdc0', 3, 'The EMF itself to decrease');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('574ceb0a-34bb-4cd3-9fa8-1fe74b6ffdc0', '4d90b237-e6a6-40e5-9445-fc5de3dd9db4', 'Terminal voltage V = EMF (E) - I*r, where r is internal resistance; drawing current I causes a voltage drop across r, making terminal voltage less than EMF.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ad73d758-9783-4999-9068-10e103a9f716', '49540965-3805-40bf-b729-7b60123f83aa', 17, 'The force experienced by a charged particle moving with velocity v in a magnetic field B is given by:', 'Physics', 'Moving Charges and Magnetism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec245cec-ac57-45da-8c88-0c128bdb6c68', 'ad73d758-9783-4999-9068-10e103a9f716', 0, 'F = qE');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77a2fa64-163d-4b21-aa00-72b2395492d4', 'ad73d758-9783-4999-9068-10e103a9f716', 1, 'F = q(v x B)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6be42957-a86d-4465-b8b0-d18862ddd8d7', 'ad73d758-9783-4999-9068-10e103a9f716', 2, 'F = qvB in the same direction as v always');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26f729b9-7297-4972-86c9-95ad9d4e6145', 'ad73d758-9783-4999-9068-10e103a9f716', 3, 'F = mv^2/r regardless of charge');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ad73d758-9783-4999-9068-10e103a9f716', '77a2fa64-163d-4b21-aa00-72b2395492d4', 'The magnetic (Lorentz) force on a moving charge is F = q(v x B), perpendicular to both velocity and the magnetic field.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('55ee329f-d7d6-4441-b5e9-111a4c935549', '49540965-3805-40bf-b729-7b60123f83aa', 18, 'Curie temperature is the temperature above which a ferromagnetic material:', 'Physics', 'Magnetism and Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d7f8d70-e600-4e7f-9778-3f0c78e6ba43', '55ee329f-d7d6-4441-b5e9-111a4c935549', 0, 'Becomes superconducting');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1f26290-0cb9-4575-ab94-bbdf0f2cf486', '55ee329f-d7d6-4441-b5e9-111a4c935549', 1, 'Loses its ferromagnetic properties and becomes paramagnetic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5174ad3e-b852-47a6-bd21-cf060a1f57ea', '55ee329f-d7d6-4441-b5e9-111a4c935549', 2, 'Becomes diamagnetic');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb51dcdb-4615-4266-ba94-5953d2d4f5a4', '55ee329f-d7d6-4441-b5e9-111a4c935549', 3, 'Melts completely');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('55ee329f-d7d6-4441-b5e9-111a4c935549', 'b1f26290-0cb9-4575-ab94-bbdf0f2cf486', 'Above the Curie temperature, thermal agitation disrupts the aligned magnetic domains in a ferromagnetic material, and it behaves as a paramagnetic material instead.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ce859102-bce2-4336-bba4-b91bfd51a8c8', '49540965-3805-40bf-b729-7b60123f83aa', 19, 'Eddy currents are:', 'Physics', 'Electromagnetic Induction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5decf5a-77d4-4855-9b41-af9d5fe7d41c', 'ce859102-bce2-4336-bba4-b91bfd51a8c8', 0, 'Currents induced in the bulk of a conductor due to changing magnetic flux, circulating in closed loops');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c34ad35-6f1c-40f9-9b39-69ce826e2552', 'ce859102-bce2-4336-bba4-b91bfd51a8c8', 1, 'Currents that flow only through wires, never through solid conductors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4dab632e-0912-4297-bce1-b3601b3dc37d', 'ce859102-bce2-4336-bba4-b91bfd51a8c8', 2, 'Always desirable in all electrical machines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63486e29-69bc-46dc-a0dd-dc669cf3e7d8', 'ce859102-bce2-4336-bba4-b91bfd51a8c8', 3, 'Independent of the rate of change of magnetic flux');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ce859102-bce2-4336-bba4-b91bfd51a8c8', 'e5decf5a-77d4-4855-9b41-af9d5fe7d41c', 'Eddy currents are induced circulating currents within a bulk conductor caused by a changing magnetic flux, often causing energy loss as heat (though sometimes usefully exploited, e.g., in induction furnaces or magnetic braking).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9544fc60-268e-4878-a299-11a8bef728ee', '49540965-3805-40bf-b729-7b60123f83aa', 20, 'The rms (root mean square) value of an alternating current is defined such that it produces:', 'Physics', 'Alternating Current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbb05ac9-f24a-492a-b4a8-7ae2eaa512fd', '9544fc60-268e-4878-a299-11a8bef728ee', 0, 'Zero average heating effect over a cycle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aca7d4ea-090f-46dd-8a55-71ad2205c47c', '9544fc60-268e-4878-a299-11a8bef728ee', 1, 'The same heating effect in a resistor as an equivalent value of direct current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dad34558-ec9b-470b-aa2d-a90bca468050', '9544fc60-268e-4878-a299-11a8bef728ee', 2, 'Twice the heating effect of the peak current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1d0af8c-8528-475d-bad0-1ab0896c1bb9', '9544fc60-268e-4878-a299-11a8bef728ee', 3, 'A constant instantaneous value at all times');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9544fc60-268e-4878-a299-11a8bef728ee', 'aca7d4ea-090f-46dd-8a55-71ad2205c47c', 'The rms value of AC is defined as the equivalent DC value that would produce the same average heating (power dissipation) effect in a resistive load over one full cycle.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5ec8bf98-8225-4797-a696-4d15dc90fa2b', '49540965-3805-40bf-b729-7b60123f83aa', 21, 'The power of a lens is measured in units of:', 'Physics', 'Ray Optics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db7349df-9211-4554-9d07-bcf50544a03b', '5ec8bf98-8225-4797-a696-4d15dc90fa2b', 0, 'Metres');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5f96c26-342e-44f8-a64d-bdb71bed33ca', '5ec8bf98-8225-4797-a696-4d15dc90fa2b', 1, 'Dioptres (reciprocal of focal length in metres)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f00a5573-6538-4ba8-a3ac-75d2add5e00a', '5ec8bf98-8225-4797-a696-4d15dc90fa2b', 2, 'Watts');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94ff5df2-4e9e-42a3-a93c-ae14b8b3befe', '5ec8bf98-8225-4797-a696-4d15dc90fa2b', 3, 'Candela');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5ec8bf98-8225-4797-a696-4d15dc90fa2b', 'b5f96c26-342e-44f8-a64d-bdb71bed33ca', 'Lens power P = 1/f (f in metres), measured in dioptres (D) — a converging lens has positive power, a diverging lens negative power.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('46220dbd-d3a7-45e7-b404-695d0abca221', '49540965-3805-40bf-b729-7b60123f83aa', 22, 'Diffraction of light refers to:', 'Physics', 'Wave Optics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8493fe5d-d739-4670-b2a3-a57e7fd1e4d1', '46220dbd-d3a7-45e7-b404-695d0abca221', 0, 'The bending of light around obstacles or through small apertures comparable in size to its wavelength');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('083b4544-9ce1-48e7-97e1-a496d1632513', '46220dbd-d3a7-45e7-b404-695d0abca221', 1, 'The reflection of light off a mirror');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7b3518b-353e-4629-b049-6af48148ac25', '46220dbd-d3a7-45e7-b404-695d0abca221', 2, 'The splitting of white light into its component colours by a prism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('894409e1-9309-45e7-8b4a-d0a7f1ea5ff1', '46220dbd-d3a7-45e7-b404-695d0abca221', 3, 'The bending of light while passing between two media of different refractive index');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('46220dbd-d3a7-45e7-b404-695d0abca221', '8493fe5d-d739-4670-b2a3-a57e7fd1e4d1', 'Diffraction is the bending/spreading of waves around obstacles or through narrow slits/apertures whose size is comparable to the wavelength — refraction (bending at a medium boundary) and dispersion (splitting by wavelength) are distinct phenomena.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('80a930e5-f7b1-4cea-a678-3f4ade1ce84e', '49540965-3805-40bf-b729-7b60123f83aa', 23, 'The stopping potential in a photoelectric experiment is the minimum retarding potential required to:', 'Physics', 'Dual Nature of Radiation and Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c17af45-aca2-499a-83bc-70237517ca5a', '80a930e5-f7b1-4cea-a678-3f4ade1ce84e', 0, 'Increase the photoelectric current to its maximum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dcb13407-3f72-479a-be3c-52fb4ec68273', '80a930e5-f7b1-4cea-a678-3f4ade1ce84e', 1, 'Just stop even the most energetic photoelectrons from reaching the collector');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f45128ec-ff64-4daa-9f0f-37a7f002eaab', '80a930e5-f7b1-4cea-a678-3f4ade1ce84e', 2, 'Double the incident light''s intensity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4360e280-af41-4adb-9cfd-8d8c63b60525', '80a930e5-f7b1-4cea-a678-3f4ade1ce84e', 3, 'Change the frequency of incident light');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('80a930e5-f7b1-4cea-a678-3f4ade1ce84e', 'dcb13407-3f72-479a-be3c-52fb4ec68273', 'Stopping potential V0 is the minimum reverse voltage that just prevents even the fastest (highest KE) photoelectrons from reaching the collector, giving eV0 = KE_max.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('eddde538-e3df-4ac9-a4ed-5d9669981752', '49540965-3805-40bf-b729-7b60123f83aa', 24, 'The wavelengths emitted in the Balmer series of the hydrogen spectrum correspond to electron transitions ending at which energy level?', 'Physics', 'Atoms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d4423f8d-501a-4dbb-b6b5-dfb389762325', 'eddde538-e3df-4ac9-a4ed-5d9669981752', 0, 'n=1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7dd1bb74-0572-4907-bf8d-19bd8a91915a', 'eddde538-e3df-4ac9-a4ed-5d9669981752', 1, 'n=2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d5fda502-4c10-4378-980a-e6c3f170dafe', 'eddde538-e3df-4ac9-a4ed-5d9669981752', 2, 'n=3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('491de000-7103-4580-9f9b-1a00f1b16482', 'eddde538-e3df-4ac9-a4ed-5d9669981752', 3, 'n=infinity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('eddde538-e3df-4ac9-a4ed-5d9669981752', '7dd1bb74-0572-4907-bf8d-19bd8a91915a', 'The Balmer series consists of transitions from higher energy levels (n=3,4,5...) down to n=2, and lies mostly in the visible region of the spectrum.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('65d94d24-88fc-4468-a6e3-d028d8cc0d8f', '49540965-3805-40bf-b729-7b60123f83aa', 25, 'The half-life of a radioactive substance is the time required for:', 'Physics', 'Nuclei');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1ab5aaf-d32b-4bfc-835d-3d8443b6c68f', '65d94d24-88fc-4468-a6e3-d028d8cc0d8f', 0, 'All the radioactive nuclei to decay completely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be67c288-8d97-4d4d-9f3a-e58bb8ba6970', '65d94d24-88fc-4468-a6e3-d028d8cc0d8f', 1, 'Half of the initial number of radioactive nuclei to decay');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6bc1fcd8-a56e-425d-b2f1-7cb68dcf2c54', '65d94d24-88fc-4468-a6e3-d028d8cc0d8f', 2, 'The substance''s mass to double');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06cefff4-42ce-4b66-be76-ef919233244d', '65d94d24-88fc-4468-a6e3-d028d8cc0d8f', 3, 'The decay constant to become zero');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('65d94d24-88fc-4468-a6e3-d028d8cc0d8f', 'be67c288-8d97-4d4d-9f3a-e58bb8ba6970', 'Half-life (T_half) is defined as the time taken for exactly half of the radioactive nuclei in a sample to undergo decay, related to the decay constant by T_half = ln(2)/lambda.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('37b3496e-fd0f-43d7-a177-e6c6a49f85bd', '49540965-3805-40bf-b729-7b60123f83aa', 26, 'A Zener diode is specially designed to operate in the:', 'Physics', 'Semiconductor Electronics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf0eb90c-e46d-4e46-8b3e-b9a335802708', '37b3496e-fd0f-43d7-a177-e6c6a49f85bd', 0, 'Forward bias region only, like a regular diode');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97b663a8-7ee2-49d1-8dea-72960f8d1d99', '37b3496e-fd0f-43d7-a177-e6c6a49f85bd', 1, 'Reverse breakdown region, maintaining a nearly constant voltage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38a1f12d-1a0d-4939-a0f4-80b9ff83cd1c', '37b3496e-fd0f-43d7-a177-e6c6a49f85bd', 2, 'Cut-off region exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0bb08059-51fc-4bc8-82b3-fe8393fda2b4', '37b3496e-fd0f-43d7-a177-e6c6a49f85bd', 3, 'Saturation region of a transistor');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('37b3496e-fd0f-43d7-a177-e6c6a49f85bd', '97b663a8-7ee2-49d1-8dea-72960f8d1d99', 'Zener diodes are designed to safely operate in reverse breakdown, maintaining a nearly constant voltage across a range of currents — widely used as voltage regulators.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('09d23f71-416b-441f-8f1a-d85e1b8b2909', '49540965-3805-40bf-b729-7b60123f83aa', 27, 'Modulation, in the context of communication systems, refers to:', 'Physics', 'Communication Systems');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5330fa5-26a1-4212-a28a-462c4790492a', '09d23f71-416b-441f-8f1a-d85e1b8b2909', 0, 'The process of decoding a received signal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6150fff1-658d-4bf2-89a1-9412c45b26e2', '09d23f71-416b-441f-8f1a-d85e1b8b2909', 1, 'Superimposing a low-frequency message (baseband) signal onto a high-frequency carrier wave for transmission');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2cf277fa-7c33-480d-8c17-10d7b24767de', '09d23f71-416b-441f-8f1a-d85e1b8b2909', 2, 'Amplifying a signal without changing its frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb37e179-bfc5-4057-a3e9-75227ec74140', '09d23f71-416b-441f-8f1a-d85e1b8b2909', 3, 'Filtering out unwanted noise only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('09d23f71-416b-441f-8f1a-d85e1b8b2909', '6150fff1-658d-4bf2-89a1-9412c45b26e2', 'Modulation combines a low-frequency information (baseband) signal with a high-frequency carrier wave, enabling efficient transmission over long distances via antennas of practical size.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('17a17ea9-cf60-45e6-9680-f0360d83fd35', '49540965-3805-40bf-b729-7b60123f83aa', 28, 'Centripetal acceleration of a body moving in a circle of radius r with speed v is directed:', 'Physics', 'Motion in a Plane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a486ffe-b79c-4a74-95c1-a1cb3fc7941c', '17a17ea9-cf60-45e6-9680-f0360d83fd35', 0, 'Tangent to the circle in the direction of motion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b6b641e-c5bb-4341-9ebd-d40ea024c92e', '17a17ea9-cf60-45e6-9680-f0360d83fd35', 1, 'Radially outward, away from the centre');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04009af9-6a9b-41a1-b9e3-b945b1dacf2d', '17a17ea9-cf60-45e6-9680-f0360d83fd35', 2, 'Radially inward, toward the centre of the circle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49c64434-2e4d-451c-b15d-7c100dd8db5a', '17a17ea9-cf60-45e6-9680-f0360d83fd35', 3, 'Vertically upward regardless of the circle''s orientation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('17a17ea9-cf60-45e6-9680-f0360d83fd35', '04009af9-6a9b-41a1-b9e3-b945b1dacf2d', 'Centripetal acceleration, a = v^2/r, always points radially inward toward the centre of the circular path, responsible for continuously changing the direction of velocity.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6e614588-7009-4edf-a6fd-433ec6bb1519', '49540965-3805-40bf-b729-7b60123f83aa', 29, 'A refrigerator works on the principle of:', 'Physics', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9fcc6340-fcd2-44a5-b9c4-40d35437f77b', '6e614588-7009-4edf-a6fd-433ec6bb1519', 0, 'Converting mechanical work entirely into heat with no external energy input');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9fb71de-a9e0-4f80-9800-1614c9cbc04c', '6e614588-7009-4edf-a6fd-433ec6bb1519', 1, 'Transferring heat from a cold reservoir to a hot reservoir using external work input (reverse of a heat engine)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06dc047f-09ed-4215-b332-5f1198947010', '6e614588-7009-4edf-a6fd-433ec6bb1519', 2, 'Spontaneous heat flow from cold to hot with no work done');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4077675-698d-475b-884c-a69f7fd03ae5', '6e614588-7009-4edf-a6fd-433ec6bb1519', 3, 'Generating heat internally without any external power');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6e614588-7009-4edf-a6fd-433ec6bb1519', 'a9fb71de-a9e0-4f80-9800-1614c9cbc04c', 'A refrigerator is essentially a reverse heat engine: it uses external work (electrical energy) to extract heat from the cold interior and reject it to the warmer surroundings — this does not violate the second law since external work is supplied.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e7136020-e6e8-40dc-8b54-fafc8d468eec', '49540965-3805-40bf-b729-7b60123f83aa', 30, 'The drift velocity of electrons in a conductor carrying current is:', 'Physics', 'Current Electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('149015a3-99c8-4727-a460-47fe9671dd1a', 'e7136020-e6e8-40dc-8b54-fafc8d468eec', 0, 'Of the order of the speed of light');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('616a75c9-bfc2-4080-8e92-a9ecbb5be797', 'e7136020-e6e8-40dc-8b54-fafc8d468eec', 1, 'A relatively small average velocity superimposed on the random thermal motion of electrons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5b22441-3ce5-42f3-a0ca-59ad5460abb0', 'e7136020-e6e8-40dc-8b54-fafc8d468eec', 2, 'Always zero when current flows');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d748e358-9c9c-46ff-b752-5b1a8dfebf83', 'e7136020-e6e8-40dc-8b54-fafc8d468eec', 3, 'Equal to the speed of the electric field''s propagation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e7136020-e6e8-40dc-8b54-fafc8d468eec', '616a75c9-bfc2-4080-8e92-a9ecbb5be797', 'Drift velocity (typically ~mm/s) is the small net average velocity electrons acquire due to an applied electric field, superimposed on their much faster random thermal motion — the electric signal itself propagates near light speed, but individual electron drift is slow.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ec148289-a758-43ee-a6ab-86f078b165f0', '49540965-3805-40bf-b729-7b60123f83aa', 31, 'A concave mirror is used as a shaving/makeup mirror because, when the face is placed within its focal length, it forms an image that is:', 'Physics', 'Ray Optics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9aa70e58-6811-4093-80b2-ceb2111e5cac', 'ec148289-a758-43ee-a6ab-86f078b165f0', 0, 'Real, inverted, and diminished');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ccb489a0-ae5e-442f-87c5-a136b07a3685', 'ec148289-a758-43ee-a6ab-86f078b165f0', 1, 'Virtual, erect, and magnified');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('efda29ca-13c2-48bf-a3c8-958997b62123', 'ec148289-a758-43ee-a6ab-86f078b165f0', 2, 'Real, erect, and same size');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b045df01-46fd-4c6a-b614-58872e722518', 'ec148289-a758-43ee-a6ab-86f078b165f0', 3, 'Virtual, inverted, and diminished');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ec148289-a758-43ee-a6ab-86f078b165f0', 'ccb489a0-ae5e-442f-87c5-a136b07a3685', 'When an object is placed between the pole and focus of a concave mirror, the image formed is virtual, erect, and magnified — ideal for shaving/makeup mirrors.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('bbd4fe35-db11-4955-9e9f-1dc976d3fba1', '49540965-3805-40bf-b729-7b60123f83aa', 32, 'The electromagnetic spectrum, in order of increasing wavelength, generally proceeds as:', 'Physics', 'Electromagnetic Waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bbf1d13a-a9e4-4308-a993-b5086ccd6542', 'bbd4fe35-db11-4955-9e9f-1dc976d3fba1', 0, 'Radio waves, microwaves, infrared, visible, ultraviolet, X-rays, gamma rays');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92079e85-430e-4141-a76b-519c0da08da3', 'bbd4fe35-db11-4955-9e9f-1dc976d3fba1', 1, 'Gamma rays, X-rays, ultraviolet, visible, infrared, microwaves, radio waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9928eeff-2199-4b15-986f-5099b6ece259', 'bbd4fe35-db11-4955-9e9f-1dc976d3fba1', 2, 'Visible, infrared, ultraviolet, X-rays, radio waves, gamma rays, microwaves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab29308a-2a0e-4573-9c82-7ad212952471', 'bbd4fe35-db11-4955-9e9f-1dc976d3fba1', 3, 'X-rays, gamma rays, radio waves, visible, infrared, ultraviolet, microwaves');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bbd4fe35-db11-4955-9e9f-1dc976d3fba1', '92079e85-430e-4141-a76b-519c0da08da3', 'In order of increasing wavelength (decreasing frequency/energy): gamma rays, X-rays, ultraviolet, visible light, infrared, microwaves, then radio waves.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6267bd52-79ba-403f-b69c-7a864706ac84', '49540965-3805-40bf-b729-7b60123f83aa', 33, 'The gravitational potential energy of a mass m at a height h near Earth''s surface, taking the surface as reference, is:', 'Physics', 'Gravitation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc74d7c3-615a-45a1-b748-69bce7f78c01', '6267bd52-79ba-403f-b69c-7a864706ac84', 0, 'mgh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9acdda4-8f5e-496e-8f1e-a169062313c9', '6267bd52-79ba-403f-b69c-7a864706ac84', 1, '-mgh');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1dc2f0b4-f4b3-4da5-adbe-0673acd099d9', '6267bd52-79ba-403f-b69c-7a864706ac84', 2, 'mgh^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2acb690-a11c-45d5-9046-55ffd007023a', '6267bd52-79ba-403f-b69c-7a864706ac84', 3, 'mg/h');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6267bd52-79ba-403f-b69c-7a864706ac84', 'bc74d7c3-615a-45a1-b748-69bce7f78c01', 'Near Earth''s surface (where g is approximately constant), gravitational PE relative to the surface is U = mgh.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('cea52233-0a46-43e0-a6f2-94315d2def0d', '49540965-3805-40bf-b729-7b60123f83aa', 34, 'The centre of mass of a uniform rigid rod of length L lies at:', 'Physics', 'System of Particles and Rotational Motion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9bfa203-de94-4fbb-b713-bb4c3d2a7bd7', 'cea52233-0a46-43e0-a6f2-94315d2def0d', 0, 'One end of the rod');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad6bdb20-a9a3-4c75-893b-11c026c7eea6', 'cea52233-0a46-43e0-a6f2-94315d2def0d', 1, 'The geometric centre, at L/2 from either end');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e746c0a2-0e28-450c-8239-ce3ae00dd25d', 'cea52233-0a46-43e0-a6f2-94315d2def0d', 2, 'Outside the rod');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df0a20dc-8ff6-470a-aa97-fc20e6e6a07a', 'cea52233-0a46-43e0-a6f2-94315d2def0d', 3, 'At the point of maximum mass concentration only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cea52233-0a46-43e0-a6f2-94315d2def0d', 'ad6bdb20-a9a3-4c75-893b-11c026c7eea6', 'For a uniform rod, mass is symmetrically distributed, so the centre of mass coincides with the geometric centre, at the midpoint.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9209c259-446f-4511-98f1-280f0341bfad', '49540965-3805-40bf-b729-7b60123f83aa', 35, 'Archimedes'' principle states that the buoyant force on a body submerged in a fluid equals:', 'Physics', 'Mechanical Properties of Fluids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd469da3-79ce-4445-8972-4dd2e4f6663b', '9209c259-446f-4511-98f1-280f0341bfad', 0, 'The weight of the body itself');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ec2e7a0f-8c93-4e13-ad33-ccf60dbd5fda', '9209c259-446f-4511-98f1-280f0341bfad', 1, 'The weight of the fluid displaced by the submerged part of the body');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bf0285c2-56c1-41c7-b917-c0158a8eee34', '9209c259-446f-4511-98f1-280f0341bfad', 2, 'The density of the fluid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1aa3bbfd-20f8-4ab2-a0b0-a672537183d8', '9209c259-446f-4511-98f1-280f0341bfad', 3, 'The volume of the body');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9209c259-446f-4511-98f1-280f0341bfad', 'ec2e7a0f-8c93-4e13-ad33-ccf60dbd5fda', 'Archimedes'' principle: the upward buoyant force equals the weight of the fluid displaced by the submerged portion of the object.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('40dae95d-5fd7-4514-a337-a4e076862896', '49540965-3805-40bf-b729-7b60123f83aa', 36, 'A stationary (standing) wave is formed by the superposition of:', 'Physics', 'Waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9916ac0c-90d8-47d2-a08e-9c41f14392d7', '40dae95d-5fd7-4514-a337-a4e076862896', 0, 'Two waves of different frequencies travelling in the same direction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('635bbbe6-a619-49fa-9276-0e5b92467fe4', '40dae95d-5fd7-4514-a337-a4e076862896', 1, 'Two identical waves travelling in opposite directions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fee3e6c1-757c-446b-aea0-0c72cafaf2ef', '40dae95d-5fd7-4514-a337-a4e076862896', 2, 'A single travelling wave reflecting off nothing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0176e00-ddaf-4210-8680-fd16814a50aa', '40dae95d-5fd7-4514-a337-a4e076862896', 3, 'Two waves of different amplitudes travelling in the same direction only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('40dae95d-5fd7-4514-a337-a4e076862896', '635bbbe6-a619-49fa-9276-0e5b92467fe4', 'A stationary wave results from the superposition of two waves of the same frequency and amplitude travelling in opposite directions, e.g., an incident and reflected wave on a string.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c2f8cda1-4273-4945-ac92-617c0434c29d', '49540965-3805-40bf-b729-7b60123f83aa', 37, 'A potentiometer is preferred over a voltmeter for measuring EMF precisely because:', 'Physics', 'Current Electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00c82c96-d3bd-4fb1-8c04-4a644cf46cb0', 'c2f8cda1-4273-4945-ac92-617c0434c29d', 0, 'A potentiometer draws current from the cell being measured, giving faster readings');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2eb1816f-e235-4624-845d-5e9c0f94ea62', 'c2f8cda1-4273-4945-ac92-617c0434c29d', 1, 'A potentiometer, at the balance point, draws no current from the cell, avoiding any voltage drop due to internal resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8171888-febf-4d80-a8ba-a4d7f6e33c29', 'c2f8cda1-4273-4945-ac92-617c0434c29d', 2, 'A voltmeter has infinite resistance always, making it equally accurate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d28f3f40-7d65-4b08-90c7-5aa2dedccbdf', 'c2f8cda1-4273-4945-ac92-617c0434c29d', 3, 'Potentiometers are cheaper to manufacture');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c2f8cda1-4273-4945-ac92-617c0434c29d', '2eb1816f-e235-4624-845d-5e9c0f94ea62', 'At the null/balance point, a potentiometer draws zero current from the cell under test, so there''s no potential drop across the cell''s internal resistance — giving a true EMF reading, unlike a voltmeter which always draws some finite current.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4f1feafa-f0a2-4116-9b4a-5a61503a8f8f', '49540965-3805-40bf-b729-7b60123f83aa', 38, 'A moving coil galvanometer can be converted into an ammeter (to measure larger currents) by connecting:', 'Physics', 'Moving Charges and Magnetism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d20eb39-8ac5-4b55-88f9-4ce2eb4b018b', '4f1feafa-f0a2-4116-9b4a-5a61503a8f8f', 0, 'A high resistance in series with the galvanometer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e3b61de-290b-4b31-b093-3b5fc4fbe5ae', '4f1feafa-f0a2-4116-9b4a-5a61503a8f8f', 1, 'A low resistance (shunt) in parallel with the galvanometer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e0edeb6-a42f-403b-856f-606b3ec11a40', '4f1feafa-f0a2-4116-9b4a-5a61503a8f8f', 2, 'Nothing; the galvanometer itself measures large currents directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3fdf5c5c-787f-46e1-9628-a95dfc19b74b', '4f1feafa-f0a2-4116-9b4a-5a61503a8f8f', 3, 'A capacitor in series');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4f1feafa-f0a2-4116-9b4a-5a61503a8f8f', '2e3b61de-290b-4b31-b093-3b5fc4fbe5ae', 'A low-value shunt resistance connected in parallel diverts most of the current around the galvanometer coil, allowing only a small, safe fraction through it — extending its range to measure large currents as an ammeter.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('06d563bc-c7d3-466a-8330-61a93054d040', '49540965-3805-40bf-b729-7b60123f83aa', 39, 'In a common-emitter transistor amplifier configuration, the output signal is:', 'Physics', 'Semiconductor Electronics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7178655-3f09-4bdf-a20b-e55b118a59f4', '06d563bc-c7d3-466a-8330-61a93054d040', 0, 'In phase with the input signal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da1adbdd-b782-4511-a198-be144e30f727', '06d563bc-c7d3-466a-8330-61a93054d040', 1, '180 degrees out of phase with the input signal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f3205a50-565e-4f6c-827e-971da404b221', '06d563bc-c7d3-466a-8330-61a93054d040', 2, 'Always zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc614f5a-08fd-4ea2-a543-bca3a128fccf', '06d563bc-c7d3-466a-8330-61a93054d040', 3, 'Independent of the input signal entirely');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('06d563bc-c7d3-466a-8330-61a93054d040', 'da1adbdd-b782-4511-a198-be144e30f727', 'A common-emitter amplifier characteristically produces an output voltage signal that is inverted (180 degrees out of phase) relative to the input signal.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c6ba7531-5c83-4474-921e-868cfd91723d', '49540965-3805-40bf-b729-7b60123f83aa', 40, 'Wien''s displacement law relates the wavelength of maximum emission (lambda_max) of a black body to its absolute temperature T as:', 'Physics', 'Thermal Properties of Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6e0ae39-0139-43ae-b37c-08f29c9abb2f', 'c6ba7531-5c83-4474-921e-868cfd91723d', 0, 'lambda_max is directly proportional to T');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('98e32f49-afaa-40db-adbf-bb2bf9a83230', 'c6ba7531-5c83-4474-921e-868cfd91723d', 1, 'lambda_max is inversely proportional to T');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7b57d9d-e9c5-49d2-a2a6-08251f675a08', 'c6ba7531-5c83-4474-921e-868cfd91723d', 2, 'lambda_max is independent of T');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c712a117-ecd7-49c7-980f-560d3baf18b9', 'c6ba7531-5c83-4474-921e-868cfd91723d', 3, 'lambda_max is proportional to T^4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c6ba7531-5c83-4474-921e-868cfd91723d', '98e32f49-afaa-40db-adbf-bb2bf9a83230', 'Wien''s displacement law: lambda_max * T = constant (Wien''s constant), so lambda_max decreases as temperature increases — hotter bodies emit peak radiation at shorter wavelengths.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4c64c02c-190a-4993-b3f7-12d4be938c0f', '49540965-3805-40bf-b729-7b60123f83aa', 41, 'When capacitors are connected in parallel, the equivalent capacitance is:', 'Physics', 'Electrostatic Potential and Capacitance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bc3f5e4-2825-4474-ae11-48ae390fffae', '4c64c02c-190a-4993-b3f7-12d4be938c0f', 0, 'Less than the smallest individual capacitance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('439dd901-237f-4ed0-b02e-773dfa24444c', '4c64c02c-190a-4993-b3f7-12d4be938c0f', 1, 'Equal to the sum of the individual capacitances');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3965f032-8f0c-4204-8fb8-bb911b7d90c0', '4c64c02c-190a-4993-b3f7-12d4be938c0f', 2, 'Equal to the reciprocal of the sum of reciprocals of individual capacitances');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6556846-2a1b-4119-a23e-5703cfd7815b', '4c64c02c-190a-4993-b3f7-12d4be938c0f', 3, 'Always equal to one of the individual capacitances');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4c64c02c-190a-4993-b3f7-12d4be938c0f', '439dd901-237f-4ed0-b02e-773dfa24444c', 'For capacitors in parallel, C_eq = C1 + C2 + ..., always greater than the largest individual capacitor (opposite behavior to series combination).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2995871c-7d18-475e-a783-884b1e21a87a', '49540965-3805-40bf-b729-7b60123f83aa', 42, 'The degrees of freedom of a monatomic gas molecule (translational only) is:', 'Physics', 'Kinetic Theory');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0359c1b0-1e1f-4e53-ad84-c090909bec70', '2995871c-7d18-475e-a783-884b1e21a87a', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f26eb64-3699-4a27-a6a8-4d024877ff1c', '2995871c-7d18-475e-a783-884b1e21a87a', 1, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfc726a9-737d-43f7-8052-a829e4d518fe', '2995871c-7d18-475e-a783-884b1e21a87a', 2, '5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f8dea78-5e8e-4c21-97e4-86196ce4942b', '2995871c-7d18-475e-a783-884b1e21a87a', 3, '6');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2995871c-7d18-475e-a783-884b1e21a87a', '0f26eb64-3699-4a27-a6a8-4d024877ff1c', 'A monatomic gas molecule (e.g., helium, argon) has only 3 translational degrees of freedom (motion along x, y, z axes), with no rotational or vibrational modes considered at typical temperatures.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9f0f45d4-385d-4162-b2dd-b0fffd5fb7bc', '49540965-3805-40bf-b729-7b60123f83aa', 43, 'A collision in which kinetic energy is conserved is called:', 'Physics', 'Work, Energy and Power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df44b484-a077-4763-98ff-781496c6d2ea', '9f0f45d4-385d-4162-b2dd-b0fffd5fb7bc', 0, 'A perfectly inelastic collision');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b584788a-525c-452f-8f9a-77ad134019b8', '9f0f45d4-385d-4162-b2dd-b0fffd5fb7bc', 1, 'A perfectly elastic collision');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('371e0d40-d714-4f16-b3db-f61d9a35299c', '9f0f45d4-385d-4162-b2dd-b0fffd5fb7bc', 2, 'An explosive collision');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7be141b0-be54-4fd5-96f8-e9858c55023d', '9f0f45d4-385d-4162-b2dd-b0fffd5fb7bc', 3, 'A collision that cannot occur in nature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9f0f45d4-385d-4162-b2dd-b0fffd5fb7bc', 'b584788a-525c-452f-8f9a-77ad134019b8', 'In a perfectly elastic collision, both momentum and kinetic energy are conserved; in an inelastic collision, momentum is conserved but some kinetic energy converts to other forms (heat, sound, deformation).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b82bc1d4-aa68-4266-a3f6-7564eee634a9', '49540965-3805-40bf-b729-7b60123f83aa', 44, 'The total mechanical energy of a particle executing simple harmonic motion, at any point during its oscillation (ignoring damping), is:', 'Physics', 'Oscillations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d6b3b59-9a14-464c-b65c-2ca306b39869', 'b82bc1d4-aa68-4266-a3f6-7564eee634a9', 0, 'Constant, equal to the sum of its instantaneous kinetic and potential energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e39a45f4-3e63-46df-a47f-f59cb9c89fe9', 'b82bc1d4-aa68-4266-a3f6-7564eee634a9', 1, 'Zero at the mean position');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de5805bd-aea8-456c-bc21-82e5c44e6d9e', 'b82bc1d4-aa68-4266-a3f6-7564eee634a9', 2, 'Maximum only at the extreme positions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4dfc218-25ef-4aa7-9afa-ba97c83b7e65', 'b82bc1d4-aa68-4266-a3f6-7564eee634a9', 3, 'Continuously increasing over time');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b82bc1d4-aa68-4266-a3f6-7564eee634a9', '4d6b3b59-9a14-464c-b65c-2ca306b39869', 'In undamped SHM, total mechanical energy (KE + PE) remains constant throughout the motion, though it continuously converts between kinetic (max at mean position) and potential (max at extremes) forms.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('fc53fae5-40c6-4405-91ba-aede8ce6d03f', '49540965-3805-40bf-b729-7b60123f83aa', 45, 'Gauss''s law relates the electric flux through a closed surface to:', 'Physics', 'Electric Charges and Fields');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('782f1d9d-13c0-4a5c-bc05-9d5b256928ae', 'fc53fae5-40c6-4405-91ba-aede8ce6d03f', 0, 'The surface area of the closed surface only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a033f8da-b04e-4f80-8483-90c881b643f5', 'fc53fae5-40c6-4405-91ba-aede8ce6d03f', 1, 'The net electric charge enclosed within that surface, divided by the permittivity of free space');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('854e3ebd-0913-49c1-a74d-2fa93583ee18', 'fc53fae5-40c6-4405-91ba-aede8ce6d03f', 2, 'The distance to the nearest charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37f20055-399a-4255-8310-3e99b757e680', 'fc53fae5-40c6-4405-91ba-aede8ce6d03f', 3, 'The shape of the closed surface');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fc53fae5-40c6-4405-91ba-aede8ce6d03f', 'a033f8da-b04e-4f80-8483-90c881b643f5', 'Gauss''s law: total electric flux through a closed surface = q_enclosed / epsilon0, independent of the surface''s shape or size, depending only on the enclosed charge.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Chemistry (45 questions) — Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e0f125c7-cb87-4b1a-8b7f-18fd6ac26e75', '49540965-3805-40bf-b729-7b60123f83aa', 46, 'The law of conservation of mass states that in a chemical reaction, matter can neither be created nor destroyed. This means:', 'Chemistry', 'Some Basic Concepts of Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('023bd2e9-7cb4-4bb9-a540-57db478c78cc', 'e0f125c7-cb87-4b1a-8b7f-18fd6ac26e75', 0, 'The number of moles of reactants always equals the number of moles of products');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9c9682f-322e-488f-a70a-5bad7a8125e3', 'e0f125c7-cb87-4b1a-8b7f-18fd6ac26e75', 1, 'The total mass of reactants equals the total mass of products');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8068baaf-2185-4f68-92e8-8867bc25db90', 'e0f125c7-cb87-4b1a-8b7f-18fd6ac26e75', 2, 'The volume of reactants equals the volume of products');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33b6e230-a03b-4364-98fc-67f1396a1247', 'e0f125c7-cb87-4b1a-8b7f-18fd6ac26e75', 3, 'The number of molecules of reactants equals the number of molecules of products');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e0f125c7-cb87-4b1a-8b7f-18fd6ac26e75', 'a9c9682f-322e-488f-a70a-5bad7a8125e3', 'Conservation of mass concerns total MASS, not necessarily moles, volume, or molecule count, which can all change during a reaction even as total mass is conserved.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0853c599-afa7-470c-a538-79f829eeb3fc', '49540965-3805-40bf-b729-7b60123f83aa', 47, 'Isotopes of an element have the same atomic number but different:', 'Chemistry', 'Structure of Atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e290c307-7197-499d-a1c0-d2d4deb0a8de', '0853c599-afa7-470c-a538-79f829eeb3fc', 0, 'Number of protons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ff71e68-4d8b-4eb7-ba78-3ebc2f1cd0fa', '0853c599-afa7-470c-a538-79f829eeb3fc', 1, 'Mass number (due to differing neutron count)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce67938d-11be-4aa8-ad59-8bdc697f5857', '0853c599-afa7-470c-a538-79f829eeb3fc', 2, 'Number of electrons in a neutral atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f3177fd-b281-4fc0-8541-c67396f1638f', '0853c599-afa7-470c-a538-79f829eeb3fc', 3, 'Chemical properties entirely');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0853c599-afa7-470c-a538-79f829eeb3fc', '4ff71e68-4d8b-4eb7-ba78-3ebc2f1cd0fa', 'Isotopes share the same number of protons (atomic number) but differ in neutron number, giving different mass numbers; their chemical properties remain essentially the same since these depend on electron configuration.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f10a7f56-5db4-4760-94f0-e23ac8d962ad', '49540965-3805-40bf-b729-7b60123f83aa', 48, 'Electronegativity generally increases across a period from left to right because:', 'Chemistry', 'Classification of Elements and Periodicity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9eca95c-dd71-4e4d-b850-8257dbd78025', 'f10a7f56-5db4-4760-94f0-e23ac8d962ad', 0, 'Atomic size increases across a period');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a02d510-85ce-42a2-a8cc-88e06ae99016', 'f10a7f56-5db4-4760-94f0-e23ac8d962ad', 1, 'Effective nuclear charge increases, pulling bonding electrons more strongly toward the nucleus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('452a6dab-0c43-4ea1-815e-0dfd2150f40f', 'f10a7f56-5db4-4760-94f0-e23ac8d962ad', 2, 'The number of shells increases across a period');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a2b70e7-bb1c-441c-833b-a49a66d84f41', 'f10a7f56-5db4-4760-94f0-e23ac8d962ad', 3, 'Electron affinity always decreases across a period');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f10a7f56-5db4-4760-94f0-e23ac8d962ad', '9a02d510-85ce-42a2-a8cc-88e06ae99016', 'Increasing effective nuclear charge across a period (at roughly constant shielding) increases an atom''s pull on shared bonding electrons, increasing electronegativity.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('62511299-ec34-44e9-8df5-16f9803ea881', '49540965-3805-40bf-b729-7b60123f83aa', 49, 'A sigma (sigma) bond is formed by:', 'Chemistry', 'Chemical Bonding and Molecular Structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('709374f6-9bda-42c3-8bf1-b85603c16213', '62511299-ec34-44e9-8df5-16f9803ea881', 0, 'Sideways (lateral) overlap of p-orbitals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a03c0d0f-e99d-4469-9d12-646a971c6997', '62511299-ec34-44e9-8df5-16f9803ea881', 1, 'Head-on (axial) overlap of atomic orbitals along the internuclear axis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2239a5a7-7302-4661-9c6a-79f63dafa2d3', '62511299-ec34-44e9-8df5-16f9803ea881', 2, 'Overlap of only d-orbitals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db711315-be94-4e6f-a53d-2e98679e5578', '62511299-ec34-44e9-8df5-16f9803ea881', 3, 'No orbital overlap at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('62511299-ec34-44e9-8df5-16f9803ea881', 'a03c0d0f-e99d-4469-9d12-646a971c6997', 'Sigma bonds form by head-on overlap of orbitals along the axis joining the two nuclei, allowing free rotation; pi bonds form by sideways overlap of parallel p-orbitals, restricting rotation.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('66c5f7a5-d8dd-411a-8aa9-1161c8f8f0ca', '49540965-3805-40bf-b729-7b60123f83aa', 50, 'Real gases deviate from ideal gas behavior most significantly at:', 'Chemistry', 'States of Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('514af8e7-4b76-4c7a-840e-6280dea7c786', '66c5f7a5-d8dd-411a-8aa9-1161c8f8f0ca', 0, 'High temperature and low pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f21d211d-be8f-420f-ac1c-5e5c14151bce', '66c5f7a5-d8dd-411a-8aa9-1161c8f8f0ca', 1, 'Low temperature and high pressure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('771ecb19-edfb-4801-b1d2-4e0af4a7de55', '66c5f7a5-d8dd-411a-8aa9-1161c8f8f0ca', 2, 'Standard temperature and pressure only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f456163-6603-4f50-9e75-521be6dd9e9d', '66c5f7a5-d8dd-411a-8aa9-1161c8f8f0ca', 3, 'Any temperature, as long as pressure is exactly 1 atm');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('66c5f7a5-d8dd-411a-8aa9-1161c8f8f0ca', 'f21d211d-be8f-420f-ac1c-5e5c14151bce', 'At low temperature and high pressure, intermolecular forces and the finite volume of gas molecules (both ignored in the ideal gas model) become significant, causing large deviations from ideal behavior.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('68d30f53-f3dd-4112-9e7d-d42d90a4d095', '49540965-3805-40bf-b729-7b60123f83aa', 51, 'Hess''s law of constant heat summation states that the total enthalpy change for a reaction is:', 'Chemistry', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ca71626-1651-48c4-b365-f86f724b1b30', '68d30f53-f3dd-4112-9e7d-d42d90a4d095', 0, 'Dependent on the specific pathway/number of steps taken');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0a64fab4-356d-4937-a213-fbf2c9e967e5', '68d30f53-f3dd-4112-9e7d-d42d90a4d095', 1, 'The same, regardless of the number of steps or pathway taken, as long as initial and final states are identical');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('29f8162e-3fed-429f-b119-193bee7254c5', '68d30f53-f3dd-4112-9e7d-d42d90a4d095', 2, 'Always zero for any multi-step reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('807893df-6bbd-4df6-9de5-e02660ddc9ab', '68d30f53-f3dd-4112-9e7d-d42d90a4d095', 3, 'Only valid for exothermic reactions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('68d30f53-f3dd-4112-9e7d-d42d90a4d095', '0a64fab4-356d-4937-a213-fbf2c9e967e5', 'Hess''s law follows from enthalpy being a state function — total delta H depends only on initial and final states, not the path or number of intermediate steps taken.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1919f45c-2366-40e0-8a47-8fa73801d754', '49540965-3805-40bf-b729-7b60123f83aa', 52, 'For a reaction at equilibrium, increasing the temperature of an exothermic reaction will, per Le Chatelier''s principle:', 'Chemistry', 'Equilibrium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ce8a206-5d0b-4e54-bd69-2a7e1a5185a4', '1919f45c-2366-40e0-8a47-8fa73801d754', 0, 'Shift equilibrium toward the products, increasing yield');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('582ba2e1-ee4b-4497-9404-aecf4a0caaab', '1919f45c-2366-40e0-8a47-8fa73801d754', 1, 'Shift equilibrium toward the reactants, decreasing product yield');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12542334-0528-40a3-bdc1-5b16f2ce227a', '1919f45c-2366-40e0-8a47-8fa73801d754', 2, 'Have no effect on the equilibrium position');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fed51b3e-12fb-453f-9ad6-6587310423f6', '1919f45c-2366-40e0-8a47-8fa73801d754', 3, 'Instantaneously stop the reaction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1919f45c-2366-40e0-8a47-8fa73801d754', '582ba2e1-ee4b-4497-9404-aecf4a0caaab', 'For an exothermic reaction, adding heat (as if it were a ''product'') shifts equilibrium backward toward reactants, per Le Chatelier''s principle, decreasing product yield at higher temperature.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7e82b4c8-5b05-4cd8-bf83-7e202f100bc9', '49540965-3805-40bf-b729-7b60123f83aa', 53, 'A disproportionation reaction is one in which:', 'Chemistry', 'Redox Reactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('971b8e36-2f81-47e4-997a-6553b1d8bc91', '7e82b4c8-5b05-4cd8-bf83-7e202f100bc9', 0, 'A single element is simultaneously oxidized and reduced');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07b7450d-5ad0-47ef-bb84-4e22f8493d10', '7e82b4c8-5b05-4cd8-bf83-7e202f100bc9', 1, 'Two different elements are both oxidized');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73dc0000-d359-44e4-a8fb-ee7015578233', '7e82b4c8-5b05-4cd8-bf83-7e202f100bc9', 2, 'No change in oxidation state occurs for any element');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d25ba36-5e66-49b2-a302-4b79b04a9af5', '7e82b4c8-5b05-4cd8-bf83-7e202f100bc9', 3, 'Only reduction occurs, with no oxidation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7e82b4c8-5b05-4cd8-bf83-7e202f100bc9', '971b8e36-2f81-47e4-997a-6553b1d8bc91', 'In disproportionation, the same element in a single species is simultaneously oxidized and reduced, producing two different oxidation states as products (e.g., Cl2 in cold dilute NaOH forming Cl- and OCl-).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('53f200cb-3c23-484c-b690-89afabdef5b3', '49540965-3805-40bf-b729-7b60123f83aa', 54, 'Hydrogen peroxide (H2O2) is often used as an oxidizing agent, but it can also act as a reducing agent when reacting with a stronger oxidizing agent. This dual behavior arises because:', 'Chemistry', 'Hydrogen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6bf59297-225d-4cad-8662-cc571b933be7', '53f200cb-3c23-484c-b690-89afabdef5b3', 0, 'Oxygen in H2O2 has an oxidation state of -1, intermediate between -2 (in water) and 0 (in O2)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e607f1a-2cba-4750-b0ff-cbdfef7f3ca5', '53f200cb-3c23-484c-b690-89afabdef5b3', 1, 'H2O2 has no oxygen atoms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33275780-d49a-47bf-b7e3-7f159e5cddd4', '53f200cb-3c23-484c-b690-89afabdef5b3', 2, 'Hydrogen in H2O2 has an unusual oxidation state of +2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab645f3a-de77-4b58-ad95-c7372d8bec0c', '53f200cb-3c23-484c-b690-89afabdef5b3', 3, 'H2O2 is always a pure reducing agent only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('53f200cb-3c23-484c-b690-89afabdef5b3', '6bf59297-225d-4cad-8662-cc571b933be7', 'Oxygen''s -1 oxidation state in H2O2 is intermediate, allowing it to be reduced further to -2 (acting as oxidizer) or oxidized to 0 in O2 (acting as reducer), depending on the reaction partner.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('adab90fb-7225-4def-a41d-35e3dafcf044', '49540965-3805-40bf-b729-7b60123f83aa', 55, 'Alkali metals (Group 1) are stored under kerosene oil primarily because:', 'Chemistry', 's-Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27a27735-1ad5-4f1f-a4af-dbe4fb95280a', 'adab90fb-7225-4def-a41d-35e3dafcf044', 0, 'They are highly reactive with air and moisture, and kerosene prevents this contact');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a1572d3f-9fcc-4365-9939-939704aa51f3', 'adab90fb-7225-4def-a41d-35e3dafcf044', 1, 'Kerosene increases their reactivity for lab use');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5ffd019-87da-469f-bece-49a2a7edeb56', 'adab90fb-7225-4def-a41d-35e3dafcf044', 2, 'They dissolve completely in kerosene for easy dispensing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d93ce43-a6b8-42a6-8c8b-d372e8f245c3', 'adab90fb-7225-4def-a41d-35e3dafcf044', 3, 'It improves their electrical conductivity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('adab90fb-7225-4def-a41d-35e3dafcf044', '27a27735-1ad5-4f1f-a4af-dbe4fb95280a', 'Alkali metals are extremely reactive with atmospheric oxygen and moisture; storing them under inert kerosene oil (in which they don''t dissolve or react) prevents unwanted oxidation/combustion.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5042b371-60a7-4814-bd90-4bcfc3c82490', '49540965-3805-40bf-b729-7b60123f83aa', 56, 'Isomers that have the same molecular formula but differ in the sequence of atomic connectivity (bonding pattern) are called:', 'Chemistry', 'Organic Chemistry — Basic Principles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc762488-2276-48ab-adaf-91e5248080ca', '5042b371-60a7-4814-bd90-4bcfc3c82490', 0, 'Stereoisomers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0cb23c36-278e-443a-a7be-545c0109b943', '5042b371-60a7-4814-bd90-4bcfc3c82490', 1, 'Structural (constitutional) isomers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8bddab7f-e45d-4074-b481-8471a15e452d', '5042b371-60a7-4814-bd90-4bcfc3c82490', 2, 'Conformers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c7eec7e-1564-427e-93f6-8ca48262b7d6', '5042b371-60a7-4814-bd90-4bcfc3c82490', 3, 'Enantiomers only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5042b371-60a7-4814-bd90-4bcfc3c82490', '0cb23c36-278e-443a-a7be-545c0109b943', 'Structural isomers share the same molecular formula but differ in how atoms are connected (chain, position, or functional group isomerism); stereoisomers share the same connectivity but differ in 3D spatial arrangement.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('161ee251-c67b-4f5d-84a4-eff061b13384', '49540965-3805-40bf-b729-7b60123f83aa', 57, 'Ozonolysis of an alkene is a reaction used to:', 'Chemistry', 'Hydrocarbons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dadec88b-08b9-4019-b8d3-0773b50cad77', '161ee251-c67b-4f5d-84a4-eff061b13384', 0, 'Polymerize the alkene into a long chain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dec21c02-671a-4133-862e-0bf33c9cb2bf', '161ee251-c67b-4f5d-84a4-eff061b13384', 1, 'Cleave the carbon-carbon double bond and identify the position of unsaturation via the resulting carbonyl products');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9be2bba3-d6b6-4050-82a5-aef1355e2d7d', '161ee251-c67b-4f5d-84a4-eff061b13384', 2, 'Convert the alkene into an alkane by simple addition of hydrogen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f25abe6-a2be-4a7e-b9e1-d6c00d6816a6', '161ee251-c67b-4f5d-84a4-eff061b13384', 3, 'Add halogens across the double bond without breaking it');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('161ee251-c67b-4f5d-84a4-eff061b13384', 'dec21c02-671a-4133-862e-0bf33c9cb2bf', 'Ozonolysis cleaves the C=C double bond, converting it into two carbonyl compounds (aldehydes/ketones), which is a classic method to deduce the original position of a double bond in an unknown alkene.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('aa975cef-8bc8-4b7b-8794-f37148f5754a', '49540965-3805-40bf-b729-7b60123f83aa', 58, 'Photochemical smog is primarily formed by the reaction of nitrogen oxides and hydrocarbons in the presence of:', 'Chemistry', 'Environmental Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28f78445-de7f-4b5a-8c30-38600ef4e7f6', 'aa975cef-8bc8-4b7b-8794-f37148f5754a', 0, 'Darkness and low temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2cb50cb6-f094-4815-b602-76f8e05987ad', 'aa975cef-8bc8-4b7b-8794-f37148f5754a', 1, 'Sunlight, producing secondary pollutants like ozone and PAN');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6083ef8-0aa4-4282-896f-6142def7a5e3', 'aa975cef-8bc8-4b7b-8794-f37148f5754a', 2, 'High humidity alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('757e4be2-8888-4adb-81f3-dd447bc441c9', 'aa975cef-8bc8-4b7b-8794-f37148f5754a', 3, 'Absence of any vehicular emissions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aa975cef-8bc8-4b7b-8794-f37148f5754a', '2cb50cb6-f094-4815-b602-76f8e05987ad', 'Photochemical smog forms when sunlight drives reactions between NOx and volatile hydrocarbons (largely from vehicle emissions), producing secondary pollutants such as ground-level ozone and peroxyacetyl nitrate (PAN).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c820f0bd-5edb-4aa4-af4f-c6086bf9ffaf', '49540965-3805-40bf-b729-7b60123f83aa', 59, 'In an ionic crystal like NaCl (rock salt structure), the coordination number of both Na+ and Cl- ions is:', 'Chemistry', 'Solid State');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17e2399d-e02e-46b8-bfae-7cb77d19b330', 'c820f0bd-5edb-4aa4-af4f-c6086bf9ffaf', 0, '4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3549a61d-223a-4721-b8f3-00d317ab3b7d', 'c820f0bd-5edb-4aa4-af4f-c6086bf9ffaf', 1, '6');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1adb9d81-dd01-4a56-85c4-ce364f51823b', 'c820f0bd-5edb-4aa4-af4f-c6086bf9ffaf', 2, '8');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc1ad59b-23b8-44ae-9a31-1eefefcd166d', 'c820f0bd-5edb-4aa4-af4f-c6086bf9ffaf', 3, '12');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c820f0bd-5edb-4aa4-af4f-c6086bf9ffaf', '3549a61d-223a-4721-b8f3-00d317ab3b7d', 'In the NaCl rock-salt structure, each ion is surrounded by 6 oppositely charged ions in an octahedral arrangement, giving a coordination number of 6 for both ions.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d18f92ba-d783-4559-9623-63d4789b9a03', '49540965-3805-40bf-b729-7b60123f83aa', 60, 'Colligative properties of a solution (such as boiling point elevation and freezing point depression) depend primarily on:', 'Chemistry', 'Solutions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6416cc1-b2e3-4251-b0dd-182e6bad4088', 'd18f92ba-d783-4559-9623-63d4789b9a03', 0, 'The chemical nature/identity of the solute particles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('465be0fd-578a-4a4a-8cae-dda0e147719d', 'd18f92ba-d783-4559-9623-63d4789b9a03', 1, 'The number of solute particles present in solution, not their identity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e8e6ef7-6080-43a1-bbae-d00ba41effc9', 'd18f92ba-d783-4559-9623-63d4789b9a03', 2, 'The color of the solute');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('115c115e-c56a-4add-ab36-d15f95bd16f6', 'd18f92ba-d783-4559-9623-63d4789b9a03', 3, 'The molecular weight of the solvent only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d18f92ba-d783-4559-9623-63d4789b9a03', '465be0fd-578a-4a4a-8cae-dda0e147719d', 'Colligative properties depend on the NUMBER of solute particles (moles, accounting for dissociation/association) dissolved, not on what the solute chemically is.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('aff81a3d-5d83-42a2-83f8-e0546d4e9740', '49540965-3805-40bf-b729-7b60123f83aa', 61, 'The standard hydrogen electrode (SHE) is assigned a reduction potential of exactly:', 'Chemistry', 'Electrochemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('636f98af-0b78-4289-9ec5-6cb1525d7799', 'aff81a3d-5d83-42a2-83f8-e0546d4e9740', 0, '+1.00 V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37108d85-ef65-4da2-b019-8737b1bef78b', 'aff81a3d-5d83-42a2-83f8-e0546d4e9740', 1, '0.00 V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19e17187-e720-441d-bf49-ae7e842642a0', 'aff81a3d-5d83-42a2-83f8-e0546d4e9740', 2, '-1.00 V');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e06be71f-5eb7-44e7-a590-0f428b771f86', 'aff81a3d-5d83-42a2-83f8-e0546d4e9740', 3, 'It varies with temperature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aff81a3d-5d83-42a2-83f8-e0546d4e9740', '37108d85-ef65-4da2-b019-8737b1bef78b', 'By convention, the standard hydrogen electrode is assigned an electrode potential of exactly 0.00 V at standard conditions, serving as the reference point against which all other electrode potentials are measured.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f8c4db05-b040-45e6-a856-a1c485d1fe6d', '49540965-3805-40bf-b729-7b60123f83aa', 62, 'For a zero-order reaction, the rate of reaction is:', 'Chemistry', 'Chemical Kinetics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e2d5ac5-de38-41c6-ab92-ac3dfb479754', 'f8c4db05-b040-45e6-a856-a1c485d1fe6d', 0, 'Directly proportional to the concentration of reactant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e33e725-51a7-4e80-9820-4124741d0dc3', 'f8c4db05-b040-45e6-a856-a1c485d1fe6d', 1, 'Independent of the concentration of reactant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5092b0cf-897b-440c-aba3-58f2f2e02740', 'f8c4db05-b040-45e6-a856-a1c485d1fe6d', 2, 'Inversely proportional to the concentration of reactant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d81036d-d6c2-4c39-97ba-186ca6ed621c', 'f8c4db05-b040-45e6-a856-a1c485d1fe6d', 3, 'Proportional to the square of the reactant concentration');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f8c4db05-b040-45e6-a856-a1c485d1fe6d', '3e33e725-51a7-4e80-9820-4124741d0dc3', 'In a zero-order reaction, rate = k[A]^0 = k, meaning the rate remains constant and independent of reactant concentration until the reactant is essentially exhausted.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f45e3a69-78e4-4777-a4c7-eb8b9759e067', '49540965-3805-40bf-b729-7b60123f83aa', 63, 'Electrolytic reduction is typically used to extract highly electropositive metals such as:', 'Chemistry', 'General Principles of Isolation of Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b412fc8-783f-48f9-8887-8914174525de', 'f45e3a69-78e4-4777-a4c7-eb8b9759e067', 0, 'Iron and copper, using a blast furnace');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b553f360-fa22-493d-ac8e-d4285d211a25', 'f45e3a69-78e4-4777-a4c7-eb8b9759e067', 1, 'Sodium and aluminium, which cannot easily be reduced by carbon');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('739f58aa-0add-469a-b66e-a911c890ffae', 'f45e3a69-78e4-4777-a4c7-eb8b9759e067', 2, 'Silver and gold, using cyanide leaching only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1cb9c58-a957-4eb0-833a-67af21521d36', 'f45e3a69-78e4-4777-a4c7-eb8b9759e067', 3, 'Zinc, exclusively via roasting');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f45e3a69-78e4-4777-a4c7-eb8b9759e067', 'b553f360-fa22-493d-ac8e-d4285d211a25', 'Highly reactive/electropositive metals like sodium and aluminium have such stable compounds that chemical reduction (e.g., by carbon) is ineffective; electrolysis of their molten salts/oxides is used instead.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7210017e-ccd1-4b50-a9b7-8da45eab184b', '49540965-3805-40bf-b729-7b60123f83aa', 64, 'The pungent-smelling gas produced by the reaction of concentrated sulfuric acid with a chloride salt, widely used to test for chloride ions (via the ''chromyl chloride test'' precursor), is:', 'Chemistry', 'p-Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7609271-36e3-475d-b9e6-bb30a2e6f622', '7210017e-ccd1-4b50-a9b7-8da45eab184b', 0, 'Sulfur dioxide (SO2)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f86cec59-874d-4895-bd2c-f0ee4a01b5b9', '7210017e-ccd1-4b50-a9b7-8da45eab184b', 1, 'Hydrogen chloride (HCl)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aded5de7-2e6c-4596-9f1b-97ec278bdd08', '7210017e-ccd1-4b50-a9b7-8da45eab184b', 2, 'Chlorine (Cl2) gas directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('565e265c-aa42-4579-91fd-a826bdce4cff', '7210017e-ccd1-4b50-a9b7-8da45eab184b', 3, 'Hydrogen sulfide (H2S)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7210017e-ccd1-4b50-a9b7-8da45eab184b', 'f86cec59-874d-4895-bd2c-f0ee4a01b5b9', 'Concentrated H2SO4 reacting with a chloride salt (e.g., NaCl) produces HCl gas, which fumes in moist air and is a classic qualitative test reaction for chloride ions.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('826269dc-805a-4c34-a896-437a2b1de1b0', '49540965-3805-40bf-b729-7b60123f83aa', 65, 'Lanthanoid contraction refers to the:', 'Chemistry', 'd and f Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1454d59d-cf22-494e-98d0-f12ab3521754', '826269dc-805a-4c34-a896-437a2b1de1b0', 0, 'Steady increase in atomic/ionic radii across the lanthanoid series');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('408cda6b-5d75-47e1-842b-1050df354958', '826269dc-805a-4c34-a896-437a2b1de1b0', 1, 'Steady decrease in atomic/ionic radii across the lanthanoid series due to poor shielding by 4f electrons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78f8bceb-d0fa-4006-a66f-9dcc718f301b', '826269dc-805a-4c34-a896-437a2b1de1b0', 2, 'Sudden expansion of atomic radii at the end of the series');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8291fa56-8f9b-427f-a6ed-790a8459675c', '826269dc-805a-4c34-a896-437a2b1de1b0', 3, 'Loss of all f-electrons in lanthanoid ions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('826269dc-805a-4c34-a896-437a2b1de1b0', '408cda6b-5d75-47e1-842b-1050df354958', 'As you move across the lanthanoid series, poor shielding by the diffuse 4f orbitals means increasing nuclear charge is not fully screened, causing a steady contraction in atomic and ionic radii — this has consequences for the similarity in radii of 4d and 5d transition elements.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ccd13570-e82b-404e-bc2d-4fe36a3440d9', '49540965-3805-40bf-b729-7b60123f83aa', 66, 'According to Werner''s theory of coordination compounds, the secondary valency of a metal ion corresponds to:', 'Chemistry', 'Coordination Compounds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('254d9f6f-67cb-49a6-9bc8-cd29516a56c4', 'ccd13570-e82b-404e-bc2d-4fe36a3440d9', 0, 'Its oxidation state');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5da23b0-dffc-4dcb-866b-515b8197b8c1', 'ccd13570-e82b-404e-bc2d-4fe36a3440d9', 1, 'Its coordination number — the number of ligands directly bonded to the central metal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d582ee6-59d2-4ced-90bc-b19d3291c273', 'ccd13570-e82b-404e-bc2d-4fe36a3440d9', 2, 'The total charge on the complex ion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b3733da-8725-411e-9bcc-21c62b6b2ffc', 'ccd13570-e82b-404e-bc2d-4fe36a3440d9', 3, 'The number of counter ions present');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ccd13570-e82b-404e-bc2d-4fe36a3440d9', 'b5da23b0-dffc-4dcb-866b-515b8197b8c1', 'Werner distinguished primary valency (oxidation state) from secondary valency, which is the coordination number — the fixed number of ligand groups directly and satisfying the coordination sphere around the central metal ion.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e1b1675b-42a8-4658-b8a3-3e5aeeda804b', '49540965-3805-40bf-b729-7b60123f83aa', 67, 'The Sandmeyer reaction is used to convert an aryl diazonium salt into an aryl halide using:', 'Chemistry', 'Haloalkanes and Haloarenes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c88c65df-e3c2-4ab6-abaa-52e3593578e2', 'e1b1675b-42a8-4658-b8a3-3e5aeeda804b', 0, 'Only heat, with no reagent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97b7d0c5-2105-43fd-b3f6-c2c77cfca851', 'e1b1675b-42a8-4658-b8a3-3e5aeeda804b', 1, 'Cuprous halide (Cu2X2) in the presence of the corresponding hydrohalic acid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1b07fef-e3fd-49a1-a042-3cbde6d6beed', 'e1b1675b-42a8-4658-b8a3-3e5aeeda804b', 2, 'Concentrated sulfuric acid alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f3ac6516-2030-4bdd-8b3d-1bf48dc84dfd', 'e1b1675b-42a8-4658-b8a3-3e5aeeda804b', 3, 'Sodium hydroxide solution');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e1b1675b-42a8-4658-b8a3-3e5aeeda804b', '97b7d0c5-2105-43fd-b3f6-c2c77cfca851', 'The Sandmeyer reaction replaces the diazonium group (-N2+) with a halogen (Cl, Br, or CN) using a cuprous salt catalyst, a key method for introducing halogens onto an aromatic ring at a specific position.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e5c6eb15-e169-4125-9794-8ccfa6421c6b', '49540965-3805-40bf-b729-7b60123f83aa', 68, 'The Williamson synthesis is a standard method for preparing:', 'Chemistry', 'Alcohols, Phenols and Ethers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da3e7d4b-6c65-453d-a72c-70b7f772712d', 'e5c6eb15-e169-4125-9794-8ccfa6421c6b', 0, 'Alcohols from aldehydes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42108970-ff56-4fde-8eea-1a0416a0f9e7', 'e5c6eb15-e169-4125-9794-8ccfa6421c6b', 1, 'Ethers, via reaction of an alkoxide ion with a primary alkyl halide (SN2 mechanism)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('410010b5-8a4c-4079-96f8-97a2a41095e0', 'e5c6eb15-e169-4125-9794-8ccfa6421c6b', 2, 'Ketones from alcohols');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a29f37e-1f06-4302-b1ee-fa88f930ef15', 'e5c6eb15-e169-4125-9794-8ccfa6421c6b', 3, 'Carboxylic acids from esters');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e5c6eb15-e169-4125-9794-8ccfa6421c6b', '42108970-ff56-4fde-8eea-1a0416a0f9e7', 'Williamson ether synthesis reacts a sodium alkoxide (RO-) with a primary alkyl halide (R''X) via SN2 substitution to form an ether (R-O-R''), a classic and reliable method for asymmetrical ether preparation.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('810e8ecf-63d4-4d16-81c0-a5d13eacc409', '49540965-3805-40bf-b729-7b60123f83aa', 69, 'The aldol condensation reaction requires the presence of:', 'Chemistry', 'Aldehydes, Ketones and Carboxylic Acids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('14a05089-efff-43fe-9f6e-70ab0969a8d1', '810e8ecf-63d4-4d16-81c0-a5d13eacc409', 0, 'An alpha-hydrogen atom adjacent to a carbonyl group');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d8139ae-8fcf-4ae1-810c-817ebb124933', '810e8ecf-63d4-4d16-81c0-a5d13eacc409', 1, 'Only aromatic aldehydes with no alpha-hydrogens');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a8bd0fa-333f-46ac-aea7-e5f799c9f1c5', '810e8ecf-63d4-4d16-81c0-a5d13eacc409', 2, 'A halogen substituent on the carbonyl carbon');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8731298-46b0-4807-b5d3-0f47156e2766', '810e8ecf-63d4-4d16-81c0-a5d13eacc409', 3, 'No catalyst of any kind, ever');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('810e8ecf-63d4-4d16-81c0-a5d13eacc409', '14a05089-efff-43fe-9f6e-70ab0969a8d1', 'Aldol condensation requires an aldehyde or ketone with at least one alpha-hydrogen, which is removed by a base to form an enolate that then attacks another carbonyl compound.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('58c14e5b-2a6a-4cde-90f6-be731678e3b3', '49540965-3805-40bf-b729-7b60123f83aa', 70, 'Diazonium salts, though unstable at room temperature, are useful synthetic intermediates because they can be converted into a wide range of functional groups including:', 'Chemistry', 'Amines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('205fc333-e16c-4f0c-9b25-d44fc4c46e17', '58c14e5b-2a6a-4cde-90f6-be731678e3b3', 0, 'Only back into the original amine, with no other transformations possible');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b128989a-e5fa-4d50-bfd1-d884aeb227b4', '58c14e5b-2a6a-4cde-90f6-be731678e3b3', 1, 'Aryl halides, phenols, nitriles, and azo dyes, among others');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('58f66e63-bff6-4542-8cb2-a20823530a46', '58c14e5b-2a6a-4cde-90f6-be731678e3b3', 2, 'Exclusively alkanes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94583a14-c0a6-4a9b-8c12-eea274d9a844', '58c14e5b-2a6a-4cde-90f6-be731678e3b3', 3, 'Only carboxylic acids');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('58c14e5b-2a6a-4cde-90f6-be731678e3b3', 'b128989a-e5fa-4d50-bfd1-d884aeb227b4', 'Diazonium salts are versatile synthetic intermediates: the -N2+ group can be replaced by -X (Sandmeyer), -OH (phenol), -CN, or coupled with phenols/amines to form colored azo dye compounds.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('04ee7349-c362-4713-8ff2-698bebb67fc2', '49540965-3805-40bf-b729-7b60123f83aa', 71, 'Denaturation of a protein refers to:', 'Chemistry', 'Biomolecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09ccbb49-394f-46ff-9f81-b7486b51cdf9', '04ee7349-c362-4713-8ff2-698bebb67fc2', 0, 'The breaking of peptide bonds in the primary structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48a25dab-43de-4a33-aa51-cbe81b8ff366', '04ee7349-c362-4713-8ff2-698bebb67fc2', 1, 'The loss of a protein''s native secondary/tertiary structure (and hence biological activity) without breaking the primary peptide bonds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd131009-440c-4ea9-9db3-68ba072bc80f', '04ee7349-c362-4713-8ff2-698bebb67fc2', 2, 'The addition of new amino acids to a protein');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c921656-a814-477b-8d5f-43910313d009', '04ee7349-c362-4713-8ff2-698bebb67fc2', 3, 'A permanent, always-reversible increase in enzyme activity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('04ee7349-c362-4713-8ff2-698bebb67fc2', '48a25dab-43de-4a33-aa51-cbe81b8ff366', 'Denaturation disrupts hydrogen bonds and other non-covalent interactions maintaining secondary/tertiary/quaternary structure (e.g., due to heat or pH change), typically destroying biological function, while the primary sequence (peptide bonds) remains intact.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f5c63993-2fa8-461b-9606-ebc562574ed8', '49540965-3805-40bf-b729-7b60123f83aa', 72, 'Nylon-6,6 is classified as a:', 'Chemistry', 'Polymers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbb9cae0-65be-4e9d-80fe-6a79d5066a41', 'f5c63993-2fa8-461b-9606-ebc562574ed8', 0, 'Natural polymer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b66f02f6-a612-4d42-985f-570706f8c8bf', 'f5c63993-2fa8-461b-9606-ebc562574ed8', 1, 'Synthetic condensation (step-growth) polymer, formed from a diamine and a diacid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ef5ac41-0c75-4739-95b9-e307c6ad76ef', 'f5c63993-2fa8-461b-9606-ebc562574ed8', 2, 'Addition polymer formed from a single monomer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6e99efa-fcbd-4337-870b-e9f0dd1bfbb0', 'f5c63993-2fa8-461b-9606-ebc562574ed8', 3, 'Semi-synthetic polymer derived directly from cellulose');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f5c63993-2fa8-461b-9606-ebc562574ed8', 'b66f02f6-a612-4d42-985f-570706f8c8bf', 'Nylon-6,6 is a synthetic polyamide formed by condensation polymerization between hexamethylenediamine and adipic acid, releasing water at each linkage — a step-growth, not addition, polymer.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('975b1462-2197-4ec8-9ce4-9040fa83def5', '49540965-3805-40bf-b729-7b60123f83aa', 73, 'Soaps are typically the sodium or potassium salts of:', 'Chemistry', 'Chemistry in Everyday Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3c0c931-28d1-474a-81ab-cee18f001977', '975b1462-2197-4ec8-9ce4-9040fa83def5', 0, 'Long-chain aromatic acids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a937500-987f-4a64-ab3f-9e5c080f6d7e', '975b1462-2197-4ec8-9ce4-9040fa83def5', 1, 'Long-chain fatty acids (higher carboxylic acids)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9fe06d7-293d-4a80-8245-d50a6371aee9', '975b1462-2197-4ec8-9ce4-9040fa83def5', 2, 'Amino acids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9dfd49f2-ae67-4752-ae23-d548f8b5e46f', '975b1462-2197-4ec8-9ce4-9040fa83def5', 3, 'Mineral acids like HCl');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('975b1462-2197-4ec8-9ce4-9040fa83def5', '9a937500-987f-4a64-ab3f-9e5c080f6d7e', 'Soaps are sodium/potassium salts of long-chain fatty acids, produced via the saponification (base hydrolysis) of fats and oils (triglycerides).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f7c0afdd-a128-4c57-ae56-9917e9426e23', '49540965-3805-40bf-b729-7b60123f83aa', 74, 'The solubility product (Ksp) of a sparingly soluble salt is used to predict:', 'Chemistry', 'Equilibrium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee01436f-6370-4942-a7d2-bc9763ba0fa4', 'f7c0afdd-a128-4c57-ae56-9917e9426e23', 0, 'The exact rate at which the salt dissolves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfe8eed9-4cb9-492f-b79a-ae604b35c172', 'f7c0afdd-a128-4c57-ae56-9917e9426e23', 1, 'Whether a precipitate will form given the ion concentrations present, by comparing the ionic product to Ksp');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('909f6f88-2a84-48be-b206-b5625bfccf01', 'f7c0afdd-a128-4c57-ae56-9917e9426e23', 2, 'The color of the resulting solution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0aea6012-f598-4002-ab98-135f7f0bcab9', 'f7c0afdd-a128-4c57-ae56-9917e9426e23', 3, 'The melting point of the salt');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f7c0afdd-a128-4c57-ae56-9917e9426e23', 'dfe8eed9-4cb9-492f-b79a-ae604b35c172', 'If the ionic product (calculated from actual ion concentrations) exceeds Ksp, precipitation occurs; if it is less than Ksp, the solution remains unsaturated with no precipitate forming.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ca1e8028-0150-41a1-ac71-5e40a2277cb7', '49540965-3805-40bf-b729-7b60123f83aa', 75, 'Hydrogen bonding, an especially strong type of dipole-dipole interaction, occurs when hydrogen is covalently bonded to a highly electronegative atom such as:', 'Chemistry', 'Chemical Bonding and Molecular Structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d30e62a6-c274-4050-8a65-85f26c390a45', 'ca1e8028-0150-41a1-ac71-5e40a2277cb7', 0, 'Carbon');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e5675f9-93cb-4922-8245-dd0706c53138', 'ca1e8028-0150-41a1-ac71-5e40a2277cb7', 1, 'Fluorine, oxygen, or nitrogen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6198087-83d8-4e3e-a038-c8d0d6c1599a', 'ca1e8028-0150-41a1-ac71-5e40a2277cb7', 2, 'Sulfur only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('adb39a29-78fc-4a3b-b124-33d92bd12aa5', 'ca1e8028-0150-41a1-ac71-5e40a2277cb7', 3, 'Any atom regardless of electronegativity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ca1e8028-0150-41a1-ac71-5e40a2277cb7', '4e5675f9-93cb-4922-8245-dd0706c53138', 'Hydrogen bonding specifically requires H bonded to a small, highly electronegative atom (F, O, or N), which creates a strong enough dipole for a significant intermolecular attraction to a lone pair on a neighboring electronegative atom.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6af999c1-bbcf-4226-b699-1d8eff801165', '49540965-3805-40bf-b729-7b60123f83aa', 76, 'Which of the following represents an impossible set of quantum numbers for an electron (n, l, m_l, m_s)?', 'Chemistry', 'Structure of Atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0c42567-11e4-49e1-9283-1aa97344d79f', '6af999c1-bbcf-4226-b699-1d8eff801165', 0, 'n=2, l=1, m_l=0, m_s=+1/2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc4adddc-e608-4283-af91-44beec8ae5d5', '6af999c1-bbcf-4226-b699-1d8eff801165', 1, 'n=3, l=2, m_l=-2, m_s=-1/2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60f95356-8767-4811-8f23-232b284db78b', '6af999c1-bbcf-4226-b699-1d8eff801165', 2, 'n=1, l=1, m_l=0, m_s=+1/2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b4059aa1-bfe4-48a0-b540-2e9b32cb8239', '6af999c1-bbcf-4226-b699-1d8eff801165', 3, 'n=2, l=0, m_l=0, m_s=-1/2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6af999c1-bbcf-4226-b699-1d8eff801165', '60f95356-8767-4811-8f23-232b284db78b', 'For n=1, the azimuthal quantum number l can only be 0 (since l ranges from 0 to n-1); l=1 is impossible when n=1, making this combination invalid.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9162c465-87cd-4c05-87cb-32a480296122', '49540965-3805-40bf-b729-7b60123f83aa', 77, 'The empirical formula of a compound represents:', 'Chemistry', 'Some Basic Concepts of Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('544c3eef-3036-4357-9e3e-acd78ccdfc8b', '9162c465-87cd-4c05-87cb-32a480296122', 0, 'The exact molecular formula in all cases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5cef00e4-0ad6-4ce8-904b-1be5468d7aeb', '9162c465-87cd-4c05-87cb-32a480296122', 1, 'The simplest whole-number ratio of atoms of each element present in the compound');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('600d806c-1659-4628-8e99-96c1d73e4591', '9162c465-87cd-4c05-87cb-32a480296122', 2, 'Only the number of moles of the compound');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c05d3861-cf45-41ef-a695-52b930a44f46', '9162c465-87cd-4c05-87cb-32a480296122', 3, 'The structural arrangement of atoms in space');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9162c465-87cd-4c05-87cb-32a480296122', '5cef00e4-0ad6-4ce8-904b-1be5468d7aeb', 'An empirical formula gives the simplest whole-number atomic ratio (e.g., CH2O for glucose), which may differ from the actual molecular formula (C6H12O6) by an integer multiple.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('83f175fa-8da4-47a2-8743-bb193c2f0815', '49540965-3805-40bf-b729-7b60123f83aa', 78, 'Electron affinity is defined as the energy change when:', 'Chemistry', 'Classification of Elements and Periodicity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fee9039e-1294-4c40-9966-9e214ee34df9', '83f175fa-8da4-47a2-8743-bb193c2f0815', 0, 'An electron is removed from a neutral gaseous atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c36f2ca0-4d03-41e1-961f-76bae45b6789', '83f175fa-8da4-47a2-8743-bb193c2f0815', 1, 'An electron is added to a neutral gaseous atom to form a negative ion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8683d1b-b1c0-48f9-a9d9-4b9b8b3d64a5', '83f175fa-8da4-47a2-8743-bb193c2f0815', 2, 'A proton is added to the nucleus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d82d236-11c0-478b-8e81-a624018fc842', '83f175fa-8da4-47a2-8743-bb193c2f0815', 3, 'A neutral atom loses a neutron');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('83f175fa-8da4-47a2-8743-bb193c2f0815', 'c36f2ca0-4d03-41e1-961f-76bae45b6789', 'Electron affinity is the energy released (or sometimes absorbed) when an electron is added to an isolated gaseous atom in its ground state, forming a mononegative ion.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f6a9cbe3-6244-4edd-8c02-7b141a30af6b', '49540965-3805-40bf-b729-7b60123f83aa', 79, 'Graham''s law of diffusion states that the rate of diffusion of a gas is:', 'Chemistry', 'States of Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('22805dee-e8f5-4027-8c3c-62ffdebd5c17', 'f6a9cbe3-6244-4edd-8c02-7b141a30af6b', 0, 'Directly proportional to the square root of its molar mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('515b1525-b03c-4b8e-8a6c-e1c8ce469f99', 'f6a9cbe3-6244-4edd-8c02-7b141a30af6b', 1, 'Inversely proportional to the square root of its molar mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26195e58-e13a-45b9-8ab6-e7a2bd3016f0', 'f6a9cbe3-6244-4edd-8c02-7b141a30af6b', 2, 'Independent of molar mass entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3f217d5-20ec-44d6-80d1-62629719c5b5', 'f6a9cbe3-6244-4edd-8c02-7b141a30af6b', 3, 'Directly proportional to its molar mass');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f6a9cbe3-6244-4edd-8c02-7b141a30af6b', '515b1525-b03c-4b8e-8a6c-e1c8ce469f99', 'Graham''s law: rate of diffusion is inversely proportional to the square root of molar mass — lighter gases diffuse faster than heavier ones at the same temperature/pressure.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('06a25600-4cf0-4db1-904a-5d4ed225e7f0', '49540965-3805-40bf-b729-7b60123f83aa', 80, 'The standard enthalpy of formation of an element in its most stable standard state is, by convention, defined as:', 'Chemistry', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c045c0d0-6ec9-4a0c-8353-00c15b89019f', '06a25600-4cf0-4db1-904a-5d4ed225e7f0', 0, 'Always positive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d47ed2ea-255c-42e1-a880-4eb9f00fc107', '06a25600-4cf0-4db1-904a-5d4ed225e7f0', 1, 'Zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0de471e4-ce48-45a7-81bb-378eb92b15f1', '06a25600-4cf0-4db1-904a-5d4ed225e7f0', 2, 'Always negative');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('450e6ae2-588e-4e3e-888f-d2e79139aeed', '06a25600-4cf0-4db1-904a-5d4ed225e7f0', 3, 'Equal to its atomic mass');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('06a25600-4cf0-4db1-904a-5d4ed225e7f0', 'd47ed2ea-255c-42e1-a880-4eb9f00fc107', 'By convention, the standard enthalpy of formation of any element in its most stable allotropic/physical form under standard conditions is taken as zero, serving as the reference point for calculating formation enthalpies of compounds.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('84c95b21-4b86-4298-b61c-78c91c7ff129', '49540965-3805-40bf-b729-7b60123f83aa', 81, 'In a balanced redox reaction, the total number of electrons lost by the reducing agent must equal the total number of electrons:', 'Chemistry', 'Redox Reactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5845b747-d720-45b5-96d4-96ec745415d8', '84c95b21-4b86-4298-b61c-78c91c7ff129', 0, 'Lost by the oxidizing agent as well');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('271c014f-b124-4242-a6db-d51d140a78e3', '84c95b21-4b86-4298-b61c-78c91c7ff129', 1, 'Gained by the oxidizing agent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5fb9d8a7-55a4-4ca8-90e8-8d469a528578', '84c95b21-4b86-4298-b61c-78c91c7ff129', 2, 'Remaining unchanged in the overall reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e26ecff6-05cd-4d1e-8903-3a1eec03a75a', '84c95b21-4b86-4298-b61c-78c91c7ff129', 3, 'Present in the entire reaction mixture initially');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('84c95b21-4b86-4298-b61c-78c91c7ff129', '271c014f-b124-4242-a6db-d51d140a78e3', 'Conservation of charge in redox reactions requires that electrons lost during oxidation (by the reducing agent) exactly equal electrons gained during reduction (by the oxidizing agent).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('afc57223-1deb-430b-9756-9b339d90946a', '49540965-3805-40bf-b729-7b60123f83aa', 82, 'The alkaline earth metals (Group 2) are generally:', 'Chemistry', 's-Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3fa6a0f2-e74a-41b2-b80d-c965f6bd3869', 'afc57223-1deb-430b-9756-9b339d90946a', 0, 'More reactive than alkali metals in the same period');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5cb2547d-0dd0-4630-8ecc-d9a3becb055d', 'afc57223-1deb-430b-9756-9b339d90946a', 1, 'Less reactive than alkali metals, due to their higher ionization enthalpy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73f2c8a1-40a9-4fb7-9b59-92de236a5a46', 'afc57223-1deb-430b-9756-9b339d90946a', 2, 'Completely unreactive, like noble gases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('680f04c2-8ae0-455c-9271-f5e3f52a863b', 'afc57223-1deb-430b-9756-9b339d90946a', 3, 'Only reactive when heated to extremely high temperatures');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('afc57223-1deb-430b-9756-9b339d90946a', '5cb2547d-0dd0-4630-8ecc-d9a3becb055d', 'Alkaline earth metals have higher ionization enthalpies than the adjacent alkali metals (due to greater nuclear charge for similar shielding), making them somewhat less reactive, though still quite reactive overall.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f393ad10-7017-41a2-b6dc-c8647220c0f8', '49540965-3805-40bf-b729-7b60123f83aa', 83, 'Silicones are synthetic polymers characterized by a backbone made of alternating:', 'Chemistry', 'p-Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f706375c-e98b-4d17-81c0-0d501280ff33', 'f393ad10-7017-41a2-b6dc-c8647220c0f8', 0, 'Carbon and hydrogen atoms only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d293479-ff5f-4809-b633-16a68095b6e7', 'f393ad10-7017-41a2-b6dc-c8647220c0f8', 1, 'Silicon and oxygen atoms, with organic side groups attached to silicon');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6ec60c07-1f39-4a66-a1a4-a2784d03b45e', 'f393ad10-7017-41a2-b6dc-c8647220c0f8', 2, 'Nitrogen and phosphorus atoms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff9497a4-d753-4544-b380-1118626520b7', 'f393ad10-7017-41a2-b6dc-c8647220c0f8', 3, 'Only silicon atoms bonded to each other directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f393ad10-7017-41a2-b6dc-c8647220c0f8', '6d293479-ff5f-4809-b633-16a68095b6e7', 'Silicones have a repeating -Si-O-Si-O- backbone with organic (commonly methyl) groups attached to the silicon atoms, giving them useful thermal stability and water-repellent properties.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('aef48fc0-89b4-4b3b-a44a-1ab49b7c626c', '49540965-3805-40bf-b729-7b60123f83aa', 84, 'Electromeric effect is observed in molecules containing a multiple bond, and involves:', 'Chemistry', 'Organic Chemistry — Basic Principles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e5d75b3-b995-4ef2-83be-58e4f400161d', 'aef48fc0-89b4-4b3b-a44a-1ab49b7c626c', 0, 'A permanent shift of sigma electrons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af350c50-c0ae-42e3-b2ce-4eb8a48ad6da', 'aef48fc0-89b4-4b3b-a44a-1ab49b7c626c', 1, 'A temporary, complete transfer of a shared pi electron pair to one atom in the presence of an attacking reagent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e510abc-2215-4366-9b07-7fe2ebf27339', 'aef48fc0-89b4-4b3b-a44a-1ab49b7c626c', 2, 'A permanent change unaffected by any reagent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d65567cb-528b-496a-a4aa-606736e8ad7d', 'aef48fc0-89b4-4b3b-a44a-1ab49b7c626c', 3, 'Only occurring in saturated compounds with no pi bonds');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aef48fc0-89b4-4b3b-a44a-1ab49b7c626c', 'af350c50-c0ae-42e3-b2ce-4eb8a48ad6da', 'The electromeric effect is a temporary polarization effect occurring only in the presence of an attacking reagent, where a pi-electron pair is completely transferred to one of the bonded atoms, reverting once the reagent is removed.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('aafbb3c5-d28d-440c-b459-d90ca7fc9ecb', '49540965-3805-40bf-b729-7b60123f83aa', 85, 'Aromatic compounds like benzene, despite having three formal double bonds, undergo electrophilic SUBSTITUTION reactions preferentially over addition reactions because:', 'Chemistry', 'Hydrocarbons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dae05c34-be28-4335-bc6b-d6eba471d43c', 'aafbb3c5-d28d-440c-b459-d90ca7fc9ecb', 0, 'Substitution destroys the aromatic ring');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9fcbd07-38c5-4d4f-a08b-faf5a7823811', 'aafbb3c5-d28d-440c-b459-d90ca7fc9ecb', 1, 'Substitution preserves the stable, delocalized aromatic pi-electron system, while addition would destroy it');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3625d1b4-b0de-4ed9-8899-f270065ced74', 'aafbb3c5-d28d-440c-b459-d90ca7fc9ecb', 2, 'Benzene has no pi electrons to react with');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7b07ff1-d316-4e54-8a99-a3953e5a0198', 'aafbb3c5-d28d-440c-b459-d90ca7fc9ecb', 3, 'Addition reactions are always faster for all alkenes and arenes alike');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aafbb3c5-d28d-440c-b459-d90ca7fc9ecb', 'a9fcbd07-38c5-4d4f-a08b-faf5a7823811', 'Benzene''s special aromatic stability (delocalized pi system, per Huckel''s rule) is preserved in substitution (where one H is replaced but the ring stays intact) but would be lost in an addition reaction — making substitution strongly favored energetically.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('aba09929-c5d3-4177-916f-7f4c6b148436', '49540965-3805-40bf-b729-7b60123f83aa', 86, 'An azeotropic mixture is a mixture of two liquids that:', 'Chemistry', 'Solutions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9cc4cf5e-1123-45f7-8b73-b58997e9feb9', 'aba09929-c5d3-4177-916f-7f4c6b148436', 0, 'Can always be completely separated by simple fractional distillation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eaf1f301-1b26-4678-b549-2e5ee216da6e', 'aba09929-c5d3-4177-916f-7f4c6b148436', 1, 'Boils at a constant temperature and distills over with the same composition as the liquid, resisting separation by simple distillation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('61c14da4-a700-4683-9725-476a74db491e', 'aba09929-c5d3-4177-916f-7f4c6b148436', 2, 'Never mixes at all (fully immiscible)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a7340780-e6d1-4096-b355-475b974faa76', 'aba09929-c5d3-4177-916f-7f4c6b148436', 3, 'Has zero vapor pressure');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aba09929-c5d3-4177-916f-7f4c6b148436', 'eaf1f301-1b26-4678-b549-2e5ee216da6e', 'Azeotropes boil at a constant temperature with vapor of the same composition as the liquid, meaning ordinary fractional distillation cannot separate the two components beyond the azeotropic composition.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('709eb434-f011-4060-a25f-b54648d01e3a', '49540965-3805-40bf-b729-7b60123f83aa', 87, 'According to Faraday''s first law of electrolysis, the mass of a substance deposited at an electrode is directly proportional to:', 'Chemistry', 'Electrochemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('056f3e27-374f-4fdb-a2be-8f2fceea0fff', '709eb434-f011-4060-a25f-b54648d01e3a', 0, 'The resistance of the electrolytic cell');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e09d815-3635-4253-9e58-17b0885855de', '709eb434-f011-4060-a25f-b54648d01e3a', 1, 'The quantity of electric charge (in coulombs) passed through the electrolyte');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee32ffd0-5850-4c6f-929f-9084bf1da64a', '709eb434-f011-4060-a25f-b54648d01e3a', 2, 'The temperature of the electrolyte only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('880f0ed6-7b77-43f1-b959-4bb6fbf6e822', '709eb434-f011-4060-a25f-b54648d01e3a', 3, 'The color of the electrolyte solution');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('709eb434-f011-4060-a25f-b54648d01e3a', '4e09d815-3635-4253-9e58-17b0885855de', 'Faraday''s first law: mass deposited (m) is directly proportional to the quantity of charge (Q = It) passed through the electrolyte, m = ZQ, where Z is the electrochemical equivalent.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2227ebd1-6ce8-4c62-b1bb-afeaadd870e3', '49540965-3805-40bf-b729-7b60123f83aa', 88, 'A catalyst increases the rate of a chemical reaction by:', 'Chemistry', 'Surface Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5392c51-3871-44fb-93cb-f5564ae20687', '2227ebd1-6ce8-4c62-b1bb-afeaadd870e3', 0, 'Increasing the enthalpy change of the reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('233f9246-3a00-430d-a8f8-104e18c62eec', '2227ebd1-6ce8-4c62-b1bb-afeaadd870e3', 1, 'Providing an alternative reaction pathway with lower activation energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca61b834-b735-4c16-99df-ab834e3ed9b1', '2227ebd1-6ce8-4c62-b1bb-afeaadd870e3', 2, 'Shifting the equilibrium position to favor products');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2eaf689-2aa5-4934-b8ab-adfe258fad41', '2227ebd1-6ce8-4c62-b1bb-afeaadd870e3', 3, 'Being permanently consumed in the reaction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2227ebd1-6ce8-4c62-b1bb-afeaadd870e3', '233f9246-3a00-430d-a8f8-104e18c62eec', 'A catalyst speeds up a reaction by offering a lower-activation-energy pathway; it does not alter the overall enthalpy change or shift the equilibrium position (which is a thermodynamic, not kinetic, quantity) — and is regenerated unchanged at the end.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3f5aa790-4e7a-452f-831c-73b1b2d4dd15', '49540965-3805-40bf-b729-7b60123f83aa', 89, 'The basicity order of methylamine, ammonia, and aniline in aqueous solution is generally:', 'Chemistry', 'Amines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86befc4b-137c-4015-a5f6-9c8cf5cae1f5', '3f5aa790-4e7a-452f-831c-73b1b2d4dd15', 0, 'Aniline > ammonia > methylamine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('600f1370-9282-4dee-85a8-f20390001f76', '3f5aa790-4e7a-452f-831c-73b1b2d4dd15', 1, 'Methylamine > ammonia > aniline');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('277d3e40-5b68-4ec6-81d8-38c6b7e437ed', '3f5aa790-4e7a-452f-831c-73b1b2d4dd15', 2, 'Ammonia > methylamine > aniline, always in that exact order for all conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1bb8b9db-c307-4aef-9102-64c97e4639c7', '3f5aa790-4e7a-452f-831c-73b1b2d4dd15', 3, 'All three are exactly equally basic');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3f5aa790-4e7a-452f-831c-73b1b2d4dd15', '600f1370-9282-4dee-85a8-f20390001f76', 'Methylamine''s electron-donating methyl group increases electron density on nitrogen (more basic than ammonia), while aniline''s nitrogen lone pair is delocalized into the ring, making it markedly less basic than both ammonia and methylamine in aqueous solution.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f0df3e82-bb6d-440e-a1b7-db9e246e4cb9', '49540965-3805-40bf-b729-7b60123f83aa', 90, 'Transition metal ions are often colored in aqueous solution primarily due to:', 'Chemistry', 'd and f Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('713e24eb-d1e5-4f88-b499-a2d2fa3a9c2f', 'f0df3e82-bb6d-440e-a1b7-db9e246e4cb9', 0, 'Absorption of visible light causing d-d electronic transitions between split d-orbitals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62a992ef-e385-4403-adee-d06cff389ee4', 'f0df3e82-bb6d-440e-a1b7-db9e246e4cb9', 1, 'The metal''s atomic mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0dea2750-ff12-4239-ba9f-0cc5aab6f9a9', 'f0df3e82-bb6d-440e-a1b7-db9e246e4cb9', 2, 'Complete absence of any d-electrons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c25cc32-993e-488a-ade4-e8ceec19ce29', 'f0df3e82-bb6d-440e-a1b7-db9e246e4cb9', 3, 'Reflection of all wavelengths of visible light equally');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f0df3e82-bb6d-440e-a1b7-db9e246e4cb9', '713e24eb-d1e5-4f88-b499-a2d2fa3a9c2f', 'In transition metal complexes, the d-orbitals split into different energy levels (crystal field splitting); absorption of specific visible-light wavelengths promotes d-electrons between these levels, and the complementary transmitted/reflected wavelength gives the observed color.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Biology (90 questions) — Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5fcae94b-75c2-4a6c-8e9f-5eba35ecfc43', '49540965-3805-40bf-b729-7b60123f83aa', 91, 'A binomial nomenclature system, as proposed by Carl Linnaeus, names each species using:', 'Biology', 'The Living World');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4aa7a16-1a4f-4181-9d6a-6bb09ccbeefb', '5fcae94b-75c2-4a6c-8e9f-5eba35ecfc43', 0, 'A single unique word only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b39ff63e-f28b-4adf-a095-80808f1a7f95', '5fcae94b-75c2-4a6c-8e9f-5eba35ecfc43', 1, 'Two words — the genus name followed by the species epithet');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('369e93fe-9d93-4a1d-b733-e8a687a10bb6', '5fcae94b-75c2-4a6c-8e9f-5eba35ecfc43', 2, 'Three or more descriptive words');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9de64550-73d4-4ecb-aae5-31a81b41a29d', '5fcae94b-75c2-4a6c-8e9f-5eba35ecfc43', 3, 'Only common/vernacular names');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5fcae94b-75c2-4a6c-8e9f-5eba35ecfc43', 'b39ff63e-f28b-4adf-a095-80808f1a7f95', 'Binomial nomenclature assigns each species a two-part Latinized name: Genus (capitalized) + species (lowercase), e.g., Homo sapiens.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('79c74b00-10d3-4c8d-8d1f-d3c34a91c739', '49540965-3805-40bf-b729-7b60123f83aa', 92, 'Kingdom Fungi is characterized by cell walls made primarily of:', 'Biology', 'Biological Classification');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c098cc69-90ea-4816-8ffd-60846fa8fdc3', '79c74b00-10d3-4c8d-8d1f-d3c34a91c739', 0, 'Cellulose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a20e0cbf-d32c-4514-aa1b-1c121222cbcd', '79c74b00-10d3-4c8d-8d1f-d3c34a91c739', 1, 'Chitin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5979e2e9-7abc-4666-b124-cd84068b55a9', '79c74b00-10d3-4c8d-8d1f-d3c34a91c739', 2, 'Peptidoglycan');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a9e4aeb-9e5c-43d3-8a26-55a59abb6dbb', '79c74b00-10d3-4c8d-8d1f-d3c34a91c739', 3, 'Silica');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('79c74b00-10d3-4c8d-8d1f-d3c34a91c739', 'a20e0cbf-d32c-4514-aa1b-1c121222cbcd', 'Fungal cell walls are composed mainly of chitin, distinguishing them from plant cell walls (cellulose) and bacterial cell walls (peptidoglycan).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ea0b0e0a-d696-40af-9311-4419fcd754cf', '49540965-3805-40bf-b729-7b60123f83aa', 93, 'The male and female gametophytes in a gymnosperm are represented, respectively, by the:', 'Biology', 'Plant Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02ce862c-c139-468a-a128-e22e72d3ac51', 'ea0b0e0a-d696-40af-9311-4419fcd754cf', 0, 'Pollen grain and the embryo sac within the ovule');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9528d491-63f2-4f84-baa2-2488dbda53b1', 'ea0b0e0a-d696-40af-9311-4419fcd754cf', 1, 'Sporophyte and the seed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea12339f-f972-400f-908f-deecd2939fe8', 'ea0b0e0a-d696-40af-9311-4419fcd754cf', 2, 'Anther and stigma directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3816397b-24b7-4ed1-a888-13054c8ad48d', 'ea0b0e0a-d696-40af-9311-4419fcd754cf', 3, 'Root and shoot');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ea0b0e0a-d696-40af-9311-4419fcd754cf', '02ce862c-c139-468a-a128-e22e72d3ac51', 'In gymnosperms, the germinated pollen grain constitutes the (reduced) male gametophyte, while the female gametophyte develops within the ovule, ultimately producing the egg cell.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7c6bde84-a826-4eeb-8b3e-834a798f19dc', '49540965-3805-40bf-b729-7b60123f83aa', 94, 'Algae are primarily classified into different classes (e.g., Chlorophyceae, Phaeophyceae, Rhodophyceae) based mainly on:', 'Biology', 'Plant Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('003d41a3-795d-4453-b3ef-2117d9a5d194', '7c6bde84-a826-4eeb-8b3e-834a798f19dc', 0, 'Their habitat only (freshwater vs marine)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('22af8440-054f-48d3-be35-01ec6d7a007c', '7c6bde84-a826-4eeb-8b3e-834a798f19dc', 1, 'The type of pigments present, stored food reserves, and cell wall composition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2f48b52-0a86-4440-a43f-2107e36e319a', '7c6bde84-a826-4eeb-8b3e-834a798f19dc', 2, 'Their size alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2125a744-7666-45e1-b1a9-05c252bbb794', '7c6bde84-a826-4eeb-8b3e-834a798f19dc', 3, 'Whether they are unicellular or multicellular');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7c6bde84-a826-4eeb-8b3e-834a798f19dc', '22af8440-054f-48d3-be35-01ec6d7a007c', 'Algal classification into classes is primarily based on the type of chlorophyll/accessory pigments, the nature of the stored food reserve, and the flagellar/cell-wall characteristics.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e915ab74-a423-49b4-866c-d2baaa1ca52a', '49540965-3805-40bf-b729-7b60123f83aa', 95, 'Phyllotaxy refers to:', 'Biology', 'Morphology of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4be9d79d-196d-4d61-8067-9e491f4f3594', 'e915ab74-a423-49b4-866c-d2baaa1ca52a', 0, 'The internal anatomy of a leaf');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d33c69f-93e4-4aa5-be78-29b53be60e5d', 'e915ab74-a423-49b4-866c-d2baaa1ca52a', 1, 'The pattern/arrangement of leaves on a stem or its branches');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f79922a-158c-4de8-8fb0-96ae3b40a68b', 'e915ab74-a423-49b4-866c-d2baaa1ca52a', 2, 'The shape of the flower only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c650c82d-d9ba-4edd-88a9-05ba2a42d0ab', 'e915ab74-a423-49b4-866c-d2baaa1ca52a', 3, 'The venation pattern within a single leaf');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e915ab74-a423-49b4-866c-d2baaa1ca52a', '1d33c69f-93e4-4aa5-be78-29b53be60e5d', 'Phyllotaxy describes the systematic arrangement of leaves on the stem — common patterns include alternate, opposite, and whorled phyllotaxy.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('597e8565-dc89-4ac7-aecc-19ffd33cb8c6', '49540965-3805-40bf-b729-7b60123f83aa', 96, 'A legume (pod) type of fruit, as seen in pea plants, is characterized by:', 'Biology', 'Morphology of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03ac4eb3-b4fc-4db8-8dd6-d7496f897aa0', '597e8565-dc89-4ac7-aecc-19ffd33cb8c6', 0, 'A dry, dehiscent fruit that splits along two sutures when mature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a4bbdc4-53ea-4c95-b0dd-71fc68a9ffbb', '597e8565-dc89-4ac7-aecc-19ffd33cb8c6', 1, 'A fleshy, indehiscent fruit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('25da8218-16dc-4282-ad68-4195f8b2efed', '597e8565-dc89-4ac7-aecc-19ffd33cb8c6', 2, 'A fruit that never opens to release seeds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d89e5c34-bffd-4972-a0d0-daf05256f65f', '597e8565-dc89-4ac7-aecc-19ffd33cb8c6', 3, 'A fruit developed exclusively from multiple ovaries');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('597e8565-dc89-4ac7-aecc-19ffd33cb8c6', '03ac4eb3-b4fc-4db8-8dd6-d7496f897aa0', 'A legume is a simple, dry, dehiscent fruit developing from a monocarpellary superior ovary, splitting along both dorsal and ventral sutures at maturity to release seeds.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4e2155d9-cfed-4040-ad91-6e0958900715', '49540965-3805-40bf-b729-7b60123f83aa', 97, 'In a dicot leaf, stomata are typically found predominantly on the:', 'Biology', 'Anatomy of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('166aef2c-c4b4-4786-9fed-bff8ccdcaf6a', '4e2155d9-cfed-4040-ad91-6e0958900715', 0, 'Upper (adaxial) surface only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae7802ed-e1dc-401f-b4bc-97c7cbd33000', '4e2155d9-cfed-4040-ad91-6e0958900715', 1, 'Lower (abaxial) surface, an adaptation that reduces water loss from direct sun exposure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebfa7d40-6519-44ab-aef8-651c94a2ecda', '4e2155d9-cfed-4040-ad91-6e0958900715', 2, 'Neither surface, since dicot leaves lack stomata');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b724820-0893-4e71-9f75-6d9753f6b2d8', '4e2155d9-cfed-4040-ad91-6e0958900715', 3, 'Only along the leaf margins');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4e2155d9-cfed-4040-ad91-6e0958900715', 'ae7802ed-e1dc-401f-b4bc-97c7cbd33000', 'Most dicot leaves are hypostomatic, with more stomata on the lower surface, which is shaded and cooler, helping to reduce transpirational water loss.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('03778603-c9f1-4aaf-a046-4f494b6a6530', '49540965-3805-40bf-b729-7b60123f83aa', 98, 'Sclerenchyma, a type of simple permanent tissue, provides mechanical support to plants due to cells that are:', 'Biology', 'Anatomy of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0dda8d05-a4e7-496a-9ea8-ea86144c1482', '03778603-c9f1-4aaf-a046-4f494b6a6530', 0, 'Living, thin-walled, and flexible');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6dc9bc0-b987-4b2e-a23c-a491d0172509', '03778603-c9f1-4aaf-a046-4f494b6a6530', 1, 'Dead at maturity, with thick, lignified secondary walls');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebd4dc34-bb80-489c-b458-0385663aa1cc', '03778603-c9f1-4aaf-a046-4f494b6a6530', 2, 'Photosynthetic and green');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cddec162-b018-49f3-94fe-faee981c5bbe', '03778603-c9f1-4aaf-a046-4f494b6a6530', 3, 'Only found in root tips');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('03778603-c9f1-4aaf-a046-4f494b6a6530', 'b6dc9bc0-b987-4b2e-a23c-a491d0172509', 'Sclerenchyma cells (fibres and sclereids) develop thick, lignified walls and are typically dead at maturity, providing strong mechanical support without needing living protoplasm.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('03c09724-f831-48ed-a9c8-411e5912661b', '49540965-3805-40bf-b729-7b60123f83aa', 99, 'The endoplasmic reticulum studded with ribosomes on its outer surface is called:', 'Biology', 'Cell — The Unit of Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('620568ce-c4b3-4dca-8962-8e3695b186bf', '03c09724-f831-48ed-a9c8-411e5912661b', 0, 'Smooth endoplasmic reticulum (SER)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d42f9503-2e59-4a65-a750-1a98ea5afae6', '03c09724-f831-48ed-a9c8-411e5912661b', 1, 'Rough endoplasmic reticulum (RER)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('50fdc7ac-1768-402b-83ea-a8486cf800b6', '03c09724-f831-48ed-a9c8-411e5912661b', 2, 'Golgi apparatus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aeca7d8f-d9d9-4293-a930-c51456a78a96', '03c09724-f831-48ed-a9c8-411e5912661b', 3, 'Lysosome');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('03c09724-f831-48ed-a9c8-411e5912661b', 'd42f9503-2e59-4a65-a750-1a98ea5afae6', 'Rough ER has ribosomes attached to its cytoplasmic surface, giving it a ''rough'' appearance and specializing it for synthesis of proteins destined for secretion or membranes; smooth ER lacks ribosomes and is involved in lipid synthesis/detoxification.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c4830162-3f53-4586-bfe0-7044d9f03da6', '49540965-3805-40bf-b729-7b60123f83aa', 100, 'The cell organelle responsible for intracellular digestion via hydrolytic enzymes, often called the ''suicide bag'' of the cell, is the:', 'Biology', 'Cell — The Unit of Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9551185-2c26-4b62-82d7-4daa986c2e9c', 'c4830162-3f53-4586-bfe0-7044d9f03da6', 0, 'Peroxisome');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80c097bf-6b4e-4d7f-9c6b-f2ebef8d5c6a', 'c4830162-3f53-4586-bfe0-7044d9f03da6', 1, 'Lysosome');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff94bdac-90ca-41eb-b06b-a95a40baf106', 'c4830162-3f53-4586-bfe0-7044d9f03da6', 2, 'Golgi body');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04cda483-85d8-4671-93c0-eb5367ee1ade', 'c4830162-3f53-4586-bfe0-7044d9f03da6', 3, 'Ribosome');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c4830162-3f53-4586-bfe0-7044d9f03da6', '80c097bf-6b4e-4d7f-9c6b-f2ebef8d5c6a', 'Lysosomes contain hydrolytic enzymes capable of breaking down cellular debris and, if released within the cell (e.g., during cell death), can digest the entire cell — earning them the nickname ''suicide bags''.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f63b0168-bbfc-441e-91c3-d507956f0288', '49540965-3805-40bf-b729-7b60123f83aa', 101, 'Nucleic acids (DNA and RNA) are polymers made up of repeating monomer units called:', 'Biology', 'Biomolecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ed7dd31-7d30-4762-acdf-fc43a29e6036', 'f63b0168-bbfc-441e-91c3-d507956f0288', 0, 'Amino acids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1cd0b6b8-de71-43bd-92c7-3cb71948f687', 'f63b0168-bbfc-441e-91c3-d507956f0288', 1, 'Nucleotides, each composed of a nitrogenous base, a pentose sugar, and a phosphate group');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('956e5409-b485-4d4f-aa1f-2f2fac1e06b1', 'f63b0168-bbfc-441e-91c3-d507956f0288', 2, 'Monosaccharides');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d80646c5-af3e-4a9a-8df9-fae0fd364acd', 'f63b0168-bbfc-441e-91c3-d507956f0288', 3, 'Fatty acids');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f63b0168-bbfc-441e-91c3-d507956f0288', '1cd0b6b8-de71-43bd-92c7-3cb71948f687', 'Nucleotides — each containing a nitrogenous base (purine or pyrimidine), a five-carbon sugar (ribose or deoxyribose), and a phosphate group — are the repeating monomers linked by phosphodiester bonds to form nucleic acid polymers.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('61362ebe-9d04-42f7-a992-ade2b1d56fcd', '49540965-3805-40bf-b729-7b60123f83aa', 102, 'The interphase stage of the cell cycle is subdivided into which three phases, in order?', 'Biology', 'Cell Cycle and Cell Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc01d637-0ee3-47b6-a62d-e743896c015e', '61362ebe-9d04-42f7-a992-ade2b1d56fcd', 0, 'M, G1, S');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8063ee50-671b-46fd-be75-7b738bd8a874', '61362ebe-9d04-42f7-a992-ade2b1d56fcd', 1, 'G1 (Gap 1), S (Synthesis), G2 (Gap 2)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f3a8521-ea22-4921-a95d-db2c569a781d', '61362ebe-9d04-42f7-a992-ade2b1d56fcd', 2, 'S, G2, M only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21a5504e-3a03-4285-8e95-aa72ef09c529', '61362ebe-9d04-42f7-a992-ade2b1d56fcd', 3, 'Prophase, Metaphase, Anaphase');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('61362ebe-9d04-42f7-a992-ade2b1d56fcd', '8063ee50-671b-46fd-be75-7b738bd8a874', 'Interphase consists of G1 (cell growth, normal metabolic activity), S (DNA replication/synthesis), and G2 (further growth and preparation for mitosis), collectively the longest part of the cell cycle.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5a95fc47-9782-4eb0-bfc2-73db3ba75e78', '49540965-3805-40bf-b729-7b60123f83aa', 103, 'The enzyme RuBisCO, central to the Calvin cycle, catalyzes the fixation of CO2 onto:', 'Biology', 'Photosynthesis in Higher Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e3fe5c1-dfa3-4e30-ad7e-a075af9a0aef', '5a95fc47-9782-4eb0-bfc2-73db3ba75e78', 0, 'Glucose directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('419211ce-825d-4822-9010-ee87c53b15ce', '5a95fc47-9782-4eb0-bfc2-73db3ba75e78', 1, 'Ribulose-1,5-bisphosphate (RuBP)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fbc8ba7a-5d45-4a81-8ea9-878412f5b6fd', '5a95fc47-9782-4eb0-bfc2-73db3ba75e78', 2, 'Pyruvate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0207d5dc-7a07-44bf-9f92-3f0e96b13253', '5a95fc47-9782-4eb0-bfc2-73db3ba75e78', 3, 'PEP (phosphoenolpyruvate)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5a95fc47-9782-4eb0-bfc2-73db3ba75e78', '419211ce-825d-4822-9010-ee87c53b15ce', 'RuBisCO (ribulose bisphosphate carboxylase-oxygenase) catalyzes carboxylation of RuBP with CO2 as the first step of the Calvin cycle in C3 photosynthesis.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('aceeac14-20fe-45bc-a3a1-1ffc8115ad63', '49540965-3805-40bf-b729-7b60123f83aa', 104, 'The phenomenon of photorespiration occurs when RuBisCO acts as an oxygenase instead of a carboxylase, and is considered wasteful because it:', 'Biology', 'Photosynthesis in Higher Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e742d80c-53e2-487b-9398-01fa38d4533b', 'aceeac14-20fe-45bc-a3a1-1ffc8115ad63', 0, 'Increases the efficiency of the Calvin cycle significantly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1010f6e6-ae73-42c4-a141-a9a29e06aa35', 'aceeac14-20fe-45bc-a3a1-1ffc8115ad63', 1, 'Consumes O2 and releases previously fixed CO2, without producing any net ATP or sugar gain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('708dd972-35ed-4290-bec1-62f8d39732f7', 'aceeac14-20fe-45bc-a3a1-1ffc8115ad63', 2, 'Only occurs in the dark, with no light involvement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49779a74-cf51-4be1-9e13-924d5a6f32dc', 'aceeac14-20fe-45bc-a3a1-1ffc8115ad63', 3, 'Increases crop yield significantly in C3 plants');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aceeac14-20fe-45bc-a3a1-1ffc8115ad63', '1010f6e6-ae73-42c4-a141-a9a29e06aa35', 'Photorespiration occurs when RuBisCO binds O2 instead of CO2 (favored at high temperature/low CO2), releasing already-fixed carbon as CO2 without generating ATP/NADPH gain — reducing the net photosynthetic efficiency of C3 plants.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2e3ad244-065f-4908-9ecd-7b11433d32e0', '49540965-3805-40bf-b729-7b60123f83aa', 105, 'The Krebs cycle (citric acid cycle) takes place in the:', 'Biology', 'Respiration in Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87abd926-6c81-4f61-9484-5cffd280e87d', '2e3ad244-065f-4908-9ecd-7b11433d32e0', 0, 'Cytoplasm');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('22f1c4a9-3266-4bb0-bb6c-b01afbf34486', '2e3ad244-065f-4908-9ecd-7b11433d32e0', 1, 'Mitochondrial matrix');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da12524c-f57b-4387-a436-eccdf35285fd', '2e3ad244-065f-4908-9ecd-7b11433d32e0', 2, 'Nucleus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f61106f3-5d4d-4b59-a9dc-146c30d3c4a0', '2e3ad244-065f-4908-9ecd-7b11433d32e0', 3, 'Golgi apparatus');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2e3ad244-065f-4908-9ecd-7b11433d32e0', '22f1c4a9-3266-4bb0-bb6c-b01afbf34486', 'The Krebs cycle occurs in the mitochondrial matrix, where acetyl-CoA (derived from pyruvate) is oxidized, releasing CO2 and generating NADH/FADH2 for the electron transport chain.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7db67f7a-9541-49a5-adec-5312b43e8efe', '49540965-3805-40bf-b729-7b60123f83aa', 106, 'Ethylene, a gaseous plant hormone, is particularly well known for its role in:', 'Biology', 'Plant Growth and Development');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f95870f6-67c8-4c8f-ba6d-eefbe3babc27', '7db67f7a-9541-49a5-adec-5312b43e8efe', 0, 'Preventing fruit ripening indefinitely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b161795d-e6ab-4c8e-b8f9-b25fb9fb0cbb', '7db67f7a-9541-49a5-adec-5312b43e8efe', 1, 'Promoting fruit ripening and senescence');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23fd939d-91dc-4488-99d2-8774e9b26e3e', '7db67f7a-9541-49a5-adec-5312b43e8efe', 2, 'Stimulating cell division exclusively in roots');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3909fd55-69d3-4600-8ce8-68b0d56bd472', '7db67f7a-9541-49a5-adec-5312b43e8efe', 3, 'Increasing seed dormancy');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7db67f7a-9541-49a5-adec-5312b43e8efe', 'b161795d-e6ab-4c8e-b8f9-b25fb9fb0cbb', 'Ethylene is the primary hormone responsible for triggering and accelerating fruit ripening, as well as promoting senescence (aging) and abscission of leaves and flowers.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3fec5700-d959-4bdf-98f6-053a53567393', '49540965-3805-40bf-b729-7b60123f83aa', 107, 'Abscisic acid (ABA) is often referred to as a ''stress hormone'' in plants because it:', 'Biology', 'Plant Growth and Development');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('029ca3b4-17e8-49ee-9a6c-b79d122b40a1', '3fec5700-d959-4bdf-98f6-053a53567393', 0, 'Promotes rapid growth under all conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0a32ef8-001f-4d88-809f-c486bdd4f2a9', '3fec5700-d959-4bdf-98f6-053a53567393', 1, 'Induces stomatal closure and seed/bud dormancy, helping plants cope with water stress');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea6ef4dd-2445-4ad4-8c9e-d95d1b2e7167', '3fec5700-d959-4bdf-98f6-053a53567393', 2, 'Is only produced during optimal growing conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfd9371f-551c-4778-96c9-6b9da07ec059', '3fec5700-d959-4bdf-98f6-053a53567393', 3, 'Prevents seed germination permanently, with no possible reversal');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3fec5700-d959-4bdf-98f6-053a53567393', 'c0a32ef8-001f-4d88-809f-c486bdd4f2a9', 'ABA promotes stomatal closure to reduce water loss during drought stress and induces/maintains dormancy in seeds and buds, functioning as a general growth inhibitor and stress-response hormone.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0bd4e82f-dcf2-44c7-952e-e113e362fb65', '49540965-3805-40bf-b729-7b60123f83aa', 108, 'Emasculation, a technique used in controlled/artificial hybridization experiments, refers to:', 'Biology', 'Sexual Reproduction in Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93c4ce51-1e6c-4dd5-bf6a-5ef35c0f7263', '0bd4e82f-dcf2-44c7-952e-e113e362fb65', 0, 'Removal of the stigma from a flower');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c12d27f4-6fef-4291-9b8d-141ed6804e25', '0bd4e82f-dcf2-44c7-952e-e113e362fb65', 1, 'Removal of anthers from a flower bud before dehiscence, to prevent self-pollination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6dd5237-66ee-4635-8bc0-19108df43e67', '0bd4e82f-dcf2-44c7-952e-e113e362fb65', 2, 'Removal of petals only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e59c8842-d062-4bc1-b124-f8b14ad60988', '0bd4e82f-dcf2-44c7-952e-e113e362fb65', 3, 'Artificial pollination using a paintbrush');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0bd4e82f-dcf2-44c7-952e-e113e362fb65', 'c12d27f4-6fef-4291-9b8d-141ed6804e25', 'Emasculation is the removal of anthers from a bisexual flower bud before pollen matures, preventing unwanted self-pollination so that only the desired (bagged) pollen source fertilizes the flower.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c2206706-6960-4a8e-bba7-b294bff09ac3', '49540965-3805-40bf-b729-7b60123f83aa', 109, 'Apomixis is a form of reproduction in flowering plants in which:', 'Biology', 'Sexual Reproduction in Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a08c3de-458f-420c-8601-35c61f7b2c99', 'c2206706-6960-4a8e-bba7-b294bff09ac3', 0, 'Seeds are produced through a sexual process involving normal fertilization');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3616ef17-1f20-4787-8847-acf3540d3a70', 'c2206706-6960-4a8e-bba7-b294bff09ac3', 1, 'Seeds are formed without the fertilization of the egg cell, producing offspring genetically identical to the parent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1c5a3d9-39a8-40cf-bbf2-610882dbb043', 'c2206706-6960-4a8e-bba7-b294bff09ac3', 2, 'No seeds are formed at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d0a560a-2f62-4336-846f-ed85d3e770fc', 'c2206706-6960-4a8e-bba7-b294bff09ac3', 3, 'Only pollen grains develop into new plants directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c2206706-6960-4a8e-bba7-b294bff09ac3', '3616ef17-1f20-4787-8847-acf3540d3a70', 'Apomixis is a form of asexual reproduction that mimics sexual reproduction by producing seeds, but without fertilization, resulting in clonal offspring genetically identical to the mother plant — of interest to plant breeders for fixing hybrid vigor.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8928fdd2-7b4f-46d3-9976-60d2422dd33c', '49540965-3805-40bf-b729-7b60123f83aa', 110, 'Mendel''s Law of Independent Assortment applies to the inheritance of two or more genes that are located on:', 'Biology', 'Principles of Inheritance and Variation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62b1ee2c-f8d5-4c5b-803a-f608b4bff6b9', '8928fdd2-7b4f-46d3-9976-60d2422dd33c', 0, 'The same chromosome, close together');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e5d9822-ccfa-4065-b862-fbc6741e50df', '8928fdd2-7b4f-46d3-9976-60d2422dd33c', 1, 'Different chromosomes (or far apart on the same chromosome), so they assort independently during gamete formation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2c9faef-1b9e-4061-86fe-40ca81861820', '8928fdd2-7b4f-46d3-9976-60d2422dd33c', 2, 'Only the X chromosome');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4ea2dd2c-169e-4384-bfd0-568e038d497d', '8928fdd2-7b4f-46d3-9976-60d2422dd33c', 3, 'The mitochondrial genome exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8928fdd2-7b4f-46d3-9976-60d2422dd33c', '8e5d9822-ccfa-4065-b862-fbc6741e50df', 'Independent assortment holds when genes are on different chromosome pairs (or sufficiently far apart on the same chromosome with frequent crossing over), allowing alleles of different genes to segregate into gametes independently of each other.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9068782a-8d3a-429b-a2f7-7c27de6ee1d3', '49540965-3805-40bf-b729-7b60123f83aa', 111, 'A dihybrid cross between two heterozygous individuals (e.g., RrYy x RrYy) typically produces offspring in a phenotypic ratio of:', 'Biology', 'Principles of Inheritance and Variation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2918ff44-f310-48ee-9461-aa5540fe255a', '9068782a-8d3a-429b-a2f7-7c27de6ee1d3', 0, '3:1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('343819e4-0fde-427c-8122-eaaa777bb0d5', '9068782a-8d3a-429b-a2f7-7c27de6ee1d3', 1, '1:2:1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8572b230-afd4-4f58-a5f3-f8973b699c2c', '9068782a-8d3a-429b-a2f7-7c27de6ee1d3', 2, '9:3:3:1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab17358a-b6e6-4707-8449-ce053575c943', '9068782a-8d3a-429b-a2f7-7c27de6ee1d3', 3, '1:1:1:1');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9068782a-8d3a-429b-a2f7-7c27de6ee1d3', '8572b230-afd4-4f58-a5f3-f8973b699c2c', 'A classic dihybrid cross between two double heterozygotes, with independent assortment and complete dominance at both loci, produces the well-known 9:3:3:1 phenotypic ratio in the F2 generation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('78a9579a-6840-4fff-9484-555b15a48065', '49540965-3805-40bf-b729-7b60123f83aa', 112, 'The process by which a DNA molecule makes an identical copy of itself is called:', 'Biology', 'Molecular Basis of Inheritance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e0c0fa4-8fbd-4f18-ab7a-530bdf2f5932', '78a9579a-6840-4fff-9484-555b15a48065', 0, 'Transcription');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8419f20-da3b-45f2-b1ba-60f2e6646b21', '78a9579a-6840-4fff-9484-555b15a48065', 1, 'Translation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef067c62-81c0-44dc-ae01-ffd38e24b5ec', '78a9579a-6840-4fff-9484-555b15a48065', 2, 'Replication');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ff84a1e-b835-4a77-948a-08c4812fa769', '78a9579a-6840-4fff-9484-555b15a48065', 3, 'Transformation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('78a9579a-6840-4fff-9484-555b15a48065', 'ef067c62-81c0-44dc-ae01-ffd38e24b5ec', 'DNA replication is the semi-conservative process by which each strand of the original DNA molecule serves as a template for synthesizing a new complementary strand, producing two identical DNA molecules.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('01461bf0-03d3-41f3-b41b-c43bae83ddfd', '49540965-3805-40bf-b729-7b60123f83aa', 113, 'A codon in the genetic code consists of a sequence of how many nucleotides, coding for one amino acid?', 'Biology', 'Molecular Basis of Inheritance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('826a1831-0e2c-427e-a7bf-e41ea3781b67', '01461bf0-03d3-41f3-b41b-c43bae83ddfd', 0, '1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af3e3df8-c3b9-4da5-bb8e-44e9a02dd34a', '01461bf0-03d3-41f3-b41b-c43bae83ddfd', 1, '2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6412a94c-2f5b-44a0-87a4-37b9fb33adc7', '01461bf0-03d3-41f3-b41b-c43bae83ddfd', 2, '3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('150626a9-6ec1-49e3-a11a-558a663a53e8', '01461bf0-03d3-41f3-b41b-c43bae83ddfd', 3, '4');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('01461bf0-03d3-41f3-b41b-c43bae83ddfd', '6412a94c-2f5b-44a0-87a4-37b9fb33adc7', 'The genetic code is a triplet code: each codon consists of three consecutive nucleotides on mRNA, specifying one particular amino acid (or a start/stop signal).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4972fbcf-747c-4cea-a890-cf64ba4aa82a', '49540965-3805-40bf-b729-7b60123f83aa', 114, 'Analogous organs, such as the wings of a butterfly and the wings of a bird, have similar functions but different developmental origins. These are considered evidence for:', 'Biology', 'Evolution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65f8dfc8-3d0d-4fba-b956-915091f8a761', '4972fbcf-747c-4cea-a890-cf64ba4aa82a', 0, 'Divergent evolution from a recent common ancestor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('506b97fd-cda8-43b6-bc90-f2749d320514', '4972fbcf-747c-4cea-a890-cf64ba4aa82a', 1, 'Convergent evolution — similar adaptations evolving independently in unrelated lineages facing similar environmental pressures');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('efe4b6e4-7c70-40c7-90ab-71d8aa5b78da', '4972fbcf-747c-4cea-a890-cf64ba4aa82a', 2, 'No evolutionary process at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a5d58aa-d7a5-45ab-ac41-6cebb611bf30', '4972fbcf-747c-4cea-a890-cf64ba4aa82a', 3, 'Direct genetic inheritance from a shared recent ancestor');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4972fbcf-747c-4cea-a890-cf64ba4aa82a', '506b97fd-cda8-43b6-bc90-f2749d320514', 'Analogous structures arise through convergent evolution, where unrelated organisms independently evolve similar adaptations (like flight) in response to similar environmental demands, despite differing evolutionary origins.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5f3eb57a-22ee-4ef1-b7c3-fdd5618ca80c', '49540965-3805-40bf-b729-7b60123f83aa', 115, 'The Miller-Urey experiment, simulating conditions of early Earth''s atmosphere, provided experimental support for the idea that:', 'Biology', 'Evolution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('194e334d-0dd6-47c1-872a-0f0ba2bca257', '5f3eb57a-22ee-4ef1-b7c3-fdd5618ca80c', 0, 'Life could not have originated from non-living matter under any conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f5e144f-b324-4f42-bdef-ba5f3ebb7f47', '5f3eb57a-22ee-4ef1-b7c3-fdd5618ca80c', 1, 'Simple organic molecules (like amino acids) could form spontaneously from inorganic precursors under early-Earth-like conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f7c113c-d401-4893-8c9f-57399b2532a8', '5f3eb57a-22ee-4ef1-b7c3-fdd5618ca80c', 2, 'DNA formed instantaneously in the primordial soup');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74a03985-263e-4ce7-b95c-db5b757f8b4e', '5f3eb57a-22ee-4ef1-b7c3-fdd5618ca80c', 3, 'Only RNA, and no amino acids, could be formed under these conditions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5f3eb57a-22ee-4ef1-b7c3-fdd5618ca80c', '5f5e144f-b324-4f42-bdef-ba5f3ebb7f47', 'Miller and Urey passed electric sparks (simulating lightning) through a mixture of gases believed to resemble early Earth''s atmosphere (methane, ammonia, hydrogen, water vapor), successfully producing amino acids, supporting the chemical evolution hypothesis of life''s origin.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0830c0d2-f4ef-4df7-ba20-4c76520550d9', '49540965-3805-40bf-b729-7b60123f83aa', 116, 'Single Cell Protein (SCP) refers to protein-rich biomass obtained from the cultivation of:', 'Biology', 'Strategies for Enhancement in Food Production');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a30e12f-12f2-425e-8ecb-d05dde9e4386', '0830c0d2-f4ef-4df7-ba20-4c76520550d9', 0, 'Large mammals raised specifically for protein');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bad10809-7c03-4280-90fa-e4d64bbb81bd', '0830c0d2-f4ef-4df7-ba20-4c76520550d9', 1, 'Microorganisms such as algae, bacteria, fungi, or yeast, used as an alternative protein source');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c35ee2b3-57f9-41cb-ae2b-9c16666779a0', '0830c0d2-f4ef-4df7-ba20-4c76520550d9', 2, 'Only genetically modified crop plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d50381c0-62f0-4c2f-96b0-9e6d8d9be2f9', '0830c0d2-f4ef-4df7-ba20-4c76520550d9', 3, 'Ocean fish exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0830c0d2-f4ef-4df7-ba20-4c76520550d9', 'bad10809-7c03-4280-90fa-e4d64bbb81bd', 'SCP is biomass/protein derived from culturing microorganisms (e.g., Spirulina, yeast) in bulk, offering a rapidly producible, protein-rich alternative food/feed source.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6bb11135-7d21-4780-81d5-5eec6f3cc1f9', '49540965-3805-40bf-b729-7b60123f83aa', 117, 'Biogas, a mixture primarily of methane, is produced through the anaerobic breakdown of organic matter by:', 'Biology', 'Microbes in Human Welfare');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1bb623c0-be3d-42e6-a154-089570225e7a', '6bb11135-7d21-4780-81d5-5eec6f3cc1f9', 0, 'Aerobic fungi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dcf3fa50-2050-4cfe-8bf0-490815108ac8', '6bb11135-7d21-4780-81d5-5eec6f3cc1f9', 1, 'A consortium of anaerobic bacteria, including methanogens (e.g., Methanobacterium)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('29f4f3d6-361f-4568-bbf6-01bff6854f87', '6bb11135-7d21-4780-81d5-5eec6f3cc1f9', 2, 'Only photosynthetic algae');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b90f243-9088-44ab-8648-0dad2f5586ee', '6bb11135-7d21-4780-81d5-5eec6f3cc1f9', 3, 'Chemical combustion of biomass');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6bb11135-7d21-4780-81d5-5eec6f3cc1f9', 'dcf3fa50-2050-4cfe-8bf0-490815108ac8', 'Biogas is generated by anaerobic digestion of organic waste (e.g., cattle dung) by a community of bacteria, with methanogenic archaea/bacteria in the final stage producing methane gas.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ae5dab77-3207-4425-bebf-da13368d7960', '49540965-3805-40bf-b729-7b60123f83aa', 118, 'A vector used in genetic engineering to carry and introduce foreign DNA into a host cell must typically have an origin of replication so that it can:', 'Biology', 'Biotechnology — Principles and Processes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d46ef22f-b278-4cd6-9550-5eb235c33765', 'ae5dab77-3207-4425-bebf-da13368d7960', 0, 'Be destroyed immediately by the host cell');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74415baf-5dbc-422a-827b-0bd75a1b0f9d', 'ae5dab77-3207-4425-bebf-da13368d7960', 1, 'Replicate independently within the host cell, along with the foreign DNA insert');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f23dbfa5-5aa1-4061-81f9-1b149f99fe0f', 'ae5dab77-3207-4425-bebf-da13368d7960', 2, 'Prevent the foreign gene from being expressed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a31fd2cc-9e2c-4d0a-8874-78878c4629d7', 'ae5dab77-3207-4425-bebf-da13368d7960', 3, 'Only function outside living cells');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ae5dab77-3207-4425-bebf-da13368d7960', '74415baf-5dbc-422a-827b-0bd75a1b0f9d', 'A cloning vector (e.g., a plasmid) needs its own origin of replication (ori) so it — and the foreign DNA fragment inserted into it — can be copied autonomously as the host cell divides.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('875e1591-c714-4819-86b2-0e5091bf326f', '49540965-3805-40bf-b729-7b60123f83aa', 119, 'Golden Rice is a genetically modified crop engineered primarily to address which nutritional deficiency?', 'Biology', 'Biotechnology and Its Applications');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f8cd777-154f-40d4-ac4c-4c0f366bfe28', '875e1591-c714-4819-86b2-0e5091bf326f', 0, 'Iron deficiency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1de49588-d096-4572-88af-af3e0da8b3ea', '875e1591-c714-4819-86b2-0e5091bf326f', 1, 'Vitamin A deficiency, via enhanced beta-carotene content');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb391499-cd0f-4fa6-8f8b-4307d6131337', '875e1591-c714-4819-86b2-0e5091bf326f', 2, 'Protein deficiency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6e26a54-451e-4630-bf67-23d60b579a89', '875e1591-c714-4819-86b2-0e5091bf326f', 3, 'Vitamin C deficiency');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('875e1591-c714-4819-86b2-0e5091bf326f', '1de49588-d096-4572-88af-af3e0da8b3ea', 'Golden Rice was genetically engineered to biosynthesize beta-carotene (a vitamin A precursor) in the edible grain, aiming to address widespread vitamin A deficiency in populations relying heavily on rice as a staple.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('fc0f3201-fa67-4746-97f4-778524743b1d', '49540965-3805-40bf-b729-7b60123f83aa', 120, 'Population density is best defined as:', 'Biology', 'Organisms and Populations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('507ffaff-2b70-483e-a74d-d9403592b55f', 'fc0f3201-fa67-4746-97f4-778524743b1d', 0, 'The total number of species present in a habitat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d196e12-3e25-483c-94bf-6bd4c6bcbeea', 'fc0f3201-fa67-4746-97f4-778524743b1d', 1, 'The number of individuals of a species per unit area or volume of habitat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('615818a3-d8d0-472b-bad8-f75090b3e849', 'fc0f3201-fa67-4746-97f4-778524743b1d', 2, 'The birth rate of a population');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6feb23fd-307c-41e7-bb2d-ea0db37e2875', 'fc0f3201-fa67-4746-97f4-778524743b1d', 3, 'The genetic diversity within a species');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fc0f3201-fa67-4746-97f4-778524743b1d', '7d196e12-3e25-483c-94bf-6bd4c6bcbeea', 'Population density measures the number of individuals of a given species per unit area (or volume for aquatic species), a fundamental descriptor of population size relative to available habitat space.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8758300e-11a8-45d8-9058-801f9b848499', '49540965-3805-40bf-b729-7b60123f83aa', 121, 'In ecological pyramids, the pyramid of biomass in a marine/aquatic ecosystem is often inverted because:', 'Biology', 'Ecosystem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8028a1f1-8920-4f94-9aeb-bb947a8726f4', '8758300e-11a8-45d8-9058-801f9b848499', 0, 'Producers (phytoplankton) have a very high standing biomass at any instant, exceeding that of consumers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0677e568-df9b-4119-bdfe-bfe093f66ff8', '8758300e-11a8-45d8-9058-801f9b848499', 1, 'Producers (phytoplankton) have very high turnover rates and low standing biomass at any given moment, despite supporting more consumer biomass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('577e631d-1d7a-4a1c-bc1e-34f807213c5f', '8758300e-11a8-45d8-9058-801f9b848499', 2, 'Marine ecosystems have no producers at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b771bc89-1976-4d51-bb17-7c1e32674a34', '8758300e-11a8-45d8-9058-801f9b848499', 3, 'Aquatic consumers never outweigh producers');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8758300e-11a8-45d8-9058-801f9b848499', '0677e568-df9b-4119-bdfe-bfe093f66ff8', 'Aquatic pyramids of biomass are often inverted because small-bodied phytoplankton reproduce and are consumed rapidly (high turnover), so their standing biomass at any instant is small even though their cumulative productivity supports a larger consumer biomass.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4708dd55-89b9-48df-b491-5ea9d609b57b', '49540965-3805-40bf-b729-7b60123f83aa', 122, 'The ''Red Data Book'' maintained by the IUCN primarily documents:', 'Biology', 'Biodiversity and Conservation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c927e54-21e0-406a-a568-85ebdcd6ba48', '4708dd55-89b9-48df-b491-5ea9d609b57b', 0, 'A list of all newly discovered species each year');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea6bc702-5bb5-4d12-a2aa-332018342f12', '4708dd55-89b9-48df-b491-5ea9d609b57b', 1, 'The conservation status of species, including those threatened with extinction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f69c8b35-33d7-42f4-bf07-535ee2bce9b7', '4708dd55-89b9-48df-b491-5ea9d609b57b', 2, 'A record of agricultural crop yields');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e9ab4e7e-bfcb-4d16-bd0b-05b8c75f6cd5', '4708dd55-89b9-48df-b491-5ea9d609b57b', 3, 'A catalogue of all protected areas worldwide');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4708dd55-89b9-48df-b491-5ea9d609b57b', 'ea6bc702-5bb5-4d12-a2aa-332018342f12', 'The IUCN Red List (Red Data Book) catalogues the global conservation status of species — categorizing them as least concern, vulnerable, endangered, critically endangered, or extinct — to guide conservation priorities.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('995056de-1903-4f50-a0cf-fc1d3fd0aa67', '49540965-3805-40bf-b729-7b60123f83aa', 123, 'The Montreal Protocol is an international agreement specifically aimed at:', 'Biology', 'Environmental Issues');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4071f871-ddd4-4568-8e02-c7d7348f012f', '995056de-1903-4f50-a0cf-fc1d3fd0aa67', 0, 'Reducing greenhouse gas emissions to combat global warming');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26adfbc4-bec9-48bb-8a45-0d3669cdc781', '995056de-1903-4f50-a0cf-fc1d3fd0aa67', 1, 'Phasing out the production and use of ozone-depleting substances like CFCs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a39f5d79-25cb-491d-833f-f931afac326e', '995056de-1903-4f50-a0cf-fc1d3fd0aa67', 2, 'Controlling water pollution in rivers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92fb868c-a465-4c4b-8b7d-d4629d59c63c', '995056de-1903-4f50-a0cf-fc1d3fd0aa67', 3, 'Banning the use of pesticides in agriculture');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('995056de-1903-4f50-a0cf-fc1d3fd0aa67', '26adfbc4-bec9-48bb-8a45-0d3669cdc781', 'The Montreal Protocol (1987) specifically targets substances that deplete the stratospheric ozone layer, such as CFCs and related halogenated compounds, distinct from climate-focused agreements like the Kyoto Protocol/Paris Agreement.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8fb8a5df-362c-483e-aaad-34af8fed939f', '49540965-3805-40bf-b729-7b60123f83aa', 124, 'In flowering plants (angiosperms), unlike gymnosperms, the ovules are enclosed within a protective structure called the:', 'Biology', 'Plant Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1fb3f1d2-308b-44f8-badf-4844dbf9cd0a', '8fb8a5df-362c-483e-aaad-34af8fed939f', 0, 'Anther');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('219f96fd-c7ac-41cc-82a9-56d3506bc039', '8fb8a5df-362c-483e-aaad-34af8fed939f', 1, 'Ovary');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f8f4b05-b5d1-4bd1-9f0b-29313797ee2b', '8fb8a5df-362c-483e-aaad-34af8fed939f', 2, 'Filament');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('11d8e7bc-2e72-49d1-87ad-bbcd1c574962', '8fb8a5df-362c-483e-aaad-34af8fed939f', 3, 'Sepal');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8fb8a5df-362c-483e-aaad-34af8fed939f', '219f96fd-c7ac-41cc-82a9-56d3506bc039', 'The defining feature of angiosperms is that ovules develop enclosed within the ovary (part of the pistil/carpel), which later matures into the fruit — unlike gymnosperms, where ovules/seeds remain ''naked''.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1e373dad-b05d-4065-8f9c-281c91fa2137', '49540965-3805-40bf-b729-7b60123f83aa', 125, 'Aestivation refers to the mode of arrangement of which floral whorl''s members relative to one another in the bud?', 'Biology', 'Morphology of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('137f18f6-d7f0-46eb-9197-989500ad0340', '1e373dad-b05d-4065-8f9c-281c91fa2137', 0, 'Sepals and petals (calyx and corolla)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8942bfd-17ed-4d5f-b648-4c1efdf46ae3', '1e373dad-b05d-4065-8f9c-281c91fa2137', 1, 'Only the stamens');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d6496b99-d0c9-4f9d-a044-b10a5b3fc9a7', '1e373dad-b05d-4065-8f9c-281c91fa2137', 2, 'Only the ovary');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d35e171-7e39-40d9-95bf-adbd5f7cee53', '1e373dad-b05d-4065-8f9c-281c91fa2137', 3, 'The root system');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1e373dad-b05d-4065-8f9c-281c91fa2137', '137f18f6-d7f0-46eb-9197-989500ad0340', 'Aestivation describes how sepals or petals of adjacent whorls are arranged relative to one another in the flower bud — common types include twisted, imbricate, and valvate.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6c03a4ee-f94a-40e0-a0b3-84d49e004a37', '49540965-3805-40bf-b729-7b60123f83aa', 126, 'Collenchyma tissue, found commonly in the cortex of dicot stems, provides:', 'Biology', 'Anatomy of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90cab8d5-a304-40cb-9315-38a2517a6cd5', '6c03a4ee-f94a-40e0-a0b3-84d49e004a37', 0, 'Mechanical support while still allowing some flexibility, since its cells remain living with unevenly thickened walls');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e391d43b-0b44-40dc-9f48-5bdff69380f4', '6c03a4ee-f94a-40e0-a0b3-84d49e004a37', 1, 'Only water conduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f895cc8-712f-4796-a39c-4716d721014f', '6c03a4ee-f94a-40e0-a0b3-84d49e004a37', 2, 'Only food storage, with no mechanical role');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('758d4a00-6577-4f4b-992f-2b254cf92c46', '6c03a4ee-f94a-40e0-a0b3-84d49e004a37', 3, 'Rigid, unyielding support like sclerenchyma');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6c03a4ee-f94a-40e0-a0b3-84d49e004a37', '90cab8d5-a304-40cb-9315-38a2517a6cd5', 'Collenchyma cells are living, with unevenly (often corner) thickened walls of cellulose and pectin, giving mechanical support combined with flexibility — well suited to growing plant parts, unlike the rigid, dead sclerenchyma.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('16bf951b-385f-42ba-9593-46b13cb731ce', '49540965-3805-40bf-b729-7b60123f83aa', 127, 'The plant cell wall is composed primarily of which polysaccharide, giving it strength and rigidity?', 'Biology', 'Cell — The Unit of Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('144295cc-702e-480b-a648-a0abbef1ef40', '16bf951b-385f-42ba-9593-46b13cb731ce', 0, 'Glycogen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7839ad8-b7a6-4097-9299-eec26cc80e30', '16bf951b-385f-42ba-9593-46b13cb731ce', 1, 'Cellulose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b91a69b4-1f16-486e-9cc9-63e7f88ea072', '16bf951b-385f-42ba-9593-46b13cb731ce', 2, 'Chitin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d7df3eb-1ded-4692-aa7b-78c697fcdfd2', '16bf951b-385f-42ba-9593-46b13cb731ce', 3, 'Starch');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('16bf951b-385f-42ba-9593-46b13cb731ce', 'b7839ad8-b7a6-4097-9299-eec26cc80e30', 'The primary plant cell wall is composed mainly of cellulose microfibrils embedded in a matrix of other polysaccharides, giving structural rigidity distinct from the chitin walls of fungi.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7f76691c-05ca-4ee4-b270-71a5cf0b837e', '49540965-3805-40bf-b729-7b60123f83aa', 128, 'Starch and cellulose are both polysaccharides made of glucose monomers, but differ mainly in:', 'Biology', 'Biomolecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8fc5f649-48c3-44a5-8fb4-1948e63e783b', '7f76691c-05ca-4ee4-b270-71a5cf0b837e', 0, 'Their monomer identity, since cellulose is not made of glucose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2929505e-50f4-4cea-8d48-c077ca46e0d9', '7f76691c-05ca-4ee4-b270-71a5cf0b837e', 1, 'The type of glycosidic linkage (alpha vs beta) connecting the glucose units, affecting digestibility and structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31e90a49-2b98-44fe-87ba-fca9d2059f5b', '7f76691c-05ca-4ee4-b270-71a5cf0b837e', 2, 'Starch having no monomers at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4635f8eb-faa9-40d2-a9b7-f83f59c59522', '7f76691c-05ca-4ee4-b270-71a5cf0b837e', 3, 'Cellulose being a protein, not a carbohydrate');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7f76691c-05ca-4ee4-b270-71a5cf0b837e', '2929505e-50f4-4cea-8d48-c077ca46e0d9', 'Starch consists of glucose units joined by alpha-glycosidic bonds (digestible by humans, coiled structure), while cellulose has beta-glycosidic bonds forming straight, strong chains that most animals (lacking cellulase) cannot digest.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5bcde201-e0f2-4687-9c11-44b6aab959cf', '49540965-3805-40bf-b729-7b60123f83aa', 129, 'Cytokinesis, the physical division of the cytoplasm following nuclear division, in plant cells occurs mainly through the formation of a:', 'Biology', 'Cell Cycle and Cell Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7cb2d044-f9f6-4268-b445-9fe1f8331dda', '5bcde201-e0f2-4687-9c11-44b6aab959cf', 0, 'Cleavage furrow, exactly as in animal cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d064f7e-d972-4438-b4e9-cea5e20d320e', '5bcde201-e0f2-4687-9c11-44b6aab959cf', 1, 'Cell plate that develops into a new cell wall, since rigid plant cell walls prevent furrowing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5d3669c-5ecc-4bab-a5b8-1aa4a26725d2', '5bcde201-e0f2-4687-9c11-44b6aab959cf', 2, 'Complete absence of any dividing structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc90cd83-86da-47b7-85e0-2bc066255a22', '5bcde201-e0f2-4687-9c11-44b6aab959cf', 3, 'Spindle fibre network only, with no new wall formed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5bcde201-e0f2-4687-9c11-44b6aab959cf', '6d064f7e-d972-4438-b4e9-cea5e20d320e', 'Because plant cells have a rigid cell wall preventing the pinching-in seen in animal cell cleavage furrows, a cell plate forms at the equator (from Golgi-derived vesicles) and develops into the new cell wall separating daughter cells.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('48b91c37-219b-4b00-b06c-0984db18cb32', '49540965-3805-40bf-b729-7b60123f83aa', 130, 'Chlorophyll a, the primary photosynthetic pigment, is a distinguishing pigment present in:', 'Biology', 'Photosynthesis in Higher Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('28371c25-0855-4ab7-b273-152701037425', '48b91c37-219b-4b00-b06c-0984db18cb32', 0, 'All photosynthetic eukaryotes and cyanobacteria, but absent in purely non-photosynthetic organisms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('103b1c6f-46b3-4350-8ded-b1b182f5af2c', '48b91c37-219b-4b00-b06c-0984db18cb32', 1, 'Only red algae');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8056dfd5-e5db-4020-a860-6eebe8afc9e0', '48b91c37-219b-4b00-b06c-0984db18cb32', 2, 'Only C4 plants, but not C3 plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('563da5a8-35e6-4e11-a6b6-4bbc304f6146', '48b91c37-219b-4b00-b06c-0984db18cb32', 3, 'Only bacteria, never in plants');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('48b91c37-219b-4b00-b06c-0984db18cb32', '28371c25-0855-4ab7-b273-152701037425', 'Chlorophyll a is the universal, primary pigment directly participating in the light reactions across all photosynthetic eukaryotes (plants, algae) and cyanobacteria, while accessory pigments vary by group.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5f7c9110-733e-4901-a147-ee9d06391b7b', '49540965-3805-40bf-b729-7b60123f83aa', 131, 'The respiratory quotient (RQ), the ratio of CO2 evolved to O2 consumed, for the complete aerobic respiration of a fat substrate is typically:', 'Biology', 'Respiration in Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2a9b487-3bb6-4682-84b8-cf30d9cbfa29', '5f7c9110-733e-4901-a147-ee9d06391b7b', 0, 'Equal to 1.0, same as for a carbohydrate substrate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dcd802cd-0ea0-4e4f-84c2-5a7390f613ff', '5f7c9110-733e-4901-a147-ee9d06391b7b', 1, 'Less than 1.0, since fats are relatively oxygen-poor and require more O2 relative to CO2 released');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('92988c05-adc6-409c-99a5-314fe4c2c62c', '5f7c9110-733e-4901-a147-ee9d06391b7b', 2, 'Greater than 1.0 always for any substrate');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e5c8eb4-fd0f-4eab-87be-50291287da44', '5f7c9110-733e-4901-a147-ee9d06391b7b', 3, 'Undefined for fats');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5f7c9110-733e-4901-a147-ee9d06391b7b', 'dcd802cd-0ea0-4e4f-84c2-5a7390f613ff', 'Fats are more reduced (oxygen-poor) than carbohydrates, requiring proportionally more O2 for complete oxidation relative to CO2 produced, giving an RQ less than 1 (typically around 0.7), compared to exactly 1.0 for carbohydrate substrates.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d3798513-16fd-467a-9eba-6bb8a969714a', '49540965-3805-40bf-b729-7b60123f83aa', 132, 'Vernalization refers to the promotion of flowering in certain plants induced by prior exposure to:', 'Biology', 'Plant Growth and Development');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea7610a8-0c58-4a7e-8deb-9b0b059c074e', 'd3798513-16fd-467a-9eba-6bb8a969714a', 0, 'Extended periods of darkness only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96882c8d-d11e-4238-813c-7e3042e300f0', 'd3798513-16fd-467a-9eba-6bb8a969714a', 1, 'A period of low temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53c57a2f-3fb9-4a0f-aa13-31b1c9a4e5c3', 'd3798513-16fd-467a-9eba-6bb8a969714a', 2, 'High-intensity light for a brief period');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a4360eb-06cd-42b7-bec3-618f781d5417', 'd3798513-16fd-467a-9eba-6bb8a969714a', 3, 'Increased carbon dioxide concentration');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d3798513-16fd-467a-9eba-6bb8a969714a', '96882c8d-d11e-4238-813c-7e3042e300f0', 'Vernalization is the requirement of certain plants (e.g., winter wheat) for a period of chilling/low temperature before they can transition to flowering, distinct from photoperiodism which depends on day length.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8245a87a-2358-41ba-89d0-1fe2ff63775c', '49540965-3805-40bf-b729-7b60123f83aa', 133, 'In angiosperms, the pollen grain, upon germinating on a compatible stigma, produces a pollen tube whose primary function is to:', 'Biology', 'Sexual Reproduction in Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('278ff381-2b24-4dae-ae63-f522776159d2', '8245a87a-2358-41ba-89d0-1fe2ff63775c', 0, 'Attract pollinators to the flower');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bf2ffd95-73ce-4b7a-bc24-7906d0d6ee33', '8245a87a-2358-41ba-89d0-1fe2ff63775c', 1, 'Carry the male gametes down through the style to the ovule for fertilization');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('726fe101-8527-410a-a93a-21e4a5953049', '8245a87a-2358-41ba-89d0-1fe2ff63775c', 2, 'Photosynthesize additional food for the plant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5278e17-6302-410e-a268-8ca41de26e57', '8245a87a-2358-41ba-89d0-1fe2ff63775c', 3, 'Produce nectar');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8245a87a-2358-41ba-89d0-1fe2ff63775c', 'bf2ffd95-73ce-4b7a-bc24-7906d0d6ee33', 'The pollen tube grows through the style, guided toward the ovule, and delivers the two non-motile male gametes to the vicinity of the egg apparatus, enabling fertilization (siphonogamy) — since angiosperm sperm cells cannot swim independently.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7fa5d67c-be87-425d-a9f7-aee33e9a6133', '49540965-3805-40bf-b729-7b60123f83aa', 134, 'Placentation refers to the arrangement of ovules within the ovary; in a tomato-like fruit where ovules are attached to a central axis with the ovary divided into chambers, the placentation type is called:', 'Biology', 'Morphology of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f634f679-55b1-4080-9a66-1bc2e2459b8c', '7fa5d67c-be87-425d-a9f7-aee33e9a6133', 0, 'Marginal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ccea0a2-1bda-490e-82cb-4ed6eea0c7f0', '7fa5d67c-be87-425d-a9f7-aee33e9a6133', 1, 'Axile');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2e349fa-1fb3-4305-9f7c-718ec2de68e1', '7fa5d67c-be87-425d-a9f7-aee33e9a6133', 2, 'Parietal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfd2909b-007c-4879-bcd8-a3e907789e22', '7fa5d67c-be87-425d-a9f7-aee33e9a6133', 3, 'Free central');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7fa5d67c-be87-425d-a9f7-aee33e9a6133', '3ccea0a2-1bda-490e-82cb-4ed6eea0c7f0', 'Axile placentation occurs when the ovary is multilocular (multiple chambers) and ovules are attached to a central axis, as seen in tomato, china rose, and lemon.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c81e8b0d-dcb1-499c-9368-816d5739f9a1', '49540965-3805-40bf-b729-7b60123f83aa', 135, 'In a typical dicot root, the arrangement of xylem and phloem is described as:', 'Biology', 'Anatomy of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('14da0e05-e695-4a86-8a0f-8fe175632d85', 'c81e8b0d-dcb1-499c-9368-816d5739f9a1', 0, 'Conjoint, with xylem and phloem in the same radius');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cde96e48-3369-48e0-940c-9ca1ce6ce84f', 'c81e8b0d-dcb1-499c-9368-816d5739f9a1', 1, 'Radial, with xylem and phloem lying on separate, alternating radii');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d75c1466-d90a-48fa-89d5-f269369d78e4', 'c81e8b0d-dcb1-499c-9368-816d5739f9a1', 2, 'Only xylem present, with no phloem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e38e3020-5548-4a90-98be-60d04772107b', 'c81e8b0d-dcb1-499c-9368-816d5739f9a1', 3, 'Concentric, with one tissue completely surrounding the other');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c81e8b0d-dcb1-499c-9368-816d5739f9a1', 'cde96e48-3369-48e0-940c-9ca1ce6ce84f', 'In dicot roots, xylem and phloem bundles are arranged radially, on separate radii around the central pith/core, distinguishing root anatomy from the conjoint vascular bundles typical of stems.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('db059250-ac97-4dd0-a102-a4e2f2dff083', '49540965-3805-40bf-b729-7b60123f83aa', 136, 'Phylum Annelida is characterized by a body that is:', 'Biology', 'Animal Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4fb1dc48-77a9-4e93-b474-efd9cf0e82da', 'db059250-ac97-4dd0-a102-a4e2f2dff083', 0, 'Unsegmented, with a soft, muscular foot');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7310faad-c4ea-42ae-871e-b82aa9460324', 'db059250-ac97-4dd0-a102-a4e2f2dff083', 1, 'Metamerically segmented (true segmentation, both externally and internally)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fcc06003-d82b-43c7-9b1d-c8f71e206b78', 'db059250-ac97-4dd0-a102-a4e2f2dff083', 2, 'Composed of a single cell only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6389ecc0-5d9d-4a79-a4d3-94fb96571364', 'db059250-ac97-4dd0-a102-a4e2f2dff083', 3, 'Radially symmetrical with no true coelom');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('db059250-ac97-4dd0-a102-a4e2f2dff083', '7310faad-c4ea-42ae-871e-b82aa9460324', 'Annelids (earthworms, leeches) show true metameric segmentation, with both external rings and internal repetition of organs, along with a true coelom — a hallmark distinguishing them from pseudocoelomate/acoelomate phyla.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e8c71afb-5b9e-4aea-adca-fe794e897faa', '49540965-3805-40bf-b729-7b60123f83aa', 137, 'Class Mammalia within Phylum Chordata is defined by characteristic features including:', 'Biology', 'Animal Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7dccea7c-0f17-4fd9-9f46-3b359a836a8e', 'e8c71afb-5b9e-4aea-adca-fe794e897faa', 0, 'Presence of scales and cold-bloodedness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c4ddb71-0f79-4df8-ab40-55044eeef9d3', 'e8c71afb-5b9e-4aea-adca-fe794e897faa', 1, 'Presence of mammary glands, hair, and a four-chambered heart with warm-bloodedness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('14c553e5-79fd-4b5b-b1a4-19488d4d8b9f', 'e8c71afb-5b9e-4aea-adca-fe794e897faa', 2, 'Exclusively aquatic habitat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0872ec74-dce8-4d1b-9046-e6fcadd99102', 'e8c71afb-5b9e-4aea-adca-fe794e897faa', 3, 'Absence of any internal skeleton');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e8c71afb-5b9e-4aea-adca-fe794e897faa', '0c4ddb71-0f79-4df8-ab40-55044eeef9d3', 'Mammals are defined by mammary glands (milk production for young), hair/fur, a fully divided four-chambered heart, and endothermy (warm-bloodedness), among other features.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9300350d-526f-4f47-a6a6-81f6ad20b3e4', '49540965-3805-40bf-b729-7b60123f83aa', 138, 'Cardiac muscle tissue is found exclusively in the:', 'Biology', 'Structural Organisation in Animals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1c4041b-3095-4da1-8a99-571795320cc0', '9300350d-526f-4f47-a6a6-81f6ad20b3e4', 0, 'Skeletal muscles of limbs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ba2a21c-c56c-43d8-a8f0-4c27b4995d5a', '9300350d-526f-4f47-a6a6-81f6ad20b3e4', 1, 'Wall of the heart');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('674ac3f9-3e69-4e38-b40f-3a389389a7ab', '9300350d-526f-4f47-a6a6-81f6ad20b3e4', 2, 'Wall of the stomach only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c0c61d4-fdff-41bc-b75e-5b77f837dc7e', '9300350d-526f-4f47-a6a6-81f6ad20b3e4', 3, 'Iris of the eye');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9300350d-526f-4f47-a6a6-81f6ad20b3e4', '8ba2a21c-c56c-43d8-a8f0-4c27b4995d5a', 'Cardiac muscle is a specialized striated, involuntary muscle tissue found only in the heart wall (myocardium), distinct from skeletal (voluntary) and smooth (involuntary, found in visceral organs) muscle.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('472af9f7-2fa4-40dc-b4f3-19195d11febf', '49540965-3805-40bf-b729-7b60123f83aa', 139, 'The volume of air that remains in the lungs even after the most forceful expiration is called the:', 'Biology', 'Breathing and Exchange of Gases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01042900-0c2c-4e33-b862-d6f87c13b178', '472af9f7-2fa4-40dc-b4f3-19195d11febf', 0, 'Tidal volume');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b79f9a4-c999-4611-8442-60fefc646bba', '472af9f7-2fa4-40dc-b4f3-19195d11febf', 1, 'Residual volume');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('926cf6af-964b-49e5-810f-e80cfa1307c9', '472af9f7-2fa4-40dc-b4f3-19195d11febf', 2, 'Vital capacity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5325e322-f845-4430-b288-b0ecde72e25c', '472af9f7-2fa4-40dc-b4f3-19195d11febf', 3, 'Inspiratory reserve volume');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('472af9f7-2fa4-40dc-b4f3-19195d11febf', '5b79f9a4-c999-4611-8442-60fefc646bba', 'Residual volume is the air that cannot be expelled from the lungs even after maximal forced expiration, preventing complete lung collapse.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9b7040e9-3c18-4b0d-8daf-07422499eeba', '49540965-3805-40bf-b729-7b60123f83aa', 140, 'The lub-dub sounds of a normal heartbeat are caused by:', 'Biology', 'Body Fluids and Circulation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('83c6adc2-5818-456f-b69e-35f4b34e8778', '9b7040e9-3c18-4b0d-8daf-07422499eeba', 0, 'The contraction of cardiac muscle fibres directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a30806d2-fbe8-45bd-a10c-47e69c4b31fd', '9b7040e9-3c18-4b0d-8daf-07422499eeba', 1, 'The closure of the heart''s valves (AV valves for ''lub'', semilunar valves for ''dub'')');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40477d2f-32fa-4e85-82de-6b19e49e32ba', '9b7040e9-3c18-4b0d-8daf-07422499eeba', 2, 'Blood flow through arteries only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('912f7e2e-8622-449a-9cc9-2534b0ed8f0f', '9b7040e9-3c18-4b0d-8daf-07422499eeba', 3, 'Nervous impulses from the SA node');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9b7040e9-3c18-4b0d-8daf-07422499eeba', 'a30806d2-fbe8-45bd-a10c-47e69c4b31fd', 'The first heart sound (''lub'') is produced by closure of the atrioventricular (tricuspid/mitral) valves, and the second (''dub'') by closure of the semilunar (aortic/pulmonary) valves during the cardiac cycle.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8a659ea2-d400-42ed-b589-7208c4413cfc', '49540965-3805-40bf-b729-7b60123f83aa', 141, 'Lymph, a fluid connective tissue, differs from blood mainly in that it:', 'Biology', 'Body Fluids and Circulation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c24fb55-e2d7-44e4-ace0-6071c2da79e2', '8a659ea2-d400-42ed-b589-7208c4413cfc', 0, 'Contains red blood cells in large numbers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12209a88-32e9-4516-a411-8062ca6a29b1', '8a659ea2-d400-42ed-b589-7208c4413cfc', 1, 'Lacks red blood cells and has a lower protein content than blood plasma');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('741a5c77-c32b-4bbe-ad1d-e556cb8550d6', '8a659ea2-d400-42ed-b589-7208c4413cfc', 2, 'Never returns to the bloodstream');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca91bc3c-d6f3-4372-8a90-42c763b87f7f', '8a659ea2-d400-42ed-b589-7208c4413cfc', 3, 'Is pumped directly by the heart, just like blood');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8a659ea2-d400-42ed-b589-7208c4413cfc', '12209a88-32e9-4516-a411-8062ca6a29b1', 'Lymph is derived from blood plasma that has leaked into tissue spaces; it lacks RBCs and has lower protein content, and is eventually returned to the bloodstream via the lymphatic vessels, rather than being pumped directly by the heart.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1e9c1a61-ac4d-4b4f-a556-8e109ea17adb', '49540965-3805-40bf-b729-7b60123f83aa', 142, 'Ammonotelic organisms, which excrete nitrogenous waste primarily as ammonia, are typically:', 'Biology', 'Excretory Products and Their Elimination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb2d6aaf-3f6d-441f-82e0-5985bc02bc9a', '1e9c1a61-ac4d-4b4f-a556-8e109ea17adb', 0, 'Terrestrial animals in arid environments, since ammonia conserves water');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c8962f3-17f1-4095-af57-c0ceb1f2d5f0', '1e9c1a61-ac4d-4b4f-a556-8e109ea17adb', 1, 'Aquatic animals, where ammonia can be rapidly diluted and washed away, since it is highly toxic and water-soluble');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('883c21d6-17f1-4858-a044-88d9dc25471d', '1e9c1a61-ac4d-4b4f-a556-8e109ea17adb', 2, 'Birds and reptiles exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('61fe409d-ab55-4c2b-83af-529aa78326d6', '1e9c1a61-ac4d-4b4f-a556-8e109ea17adb', 3, 'Insects exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1e9c1a61-ac4d-4b4f-a556-8e109ea17adb', '4c8962f3-17f1-4095-af57-c0ceb1f2d5f0', 'Ammonia is highly toxic and requires large amounts of water for safe excretion; aquatic organisms (like most bony fish) can excrete it directly, rapidly diluting it in the surrounding water, unlike terrestrial animals that must convert it to less toxic urea or uric acid.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('90da4e78-76f7-4328-b9cb-7de0aaa8477a', '49540965-3805-40bf-b729-7b60123f83aa', 143, 'A synovial joint, such as the knee, is characterized by the presence of:', 'Biology', 'Locomotion and Movement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a16047ef-7baa-4ea7-823a-9b8d8e1d141e', '90da4e78-76f7-4328-b9cb-7de0aaa8477a', 0, 'No cavity at all between bones');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b8705efe-ff4e-4b34-aa77-16bd28bb43b4', '90da4e78-76f7-4328-b9cb-7de0aaa8477a', 1, 'A fluid-filled joint cavity (synovial fluid) that lubricates and reduces friction between articulating bones');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e739ddac-ce40-4286-868a-3572ff568d8b', '90da4e78-76f7-4328-b9cb-7de0aaa8477a', 2, 'Fused bones with zero movement possible');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2176e251-449d-499c-9ea8-f0aaf195edfe', '90da4e78-76f7-4328-b9cb-7de0aaa8477a', 3, 'Cartilage completely replacing bone');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('90da4e78-76f7-4328-b9cb-7de0aaa8477a', 'b8705efe-ff4e-4b34-aa77-16bd28bb43b4', 'Synovial joints have a joint cavity filled with lubricating synovial fluid, enclosed within a joint capsule, allowing smooth, largely frictionless movement between the articulating bone surfaces.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('92ec04e3-3a96-4679-9319-b005f8f81f9d', '49540965-3805-40bf-b729-7b60123f83aa', 144, 'The knee-jerk reflex is a classic example of a:', 'Biology', 'Neural Control and Coordination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aec0e581-e093-43f3-a598-286b4c38ade1', '92ec04e3-3a96-4679-9319-b005f8f81f9d', 0, 'Voluntary, conscious action requiring cortical processing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f30a1ac1-2292-4f90-8ce5-1ba2b4c12a5e', '92ec04e3-3a96-4679-9319-b005f8f81f9d', 1, 'Monosynaptic spinal reflex, not requiring conscious brain involvement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87f10625-0fe3-4b1c-bc60-a56439e26942', '92ec04e3-3a96-4679-9319-b005f8f81f9d', 2, 'Reflex mediated entirely by the autonomic nervous system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b73a790d-f719-4a08-8b43-935cc71886ee', '92ec04e3-3a96-4679-9319-b005f8f81f9d', 3, 'Response that only occurs during sleep');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('92ec04e3-3a96-4679-9319-b005f8f81f9d', 'f30a1ac1-2292-4f90-8ce5-1ba2b4c12a5e', 'The knee-jerk (patellar) reflex is a rapid, monosynaptic reflex arc processed at the spinal cord level, allowing a fast protective/postural response without needing to wait for conscious brain processing.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a92c0d46-ace0-4378-a0a3-91b750da1204', '49540965-3805-40bf-b729-7b60123f83aa', 145, 'The adrenal medulla secretes which hormones in response to stress (''fight or flight'' response)?', 'Biology', 'Chemical Coordination and Integration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19f47e65-817c-44eb-a90e-59dca228f504', 'a92c0d46-ace0-4378-a0a3-91b750da1204', 0, 'Insulin and glucagon');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('045a0fdc-f283-424c-8d59-7d66eb719590', 'a92c0d46-ace0-4378-a0a3-91b750da1204', 1, 'Adrenaline (epinephrine) and noradrenaline (norepinephrine)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('654a627c-c1ea-4ce4-8949-7b52c458c55e', 'a92c0d46-ace0-4378-a0a3-91b750da1204', 2, 'Thyroxine and calcitonin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e22bd47-c20f-4635-a19f-f2134f50821b', 'a92c0d46-ace0-4378-a0a3-91b750da1204', 3, 'Estrogen and progesterone');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a92c0d46-ace0-4378-a0a3-91b750da1204', '045a0fdc-f283-424c-8d59-7d66eb719590', 'The adrenal medulla releases adrenaline and noradrenaline during acute stress, rapidly increasing heart rate, blood pressure, and blood glucose to prepare the body for immediate physical action.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('09857c84-f476-4a4d-b910-fe36d38970c4', '49540965-3805-40bf-b729-7b60123f83aa', 146, 'The corpus luteum, formed from the remnants of the ruptured Graafian follicle after ovulation, primarily secretes:', 'Biology', 'Human Reproduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d3d209c-418f-4b4a-abae-20c53bc7e20c', '09857c84-f476-4a4d-b910-fe36d38970c4', 0, 'FSH');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ccdc230-cfa7-412b-86ec-7c8340350c93', '09857c84-f476-4a4d-b910-fe36d38970c4', 1, 'Progesterone (and some estrogen), which maintains the uterine lining for potential implantation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a04fab0c-9f0f-4d95-8e4a-6fb686c4f1a9', '09857c84-f476-4a4d-b910-fe36d38970c4', 2, 'Testosterone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f55af5a-9cc4-4e7e-9670-f6d3dbbdfd3c', '09857c84-f476-4a4d-b910-fe36d38970c4', 3, 'Oxytocin exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('09857c84-f476-4a4d-b910-fe36d38970c4', '8ccdc230-cfa7-412b-86ec-7c8340350c93', 'The corpus luteum secretes progesterone (with some estrogen), which maintains the endometrium in a receptive state; if fertilization does not occur, it degenerates, causing progesterone levels to fall and menstruation to begin.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9e6d427e-1333-41c3-a69e-90731c6d1b27', '49540965-3805-40bf-b729-7b60123f83aa', 147, 'The process of implantation, where the blastocyst embeds into the uterine wall, normally occurs approximately how many days after fertilization?', 'Biology', 'Human Reproduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85451136-d42c-4662-93ea-d8fc849d7903', '9e6d427e-1333-41c3-a69e-90731c6d1b27', 0, '1 day');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32e09007-658a-45e7-a062-b62465b7849c', '9e6d427e-1333-41c3-a69e-90731c6d1b27', 1, '6-7 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c5da0a4c-d68a-42bd-ba4b-e67ae2718f7b', '9e6d427e-1333-41c3-a69e-90731c6d1b27', 2, '30 days');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a2b1596-a5a3-4317-81ad-f1dd37d6cb07', '9e6d427e-1333-41c3-a69e-90731c6d1b27', 3, 'It occurs before fertilization');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9e6d427e-1333-41c3-a69e-90731c6d1b27', '32e09007-658a-45e7-a062-b62465b7849c', 'After fertilization in the fallopian tube, the developing embryo (now a blastocyst) travels to the uterus and typically implants into the endometrial lining about 6-7 days post-fertilization.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6995fc16-bcd4-4b57-8c75-6eb805e34d58', '49540965-3805-40bf-b729-7b60123f83aa', 148, 'In-vitro fertilization (IVF), a widely used Assisted Reproductive Technology, involves:', 'Biology', 'Reproductive Health');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d33789fc-ba79-4dc7-be4f-7f6770e2738a', '6995fc16-bcd4-4b57-8c75-6eb805e34d58', 0, 'Fertilization occurring naturally inside the mother''s body');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73b59776-23b8-4b2c-ba3e-1a2da409b1f6', '6995fc16-bcd4-4b57-8c75-6eb805e34d58', 1, 'Fertilizing an ovum with sperm outside the body (in a laboratory dish), then transferring the resulting embryo into the uterus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bba7e5fb-5975-4de2-97bf-953d5c160b33', '6995fc16-bcd4-4b57-8c75-6eb805e34d58', 2, 'Only hormonal treatment with no embryo transfer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dcbee5fa-c09e-4986-b136-0dd9c7204fde', '6995fc16-bcd4-4b57-8c75-6eb805e34d58', 3, 'Directly injecting sperm into the uterus without any fertilization step (this describes IUI, a different technique)');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6995fc16-bcd4-4b57-8c75-6eb805e34d58', '73b59776-23b8-4b2c-ba3e-1a2da409b1f6', 'IVF involves collecting eggs and sperm, allowing fertilization to occur outside the body in a controlled laboratory setting, and then transferring the resulting early embryo (or zygote) into the uterus to establish pregnancy.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('95a17f67-d034-415e-875f-4a56ef2e1316', '49540965-3805-40bf-b729-7b60123f83aa', 149, 'Autoimmune diseases occur when the body''s immune system:', 'Biology', 'Human Health and Disease');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0a642d9-16fa-4d2a-ad7b-71af2b50a27e', '95a17f67-d034-415e-875f-4a56ef2e1316', 0, 'Fails to respond to any foreign antigen at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7d27957-dfbb-4930-9f91-e5d9e516c771', '95a17f67-d034-415e-875f-4a56ef2e1316', 1, 'Mistakenly attacks and damages the body''s own healthy cells and tissues, treating them as foreign');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('203a4371-b2e4-4712-af7d-e58f3de18d50', '95a17f67-d034-415e-875f-4a56ef2e1316', 2, 'Only attacks bacteria, never viruses');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc32ebf7-f2d2-4ce0-a5ac-05d7b4e0e7cd', '95a17f67-d034-415e-875f-4a56ef2e1316', 3, 'Becomes permanently inactive');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('95a17f67-d034-415e-875f-4a56ef2e1316', 'c7d27957-dfbb-4930-9f91-e5d9e516c771', 'In autoimmune disorders, the immune system loses the ability to distinguish ''self'' from ''non-self'' and mounts an attack against the individual''s own tissues, as seen in conditions like rheumatoid arthritis.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('73c926b7-acde-4730-8753-14e51927acd8', '49540965-3805-40bf-b729-7b60123f83aa', 150, 'AIDS (Acquired Immunodeficiency Syndrome) is caused by HIV, which specifically infects and destroys:', 'Biology', 'Human Health and Disease');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c66c3a5b-b1ab-4e10-9c04-86feedda8d33', '73c926b7-acde-4730-8753-14e51927acd8', 0, 'Red blood cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79e6568f-a7ad-4e32-a08c-951dc444dabf', '73c926b7-acde-4730-8753-14e51927acd8', 1, 'Helper T-lymphocytes (CD4+ T cells), severely weakening the immune system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('acac97b6-65b6-43b9-8b6e-5659a16a5f75', '73c926b7-acde-4730-8753-14e51927acd8', 2, 'Only skin cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('61aab94a-b38b-4666-9524-d59e1ecbaa96', '73c926b7-acde-4730-8753-14e51927acd8', 3, 'Bone marrow stem cells exclusively, with no effect on lymphocytes');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('73c926b7-acde-4730-8753-14e51927acd8', '79e6568f-a7ad-4e32-a08c-951dc444dabf', 'HIV preferentially infects and progressively destroys helper T-lymphocytes (CD4+ cells), which are central to coordinating both humoral and cell-mediated immune responses — their depletion severely compromises overall immunity, defining AIDS.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a1d3c788-d2d4-4043-b7c3-1964c559207f', '49540965-3805-40bf-b729-7b60123f83aa', 151, 'Vegetative propagation, a form of asexual reproduction in plants, can naturally occur through structures such as:', 'Biology', 'Reproduction in Organisms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbfeddbc-7671-4e32-8518-93e9412396fb', 'a1d3c788-d2d4-4043-b7c3-1964c559207f', 0, 'Seeds formed after fertilization only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('06bde127-b662-468a-82a2-f8bc0139d525', 'a1d3c788-d2d4-4043-b7c3-1964c559207f', 1, 'Runners, rhizomes, tubers, and other modified stems/roots that can give rise to new independent plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9877b7de-698b-42be-8b08-14453c44d1e2', 'a1d3c788-d2d4-4043-b7c3-1964c559207f', 2, 'Pollen grains exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3650dedd-fb8c-4483-9c1f-afd582c7d20c', 'a1d3c788-d2d4-4043-b7c3-1964c559207f', 3, 'Spores produced in a sporangium only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a1d3c788-d2d4-4043-b7c3-1964c559207f', '06bde127-b662-468a-82a2-f8bc0139d525', 'Natural vegetative propagation uses vegetative plant parts — like runners (strawberry), rhizomes (ginger), or tubers (potato) — that can develop into complete new plants genetically identical to the parent, without involving seeds or spores.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('611aa416-5a07-4fea-8533-70acc12d01e1', '49540965-3805-40bf-b729-7b60123f83aa', 152, 'Turner''s syndrome in human females is characterized by the chromosomal constitution:', 'Biology', 'Genetics and Evolution — Human Genetics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2b70038-f859-4828-8901-b581d1e6f24c', '611aa416-5a07-4fea-8533-70acc12d01e1', 0, '44+XX');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99435b08-8a06-4f68-9f89-8f7a786d570f', '611aa416-5a07-4fea-8533-70acc12d01e1', 1, '44+XO (a single X chromosome, with the other sex chromosome missing)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ace29c1-dd85-4e53-94c1-18623d4d3138', '611aa416-5a07-4fea-8533-70acc12d01e1', 2, '44+XXY');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('269c3d91-ff85-4524-9ceb-f17bab6e7ec9', '611aa416-5a07-4fea-8533-70acc12d01e1', 3, '44+XYY');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('611aa416-5a07-4fea-8533-70acc12d01e1', '99435b08-8a06-4f68-9f89-8f7a786d570f', 'Turner''s syndrome results from monosomy of the X chromosome (45,X or 44+XO), associated with characteristic developmental features including short stature and ovarian underdevelopment.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('135341f4-b120-4d39-a842-f0f721c09fd6', '49540965-3805-40bf-b729-7b60123f83aa', 153, 'In humans, the sex of the offspring is determined by the sex chromosome contributed by the:', 'Biology', 'Genetics and Evolution — Sex Determination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('225c3d4e-c071-48dc-b71f-9c760b4759e2', '135341f4-b120-4d39-a842-f0f721c09fd6', 0, 'Mother, since she contributes either an X or Y chromosome');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3494fc7-da2f-4179-88a1-66cbf74fe7ca', '135341f4-b120-4d39-a842-f0f721c09fd6', 1, 'Father, since he contributes either an X (resulting in a female) or a Y (resulting in a male) chromosome, while the mother always contributes an X');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e467461-27b2-408f-843c-dbce974d72ac', '135341f4-b120-4d39-a842-f0f721c09fd6', 2, 'Neither parent; it is determined randomly after fertilization');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('81ebfeef-6b68-4f02-836e-2a5e47682af5', '135341f4-b120-4d39-a842-f0f721c09fd6', 3, 'Both parents equally through blending of chromosomes');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('135341f4-b120-4d39-a842-f0f721c09fd6', 'c3494fc7-da2f-4179-88a1-66cbf74fe7ca', 'Human females are XX and always contribute an X chromosome via the egg; males are XY, contributing either an X or Y sperm — it is therefore the father''s sperm (X- or Y-bearing) that determines the offspring''s sex.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6a3fac6b-10dc-4c11-83fc-9cdfacb04f86', '49540965-3805-40bf-b729-7b60123f83aa', 154, 'Darwin''s finches on the Galapagos Islands, showing a variety of beak shapes adapted to different food sources from a common ancestor, are a classic example of:', 'Biology', 'Evolution — Adaptive Radiation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a72f8b7-58e0-41a8-9549-c8e4110b9674', '6a3fac6b-10dc-4c11-83fc-9cdfacb04f86', 0, 'Convergent evolution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0fd3d9b5-a5f4-4de1-8852-c0f7a4c37e09', '6a3fac6b-10dc-4c11-83fc-9cdfacb04f86', 1, 'Adaptive radiation — diversification of an ancestral species into multiple forms adapted to different ecological niches');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51e81592-75d4-4123-9fb5-c75c76800e92', '6a3fac6b-10dc-4c11-83fc-9cdfacb04f86', 2, 'Genetic drift with no adaptive significance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e8f87cd0-2e63-4adf-a2c0-8ca9c70eef1c', '6a3fac6b-10dc-4c11-83fc-9cdfacb04f86', 3, 'Artificial selection by humans');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6a3fac6b-10dc-4c11-83fc-9cdfacb04f86', '0fd3d9b5-a5f4-4de1-8852-c0f7a4c37e09', 'Adaptive radiation describes the diversification of a single ancestral species into multiple descendant species, each adapted to exploit a different ecological niche/food source — Darwin''s finches are one of the most cited textbook examples.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8d165840-db15-48ee-a58c-20593214a13b', '49540965-3805-40bf-b729-7b60123f83aa', 155, 'ELISA (Enzyme-Linked Immunosorbent Assay) is a diagnostic technique based on the principle of:', 'Biology', 'Biotechnology and Its Applications — Molecular Diagnosis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9a1da02-1ee0-4e8a-ac5e-279dad2ed26f', '8d165840-db15-48ee-a58c-20593214a13b', 0, 'DNA amplification via PCR');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b610ef37-7454-4f9c-9f50-bad46ccd5b0c', '8d165840-db15-48ee-a58c-20593214a13b', 1, 'Antigen-antibody interaction, detected via an enzyme-linked color-producing reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e798413b-dc88-4e09-b6be-d07cffe144e1', '8d165840-db15-48ee-a58c-20593214a13b', 2, 'Direct visualization of pathogens under a microscope');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5dd06627-95ed-4b51-9bcd-051def6f3e84', '8d165840-db15-48ee-a58c-20593214a13b', 3, 'Measuring blood pressure');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8d165840-db15-48ee-a58c-20593214a13b', 'b610ef37-7454-4f9c-9f50-bad46ccd5b0c', 'ELISA detects the presence of a specific antigen or antibody in a sample using a linked enzyme that produces a measurable color change upon substrate reaction, widely used for diagnosing infections including HIV.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c5fddd22-cbb5-4378-8b3c-3666c3d43d25', '49540965-3805-40bf-b729-7b60123f83aa', 156, 'The interaction in which the barnacles attached to a whale''s skin benefit (gaining transport and food access) while the whale is largely unaffected is an example of:', 'Biology', 'Organisms and Populations — Interactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f117cdd-e9bb-4111-9d1f-d52fd5e454a8', 'c5fddd22-cbb5-4378-8b3c-3666c3d43d25', 0, 'Parasitism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('869d691c-c22c-4f68-b908-e14240bbc30b', 'c5fddd22-cbb5-4378-8b3c-3666c3d43d25', 1, 'Commensalism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4391a72-395e-4503-8ab9-c1f7af5ff1a6', 'c5fddd22-cbb5-4378-8b3c-3666c3d43d25', 2, 'Mutualism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae27f58f-66ee-4411-91c0-2fdcbd31df06', 'c5fddd22-cbb5-4378-8b3c-3666c3d43d25', 3, 'Predation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c5fddd22-cbb5-4378-8b3c-3666c3d43d25', '869d691c-c22c-4f68-b908-e14240bbc30b', 'Commensalism describes an interaction where one species benefits (the barnacle gains mobility and feeding opportunities) while the other (the whale) is neither significantly helped nor harmed.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0bb18399-0f66-4611-9b6c-648becaed11d', '49540965-3805-40bf-b729-7b60123f83aa', 157, 'Primary ecological succession begins on a substrate that:', 'Biology', 'Ecosystem — Ecological Succession');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33d00c49-4bd2-4147-b1c9-c1c9775d5617', '0bb18399-0f66-4611-9b6c-648becaed11d', 0, 'Already has a fully developed soil and community of organisms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f185d76c-90d8-4d12-bdb3-c85d1f61ebdd', '0bb18399-0f66-4611-9b6c-648becaed11d', 1, 'Is completely bare/lifeless, such as newly formed volcanic rock or a sand dune, with no pre-existing soil');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab40a65d-5d2f-4149-bf38-a42be706699f', '0bb18399-0f66-4611-9b6c-648becaed11d', 2, 'Has been recently disturbed by fire but still retains original soil and seeds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00c5ef23-ccad-40de-ac41-753924b5c76f', '0bb18399-0f66-4611-9b6c-648becaed11d', 3, 'Is always aquatic');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0bb18399-0f66-4611-9b6c-648becaed11d', 'f185d76c-90d8-4d12-bdb3-c85d1f61ebdd', 'Primary succession starts from scratch on entirely bare substrates lacking soil or prior life (e.g., bare rock, cooled lava) — distinct from secondary succession, which begins on a site that already had soil and organisms before a disturbance.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('51c8cb86-9d7d-424c-8fa5-b4197a0f9ea8', '49540965-3805-40bf-b729-7b60123f83aa', 158, 'Sacred groves, small forest patches traditionally protected by local communities for religious/cultural reasons, serve as an important example of:', 'Biology', 'Biodiversity and Conservation — Sacred Groves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e6f714bb-449c-438b-a25a-b565a1ca6f50', '51c8cb86-9d7d-424c-8fa5-b4197a0f9ea8', 0, 'Ex-situ conservation only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7fe38ead-6634-4dc5-860d-c7a7ccea095c', '51c8cb86-9d7d-424c-8fa5-b4197a0f9ea8', 1, 'In-situ conservation through traditional community-based practices');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('545f24b9-604f-4f23-97a6-bab4d22d116a', '51c8cb86-9d7d-424c-8fa5-b4197a0f9ea8', 2, 'Complete habitat destruction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb74b0fb-4bcd-4314-9f87-96b5ac096257', '51c8cb86-9d7d-424c-8fa5-b4197a0f9ea8', 3, 'A modern zoo-based conservation strategy');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('51c8cb86-9d7d-424c-8fa5-b4197a0f9ea8', '7fe38ead-6634-4dc5-860d-c7a7ccea095c', 'Sacred groves are patches of relatively undisturbed natural vegetation preserved by local communities for cultural/religious reasons, functioning as an important traditional form of in-situ biodiversity conservation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6a962422-ca60-441d-9c87-8ac4e2eb12c4', '49540965-3805-40bf-b729-7b60123f83aa', 159, 'Bile, produced by the liver and stored in the gallbladder, aids digestion mainly by:', 'Biology', 'Digestion and Absorption');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba8e1586-4830-4598-a42b-eef228a5ae2d', '6a962422-ca60-441d-9c87-8ac4e2eb12c4', 0, 'Directly digesting proteins into amino acids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b4bddb6-7032-4f7b-b653-29a3f65f30f3', '6a962422-ca60-441d-9c87-8ac4e2eb12c4', 1, 'Emulsifying large fat globules into smaller droplets, increasing the surface area for lipase action');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88e543b7-ab46-4c57-93ea-31f656e149e1', '6a962422-ca60-441d-9c87-8ac4e2eb12c4', 2, 'Neutralizing all stomach acid completely before it enters the intestine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a702c813-5474-4594-979a-5e13bb812296', '6a962422-ca60-441d-9c87-8ac4e2eb12c4', 3, 'Breaking down carbohydrates into glucose');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6a962422-ca60-441d-9c87-8ac4e2eb12c4', '4b4bddb6-7032-4f7b-b653-29a3f65f30f3', 'Bile salts emulsify dietary fats into smaller droplets, dramatically increasing the surface area available for pancreatic lipase to act upon, though bile itself contains no digestive enzymes.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('72b1a1f9-2d2e-4873-852c-760215d8a69b', '49540965-3805-40bf-b729-7b60123f83aa', 160, 'The primary center controlling the rhythm of normal breathing is located in the:', 'Biology', 'Breathing and Exchange of Gases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5cc49e2c-c8ca-4b16-91f3-0d729c274fd5', '72b1a1f9-2d2e-4873-852c-760215d8a69b', 0, 'Cerebrum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('00ba507a-dc98-4b76-97ae-c19886b26798', '72b1a1f9-2d2e-4873-852c-760215d8a69b', 1, 'Medulla oblongata (with fine-tuning from the pons)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4399b1a6-eaec-4a76-b389-494e979f6b48', '72b1a1f9-2d2e-4873-852c-760215d8a69b', 2, 'Cerebellum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55f376b8-bb28-43b9-bfb9-7ea8cb902af6', '72b1a1f9-2d2e-4873-852c-760215d8a69b', 3, 'Spinal cord only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('72b1a1f9-2d2e-4873-852c-760215d8a69b', '00ba507a-dc98-4b76-97ae-c19886b26798', 'The medulla oblongata contains the rhythm center that generates the basic breathing pattern, with the pneumotaxic and apneustic centers in the pons providing fine adjustment of rate/depth.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('068ab0eb-2219-4a44-8b50-37820e8447bd', '49540965-3805-40bf-b729-7b60123f83aa', 161, 'Osteoporosis, a common age-related bone disorder, is characterized by:', 'Biology', 'Locomotion and Movement — Disorders');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0cadad99-94b0-49b8-a823-f5fdb6de8bca', '068ab0eb-2219-4a44-8b50-37820e8447bd', 0, 'Excessive bone density due to calcium overload');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('108596c0-c1a0-4a5a-b1d6-09f95c00b801', '068ab0eb-2219-4a44-8b50-37820e8447bd', 1, 'Decreased bone mass and density, making bones porous and prone to fracture, often linked to hormonal changes (e.g., reduced estrogen)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('efd3061c-6186-4703-a968-296f6ee28999', '068ab0eb-2219-4a44-8b50-37820e8447bd', 2, 'Inflammation of joints due to autoimmune attack');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd3c1a93-c4b0-4c05-aa39-0f65742cbaf8', '068ab0eb-2219-4a44-8b50-37820e8447bd', 3, 'A bacterial infection of bone tissue only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('068ab0eb-2219-4a44-8b50-37820e8447bd', '108596c0-c1a0-4a5a-b1d6-09f95c00b801', 'Osteoporosis involves progressive loss of bone mineral density, making bones fragile and fracture-prone; it is strongly associated with aging and hormonal decline, particularly reduced estrogen in postmenopausal women.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8d3419ce-79ae-4779-bbdd-c666f1afe6c3', '49540965-3805-40bf-b729-7b60123f83aa', 162, 'The pituitary gland is often called the ''master gland'' because it:', 'Biology', 'Chemical Coordination and Integration — Pituitary');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('14454ccd-fb72-40e8-9a54-392cfa2b1b46', '8d3419ce-79ae-4779-bbdd-c666f1afe6c3', 0, 'Is the largest endocrine gland in the body');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17e444d7-2705-4307-9550-f7a8f8a642f7', '8d3419ce-79ae-4779-bbdd-c666f1afe6c3', 1, 'Secretes hormones (like TSH, ACTH, FSH, LH) that regulate the activity of several other endocrine glands');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39d89ab7-cc7c-4ac2-9817-7e99bbf6bc79', '8d3419ce-79ae-4779-bbdd-c666f1afe6c3', 2, 'Produces only digestive enzymes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('61736e9b-3cb4-4fd5-9d45-081cb5304e0b', '8d3419ce-79ae-4779-bbdd-c666f1afe6c3', 3, 'Has no connection to the nervous system at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8d3419ce-79ae-4779-bbdd-c666f1afe6c3', '17e444d7-2705-4307-9550-f7a8f8a642f7', 'The pituitary secretes multiple tropic hormones that control the activity of other endocrine glands (thyroid, adrenal cortex, gonads), earning its ''master gland'' designation, though it itself is regulated by the hypothalamus.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0a134661-8218-48e4-8698-d83321569ec0', '49540965-3805-40bf-b729-7b60123f83aa', 163, 'The process of spermiogenesis refers specifically to:', 'Biology', 'Human Reproduction — Gametogenesis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ae34b9c-47fa-46f8-bc78-1f8aba89fd46', '0a134661-8218-48e4-8698-d83321569ec0', 0, 'The initial mitotic division of spermatogonia');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9895483b-dc5a-41d5-ac59-e841148ea582', '0a134661-8218-48e4-8698-d83321569ec0', 1, 'The transformation/maturation of spermatids into physiologically mature, motile spermatozoa');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1208553-31ac-4026-98d6-fafb20b974f0', '0a134661-8218-48e4-8698-d83321569ec0', 2, 'The formation of the primary oocyte');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f52e1466-b9c1-452a-a88b-9e346819536f', '0a134661-8218-48e4-8698-d83321569ec0', 3, 'Meiosis I in spermatogenesis');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0a134661-8218-48e4-8698-d83321569ec0', '9895483b-dc5a-41d5-ac59-e841148ea582', 'Spermiogenesis is the final maturation stage in which round, non-motile spermatids remodel into elongated, flagellated, motile spermatozoa, including acrosome and tail formation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('bcabac3b-428e-4fba-8cc6-87eadfd28088', '49540965-3805-40bf-b729-7b60123f83aa', 164, 'Oncogenes are genes that, when activated or overexpressed, can contribute to converting a normal cell into a cancerous one; they are often derived from normal cellular genes called:', 'Biology', 'Human Health and Disease — Cancer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ee00b634-e87d-4fbb-8e0b-426f037a3717', 'bcabac3b-428e-4fba-8cc6-87eadfd28088', 0, 'Tumor suppressor genes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43c54160-2331-4593-b51c-e72ec897b0bd', 'bcabac3b-428e-4fba-8cc6-87eadfd28088', 1, 'Proto-oncogenes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('51e45f80-c2b8-4b10-a48a-86170c82c19b', 'bcabac3b-428e-4fba-8cc6-87eadfd28088', 2, 'Housekeeping genes only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5402642-00f5-4bdc-9189-ce9e30165c37', 'bcabac3b-428e-4fba-8cc6-87eadfd28088', 3, 'Structural genes with no regulatory role');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bcabac3b-428e-4fba-8cc6-87eadfd28088', '43c54160-2331-4593-b51c-e72ec897b0bd', 'Proto-oncogenes are normal genes involved in regulating cell growth/division; mutation or overexpression can convert them into oncogenes that drive uncontrolled cell proliferation characteristic of cancer.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('077ff173-b543-41a6-a4a0-95a9b788e0fd', '49540965-3805-40bf-b729-7b60123f83aa', 165, 'The process of selective reabsorption of useful substances (like glucose, amino acids, and much of the filtered water) back into the blood occurs mainly in the:', 'Biology', 'Excretory Products and Their Elimination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1f613dbe-e2d7-4ec6-bf9a-80dd474bd019', '077ff173-b543-41a6-a4a0-95a9b788e0fd', 0, 'Glomerulus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d93bafe6-ec36-4f75-bb7c-9e381cd5f8b3', '077ff173-b543-41a6-a4a0-95a9b788e0fd', 1, 'Proximal convoluted tubule (PCT) of the nephron');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3dff05e5-d373-4023-a3dc-1a2886e5666f', '077ff173-b543-41a6-a4a0-95a9b788e0fd', 2, 'Ureter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('478c2dbf-7a6e-4771-b649-bc96e7ba7b83', '077ff173-b543-41a6-a4a0-95a9b788e0fd', 3, 'Urinary bladder');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('077ff173-b543-41a6-a4a0-95a9b788e0fd', 'd93bafe6-ec36-4f75-bb7c-9e381cd5f8b3', 'The PCT is the primary site of selective reabsorption, reclaiming nearly all filtered glucose and amino acids and a large fraction of water and ions back into the peritubular capillaries.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b71cf025-f9a3-4d89-8db7-0198016a2a76', '49540965-3805-40bf-b729-7b60123f83aa', 166, 'The photoreceptor cells in the human retina responsible for color vision, functioning best in bright light, are called:', 'Biology', 'Neural Control and Coordination — Sense Organs');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73a44d4b-fb36-49df-97be-572c1e0f6db3', 'b71cf025-f9a3-4d89-8db7-0198016a2a76', 0, 'Rods');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('154852a2-bd0f-4665-894a-c7e892a861c1', 'b71cf025-f9a3-4d89-8db7-0198016a2a76', 1, 'Cones');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3af43d06-158d-4575-af53-924f86295c2a', 'b71cf025-f9a3-4d89-8db7-0198016a2a76', 2, 'Bipolar cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8e5dadd-69fa-4aec-b6de-53d4a429880d', 'b71cf025-f9a3-4d89-8db7-0198016a2a76', 3, 'Ganglion cells');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b71cf025-f9a3-4d89-8db7-0198016a2a76', '154852a2-bd0f-4665-894a-c7e892a861c1', 'Cones are photoreceptors specialized for color vision and high visual acuity under bright-light (photopic) conditions, while rods are more sensitive but achromatic, functioning mainly in dim light.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('794d14a6-e490-4814-bb56-eb5213d68114', '49540965-3805-40bf-b729-7b60123f83aa', 167, 'Fossils, preserved remains or traces of ancient organisms, provide direct evidence for evolution primarily by:', 'Biology', 'Evolution — Fossil Evidence');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa15d162-7e80-4648-b44d-2046f2688444', '794d14a6-e490-4814-bb56-eb5213d68114', 0, 'Showing that all species have always existed unchanged, with no fossils of extinct forms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a31e5321-326a-4970-bc63-8811f310776e', '794d14a6-e490-4814-bb56-eb5213d68114', 1, 'Revealing a chronological record of gradually changing life forms across geological time when arranged by the age of the rock strata in which they are found');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1a55287-cfaa-4fd2-af47-929193a78501', '794d14a6-e490-4814-bb56-eb5213d68114', 2, 'Only representing organisms alive today');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a68754c-34c7-43ab-aa83-7f578e71a4a6', '794d14a6-e490-4814-bb56-eb5213d68114', 3, 'Proving that no organism has ever gone extinct');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('794d14a6-e490-4814-bb56-eb5213d68114', 'a31e5321-326a-4970-bc63-8811f310776e', 'The fossil record, when correlated with the relative ages of rock strata, shows a progression of increasingly complex/different life forms over geological time, providing direct historical evidence supporting the occurrence of evolution.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('73c150d7-04ba-41ea-956f-64b82cb9c6f2', '49540965-3805-40bf-b729-7b60123f83aa', 168, 'Sexually transmitted infections (STIs) such as gonorrhea and syphilis are caused by:', 'Biology', 'Reproductive Health — Sexually Transmitted Infections');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e1c5f6f-e20d-4a6b-a88f-2dcf26b74a52', '73c150d7-04ba-41ea-956f-64b82cb9c6f2', 0, 'Viruses exclusively, with no bacterial STIs existing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('092a0f92-68eb-4b70-be15-da9974593a65', '73c150d7-04ba-41ea-956f-64b82cb9c6f2', 1, 'Bacteria (among other pathogens like viruses and protozoa, depending on the specific STI)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba15ddbe-71e7-4d86-9f72-5a0969c9376f', '73c150d7-04ba-41ea-956f-64b82cb9c6f2', 2, 'Only fungal organisms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8291d26f-4379-4517-ba6d-d25a8588600f', '73c150d7-04ba-41ea-956f-64b82cb9c6f2', 3, 'Genetic mutations, not infectious agents');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('73c150d7-04ba-41ea-956f-64b82cb9c6f2', '092a0f92-68eb-4b70-be15-da9974593a65', 'STIs are caused by a range of pathogens: gonorrhea and syphilis are bacterial, while HIV/AIDS and genital herpes are viral, and some (like trichomoniasis) are protozoal — collectively grouped by their mode of transmission, not a shared pathogen type.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4acf8432-0331-467b-be2e-c5c7d1736ea8', '49540965-3805-40bf-b729-7b60123f83aa', 169, 'During the cardiac cycle, the phase in which both the atria and ventricles are relaxed and blood passively fills the heart chambers is called:', 'Biology', 'Body Fluids and Circulation — Cardiac Cycle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e570c89-3d3c-49d9-b8c3-9e214f6591bf', '4acf8432-0331-467b-be2e-c5c7d1736ea8', 0, 'Systole');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a16c29e6-1690-43d1-a367-0b40d3c5e84a', '4acf8432-0331-467b-be2e-c5c7d1736ea8', 1, 'Joint diastole');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('29e0d108-41a0-4103-9c20-f7ddffa2abea', '4acf8432-0331-467b-be2e-c5c7d1736ea8', 2, 'Isovolumic contraction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c0c8296-9d83-40b1-a01b-a8bfe2254e65', '4acf8432-0331-467b-be2e-c5c7d1736ea8', 3, 'Ejection phase');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4acf8432-0331-467b-be2e-c5c7d1736ea8', 'a16c29e6-1690-43d1-a367-0b40d3c5e84a', 'Joint diastole is the brief period when both atria and ventricles are simultaneously relaxed, allowing blood to passively flow into and fill the heart''s chambers before the next contraction cycle begins.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('73e1ae7c-930f-415a-a70c-d1561fcdd167', '49540965-3805-40bf-b729-7b60123f83aa', 170, 'Rigor mortis, the stiffening of muscles after death, occurs primarily because:', 'Biology', 'Locomotion and Movement — Muscle Physiology');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('853185c9-4e6c-415b-b402-06f6fc268461', '73e1ae7c-930f-415a-a70c-d1561fcdd167', 0, 'Muscles continue receiving fresh ATP supply after death');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('504eeb2a-127d-41a3-8f9c-bf0ea273a6aa', '73e1ae7c-930f-415a-a70c-d1561fcdd167', 1, 'ATP production ceases, preventing myosin heads from detaching from actin, leaving the muscle fibres locked in a contracted state');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('09350fc5-1dbf-49d2-a909-d5e466e4156f', '73e1ae7c-930f-415a-a70c-d1561fcdd167', 2, 'Calcium ions are completely removed from all muscle cells instantly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3bed7145-7f21-4fb2-af4b-ba5b34860989', '73e1ae7c-930f-415a-a70c-d1561fcdd167', 3, 'Muscles relax completely and remain permanently limp');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('73e1ae7c-930f-415a-a70c-d1561fcdd167', '504eeb2a-127d-41a3-8f9c-bf0ea273a6aa', 'After death, ATP synthesis stops; since ATP is required to break the actin-myosin cross-bridge (detach myosin heads from actin), the muscle remains locked in a rigid, contracted state until decomposition begins.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c8ac86f3-8a34-4f68-992a-e709cfb195c9', '49540965-3805-40bf-b729-7b60123f83aa', 171, 'A point mutation in which a purine base is substituted by another purine (or a pyrimidine by another pyrimidine) is called a:', 'Biology', 'Genetics and Evolution — Mutation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74ad2f85-e4e3-4a35-8193-1d82140b6df7', 'c8ac86f3-8a34-4f68-992a-e709cfb195c9', 0, 'Transversion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9529203b-3177-4da3-b68b-9398eead15f5', 'c8ac86f3-8a34-4f68-992a-e709cfb195c9', 1, 'Transition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c334a5eb-91df-4db7-a091-b88b9345c8a4', 'c8ac86f3-8a34-4f68-992a-e709cfb195c9', 2, 'Frameshift mutation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9863a800-a8b0-4cd9-aa2f-284dd7613322', 'c8ac86f3-8a34-4f68-992a-e709cfb195c9', 3, 'Deletion');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c8ac86f3-8a34-4f68-992a-e709cfb195c9', '9529203b-3177-4da3-b68b-9398eead15f5', 'A transition mutation replaces a purine with a purine (A<->G) or a pyrimidine with a pyrimidine (C<->T); a transversion, by contrast, replaces a purine with a pyrimidine or vice versa.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ca75da58-b789-4dff-91fe-6a2a6d8b1e5c', '49540965-3805-40bf-b729-7b60123f83aa', 172, 'Opioids, such as morphine and heroin, primarily act on the body by:', 'Biology', 'Human Health and Disease — Drugs and Alcohol');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8fb2fb8-62e6-4edf-931e-9307aa57288b', 'ca75da58-b789-4dff-91fe-6a2a6d8b1e5c', 0, 'Stimulating the central nervous system, increasing alertness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96ff3ed6-7a2b-4977-9cd6-50e6151744ea', 'ca75da58-b789-4dff-91fe-6a2a6d8b1e5c', 1, 'Binding to specific opioid receptors in the central nervous system, producing analgesic (pain-relieving) and depressant effects');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ac6d34c-f2dd-4782-aab6-b7a46931325f', 'ca75da58-b789-4dff-91fe-6a2a6d8b1e5c', 2, 'Having no effect on the nervous system at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abaf3999-4cc0-4045-9ce0-f0f91b78f239', 'ca75da58-b789-4dff-91fe-6a2a6d8b1e5c', 3, 'Only affecting the digestive system');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ca75da58-b789-4dff-91fe-6a2a6d8b1e5c', '96ff3ed6-7a2b-4977-9cd6-50e6151744ea', 'Opioids bind to specific opioid receptors in the brain and spinal cord, mimicking the body''s natural endorphins, producing strong analgesic effects along with CNS depression — the basis of both their medical use and high potential for dependence/abuse.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('13eca917-1954-4f68-9389-062de35413d1', '49540965-3805-40bf-b729-7b60123f83aa', 173, 'The unidirectional flow of energy through an ecosystem (from sun to producers to consumers, ultimately lost as heat) contrasts with the cycling of:', 'Biology', 'Ecosystem — Energy Flow');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('592d2dfe-2619-472a-b6e2-5f5184b12843', '13eca917-1954-4f68-9389-062de35413d1', 0, 'Energy itself, which also cycles back to producers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af17e920-f355-459c-a672-8b9c2e393551', '13eca917-1954-4f68-9389-062de35413d1', 1, 'Nutrients/matter, which are recycled repeatedly through the ecosystem via biogeochemical cycles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d540986-6894-4bb0-aecd-c5c11bc1d805', '13eca917-1954-4f68-9389-062de35413d1', 2, 'Sunlight, which is also recycled');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('500af844-ba42-49c2-936b-5a5c61617143', '13eca917-1954-4f68-9389-062de35413d1', 3, 'Nothing; both energy and matter flow unidirectionally');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('13eca917-1954-4f68-9389-062de35413d1', 'af17e920-f355-459c-a672-8b9c2e393551', 'Unlike energy, which flows one-way through an ecosystem and is ultimately dissipated as heat (per the second law of thermodynamics), nutrients/matter (carbon, nitrogen, etc.) are continuously recycled between organisms and the physical environment via biogeochemical cycles.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3ef5ef6d-c31d-4d6c-a442-ea9884f4d396', '49540965-3805-40bf-b729-7b60123f83aa', 174, 'Phylum Echinodermata is characterized by an adult body showing:', 'Biology', 'Animal Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4818dd64-13a8-470d-83c6-f28aa6a1fc5a', '3ef5ef6d-c31d-4d6c-a442-ea9884f4d396', 0, 'Bilateral symmetry only, with a segmented body');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('40286f70-e6cf-4755-be64-52bd92cb8f45', '3ef5ef6d-c31d-4d6c-a442-ea9884f4d396', 1, 'Pentamerous radial symmetry and a unique water vascular system used for locomotion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('710cadc3-7159-4e50-8264-e4c050cc22c7', '3ef5ef6d-c31d-4d6c-a442-ea9884f4d396', 2, 'No skeleton of any kind');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b32b4ff-98bb-402d-bfcc-cc7605464024', '3ef5ef6d-c31d-4d6c-a442-ea9884f4d396', 3, 'A well-developed cephalization with a distinct brain');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3ef5ef6d-c31d-4d6c-a442-ea9884f4d396', '40286f70-e6cf-4755-be64-52bd92cb8f45', 'Echinoderms (starfish, sea urchins) exhibit pentaradial symmetry as adults (though bilaterally symmetric larvae) and possess a distinctive water vascular system that operates tube feet for locomotion and feeding.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9132978e-89f9-49eb-8479-411afff33d52', '49540965-3805-40bf-b729-7b60123f83aa', 175, 'The hormone gastrin, secreted by G-cells in the stomach lining, primarily stimulates:', 'Biology', 'Digestion and Absorption');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d875973c-6763-4d77-aff4-0aa29688a741', '9132978e-89f9-49eb-8479-411afff33d52', 0, 'Insulin release from the pancreas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05048caa-c777-4df7-90e3-90e7253c2e7e', '9132978e-89f9-49eb-8479-411afff33d52', 1, 'Secretion of hydrochloric acid (HCl) and pepsinogen by gastric glands');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3a65af6-8196-4420-a85c-05df480d6510', '9132978e-89f9-49eb-8479-411afff33d52', 2, 'Bile release from the gallbladder');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42b3206b-bd1b-4000-9711-3a9138db7181', '9132978e-89f9-49eb-8479-411afff33d52', 3, 'Reduction of stomach motility');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9132978e-89f9-49eb-8479-411afff33d52', '05048caa-c777-4df7-90e3-90e7253c2e7e', 'Gastrin stimulates the gastric glands to secrete HCl and pepsinogen, promoting gastric digestion of food, and also enhances gastric motility.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3a5e9900-52db-4ebb-8c03-c7148457f4c0', '49540965-3805-40bf-b729-7b60123f83aa', 176, 'Typhoid fever in humans is caused by a bacterium of the genus:', 'Biology', 'Human Health and Disease — Pathogens');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('45beacf4-02b4-4710-a9b7-7a41e275d143', '3a5e9900-52db-4ebb-8c03-c7148457f4c0', 0, 'Plasmodium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b5d9bd0-c3a6-4d78-ad4c-27ca218bc16e', '3a5e9900-52db-4ebb-8c03-c7148457f4c0', 1, 'Salmonella (Salmonella typhi)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7431a04-89a6-43bc-a451-3c9f880921e1', '3a5e9900-52db-4ebb-8c03-c7148457f4c0', 2, 'Entamoeba');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d81a1362-1791-45a9-a53c-678ab1d39683', '3a5e9900-52db-4ebb-8c03-c7148457f4c0', 3, 'Wuchereria');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3a5e9900-52db-4ebb-8c03-c7148457f4c0', '5b5d9bd0-c3a6-4d78-ad4c-27ca218bc16e', 'Typhoid fever is caused by the bacterium Salmonella typhi, typically transmitted through contaminated food or water.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('bc3a189a-c7fc-46ce-ad94-2ba7502cebe2', '49540965-3805-40bf-b729-7b60123f83aa', 177, 'The counter-current mechanism operating in the loop of Henle and vasa recta of the nephron functions primarily to:', 'Biology', 'Excretory Products and Their Elimination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8e7ebf6-9164-4b27-9ea9-a95694efcd08', 'bc3a189a-c7fc-46ce-ad94-2ba7502cebe2', 0, 'Prevent any reabsorption of water at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05470ed8-9d9c-4726-bdda-186f704b3d84', 'bc3a189a-c7fc-46ce-ad94-2ba7502cebe2', 1, 'Help maintain the concentration gradient in the medullary interstitium, enabling the production of concentrated urine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd22b253-d50c-438e-962f-dc4615b10d12', 'bc3a189a-c7fc-46ce-ad94-2ba7502cebe2', 2, 'Filter blood directly, bypassing the glomerulus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0be82f9b-f2a7-44aa-8027-8c36f6337273', 'bc3a189a-c7fc-46ce-ad94-2ba7502cebe2', 3, 'Only regulate blood pH, unrelated to water balance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bc3a189a-c7fc-46ce-ad94-2ba7502cebe2', '05470ed8-9d9c-4726-bdda-186f704b3d84', 'The counter-current multiplier/exchanger system in the loop of Henle and vasa recta establishes and maintains a high osmotic gradient in the renal medulla, which is essential for the kidney''s ability to reabsorb water and produce concentrated urine.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('19ab27de-5e33-448c-a955-9d75d4d5bb13', '49540965-3805-40bf-b729-7b60123f83aa', 178, 'The cerebellum, part of the hindbrain, is primarily responsible for:', 'Biology', 'Neural Control and Coordination — CNS');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18276983-b958-43d2-b967-4f49f7ab55c4', '19ab27de-5e33-448c-a955-9d75d4d5bb13', 0, 'Higher-order thinking and voluntary decision-making');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e6560b0-7975-4873-a2d9-a73cb6e595fc', '19ab27de-5e33-448c-a955-9d75d4d5bb13', 1, 'Maintaining posture, balance, and coordinating fine voluntary muscle movements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b959fc06-306a-4f5c-b388-fde700279c14', '19ab27de-5e33-448c-a955-9d75d4d5bb13', 2, 'Regulating body temperature exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e559109-1af4-4d87-86ba-15b68c53c026', '19ab27de-5e33-448c-a955-9d75d4d5bb13', 3, 'Producing digestive enzymes');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('19ab27de-5e33-448c-a955-9d75d4d5bb13', '5e6560b0-7975-4873-a2d9-a73cb6e595fc', 'The cerebellum coordinates fine motor movements, balance, and posture, refining the motor commands issued by the cerebral cortex, rather than being the seat of higher cognitive functions (that is the cerebrum).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('add5d6a2-07ac-434f-955c-81070ad707a1', '49540965-3805-40bf-b729-7b60123f83aa', 179, 'The lifespan of an organism, and its relationship to reproductive events, means that most organisms exhibit:', 'Biology', 'Reproduction in Organisms — Life Span');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ded39c5-1736-49e7-ae6b-600a08055f07', 'add5d6a2-07ac-434f-955c-81070ad707a1', 0, 'Reproduction only after their natural lifespan ends');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c76a3b5f-b3c0-45e8-b66b-abafc651d391', 'add5d6a2-07ac-434f-955c-81070ad707a1', 1, 'A period of juvenile growth followed by a reproductive phase, and in many species a subsequent senescent (aging) phase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7011dea3-0bc1-41c4-af36-6722569a8b82', 'add5d6a2-07ac-434f-955c-81070ad707a1', 2, 'Continuous reproduction from birth with no distinct life phases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1247d629-fe11-4136-891e-d6ae198fe751', 'add5d6a2-07ac-434f-955c-81070ad707a1', 3, 'No relationship at all between age and reproductive capability');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('add5d6a2-07ac-434f-955c-81070ad707a1', 'c76a3b5f-b3c0-45e8-b66b-abafc651d391', 'Most sexually reproducing organisms pass through a juvenile (growth) phase, then a reproductive phase where they are capable of producing offspring, and in many species a post-reproductive senescent phase — a generalized life-history pattern taught alongside reproduction in organisms.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b2e4d182-e1f3-4769-8c6e-62c566d9ece1', '49540965-3805-40bf-b729-7b60123f83aa', 180, 'Blood clotting (coagulation) is ultimately achieved by the conversion of soluble fibrinogen into an insoluble fibrous mesh through the action of the enzyme:', 'Biology', 'Body Fluids and Circulation — Blood Clotting');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a8b8f14-2ee8-460b-8649-c9f91372d53d', 'b2e4d182-e1f3-4769-8c6e-62c566d9ece1', 0, 'Thrombin, acting on fibrinogen to form fibrin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39fdb54a-d2d1-4a25-adfb-476c9840eda0', 'b2e4d182-e1f3-4769-8c6e-62c566d9ece1', 1, 'Plasmin, which dissolves clots rather than forming them');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b428a94-4abd-4876-8a43-b58b0a57544e', 'b2e4d182-e1f3-4769-8c6e-62c566d9ece1', 2, 'Insulin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4523b40-fd2d-4639-8969-8a03b91881b4', 'b2e4d182-e1f3-4769-8c6e-62c566d9ece1', 3, 'Pepsin');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b2e4d182-e1f3-4769-8c6e-62c566d9ece1', '2a8b8f14-2ee8-460b-8649-c9f91372d53d', 'In the final common step of the coagulation cascade, thrombin cleaves soluble fibrinogen into insoluble fibrin strands, which form the meshwork that traps blood cells to create a stable clot.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');
