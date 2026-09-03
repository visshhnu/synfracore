-- ============================================================
-- NEET UG — Full Mock Paper 5
-- Full-Length Practice Paper (180 questions, 180 minutes)
-- Marking: +4 correct / -1 incorrect (official NEET UG scheme)
-- Run this AFTER docs/add-question-subject-marking.sql.
-- ============================================================

-- ---------- Paper ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order, time_limit_minutes, positive_marks, negative_marks)
VALUES ('db0a7a12-bb08-4010-9d9d-cf691e9576b4', 'neet-practice-5', 'NEET UG Full Mock Paper 5', 'neet', ARRAY['Physics', 'Chemistry', 'Biology', 'Botany', 'Zoology', 'NCERT', 'NEET UG']::TEXT[], 180, 'mixed', true, 5, 180, 4, 1);

-- ── Section: Physics (45 questions) — Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('08e7fb67-409d-4f40-9e1d-8829f2afdb8d', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 1, 'Dimensional analysis can be used to check the correctness of a physical equation because:', 'Physics', 'Units and Measurements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca881aa7-8930-4ac3-bb7d-fa4897751479', '08e7fb67-409d-4f40-9e1d-8829f2afdb8d', 0, 'Every physically correct equation must be dimensionally homogeneous (both sides having identical dimensions)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5923c4f-baf9-4169-a300-1c9daf16816d', '08e7fb67-409d-4f40-9e1d-8829f2afdb8d', 1, 'It can determine the numerical constant in every equation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d8252f6-4f97-4e42-9964-44401293664d', '08e7fb67-409d-4f40-9e1d-8829f2afdb8d', 2, 'It applies only to equations involving mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32814577-f757-491b-8ea9-5d271878c5f0', '08e7fb67-409d-4f40-9e1d-8829f2afdb8d', 3, 'It works only for equations with a single term');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('08e7fb67-409d-4f40-9e1d-8829f2afdb8d', 'ca881aa7-8930-4ac3-bb7d-fa4897751479', 'Dimensional analysis is based on the principle of dimensional homogeneity — a physically valid equation must have identical dimensions on both sides; however, it cannot determine dimensionless numerical constants, and equations with more than one term added together require special care.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8be65472-47ea-4e51-a262-a886f74e1f89', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 2, 'For an object undergoing free fall from rest under gravity, the distance fallen is proportional to:', 'Physics', 'Motion in a Straight Line');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8912bc3f-0ec2-4a30-9036-308f989f7cba', '8be65472-47ea-4e51-a262-a886f74e1f89', 0, 'Time elapsed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c96f9fc9-f7df-4436-9564-0245164478f9', '8be65472-47ea-4e51-a262-a886f74e1f89', 1, 'The square of the time elapsed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65d2d810-9b89-41b0-a97c-f53bad8f83ae', '8be65472-47ea-4e51-a262-a886f74e1f89', 2, 'The square root of time elapsed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('401aefac-08f0-45b1-bdbe-d42a31fe617a', '8be65472-47ea-4e51-a262-a886f74e1f89', 3, 'The cube of time elapsed');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8be65472-47ea-4e51-a262-a886f74e1f89', 'c96f9fc9-f7df-4436-9564-0245164478f9', 'Under constant acceleration from rest, s = (1/2)gt^2, so distance fallen is proportional to the square of elapsed time.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('05c764a7-5e49-4223-97a1-0bfccef7432c', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 3, 'The impulse-momentum theorem states that the impulse of a force acting on a body equals the:', 'Physics', 'Laws of Motion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2483bf22-b780-4870-8a64-10dd5ce7c0a0', '05c764a7-5e49-4223-97a1-0bfccef7432c', 0, 'Force applied, regardless of time duration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0885921a-346d-44e9-9ff8-ef6adc87b4b8', '05c764a7-5e49-4223-97a1-0bfccef7432c', 1, 'Change in the body''s linear momentum');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0bcd6759-eeda-40e5-88d3-39bf0047f1c7', '05c764a7-5e49-4223-97a1-0bfccef7432c', 2, 'Body''s final velocity alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9b12ece6-43b3-4a2a-b497-756f2429e85d', '05c764a7-5e49-4223-97a1-0bfccef7432c', 3, 'Body''s mass alone');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('05c764a7-5e49-4223-97a1-0bfccef7432c', '0885921a-346d-44e9-9ff8-ef6adc87b4b8', 'Impulse (J = F*delta_t, or the integral of force over time) equals the resulting change in the body''s linear momentum, J = delta_p — a direct consequence of Newton''s second law.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('cf5bf8bb-7ed9-48bf-87a8-468e2ae92314', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 4, 'In an inelastic collision between two bodies, which of the following quantities is always conserved?', 'Physics', 'Work, Energy and Power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73e77ae1-a259-4b82-b6b9-1af236a8134a', 'cf5bf8bb-7ed9-48bf-87a8-468e2ae92314', 0, 'Kinetic energy of the system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('232cac65-8f7f-465d-bcea-5f2fdd4dddde', 'cf5bf8bb-7ed9-48bf-87a8-468e2ae92314', 1, 'Linear momentum of the system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cca21e7a-ec12-41e6-b861-80fac240c7c1', 'cf5bf8bb-7ed9-48bf-87a8-468e2ae92314', 2, 'Neither momentum nor kinetic energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f1970c99-e2ac-4245-8b36-7d9ba68e275b', 'cf5bf8bb-7ed9-48bf-87a8-468e2ae92314', 3, 'Both momentum and kinetic energy equally');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cf5bf8bb-7ed9-48bf-87a8-468e2ae92314', '232cac65-8f7f-465d-bcea-5f2fdd4dddde', 'In ANY collision (elastic or inelastic), as long as no external force acts, total linear momentum of the system is conserved; kinetic energy, however, is conserved only in perfectly elastic collisions — in inelastic collisions, some KE converts to heat/sound/deformation.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d68db1d7-c022-459d-8757-42654548f152', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 5, 'The moment of inertia of a uniform circular disc of mass M and radius R about an axis through its centre, perpendicular to its plane, is:', 'Physics', 'System of Particles and Rotational Motion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c78938b-935f-40f2-a6fb-a8fc5f67efb5', 'd68db1d7-c022-459d-8757-42654548f152', 0, 'MR^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ab4d74a-1b75-4a6c-96e9-09538c660427', 'd68db1d7-c022-459d-8757-42654548f152', 1, '(1/2)MR^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('78a4f2c1-7911-417a-9f9f-241770f93a53', 'd68db1d7-c022-459d-8757-42654548f152', 2, '(2/5)MR^2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8c0e19df-5ab4-4f3b-ab9f-749845cb821f', 'd68db1d7-c022-459d-8757-42654548f152', 3, '(1/4)MR^2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d68db1d7-c022-459d-8757-42654548f152', '3ab4d74a-1b75-4a6c-96e9-09538c660427', 'The moment of inertia of a uniform disc about a perpendicular axis through its centre is I = (1/2)MR^2, a standard and frequently tested result.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1859c56c-9fbd-4e5b-b655-b04461dd1689', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 6, 'Kepler''s first law states that the orbit of a planet around the Sun is:', 'Physics', 'Gravitation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('070b6786-8e94-449b-bcc1-46cfbc9f248c', '1859c56c-9fbd-4e5b-b655-b04461dd1689', 0, 'A perfect circle, with the Sun exactly at the centre');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68b724f6-6633-4cef-8356-9d6e2a53133f', '1859c56c-9fbd-4e5b-b655-b04461dd1689', 1, 'An ellipse, with the Sun at one of the two foci');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b3a8f837-9ba3-4797-ab98-eb2dd4dec500', '1859c56c-9fbd-4e5b-b655-b04461dd1689', 2, 'A parabola');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86694256-6698-4cce-97c3-32edfa359120', '1859c56c-9fbd-4e5b-b655-b04461dd1689', 3, 'A straight line');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1859c56c-9fbd-4e5b-b655-b04461dd1689', '68b724f6-6633-4cef-8356-9d6e2a53133f', 'Kepler''s first law (the law of orbits): planetary orbits are ellipses with the Sun located at one of the two foci, not necessarily at the geometric centre.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('24e801fd-9509-4aa0-8653-29d03a04bde6', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 7, 'Elastic hysteresis, observed in materials like rubber under repeated loading-unloading cycles, refers to:', 'Physics', 'Mechanical Properties of Solids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7853a772-582f-49cc-abd9-e362a1486ad1', '24e801fd-9509-4aa0-8653-29d03a04bde6', 0, 'The stress-strain curve for loading and unloading being identical, retracing exactly the same path');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4e1cdab0-b0a7-4c0b-819c-d5bd4a8b6ea9', '24e801fd-9509-4aa0-8653-29d03a04bde6', 1, 'The stress-strain curve for unloading not retracing the same path as loading, resulting in a loop and net energy dissipation as heat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba529700-1e2a-4c61-99a3-a39275294aa2', '24e801fd-9509-4aa0-8653-29d03a04bde6', 2, 'A material showing zero elastic behaviour at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2b2fed6-1b6d-47e9-b40d-dae16505154d', '24e801fd-9509-4aa0-8653-29d03a04bde6', 3, 'A permanent, irreversible change in the material''s original dimensions with no relation to loading history');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('24e801fd-9509-4aa0-8653-29d03a04bde6', '4e1cdab0-b0a7-4c0b-819c-d5bd4a8b6ea9', 'Elastic hysteresis occurs when the unloading stress-strain curve lags behind (does not retrace) the loading curve, forming a hysteresis loop whose enclosed area represents energy dissipated as heat during the loading-unloading cycle — notably significant in materials like rubber.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9f56d771-5a82-4435-86b3-a52286ec7a22', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 8, 'Torricelli''s law, describing the speed of efflux of a liquid from an orifice near the bottom of a tank, states that the efflux speed is:', 'Physics', 'Mechanical Properties of Fluids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44438576-b53b-4460-9a23-36c43b739139', '9f56d771-5a82-4435-86b3-a52286ec7a22', 0, 'Independent of the height of liquid above the orifice');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd17dc6f-70da-4e78-b58d-82fd8ca0f46c', '9f56d771-5a82-4435-86b3-a52286ec7a22', 1, 'Given by v = sqrt(2gh), where h is the height of liquid above the orifice');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cbaf1f8d-0c77-4852-ab0f-6190c3fca086', '9f56d771-5a82-4435-86b3-a52286ec7a22', 2, 'Directly proportional to the height h');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0582676e-e1ee-43db-b534-6a69e002e2df', '9f56d771-5a82-4435-86b3-a52286ec7a22', 3, 'Inversely proportional to the height h');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9f56d771-5a82-4435-86b3-a52286ec7a22', 'dd17dc6f-70da-4e78-b58d-82fd8ca0f46c', 'Torricelli''s law (derived from Bernoulli''s equation) gives the efflux speed from a small orifice as v = sqrt(2gh), analogous to the speed a body would attain falling freely through the same height h.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5e5034ee-5bfb-4e6d-9daa-de97956f5c46', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 9, 'Newton''s law of cooling states that the rate of loss of heat of a body is directly proportional to:', 'Physics', 'Thermal Properties of Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13f19619-c120-4f59-b108-f28fef717b88', '5e5034ee-5bfb-4e6d-9daa-de97956f5c46', 0, 'The absolute temperature of the body');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c67a79b-d93e-4bbb-85fb-b6707a07a057', '5e5034ee-5bfb-4e6d-9daa-de97956f5c46', 1, 'The temperature difference between the body and its surroundings (for small differences)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f348aad-e7a4-447f-86aa-aab114f46c6e', '5e5034ee-5bfb-4e6d-9daa-de97956f5c46', 2, 'The mass of the body only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b754c7c-83b5-4a83-a296-7069899cd6f0', '5e5034ee-5bfb-4e6d-9daa-de97956f5c46', 3, 'The surface color of the body, with no dependence on temperature difference');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5e5034ee-5bfb-4e6d-9daa-de97956f5c46', '0c67a79b-d93e-4bbb-85fb-b6707a07a057', 'Newton''s law of cooling states that for a small temperature difference, the rate of heat loss (or the rate of temperature change) is proportional to the temperature difference between the body and its surroundings.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9a0d0b9e-6144-4281-a9cb-3d6ab4127865', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 10, 'For a reversible process, the system:', 'Physics', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0c4c562-1a70-47d9-b235-c104270c5689', '9a0d0b9e-6144-4281-a9cb-3d6ab4127865', 0, 'Passes through a series of non-equilibrium states rapidly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49eb6aba-1d69-43bd-aaf1-bff44ce8b317', '9a0d0b9e-6144-4281-a9cb-3d6ab4127865', 1, 'Passes through a continuous series of equilibrium states, and can, in principle, be reversed by an infinitesimal change in conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44f67aa5-bc23-471a-b0d7-d43d3a4ac6d2', '9a0d0b9e-6144-4281-a9cb-3d6ab4127865', 2, 'Can never return to its original state');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('542c9812-b041-454a-841f-29725fcac077', '9a0d0b9e-6144-4281-a9cb-3d6ab4127865', 3, 'Always releases heat to the surroundings');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9a0d0b9e-6144-4281-a9cb-3d6ab4127865', '49eb6aba-1d69-43bd-aaf1-bff44ce8b317', 'A reversible process is an idealized quasi-static process passing through a continuous sequence of equilibrium states, such that an infinitesimally small change in conditions can reverse its direction — real processes are always at least somewhat irreversible.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('80275c25-6ca8-4d09-b14d-aecfb6c145f7', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 11, 'The specific heat capacity of a gas at constant pressure (Cp) is always greater than the specific heat capacity at constant volume (Cv) because:', 'Physics', 'Kinetic Theory');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5fb696a0-4216-48b4-b179-c7ce4fb6c1ab', '80275c25-6ca8-4d09-b14d-aecfb6c145f7', 0, 'At constant pressure, some of the heat supplied does work in expanding the gas, in addition to raising its internal energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('54a16ff9-931a-4d9d-ab03-18a79692f522', '80275c25-6ca8-4d09-b14d-aecfb6c145f7', 1, 'Cv is always greater than Cp for all gases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff2e4e11-dd81-496d-bd7b-1cfbc99e4208', '80275c25-6ca8-4d09-b14d-aecfb6c145f7', 2, 'There is no relationship between Cp and Cv');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72e150ab-cdbf-479b-9375-118673e23b64', '80275c25-6ca8-4d09-b14d-aecfb6c145f7', 3, 'Cp and Cv are always exactly equal for ideal gases');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('80275c25-6ca8-4d09-b14d-aecfb6c145f7', '5fb696a0-4216-48b4-b179-c7ce4fb6c1ab', 'At constant volume, all heat supplied goes into increasing internal energy (temperature); at constant pressure, some of the supplied heat is used for the gas to do expansion work against the surroundings, so more heat is needed for the same temperature rise, making Cp > Cv (Mayer''s relation: Cp - Cv = R for an ideal gas).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d8b9db20-3bf3-43d2-a706-c063ea8bc337', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 12, 'Resonance in a forced (driven) oscillating system occurs when the frequency of the external periodic driving force:', 'Physics', 'Oscillations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('35495d90-0715-44be-a438-839254c0ec59', 'd8b9db20-3bf3-43d2-a706-c063ea8bc337', 0, 'Is much lower than the system''s natural frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c4b3d75-8d8b-4308-846e-dc92da550f87', 'd8b9db20-3bf3-43d2-a706-c063ea8bc337', 1, 'Equals (or is very close to) the natural frequency of the system, causing a dramatic increase in oscillation amplitude');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17caa671-8b6b-4427-9452-ad62a0b631a7', 'd8b9db20-3bf3-43d2-a706-c063ea8bc337', 2, 'Is much higher than the system''s natural frequency');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bf8a1bf2-fa05-4437-9b7d-21cd68628d22', 'd8b9db20-3bf3-43d2-a706-c063ea8bc337', 3, 'Is exactly zero');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d8b9db20-3bf3-43d2-a706-c063ea8bc337', '1c4b3d75-8d8b-4308-846e-dc92da550f87', 'Resonance occurs when the driving frequency matches (or nearly matches) the system''s own natural frequency of oscillation, causing the amplitude of oscillation to become very large (limited only by damping) — a phenomenon with both useful applications and potentially destructive consequences (e.g., structural resonance).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('158fee7e-c893-48b6-b80f-f9d0eb55e1af', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 13, 'The phenomenon in which sound waves bend around obstacles or corners is:', 'Physics', 'Waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d70a8743-dd2f-4326-ab27-4193ea39dddb', '158fee7e-c893-48b6-b80f-f9d0eb55e1af', 0, 'Reflection');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9e4d1176-447f-44d4-b1ad-7088fddd2d2d', '158fee7e-c893-48b6-b80f-f9d0eb55e1af', 1, 'Diffraction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c529701-bdec-4448-9005-bef0f5735586', '158fee7e-c893-48b6-b80f-f9d0eb55e1af', 2, 'Refraction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e1d361e-f925-4e53-8323-0c4876f8a1c5', '158fee7e-c893-48b6-b80f-f9d0eb55e1af', 3, 'Interference');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('158fee7e-c893-48b6-b80f-f9d0eb55e1af', '9e4d1176-447f-44d4-b1ad-7088fddd2d2d', 'Diffraction is the bending of waves around obstacles or through openings; sound waves, having relatively long wavelengths, diffract noticeably around everyday-sized obstacles, which is why sound can often be heard around corners even without a direct line of sight.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('106fd22c-2c12-4c9d-9ded-2ebba6ee8ba0', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 14, 'The electric field due to an infinite plane sheet of uniform surface charge density sigma is:', 'Physics', 'Electric Charges and Fields');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('27a780a2-c7cd-4678-ab98-c354a1b57758', '106fd22c-2c12-4c9d-9ded-2ebba6ee8ba0', 0, 'Dependent on the distance from the sheet, decreasing with distance like a point charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ecbc1503-0b82-4fae-913b-a3438019c814', '106fd22c-2c12-4c9d-9ded-2ebba6ee8ba0', 1, 'Independent of the distance from the sheet (uniform field), given by sigma/(2*epsilon0)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cefd9293-fd21-4686-ba9f-195259736593', '106fd22c-2c12-4c9d-9ded-2ebba6ee8ba0', 2, 'Zero everywhere');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32586dd5-ffec-4a28-8d42-9be27a26ffa5', '106fd22c-2c12-4c9d-9ded-2ebba6ee8ba0', 3, 'Directly proportional to the square of the distance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('106fd22c-2c12-4c9d-9ded-2ebba6ee8ba0', 'ecbc1503-0b82-4fae-913b-a3438019c814', 'For an infinite plane sheet of charge, symmetry (via Gauss''s law) shows the field is uniform in magnitude and direction on either side, independent of distance from the sheet — a key idealized result distinct from the 1/r or 1/r^2 falloff of point/line charges.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3c88f2d4-c4a5-49eb-be37-4372c9b1d0c9', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 15, 'When two charged capacitors of different potentials are connected in parallel, charge flows between them until:', 'Physics', 'Electrostatic Potential and Capacitance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac795bd8-5b42-43e8-9ef4-1756086bc5f4', '3c88f2d4-c4a5-49eb-be37-4372c9b1d0c9', 0, 'One capacitor loses all its charge entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65fa6b81-7d0c-4e36-af55-ac2cd193f461', '3c88f2d4-c4a5-49eb-be37-4372c9b1d0c9', 1, 'Both capacitors reach the same common potential');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5357763-8c57-4cf6-9117-87a9a18b075d', '3c88f2d4-c4a5-49eb-be37-4372c9b1d0c9', 2, 'The total charge in the system changes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('138af1f6-55ad-4c32-807f-688d4886be5c', '3c88f2d4-c4a5-49eb-be37-4372c9b1d0c9', 3, 'No redistribution of charge occurs at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3c88f2d4-c4a5-49eb-be37-4372c9b1d0c9', '65fa6b81-7d0c-4e36-af55-ac2cd193f461', 'When capacitors at different potentials are connected, charge redistributes between them until both reach a common final potential; total charge is conserved throughout this process, though some energy is typically dissipated (e.g., as heat in connecting wires).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9c3ea134-bf61-4b69-9af5-22667d7d8b28', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 16, 'Kirchhoff''s voltage law (second law, loop rule) is a statement of the conservation of:', 'Physics', 'Current Electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66507f46-fe22-4693-a280-859e86c3e235', '9c3ea134-bf61-4b69-9af5-22667d7d8b28', 0, 'Electric charge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1cbc9edd-58e0-4edf-bc5d-92c1b7cf0084', '9c3ea134-bf61-4b69-9af5-22667d7d8b28', 1, 'Energy — the algebraic sum of potential differences (EMFs and IR drops) around any closed loop is zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('619eb0dd-6521-4855-a07a-70b5a32d93df', '9c3ea134-bf61-4b69-9af5-22667d7d8b28', 2, 'Magnetic flux');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e40021c-1379-43da-b65c-0c482793e0a0', '9c3ea134-bf61-4b69-9af5-22667d7d8b28', 3, 'Current');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9c3ea134-bf61-4b69-9af5-22667d7d8b28', '1cbc9edd-58e0-4edf-bc5d-92c1b7cf0084', 'Kirchhoff''s voltage law states that the algebraic sum of all potential changes (EMF sources and resistive voltage drops) around any closed loop in a circuit equals zero, reflecting the conservation of energy for a charge traversing the complete loop.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4a35ff34-a3d1-4d28-a4b4-233673a1e08b', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 17, 'A charged particle moving parallel to a uniform magnetic field experiences a magnetic force of magnitude:', 'Physics', 'Moving Charges and Magnetism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('05d5622a-4fc8-4ee4-88a4-1f483afd45d4', '4a35ff34-a3d1-4d28-a4b4-233673a1e08b', 0, 'Maximum possible value, qvB');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ee614a9-a370-4abf-afbe-2f83c7476b92', '4a35ff34-a3d1-4d28-a4b4-233673a1e08b', 1, 'Zero, since the force F = qv x B vanishes when v and B are parallel (sin(0) = 0)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0082123e-b256-442b-a216-2f6e17b11a0a', '4a35ff34-a3d1-4d28-a4b4-233673a1e08b', 2, 'Half the maximum value');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6fb74778-1a80-4e2b-ae9a-0b7ba0fba888', '4a35ff34-a3d1-4d28-a4b4-233673a1e08b', 3, 'Independent of the angle between v and B');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4a35ff34-a3d1-4d28-a4b4-233673a1e08b', '7ee614a9-a370-4abf-afbe-2f83c7476b92', 'The magnetic force F = qvB*sin(theta), where theta is the angle between velocity and field; when v is parallel (theta=0) or antiparallel (theta=180) to B, sin(theta)=0, giving zero magnetic force — the particle then moves in a straight line unaffected by the field.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('70297925-5135-484a-8222-90cf64e6024a', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 18, 'The angle of dip (magnetic inclination) at a given location on Earth''s surface refers to the angle between:', 'Physics', 'Magnetism and Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13a8c4d6-b591-4735-8a83-3d3179b893ea', '70297925-5135-484a-8222-90cf64e6024a', 0, 'The geographic north and magnetic north directions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('907dfcad-7160-40de-a869-ac8ea2a60280', '70297925-5135-484a-8222-90cf64e6024a', 1, 'The Earth''s magnetic field vector and the horizontal plane at that location');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('69f57c75-a1de-4d13-b9a2-adc3a92a7481', '70297925-5135-484a-8222-90cf64e6024a', 2, 'Latitude and longitude');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b9a0e03-3978-4fc4-abdb-f759d956b2f5', '70297925-5135-484a-8222-90cf64e6024a', 3, 'True north and the observer''s line of sight');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('70297925-5135-484a-8222-90cf64e6024a', '907dfcad-7160-40de-a869-ac8ea2a60280', 'The angle of dip is the angle that the Earth''s total magnetic field vector makes with the horizontal plane at a given location, varying from 0 degrees at the magnetic equator to 90 degrees at the magnetic poles.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7d0c8e4f-2472-4acd-823e-2a4df5c7df6d', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 19, 'The self-inductance of a coil is defined as the property by which the coil:', 'Physics', 'Electromagnetic Induction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cc0598bb-f532-44d3-a652-9655ba87f9ec', '7d0c8e4f-2472-4acd-823e-2a4df5c7df6d', 0, 'Opposes any change in current flowing through itself, by inducing an EMF proportional to the rate of change of its own current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12c9e1fe-ce88-4174-a958-70f1b3cd6367', '7d0c8e4f-2472-4acd-823e-2a4df5c7df6d', 1, 'Generates a constant EMF regardless of current change');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dedd62f1-9729-47eb-945b-30e1572be217', '7d0c8e4f-2472-4acd-823e-2a4df5c7df6d', 2, 'Only affects a nearby, separate coil, never itself');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bedd12a1-d270-4ce3-911c-666d38298f15', '7d0c8e4f-2472-4acd-823e-2a4df5c7df6d', 3, 'Has no relationship to magnetic flux at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7d0c8e4f-2472-4acd-823e-2a4df5c7df6d', 'cc0598bb-f532-44d3-a652-9655ba87f9ec', 'Self-inductance describes a coil''s property of inducing an EMF within ITSELF that opposes any change in the current flowing through it (Lenz''s law applied to self-induction), with the induced EMF proportional to the rate of change of its own current.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('bbe4df36-26a7-47e6-bc4d-5a6a041c1954', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 20, 'A step-up transformer is used to:', 'Physics', 'Alternating Current');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b2e10c0-0379-4ca8-8737-69227f358731', 'bbe4df36-26a7-47e6-bc4d-5a6a041c1954', 0, 'Decrease the AC voltage while increasing the current, keeping power (ideally) constant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31ab9ff9-b0f8-4454-b04b-4076eb16bf9e', 'bbe4df36-26a7-47e6-bc4d-5a6a041c1954', 1, 'Increase the AC voltage while decreasing the current, keeping power (ideally) constant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b4b74a00-e239-4ee5-a884-4392f976962d', 'bbe4df36-26a7-47e6-bc4d-5a6a041c1954', 2, 'Convert AC to DC');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89034fbe-838c-493b-8ddb-ae5fe6f8a751', 'bbe4df36-26a7-47e6-bc4d-5a6a041c1954', 3, 'Amplify the frequency of the AC signal');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bbe4df36-26a7-47e6-bc4d-5a6a041c1954', '31ab9ff9-b0f8-4454-b04b-4076eb16bf9e', 'A step-up transformer increases voltage from primary to secondary coil (more secondary turns than primary); since ideal transformers conserve power (P=VI), the corresponding current decreases proportionally — vital for efficient long-distance power transmission at high voltage/low current.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e6075f95-6f70-4202-8988-95223e628eae', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 21, 'Refraction of light through a glass prism, where the emergent ray deviates from its original path, occurs because light travels at different speeds in the:', 'Physics', 'Ray Optics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('07aee339-4e76-487f-a024-d653bc77bb74', 'e6075f95-6f70-4202-8988-95223e628eae', 0, 'Same medium at all points');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('330b9ded-dfbc-4889-baf6-d16eccf503e0', 'e6075f95-6f70-4202-8988-95223e628eae', 1, 'Prism material (glass) compared to air, causing bending at each refracting surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ccc1be7-921c-4938-97cf-61c629dcf47a', 'e6075f95-6f70-4202-8988-95223e628eae', 2, 'Prism only when it is heated');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('890baa75-4a1c-4f2b-aa26-1e6bddae34d2', 'e6075f95-6f70-4202-8988-95223e628eae', 3, 'Vacuum, with no relevance to the prism material');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e6075f95-6f70-4202-8988-95223e628eae', '330b9ded-dfbc-4889-baf6-d16eccf503e0', 'Refraction at each of the prism''s two surfaces occurs because light travels at different speeds in air versus the denser glass medium, causing the light ray to bend according to Snell''s law at each interface, resulting in overall deviation from its original path.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9e93cf02-c5d7-4fbe-8146-38ee8fcdc507', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 22, 'The resolving power of an optical instrument, such as a telescope, refers to its ability to:', 'Physics', 'Wave Optics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6629227c-6ea8-4dc4-bb5b-6cdaf5422d5f', '9e93cf02-c5d7-4fbe-8146-38ee8fcdc507', 0, 'Magnify an image to any arbitrary degree');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac17d2ac-4bfd-40fc-8474-fa76b2aa8cee', '9e93cf02-c5d7-4fbe-8146-38ee8fcdc507', 1, 'Distinguish between two closely spaced objects/points as separate, rather than a single blurred image');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88534201-52e5-45ec-8904-132a7e4c1c37', '9e93cf02-c5d7-4fbe-8146-38ee8fcdc507', 2, 'Only function in bright daylight conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('52dc5be7-1be9-4042-968c-56e77b72a86c', '9e93cf02-c5d7-4fbe-8146-38ee8fcdc507', 3, 'Change the color of the observed object');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9e93cf02-c5d7-4fbe-8146-38ee8fcdc507', 'ac17d2ac-4bfd-40fc-8474-fa76b2aa8cee', 'Resolving power describes an optical instrument''s capacity to produce distinctly separate images of two closely spaced points/objects, fundamentally limited by diffraction effects related to the instrument''s aperture size and the wavelength of light used.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8ac16fc4-b2c3-47de-b79c-aef1db58bfa9', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 23, 'The work function of a metal is defined as:', 'Physics', 'Dual Nature of Radiation and Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b368a486-e084-48b9-b6af-70d3af9c9437', '8ac16fc4-b2c3-47de-b79c-aef1db58bfa9', 0, 'The total kinetic energy of all electrons in the metal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f06f329d-1cee-4e4c-acf4-ccafc8a4d4ee', '8ac16fc4-b2c3-47de-b79c-aef1db58bfa9', 1, 'The minimum energy required to just remove (eject) an electron from the metal''s surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('49931c12-92b2-41e1-a4e8-dd1ec218d601', '8ac16fc4-b2c3-47de-b79c-aef1db58bfa9', 2, 'The energy released when an electron is added to the metal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('056d0674-1e27-4ffa-a7a8-4768675d543a', '8ac16fc4-b2c3-47de-b79c-aef1db58bfa9', 3, 'The energy required to melt the metal completely');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8ac16fc4-b2c3-47de-b79c-aef1db58bfa9', 'f06f329d-1cee-4e4c-acf4-ccafc8a4d4ee', 'Work function (phi) is the minimum threshold energy needed to liberate the most loosely bound electron from a metal''s surface, a material-specific property central to the photoelectric equation KE_max = hf - phi.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2b7652fe-1b61-414d-a2c0-937505234d14', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 24, 'The energy required to completely remove the electron from a hydrogen atom in its ground state (n=1) is called its:', 'Physics', 'Atoms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64b4000a-1b28-4091-a6fd-85e1673fbd19', '2b7652fe-1b61-414d-a2c0-937505234d14', 0, 'Excitation energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('649e6170-fa47-4ddb-8109-259ede61fe1f', '2b7652fe-1b61-414d-a2c0-937505234d14', 1, 'Ionization energy, equal to 13.6 eV for hydrogen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cd3c8e9-2d08-426b-8199-2c85f5211739', '2b7652fe-1b61-414d-a2c0-937505234d14', 2, 'Binding energy of the nucleus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23bdf0d9-3df6-407f-8ea8-9f37cef700ad', '2b7652fe-1b61-414d-a2c0-937505234d14', 3, 'Photoelectric threshold energy');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2b7652fe-1b61-414d-a2c0-937505234d14', '649e6170-fa47-4ddb-8109-259ede61fe1f', 'Ionization energy of hydrogen (13.6 eV) is the energy needed to completely remove the electron from the ground state (n=1) to n=infinity (a free electron with zero kinetic energy).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('bc24e98c-b5b9-4411-b155-54cd6b804936', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 25, 'The unit ''curie,'' used to measure radioactivity, quantifies:', 'Physics', 'Nuclei');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('868cf737-2ee2-4571-9d27-a78efe8a6de9', 'bc24e98c-b5b9-4411-b155-54cd6b804936', 0, 'The energy of emitted radiation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9699e551-d97c-472f-97cc-ba324c089ac0', 'bc24e98c-b5b9-4411-b155-54cd6b804936', 1, 'The rate of radioactive decay (number of disintegrations per second) of a sample');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ad1e46a-b314-4914-b6ce-907ba4dd6337', 'bc24e98c-b5b9-4411-b155-54cd6b804936', 2, 'The mass of radioactive material present');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('919b9c71-51b0-4adf-9dd3-e349c98de31a', 'bc24e98c-b5b9-4411-b155-54cd6b804936', 3, 'The half-life of the radioactive substance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bc24e98c-b5b9-4411-b155-54cd6b804936', '9699e551-d97c-472f-97cc-ba324c089ac0', 'The curie (Ci) is a unit of radioactivity (activity), measuring the rate of nuclear disintegrations per second in a radioactive sample; the SI unit for this is the becquerel (Bq), equal to exactly 1 disintegration per second.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b77f27aa-3e0f-4cdd-b792-b16762313aca', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 26, 'A p-n junction diode used to convert AC into pulsating DC (unidirectional current) is functioning as a:', 'Physics', 'Semiconductor Electronics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d17a5743-fd00-4b67-ab69-e3712efb0fa6', 'b77f27aa-3e0f-4cdd-b792-b16762313aca', 0, 'Amplifier');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d41f0b1d-5d73-4a63-ad71-e893abef5b8e', 'b77f27aa-3e0f-4cdd-b792-b16762313aca', 1, 'Rectifier');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42d4f426-4c5f-48ea-9122-8bd0ccdf0cce', 'b77f27aa-3e0f-4cdd-b792-b16762313aca', 2, 'Oscillator');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5e34c9d-8597-49cd-8f95-7c9ff0d7a89d', 'b77f27aa-3e0f-4cdd-b792-b16762313aca', 3, 'Photodiode');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b77f27aa-3e0f-4cdd-b792-b16762313aca', 'd41f0b1d-5d73-4a63-ad71-e893abef5b8e', 'A diode''s characteristic property of conducting current predominantly in one direction (forward bias) makes it useful as a rectifier, converting an alternating (bidirectional) input current into a pulsating, unidirectional output.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8bc2d11b-c8f7-4a43-ac06-3e7bfe418c07', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 27, 'An antenna used for transmitting or receiving electromagnetic signals functions effectively when its length is comparable to:', 'Physics', 'Communication Systems');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc938ff0-f66a-4bdc-ac23-98f3928b67a0', '8bc2d11b-c8f7-4a43-ac06-3e7bfe418c07', 0, 'The wavelength of the signal being transmitted/received');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b055cb2f-54e7-4554-a259-22f70f89a6e1', '8bc2d11b-c8f7-4a43-ac06-3e7bfe418c07', 1, 'The mass of the transmitting equipment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a56227a2-672d-4e73-ad34-a67880acb02f', '8bc2d11b-c8f7-4a43-ac06-3e7bfe418c07', 2, 'The distance to the receiver, regardless of wavelength');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ece59dd7-ff53-4efc-af6f-44cb828f7776', '8bc2d11b-c8f7-4a43-ac06-3e7bfe418c07', 3, 'The frequency of the local mains electricity supply');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8bc2d11b-c8f7-4a43-ac06-3e7bfe418c07', 'bc938ff0-f66a-4bdc-ac23-98f3928b67a0', 'For efficient radiation/reception, an antenna''s physical dimensions (often a simple dipole length) need to be comparable to (typically a significant fraction or multiple of) the wavelength of the electromagnetic signal being transmitted or received.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('32e0e81f-5a4b-4644-887e-d376a28232d1', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 28, 'A boat aiming to cross a river directly perpendicular to the flow, while the river current pushes it downstream, illustrates a classic application of:', 'Physics', 'Motion in a Plane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e7025fe-dd67-467b-b88c-ebf743a8c4ff', '32e0e81f-5a4b-4644-887e-d376a28232d1', 0, 'Newton''s third law only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2b702fe-5bd0-44cd-bb0c-2b5a26ccf64c', '32e0e81f-5a4b-4644-887e-d376a28232d1', 1, 'Vector addition of relative velocities (the boat''s velocity relative to water and the water''s velocity relative to ground)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('763cc081-4422-4cbd-b2c3-e84e4e7da010', '32e0e81f-5a4b-4644-887e-d376a28232d1', 2, 'The law of conservation of energy exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6be24cb6-88a1-4df0-87bf-b6934ea8e9f1', '32e0e81f-5a4b-4644-887e-d376a28232d1', 3, 'Kepler''s laws');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('32e0e81f-5a4b-4644-887e-d376a28232d1', 'c2b702fe-5bd0-44cd-bb0c-2b5a26ccf64c', 'River-boat crossing problems are solved by vector addition: the boat''s resultant velocity relative to the ground is the vector sum of its velocity relative to the water (as steered) and the water''s velocity relative to the ground (the current) — a classic relative-velocity application.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('bb72baad-f7b3-4502-b942-95f397b24a3e', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 29, 'An adiabatic wall, as used in defining a thermodynamic system, is one that:', 'Physics', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be207e00-3819-487a-aba1-fd6063042e2b', 'bb72baad-f7b3-4502-b942-95f397b24a3e', 0, 'Allows heat to pass through freely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7052d2b6-2419-49bf-b1af-a6addf7eed89', 'bb72baad-f7b3-4502-b942-95f397b24a3e', 1, 'Does not allow any heat exchange between the system and surroundings');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9bbcf6d4-51bf-4b9d-9bd0-493fd4cddbfd', 'bb72baad-f7b3-4502-b942-95f397b24a3e', 2, 'Only allows matter to pass through, not heat or work');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5349056a-cd73-4201-9f2f-1c4087d0eabb', 'bb72baad-f7b3-4502-b942-95f397b24a3e', 3, 'Is a purely theoretical concept with no experimental analogue');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bb72baad-f7b3-4502-b942-95f397b24a3e', '7052d2b6-2419-49bf-b1af-a6addf7eed89', 'An adiabatic wall is defined as one that prevents any heat transfer between a system and its surroundings, an idealization approximated experimentally by well-insulated container walls.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9536f9dd-60b3-4d93-97f4-b274c94fcb3f', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 30, 'In a simple electric circuit with a battery and a single resistor, the current flowing is given by Ohm''s law adjusted for internal resistance as:', 'Physics', 'Current Electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3288be42-ab67-432b-89e6-8162c26e3128', '9536f9dd-60b3-4d93-97f4-b274c94fcb3f', 0, 'I = E/R only, ignoring internal resistance entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('127848df-4d50-4470-b11e-346e30ac7623', '9536f9dd-60b3-4d93-97f4-b274c94fcb3f', 1, 'I = E/(R + r), where E is EMF, R is external resistance, and r is the cell''s internal resistance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65cb4eb3-ddd2-4b9c-bd0b-bc88fe0c007f', '9536f9dd-60b3-4d93-97f4-b274c94fcb3f', 2, 'I = E*R*r');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8ea597b-f1de-4d9e-9236-38ce1999fcf9', '9536f9dd-60b3-4d93-97f4-b274c94fcb3f', 3, 'I = (R+r)/E');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9536f9dd-60b3-4d93-97f4-b274c94fcb3f', '127848df-4d50-4470-b11e-346e30ac7623', 'Accounting for the cell''s own internal resistance r, the current in a simple series circuit is I = E/(R+r), where E is the EMF and R is the external circuit resistance — this reduces to I=E/R only in the idealized case of zero internal resistance.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d38e664f-1ae6-4a34-8e38-62d3fdda33e6', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 31, 'The force per unit length between two parallel current-carrying conductors separated by distance d, carrying currents I1 and I2, is given by:', 'Physics', 'Moving Charges and Magnetism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7b72fe6-21f4-4788-abf2-0d4f1a44be20', 'd38e664f-1ae6-4a34-8e38-62d3fdda33e6', 0, 'F/L = mu0*I1*I2/(2*pi*d)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a97e1451-5a33-4934-b28d-ea3378db41ee', 'd38e664f-1ae6-4a34-8e38-62d3fdda33e6', 1, 'F/L = mu0*I1*I2*d');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef40b01a-1c83-4551-b737-4c0e1c414a6d', 'd38e664f-1ae6-4a34-8e38-62d3fdda33e6', 2, 'F/L = mu0*(I1+I2)/d');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c1b807f8-2a88-419c-a90d-43ad4b06ce79', 'd38e664f-1ae6-4a34-8e38-62d3fdda33e6', 3, 'F/L is independent of the currents');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d38e664f-1ae6-4a34-8e38-62d3fdda33e6', 'd7b72fe6-21f4-4788-abf2-0d4f1a44be20', 'The force per unit length between two long, parallel current-carrying conductors is F/L = mu0*I1*I2/(2*pi*d) — this expression is used to formally define the SI unit of current, the ampere.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('128450a7-5534-4927-939b-0fdd62318c1a', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 32, 'The n-p-n and p-n-p configurations describe the two basic types of:', 'Physics', 'Semiconductor Electronics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9194402-fe76-45a8-afbc-40a90f2a3d2a', '128450a7-5534-4927-939b-0fdd62318c1a', 0, 'Diodes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e860ce7a-eb37-49cf-a2ab-46f40937a57b', '128450a7-5534-4927-939b-0fdd62318c1a', 1, 'Bipolar junction transistors (BJTs)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('70a931f8-97cf-487a-8fe9-958e763bbb10', '128450a7-5534-4927-939b-0fdd62318c1a', 2, 'Resistors');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('faa0fbc0-e0d5-4c4b-824f-5d1c2a7a815b', '128450a7-5534-4927-939b-0fdd62318c1a', 3, 'Capacitors');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('128450a7-5534-4927-939b-0fdd62318c1a', 'e860ce7a-eb37-49cf-a2ab-46f40937a57b', 'Bipolar junction transistors are constructed as either n-p-n or p-n-p sandwich structures of doped semiconductor layers, forming the emitter, base, and collector regions used for amplification and switching applications.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0789d34c-9e66-4017-8d81-28e8586f8030', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 33, 'The triple point of water refers to the unique combination of temperature and pressure at which:', 'Physics', 'Thermal Properties of Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ea457c7-b43c-4409-a74f-496ffb48d0dc', '0789d34c-9e66-4017-8d81-28e8586f8030', 0, 'Only the liquid phase of water can exist');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('046eb0e7-d12d-4c62-b7f0-6d263f33c9e6', '0789d34c-9e66-4017-8d81-28e8586f8030', 1, 'Solid, liquid, and gaseous phases of water can all coexist simultaneously in equilibrium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a9648b2-d86d-46ea-9abc-84e66a9e0968', '0789d34c-9e66-4017-8d81-28e8586f8030', 2, 'Water always freezes instantly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c8b7818-82b5-486d-8d59-df56e9ed0744', '0789d34c-9e66-4017-8d81-28e8586f8030', 3, 'Water boils at exactly 100 degrees Celsius');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0789d34c-9e66-4017-8d81-28e8586f8030', '046eb0e7-d12d-4c62-b7f0-6d263f33c9e6', 'The triple point is the specific temperature and pressure combination (0.01 degrees C and 611.657 Pa for water) at which all three phases — solid, liquid, and vapor — coexist in thermodynamic equilibrium, serving as a precisely reproducible reference point for temperature scales.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c821797b-3f09-417f-95c0-e82456e81cee', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 34, 'A conductor in electrostatic equilibrium has the property that the electric field just outside its surface is:', 'Physics', 'Electrostatic Potential and Capacitance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9cabf309-a82c-421f-8633-0c385d91470d', 'c821797b-3f09-417f-95c0-e82456e81cee', 0, 'Always zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a262d18a-4dc5-4303-a22f-a56bec562c3b', 'c821797b-3f09-417f-95c0-e82456e81cee', 1, 'Perpendicular to the surface at every point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d396952-15e0-443e-a5cc-db6ecbc023db', 'c821797b-3f09-417f-95c0-e82456e81cee', 2, 'Always parallel to the surface');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a4bd599-663b-4622-9015-8e13ea14fc4e', 'c821797b-3f09-417f-95c0-e82456e81cee', 3, 'Directed inward toward the conductor''s centre');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c821797b-3f09-417f-95c0-e82456e81cee', 'a262d18a-4dc5-4303-a22f-a56bec562c3b', 'In electrostatic equilibrium, charges on a conductor''s surface arrange themselves so that the surface is an equipotential; consequently, the electric field just outside the surface is always perpendicular to the surface (any tangential component would cause charge to keep moving, contradicting equilibrium).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e945dc3e-2dbc-4d54-ba52-3bb60c81fa90', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 35, 'An ideal gas is one that is assumed to obey the gas laws exactly under all conditions, based on the assumption that:', 'Physics', 'Kinetic Theory');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3642ad7-5baf-4446-b932-d053ff49c734', 'e945dc3e-2dbc-4d54-ba52-3bb60c81fa90', 0, 'Gas molecules have significant volume and strong intermolecular attractions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ddacaad4-a22b-4e93-a4ae-21cb2a538502', 'e945dc3e-2dbc-4d54-ba52-3bb60c81fa90', 1, 'Gas molecules have negligible volume compared to the container, and experience no intermolecular forces except during perfectly elastic collisions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('049d07f1-6c21-47be-a631-cea1e3386daf', 'e945dc3e-2dbc-4d54-ba52-3bb60c81fa90', 2, 'Gas molecules move only in a single fixed direction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f3387cd9-15c6-4821-8542-ea271c1f3d70', 'e945dc3e-2dbc-4d54-ba52-3bb60c81fa90', 3, 'Gas molecules are stationary at all temperatures');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e945dc3e-2dbc-4d54-ba52-3bb60c81fa90', 'ddacaad4-a22b-4e93-a4ae-21cb2a538502', 'The ideal gas model assumes point-like molecules (negligible volume relative to the container) with no intermolecular attractive/repulsive forces except during instantaneous, perfectly elastic collisions — an idealization real gases approach only at low pressure and high temperature.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('07e1e943-3b26-4de7-ad94-7ba3a39c6a7d', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 36, 'Infrared radiation, a part of the electromagnetic spectrum with wavelengths longer than visible light, is commonly associated with:', 'Physics', 'Electromagnetic Waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d84b154e-4ea1-489d-9d25-37fd91aab0e6', '07e1e943-3b26-4de7-ad94-7ba3a39c6a7d', 0, 'Causing sunburn and skin damage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d8f81ae-bb86-4470-9507-129be3ccf4fb', '07e1e943-3b26-4de7-ad94-7ba3a39c6a7d', 1, 'Heating effects, and is used in remote controls, thermal imaging, and physiotherapy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75f2c6b7-79f4-42d0-9b4f-8820cad12ed4', '07e1e943-3b26-4de7-ad94-7ba3a39c6a7d', 2, 'Being used primarily for medical X-ray imaging');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3bf4512f-ff7c-4583-831c-976d79ae09e2', '07e1e943-3b26-4de7-ad94-7ba3a39c6a7d', 3, 'Ionizing atoms, similar to gamma rays');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('07e1e943-3b26-4de7-ad94-7ba3a39c6a7d', '2d8f81ae-bb86-4470-9507-129be3ccf4fb', 'Infrared radiation is primarily associated with heating effects (thermal radiation) and is widely used in applications like remote controls, thermal/night-vision imaging, and physiotherapy heat treatment — unlike higher-energy UV/X-ray/gamma radiation, it does not typically cause ionization or sunburn.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3031b31c-3912-47dc-afad-5fe32ab6713d', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 37, 'For a satellite in a stable circular orbit around Earth, the required centripetal force is provided entirely by:', 'Physics', 'Gravitation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9af2345-847a-4c58-b541-07b64950bfe7', '3031b31c-3912-47dc-afad-5fe32ab6713d', 0, 'The satellite''s own engine thrust, continuously firing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c357aff3-b860-453b-a795-b1b3b3d0b7eb', '3031b31c-3912-47dc-afad-5fe32ab6713d', 1, 'The gravitational force of attraction between Earth and the satellite');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5cbae5ac-5c7c-4c2a-aa07-1de636f0c651', '3031b31c-3912-47dc-afad-5fe32ab6713d', 2, 'Atmospheric drag');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a5db1e8-abe1-44e9-8ece-5aed4c31c82d', '3031b31c-3912-47dc-afad-5fe32ab6713d', 3, 'Magnetic forces from Earth''s magnetic field');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3031b31c-3912-47dc-afad-5fe32ab6713d', 'c357aff3-b860-453b-a795-b1b3b3d0b7eb', 'For a satellite in a stable circular orbit, Earth''s gravitational pull on the satellite provides exactly the centripetal force needed to maintain its circular path — no continuous engine thrust is required to sustain a stable orbit (absent atmospheric drag).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2546dcaa-aa87-4cc3-9490-2aef7eff96a9', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 38, 'Interference of light, as demonstrated in Young''s double slit experiment, requires the two light sources to be:', 'Physics', 'Waves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01ee24da-fd1e-4b09-9150-7b23cea90f88', '2546dcaa-aa87-4cc3-9490-2aef7eff96a9', 0, 'Of completely different, unrelated frequencies');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d73a9750-ae72-4fcc-8b8e-1747c1ceeeba', '2546dcaa-aa87-4cc3-9490-2aef7eff96a9', 1, 'Coherent — maintaining a constant phase relationship with each other');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0a3f7cd-ef79-4e27-b884-d7adc5b3ec3f', '2546dcaa-aa87-4cc3-9490-2aef7eff96a9', 2, 'Extremely far apart from each other, with no proximity requirement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('90a64363-fe3f-460d-ac86-727e1d74b70e', '2546dcaa-aa87-4cc3-9490-2aef7eff96a9', 3, 'Emitting light of different colors simultaneously');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2546dcaa-aa87-4cc3-9490-2aef7eff96a9', 'd73a9750-ae72-4fcc-8b8e-1747c1ceeeba', 'Sustained, observable interference patterns require coherent sources — light waves of the same frequency maintaining a constant (or at least well-defined and stable) phase relationship, which is why Young''s experiment uses a single source split into two via slits, rather than two independent sources.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6bc75b44-ae9e-4f8b-b98c-45ae6826de59', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 39, 'An ammeter, used to measure current in a circuit, is always connected:', 'Physics', 'Current Electricity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fb9159a0-98dc-40a6-88a3-265dfca73b30', '6bc75b44-ae9e-4f8b-b98c-45ae6826de59', 0, 'In parallel with the circuit component whose current is being measured');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d070833-57d6-4b33-8622-0ed75c75be0c', '6bc75b44-ae9e-4f8b-b98c-45ae6826de59', 1, 'In series with the circuit component, so the same current flows through both');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3d463ad1-cfa3-4480-9965-6c9b68f086dc', '6bc75b44-ae9e-4f8b-b98c-45ae6826de59', 2, 'In parallel with the battery only, never in the main circuit path');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d6d44e6-3a0f-4803-945e-af552eff9015', '6bc75b44-ae9e-4f8b-b98c-45ae6826de59', 3, 'Neither in series nor parallel; it''s connected separately outside the circuit');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6bc75b44-ae9e-4f8b-b98c-45ae6826de59', '2d070833-57d6-4b33-8622-0ed75c75be0c', 'An ammeter must be connected in series within the circuit branch so that the entire current to be measured flows directly through it (which is why an ideal ammeter has very low, ideally zero, resistance, to avoid significantly altering the circuit''s current).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d4bce3e4-b67b-4e3e-901b-f0f7cf6e21a2', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 40, 'In a common-base transistor configuration, the current gain (alpha), the ratio of collector current to emitter current, is typically:', 'Physics', 'Semiconductor Electronics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a00bf03c-ba1f-4bc3-b355-4930efd06053', 'd4bce3e4-b67b-4e3e-901b-f0f7cf6e21a2', 0, 'Greater than 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cff085b0-4647-4657-b913-55659d4ef63d', 'd4bce3e4-b67b-4e3e-901b-f0f7cf6e21a2', 1, 'Slightly less than 1 (close to unity)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('43615aa8-694a-4fd4-bc01-ecdfb8823faf', 'd4bce3e4-b67b-4e3e-901b-f0f7cf6e21a2', 2, 'Exactly 0');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60820e1d-3ce3-4fcd-9e5a-28e306f20ec4', 'd4bce3e4-b67b-4e3e-901b-f0f7cf6e21a2', 3, 'Always negative');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d4bce3e4-b67b-4e3e-901b-f0f7cf6e21a2', 'cff085b0-4647-4657-b913-55659d4ef63d', 'In common-base configuration, alpha = Ic/Ie is slightly less than 1 (typically 0.95-0.99), since a small fraction of emitter current is lost as base current rather than reaching the collector.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('bcb82645-f067-4e10-86c0-6ffc998e03d9', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 41, 'The phase difference between displacement and velocity of a particle executing simple harmonic motion is:', 'Physics', 'Oscillations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba2e7bd6-d4b2-4669-8139-e08de59f7b84', 'bcb82645-f067-4e10-86c0-6ffc998e03d9', 0, '0 degrees (always in phase)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('673221a5-e533-43b8-ab6a-5999780ca565', 'bcb82645-f067-4e10-86c0-6ffc998e03d9', 1, '90 degrees (pi/2 radians)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c564422-e806-4aa4-84d1-2934feb9383d', 'bcb82645-f067-4e10-86c0-6ffc998e03d9', 2, '180 degrees, exactly opposite');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04834474-154a-46da-a37b-4db15fa787c5', 'bcb82645-f067-4e10-86c0-6ffc998e03d9', 3, 'Continuously and randomly varying');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bcb82645-f067-4e10-86c0-6ffc998e03d9', '673221a5-e533-43b8-ab6a-5999780ca565', 'For SHM, if displacement varies as x = A*sin(omega*t), velocity varies as v = A*omega*cos(omega*t) — a cosine function is 90 degrees out of phase with a sine function, so displacement and velocity are always 90 degrees out of phase with each other.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8e3ad3bd-c1c9-4e8d-a60d-4f357618dbe6', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 42, 'Percentage error in a measured quantity is calculated as:', 'Physics', 'Units and Measurements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b964352a-f4bb-4f0b-9fda-bcbb0f3dadd8', '8e3ad3bd-c1c9-4e8d-a60d-4f357618dbe6', 0, '(Absolute error / mean value) x 100%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e89701d8-f608-499d-88a5-38b1e05a0dc0', '8e3ad3bd-c1c9-4e8d-a60d-4f357618dbe6', 1, 'Absolute error alone, with no reference to the mean value');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60fdbabf-7293-4841-9261-54a591922031', '8e3ad3bd-c1c9-4e8d-a60d-4f357618dbe6', 2, 'Mean value / absolute error');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ef814f0-246b-46fe-be7e-2885970512e3', '8e3ad3bd-c1c9-4e8d-a60d-4f357618dbe6', 3, 'Absolute error squared');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8e3ad3bd-c1c9-4e8d-a60d-4f357618dbe6', 'b964352a-f4bb-4f0b-9fda-bcbb0f3dadd8', 'Percentage error expresses the relative size of the measurement''s absolute error as a percentage of the accepted/mean value: (absolute error / mean value) x 100%.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('79c79267-3fda-4072-9bd2-fbc27bd51700', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 43, 'A spring gun launches a ball using the elastic potential energy stored in a compressed spring. As the spring returns to its natural length, this stored energy is converted primarily into the ball''s:', 'Physics', 'Work, Energy and Power');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3b32e9b6-bdd0-4073-88f6-ae636859f6ed', '79c79267-3fda-4072-9bd2-fbc27bd51700', 0, 'Rest mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a280207d-2ffe-4174-8045-83183e5e5e00', '79c79267-3fda-4072-9bd2-fbc27bd51700', 1, 'Kinetic energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f7ad602-a5e8-4e52-b322-db2764094ed8', '79c79267-3fda-4072-9bd2-fbc27bd51700', 2, 'Electric potential energy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab3a1003-6ddf-423b-8fbb-35e9d2b21bb6', '79c79267-3fda-4072-9bd2-fbc27bd51700', 3, 'Thermal energy exclusively, with no motion');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('79c79267-3fda-4072-9bd2-fbc27bd51700', 'a280207d-2ffe-4174-8045-83183e5e5e00', 'As the compressed spring relaxes, its stored elastic potential energy converts (ideally, neglecting friction/heat losses) into the kinetic energy of the launched ball, consistent with the conservation of mechanical energy.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7c629fe9-071d-4e15-ab1a-01e6079abd91', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 44, 'The area under a stress-strain graph (up to a given strain) for a material represents:', 'Physics', 'Mechanical Properties of Solids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da795457-756e-46f5-a3ab-6970a3e7dcfa', '7c629fe9-071d-4e15-ab1a-01e6079abd91', 0, 'The material''s density');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c85c826-aedc-469b-8acf-543cbe4a0c51', '7c629fe9-071d-4e15-ab1a-01e6079abd91', 1, 'The energy stored per unit volume (strain energy density) in the material up to that deformation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e7628e4a-75fa-4054-a513-526e6f255dff', '7c629fe9-071d-4e15-ab1a-01e6079abd91', 2, 'The material''s melting point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f474296d-c6ed-422a-9a1e-42cd464b3eaf', '7c629fe9-071d-4e15-ab1a-01e6079abd91', 3, 'The material''s electrical conductivity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7c629fe9-071d-4e15-ab1a-01e6079abd91', '0c85c826-aedc-469b-8acf-543cbe4a0c51', 'The area under a stress-strain curve up to a given point represents the strain energy stored per unit volume of the material as it is deformed to that extent — useful for characterizing a material''s toughness/resilience.', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('587b6cb8-f908-44d5-920d-e8f81716537c', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 45, 'The critical angle for total internal reflection, when light travels from a denser medium (refractive index n) into a rarer medium (air), is related to n by:', 'Physics', 'Ray Optics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1208cb60-b215-4be7-ba03-f388b33a5373', '587b6cb8-f908-44d5-920d-e8f81716537c', 0, 'sin(C) = n');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f421a5c9-9250-4d79-8aea-5db17bb8e3f7', '587b6cb8-f908-44d5-920d-e8f81716537c', 1, 'sin(C) = 1/n');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('529ad5c4-beec-4c70-b62a-07e1d627d372', '587b6cb8-f908-44d5-920d-e8f81716537c', 2, 'cos(C) = n');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('96426a41-f216-44a0-a669-888541627b9f', '587b6cb8-f908-44d5-920d-e8f81716537c', 3, 'tan(C) = 1/n');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('587b6cb8-f908-44d5-920d-e8f81716537c', 'f421a5c9-9250-4d79-8aea-5db17bb8e3f7', 'The critical angle C satisfies sin(C) = 1/n (using Snell''s law with the angle of refraction set to 90 degrees at the critical angle), where n is the refractive index of the denser medium relative to the rarer medium (air).', 'Physics — authored from NCERT Class 11/12 Physics textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Chemistry (45 questions) — Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2a82af96-a544-46c6-8b59-93c1147b3bfb', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 46, 'A limiting reagent in a chemical reaction is the reactant that:', 'Chemistry', 'Some Basic Concepts of Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ba20343b-f50b-48c3-9805-2a9e28bd65bd', '2a82af96-a544-46c6-8b59-93c1147b3bfb', 0, 'Is present in the greatest excess amount');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e5a0c306-7eb1-4cb3-a514-72a56f6f282c', '2a82af96-a544-46c6-8b59-93c1147b3bfb', 1, 'Is completely consumed first, thereby determining the maximum amount of product that can be formed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2426ef01-aa42-4f35-b124-1b63f7f8cc66', '2a82af96-a544-46c6-8b59-93c1147b3bfb', 2, 'Never actually reacts, remaining as a spectator');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('647f479e-1555-498e-bd9f-45a9921523e2', '2a82af96-a544-46c6-8b59-93c1147b3bfb', 3, 'Is always the reactant with the largest molar mass');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2a82af96-a544-46c6-8b59-93c1147b3bfb', 'e5a0c306-7eb1-4cb3-a514-72a56f6f282c', 'The limiting reagent is entirely consumed before the other reactant(s), and it is this reagent''s quantity that determines the theoretical maximum yield of product achievable in the reaction.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8e7540c8-dd6a-4a92-813c-653ec4f1f299', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 47, 'The de Broglie relationship, applied to electrons, was experimentally confirmed by observing electron:', 'Chemistry', 'Structure of Atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5eacbdb-9979-4b36-b347-b9e159649692', '8e7540c8-dd6a-4a92-813c-653ec4f1f299', 0, 'Combustion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0d48b591-b177-4321-a08d-ffb180ed70cf', '8e7540c8-dd6a-4a92-813c-653ec4f1f299', 1, 'Diffraction patterns, similar to those produced by X-rays, demonstrating wave-like behavior');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be510a64-5bd1-419a-af82-d07640ff328a', '8e7540c8-dd6a-4a92-813c-653ec4f1f299', 2, 'Complete disappearance under a magnetic field');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dcb35e19-6e5a-44c8-8a38-a7d854dd8328', '8e7540c8-dd6a-4a92-813c-653ec4f1f299', 3, 'Fluorescence only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8e7540c8-dd6a-4a92-813c-653ec4f1f299', '0d48b591-b177-4321-a08d-ffb180ed70cf', 'The Davisson-Germer experiment demonstrated electron diffraction (producing patterns similar to X-ray diffraction from crystals), experimentally confirming the wave nature of electrons predicted by de Broglie''s hypothesis.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c7462d91-5ef8-4136-a5e5-2d58782cb0a1', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 48, 'Elements placed in the same vertical column of the periodic table are called a:', 'Chemistry', 'Classification of Elements and Periodicity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7167a2c-bc38-42e7-ada1-563b27663c85', 'c7462d91-5ef8-4136-a5e5-2d58782cb0a1', 0, 'Period');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ce0a110-4b8c-4b1c-a360-925f845c35d4', 'c7462d91-5ef8-4136-a5e5-2d58782cb0a1', 1, 'Group (or family)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('326bc2be-81d9-4f9d-95b0-e29506fb783c', 'c7462d91-5ef8-4136-a5e5-2d58782cb0a1', 2, 'Series');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2cdffc98-56fe-4f8d-b38a-a95cc69d9caf', 'c7462d91-5ef8-4136-a5e5-2d58782cb0a1', 3, 'Block');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c7462d91-5ef8-4136-a5e5-2d58782cb0a1', '2ce0a110-4b8c-4b1c-a360-925f845c35d4', 'Vertical columns in the periodic table are called groups (or families), containing elements with similar valence electron configurations and, generally, similar chemical properties; horizontal rows are called periods.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e7580359-4a4f-4592-95a3-83d4f36d63e0', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 49, 'The formal charge on an atom within a Lewis structure is calculated as:', 'Chemistry', 'Chemical Bonding and Molecular Structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('092d3679-fce9-44bb-84ae-63cda5de75ac', 'e7580359-4a4f-4592-95a3-83d4f36d63e0', 0, '(Valence electrons) - (non-bonding electrons) - (1/2 x bonding electrons)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('94a433e4-434b-4790-a09b-104d6b7b41aa', 'e7580359-4a4f-4592-95a3-83d4f36d63e0', 1, 'Always equal to the atom''s actual oxidation state');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b15c6c8c-6ca0-4d60-939c-c361614bf1fa', 'e7580359-4a4f-4592-95a3-83d4f36d63e0', 2, 'The atomic number of the atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf61797f-c0f6-42a0-bb76-e5ff67512cdb', 'e7580359-4a4f-4592-95a3-83d4f36d63e0', 3, 'The total number of bonds formed by the atom');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e7580359-4a4f-4592-95a3-83d4f36d63e0', '092d3679-fce9-44bb-84ae-63cda5de75ac', 'Formal charge = (number of valence electrons in the free atom) - (number of non-bonding/lone-pair electrons) - (1/2 x number of bonding electrons), a bookkeeping tool for evaluating the plausibility of different Lewis structures, distinct from real oxidation state or partial charge.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9ea185d5-200b-404e-ade2-65f4dba5bde5', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 50, 'The compressibility factor (Z = PV/nRT) for a real gas equal to exactly 1 indicates that the gas is behaving:', 'Chemistry', 'States of Matter');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5787af55-37b6-46ee-99d1-e5c26030d782', '9ea185d5-200b-404e-ade2-65f4dba5bde5', 0, 'Completely non-ideally at that point');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6a1668fb-906d-457a-9d0b-753e4bb2b11e', '9ea185d5-200b-404e-ade2-65f4dba5bde5', 1, 'Ideally at that specific condition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0f0ebb0-5ce6-45c7-aef1-16ecf17bf599', '9ea185d5-200b-404e-ade2-65f4dba5bde5', 2, 'As a liquid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cd31051e-ea7d-406f-af44-38d1aca5b615', '9ea185d5-200b-404e-ade2-65f4dba5bde5', 3, 'As a solid');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9ea185d5-200b-404e-ade2-65f4dba5bde5', '6a1668fb-906d-457a-9d0b-753e4bb2b11e', 'The compressibility factor Z equals exactly 1 only when a real gas behaves ideally (obeying PV=nRT exactly) at that particular temperature and pressure; deviations of Z from 1 quantify the extent of non-ideal behavior.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('516c1838-cdee-46b5-9bef-18264562f78d', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 51, 'Lattice enthalpy of an ionic compound is defined as the enthalpy change when:', 'Chemistry', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b08fa6a1-b5ef-4d2d-888e-538e8733474c', '516c1838-cdee-46b5-9bef-18264562f78d', 0, 'One mole of the solid ionic compound is formed from its constituent gaseous ions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20d04ed9-5e95-4893-9f12-54eb01d8c9fe', '516c1838-cdee-46b5-9bef-18264562f78d', 1, 'The compound is dissolved in water');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9f44e8f-b02d-463a-931c-d3786cdc7c0f', '516c1838-cdee-46b5-9bef-18264562f78d', 2, 'The compound melts');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d464b3d-dbda-41ec-a84b-417e55c21739', '516c1838-cdee-46b5-9bef-18264562f78d', 3, 'The compound reacts with an acid');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('516c1838-cdee-46b5-9bef-18264562f78d', 'b08fa6a1-b5ef-4d2d-888e-538e8733474c', 'Lattice enthalpy (of formation) is the energy released when one mole of a solid ionic compound is formed by combining its constituent ions in the gaseous state — a large negative value reflecting the strong electrostatic attraction in the ionic lattice.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('3056bb42-85a3-4524-b4f5-c3e404be5aaa', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 52, 'For the equilibrium constant Kc of a reaction, a very large value of Kc (much greater than 1) indicates that at equilibrium:', 'Chemistry', 'Equilibrium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8713e784-e441-4834-9af2-b506e41715f9', '3056bb42-85a3-4524-b4f5-c3e404be5aaa', 0, 'The reaction has essentially not proceeded at all, mostly reactants remain');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b72cbccd-96f0-4912-a274-45085f2df124', '3056bb42-85a3-4524-b4f5-c3e404be5aaa', 1, 'The equilibrium mixture consists predominantly of products');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('18f01bd2-cc19-4997-8b5c-d0e71c3734a5', '3056bb42-85a3-4524-b4f5-c3e404be5aaa', 2, 'Reactants and products are present in exactly equal amounts');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2e1802a-1bd7-4cc3-ad3c-05cb48b89d75', '3056bb42-85a3-4524-b4f5-c3e404be5aaa', 3, 'The reaction is non-spontaneous');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('3056bb42-85a3-4524-b4f5-c3e404be5aaa', 'b72cbccd-96f0-4912-a274-45085f2df124', 'A large Kc value means the equilibrium expression''s numerator (products) vastly exceeds the denominator (reactants) at equilibrium, indicating the reaction proceeds substantially toward completion (mostly products) before reaching equilibrium.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0200232c-80ad-459f-8cc3-20ae76bc2b15', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 53, 'The oxidation state of chlorine in the perchlorate ion (ClO4-) is:', 'Chemistry', 'Redox Reactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('780b8b0b-9f7b-414a-a8d3-5abae52cdcd6', '0200232c-80ad-459f-8cc3-20ae76bc2b15', 0, '+5');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('833def15-915d-455f-8178-1e91dd7e1ae6', '0200232c-80ad-459f-8cc3-20ae76bc2b15', 1, '+7');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ef6239ca-cffa-4838-9d18-b0de16b6c72b', '0200232c-80ad-459f-8cc3-20ae76bc2b15', 2, '-1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('958499fb-2d69-469e-987b-47b03fc530cf', '0200232c-80ad-459f-8cc3-20ae76bc2b15', 3, '+3');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0200232c-80ad-459f-8cc3-20ae76bc2b15', '833def15-915d-455f-8178-1e91dd7e1ae6', 'Each oxygen is -2 (total -8); for the ion''s overall -1 charge, x + (-8) = -1, giving x = +7 for chlorine in ClO4-.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('43f068c7-fa16-4a89-846c-91d069324b89', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 54, 'Hydrogen gas can be prepared in the laboratory by the reaction of dilute hydrochloric acid with:', 'Chemistry', 'Hydrogen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb74c89e-a2fe-4039-a12f-61b497d72b23', '43f068c7-fa16-4a89-846c-91d069324b89', 0, 'Copper metal, which is unreactive with dilute acids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7602d3e3-0439-405f-bbad-46cc89742359', '43f068c7-fa16-4a89-846c-91d069324b89', 1, 'Zinc metal, an active metal that displaces hydrogen from dilute acid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('def5aeef-b3ae-4884-a00a-cfeeebf7b112', '43f068c7-fa16-4a89-846c-91d069324b89', 2, 'Gold metal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f7a88b53-0853-4525-8ce1-391b847c8d4d', '43f068c7-fa16-4a89-846c-91d069324b89', 3, 'Only with concentrated nitric acid');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('43f068c7-fa16-4a89-846c-91d069324b89', '7602d3e3-0439-405f-bbad-46cc89742359', 'Zinc, being more reactive than hydrogen (above it in the reactivity/activity series), readily displaces hydrogen gas from dilute HCl (Zn + 2HCl -> ZnCl2 + H2), a classic laboratory hydrogen preparation method; unreactive metals like copper or gold do not react this way.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('108bdb04-371e-4744-a933-c04a69e27eb6', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 55, 'The solvay process is an important industrial method for manufacturing:', 'Chemistry', 's-Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('99dab11b-b648-4ac1-888b-aec7f2dc339e', '108bdb04-371e-4744-a933-c04a69e27eb6', 0, 'Sodium metal directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f729320d-9188-40c7-ac0a-104d3c080d55', '108bdb04-371e-4744-a933-c04a69e27eb6', 1, 'Sodium carbonate (washing soda precursor), from sodium chloride, ammonia, and carbon dioxide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37dc479b-fcb4-4d3e-981e-0d7198a61580', '108bdb04-371e-4744-a933-c04a69e27eb6', 2, 'Potassium hydroxide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af1ecdfa-0067-4eb3-80fb-1e0622ac3831', '108bdb04-371e-4744-a933-c04a69e27eb6', 3, 'Calcium oxide');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('108bdb04-371e-4744-a933-c04a69e27eb6', 'f729320d-9188-40c7-ac0a-104d3c080d55', 'The Solvay process industrially produces sodium carbonate (soda ash) using brine (NaCl), ammonia, and CO2 in a series of reactions, a major source of this widely used industrial chemical.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d1d58d1a-bdff-4800-94d1-132d839378c3', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 56, 'Hyperconjugation, a stabilizing effect in organic molecules, involves the delocalization of electrons from a:', 'Chemistry', 'Organic Chemistry — Basic Principles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('95f863e2-2df6-4894-99c0-c11b3f379b7a', 'd1d58d1a-bdff-4800-94d1-132d839378c3', 0, 'Sigma C-H (or C-C) bond into an adjacent empty or partially empty p-orbital or pi system');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d3eca82-0382-4e4e-b2dd-62f9242aee81', 'd1d58d1a-bdff-4800-94d1-132d839378c3', 1, 'Lone pair on a highly electronegative atom into a sigma bond exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('13159f69-1af6-4b9a-943a-643e75e04619', 'd1d58d1a-bdff-4800-94d1-132d839378c3', 2, 'Pi bond into another, completely unrelated pi bond only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('448b7725-d3ed-47e3-863d-a5000835252d', 'd1d58d1a-bdff-4800-94d1-132d839378c3', 3, 'Nucleus into an orbital');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d1d58d1a-bdff-4800-94d1-132d839378c3', '95f863e2-2df6-4894-99c0-c11b3f379b7a', 'Hyperconjugation involves the delocalization/donation of electron density from a filled sigma bonding orbital (typically adjacent C-H or C-C) into an adjacent empty or partially filled orbital (like a carbocation''s empty p-orbital or a pi system), providing extra stabilization — important in explaining relative carbocation and alkene stability.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('de4ea5bd-57b9-4154-a9d5-ea3859e7d912', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 57, 'Conformational isomers of ethane, such as the staggered and eclipsed forms, arise due to:', 'Chemistry', 'Hydrocarbons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37f14fd4-aaab-4117-93fd-f0df740e59a4', 'de4ea5bd-57b9-4154-a9d5-ea3859e7d912', 0, 'Breaking and reforming of covalent bonds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb9922cc-6618-455d-8418-3bd6194e8a8f', 'de4ea5bd-57b9-4154-a9d5-ea3859e7d912', 1, 'Free rotation around the C-C single (sigma) bond, without breaking any bonds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('165ef96b-6034-4c33-bcad-73016a63f968', 'de4ea5bd-57b9-4154-a9d5-ea3859e7d912', 2, 'Different molecular formulas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('763c069a-e7a4-4f6f-8a07-cc198887a068', 'de4ea5bd-57b9-4154-a9d5-ea3859e7d912', 3, 'The presence of a double bond restricting rotation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('de4ea5bd-57b9-4154-a9d5-ea3859e7d912', 'cb9922cc-6618-455d-8418-3bd6194e8a8f', 'Conformers are generated by rotation around single (sigma) bonds, which can occur relatively freely without breaking any bonds — the staggered conformation (lower energy, less steric/torsional strain) and eclipsed conformation (higher energy) of ethane are classic examples.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('fc947906-2cfd-4026-8265-e71426a97b35', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 58, 'Biochemical Oxygen Demand (BOD) values are typically low in:', 'Chemistry', 'Environmental Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7149801-dda8-4c20-ac3f-9f85b353341a', 'fc947906-2cfd-4026-8265-e71426a97b35', 0, 'Heavily polluted water bodies containing large amounts of biodegradable organic waste');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f41d1a1-c9f5-420f-99cf-6caef596bd47', 'fc947906-2cfd-4026-8265-e71426a97b35', 1, 'Clean, relatively unpolluted water');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e028c37-3ad9-41ba-bfb3-0c8a7d9debb9', 'fc947906-2cfd-4026-8265-e71426a97b35', 2, 'Water saturated with industrial sewage');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c23524a-ab29-45e8-9b4d-c1e0406fbe3e', 'fc947906-2cfd-4026-8265-e71426a97b35', 3, 'Water with no dissolved oxygen at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fc947906-2cfd-4026-8265-e71426a97b35', '5f41d1a1-c9f5-420f-99cf-6caef596bd47', 'Clean water has a low BOD, since there is little organic pollutant matter requiring microbial decomposition (and hence little oxygen consumption); heavily polluted water with abundant organic waste has a correspondingly high BOD.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('59313f15-deb1-4dda-94b1-5b33f0d81cac', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 59, 'Semiconductors, in terms of their electronic band structure, are characterized by a band gap that is:', 'Chemistry', 'Solid State');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f62b292d-3e0a-4643-9b36-f6d78e570017', '59313f15-deb1-4dda-94b1-5b33f0d81cac', 0, 'Extremely large, exactly like insulators, making conduction impossible under any condition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('233f6fcf-ca34-4f10-9f74-c94fdba66f49', '59313f15-deb1-4dda-94b1-5b33f0d81cac', 1, 'Relatively small, allowing some electrons to be thermally excited across it into the conduction band at ordinary temperatures');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1f297f8-902c-4139-a93c-f7a6a459a6eb', '59313f15-deb1-4dda-94b1-5b33f0d81cac', 2, 'Completely absent, with valence and conduction bands overlapping, exactly like a metal/conductor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f9f2f9a-fff3-4753-b0cb-85b6db0d248a', '59313f15-deb1-4dda-94b1-5b33f0d81cac', 3, 'Negative in value');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('59313f15-deb1-4dda-94b1-5b33f0d81cac', '233f6fcf-ca34-4f10-9f74-c94fdba66f49', 'Semiconductors have a relatively small band gap between valence and conduction bands (compared to insulators'' large gap), allowing a modest number of electrons to be thermally excited into the conduction band at normal temperatures, giving them intermediate conductivity between insulators and conductors.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7e702c99-b400-498a-90ac-5ac1b6c6a4ae', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 60, 'The van''t Hoff factor (i) for a solute that dissociates completely into n ions in solution is:', 'Chemistry', 'Solutions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5ddee3b3-9c65-4d0b-a02c-42186f402df5', '7e702c99-b400-498a-90ac-5ac1b6c6a4ae', 0, 'Always exactly 1, regardless of dissociation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('959c4b7a-865f-49c7-9008-21ce9c94cb84', '7e702c99-b400-498a-90ac-5ac1b6c6a4ae', 1, 'Equal to n, the number of ions produced per formula unit upon complete dissociation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cc88ba1-bf5b-4c16-a39a-6d9939d74d7e', '7e702c99-b400-498a-90ac-5ac1b6c6a4ae', 2, 'Always less than 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8532cff4-9d08-4c8c-bcab-ad96b7c49cfc', '7e702c99-b400-498a-90ac-5ac1b6c6a4ae', 3, 'Undefined for ionic compounds');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7e702c99-b400-498a-90ac-5ac1b6c6a4ae', '959c4b7a-865f-49c7-9008-21ce9c94cb84', 'The van''t Hoff factor accounts for the actual number of particles a solute produces in solution; for complete dissociation into n ions (e.g., NaCl into 2 ions), i approaches n, correcting the colligative property formulas (i x normal formula) for this increase in particle count.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('51bc0222-96dc-4b76-b6e2-eed63ca4deec', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 61, 'The Nernst equation relates the electrode potential of a half-cell under non-standard conditions to:', 'Chemistry', 'Electrochemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d484528-c973-42f7-882e-d2ebfd933fbe', '51bc0222-96dc-4b76-b6e2-eed63ca4deec', 0, 'Only the standard electrode potential, with no dependence on concentration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e5e08d6-aa14-45f7-9423-370d3ee5a8d2', '51bc0222-96dc-4b76-b6e2-eed63ca4deec', 1, 'The standard electrode potential and the actual concentrations (activities) of the species involved in the electrode reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('607dd7dc-347e-4862-92e7-5109aa303874', '51bc0222-96dc-4b76-b6e2-eed63ca4deec', 2, 'The temperature alone, with no dependence on concentration or standard potential');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c3ef1a3-7dbf-40fe-9e36-5618731c9b35', '51bc0222-96dc-4b76-b6e2-eed63ca4deec', 3, 'The color of the electrolyte solution');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('51bc0222-96dc-4b76-b6e2-eed63ca4deec', '3e5e08d6-aa14-45f7-9423-370d3ee5a8d2', 'The Nernst equation, E = E-standard - (RT/nF)*ln(Q), calculates the actual electrode (or cell) potential under non-standard conditions, accounting for how the concentrations/activities of the reacting species deviate from standard (1M/1atm) conditions.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('58fe53e0-cf23-4540-84a3-1bda29e37bab', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 62, 'For a second-order reaction, the rate depends on the reactant concentration(s) raised to a total power of:', 'Chemistry', 'Chemical Kinetics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('462dde17-fa0d-4e32-824f-dbb1a98cca92', '58fe53e0-cf23-4540-84a3-1bda29e37bab', 0, 'Zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d2d7a06-ef28-4c79-94f8-9321bb390d8a', '58fe53e0-cf23-4540-84a3-1bda29e37bab', 1, 'One');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5921deec-1c12-403a-b687-9523bdb4e870', '58fe53e0-cf23-4540-84a3-1bda29e37bab', 2, 'Two');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44bfd712-d21f-4791-9b31-1594c44f7791', '58fe53e0-cf23-4540-84a3-1bda29e37bab', 3, 'Three');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('58fe53e0-cf23-4540-84a3-1bda29e37bab', '5921deec-1c12-403a-b687-9523bdb4e870', 'A second-order reaction has a rate law where the sum of the exponents on concentration terms equals 2 — this could be second order in a single reactant ([A]^2) or first order in each of two different reactants ([A][B]).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a0f6c1f5-8d58-424d-b973-f26768d9e1a8', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 63, 'The Langmuir adsorption isotherm, unlike the empirical Freundlich isotherm, is a theoretical model that assumes:', 'Chemistry', 'Surface Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f2d5cb4a-dc55-454e-80b8-994e7456bd80', 'a0f6c1f5-8d58-424d-b973-f26768d9e1a8', 0, 'Adsorption can continue indefinitely with no upper limit');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b49c9d66-2f6d-4b6d-99cc-012f5145bda6', 'a0f6c1f5-8d58-424d-b973-f26768d9e1a8', 1, 'A fixed number of adsorption sites on the surface, with adsorption reaching a maximum (saturation) as all sites become occupied');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b5b3bdda-e0da-457b-ad17-f9d7a84c3f2c', 'a0f6c1f5-8d58-424d-b973-f26768d9e1a8', 2, 'That adsorption is always chemisorption, never physisorption');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7fa6e492-ad8a-4c7f-8f08-2e5e02eeca9b', 'a0f6c1f5-8d58-424d-b973-f26768d9e1a8', 3, 'That temperature has no effect on adsorption at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a0f6c1f5-8d58-424d-b973-f26768d9e1a8', 'b49c9d66-2f6d-4b6d-99cc-012f5145bda6', 'The Langmuir model assumes a finite, fixed number of equivalent surface adsorption sites, with the amount adsorbed increasing with pressure/concentration but leveling off at a maximum saturation value once all sites are occupied — unlike the purely empirical Freundlich isotherm, which lacks this saturation limit.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5901c6e7-0ee9-4329-9682-645a8fd0e07b', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 64, 'Refining by electrolysis (electrorefining), used to purify metals like copper, involves depositing pure metal at the:', 'Chemistry', 'General Principles of Isolation of Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae6b05ee-fef5-4851-9bd3-bc3401e51dfa', '5901c6e7-0ee9-4329-9682-645a8fd0e07b', 0, 'Anode, while impure metal is deposited at the cathode');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8b3271d7-30cd-4a33-bb36-eb67905ce696', '5901c6e7-0ee9-4329-9682-645a8fd0e07b', 1, 'Cathode, using an impure metal anode that dissolves into solution, while more noble impurities fall as anode mud/sludge');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6807454c-7426-4334-bca1-4b9f71070e8b', '5901c6e7-0ee9-4329-9682-645a8fd0e07b', 2, 'Neither electrode; purification happens only in the electrolyte solution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('84f17631-0496-48aa-a250-e562acd0c972', '5901c6e7-0ee9-4329-9682-645a8fd0e07b', 3, 'Both electrodes simultaneously with equal purity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5901c6e7-0ee9-4329-9682-645a8fd0e07b', '8b3271d7-30cd-4a33-bb36-eb67905ce696', 'In electrorefining, an impure metal anode dissolves into the electrolyte, and pure metal ions are selectively deposited (reduced) at the cathode; less noble impurities also dissolve but stay in solution (or are precipitated separately), while more noble impurities fall to the bottom as anode mud, which can itself be a valuable byproduct.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('868fc13e-71b0-4850-8a73-be7a6625344a', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 65, 'Nitrogen gas (N2) is relatively unreactive at room temperature primarily due to:', 'Chemistry', 'p-Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4169b77b-257b-42c8-882f-c0b484be94af', '868fc13e-71b0-4850-8a73-be7a6625344a', 0, 'Its low molecular mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e4637b79-87ba-4f86-ab00-b9e2998c01cb', '868fc13e-71b0-4850-8a73-be7a6625344a', 1, 'The very strong triple bond between the two nitrogen atoms, which requires substantial energy to break');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa4532b6-5087-4e9a-9be3-dd346622d3ba', '868fc13e-71b0-4850-8a73-be7a6625344a', 2, 'The complete absence of any lone pairs on nitrogen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5c640ca4-2afb-424a-b390-1b586d1b4960', '868fc13e-71b0-4850-8a73-be7a6625344a', 3, 'Nitrogen having a negative electronegativity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('868fc13e-71b0-4850-8a73-be7a6625344a', 'e4637b79-87ba-4f86-ab00-b9e2998c01cb', 'N2''s strong N-N triple bond (one sigma, two pi bonds) has a very high bond dissociation energy, making nitrogen gas kinetically quite inert at ordinary temperatures despite its thermodynamically favorable reactions with many elements (e.g., forming ammonia) under more energetic conditions.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0c5986bc-a6f9-4aad-8230-a56ca0d385e4', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 66, 'The lanthanoids (rare earth elements) are grouped separately from the main d-block transition series primarily because they involve the progressive filling of:', 'Chemistry', 'd and f Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ebf39959-525b-4120-a0b7-928c3fea3bf6', '0c5986bc-a6f9-4aad-8230-a56ca0d385e4', 0, 'The 3d orbitals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9ac11bf5-66c1-44e6-8ca2-54e2024ffa16', '0c5986bc-a6f9-4aad-8230-a56ca0d385e4', 1, 'The 4f orbitals, while the 5d and 6s orbitals remain largely unchanged in occupancy across the series');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55e38b06-b90b-4f42-8877-0ae6a622a1e5', '0c5986bc-a6f9-4aad-8230-a56ca0d385e4', 2, 'The 2p orbitals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e123521f-222d-4fa3-a6b3-44ba04d33485', '0c5986bc-a6f9-4aad-8230-a56ca0d385e4', 3, 'The 1s orbital');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0c5986bc-a6f9-4aad-8230-a56ca0d385e4', '9ac11bf5-66c1-44e6-8ca2-54e2024ffa16', 'Lanthanoids are an f-block series characterized by the progressive filling of the inner 4f orbitals, distinguishing them from the d-block transition series (where d orbitals are progressively filled) — despite their placement, they are chemically distinct from typical transition metals in several respects.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('183a7aff-99c0-4cc0-8f47-0567d21ad61c', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 67, 'Crystal field theory explains the color of many transition metal complexes as arising from:', 'Chemistry', 'Coordination Compounds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a4871a05-2822-4213-8c59-8ecc19f61533', '183a7aff-99c0-4cc0-8f47-0567d21ad61c', 0, 'Vibrations of the metal nucleus alone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77be74bf-fd19-46c2-baa1-9d7d29e43603', '183a7aff-99c0-4cc0-8f47-0567d21ad61c', 1, 'Electronic transitions of d-electrons between the split d-orbital energy levels (t2g and eg) created by the surrounding ligand field');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfe5d19d-1567-44aa-8909-a9fddd228c1c', '183a7aff-99c0-4cc0-8f47-0567d21ad61c', 2, 'The color of the ligands themselves being directly transferred to the complex');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('19fb7eb2-0252-4361-8c0e-949205963ba9', '183a7aff-99c0-4cc0-8f47-0567d21ad61c', 3, 'The complex''s overall molecular mass');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('183a7aff-99c0-4cc0-8f47-0567d21ad61c', '77be74bf-fd19-46c2-baa1-9d7d29e43603', 'Crystal field theory explains that surrounding ligands split the otherwise degenerate d-orbitals into different energy levels; electronic transitions of d-electrons between these split levels (d-d transitions), upon absorbing specific visible-light wavelengths, produce the characteristic colors of many transition metal complexes.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('79c5e122-5291-4785-ae59-419de8f0cf92', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 68, 'Optical activity (chirality) can arise in certain substituted haloalkanes when the carbon bearing the halogen is attached to:', 'Chemistry', 'Haloalkanes and Haloarenes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8de9c41d-2504-4a6d-9c13-2233b05d745b', '79c5e122-5291-4785-ae59-419de8f0cf92', 0, 'Four identical groups');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cee9a731-0ebd-414e-8276-1902c9261fcd', '79c5e122-5291-4785-ae59-419de8f0cf92', 1, 'Four different groups, making it a chiral (asymmetric) centre with no internal plane of symmetry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('040bfb0e-8ca8-4267-a7ee-284dbae4575f', '79c5e122-5291-4785-ae59-419de8f0cf92', 2, 'Only two groups total');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44167d7a-b3a8-43cc-a649-87f09140c3a6', '79c5e122-5291-4785-ae59-419de8f0cf92', 3, 'A double bond to another carbon');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('79c5e122-5291-4785-ae59-419de8f0cf92', 'cee9a731-0ebd-414e-8276-1902c9261fcd', 'A carbon atom bonded to four different substituent groups is a chiral (asymmetric) centre, lacking any internal plane of symmetry, and such a molecule can exist as two non-superimposable mirror-image forms (enantiomers) exhibiting optical activity.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('fca1b5b7-78b5-4927-b535-8e376a28c479', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 69, 'Dehydration of an alcohol to form an alkene, typically using concentrated sulfuric acid or phosphoric acid, generally follows:', 'Chemistry', 'Alcohols, Phenols and Ethers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3227b9ee-3cbf-457d-a65a-cf3aba4495ea', 'fca1b5b7-78b5-4927-b535-8e376a28c479', 0, 'The Hofmann rule exclusively, giving the least substituted alkene');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b76098c3-5c3c-4f91-8aff-382a4f1cc053', 'fca1b5b7-78b5-4927-b535-8e376a28c479', 1, 'Markovnikov/Zaitsev''s rule, generally favoring formation of the more substituted (more stable) alkene as the major product');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('71197474-3009-452f-bfc5-b11f26729c06', 'fca1b5b7-78b5-4927-b535-8e376a28c479', 2, 'No particular regiochemical preference at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bac4d763-3ad4-4252-a2d4-783b9afd8efc', 'fca1b5b7-78b5-4927-b535-8e376a28c479', 3, 'Only occurs with tertiary alcohols, never primary or secondary');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fca1b5b7-78b5-4927-b535-8e376a28c479', 'b76098c3-5c3c-4f91-8aff-382a4f1cc053', 'Acid-catalyzed dehydration of alcohols (typically via an E1 mechanism for secondary/tertiary alcohols) generally follows Zaitsev''s rule, favoring the more substituted, more thermodynamically stable alkene as the major product.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('708fa744-5be4-4036-bac4-619f26747a1d', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 70, 'The acidity of carboxylic acids is generally much greater than that of alcohols with a similar carbon skeleton, primarily because:', 'Chemistry', 'Aldehydes, Ketones and Carboxylic Acids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b6da0046-638a-461a-a711-aa7657ac4f2c', '708fa744-5be4-4036-bac4-619f26747a1d', 0, 'The carboxylate anion formed after deprotonation is stabilized by resonance delocalization of the negative charge over both oxygen atoms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f2870cb-8f4e-4548-bfd3-960431a0451f', '708fa744-5be4-4036-bac4-619f26747a1d', 1, 'Carboxylic acids have a much higher molecular mass');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d93be0a2-e253-4c7a-8d66-2139e13aff6a', '708fa744-5be4-4036-bac4-619f26747a1d', 2, 'Alcohols have no acidic hydrogen at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('faf55abd-0fd4-48db-a857-f104dde4666e', '708fa744-5be4-4036-bac4-619f26747a1d', 3, 'Carboxylic acids contain more carbon atoms');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('708fa744-5be4-4036-bac4-619f26747a1d', 'b6da0046-638a-461a-a711-aa7657ac4f2c', 'Deprotonation of a carboxylic acid gives a resonance-stabilized carboxylate ion (with the negative charge delocalized equally over both oxygen atoms), significantly stabilizing the conjugate base and making carboxylic acids far more acidic than alcohols, whose alkoxide conjugate base has no comparable resonance stabilization.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4aced1e5-7b0e-41ab-8d9a-fca8b6bd329d', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 71, 'The carbylamine (isocyanide) test, used to distinguish primary amines from secondary and tertiary amines, involves treating the amine with chloroform and:', 'Chemistry', 'Amines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c308f3a-d443-461a-867b-1978495a9c29', '4aced1e5-7b0e-41ab-8d9a-fca8b6bd329d', 0, 'Dilute hydrochloric acid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('821dd9ae-4684-405c-bc54-0c6d218d0e19', '4aced1e5-7b0e-41ab-8d9a-fca8b6bd329d', 1, 'Alcoholic potassium hydroxide, producing a foul-smelling isocyanide only with primary amines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b169c89-c756-4131-bff5-169e86216441', '4aced1e5-7b0e-41ab-8d9a-fca8b6bd329d', 2, 'Concentrated sulfuric acid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dc79515f-15d7-4b83-b794-22581c7fb4b0', '4aced1e5-7b0e-41ab-8d9a-fca8b6bd329d', 3, 'Sodium metal');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4aced1e5-7b0e-41ab-8d9a-fca8b6bd329d', '821dd9ae-4684-405c-bc54-0c6d218d0e19', 'The carbylamine test is specific to primary amines: treatment with chloroform and alcoholic KOH produces a characteristically foul-smelling alkyl isocyanide (carbylamine); secondary and tertiary amines do not give this positive test, making it a useful distinguishing reaction.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('92e3e369-1ecf-4353-9f91-b62173018dcd', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 72, 'Essential amino acids are defined as those that:', 'Chemistry', 'Biomolecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44f31fe5-e34d-42b8-a349-ec207f804c6c', '92e3e369-1ecf-4353-9f91-b62173018dcd', 0, 'The human body can synthesize in unlimited quantities internally');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e72dcb57-0b7d-4b5f-a1e7-a787bc67ec26', '92e3e369-1ecf-4353-9f91-b62173018dcd', 1, 'Cannot be synthesized by the body in sufficient quantities and must be obtained through the diet');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4d6ea2e8-e41a-40be-80db-e851acff478e', '92e3e369-1ecf-4353-9f91-b62173018dcd', 2, 'Are not actually used in protein synthesis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73666fc3-34db-457f-ba5c-41fc68cddbc3', '92e3e369-1ecf-4353-9f91-b62173018dcd', 3, 'Are only found in plant-based foods');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('92e3e369-1ecf-4353-9f91-b62173018dcd', 'e72dcb57-0b7d-4b5f-a1e7-a787bc67ec26', 'Essential amino acids cannot be synthesized by the human body (or not in sufficient amounts) and must therefore be supplied through dietary intake, unlike non-essential amino acids, which the body can synthesize internally as needed.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9660291b-9144-4a30-82f3-26abe3fbcb2f', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 73, 'Thermoplastic polymers, unlike thermosetting polymers, are characterized by the ability to:', 'Chemistry', 'Polymers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('191c6b03-8f44-4462-93ce-1438564005d8', '9660291b-9144-4a30-82f3-26abe3fbcb2f', 0, 'Undergo a permanent, irreversible chemical change upon heating, setting into a rigid, unmeltable shape');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e64e71d6-1d01-4a16-b65d-e2d6b79cdeee', '9660291b-9144-4a30-82f3-26abe3fbcb2f', 1, 'Be repeatedly softened by heating and hardened by cooling, without undergoing significant permanent chemical change');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0015969-25dc-4703-85d6-9b2cd949d2f4', '9660291b-9144-4a30-82f3-26abe3fbcb2f', 2, 'Only exist in a liquid state at room temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('396b5a39-6fd3-4f6f-81c9-366e5e304bb2', '9660291b-9144-4a30-82f3-26abe3fbcb2f', 3, 'Dissolve completely in any solvent');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9660291b-9144-4a30-82f3-26abe3fbcb2f', 'e64e71d6-1d01-4a16-b65d-e2d6b79cdeee', 'Thermoplastics can be repeatedly melted/softened by heating and re-solidified by cooling (a physical, largely reversible change), unlike thermosetting polymers, which undergo an irreversible cross-linking chemical reaction upon initial heating/curing, permanently fixing their shape.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b4612674-75d5-4716-9a06-225c4de19d3e', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 74, 'Detergents, unlike traditional soaps, are particularly effective for washing in hard water because:', 'Chemistry', 'Chemistry in Everyday Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca0fe715-0775-427c-aa28-4cd30794ac67', 'b4612674-75d5-4716-9a06-225c4de19d3e', 0, 'They form the same insoluble precipitates with calcium/magnesium ions that soaps do');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d9561e8e-990d-42fc-b3f2-c77e8c224709', 'b4612674-75d5-4716-9a06-225c4de19d3e', 1, 'Their calcium and magnesium salts remain soluble in water, avoiding the scum/precipitate formation that soaps experience in hard water');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36d64ed8-ff61-4cf4-9a1f-1835342100e9', 'b4612674-75d5-4716-9a06-225c4de19d3e', 2, 'They cannot dissolve in water at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6024dcbb-9133-43b0-bed6-e2e57bcb752d', 'b4612674-75d5-4716-9a06-225c4de19d3e', 3, 'They are always more expensive than soap, with no functional advantage');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b4612674-75d5-4716-9a06-225c4de19d3e', 'd9561e8e-990d-42fc-b3f2-c77e8c224709', 'Unlike soap (sodium/potassium salts of fatty acids), whose calcium/magnesium salts are insoluble and form scum in hard water, synthetic detergents'' calcium/magnesium salts remain soluble, allowing them to clean effectively even in hard water without this precipitation problem.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f9d723c6-0b75-4f38-b7b0-b1b45b3a9564', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 75, 'The bond dissociation enthalpy of a covalent bond is defined as the energy required to:', 'Chemistry', 'Chemical Bonding and Molecular Structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('740bed1e-84f5-4279-911b-63a78ec609b0', 'f9d723c6-0b75-4f38-b7b0-b1b45b3a9564', 0, 'Form the bond from two separate atoms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c176d75-5c49-4bbc-a825-a853ca2c2ba7', 'f9d723c6-0b75-4f38-b7b0-b1b45b3a9564', 1, 'Break one mole of a particular covalent bond in the gaseous state, producing gaseous fragments');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('009b2a5b-15cc-481d-860e-214ce3456f18', 'f9d723c6-0b75-4f38-b7b0-b1b45b3a9564', 2, 'Change the bond''s polarity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b65daa35-da04-443d-b019-25802e9ed586', 'f9d723c6-0b75-4f38-b7b0-b1b45b3a9564', 3, 'Melt the entire compound containing that bond');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f9d723c6-0b75-4f38-b7b0-b1b45b3a9564', '1c176d75-5c49-4bbc-a825-a853ca2c2ba7', 'Bond dissociation enthalpy is the energy required to homolytically cleave one mole of a specific covalent bond in gaseous molecules, producing gaseous atoms/fragments — always a positive (energy-absorbing) value, since breaking bonds requires energy input.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('87c23466-5093-482f-95fc-68bd6aa421bf', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 76, 'Gibbs free energy (G) combines both enthalpy and entropy terms; the relationship delta G = delta H - T*delta S allows prediction of:', 'Chemistry', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('36132160-9b53-4ce4-a45d-59b79aa58813', '87c23466-5093-482f-95fc-68bd6aa421bf', 0, 'Only the reaction''s rate, not its spontaneity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ff7935a0-23bc-4151-bcce-55ec4032b5fb', '87c23466-5093-482f-95fc-68bd6aa421bf', 1, 'The spontaneity of a process at constant temperature and pressure — negative delta G indicates a spontaneous process');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('61dd84d7-94cb-41c4-a087-d404d1503d59', '87c23466-5093-482f-95fc-68bd6aa421bf', 2, 'Only the color change during a reaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d80d8936-2317-4b67-9b41-f00e94f4c5a4', '87c23466-5093-482f-95fc-68bd6aa421bf', 3, 'The exact mechanism of a reaction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('87c23466-5093-482f-95fc-68bd6aa421bf', 'ff7935a0-23bc-4151-bcce-55ec4032b5fb', 'Gibbs free energy change determines thermodynamic spontaneity at constant T and P: delta G < 0 indicates a spontaneous process, delta G > 0 indicates non-spontaneity (under the stated conditions), and delta G = 0 indicates equilibrium — importantly, this says nothing about the reaction''s actual rate/kinetics.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('022c938a-8b2e-4f3e-9e5c-96add6f55ffd', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 77, 'An oxidizing agent, in a redox reaction, is the substance that:', 'Chemistry', 'Redox Reactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('324f31da-16f9-42af-9115-e5204fa6b02b', '022c938a-8b2e-4f3e-9e5c-96add6f55ffd', 0, 'Loses electrons and is itself oxidized');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1adeef9-e981-4d82-b697-6b690275b114', '022c938a-8b2e-4f3e-9e5c-96add6f55ffd', 1, 'Gains electrons and is itself reduced, thereby causing oxidation of another substance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a74dc0cd-2166-46ad-bdce-197e079b2c4a', '022c938a-8b2e-4f3e-9e5c-96add6f55ffd', 2, 'Never participates in electron transfer');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('431a9d12-417a-42a0-aead-7e60a3b2efa1', '022c938a-8b2e-4f3e-9e5c-96add6f55ffd', 3, 'Always contains only nonmetals');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('022c938a-8b2e-4f3e-9e5c-96add6f55ffd', 'b1adeef9-e981-4d82-b697-6b690275b114', 'An oxidizing agent gains electrons (is reduced) during the reaction, while simultaneously causing the other reactant to lose electrons (be oxidized) — the oxidizing agent''s own reduction is the mechanism by which it ''oxidizes'' the other species.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0fdc9a52-8016-4ddf-ab7b-6b58c29f8d46', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 78, 'The alkali metals are stored under an inert medium (like kerosene or mineral oil) rather than simply in a sealed dry container because:', 'Chemistry', 's-Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('39dbdc35-7580-4841-bcde-90c2b53b1640', '0fdc9a52-8016-4ddf-ab7b-6b58c29f8d46', 0, 'Their extreme reactivity with even trace atmospheric moisture/oxygen requires physical isolation, not just dryness');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77c5721e-7685-4274-b2ba-397fbe33654c', '0fdc9a52-8016-4ddf-ab7b-6b58c29f8d46', 1, 'Kerosene chemically neutralizes their reactivity permanently');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0b29136-b978-477a-a3d5-9ce34b920b67', '0fdc9a52-8016-4ddf-ab7b-6b58c29f8d46', 2, 'They evaporate quickly if not submerged in a liquid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b78b46ec-2ae2-42c3-8858-bbf200cd5311', '0fdc9a52-8016-4ddf-ab7b-6b58c29f8d46', 3, 'It has no functional purpose, purely a historical convention');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0fdc9a52-8016-4ddf-ab7b-6b58c29f8d46', '39dbdc35-7580-4841-bcde-90c2b53b1640', 'Alkali metals are so reactive that even minimal exposure to atmospheric moisture or oxygen (which could occur inside any container not perfectly sealed) causes vigorous reaction; physically submerging them under an inert liquid like kerosene provides a much more reliable barrier against this exposure.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8e75999a-f6b9-4568-b54d-f286610b231f', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 79, 'A nucleophilic substitution reaction proceeding via the SN2 mechanism is characterized kinetically as:', 'Chemistry', 'Organic Chemistry — Basic Principles');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e5d89a5-6be9-495f-9c09-d3f42eaaa4e7', '8e75999a-f6b9-4568-b54d-f286610b231f', 0, 'First order overall, depending only on substrate concentration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4962581c-d4a2-439f-b95c-0b6d7243b11e', '8e75999a-f6b9-4568-b54d-f286610b231f', 1, 'Second order overall — first order in both the substrate and the nucleophile, since both participate in the single rate-determining step');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80884150-389d-4b23-bdc3-544b7998689b', '8e75999a-f6b9-4568-b54d-f286610b231f', 2, 'Zero order, independent of any reactant concentration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e95ae65-e302-483c-8f4e-a597509400bd', '8e75999a-f6b9-4568-b54d-f286610b231f', 3, 'Third order in the nucleophile alone');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8e75999a-f6b9-4568-b54d-f286610b231f', '4962581c-d4a2-439f-b95c-0b6d7243b11e', 'SN2 reactions proceed through a single concerted step where the nucleophile directly attacks the substrate as the leaving group departs; the rate therefore depends on the concentration of both reactants, making the overall reaction second order (first order in each).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ee5a2f0d-929f-4218-ae94-67d205b21ccf', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 80, 'The mole fraction of a component in a solution is defined as the ratio of:', 'Chemistry', 'Some Basic Concepts of Chemistry');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3bcb2400-2155-4a32-92f5-90713780e999', 'ee5a2f0d-929f-4218-ae94-67d205b21ccf', 0, 'The mass of that component to the total mass of the solution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d27c9cba-c9d3-443e-b82e-663f1df0068f', 'ee5a2f0d-929f-4218-ae94-67d205b21ccf', 1, 'The number of moles of that component to the total number of moles of all components in the solution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cb603214-0b46-4173-974a-a6f53ae3fea1', 'ee5a2f0d-929f-4218-ae94-67d205b21ccf', 2, 'The volume of that component to the total volume');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b2feea2d-4f89-4238-b416-c8b8d3140592', 'ee5a2f0d-929f-4218-ae94-67d205b21ccf', 3, 'The molarity of that component to the total molarity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ee5a2f0d-929f-4218-ae94-67d205b21ccf', 'd27c9cba-c9d3-443e-b82e-663f1df0068f', 'Mole fraction (x) of a component = moles of that component / total moles of all components present in the mixture — a dimensionless, temperature-independent way of expressing concentration.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('bdf997db-8247-4239-b532-7a0387d91078', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 81, 'The number of orbitals present in a given subshell with azimuthal quantum number l is given by:', 'Chemistry', 'Structure of Atom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e1f0e980-9aad-43cf-ba80-3bbacd9fbd6c', 'bdf997db-8247-4239-b532-7a0387d91078', 0, 'l');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d193c939-afa7-423c-9ef7-f18d2db0f3cb', 'bdf997db-8247-4239-b532-7a0387d91078', 1, '2l');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db361ed2-fc80-49b9-b97c-6cbb3b970f41', 'bdf997db-8247-4239-b532-7a0387d91078', 2, '2l + 1');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6551e1e5-3dc2-46be-963b-2dbbe98e5616', 'bdf997db-8247-4239-b532-7a0387d91078', 3, 'l^2');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bdf997db-8247-4239-b532-7a0387d91078', 'db361ed2-fc80-49b9-b97c-6cbb3b970f41', 'The number of orbitals in a subshell equals 2l+1 (corresponding to the allowed range of magnetic quantum number m_l from -l to +l) — e.g., for l=1 (p subshell), there are 2(1)+1 = 3 orbitals.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('57b9db20-f520-4bd2-aa59-ab538fa91934', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 82, 'Among the halogens (Group 17), fluorine has an anomalously LOW electron affinity compared to chlorine, primarily attributed to:', 'Chemistry', 'Classification of Elements and Periodicity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('59a237fb-a6d8-4783-adc5-8a6d98c98a70', '57b9db20-f520-4bd2-aa59-ab538fa91934', 0, 'Fluorine''s very large atomic size');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e2740f57-a1ef-4ed5-911b-af7bf2903049', '57b9db20-f520-4bd2-aa59-ab538fa91934', 1, 'Fluorine''s very small atomic size, causing significant electron-electron repulsion in its already compact 2p subshell when an additional electron is added');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('042cbc71-9f0e-4299-86bd-64e95e031e60', '57b9db20-f520-4bd2-aa59-ab538fa91934', 2, 'Fluorine having a lower nuclear charge than chlorine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c59ef30-64f2-4dee-b078-d6afa03385fc', '57b9db20-f520-4bd2-aa59-ab538fa91934', 3, 'Fluorine''s high electronegativity, which is unrelated to electron affinity');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('57b9db20-f520-4bd2-aa59-ab538fa91934', 'e2740f57-a1ef-4ed5-911b-af7bf2903049', 'Fluorine''s unusually small atomic radius means the incoming electron experiences significant repulsion from the already densely packed electrons in its compact 2p subshell, partially offsetting the expected electron affinity trend and making it lower than chlorine''s.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ddcd1d9f-62c1-4a51-a3fb-70623200f399', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 83, 'A spontaneous process, once it begins, proceeds:', 'Chemistry', 'Thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bf860937-eafe-4020-8fcd-245a4d5f03a8', 'ddcd1d9f-62c1-4a51-a3fb-70623200f399', 0, 'Only if continuously driven by external energy input at every instant');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d732849-0c43-44c1-b565-0c9d2fdd93fe', 'ddcd1d9f-62c1-4a51-a3fb-70623200f399', 1, 'On its own accord, without needing to be driven continuously by an outside agency (though it may need an initial trigger like activation energy)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('68c1f3cc-9904-4b03-9769-e5189a908a44', 'ddcd1d9f-62c1-4a51-a3fb-70623200f399', 2, 'Only in the reverse direction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f85dbc60-7257-445d-888c-2baefe688094', 'ddcd1d9f-62c1-4a51-a3fb-70623200f399', 3, 'Exclusively at absolute zero temperature');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ddcd1d9f-62c1-4a51-a3fb-70623200f399', '8d732849-0c43-44c1-b565-0c9d2fdd93fe', 'A thermodynamically spontaneous process, once initiated, proceeds on its own without requiring continuous external energy input (though it may need an initial input, like activation energy, to get started — combustion of wood is a classic example, spontaneous once ignited).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('aa2047d2-3c21-4c33-b491-51ba5f8cc10f', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 84, 'Water at 25 degrees Celsius has an ionic product Kw of approximately 10^-14. This value represents the product of:', 'Chemistry', 'Equilibrium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0fd96d0a-0d41-4c4f-81a4-bd56326efe78', 'aa2047d2-3c21-4c33-b491-51ba5f8cc10f', 0, '[H+] and [OH-] concentrations in any aqueous solution at that temperature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46705b80-93e1-4108-9ff6-e99380383e98', 'aa2047d2-3c21-4c33-b491-51ba5f8cc10f', 1, 'Only the concentration of H+ ions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('de60b9d8-dcfd-4384-9636-0dc3cd97cbfc', 'aa2047d2-3c21-4c33-b491-51ba5f8cc10f', 2, 'The molarity of pure water');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('676f3d00-fbdf-40ef-832e-458f3d674f42', 'aa2047d2-3c21-4c33-b491-51ba5f8cc10f', 3, 'The pH and pOH values multiplied together directly');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aa2047d2-3c21-4c33-b491-51ba5f8cc10f', '0fd96d0a-0d41-4c4f-81a4-bd56326efe78', 'Kw = [H+][OH-] = 10^-14 at 25 degrees C, a constant that holds for any aqueous solution at that temperature (not just pure water) — used to relate [H+] and [OH-] and derive pH+pOH=14 at 25 degrees C.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('010c98e5-3f7d-454a-b14b-ed8af44545b4', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 85, 'Standard electrode potential values are used to predict the feasibility of a redox reaction; a reaction is thermodynamically favorable (spontaneous) when the overall cell EMF (E-cell) is:', 'Chemistry', 'Redox Reactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd333871-4adc-4a6d-b038-83cd1bd9abaa', '010c98e5-3f7d-454a-b14b-ed8af44545b4', 0, 'Negative');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab1eb1b1-0316-439f-8bd2-1b47c7c972ce', '010c98e5-3f7d-454a-b14b-ed8af44545b4', 1, 'Positive');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('340f9cb6-636e-4bcb-a365-34a34a59210f', '010c98e5-3f7d-454a-b14b-ed8af44545b4', 2, 'Exactly zero');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0348f4e4-d937-4470-89a7-4e1bbe398661', '010c98e5-3f7d-454a-b14b-ed8af44545b4', 3, 'Independent of E-cell entirely');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('010c98e5-3f7d-454a-b14b-ed8af44545b4', 'ab1eb1b1-0316-439f-8bd2-1b47c7c972ce', 'A redox reaction is thermodynamically spontaneous when the calculated overall cell EMF (E-cell = E-cathode - E-anode) is positive, corresponding to a negative Gibbs free energy change (delta G = -nFE-cell).', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('85899e67-4121-42f7-b04f-d3c15a911952', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 86, 'Boric acid (H3BO3) behaves as a weak, monobasic Lewis acid in water, not by donating a proton directly, but by:', 'Chemistry', 'p-Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('767f521d-9e9b-48d3-a284-7f3d45123801', '85899e67-4121-42f7-b04f-d3c15a911952', 0, 'Releasing H+ ions directly through simple dissociation, like a typical Bronsted acid');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d476268a-acc6-4cfc-9c10-d7c09ccaf6ae', '85899e67-4121-42f7-b04f-d3c15a911952', 1, 'Accepting a hydroxide ion (OH-) from water, thereby releasing a proton (H+) indirectly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7649731-96b9-4c9a-a72e-a658d120f892', '85899e67-4121-42f7-b04f-d3c15a911952', 2, 'Acting purely as a base with no acidic character at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f00a074-08e2-4824-a3be-7f6a6742e0f1', '85899e67-4121-42f7-b04f-d3c15a911952', 3, 'Reacting only with other acids, never with water');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('85899e67-4121-42f7-b04f-d3c15a911952', 'd476268a-acc6-4cfc-9c10-d7c09ccaf6ae', 'Boric acid acts as a Lewis acid, accepting a hydroxide ion from a water molecule (B(OH)3 + H2O -> [B(OH)4]- + H+), rather than directly ionizing to release a proton like a typical Bronsted-Lowry acid — this indirect mechanism is why it behaves as a weak, monobasic acid.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('37f92e4d-540d-450f-a8eb-a676020d508c', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 87, 'Potassium permanganate (KMnO4), a strong oxidizing agent widely used in volumetric analysis, is prepared industrially by the oxidation of:', 'Chemistry', 'd and f Block Elements');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e0b1a16-0308-4f6c-ae52-c04dbe8a6e2a', '37f92e4d-540d-450f-a8eb-a676020d508c', 0, 'Manganese dioxide (MnO2, or pyrolusite ore)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e93d4b25-af68-465f-8a83-f3693cc62e31', '37f92e4d-540d-450f-a8eb-a676020d508c', 1, 'Potassium chloride directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce688803-ae69-46ee-a1c5-a6d638f34e68', '37f92e4d-540d-450f-a8eb-a676020d508c', 2, 'Manganese metal by combustion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74ffb4e4-b176-4203-969f-29926bc6baa7', '37f92e4d-540d-450f-a8eb-a676020d508c', 3, 'Only from naturally occurring KMnO4 deposits, with no synthetic preparation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('37f92e4d-540d-450f-a8eb-a676020d508c', '0e0b1a16-0308-4f6c-ae52-c04dbe8a6e2a', 'KMnO4 is industrially prepared by fusing pyrolusite (MnO2) with an alkali (like KOH) in the presence of an oxidant to form potassium manganate, which is then oxidized (often electrolytically) to potassium permanganate.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1311b6a3-fa77-4eee-9892-c95db7d99d95', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 88, 'The oxidation state of the central metal ion in the complex [Fe(CN)6]^4- is:', 'Chemistry', 'Coordination Compounds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('53d25bed-278a-4bdb-baa9-6056205ba584', '1311b6a3-fa77-4eee-9892-c95db7d99d95', 0, '+2');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('edbbb3f2-f7cd-4a22-8d79-4a6f43f0f952', '1311b6a3-fa77-4eee-9892-c95db7d99d95', 1, '+3');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b6020fb-bf87-4655-94d0-2776c479a82f', '1311b6a3-fa77-4eee-9892-c95db7d99d95', 2, '+4');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4a292ac7-a684-4050-bbc7-fcc25539cbc7', '1311b6a3-fa77-4eee-9892-c95db7d99d95', 3, '+6');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1311b6a3-fa77-4eee-9892-c95db7d99d95', '53d25bed-278a-4bdb-baa9-6056205ba584', 'Each CN- ligand carries a -1 charge (6 x -1 = -6); for the overall complex charge of -4, x + (-6) = -4, giving x = +2 for iron in this hexacyanoferrate(II) complex.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('57b05db6-7550-4a10-a661-b9eb0a3f7890', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 89, 'Fibrous proteins, such as keratin and collagen, typically function primarily as:', 'Chemistry', 'Biomolecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a34ca49-062b-42bf-a9ac-fd9e76cf8638', '57b05db6-7550-4a10-a661-b9eb0a3f7890', 0, 'Enzymes catalyzing metabolic reactions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9fe7e4c1-344a-4c1d-8f97-e8043d573105', '57b05db6-7550-4a10-a661-b9eb0a3f7890', 1, 'Structural proteins, providing mechanical strength and support to tissues');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ac36ac2e-f4bc-4e23-9251-ecf2a4d6bcea', '57b05db6-7550-4a10-a661-b9eb0a3f7890', 2, 'Hormones regulating metabolism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67e852df-9583-4dcd-8c5e-4bc263951809', '57b05db6-7550-4a10-a661-b9eb0a3f7890', 3, 'Transport proteins carrying oxygen');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('57b05db6-7550-4a10-a661-b9eb0a3f7890', '9fe7e4c1-344a-4c1d-8f97-e8043d573105', 'Fibrous proteins like keratin (hair, nails) and collagen (connective tissue) have elongated, often rope-like structures that provide mechanical strength, structural support, and protection — distinct from globular proteins like enzymes and hormones, which perform more dynamic biochemical functions.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ff601d83-4e24-47dc-83ce-02c0cc487320', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 90, 'Teflon (polytetrafluoroethylene, PTFE), a well-known fluorine-containing polymer, is valued industrially for its:', 'Chemistry', 'Polymers');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('87ecc980-ae8a-4382-8303-eaf8934d89ad', 'ff601d83-4e24-47dc-83ce-02c0cc487320', 0, 'High chemical reactivity and low thermal stability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('272e2377-b9ca-48a5-a514-1a729dc145f9', 'ff601d83-4e24-47dc-83ce-02c0cc487320', 1, 'Excellent chemical inertness, non-stick properties, and high thermal stability');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1af0d017-dad0-4e0c-b159-7cc32789b36a', 'ff601d83-4e24-47dc-83ce-02c0cc487320', 2, 'Biodegradability, breaking down rapidly in the environment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77c3c656-0609-4d58-9baf-152229d895ca', 'ff601d83-4e24-47dc-83ce-02c0cc487320', 3, 'Water solubility, dissolving readily for easy application');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ff601d83-4e24-47dc-83ce-02c0cc487320', '272e2377-b9ca-48a5-a514-1a729dc145f9', 'Teflon (PTFE) is prized for its exceptional chemical inertness (resisting attack by most chemicals), very low surface friction (its ''non-stick'' property), and high thermal stability, making it useful in cookware coatings, chemical equipment, and gaskets.', 'Chemistry — authored from NCERT Class 11/12 Chemistry textbooks (the NEET-prescribed syllabus); not copied from any official NTA question paper.');

-- ── Section: Biology (90 questions) — Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper. ──

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ba5a8933-1a72-40ed-b780-c27d6810cd79', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 91, 'The scientific naming convention requires that the genus name and species epithet, when printed, be:', 'Biology', 'The Living World');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('119cd2bd-00a7-4342-b734-34cfdf2ac497', 'ba5a8933-1a72-40ed-b780-c27d6810cd79', 0, 'Written in the same regular font as surrounding text, capitalized fully');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c95b9cd8-0a20-4e92-b8c0-651bd381251f', 'ba5a8933-1a72-40ed-b780-c27d6810cd79', 1, 'Italicized (or underlined when handwritten), with the genus name capitalized and species epithet in lowercase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('adb767c9-326d-4434-a4f7-58a6ca731fbd', 'ba5a8933-1a72-40ed-b780-c27d6810cd79', 2, 'Written entirely in uppercase letters');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ffa566e6-c3df-46a8-be63-a485e31e1d66', 'ba5a8933-1a72-40ed-b780-c27d6810cd79', 3, 'Enclosed in quotation marks');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ba5a8933-1a72-40ed-b780-c27d6810cd79', 'c95b9cd8-0a20-4e92-b8c0-651bd381251f', 'Per binomial nomenclature convention, scientific names are italicized in print (or underlined individually when handwritten), with the genus name capitalized and the species epithet in lowercase, e.g., Mangifera indica.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7d0e3c88-3055-4365-a24d-26bc7e411da5', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 92, 'Lichens, though sometimes discussed alongside fungi, are actually a symbiotic association between a fungus and:', 'Biology', 'Biological Classification');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dba0545a-df0c-477e-9ce9-bf6a1bf25626', '7d0e3c88-3055-4365-a24d-26bc7e411da5', 0, 'A bacterium exclusively, never algae');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79f3a4a9-5fff-4359-a1cd-da5683c16f91', '7d0e3c88-3055-4365-a24d-26bc7e411da5', 1, 'A photosynthetic partner — either a green alga or a cyanobacterium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('665fb207-bf8b-44c3-b92a-78338b1f93ce', '7d0e3c88-3055-4365-a24d-26bc7e411da5', 2, 'Another fungus of a different species');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad02e3d6-abe9-49dc-b332-7a68c1ad1c6f', '7d0e3c88-3055-4365-a24d-26bc7e411da5', 3, 'An animal');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7d0e3c88-3055-4365-a24d-26bc7e411da5', '79f3a4a9-5fff-4359-a1cd-da5683c16f91', 'Lichens are a mutualistic symbiotic partnership between a fungus (the mycobiont) and a photosynthetic partner (the photobiont), which is either a green alga or a cyanobacterium, providing organic nutrients to the association.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9b8450aa-71f5-442e-9ab4-c1cf07d2e31c', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 93, 'In gymnosperms, pollination is typically achieved by:', 'Biology', 'Plant Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a0f23844-748d-4034-82f1-de6e08ca9669', '9b8450aa-71f5-442e-9ab4-c1cf07d2e31c', 0, 'Insects exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('392847e7-4b37-4f3d-a24a-ee98ae7e5668', '9b8450aa-71f5-442e-9ab4-c1cf07d2e31c', 1, 'Wind (anemophily), given the general absence of colourful flowers or specialized insect attractants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1d5b385-9e90-4cc1-aa9b-8daa21ba7463', '9b8450aa-71f5-442e-9ab4-c1cf07d2e31c', 2, 'Water currents, similar to some aquatic angiosperms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbb55490-a894-4d2a-bbbe-ac52faaa23ef', '9b8450aa-71f5-442e-9ab4-c1cf07d2e31c', 3, 'Self-pollination only, with no external agent');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9b8450aa-71f5-442e-9ab4-c1cf07d2e31c', '392847e7-4b37-4f3d-a24a-ee98ae7e5668', 'Most gymnosperms rely on wind pollination, lacking the colourful petals, nectar, and scent used by many angiosperms to attract animal pollinators — their pollen is typically produced in large quantities to compensate for the inefficiency of wind dispersal.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('da7dd80d-864a-434f-8dd2-3dccda8f1c41', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 94, 'Adventitious roots, unlike normal tap roots, develop from:', 'Biology', 'Morphology of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0243b05e-dcf2-4cbc-a4cf-c12b0e4e6e80', 'da7dd80d-864a-434f-8dd2-3dccda8f1c41', 0, 'The radicle of the embryo exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0e896e9-87a6-40d0-a231-c0374ddd7e8f', 'da7dd80d-864a-434f-8dd2-3dccda8f1c41', 1, 'Parts of the plant other than the radicle, such as stems or leaves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4eabdd4-9bf4-48f8-ac0f-d9695487425e', 'da7dd80d-864a-434f-8dd2-3dccda8f1c41', 2, 'Only the primary root''s own branches');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bee63113-ef4f-4de8-b115-6da5d7c4045b', 'da7dd80d-864a-434f-8dd2-3dccda8f1c41', 3, 'Nowhere; adventitious roots do not actually exist');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('da7dd80d-864a-434f-8dd2-3dccda8f1c41', 'e0e896e9-87a6-40d0-a231-c0374ddd7e8f', 'Adventitious roots arise from plant parts other than the radicle (embryonic root) — commonly from stem nodes, internodes, or even leaves — as seen in structures like the prop roots of banyan trees or roots developing from stem cuttings.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0b3e00aa-0e92-42a7-871b-bce4ecf08e1b', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 95, 'Bulliform (motor) cells, found in the epidermis of certain grass leaves, function to:', 'Biology', 'Anatomy of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2bcbe1f4-c975-4ecc-aca3-e6a9eee693e0', '0b3e00aa-0e92-42a7-871b-bce4ecf08e1b', 0, 'Produce nectar');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8eac7fe5-3a6f-4bdb-88a0-fdd93b892b40', '0b3e00aa-0e92-42a7-871b-bce4ecf08e1b', 1, 'Facilitate the rolling/folding of the leaf under water-stress conditions, reducing water loss');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c1c6203-6b6d-4f85-8d46-db8d3ebb2c47', '0b3e00aa-0e92-42a7-871b-bce4ecf08e1b', 2, 'Conduct water and minerals like xylem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('76b9c41e-0dfc-4f65-900d-e45d944bbcd3', '0b3e00aa-0e92-42a7-871b-bce4ecf08e1b', 3, 'Store starch permanently');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0b3e00aa-0e92-42a7-871b-bce4ecf08e1b', '8eac7fe5-3a6f-4bdb-88a0-fdd93b892b40', 'Bulliform cells are large, thin-walled epidermal cells in many grasses that lose turgor under water stress, causing the leaf to roll or fold inward, reducing the exposed transpiring surface area and helping conserve water.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a55d30d0-5fd8-4730-9b83-e49b2982ca66', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 96, 'Mitochondria, described as the ''powerhouse'' of the cell, are structurally characterized by an inner membrane that is highly folded into projections called:', 'Biology', 'Cell — The Unit of Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e0922cd2-5631-4d06-b615-8dd2fccd799d', 'a55d30d0-5fd8-4730-9b83-e49b2982ca66', 0, 'Cisternae');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64639494-e22b-4820-bcbd-c529f31259b1', 'a55d30d0-5fd8-4730-9b83-e49b2982ca66', 1, 'Cristae, which increase the surface area available for the electron transport chain and ATP synthesis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('42caf11e-52c7-4a83-8758-9286f2fda7e0', 'a55d30d0-5fd8-4730-9b83-e49b2982ca66', 2, 'Villi');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('868bbaa0-bf66-408a-8cf7-0126aba0deee', 'a55d30d0-5fd8-4730-9b83-e49b2982ca66', 3, 'Thylakoids, which are actually found in chloroplasts, not mitochondria');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a55d30d0-5fd8-4730-9b83-e49b2982ca66', '64639494-e22b-4820-bcbd-c529f31259b1', 'The mitochondrial inner membrane is folded into cristae, dramatically increasing the surface area available for the electron transport chain complexes and ATP synthase, maximizing the mitochondrion''s capacity for oxidative ATP production.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('022696c4-70b0-4aa0-b58d-fc3a8dfb159e', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 97, 'The bonds linking successive nucleotides together in a single strand of DNA/RNA are:', 'Biology', 'Biomolecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d749cb79-85fb-4da5-9872-6ff667fdedb0', '022696c4-70b0-4aa0-b58d-fc3a8dfb159e', 0, 'Hydrogen bonds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8c9846a-e19d-49ff-9c6e-420e46ed8a4b', '022696c4-70b0-4aa0-b58d-fc3a8dfb159e', 1, 'Phosphodiester bonds, connecting the sugar of one nucleotide to the phosphate of the next');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('613eac10-ce97-4d4f-8a73-56222dedb1ee', '022696c4-70b0-4aa0-b58d-fc3a8dfb159e', 2, 'Peptide bonds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66bd399e-103b-4222-82d7-50d2bbd01506', '022696c4-70b0-4aa0-b58d-fc3a8dfb159e', 3, 'Glycosidic bonds between two sugars only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('022696c4-70b0-4aa0-b58d-fc3a8dfb159e', 'd8c9846a-e19d-49ff-9c6e-420e46ed8a4b', 'Successive nucleotides within a single polynucleotide strand are joined by phosphodiester bonds, linking the 3'' carbon of one sugar to the phosphate group attached to the 5'' carbon of the next nucleotide''s sugar, forming the sugar-phosphate backbone.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('87ba7ffb-a593-40b5-83cd-d842b6c038a7', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 98, 'The G2 checkpoint in the cell cycle primarily verifies that:', 'Biology', 'Cell Cycle and Cell Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2fb98d6d-3aae-4fbc-b058-6182ba47743c', '87ba7ffb-a593-40b5-83cd-d842b6c038a7', 0, 'Cell size is adequate and DNA has been accurately and completely replicated before entry into mitosis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb80b2de-dfd7-4c5a-90a8-ee3a6bf79a10', '87ba7ffb-a593-40b5-83cd-d842b6c038a7', 1, 'The cell has already completed cytokinesis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d28f153-9265-4644-9b4e-3461d073b6c1', '87ba7ffb-a593-40b5-83cd-d842b6c038a7', 2, 'No further division of the cell will ever occur');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c2cd72b1-9c4e-4646-945c-6c08545282ba', '87ba7ffb-a593-40b5-83cd-d842b6c038a7', 3, 'Meiosis has begun');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('87ba7ffb-a593-40b5-83cd-d842b6c038a7', '2fb98d6d-3aae-4fbc-b058-6182ba47743c', 'The G2 checkpoint (G2/M checkpoint) ensures that DNA replication has been completed accurately and that the cell has reached an adequate size before allowing progression into mitosis (M phase), helping prevent division with damaged or incompletely replicated DNA.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8bcd7d5d-34e0-421e-8104-2b8783e1bc0f', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 99, 'Non-cyclic photophosphorylation, the primary pathway of the light reactions, involves both Photosystem I and II working together to ultimately produce:', 'Biology', 'Photosynthesis in Higher Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8a1a1f12-f7b2-40b0-b983-3f8ee4fbf28a', '8bcd7d5d-34e0-421e-8104-2b8783e1bc0f', 0, 'Only ATP, with no NADPH or oxygen evolution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bd85a7db-08d8-4f59-a90a-b9892ec35f0e', '8bcd7d5d-34e0-421e-8104-2b8783e1bc0f', 1, 'Both ATP and NADPH, along with oxygen released from the splitting of water');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10097e78-17e8-4d25-a250-57ee55e0b01e', '8bcd7d5d-34e0-421e-8104-2b8783e1bc0f', 2, 'Only oxygen gas, with no ATP or NADPH formed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9d19249-4527-4000-a955-296226967547', '8bcd7d5d-34e0-421e-8104-2b8783e1bc0f', 3, 'Glucose directly, without the involvement of the Calvin cycle');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8bcd7d5d-34e0-421e-8104-2b8783e1bc0f', 'bd85a7db-08d8-4f59-a90a-b9892ec35f0e', 'Non-cyclic photophosphorylation involves both photosystems, splitting water (releasing O2) at PS II and ultimately reducing NADP+ to NADPH at PS I, while also generating ATP via the proton gradient established across the thylakoid membrane.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7ee3dc1a-ab69-463d-b1fa-e29a80258c27', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 100, 'The pentose phosphate pathway, an alternative route for glucose oxidation in plant cells, is particularly important for generating:', 'Biology', 'Respiration in Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2ea82a42-e19f-41e2-a7fb-122a7993db52', '7ee3dc1a-ab69-463d-b1fa-e29a80258c27', 0, 'Only ATP, in large quantities');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a9f3718-ad20-4866-96cd-857044d9fc50', '7ee3dc1a-ab69-463d-b1fa-e29a80258c27', 1, 'NADPH (for biosynthetic reduction reactions) and pentose sugars (for nucleotide synthesis)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63be4fb4-556a-4917-b882-a96b9af52024', '7ee3dc1a-ab69-463d-b1fa-e29a80258c27', 2, 'Ethanol as a fermentation product');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa0dc113-d79b-43dc-90ae-371f70ce7ebe', '7ee3dc1a-ab69-463d-b1fa-e29a80258c27', 3, 'Only carbon dioxide, with no other useful product');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7ee3dc1a-ab69-463d-b1fa-e29a80258c27', '7a9f3718-ad20-4866-96cd-857044d9fc50', 'Unlike glycolysis (primarily geared toward ATP production), the pentose phosphate pathway generates NADPH (needed for various reductive biosynthetic pathways) and 5-carbon (pentose) sugars used in nucleotide and nucleic acid synthesis.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7ac55bd4-d5ec-403e-b2d6-bfa2837cf233', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 101, 'The discovery of auxin was significantly advanced by Charles Darwin''s classic experiments on the phototropic bending of grass coleoptiles, which suggested that:', 'Biology', 'Plant Growth and Development');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f562811f-0cb3-4324-9cc3-b7ef2641910b', '7ac55bd4-d5ec-403e-b2d6-bfa2837cf233', 0, 'Bending occurs due to a substance produced in the coleoptile tip that is transmitted downward, influencing growth in the region below');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('955ae484-2ecc-4af4-b92e-160d5fc11fba', '7ac55bd4-d5ec-403e-b2d6-bfa2837cf233', 1, 'Light directly causes cells to physically bend without any chemical signal');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8ae23eb-7399-4ad7-a379-4eec922fe5f8', '7ac55bd4-d5ec-403e-b2d6-bfa2837cf233', 2, 'Roots, not shoots, are responsible for phototropism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ad0d2b7e-9c49-406b-9a2e-af8c9f861b39', '7ac55bd4-d5ec-403e-b2d6-bfa2837cf233', 3, 'Phototropism does not actually occur in any plant');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7ac55bd4-d5ec-403e-b2d6-bfa2837cf233', 'f562811f-0cb3-4324-9cc3-b7ef2641910b', 'Darwin''s coleoptile experiments (later refined by others) demonstrated that the tip perceives light and produces a transmissible influence (later identified as auxin) that moves down to the growing region, causing differential growth and bending toward light.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('429c86ed-2100-484c-93dd-6afe3ab3cc5b', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 102, 'Perisperm, present in a few seeds (like black pepper), refers to a nutritive tissue derived from the:', 'Biology', 'Sexual Reproduction in Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aabef979-e6d0-4c4f-b1b8-abae5ccb7db2', '429c86ed-2100-484c-93dd-6afe3ab3cc5b', 0, 'Endosperm, persisting into the mature seed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cefdcdda-d3cd-430d-b363-b4120d414b31', '429c86ed-2100-484c-93dd-6afe3ab3cc5b', 1, 'Nucellus, the tissue surrounding the embryo sac, which sometimes persists as a food reserve');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0f8ad5d-9284-401b-9e27-731be0ccc62f', '429c86ed-2100-484c-93dd-6afe3ab3cc5b', 2, 'Integument, forming the seed coat');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b784e063-553a-4c57-b4a2-31fdf9ca4606', '429c86ed-2100-484c-93dd-6afe3ab3cc5b', 3, 'Pollen tube itself');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('429c86ed-2100-484c-93dd-6afe3ab3cc5b', 'cefdcdda-d3cd-430d-b363-b4120d414b31', 'Perisperm is a persistent remnant of the nucellus (the tissue that originally surrounded the embryo sac within the ovule), which in a few plant species remains as a food-storing tissue in the mature seed, distinct from the more typical endosperm.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8ef38c11-4338-4065-9433-437278558bb5', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 103, 'Epistasis, a form of gene interaction, occurs when:', 'Biology', 'Principles of Inheritance and Variation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3eb97408-f762-4a95-b672-2aa6d8ea22f4', '8ef38c11-4338-4065-9433-437278558bb5', 0, 'Two genes are located on completely different chromosomes with absolutely no interaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b4c45070-1521-4589-87d0-65d4199f056a', '8ef38c11-4338-4065-9433-437278558bb5', 1, 'The expression of one gene is masked or modified by the effect of a different, non-allelic gene');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db1c388f-907d-4964-a8eb-fe2dc082b855', '8ef38c11-4338-4065-9433-437278558bb5', 2, 'A single gene has multiple alleles with no interaction between genes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e3273c21-5591-48b4-8ec6-e603aa03cc38', '8ef38c11-4338-4065-9433-437278558bb5', 3, 'All genes always express independently with no possible masking effect');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8ef38c11-4338-4065-9433-437278558bb5', 'b4c45070-1521-4589-87d0-65d4199f056a', 'Epistasis describes an interaction between genes at DIFFERENT loci, where the phenotypic expression of one gene is suppressed or modified by another (non-allelic) gene — distinct from simple dominance, which involves alleles of the SAME gene.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('fdb7542a-a395-4cfe-9b8c-8aeb220cbeaf', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 104, 'In eukaryotes, RNA polymerase II is primarily responsible for the transcription of:', 'Biology', 'Molecular Basis of Inheritance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eee82918-3ef6-4934-b3ca-a3324dfc3589', 'fdb7542a-a395-4cfe-9b8c-8aeb220cbeaf', 0, 'Ribosomal RNA (rRNA) genes exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c6ade6b1-2ecb-4561-883b-abe422dcace8', 'fdb7542a-a395-4cfe-9b8c-8aeb220cbeaf', 1, 'Messenger RNA (mRNA) precursor (hnRNA) from protein-coding genes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6cc00941-914b-48bf-bbe4-04cf55ea8f0d', 'fdb7542a-a395-4cfe-9b8c-8aeb220cbeaf', 2, 'Transfer RNA (tRNA) genes exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f2f8aea-855e-4cc5-85f5-e187f8b70128', 'fdb7542a-a395-4cfe-9b8c-8aeb220cbeaf', 3, 'Mitochondrial DNA only');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('fdb7542a-a395-4cfe-9b8c-8aeb220cbeaf', 'c6ade6b1-2ecb-4561-883b-abe422dcace8', 'In eukaryotic cells, RNA polymerase II specifically transcribes protein-coding genes into precursor mRNA (heterogeneous nuclear RNA, hnRNA), which then undergoes processing (capping, splicing, polyadenylation) to become mature mRNA; separate RNA polymerases (I and III) handle rRNA and tRNA genes respectively.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b5d71ca0-beae-4ee6-b986-677bad57adda', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 105, 'Vestigial organs, such as the human appendix or the remnants of a pelvic girdle in some snakes, are considered evidence for evolution because they represent:', 'Biology', 'Evolution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5b47d2a1-e008-4b6f-8d07-2d0420a516e5', 'b5d71ca0-beae-4ee6-b986-677bad57adda', 0, 'Structures that are currently at peak functional importance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7fddb89d-ea81-42e8-aa80-7db13c60e69f', 'b5d71ca0-beae-4ee6-b986-677bad57adda', 1, 'Reduced, non-functional (or minimally functional) remnants of organs that were fully functional in an ancestral species');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10638c7f-b850-41ed-918f-46f5fad2d56e', 'b5d71ca0-beae-4ee6-b986-677bad57adda', 2, 'Newly evolved structures with no evolutionary history');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cf2e48b7-1503-4687-ba57-7b15a969146c', 'b5d71ca0-beae-4ee6-b986-677bad57adda', 3, 'Structures found only in a single living species with no evolutionary significance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b5d71ca0-beae-4ee6-b986-677bad57adda', '7fddb89d-ea81-42e8-aa80-7db13c60e69f', 'Vestigial structures are reduced, largely non-functional remnants of organs that served an important function in ancestral species, providing evidence of evolutionary descent with modification — their continued (if reduced) presence reflects shared ancestry rather than de novo appearance.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('af7c36f0-b1a2-47c7-8d41-043afdc5ddfe', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 106, 'Tissue culture (micropropagation) as a plant propagation technique offers the advantage of producing:', 'Biology', 'Strategies for Enhancement in Food Production');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a15257c-77d0-49a5-a131-1fc026b6256a', 'af7c36f0-b1a2-47c7-8d41-043afdc5ddfe', 0, 'Genetically diverse offspring through recombination, exactly like seed propagation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('654f508c-5946-4903-a18d-7b0b2cdaf386', 'af7c36f0-b1a2-47c7-8d41-043afdc5ddfe', 1, 'Large numbers of genetically identical, disease-free plantlets from a small amount of starting plant tissue');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e754544c-f0c4-489f-8671-f49358a0c3ce', 'af7c36f0-b1a2-47c7-8d41-043afdc5ddfe', 2, 'Only non-viable plantlets with no practical application');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d1aa4284-6b86-4d9a-ad2b-159b12157893', 'af7c36f0-b1a2-47c7-8d41-043afdc5ddfe', 3, 'Plants exclusively through natural pollination');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('af7c36f0-b1a2-47c7-8d41-043afdc5ddfe', '654f508c-5946-4903-a18d-7b0b2cdaf386', 'Plant tissue culture allows rapid, large-scale clonal propagation of genetically identical, often pathogen-free plantlets from a small explant of parent tissue, valuable for propagating elite/hybrid varieties, ornamental plants, and disease-free planting stock.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f64cf653-47a8-4292-a14b-914d7974507d', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 107, 'Nitrogen-fixing symbiotic bacteria of the genus Rhizobium form a mutualistic association specifically with the root nodules of:', 'Biology', 'Microbes in Human Welfare');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('75800dac-0e9f-43b4-903f-15fa71e250c2', 'f64cf653-47a8-4292-a14b-914d7974507d', 0, 'Cereal crops like wheat and rice');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eef80552-a32e-4c72-95ed-7d6c5cfd3eb2', 'f64cf653-47a8-4292-a14b-914d7974507d', 1, 'Leguminous plants, such as pea, gram, and soybean');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fdef16a8-216f-47ae-81f8-9ffb9bdaf530', 'f64cf653-47a8-4292-a14b-914d7974507d', 2, 'Only non-flowering plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d6846fe-02a9-455b-82e3-d33eed89fba8', 'f64cf653-47a8-4292-a14b-914d7974507d', 3, 'Aquatic algae exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f64cf653-47a8-4292-a14b-914d7974507d', 'eef80552-a32e-4c72-95ed-7d6c5cfd3eb2', 'Rhizobium bacteria form a well-known symbiotic relationship within specialized root nodules of leguminous plants, converting atmospheric nitrogen into a form usable by the plant, in exchange for carbohydrates and a protected niche from the host.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('716dae4c-8f18-4f66-a9ea-c6da8c8ba12c', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 108, 'The selection of transformed bacterial cells (those that have taken up a recombinant plasmid) is often achieved using a plasmid carrying a:', 'Biology', 'Biotechnology — Principles and Processes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a7035e4-2e45-40b9-b03e-14a505c79d37', '716dae4c-8f18-4f66-a9ea-c6da8c8ba12c', 0, 'Gene that confers no observable trait at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4272152a-6a6a-48cb-9d2f-b9bab2e30084', '716dae4c-8f18-4f66-a9ea-c6da8c8ba12c', 1, 'Selectable marker gene, such as antibiotic resistance, allowing transformed cells to be distinguished from untransformed ones');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b154abd3-b854-42d9-a57d-16bd1a66a299', '716dae4c-8f18-4f66-a9ea-c6da8c8ba12c', 2, 'Gene that makes all bacteria, transformed or not, grow identically');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4601a30-7b3e-4658-9dcf-4d5bce217324', '716dae4c-8f18-4f66-a9ea-c6da8c8ba12c', 3, 'Random, non-functional DNA sequence with no selective use');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('716dae4c-8f18-4f66-a9ea-c6da8c8ba12c', '4272152a-6a6a-48cb-9d2f-b9bab2e30084', 'Selectable marker genes (commonly antibiotic resistance genes) included on a cloning vector allow researchers to selectively grow only the bacteria that successfully took up the plasmid (and thus gained resistance), by culturing on media containing the corresponding antibiotic.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('4c294ee7-3ed3-4b70-8379-1d6663ad7b66', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 109, 'In population ecology, dispersion patterns describe how individuals of a population are spatially arranged; a ''clumped'' dispersion pattern is often associated with:', 'Biology', 'Organisms and Populations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d7fd582d-a36f-4063-aa0a-9b908e971fa9', '4c294ee7-3ed3-4b70-8379-1d6663ad7b66', 0, 'Uniformly distributed, scarce resources with strong territorial competition');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa3947f2-fabe-47bb-a302-5f639b665ceb', '4c294ee7-3ed3-4b70-8379-1d6663ad7b66', 1, 'Patchily distributed resources or social behavior causing individuals to aggregate in favorable areas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fadce967-b98a-42a1-9fc0-6ab1813fad4b', '4c294ee7-3ed3-4b70-8379-1d6663ad7b66', 2, 'Perfectly even resource distribution with no social interaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2d672117-be6c-4b76-8cb6-94791399c11c', '4c294ee7-3ed3-4b70-8379-1d6663ad7b66', 3, 'A completely random, resource-independent distribution');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('4c294ee7-3ed3-4b70-8379-1d6663ad7b66', 'aa3947f2-fabe-47bb-a302-5f639b665ceb', 'Clumped dispersion, the most common pattern in nature, typically arises when resources are patchily distributed or when social behaviors (herding, flocking) cause individuals to aggregate in favorable microhabitats, rather than spreading evenly or randomly.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d577bda5-ec64-4a62-85d0-a82b2d46f8be', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 110, 'The concept of ecological efficiency describes the percentage of energy transferred from one trophic level to the next, which is generally observed to average around:', 'Biology', 'Ecosystem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f20eab6-7bcb-4ead-b343-1055aab149af', 'd577bda5-ec64-4a62-85d0-a82b2d46f8be', 0, '100%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('20cd31fa-6378-4170-8e92-a7efbf5dfb39', 'd577bda5-ec64-4a62-85d0-a82b2d46f8be', 1, '50%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08061c1c-1091-4a01-85bd-3ff962db8918', 'd577bda5-ec64-4a62-85d0-a82b2d46f8be', 2, '10%');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('72529e52-d72a-4d1c-9933-17170c219027', 'd577bda5-ec64-4a62-85d0-a82b2d46f8be', 3, '90%');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d577bda5-ec64-4a62-85d0-a82b2d46f8be', '08061c1c-1091-4a01-85bd-3ff962db8918', 'Ecological efficiency (energy transfer efficiency between trophic levels) is generally estimated to average around 10% (the basis of the ''10 percent law''), with the remaining ~90% lost mainly as metabolic heat and in unconsumed/undigested matter.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('138e60c1-71c5-437a-8e61-04a75a1888b7', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 111, 'The term ''biodiversity'' encompasses diversity at which of the following levels?', 'Biology', 'Biodiversity and Conservation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8011d19-bc41-45e1-9e43-2656f340f0d3', '138e60c1-71c5-437a-8e61-04a75a1888b7', 0, 'Only species diversity, with no other level considered');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01e52412-5c6d-4b86-b02f-9b6f2f32fbb4', '138e60c1-71c5-437a-8e61-04a75a1888b7', 1, 'Genetic diversity, species diversity, and ecosystem diversity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('31eb1f69-d965-4ac7-821e-ef2e2032b55f', '138e60c1-71c5-437a-8e61-04a75a1888b7', 2, 'Only genetic diversity within a single species');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7162112f-d107-47dd-9c20-992a19b2ae27', '138e60c1-71c5-437a-8e61-04a75a1888b7', 3, 'Only the diversity of ecosystems, unrelated to species or genetic variation');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('138e60c1-71c5-437a-8e61-04a75a1888b7', '01e52412-5c6d-4b86-b02f-9b6f2f32fbb4', 'Biodiversity is a multi-level concept encompassing genetic diversity (variation within species), species diversity (variety of species within a region), and ecosystem diversity (variety of habitats/ecological communities) — all three levels are important for a complete understanding of biological diversity.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('51e298a3-7b8e-414f-9c88-1de836796517', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 112, 'Bioremediation, an environmentally friendly waste treatment approach, uses:', 'Biology', 'Environmental Issues');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('df352db3-d890-4999-ad38-6a4e00a7a9e2', '51e298a3-7b8e-414f-9c88-1de836796517', 0, 'Only physical filtration methods with no biological component');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f759e494-7f17-4f5c-a11e-ef42684dc360', '51e298a3-7b8e-414f-9c88-1de836796517', 1, 'Living organisms (typically microorganisms) to degrade or detoxify environmental pollutants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46827f79-8032-4393-8ca5-b35ee93450ab', '51e298a3-7b8e-414f-9c88-1de836796517', 2, 'Incineration at very high temperatures as the sole method');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7f3b5ead-9e77-4d6c-b607-72f48e4131d2', '51e298a3-7b8e-414f-9c88-1de836796517', 3, 'Chemical neutralization exclusively, with no biological process');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('51e298a3-7b8e-414f-9c88-1de836796517', 'f759e494-7f17-4f5c-a11e-ef42684dc360', 'Bioremediation harnesses the natural metabolic capabilities of microorganisms (bacteria, fungi) or plants (phytoremediation) to break down, detoxify, or remove pollutants from contaminated soil, water, or other environments.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ba26b2b2-9378-4d0f-a04c-665097d6cb92', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 113, 'Fungi imperfecti (Deuteromycetes), a group historically classified separately from other fungal groups, are organisms for which:', 'Biology', 'Plant Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ed8ef810-5565-4681-a6e5-fbea0e39cef0', 'ba26b2b2-9378-4d0f-a04c-665097d6cb92', 0, 'The sexual (perfect) stage of reproduction is well documented and easily observed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dffd016e-34b6-4df6-b1db-f60f39bd8e77', 'ba26b2b2-9378-4d0f-a04c-665097d6cb92', 1, 'Only the asexual stage of reproduction is known, since the sexual stage has not been observed/discovered');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0e3c09f4-e66e-4a13-b6c1-309767efcd3a', 'ba26b2b2-9378-4d0f-a04c-665097d6cb92', 2, 'No reproduction of any kind has ever been observed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3f0f9b54-1e20-424f-85f0-e244b7bda717', 'ba26b2b2-9378-4d0f-a04c-665097d6cb92', 3, 'They exclusively reproduce sexually with no asexual stage');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ba26b2b2-9378-4d0f-a04c-665097d6cb92', 'dffd016e-34b6-4df6-b1db-f60f39bd8e77', 'Deuteromycetes (fungi imperfecti) is a historical, artificial grouping for fungi in which only the asexual reproductive stage has been observed — once a sexual stage is discovered for a given species, it is typically reclassified into one of the other established fungal groups.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d1b44799-30a1-4a9a-a573-b5ce21333f7e', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 114, 'The International Code of Botanical Nomenclature (ICBN, now part of ICN) exists primarily to ensure that:', 'Biology', 'The Living World');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('aa6e83e3-9f36-42c3-84ec-e01e2d674e86', 'd1b44799-30a1-4a9a-a573-b5ce21333f7e', 0, 'Every plant species has multiple different accepted scientific names');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bc9132da-638d-4bc6-986b-92b2ad875c07', 'd1b44799-30a1-4a9a-a573-b5ce21333f7e', 1, 'Each plant species is assigned one universally accepted, unambiguous scientific name recognized by botanists worldwide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f8ea49b-6f0c-4d21-81e5-453e1a9ca9b5', 'd1b44799-30a1-4a9a-a573-b5ce21333f7e', 2, 'Only common/vernacular names are used in scientific literature');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eca28d2a-9375-4bc7-b1cc-e13b467e7a32', 'd1b44799-30a1-4a9a-a573-b5ce21333f7e', 3, 'Plant names can be freely changed by any individual without any formal rules');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d1b44799-30a1-4a9a-a573-b5ce21333f7e', 'bc9132da-638d-4bc6-986b-92b2ad875c07', 'The nomenclature code establishes formal, universally agreed rules ensuring each species has a single valid, unambiguous scientific name, avoiding the confusion that would arise from multiple regional common names or conflicting naming practices.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('41c054c0-f8a4-4978-b8e6-3e90826309e3', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 115, 'Bacteriophages, viruses that specifically infect bacteria, are of considerable interest in molecular biology, notably serving as an early experimental system that helped establish:', 'Biology', 'Biological Classification');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6747fa4a-6606-41c3-93ad-ad7e8e1b1c3f', '41c054c0-f8a4-4978-b8e6-3e90826309e3', 0, 'That proteins, not DNA, are the genetic material');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fc67ef3b-ccf2-452e-afc3-a6001d967fd5', '41c054c0-f8a4-4978-b8e6-3e90826309e3', 1, 'That DNA (not protein) is the genetic material, as demonstrated by the Hershey-Chase experiment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('60848c9a-76fa-40b9-bc01-99baeaaba431', '41c054c0-f8a4-4978-b8e6-3e90826309e3', 2, 'That RNA is always the primary genetic material in all organisms');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('63312974-a716-4d10-b776-27fcf8cd5c88', '41c054c0-f8a4-4978-b8e6-3e90826309e3', 3, 'That viruses have no genetic material at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('41c054c0-f8a4-4978-b8e6-3e90826309e3', 'fc67ef3b-ccf2-452e-afc3-a6001d967fd5', 'The Hershey-Chase experiment, using radioactively labeled bacteriophages, provided crucial evidence that DNA (not protein) is the genetic material that a phage injects into bacteria to direct the production of new phage particles.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('bfd4702a-9a34-4c1c-8107-fe8321e72b22', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 116, 'A drupe, a type of simple fleshy fruit exemplified by mango and coconut, is characterized by having:', 'Biology', 'Morphology of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eed69b64-3cd5-494b-8d63-edea2f3739af', 'bfd4702a-9a34-4c1c-8107-fe8321e72b22', 0, 'No hard layer at all, being entirely fleshy throughout');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3e36aaae-ff25-43cb-9c3e-fe774230d169', 'bfd4702a-9a34-4c1c-8107-fe8321e72b22', 1, 'A hard, stony endocarp (the ''stone'' or ''pit'') surrounding the seed, with a fleshy mesocarp outside it');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c7ccd05b-530b-4b90-9d6f-bf4452946356', 'bfd4702a-9a34-4c1c-8107-fe8321e72b22', 2, 'Multiple separate seeds each with its own fruit wall');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ad722bc-15d5-449d-825e-987e574911b0', 'bfd4702a-9a34-4c1c-8107-fe8321e72b22', 3, 'A completely dry, dehiscent structure');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('bfd4702a-9a34-4c1c-8107-fe8321e72b22', '3e36aaae-ff25-43cb-9c3e-fe774230d169', 'A drupe has a distinct pericarp differentiation: a thin epicarp (skin), a fleshy mesocarp, and a hard, stony endocarp enclosing the single seed — as seen in mango, coconut, and peach.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1821db19-68bd-40fd-a668-c8acab6492ba', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 117, 'Tissue systems in a plant body are classified into the epidermal, ground (fundamental), and vascular systems; the ground tissue system primarily includes:', 'Biology', 'Anatomy of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('595da6b7-bab3-47e7-9fcc-05bedcb93042', '1821db19-68bd-40fd-a668-c8acab6492ba', 0, 'Only xylem and phloem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('027c9a37-f65a-43e1-a2eb-a1858da009ce', '1821db19-68bd-40fd-a668-c8acab6492ba', 1, 'Parenchyma, collenchyma, and sclerenchyma, filling most of the plant body outside the epidermal and vascular systems');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34d2a5d3-f988-4249-950a-c67cddb3d4e5', '1821db19-68bd-40fd-a668-c8acab6492ba', 2, 'Only the epidermis and cuticle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('397643ad-dec8-448f-9213-cf24b2b316ee', '1821db19-68bd-40fd-a668-c8acab6492ba', 3, 'Only reproductive floral structures');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1821db19-68bd-40fd-a668-c8acab6492ba', '027c9a37-f65a-43e1-a2eb-a1858da009ce', 'The ground (fundamental) tissue system comprises the simple tissues — parenchyma, collenchyma, and sclerenchyma — that make up the bulk of the plant body (cortex, pith, mesophyll) apart from the epidermal covering and the vascular (xylem/phloem) tissue.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b6479499-9267-4567-a60c-ef05a2fd2dc1', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 118, 'Prokaryotic cells, unlike eukaryotic cells, generally lack:', 'Biology', 'Cell — The Unit of Life');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88cd7ca9-b6e9-43c4-bbdc-26678948d460', 'b6479499-9267-4567-a60c-ef05a2fd2dc1', 0, 'A cell membrane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a68803bc-5ad0-4d91-bdf1-d583cf14167e', 'b6479499-9267-4567-a60c-ef05a2fd2dc1', 1, 'Membrane-bound organelles such as a nucleus, mitochondria, or Golgi apparatus');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1e9aae89-f359-4356-a2d0-810f1db418aa', 'b6479499-9267-4567-a60c-ef05a2fd2dc1', 2, 'Ribosomes entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37dfc90e-fa83-4433-b787-b775f6088b5d', 'b6479499-9267-4567-a60c-ef05a2fd2dc1', 3, 'Genetic material (DNA) of any kind');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b6479499-9267-4567-a60c-ef05a2fd2dc1', 'a68803bc-5ad0-4d91-bdf1-d583cf14167e', 'Prokaryotic cells (bacteria, archaea) lack a true membrane-bound nucleus and other membrane-bound organelles found in eukaryotes; they do have a plasma membrane, ribosomes (though a different, smaller 70S type), and genetic material, typically as a single circular chromosome in the nucleoid region.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c11f7240-23e2-4edc-b40c-8541d8df778f', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 119, 'Glycogen, the primary storage polysaccharide in animal cells (particularly liver and muscle), is structurally most similar to:', 'Biology', 'Biomolecules');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e22a781-aa10-4f28-beb6-80b2add49f02', 'c11f7240-23e2-4edc-b40c-8541d8df778f', 0, 'Cellulose, sharing the same beta-glycosidic linkages');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7c53a3ef-622f-4050-b4c8-be1d4754e851', 'c11f7240-23e2-4edc-b40c-8541d8df778f', 1, 'Starch (specifically amylopectin), being a highly branched glucose polymer with alpha-glycosidic linkages');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('66b5bcb2-48a3-40e0-94e8-348ae38c1d94', 'c11f7240-23e2-4edc-b40c-8541d8df778f', 2, 'Chitin, a nitrogen-containing polysaccharide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fce9f4fe-8cd2-4c38-8c8a-c4747af5c204', 'c11f7240-23e2-4edc-b40c-8541d8df778f', 3, 'A simple monosaccharide like glucose alone');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c11f7240-23e2-4edc-b40c-8541d8df778f', '7c53a3ef-622f-4050-b4c8-be1d4754e851', 'Glycogen closely resembles amylopectin (a branched component of plant starch), being a highly branched polymer of glucose units joined by alpha-1,4 and alpha-1,6 glycosidic bonds — its extensive branching allows rapid mobilization of glucose when needed.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b7dc00a6-aab7-431f-ae8e-5c8f33425b31', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 120, 'Karyokinesis, a term used in the context of cell division, specifically refers to:', 'Biology', 'Cell Cycle and Cell Division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7d833179-fb80-4003-bb31-3d08e1f45622', 'b7dc00a6-aab7-431f-ae8e-5c8f33425b31', 0, 'Division of the cytoplasm into two daughter cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2b949190-6411-45e1-8db3-43a6ccabb664', 'b7dc00a6-aab7-431f-ae8e-5c8f33425b31', 1, 'Division of the nucleus, distinct from the subsequent division of the cytoplasm (cytokinesis)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1c29a48a-7a17-43c3-a8e3-ea7265f53d18', 'b7dc00a6-aab7-431f-ae8e-5c8f33425b31', 2, 'The complete disappearance of chromosomes with no division occurring');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bf6b223f-6cd1-4b4d-ac53-56fd02bdffcc', 'b7dc00a6-aab7-431f-ae8e-5c8f33425b31', 3, 'A process exclusive to plant cells, never occurring in animal cells');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b7dc00a6-aab7-431f-ae8e-5c8f33425b31', '2b949190-6411-45e1-8db3-43a6ccabb664', 'Karyokinesis refers specifically to nuclear division (mitosis or meiosis proper), which is followed by, but conceptually distinct from, cytokinesis — the subsequent division of the cytoplasm into separate daughter cells.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5b9429fc-44b4-4282-b1ad-9e8a0406e7a0', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 121, 'The Calvin cycle (C3 cycle) of photosynthesis can be divided into three main phases: carboxylation, reduction, and:', 'Biology', 'Photosynthesis in Higher Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8bfadeec-b6f5-4b2c-8bbc-f4603b419ba2', '5b9429fc-44b4-4282-b1ad-9e8a0406e7a0', 0, 'Oxidation, releasing oxygen directly from the cycle itself');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d458f97e-58dc-4fd0-b14e-a0aec9f81c4a', '5b9429fc-44b4-4282-b1ad-9e8a0406e7a0', 1, 'Regeneration of the CO2 acceptor molecule, RuBP, allowing the cycle to continue');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd77024d-c3b2-4741-b26c-a4f651c638a2', '5b9429fc-44b4-4282-b1ad-9e8a0406e7a0', 2, 'Photolysis of water');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e64bcda2-ae87-414c-b062-011422058eaf', '5b9429fc-44b4-4282-b1ad-9e8a0406e7a0', 3, 'Direct glucose formation with no further steps');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5b9429fc-44b4-4282-b1ad-9e8a0406e7a0', 'd458f97e-58dc-4fd0-b14e-a0aec9f81c4a', 'The Calvin cycle''s three phases are: carboxylation (CO2 fixation by RuBisCO), reduction (using ATP/NADPH to form G3P), and regeneration (reforming RuBP from remaining G3P molecules so the cycle can continue) — glucose synthesis actually occurs via G3P molecules exiting the cycle, combined outside it.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ebbb2c06-0c20-431a-a9b2-d554a492ba1a', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 122, 'Amphibolic pathways, a term applied to metabolic pathways like glycolysis and the Krebs cycle, describes their role in:', 'Biology', 'Respiration in Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cfc5d1c0-f1f5-4312-bb67-285cd5993112', 'ebbb2c06-0c20-431a-a9b2-d554a492ba1a', 0, 'Serving exclusively in catabolic (breakdown) reactions, with no role in biosynthesis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('adac6090-4cef-49b4-b784-5b87b5a84f93', 'ebbb2c06-0c20-431a-a9b2-d554a492ba1a', 1, 'Serving both catabolic and anabolic functions, since their intermediates can also be used as starting materials for biosynthesis of other important compounds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbbba40a-8c81-4b55-995d-cbc1f86242d7', 'ebbb2c06-0c20-431a-a9b2-d554a492ba1a', 2, 'Occurring only in photosynthetic tissue');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80f7332d-7471-49ad-ab92-d1f986a512c3', 'ebbb2c06-0c20-431a-a9b2-d554a492ba1a', 3, 'Functioning only under anaerobic conditions');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ebbb2c06-0c20-431a-a9b2-d554a492ba1a', 'adac6090-4cef-49b4-b784-5b87b5a84f93', 'Amphibolic pathways serve dual roles: while primarily known for catabolism (breaking down glucose for energy), their intermediates (like pyruvate, acetyl-CoA, and various Krebs cycle intermediates) are also drawn off as starting materials for the biosynthesis of amino acids, fatty acids, and other important molecules.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('03416666-02fb-45b5-8f02-d988b621af95', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 123, 'The term ''growth hormone'' or ''phytohormone'' in plants refers to:', 'Biology', 'Plant Growth and Development');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0053acf5-cfb8-43e6-9c76-51243d66acef', '03416666-02fb-45b5-8f02-d988b621af95', 0, 'A single specific hormone chemically identical to human growth hormone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9489b99-4f00-4e0d-9cf9-dad42b3e1b20', '03416666-02fb-45b5-8f02-d988b621af95', 1, 'Naturally occurring organic substances, active at very low concentrations, that regulate plant growth, development, and various physiological processes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('04fb26c3-6cba-4494-949b-d8fdb251e6a6', '03416666-02fb-45b5-8f02-d988b621af95', 2, 'Only synthetic chemicals applied externally, with no naturally occurring equivalent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('274f168e-d412-4547-83ad-a56b7ce2a166', '03416666-02fb-45b5-8f02-d988b621af95', 3, 'Substances that only affect root growth, with no effect on shoots');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('03416666-02fb-45b5-8f02-d988b621af95', 'c9489b99-4f00-4e0d-9cf9-dad42b3e1b20', 'Phytohormones (plant growth regulators) are naturally occurring organic compounds — including auxins, gibberellins, cytokinins, ethylene, and abscisic acid — that, even at very low concentrations, regulate diverse aspects of plant growth, development, and responses to the environment.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6b5a6385-b472-47a9-b5a1-acdf3d1c1bbf', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 124, 'Cleistogamous flowers, found in a few plant species, are flowers that:', 'Biology', 'Sexual Reproduction in Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9a470167-50e6-4bc7-a20b-3280aec568db', '6b5a6385-b472-47a9-b5a1-acdf3d1c1bbf', 0, 'Never open at all and are obligately self-pollinated within the closed bud');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('220bbdcd-946c-4af3-aaaa-2c6412ac4fff', '6b5a6385-b472-47a9-b5a1-acdf3d1c1bbf', 1, 'Always open widely to maximize cross-pollination by insects');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1b918783-a3ea-4529-804c-f9981c9d6bf9', '6b5a6385-b472-47a9-b5a1-acdf3d1c1bbf', 2, 'Produce no pollen whatsoever');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f2ef8eb-1535-4a04-9f39-0a506d1ed4e6', '6b5a6385-b472-47a9-b5a1-acdf3d1c1bbf', 3, 'Are exclusively found in aquatic plants');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6b5a6385-b472-47a9-b5a1-acdf3d1c1bbf', '9a470167-50e6-4bc7-a20b-3280aec568db', 'Cleistogamous flowers remain closed and never open, making self-pollination obligatory within the bud — this guarantees seed production (assurance reproduction) even in the absence of pollinators, though it eliminates the genetic benefits of cross-pollination.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e4ffcefb-c6e0-4b87-954b-52afd66277cd', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 125, 'Incomplete dominance, as observed in the flower color of Mirabilis jalapa (four o''clock plant), results in a heterozygous offspring showing:', 'Biology', 'Principles of Inheritance and Variation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c8f5e88-07f4-4161-9189-fb8c3f854561', 'e4ffcefb-c6e0-4b87-954b-52afd66277cd', 0, 'A phenotype identical to one of the two homozygous parents');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91534f66-06da-4c99-93bc-80cdcd089443', 'e4ffcefb-c6e0-4b87-954b-52afd66277cd', 1, 'An intermediate (blended) phenotype between the two homozygous parental phenotypes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1149c5c7-7b83-41e3-b4af-ab38bd8fc0d5', 'e4ffcefb-c6e0-4b87-954b-52afd66277cd', 2, 'A phenotype completely unrelated to either parent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5f7ab2f0-c849-4f9c-9944-25095cc183fb', 'e4ffcefb-c6e0-4b87-954b-52afd66277cd', 3, 'Two completely separate flower colors on the same plant simultaneously');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e4ffcefb-c6e0-4b87-954b-52afd66277cd', '91534f66-06da-4c99-93bc-80cdcd089443', 'In incomplete dominance, neither allele is completely dominant over the other, so the heterozygote displays an intermediate phenotype — the classic example being pink flowers resulting from a cross between red-flowered and white-flowered four o''clock plants.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ad4d4f24-708c-442b-ad3b-700d20d2e0b9', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 126, 'Introns, present within eukaryotic genes, are:', 'Biology', 'Molecular Basis of Inheritance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bacbbcc8-823a-4f9b-96af-b59694d04202', 'ad4d4f24-708c-442b-ad3b-700d20d2e0b9', 0, 'Coding sequences retained in mature mRNA');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2c050c8c-f7ba-4626-980b-b3a1dd4c2b48', 'ad4d4f24-708c-442b-ad3b-700d20d2e0b9', 1, 'Non-coding intervening sequences that are removed from the primary transcript (hnRNA) during RNA splicing');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('46312c14-360d-4d7c-a989-4ad905bb7eff', 'ad4d4f24-708c-442b-ad3b-700d20d2e0b9', 2, 'Found exclusively in prokaryotic genes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0da6cb07-a2ea-4e8e-81d1-c5721dd4edc1', 'ad4d4f24-708c-442b-ad3b-700d20d2e0b9', 3, 'Sequences that are never transcribed at all, even into the primary transcript');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ad4d4f24-708c-442b-ad3b-700d20d2e0b9', '2c050c8c-f7ba-4626-980b-b3a1dd4c2b48', 'Introns are non-coding sequences interspersed within a eukaryotic gene''s coding sequence; they ARE initially transcribed into the primary RNA transcript (hnRNA), but are then excised (removed) during RNA splicing, with the remaining exons joined together to form mature mRNA.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8efcd572-de2a-4859-b923-d3eff9bac634', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 127, 'Connecting links (or missing links), such as Archaeopteryx, are of particular evolutionary interest because they display:', 'Biology', 'Evolution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('65454461-07bf-4cbf-9d89-d2ba4763d073', '8efcd572-de2a-4859-b923-d3eff9bac634', 0, 'Characteristics belonging entirely and exclusively to only one group of organisms, with no mixed features');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('add3a5e9-64d6-4b16-ac67-489144abbaba', '8efcd572-de2a-4859-b923-d3eff9bac634', 1, 'A combination of characteristics from two different, otherwise distinct groups, supporting evolutionary relationships between them');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f9fe2bc8-669f-4eac-b472-dd984a1e8bfe', '8efcd572-de2a-4859-b923-d3eff9bac634', 2, 'No relationship to any evolutionary lineage at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('458a54da-5bcb-438d-86ad-6458b2ddd142', '8efcd572-de2a-4859-b923-d3eff9bac634', 3, 'Purely artificial, laboratory-created features');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8efcd572-de2a-4859-b923-d3eff9bac634', 'add3a5e9-64d6-4b16-ac67-489144abbaba', 'Connecting links like Archaeopteryx (showing both reptilian features, such as teeth and a long bony tail, and avian features, like feathers) demonstrate transitional characteristics bridging two major groups, supporting the idea of common evolutionary descent between them.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('952cec85-0951-4578-a74f-9623e56dd517', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 128, 'Somatic hybridization, a plant breeding technique, involves the fusion of:', 'Biology', 'Strategies for Enhancement in Food Production');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4dce94c5-ce86-476b-ad4d-db8cab5a106a', '952cec85-0951-4578-a74f-9623e56dd517', 0, 'Two gametes through normal sexual fertilization');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2f569b70-4cfa-4ae1-a47f-624b198599b8', '952cec85-0951-4578-a74f-9623e56dd517', 1, 'Two somatic (vegetative, non-reproductive) plant cells or their protoplasts, bypassing normal sexual reproduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3a85c2bf-aa21-4e65-a5b5-f86e47dce82e', '952cec85-0951-4578-a74f-9623e56dd517', 2, 'Only animal cells, not plant cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8e703ae-7ab7-4493-b192-742f16622024', '952cec85-0951-4578-a74f-9623e56dd517', 3, 'Two identical clones of the same single cell');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('952cec85-0951-4578-a74f-9623e56dd517', '2f569b70-4cfa-4ae1-a47f-624b198599b8', 'Somatic hybridization fuses protoplasts (cells with their walls removed) from two different plant sources (sometimes even from sexually incompatible species) to create a hybrid cell, which can then be cultured into a complete hybrid plant, bypassing normal sexual fertilization barriers.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('0a758c66-3e73-4764-8bc3-983f98a3a0a6', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 129, 'Statins, an important class of cholesterol-lowering drugs, were originally discovered as natural metabolic products of certain:', 'Biology', 'Microbes in Human Welfare');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('157fe570-5327-431b-a55c-811a98adbe07', '0a758c66-3e73-4764-8bc3-983f98a3a0a6', 0, 'Bacteria found only in the human gut');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('64c2780e-43ef-4157-90a4-090a11d753cd', '0a758c66-3e73-4764-8bc3-983f98a3a0a6', 1, 'Fungi (e.g., Monascus purpureus), which produce them as secondary metabolites');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d79ff220-c370-410b-8824-67e99e3701e2', '0a758c66-3e73-4764-8bc3-983f98a3a0a6', 2, 'Viruses');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0151c35-ba85-4a35-810a-3d0af7f11b6b', '0a758c66-3e73-4764-8bc3-983f98a3a0a6', 3, 'Green algae');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('0a758c66-3e73-4764-8bc3-983f98a3a0a6', '64c2780e-43ef-4157-90a4-090a11d753cd', 'Statins were originally isolated as natural secondary metabolites produced by certain fungi (e.g., from Monascus and Penicillium species), which block the enzyme HMG-CoA reductase, a key step in cholesterol biosynthesis.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('208b0786-7c78-4b0d-95f6-ecee3679b321', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 130, 'Southern blotting, a molecular biology technique, is used specifically to detect and identify a particular sequence of:', 'Biology', 'Biotechnology — Principles and Processes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1a07d834-3bde-4049-bbf5-81b0938c265d', '208b0786-7c78-4b0d-95f6-ecee3679b321', 0, 'Protein');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9144b493-88dc-4ba2-87c5-917af2d2d5cb', '208b0786-7c78-4b0d-95f6-ecee3679b321', 1, 'DNA, using a labeled complementary probe after gel electrophoresis and transfer to a membrane');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f0223d6-2b5a-41d7-a9f8-eeb10f2182ef', '208b0786-7c78-4b0d-95f6-ecee3679b321', 2, 'RNA exclusively, never DNA');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ca04b81d-d972-4a74-b356-49c3a419c8d3', '208b0786-7c78-4b0d-95f6-ecee3679b321', 3, 'Lipids');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('208b0786-7c78-4b0d-95f6-ecee3679b321', '9144b493-88dc-4ba2-87c5-917af2d2d5cb', 'Southern blotting transfers electrophoretically separated DNA fragments onto a membrane, then uses a labeled probe complementary to a target sequence to detect its presence/location — a foundational technique named after its inventor, Edwin Southern (Northern blotting for RNA and Western blotting for protein are later, related techniques named by analogy).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('ec0b5652-2430-42d6-ac87-ea670cbd64dd', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 131, 'Commensalism, a type of species interaction, differs from mutualism in that in commensalism:', 'Biology', 'Organisms and Populations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0416eb7f-bb34-45e6-9c30-59f69fca5e1a', 'ec0b5652-2430-42d6-ac87-ea670cbd64dd', 0, 'Both interacting species benefit equally from the relationship');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2aef45e9-3d60-4d08-b581-72830e8dd875', 'ec0b5652-2430-42d6-ac87-ea670cbd64dd', 1, 'One species benefits while the other is neither significantly helped nor harmed');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('843d7da5-e918-4951-9a3f-687f0bf0a007', 'ec0b5652-2430-42d6-ac87-ea670cbd64dd', 2, 'Both species are harmed by the interaction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('10a04459-3439-438d-b964-7ea534f5b42c', 'ec0b5652-2430-42d6-ac87-ea670cbd64dd', 3, 'One species is always killed by the other');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('ec0b5652-2430-42d6-ac87-ea670cbd64dd', '2aef45e9-3d60-4d08-b581-72830e8dd875', 'Commensalism is a (+,0) interaction — one species benefits while the other experiences no significant positive or negative effect, distinct from mutualism (+,+), where both species derive benefit.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f68d6fae-0b6d-441d-b6ab-9602e870d30f', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 132, 'In an ecological pyramid of energy, unlike a pyramid of numbers or biomass, the shape is:', 'Biology', 'Ecosystem');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fcf079dc-0e27-477d-ab0f-78d34a71dda1', 'f68d6fae-0b6d-441d-b6ab-9602e870d30f', 0, 'Sometimes inverted, depending on the ecosystem type');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9dc834ee-aff1-4c46-8788-75939c2c8a03', 'f68d6fae-0b6d-441d-b6ab-9602e870d30f', 1, 'Always upright, since energy is progressively lost (mostly as heat) at each successive trophic level, per the second law of thermodynamics');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('abb016d1-48ad-409e-b499-26c3155402e4', 'f68d6fae-0b6d-441d-b6ab-9602e870d30f', 2, 'Always exactly rectangular with equal energy at each level');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0285cdb6-f81f-4cb7-bcec-19a23e896bb3', 'f68d6fae-0b6d-441d-b6ab-9602e870d30f', 3, 'Undefined, since energy cannot be measured at different trophic levels');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f68d6fae-0b6d-441d-b6ab-9602e870d30f', '9dc834ee-aff1-4c46-8788-75939c2c8a03', 'Unlike pyramids of numbers or biomass (which can sometimes be inverted, e.g., in some aquatic ecosystems), the pyramid of energy is ALWAYS upright, since energy is inevitably lost as heat at each trophic transfer (per the second law of thermodynamics), meaning each successive level always has less available energy than the one below it.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7e772af2-ba32-4d42-aaf7-52187b1a5ca9', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 133, 'The Western Ghats and Sri Lanka together constitute one of the recognized global biodiversity hotspots, characterized by:', 'Biology', 'Biodiversity and Conservation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f77f443a-5790-4c0d-9c4d-568c28b5dea4', '7e772af2-ba32-4d42-aaf7-52187b1a5ca9', 0, 'Extremely low species richness with minimal conservation concern');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4361fdbf-5b5e-4508-934d-fea92dc1a7c0', '7e772af2-ba32-4d42-aaf7-52187b1a5ca9', 1, 'Exceptional levels of species endemism combined with significant habitat loss/threat, warranting high conservation priority');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5468713-bf4a-4870-ba11-545139034bcb', '7e772af2-ba32-4d42-aaf7-52187b1a5ca9', 2, 'A region with no plant or animal life of interest');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9677e3ed-3379-4a95-85da-39f7a9d94f04', '7e772af2-ba32-4d42-aaf7-52187b1a5ca9', 3, 'An area entirely free from any human impact or habitat loss');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7e772af2-ba32-4d42-aaf7-52187b1a5ca9', '4361fdbf-5b5e-4508-934d-fea92dc1a7c0', 'The Western Ghats-Sri Lanka hotspot is recognized for its unusually high species richness and endemism (many species found nowhere else), combined with substantial ongoing habitat loss, making it a globally significant priority region for biodiversity conservation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2ca208f1-717e-4df6-a03c-d434a1d60c57', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 134, 'Annual rings, visible in a cross-section of a woody dicot stem, are formed due to:', 'Biology', 'Anatomy of Flowering Plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6e2e504e-ab25-439b-86d0-c8e89dfdc809', '2ca208f1-717e-4df6-a03c-d434a1d60c57', 0, 'Random, unpredictable cell division with no seasonal pattern');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1942a83a-2672-48c6-ac73-3de449df9faf', '2ca208f1-717e-4df6-a03c-d434a1d60c57', 1, 'The differential activity of the vascular cambium during favorable (spring, producing lighter, larger-celled wood) and unfavorable (autumn/winter, producing darker, smaller-celled wood) growth seasons');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0df2226-b8a2-4d4d-9a94-4ef3becdc49a', '2ca208f1-717e-4df6-a03c-d434a1d60c57', 2, 'Only nighttime growth, with no daytime contribution');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('02aee241-87be-461e-a7be-e16c60d61407', '2ca208f1-717e-4df6-a03c-d434a1d60c57', 3, 'The complete cessation of all cambial activity throughout the year');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2ca208f1-717e-4df6-a03c-d434a1d60c57', '1942a83a-2672-48c6-ac73-3de449df9faf', 'Annual rings result from the cambium''s seasonally varying activity: faster growth in favorable seasons produces larger, lighter-colored xylem cells (spring/early wood), while slower growth in less favorable seasons produces smaller, denser, darker cells (autumn/late wood) — the visible boundary between one year''s late wood and the next year''s early wood marks each annual ring.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('563ff396-49ef-4a75-b61e-81f852b7186f', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 135, 'A plant growth regulator that is a gas at normal temperature and pressure, unlike the other classical phytohormones which are typically solids, is:', 'Biology', 'Plant Growth and Development');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7a0f4477-a4fc-4b56-97db-bb813fbe3d3c', '563ff396-49ef-4a75-b61e-81f852b7186f', 0, 'Auxin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('91650de8-64f4-4f6a-b26e-6d5eaa78197f', '563ff396-49ef-4a75-b61e-81f852b7186f', 1, 'Gibberellin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bf4be918-9494-4244-bc5d-40210c58b56e', '563ff396-49ef-4a75-b61e-81f852b7186f', 2, 'Ethylene');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17fe1e95-04d6-4675-9d1d-0606dff1cad3', '563ff396-49ef-4a75-b61e-81f852b7186f', 3, 'Cytokinin');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('563ff396-49ef-4a75-b61e-81f852b7186f', 'bf4be918-9494-4244-bc5d-40210c58b56e', 'Ethylene is unique among the classical plant hormones in being a simple gaseous hydrocarbon at normal temperature and pressure, readily diffusing through plant tissues and even between neighboring plants/fruits, unlike the other hormones, which are typically solid organic compounds.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('5aefef03-cf11-4045-86c1-fa5f94920b9c', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 136, 'Phylum Arthropoda is subdivided into several classes; Class Insecta is distinguished from Class Crustacea primarily by having:', 'Biology', 'Animal Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('73838e5e-0e18-4c6c-af1c-a884ea991412', '5aefef03-cf11-4045-86c1-fa5f94920b9c', 0, 'Three pairs of walking legs and typically one or two pairs of wings, versus crustaceans'' generally more numerous, often biramous appendages');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('23e6795b-17fb-4a0f-8285-40a224706c14', '5aefef03-cf11-4045-86c1-fa5f94920b9c', 1, 'Gills as the only respiratory organ, exactly as in crustaceans');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('26603203-9abc-479a-a58d-6bfba5fa12ff', '5aefef03-cf11-4045-86c1-fa5f94920b9c', 2, 'No jointed appendages at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37cde4d1-70d3-44f6-8a82-b0a28129a694', '5aefef03-cf11-4045-86c1-fa5f94920b9c', 3, 'An entirely aquatic lifestyle, identical to crustaceans');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('5aefef03-cf11-4045-86c1-fa5f94920b9c', '73838e5e-0e18-4c6c-af1c-a884ea991412', 'Insects characteristically have three pairs of jointed legs and often one or two pairs of wings, and typically respire via tracheae; crustaceans generally have more numerous appendages (often biramous, or two-branched) and typically respire via gills, reflecting their largely aquatic lifestyle.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('331fb492-47cf-49e0-9a50-3d83a19ec173', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 137, 'The class Chondrichthyes (cartilaginous fish, e.g., sharks and rays) is distinguished from Class Osteichthyes (bony fish) primarily by having an endoskeleton made of:', 'Biology', 'Animal Kingdom');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3319ee4-eac4-479f-8fdf-6dd8dbf3ee32', '331fb492-47cf-49e0-9a50-3d83a19ec173', 0, 'Bone, exactly like Osteichthyes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d00292c-8a43-460f-9271-8c7acf886478', '331fb492-47cf-49e0-9a50-3d83a19ec173', 1, 'Cartilage, rather than true bone');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('03519e90-faa0-4ba4-9909-8c7efd5f2f5c', '331fb492-47cf-49e0-9a50-3d83a19ec173', 2, 'No endoskeleton at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('645a914d-d02b-4dc2-896c-b8c233065288', '331fb492-47cf-49e0-9a50-3d83a19ec173', 3, 'A combination of chitin and cartilage');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('331fb492-47cf-49e0-9a50-3d83a19ec173', '9d00292c-8a43-460f-9271-8c7acf886478', 'Chondrichthyes have a skeleton composed of cartilage rather than true, ossified bone, which is the primary distinguishing feature separating them from the bony fish (Osteichthyes).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('e80aa413-2ff1-4d02-bab8-1d3c99d768e0', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 138, 'The cockroach, a commonly studied representative arthropod, possesses an open type of circulatory system in which:', 'Biology', 'Structural Organisation in Animals — Cockroach');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('002cc4b3-2a93-4bd9-86ac-61e751477b3a', 'e80aa413-2ff1-4d02-bab8-1d3c99d768e0', 0, 'Blood always flows exclusively within closed vessels, never bathing tissues directly');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b23376ef-a93d-4f7f-acab-3953a14347b4', 'e80aa413-2ff1-4d02-bab8-1d3c99d768e0', 1, 'Blood (haemolymph) is not always confined to vessels and directly bathes the body tissues in open spaces called haemocoel');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('da982271-d832-49a3-9e2b-f9b1d4b293a8', 'e80aa413-2ff1-4d02-bab8-1d3c99d768e0', 2, 'There is no circulatory system at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d8757ae1-44fd-47dd-bf1e-6567a0beafdb', 'e80aa413-2ff1-4d02-bab8-1d3c99d768e0', 3, 'Blood is pumped only by capillaries, with no heart involved');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('e80aa413-2ff1-4d02-bab8-1d3c99d768e0', 'b23376ef-a93d-4f7f-acab-3953a14347b4', 'In an open circulatory system (as in cockroaches and most other arthropods and molluscs), haemolymph is pumped by a dorsal heart into open body cavities (the haemocoel), directly bathing tissues, rather than being confined entirely within a closed network of vessels as in a closed circulatory system.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7a1b70f3-da03-46e9-b3d3-4039742a5d37', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 139, 'Vital capacity, an important measure of lung function, is defined as the:', 'Biology', 'Breathing and Exchange of Gases — Volumes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4f810ee7-5cdf-4a44-84fa-d6d879088e68', '7a1b70f3-da03-46e9-b3d3-4039742a5d37', 0, 'Total volume of air the lungs can hold, including residual volume');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c25cc1cc-5a51-4dd3-952e-cda837f65777', '7a1b70f3-da03-46e9-b3d3-4039742a5d37', 1, 'Maximum volume of air that can be forcibly expelled after taking the deepest possible breath');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c9005220-f641-45bc-aef8-ce6394fde66f', '7a1b70f3-da03-46e9-b3d3-4039742a5d37', 2, 'Volume of air in normal, quiet breathing only');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b0c8c62a-f7f4-4baa-adde-b417f33cc1f9', '7a1b70f3-da03-46e9-b3d3-4039742a5d37', 3, 'Volume of air remaining in the lungs after normal expiration');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7a1b70f3-da03-46e9-b3d3-4039742a5d37', 'c25cc1cc-5a51-4dd3-952e-cda837f65777', 'Vital capacity is the maximum volume of air that can be exhaled after a maximal inhalation — it equals total lung capacity minus residual volume (the air that always remains and cannot be exhaled).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('a5193c62-2f70-400b-a007-73f8e5f69654', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 140, 'The cardiac cycle, encompassing one complete heartbeat, in a healthy adult human at rest, typically takes approximately how long?', 'Biology', 'Body Fluids and Circulation — Cardiac Cycle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6530b6c9-4832-4703-95ba-13ee403076b4', 'a5193c62-2f70-400b-a007-73f8e5f69654', 0, '8 seconds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('290ed379-e3e7-4cc5-9010-55bb782c59aa', 'a5193c62-2f70-400b-a007-73f8e5f69654', 1, '0.8 seconds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2333392b-51eb-4150-a80f-3a5e0e256683', 'a5193c62-2f70-400b-a007-73f8e5f69654', 2, '80 seconds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db098f37-ed80-4098-8fc0-fa2d0615750a', 'a5193c62-2f70-400b-a007-73f8e5f69654', 3, '0.08 seconds');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('a5193c62-2f70-400b-a007-73f8e5f69654', '290ed379-e3e7-4cc5-9010-55bb782c59aa', 'A complete cardiac cycle (systole and diastole of both atria and ventricles) in a resting adult typically takes about 0.8 seconds, corresponding to a normal resting heart rate of roughly 72-75 beats per minute.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('624e18a8-c37f-492a-9f03-501f9d64d671', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 141, 'Osmoregulation refers to an organism''s ability to:', 'Biology', 'Excretory Products and Their Elimination — Osmoregulation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3cb8dc88-2494-40ac-8ba8-b9c0d1f4b999', '624e18a8-c37f-492a-9f03-501f9d64d671', 0, 'Regulate its body temperature only, with no relation to water/solute balance');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c0701183-24b5-4629-bf7b-f37285bddf77', '624e18a8-c37f-492a-9f03-501f9d64d671', 1, 'Maintain a relatively constant internal osmotic concentration (water and solute balance) despite changes in the external environment');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a682e4a-ce78-47f8-b18c-d61858b621ae', '624e18a8-c37f-492a-9f03-501f9d64d671', 2, 'Regulate blood clotting exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f0ef21e-d89f-4a12-be9f-df1f035c18db', '624e18a8-c37f-492a-9f03-501f9d64d671', 3, 'Control the rate of nerve impulse conduction');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('624e18a8-c37f-492a-9f03-501f9d64d671', 'c0701183-24b5-4629-bf7b-f37285bddf77', 'Osmoregulation is the physiological process by which an organism actively maintains a stable internal balance of water and dissolved solutes, despite variations in external osmotic conditions — a key function of excretory/renal systems in many animals.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1f36e43a-d148-4bf1-87a9-d9ae1e9ff19d', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 142, 'Smooth (visceral) muscle, found in the walls of internal organs like the intestine and blood vessels, is characterized by being:', 'Biology', 'Locomotion and Movement — Types of Muscle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c312cc35-997d-42c0-a8a2-cab9470d2ed4', '1f36e43a-d148-4bf1-87a9-d9ae1e9ff19d', 0, 'Voluntary and striated');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4636d474-9c68-47e0-9450-846b401fd83e', '1f36e43a-d148-4bf1-87a9-d9ae1e9ff19d', 1, 'Involuntary and unstriated (non-striated)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a8e784aa-baaa-4577-a3db-be2cf1d5aff8', '1f36e43a-d148-4bf1-87a9-d9ae1e9ff19d', 2, 'Voluntary and unstriated');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('33ab1a74-8a21-4c7e-bea6-ebf0c86767fc', '1f36e43a-d148-4bf1-87a9-d9ae1e9ff19d', 3, 'Found exclusively in the heart');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1f36e43a-d148-4bf1-87a9-d9ae1e9ff19d', '4636d474-9c68-47e0-9450-846b401fd83e', 'Smooth muscle is involuntary (not under conscious control) and lacks the visible striations seen in skeletal and cardiac muscle, and is found lining the walls of internal organs like the digestive tract, blood vessels, and bladder.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('dfd6a5e6-c410-440c-aefb-91c6fc4d6785', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 143, 'Acetylcholine, a widely studied neurotransmitter, is broken down in the synaptic cleft after its action by the enzyme:', 'Biology', 'Neural Control and Coordination — Neurotransmitters');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1ce35a4f-d747-4869-a167-9f5f9af6254c', 'dfd6a5e6-c410-440c-aefb-91c6fc4d6785', 0, 'Amylase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0725bf39-fc26-48e9-8952-80fb6686f3a2', 'dfd6a5e6-c410-440c-aefb-91c6fc4d6785', 1, 'Acetylcholinesterase, which hydrolyzes it into choline and acetate, terminating its signaling effect');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6bf49be0-e031-4e12-98e0-ce1d9462014b', 'dfd6a5e6-c410-440c-aefb-91c6fc4d6785', 2, 'Lipase');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3c771305-97bd-47ee-a87d-dd09dd2239fd', 'dfd6a5e6-c410-440c-aefb-91c6fc4d6785', 3, 'Pepsin');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dfd6a5e6-c410-440c-aefb-91c6fc4d6785', '0725bf39-fc26-48e9-8952-80fb6686f3a2', 'Acetylcholinesterase rapidly hydrolyzes acetylcholine into choline and acetate in the synaptic cleft, terminating the neurotransmitter''s stimulatory effect and allowing the synapse to reset for the next impulse — inhibition of this enzyme (e.g., by certain nerve agents/pesticides) causes prolonged, excessive stimulation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('30e0cc24-d694-4eca-81ca-c65675be67ec', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 144, 'Testosterone, the primary male sex hormone, is secreted mainly by the:', 'Biology', 'Chemical Coordination and Integration — Gonadal Hormones');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8dc9018a-1e5c-44cd-8453-8514284c3ef5', '30e0cc24-d694-4eca-81ca-c65675be67ec', 0, 'Adrenal cortex exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('cac24fab-f10c-4730-a6e9-bb231b719447', '30e0cc24-d694-4eca-81ca-c65675be67ec', 1, 'Leydig cells (interstitial cells) of the testis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b7191a2f-78a8-40c5-a5cc-cef331cfa6a4', '30e0cc24-d694-4eca-81ca-c65675be67ec', 2, 'Sertoli cells of the testis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('67820d8b-3a85-4294-8695-3b3a541581ca', '30e0cc24-d694-4eca-81ca-c65675be67ec', 3, 'Anterior pituitary gland');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('30e0cc24-d694-4eca-81ca-c65675be67ec', 'cac24fab-f10c-4730-a6e9-bb231b719447', 'Testosterone is primarily secreted by the Leydig (interstitial) cells located between the seminiferous tubules of the testis, stimulated by luteinizing hormone (LH) from the pituitary; Sertoli cells, by contrast, support and nourish developing sperm cells within the tubules.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b3d25feb-9666-4168-a0d7-eb7b026d427d', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 145, 'The follicular phase of the human menstrual cycle is characterized primarily by:', 'Biology', 'Human Reproduction — Menstrual Cycle Phases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('93bda006-964e-446a-8361-a26130586608', 'b3d25feb-9666-4168-a0d7-eb7b026d427d', 0, 'Degeneration of the corpus luteum and shedding of the endometrium');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('826c1e6c-9edd-4d06-bcf7-8c82e77ff831', 'b3d25feb-9666-4168-a0d7-eb7b026d427d', 1, 'Development of ovarian follicles and rising estrogen levels, leading up to ovulation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a9396c4c-242b-493c-8f52-a5daec8b4d46', 'b3d25feb-9666-4168-a0d7-eb7b026d427d', 2, 'The luteal phase''s progesterone-dominated events');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f6a40c3-8c6c-47b6-ab65-8ef71a012679', 'b3d25feb-9666-4168-a0d7-eb7b026d427d', 3, 'Implantation of a fertilized egg');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b3d25feb-9666-4168-a0d7-eb7b026d427d', '826c1e6c-9edd-4d06-bcf7-8c82e77ff831', 'The follicular phase spans from the start of menstruation to ovulation, during which one or more ovarian follicles develop under FSH stimulation, with rising estrogen levels from the developing follicle(s) eventually triggering the LH surge that causes ovulation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c7b57cdc-91b3-4dcb-ae40-0b4ea09aa192', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 146, 'The PCPNDT Act in India specifically regulates the use of prenatal diagnostic techniques to prevent their misuse for:', 'Biology', 'Reproductive Health — Amniocentesis Regulation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dec00c1e-b661-4d92-b9c8-f9547032969a', 'c7b57cdc-91b3-4dcb-ae40-0b4ea09aa192', 0, 'Diagnosing genetic disorders, which the act completely bans under all circumstances');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd1214a1-4f63-4e97-8680-baa2ecccbf72', 'c7b57cdc-91b3-4dcb-ae40-0b4ea09aa192', 1, 'Sex determination of the fetus, which is prohibited to prevent female foeticide');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('97e765df-9e1e-4eaa-b732-aba18e8723f1', 'c7b57cdc-91b3-4dcb-ae40-0b4ea09aa192', 2, 'Detecting multiple pregnancies');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b4a373e-5f1b-4146-88d3-9753bbdd7bce', 'c7b57cdc-91b3-4dcb-ae40-0b4ea09aa192', 3, 'Testing for maternal blood type');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c7b57cdc-91b3-4dcb-ae40-0b4ea09aa192', 'fd1214a1-4f63-4e97-8680-baa2ecccbf72', 'The Pre-Conception and Pre-Natal Diagnostic Techniques (PCPNDT) Act specifically targets the misuse of techniques like ultrasound and amniocentesis for fetal sex determination, which has historically been linked to sex-selective abortion — legitimate genetic disorder diagnosis remains permitted under appropriate regulation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1fb1e344-fb1a-4390-bcd5-619f9352b864', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 147, 'Innate immunity, present from birth, differs from acquired (adaptive) immunity in that innate immunity:', 'Biology', 'Human Health and Disease — Types of Immunity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a6240bc6-207f-4da7-9b45-89004376a291', '1fb1e344-fb1a-4390-bcd5-619f9352b864', 0, 'Is highly specific to a particular pathogen and improves with repeated exposure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('707610c7-619d-4254-93c0-05873b9c55a1', '1fb1e344-fb1a-4390-bcd5-619f9352b864', 1, 'Provides a general, non-specific first line of defense against pathogens, without pathogen-specific memory');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('89b4c6bd-ef4b-45d0-bc81-0fafe8421a70', '1fb1e344-fb1a-4390-bcd5-619f9352b864', 2, 'Only develops after vaccination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f80e369-9200-4604-916e-7da3fae6a071', '1fb1e344-fb1a-4390-bcd5-619f9352b864', 3, 'Is entirely absent in humans');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1fb1e344-fb1a-4390-bcd5-619f9352b864', '707610c7-619d-4254-93c0-05873b9c55a1', 'Innate immunity comprises the body''s non-specific defenses (physical barriers, phagocytic cells, inflammatory response) present from birth, acting broadly against many pathogens without prior exposure or memory — unlike adaptive immunity, which develops pathogen-specific responses and immunological memory over time.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1177f13f-419d-4fd2-8be5-aa25d2ddcd35', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 148, 'Metastatic tumours are considered more dangerous than benign tumours primarily because metastatic (malignant) cells:', 'Biology', 'Human Health and Disease — Cancer Biology');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b1b06bf9-55ec-4554-aa2b-743c793ca068', '1177f13f-419d-4fd2-8be5-aa25d2ddcd35', 0, 'Remain confined to their original location, causing no further complications');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c8433415-fcf1-4489-88f9-a134fbcbd64f', '1177f13f-419d-4fd2-8be5-aa25d2ddcd35', 1, 'Can invade surrounding tissue and spread via blood/lymph to establish secondary tumours at distant sites');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0c1300b7-4ef9-46d6-b2df-d7444635e20a', '1177f13f-419d-4fd2-8be5-aa25d2ddcd35', 2, 'Never grow in size after initial formation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7ff61f7d-4286-4ef3-b1be-7722e057b769', '1177f13f-419d-4fd2-8be5-aa25d2ddcd35', 3, 'Are always smaller in size than benign tumours');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1177f13f-419d-4fd2-8be5-aa25d2ddcd35', 'c8433415-fcf1-4489-88f9-a134fbcbd64f', 'Malignant tumour cells possess the ability to invade adjacent tissue and metastasize (spread) via the blood or lymphatic system to distant sites in the body, forming secondary tumours — a defining and highly dangerous characteristic that benign tumours, which remain localized, do not share.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('afbe9996-4624-4e81-adf9-fe80fbe2dc3d', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 149, 'Fragmentation, an asexual reproductive strategy seen in organisms like Spirogyra, involves:', 'Biology', 'Reproduction in Organisms — Fragmentation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6d633a9e-005b-4e04-a646-118b4af04c47', 'afbe9996-4624-4e81-adf9-fe80fbe2dc3d', 0, 'The organism breaking into two or more fragments, each of which can grow into a complete new individual');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('08a39a6e-82e4-4552-a2c5-d28077139c75', 'afbe9996-4624-4e81-adf9-fe80fbe2dc3d', 1, 'Formation of specialized reproductive spores');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c37d1b7-67d9-4c3e-8ec9-fe3821e65b06', 'afbe9996-4624-4e81-adf9-fe80fbe2dc3d', 2, 'Fusion of two different individuals'' cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d3603c6b-1580-4da3-a7f8-7d0578ba2334', 'afbe9996-4624-4e81-adf9-fe80fbe2dc3d', 3, 'A process restricted only to animals, never algae');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('afbe9996-4624-4e81-adf9-fe80fbe2dc3d', '6d633a9e-005b-4e04-a646-118b4af04c47', 'In fragmentation, a parent organism (like the filamentous alga Spirogyra) simply breaks into two or more pieces, each fragment capable of growing and developing into a new, complete individual — a simple form of asexual, vegetative reproduction.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('6a9484a4-18a9-449a-adf8-24e771de1d26', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 150, 'Haemophilia, a well-studied X-linked recessive genetic disorder, is characterized by:', 'Biology', 'Genetics and Evolution — Mendelian Disorders');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ea6d243a-8d19-4034-888e-61a514007b56', '6a9484a4-18a9-449a-adf8-24e771de1d26', 0, 'Excessive, uncontrolled blood clotting');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8e6f7c6c-6e2a-48fb-865e-81da0bb4c636', '6a9484a4-18a9-449a-adf8-24e771de1d26', 1, 'A deficiency in specific blood clotting factors, leading to prolonged, uncontrolled bleeding even from minor injuries');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e287dbd-ac0a-4cd6-ad84-cfc9b8d3b552', '6a9484a4-18a9-449a-adf8-24e771de1d26', 2, 'A defect in haemoglobin structure causing sickle-shaped red blood cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dd9b1f75-7d40-4aca-bf68-36f457d6827a', '6a9484a4-18a9-449a-adf8-24e771de1d26', 3, 'Complete absence of red blood cells');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('6a9484a4-18a9-449a-adf8-24e771de1d26', '8e6f7c6c-6e2a-48fb-865e-81da0bb4c636', 'Haemophilia results from a deficiency in specific clotting factors (e.g., Factor VIII in Haemophilia A), impairing the normal blood clotting cascade and leading to excessive, prolonged bleeding even from relatively minor injuries — inherited in an X-linked recessive pattern, predominantly affecting males.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1c3904c7-8208-491c-a6a2-d070d8779cab', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 151, 'Stabilizing selection, one of the three main types of natural selection based on phenotypic effect, tends to:', 'Biology', 'Evolution — Types of Natural Selection');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('56e141d7-7bd4-4331-af3e-1796609391ff', '1c3904c7-8208-491c-a6a2-d070d8779cab', 0, 'Favor individuals at both phenotypic extremes, disfavoring the average/intermediate phenotype');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0f628808-06fa-4535-bd68-2a6c98c9ea9e', '1c3904c7-8208-491c-a6a2-d070d8779cab', 1, 'Favor individuals with the average (intermediate) phenotype, reducing variation by selecting against both extremes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5a9740a7-3f29-4fd4-9bd5-af9f6f7cda7a', '1c3904c7-8208-491c-a6a2-d070d8779cab', 2, 'Favor only one phenotypic extreme, shifting the population''s average over time');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8f3c4670-fc86-4e40-aef9-7e3d4b17e881', '1c3904c7-8208-491c-a6a2-d070d8779cab', 3, 'Have no effect on the population''s phenotypic distribution at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1c3904c7-8208-491c-a6a2-d070d8779cab', '0f628808-06fa-4535-bd68-2a6c98c9ea9e', 'Stabilizing selection favors individuals near the population''s average phenotype for a trait, selecting against both extreme variants — this tends to reduce phenotypic variation over time and maintain the status quo, as opposed to directional selection (favoring one extreme) or disruptive selection (favoring both extremes).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7227fb43-348a-4d94-9ffb-a6594d3a1b53', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 152, 'Somatic gene therapy, as distinguished from germline gene therapy, involves correcting a genetic defect in:', 'Biology', 'Biotechnology and Its Applications — Gene Therapy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('57c18348-3001-465b-a7b7-db4c802b512c', '7227fb43-348a-4d94-9ffb-a6594d3a1b53', 0, 'Reproductive (germ) cells, so the correction is passed on to all future generations');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('355dadb6-cd7b-4448-a4d6-ce6b6b97277a', '7227fb43-348a-4d94-9ffb-a6594d3a1b53', 1, 'Non-reproductive (somatic) body cells of an individual, with the genetic correction not inherited by offspring');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('17bacae2-97b8-40f2-9f76-4da14651ca92', '7227fb43-348a-4d94-9ffb-a6594d3a1b53', 2, 'No actual cells; it is a purely theoretical concept with no real application');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('34eb1236-caab-4afe-939d-c9c369944ec2', '7227fb43-348a-4d94-9ffb-a6594d3a1b53', 3, 'Only cells of the immune system, with no other application');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7227fb43-348a-4d94-9ffb-a6594d3a1b53', '355dadb6-cd7b-4448-a4d6-ce6b6b97277a', 'Somatic gene therapy targets and corrects genetic defects within an individual''s non-reproductive (somatic) cells, so any correction benefits only that individual and is NOT passed on to their offspring — distinct from the far more ethically contentious and less established concept of germline gene therapy, which would alter reproductive cells.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b854424e-2b55-42d1-a65f-18ef0b5b676d', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 153, 'The logistic growth model, unlike the exponential growth model, incorporates:', 'Biology', 'Organisms and Populations — Population Growth');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a385fee2-f193-457d-8a22-ab5d857fd32f', 'b854424e-2b55-42d1-a65f-18ef0b5b676d', 0, 'Unlimited resource availability at all population sizes');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('759cf08d-ccc7-4a7b-a6f2-2a51f7e3852d', 'b854424e-2b55-42d1-a65f-18ef0b5b676d', 1, 'Environmental resistance and carrying capacity (K), causing growth rate to slow as population size approaches K');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0777e617-b604-4739-9c52-e6d09732b1bf', 'b854424e-2b55-42d1-a65f-18ef0b5b676d', 2, 'A constant, unchanging growth rate regardless of population size');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('565ca142-ec65-4ca4-8cc6-83dd9bf13807', 'b854424e-2b55-42d1-a65f-18ef0b5b676d', 3, 'No relationship between population size and resource availability');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b854424e-2b55-42d1-a65f-18ef0b5b676d', '759cf08d-ccc7-4a7b-a6f2-2a51f7e3852d', 'The logistic (S-shaped/sigmoid) growth model accounts for limited resources by incorporating a carrying capacity (K); as population size (N) approaches K, growth rate progressively slows, unlike the unrestricted exponential (J-shaped) model, which assumes unlimited resources indefinitely.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1ac34ea8-f15b-4d1a-ae43-80a743ffb1ce', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 154, 'Ecological succession that begins in an area which previously supported vegetation but had it removed by a disturbance (like fire or flood), where soil is already present, is called:', 'Biology', 'Ecosystem — Community Ecology');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('37f0833e-3693-42f9-af9f-c6a3d38c1997', '1ac34ea8-f15b-4d1a-ae43-80a743ffb1ce', 0, 'Primary succession');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b9d76aec-7068-4467-9daf-895edcd59b6f', '1ac34ea8-f15b-4d1a-ae43-80a743ffb1ce', 1, 'Secondary succession, which generally proceeds faster than primary succession since soil and some propagules are already present');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4cf59204-e886-4f97-b46c-d3cb6fbbe3c1', '1ac34ea8-f15b-4d1a-ae43-80a743ffb1ce', 2, 'No succession occurs in such areas');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('324d341d-aa25-4e0e-8fc5-25b24fe86cd2', '1ac34ea8-f15b-4d1a-ae43-80a743ffb1ce', 3, 'Climax succession, a term describing the endpoint, not the starting type');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1ac34ea8-f15b-4d1a-ae43-80a743ffb1ce', 'b9d76aec-7068-4467-9daf-895edcd59b6f', 'Secondary succession occurs on a site that already has soil (and possibly some surviving seeds/roots) following a disturbance that removed the existing vegetation — since soil formation (the slowest part of primary succession) is not needed from scratch, secondary succession generally proceeds considerably faster than primary succession.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('c6a7109a-a739-4541-85c1-f80a9cf29787', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 155, 'Mass extinction events in Earth''s history, such as the one at the end of the Cretaceous period, are characterized by:', 'Biology', 'Biodiversity and Conservation — Extinction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('af888c7e-f55a-451f-8880-66539e744956', 'c6a7109a-a739-4541-85c1-f80a9cf29787', 0, 'The gradual, slow disappearance of a single species over millions of years');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2e4445a6-b663-43f1-b03a-f9e70e15c04a', 'c6a7109a-a739-4541-85c1-f80a9cf29787', 1, 'A relatively rapid, geologically brief loss of a large proportion of Earth''s species across many different taxonomic groups simultaneously');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8ec67d2a-5570-4fcd-bce5-87d45f22f4b7', 'c6a7109a-a739-4541-85c1-f80a9cf29787', 2, 'An event affecting only marine species, never terrestrial ones');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c479e5c2-e79b-4123-8c62-a0adbf59b2d5', 'c6a7109a-a739-4541-85c1-f80a9cf29787', 3, 'A phenomenon that has never actually occurred in Earth''s history');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('c6a7109a-a739-4541-85c1-f80a9cf29787', '2e4445a6-b663-43f1-b03a-f9e70e15c04a', 'Mass extinctions are defined by the relatively rapid (in geological terms) loss of a very large fraction of Earth''s biodiversity across numerous, often unrelated taxonomic groups simultaneously, distinguishing them from the continuous, lower-level background extinction rate observed at other times.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('48285976-d0d1-4c20-858d-fe7cd7de59b4', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 156, 'The primary functions carried out in the human large intestine include:', 'Biology', 'Digestion and Absorption — Large Intestine');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eb2956b1-5d07-4162-989b-4113a32d3b54', '48285976-d0d1-4c20-858d-fe7cd7de59b4', 0, 'The majority of enzymatic digestion of all nutrients');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1cef6bb7-9394-43b0-96bd-29c484bc4540', '48285976-d0d1-4c20-858d-fe7cd7de59b4', 1, 'Absorption of water and some minerals, and formation/storage of semi-solid faecal matter before elimination');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79296631-b88b-47f2-befe-944a2a1fe9f4', '48285976-d0d1-4c20-858d-fe7cd7de59b4', 2, 'Production of bile for fat digestion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('12adb47b-37ad-415e-a9ba-55d5112b2624', '48285976-d0d1-4c20-858d-fe7cd7de59b4', 3, 'Absorption of the majority of digested nutrients, a role primarily belonging to the small intestine');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('48285976-d0d1-4c20-858d-fe7cd7de59b4', '1cef6bb7-9394-43b0-96bd-29c484bc4540', 'The large intestine''s main roles are absorbing water and certain electrolytes from the remaining undigested material, and compacting/storing the resulting semi-solid waste (faeces) before elimination — the bulk of nutrient digestion and absorption occurs earlier, in the small intestine.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f18acf5d-5311-44bc-9837-1a700d074d36', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 157, 'A subunit vaccine, one of several vaccine technology types, is composed of:', 'Biology', 'Human Health and Disease — Vaccines');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('129bfa5d-0f94-453a-85ca-e0597f7c01de', 'f18acf5d-5311-44bc-9837-1a700d074d36', 0, 'The complete, intact live pathogen');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa89cc25-232c-411b-9390-8843d67dca10', 'f18acf5d-5311-44bc-9837-1a700d074d36', 1, 'Only specific, purified antigenic fragments (such as a particular protein) of the pathogen, rather than the whole organism');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa439443-fe37-45be-a871-f55b97db3358', 'f18acf5d-5311-44bc-9837-1a700d074d36', 2, 'Only genetic material with no protein component at all');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6104fb31-2f2a-459f-b098-4e603d153ba8', 'f18acf5d-5311-44bc-9837-1a700d074d36', 3, 'Antibodies extracted directly from an already-immune individual');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f18acf5d-5311-44bc-9837-1a700d074d36', 'fa89cc25-232c-411b-9390-8843d67dca10', 'Subunit vaccines contain only carefully selected, purified antigenic components (such as a specific surface protein) of a pathogen, rather than the whole live or inactivated organism — designed to trigger a protective immune response with a reduced risk profile compared to whole-pathogen vaccines.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('aaa07f66-399c-49fd-8595-5668084df0dc', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 158, 'A fibrous joint, such as the sutures between the bones of the skull, is characterized by:', 'Biology', 'Locomotion and Movement — Joints');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4b129aa0-fa11-47a9-bc55-d37997b71aef', 'aaa07f66-399c-49fd-8595-5668084df0dc', 0, 'A fluid-filled cavity allowing extensive movement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ae75a64a-29b4-4cef-9fb8-3ee070813c08', 'aaa07f66-399c-49fd-8595-5668084df0dc', 1, 'Little to no movement, with bones joined directly by dense fibrous connective tissue');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b206bfa8-7de1-41f4-bae3-11317cd98e0b', 'aaa07f66-399c-49fd-8595-5668084df0dc', 2, 'Cartilage connecting the bones, allowing moderate movement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('47e8f63d-41c3-4a5a-8736-282b64a019b0', 'aaa07f66-399c-49fd-8595-5668084df0dc', 3, 'Being the most mobile joint type in the body');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('aaa07f66-399c-49fd-8595-5668084df0dc', 'ae75a64a-29b4-4cef-9fb8-3ee070813c08', 'Fibrous joints (like cranial sutures) are joined by dense fibrous connective tissue with little to no space between the bones, permitting little or no movement — providing strong, stable connections rather than mobility, unlike the freely movable synovial joints.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('65362525-7283-456d-8f6d-69d99efe2884', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 159, 'An electrocardiogram (ECG/EKG) is a diagnostic tool that records:', 'Biology', 'Body Fluids and Circulation — ECG');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2872bc2f-5b26-4559-abdd-c961e30334e2', '65362525-7283-456d-8f6d-69d99efe2884', 0, 'The mechanical pumping action of the heart directly, with no electrical component');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d2c9a60e-4a24-452c-8c14-2b7380e73307', '65362525-7283-456d-8f6d-69d99efe2884', 1, 'The electrical activity generated by the heart during each cardiac cycle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0ebc124c-a4ba-44cc-a444-cf938b176b18', '65362525-7283-456d-8f6d-69d99efe2884', 2, 'Only the heart''s physical size and shape');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fa00b7ad-2458-4cc7-9bad-dd8996da0d3c', '65362525-7283-456d-8f6d-69d99efe2884', 3, 'Blood pressure levels exclusively');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('65362525-7283-456d-8f6d-69d99efe2884', 'd2c9a60e-4a24-452c-8c14-2b7380e73307', 'An ECG records the characteristic electrical activity (depolarization and repolarization waves, such as the P, QRS, and T waves) generated by the heart''s specialized conducting tissue during each cardiac cycle, providing valuable diagnostic information about heart rhythm and function.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b9f2e207-8f61-4787-9025-af37e2623874', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 160, 'Sponges (Phylum Porifera) reproduce asexually, in some freshwater forms, through the formation of resistant structures called:', 'Biology', 'Animal Kingdom — Poriferan Features');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1d9ff2d2-1117-4dfa-979c-6ae7b92a53ba', 'b9f2e207-8f61-4787-9025-af37e2623874', 0, 'Gemmules, which can survive unfavorable conditions and develop into new sponges when conditions improve');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7b9d96ff-12cc-4545-bc7e-48a4ff055d2e', 'b9f2e207-8f61-4787-9025-af37e2623874', 1, 'Seeds, identical to those of flowering plants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5db3b965-869d-42ca-9227-14e75054c261', 'b9f2e207-8f61-4787-9025-af37e2623874', 2, 'Cysts formed only during sexual reproduction');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('79b482f0-9d6a-4315-b927-73938da26c59', 'b9f2e207-8f61-4787-9025-af37e2623874', 3, 'Pollen grains');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b9f2e207-8f61-4787-9025-af37e2623874', '1d9ff2d2-1117-4dfa-979c-6ae7b92a53ba', 'Some sponges (especially freshwater species) produce gemmules — resistant, resting asexual reproductive bodies capable of surviving harsh conditions (like winter or drought) and germinating into new sponge individuals when favorable conditions return.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8903fe06-5ff6-4c34-bc5c-e4165f8bfbda', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 161, 'Skeletal muscle, responsible for voluntary movement, is described as ''striated'' due to the:', 'Biology', 'Structural Organisation in Animals — Muscular Tissue');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('74eeb587-3d73-4dd6-b7d3-ab72221923d7', '8903fe06-5ff6-4c34-bc5c-e4165f8bfbda', 0, 'Random, disorganized arrangement of actin and myosin filaments');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('db385a36-4f07-4b70-b50f-65d3625af6ee', '8903fe06-5ff6-4c34-bc5c-e4165f8bfbda', 1, 'Regular, repeating alternating pattern of light (I) and dark (A) bands formed by the organized arrangement of actin and myosin filaments');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('eea19f74-2d28-4088-b28b-33fa438719ec', '8903fe06-5ff6-4c34-bc5c-e4165f8bfbda', 2, 'Complete absence of any myofilaments');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9952a452-0aeb-406d-bdec-84d038155807', '8903fe06-5ff6-4c34-bc5c-e4165f8bfbda', 3, 'Presence of only a single type of protein filament');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8903fe06-5ff6-4c34-bc5c-e4165f8bfbda', 'db385a36-4f07-4b70-b50f-65d3625af6ee', 'The characteristic striped (striated) appearance of skeletal (and cardiac) muscle under a microscope arises from the highly organized, repeating arrangement of actin (thin) and myosin (thick) filaments into alternating light (I) and dark (A) bands within each sarcomere.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('68e80dde-8126-4f2c-bf28-ad223dad2d94', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 162, 'The primary chemical stimulus that drives normal breathing rate regulation in humans is the level of:', 'Biology', 'Breathing and Exchange of Gases — Regulation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c489e0e7-76ab-4cc9-9f77-60300e47e45b', '68e80dde-8126-4f2c-bf28-ad223dad2d94', 0, 'Blood glucose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4cf6cf2-2256-4005-aba0-2f64f0e6182b', '68e80dde-8126-4f2c-bf28-ad223dad2d94', 1, 'Carbon dioxide (and the resulting change in blood pH), detected by chemoreceptors, more so than oxygen level under normal conditions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('77efa99a-76eb-4e6d-a855-5b2d702a1ad6', '68e80dde-8126-4f2c-bf28-ad223dad2d94', 2, 'Blood calcium exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('85212725-754c-41c2-a333-d92f0278fa7a', '68e80dde-8126-4f2c-bf28-ad223dad2d94', 3, 'Blood urea');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('68e80dde-8126-4f2c-bf28-ad223dad2d94', 'c4cf6cf2-2256-4005-aba0-2f64f0e6182b', 'Under normal physiological conditions, breathing rate is primarily regulated by chemoreceptors sensitive to rising CO2 levels (and the associated drop in blood pH), rather than by blood oxygen level, which typically only becomes the dominant driver under conditions of severe hypoxia.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9a04b596-640b-4cf6-b371-bb3806facb72', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 163, 'Haemodialysis, a medical procedure used for patients with kidney failure, works by:', 'Biology', 'Excretory Products and Their Elimination — Dialysis');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2a04e964-6253-44bc-97a7-fc83b993c8d7', '9a04b596-640b-4cf6-b371-bb3806facb72', 0, 'Surgically removing the damaged kidney with no replacement function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5750624f-8f03-4ac4-a40f-dd644a6628b9', '9a04b596-640b-4cf6-b371-bb3806facb72', 1, 'Passing the patient''s blood through a machine containing a semi-permeable membrane that filters out waste products and excess fluid, mimicking kidney function');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('86ae43a7-f6bc-418a-81b5-46f791225978', '9a04b596-640b-4cf6-b371-bb3806facb72', 2, 'Directly transplanting a new kidney during the same session');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('3ec523aa-12bb-443e-874c-d6e7f6148c39', '9a04b596-640b-4cf6-b371-bb3806facb72', 3, 'Injecting the patient with synthetic urine');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9a04b596-640b-4cf6-b371-bb3806facb72', '5750624f-8f03-4ac4-a40f-dd644a6628b9', 'Haemodialysis circulates the patient''s blood through an external machine containing a semi-permeable membrane (dialyzer), across which waste products and excess fluid diffuse into a dialysis fluid, artificially performing the filtering function that failed kidneys can no longer adequately perform.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('16dae648-0105-4ac4-a7ca-775d3aba458a', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 164, 'An electrical synapse, less common than chemical synapses in vertebrates, is characterized by:', 'Biology', 'Neural Control and Coordination — Synapse Types');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6006ab10-b275-4fa5-8090-ab466ed97348', '16dae648-0105-4ac4-a7ca-775d3aba458a', 0, 'Transmission via released neurotransmitter molecules diffusing across a wide synaptic cleft');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('579b6ceb-a6c8-4f74-b883-4a12714b044e', '16dae648-0105-4ac4-a7ca-775d3aba458a', 1, 'Direct electrical continuity between two neurons via gap junctions, allowing very rapid signal transmission with virtually no synaptic delay');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('21b2a827-f1af-4b3a-869a-894686548efa', '16dae648-0105-4ac4-a7ca-775d3aba458a', 2, 'Always being slower than a chemical synapse');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('48d4b9bc-beb1-49ea-b060-751cbc2adff0', '16dae648-0105-4ac4-a7ca-775d3aba458a', 3, 'The complete absence of any structural connection between neurons');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('16dae648-0105-4ac4-a7ca-775d3aba458a', '579b6ceb-a6c8-4f74-b883-4a12714b044e', 'Electrical synapses use gap junctions to directly and rapidly connect the cytoplasm of adjacent cells, allowing near-instantaneous transmission of electrical signals with minimal delay, in contrast to the somewhat slower chemical synapses, which rely on neurotransmitter diffusion across a synaptic cleft.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('30203997-5e0e-4b7a-ab1e-b7df01780bfe', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 165, 'The adrenal cortex, the outer region of the adrenal gland, secretes corticosteroid hormones including:', 'Biology', 'Chemical Coordination and Integration — Adrenal Cortex');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0abdccc4-f17e-40bc-989d-3968a81f9e23', '30203997-5e0e-4b7a-ab1e-b7df01780bfe', 0, 'Adrenaline and noradrenaline exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('200322d8-eaef-4be5-a687-27472936fe66', '30203997-5e0e-4b7a-ab1e-b7df01780bfe', 1, 'Glucocorticoids (like cortisol) and mineralocorticoids (like aldosterone)');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('edf903a1-861a-461a-a624-3ec31d16ab19', '30203997-5e0e-4b7a-ab1e-b7df01780bfe', 2, 'Insulin and glucagon');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('236e9a52-1f82-4778-84aa-1ad9313cc745', '30203997-5e0e-4b7a-ab1e-b7df01780bfe', 3, 'Thyroxine');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('30203997-5e0e-4b7a-ab1e-b7df01780bfe', '200322d8-eaef-4be5-a687-27472936fe66', 'The adrenal cortex secretes several classes of steroid hormones, notably glucocorticoids (e.g., cortisol, involved in stress response and metabolism) and mineralocorticoids (e.g., aldosterone, regulating sodium/water balance) — distinct from the adrenal medulla''s adrenaline/noradrenaline secretion.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('f54d3355-0c4d-463c-924a-04f3c9aadb3d', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 166, 'The corpus luteum eventually degenerates into a structure called the corpus albicans if:', 'Biology', 'Human Reproduction — Ovarian Cycle');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f4a89391-c565-4d89-ba0e-c4a8931eea5e', 'f54d3355-0c4d-463c-924a-04f3c9aadb3d', 0, 'Fertilization and implantation successfully occur');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7fa63bc9-b414-4415-8a50-c71e367544a6', 'f54d3355-0c4d-463c-924a-04f3c9aadb3d', 1, 'Fertilization does not occur, and the corpus luteum is no longer needed to maintain a pregnancy');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b94d0ce2-b9cc-4d32-8fbf-f6bd0984ba4d', 'f54d3355-0c4d-463c-924a-04f3c9aadb3d', 2, 'Ovulation has not yet occurred');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8d94390f-cc8d-4677-be95-8a90c2ce5c72', 'f54d3355-0c4d-463c-924a-04f3c9aadb3d', 3, 'The individual is still in the follicular phase');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('f54d3355-0c4d-463c-924a-04f3c9aadb3d', '7fa63bc9-b414-4415-8a50-c71e367544a6', 'If fertilization/implantation does not occur, the corpus luteum degenerates (since no hCG signal from an implanting embryo maintains it), eventually forming scar-like tissue called the corpus albicans, while hormone levels drop, triggering menstruation.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('dc19617d-bfc0-4386-8e81-cd4526c6e02c', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 167, 'The ''small family norm,'' promoted as part of national population policies, emphasizes the socioeconomic advantages of couples having:', 'Biology', 'Reproductive Health — Population Stabilization');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c3b31427-cb9f-4a25-8ec3-5378a359f23e', 'dc19617d-bfc0-4386-8e81-cd4526c6e02c', 0, 'As many children as biologically possible');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2fb2b7e7-f8c7-4a42-a0c1-24f35311cf46', 'dc19617d-bfc0-4386-8e81-cd4526c6e02c', 1, 'Fewer children, associated with better resource allocation, health, and educational opportunities per child');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('b488c9a6-5b4b-4bb0-9d30-a749542dcbdf', 'dc19617d-bfc0-4386-8e81-cd4526c6e02c', 2, 'No children whatsoever, under any circumstances');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5e23515f-89ac-4fe5-9da5-469be393ee04', 'dc19617d-bfc0-4386-8e81-cd4526c6e02c', 3, 'Exactly one specific number of children mandated by law in India');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('dc19617d-bfc0-4386-8e81-cd4526c6e02c', '2fb2b7e7-f8c7-4a42-a0c1-24f35311cf46', 'Promotion of the small family norm encourages couples to have fewer children, based on evidence linking smaller family size to improved health outcomes, greater educational/economic opportunity per child, and more sustainable population growth — it is promotional/educational rather than a strict legal mandate in India.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8f23bba3-43e9-45a2-865e-a00699cf1909', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 168, 'Cell-mediated immunity, one of the two main branches of adaptive immunity, is primarily carried out by:', 'Biology', 'Human Health and Disease — Cellular Immunity');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6cc30fe9-c3c1-4a64-8852-3358a33b7874', '8f23bba3-43e9-45a2-865e-a00699cf1909', 0, 'Antibodies circulating freely in blood plasma');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ab148d11-030b-4437-bd82-aa8e16d677d2', '8f23bba3-43e9-45a2-865e-a00699cf1909', 1, 'T-lymphocytes, which directly attack infected or abnormal cells (or coordinate other immune cells) rather than relying on free antibodies');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('227ce3d2-8679-469f-9651-a0cc71c67f60', '8f23bba3-43e9-45a2-865e-a00699cf1909', 2, 'Red blood cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('7e1ee848-d287-465d-8b29-60135f824fe7', '8f23bba3-43e9-45a2-865e-a00699cf1909', 3, 'Platelets');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8f23bba3-43e9-45a2-865e-a00699cf1909', 'ab148d11-030b-4437-bd82-aa8e16d677d2', 'Cell-mediated immunity is primarily executed by T-lymphocytes (cytotoxic T cells directly killing infected/abnormal cells, and helper T cells coordinating the broader immune response), as opposed to humoral immunity, which relies on B-lymphocyte-derived antibodies circulating in body fluids.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('227256c8-24df-4b02-91de-0890abe5d1b7', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 169, 'Regeneration, the ability of certain organisms (like Hydra or starfish) to regrow lost body parts, is considered related to asexual reproduction because it relies on:', 'Biology', 'Reproduction in Organisms — Regeneration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dbf918da-067b-4aad-a636-2ab58e171358', '227256c8-24df-4b02-91de-0890abe5d1b7', 0, 'Fusion of specialized reproductive cells');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('01bfdec4-35ff-475f-806f-1ac5bc81d10e', '227256c8-24df-4b02-91de-0890abe5d1b7', 1, 'The proliferation and differentiation of specialized cells at the site of injury, similar to the cellular processes underlying some forms of asexual reproduction like budding');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6f3c0161-deb9-4804-b334-b88c878591da', '227256c8-24df-4b02-91de-0890abe5d1b7', 2, 'A process entirely unrelated to any form of cell division');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('e76ccc90-72ce-46a5-9d1d-291d88d67dd1', '227256c8-24df-4b02-91de-0890abe5d1b7', 3, 'Only occurring in single-celled organisms');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('227256c8-24df-4b02-91de-0890abe5d1b7', '01bfdec4-35ff-475f-806f-1ac5bc81d10e', 'Regeneration relies on the same fundamental cellular processes (proliferation and differentiation of relatively unspecialized cells) that underlie certain asexual reproductive strategies (like budding in Hydra), which is why the capacity for extensive regeneration and the capacity for asexual reproduction often co-occur in the same organisms.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('cd84bd5a-f40e-4eeb-bf88-139ddabb8a2d', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 170, 'The wings of an insect and the wings of a bat, though both used for flight, are considered analogous (not homologous) structures because they:', 'Biology', 'Evolution — Convergent vs Divergent');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c2c318c-54f4-4f60-b964-002dee27488a', 'cd84bd5a-f40e-4eeb-bf88-139ddabb8a2d', 0, 'Share an identical bony internal structure derived from a common winged ancestor');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('be2631dc-7c83-47de-881c-e0672f4b1738', 'cd84bd5a-f40e-4eeb-bf88-139ddabb8a2d', 1, 'Evolved independently in unrelated lineages to serve a similar function, without a shared underlying developmental/structural origin');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('fd375daf-8615-4395-a701-329deef3ac5c', 'cd84bd5a-f40e-4eeb-bf88-139ddabb8a2d', 2, 'Are structurally and developmentally identical in every respect');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('251e1d9e-ade1-4fc6-82ec-fdbe602335a1', 'cd84bd5a-f40e-4eeb-bf88-139ddabb8a2d', 3, 'Both develop from exactly the same embryonic tissue layer using the same genes');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cd84bd5a-f40e-4eeb-bf88-139ddabb8a2d', 'be2631dc-7c83-47de-881c-e0672f4b1738', 'Insect wings (cuticular extensions) and bat wings (modified forelimb bones covered in skin) serve the same function (flight) but have entirely different developmental origins and structures — a hallmark of analogous structures arising through convergent evolution, not shared ancestry.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('2dcea359-ede1-40b9-9f36-d6931ca47354', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 171, 'Human insulin, as a protein hormone, consists structurally of:', 'Biology', 'Biotechnology and Its Applications — Insulin Structure');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f8d97a8f-7a4e-4b62-a01e-faeab7d4c7d3', '2dcea359-ede1-40b9-9f36-d6931ca47354', 0, 'A single polypeptide chain only, with no chain linkages');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('766019de-2e73-4231-b3c0-2c4b1b83fb11', '2dcea359-ede1-40b9-9f36-d6931ca47354', 1, 'Two polypeptide chains (A and B) linked together by disulfide bonds');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('8fec489a-8672-4e81-8f8e-0ba969295b2d', '2dcea359-ede1-40b9-9f36-d6931ca47354', 2, 'Three separate, unconnected polypeptide chains');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('1baa9c1a-34c6-45eb-893f-8893ac682984', '2dcea359-ede1-40b9-9f36-d6931ca47354', 3, 'No polypeptide chains; it is a purely lipid-based hormone');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('2dcea359-ede1-40b9-9f36-d6931ca47354', '766019de-2e73-4231-b3c0-2c4b1b83fb11', 'Mature human insulin consists of two separate polypeptide chains (the A chain and B chain) held together by disulfide bridges, derived from a single larger precursor (proinsulin) that is processed to remove a connecting C-peptide segment.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('7b95554c-fc66-4bc4-886c-5ed5dc18f6a7', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 172, 'A Type I survivorship curve, one of three general patterns describing age-specific mortality, is characteristic of species (like humans in developed regions) that show:', 'Biology', 'Organisms and Populations — Mortality Patterns');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('88d3d988-d336-4951-942b-9f10c4be59ee', '7b95554c-fc66-4bc4-886c-5ed5dc18f6a7', 0, 'High mortality in early life stages, with relatively few individuals surviving to old age');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('706a00a8-411c-4cba-ba46-4d233d563913', '7b95554c-fc66-4bc4-886c-5ed5dc18f6a7', 1, 'Low mortality during early and middle life, with most individuals surviving to old age before mortality sharply increases');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('38f99407-876e-43fa-9fcc-f8e3eb329d9d', '7b95554c-fc66-4bc4-886c-5ed5dc18f6a7', 2, 'A constant mortality rate throughout the entire lifespan');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2be7dc1c-fa51-453a-b4ee-cf53757e13ce', '7b95554c-fc66-4bc4-886c-5ed5dc18f6a7', 3, 'No relationship at all between age and mortality risk');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('7b95554c-fc66-4bc4-886c-5ed5dc18f6a7', '706a00a8-411c-4cba-ba46-4d233d563913', 'Type I survivorship curves show high survival through most of the lifespan, with mortality concentrated in old age — typical of species (like humans in developed regions, and many large mammals) that invest heavily in fewer offspring with substantial parental care.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('cd7a59b1-8c00-46ff-88d5-287febdbcf49', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 173, 'Ecosystem services, a concept increasingly used in environmental policy, refer to:', 'Biology', 'Ecosystem — Ecosystem Services');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('afaee35d-6e33-41a2-aad9-62b4c7214558', 'cd7a59b1-8c00-46ff-88d5-287febdbcf49', 0, 'Only the direct economic value of harvested timber and minerals');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('6b8d4887-313e-4cb8-90aa-58ea3a66f958', 'cd7a59b1-8c00-46ff-88d5-287febdbcf49', 1, 'The full range of benefits that humans derive from properly functioning ecosystems, including provisioning, regulating, supporting, and cultural services');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('44abdec6-be4e-4269-9d05-c993ca8075a9', 'cd7a59b1-8c00-46ff-88d5-287febdbcf49', 2, 'Services provided exclusively by human-engineered infrastructure, with no natural component');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('645a9042-ed5c-4a72-a169-8479db2c23c1', 'cd7a59b1-8c00-46ff-88d5-287febdbcf49', 3, 'A term with no practical application in policy or economics');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('cd7a59b1-8c00-46ff-88d5-287febdbcf49', '6b8d4887-313e-4cb8-90aa-58ea3a66f958', 'Ecosystem services encompass the broad range of benefits ecosystems provide to humans — provisioning services (food, water, timber), regulating services (climate/flood regulation), supporting services (nutrient cycling, pollination), and cultural services (recreation, aesthetic value) — a framework increasingly used to inform conservation and environmental policy decisions.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('411a7764-535c-4d45-9dd1-8e6631c03560', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 174, 'Project Tiger, launched in India in 1973, was a conservation initiative specifically aimed at:', 'Biology', 'Biodiversity and Conservation — Wildlife Protection');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('c4e871e6-5245-4d2f-bf94-b867474bfd1c', '411a7764-535c-4d45-9dd1-8e6631c03560', 0, 'Increasing the population of elephants');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('32cfea41-504b-484f-81ec-0131439e9cb4', '411a7764-535c-4d45-9dd1-8e6631c03560', 1, 'Protecting and increasing the population of the endangered Bengal tiger through the establishment of dedicated tiger reserves');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dee0a13f-2c0e-4528-b9de-ceecdb4a3576', '411a7764-535c-4d45-9dd1-8e6631c03560', 2, 'Eliminating tigers from human-inhabited areas entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('55610f7a-def9-4420-9b19-f21686a5242a', '411a7764-535c-4d45-9dd1-8e6631c03560', 3, 'Only captive breeding of tigers in zoos, with no wild habitat protection');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('411a7764-535c-4d45-9dd1-8e6631c03560', '32cfea41-504b-484f-81ec-0131439e9cb4', 'Project Tiger, launched by the Government of India in 1973, established dedicated tiger reserves and conservation measures aimed at protecting and increasing the wild population of the endangered Bengal tiger, becoming one of India''s most prominent wildlife conservation programs.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('8f6deb49-2fca-440c-8ba2-492ddb99d296', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 175, 'Pancreatic lipase, a key digestive enzyme secreted into the small intestine, specifically acts to break down:', 'Biology', 'Digestion and Absorption — Pancreatic Secretions');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce228c5e-e92e-4135-ba80-452ec2bd665b', '8f6deb49-2fca-440c-8ba2-492ddb99d296', 0, 'Proteins into amino acids');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('a2366deb-11db-4714-bfd3-f2ceb41648b0', '8f6deb49-2fca-440c-8ba2-492ddb99d296', 1, 'Emulsified fats (triglycerides) into fatty acids and glycerol/monoglycerides');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('588518a2-7313-410e-abc5-277f71ff09f9', '8f6deb49-2fca-440c-8ba2-492ddb99d296', 2, 'Starch into maltose');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('d0f34ab5-42b0-4996-a4e7-f4633a1ee1b3', '8f6deb49-2fca-440c-8ba2-492ddb99d296', 3, 'Nucleic acids into nucleotides');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('8f6deb49-2fca-440c-8ba2-492ddb99d296', 'a2366deb-11db-4714-bfd3-f2ceb41648b0', 'Pancreatic lipase hydrolyzes emulsified dietary triglycerides (fats), which have been dispersed into smaller droplets by bile salts, into free fatty acids and monoglycerides/glycerol, which can then be absorbed by intestinal cells.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9f65d8e1-c637-4cf8-88ac-5c86f492044c', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 176, 'Deaddiction and rehabilitation programs for substance abuse typically emphasize which combined approach?', 'Biology', 'Human Health and Disease — Drug Rehabilitation');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9d38b4e2-d97a-4ceb-a740-b2c5ef1eea89', '9f65d8e1-c637-4cf8-88ac-5c86f492044c', 0, 'Isolation from all social support systems');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('210729c9-e9e3-47ce-8a78-531cb937db11', '9f65d8e1-c637-4cf8-88ac-5c86f492044c', 1, 'A combination of medical treatment (managing withdrawal symptoms) alongside psychological counselling and social support/reintegration');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('0b24124e-6e20-460e-b083-84c7dc0a922f', '9f65d8e1-c637-4cf8-88ac-5c86f492044c', 2, 'Punishment alone, with no medical or psychological component');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2725be82-7d63-468e-9586-bd67272d21b7', '9f65d8e1-c637-4cf8-88ac-5c86f492044c', 3, 'Complete avoidance of any professional medical guidance');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9f65d8e1-c637-4cf8-88ac-5c86f492044c', '210729c9-e9e3-47ce-8a78-531cb937db11', 'Effective deaddiction/rehabilitation approaches typically combine medical management (safely handling withdrawal symptoms) with psychological counselling and social support to address the underlying causes of substance abuse and support long-term recovery and reintegration.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('d1636828-f177-45a2-9614-17e71db69a76', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 177, 'Amoeboid movement, as seen in Amoeba and certain human white blood cells (like macrophages), is achieved through the formation of:', 'Biology', 'Locomotion and Movement — Types of Movement');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('2180797d-52f2-484f-8ba2-5fc9a26b55e6', 'd1636828-f177-45a2-9614-17e71db69a76', 0, 'Cilia, which beat rhythmically to propel the cell');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('4c7a820f-df47-46f1-8fc8-f91aa1d78787', 'd1636828-f177-45a2-9614-17e71db69a76', 1, 'Pseudopodia — temporary, finger-like cytoplasmic projections that extend and allow the cell to crawl');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('477fd83e-c301-4d79-9fc7-016c9151e6fb', 'd1636828-f177-45a2-9614-17e71db69a76', 2, 'Flagella, providing whip-like propulsion');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('283a0320-acb0-4bb9-8766-a9f67f565714', 'd1636828-f177-45a2-9614-17e71db69a76', 3, 'Rigid skeletal muscle fibres');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('d1636828-f177-45a2-9614-17e71db69a76', '4c7a820f-df47-46f1-8fc8-f91aa1d78787', 'Amoeboid movement relies on the extension of pseudopodia (temporary cytoplasmic projections formed by the reorganization of the cytoskeleton), into which the rest of the cell''s contents flow, allowing the cell to effectively crawl along a surface — used by Amoeba for locomotion and by human phagocytic white blood cells for movement toward sites of infection.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('b6b304af-b38f-4440-ad38-f0886cd4f548', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 178, 'The chromosomal theory of inheritance, proposed by Sutton and Boveri, states that:', 'Biology', 'Genetics and Evolution — Chromosomal Theory');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f5fb24da-1435-4ce0-beff-7703c7daaf20', 'b6b304af-b38f-4440-ad38-f0886cd4f548', 0, 'Genes have no physical location within the cell');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('dfa427c4-c0a7-42ba-bce9-691a6705cdc4', 'b6b304af-b38f-4440-ad38-f0886cd4f548', 1, 'Genes are located on chromosomes, and the behavior of chromosomes during meiosis parallels the inheritance patterns described by Mendel''s laws');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('ce776557-9e8a-405a-96c8-5f0db1875367', 'b6b304af-b38f-4440-ad38-f0886cd4f548', 2, 'Chromosomes have no role in heredity whatsoever');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('62a98f31-0978-4307-a2b7-f19024e5f8cc', 'b6b304af-b38f-4440-ad38-f0886cd4f548', 3, 'All genes are located exclusively on a single chromosome');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('b6b304af-b38f-4440-ad38-f0886cd4f548', 'dfa427c4-c0a7-42ba-bce9-691a6705cdc4', 'The chromosomal theory of inheritance proposed that genes are physically located on chromosomes, and that the observed behavior of chromosomes during meiosis (segregation, independent assortment) provides the physical basis for Mendel''s previously abstract laws of inheritance.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('1b7c8b15-6b89-460a-b958-ae177776b891', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 179, 'Camouflage (cryptic coloration), an adaptive feature seen across many animal species, primarily helps an organism by:', 'Biology', 'Evolution — Adaptive Features');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('f6169ae6-2c16-4c5b-ba99-3ed50b1260a6', '1b7c8b15-6b89-460a-b958-ae177776b891', 0, 'Making it more visible to potential mates only, with no defensive role');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9fc369f5-2f02-466f-a8ae-decabaa37506', '1b7c8b15-6b89-460a-b958-ae177776b891', 1, 'Allowing it to blend into its surroundings, reducing detection by predators or prey');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('bdf44314-f600-4908-8040-811dce9c2ab7', '1b7c8b15-6b89-460a-b958-ae177776b891', 2, 'Increasing its body temperature artificially');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9f4dc89e-d1e3-4ddd-8ff1-4f479a0f3158', '1b7c8b15-6b89-460a-b958-ae177776b891', 3, 'Having no actual survival benefit');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('1b7c8b15-6b89-460a-b958-ae177776b891', '9fc369f5-2f02-466f-a8ae-decabaa37506', 'Camouflage allows an organism''s coloration/pattern to closely match its surrounding environment, reducing the likelihood of detection by predators (for defense) or by prey (for more effective ambush hunting) — a classic example of natural selection favoring traits that improve survival and reproductive success.', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');

INSERT INTO questions (id, paper_id, sort_order, question_text, subject, topic)
VALUES ('9775d6ae-9cab-4a71-9c77-9b35d78bf429', 'db0a7a12-bb08-4010-9d9d-cf691e9576b4', 180, 'Hormones can be chemically classified into groups including steroids, peptides/proteins, and amines; thyroxine and adrenaline both belong to which chemical class?', 'Biology', 'Chemical Coordination and Integration — Hormone Classification');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('9c9af755-e136-4f44-ab50-68ba300a1763', '9775d6ae-9cab-4a71-9c77-9b35d78bf429', 0, 'Steroid hormones, like testosterone and cortisol');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('beb78d04-c688-4f36-9947-65aaa4752e98', '9775d6ae-9cab-4a71-9c77-9b35d78bf429', 1, 'Amine (tyrosine-derived) hormones');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('80339410-ff1f-4525-8a7f-57bd5446e2c0', '9775d6ae-9cab-4a71-9c77-9b35d78bf429', 2, 'Peptide hormones exclusively');
INSERT INTO question_options (id, question_id, sort_order, option_text) VALUES ('5961df22-fa63-461c-88ed-87b1c57ea48e', '9775d6ae-9cab-4a71-9c77-9b35d78bf429', 3, 'Prostaglandins');
INSERT INTO question_answers (question_id, correct_option_id, explanation, source_note)
VALUES ('9775d6ae-9cab-4a71-9c77-9b35d78bf429', 'beb78d04-c688-4f36-9947-65aaa4752e98', 'Both thyroxine and adrenaline (along with noradrenaline) are amine hormones, derived from the amino acid tyrosine, distinguishing them chemically from steroid hormones (derived from cholesterol) and peptide/protein hormones (chains of amino acids).', 'Biology — authored from NCERT Class 11/12 Biology textbooks (the NEET-prescribed syllabus, Botany + Zoology); not copied from any official NTA question paper.');
