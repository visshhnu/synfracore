-- ============================================================
-- BCHH-C Question Bank — Seed Data: Papers 7-10 (new, harder tier)
-- New content, no pre-existing answer key. Every ICD-10-CM code verified
-- against the CDC/CMS FY2026 order file (existence + billability) before
-- being finalized. Run this AFTER docs/question-bank-schema.sql and AFTER
-- bchhc_seed_papers_1_6.sql (papers 1-6 must exist first for sort_order
-- continuity, though there is no FK dependency between paper rows).
-- ============================================================

-- ---------- Paper 7: BCHH-C Practice Paper 7 ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order)
VALUES ('c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 'bchhc-practice-7', 'BCHH-C Practice Paper 7', 'bchhc', ARRAY['Advanced Combination Codes', 'Multi-System Sequencing', 'CoP', 'PDGM']::TEXT[], 100, 'advanced', true, 7);
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ae1db59a-f2ed-4ace-b81b-6c8c5fb6ce01', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 1, 'A patient with type 2 diabetes has diabetic nephropathy progressing to CKD stage 4, and separately has diabetic retinopathy with macular edema in the right eye. She is also on long-term insulin. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fd2b67bb-ae7f-4743-9b77-7342ad46c9ea', 'ae1db59a-f2ed-4ace-b81b-6c8c5fb6ce01', 0, 'E11.21, N18.4, E11.311, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2f57fa81-7496-473f-992b-e37b9b69c36b', 'ae1db59a-f2ed-4ace-b81b-6c8c5fb6ce01', 1, 'E11.22, N18.4, E11.311, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('401fe549-15a5-4ed4-9364-bc70c830f320', 'ae1db59a-f2ed-4ace-b81b-6c8c5fb6ce01', 2, 'E11.22, N18.4, E11.9, Z79.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0586267d-fa48-40f0-a822-1d16b109ffa2', 'ae1db59a-f2ed-4ace-b81b-6c8c5fb6ce01', 3, 'E13.22, N18.4, E11.311, Z79.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ae1db59a-f2ed-4ace-b81b-6c8c5fb6ce01', '2f57fa81-7496-473f-992b-e37b9b69c36b', 'E11.22 (type 2 diabetes with diabetic chronic kidney disease) is used, not E11.21 (diabetic nephropathy without CKD staging) — CKD stage 4 is explicitly documented, so the CKD-specific combination applies, paired with N18.4 for the stage. E11.311 (type 2 diabetes with unspecified diabetic retinopathy with macular edema) captures the second complication as a separate combination code — note that at this ''unspecified retinopathy type'' tier, ICD-10-CM does not further subdivide by laterality (a right/left/bilateral split only exists once a specific retinopathy severity — mild/moderate/severe nonproliferative or proliferative — is also documented), so E11.311 is the complete, correctly-specific code here even though the physician documented which eye is affected; diabetes with multiple documented complications requires a separate combination code per complication, not one code covering both. Z79.4 reports long-term insulin use. E13.22 is wrong because E13 is for ''other specified diabetes'' (e.g., drug-induced, genetic syndromes) — this patient has type 2 diabetes, so E11 applies.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('65f970d7-4db3-4db4-884a-6cd0c8f8b154', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 2, 'A patient is admitted to home health with acute on chronic systolic heart failure and CKD stage 3b. The physician documents the heart failure and CKD as both related to long-standing hypertension. Select M1021/M1023.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7205a887-41e2-47b5-9b9e-212f7e2143c6', '65f970d7-4db3-4db4-884a-6cd0c8f8b154', 0, 'I11.0, I50.23, N18.32');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('efda9ef7-6d7e-4470-94e0-4060e7b634b8', '65f970d7-4db3-4db4-884a-6cd0c8f8b154', 1, 'I13.0, I50.23, N18.32');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('42c9cc72-d339-498b-868f-143839908e31', '65f970d7-4db3-4db4-884a-6cd0c8f8b154', 2, 'I12.9, I50.23, N18.32');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f5531bb5-64f5-4ec5-9434-03b2b9fea903', '65f970d7-4db3-4db4-884a-6cd0c8f8b154', 3, 'I13.0, I50.9, N18.32');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('65f970d7-4db3-4db4-884a-6cd0c8f8b154', 'efda9ef7-6d7e-4470-94e0-4060e7b634b8', 'When hypertension, heart failure, AND chronic kidney disease are all documented as related, I13.0 (hypertensive heart and chronic kidney disease with heart failure and stage 1-4 CKD) is the required combination code — not I11.0 (hypertensive heart disease alone, no CKD) or I12.9 (hypertensive CKD alone, no heart failure), since both of those omit one of the three present conditions. I50.23 (acute on chronic systolic heart failure) and N18.32 (CKD stage 3b) are added as ''use additional code'' requirements under I13.0 to specify the heart failure type and CKD stage. Using I50.9 (unspecified heart failure) instead of I50.23 would under-code the documented specificity.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('455b9ec7-8f35-4f4c-b851-4c10ea39a33f', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 3, 'A patient with a history of kidney transplant 3 years ago is admitted to home health for monitoring following an episode of acute transplant rejection treated in the hospital with increased immunosuppression. The transplanted kidney remains functional. Select the correct principal diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eb0a401b-2f06-4e2d-b691-42da48f036e1', '455b9ec7-8f35-4f4c-b851-4c10ea39a33f', 0, 'T86.11, Z94.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2f716111-c4e5-4f49-ad91-6fc41fbb7468', '455b9ec7-8f35-4f4c-b851-4c10ea39a33f', 1, 'N18.9, Z94.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e9dc8577-0def-45ca-bdeb-97fec6c5d2d5', '455b9ec7-8f35-4f4c-b851-4c10ea39a33f', 2, 'T86.10, Z94.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0333569d-3e10-4040-ab66-575d8c594330', '455b9ec7-8f35-4f4c-b851-4c10ea39a33f', 3, 'Z94.0, T86.11');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('455b9ec7-8f35-4f4c-b851-4c10ea39a33f', 'eb0a401b-2f06-4e2d-b691-42da48f036e1', 'T86.11 (kidney transplant rejection) is the specific code for documented acute rejection, sequenced first since it''s the reason for the home health monitoring. T86.10 (unspecified complication of kidney transplant) is too vague when rejection is specifically documented. Z94.0 (kidney transplant status) is added as a secondary code to indicate transplant status, but does NOT replace the active complication code — a functioning transplanted organ with an active complication still uses the complication code (T86.11), not Z94.0 alone, since Z94.0 by itself would imply no active problem with the transplant.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d2142a7f-0f84-4f47-b0d9-a5209497b63d', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 4, 'A 34-year-old woman is 28 weeks pregnant and admitted to home health for management of gestational diabetes controlled by diet, plus severe pre-eclampsia requiring daily blood pressure monitoring and urine protein checks. Select the correct sequencing.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('796635de-f53e-4bc3-8495-a012bad6ecbc', 'd2142a7f-0f84-4f47-b0d9-a5209497b63d', 0, 'O14.13, O24.410, Z3A.28');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('079b0a3e-7abf-42c2-b8d2-f4d491db7a63', 'd2142a7f-0f84-4f47-b0d9-a5209497b63d', 1, 'O24.410, O14.13, Z3A.28');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1ecfbb3c-f092-4405-9ddf-f7d4591d70ab', 'd2142a7f-0f84-4f47-b0d9-a5209497b63d', 2, 'O14.13, O24.419, Z3A.28');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9911a0cf-bf15-4af9-bf07-0b225f982458', 'd2142a7f-0f84-4f47-b0d9-a5209497b63d', 3, 'O24.419, O14.13, Z3A.28');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d2142a7f-0f84-4f47-b0d9-a5209497b63d', '796635de-f53e-4bc3-8495-a012bad6ecbc', 'O14.13 (severe pre-eclampsia, third trimester) is sequenced first as the more acute, higher-acuity condition driving the intensity of home health monitoring (severe pre-eclampsia is a genuinely dangerous condition requiring close surveillance). O24.410 (gestational diabetes, diet controlled) follows as a coexisting pregnancy complication. O24.419 (gestational diabetes, unspecified control) would be incorrect since diet control is explicitly documented — using the specific ''diet controlled'' code is required per guideline when the control method is stated. Z3A.28 reports 28 weeks gestation, required on every obstetric encounter.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('15d4a784-a22a-498a-aaaf-6f0dc276b24d', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 5, 'A patient develops sepsis with acute kidney injury as a result of a urinary tract infection due to E. coli, without documented septic shock. Select the correct principal diagnosis sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d5643b65-d07b-45b9-a7d7-7a9e31a4d938', '15d4a784-a22a-498a-aaaf-6f0dc276b24d', 0, 'N39.0, B96.20, A41.51, N17.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4460a825-042f-4af4-9eeb-de4e1ef93a87', '15d4a784-a22a-498a-aaaf-6f0dc276b24d', 1, 'A41.51, N39.0, B96.20, N17.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('660ce1eb-bbab-4188-a21c-dd9618b3a0ea', '15d4a784-a22a-498a-aaaf-6f0dc276b24d', 2, 'A41.9, N39.0, N17.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b9b6b4a9-2ccc-4dac-a5e7-4f7220f38d53', '15d4a784-a22a-498a-aaaf-6f0dc276b24d', 3, 'N17.9, A41.51, N39.0, B96.20');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('15d4a784-a22a-498a-aaaf-6f0dc276b24d', '4460a825-042f-4af4-9eeb-de4e1ef93a87', 'A41.51 (sepsis due to Escherichia coli) is sequenced first per ICD-10-CM guidelines — sepsis is always coded before the localized infection that caused it, since sepsis is the more severe systemic condition being treated. N39.0 (UTI) follows to identify the site of the original localized infection. B96.20 is not separately added here because A41.51 already specifies E. coli as the causative organism directly in the sepsis code itself — adding B96.20 on top would be redundant coding of the same organism already captured. N17.9 (acute kidney injury, unspecified) is added as a documented sepsis-associated organ dysfunction, which the guidelines require coding when organ dysfunction is present and documented as related to the sepsis.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('08203eaa-d9ac-4f57-bd25-74d55cd77ab0', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 6, 'A patient with COPD is admitted with acute respiratory failure. Documentation specifies the patient has hypercapnia but is not hypoxic. Select the correct combination code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8fc20774-5e35-44f2-aa96-f3f83ef9c140', '08203eaa-d9ac-4f57-bd25-74d55cd77ab0', 0, 'J44.1, J96.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('59952c0e-7654-4fa9-bcea-8cfb48848efe', '08203eaa-d9ac-4f57-bd25-74d55cd77ab0', 1, 'J44.1, J96.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3801c3dc-85a5-4fa1-9a98-1e68de306776', '08203eaa-d9ac-4f57-bd25-74d55cd77ab0', 2, 'J44.9, J96.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('70f0d883-c4ee-49c8-9c3f-fd8d0f668bd3', '08203eaa-d9ac-4f57-bd25-74d55cd77ab0', 3, 'J96.02, J44.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('08203eaa-d9ac-4f57-bd25-74d55cd77ab0', '8fc20774-5e35-44f2-aa96-f3f83ef9c140', 'J96.02 (acute respiratory failure with hypercapnia) is the specific code matching documented hypercapnia without hypoxia — J96.01 would be for hypoxia specifically, which is NOT what''s documented here. J44.1 (COPD with acute exacerbation) is the appropriate COPD code since the respiratory failure represents an acute worsening of the underlying COPD, not J44.9 (COPD, unspecified) which would under-code the documented acute exacerbation. Per ICD-10-CM sequencing guidance, when a patient has both COPD exacerbation and acute respiratory failure, the code for the condition responsible for the encounter is sequenced first per provider documentation and coding conventions — J44.1 is sequenced first here as it identifies the underlying disease process, with J96.02 as the specific manifestation.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('71fd5304-77a9-4358-b5a9-53bfa877f0c9', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 7, 'A patient is receiving home health services for management of a stage 4 pressure ulcer of the sacrum with exposed bone, present on admission and documented as hospital-acquired. The wound has been present for 3 weeks. Select the correct coding, including the present-on-admission consideration.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d817d6a5-d336-41af-9baf-4977728899d0', '71fd5304-77a9-4358-b5a9-53bfa877f0c9', 0, 'L89.154, Y95');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2b17ae58-cdc1-4a54-beb7-91d9d84680f9', '71fd5304-77a9-4358-b5a9-53bfa877f0c9', 1, 'L89.154');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('20b38457-bf27-4526-b95d-57abfa1f5fa6', '71fd5304-77a9-4358-b5a9-53bfa877f0c9', 2, 'L89.153, Y95');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('29c96001-645d-4b34-b64c-123bf7a52103', '71fd5304-77a9-4358-b5a9-53bfa877f0c9', 3, 'L89.154, Y92.239');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('71fd5304-77a9-4358-b5a9-53bfa877f0c9', 'd817d6a5-d336-41af-9baf-4977728899d0', 'L89.154 (pressure ulcer of sacral region, stage 4) captures the exposed-bone severity — stage 4 specifically involves exposed bone, tendon, or muscle, distinguishing it from L89.153 (stage 3, which does not involve exposed bone). Y95 (nosocomial condition) is the correct external cause code to add when a condition is documented as hospital-acquired — this is a real, codeable convention distinct from Y92.239 (a place-of-occurrence code, which would apply to where an INJURY occurred, not to flagging a condition as hospital-acquired).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3dbdb525-115b-4db6-9948-4a81b87b7674', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 8, 'A patient with schizophrenia, stable on long-term antipsychotic medication, develops tardive dyskinesia. The patient also has a separate, well-documented major depressive disorder, recurrent, currently in partial remission. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a364ab05-c66c-47a8-aa9b-9e6d4a7f3f3c', '3dbdb525-115b-4db6-9948-4a81b87b7674', 0, 'G24.01, F20.9, F33.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2c4809a8-a0aa-4f76-9623-411863f29e96', '3dbdb525-115b-4db6-9948-4a81b87b7674', 1, 'F20.9, G24.01, F33.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b9121824-5fd6-4c57-a1e2-65ea09c2db5b', '3dbdb525-115b-4db6-9948-4a81b87b7674', 2, 'G24.01, F20.9, F33.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7797c41e-e9f7-480b-b181-83a9c5171ba7', '3dbdb525-115b-4db6-9948-4a81b87b7674', 3, 'F20.9, F33.41, G24.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3dbdb525-115b-4db6-9948-4a81b87b7674', '2c4809a8-a0aa-4f76-9623-411863f29e96', 'F20.9 (schizophrenia, unspecified) is sequenced first as the underlying condition and primary reason for the antipsychotic use that caused the tardive dyskinesia. G24.01 (drug-induced subacute dyskinesia — tardive dyskinesia specifically has this code) follows as the medication-induced movement disorder complication. F33.41 (major depressive disorder, recurrent, in partial remission) is a separate, independently documented condition requiring its own code with the specific remission-status character — F33.9 (unspecified) would under-code the documented ''partial remission'' status.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f1f3fbdc-cbad-4022-af69-f06f04a3948d', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 9, 'A patient with a below-knee amputation (right leg, traumatic, from 10 years ago) is admitted to home health for management of phantom limb pain that has recently worsened, along with routine prosthetic care needs. Select the correct principal diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('29299a51-453e-487f-88ab-3e3ac143ab20', 'f1f3fbdc-cbad-4022-af69-f06f04a3948d', 0, 'G54.7, Z89.512');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cdee3140-27ce-4673-8a47-d805840873b5', 'f1f3fbdc-cbad-4022-af69-f06f04a3948d', 1, 'G54.6, Z89.512');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('65fca737-bfa3-43c5-b207-c91f2d6971d6', 'f1f3fbdc-cbad-4022-af69-f06f04a3948d', 2, 'Z89.512, G54.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('119a7428-e17e-4993-aeee-7a7ffd21fde8', 'f1f3fbdc-cbad-4022-af69-f06f04a3948d', 3, 'G54.6, Z47.89');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f1f3fbdc-cbad-4022-af69-f06f04a3948d', 'cdee3140-27ce-4673-8a47-d805840873b5', 'G54.6 (phantom limb syndrome with pain) is the specific code for phantom limb pain — G54.7 is phantom limb syndrome WITHOUT pain, which doesn''t match the documented worsening pain. Since the phantom limb pain is the focus driving this specific home health encounter, it''s sequenced first. Z89.512 (acquired absence of right leg below knee) is added as a status code identifying the amputation. Z47.89 (other orthopedic aftercare) is not the best fit here since the encounter is specifically for the pain complication, not generic orthopedic aftercare.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3bb60147-f102-446b-9fab-7fe49da97d5a', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 10, 'A patient is admitted to home health after hospitalization for a fall resulting in a nondisplaced fracture of the left distal radius, occurring at home. The patient has known severe osteoporosis, and the physician documents the fracture as fragility-related. This is the initial home health visit after hospital discharge, with the patient now receiving follow-up care for routine healing. Select M1021/M1023 codes with correct 7th character.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d1d11a5d-b7ca-469c-84e4-c39fdc94ac70', '3bb60147-f102-446b-9fab-7fe49da97d5a', 0, 'S52.562A, M81.0, W19.XXXA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('821f768b-0fb4-4684-b7a6-e8cc12931521', '3bb60147-f102-446b-9fab-7fe49da97d5a', 1, 'M80.032D, W19.XXXD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c8e3d774-b94b-4676-a55e-70b79fcbad99', '3bb60147-f102-446b-9fab-7fe49da97d5a', 2, 'S52.562D, M81.0, W19.XXXD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('69c13a58-52df-4452-994a-2bb79557143d', '3bb60147-f102-446b-9fab-7fe49da97d5a', 3, 'M80.032A, W19.XXXA');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3bb60147-f102-446b-9fab-7fe49da97d5a', '821f768b-0fb4-4684-b7a6-e8cc12931521', 'Because the physician explicitly documents the fracture as fragility-related (i.e., caused by the osteoporosis, not by a genuinely traumatic force), this is coded as a pathologic fracture: M80.032 (age-related osteoporosis with current pathological fracture, left forearm), NOT a traumatic fracture code (S52.562-) — this is a common distinction tested at the advanced tier, since a fall is present but the physician''s own documentation of ''fragility fracture'' overrides the presence of a fall as the trigger. The M80 combination code already includes osteoporosis, so M81.0 is not separately added (that would be redundant). The 7th character is D (subsequent encounter) because the patient is now in the routine healing/follow-up phase, not the initial active-treatment encounter — this is the home health follow-up visit, not the ER/hospital encounter. W19.XXXD (unspecified fall, subsequent encounter) matches this same encounter-phase logic for the external cause code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d2633cbd-70bf-4e16-8fee-e184506dbb65', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 11, 'A patient has metastatic breast cancer with metastases to the liver and bone. The patient underwent a mastectomy 2 years ago with no evidence of primary recurrence; treatment is now focused on managing the liver and bone metastases with ongoing chemotherapy. Select the correct principal diagnosis sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ddeb4a82-1e6e-44bd-85fc-9aee19f3d3c1', 'd2633cbd-70bf-4e16-8fee-e184506dbb65', 0, 'C50.912, C78.7, C79.51');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3b04b316-57bd-413d-a280-8817979621b8', 'd2633cbd-70bf-4e16-8fee-e184506dbb65', 1, 'C78.7, C79.51, Z85.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d77cd71e-547e-42a0-b987-53a2c3001544', 'd2633cbd-70bf-4e16-8fee-e184506dbb65', 2, 'Z85.3, C78.7, C79.51');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('555edaad-214c-4218-acff-677da3c5d59f', 'd2633cbd-70bf-4e16-8fee-e184506dbb65', 3, 'C79.51, C78.7, Z85.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d2633cbd-70bf-4e16-8fee-e184506dbb65', '3b04b316-57bd-413d-a280-8817979621b8', 'Since the primary breast cancer has been surgically treated with no evidence of recurrence, it''s coded as history of malignant neoplasm (Z85.3), NOT as a current active primary cancer (C50.912) — this is a genuinely common advanced-tier distinction: an actively treated metastatic site is coded as current, while a resolved primary with no evidence of recurrence is coded as history, even while related metastatic disease is actively being treated. C78.7 (secondary malignant neoplasm of liver) and C79.51 (secondary malignant neoplasm of bone) are both sequenced as the active, currently-treated conditions, ahead of the history code, since ongoing chemotherapy is directed at the metastatic sites specifically.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('49ca6ff7-7694-46b5-a4b9-c84a1e984f6f', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 12, 'A patient is prescribed both an ACE inhibitor and an NSAID by two different providers who were unaware of each other''s prescriptions, resulting in acute kidney injury from the drug interaction. Both medications were taken exactly as prescribed. Select the correct coding approach.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4ed524b8-a870-4a92-81d8-6eb5f2b2ef9d', '49ca6ff7-7694-46b5-a4b9-c84a1e984f6f', 0, 'T50.905A, N17.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a92ae90e-09eb-42c2-905e-bda053c451a9', '49ca6ff7-7694-46b5-a4b9-c84a1e984f6f', 1, 'T46.4X5A, T39.395A, N17.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5b5862fa-7854-48c9-8389-53a83096aa0b', '49ca6ff7-7694-46b5-a4b9-c84a1e984f6f', 2, 'T46.4X5A, N17.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('93592219-3045-44ce-96ca-c412b78e3746', '49ca6ff7-7694-46b5-a4b9-c84a1e984f6f', 3, 'T50.905S, N17.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('49ca6ff7-7694-46b5-a4b9-c84a1e984f6f', 'a92ae90e-09eb-42c2-905e-bda053c451a9', 'This is an adverse effect (correctly-prescribed and correctly-taken medications causing an unintended harmful effect), not poisoning — poisoning applies specifically to incorrect use, wrong dose, or non-prescribed substances, none of which apply here since both drugs were taken exactly as prescribed. Because TWO separate drugs, each independently correctly used, combined to cause the adverse effect, BOTH adverse-effect T-codes are required: T46.4X5A (adverse effect of ACE inhibitor) and T39.395A (adverse effect of other NSAID) — this dual-drug adverse-effect coding is a genuinely advanced pattern many candidates miss, defaulting to coding only one drug. N17.9 (acute kidney injury) is added as the resulting condition.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('011935c8-5278-4758-9b80-7f55cfb3b5b1', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 13, 'A patient with alcohol use disorder, in early remission per physician documentation, was hospitalized for alcohol withdrawal delirium 10 days ago and is now stable on a tapering benzodiazepine regimen managed by home health nursing. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('598b60cc-f7c3-4903-b25d-d9012833a563', '011935c8-5278-4758-9b80-7f55cfb3b5b1', 0, 'F10.921, F10.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('da1dc98e-30cc-4303-8e8d-3da9833656f0', '011935c8-5278-4758-9b80-7f55cfb3b5b1', 1, 'F10.231, F10.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('949f972a-2ed9-4612-aab2-021b0d485a6d', '011935c8-5278-4758-9b80-7f55cfb3b5b1', 2, 'F10.921, F10.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fe803cf4-15e8-4349-a1c4-fe49ca2e9acc', '011935c8-5278-4758-9b80-7f55cfb3b5b1', 3, 'F10.230, F10.11');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('011935c8-5278-4758-9b80-7f55cfb3b5b1', 'da1dc98e-30cc-4303-8e8d-3da9833656f0', 'F10.231 (alcohol dependence with withdrawal delirium) reflects that this patient has alcohol DEPENDENCE (not just ''use'') given the severity implied by a withdrawal-delirium hospitalization — F10.9x codes are the USE family (no dependence documented) and don''t match a presentation this severe. The remission code paired with it is F10.21 (alcohol dependence, in remission) — not F10.11, which is in the ABUSE family (F10.1x), a different severity class entirely from dependence (F10.2x). This three-way family split (F10.1x = abuse, F10.2x = dependence, F10.9x = use) is exactly the kind of structural subtlety this tier tests: the withdrawal-delirium code (F10.231) already establishes dependence-level severity, so the paired remission code must come from the same F10.2x dependence family, not the F10.1x abuse family.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a41dad16-97cb-4da4-acfc-86f4097b2961', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 14, 'A patient has chronic systolic heart failure (I50.22) and is admitted to home health with a NEW diagnosis of acute pulmonary edema requiring diuresis, documented by the physician as a distinct acute decompensation event layered on the chronic condition. Select the correct combination code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6529828e-41c3-4b4c-9016-281928a0cefe', 'a41dad16-97cb-4da4-acfc-86f4097b2961', 0, 'I50.22, J81.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b56023d6-838c-4f25-9e0b-192ae93238a0', 'a41dad16-97cb-4da4-acfc-86f4097b2961', 1, 'I50.23');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6146aadf-d6c2-4375-bb81-1974b4f5aa6d', 'a41dad16-97cb-4da4-acfc-86f4097b2961', 2, 'I50.21, J81.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9d68b778-230d-4de7-b9a6-43544436d20a', 'a41dad16-97cb-4da4-acfc-86f4097b2961', 3, 'I50.23, J81.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a41dad16-97cb-4da4-acfc-86f4097b2961', 'b56023d6-838c-4f25-9e0b-192ae93238a0', 'I50.23 (acute on chronic systolic heart failure) is the single combination code that directly captures ''chronic heart failure with a new acute decompensation'' — J81.0 (acute pulmonary edema) is NOT separately added on top of this, because acute pulmonary edema in the context of acute decompensated heart failure is an inherent clinical manifestation of the I50.23 code itself, not a separately codable condition, per ICD-10-CM guidance treating acute pulmonary edema as integral to acute heart failure exacerbation unless a genuinely distinct non-cardiac cause is documented.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('249d539b-ff15-432d-a2f4-334fc326732f', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 15, 'A patient has End-Stage Renal Disease on hemodialysis via an AV fistula. During a home health visit, the SN identifies the fistula site is red, warm, and draining purulent fluid, with a fever, and the physician confirms a fistula site infection requiring IV antibiotics at home. Select the correct principal diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3219e3cd-366d-4782-a6b2-598437978d3c', '249d539b-ff15-432d-a2f4-334fc326732f', 0, 'T82.7XXA, N18.6, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb4bffcf-90b4-47f2-95ef-bb9dd04de06b', '249d539b-ff15-432d-a2f4-334fc326732f', 1, 'T80.211A, N18.6, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a762a07d-dbb4-4b60-9fde-744c81f513f5', '249d539b-ff15-432d-a2f4-334fc326732f', 2, 'T82.7XXA, N18.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c053d8b2-fba2-454c-a866-8b85ad70b180', '249d539b-ff15-432d-a2f4-334fc326732f', 3, 'I77.9, N18.6, Z99.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('249d539b-ff15-432d-a2f4-334fc326732f', '3219e3cd-366d-4782-a6b2-598437978d3c', 'T82.7XXA (infection and inflammatory reaction due to cardiac and vascular devices, implants and grafts — initial encounter) is the correct code for an infected AV fistula, since the fistula is a vascular access device. T80.211A is incorrect — that code family is for infection due to VASCULAR CATHETERS specifically, not a surgically-created AV fistula, which is a genuinely distinct device category coded differently. N18.6 (ESRD) and Z99.2 (dialysis dependence) are both required secondary codes. This is the initial encounter (A) since this is the first identification and active treatment of this specific infection episode.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7361ef6e-b95b-45c8-8999-dc5483c13ab4', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 16, 'A 68-year-old patient with Parkinson''s disease, without dyskinesia and without motor fluctuations, has developed dysphagia significant enough to require a modified diet and swallowing therapy, along with orthostatic hypotension attributed by the physician directly to Parkinson''s autonomic dysfunction. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cf63afa7-732e-4b58-a912-bc1e7dfa04b5', '7361ef6e-b95b-45c8-8999-dc5483c13ab4', 0, 'G20.A1, R13.10, I95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e0ddce44-0d69-4fae-b507-8b61b2f65222', '7361ef6e-b95b-45c8-8999-dc5483c13ab4', 1, 'G20.A1, R13.10, G90.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9d46c909-6abf-41cb-90e8-7a78d405234a', '7361ef6e-b95b-45c8-8999-dc5483c13ab4', 2, 'G20.A1, R13.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7df1d525-4efa-4f25-9638-98a75d5286a6', '7361ef6e-b95b-45c8-8999-dc5483c13ab4', 3, 'G20.A1, G90.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7361ef6e-b95b-45c8-8999-dc5483c13ab4', 'e0ddce44-0d69-4fae-b507-8b61b2f65222', 'Since the physician specifically attributes the orthostatic hypotension to Parkinson''s-related autonomic dysfunction (not an unrelated, independent cause), G90.3 (multi-system degeneration of the autonomic nervous system, which includes Parkinson''s-related autonomic dysfunction/neurogenic orthostatic hypotension) is the correct code — I95.1 (orthostatic hypotension, unspecified/general) would under-code the documented specific causal link to the underlying neurological disease. G20.A1 (Parkinson''s disease without dyskinesia, without mention of fluctuations — matching the documented motor status) is sequenced first as the underlying condition; G20 alone is a non-billable category header requiring this dyskinesia/fluctuation specification. R13.10 (dysphagia, unspecified) captures the swallowing difficulty.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8438630d-3992-43c4-a8bd-95701704fdaa', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 17, 'A patient with rheumatoid arthritis on long-term methotrexate develops methotrexate-induced pancytopenia, correctly dosed and taken as prescribed, requiring close CBC monitoring by home health nursing. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ee78b92e-655f-4170-af4f-cdc49551cea0', '8438630d-3992-43c4-a8bd-95701704fdaa', 0, 'T45.1X5A, D61.9, M06.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e0fef1e2-99df-4844-ab32-cae4b6fb7764', '8438630d-3992-43c4-a8bd-95701704fdaa', 1, 'M06.9, T45.1X5A, D61.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1a74d45b-ab62-4bfc-a3df-b3062e9d2241', '8438630d-3992-43c4-a8bd-95701704fdaa', 2, 'D61.9, T45.1X5A, M06.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f09861c4-c979-41f1-9993-a9569dc1d48c', '8438630d-3992-43c4-a8bd-95701704fdaa', 3, 'T45.1X1A, D61.9, M06.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8438630d-3992-43c4-a8bd-95701704fdaa', 'e0fef1e2-99df-4844-ab32-cae4b6fb7764', 'M06.9 (rheumatoid arthritis, unspecified) is sequenced first as the underlying condition driving the medication use and the reason care is ongoing. T45.1X5A (adverse effect of antineoplastic and immunosuppressive drugs, initial encounter) is correctly coded as an ADVERSE effect — not T45.1X1A, which is the poisoning code for accidental/intentional misuse; the drug was taken exactly as prescribed, so this is unambiguously an adverse effect. D61.9 (aplastic anemia, unspecified — used here for pancytopenia as the resulting condition) follows as the documented consequence.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cc06873c-4e2e-46c1-a1e7-0485f3a9c131', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 18, 'A patient develops an adverse reaction to a newly started ACE inhibitor, presenting with a persistent dry cough documented by the physician as medication-induced, correctly prescribed and taken. The medication is discontinued. Select the correct coding for the home health visit addressing the cough.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b6a8fd5c-76a0-4738-92e8-15224f52d841', 'cc06873c-4e2e-46c1-a1e7-0485f3a9c131', 0, 'R05.9, T46.4X5A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('03e80acd-391f-46f6-8d72-3514dd05d90f', 'cc06873c-4e2e-46c1-a1e7-0485f3a9c131', 1, 'T46.4X5A, R05.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('78fe29ac-dc22-4d30-8852-d85f166d0da0', 'cc06873c-4e2e-46c1-a1e7-0485f3a9c131', 2, 'R05.9, T46.4X5D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9410a687-b6e3-47cd-b3ee-94cfbf29fcdc', 'cc06873c-4e2e-46c1-a1e7-0485f3a9c131', 3, 'T46.4X5D, R05.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cc06873c-4e2e-46c1-a1e7-0485f3a9c131', '03e80acd-391f-46f6-8d72-3514dd05d90f', 'T46.4X5A (adverse effect of ACE inhibitor, initial encounter) is sequenced first per the ICD-10-CM guideline that when a condition is the result of a documented adverse drug effect, the adverse effect code is sequenced FIRST, followed by the manifestation code — here R05.9 (cough, unspecified). This is a genuinely commonly-missed sequencing rule, since intuitively many candidates want to lead with the presenting symptom (the cough) rather than the adverse-effect code. This is the initial encounter (A) since this is the first visit addressing this specific adverse reaction.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1067f555-a21b-4171-b3ec-908b1fe7100d', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 19, 'A patient with a long-standing colostomy (for diverticulitis, resolved, 5 years post-surgery) is admitted to home health for management of a NEW peristomal skin breakdown due to leakage around the appliance, with no signs of infection. Select the correct principal diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('940a3145-3ebc-45aa-a1bd-0a15da0e81fd', '1067f555-a21b-4171-b3ec-908b1fe7100d', 0, 'L24.B3, Z93.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f86d271b-23e3-4592-9dda-66210f00232b', '1067f555-a21b-4171-b3ec-908b1fe7100d', 1, 'L98.9, Z93.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('541ecfac-e0bb-4f51-bb60-898c29a6aacf', '1067f555-a21b-4171-b3ec-908b1fe7100d', 2, 'K94.02, Z93.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1def18bd-96fa-4657-8acb-cf2320a410df', '1067f555-a21b-4171-b3ec-908b1fe7100d', 3, 'K94.09, Z93.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1067f555-a21b-4171-b3ec-908b1fe7100d', '940a3145-3ebc-45aa-a1bd-0a15da0e81fd', 'L24.B3 (irritant contact dermatitis related to fecal or urinary stoma or fistula) is the specific, dedicated code for exactly this presentation — appliance-leakage-caused peristomal skin breakdown — and is more precise than any of the K94 colostomy-complication family options: K94.02 is actually ''colostomy infection'' (not skin irritation, and no infection is documented here), and K94.09 (''other complications of colostomy'') is a less specific fallback that under-codes the documented, specifically diagnosable irritant contact dermatitis when the dedicated L24.B code family exists and matches. L98.9 (unspecified skin disorder) would be far too generic given the specific, stoma-related dermatitis code available. Z93.3 (colostomy status) is added as a secondary code to indicate the colostomy is present, since the primary reason for the visit is the complication, not the colostomy status itself.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('dbdd770c-b6d8-4078-8bde-2bbec9beb02c', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 20, 'A patient with a history of deep vein thrombosis 5 years ago (fully resolved, no current treatment) is admitted to home health for an unrelated hip replacement recovery, with no current DVT risk factors documented. Select the correct approach to the DVT history.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('31f8e639-0dec-4376-b7ac-df6d5dd9da67', 'dbdd770c-b6d8-4078-8bde-2bbec9beb02c', 0, 'Z86.718 should be listed as a secondary diagnosis');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9ef0e730-6086-453d-8257-06e2f9a3be82', 'dbdd770c-b6d8-4078-8bde-2bbec9beb02c', 1, 'I82.409 should be listed as a secondary diagnosis');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d8f70e06-8d94-4342-b346-2b8619fda277', 'dbdd770c-b6d8-4078-8bde-2bbec9beb02c', 2, 'The DVT history should not be coded since it is fully resolved and not being monitored or treated');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('06d89b80-3a14-4267-8d4b-e8f95e13b3f0', 'dbdd770c-b6d8-4078-8bde-2bbec9beb02c', 3, 'Z86.718 should be listed as the principal diagnosis');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('dbdd770c-b6d8-4078-8bde-2bbec9beb02c', '31f8e639-0dec-4376-b7ac-df6d5dd9da67', 'Z86.718 (personal history of other venous thrombosis and embolism) IS appropriately coded as a secondary diagnosis, even though the condition is resolved — history codes are specifically meant to capture past conditions that could reasonably influence current care decisions (a history of DVT is clinically relevant risk information for a hip replacement recovery, given the elevated post-surgical VTE risk), which is exactly the kind of history that OASIS and clinical documentation guidance direct coders to capture. This differs from the earlier fundamentals-level teaching that emphasized coding only active, currently-treated conditions — the distinction here is that Z-history codes for resolved conditions ARE appropriately added specifically when clinically relevant to current care, not omitted simply because the condition itself is inactive.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c0bb9a31-ac3c-4f86-ab0b-0016ee39839e', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 21, 'A patient with type 1 diabetes has diabetic ketoacidosis requiring hospitalization, now resolved, and returns home with home health for diabetes education and glucose monitoring. The patient also has diabetic peripheral neuropathy with chronic pain, well-controlled on gabapentin. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9bdeea81-ed8a-4f02-a9c2-2aafb1942544', 'c0bb9a31-ac3c-4f86-ab0b-0016ee39839e', 0, 'E10.10, E10.42');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d81addc2-fa58-4f8c-83e4-c9c08d0f0c62', 'c0bb9a31-ac3c-4f86-ab0b-0016ee39839e', 1, 'E10.9, E10.42');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('03716309-c8d2-430a-acd3-46c16364ef69', 'c0bb9a31-ac3c-4f86-ab0b-0016ee39839e', 2, 'E10.42, E10.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4ad0112b-292f-498c-8f7c-375e9461a86f', 'c0bb9a31-ac3c-4f86-ab0b-0016ee39839e', 3, 'E10.42');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c0bb9a31-ac3c-4f86-ab0b-0016ee39839e', '4ad0112b-292f-498c-8f7c-375e9461a86f', 'Since the DKA has fully resolved and is not the current focus of care (the home health encounter is for education/monitoring plus managing the ongoing neuropathy), E10.10 (diabetes with ketoacidosis) is NOT coded — coding an already-resolved acute complication that isn''t being actively managed at this encounter would misrepresent the current clinical picture. E10.42 (type 1 diabetes with diabetic polyneuropathy) alone correctly captures the single, currently-relevant, ongoing complication being managed — adding a separate unspecified diabetes code (E10.9) on top would be redundant, since E10.42 already establishes the diabetes diagnosis within its combination code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5da2863d-bc68-483e-97d3-5033d04f6b17', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 22, 'A patient with atrial fibrillation on warfarin develops a spontaneous intracranial hemorrhage, confirmed by the physician as anticoagulant-related, with the warfarin taken exactly as prescribed. The patient is now home for monitoring and physical therapy for resulting left-sided weakness. Select the correct coding sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4a074d91-000f-4c73-a7ec-b7c5cf2e940c', '5da2863d-bc68-483e-97d3-5033d04f6b17', 0, 'I61.9, T45.515A, I48.91, G81.94');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('698915a9-69fd-4c67-9a8d-e0b05186c8b6', '5da2863d-bc68-483e-97d3-5033d04f6b17', 1, 'T45.515A, I61.9, I48.91, G81.94');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('be9d0f9b-89da-48b3-b2ff-f86372c3c544', '5da2863d-bc68-483e-97d3-5033d04f6b17', 2, 'I61.9, I48.91, T45.515A, G81.94');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4fb80a59-8a9f-45b1-8ebc-7c28a68a2e08', '5da2863d-bc68-483e-97d3-5033d04f6b17', 3, 'G81.94, I61.9, T45.515A, I48.91');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5da2863d-bc68-483e-97d3-5033d04f6b17', '698915a9-69fd-4c67-9a8d-e0b05186c8b6', 'T45.515A (adverse effect of anticoagulants, initial encounter) is sequenced FIRST per the adverse-effect sequencing rule (the drug-effect code leads, followed by the resulting manifestation) — this is the same pattern tested elsewhere in this paper (the ACE-inhibitor cough example) applied to a much higher-stakes scenario. I61.9 (intracerebral hemorrhage, unspecified) follows as the resulting condition. I48.91 (atrial fibrillation, unspecified) is added as the underlying reason for the anticoagulant use. G81.94 (hemiplegia, unspecified, affecting left NONdominant side) is added for the residual weakness — since handedness isn''t documented and the weakness is left-sided, standard ICD-10-CM default-laterality convention assumes right-hand dominance absent contrary documentation, meaning an undocumented left-sided deficit defaults to the ''nondominant'' code (G81.94), not ''dominant.'' Note this would use an I69-family late-effect code instead if the hemorrhage were now considered resolved with only the residual deficit remaining — the exact code here assumes the hemorrhage itself is still the active condition being monitored, which the scenario supports given ongoing home monitoring.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('75653699-371f-47ca-8791-2e2a68aefb85', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 23, 'A patient status post total knee replacement 6 weeks ago develops a periprosthetic joint infection confirmed by culture to be due to Staphylococcus aureus (methicillin-sensitive), requiring IV antibiotics at home. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('95a7915a-207e-446b-a662-964c96b5d4b8', '75653699-371f-47ca-8791-2e2a68aefb85', 0, 'T84.53XA, B95.61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('36e49dc1-120f-4132-8971-5cac34e40e42', '75653699-371f-47ca-8791-2e2a68aefb85', 1, 'T84.54XA, B95.61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('00335961-7523-4c89-b4ad-91df1f0aef40', '75653699-371f-47ca-8791-2e2a68aefb85', 2, 'T84.53XA, B95.62');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e193606e-1d80-473a-b3a8-677720154a09', '75653699-371f-47ca-8791-2e2a68aefb85', 3, 'M00.061, B95.61');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('75653699-371f-47ca-8791-2e2a68aefb85', '95a7915a-207e-446b-a662-964c96b5d4b8', 'T84.53XA (infection and inflammatory reaction due to internal right knee prosthesis, initial encounter) is the specific device-complication code for a periprosthetic joint infection — M00.061 (staphylococcal arthritis, knee) would be incorrect, since the infection is specifically tied to the prosthetic device, not a native joint septic arthritis, and device-related infection codes take priority when a prosthesis is the documented source. B95.61 (MSSA as the causal organism) is added — not B95.62 (MRSA), since the culture specifically confirmed methicillin-SENSITIVE Staph aureus.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('77c836ea-c459-4782-ac13-c6de1ef9f7a2', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 24, 'A patient with chronic obstructive pulmonary disease is on home oxygen and develops acute bronchitis, physician-documented as distinct from a COPD exacerbation, with the physician explicitly noting the COPD itself is currently stable. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f9f59446-5ed1-409b-81c4-9ac075e2c10d', '77c836ea-c459-4782-ac13-c6de1ef9f7a2', 0, 'J44.0, J20.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0ae616ce-03b4-4048-9379-31a9ad84609e', '77c836ea-c459-4782-ac13-c6de1ef9f7a2', 1, 'J20.9, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4bdb484d-a63c-4392-a1d4-8d1832655fb5', '77c836ea-c459-4782-ac13-c6de1ef9f7a2', 2, 'J44.1, J20.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d146d216-2fef-4b4e-a7ae-6c8cad0378e9', '77c836ea-c459-4782-ac13-c6de1ef9f7a2', 3, 'J20.9, J44.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('77c836ea-c459-4782-ac13-c6de1ef9f7a2', '0ae616ce-03b4-4048-9379-31a9ad84609e', 'Since the physician explicitly documents the COPD as currently STABLE (not exacerbated) and the acute bronchitis as a distinct, separate acute illness, J44.0 (COPD with acute lower respiratory infection — the correct combination code when a respiratory infection IS triggering/complicating the COPD) is NOT appropriate here, since the documentation specifically separates the two rather than linking them. J20.9 (acute bronchitis, unspecified) is sequenced first as the acute, currently-treated condition. J44.9 (COPD, unspecified, without documented exacerbation) is added as the stable chronic condition — this tests whether a candidate defaults to the combination code J44.0 reflexively whenever both COPD and a respiratory infection are present, versus correctly reading that the physician explicitly separated them as unrelated in this specific case.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3e4cf704-bde2-4ab2-a7f9-7b8346798f62', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 25, 'A patient with acute on chronic systolic heart failure is admitted to home health following hospitalization for cardiogenic shock, now hemodynamically stable on oral medications, with the shock episode fully resolved prior to discharge. Home health will monitor for signs of decompensation. Select the correct principal diagnosis for the home health episode.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('22ffe3d5-16a9-4fc7-8d07-cc2bd09be7d4', '3e4cf704-bde2-4ab2-a7f9-7b8346798f62', 0, 'R57.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fa6a4d1b-0057-49fb-bf66-b28fe6197777', '3e4cf704-bde2-4ab2-a7f9-7b8346798f62', 1, 'I50.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('859cc3ef-8cba-47bf-9d26-f5c06e893501', '3e4cf704-bde2-4ab2-a7f9-7b8346798f62', 2, 'I50.23');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ca3af5ad-10ce-4ec8-9c67-5e267cca1f59', '3e4cf704-bde2-4ab2-a7f9-7b8346798f62', 3, 'I50.9, R57.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3e4cf704-bde2-4ab2-a7f9-7b8346798f62', '859cc3ef-8cba-47bf-9d26-f5c06e893501', 'Since the cardiogenic shock has fully resolved before the home health episode begins, R57.0 (cardiogenic shock) is NOT coded — it''s not an active condition being managed at this encounter, and coding a resolved acute event as principal diagnosis would misrepresent the current focus of care. I50.23 (acute on chronic systolic heart failure) is coded to the specificity actually documented in the stem, rather than defaulting to I50.9 (unspecified) — this tests whether a candidate correctly uses the documented acuity/type detail rather than under-coding to unspecified out of habit, and correctly omits an already-resolved complication (the shock) rather than over-coding it as still active.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('989b9e48-9672-4c20-aaae-75e7ec0c83d8', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 26, 'A patient with chronic kidney disease stage 5 not yet on dialysis has uncontrolled anemia due to CKD, requiring erythropoietin-stimulating agent injections managed by home health nursing. The anemia is documented as due to the CKD itself, not blood loss or other cause. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3799e0db-3d32-4d4c-93e5-6172a93ae1a3', '989b9e48-9672-4c20-aaae-75e7ec0c83d8', 0, 'D63.1, N18.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c493c55a-6234-4abe-a6c4-f383f28e3817', '989b9e48-9672-4c20-aaae-75e7ec0c83d8', 1, 'N18.5, D63.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('76ebf3ac-3e9d-41f6-9023-76ef6ffc037d', '989b9e48-9672-4c20-aaae-75e7ec0c83d8', 2, 'N18.6, D63.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('98829796-4f2a-4a9a-9603-4662002cc85f', '989b9e48-9672-4c20-aaae-75e7ec0c83d8', 3, 'D64.9, N18.5');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('989b9e48-9672-4c20-aaae-75e7ec0c83d8', 'c493c55a-6234-4abe-a6c4-f383f28e3817', 'N18.5 (CKD stage 5) is sequenced first — not N18.6 (ESRD), since ESRD specifically requires dialysis dependence or transplant, and this patient is explicitly ''not yet on dialysis,'' meaning stage 5 without ESRD status is the accurate code. D63.1 (anemia in chronic kidney disease) is added second — this combination code has a ''code first the underlying CKD'' instruction, meaning the CKD code must be sequenced BEFORE the anemia code, not after, which is exactly why N18.5 leads and D63.1 follows, not the reverse order some candidates default to.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2df3d002-03d1-4d7c-8bae-917ebb053699', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 27, 'A home health patient with severe aortic stenosis with associated aortic insufficiency (both confirmed by recent echocardiogram and documented by the physician) is scheduled for outpatient TAVR (transcatheter aortic valve replacement) next month. The current home health episode is entirely for pre-procedure optimization: managing hypertension and monitoring functional status. Select the correct principal diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6007b788-31cf-4045-a43b-6e2980c85291', '2df3d002-03d1-4d7c-8bae-917ebb053699', 0, 'Z01.818, I35.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3174a641-595a-4924-8eb9-e29c47e822d6', '2df3d002-03d1-4d7c-8bae-917ebb053699', 1, 'I35.0, I10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('25f7ca30-c101-4725-8cdf-626b7c20366d', '2df3d002-03d1-4d7c-8bae-917ebb053699', 2, 'I35.2, I10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fffb3b23-33d9-4d55-99ae-5cc4466250ea', '2df3d002-03d1-4d7c-8bae-917ebb053699', 3, 'Z01.818, I35.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2df3d002-03d1-4d7c-8bae-917ebb053699', '25f7ca30-c101-4725-8cdf-626b7c20366d', 'I35.2 (nonrheumatic aortic valve stenosis with insufficiency) is the correct combination code since both stenosis AND insufficiency are explicitly documented on echocardiogram — using I35.0 (stenosis alone) would under-code the documented insufficiency component. I10 (essential hypertension) is added since managing hypertension is explicitly the focus of this pre-procedure optimization episode. Z01.818 (encounter for other pre-procedural examination) is not the best principal diagnosis here since the home health episode''s actual clinical work is active hypertension management and functional monitoring tied to the valve disease, not a generic pre-op exam encounter.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ab3de1e0-1cb4-43b8-9c3e-e3ddc8ef66e8', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 28, 'A patient with chronic hepatitis C is admitted to home health for management of ascites and hepatic encephalopathy, both documented as complications of the hepatitis C-related cirrhosis. Select the correct coding sequence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ae250fa3-a18a-42de-a4b5-9056b8c35358', 'ab3de1e0-1cb4-43b8-9c3e-e3ddc8ef66e8', 0, 'K76.82, K70.31, R18.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('407a7d4e-5bd1-4a2d-b6fb-d819bba62ed3', 'ab3de1e0-1cb4-43b8-9c3e-e3ddc8ef66e8', 1, 'K74.60, B18.2, K76.82, R18.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3d3b5219-8b44-4199-a57a-f8398738b312', 'ab3de1e0-1cb4-43b8-9c3e-e3ddc8ef66e8', 2, 'B18.2, K74.60, K76.82, R18.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('82d859ad-cf61-4ee9-a597-50e0af6784df', 'ab3de1e0-1cb4-43b8-9c3e-e3ddc8ef66e8', 3, 'B18.2, K76.82, K74.60');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ab3de1e0-1cb4-43b8-9c3e-e3ddc8ef66e8', '3d3b5219-8b44-4199-a57a-f8398738b312', 'B18.2 (chronic viral hepatitis C) is sequenced first per the ICD-10-CM Alphabetic Index instructional note under ''Hepatitis, chronic, C, with hepatic cirrhosis,'' which directs ''code also cirrhosis'' — the hepatitis code is the etiology and is sequenced ahead of its manifestation (the cirrhosis), consistent with the standard etiology/manifestation convention used throughout this exam tier (the same pattern as diabetes-with-complication combination codes). K74.60 (unspecified cirrhosis of liver) follows as the structural liver disease caused by the hepatitis. K76.82 (hepatic encephalopathy) and R18.8 (other ascites) are added for the two documented complications — note K76.82 is the correct dedicated encephalopathy code, distinct from the K72.9x ''hepatic failure'' family, which describes a different (though related) clinical concept and would misclassify this specific finding. This reflects standard etiology-first sequencing, distinct from a scenario where cirrhosis itself (not the viral cause) is the explicit, singular focus of an encounter with no causal hepatitis code available.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('52acc783-228d-4ad0-9931-4a5b97f7e6d9', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 29, 'A patient with a permanent pacemaker for third-degree AV block develops a pacemaker pocket site infection 2 weeks after implantation, requiring home IV antibiotics, with the pacemaker itself functioning normally. Select the correct principal diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('95a204bb-799d-4fe7-9a56-3858798647c2', '52acc783-228d-4ad0-9931-4a5b97f7e6d9', 0, 'T82.7XXA, I44.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('99c20e13-278a-41f7-aa69-eb240988245e', '52acc783-228d-4ad0-9931-4a5b97f7e6d9', 1, 'T82.7XXA, Z95.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eb0a5cb6-f280-4d49-ba04-3a462765f22c', '52acc783-228d-4ad0-9931-4a5b97f7e6d9', 2, 'T82.6XXA, Z95.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('587fed1b-e321-49ae-88df-7c55c18576f5', '52acc783-228d-4ad0-9931-4a5b97f7e6d9', 3, 'I44.2, T82.7XXA');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('52acc783-228d-4ad0-9931-4a5b97f7e6d9', '99c20e13-278a-41f7-aa69-eb240988245e', 'T82.7XXA (infection and inflammatory reaction due to cardiac and vascular devices — includes pacemakers) is sequenced first as the active complication being treated. T82.6XXA is a different, incorrect code (that specific subcategory covers infection due to a different device class); T82.7 is the correct family for cardiac device infections generally including pacemaker pocket infections. Z95.0 (presence of cardiac pacemaker) is added as a device-status secondary code. I44.2 (complete AV block, the original reason for the pacemaker) is NOT coded here since the underlying conduction disorder is now being managed BY the functioning pacemaker and isn''t itself the active problem — coding I44.2 alongside Z95.0 would be redundant, since the pacemaker''s presence already implies the historical conduction disorder it was placed for.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9e92d6f9-9648-4e51-adf5-9fd764f717cf', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 30, 'A 45-year-old patient with morbid obesity (BMI 42) develops obesity hypoventilation syndrome, confirmed by sleep study and physician documentation, requiring home BiPAP therapy managed by home health respiratory therapy. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9bc1b2f0-efb4-4b78-bea6-5ba850a586ff', '9e92d6f9-9648-4e51-adf5-9fd764f717cf', 0, 'E66.01, E66.9, Z68.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5b750592-93c6-48e6-9080-a712b206c34c', '9e92d6f9-9648-4e51-adf5-9fd764f717cf', 1, 'E66.01, G47.36, Z68.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('598a49d0-d261-4a7b-b948-cef243bf239d', '9e92d6f9-9648-4e51-adf5-9fd764f717cf', 2, 'G47.36, E66.01, Z68.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('841f00d3-84ec-479d-a741-5af54d81b3cc', '9e92d6f9-9648-4e51-adf5-9fd764f717cf', 3, 'E66.9, G47.36, Z68.41');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9e92d6f9-9648-4e51-adf5-9fd764f717cf', '598a49d0-d261-4a7b-b948-cef243bf239d', 'G47.36 (sleep-related hypoventilation in conditions classified elsewhere — used for obesity hypoventilation syndrome specifically) is sequenced first as the active condition driving the BiPAP therapy and the reason for respiratory therapy involvement. E66.01 (morbid obesity due to excess calories) follows as the underlying etiological condition per the ''code first'' convention associated with obesity-related complications. Z68.41 reports the specific BMI 40.0-44.9 adult category, required whenever BMI is documented for an obesity-related condition.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('831147d5-8158-438d-8b0b-eb0859319ad1', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 31, 'A patient with Alzheimer''s dementia, moderate stage, develops behavioral disturbances specifically including physical aggression and agitation toward caregivers, confirmed and documented by the physician as part of the dementia presentation. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6517e4f8-d16f-4159-831e-1f861ad8d7e7', '831147d5-8158-438d-8b0b-eb0859319ad1', 0, 'G30.9, F02.811');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b30bc9fd-ca25-4890-bef6-c77b8bfdd8a8', '831147d5-8158-438d-8b0b-eb0859319ad1', 1, 'F03.911');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('966262b9-e6fb-4731-b5dd-1a7f728b383d', '831147d5-8158-438d-8b0b-eb0859319ad1', 2, 'G30.9, F02.80');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1615bb99-70c7-4335-abe0-d30a5b84d6d4', '831147d5-8158-438d-8b0b-eb0859319ad1', 3, 'F02.811, G30.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('831147d5-8158-438d-8b0b-eb0859319ad1', '6517e4f8-d16f-4159-831e-1f861ad8d7e7', 'G30.9 (Alzheimer''s disease, unspecified) is sequenced FIRST per the F02.8- code family''s own instructional note, which requires the underlying disease to be coded first, with the dementia-manifestation code following — this is the reverse of a pattern a candidate might expect from other ''code first'' conventions in this paper, since here the ETIOLOGY code (G30.9) leads and the MANIFESTATION code (F02.811) follows it, not the other way around. F02.811 (dementia in other diseases classified elsewhere, with behavioral disturbance, WITH agitation) is used rather than F02.80 (without behavioral disturbance) specifically because physical aggression and agitation toward caregivers is explicitly documented as part of the presentation — note that as of FY2024, the older F02.81 code is no longer billable on its own and must be further specified to F02.811 (with agitation) or F02.818 (with other behavioral disturbance); agitation/aggression specifically maps to F02.811. F03.911 (unspecified dementia, unspecified severity, with agitation) would under-code both the known Alzheimer''s etiology and the documented behavioral disturbance.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2c0fa5bf-8113-4b20-a2ee-0ea7e6aea015', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 32, 'A patient receiving home hospice-adjacent (non-hospice) palliative home health care for end-stage COPD develops a new, unrelated acute cystitis requiring antibiotics. Select the correct principal diagnosis for this specific encounter.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a9eb15da-cfcc-4873-9145-acaa35bdf835', '2c0fa5bf-8113-4b20-a2ee-0ea7e6aea015', 0, 'J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d25bdfb3-651b-45b4-9828-9d9066817fbf', '2c0fa5bf-8113-4b20-a2ee-0ea7e6aea015', 1, 'N30.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fe3bf03d-2662-4f1f-851e-db79de31080b', '2c0fa5bf-8113-4b20-a2ee-0ea7e6aea015', 2, 'Z51.5, N30.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('30caafeb-faca-4e08-94fb-9dd92bd6767c', '2c0fa5bf-8113-4b20-a2ee-0ea7e6aea015', 3, 'N30.90');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2c0fa5bf-8113-4b20-a2ee-0ea7e6aea015', 'd25bdfb3-651b-45b4-9828-9d9066817fbf', 'N30.00 (acute cystitis without hematuria) is the correct principal diagnosis for THIS SPECIFIC encounter, since the acute cystitis is the active, currently-treated condition driving this visit''s antibiotic order — the underlying COPD (J44.9), while genuinely present and severe, is not what''s being actively treated at this specific encounter and would be a secondary code, not the principal diagnosis. Z51.5 (palliative care encounter) is not appropriate as a principal diagnosis modifier here either, since this specific visit''s clinical focus is the acute infection, not general palliative management — Z51.5 would be more appropriate framing for the overall plan of care documentation, not necessarily this specific encounter''s principal diagnosis field.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('07452b1b-6966-4880-9cb5-198be6c7bffb', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 33, 'A patient status post CABG (coronary artery bypass graft) surgery 3 weeks ago develops a sternal wound infection requiring wound VAC therapy and IV antibiotics at home. The wound is superficial, not involving the sternum bone itself. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b662f1b9-02d0-4aef-8636-02169dcd0c55', '07452b1b-6966-4880-9cb5-198be6c7bffb', 0, 'T81.41XA, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b646f3b9-adb3-44af-be37-d99a9bdd18ea', '07452b1b-6966-4880-9cb5-198be6c7bffb', 1, 'T81.31XA, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('78f78143-e4ac-4ed3-9e78-5cc508caf7c6', '07452b1b-6966-4880-9cb5-198be6c7bffb', 2, 'I97.410, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('61a10342-ed4d-4beb-a516-22545113f5fa', '07452b1b-6966-4880-9cb5-198be6c7bffb', 3, 'T81.41XA, I25.10');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('07452b1b-6966-4880-9cb5-198be6c7bffb', 'b662f1b9-02d0-4aef-8636-02169dcd0c55', 'T81.41XA (infection following a procedure, superficial incisional surgical site, initial encounter) is the correct code — T81.4 is not a standalone billable code and requires a 5th digit specifying depth (superficial incisional, deep incisional, organ/space, sepsis, or other); since the stem specifically documents the wound as superficial, not involving the sternum bone, T81.41XA is the precise match. T81.31XA (disruption/dehiscence of a surgical wound) is a different complication type (mechanical separation, not infection) and wouldn''t be used here since dehiscence isn''t documented, only infection. I97.410 (intraoperative hemorrhage/hematoma of circulatory system organ) is entirely unrelated to a post-op infection. Z95.1 (presence of coronary artery bypass graft) is added as the device/procedure-status secondary code, appropriately noting the recent CABG as relevant context.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3f5c6566-4c0e-49b9-9011-4e45952036aa', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 34, 'A patient with long-standing bipolar I disorder, currently in a manic episode with psychotic features, is being managed at home by psychiatric home health nursing following recent medication adjustment. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4e390741-561b-4f4e-af37-ad30c711c1ea', '3f5c6566-4c0e-49b9-9011-4e45952036aa', 0, 'F31.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb8f1113-b1dc-4d9e-9245-991fabba218e', '3f5c6566-4c0e-49b9-9011-4e45952036aa', 1, 'F31.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f1969d6c-1715-4f2a-9b94-9380cc673f19', '3f5c6566-4c0e-49b9-9011-4e45952036aa', 2, 'F30.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b1650602-3151-4502-af31-25901b249045', '3f5c6566-4c0e-49b9-9011-4e45952036aa', 3, 'F31.64');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3f5c6566-4c0e-49b9-9011-4e45952036aa', '4e390741-561b-4f4e-af37-ad30c711c1ea', 'F31.2 (bipolar disorder, current episode manic severe with psychotic features) precisely captures both the manic episode AND the psychotic features documented — F31.9 (unspecified) would under-code the real specificity given. F30.2 is incorrect because F30.- codes are for a SINGLE manic episode (no history of prior mood episodes), while this patient has ''long-standing bipolar I disorder,'' meaning F31.- (recurrent/established bipolar disorder) is the correct code family, not F30.-. F31.64 (bipolar, current episode mixed, severe with psychotic features) would be wrong since the episode is documented as manic, not mixed.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ae0ad01f-4f75-487e-80eb-24a100cf7e6e', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 35, 'A patient with a history of pulmonary embolism 6 months ago, now off anticoagulation per physician decision after completing the standard treatment course, is admitted to home health for an unrelated hip fracture recovery. Should the prior PE be coded, and if so, how?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('33a0497b-0106-4138-acf9-a7a985c4388a', 'ae0ad01f-4f75-487e-80eb-24a100cf7e6e', 0, 'Z86.711 as a secondary diagnosis');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7545a861-2b91-4cba-9112-92a6343c0387', 'ae0ad01f-4f75-487e-80eb-24a100cf7e6e', 1, 'I26.99 as a secondary diagnosis');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a066a610-3115-4652-aff8-5488e5830cd4', 'ae0ad01f-4f75-487e-80eb-24a100cf7e6e', 2, 'The PE should not be coded since anticoagulation has been discontinued');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('682d9b5d-047a-434b-b426-23fc88edef9f', 'ae0ad01f-4f75-487e-80eb-24a100cf7e6e', 3, 'Z86.711 as the principal diagnosis');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ae0ad01f-4f75-487e-80eb-24a100cf7e6e', '33a0497b-0106-4138-acf9-a7a985c4388a', 'Z86.711 (personal history of pulmonary embolism) is appropriately coded as a secondary diagnosis — this mirrors the DVT-history question earlier in this paper: a resolved, no-longer-actively-treated condition (here, confirmed by anticoagulation being discontinued) is coded as HISTORY (Z86.711), not as an active condition (I26.99, which would incorrectly imply an ongoing, current PE). This history is clinically relevant to the hip fracture recovery given elevated post-surgical VTE risk in a patient with a prior VTE history, which is exactly the kind of relevant history OASIS and clinical documentation guidance support capturing even when unrelated to the primary reason for the current episode.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c69d8585-680f-45b2-9d5c-8e7c306c2af2', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 36, 'A patient with chronic pain from failed back surgery syndrome is on a long-term opioid regimen. The physician documents the patient has developed opioid-induced constipation, distinct from and more severe than typical, requiring a bowel regimen managed by home health. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('863ea53d-9db1-4ffd-954d-b0e57ad5eb92', 'c69d8585-680f-45b2-9d5c-8e7c306c2af2', 0, 'K59.00, T40.2X5A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1ad48a52-69b9-4236-b16d-defa9827add3', 'c69d8585-680f-45b2-9d5c-8e7c306c2af2', 1, 'T40.2X5A, K59.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('73019db9-af3a-4694-9992-273286aa3d94', 'c69d8585-680f-45b2-9d5c-8e7c306c2af2', 2, 'M96.1, T40.2X5A, K59.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6b82361e-0bd4-473e-88f9-af8432e1bc85', 'c69d8585-680f-45b2-9d5c-8e7c306c2af2', 3, 'K59.00, M96.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c69d8585-680f-45b2-9d5c-8e7c306c2af2', '1ad48a52-69b9-4236-b16d-defa9827add3', 'T40.2X5A (adverse effect of other opioids, initial encounter) is sequenced first per the adverse-effect sequencing rule applied consistently throughout this paper — the drug-effect code leads, followed by the resulting condition. K59.00 (constipation, unspecified) follows as the manifestation. M96.1 (failed back surgery syndrome) is not directly relevant to THIS specific complication''s coding — it''s the reason for the opioid use generally, but the coding here should reflect the direct adverse-effect chain (opioid → constipation) as the focus of this specific complication being addressed, without necessarily re-stating the entire chronic pain history in this particular code set unless separately required by the full plan of care.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('65ffc003-c0cf-4744-8350-c59033b24453', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 37, 'A patient with Type 2 diabetes and diabetic foot ulcer of the right heel, full thickness with muscle involvement but no bone involvement, also has peripheral arterial disease documented as contributing to poor wound healing at the same site. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('54ad8e97-345e-4950-b69a-b0cea964ee40', '65ffc003-c0cf-4744-8350-c59033b24453', 0, 'E11.621, L97.415, I70.239');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4620edd7-43a1-4c7f-9cd4-09af9d8a04ae', '65ffc003-c0cf-4744-8350-c59033b24453', 1, 'E11.621, L97.415, I73.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b97dd306-8b63-4004-9d9a-a3f0c30f4f71', '65ffc003-c0cf-4744-8350-c59033b24453', 2, 'L97.415, E11.621, I70.239');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7d59d3be-bbc4-4d69-bfb4-114b64c17c27', '65ffc003-c0cf-4744-8350-c59033b24453', 3, 'E11.621, I70.239, L97.415');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('65ffc003-c0cf-4744-8350-c59033b24453', '54ad8e97-345e-4950-b69a-b0cea964ee40', 'E11.621 (type 2 diabetes with foot ulcer) is sequenced first, followed by L97.415 (non-pressure chronic ulcer of right heel and midfoot with muscle involvement, no bone) for the specific site/severity, per the standard diabetic-ulcer combination-code sequencing established in earlier papers. I70.239 (atherosclerosis of native arteries of right leg with ulceration, unspecified severity) is added as the documented contributing vascular condition — I73.9 (peripheral vascular disease, unspecified) would under-code the more specific I70.23- atherosclerosis-with-ulceration code family, which is the more precise choice when atherosclerotic PAD is specifically documented as contributing to a lower-extremity ulcer.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('672a4f8f-a9b9-4e70-8995-d84639ac596d', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 38, 'A patient recovering from COVID-19 pneumonia (now resolved, confirmed negative testing) develops post-COVID conditions including persistent fatigue and shortness of breath on exertion, 8 weeks after initial infection, significantly limiting function and requiring home health PT/OT. Select the correct principal diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('907f1b07-8367-4e09-be0a-2367a6d692a2', '672a4f8f-a9b9-4e70-8995-d84639ac596d', 0, 'U09.9, R53.83, R06.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8d2472e6-de25-4277-9097-a5e72d5820d1', '672a4f8f-a9b9-4e70-8995-d84639ac596d', 1, 'J12.82, R53.83, R06.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('05752c82-a084-45dc-9bd6-076a6a6a1a3d', '672a4f8f-a9b9-4e70-8995-d84639ac596d', 2, 'U07.1, R53.83');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4e55b81b-d948-4354-be24-10029277145c', '672a4f8f-a9b9-4e70-8995-d84639ac596d', 3, 'B94.8, R53.83, R06.02');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('672a4f8f-a9b9-4e70-8995-d84639ac596d', '907f1b07-8367-4e09-be0a-2367a6d692a2', 'U09.9 (post COVID-19 condition, unspecified) is the specific code for lingering symptoms following resolved acute COVID-19 infection — this is distinct from U07.1 (COVID-19 itself, the acute infection code, which doesn''t apply since the infection has resolved and testing is now negative) and from J12.82 (COVID-19 pneumonia, which would only apply to the acute pneumonia itself, now resolved). R53.83 (fatigue) and R06.02 (shortness of breath) are added as the specific documented persistent symptoms driving the therapy needs.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c7b87640-643e-4ff6-b45d-6a3ca73b83c3', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 39, 'A patient with long-term tobacco use disorder (nicotine dependence, cigarettes) is admitted to home health primarily for COPD management. The patient reports having fully quit smoking 2 years ago, with no relapse since, and the physician''s own documentation now specifically states ''former smoker, tobacco use disorder resolved.'' Select the correct coding for the tobacco history.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f1f628a5-21cb-4438-8844-6676b0a9ebde', 'c7b87640-643e-4ff6-b45d-6a3ca73b83c3', 0, 'F17.210');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5a2c287d-251b-4305-95aa-e135fea5dcd2', 'c7b87640-643e-4ff6-b45d-6a3ca73b83c3', 1, 'Z87.891');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('66a83057-8c09-452b-96cb-4879f9135a3a', 'c7b87640-643e-4ff6-b45d-6a3ca73b83c3', 2, 'F17.211');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('598d0130-dc85-4899-b000-a06a7524f85f', 'c7b87640-643e-4ff6-b45d-6a3ca73b83c3', 3, 'No code needed since the patient has quit');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c7b87640-643e-4ff6-b45d-6a3ca73b83c3', '5a2c287d-251b-4305-95aa-e135fea5dcd2', 'Z87.891 (personal history of nicotine dependence) is correct given the physician''s own documentation explicitly frames this as resolved history (''former smoker,'' ''resolved'') rather than an ongoing condition still being managed — Z-code history status is used once a provider documents the condition as no longer present, not merely quiet. F17.210 (nicotine dependence, cigarettes, uncomplicated) would incorrectly code this as a CURRENT active dependence, contradicted by the explicit ''resolved'' documentation. F17.211 (nicotine dependence, in remission) would apply if the physician were still tracking this as an active dependence diagnosis currently in a remission phase — but that''s not what''s documented here; the physician has affirmatively closed the diagnosis out as resolved history, which is precisely what a Z87 personal-history code is for.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3794463a-bd7f-459c-b0f3-228e396b6c39', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 40, 'During an OASIS recertification assessment, the clinician identifies a NEW stage 2 pressure ulcer that developed since the SOC, in a patient whose SOC OASIS had documented zero pressure ulcers. The clinician correctly updates the relevant OASIS wound items. From a PDGM perspective, what is the most direct impact of this new finding?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb340468-7d42-4e52-ba3c-9db08cc8bed0', '3794463a-bd7f-459c-b0f3-228e396b6c39', 0, 'It has no impact on PDGM case-mix since PDGM is determined solely at SOC');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3fdb7f11-e4b3-4ff0-a670-aab7489e128a', '3794463a-bd7f-459c-b0f3-228e396b6c39', 1, 'It may affect the functional impairment level score for the current 30-day period');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6303f6a2-fac2-4e84-ad0c-f568a2b18fb0', '3794463a-bd7f-459c-b0f3-228e396b6c39', 2, 'It automatically triggers a new 60-day episode');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eeadf170-0198-4261-acc4-5ee01a2283a4', '3794463a-bd7f-459c-b0f3-228e396b6c39', 3, 'It requires an immediate ROC (Resumption of Care) OASIS');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3794463a-bd7f-459c-b0f3-228e396b6c39', '3fdb7f11-e4b3-4ff0-a670-aab7489e128a', 'Under PDGM, clinical grouping and comorbidity adjustment are determined at the start of each 30-day period of care (not fixed for the entire 60-day episode as under the older PPS model), so a new pressure ulcer identified and documented at a recertification assessment CAN affect case-mix weighting for the upcoming 30-day payment period, since it may change the functional impairment/clinical severity picture for that period specifically. It does not trigger a new 60-day episode (episodes remain 60 days; PDGM''s 30-day periods are a payment sub-unit within that episode, not a new episode trigger) and does not automatically require a ROC OASIS — ROC is specifically for return from an inpatient stay, not for a new wound found during routine recert.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6b899418-ec27-4b57-ae37-0c3d766e89e2', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 41, 'Per Medicare Conditions of Participation, if a home health agency''s registered nurse determines during a visit that a patient''s condition has changed such that the physician-ordered plan of care needs revision, what is the CoP-compliant first step?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('66edd26f-a618-46fa-9679-a437182eb2b2', '6b899418-ec27-4b57-ae37-0c3d766e89e2', 0, 'The nurse may independently revise the plan of care without physician contact if the change is minor');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('42f76b4f-5c91-419b-b307-a7e2805a6f12', '6b899418-ec27-4b57-ae37-0c3d766e89e2', 1, 'The nurse must contact the physician to obtain revised orders before implementing any change beyond the current plan');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7b462721-595d-4c1c-9f0a-44f0e0588a04', '6b899418-ec27-4b57-ae37-0c3d766e89e2', 2, 'The nurse should wait until the next scheduled recertification to update the plan');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5d9e39ee-debe-4b0f-b09a-808f531517b4', '6b899418-ec27-4b57-ae37-0c3d766e89e2', 3, 'The nurse should discharge the patient and refer to a higher level of care');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6b899418-ec27-4b57-ae37-0c3d766e89e2', '42f76b4f-5c91-419b-b307-a7e2805a6f12', 'Per 42 CFR 484.60(b), the plan of care must be revised as the patient''s condition changes, and any change to the plan of care must be based on physician orders — a nurse identifying a condition change must contact the physician to obtain updated orders before implementing care outside the currently-ordered plan, even for a change that seems clinically minor to the nurse. This is a genuinely strict CoP requirement, distinct from the earlier-tier ''5-day recert window'' rules — it applies to ANY plan-of-care revision, at any point in an episode, not just around recertification timing.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5219e2bc-f887-4698-b203-530268be74b4', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 42, 'A home health agency receives a physician''s verbal order for a medication dose change during a phone call. Per Medicare CoPs, what must happen with this verbal order?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('60342637-c3aa-46ef-86d0-db4352ec7a39', '5219e2bc-f887-4698-b203-530268be74b4', 0, 'It may be implemented immediately and does not require any further documentation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('16d3bc18-55b7-4ff4-9bd5-cefa71010bc1', '5219e2bc-f887-4698-b203-530268be74b4', 1, 'It must be documented and then authenticated (signed) by the ordering physician within the agency''s or state''s required timeframe');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d0431765-56e2-4cb6-999d-27a1120bab82', '5219e2bc-f887-4698-b203-530268be74b4', 2, 'It is not valid unless given in writing at the time of the call');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b39d8727-5198-4039-861d-369613c14fe0', '5219e2bc-f887-4698-b203-530268be74b4', 3, 'It must be countersigned by a second physician before implementation');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5219e2bc-f887-4698-b203-530268be74b4', '16d3bc18-55b7-4ff4-9bd5-cefa71010bc1', 'Verbal orders are permitted under Medicare CoPs but must be properly documented at the time received (including date, time, content, and who received it) and subsequently authenticated with the physician''s signature within the timeframe required by the specific state''s regulations or the agency''s own policy (whichever is more stringent) — this is standard verbal-order practice across CoP-governed settings, not unique to home health, but is specifically tested at this tier because candidates sometimes assume verbal orders are either fully informal (no documentation standard) or entirely invalid without simultaneous written confirmation, both of which are incorrect.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('30fd512d-510f-4ada-8ed6-cd309abe9a6a', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 43, 'A patient''s OASIS assessment at SOC documents M1800 (Grooming) as requiring assistance, but the actual clinical documentation elsewhere in the same visit note describes the patient as fully independent with grooming. Per OASIS accuracy guidance, what should the coder/QA reviewer do?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7f36b914-a1a4-4923-b482-be35aadc926f', '30fd512d-510f-4ada-8ed6-cd309abe9a6a', 0, 'Use the M1800 response as documented on the OASIS, since OASIS items take precedence over narrative notes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cf5a14ed-ef57-4b17-8bce-5045fbe2ac53', '30fd512d-510f-4ada-8ed6-cd309abe9a6a', 1, 'Query the clinician to resolve the discrepancy before finalizing the assessment, since the OASIS response and the clinical narrative conflict');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e81b7ec2-30ea-4591-9f73-f49344899ee8', '30fd512d-510f-4ada-8ed6-cd309abe9a6a', 2, 'Automatically change the OASIS response to match the narrative note without clinician involvement');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('df73ee1f-38cc-4b88-a38d-b03702812a64', '30fd512d-510f-4ada-8ed6-cd309abe9a6a', 3, 'Ignore the discrepancy since minor items like grooming rarely affect case-mix significantly');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('30fd512d-510f-4ada-8ed6-cd309abe9a6a', 'cf5a14ed-ef57-4b17-8bce-5045fbe2ac53', 'When an OASIS item response directly conflicts with the same assessment''s own narrative documentation, this is a genuine, identifiable inconsistency requiring clinician query to resolve BEFORE the assessment is finalized — neither the OASIS response nor the narrative should be assumed automatically correct over the other, and a coder/QA reviewer changing either without going back to the clinician who actually performed the assessment risks introducing an error based on a guess rather than the clinician''s actual, intended observation. This tests the accuracy-verification principle distinct from the earlier-tier technical-vs-clinical correction distinction — this is neither purely technical (a sequencing fix) nor a simple omission; it''s a genuine, substantive discrepancy needing clinician clarification.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e89e9a86-1ac7-4757-8f21-7ea7f13f3c20', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 44, 'A patient with systemic lupus erythematosus develops lupus nephritis confirmed by renal biopsy, now with CKD stage 3a as a documented consequence. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dfc5ec25-3d12-47d9-a905-d0193b9bffa0', 'e89e9a86-1ac7-4757-8f21-7ea7f13f3c20', 0, 'M32.14, N18.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c328f2e2-6054-4daf-b397-ed4e6df3e23f', 'e89e9a86-1ac7-4757-8f21-7ea7f13f3c20', 1, 'M32.9, N18.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a70486a2-540f-46a6-bbfc-6df17adeadea', 'e89e9a86-1ac7-4757-8f21-7ea7f13f3c20', 2, 'M32.14, N05.9, N18.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8386bb48-9787-4fca-967a-9f9161c152d5', 'e89e9a86-1ac7-4757-8f21-7ea7f13f3c20', 3, 'N18.31, M32.14');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e89e9a86-1ac7-4757-8f21-7ea7f13f3c20', 'dfc5ec25-3d12-47d9-a905-d0193b9bffa0', 'M32.14 (glomerular disease in systemic lupus erythematosus — the lupus-nephritis combination code) is sequenced first as the underlying autoimmune disease causing the renal involvement, per the ''code first'' logic used consistently for autoimmune/systemic-disease-driven organ complications elsewhere in this paper. N18.31 (CKD stage 3a) is added to specify the resulting kidney disease stage. N05.9 (unspecified nephritic syndrome) is not separately added since M32.14 already captures the lupus-glomerular relationship as a combination code — adding a generic nephritis code on top would be redundant of what M32.14 already conveys.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f895da22-85e8-4804-81bb-1619a4b3a760', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 45, 'A patient with a long history of Crohn''s disease develops a new enterocutaneous fistula, confirmed by CT and documented by the physician as a complication of the Crohn''s disease, requiring wound care and ostomy-adjacent skin management at home. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a4c56d16-9ce9-4bbf-a3cc-cfaec0f12faf', 'f895da22-85e8-4804-81bb-1619a4b3a760', 0, 'K63.2, K50.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('40793a0d-26d4-4643-a4ec-bd5183f1eead', 'f895da22-85e8-4804-81bb-1619a4b3a760', 1, 'K50.90, K63.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('42c9f8a2-2e3f-4dbd-8e30-9be69fb454a1', 'f895da22-85e8-4804-81bb-1619a4b3a760', 2, 'K50.014, K63.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('566f98d5-54b3-44d0-981c-5da398e7c8a9', 'f895da22-85e8-4804-81bb-1619a4b3a760', 3, 'K50.014');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f895da22-85e8-4804-81bb-1619a4b3a760', '566f98d5-54b3-44d0-981c-5da398e7c8a9', 'K50.014 (Crohn''s disease of small intestine with fistula) is a single combination code that already captures both the Crohn''s disease AND the fistula complication together — adding K63.2 (fistula of intestine, unspecified cause) separately would be redundant, since the more specific Crohn''s-fistula combination code already fully conveys that information. This distinction — a combination code fully absorbing what would otherwise require two separate codes — is a recurring high-yield testing pattern at this tier, since candidates who don''t know the specific combination code exists tend to default to coding the two conditions separately.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('43420ce9-a86c-4fe8-a283-0b7aeef873c5', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 46, 'A patient with chronic systolic heart failure has an implantable cardioverter-defibrillator (ICD) and is now being followed by home health after the device delivered an appropriate shock for documented ventricular tachycardia 3 days ago. The VT resolved with the shock and has not recurred. Select the correct principal diagnosis for this home health episode.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('df261d6e-ee88-4e31-bd3a-7b01ba04e3a1', '43420ce9-a86c-4fe8-a283-0b7aeef873c5', 0, 'I47.20, Z95.810');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('481c30e7-c245-4e94-a4f9-61045ba2755f', '43420ce9-a86c-4fe8-a283-0b7aeef873c5', 1, 'T82.199A, I47.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5c6b96e0-1447-40a3-b7f5-6b78a04cb2d9', '43420ce9-a86c-4fe8-a283-0b7aeef873c5', 2, 'I47.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3318a27c-da39-4e7e-ba67-9fa7fa9db248', '43420ce9-a86c-4fe8-a283-0b7aeef873c5', 3, 'Z95.810, I50.22');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('43420ce9-a86c-4fe8-a283-0b7aeef873c5', 'df261d6e-ee88-4e31-bd3a-7b01ba04e3a1', 'I47.20 (ventricular tachycardia, unspecified) is coded as the active, currently-relevant condition being monitored, even though the acute episode itself resolved, since ongoing home health surveillance is specifically directed at recurrence risk following this recent VT event — I47.2 by itself is a 3-character category header, not a billable code, and requires the additional digit (I47.20 unspecified, I47.21 torsades de pointes, or I47.29 other) to be complete. Z95.810 (presence of automatic cardiac defibrillator) is added as the relevant device-status code. T82.199A (other mechanical complication of unspecified cardiac device, initial encounter) is NOT used here since the ICD functioned appropriately and delivered a correct, successful shock — there is no device malfunction or complication to code; an appropriately-functioning device response to a real arrhythmia is not a device complication.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2f5cf0c1-34bf-4f61-83cc-62839db240b4', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 47, 'A patient with chronic venous insufficiency has a venous stasis ulcer of the left lower leg, and the physician also documents chronic lymphedema of the same leg as a contributing factor to poor healing. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('40c8110f-8b4f-491b-8ff5-59b4692aa54f', '2f5cf0c1-34bf-4f61-83cc-62839db240b4', 0, 'I87.2, I83.012, I89.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('59aeca12-da97-4e9f-9590-5d3fe17ee9f2', '2f5cf0c1-34bf-4f61-83cc-62839db240b4', 1, 'I83.012, I87.2, I89.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7ca43014-f40d-44ca-a30f-b055f9a543f8', '2f5cf0c1-34bf-4f61-83cc-62839db240b4', 2, 'I83.012, I89.0, I87.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5ecbabba-57d8-4ce5-ba97-b027f6502fb2', '2f5cf0c1-34bf-4f61-83cc-62839db240b4', 3, 'I89.0, I83.012, I87.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2f5cf0c1-34bf-4f61-83cc-62839db240b4', '59aeca12-da97-4e9f-9590-5d3fe17ee9f2', 'I83.012 (varicose veins of left lower extremity with ulcer of calf, chronic venous hypertension pattern) is sequenced first as the primary vascular pathology driving the ulcer itself. I87.2 (venous insufficiency, chronic peripheral) is added since venous insufficiency is the broader documented vascular condition. I89.0 (lymphedema, not elsewhere classified) is added last as the documented contributing factor to delayed healing — sequenced after the primary ulcer-causing pathology since it''s a contributing complication, not the primary driver of the wound itself.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ccdbde30-14ee-4c21-9cb0-5ce71d775bea', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 48, 'A patient with type 2 diabetes has diabetic gastroparesis, confirmed by gastric emptying study, causing significant nausea and poor oral intake requiring nutritional support planning by home health. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0d266d5a-9e70-466d-9a22-86631a3aa5f1', 'ccdbde30-14ee-4c21-9cb0-5ce71d775bea', 0, 'E11.43, K31.84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('405dbd01-8c15-4dd3-8d53-808706cbf5a8', 'ccdbde30-14ee-4c21-9cb0-5ce71d775bea', 1, 'K31.84, E11.43');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a9cebe33-f39f-44e4-adb8-8f9f87aeff42', 'ccdbde30-14ee-4c21-9cb0-5ce71d775bea', 2, 'E11.43');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('05771221-c88d-49fa-8121-4fa35c2fd8de', 'ccdbde30-14ee-4c21-9cb0-5ce71d775bea', 3, 'E11.9, K31.84');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ccdbde30-14ee-4c21-9cb0-5ce71d775bea', 'a9cebe33-f39f-44e4-adb8-8f9f87aeff42', 'E11.43 (type 2 diabetes with diabetic autonomic (poly)neuropathy — the code used for diabetic gastroparesis, since gastroparesis is a form of diabetic autonomic neuropathy affecting GI motility) is a single combination code already capturing this specific complication — K31.84 (gastroparesis, unspecified cause) is NOT separately added, since doing so would be redundant when the diabetes-specific combination code already conveys the same clinical fact with its specific etiology. This mirrors the Crohn''s/fistula combination-code pattern tested earlier in this paper: when a single combination code fully captures both the underlying disease and its complication, a second, less-specific code for the same complication is not separately added.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9125b160-a78d-49cb-87a6-1f5dfb027ac8', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 49, 'A patient with atrial fibrillation on apixaban develops a large hematoma at a recent venipuncture site, confirmed by the physician as related to the anticoagulant''s expected effect, with the apixaban taken exactly as prescribed and no dosing error. Select the correct coding for this finding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('017a7300-758c-4fb0-a537-33d17b2c54ea', '9125b160-a78d-49cb-87a6-1f5dfb027ac8', 0, 'T45.525A, D68.32');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('efd4fe0e-d69f-4cfb-9aae-af53a939aefb', '9125b160-a78d-49cb-87a6-1f5dfb027ac8', 1, 'T45.525A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1125cb66-2a33-4f2c-9d80-a2e6fc1362ce', '9125b160-a78d-49cb-87a6-1f5dfb027ac8', 2, 'D68.32, T45.525A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fcb21a20-b67e-4c45-9d32-bd6dc0f2aeaf', '9125b160-a78d-49cb-87a6-1f5dfb027ac8', 3, 'T45.521A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9125b160-a78d-49cb-87a6-1f5dfb027ac8', 'efd4fe0e-d69f-4cfb-9aae-af53a939aefb', 'T45.525A (adverse effect of anticoagulants, initial encounter) is used alone here — D68.32 (hemorrhagic disorder due to extrinsic circulating anticoagulants) is NOT separately added, since it describes the same underlying phenomenon (bleeding tendency due to anticoagulant effect) that the adverse-effect code and the site-specific hematoma documentation already jointly capture without needing a third, overlapping code; adding D68.32 on top of T45.525A when there''s no additional distinct diagnosis being conveyed would be redundant. T45.521A is a distractor referencing a different specific anticoagulant subclass code that isn''t the correct fifth-character match for apixaban''s actual T45.52- family placement in this scenario.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ad9fbc0b-f9e2-4a0a-aee8-fbc9e281d9cb', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 50, 'A patient with a recent stroke has residual expressive aphasia and right-sided hemiparesis, both documented by the physician as late effects of the cerebrovascular accident that occurred 4 months ago (acute phase fully resolved). Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d3295227-6ac0-44a2-a9a2-d823eb0cd4f6', 'ad9fbc0b-f9e2-4a0a-aee8-fbc9e281d9cb', 0, 'I63.9, R47.01, G81.91');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4488f2b7-4bb0-4c41-8a4d-4c1622d0f6b8', 'ad9fbc0b-f9e2-4a0a-aee8-fbc9e281d9cb', 1, 'I69.320, I69.351');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bcb925e3-10b7-48cf-9991-d20845bb2e8a', 'ad9fbc0b-f9e2-4a0a-aee8-fbc9e281d9cb', 2, 'I69.398, G81.91, R47.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9fe2a430-dd24-4b97-beb2-2e2d8e04e141', 'ad9fbc0b-f9e2-4a0a-aee8-fbc9e281d9cb', 3, 'I63.9, I69.320');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ad9fbc0b-f9e2-4a0a-aee8-fbc9e281d9cb', '4488f2b7-4bb0-4c41-8a4d-4c1622d0f6b8', 'Since the acute stroke phase has fully resolved and the patient now has only the residual deficits, I69-family codes (sequelae of cerebrovascular disease) are used rather than I63.9 (acute cerebral infarction), which would incorrectly code this as if the acute event were still active. I69.320 (aphasia following cerebral infarction) and I69.351 (hemiplegia and hemiparesis following cerebral infarction affecting right dominant side) are the correct specific sequela codes — each residual deficit gets its own I69.3xx code rather than combining them into a generic code, since ICD-10-CM structures late-effect stroke codes by specific deficit type.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fef60a7d-54b3-4b4e-9972-8f02538deef4', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 51, 'A patient with chronic pancreatitis due to long-term alcohol use, currently in remission from alcohol use, develops pancreatic exocrine insufficiency requiring pancreatic enzyme replacement therapy managed by home health. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2421f026-5470-4379-8d30-7e3381a2ed12', 'fef60a7d-54b3-4b4e-9972-8f02538deef4', 0, 'K86.0, K86.81, F10.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2e3fede8-9ecf-4a6e-8f78-a9b79a7c73d5', 'fef60a7d-54b3-4b4e-9972-8f02538deef4', 1, 'K86.81, F10.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a69eba05-0985-4fe0-b8ee-17161da2087c', 'fef60a7d-54b3-4b4e-9972-8f02538deef4', 2, 'K86.1, K86.81, F10.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4898d4d2-78f9-43f8-a4ca-6f8dc3fdb70f', 'fef60a7d-54b3-4b4e-9972-8f02538deef4', 3, 'K86.0, K90.3, F10.21');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fef60a7d-54b3-4b4e-9972-8f02538deef4', '2421f026-5470-4379-8d30-7e3381a2ed12', 'K86.0 (alcohol-induced chronic pancreatitis) is the specific etiology-matched code — ICD-10-CM has a dedicated code for chronic pancreatitis specifically when alcohol-induced, distinct from K86.1 (other chronic pancreatitis, used when the cause is idiopathic or a different non-alcohol etiology). This is a genuinely easy-to-miss distinction, since candidates who don''t know K86.0 covers the CHRONIC alcohol-induced form (not just acute) default to the more generic K86.1. K86.81 (exocrine pancreatic insufficiency) is added for the enzyme-replacement-requiring complication — K90.3 (pancreatic steatorrhea) is a distractor referring to a related but distinct malabsorption presentation, not the general exocrine insufficiency diagnosis stated here. F10.21 (alcohol dependence, in remission) captures the causative substance use history, using the same dependence-in-remission code family established earlier in this paper (Q14).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ded9a83f-7f5e-4387-ac35-18e53382bad8', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 52, 'A patient with hypothyroidism due to prior total thyroidectomy for thyroid cancer (cancer treated and resolved, no current malignancy) is on lifelong levothyroxine, stable, admitted to home health for an unrelated orthopedic issue. Select the correct coding for the thyroid history.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('097afe0c-479c-4c30-85ba-c0e9a406db28', 'ded9a83f-7f5e-4387-ac35-18e53382bad8', 0, 'E03.9, Z85.850');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4392a93a-a28a-470d-929c-ce5b757349e6', 'ded9a83f-7f5e-4387-ac35-18e53382bad8', 1, 'C73, E89.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e423af03-7e33-4070-a455-14d4b128ae37', 'ded9a83f-7f5e-4387-ac35-18e53382bad8', 2, 'E89.0, Z85.850');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b78adf15-e1ef-4de2-bba9-92aa5380e33a', 'ded9a83f-7f5e-4387-ac35-18e53382bad8', 3, 'E03.2, Z85.850');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ded9a83f-7f5e-4387-ac35-18e53382bad8', 'e423af03-7e33-4070-a455-14d4b128ae37', 'E89.0 (postprocedural hypothyroidism) is the specific combination code for hypothyroidism resulting from a prior thyroidectomy — more precise than E03.9 (unspecified hypothyroidism, which doesn''t capture the surgical etiology). Z85.850 (personal history of malignant neoplasm of thyroid) is added since the cancer itself is resolved and no longer active — C73 (malignant neoplasm of thyroid, current/active) would incorrectly code the cancer as still active when it''s explicitly resolved, following the same history-vs-active-disease distinction tested earlier in this paper with the breast cancer metastasis question.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('10a478f3-488e-4b0c-ad1c-12691b566ad7', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 53, 'A patient with heart failure is on furosemide and develops hypokalemia, documented by the physician as a known, expected side effect of correctly-dosed diuretic therapy, requiring potassium supplementation monitored by home health. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('474444e3-bea3-425f-8538-d0f3094a9683', '10a478f3-488e-4b0c-ad1c-12691b566ad7', 0, 'E87.6, T50.2X5A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1cfbfdf0-d6f1-4c92-8fd4-67737ea8ec35', '10a478f3-488e-4b0c-ad1c-12691b566ad7', 1, 'T50.2X5A, E87.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('11a7b680-d965-4741-b801-d3c24ebc0a17', '10a478f3-488e-4b0c-ad1c-12691b566ad7', 2, 'T50.2X1A, E87.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bf416b48-eaa0-4cb6-ad76-da6ad5bb2242', '10a478f3-488e-4b0c-ad1c-12691b566ad7', 3, 'E87.6');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('10a478f3-488e-4b0c-ad1c-12691b566ad7', '1cfbfdf0-d6f1-4c92-8fd4-67737ea8ec35', 'T50.2X5A (adverse effect of carbonic anhydrase inhibitors, benzothiadiazides, and other diuretics, initial encounter) is sequenced first per the adverse-effect sequencing rule used consistently throughout this paper — the drug-effect code leads, the resulting condition follows. E87.6 (hypokalemia) is the manifestation code that follows. T50.2X1A (poisoning code) is incorrect since the diuretic was correctly dosed and taken as prescribed — this is unambiguously an adverse effect, not poisoning, matching the same correctly-prescribed-medication pattern established in the ACE-inhibitor-cough question earlier in this paper.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c753d2ee-4e0f-48ee-9580-45a9946ee022', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 54, 'A patient with severe rheumatoid arthritis is on a biologic (adalimumab) and develops a new opportunistic pulmonary infection, confirmed as related to the immunosuppressive effect of the biologic, correctly dosed and administered as prescribed. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a9342811-a03c-4b27-a51d-bc9e3ddb5a8c', 'c753d2ee-4e0f-48ee-9580-45a9946ee022', 0, 'J18.9, T45.1X5A, M06.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5c1379c7-6d0e-4881-a9a9-929863ddab69', 'c753d2ee-4e0f-48ee-9580-45a9946ee022', 1, 'M06.9, T45.1X5A, J18.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1fc5fb3f-5185-40fa-896e-1f5a43454355', 'c753d2ee-4e0f-48ee-9580-45a9946ee022', 2, 'M06.9, J18.9, T45.1X5A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fc72da0c-873b-421a-a9a8-ed6778cf2296', 'c753d2ee-4e0f-48ee-9580-45a9946ee022', 3, 'T45.1X5A, M06.9, J18.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c753d2ee-4e0f-48ee-9580-45a9946ee022', '5c1379c7-6d0e-4881-a9a9-929863ddab69', 'M06.9 (rheumatoid arthritis, unspecified) is sequenced first as the underlying condition necessitating the immunosuppressive therapy — this mirrors the earlier methotrexate/pancytopenia question in this same paper (same underlying disease, same sequencing logic: chronic disease first, then the adverse-effect code, then the resulting manifestation). T45.1X5A (adverse effect of immunosuppressive drugs) follows as the medication-effect code. J18.9 (pneumonia, unspecified organism) is the resulting manifestation, sequenced last.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('323de8fa-641c-4cf4-b554-12890d231b5c', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 55, 'A patient is status post below-knee amputation for peripheral arterial disease with critical limb ischemia (left leg), now with a well-healing surgical stump but new cellulitis of the residual limb, confirmed by the physician as a fresh infection distinct from the healing surgical site itself. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4f25ebbd-14a4-4ed1-ba5b-0976c0105b6c', '323de8fa-641c-4cf4-b554-12890d231b5c', 0, 'L03.116, Z89.512, I70.262');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('668db63e-9dca-4dc4-920c-e17b9431fa54', '323de8fa-641c-4cf4-b554-12890d231b5c', 1, 'T87.44, Z89.512');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e96e2226-d1b6-471f-9455-2bd04bce337a', '323de8fa-641c-4cf4-b554-12890d231b5c', 2, 'L03.116, Z89.512');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('576a8404-a5ba-4d82-b416-868626310a61', '323de8fa-641c-4cf4-b554-12890d231b5c', 3, 'I70.262, L03.116, Z89.512');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('323de8fa-641c-4cf4-b554-12890d231b5c', 'e96e2226-d1b6-471f-9455-2bd04bce337a', 'L03.116 (cellulitis of left lower limb) is sequenced first as the new, active, currently-treated condition. Z89.512 (acquired absence of left leg below knee) is added as the amputation status code. T87.44 (infection of amputation stump, left lower extremity) is NOT used here because the physician specifically documents this as cellulitis distinct from the surgical stump site itself — T87.44 would be the correct choice only if the infection were specifically at/of the stump site itself, not a separate cellulitis elsewhere on the residual limb. I70.262 (the original PAD with critical limb ischemia) is not re-added here since it''s resolved by the amputation and isn''t the current active condition being treated at this specific encounter.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('05812b04-5052-48c7-aa60-263ebbe0e32f', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 56, 'A patient with chronic kidney disease stage 5 on hemodialysis 3x/week develops fluid overload with pulmonary edema between dialysis sessions, requiring urgent home health assessment and physician notification for possible early dialysis. Select the correct principal diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6891c2b0-1f61-41b7-9075-b9036aff8e42', '05812b04-5052-48c7-aa60-263ebbe0e32f', 0, 'N18.6, Z99.2, J81.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ddef1f4d-b44a-44b2-b143-76162a2c7197', '05812b04-5052-48c7-aa60-263ebbe0e32f', 1, 'J81.1, N18.6, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ec6c8282-d1f4-4644-abe1-9dfd9f314f35', '05812b04-5052-48c7-aa60-263ebbe0e32f', 2, 'E87.70, N18.6, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('84968bfe-983d-4400-ac99-6b5d765d2e1b', '05812b04-5052-48c7-aa60-263ebbe0e32f', 3, 'J81.1, E87.70, N18.6, Z99.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('05812b04-5052-48c7-aa60-263ebbe0e32f', 'ddef1f4d-b44a-44b2-b143-76162a2c7197', 'J81.1 (chronic pulmonary edema — used here since this is a recurring pattern in a dialysis patient rather than a single acute cardiac event; if this were specifically an acute, first-time pulmonary edema episode, J81.0 would apply instead, but the interdialytic fluid-overload pattern described is the chronic/recurring type) is sequenced first as the acute, currently-treated finding prompting this urgent assessment. N18.6 (ESRD) and Z99.2 (dialysis status) are added as the underlying/status codes. E87.70 (fluid overload, unspecified) is not separately added since the pulmonary edema code already conveys the clinically relevant fluid-status finding being acted upon — adding a second, more generic fluid-overload code would be redundant given the more specific pulmonary edema code already selected.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fa94a248-5523-473d-90cc-fe50882fd76a', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 57, 'A patient with a history of bariatric (gastric bypass) surgery 4 years ago, now with iron deficiency anemia confirmed by the physician as a known nutritional consequence of the malabsorptive surgery, requiring IV iron infusions at home. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b6f9ff5c-d233-45fd-a6f7-c113705c24e6', 'fa94a248-5523-473d-90cc-fe50882fd76a', 0, 'D50.9, K91.2, Z98.84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9855679c-88e3-45d0-9d39-9f347525955d', 'fa94a248-5523-473d-90cc-fe50882fd76a', 1, 'D50.9, K95.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('34f0e2dd-41be-469f-8ec4-619ab88050d9', 'fa94a248-5523-473d-90cc-fe50882fd76a', 2, 'K95.89, D50.9, Z98.84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4fb09d8d-3cbe-4382-8b1c-0d1d6f1b4d4f', 'fa94a248-5523-473d-90cc-fe50882fd76a', 3, 'D50.9, Z98.84');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fa94a248-5523-473d-90cc-fe50882fd76a', '34f0e2dd-41be-469f-8ec4-619ab88050d9', 'K95.89 (other complications of other bariatric procedure) — not K91.2 — is sequenced first per the guideline convention of coding the causal postsurgical complication before its resulting manifestation. K91.2 (postsurgical malabsorption, not elsewhere classified) has a Type 2 Excludes note specifically excluding complications of bariatric procedures, which are instead coded to the dedicated K95 chapter — this is a genuinely easy mistake, since K91.2''s own description (''postsurgical malabsorption'') sounds like it should apply to gastric bypass, but the exclusion note specifically routes bariatric-procedure complications to K95 instead. D50.9 (iron deficiency anemia, unspecified) follows as the nutritional consequence. Z98.84 (bariatric surgery status) is added as the relevant procedure-history status code — all three are needed together: the causal malabsorption complication, the resulting anemia, and the procedure-history status, since omitting any one loses either the causal chain or the relevant surgical history context.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2b4dfe2a-4bae-4e26-a5cb-cfae051a93c1', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 58, 'A patient with congestive heart failure and atrial fibrillation is on both a diuretic and warfarin. The home health nurse identifies the patient''s INR is critically elevated at 6.8 (therapeutic range 2-3) due to a recent antibiotic course interacting with the warfarin, with warfarin itself taken exactly as prescribed throughout. No active bleeding is present. Select the correct coding for this finding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('af500483-b8ea-4915-b84e-97083f0d4f42', '2b4dfe2a-4bae-4e26-a5cb-cfae051a93c1', 0, 'T45.515A, D68.32');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9163c993-2844-40e1-aa09-e0602b6b217e', '2b4dfe2a-4bae-4e26-a5cb-cfae051a93c1', 1, 'T45.515A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2a3aaccc-5164-4647-be7e-19856c5e921e', '2b4dfe2a-4bae-4e26-a5cb-cfae051a93c1', 2, 'R79.1, T45.515A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b477a707-da9c-4b45-b646-1153ba6d246b', '2b4dfe2a-4bae-4e26-a5cb-cfae051a93c1', 3, 'D68.32');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2b4dfe2a-4bae-4e26-a5cb-cfae051a93c1', '9163c993-2844-40e1-aa09-e0602b6b217e', 'T45.515A (adverse effect of anticoagulants, initial encounter) alone captures this finding — the drug-drug interaction (antibiotic potentiating warfarin) still constitutes an adverse effect since the warfarin itself was taken correctly as prescribed; the interacting antibiotic doesn''t change this classification into poisoning. Neither D68.32 (a bleeding-tendency diagnosis code, not appropriate since no active bleeding is documented — only an elevated INR, which is a lab finding, not itself a coded bleeding disorder) nor R79.1 (abnormal coagulation profile — a nonspecific finding code) is needed on top of the adverse-effect code alone, since T45.515A already appropriately conveys the clinically significant issue (an adverse anticoagulant effect) without requiring an additional lab-abnormality code for a value that is itself just the direct evidence of that adverse effect, not a separate diagnosis.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('12dcad90-3191-4f19-9a35-19fe49333f0c', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 59, 'A patient recovering from a hip fracture surgical repair has orders for home PT specifically targeting gait training and fall-risk reduction. The physician''s documentation identifies the patient''s fall risk as substantially elevated due to a combination of the recent fracture, chronic peripheral neuropathy from diabetes, and orthostatic hypotension from antihypertensive medication. Select the correct additional code, beyond the fracture aftercare code, that most directly captures this elevated fall risk for care-planning purposes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c11c8edb-4de6-4c7c-988b-eacd145fab64', '12dcad90-3191-4f19-9a35-19fe49333f0c', 0, 'Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('900c1958-d7df-427a-a014-5308031c8b90', '12dcad90-3191-4f19-9a35-19fe49333f0c', 1, 'R29.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('94b812e4-05f0-4dfc-8b32-475224e416bc', '12dcad90-3191-4f19-9a35-19fe49333f0c', 2, 'No additional code is needed — fall risk is a care-planning concept, not a diagnosis');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6305ca19-6ee1-4455-9760-c90d6b6b11ef', '12dcad90-3191-4f19-9a35-19fe49333f0c', 3, 'W19.XXXD');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('12dcad90-3191-4f19-9a35-19fe49333f0c', 'c11c8edb-4de6-4c7c-988b-eacd145fab64', 'Z91.81 (history of falling) is the correct code to flag fall-risk status for care planning when a documented history or elevated risk of falling is clinically noted — R29.6 (repeated falls) is a different, more specific code reserved for patients with documented recurrent actual fall EVENTS, not simply elevated risk factors without confirmed prior falls being described in this stem. This tests a genuinely useful distinction: risk-factor documentation (Z91.81) versus an actual pattern of repeated fall events (R29.6) — the stem describes risk factors and elevated risk, not confirmed recurrent fall events, making Z91.81 the more precise match.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('34a2f17b-0b5f-40ec-b3e6-946671f66ca4', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 60, 'A patient with COPD on home oxygen has an order to increase oxygen flow rate from 2L to 3L nasal cannula based on a recent decline in oxygen saturation, documented and ordered by the physician following a telehealth visit. What OASIS/documentation principle applies to this order?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('256f4153-6682-40ad-b6d5-d40f96cfe8b8', '34a2f17b-0b5f-40ec-b3e6-946671f66ca4', 0, 'Telehealth-based orders are not valid under Medicare CoPs and must be re-confirmed in person');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('99200a6e-91fe-424f-abee-a847fb978876', '34a2f17b-0b5f-40ec-b3e6-946671f66ca4', 1, 'A physician''s order is valid regardless of visit modality (telehealth or in-person), provided it is properly documented and authenticated per CoP requirements');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a06ed56a-4beb-44f7-93b0-f49a4d7516fb', '34a2f17b-0b5f-40ec-b3e6-946671f66ca4', 2, 'Oxygen flow rate changes may only be ordered by a pulmonologist, not a primary care physician');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9e3121ae-30fc-4041-9fa3-fe6988323fb8', '34a2f17b-0b5f-40ec-b3e6-946671f66ca4', 3, 'The order requires co-signature by the home health agency''s medical director');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('34a2f17b-0b5f-40ec-b3e6-946671f66ca4', '99200a6e-91fe-424f-abee-a847fb978876', 'A physician''s order is valid based on proper documentation and authentication requirements under the Medicare CoPs, regardless of whether the visit generating that order was in-person or telehealth — telehealth-originated orders are not categorically invalid, and Medicare has increasingly recognized telehealth encounters as a legitimate basis for ordering home health services and modifying plans of care, provided standard order documentation/authentication rules are still met. Neither a pulmonologist-only restriction nor a medical-director co-signature requirement exists as a general CoP rule for routine oxygen titration orders from the treating physician.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('faf1c2a7-b25b-409b-af0e-021182f453e6', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 61, 'A home health patient''s physician orders a specific frequency and duration of skilled nursing visits at SOC: ''2x/week x 4 weeks, then reassess.'' At week 3, the nurse determines the patient''s wound has healed faster than expected and skilled nursing is no longer needed weekly, but the patient still has one more scheduled visit in the current order. What is the CoP-compliant action?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a374ab2f-a1bd-4f44-a348-c0a87b538bfa', 'faf1c2a7-b25b-409b-af0e-021182f453e6', 0, 'The nurse should simply stop visiting without further action since the wound is healed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('15f7d006-d822-4a04-975b-2c52e4aac778', 'faf1c2a7-b25b-409b-af0e-021182f453e6', 1, 'The nurse must contact the physician to obtain a revised order reflecting the change in frequency/discharge timing before altering the ordered visit schedule');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0e69d91d-eefb-4a54-8279-89a1f8d86cfd', 'faf1c2a7-b25b-409b-af0e-021182f453e6', 2, 'The nurse should continue visiting at the originally ordered frequency regardless of clinical status, since only the physician''s exact schedule may ever be followed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7e6ffc22-3991-4afb-a6bb-4c8e2d72713e', 'faf1c2a7-b25b-409b-af0e-021182f453e6', 3, 'The agency''s utilization review committee, not the physician, must approve any frequency change');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('faf1c2a7-b25b-409b-af0e-021182f453e6', '15f7d006-d822-4a04-975b-2c52e4aac778', 'This is the same core CoP principle tested earlier in this paper (Q41''s plan-of-care revision question) applied to a discharge-timing scenario: any deviation from the physician-ordered plan of care — including reducing or ending visits earlier than ordered due to a clinical status change — requires physician contact and a revised order before implementation, not a unilateral nursing decision to stop care, and not blind continuation of a now-clinically-unnecessary schedule either. The correct action threads between those two extremes: get the physician''s updated order reflecting the actual clinical status.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b72e2a44-abc9-4984-9de5-43aedb7fac45', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 62, 'A patient''s SOC OASIS documents M1860 (Ambulation/Locomotion) using a two-wheeled walker with supervision. At a follow-up visit 3 weeks later (not a scheduled OASIS timepoint), the clinician''s visit note describes the patient now ambulating independently without any device. Should the clinician update the OASIS M1860 response at this follow-up visit?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1f1d2894-db16-4388-b925-70898f11c56d', 'b72e2a44-abc9-4984-9de5-43aedb7fac45', 0, 'Yes, OASIS items should be updated at every single visit to reflect the most current status');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2eb8efde-58dc-4263-96aa-9992a96bec94', 'b72e2a44-abc9-4984-9de5-43aedb7fac45', 1, 'No, OASIS items are only formally scored/reported at defined OASIS collection timepoints (SOC, ROC, recert, transfer, discharge) — the improvement should be documented in the visit note, and will be reflected at the next required OASIS timepoint');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f8bc40cc-a8a3-4f8e-b744-8b382099d962', 'b72e2a44-abc9-4984-9de5-43aedb7fac45', 2, 'The clinician should retroactively change the SOC OASIS to reflect current status');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ac4358c9-6b0a-4a08-bde3-809e546adb4f', 'b72e2a44-abc9-4984-9de5-43aedb7fac45', 3, 'OASIS scoring is irrelevant to visit note documentation and the two should never be cross-referenced');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b72e2a44-abc9-4984-9de5-43aedb7fac45', '2eb8efde-58dc-4263-96aa-9992a96bec94', 'OASIS data items are collected and formally reported only at specific defined comprehensive assessment timepoints (Start of Care, Resumption of Care, Recertification, Other Follow-up/transfer in some cases, and Discharge) — not at every routine visit. A genuine clinical improvement noted at a non-OASIS visit is documented in that visit''s clinical note as narrative progress, and will be captured in the OASIS item set at the next actual OASIS-collection timepoint, not retroactively altered on a prior, already-submitted assessment. This distinguishes routine visit documentation (ongoing, every visit) from OASIS data collection (specific defined timepoints only) — a foundational distinction this advanced tier assumes as background knowledge while testing its practical application.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bbe83def-1544-474e-938e-21e871d6d8b7', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 63, 'A patient with type 2 diabetes and a diabetic foot ulcer of the left foot develops acute osteomyelitis of the underlying left metatarsal bone, confirmed by MRI and bone culture growing MRSA. Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6d53a92e-5eab-4f82-8045-00af521bae6b', 'bbe83def-1544-474e-938e-21e871d6d8b7', 0, 'E11.621, L97.514, M86.172, B95.62');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d1d68165-a8ad-4f24-bbca-3c504ab76d10', 'bbe83def-1544-474e-938e-21e871d6d8b7', 1, 'E11.621, L97.512, M86.672, B95.62');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ad822d37-3dba-4bd1-960e-ad075e9e6ff0', 'bbe83def-1544-474e-938e-21e871d6d8b7', 2, 'E11.621, M86.172, L97.514, B95.62');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5ab2c962-c3a6-451a-b781-64160ff5f0c9', 'bbe83def-1544-474e-938e-21e871d6d8b7', 3, 'M86.172, E11.621, L97.514, B95.62');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('bbe83def-1544-474e-938e-21e871d6d8b7', '6d53a92e-5eab-4f82-8045-00af521bae6b', 'E11.621 (type 2 diabetes with foot ulcer) leads per the standard diabetic-ulcer sequencing pattern established earlier in this paper. L97.514 (non-pressure chronic ulcer of left foot WITH bone involvement, without evidence of necrosis) — not L97.512 (muscle involvement only) — is required once osteomyelitis of the underlying bone is confirmed, since the ulcer''s depth code must reflect the deepest structure actually involved; stopping at the muscle-involvement 6th character would under-code the confirmed bone involvement. M86.172 (other acute osteomyelitis, left ankle and foot) matches both the documented ACUTE osteomyelitis (the M86.1x family, not the M86.6x chronic-osteomyelitis family) and the correct left-side laterality matching the ulcer site. B95.62 (MRSA as causative organism) is added given the confirmed culture result.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c83e5da9-159e-4903-9405-66356495c53f', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 64, 'A patient with severe COPD and cor pulmonale is admitted to home health with new lower extremity edema, physician-documented as due to the right heart failure component of the cor pulmonale (not a separate, unrelated venous or renal cause). Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e29026b1-4b3c-4012-ad87-ffe498e7e04c', 'c83e5da9-159e-4903-9405-66356495c53f', 0, 'I27.81, R60.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('507f69d1-5e38-4cac-9238-468ebe517039', 'c83e5da9-159e-4903-9405-66356495c53f', 1, 'I27.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb45ee2d-38bc-4e06-934a-46c33c057dd8', 'c83e5da9-159e-4903-9405-66356495c53f', 2, 'I27.9, R60.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('003e74ab-e543-4ed6-b10f-b5f029d0b63f', 'c83e5da9-159e-4903-9405-66356495c53f', 3, 'I50.810, I27.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c83e5da9-159e-4903-9405-66356495c53f', '507f69d1-5e38-4cac-9238-468ebe517039', 'I27.81 (cor pulmonale, chronic) alone is sufficient here — R60.0 (localized edema) is NOT separately added, since the physician explicitly attributes the edema directly and solely to the cor pulmonale''s right-heart-failure physiology, meaning the edema is an inherent clinical manifestation of the already-coded condition rather than a distinct, separately codable finding requiring its own code — this mirrors the acute-pulmonary-edema-with-I50.23 pattern tested earlier in this paper, where a symptom explicitly integral to an already-coded condition is not separately added.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('41ba5774-0a9f-4e70-a9ec-bb440ea6e278', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 65, 'A patient with generalized anxiety disorder and major depressive disorder (both well-documented, separate, longstanding diagnoses) is also newly diagnosed by the physician with insomnia disorder, documented as an independent condition requiring its own targeted treatment (not simply a symptom of the anxiety/depression). Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('57378e26-0faf-4972-8364-3b394284cbf7', '41ba5774-0a9f-4e70-a9ec-bb440ea6e278', 0, 'F41.1, F33.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d9fffc1c-9e30-49d1-b83a-14aaf0dc0c4a', '41ba5774-0a9f-4e70-a9ec-bb440ea6e278', 1, 'F41.1, F33.9, G47.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('da9b519e-cbde-49dc-902a-8158ccd8dd5b', '41ba5774-0a9f-4e70-a9ec-bb440ea6e278', 2, 'G47.9, F41.1, F33.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0cc1c830-0812-4c5a-bf3e-5257dc1ba4d5', '41ba5774-0a9f-4e70-a9ec-bb440ea6e278', 3, 'F41.1, F33.9, F51.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('41ba5774-0a9f-4e70-a9ec-bb440ea6e278', 'd9fffc1c-9e30-49d1-b83a-14aaf0dc0c4a', 'G47.00 (insomnia, unspecified) is added as a separate code since the physician explicitly documents it as an independent condition warranting its own targeted treatment, not merely a symptom subsumed under the anxiety or depression diagnoses. F51.01 (primary insomnia — a psychophysiologic/behavioral insomnia diagnosis distinct from organic sleep disorders) would be a plausible alternative ONLY if the documentation specifically supported a primary/behavioral insomnia diagnosis rather than a general insomnia complaint; absent that specific distinction in the stem, G47.00 (the general, ''organic'' sleep-disorder-chapter insomnia code) is the more defensible default when documentation doesn''t specify the primary/psychophysiologic subtype. F41.1 (generalized anxiety disorder) and F33.9 (major depressive disorder, unspecified) remain as the separate, pre-existing diagnoses.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f29f1235-3131-406c-8211-575455937eb7', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 66, 'A patient with peripheral arterial disease of both lower extremities, with intermittent claudication present on both sides per physician documentation, is admitted to home health for a supervised walking program. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('44a70502-46d8-432c-8883-d617104d9a4b', 'f29f1235-3131-406c-8211-575455937eb7', 0, 'I73.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('04a4a0f8-50cb-4aac-82d6-860d51578e76', 'f29f1235-3131-406c-8211-575455937eb7', 1, 'I70.219');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9e3f0375-18a9-48f4-9fd1-b8ff270c32ea', 'f29f1235-3131-406c-8211-575455937eb7', 2, 'I70.221, I70.222');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('77b1797a-9b0b-48af-b290-fb2971150615', 'f29f1235-3131-406c-8211-575455937eb7', 3, 'I70.211, I70.212');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f29f1235-3131-406c-8211-575455937eb7', '77b1797a-9b0b-48af-b290-fb2971150615', 'Because claudication is documented on BOTH sides, each leg needs its own laterality-specific code from the correct family: I70.211 (atherosclerosis of native right leg arteries with intermittent claudication) and I70.212 (same, left leg) — I70.2x is organized first by claudication-presence (I70.21- = WITH claudication; I70.22- = WITHOUT claudication, i.e. asymptomatic/rest-pain presentations) and then by laterality digit, so option C''s I70.22- codes are the wrong family entirely for a patient with documented claudication. I73.9 (peripheral vascular disease, unspecified) and I70.219 (unspecified laterality, with claudication) both under-code the documented bilateral, laterality-specific presentation.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d19f0148-5532-496f-80fa-4d3c13af1532', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 67, 'A patient with a recent below-elbow amputation of the right arm (traumatic, work-related injury) is admitted to home health for wound care and early prosthetic fitting education. Which additional code category, beyond the amputation-status code, is relevant to flag given the work-related mechanism, even though workers'' compensation billing is handled separately?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('295a9886-1b04-427e-a6cf-b5c1a9140908', 'd19f0148-5532-496f-80fa-4d3c13af1532', 0, 'No additional code is needed since billing for the work injury is handled outside the home health Medicare/Medicaid claim');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('488b8a72-7d6a-4eee-bfe0-c895186133d7', 'd19f0148-5532-496f-80fa-4d3c13af1532', 1, 'An external cause code (Y92-/W-series or similar) documenting how and where the injury occurred, since external cause codes may still be clinically relevant and are not billing-exclusive');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4558d679-ea59-4c12-bba1-887854542adb', 'd19f0148-5532-496f-80fa-4d3c13af1532', 2, 'A Z56 (employment-related) code should replace the amputation code entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('776f6666-234a-4795-be55-c4fde8f37a4a', 'd19f0148-5532-496f-80fa-4d3c13af1532', 3, 'V-series (transport accident) codes must be used regardless of the actual mechanism');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d19f0148-5532-496f-80fa-4d3c13af1532', '488b8a72-7d6a-4eee-bfe0-c895186133d7', 'External cause codes (documenting how, where, and under what circumstances an injury occurred) remain clinically and administratively relevant to code even when a claim is being billed through a different payer (like workers'' compensation) — external cause coding isn''t billing-exclusive to any one payer type, and complete clinical documentation should still reflect the actual mechanism of injury for the full clinical picture, care planning, and any coordination-of-benefits documentation needs, distinct from which entity ultimately pays the claim.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0445146a-ff29-417a-8e07-87ea580e7020', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 68, 'A patient with congestive heart failure has a documented ejection fraction of 30% on recent echocardiogram, with the physician''s note stating ''heart failure with reduced ejection fraction, chronic, currently stable, no acute exacerbation.'' Select the correct code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f18bb562-1661-4ec6-8e0d-746e8942a0bf', '0445146a-ff29-417a-8e07-87ea580e7020', 0, 'I50.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f0013541-735a-4d7f-b81f-b0a07a6475e5', '0445146a-ff29-417a-8e07-87ea580e7020', 1, 'I50.22');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('931553aa-cd6d-4478-97d3-92ae939ae99a', '0445146a-ff29-417a-8e07-87ea580e7020', 2, 'I50.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f1447b46-c16f-43e0-9432-1b3c856ec65d', '0445146a-ff29-417a-8e07-87ea580e7020', 3, 'I50.42');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0445146a-ff29-417a-8e07-87ea580e7020', 'f0013541-735a-4d7f-b81f-b0a07a6475e5', 'I50.22 (chronic systolic (congestive) heart failure — HFrEF, chronic, without documented acute exacerbation) precisely matches the physician''s exact documentation of chronic, currently-stable, reduced-EF heart failure with no acute component. I50.20 (unspecified systolic heart failure, without the chronic/acute qualifier specified) under-codes the explicitly documented ''chronic'' status. I50.9 (unspecified heart failure) under-codes the explicitly documented systolic/reduced-EF type. This tests precise matching of documented specificity (type + acuity, both stated) to the correct 5th-character code, rather than defaulting to a less specific code out of habit.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0308567e-ce01-49f4-8927-5f5738f1c47f', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 69, 'A patient with chronic kidney disease stage 4 who is NOT on dialysis is found by the home health nurse to have a potassium level of 6.2 mEq/L on a recent lab draw ordered by the physician, with the physician documenting this as clinically significant hyperkalemia requiring dietary intervention and medication adjustment. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4f91d4cc-71a2-4483-aeaa-4b2acc5b49e6', '0308567e-ce01-49f4-8927-5f5738f1c47f', 0, 'N18.4, E87.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('896cb199-e19e-4847-930b-fefeac20d1a2', '0308567e-ce01-49f4-8927-5f5738f1c47f', 1, 'E87.5, N18.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a81995ba-a935-40fa-a650-ba5c6523b9b0', '0308567e-ce01-49f4-8927-5f5738f1c47f', 2, 'N18.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0b2e356f-7067-43a7-9fed-73863481d9e7', '0308567e-ce01-49f4-8927-5f5738f1c47f', 3, 'E87.5');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0308567e-ce01-49f4-8927-5f5738f1c47f', '896cb199-e19e-4847-930b-fefeac20d1a2', 'E87.5 (hyperkalemia) is sequenced first as the acute, currently-treated finding directly prompting the dietary/medication intervention at this encounter. N18.4 (CKD stage 4) follows as the underlying chronic condition contributing to (but not solely constituting) the hyperkalemia. Unlike some of the combination-code patterns tested elsewhere in this paper, hyperkalemia in CKD does NOT have a dedicated combination code requiring ''code first CKD'' — hyperkalemia and CKD are coded as two separate, related but independently-coded conditions, with the acutely-relevant electrolyte abnormality sequenced first since it''s the acute focus of this specific encounter.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d9aecb5d-b585-40b1-9ed2-040dc4cc6649', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 70, 'A patient with schizoaffective disorder, bipolar type, is stable on a long-acting injectable antipsychotic administered monthly by home health nursing. The patient has no current mood episode or psychotic symptoms documented at this visit. Select the correct coding for this maintenance visit.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c43fbc14-7322-4fed-99ac-84835c015234', 'd9aecb5d-b585-40b1-9ed2-040dc4cc6649', 0, 'F25.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0f2566f0-e401-42aa-b9e7-392b5a816fef', 'd9aecb5d-b585-40b1-9ed2-040dc4cc6649', 1, 'F20.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0093a455-3f0f-4b9f-90e5-92cf507607bc', 'd9aecb5d-b585-40b1-9ed2-040dc4cc6649', 2, 'F31.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fcc13ac6-9ea5-4e6a-815a-2775eaa3d159', 'd9aecb5d-b585-40b1-9ed2-040dc4cc6649', 3, 'Z79.899, F25.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d9aecb5d-b585-40b1-9ed2-040dc4cc6649', 'c43fbc14-7322-4fed-99ac-84835c015234', 'F25.0 (schizoaffective disorder, bipolar type) is coded as the ongoing underlying diagnosis being managed via the maintenance injection, even though no ACTIVE episode/symptoms are documented at this specific visit — the diagnosis itself doesn''t require active symptoms to remain codeable as the reason for ongoing maintenance treatment, distinct from an acute-episode-severity code that WOULD require documentation of a current active episode. Z79.899 (long-term drug therapy, other) could arguably be added as a supplementary code reflecting the long-acting injectable regimen, but F25.0 alone is the more essential, higher-priority answer reflecting the primary diagnosis driving the visit.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('54d26871-1373-4d5c-ac75-adde3cd18c79', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 71, 'A patient with a recent hip replacement develops a deep vein thrombosis of the right femoral vein, confirmed by ultrasound, 10 days post-surgery. The physician''s note explicitly documents this DVT as a complication directly arising from the surgical procedure. The patient is now on home health for anticoagulation management and mobility monitoring. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('34171adf-877f-4620-8998-178c1a31589e', '54d26871-1373-4d5c-ac75-adde3cd18c79', 0, 'I82.409');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3ebfbf40-519d-4927-b55d-9df36b4a4797', '54d26871-1373-4d5c-ac75-adde3cd18c79', 1, 'I82.409, Z98.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4a693247-a611-49ab-bd0e-fd39a808be1d', '54d26871-1373-4d5c-ac75-adde3cd18c79', 2, 'T81.72XA, I82.409');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b80c6ef6-20d3-429b-bb18-4c24bab15b19', '54d26871-1373-4d5c-ac75-adde3cd18c79', 3, 'T81.40XA, I82.409');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('54d26871-1373-4d5c-ac75-adde3cd18c79', '4a693247-a611-49ab-bd0e-fd39a808be1d', 'T81.72XA (complication of vein following a procedure, not elsewhere classified — initial encounter) is added because the physician explicitly documents this DVT as directly caused by the surgical procedure itself, not simply a general postoperative risk coincidentally present — that explicit causal attribution is what triggers use of the T81.72- postprocedural-complication code, per the ''code first'' instructional convention pairing it with the specific thrombosis code. I82.409 (acute embolism/thrombosis of unspecified deep vein of unspecified lower extremity — laterality should ideally be specified as right, i.e. I82.4Q1/I82.4Z1 per current ICD-10-CM extremity/vein-specificity conventions, but is accepted here at this general level) captures the specific clot diagnosis. T81.40XA (infection following a procedure, unspecified) is a distractor referring to an entirely different complication type (infection, not thrombosis) and would be wrong regardless of the causal-attribution question.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6667ddd1-91e3-4815-97ad-01f9a46af8b8', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 72, 'A patient with generalized anxiety disorder is prescribed a benzodiazepine for short-term use. Six months later, the patient is still taking it daily, and the physician documents the patient has developed benzodiazepine dependence, distinct from the anxiety disorder itself, requiring a structured taper. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d2b7b92c-a034-4e92-9ca7-15c7e0d0ae79', '6667ddd1-91e3-4815-97ad-01f9a46af8b8', 0, 'F41.1, F13.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('78741f88-9687-42a0-b887-f0a0a6c7371d', '6667ddd1-91e3-4815-97ad-01f9a46af8b8', 1, 'F13.20, F41.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4fd71283-85a2-41e9-9a15-2e5fb92d9848', '6667ddd1-91e3-4815-97ad-01f9a46af8b8', 2, 'F13.90, F41.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9463fcde-7bc4-49a8-87b6-df8e32277caa', '6667ddd1-91e3-4815-97ad-01f9a46af8b8', 3, 'F41.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6667ddd1-91e3-4815-97ad-01f9a46af8b8', '78741f88-9687-42a0-b887-f0a0a6c7371d', 'F13.20 (sedative, hypnotic, or anxiolytic dependence, uncomplicated) is sequenced first since it''s now the acute, currently-being-actively-managed condition (the taper) driving this specific home health involvement. F41.1 (generalized anxiety disorder) follows as the pre-existing, separate underlying condition. F13.90 (sedative/hypnotic/anxiolytic USE, unspecified — without documented dependence) would under-code the physician''s explicit documentation of dependence, which is a more severe classification than simple use, mirroring the abuse/dependence/use family-severity distinction tested earlier in this paper with the alcohol-use-disorder question (Q14).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('08ac1777-7033-40dc-a9a0-4796aa9b5d11', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 73, 'A patient with type 1 diabetes uses an insulin pump. The home health nurse identifies a pump malfunction resulting in under-delivery of insulin over several hours, leading to significant hyperglycemia requiring correction, with the patient having done nothing incorrectly (the device itself malfunctioned). Select the correct coding approach.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('100f43c1-2ef0-455d-8b00-f9d02fe0a4f9', '08ac1777-7033-40dc-a9a0-4796aa9b5d11', 0, 'T85.614A, E10.65');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('987d6940-0837-4e50-a273-349df0349ced', '08ac1777-7033-40dc-a9a0-4796aa9b5d11', 1, 'T38.3X1A, E10.65');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('57e62e46-8494-4922-a2d9-7c1d0fa1b6e9', '08ac1777-7033-40dc-a9a0-4796aa9b5d11', 2, 'E10.65, T85.614A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('06590e96-f640-4b7e-a19d-b58fb5c1c8d1', '08ac1777-7033-40dc-a9a0-4796aa9b5d11', 3, 'T85.614A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('08ac1777-7033-40dc-a9a0-4796aa9b5d11', '100f43c1-2ef0-455d-8b00-f9d02fe0a4f9', 'T85.614A (breakdown (mechanical complication) of insulin pump, initial encounter) is sequenced first as the device malfunction is the root cause driving the resulting hyperglycemia. E10.65 (type 1 diabetes with hyperglycemia) follows as the resulting clinical manifestation of the under-delivery. T38.3X1A (poisoning by insulin) is incorrect since this isn''t a poisoning scenario — the patient didn''t misuse or receive a wrong dose through error of use; the DEVICE malfunctioned mechanically, which is specifically a device-complication code (T85.6-), not a drug-poisoning code, even though the ultimate physiologic effect (under-insulinization) is similar in kind to what a dosing error might cause.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a55d903a-d50c-4313-b650-e416320d0e6e', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 74, 'A patient with a permanent colostomy and a separate, unrelated ileostomy (both present due to two distinct prior surgeries for different conditions — colostomy for diverticulitis, ileostomy for Crohn''s-related bowel resection) is admitted to home health for general ostomy care education for both stomas. Select the correct status coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('67eb0033-77ad-452c-abc1-d686323d106c', 'a55d903a-d50c-4313-b650-e416320d0e6e', 0, 'Z93.2, Z93.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b8a21d1f-a65a-4f84-9f1e-09bf45d339fe', 'a55d903a-d50c-4313-b650-e416320d0e6e', 1, 'Z93.3, Z93.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ad8b819b-7a0e-4de6-9d73-8e08fe4842df', 'a55d903a-d50c-4313-b650-e416320d0e6e', 2, 'Z93.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('63390697-0ec7-4ee2-bbb9-33e22c1eab4f', 'a55d903a-d50c-4313-b650-e416320d0e6e', 3, 'Z93.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a55d903a-d50c-4313-b650-e416320d0e6e', '67eb0033-77ad-452c-abc1-d686323d106c', 'Since the patient has TWO distinct, separately-created stomas, BOTH specific status codes are needed: Z93.2 (ileostomy status) and Z93.3 (colostomy status) — Z93.9 (unspecified artificial opening status) would under-code the documented specificity of having two distinct, known stoma types, and using only one of the two specific codes would omit one of the two genuinely present, clinically relevant conditions. This tests whether a candidate recognizes that a patient can have multiple distinct ostomy-status codes simultaneously rather than assuming only one status code applies per patient.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4e2a0774-428d-464b-a8bd-4502835fad53', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 75, 'A patient with long-standing hypertension and hyperlipidemia, both well-controlled on medication, is admitted to home health following a new diagnosis of unstable angina, with cardiac catheterization pending. Select the correct principal diagnosis, and address whether the hypertension/hyperlipidemia should be linked to the angina via a combination code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('528705da-cf59-4436-856f-f071d165c79c', '4e2a0774-428d-464b-a8bd-4502835fad53', 0, 'I20.0, I10, E78.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d989daaf-588b-4e40-a10a-8941cae68d90', '4e2a0774-428d-464b-a8bd-4502835fad53', 1, 'I25.110, I10, E78.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b9a829a9-acf4-4974-b16f-a349a7ef1a07', '4e2a0774-428d-464b-a8bd-4502835fad53', 2, 'I20.0, I25.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5e3feb41-8a20-44ce-9f9e-c3f644c8a76a', '4e2a0774-428d-464b-a8bd-4502835fad53', 3, 'I20.9, I10, E78.5');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4e2a0774-428d-464b-a8bd-4502835fad53', '528705da-cf59-4436-856f-f071d165c79c', 'I20.0 (unstable angina) is sequenced first as the acute, currently-being-worked-up condition. I10 (essential hypertension) and E78.5 (hyperlipidemia, unspecified) are added as separate, coexisting chronic conditions — there is no ICD-10-CM combination code linking hypertension/hyperlipidemia directly with unstable angina the way there is for hypertension-with-CKD or hypertension-with-heart-failure (I1x family combination codes are specifically for hypertensive heart/kidney disease, not general coronary artery disease/angina), so these remain separately coded rather than forced into an inapplicable combination code — this tests whether a candidate over-applies combination-code logic from earlier questions (like the I13.0 hypertension-heart-failure-CKD question, Q2) to a scenario where no such applicable combination code actually exists.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('20ee4540-e0c0-4764-9ff9-08c17fa6e4c4', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 76, 'A patient with severe, longstanding osteoarthritis of both knees, worse on the right, is admitted to home health following a recent right total knee replacement, now in the early postoperative recovery phase with PT for range of motion. Select the correct principal diagnosis, addressing both knees.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9381a0cf-972d-4610-b435-e287562e94d3', '20ee4540-e0c0-4764-9ff9-08c17fa6e4c4', 0, 'M17.0, Z96.651');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('767bab47-dc06-428f-ba33-43abdebb378a', '20ee4540-e0c0-4764-9ff9-08c17fa6e4c4', 1, 'Z96.651, M17.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('298f97b1-4a01-43f0-8f7b-45aaea2ffe2e', '20ee4540-e0c0-4764-9ff9-08c17fa6e4c4', 2, 'M17.11, Z96.651');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a56ccb9b-bfca-4831-a624-8f20aa940075', '20ee4540-e0c0-4764-9ff9-08c17fa6e4c4', 3, 'M17.9, Z96.651');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('20ee4540-e0c0-4764-9ff9-08c17fa6e4c4', '767bab47-dc06-428f-ba33-43abdebb378a', 'Z96.651 (presence of right artificial knee joint) is sequenced first since the primary focus of THIS home health episode is the postoperative recovery from the right knee replacement — the device-status code reflecting the completed surgery takes priority sequencing for a post-op-recovery-focused episode. M17.12 (unilateral primary osteoarthritis, left knee) is added to capture the still-present, untreated osteoarthritis in the OTHER (left) knee, which remains a genuine, active, unaddressed condition — importantly, the right knee''s own original osteoarthritis (M17.11) is NOT separately coded anymore, since it has been surgically resolved by the joint replacement and is now represented by the Z96.651 status code instead, not by the pre-replacement arthritis code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d583d581-480a-4772-98e2-9eb6539b5a0b', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 77, 'A patient status post CABG surgery has a documented history of the underlying coronary artery disease that necessitated the surgery, with no current angina or ischemic symptoms, on home health for general cardiac rehab and post-op monitoring. Select the correct coding for the underlying CAD.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('30077c2d-46e6-47c9-8a5a-5a18f8a40a82', 'd583d581-480a-4772-98e2-9eb6539b5a0b', 0, 'I25.10, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('825c7a89-3136-4301-8ca6-abfdf164eb2d', 'd583d581-480a-4772-98e2-9eb6539b5a0b', 1, 'I25.810, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cbb886e2-1396-4588-922c-8529167c5aad', 'd583d581-480a-4772-98e2-9eb6539b5a0b', 2, 'Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('64fe9f11-8953-4a95-80de-829cd6e4bc66', 'd583d581-480a-4772-98e2-9eb6539b5a0b', 3, 'I25.9, Z95.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d583d581-480a-4772-98e2-9eb6539b5a0b', '30077c2d-46e6-47c9-8a5a-5a18f8a40a82', 'I25.10 (atherosclerotic heart disease of native coronary artery without angina pectoris) remains the correct active CAD code even post-CABG and even without current symptoms, since CABG bypasses the blocked vessels but does NOT cure/resolve the underlying atherosclerotic coronary artery disease itself — unlike the total-knee-replacement scenario in the prior question (where the arthritic joint itself is physically removed and replaced), a CABG leaves the native diseased coronary arteries in place, meaning the CAD diagnosis remains active and current, not converted to a ''history of'' status code. Z95.1 (presence of coronary artery bypass graft) is added as the relevant procedure-status code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('51ad3ed0-e8b3-4097-8968-678aeb7e5f07', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 78, 'A patient with major depressive disorder, single episode, severe, without psychotic features, is admitted to home health following a recent psychiatric hospitalization for a suicide attempt by medication overdose, now stable with close psychiatric home health follow-up and a safety plan in place. Select the correct coding, including whether the suicide attempt itself requires a separate code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3015e138-1166-465c-85f5-6ea0c96f788e', '51ad3ed0-e8b3-4097-8968-678aeb7e5f07', 0, 'F32.2, T14.91A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d9f21042-a828-43d1-8e05-f9308a25f094', '51ad3ed0-e8b3-4097-8968-678aeb7e5f07', 1, 'F32.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bf2e087b-88ef-42b1-a10b-c5bf655ddfbd', '51ad3ed0-e8b3-4097-8968-678aeb7e5f07', 2, 'F32.2, Z91.51');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('089072bd-8a62-4f42-8b9b-d54a242168e3', '51ad3ed0-e8b3-4097-8968-678aeb7e5f07', 3, 'F32.3, Z91.51');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('51ad3ed0-e8b3-4097-8968-678aeb7e5f07', 'bf2e087b-88ef-42b1-a10b-c5bf655ddfbd', 'F32.2 (major depressive disorder, single episode, severe, without psychotic features) matches the documented severity and psychotic-feature status precisely (F32.3 would be the WITH-psychotic-features variant, not applicable here since ''without psychotic features'' is explicitly stated). Z91.51 (personal history of suicidal behavior) is the correct additional code to flag the prior suicide attempt as clinically relevant historical/risk information for ongoing care planning — Z91.5 by itself is a non-billable parent requiring the additional digit specifying suicidal (Z91.51) versus nonsuicidal (Z91.52) self-harm; since this stem specifically documents a suicide attempt, Z91.51 is the precise match. T14.91A (suicide attempt, initial encounter — an injury code) is not appropriate here since the acute overdose event itself has already been treated and resolved at the hospital; this home health episode is for ongoing psychiatric follow-up after that acute event, not active treatment of the overdose itself, making the history code (Z91.51) the better fit than an active-injury code for THIS specific encounter.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('47b26e07-1f6d-46be-b526-db15b494f9c4', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 79, 'A patient with chronic constipation related to long-standing opioid use for cancer pain management (opioids still actively prescribed and needed for legitimate ongoing pain control, correctly dosed) requires an aggressive bowel regimen managed by home health nursing. Select the correct coding, and address whether this differs from the earlier opioid-constipation question in this same paper.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('efddd529-d968-4417-b3ef-1178509313f8', '47b26e07-1f6d-46be-b526-db15b494f9c4', 0, 'K59.00, T40.2X5A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d2bc4041-e776-4d21-90cb-6b50e59fc91c', '47b26e07-1f6d-46be-b526-db15b494f9c4', 1, 'T40.2X5A, K59.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('22340eba-edf1-4477-9082-cdb0029eaec1', '47b26e07-1f6d-46be-b526-db15b494f9c4', 2, 'K59.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('33a57eb6-49b7-45ea-8eb4-19d02b7f24e4', '47b26e07-1f6d-46be-b526-db15b494f9c4', 3, 'C-code for the cancer, T40.2X5A, K59.00');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('47b26e07-1f6d-46be-b526-db15b494f9c4', 'd2bc4041-e776-4d21-90cb-6b50e59fc91c', 'T40.2X5A (adverse effect of opioids) followed by K59.00 (constipation) uses the identical sequencing logic already established earlier in this paper (Q39''s opioid-constipation question) — the drug-effect code leads, the manifestation follows, regardless of WHY the opioid is being used (chronic non-cancer pain vs. active cancer pain), since the adverse-effect sequencing convention is about the drug-effect relationship itself, not the underlying reason for the medication. This question is included specifically to test whether a candidate incorrectly assumes a different rule applies just because the clinical context (cancer pain vs. FBSS-related chronic pain) differs — the underlying adverse-effect coding logic does not change based on the reason for opioid use. The specific cancer diagnosis code is not required in this answer since the question asks specifically about the constipation coding, not full diagnosis capture for the entire cancer treatment plan.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ba64b177-cb23-4f38-a207-f881687340df', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 80, 'A patient with a stage 3 pressure ulcer of the right heel, present on admission to home health (not hospital-acquired — developed at home prior to any inpatient stay), is being treated with offloading and wound care. During a follow-up visit 4 weeks later, the wound has improved to a stage 2 depth. Per OASIS/ICD-10-CM wound-staging convention, how should this improvement be reflected in the coding at the follow-up point?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d2a94151-0c78-445e-bdb8-ddb28eefe9aa', 'ba64b177-cb23-4f38-a207-f881687340df', 0, 'The code remains L97.413 (stage 3) for the remainder of the episode since pressure ulcers are always coded at their worst documented stage');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9fb9cd5e-446e-4ff9-b82c-fb295352b953', 'ba64b177-cb23-4f38-a207-f881687340df', 1, 'The code should be updated to reflect the current stage 2 depth (L97.412) at the point this improvement is documented, since ICD-10-CM pressure ulcer staging reflects the CURRENT stage, not the worst historical stage');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('99e418a2-9d57-4932-8556-3254382513fa', 'ba64b177-cb23-4f38-a207-f881687340df', 2, 'The wound should be recoded as a stage 4 to reflect that healing progress requires escalating code specificity');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3fbff2e5-f3f7-41c5-99ae-98f83e6dd8a6', 'ba64b177-cb23-4f38-a207-f881687340df', 3, 'No change is needed since the ulcer location and general presence hasn''t changed');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ba64b177-cb23-4f38-a207-f881687340df', '9fb9cd5e-446e-4ff9-b82c-fb295352b953', 'ICD-10-CM pressure ulcer staging (L89/L97 combination codes for pressure ulcers with staging, depending on additional documentation) reflects the CURRENT clinical stage at the time of the encounter/documentation, not a ''worst ever'' historical marker — as a pressure ulcer heals and its stage improves (stage 3 → stage 2, representing decreasing depth as tissue granulates and re-epithelializes), the code should be updated to reflect the improved current stage at each relevant documentation point. This is a genuinely important, sometimes-misunderstood convention, since staging can feel intuitively like it should only track the worst-ever severity (the way some other clinical severity markers work), but ICD-10-CM pressure ulcer codes specifically track current status, not historical maximum severity.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a633cedc-a686-4fcd-ab9f-224999c7e339', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 81, 'A patient with Down syndrome (a lifelong congenital condition) and a separate, newly diagnosed acquired hypothyroidism (unrelated autoimmune Hashimoto''s thyroiditis, confirmed by antibody testing) is admitted to home health following a hip fracture. Select the correct coding for the two chronic conditions listed, addressing whether the congenital status changes how it''s coded in an adult patient.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d9d61c59-cf5b-4b0c-b816-8b8896428c18', 'a633cedc-a686-4fcd-ab9f-224999c7e339', 0, 'Q90.9, E06.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('27e0a2c5-06c2-4187-a6af-0ca8da1453e0', 'a633cedc-a686-4fcd-ab9f-224999c7e339', 1, 'E06.3, Q90.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7541e104-8ca6-4ad5-a8b5-b4edb8914dc5', 'a633cedc-a686-4fcd-ab9f-224999c7e339', 2, 'Z87.898, E06.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b61ea388-c3ee-4e6a-a531-f8028102a760', 'a633cedc-a686-4fcd-ab9f-224999c7e339', 3, 'Q90.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a633cedc-a686-4fcd-ab9f-224999c7e339', 'd9d61c59-cf5b-4b0c-b816-8b8896428c18', 'Q90.9 (Down syndrome, unspecified) remains coded as an active, current condition even in an adult patient — congenital chromosomal conditions like Down syndrome are lifelong and are coded as present/active for the patient''s entire life, never converted to a ''history of'' status code the way a resolved acquired condition would be, since the underlying genetic condition itself never resolves. E06.3 (autoimmune thyroiditis — Hashimoto''s) is added as the separate, newly diagnosed, unrelated condition. Sequencing here follows relevance to the current encounter/overall complexity rather than a fixed etiology rule, since there is no combination code or ''code first'' relationship between these two genuinely unrelated diagnoses.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b4dbf1d2-d9f2-407c-a9b1-10235915870a', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 82, 'A patient with a known history of latex allergy (documented, confirmed by prior anaphylactic reaction) is receiving home wound care. The home health nurse ensures latex-free supplies are used for all visits. Should the latex allergy be coded, and if so, as what?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a62f1422-f4d0-4902-9414-bc8c79485f76', 'b4dbf1d2-d9f2-407c-a9b1-10235915870a', 0, 'Z91.040');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9cd9e2dd-8eba-4de8-87b0-4f482b828226', 'b4dbf1d2-d9f2-407c-a9b1-10235915870a', 1, 'T78.40XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f828d630-e8e4-42fe-8977-b15bd1120ebe', 'b4dbf1d2-d9f2-407c-a9b1-10235915870a', 2, 'No code needed — allergies are precaution notes, not diagnoses');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d9ada01d-affe-4cc2-957f-8b6bcb143a20', 'b4dbf1d2-d9f2-407c-a9b1-10235915870a', 3, 'Z88.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b4dbf1d2-d9f2-407c-a9b1-10235915870a', 'a62f1422-f4d0-4902-9414-bc8c79485f76', 'Z91.040 (allergy to latex) is the correct status code to document a known, confirmed allergy relevant to ongoing care precautions (ensuring latex-free supplies) — this is clinically significant information affecting how care is safely delivered at every visit, which is exactly the kind of history/status code appropriately captured even though it isn''t the reason for the home health episode itself. T78.40XA (allergy, unspecified, initial encounter) is an ACTIVE allergic reaction code, not appropriate for a known, stable, non-acute allergy history being used for precaution purposes. Z88.9 (allergy status to unspecified drug) is the wrong Z-code family — Z88 is specifically for drug allergies, while Z91.040 is the correct code for a non-drug substance (latex) allergy status.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('458d29b2-6256-4f73-8488-d624aefe2cad', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 83, 'A patient with severe aortic stenosis awaiting valve replacement develops acute decompensated heart failure requiring urgent IV diuresis coordinated between home health and the cardiologist, avoiding hospitalization. The physician documents the heart failure as directly due to the aortic stenosis. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cfd982d1-1dd4-460e-83fa-9eeb38151f45', '458d29b2-6256-4f73-8488-d624aefe2cad', 0, 'I50.21, I35.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d9a77472-f934-41bd-ac53-53ca80efe1d8', '458d29b2-6256-4f73-8488-d624aefe2cad', 1, 'I35.0, I50.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('abbbb7d8-6f09-4784-8bd1-19657b429274', '458d29b2-6256-4f73-8488-d624aefe2cad', 2, 'I35.0, I50.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('728c1614-4104-468b-81f6-c51b173f42d3', '458d29b2-6256-4f73-8488-d624aefe2cad', 3, 'I50.21');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('458d29b2-6256-4f73-8488-d624aefe2cad', 'd9a77472-f934-41bd-ac53-53ca80efe1d8', 'I35.0 (nonrheumatic aortic valve stenosis) is sequenced first as the underlying structural cause the physician explicitly links to the heart failure. I50.21 (acute systolic heart failure) follows as the resulting decompensation — ''acute'' matches the documented urgent, new decompensation requiring emergent IV diuresis (versus a chronic/stable heart failure code, which wouldn''t match this acute presentation). Note there is no dedicated ICD-10-CM combination code directly joining aortic-valve disease with heart failure the way I13.0 combines hypertension/heart-failure/CKD — so these remain two separately sequenced codes, with the causally-primary structural valve disease leading.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('43b0f984-dd44-40ee-9cd1-263dbaf9672b', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 84, 'A patient with chronic hepatitis B (inactive carrier state, confirmed by physician as non-replicating, no current liver damage) is admitted to home health for an unrelated post-surgical wound care episode. Select the correct coding approach for the hepatitis B status.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4c280356-151d-4c56-b00f-20d0148a1ba3', '43b0f984-dd44-40ee-9cd1-263dbaf9672b', 0, 'B18.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7ea01fc4-3e81-4dd3-9ddf-14006fb80e27', '43b0f984-dd44-40ee-9cd1-263dbaf9672b', 1, 'B19.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1dd61ac8-05bf-4357-b5e6-f77e74652753', '43b0f984-dd44-40ee-9cd1-263dbaf9672b', 2, 'Z22.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('724c2154-1711-44f4-94b3-8c0806f3e37e', '43b0f984-dd44-40ee-9cd1-263dbaf9672b', 3, 'B16.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('43b0f984-dd44-40ee-9cd1-263dbaf9672b', '4c280356-151d-4c56-b00f-20d0148a1ba3', 'B18.1 (chronic viral hepatitis B without delta-agent) is the correct code, even for a confirmed inactive/non-replicating carrier state — unlike bacterial or parasitic organisms (MRSA, TB, streptococcus, etc.), ICD-10-CM does NOT have a dedicated ''carrier'' code family for viral hepatitis; the Z22 carrier-status chapter only covers specific bacterial and parasitic carriers, not viral hepatitis B or C. This is a genuinely important structural fact, since it''s easy to assume a parallel ''carrier vs. active disease'' coding pattern exists here the way it does for MRSA (tested elsewhere in this exam series) — but for hepatitis B specifically, B18.1 is used regardless of current replication/activity status, since ICD-10-CM''s chronic hepatitis B code doesn''t itself distinguish activity level. B19.10 (unspecified viral hepatitis B, without hepatic coma — used when chronicity/acuity isn''t specified) under-codes the documented chronic status. Z22.8 (carrier of other infectious diseases, a general catch-all Z-code) does not specifically apply to viral hepatitis and would be an imprecise, nonstandard choice when the correct B18.1 code exists and applies. B16.9 (acute hepatitis B) is the wrong acuity entirely.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('49bec3f4-7749-422b-bd14-1d30c7fb3f2d', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 85, 'A patient with heart failure and depression is prescribed a new SSRI. Two weeks later, the home health nurse notes the patient reports significant nausea and is documented by the physician as an adverse effect of the correctly-dosed, correctly-taken new SSRI. The physician decides to continue the medication since the nausea is mild and expected to resolve with time. Select the correct coding for this visit''s finding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f563f98c-a5a5-4421-9bda-a1fc5042aad3', '49bec3f4-7749-422b-bd14-1d30c7fb3f2d', 0, 'T43.222A, R11.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7357200c-3621-4919-86ca-5797c29424b7', '49bec3f4-7749-422b-bd14-1d30c7fb3f2d', 1, 'R11.0, T43.222A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('18ddbc36-db45-479c-b33d-9821d721de53', '49bec3f4-7749-422b-bd14-1d30c7fb3f2d', 2, 'T43.222A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d1b4381f-561c-444f-93fc-da8b8db5bf21', '49bec3f4-7749-422b-bd14-1d30c7fb3f2d', 3, 'R11.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('49bec3f4-7749-422b-bd14-1d30c7fb3f2d', 'f563f98c-a5a5-4421-9bda-a1fc5042aad3', 'T43.222A (adverse effect of selective serotonin reuptake inhibitors, initial encounter) is sequenced first per the adverse-effect sequencing convention used consistently throughout this paper. R11.0 (nausea) follows as the manifestation. This is coded the same way whether or not the physician ultimately decides to continue or discontinue the causative medication — the adverse-effect coding convention is based on the presence of a documented drug-caused adverse reaction, not on the clinical management decision (continue vs. stop) that follows from it, which is a useful distinction from an assumption some candidates might make that discontinuation is required for adverse-effect coding to apply.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0e322603-ad0e-4df0-b6be-de1dc83f307d', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 86, 'A patient with chronic systolic heart failure and CKD stage 3 (both currently stable, no documented relationship stated by the physician between the two conditions — hypertension is not mentioned in this patient''s history at all) is admitted to home health for general disease management. Select the correct coding approach.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3384409d-4754-4288-a359-9e2d24177800', '0e322603-ad0e-4df0-b6be-de1dc83f307d', 0, 'I13.0, I50.22, N18.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('86102b07-a717-411b-a075-97c3b5466df9', '0e322603-ad0e-4df0-b6be-de1dc83f307d', 1, 'I50.22, N18.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('549153d0-711e-453a-ab5e-713056d04a9d', '0e322603-ad0e-4df0-b6be-de1dc83f307d', 2, 'I13.10, I50.22, N18.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('79740830-f3db-46fb-a2e2-7b8327ccf335', '0e322603-ad0e-4df0-b6be-de1dc83f307d', 3, 'I11.0, I50.22, N18.30');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0e322603-ad0e-4df0-b6be-de1dc83f307d', '86102b07-a717-411b-a075-97c3b5466df9', 'Since hypertension is not documented at all in this patient''s history, the I13.- combination code family (which specifically requires documented hypertensive heart AND kidney disease) does NOT apply here — I13.0 and I11.0 both incorrectly assume a hypertensive etiology that isn''t present in this stem. I50.22 (chronic systolic heart failure) and N18.30 (CKD stage 3, unspecified) are coded as two independent, separately-documented chronic conditions with no combination code linking them, since no causal or hypertensive relationship is stated. This directly tests whether a candidate over-applies the I13 combination-code pattern (correctly used in Q2 of this paper, where hypertension WAS explicitly documented as the common link) to a scenario where the linking condition is absent.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f93c0df8-6dcb-4d9b-9f06-38ca17f4b540', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 87, 'A patient with COPD and known chronic hypoxemia is on home oxygen 2L continuous. During a home health visit, pulse oximetry reveals oxygen saturation of 86% on the patient''s current prescribed flow rate, a new finding compared to the patient''s usual 92% baseline. The nurse contacts the physician, who orders an increase in flow rate pending further evaluation. Select the correct coding for this encounter''s findings, beyond the underlying COPD.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a6df5eb7-43b1-43c5-91b5-baaa493f1a4b', 'f93c0df8-6dcb-4d9b-9f06-38ca17f4b540', 0, 'R09.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bdd15149-7e48-479b-b50f-fc8e483322d8', 'f93c0df8-6dcb-4d9b-9f06-38ca17f4b540', 1, 'J96.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('05d167b6-ba7d-4522-a0ec-4b6edf3a3dee', 'f93c0df8-6dcb-4d9b-9f06-38ca17f4b540', 2, 'E87.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('12f7b94c-1f82-4c0c-b47b-f730092260d3', 'f93c0df8-6dcb-4d9b-9f06-38ca17f4b540', 3, 'No additional code needed beyond the COPD code');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f93c0df8-6dcb-4d9b-9f06-38ca17f4b540', 'a6df5eb7-43b1-43c5-91b5-baaa493f1a4b', 'R09.02 (hypoxemia) is the correct finding code for the newly identified, below-baseline oxygen saturation drop prompting physician contact and an order change — this is a genuine, documentable acute finding distinct from the patient''s chronic baseline COPD-related hypoxemia, and should be coded to reflect the new deviation being actively addressed. J96.01 (acute respiratory failure with hypoxia) would over-code this specific finding unless the physician''s documentation actually establishes frank respiratory failure (a more severe, specific clinical diagnosis) rather than simply a hypoxemic desaturation being managed with a flow-rate adjustment — the stem doesn''t support that higher-acuity diagnosis being made.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5b205785-4d5c-4684-87e2-f28641781621', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 88, 'A patient with type 2 diabetes on metformin develops metformin-associated lactic acidosis, correctly dosed, in the setting of a new, superimposed acute kidney injury (from an unrelated dehydration episode) that reduced metformin clearance. Select the correct coding approach for this scenario.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('844558a5-50a0-4688-97d1-17cad548df24', '5b205785-4d5c-4684-87e2-f28641781621', 0, 'E87.2, T38.3X5A, N17.9, E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7ea94769-67c6-4a45-9ba3-0291552cf813', '5b205785-4d5c-4684-87e2-f28641781621', 1, 'T38.3X5A, E87.2, N17.9, E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('060bd9da-6664-4a4c-87be-b08073e63834', '5b205785-4d5c-4684-87e2-f28641781621', 2, 'E11.9, T38.3X5A, E87.2, N17.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f27f17fe-aead-4ac9-91b0-3955707c84cd', '5b205785-4d5c-4684-87e2-f28641781621', 3, 'N17.9, T38.3X5A, E87.2, E11.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5b205785-4d5c-4684-87e2-f28641781621', '7ea94769-67c6-4a45-9ba3-0291552cf813', 'T38.3X5A (adverse effect of insulin and oral hypoglycemic drugs, initial encounter) leads per the standard adverse-effect sequencing convention. E87.2 (acidosis — used for lactic acidosis) follows as the direct manifestation of the adverse drug effect. N17.9 (acute kidney injury) is added as the separate contributing/complicating condition (the AKI reduced drug clearance, worsening the adverse effect, but is itself a distinct diagnosis from an unrelated dehydration cause). E11.9 (type 2 diabetes, unspecified complications) is added last to establish the underlying diabetes diagnosis for which metformin was prescribed — sequenced after the acute adverse-effect chain since it is the stable background condition, not the acute focus of this encounter.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f10f9c19-f203-46a4-97de-d8051ac3f645', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 89, 'A patient with severe mitral regurgitation is scheduled for outpatient mitral valve repair. The home health episode is for pre-operative cardiac optimization, including management of the patient''s separately documented, well-controlled hypothyroidism (unrelated to the valve disease). Select the correct principal diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('95c532ec-8065-423e-a9fb-d41b341d5d7b', 'f10f9c19-f203-46a4-97de-d8051ac3f645', 0, 'Z01.810, I34.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f5169c5b-9f34-4ffb-98fe-4bb43451032d', 'f10f9c19-f203-46a4-97de-d8051ac3f645', 1, 'I34.0, E03.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fdbe8fb5-d021-423e-9cf5-1cda01fb9077', 'f10f9c19-f203-46a4-97de-d8051ac3f645', 2, 'E03.9, I34.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2c5ad739-0f63-4c53-ade8-4a6b91ecb875', 'f10f9c19-f203-46a4-97de-d8051ac3f645', 3, 'I34.9, E03.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f10f9c19-f203-46a4-97de-d8051ac3f645', 'f5169c5b-9f34-4ffb-98fe-4bb43451032d', 'I34.0 (nonrheumatic mitral valve insufficiency) is sequenced first, since the pre-operative optimization for the mitral valve disease is the primary reason driving this home health episode. E03.9 (hypothyroidism, unspecified) is added as a separate, unrelated, currently-managed chronic condition — sequenced after the primary focus since it''s not the reason for the episode, just a coexisting condition also being monitored. I34.9 (unspecified mitral valve disorder) would under-code the documented specific regurgitation/insufficiency finding. Z01.810 (encounter for pre-procedural cardiovascular exam) doesn''t fit as principal diagnosis since the actual home health clinical work is active disease management (of both conditions), not a discrete pre-op exam encounter.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e3616cc1-72f6-4899-9261-556a30ee3a29', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 90, 'A patient with chronic atrial fibrillation is on amiodarone long-term. The home health nurse identifies new-onset amiodarone-induced pulmonary toxicity, confirmed by the physician via chest imaging and correlated with the timeline of amiodarone use, correctly dosed throughout. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('57abe772-8f8c-4baf-9799-bcf3daf09bf3', 'e3616cc1-72f6-4899-9261-556a30ee3a29', 0, 'J84.10, T46.2X5A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('babb1fd9-ca7f-491e-a511-6b8178801a7b', 'e3616cc1-72f6-4899-9261-556a30ee3a29', 1, 'T46.2X5A, J84.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('01b40d92-3119-40f4-9419-7778a2fe71b3', 'e3616cc1-72f6-4899-9261-556a30ee3a29', 2, 'J84.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d51edf41-15c0-4c83-aed5-5a4c2af4eaa7', 'e3616cc1-72f6-4899-9261-556a30ee3a29', 3, 'T46.2X1A, J84.10');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e3616cc1-72f6-4899-9261-556a30ee3a29', 'babb1fd9-ca7f-491e-a511-6b8178801a7b', 'T46.2X5A (adverse effect of other antidysrhythmic drugs, initial encounter — amiodarone''s drug class) is sequenced first per this paper''s consistent adverse-effect sequencing convention. J84.10 (other interstitial pulmonary disease with fibrosis — used for amiodarone pulmonary toxicity''s typical interstitial/fibrotic pattern) follows as the resulting manifestation. T46.2X1A (poisoning code) is incorrect since the amiodarone was correctly dosed throughout — this is unambiguously an adverse effect of appropriately-used medication, not poisoning from misuse or overdose.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b9e90a8d-9d2f-4fb8-b38d-b3ec21697149', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 91, 'A patient with quadriplegia (C5 level, traumatic spinal cord injury from 8 years ago, stable, no current active treatment for the injury itself) is admitted to home health for management of a new urinary tract infection. Select the correct principal diagnosis and address whether the spinal cord injury needs a 7th character for this encounter.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1c430a84-14f6-4385-b1e8-632a70058319', 'b9e90a8d-9d2f-4fb8-b38d-b3ec21697149', 0, 'N39.0, G82.50');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2cd89f67-8373-4d00-92ad-e04ea31c6063', 'b9e90a8d-9d2f-4fb8-b38d-b3ec21697149', 1, 'G82.50, N39.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f88eb42a-55a1-4795-aa26-e2d4224e060a', 'b9e90a8d-9d2f-4fb8-b38d-b3ec21697149', 2, 'N39.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('658fa56a-dfa7-4b71-a12e-e3f08c226b12', 'b9e90a8d-9d2f-4fb8-b38d-b3ec21697149', 3, 'N39.0, G82.54');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b9e90a8d-9d2f-4fb8-b38d-b3ec21697149', '1c430a84-14f6-4385-b1e8-632a70058319', 'N39.0 (urinary tract infection) is sequenced first as the acute, currently-treated reason for this home health episode. G82.50 (quadriplegia, unspecified) is added as a relevant, currently-affecting-care chronic status — G-codes for paralysis conditions like this do NOT use S-code-style injury 7th characters (initial/subsequent/sequela); they''re coded as ongoing neurological status without an encounter-type 7th character, since G82.50 itself already represents the current, stable, chronic paralysis state rather than an acute injury requiring encounter-phase tracking. G82.54 would incorrectly suggest a specific different completeness/level of injury not supported by the stem''s C5-level, general ''quadriplegia'' documentation.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bdc4a617-4f3a-4ef5-ac4a-0d9494117aa6', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 92, 'A patient with generalized anxiety disorder develops a new panic disorder, documented by the physician as a distinct, separately diagnosed condition co-occurring with (not simply a symptom of) the pre-existing GAD. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5fa3438f-8885-4baa-84c4-11a9a96ff99a', 'bdc4a617-4f3a-4ef5-ac4a-0d9494117aa6', 0, 'F41.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3d1be393-44e2-4d75-a566-1013dbd0df59', 'bdc4a617-4f3a-4ef5-ac4a-0d9494117aa6', 1, 'F41.0, F41.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7d9567af-1cbb-48b1-b74b-22f18f1e6616', 'bdc4a617-4f3a-4ef5-ac4a-0d9494117aa6', 2, 'F41.1, F41.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bfb30796-1d49-463b-87b8-ec957536ee45', 'bdc4a617-4f3a-4ef5-ac4a-0d9494117aa6', 3, 'F41.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('bdc4a617-4f3a-4ef5-ac4a-0d9494117aa6', '3d1be393-44e2-4d75-a566-1013dbd0df59', 'F41.0 (panic disorder) is sequenced first as the newly diagnosed, acute focus of this specific clinical concern. F41.1 (generalized anxiety disorder) follows as the pre-existing, separate, ongoing condition. Both are coded together since the physician explicitly documents them as two distinct, separately diagnosable conditions rather than one being subsumed as a symptom of the other — F41.9 (anxiety disorder, unspecified) would under-code the documented specificity of two distinct, named anxiety disorder diagnoses.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b25ccc9c-c242-47ef-af31-4e9172804eaa', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 93, 'A patient status post lung transplant 2 years ago (for idiopathic pulmonary fibrosis) develops chronic lung allograft dysfunction, confirmed by pulmonary function testing and documented by the transplant pulmonologist as a form of chronic rejection. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a80e6625-2cee-4b21-847c-eeb5f913b471', 'b25ccc9c-c242-47ef-af31-4e9172804eaa', 0, 'T86.819, Z94.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b5d295a7-bd4f-4165-acf5-2d99c1b58cfc', 'b25ccc9c-c242-47ef-af31-4e9172804eaa', 1, 'J84.10, Z94.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9902fb76-cf56-429e-89b1-c588c0d244ae', 'b25ccc9c-c242-47ef-af31-4e9172804eaa', 2, 'T86.810, Z94.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('53b5b7fd-a51d-4dc3-a09d-e9f6629435e2', 'b25ccc9c-c242-47ef-af31-4e9172804eaa', 3, 'T86.812, Z94.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b25ccc9c-c242-47ef-af31-4e9172804eaa', '9902fb76-cf56-429e-89b1-c588c0d244ae', 'T86.810 (lung transplant rejection) is the specific complication code matching the documented chronic rejection process — this mirrors the kidney-transplant-rejection question earlier in this paper (T86.11), applying the same transplant-complication coding logic to a different organ. T86.819 (unspecified lung transplant complication) would under-code the documented specific rejection process when a more specific code (T86.810) is available and matches the documentation. Z94.2 (lung transplant status) is added as the secondary status code, appropriately paired with the active complication code rather than replacing it, following the same ''status code doesn''t replace an active complication code'' principle established in the earlier kidney-transplant question.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d1345412-72aa-423e-8c44-f7e9017021a6', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 94, 'A patient with severe, poorly controlled type 2 diabetes has diabetic peripheral neuropathy with a documented component of neuropathic pain, managed with gabapentin, in addition to separately documented diabetic nephropathy without CKD staging yet established (early-stage, physician notes ''microalbuminuria present, eGFR not yet significantly reduced''). Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8c87b3bb-6af7-4e59-8f2d-bb191e660906', 'd1345412-72aa-423e-8c44-f7e9017021a6', 0, 'E11.42, E11.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('598291a2-e51a-4e40-a93c-e97ada231ece', 'd1345412-72aa-423e-8c44-f7e9017021a6', 1, 'E11.40, E11.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('28292986-1c40-40c8-9df5-5d73ffd230ad', 'd1345412-72aa-423e-8c44-f7e9017021a6', 2, 'E11.42, E11.22, N18.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('47aba087-85be-4c22-83da-fa5cd87c4515', 'd1345412-72aa-423e-8c44-f7e9017021a6', 3, 'E11.42, E11.21, R80.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d1345412-72aa-423e-8c44-f7e9017021a6', '8c87b3bb-6af7-4e59-8f2d-bb191e660906', 'E11.42 (type 2 diabetes with diabetic polyneuropathy) captures the peripheral neuropathy — note ICD-10-CM does not have a separate ''with pain'' 6th character variant for diabetic polyneuropathy the way some other neuropathy codes do, so E11.42 alone (not E11.40, the milder/less-specific ''unspecified neurological complication'' code) correctly captures the documented specific polyneuropathy regardless of the accompanying pain description. E11.21 (type 2 diabetes with diabetic nephropathy) is used since staged CKD is explicitly NOT YET established (''eGFR not yet significantly reduced'') — E11.22 (diabetes with CKD) would require an actual CKD stage to be documented and paired with an N18.x code, which isn''t supported here; microalbuminuria without confirmed reduced eGFR supports the general nephropathy code rather than the CKD-specific combination.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c6bfbf26-816a-49f0-b6c5-364aab0809ad', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 95, 'A patient with chronic kidney disease stage 5 on peritoneal dialysis (not hemodialysis) develops peritonitis, confirmed by cloudy dialysate and positive culture, requiring intraperitoneal antibiotics managed by home health. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6e18bab3-93c8-4a65-9544-e1a918c26d29', 'c6bfbf26-816a-49f0-b6c5-364aab0809ad', 0, 'T85.71XA, N18.6, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('268a460d-5416-4d93-9600-579c69e74fd3', 'c6bfbf26-816a-49f0-b6c5-364aab0809ad', 1, 'K65.0, N18.6, Z99.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('685d0a75-f504-49ba-aef4-5823c5aaa773', 'c6bfbf26-816a-49f0-b6c5-364aab0809ad', 2, 'T85.71XA, N18.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ecdf0f39-ecee-4ebc-8ded-7640066131b3', 'c6bfbf26-816a-49f0-b6c5-364aab0809ad', 3, 'K65.9, T85.71XA, N18.6');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c6bfbf26-816a-49f0-b6c5-364aab0809ad', '6e18bab3-93c8-4a65-9544-e1a918c26d29', 'T85.71XA (infection and inflammatory reaction due to peritoneal dialysis catheter, initial encounter) is the specific device-related complication code for PD-catheter-associated peritonitis — this parallels the earlier AV-fistula-infection question in this paper (T82.7XXA), applying the same device-infection coding logic to the peritoneal dialysis access instead. K65.0 (generalized acute peritonitis, without a documented device-related cause) would under-specify the clearly device-related, dialysis-access-associated etiology actually documented in this stem. N18.6 (ESRD) and Z99.2 (dialysis status) are added as the underlying/status codes.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2e87f4f8-bbf3-4970-b87e-7eb8deaf3875', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 96, 'A patient with chronic low back pain due to lumbar spinal stenosis, confirmed by MRI without neurogenic claudication, is being managed at home with PT and a stable oral analgesic regimen; the physician''s note explicitly does not attribute the pain to any specific nerve root radiculopathy. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a7bb8d96-434c-427d-aeb0-1417a6e5e44e', '2e87f4f8-bbf3-4970-b87e-7eb8deaf3875', 0, 'M48.061');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('df31af11-0f12-46ba-8684-4f45b9b4ad15', '2e87f4f8-bbf3-4970-b87e-7eb8deaf3875', 1, 'M54.50');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('44ff4296-c723-47b7-8a47-33d00dfe1574', '2e87f4f8-bbf3-4970-b87e-7eb8deaf3875', 2, 'M54.16');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b818ad91-c39f-4c87-a367-8e5d9626fefc', '2e87f4f8-bbf3-4970-b87e-7eb8deaf3875', 3, 'M48.061, M54.50');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2e87f4f8-bbf3-4970-b87e-7eb8deaf3875', 'a7bb8d96-434c-427d-aeb0-1417a6e5e44e', 'M48.061 (spinal stenosis, lumbar region, without neurogenic claudication) is the single, specific code capturing the documented structural cause of the back pain, matching the documented absence of neurogenic claudication — M48.06 alone is a non-billable parent requiring this claudication-status specification. Since the pain is explicitly attributed to the stenosis itself (a specific diagnosed structural cause) rather than left as a nonspecific complaint, M54.50 (low back pain, unspecified — a symptom code used when no more specific cause is identified) is not separately needed and would actually be inappropriate to add alongside a more specific causal diagnosis per ICD-10-CM guidance against using unspecified symptom codes when the definitive underlying condition is already known and coded. M54.16 (radiculopathy, lumbar region) is explicitly ruled out by the stem''s statement that no radiculopathy is documented.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2663f083-29fe-4fb5-8dce-0c7aff973dbc', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 97, 'A patient with severe malnutrition, confirmed by physician documentation of significant unintentional weight loss, low albumin, and physical exam findings of muscle wasting, is admitted to home health for nutritional rehabilitation following a prolonged hospitalization for pneumonia (now resolved). Select the correct principal diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9cd06bd1-0000-49ff-8b64-2845bff485b2', '2663f083-29fe-4fb5-8dce-0c7aff973dbc', 0, 'R64');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('36197cd7-ef62-4656-b3e0-44a4c7d4fc9c', '2663f083-29fe-4fb5-8dce-0c7aff973dbc', 1, 'E43');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('36cf67d0-d1b2-4103-a137-62e3c4d7eec0', '2663f083-29fe-4fb5-8dce-0c7aff973dbc', 2, 'E44.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e13cbc33-124b-4222-9b7a-3fab54613722', '2663f083-29fe-4fb5-8dce-0c7aff973dbc', 3, 'E46');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2663f083-29fe-4fb5-8dce-0c7aff973dbc', '36197cd7-ef62-4656-b3e0-44a4c7d4fc9c', 'E43 (unspecified severe protein-calorie malnutrition) matches the documented severity — the physician''s findings (significant weight loss, low albumin, muscle wasting) support a SEVERE malnutrition diagnosis, not the milder E44.0 (moderate protein-calorie malnutrition) or the least-specific E46 (unspecified protein-calorie malnutrition, used when severity isn''t established). R64 (cachexia) is a related but distinct, less specific wasting-syndrome code that doesn''t capture the documented nutritional/protein-calorie clinical picture as precisely as the malnutrition-specific E43 code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8c6c23b5-7875-454b-99d7-e05a42009d16', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 98, 'A patient with chronic atrial fibrillation on rivaroxaban develops a gastrointestinal bleed, confirmed by endoscopy as a bleeding gastric ulcer, with the physician documenting the rivaroxaban as a contributing factor to bleeding severity even though the ulcer itself has an independent cause (H. pylori, also confirmed). Select the correct coding approach.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f4bbee54-ab6e-47a1-9723-93f5e5bbd510', '8c6c23b5-7875-454b-99d7-e05a42009d16', 0, 'K25.4, T45.525A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8e5a0295-bae1-40a1-b0e2-9353ee6a2ee2', '8c6c23b5-7875-454b-99d7-e05a42009d16', 1, 'T45.525A, K25.4, B96.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1c051070-07a9-4ae7-acd7-28650c3f78e6', '8c6c23b5-7875-454b-99d7-e05a42009d16', 2, 'K25.4, B96.81, T45.525A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b855aa0d-a370-4401-bf24-5dbefe86038c', '8c6c23b5-7875-454b-99d7-e05a42009d16', 3, 'K25.4, T45.525A, B96.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8c6c23b5-7875-454b-99d7-e05a42009d16', '1c051070-07a9-4ae7-acd7-28650c3f78e6', 'K25.4 (gastric ulcer, chronic or unspecified, with hemorrhage) is sequenced first as the actual underlying disease process causing the bleed — this differs from the pure adverse-effect sequencing pattern used elsewhere in this paper, because here the anticoagulant is documented as a contributing SEVERITY factor to an independently-caused bleeding ulcer, not as the direct cause of the bleeding itself (H. pylori is the documented cause of the ulcer). B96.81 (Helicobacter pylori as the cause of disease classified elsewhere) is added to capture the documented infectious etiology of the ulcer. T45.525A (adverse effect of anticoagulants) is added last to flag the contributing anticoagulant factor — this sequencing (primary disease first, causative organism second, contributing drug effect third) reflects that the ulcer has its own independent, documented primary cause, unlike the purely drug-caused adverse-effect scenarios tested elsewhere in this paper where the drug IS the direct and sole cause.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ea3ac3e3-d214-4945-b541-8cf26fe3c3d1', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 99, 'A patient with Parkinson''s disease, without dyskinesia and without motor fluctuations, develops orthostatic hypotension, but unlike the earlier Parkinson''s question in this paper, the physician here explicitly attributes this specific patient''s orthostatic hypotension to a recently started alpha-blocker medication for benign prostatic hyperplasia, correctly dosed, rather than to the Parkinson''s disease itself. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f428c8fe-3f4e-4e64-8d9b-9c3b15b8e2ae', 'ea3ac3e3-d214-4945-b541-8cf26fe3c3d1', 0, 'G90.3, G20.A1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('16356d5c-e2ee-4e5b-a57e-412062d51ccb', 'ea3ac3e3-d214-4945-b541-8cf26fe3c3d1', 1, 'I95.1, G20.A1, N40.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5907f8a2-4578-41da-bf2f-236c4ffd892c', 'ea3ac3e3-d214-4945-b541-8cf26fe3c3d1', 2, 'T44.6X5A, I95.1, G20.A1, N40.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('117e3d24-3f5f-45be-b710-541e6453a5e7', 'ea3ac3e3-d214-4945-b541-8cf26fe3c3d1', 3, 'I95.1, T44.6X5A, N40.1, G20.A1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ea3ac3e3-d214-4945-b541-8cf26fe3c3d1', '5907f8a2-4578-41da-bf2f-236c4ffd892c', 'T44.6X5A (adverse effect of alpha-adrenoreceptor antagonists, initial encounter) is sequenced first per the adverse-effect convention, since the physician has specifically and explicitly re-attributed the orthostatic hypotension to the alpha-blocker medication rather than to Parkinson''s autonomic dysfunction — a deliberate contrast with the earlier Q17 in this paper, where the same symptom (orthostatic hypotension) was instead explicitly attributed to the Parkinson''s disease itself and coded as G90.3. I95.1 (orthostatic hypotension) follows as the manifestation. G20.A1 (Parkinson''s disease without dyskinesia, without mention of fluctuations) and N40.1 (BPH with lower urinary tract symptoms — the reason for the alpha-blocker) are added as the relevant background conditions, but G90.3 is NOT used here since the documented causal attribution this time is to the medication, not to Parkinson''s autonomic involvement — this pair of questions specifically tests whether a candidate mechanically pattern-matches ''Parkinson''s + orthostatic hypotension = G90.3'' regardless of what the documentation actually attributes the finding to.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1075b7ea-eaa6-46d5-91dc-a029da7937ec', 'c8871a0d-3e79-4fd5-bd79-79e6dedd8467', 100, 'A patient with a permanent tracheostomy (for chronic respiratory failure due to severe COPD) is admitted to home health for tracheostomy care and COPD management. During a visit, the nurse identifies peristomal skin breakdown around the tracheostomy site due to secretions, distinct from any tracheostomy tube malfunction. Select the correct principal diagnosis for this specific finding, and the correct approach to the underlying respiratory conditions.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6ade7764-c3e0-44eb-acf5-9272538e97b6', '1075b7ea-eaa6-46d5-91dc-a029da7937ec', 0, 'J95.00, Z93.0, J44.9, J96.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ddcf6c9a-995e-4099-b219-60be6fead994', '1075b7ea-eaa6-46d5-91dc-a029da7937ec', 1, 'L98.9, Z93.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7a21d08e-4078-4ee4-b11f-62063f0fd1da', '1075b7ea-eaa6-46d5-91dc-a029da7937ec', 2, 'J95.09, Z93.0, J44.9, J96.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('800a7b02-f62f-44f5-ae45-4be37ccfabad', '1075b7ea-eaa6-46d5-91dc-a029da7937ec', 3, 'J95.09, Z93.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1075b7ea-eaa6-46d5-91dc-a029da7937ec', '7a21d08e-4078-4ee4-b11f-62063f0fd1da', 'J95.09 (other tracheostomy complication) is the specific device-site complication code for peristomal skin breakdown related to a tracheostomy — L98.9 (unspecified skin disorder) would under-specify the documented device-related cause, and J95.00 (unspecified tracheostomy complication) would under-specify when a more specific code for this type of complication (J95.09) is available and matches the documented skin-related finding rather than a mechanical/obstructive one. Z93.0 (tracheostomy status) is added as the device-status code. J44.9 (COPD) and J96.11 (chronic respiratory failure with hypoxia — assuming that specificity is documented as the reason for the permanent trach) are added as the relevant, ongoing underlying respiratory conditions still being actively managed at this same encounter, sequenced after the specific acute finding driving this particular visit''s primary clinical concern.');

-- ---------- Paper 8: BCHH-C Practice Paper 8 ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order)
VALUES ('06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 'bchhc-practice-8', 'BCHH-C Practice Paper 8', 'bchhc', ARRAY['OASIS GG Scoring', 'PDGM Mechanics', 'CoP Edge Cases', 'Complex Combination Coding']::TEXT[], 100, 'advanced', true, 8);
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('91943f95-a803-4700-a04f-faede6bd18f2', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 1, 'At SOC, a patient scores GG0170C (Lying to Sitting on Side of Bed) as ''02 - Substantial/maximal assistance'' because two staff members were required. At the same SOC assessment, GG0170J (Walking 50 feet with two turns) is scored ''09 - Not attempted due to safety concerns.'' How does the ''09'' response for GG0170J factor into the functional impairment score used for PDGM case-mix?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f6086454-7b2e-48bd-bb52-affa8119c962', '91943f95-a803-4700-a04f-faede6bd18f2', 0, 'It is excluded entirely and does not contribute to the functional score');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('56b6a8fe-5b2e-4ab6-9d33-d3a24fd549bf', '91943f95-a803-4700-a04f-faede6bd18f2', 1, 'It is treated as the most dependent level of function for scoring purposes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0a809bed-ba48-42c1-b79b-d49c19cc342b', '91943f95-a803-4700-a04f-faede6bd18f2', 2, 'It defaults to ''06 - Independent'' since safety concerns imply the patient chose not to attempt it');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ca474111-daa2-4793-96f0-713d7d5683a6', '91943f95-a803-4700-a04f-faede6bd18f2', 3, 'It requires the assessment to be voided and repeated');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('91943f95-a803-4700-a04f-faede6bd18f2', '56b6a8fe-5b2e-4ab6-9d33-d3a24fd549bf', 'Under OASIS-E/GG-item scoring conventions used in PDGM functional impairment calculation, an activity ''not attempted due to safety concerns'' (response code 09 in this context) is treated as reflecting the most dependent level of function for case-mix purposes, not excluded from scoring — the logic being that an activity too unsafe to attempt reflects a genuinely severe functional limitation, arguably more severe than one attempted with maximal assistance, so it is scored accordingly rather than simply omitted from the functional impairment calculation.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e95ac289-334a-4312-9f01-322b67ca8dec', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 2, 'A patient''s clinical grouping under PDGM is determined primarily by which OASIS/claims data element at the start of each 30-day period?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('564699f5-8ded-472c-88fa-e70ed93867b8', 'e95ac289-334a-4312-9f01-322b67ca8dec', 0, 'The single ICD-10-CM code listed as the OASIS primary diagnosis (M1021), mapped to one of PDGM''s clinical groups');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1c3673f9-2645-4395-b3ba-673459a4a618', 'e95ac289-334a-4312-9f01-322b67ca8dec', 1, 'The total number of ICD-10-CM codes listed on the claim, regardless of which one');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d6053673-78d2-4413-930c-cadc611d9d0a', 'e95ac289-334a-4312-9f01-322b67ca8dec', 2, 'The therapy visit volume anticipated for the period');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('86377bf3-3358-4127-9d2d-a6f0edd2e582', 'e95ac289-334a-4312-9f01-322b67ca8dec', 3, 'The referring physician''s specialty');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e95ac289-334a-4312-9f01-322b67ca8dec', '564699f5-8ded-472c-88fa-e70ed93867b8', 'PDGM''s clinical grouping is determined by mapping the principal (primary) diagnosis reported on the claim — matching the OASIS M1021 primary diagnosis — to one of PDGM''s defined clinical groups (e.g., MMTA, Wound, Behavioral Health, Complex Nursing Interventions). This replaced the old PPS model''s therapy-visit-volume-driven case-mix calculation entirely — PDGM deliberately removed therapy visit thresholds as a payment driver, making option C a direct callback to the old (pre-PDGM) payment logic, a common point of confusion this tier specifically tests.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8e143d42-f397-4557-88ae-df65d67c7baa', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 3, 'A patient''s 30-day period includes both a primary diagnosis that maps to a PDGM clinical group AND several secondary diagnoses. Under what circumstance would one of those secondary diagnoses trigger a ''comorbidity adjustment'' (low or high) to the payment for that period?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1ad1a699-d333-4e1f-a552-79b4adb28aef', '8e143d42-f397-4557-88ae-df65d67c7baa', 0, 'Any secondary diagnosis automatically triggers a comorbidity adjustment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8c80394b-56f8-432b-9a4e-190d0b30549b', '8e143d42-f397-4557-88ae-df65d67c7baa', 1, 'Only if the secondary diagnosis appears on CMS''s defined comorbidity subgroup list and, for high comorbidity adjustment, at least two qualifying interacting conditions are both present');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5ec55061-9c1d-40e9-8ba2-84e607bb992d', '8e143d42-f397-4557-88ae-df65d67c7baa', 2, 'Comorbidity adjustments are determined solely by the number of medications the patient takes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5a03efe7-bd0e-43a0-8d07-e2de4ec5309e', '8e143d42-f397-4557-88ae-df65d67c7baa', 3, 'Comorbidity adjustments apply only during the second 30-day period of a 60-day episode, never the first');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8e143d42-f397-4557-88ae-df65d67c7baa', '8c80394b-56f8-432b-9a4e-190d0b30549b', 'PDGM''s comorbidity adjustment (none/low/high) is based on whether reported secondary diagnoses fall into CMS-defined comorbidity subgroups — a single qualifying condition from the list can trigger a ''low'' adjustment, while ''high'' comorbidity adjustment requires two specific, interacting conditions from designated subgroups to both be present, reflecting genuinely additive clinical complexity. This applies to either 30-day period within a 60-day episode equally — there''s no rule limiting comorbidity adjustment to only the second period, making option D a plausible-sounding but incorrect distractor.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('49131094-a000-4829-ae74-46427eea1fe0', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 4, 'Per the Medicare home health Conditions of Participation, a patient''s comprehensive assessment (OASIS) at recertification must occur within what timeframe relative to the end of the current certification period?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('da9c66f8-f638-4ec1-a561-f751b322f533', '49131094-a000-4829-ae74-46427eea1fe0', 0, 'Any time during the current 60-day certification period');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8303fefd-9dbb-4899-af5d-7562828b6d35', '49131094-a000-4829-ae74-46427eea1fe0', 1, 'During the last 5 days of the certification period (days 56-60 of a standard 60-day period)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e55b8d14-c504-4680-893a-24ee7708eb2c', '49131094-a000-4829-ae74-46427eea1fe0', 2, 'Exactly on day 60');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f7e6f52d-206e-4308-a1ce-6bdc1f64ce74', '49131094-a000-4829-ae74-46427eea1fe0', 3, 'Within 48 hours after the certification period ends');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('49131094-a000-4829-ae74-46427eea1fe0', '8303fefd-9dbb-4899-af5d-7562828b6d35', 'The recertification comprehensive assessment must be completed during the last 5 days of the current 60-day certification period (i.e., days 56 through 60) — this specific 5-day window is a well-established CoP/OASIS timing requirement, distinct from the SOC timing rule (within 5 calendar days of the SOC date) and the ROC timing rule (within 2 calendar days of the qualifying inpatient discharge or the physician-established ROC date, whichever is later).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fad5b3dc-2a21-4a19-b16b-67a911fdbf81', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 5, 'A home health agency''s QAPI (Quality Assessment and Performance Improvement) program, per CoP requirements, must include performance improvement projects addressing which of the following?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('08fb39bc-34f5-480e-a3a6-6903a704a40e', 'fad5b3dc-2a21-4a19-b16b-67a911fdbf81', 0, 'Only complaints formally filed by patients with CMS');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6e072548-d4c4-4544-a596-29c80c1aeb4e', 'fad5b3dc-2a21-4a19-b16b-67a911fdbf81', 1, 'Data-driven, agency-wide quality indicators including adverse events, and must involve all disciplines providing care within the agency');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d7219d83-222c-4da6-8859-f13c6c6355a9', 'fad5b3dc-2a21-4a19-b16b-67a911fdbf81', 2, 'Only issues identified during a state survey, with no other ongoing internal review requirement');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a36b7b00-4df8-4a4c-9c9e-ab9f70c6921e', 'fad5b3dc-2a21-4a19-b16b-67a911fdbf81', 3, 'Only financial performance metrics');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fad5b3dc-2a21-4a19-b16b-67a911fdbf81', '6e072548-d4c4-4544-a596-29c80c1aeb4e', 'The CoP QAPI requirement (42 CFR 484.65) mandates an ongoing, agency-wide, data-driven quality program that tracks adverse events and other quality indicators, involving all the disciplines providing care within the agency (not just nursing or just administration) — it is not limited to reacting to formal CMS complaints or state survey findings, and it is a continuous internal program, not merely a response mechanism to external triggers.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b9230185-3636-49c8-8619-b6ab2fe4f7ae', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 6, 'Per Medicare CoPs, a home health agency''s emergency preparedness plan must address which of the following as a required element?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3c2f3dda-be99-4d20-a3bb-3cfc87bcf34c', 'b9230185-3636-49c8-8619-b6ab2fe4f7ae', 0, 'A policy addressing patient tracking and communication with authorities during an emergency, plus procedures for continuity of operations');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9f269f3b-24e2-44b9-a5f0-6e193009f0f5', 'b9230185-3636-49c8-8619-b6ab2fe4f7ae', 1, 'Emergency preparedness plans are only required for agencies operating in federally designated hurricane zones');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0d397fc1-87f3-473d-beb1-fc4eaec14671', 'b9230185-3636-49c8-8619-b6ab2fe4f7ae', 2, 'Only fire-safety-specific procedures, since other emergencies are covered by local government responsibility');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('51d381e7-bd54-45c4-9690-fccb47ce3ace', 'b9230185-3636-49c8-8619-b6ab2fe4f7ae', 3, 'A generic reference to ''911'' is sufficient documentation of the emergency plan');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b9230185-3636-49c8-8619-b6ab2fe4f7ae', '3c2f3dda-be99-4d20-a3bb-3cfc87bcf34c', 'The CMS Emergency Preparedness CoP (42 CFR 484.102, part of the broader emergency preparedness rule applying across Medicare-participating provider types) requires a comprehensive, all-hazards emergency plan addressing patient tracking/locating, communication plans with local/state authorities, and continuity-of-operations procedures — this applies to all Medicare-certified home health agencies regardless of geographic disaster-risk profile, not just agencies in specific high-risk zones.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('55d96553-d575-48e1-ab3d-3239d52c5a4f', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 7, 'A patient''s clinical record must include documentation supporting their eligibility for the home health benefit, including that the patient is ''confined to the home'' (homebound). Which of the following, per CMS homebound criteria, would NOT by itself disqualify a patient from homebound status?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('15beaf59-091b-478b-b911-76fcc675f5f7', '55d96553-d575-48e1-ab3d-3239d52c5a4f', 0, 'Attending religious services on an infrequent basis');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('937ef71c-3741-4210-8cee-7f1716026297', '55d96553-d575-48e1-ab3d-3239d52c5a4f', 1, 'Working a full-time job outside the home five days a week');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('200c245a-0b6b-43b3-9a2b-e0e4ee5f688b', '55d96553-d575-48e1-ab3d-3239d52c5a4f', 2, 'Regularly attending an outpatient gym for unsupervised general fitness with no medical necessity documented');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a9c652f1-cc36-4cbb-a4cb-c2adf9703707', '55d96553-d575-48e1-ab3d-3239d52c5a4f', 3, 'Taking a vacation trip requiring air travel');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('55d96553-d575-48e1-ab3d-3239d52c5a4f', '15beaf59-091b-478b-b911-76fcc675f5f7', 'CMS homebound criteria specifically allow for infrequent, short-duration absences such as attending religious services, medical appointments, or adult day care, without disqualifying a patient from homebound status, because these are recognized as normal, limited exceptions consistent with the homebound definition''s intent — a patient regularly and independently attending full-time work, unsupervised general fitness activities, or taking discretionary vacation travel all represent patterns of absence and functional capacity inconsistent with the ''considerable and taxing effort'' standard homebound status requires.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('224f5598-07bd-4c4a-b133-4c07d61d0cfa', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 8, 'A patient sustains a second-degree (partial thickness) burn covering approximately 12% of total body surface area, involving the right arm and anterior trunk, from a household kitchen accident (hot oil spill). Select the correct coding, including TBSA percentage coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('513b98f3-06dd-4880-ac68-42191c444aab', '224f5598-07bd-4c4a-b133-4c07d61d0cfa', 0, 'T22.211A, T21.21XA, T31.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fbcda69e-a53f-43cd-9d32-a6b29d44f2fd', '224f5598-07bd-4c4a-b133-4c07d61d0cfa', 1, 'T22.211A, T21.21XA, T31.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8622b710-d5ed-419a-8300-6d0ab1b89bab', '224f5598-07bd-4c4a-b133-4c07d61d0cfa', 2, 'T21.21XA, T22.211A, T31.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6a8ea98b-41ef-45c3-a24d-986859a2fec9', '224f5598-07bd-4c4a-b133-4c07d61d0cfa', 3, 'T31.10, T22.211A, T21.21XA');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('224f5598-07bd-4c4a-b133-4c07d61d0cfa', '513b98f3-06dd-4880-ac68-42191c444aab', 'T22.211A (burn of second degree of right forearm, initial encounter) and T21.21XA (burn of second degree of trunk, initial encounter) are both coded to reflect the two distinct documented burn sites (arm and trunk), sequenced by convention with the site burns first. T31.10 (burns involving 10-19% of body surface with 10-19% third degree burns) — actually this specific TBSA code requires matching the THIRD-DEGREE percentage specifically, not overall TBSA; since this is a second-degree-only burn (no third-degree component documented), the T31 code should reflect 0% third-degree involvement paired with the 10-19% total TBSA band, which is T31.10 (10-19% total, 0% third degree) — this is the correct choice since T31.11 would incorrectly imply 10-19% third-degree involvement, which isn''t documented here.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a393db3c-02e9-4ea4-83c1-707c628ff312', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 9, 'A patient with a third-degree burn to 8% of the body surface (isolated to the left hand) and a separate second-degree burn to 15% of the body surface (bilateral legs), both from a house fire, is now home for wound care and rehabilitation. What is the correct TBSA combination code reflecting BOTH the total body surface involved and the third-degree-specific percentage?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('54bd52b6-c3e8-4644-b8e1-977c39357488', 'a393db3c-02e9-4ea4-83c1-707c628ff312', 0, 'T31.23');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1defc6c8-2c08-41b0-be28-e1c8d2300e17', 'a393db3c-02e9-4ea4-83c1-707c628ff312', 1, 'T31.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('28900690-9d25-4f7b-8fb7-fa98147d1413', 'a393db3c-02e9-4ea4-83c1-707c628ff312', 2, 'T31.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ea8640d6-d219-4d8b-b0d1-7cb84133588e', 'a393db3c-02e9-4ea4-83c1-707c628ff312', 3, 'T31.11');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a393db3c-02e9-4ea4-83c1-707c628ff312', '1defc6c8-2c08-41b0-be28-e1c8d2300e17', 'T31 codes have two independent percentage axes packed into one code: the overall TBSA band (the ''2'' in T31.2-, meaning 20-29% total body surface) and a separate third-degree-specific sub-band (the final digit). Total TBSA here is 8% (third-degree) + 15% (second-degree) = 23%, placing it in the 20-29% total band. The third-degree-specific percentage is 8% alone, which falls in the ''0-9% third degree'' sub-band — giving T31.20 (20-29% total body surface, 0-9% of which is third degree), not T31.23 (which would incorrectly imply 30-39% third-degree involvement) or T31.11/T31.21 (both wrong total-TBSA bands). This tests whether a candidate correctly treats the two percentage axes independently rather than assuming the final digit simply restates the total-TBSA band.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('65a2012f-bdbe-46e7-9e19-5fa5d6bb3441', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 10, 'A patient with peripheral neuropathy is accidentally given double the prescribed dose of gabapentin by a caregiver due to a labeling misunderstanding — the patient did not intend to take the wrong dose, and the physician did not prescribe this dose. The patient becomes excessively sedated as a result. Select the correct coding approach for this medication error.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5bcf5473-a279-46b2-b273-c802254021e3', '65a2012f-bdbe-46e7-9e19-5fa5d6bb3441', 0, 'T42.6X5A, R40.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('720d796a-9859-4164-97d8-1e079cf82b16', '65a2012f-bdbe-46e7-9e19-5fa5d6bb3441', 1, 'T42.6X1A, R40.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1fe7d502-8926-427a-ba78-80d696aab2cb', '65a2012f-bdbe-46e7-9e19-5fa5d6bb3441', 2, 'T42.6X4A, R40.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e05d954e-c40f-4b6f-8b94-24d7574c73c0', '65a2012f-bdbe-46e7-9e19-5fa5d6bb3441', 3, 'T42.6X2A, R40.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('65a2012f-bdbe-46e7-9e19-5fa5d6bb3441', '720d796a-9859-4164-97d8-1e079cf82b16', 'T42.6X1A (poisoning by other antiepileptic and sedative-hypnotic drugs, accidental (unintentional), initial encounter) is correct because this was an unintentional dosing ERROR (a caregiver''s labeling mistake resulting in the wrong dose being given), not a correctly-prescribed-and-taken medication producing an unexpected reaction — this is the key fact pattern distinguishing poisoning from adverse effect throughout this exam series: an adverse effect requires the drug to have been taken exactly as prescribed, which explicitly did NOT happen here. T42.6X5A (adverse effect) would be wrong for exactly this reason. T42.6X4A (undetermined intent) is inappropriate since the accidental nature is clearly established, not ambiguous. T42.6X2A (intentional self-harm) is wrong since there''s no indication of intent to self-harm.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fbefec07-63d0-4188-afcf-a51c349f5d14', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 11, 'A patient intentionally takes more than their prescribed dose of their own antidepressant in a documented suicide attempt, is hospitalized, stabilizes, and is now on home health for psychiatric follow-up and medication safety monitoring, with the physician documenting the ingestion as intentional self-harm. Select the correct coding for the poisoning event.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f6cc71cf-20ad-46fd-b2ec-aa928a734ccf', 'fbefec07-63d0-4188-afcf-a51c349f5d14', 0, 'T43.222A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9cc263b7-7b92-4687-8be7-4c6e728380f6', 'fbefec07-63d0-4188-afcf-a51c349f5d14', 1, 'T43.221A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b8b46a35-3504-4454-a6f5-fae0ccc9208f', 'fbefec07-63d0-4188-afcf-a51c349f5d14', 2, 'T43.225A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2f45f5d7-e295-4193-9fcc-02d81f48a36f', 'fbefec07-63d0-4188-afcf-a51c349f5d14', 3, 'T43.224A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fbefec07-63d0-4188-afcf-a51c349f5d14', '9cc263b7-7b92-4687-8be7-4c6e728380f6', 'T43.221A (poisoning by selective serotonin reuptake inhibitors, intentional self-harm, initial encounter) matches the documented facts precisely: an SSRI, taken in excess of the prescribed dose, with intentional self-harm explicitly documented. T43.225A (adverse effect) would be wrong since this was NOT a correctly-dosed medication — it was taken in excess intentionally. T43.224A (undetermined intent) is inappropriate given the clearly documented intentional self-harm. T43.222A (a different 5th-character intent variant) does not match the intentional-self-harm classification documented here.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cbc10b41-b40d-4e7f-b8ba-bed37ddc2db6', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 12, 'A home health patient develops a stage 2 pressure injury on the sacrum. Two weeks later at a follow-up (non-OASIS) visit, the wound has deteriorated to a stage 3 with additional undermining. What should happen with the ICD-10-CM code at this point, and does this differ from the earlier Paper 7 example of a wound IMPROVING?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('443ade18-1b4a-45b1-87e9-4b1ecfdc7f2d', 'cbc10b41-b40d-4e7f-b8ba-bed37ddc2db6', 0, 'The code should be updated to reflect the new, more severe stage 3 at this point, using the same current-status principle as wound improvement — worsening and improving are treated identically under this convention');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9ea8fded-d725-42b3-b9c4-517f456e869a', 'cbc10b41-b40d-4e7f-b8ba-bed37ddc2db6', 1, 'Only improving wounds get their codes updated; a worsening wound keeps the original stage code until the next OASIS timepoint');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('82c98367-b81a-4809-99bb-2daa0339b57f', 'cbc10b41-b40d-4e7f-b8ba-bed37ddc2db6', 2, 'A new wound episode must be opened with a new principal diagnosis');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3bd3a8c3-a504-466a-ba0b-1a863297fbc3', 'cbc10b41-b40d-4e7f-b8ba-bed37ddc2db6', 3, 'Stage progression cannot be coded without a physician co-signature separate from the nursing documentation');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cbc10b41-b40d-4e7f-b8ba-bed37ddc2db6', '443ade18-1b4a-45b1-87e9-4b1ecfdc7f2d', 'This confirms and extends the current-status pressure-ulcer-staging principle established in Paper 7: ICD-10-CM pressure ulcer/injury staging reflects the CURRENT clinical stage at time of documentation, regardless of whether the wound is improving or worsening — a wound deteriorating from stage 2 to stage 3 gets its code updated to the new, more severe stage using the identical logic as an improving wound getting downgraded, since the underlying rule (code current stage, not historical best/worst) applies symmetrically in both directions, not asymmetrically favoring only one direction of change.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2652e994-55c8-418d-b0b4-c68b4b8ee8ff', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 13, 'A patient with type 2 diabetes has diabetic macular edema (right eye) with proliferative diabetic retinopathy, confirmed by ophthalmology, requiring close vision monitoring integrated into the home health plan of care. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8e0f1888-59a5-4464-bb2e-8e0030bbf726', '2652e994-55c8-418d-b0b4-c68b4b8ee8ff', 0, 'E11.359, E11.311');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a0d23bae-9fb4-4586-8e76-8c405c2fd291', '2652e994-55c8-418d-b0b4-c68b4b8ee8ff', 1, 'E11.311, E11.359');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ba12b6ae-ec7f-4088-b086-ace98e2b1c7d', '2652e994-55c8-418d-b0b4-c68b4b8ee8ff', 2, 'E11.3511');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b0c47859-37ad-43e9-b6a6-7ff70f0ea8c2', '2652e994-55c8-418d-b0b4-c68b4b8ee8ff', 3, 'E11.9, H35.052');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2652e994-55c8-418d-b0b4-c68b4b8ee8ff', 'ba12b6ae-ec7f-4088-b086-ace98e2b1c7d', 'E11.3511 (type 2 diabetes with proliferative diabetic retinopathy with macular edema, right eye) is a single, more specific combination code that captures BOTH the proliferative retinopathy type AND the macular edema together in one code — using two separate less-specific codes (E11.359 for unspecified retinopathy type plus E11.311 for a different, non-proliferative retinopathy-with-macular-edema code) would both under-code the documented proliferative type and create redundant/conflicting retinopathy-type coding. This tests whether a candidate knows the more specific single combination code exists for proliferative-retinopathy-with-macular-edema specifically, rather than defaulting to combining two separate, less precise codes.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b5b890e2-fe66-4c60-811d-7da965e831c9', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 14, 'A patient with congestive heart failure and a documented recent unintentional 8% body weight loss over 3 months, with the physician specifically attributing this to poor oral intake related to depression rather than to the heart failure or any GI pathology, is admitted to home health. Select the correct coding for the weight loss finding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8a35af30-ed85-4ea9-b76a-2ab335329ef1', 'b5b890e2-fe66-4c60-811d-7da965e831c9', 0, 'R63.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('afb73e86-7a7c-426d-a336-b3a70f11f03b', 'b5b890e2-fe66-4c60-811d-7da965e831c9', 1, 'R64');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4b603d04-8e62-4236-a7b1-132c95e7af29', 'b5b890e2-fe66-4c60-811d-7da965e831c9', 2, 'No separate code needed since it''s attributed to depression, which is already coded');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9f90ae98-8a8d-4c95-8f4c-fb59773870d1', 'b5b890e2-fe66-4c60-811d-7da965e831c9', 3, 'E44.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b5b890e2-fe66-4c60-811d-7da965e831c9', '8a35af30-ed85-4ea9-b76a-2ab335329ef1', 'R63.4 (abnormal weight loss) is the specific finding code for the documented, clinically significant unintentional weight loss — even though the physician has identified a likely contributing cause (depression-related poor intake), the weight loss itself remains a separately codable, clinically relevant finding actively being monitored, not automatically subsumed into the depression diagnosis code. R64 (cachexia) would over-code this as a specific wasting syndrome, which isn''t the documented diagnosis here (an 8% weight loss over 3 months, while significant, doesn''t necessarily meet a full cachexia diagnostic picture without further documented criteria). E44.1 (mild protein-calorie malnutrition) would require documentation of an actual malnutrition diagnosis with defining nutritional criteria, not simply the weight loss finding alone.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2a526710-ca2b-474b-89f0-aa558d66cb0a', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 15, 'During a home health visit, the RN observes the patient''s medication list includes a discontinued medication still being taken by the patient (the patient wasn''t informed of the discontinuation clearly at the last physician visit). The nurse identifies and corrects this medication discrepancy. Per CoP care coordination requirements, what is required?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e654475e-e16c-49e1-b661-486c2c9add84', '2a526710-ca2b-474b-89f0-aa558d66cb0a', 0, 'The nurse should independently instruct the patient to stop the medication and document only in the visit note, with no further action needed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('efa37e2d-6ed8-46b0-a4b9-2f734dcd89b1', '2a526710-ca2b-474b-89f0-aa558d66cb0a', 1, 'The discrepancy must be reported to and reconciled with the physician, and the medication reconciliation process/findings must be documented as part of ongoing care coordination');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bd7e9e92-5434-4559-8f15-8bf8e3b5b325', '2a526710-ca2b-474b-89f0-aa558d66cb0a', 2, 'The pharmacy alone is responsible for catching this type of error, not home health');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0978dced-4d20-44dc-b654-e010c108e2a5', '2a526710-ca2b-474b-89f0-aa558d66cb0a', 3, 'This type of discrepancy does not need to be reported unless it caused an adverse event');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2a526710-ca2b-474b-89f0-aa558d66cb0a', 'efa37e2d-6ed8-46b0-a4b9-2f734dcd89b1', 'Medication reconciliation and communication of discrepancies to the ordering physician is a core, ongoing care coordination requirement under the CoPs (42 CFR 484.60''s care coordination and communication requirements) — a nurse identifying a medication discrepancy must reconcile it with the physician and document the finding/resolution as part of care coordination, not simply instruct the patient unilaterally and move on, and not wait until an adverse event has already occurred before reporting a known discrepancy.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('10618613-386b-4e43-a2d1-3c6e972f059f', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 16, 'A home health patient''s clinical record must document evidence of patient/caregiver education on the plan of care. Per CoP patient rights and care planning requirements, which of the following best describes the required standard for this education?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b1fdfe60-18a4-4d41-9283-c690ebeca23c', '10618613-386b-4e43-a2d1-3c6e972f059f', 0, 'Generic printed handouts satisfy the requirement regardless of content relevance');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c4662e2b-9b62-425c-abd0-d009fb79a3d4', '10618613-386b-4e43-a2d1-3c6e972f059f', 1, 'Education must be individualized to the patient''s specific plan of care, and the patient/caregiver''s understanding should be assessed and documented, not merely that materials were handed out');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('98835e13-6f81-41d8-84c1-a721cca1e039', '10618613-386b-4e43-a2d1-3c6e972f059f', 2, 'Education documentation is optional if the patient has family present at every visit');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9fd74544-6e0a-4124-88e2-f37ed6c13287', '10618613-386b-4e43-a2d1-3c6e972f059f', 3, 'Only physician-delivered education counts toward this requirement');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('10618613-386b-4e43-a2d1-3c6e972f059f', 'c4662e2b-9b62-425c-abd0-d009fb79a3d4', 'CoP requirements around patient/caregiver education (tied to the care planning and patient rights provisions) require individualized education specific to the patient''s actual plan of care and clinical needs, with documentation reflecting an assessment of the patient/caregiver''s understanding — not simply a record that generic materials were distributed. This is a genuinely meaningful distinction from a compliance-checkbox mentality (handing out a pamphlet) versus the actual required standard (individualized teaching with an understanding check), which is what surveyors and QAPI reviews are looking for.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('501212fe-1617-4d22-be2d-5a02863f3d6c', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 17, 'A patient with chronic kidney disease stage 3b and type 2 diabetes with diabetic nephropathy has BOTH conditions contributing to the same kidney disease process, per physician documentation (''CKD due to both long-standing diabetes and independently progressive age-related nephrosclerosis, both contributing''). Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1e672866-c9fe-4c0e-ad2d-b2807bc1f97b', '501212fe-1617-4d22-be2d-5a02863f3d6c', 0, 'E11.22, N18.32');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('99f072d8-5bba-48ef-bc37-8e38bd4bbb92', '501212fe-1617-4d22-be2d-5a02863f3d6c', 1, 'N18.32, E11.22');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9977bafd-1335-475b-94dc-b79dd25d2d43', '501212fe-1617-4d22-be2d-5a02863f3d6c', 2, 'E11.22, N18.32, N26.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8a5f5fb9-e8be-4ddc-b7c5-bb5b3c612c11', '501212fe-1617-4d22-be2d-5a02863f3d6c', 3, 'E11.9, N18.32');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('501212fe-1617-4d22-be2d-5a02863f3d6c', '1e672866-c9fe-4c0e-ad2d-b2807bc1f97b', 'E11.22 (type 2 diabetes with diabetic chronic kidney disease) is sequenced first per the standard diabetes-CKD combination-code convention established in Paper 7 (Q1). N18.32 (CKD stage 3b) is added for the specific stage. N26.9 (unspecified renal sclerosis) is not separately added here — even though the physician mentions a second contributing factor (nephrosclerosis), ICD-10-CM does not require or support stacking an additional renal-sclerosis code on top of the diabetes-CKD combination code when the diabetic component is the documented, codeable etiology already captured by E11.22; adding a redundant generic renal code doesn''t change the case-mix-relevant clinical picture already captured by the combination code and stage code together.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6170800b-c85a-4f55-9665-e5c0de9ad4a9', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 18, 'A home health patient''s OASIS at SOC documents a NPWT (negative pressure wound therapy) device in use for a surgical wound. Three weeks later, at a non-OASIS follow-up visit, the wound has closed and the NPWT device is discontinued per physician order. How should this device discontinuation be reflected in the record?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1ee02a98-0653-4ebb-beaf-2cf068010707', '6170800b-c85a-4f55-9665-e5c0de9ad4a9', 0, 'The visit note should document the discontinuation and the wound''s closed status; formal OASIS items reflecting device use will update at the next required OASIS collection timepoint');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('075c80d5-e76c-46b8-a515-63f9517c77d5', '6170800b-c85a-4f55-9665-e5c0de9ad4a9', 1, 'A new SOC OASIS must be completed immediately upon device discontinuation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ff4fa772-1f8e-4ad8-a2e7-dc81eb0a06fb', '6170800b-c85a-4f55-9665-e5c0de9ad4a9', 2, 'No documentation is needed since the device was already noted at SOC');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('92461dfa-afbe-4326-8919-81f4a0de2e39', '6170800b-c85a-4f55-9665-e5c0de9ad4a9', 3, 'The discontinuation requires a physician office visit before it can be documented at home');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6170800b-c85a-4f55-9665-e5c0de9ad4a9', '1ee02a98-0653-4ebb-beaf-2cf068010707', 'This applies the same OASIS-timepoint-vs-routine-visit-documentation principle established in Paper 7 (Q44''s grooming discrepancy question) — device status changes identified at a non-OASIS visit are documented in that visit''s clinical note, with the formal OASIS item set updating at the next actual OASIS collection timepoint (recertification, ROC, or discharge), not requiring an immediately-triggered new SOC assessment, which is reserved for genuinely new starts of care, not device status changes within an ongoing episode.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f35995c1-a9c0-4d13-b6ef-6f0e2737d5b4', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 19, 'A patient with severe COPD has chronic respiratory failure requiring continuous home oxygen and BiPAP at night. The physician''s documentation specifies ''chronic respiratory failure with both hypoxia and hypercapnia.'' Select the correct combination code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('83b4bca0-7ea8-40e1-9c3d-1d4d02ff1d24', 'f35995c1-a9c0-4d13-b6ef-6f0e2737d5b4', 0, 'J96.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f4625b97-5aa3-4fe9-ad2f-c2cf8dc33fb8', 'f35995c1-a9c0-4d13-b6ef-6f0e2737d5b4', 1, 'J96.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ad72f0dd-f0e8-4c5c-ae01-0fab1125530d', 'f35995c1-a9c0-4d13-b6ef-6f0e2737d5b4', 2, 'J96.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('693088c5-8596-4296-bbba-a5b5f76bb5c5', 'f35995c1-a9c0-4d13-b6ef-6f0e2737d5b4', 3, 'J96.20');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f35995c1-a9c0-4d13-b6ef-6f0e2737d5b4', 'f4625b97-5aa3-4fe9-ad2f-c2cf8dc33fb8', 'J96.12 (chronic respiratory failure with hypoxia and hypercapnia) is the specific code matching the documented combination of BOTH findings — J96.11 (hypoxia alone) and a hypothetical hypercapnia-alone code would each under-code the documented dual presentation. J96.10 (chronic respiratory failure, unspecified whether with hypoxia or hypercapnia) would under-code the documented specificity. J96.20 is a distractor from the acute-and-chronic combined respiratory failure family, not matching this purely chronic presentation.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('077a874c-156b-48b1-97b0-f1d49172b4f3', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 20, 'A patient with a recent above-knee amputation (right leg) for gas gangrene from a severe diabetic foot infection is now on home health for stump care and prosthetic evaluation. The gas gangrene infection has fully resolved with the amputation as definitive treatment. Select the correct principal diagnosis and address whether the gas gangrene should still be coded.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fa16f85e-1092-45ae-8166-2d9f038dcf20', '077a874c-156b-48b1-97b0-f1d49172b4f3', 0, 'A48.0, Z89.611, E11.52');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('16bb7b5b-bab7-4f93-9666-356886ada794', '077a874c-156b-48b1-97b0-f1d49172b4f3', 1, 'Z89.611, E11.52');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('005857f4-c2e0-4af6-bf92-115a296950f6', '077a874c-156b-48b1-97b0-f1d49172b4f3', 2, 'A48.0, Z89.611');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('35088e75-5190-4495-8c73-93dbc6c48199', '077a874c-156b-48b1-97b0-f1d49172b4f3', 3, 'Z89.611, A48.0, E11.52');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('077a874c-156b-48b1-97b0-f1d49172b4f3', '16bb7b5b-bab7-4f93-9666-356886ada794', 'Since the gas gangrene infection has fully resolved with the amputation serving as definitive, curative treatment, A48.0 (gas gangrene, an ACTIVE infection code) is NOT coded going forward — this mirrors the resolved-condition-not-recoded principle established multiple times in this exam series (e.g., resolved cardiogenic shock, resolved DKA in Paper 7). Z89.611 (acquired absence of right leg above knee) is coded as the current status. E11.52 (type 2 diabetes with diabetic peripheral angiopathy with gangrene) is more nuanced — since the underlying diabetic vascular disease that predisposed to the infection is a chronic, ongoing condition (not resolved by the amputation itself), it remains appropriately coded as an active, ongoing diabetic complication requiring continued management, distinct from the acute infection itself which is resolved.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bf438093-6736-4c21-84a1-a08eccd3608d', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 21, 'A patient with chronic atrial fibrillation develops a new, symptomatic bradycardia while on a beta-blocker and an antiarrhythmic simultaneously, with the physician documenting this as a combined additive effect of both correctly-dosed medications requiring dose adjustment. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bf8265d3-4947-4866-bdbb-2704258f253d', 'bf438093-6736-4c21-84a1-a08eccd3608d', 0, 'T44.7X5A, T46.2X5A, R00.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4c0842b1-279e-4ed0-9e27-4d36a0efae4f', 'bf438093-6736-4c21-84a1-a08eccd3608d', 1, 'R00.1, T44.7X5A, T46.2X5A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ef2f0976-a7bd-4fe5-8e7f-986b4f7505ff', 'bf438093-6736-4c21-84a1-a08eccd3608d', 2, 'T44.7X5A, R00.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ce520376-20fd-480d-afe1-951bda3ebe64', 'bf438093-6736-4c21-84a1-a08eccd3608d', 3, 'T46.2X5A, R00.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('bf438093-6736-4c21-84a1-a08eccd3608d', 'bf8265d3-4947-4866-bdbb-2704258f253d', 'Both adverse-effect codes are required since the physician explicitly documents a combined/additive effect of two separately-prescribed drug classes — T44.7X5A (adverse effect of beta-adrenoreceptor antagonists) and T46.2X5A (adverse effect of other antidysrhythmic drugs) — this mirrors the dual-drug adverse-effect pattern already established in Paper 7''s ACE-inhibitor/NSAID kidney injury question (Q13), applying the same ''two independently causal drugs, both coded'' logic to a cardiac-medication combination instead. R00.1 (bradycardia) is the resulting manifestation, sequenced after both drug-effect codes.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d4a3ae07-6065-4418-9858-eaac49642a5f', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 22, 'A patient''s home health record must reflect that the patient (or legal representative) received and acknowledged the agency''s written notice of patient rights, including the right to be informed of the plan of care, right to refuse treatment, and right to file a complaint. If a cognitively impaired patient without a legal representative cannot understand or acknowledge this notice, what is the CoP-compliant approach?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0dd30baf-811b-4a9b-a063-ac663cf6e5b9', 'd4a3ae07-6065-4418-9858-eaac49642a5f', 0, 'The notice requirement is waived entirely for cognitively impaired patients');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5d51d100-25ef-4a2c-8e2d-85e6f940aca1', 'd4a3ae07-6065-4418-9858-eaac49642a5f', 1, 'The agency should notify and provide the information to a family member/caregiver involved in care, and document the patient''s cognitive status and the steps taken, rather than simply skipping the requirement');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8aefc3bf-d5b2-429c-9f9f-5acb7fe61359', 'd4a3ae07-6065-4418-9858-eaac49642a5f', 2, 'The agency should refuse to admit the patient until a legal guardian is appointed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0fa58963-713f-4fdb-a9a9-ef361416f09b', 'd4a3ae07-6065-4418-9858-eaac49642a5f', 3, 'A verbal notice given once, without any documentation, is sufficient');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d4a3ae07-6065-4418-9858-eaac49642a5f', '5d51d100-25ef-4a2c-8e2d-85e6f940aca1', 'When a patient cannot understand or acknowledge their rights due to cognitive impairment and has no legal representative on record, CoP-compliant practice is to involve and provide the information to an available family member or caregiver participating in care, while documenting the patient''s cognitive status and the steps taken to attempt to convey this information — the requirement is not simply waived, and admission should not be unnecessarily blocked pending formal guardianship when reasonable alternative notification steps can be taken and documented.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b70ddd87-442e-453d-923d-66c82a7c42c1', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 23, 'A patient with generalized anxiety disorder is found by the home health nurse to have stopped taking their prescribed anxiolytic medication without physician knowledge, and now presents with rebound anxiety symptoms. Select the correct coding for this presentation, addressing whether stopping a medication without physician guidance constitutes an adverse effect, poisoning, or something else entirely.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9e098c5a-48ae-4dbf-b5eb-896c6fe2495f', 'b70ddd87-442e-453d-923d-66c82a7c42c1', 0, 'T43.502A, F41.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fc1671a3-97a6-46b9-8683-7b70fa5594d1', 'b70ddd87-442e-453d-923d-66c82a7c42c1', 1, 'F41.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5acef429-4491-4338-9999-ad35f2b7a93a', 'b70ddd87-442e-453d-923d-66c82a7c42c1', 2, 'Z91.14, F41.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2bcc516c-31d8-4b6b-8b52-c76bda6e8056', 'b70ddd87-442e-453d-923d-66c82a7c42c1', 3, 'T43.505A, F41.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b70ddd87-442e-453d-923d-66c82a7c42c1', '5acef429-4491-4338-9999-ad35f2b7a93a', 'Z91.14 (patient''s noncompliance with medication regimen) is the correct additional code to flag the documented medication non-adherence as a relevant clinical/behavioral factor — this scenario is neither an adverse effect (T43.505A, which requires the drug to have caused a reaction while being correctly taken — the opposite of what happened here) nor a poisoning (T43.502A, which requires an actual excess/wrong-dose ingestion event, not simply stopping a medication). F41.1 (generalized anxiety disorder) remains coded as the underlying condition now presenting with rebound symptoms due to the discontinuation. This tests whether a candidate correctly recognizes that NOT taking a medication as prescribed falls into an entirely different Z-code category (noncompliance) rather than being forced into the adverse-effect/poisoning framework that applies specifically to drugs that WERE taken.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('745fbc61-3342-4d51-be6c-ae74b65a9b89', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 24, 'A patient with a recent CABG has a documented new finding of postoperative atrial fibrillation, a well-recognized common complication following cardiac surgery, occurring on postoperative day 3, now being managed at home with rate control medication. Select the correct coding, including whether this should be flagged as a postprocedural complication.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ec704404-cbe6-40f5-942b-139df164fef1', '745fbc61-3342-4d51-be6c-ae74b65a9b89', 0, 'I48.91, Z98.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3c1af1b2-4919-4192-9c43-a6286387e7e2', '745fbc61-3342-4d51-be6c-ae74b65a9b89', 1, 'I97.191, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('df6c779b-9ad6-49dc-8de6-535b3ee13ca8', '745fbc61-3342-4d51-be6c-ae74b65a9b89', 2, 'I48.91, Z95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('120ec2cb-deb1-4d97-a06f-0449ac69253c', '745fbc61-3342-4d51-be6c-ae74b65a9b89', 3, 'I97.120, I48.91, Z95.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('745fbc61-3342-4d51-be6c-ae74b65a9b89', '120ec2cb-deb1-4d97-a06f-0449ac69253c', 'I97.120 (postprocedural cardiac insufficiency following cardiac surgery — used here to flag the documented direct relationship between the surgery and this well-recognized postoperative complication) is added ahead of I48.91 (atrial fibrillation, unspecified type) to reflect the postoperative-complication relationship specifically, followed by I48.91 for the specific arrhythmia diagnosis and Z95.1 (presence of coronary bypass graft) for the procedure-status code. Since postoperative atrial fibrillation is such a well-established, common, and specifically named complication of cardiac surgery, coding conventions support flagging the procedural relationship with an I97 postprocedural-complication code rather than coding the arrhythmia as if it arose independently and spontaneously.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('907eadbc-08a1-432c-8f49-8367ca67cc8a', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 25, 'A patient''s home health chart requires a physician to certify (sign) the plan of care. If the certifying physician is unavailable and a covering physician within the same practice reviews and signs instead, is this compliant with CoP certification requirements?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('05ed12cb-c2c6-48db-9694-51d6cb9538e0', '907eadbc-08a1-432c-8f49-8367ca67cc8a', 0, 'No — only the original ordering physician may ever certify the plan of care');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7e60e6e4-8b26-4f84-9979-b4d9ba171493', '907eadbc-08a1-432c-8f49-8367ca67cc8a', 1, 'Yes, provided the covering physician has the appropriate authority/relationship to the patient''s care and the certification requirements (timely signature, documentation supporting eligibility) are otherwise met');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a4dd77cb-7489-475c-a613-dc9fadced942', '907eadbc-08a1-432c-8f49-8367ca67cc8a', 2, 'No — certification always requires two physician signatures regardless of circumstance');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c89bf772-1ae0-4ce4-b813-4e8161cac559', '907eadbc-08a1-432c-8f49-8367ca67cc8a', 3, 'Yes, but only if the covering physician is board-certified in the exact same subspecialty');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('907eadbc-08a1-432c-8f49-8367ca67cc8a', '7e60e6e4-8b26-4f84-9979-b4d9ba171493', 'A covering physician with appropriate authority and a legitimate relationship to the patient''s care (e.g., same practice, covering call) may certify/recertify the plan of care, provided the substantive certification requirements — timely signature and documentation supporting continued eligibility for the home health benefit — are met; certification is not locked to only the original ordering physician nor does it require dual-physician signature or exact subspecialty matching, both of which are incorrect distractors testing whether a candidate over-restricts a genuinely more flexible CoP allowance.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b140eba0-f045-41a8-9a5d-42740ff5a23b', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 26, 'A patient with a permanent suprapubic catheter (for neurogenic bladder due to a spinal cord injury) develops catheter-associated bacteriuria without any systemic symptoms (afebrile, no dysuria, no systemic illness) — an incidental lab finding on a routine urinalysis ordered by the physician. Select the correct coding approach.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('350b2f27-b416-4bd7-8997-b0d31b6f5e71', 'b140eba0-f045-41a8-9a5d-42740ff5a23b', 0, 'N39.0, T83.591A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4698fd11-3c83-478d-9191-35da8d436e8b', 'b140eba0-f045-41a8-9a5d-42740ff5a23b', 1, 'R82.71, T83.591A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0d9dd001-6c9f-4011-aa92-13463887e9d0', 'b140eba0-f045-41a8-9a5d-42740ff5a23b', 2, 'N39.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('90e173da-340f-418f-a6fb-33cd3b9e7ea2', 'b140eba0-f045-41a8-9a5d-42740ff5a23b', 3, 'T83.591A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b140eba0-f045-41a8-9a5d-42740ff5a23b', '4698fd11-3c83-478d-9191-35da8d436e8b', 'R82.71 (bacteriuria) — not N39.0 (urinary tract infection) — is the correct code for asymptomatic bacteriuria, since N39.0 specifically implies a symptomatic infection, which the stem explicitly rules out (afebrile, no dysuria, no systemic illness); this is a clinically important and frequently tested distinction, since bacteriuria without symptoms is a common, often intentionally NOT-treated finding in catheterized patients, and miscoding it as a full UTI would misrepresent the clinical picture. T83.591A (infection and inflammatory reaction due to other urinary catheter, initial encounter) is added since the bacteriuria is specifically catheter-associated, per the physician''s context.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4cfe6690-c49c-4c58-9d7a-6a5d1035fbc1', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 27, 'A home health patient receiving skilled nursing has a plan of care specifying wound care ''3x/week.'' The assigned nurse is unavailable for one scheduled visit due to illness, and no substitute visit occurs that week (2 visits instead of 3). Per CoP requirements, what must the agency do regarding this missed visit?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5b0ef710-ca0d-4a1c-9044-fec7f0e7abad', '4cfe6690-c49c-4c58-9d7a-6a5d1035fbc1', 0, 'Nothing — occasional missed visits due to staffing are not tracked or addressed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cd422d7c-6c8e-4629-bfe3-5652dc2a9405', '4cfe6690-c49c-4c58-9d7a-6a5d1035fbc1', 1, 'The agency must have a system to identify missed visits, document the reason, assess any clinical impact, and take corrective action as needed — this is part of required quality oversight, not simply ignored');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('607c3a52-0ca4-4943-a3ba-fca23cfdf778', '4cfe6690-c49c-4c58-9d7a-6a5d1035fbc1', 2, 'The patient must be immediately discharged from services');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6d667473-36d6-4f43-8084-17b48176bf6e', '4cfe6690-c49c-4c58-9d7a-6a5d1035fbc1', 3, 'The physician must be notified only if the patient specifically complains about it');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4cfe6690-c49c-4c58-9d7a-6a5d1035fbc1', 'cd422d7c-6c8e-4629-bfe3-5652dc2a9405', 'Missed-visit tracking, documentation of reason, and clinical impact assessment is a required element of agency quality oversight/QAPI and care coordination — an agency cannot simply let a scheduled, ordered visit go missing without a systemic process to catch and address it, since an unaddressed missed visit could represent a real gap in ordered care with clinical consequences; this is not something ignored as routine staffing noise, nor does it automatically escalate to discharge, nor is physician notification contingent on a patient''s complaint being the only trigger.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c26d4206-fcce-4c09-b49f-4e76b4842ffc', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 28, 'A patient with major depressive disorder, recurrent, in full remission, discontinues home health psychiatric nursing after successful treatment. Six months later, the patient is readmitted to home health for an UNRELATED orthopedic issue. The intake nurse documents the depression history. Select the correct coding for the depression at THIS new admission.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d6209c3d-b38f-49f1-8499-8917466eb462', 'c26d4206-fcce-4c09-b49f-4e76b4842ffc', 0, 'F33.42');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f8d838d1-ed57-4cc6-91c1-d931fd6e32e0', 'c26d4206-fcce-4c09-b49f-4e76b4842ffc', 1, 'F33.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3ff77d50-4fcd-4bf6-bfc3-ebad47ec62cc', 'c26d4206-fcce-4c09-b49f-4e76b4842ffc', 2, 'Z86.59, or F33.42 depending on whether the physician still considers it an active, monitored diagnosis versus a fully resolved history');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b8f4dc9e-654b-4a9d-8520-a0b828ab492e', 'c26d4206-fcce-4c09-b49f-4e76b4842ffc', 3, 'F33.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c26d4206-fcce-4c09-b49f-4e76b4842ffc', '3ff77d50-4fcd-4bf6-bfc3-ebad47ec62cc', 'This is a genuinely judgment-dependent scenario rather than a single mechanically-determined answer: whether recurrent MDD ''in full remission'' is coded as F33.42 (active diagnosis, in full remission — still an active F33.4x code, since ''remission'' for a RECURRENT depressive disorder is typically still coded as the active disorder in a remission state, not converted to pure history, given the documented recurrence pattern implies ongoing risk requiring monitoring) OR as a Z86.59 history code depends specifically on the CURRENT physician''s clinical judgment and documentation at this new admission about whether the condition is still being actively followed/monitored as a diagnosis versus considered fully resolved history with no current relevance — this question intentionally tests recognizing that this determination hinges on current documentation rather than a fixed universal rule, unlike the amputation-status or resolved-infection examples used elsewhere in this series where the resolution is clinically unambiguous.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('62302270-ce43-495f-8282-493acf9eb5a3', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 29, 'A patient with chronic hypertension and hyperlipidemia begins a new statin. Four weeks later, the patient reports diffuse muscle aches, and the physician orders a CK level, which returns significantly elevated, confirming statin-induced myopathy in a correctly-dosed patient. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9d06ae10-085b-4140-b988-17d077affec7', '62302270-ce43-495f-8282-493acf9eb5a3', 0, 'M62.82, T46.6X5A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5fb7d81c-c9bc-4b23-a0a3-76ac75d141fc', '62302270-ce43-495f-8282-493acf9eb5a3', 1, 'T46.6X5A, M62.82');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bc0a6bde-65b7-48e1-845f-bf351fd6f6d7', '62302270-ce43-495f-8282-493acf9eb5a3', 2, 'T46.6X5A, M79.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6451b047-ac7f-4f93-9752-5106d6a545aa', '62302270-ce43-495f-8282-493acf9eb5a3', 3, 'M79.10, T46.6X5A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('62302270-ce43-495f-8282-493acf9eb5a3', '5fb7d81c-c9bc-4b23-a0a3-76ac75d141fc', 'T46.6X5A (adverse effect of antihyperlipidemic and antiarteriosclerotic drugs, initial encounter — statins) is sequenced first per this exam series'' consistent adverse-effect sequencing rule. M62.82 (rhabdomyolysis — used here since the elevated CK with diffuse myopathy is consistent with a rhabdomyolysis-spectrum presentation rather than simple, non-specific myalgia) is the more specific, lab-confirmed manifestation code, more precise than M79.10 (myalgia, unspecified site — a nonspecific symptom code that under-codes the objectively confirmed, CK-elevated muscle breakdown finding).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1e6208bc-a3fa-4058-b2d7-8f416ba4e24d', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 30, 'A patient with schizophrenia is prescribed clozapine and develops agranulocytosis, confirmed by CBC, correctly dosed and monitored per the required REMS protocol. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('56d381a0-5a82-47fe-9aa2-b60c430e89a6', '1e6208bc-a3fa-4058-b2d7-8f416ba4e24d', 0, 'F20.9, T43.595A, D70.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bc4fd68d-4427-45a8-9ba8-59461b3cb8da', '1e6208bc-a3fa-4058-b2d7-8f416ba4e24d', 1, 'T43.595A, D70.9, F20.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0e3f9364-c920-46a7-bb62-fd1e73d8ed60', '1e6208bc-a3fa-4058-b2d7-8f416ba4e24d', 2, 'D70.9, T43.595A, F20.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d24a2e5b-1854-456a-8cae-d6d500537572', '1e6208bc-a3fa-4058-b2d7-8f416ba4e24d', 3, 'F20.9, D70.9, T43.595A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1e6208bc-a3fa-4058-b2d7-8f416ba4e24d', '56d381a0-5a82-47fe-9aa2-b60c430e89a6', 'F20.9 (schizophrenia, unspecified) is sequenced first as the underlying condition driving the clozapine therapy, matching the same sequencing pattern established in Paper 7 for the methotrexate/pancytopenia and biologic/pulmonary-infection questions (chronic underlying disease first, then the adverse-effect code, then the resulting manifestation). T43.595A (adverse effect of other antipsychotics) follows, then D70.9 (agranulocytosis, unspecified) as the resulting manifestation — this consistent three-part sequencing (chronic disease → drug effect → manifestation) is a deliberately repeated, high-yield pattern across this exam series.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d6cbefe5-253a-4bfa-b900-740341e1cd51', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 31, 'A patient''s OASIS-E GG0130 (Self-Care) items include GG0130A (Eating). At SOC, the patient scores ''03 - Partial/moderate assistance'' for eating due to right-hand weakness from a recent stroke. The home health OT works with the patient, and by discharge the patient scores ''05 - Setup or clean-up assistance only'' for the same item. What does this represent for outcome/quality reporting purposes?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('78f45bea-2b4a-4434-909f-5748085295cf', 'd6cbefe5-253a-4bfa-b900-740341e1cd51', 0, 'A decline in function, since a higher number score is always worse');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b954c068-ff6c-419f-b2a5-9c2c8c3bc960', 'd6cbefe5-253a-4bfa-b900-740341e1cd51', 1, 'An improvement in function, since GG functional scoring runs from more dependent (lower numbers, e.g., 01) to more independent (higher numbers, e.g., 06), so moving from ''03'' to ''05'' reflects genuine functional gain');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dd846809-b3b6-4580-8691-e83548efcbab', 'd6cbefe5-253a-4bfa-b900-740341e1cd51', 2, 'No meaningful change, since both scores indicate ''assistance'' in the item name');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ff74f10a-80e6-4b70-bbc3-bd82a1510a6c', 'd6cbefe5-253a-4bfa-b900-740341e1cd51', 3, 'An error, since GG items cannot be rescored differently between SOC and discharge');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d6cbefe5-253a-4bfa-b900-740341e1cd51', 'b954c068-ff6c-419f-b2a5-9c2c8c3bc960', 'GG0130 self-care items are scored on a scale running from the MOST dependent levels (lower numbers, e.g., 01 - dependent) toward the MOST independent levels (higher numbers, e.g., 06 - independent), so an increase from ''03 - partial/moderate assistance'' to ''05 - setup or clean-up assistance only'' reflects genuine functional improvement, not decline — this direction-of-scale fact is foundational to correctly interpreting GG functional outcome data and quality measure reporting (like OASIS-based functional improvement measures), and a candidate who assumes ''higher number = worse'' (perhaps by analogy to severity scales elsewhere in coding, where higher often does mean worse) would get this backward.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('96bb23dc-c2ca-4c59-ab8b-2370b193f47b', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 32, 'A patient with severe malnutrition (E43) develops a new pressure injury, and the physician''s documentation explicitly links the malnutrition as a significant contributing factor to poor wound healing and pressure injury development. Should this causal relationship change the coding approach compared to coding the pressure injury alone?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b0ab9079-c226-45e0-b95d-e51ca40c3b74', '96bb23dc-c2ca-4c59-ab8b-2370b193f47b', 0, 'Yes — a specific combination code exists that must be used instead of two separate codes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('720d3db2-dc29-4277-907c-cabdf560e976', '96bb23dc-c2ca-4c59-ab8b-2370b193f47b', 1, 'No combination code exists for this relationship; both E43 and the specific pressure injury code (L89.---) are coded separately, with sequencing reflecting the current clinical focus, and the documented causal link is captured in narrative documentation/care planning rather than through a single ICD-10-CM code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dadb35dc-d57e-434e-8010-a04d65be20c0', '96bb23dc-c2ca-4c59-ab8b-2370b193f47b', 2, 'The malnutrition should not be coded at all once a pressure injury has developed, since the ulcer code implicitly captures it');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('98c7d07c-7f7e-40ef-acc4-ece5b7476299', '96bb23dc-c2ca-4c59-ab8b-2370b193f47b', 3, 'The pressure injury should not be coded since malnutrition is now considered the principal diagnosis by definition');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('96bb23dc-c2ca-4c59-ab8b-2370b193f47b', '720d3db2-dc29-4277-907c-cabdf560e976', 'Unlike several combination-code relationships tested elsewhere in this exam series (diabetes-with-complication codes, hypertension-heart-failure-CKD combinations, hepatitis-with-cirrhosis), there is no ICD-10-CM combination code linking malnutrition directly to pressure injury development — both conditions remain separately coded (E43 and the specific L89.--- pressure injury code), with sequencing determined by the current clinical focus of the encounter, and the documented causal/contributing relationship communicated through clinical narrative and care planning rather than forced into a single code that doesn''t actually exist. This tests whether a candidate over-generalizes the combination-code pattern to a relationship where no such code actually exists in ICD-10-CM.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fb33d92e-22ef-49ba-bfda-c807e5d08bde', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 33, 'A patient''s home health services are being furnished under a Medicare Advantage plan rather than Traditional Medicare. Do the Medicare Conditions of Participation (42 CFR 484) still apply to the home health agency furnishing this care?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c284d298-dd35-45af-8ff3-b1cb8215660b', 'fb33d92e-22ef-49ba-bfda-c807e5d08bde', 0, 'No — CoPs only apply to Traditional Medicare beneficiaries, not Medicare Advantage enrollees');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('21b8b2d0-0466-4cb9-86d0-111f8e2e6dd8', 'fb33d92e-22ef-49ba-bfda-c807e5d08bde', 1, 'Yes — CoPs apply to the Medicare-certified home health agency itself, as a condition of the agency''s Medicare certification, regardless of which specific plan (Traditional Medicare or Medicare Advantage) is paying for a given patient''s services');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('177fe4ea-2f53-46ba-b865-2df9c034416a', 'fb33d92e-22ef-49ba-bfda-c807e5d08bde', 2, 'CoPs are replaced entirely by the Medicare Advantage plan''s own private contractual requirements');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eff50596-4c97-42bb-96aa-938746eb5e05', 'fb33d92e-22ef-49ba-bfda-c807e5d08bde', 3, 'CoPs apply only if the Medicare Advantage plan specifically opts in');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fb33d92e-22ef-49ba-bfda-c807e5d08bde', '21b8b2d0-0466-4cb9-86d0-111f8e2e6dd8', 'The Conditions of Participation are conditions attached to the home health agency''s Medicare certification/provider agreement itself — they apply to the certified agency''s operations as a whole and to the care it furnishes, regardless of whether a specific patient''s coverage is through Traditional Medicare or a Medicare Advantage plan; a Medicare Advantage plan may layer additional contractual requirements on top, but does not replace or exempt the agency from the underlying federal CoPs, which is a genuinely important operational fact distinct from plan-specific billing/authorization rules.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('eb1b8b82-05ce-4185-b596-ee9349b20712', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 34, 'A patient with atrial fibrillation and a CHA2DS2-VASc score supporting anticoagulation has a physician note stating anticoagulation is being WITHHELD specifically due to a documented high bleeding risk (recent GI bleed, now resolved, within the last 3 months). Which code(s) should reflect this clinical decision-making for the record?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2fd79140-a44c-443d-83f3-23970477433d', 'eb1b8b82-05ce-4185-b596-ee9349b20712', 0, 'I48.91, Z78.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9b448e95-9ae8-47b2-a2da-de990e729116', 'eb1b8b82-05ce-4185-b596-ee9349b20712', 1, 'I48.91, Z91.89 with narrative documentation of the specific clinical rationale (anticoagulation withheld due to bleeding risk) — there isn''t a single dedicated ''code'' fully capturing this exact clinical nuance');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d4328045-981e-457f-a810-c8ba1f4e4295', 'eb1b8b82-05ce-4185-b596-ee9349b20712', 2, 'I48.91 alone, since the decision not to prescribe a medication is never separately coded');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('108dd9ec-5d4e-47bd-a03a-b6e0259a72bc', 'eb1b8b82-05ce-4185-b596-ee9349b20712', 3, 'I48.91, T45.515A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('eb1b8b82-05ce-4185-b596-ee9349b20712', '9b448e95-9ae8-47b2-a2da-de990e729116', 'I48.91 (atrial fibrillation) is the primary diagnosis. Z91.89 (other specified personal risk factors, not elsewhere classified) can be used to flag the general elevated-risk status, but there genuinely isn''t a single ICD-10-CM code that fully and specifically captures ''anticoagulation intentionally withheld due to bleeding risk'' as a discrete, precise concept — this clinical decision-making rationale is best and most completely captured in narrative clinical documentation supporting the plan of care, not forced into an ICD-10-CM code that doesn''t actually exist for this specific nuance. T45.515A (adverse effect of anticoagulants) would be wrong since the patient isn''t on the anticoagulant at all in this scenario — the medication was never given, so there is no adverse effect to code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b12333fa-1b10-4c7a-bbd6-6bea7288721a', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 35, 'A patient with chronic systolic heart failure is admitted to home health and found to have a serum sodium of 128 mEq/L (mild-moderate hyponatremia), attributed by the physician to a combination of the heart failure itself and diuretic use, both correctly managed as expected/anticipated effects rather than an unexpected adverse reaction. Select the correct coding approach for the hyponatremia.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('be365cef-aca3-4214-98d3-3911c3ab3435', 'b12333fa-1b10-4c7a-bbd6-6bea7288721a', 0, 'E87.1, I50.22');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d64fef9f-38ce-4579-8d6a-1087eda3f439', 'b12333fa-1b10-4c7a-bbd6-6bea7288721a', 1, 'T50.2X5A, E87.1, I50.22');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6e761ccd-6463-43ca-b24f-85fe2612bb1e', 'b12333fa-1b10-4c7a-bbd6-6bea7288721a', 2, 'I50.22, E87.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8c0a3cbf-283d-48ab-892a-e6c846a19cc7', 'b12333fa-1b10-4c7a-bbd6-6bea7288721a', 3, 'E87.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b12333fa-1b10-4c7a-bbd6-6bea7288721a', '6e761ccd-6463-43ca-b24f-85fe2612bb1e', 'I50.22 (chronic systolic heart failure) is sequenced first as the primary underlying condition. E87.1 (hyponatremia) is added as a documented, clinically relevant electrolyte finding — but T50.2X5A (adverse effect of diuretics) is NOT added here, since the physician specifically characterizes this hyponatremia as an expected, anticipated physiologic consequence of appropriate heart failure management rather than an unexpected adverse drug reaction requiring adverse-effect coding; this is a meaningful distinction from the earlier furosemide/hypokalemia adverse-effect question in Paper 7, where the finding WAS specifically framed as a drug side effect — here, the physician''s documentation frames it as a multifactorial, expected consequence of the disease process itself rather than isolating the diuretic as causally primary, which changes the coding approach.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('75e0f3a5-5b6e-4cf0-ae35-9ec3fc42fdb8', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 36, 'A patient with a recent ischemic stroke has new-onset dysphagia, physician-documented as a direct consequence of the stroke, confirmed by a formal swallow evaluation to involve risk of aspiration with thin liquids specifically. Select the correct, most specific dysphagia coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('60e45fe0-3326-4f5f-8e17-37cba427ec11', '75e0f3a5-5b6e-4cf0-ae35-9ec3fc42fdb8', 0, 'R13.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('45753553-eb03-4b8d-bf66-c64f518a9298', '75e0f3a5-5b6e-4cf0-ae35-9ec3fc42fdb8', 1, 'R13.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('77a4f891-028b-46cb-8603-fd9aac7b6224', '75e0f3a5-5b6e-4cf0-ae35-9ec3fc42fdb8', 2, 'I69.391');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('67bd0331-6bde-4b07-9018-67816e8156e4', '75e0f3a5-5b6e-4cf0-ae35-9ec3fc42fdb8', 3, 'R13.19');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('75e0f3a5-5b6e-4cf0-ae35-9ec3fc42fdb8', '77a4f891-028b-46cb-8603-fd9aac7b6224', 'I69.391 (dysphagia following cerebral infarction) is the correct choice because the physician explicitly documents the dysphagia as a direct consequence of the stroke — when a symptom is documented as a stroke sequela, ICD-10-CM''s more specific I69.3xx late-effect combination code is used in preference to a generic R13 symptom code, the same etiology-linked-code-over-symptom-code principle tested with the aphasia/hemiparesis sequela codes in Paper 7 (Q23). R13.12 (dysphagia, oropharyngeal phase) and R13.10 (dysphagia, unspecified) are both R-chapter symptom codes, which ICD-10-CM guidelines direct away from once a more specific, etiology-confirmed combination code (like I69.391) is available and supported by documentation — the phase-specific detail from the swallow study is valuable clinical information for the plan of care, but doesn''t override the preference for the sequela combination code once the causal relationship to the stroke is explicitly stated.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e5e7c9bd-0731-4d63-abe8-d6d22a236fd9', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 37, 'A patient is admitted to home health with a diagnosis of unspecified sepsis (per hospital discharge summary) without any documented specific causative organism identified, now stable on oral antibiotics to complete the treatment course at home. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d175cf85-7bb8-4419-91d6-07ca71da12c2', 'e5e7c9bd-0731-4d63-abe8-d6d22a236fd9', 0, 'A41.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('41d4d8fa-d29c-46f7-a119-e9a7d167a165', 'e5e7c9bd-0731-4d63-abe8-d6d22a236fd9', 1, 'A41.9, B96.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9f34bcbd-ec09-42a1-803b-289c20dd1ee7', 'e5e7c9bd-0731-4d63-abe8-d6d22a236fd9', 2, 'R65.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8db87fe9-9f3c-4183-ad37-35fd3c284f7f', 'e5e7c9bd-0731-4d63-abe8-d6d22a236fd9', 3, 'A40.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e5e7c9bd-0731-4d63-abe8-d6d22a236fd9', 'd175cf85-7bb8-4419-91d6-07ca71da12c2', 'A41.9 (sepsis, unspecified organism) is the correct code when no specific causative organism is documented — B96.20 (unspecified E. coli, a distractor implying a specific organism) should NOT be added since no organism was actually identified. R65.20 (severe sepsis without septic shock) would over-code the presentation, since ''severe sepsis'' specifically requires documented associated organ dysfunction, which isn''t stated in this stem — this is uncomplicated sepsis, now resolving on oral antibiotics. A40.9 (streptococcal sepsis, unspecified) incorrectly assumes a specific organism (streptococcus) not supported by the ''unspecified sepsis'' documentation.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2f14fa37-f340-473d-bdeb-f19de3733cec', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 38, 'A patient''s home health agency contracts with an outside physical therapy agency to provide PT services under arrangement, rather than employing the PT directly. Per CoP requirements, who retains overall responsibility for the coordination and quality of the PT services provided under this arrangement?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c24ada75-bd18-419d-af9d-2a45a723a816', '2f14fa37-f340-473d-bdeb-f19de3733cec', 0, 'The contracted PT agency alone bears full responsibility, with no obligation on the primary home health agency');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('06f9a81f-e179-4131-8b7a-d8a033ee4cca', '2f14fa37-f340-473d-bdeb-f19de3733cec', 1, 'The primary (certified) home health agency retains overall responsibility for ensuring services furnished under arrangement meet the same CoP standards as directly-employed staff, including coordination and oversight');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e341cee6-6d9a-47fe-982f-de2b8a185f11', '2f14fa37-f340-473d-bdeb-f19de3733cec', 2, 'Responsibility is split 50/50 with no clear designation, per CMS''s flexible arrangement rules');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('16d4ebe7-9c7c-4dff-a101-f0bf33c3927d', '2f14fa37-f340-473d-bdeb-f19de3733cec', 3, 'CMS assumes direct oversight of contracted staff, bypassing the home health agency entirely');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2f14fa37-f340-473d-bdeb-f19de3733cec', '06f9a81f-e179-4131-8b7a-d8a033ee4cca', 'When a Medicare-certified home health agency furnishes services under arrangement with an outside provider (rather than through directly employed staff), the certified home health agency retains overall responsibility for ensuring those services meet the same CoP quality, coordination, and documentation standards as if furnished directly — CoPs don''t permit a certified agency to outsource away its fundamental responsibility for the care coordinated under its plan of care, which is why arrangement contracts typically include specific CoP-compliance provisions.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1e0ef943-d6c0-47aa-bc08-0cb461f9fb91', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 39, 'A patient with COPD is on home oxygen. A PDGM 30-day period begins, and the primary diagnosis listed is ''COPD with acute exacerbation'' (J44.1), mapping to PDGM''s Respiratory clinical group. Partway through the SAME 30-day period, the patient is hospitalized for 4 days for an unrelated GI bleed, then returns to home health. Does the readmission after this inpatient stay change which 30-day period applies?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('55d12bff-e232-4797-83af-568a3bc0157a', '1e0ef943-d6c0-47aa-bc08-0cb461f9fb91', 0, 'No — the original 30-day period simply continues uninterrupted through the inpatient stay');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('afa12b5c-bca1-4ca6-b791-d4b24f2692d8', '1e0ef943-d6c0-47aa-bc08-0cb461f9fb91', 1, 'Yes — a qualifying inpatient stay during an existing 30-day period triggers a new 30-day period beginning at the Resumption of Care (ROC), which may carry a different ''early/late'' timing classification and could result in a different clinical grouping if the primary diagnosis changes at ROC');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('02081ced-3dae-4c80-9027-0f2d212d0f47', '1e0ef943-d6c0-47aa-bc08-0cb461f9fb91', 2, 'The inpatient stay has no effect on PDGM periods at all, only on OASIS assessment timing');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f4cb751c-3a2e-4cb4-b64f-2617762012e9', '1e0ef943-d6c0-47aa-bc08-0cb461f9fb91', 3, 'The home health episode must be discharged permanently and a brand new referral obtained');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1e0ef943-d6c0-47aa-bc08-0cb461f9fb91', 'afa12b5c-bca1-4ca6-b791-d4b24f2692d8', 'A qualifying inpatient stay occurring during a home health period triggers a Resumption of Care (ROC) and begins a NEW 30-day period of care under PDGM upon return, rather than simply continuing the original period uninterrupted — this new period is classified based on its own timing (early vs. late within the 60-day episode) and its own primary diagnosis reported at ROC, which could map to a different clinical group than the original period if the reason for care has shifted. This is distinct from OASIS assessment timing rules (which also require a ROC assessment) — the PDGM period restart is a payment-classification consequence of the same inpatient-stay trigger, not merely an assessment-timing requirement.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a532c2f9-e11f-415a-9546-3a37901e92ae', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 40, 'A patient''s home health agency determines that a 30-day period qualifies as ''early'' versus ''late'' under PDGM based on which rule?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('885dc284-0a2c-4aa2-9727-5d539749e849', 'a532c2f9-e11f-415a-9546-3a37901e92ae', 0, 'The first 30-day period of a 60-day episode is always ''early''; all subsequent periods (including the second period of the same episode and any periods in a later, immediately-following episode) are ''late''');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dc9180ce-56e0-4dd8-933d-d799a505b73b', 'a532c2f9-e11f-415a-9546-3a37901e92ae', 1, '''Early'' vs. ''late'' is determined by whether the patient is over or under 65 years old');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('27c73364-d914-42f7-80e7-5eba26162a77', 'a532c2f9-e11f-415a-9546-3a37901e92ae', 2, '''Early'' vs. ''late'' refers to whether the SOC OASIS was completed within or outside the 5-day window');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fed99ee2-12c6-4e5f-b7fc-23243363be0d', 'a532c2f9-e11f-415a-9546-3a37901e92ae', 3, 'All periods are classified as ''early'' unless therapy utilization exceeds a defined threshold');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a532c2f9-e11f-415a-9546-3a37901e92ae', '885dc284-0a2c-4aa2-9727-5d539749e849', 'Under PDGM, only the FIRST 30-day period within a sequence of care (i.e., the first period of a patient''s home health episode, or the first period following a sufficient gap in service — generally more than 60 days without home health) is classified as ''early''; every subsequent 30-day period, including the second period of the same 60-day episode, is classified as ''late'' — this replaced the old PPS model''s more complex multi-episode timing logic and is a foundational PDGM timing concept distinct from the unrelated OASIS 5-day completion window or any age-based classification, both of which are incorrect distractors.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('43d05bc2-2bd8-4fdd-9ea2-fbf6ea979e14', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 41, 'A patient with type 2 diabetes and diabetic peripheral neuropathy develops a Charcot foot deformity, confirmed by imaging as neuropathic arthropathy directly related to the diabetic neuropathy. Select the correct combination coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('94b536f0-5f32-4ea9-bd12-07d1b2fdf736', '43d05bc2-2bd8-4fdd-9ea2-fbf6ea979e14', 0, 'E11.610, M14.671');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b44a059c-509a-42ec-95ab-cdad24167992', '43d05bc2-2bd8-4fdd-9ea2-fbf6ea979e14', 1, 'E11.40, M14.671');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('128b860d-6bcc-484e-917f-4e5f794c8a45', '43d05bc2-2bd8-4fdd-9ea2-fbf6ea979e14', 2, 'E11.610');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a7e5c687-575e-4f51-a01f-9690d8415020', '43d05bc2-2bd8-4fdd-9ea2-fbf6ea979e14', 3, 'M14.671, E11.40');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('43d05bc2-2bd8-4fdd-9ea2-fbf6ea979e14', '94b536f0-5f32-4ea9-bd12-07d1b2fdf736', 'E11.610 (type 2 diabetes with diabetic neuropathic arthropathy — the specific combination code for Charcot joint/foot due to diabetes) is a single code fully capturing this specific complication — M14.671 (charcot''s joint, right ankle and foot, in other specified disease classified elsewhere), while itself a legitimate code family for Charcot joint due to various underlying causes, is not needed as an additional stacked code here since E11.610 already conveys both the diabetic etiology and the neuropathic arthropathy in one combination code, following the same non-redundant-combination-code principle established repeatedly across this exam series (Crohn''s/fistula, diabetes/gastroparesis in Paper 7).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('829bcf19-361c-4df4-b45d-c8270ca6264b', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 42, 'A patient''s home health record shows a physician''s plan of care ordering skilled nursing visits, but the actual documentation of what skilled nursing service was rendered at each visit is vague (''routine visit, patient stable'') without specifics on what skilled intervention was performed. Per CoP documentation standards, is this sufficient to support continued Medicare coverage of the visits?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c9b3cae8-95e1-4b4c-94a8-ebfbc634ae85', '829bcf19-361c-4df4-b45d-c8270ca6264b', 0, 'Yes, as long as visits occur at the ordered frequency, the content of documentation doesn''t matter for coverage');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dc840efa-7f5e-464e-9cda-7dcd1f709487', '829bcf19-361c-4df4-b45d-c8270ca6264b', 1, 'No — documentation must reflect the SPECIFIC skilled services actually provided at each visit, sufficient to support that a skilled level of care (not merely custodial care) was medically necessary and rendered');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2de8b04c-76c8-4f1d-8284-a34c4db9747b', '829bcf19-361c-4df4-b45d-c8270ca6264b', 2, 'Yes, because physician orders alone establish medical necessity regardless of visit documentation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5cc5b4b7-8489-4909-a72b-dda9e6fd7dc6', '829bcf19-361c-4df4-b45d-c8270ca6264b', 3, 'Only the first and last visit in a certification period require detailed documentation');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('829bcf19-361c-4df4-b45d-c8270ca6264b', 'dc840efa-7f5e-464e-9cda-7dcd1f709487', 'Medicare coverage of home health skilled nursing requires documentation that specifically reflects the skilled services actually rendered at each visit — vague, generic notes (''routine visit, patient stable'') without documenting the actual skilled intervention performed (e.g., wound assessment and specific treatment steps, medication teaching content, specific skilled observation/assessment findings) fail to support that a skilled level of care was medically necessary and actually provided, which is a genuinely common and significant audit/compliance finding — physician orders establish that services were ordered, not that they were skilled or medically necessary as actually delivered, which must be independently supported by the visit-level clinical documentation itself.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5fbce93a-215a-434a-8f72-2c223cc6a960', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 43, 'A patient develops a new pneumothorax as a documented complication of a recent thoracentesis performed in an outpatient setting, now being monitored at home with serial chest assessments per physician order (no chest tube needed, small and stable). Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('20a47c74-caf6-48e6-aa7a-fb25fa1d7e69', '5fbce93a-215a-434a-8f72-2c223cc6a960', 0, 'J93.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7b7b5cd9-e0ce-4168-994e-8188004bf771', '5fbce93a-215a-434a-8f72-2c223cc6a960', 1, 'J93.83, Y83.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1e5ce275-4673-48ec-8de0-2748673725f9', '5fbce93a-215a-434a-8f72-2c223cc6a960', 2, 'J95.811, Y83.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('33d9f5cb-e5e2-4c70-b4d9-f9454bb6b751', '5fbce93a-215a-434a-8f72-2c223cc6a960', 3, 'J93.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5fbce93a-215a-434a-8f72-2c223cc6a960', '1e5ce275-4673-48ec-8de0-2748673725f9', 'J95.811 (postprocedural pneumothorax) is the specific combination code for a pneumothorax documented as a complication of a medical procedure (here, thoracentesis) — J93.11 (primary spontaneous pneumothorax) and J93.9 (pneumothorax, unspecified) would both incorrectly imply a spontaneous, non-procedural cause, contradicting the documented procedural etiology. Y83.8 (other surgical procedures as the cause of abnormal reaction, without mention of misadventure — used here since a thoracentesis is a medical procedure and this external-cause code documents the procedure as the causal circumstance) is added as the appropriate external-cause code for a recognized complication of a properly performed procedure, not a procedural error/misadventure code, since none is documented here.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('73030cf6-827c-450a-b487-73f2d6110ddd', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 44, 'A patient with heart failure with preserved ejection fraction (HFpEF), confirmed on echocardiogram at 55%, is admitted to home health, with the physician''s note using the specific term ''diastolic heart failure, chronic, stable.'' Select the correct code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3d5bdd63-2b32-471e-b0aa-e5887bdf116d', '73030cf6-827c-450a-b487-73f2d6110ddd', 0, 'I50.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e39bb2e2-fdaa-4691-9000-f9ec31fa9b31', '73030cf6-827c-450a-b487-73f2d6110ddd', 1, 'I50.32');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('46f1686d-f267-4a4b-8093-b14c5a6e36f6', '73030cf6-827c-450a-b487-73f2d6110ddd', 2, 'I50.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('013bf586-eebc-40ed-91cb-10f09bed713b', '73030cf6-827c-450a-b487-73f2d6110ddd', 3, 'I50.20');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('73030cf6-827c-450a-b487-73f2d6110ddd', 'e39bb2e2-fdaa-4691-9000-f9ec31fa9b31', 'I50.32 (chronic diastolic heart failure) precisely matches the physician''s exact documented terminology and acuity (''diastolic,'' ''chronic'') — HFpEF is clinically synonymous with diastolic heart failure in ICD-10-CM''s code structure. I50.30 (unspecified diastolic heart failure, without the chronic/acute qualifier) under-codes the documented chronic status. I50.9 (unspecified heart failure) under-codes the documented specific diastolic type. I50.20 is the wrong family entirely (systolic, not diastolic) — this tests precise matching of documented type + acuity to the correct combination code, the same precision-matching skill tested with the I50.22 question earlier in this paper.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4566d1ce-6284-42d4-a828-bba665cd5e9a', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 45, 'A patient with a recent below-knee amputation has a well-fitted prosthesis and is ambulating independently with it during PT sessions, per home health documentation. For OASIS GG0170 (Mobility) scoring purposes, how should ambulation WITH the prosthesis be treated?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e15c0e50-541d-48dd-9075-c14f20d0f21c', '4566d1ce-6284-42d4-a828-bba665cd5e9a', 0, 'The prosthesis is treated as a personal assistance device similar to a cane, and the patient''s functional performance using it is scored based on actual observed independence level, not automatically scored as maximally dependent simply because a device is used');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('33743282-49d0-497c-b731-d543cb948432', '4566d1ce-6284-42d4-a828-bba665cd5e9a', 1, 'Any use of a prosthetic device automatically caps the score at the most dependent level regardless of actual function');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e2f54e7a-45fd-486c-b530-68f239e0bd3b', '4566d1ce-6284-42d4-a828-bba665cd5e9a', 2, 'Prosthetic device use is excluded from GG scoring entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e887b06f-74d0-411f-be65-79a14ed4f299', '4566d1ce-6284-42d4-a828-bba665cd5e9a', 3, 'GG0170 cannot be scored for amputees under any circumstance');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4566d1ce-6284-42d4-a828-bba665cd5e9a', 'e15c0e50-541d-48dd-9075-c14f20d0f21c', 'OASIS GG functional items score the patient''s ACTUAL observed performance level, with an assistive device (including a prosthesis) noted as part of how the activity was performed, similar to noting use of a cane or walker — a patient ambulating independently with a well-fitted prosthesis is scored at the independence level that actually reflects their observed performance, not automatically downgraded to maximal dependence simply because a device is involved; this is a genuinely important scoring-accuracy concept, since incorrectly capping scores for any device use would misrepresent the patient''s true functional status and distort both quality reporting and (where relevant) case-mix calculations.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f25d3fd9-aba5-40d7-b2c1-6478fe819cf3', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 46, 'A patient with schizophrenia and co-occurring cannabis use disorder is documented by the physician as having cannabis-induced psychotic disorder, distinct from and in addition to the pre-existing, separately diagnosed schizophrenia. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('74f247d1-2894-4f4b-a60f-6ab8bd760627', 'f25d3fd9-aba5-40d7-b2c1-6478fe819cf3', 0, 'F20.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f91bdcb5-ebeb-4280-8279-64910c630ce6', 'f25d3fd9-aba5-40d7-b2c1-6478fe819cf3', 1, 'F12.259, F20.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0d8913fb-d3fb-4fe6-b1c8-ec9d55fafc43', 'f25d3fd9-aba5-40d7-b2c1-6478fe819cf3', 2, 'F12.20, F20.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2cac72f7-1084-4cac-9a15-2414945729b7', 'f25d3fd9-aba5-40d7-b2c1-6478fe819cf3', 3, 'F20.9, F12.259');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f25d3fd9-aba5-40d7-b2c1-6478fe819cf3', '2cac72f7-1084-4cac-9a15-2414945729b7', 'F20.9 (schizophrenia, unspecified) is sequenced first as the primary, pre-existing chronic psychiatric diagnosis. F12.259 (cannabis dependence with cannabis-induced psychotic disorder, unspecified) is added as the separate, specifically documented substance-induced condition — using the ''.25-'' subcategory (dependence WITH psychotic disorder) rather than F12.20 (uncomplicated cannabis dependence, which under-codes the documented psychotic-disorder complication). Both conditions are coded together since the physician explicitly documents them as distinct, separately diagnosed conditions, not one subsumed into the other.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('29e3727a-376f-416f-89e4-af902a0b3dd6', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 47, 'A home health patient''s physician orders wound care visits at a frequency the agency''s own internal utilization review flags as higher than typical for the wound type/severity documented. Per CoP and program integrity principles, what is the appropriate response?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9aad8b03-e65d-4aef-a13a-aacfd27f12fa', '29e3727a-376f-416f-89e4-af902a0b3dd6', 0, 'The agency should unilaterally reduce the visit frequency to what it considers ''typical'' without physician involvement');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ea780f8d-9f5e-4158-815a-bba7ab8b2b44', '29e3727a-376f-416f-89e4-af902a0b3dd6', 1, 'The agency should raise the utilization concern with the ordering physician for clinical justification/clarification, since visits must be both physician-ordered AND supported by documented medical necessity — an order alone doesn''t automatically satisfy the necessity requirement if internal review raises a legitimate question');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2e6587f1-f07a-4cf4-9f90-e2fca6e6c20b', '29e3727a-376f-416f-89e4-af902a0b3dd6', 2, 'Utilization review findings are irrelevant once a physician has signed an order');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c6d92e64-eaed-43e6-9fb5-8606b46e5977', '29e3727a-376f-416f-89e4-af902a0b3dd6', 3, 'The agency must report the physician to state licensing immediately');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('29e3727a-376f-416f-89e4-af902a0b3dd6', 'ea780f8d-9f5e-4158-815a-bba7ab8b2b44', 'A physician''s order is necessary but not automatically sufficient to establish Medicare medical necessity — if an agency''s own utilization review process identifies a genuine question about whether ordered frequency matches documented clinical severity, the appropriate response is to raise this with the ordering physician for clarification/justification (which may result in either better documentation supporting the order, or a revised order), not to unilaterally override the physician''s order, and not to escalate immediately to licensing action, which would be a disproportionate response to a documentation/utilization question rather than a misconduct finding.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5fa66c39-fa00-4c56-b577-5eea6e19551d', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 48, 'A patient with atrial fibrillation is on both aspirin (for a separate, unrelated cardiac indication per the physician) and apixaban (for AFib stroke prevention), a dual-antiplatelet-plus-anticoagulant combination the physician has specifically weighed and intentionally continued despite the elevated bleeding risk, with no current bleeding event. How should this intentional, monitored elevated-bleeding-risk medication combination be reflected in documentation, and is a specific ICD-10-CM code required for it?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e0e921f3-d2dc-42ef-bade-54c792434b50', '5fa66c39-fa00-4c56-b577-5eea6e19551d', 0, 'Z79.01, Z79.02, with the clinical rationale (physician''s risk-benefit reasoning for the combination) captured in narrative documentation rather than a single dedicated ICD-10-CM code for ''the combination decision'' itself, since no such code exists');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('696041f5-1daf-47cb-9160-279ba666b37a', '5fa66c39-fa00-4c56-b577-5eea6e19551d', 1, 'T45.525A, since any elevated bleeding risk from anticoagulation is always coded as an adverse effect');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7205d024-690a-4292-9c55-f28c019fba36', '5fa66c39-fa00-4c56-b577-5eea6e19551d', 2, 'No codes are needed since both drugs are being taken exactly as intended');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('df8187ef-fab4-47ca-90dd-427f314fc86e', '5fa66c39-fa00-4c56-b577-5eea6e19551d', 3, 'D68.9 must be used to reflect the elevated bleeding risk');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5fa66c39-fa00-4c56-b577-5eea6e19551d', 'e0e921f3-d2dc-42ef-bade-54c792434b50', 'Z79.01 (long term use of anticoagulants) and Z79.02 (long term use of antithrombotic/antiplatelets) both appropriately document the long-term use status of each medication — but there is no dedicated ICD-10-CM code capturing ''physician intentionally continuing a higher-bleeding-risk combination after risk-benefit analysis'' as a discrete concept; that clinical reasoning belongs in narrative documentation, not forced into a code. T45.525A (adverse effect of anticoagulants) is wrong since there''s no documented adverse reaction at all — only an elevated theoretical risk being knowingly monitored, which isn''t the same as an actual adverse effect having occurred. D68.9 (coagulation defect, unspecified) would incorrectly imply an actual diagnosed bleeding disorder, not present here.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6940de8e-e59b-48b5-9d28-b5724f5b1974', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 49, 'A patient with congestive heart failure has a home health SN visit where daily weight monitoring reveals a 4-pound weight gain over 2 days, a recognized early warning sign of fluid retention/decompensation per the plan of care''s parameters for physician notification. The nurse calls the physician per protocol, and the physician adjusts the diuretic dose over the phone without an in-person visit. Select the correct coding for THIS finding at this visit, addressing whether this rises to a codeable diagnosis or remains a documented finding only.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dd048539-6bf6-40d1-a283-df0aee5f55d3', '6940de8e-e59b-48b5-9d28-b5724f5b1974', 0, 'R60.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0f98b825-78e1-48ff-81c9-57f27f9a6c3d', '6940de8e-e59b-48b5-9d28-b5724f5b1974', 1, 'I50.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eb14689e-dc25-4c5b-b3fd-fae05348a09c', '6940de8e-e59b-48b5-9d28-b5724f5b1974', 2, 'The weight gain is a documented clinical FINDING triggering a protocol-driven physician contact and medication adjustment; whether it rises to a separately codable diagnosis (e.g., worsening heart failure, fluid overload) depends on the physician''s own diagnostic conclusion during that call, which should be reflected in the resulting documentation and coded accordingly rather than assumed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8586b70c-0d11-497c-9ace-d9ad60ec543a', '6940de8e-e59b-48b5-9d28-b5724f5b1974', 3, 'R63.5');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6940de8e-e59b-48b5-9d28-b5724f5b1974', 'eb14689e-dc25-4c5b-b3fd-fae05348a09c', 'This question tests a genuinely important documentation-vs-diagnosis distinction: a clinical FINDING (the specific weight gain, a vital-sign-style data point captured per protocol) is not automatically the same as a physician-rendered DIAGNOSIS — whether this finding represents simply an expected monitoring trigger successfully managed with a phone-order dose adjustment (perhaps not warranting any new diagnosis code beyond the existing heart failure code already on the record) or actually represents a new, codeable acute finding (e.g., fluid overload, early decompensation) depends entirely on how the PHYSICIAN characterizes and documents the clinical significance of that finding during/after the call — a coder should not unilaterally assign a new diagnosis code based solely on a nursing-documented vital sign trend without physician-level diagnostic documentation supporting it.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4b537d0e-dd11-4ff9-993f-6b90a12baa4e', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 50, 'A patient''s home health agency is preparing for a state survey. Surveyors will assess compliance with CoPs including whether the patient''s plan of care is reviewed and revised as frequently as the severity of the patient''s condition requires. What is the minimum CoP-required frequency for this review, absent any condition change requiring more frequent review?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('623dc6e6-f1b6-4528-bcb1-a61650d5a915', '4b537d0e-dd11-4ff9-993f-6b90a12baa4e', 0, 'Every 14 days regardless of condition');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5843e9a4-1322-401c-a61a-dc37ed745378', '4b537d0e-dd11-4ff9-993f-6b90a12baa4e', 1, 'At least every 60 days, coinciding with the certification period, though more frequent review is required if the patient''s condition changes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eab34d96-a4ae-4114-b3ac-bd577a802a44', '4b537d0e-dd11-4ff9-993f-6b90a12baa4e', 2, 'Only at admission and discharge');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2916dab8-0c7b-43b1-8dca-1248b80fb107', '4b537d0e-dd11-4ff9-993f-6b90a12baa4e', 3, 'Every 7 days without exception');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4b537d0e-dd11-4ff9-993f-6b90a12baa4e', '5843e9a4-1322-401c-a61a-dc37ed745378', 'The plan of care must be reviewed by the physician at least as frequently as the patient''s condition requires, but no less frequently than once every 60 days (coinciding with the certification/recertification cycle) — this is the baseline/floor requirement, not a fixed universal schedule, since the CoPs explicitly require MORE frequent review whenever the patient''s condition changes in a way that warrants it (consistent with the plan-of-care revision principle tested earlier in this series), making the 60-day cycle a minimum, not a rigid one-size-fits-all interval.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('882331ee-eafb-42b2-b311-acbc690ad744', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 51, 'A patient with a recent hospitalization for acute pancreatitis (now resolved, confirmed by resolved lipase/amylase and symptom resolution) unrelated to gallstones or alcohol (idiopathic), is on home health for post-hospitalization monitoring and diet advancement. Select the correct principal diagnosis for this home health episode.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('54a72479-8ee1-4532-8448-81dc74daaec8', '882331ee-eafb-42b2-b311-acbc690ad744', 0, 'K85.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8ec2cd06-0628-4517-87f1-a52558483c18', '882331ee-eafb-42b2-b311-acbc690ad744', 1, 'K86.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e26b5291-1e51-4c64-90f4-98cf34872865', '882331ee-eafb-42b2-b311-acbc690ad744', 2, 'Z09');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('babc8b80-9c66-48cf-b1cd-d540dc9c74ca', '882331ee-eafb-42b2-b311-acbc690ad744', 3, 'K85.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('882331ee-eafb-42b2-b311-acbc690ad744', '54a72479-8ee1-4532-8448-81dc74daaec8', 'K85.90 (acute pancreatitis without necrosis or infection, unspecified) is the correct billable code. K85.9 (acute pancreatitis, unspecified) is a non-billable parent category — it exists in the tabular list only as a 4-character heading, with K85.90 as its complete, billable 5-character subdivision that must be used instead, matching the documented acute, resolving, idiopathic presentation with no necrosis/infection specified. K86.9 (disease of pancreas, unspecified — a very generic code that doesn''t even specify pancreatitis) is far too nonspecific here, both under-coding the acute pancreatitis diagnosis actually documented and failing to convey the acute/chronic distinction at all. Z09 (encounter for follow-up exam after completed treatment) would under-represent that the underlying pancreatitis is still the clinically relevant diagnosis actively being monitored during diet advancement, not simply a generic post-treatment check.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0e2d00d8-a96c-43dc-8c57-e844274b4e11', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 52, 'A patient with severe, longstanding major depressive disorder is started on a new augmentation medication (aripiprazole added to an existing antidepressant). Two weeks later, the patient develops akathisia (severe restlessness), confirmed by the physician as a medication-induced movement disorder from the correctly-dosed aripiprazole. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c6fdb679-8ca5-4328-a5d9-03a4b0d45168', '0e2d00d8-a96c-43dc-8c57-e844274b4e11', 0, 'G25.71, T43.595A, F33.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('39033448-affe-4779-942a-b570302eb72d', '0e2d00d8-a96c-43dc-8c57-e844274b4e11', 1, 'F33.2, T43.595A, G25.71');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('53005e0f-a7fd-44b2-beac-846f09718699', '0e2d00d8-a96c-43dc-8c57-e844274b4e11', 2, 'T43.595A, G25.71, F33.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('28b94650-4ae5-4fd7-9b81-4952499c539a', '0e2d00d8-a96c-43dc-8c57-e844274b4e11', 3, 'F33.2, G25.71, T43.595A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0e2d00d8-a96c-43dc-8c57-e844274b4e11', '39033448-affe-4779-942a-b570302eb72d', 'F33.2 (major depressive disorder, recurrent, severe, without psychotic features — matching the documented ''severe'' specifier) is sequenced first as the underlying, pre-existing chronic condition driving the medication regimen, per the same chronic-disease-first sequencing pattern established repeatedly in this exam series. T43.595A (adverse effect of other antipsychotics — aripiprazole''s drug class) follows. G25.71 (drug-induced akathisia) is the specific resulting manifestation code — akathisia has its own specific neurological-manifestation code (G25.71), distinct from and more specific than the general tardive dyskinesia code (G24.01) used in Paper 7''s schizophrenia question, testing whether a candidate distinguishes between these different specific drug-induced movement disorder codes rather than defaulting to the one seen earlier in the series.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('88a641e0-32c0-45a3-a900-076695ad5d34', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 53, 'A patient with a permanent gastrostomy tube (PEG) for dysphagia following a traumatic brain injury has the tube become dislodged, requiring emergency replacement by the physician, now with the new tube in place and home health monitoring the site. Select the correct coding for this specific encounter''s complication.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1d512433-999d-4304-a82c-b2b89a750e1c', '88a641e0-32c0-45a3-a900-076695ad5d34', 0, 'T85.628A, Z93.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2dfe47a5-75d2-43c8-9586-d3eab41e452e', '88a641e0-32c0-45a3-a900-076695ad5d34', 1, 'K94.20, Z93.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c70ca0c4-7b89-4ef8-88c3-a3efe87dde1a', '88a641e0-32c0-45a3-a900-076695ad5d34', 2, 'T85.598A, Z93.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e278c412-37d7-49e1-a3e4-c2311485d3a6', '88a641e0-32c0-45a3-a900-076695ad5d34', 3, 'Z93.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('88a641e0-32c0-45a3-a900-076695ad5d34', '1d512433-999d-4304-a82c-b2b89a750e1c', 'T85.628A (displacement of other gastrointestinal prosthetic devices, implants and grafts, initial encounter — this is the specific code for a dislodged/displaced GI tube like a PEG) precisely matches the documented mechanical displacement complication requiring replacement. K94.20 (gastrostomy complication, unspecified) under-codes the documented specific displacement mechanism when the more specific device-complication code (T85.628A) is available and matches. T85.598A (other mechanical complication of other GI prosthetic devices) is a close but less precise distractor — displacement has its own more specific code (T85.62-) distinct from the general ''other mechanical complication'' code (T85.59-), and the more specific code should be used when it matches the documented complication type. Z93.1 (gastrostomy status) is added as the device-status code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e7a62e17-f9a4-43a2-aa35-403a4a89f953', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 54, 'A patient with generalized anxiety disorder is being treated by home health psychiatric nursing. The nurse documents in the visit note a standardized anxiety severity scale score showing significant improvement since the last visit, but does NOT change the ICD-10-CM diagnosis code, since F41.1 does not have severity-specific 4th/5th characters the way some other diagnosis codes (e.g., major depressive disorder) do. Is this correct coding practice?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('67fc8495-27d5-42fa-9480-73868be81041', 'e7a62e17-f9a4-43a2-aa35-403a4a89f953', 0, 'No — the code should be changed to a ''improved'' variant that must exist somewhere in the F41 family');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fc4c83c1-19cf-4d01-b7a7-6783d5e8e14b', 'e7a62e17-f9a4-43a2-aa35-403a4a89f953', 1, 'Yes — F41.1 (generalized anxiety disorder) does not have built-in severity or improvement-tracking granularity in its code structure the way F32/F33 (depression) codes do with their severity/remission 5th characters; clinical improvement is tracked through narrative documentation and standardized scale scores, not through a different ICD-10-CM code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('83e33a79-2f3f-4577-8a3c-235ef4ceed03', 'e7a62e17-f9a4-43a2-aa35-403a4a89f953', 2, 'The nurse should use a Z-code instead of F41.1 once the patient improves');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7b92c41e-eddf-4722-b112-0f2cdc583894', 'e7a62e17-f9a4-43a2-aa35-403a4a89f953', 3, 'Anxiety disorders should never be tracked with standardized scales in home health documentation');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e7a62e17-f9a4-43a2-aa35-403a4a89f953', 'fc4c83c1-19cf-4d01-b7a7-6783d5e8e14b', 'This is accurate, correct practice: F41.1 (generalized anxiety disorder) is a single code without the severity/remission-specific 5th-character structure that F32/F33 (major depressive disorder) codes have — this asymmetry between different diagnosis code families is a genuine, real feature of ICD-10-CM''s structure (not every condition has equally granular severity coding), and clinical improvement for a condition like GAD is appropriately tracked through narrative documentation and standardized clinical scales (e.g., GAD-7) rather than by inventing or forcing a code change that the classification system doesn''t actually support for this specific diagnosis family.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2d040c0c-42c8-426f-ac7a-1be50dfab13f', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 55, 'A patient with a Stage 4 pressure injury of the right ischium, present on admission, is documented by the wound care physician as having exposed bone with a component of unstageable eschar covering part of the wound bed, making full depth assessment of that portion impossible. Select the correct approach to coding this wound.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ae26b137-c7fd-4c36-a20d-9a0617fc3350', '2d040c0c-42c8-426f-ac7a-1be50dfab13f', 0, 'L89.313 alone (stage 3) since eschar coverage means it cannot be staged higher than 3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ff966411-b1a9-4e1e-bbe6-f05e2e2b5f12', '2d040c0c-42c8-426f-ac7a-1be50dfab13f', 1, 'L89.314 (stage 4), since exposed bone is directly visualized and documented in the assessable portion of the wound, even though part of it is separately obscured by eschar — the highest confirmed stage based on the visualized portion is used');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d32bd9f9-0e43-4fe3-bd45-85bb2b2f6f24', '2d040c0c-42c8-426f-ac7a-1be50dfab13f', 2, 'L89.300 (unstageable) exclusively, since any eschar coverage mandates unstageable classification for the entire wound regardless of other visualized findings');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('622de4eb-efd8-45fb-9f34-88cfa59353f5', '2d040c0c-42c8-426f-ac7a-1be50dfab13f', 3, 'Both L89.314 and L89.300 must be coded together as two separate, simultaneous diagnoses for the same wound');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2d040c0c-42c8-426f-ac7a-1be50dfab13f', 'ff966411-b1a9-4e1e-bbe6-f05e2e2b5f12', 'L89.314 (pressure ulcer of right ischial region, stage 4) is used because the physician has directly documented and visualized exposed bone in an assessable portion of the wound — a wound is coded to its highest confirmed stage based on what IS visualized and documented, even if another portion is separately obscured by eschar; unstageable classification (L89.300 family) is reserved for wounds where the ENTIRE wound bed is obscured by eschar/slough such that no depth/stage can be determined at all, not for a wound where staging IS achievable in the visualized portion. Coding both stage 4 AND unstageable simultaneously for the same single wound would be internally contradictory, not additive.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3127d683-c649-425f-9e8a-39c345d45040', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 56, 'A home health patient''s agency uses telehealth (remote patient monitoring, such as daily weight/BP transmission) as a SUPPLEMENTAL tool alongside in-person skilled nursing visits for a heart failure patient. Per Medicare home health payment rules, how does the telehealth/remote monitoring service factor into the visit count and PDGM payment for the 30-day period?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ce661a8a-ba58-4bbf-8cae-7a9f4a90bcd0', '3127d683-c649-425f-9e8a-39c345d45040', 0, 'Each remote monitoring data transmission counts as a full billable skilled nursing visit, directly increasing the 30-day payment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d4db0e95-4d42-4a4a-ac8b-97b77504d41f', '3127d683-c649-425f-9e8a-39c345d45040', 1, 'Remote patient monitoring is not considered a home health visit for payment/billing purposes and does not itself generate a billable visit, though its cost may be reported on the claim as an allowable administrative cost and its clinical use may support medical necessity documentation for the actual in-person visits ordered');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7b4debff-c08b-4754-a829-321aa2746207', '3127d683-c649-425f-9e8a-39c345d45040', 2, 'Telehealth entirely replaces the need for any in-person visits once implemented');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('29720e36-28b5-46a8-9a3d-7a8145e6f2b5', '3127d683-c649-425f-9e8a-39c345d45040', 3, 'Remote monitoring is prohibited under Medicare home health rules');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3127d683-c649-425f-9e8a-39c345d45040', 'd4db0e95-4d42-4a4a-ac8b-97b77504d41f', 'Under Medicare home health payment rules, remote patient monitoring / telehealth services are not billable as a home health ''visit'' the way an in-person skilled nursing or therapy visit is — they don''t directly generate additional payment as their own billable unit under the PDGM 30-day payment structure, though agencies may report associated costs on the claim as allowed, and the clinical data gathered can meaningfully support the medical necessity and effectiveness of the actual ordered in-person visits. This reflects CMS''s general position (formalized more explicitly starting with the CY2023 home health rule) that telehealth/remote monitoring supplements, rather than substitutes for or independently bills as, in-person visits.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1dce6b42-42ef-46f2-8f37-3eca4b5c71f7', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 57, 'A patient with type 2 diabetes has diabetic autonomic neuropathy causing both gastroparesis AND neurogenic bladder (both confirmed by the physician as related to the same underlying diabetic autonomic neuropathy). Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('50fa73eb-4da0-4be9-ac87-4971888dbd64', '1dce6b42-42ef-46f2-8f37-3eca4b5c71f7', 0, 'E11.43, K31.84, N31.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f192da4b-0c66-4cc8-8e4c-038c287a79b8', '1dce6b42-42ef-46f2-8f37-3eca4b5c71f7', 1, 'E11.43');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('db349e94-27e0-47b6-8891-0e093eff6b51', '1dce6b42-42ef-46f2-8f37-3eca4b5c71f7', 2, 'E11.43, N31.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('48e9a55a-af47-4729-bea4-51b3589305ce', '1dce6b42-42ef-46f2-8f37-3eca4b5c71f7', 3, 'E11.43, K31.84');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1dce6b42-42ef-46f2-8f37-3eca4b5c71f7', 'db349e94-27e0-47b6-8891-0e093eff6b51', 'E11.43 (type 2 diabetes with diabetic autonomic (poly)neuropathy) is the combination code for the underlying neuropathy affecting multiple autonomic targets — this single code already captures the gastroparesis manifestation (as established in Paper 7, Q30, where K31.84 was NOT separately added since E11.43 already conveys that GI-motility complication). N31.9 (neurogenic bladder, unspecified) IS separately added here, however, because it represents a DIFFERENT organ system''s manifestation (urinary, not GI) of the same autonomic neuropathy — ICD-10-CM''s E11.43 combination code doesn''t have built-in scope covering bladder dysfunction the way it implicitly covers GI motility issues under ''gastroparesis'' framing, so a second manifestation code is appropriately added for the distinct urinary complication, while the gastroparesis remains correctly un-stacked per the earlier-established rule.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ad636481-ea92-43d0-8cf2-483e35f4e4ed', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 58, 'A patient''s PDGM functional impairment level (low/medium/high) contributing to case-mix weight is derived primarily from which data source?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6ebea44a-7c6c-4d98-980e-f046b78d534c', 'ad636481-ea92-43d0-8cf2-483e35f4e4ed', 0, 'The patient''s self-reported general quality of life questionnaire');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e080ac40-d36b-45f4-941d-aca2bf2c6efb', 'ad636481-ea92-43d0-8cf2-483e35f4e4ed', 1, 'Selected OASIS functional items (including relevant M-items/GG-items assessing mobility, self-care, and related function) collected at the start of each 30-day period');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a5fd1c37-7424-4153-a5b1-9678593a3873', 'ad636481-ea92-43d0-8cf2-483e35f4e4ed', 2, 'The number of medications the patient is prescribed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d7bfd008-6283-46d1-9c3d-e77c94f3829f', 'ad636481-ea92-43d0-8cf2-483e35f4e4ed', 3, 'The therapy discipline (PT vs. OT vs. SLP) providing the most visits');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ad636481-ea92-43d0-8cf2-483e35f4e4ed', 'e080ac40-d36b-45f4-941d-aca2bf2c6efb', 'PDGM''s functional impairment level (low/medium/high, one of the case-mix adjustment components alongside clinical grouping, admission source, timing, and comorbidity adjustment) is derived from responses to specific OASIS functional assessment items collected at the start of each 30-day period — this is a structured, standardized clinical data source, not a generic quality-of-life questionnaire, medication count, or which specific discipline happens to provide the most visits (the therapy-volume-driven case-mix model was specifically what PDGM replaced, a callback to the same conceptual distractor tested in Q2 of this paper).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c6d17cb4-e122-48df-8a83-a2774ea691b0', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 59, 'A 30-day period of care has total visit volume of 1 skilled nursing visit and 1 PT visit before the patient is discharged early due to an unplanned hospitalization unrelated to home health care quality. How does this low visit volume interact with PDGM payment for that period?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7f79945a-0c44-4070-9a8e-1bb73bfaeaeb', 'c6d17cb4-e122-48df-8a83-a2774ea691b0', 0, 'PDGM has no minimum visit threshold — payment is always the full 30-day case-mix-adjusted amount regardless of visit count');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0e456067-d080-48be-989f-9a35ababbea8', 'c6d17cb4-e122-48df-8a83-a2774ea691b0', 1, 'This may trigger a LUPA (Low Utilization Payment Adjustment), where the period is instead paid based on a per-visit basis (using per-discipline per-visit rates) rather than the full 30-day case-mix payment, since the visit count falls below the case-mix-group-specific LUPA visit threshold');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7c56489b-47d5-4711-bbe8-11e395391a10', 'c6d17cb4-e122-48df-8a83-a2774ea691b0', 2, 'The agency must refund all previously received payments for this patient''s other periods');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7fe830c6-0a65-4560-9925-6d20503e320d', 'c6d17cb4-e122-48df-8a83-a2774ea691b0', 3, 'Low visit volume automatically triggers a fraud investigation');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c6d17cb4-e122-48df-8a83-a2774ea691b0', '0e456067-d080-48be-989f-9a35ababbea8', 'PDGM retains a LUPA (Low Utilization Payment Adjustment) mechanism — each of PDGM''s clinical-group/functional-level/comorbidity combinations (case-mix groups) has its own LUPA visit-count threshold (commonly in the range of 2-6 visits depending on the specific group), and a period falling at or below that threshold is paid on a per-visit basis using standardized per-discipline per-visit rates instead of the full 30-day case-mix-adjusted payment — this is a real, structurally important PDGM payment mechanic distinct from a fraud concern or an all-or-nothing full-episode payment assumption.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b69c67c6-2382-407a-b8f6-b83ce6853bad', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 60, 'A patient with a seizure disorder (generalized tonic-clonic, well-controlled on levetiracetam for the past 3 years, no breakthrough seizures) is admitted to home health for an unrelated post-surgical recovery. Select the correct coding approach for the seizure disorder.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('51c280d1-16d7-494a-aa55-61f1a2624160', 'b69c67c6-2382-407a-b8f6-b83ce6853bad', 0, 'G40.909');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('98701488-2401-4cfb-8a78-4247d9586689', 'b69c67c6-2382-407a-b8f6-b83ce6853bad', 1, 'G40.b119');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d22d56ac-141c-4461-99e4-992a84dc3405', 'b69c67c6-2382-407a-b8f6-b83ce6853bad', 2, 'R56.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('54c20de8-9a72-452b-9250-02a943d323f5', 'b69c67c6-2382-407a-b8f6-b83ce6853bad', 3, 'Z86.69');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b69c67c6-2382-407a-b8f6-b83ce6853bad', '51c280d1-16d7-494a-aa55-61f1a2624160', 'G40.909 (epilepsy, unspecified, not intractable, without status epilepticus) remains the correct ACTIVE diagnosis code even though the patient is currently well-controlled with no breakthrough seizures — unlike some of the ''resolved condition converts to history'' examples elsewhere in this exam series, a chronic seizure disorder controlled by ongoing anti-epileptic medication is NOT the same as a resolved condition; the patient still HAS epilepsy and requires ongoing medication management, so it remains coded as an active, current diagnosis (not Z86.69, personal history of other diseases of the nervous system, which would incorrectly imply the epilepsy itself is no longer present). This distinction — chronic condition well-controlled on ongoing treatment (still active/current) vs. genuinely resolved condition no longer being treated (history) — is a recurring theme across this exam series and is worth deliberately contrasting here.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1f596cfb-c75c-4c3c-8f0f-4215a2ba1d4b', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 61, 'A patient with a seizure disorder, previously well-controlled with no breakthrough seizures in 3 years, has a single breakthrough generalized tonic-clonic seizure at home, witnessed by the home health aide, lasting approximately 90 seconds with a normal postictal recovery, with no injury and no status epilepticus. The physician does not change the intractability characterization of the epilepsy based on this single event. Select the correct coding for THIS specific breakthrough seizure event.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cf91923d-a8f1-4a13-9cca-2cf718700c28', '1f596cfb-c75c-4c3c-8f0f-4215a2ba1d4b', 0, 'G40.909');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('96c0e017-b039-44d3-8cba-7008c8745b0f', '1f596cfb-c75c-4c3c-8f0f-4215a2ba1d4b', 1, 'G40.919');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2b925015-93e0-42c7-8b8f-4485327ada9c', '1f596cfb-c75c-4c3c-8f0f-4215a2ba1d4b', 2, 'R56.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('57a406c9-617f-4d8a-8029-ade0ea086d66', '1f596cfb-c75c-4c3c-8f0f-4215a2ba1d4b', 3, 'G40.909, R56.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1f596cfb-c75c-4c3c-8f0f-4215a2ba1d4b', 'cf91923d-a8f1-4a13-9cca-2cf718700c28', 'G40.909 (epilepsy, unspecified, not intractable, without status epilepticus) remains correct — the SAME code as the patient''s baseline diagnosis — because a single breakthrough seizure in an otherwise well-controlled patient does not, by itself, establish ''intractable'' epilepsy (a specific clinical designation requiring a documented pattern of poor response to adequate treatment trials, which the physician explicitly does not conclude here based on this one event). G40.919 (the intractable variant) would over-code this single event as a fundamental change in the epilepsy''s classification, which isn''t supported by the physician''s own assessment. R56.9 (unspecified convulsions) would be used for a NEW, undiagnosed seizure event in a patient WITHOUT an established epilepsy diagnosis, which doesn''t apply here given the pre-existing diagnosis — a witnessed breakthrough seizure in a known epilepsy patient is simply a manifestation of the already-coded chronic condition, not a new diagnosis.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3c49e0a4-53bc-4e2a-9b80-4e7206ab7710', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 62, 'A patient with chronic wound care needs due to venous stasis ulcers has a home health aide providing personal care assistance (bathing, dressing) under the supervision of a registered nurse who makes periodic supervisory visits. Per CoP requirements, how frequently must the RN supervisory visit occur when the aide provides services to a patient not also receiving skilled nursing care?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1e3c55ff-68af-4da2-991e-39833402607f', '3c49e0a4-53bc-4e2a-9b80-4e7206ab7710', 0, 'Every 14 days, with the visit occurring while the aide is present providing care at least every other supervisory visit');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('693fb178-a518-48c8-9c69-95e05f52b66f', '3c49e0a4-53bc-4e2a-9b80-4e7206ab7710', 1, 'Only once, at the start of aide services');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dfd37f84-f855-4fa6-a47b-40805a95e356', '3c49e0a4-53bc-4e2a-9b80-4e7206ab7710', 2, 'Every 60 days, aligned with recertification');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f33fbbbd-707e-41f8-b456-78ad1edcee02', '3c49e0a4-53bc-4e2a-9b80-4e7206ab7710', 3, 'Supervisory visits are not required if the patient has family present during aide visits');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3c49e0a4-53bc-4e2a-9b80-4e7206ab7710', '1e3c55ff-68af-4da2-991e-39833402607f', 'Per CoP home health aide supervision requirements, when a patient is receiving ONLY aide services (no skilled nursing, PT, OT, or SLP), an RN must make an on-site supervisory visit at least every 14 days, and these visits must periodically occur while the aide is actually present providing care (not only during separate, aide-absent supervisory visits) to allow direct observation of the aide''s performance — this is a more frequent standard than the general 60-day plan-of-care review cycle, reflecting the specific oversight responsibility for unlicensed aide staff providing hands-on personal care.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0628cbad-8a3a-46c4-8c9a-4ae4192fa20d', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 63, 'A patient with a wound requiring aide-assisted care ALSO receives skilled nursing visits from the same agency. Does the RN supervisory visit frequency requirement for the aide change compared to the aide-only scenario?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2805dfcd-ebe0-4b33-abdc-08e19ba275d3', '0628cbad-8a3a-46c4-8c9a-4ae4192fa20d', 0, 'No change — still every 14 days regardless of whether skilled nursing is also involved');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fe769f1d-2093-4273-bc6e-5d4a0fe37142', '0628cbad-8a3a-46c4-8c9a-4ae4192fa20d', 1, 'Yes — when the patient also receives skilled nursing (or PT/OT/SLP), the supervisory visit frequency requirement changes to at least every 60 days, since the skilled clinician''s regular presence provides additional, ongoing oversight opportunity');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('252392bc-d39a-4dd6-84ef-ea4b0c20c0e2', '0628cbad-8a3a-46c4-8c9a-4ae4192fa20d', 2, 'Supervisory visits become entirely optional once skilled nursing is also involved');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8ac9aae1-246b-49b6-b86d-735b45eb12b3', '0628cbad-8a3a-46c4-8c9a-4ae4192fa20d', 3, 'The frequency doubles to every 7 days when skilled nursing is also present');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0628cbad-8a3a-46c4-8c9a-4ae4192fa20d', 'fe769f1d-2093-4273-bc6e-5d4a0fe37142', 'When a patient is also receiving skilled care (nursing, PT, OT, or SLP) in addition to aide services, the RN supervisory visit requirement for the aide relaxes to at least every 60 days, rather than the stricter every-14-days standard required for aide-only patients — the rationale is that the skilled clinician''s ongoing, regular presence in the home provides additional opportunities to observe/identify concerns with the aide''s care, reducing the need for the more frequent dedicated supervisory visit cadence required when aide services are the ONLY service being furnished.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('aa4cff58-623a-4b86-a33c-6b253a5144ac', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 64, 'A patient with atrial fibrillation and mechanical mitral valve replacement is on warfarin with a target INR of 2.5-3.5 (higher than the standard 2-3 range used for AFib alone, due to the mechanical valve). The home health nurse''s INR check returns 2.8 — within the mechanical-valve target range but would be considered ''supratherapeutic'' if the standard AFib-only range were mistakenly applied. Select the correct coding approach for this INR finding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b453cf8a-7637-4e7d-9c96-4ace84a8835e', 'aa4cff58-623a-4b86-a33c-6b253a5144ac', 0, 'R79.1, since any INR outside the standard 2-3 range must be flagged as abnormal regardless of context');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('74800b3b-b184-40cf-b482-5ebb22710f7b', 'aa4cff58-623a-4b86-a33c-6b253a5144ac', 1, 'No abnormal finding code is needed — the INR of 2.8 is WITHIN this specific patient''s correct, physician-established therapeutic target range for their mechanical valve, and coding it as an abnormal finding would misrepresent an actually-appropriate, on-target lab value');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6b0f9b09-6ac5-4818-8f4f-b2a0879ac5eb', 'aa4cff58-623a-4b86-a33c-6b253a5144ac', 2, 'T45.515A, since anticoagulation always requires an adverse-effect code regardless of the INR result');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2c6ca317-b02f-4922-8c5b-d8cf24d6b50d', 'aa4cff58-623a-4b86-a33c-6b253a5144ac', 3, 'Z79.01 alone is insufficient and must always be paired with R79.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('aa4cff58-623a-4b86-a33c-6b253a5144ac', '74800b3b-b184-40cf-b482-5ebb22710f7b', 'This tests whether a candidate applies a one-size-fits-all ''normal range'' assumption rather than recognizing that therapeutic targets are genuinely patient-specific — a mechanical mitral valve patient has a HIGHER target INR range (2.5-3.5) than a typical AFib-only patient (2-3) due to the greater thrombotic risk of a mechanical valve, so an INR of 2.8 is squarely within THIS patient''s correct, physician-established target and should not be coded as an abnormal finding (R79.1) at all — doing so would incorrectly flag an appropriately-managed, on-target lab value as a problem. No adverse-effect code applies either, since there''s no documented adverse reaction, just a correctly-targeted lab result.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('920d72f0-57cd-46b7-a9c1-a383860510de', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 65, 'A patient with a recent transurethral resection of the prostate (TURP) for benign prostatic hyperplasia develops post-procedural urinary retention requiring a temporary indwelling catheter, managed at home. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('41713a71-b4fb-41ba-8042-2dd416087c43', '920d72f0-57cd-46b7-a9c1-a383860510de', 0, 'N40.1, R33.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('38146709-2629-447f-a9eb-b2f2b7079883', '920d72f0-57cd-46b7-a9c1-a383860510de', 1, 'R33.9, N40.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('20a6491c-8713-4079-92ca-0d2b3836a305', '920d72f0-57cd-46b7-a9c1-a383860510de', 2, 'N99.89, R33.9, N40.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4840d8fd-603a-41c0-9389-60649f92f904', '920d72f0-57cd-46b7-a9c1-a383860510de', 3, 'N99.516, N40.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('920d72f0-57cd-46b7-a9c1-a383860510de', '20a6491c-8713-4079-92ca-0d2b3836a305', 'N99.89 (other postprocedural complications and disorders of genitourinary system) plus R33.9 (retention of urine, unspecified) together is the correct combination — ICD-10-CM does NOT have a single dedicated combination code for ''postprocedural urinary retention'' the way it does for some other postprocedural complications; N99.89 flags the general postprocedural GU-complication relationship to the recent TURP, while R33.9 specifies the actual retention finding. N99.516 does not exist as a code at all — the entire N99.5x family covers complications of urinary STOMAS (cystostomy, incontinent/continent external urinary diversions), which is a completely different clinical concept from a TURP (no stoma is created in a TURP). R33.9 alone (option B) under-codes by omitting the postprocedural relationship to the recent TURP. N40.1 (BPH with lower urinary tract symptoms) is added as the underlying condition that necessitated the TURP.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2d5bbbb8-9e0c-4b4f-b9aa-ddb5eb0a75ab', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 66, 'A patient with chronic axial low back pain (no leg symptoms) from lumbar degenerative disc disease is on a stable, long-term opioid regimen managed by a pain management specialist, with regular urine drug screening per the pain contract, most recently negative for illicit substances and consistent with prescribed medications. Select the correct coding to reflect the long-term opioid therapy status.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f164b8cd-443d-4014-a48c-40ad8f580e18', '2d5bbbb8-9e0c-4b4f-b9aa-ddb5eb0a75ab', 0, 'F11.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('545b8e74-55b5-4e61-b1ca-d93d96432b38', '2d5bbbb8-9e0c-4b4f-b9aa-ddb5eb0a75ab', 1, 'M51.360, Z79.891');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('87f9046f-5bbb-4748-91af-96634fcfc558', '2d5bbbb8-9e0c-4b4f-b9aa-ddb5eb0a75ab', 2, 'Z79.891');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('146f4802-2314-417d-9f9d-982957035a02', '2d5bbbb8-9e0c-4b4f-b9aa-ddb5eb0a75ab', 3, 'F11.20, M51.360');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2d5bbbb8-9e0c-4b4f-b9aa-ddb5eb0a75ab', '545b8e74-55b5-4e61-b1ca-d93d96432b38', 'M51.360 (other intervertebral disc degeneration, lumbar region, with discogenic back pain only) is coded as the underlying condition driving the pain management, matching the documented axial-only pain pattern with no leg symptoms — M51.36 alone is a non-billable parent requiring this pain-distribution specification (back pain only, leg pain only, both, or neither). Z79.891 (long term (current) drug therapy with opioid analgesic) is added as the appropriate status code reflecting ongoing, medically-supervised, monitored opioid use — F11.20 (opioid dependence) and F11.90 (opioid use, unspecified) would incorrectly imply a diagnosed substance use disorder, which isn''t supported by this stem''s description of appropriately monitored, prescribed, contract-compliant pain management with negative/consistent drug screening — Z79.891 is specifically the correct code for this scenario of legitimate, monitored therapeutic long-term opioid use without a diagnosed use disorder.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('518fc29d-9fa7-4e14-8b88-f45e82d203ef', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 67, 'A patient''s home health record includes a grievance filed by the patient regarding a specific aide''s conduct. Per CoP patient rights requirements, what must the agency do with this grievance?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fd4db0a0-68a7-4ac8-8092-32b1489df4cc', '518fc29d-9fa7-4e14-8b88-f45e82d203ef', 0, 'The agency must investigate the grievance, document the investigation and resolution, and may not discriminate or retaliate against the patient for having filed it');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ba899c91-b1ce-4489-9fc1-eecd42947300', '518fc29d-9fa7-4e14-8b88-f45e82d203ef', 1, 'Grievances from patients are recorded but need not be formally investigated unless filed with CMS directly');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('021e76ac-b0e2-4ae2-9ba2-0022ee318e68', '518fc29d-9fa7-4e14-8b88-f45e82d203ef', 2, 'The aide in question must be immediately terminated regardless of investigation findings');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d2baa06b-0193-4938-b094-3faeea6b22e2', '518fc29d-9fa7-4e14-8b88-f45e82d203ef', 3, 'Grievances are only actionable if submitted in writing by a patient''s attorney');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('518fc29d-9fa7-4e14-8b88-f45e82d203ef', 'fd4db0a0-68a7-4ac8-8092-32b1489df4cc', 'CoP patient rights requirements obligate the agency to have a grievance process that includes investigating patient complaints/grievances, documenting the investigation and its resolution, and explicitly prohibit retaliation or discrimination against a patient for having filed a grievance — this is a genuine, actionable internal obligation, not something that only matters once escalated to CMS, and does not mandate a predetermined outcome (like automatic termination) independent of the actual investigation findings, nor does it require attorney involvement to be valid.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('00b120b6-fbf1-43fc-9c13-8acbe7210627', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 68, 'A patient with a recent lumbar fusion surgery has a documented nonunion of the fusion site at a 6-month follow-up, requiring continued bracing and activity modification managed by home health. Select the correct coding, including the appropriate 7th character.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('35dbad57-d4b8-4590-9200-ccc634b2dfc3', '00b120b6-fbf1-43fc-9c13-8acbe7210627', 0, 'M96.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a208d638-930d-4b96-a901-fd910889431a', '00b120b6-fbf1-43fc-9c13-8acbe7210627', 1, 'S32.010D');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d978df15-5c35-489a-9a37-24154a65bab0', '00b120b6-fbf1-43fc-9c13-8acbe7210627', 2, 'S32.010A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d30f46f1-5501-4877-a3ea-2cee773c87ab', '00b120b6-fbf1-43fc-9c13-8acbe7210627', 3, 'M96.0, Z98.890');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('00b120b6-fbf1-43fc-9c13-8acbe7210627', '35dbad57-d4b8-4590-9200-ccc634b2dfc3', 'M96.0 (pseudarthrosis after fusion or arthrodesis — the specific code for a nonunion following a spinal fusion procedure) is the correct, specific combination code for this exact complication — S32.010- (fracture codes) do not apply here at all, since this isn''t a traumatic vertebral fracture, it''s a surgical fusion complication, an entirely different code family and clinical concept; a candidate defaulting to a fracture 7th-character framework here would be applying the wrong code family altogether, not just the wrong 7th character within the right family.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ac44934f-d9c3-4ac5-a63e-1aae38b7c3df', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 69, 'A patient has a traumatic fracture of the right tibia, now at a follow-up visit 10 weeks post-injury, with the physician documenting delayed healing (not yet a confirmed nonunion, but healing slower than the expected timeline, still requiring active fracture care and non-weight-bearing status). Select the correct 7th character for this specific encounter.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('495798c6-d43e-48c1-9027-5ea7fad042e9', 'ac44934f-d9c3-4ac5-a63e-1aae38b7c3df', 0, 'A - initial encounter');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c9c66443-e6a4-4804-865f-d17dbff76901', 'ac44934f-d9c3-4ac5-a63e-1aae38b7c3df', 1, 'D - subsequent encounter for fracture with routine healing');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('19507ad4-769b-493b-ac7b-6c8e2647765d', 'ac44934f-d9c3-4ac5-a63e-1aae38b7c3df', 2, 'G - subsequent encounter for fracture with delayed healing');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c1b269ab-e48a-49a8-8088-ed8cd40af714', 'ac44934f-d9c3-4ac5-a63e-1aae38b7c3df', 3, 'K - subsequent encounter for fracture with nonunion');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ac44934f-d9c3-4ac5-a63e-1aae38b7c3df', '19507ad4-769b-493b-ac7b-6c8e2647765d', '7th character ''G'' (subsequent encounter for closed fracture with delayed healing) specifically matches the documented finding — delayed healing is its own distinct, intermediate 7th-character category between routine healing (D) and nonunion (K), and using D would inaccurately suggest the healing trajectory is normal/expected when the physician has specifically documented it as delayed. This is a genuinely useful distinction many candidates miss, defaulting to the more commonly-used ''D'' character without checking whether the documentation actually supports ''routine'' healing versus a specifically slower, delayed pattern that has its own dedicated 7th character.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9579ec93-3797-4710-89b0-a2c5879f3c55', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 70, 'A patient''s home health record shows the agency accepted a physician referral and admitted the patient without first confirming that the patient''s insurance (a Medicare Advantage plan) had authorized home health services, later resulting in a denied claim. Per general compliance/business practice (not a specific numbered CoP), what is the key operational lesson, distinct from the clinical CoP requirements tested elsewhere in this paper?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fcf77bf6-bf96-492d-94a3-785c2b8ad6be', '9579ec93-3797-4710-89b0-a2c5879f3c55', 0, 'CoPs themselves mandate pre-authorization verification as a condition of Medicare participation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a30ce444-a50b-411d-ba0c-b656fe5178b6', '9579ec93-3797-4710-89b0-a2c5879f3c55', 1, 'While CoPs govern the CLINICAL conditions for participation (assessment, care planning, supervision, etc.), payer-specific authorization/utilization requirements (common with Medicare Advantage plans, which may have distinct rules from Traditional Medicare) are a separate operational/business requirement the agency must independently track to avoid denied claims, even though a CoP violation isn''t necessarily what caused this specific denial');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('85ea4745-ffc6-42d6-a721-e7f92d89f244', '9579ec93-3797-4710-89b0-a2c5879f3c55', 2, 'This scenario represents a CoP violation specifically related to patient rights');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('71368993-cd84-4e19-8944-662e7d12b2b6', '9579ec93-3797-4710-89b0-a2c5879f3c55', 3, 'Medicare Advantage plans are prohibited from requiring any authorization for home health services');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9579ec93-3797-4710-89b0-a2c5879f3c55', 'a30ce444-a50b-411d-ba0c-b656fe5178b6', 'This question distinguishes CoPs (federal clinical/operational conditions for Medicare certification — assessment timing, care planning, supervision, patient rights, QAPI, etc., tested throughout this paper) from payer-specific business/authorization requirements, which are a separate compliance layer, particularly relevant for Medicare Advantage plans that may impose their own prior-authorization or utilization management rules distinct from Traditional Medicare — failing to verify authorization isn''t itself a CoP violation, but is a genuine, separate operational risk the agency must manage, testing whether a candidate can distinguish ''this is a CoP requirement'' from ''this is a real compliance/business risk that ISN''T a CoP requirement,'' both of which matter but are governed by different rules.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('63e5a97b-c5c1-4a60-83ef-d95b627e741b', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 71, 'A patient with COPD and a new diagnosis of lung cancer (non-small cell, right upper lobe, confirmed by biopsy) is starting outpatient chemotherapy while receiving home health for symptom management and COPD care. Select the correct principal diagnosis, addressing sequencing between the COPD and the new cancer diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1204d89c-8785-4cdd-b40a-c3cfab7d0bba', '63e5a97b-c5c1-4a60-83ef-d95b627e741b', 0, 'J44.9, C34.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2af71a2c-8218-46d0-abc2-c1b10b58f043', '63e5a97b-c5c1-4a60-83ef-d95b627e741b', 1, 'C34.11, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b858fca4-3acd-4d75-b798-c1a3b6bf1922', '63e5a97b-c5c1-4a60-83ef-d95b627e741b', 2, 'C34.90, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3aa2ca41-8d22-478e-a0ef-e44c034c8ae9', '63e5a97b-c5c1-4a60-83ef-d95b627e741b', 3, 'C34.11');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('63e5a97b-c5c1-4a60-83ef-d95b627e741b', '2af71a2c-8218-46d0-abc2-c1b10b58f043', 'C34.11 (malignant neoplasm of upper lobe, right bronchus or lung) is sequenced first, since the new cancer diagnosis and its associated treatment (chemotherapy, symptom management) represents the more acute, currently-dominant clinical focus of this home health episode — C34.90 (malignant neoplasm of unspecified part of unspecified bronchus or lung) would under-code the documented specific lobe/laterality. J44.9 (COPD) remains coded as a separate, genuinely still-active chronic condition also being managed at the same encounter, sequenced after the more acute cancer diagnosis reflecting the current primary treatment focus.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1353a316-83ba-4c62-82a5-e7b3fb42c5dd', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 72, 'A patient with hypertension is noted by the home health nurse to have a blood pressure reading of 168/98 at a routine visit, above the patient''s usual well-controlled baseline of around 130/80, with no other symptoms. The nurse contacts the physician per protocol, who adjusts the antihypertensive regimen. Select the correct coding for this specific visit''s blood pressure finding, addressing whether an elevated reading alone changes the hypertension coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('efc44240-cf31-45e1-8537-327d8346f060', '1353a316-83ba-4c62-82a5-e7b3fb42c5dd', 0, 'I10 alone remains the correct code; a single elevated reading being actively managed through routine medication titration doesn''t change the underlying diagnosis code — there''s no ''uncontrolled hypertension'' 4th/5th character variant in ICD-10-CM''s I10 the way some other chronic conditions have severity-specific codes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e3641842-202f-4519-b327-15d1c10ffdd9', '1353a316-83ba-4c62-82a5-e7b3fb42c5dd', 1, 'I16.9 (hypertensive urgency) must be used for any reading above 160/90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eaaf4052-440f-4a05-9264-8416625762a2', '1353a316-83ba-4c62-82a5-e7b3fb42c5dd', 2, 'R03.0 (elevated blood pressure without diagnosis of hypertension) replaces I10 for this visit');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0a61a023-279e-40d9-b80c-004f266f35cb', '1353a316-83ba-4c62-82a5-e7b3fb42c5dd', 3, 'I10 is discontinued and replaced permanently with I15.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1353a316-83ba-4c62-82a5-e7b3fb42c5dd', 'efc44240-cf31-45e1-8537-327d8346f060', 'I10 (essential hypertension) remains the correct code — ICD-10-CM''s I10 does not have severity/control-status-specific 4th or 5th characters the way some other chronic disease families do (mirroring the F41.1 anxiety-severity-tracking question earlier in this paper), so a single elevated reading prompting routine medication adjustment doesn''t change the underlying diagnosis code; the elevated reading and the physician''s response are documented in the visit note and clinical narrative. I16.9 (hypertensive urgency, a specific, more severe clinical diagnosis requiring the physician to actually document that specific escalated diagnosis, not simply an elevated reading managed by routine outpatient titration) would over-code this presentation absent that specific physician determination. R03.0 is used when hypertension is NOT an already-established diagnosis, which doesn''t apply here.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b172fcb0-719d-4fd9-a1c9-58a6051cbf0f', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 73, 'A patient''s home health agency''s infection control program, per CoP requirements, must include which of the following?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9a2b2e29-da46-4f8b-aabf-477837ce06a8', 'b172fcb0-719d-4fd9-a1c9-58a6051cbf0f', 0, 'A system for identifying, reporting, investigating, and controlling infections and communicable diseases, including staff education on standard precautions, integrated with the agency''s QAPI program');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9e4b3ba2-c8ac-4850-8d72-61858ec7d64f', 'b172fcb0-719d-4fd9-a1c9-58a6051cbf0f', 1, 'Infection control is solely the responsibility of the patient''s primary care physician, not the home health agency');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e1d080ea-4b8e-4e81-ba83-138e294fb331', 'b172fcb0-719d-4fd9-a1c9-58a6051cbf0f', 2, 'Infection control policies are only required for agencies serving immunocompromised patient populations');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eef860ee-1d89-4718-9341-9f6a033351df', 'b172fcb0-719d-4fd9-a1c9-58a6051cbf0f', 3, 'A single annual infection control training satisfies all ongoing requirements with no further tracking needed');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b172fcb0-719d-4fd9-a1c9-58a6051cbf0f', '9a2b2e29-da46-4f8b-aabf-477837ce06a8', 'The CoP infection control requirement (42 CFR 484.70) requires the agency to maintain a system for identifying, reporting, investigating, and controlling infections and communicable diseases, including staff education on standard precautions and infection prevention practices, and this program must be integrated with the agency''s broader QAPI quality program — this is a comprehensive, ongoing agency-wide obligation applying to all patients (not limited to immunocompromised populations specifically) and is not satisfied by a single annual training disconnected from ongoing surveillance/reporting.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d5469b0d-3ef5-4ba3-b760-56ff072c0f1e', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 74, 'A patient with a documented allergy to penicillin (confirmed anaphylaxis in the past) is prescribed a cephalosporin by the physician, who is aware of the penicillin allergy and has determined the specific cephalosporin has acceptably low cross-reactivity risk for this patient. The home health nurse administers the first dose without incident. How should the penicillin allergy be reflected in ongoing documentation for this encounter?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('99b067da-1c26-4a89-b19e-3dc0b5c4b350', 'd5469b0d-3ef5-4ba3-b760-56ff072c0f1e', 0, 'Z88.0 should be documented as an active allergy status code, and the plan of care/clinical documentation should reflect the physician''s specific cross-reactivity risk assessment supporting the cephalosporin choice, as relevant safety context');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a7e372b6-3604-4793-bb72-b4dc5a0e348e', 'd5469b0d-3ef5-4ba3-b760-56ff072c0f1e', 1, 'The penicillin allergy should be removed from the record since a different drug class is now being used');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('657246be-1bda-4ac4-8fc5-d5c7351be1dc', 'd5469b0d-3ef5-4ba3-b760-56ff072c0f1e', 2, 'T78.40XA should be used since any allergy history requires an active reaction code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ab2613ed-3db6-427e-98e3-b016f619f30c', 'd5469b0d-3ef5-4ba3-b760-56ff072c0f1e', 3, 'No documentation is needed since the cephalosporin dose was tolerated without incident');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d5469b0d-3ef5-4ba3-b760-56ff072c0f1e', '99b067da-1c26-4a89-b19e-3dc0b5c4b350', 'Z88.0 (allergy status to penicillin) remains appropriately documented as an ongoing, clinically relevant status code — it should NOT be removed just because a different (even if related) drug class is now being used, since the allergy itself is a permanent patient safety fact relevant to all future prescribing decisions, not just the current medication choice. T78.40XA (an ACTIVE allergic reaction code) doesn''t apply here since no current reaction is occurring — this is a stable allergy history informing a careful, physician-assessed prescribing decision, which itself is valuable clinical documentation worth capturing in the narrative even though it doesn''t have its own dedicated ICD-10-CM code for ''cross-reactivity risk assessment'' as a discrete concept.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bcc301fb-1481-47cc-95ea-8e2fde14102f', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 75, 'A patient''s PDGM 30-day period has an admission source classified as ''institutional'' rather than ''community.'' What does this classification specifically reflect, and how does it affect payment?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('13f533c1-62f3-4194-a7de-c9f7a0ed956a', 'bcc301fb-1481-47cc-95ea-8e2fde14102f', 0, 'Whether the patient lives in a nursing home permanently, which has no effect on PDGM payment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fcfb54cc-d6e0-4ddb-ba29-4cc05ca6b274', 'bcc301fb-1481-47cc-95ea-8e2fde14102f', 1, 'Whether the 30-day period was preceded by an acute or post-acute care facility stay (e.g., hospital, SNF, IRF) within the 14 days prior to home health admission — institutional-source periods generally receive a higher case-mix weight than community-source periods, reflecting the typically higher acuity of patients transitioning directly from facility care');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9ae373e1-9ac1-40f0-8126-fd6e3ce1cb32', 'bcc301fb-1481-47cc-95ea-8e2fde14102f', 2, 'Whether the physician certifying the plan of care works within a hospital-owned practice');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('13007684-cfef-4753-b4d9-89f451672b8d', 'bcc301fb-1481-47cc-95ea-8e2fde14102f', 3, 'Whether the patient requires DME (durable medical equipment) delivered to an institutional setting');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('bcc301fb-1481-47cc-95ea-8e2fde14102f', 'fcfb54cc-d6e0-4ddb-ba29-4cc05ca6b274', 'PDGM''s admission-source classification (community vs. institutional) reflects whether the patient had a qualifying acute or post-acute facility stay in the 14 days immediately preceding the home health admission — institutional-source periods are generally weighted with higher case-mix payment than community-source periods, reflecting the clinical reality that patients transitioning directly from facility-based care often present with higher acuity and more complex care needs at home health admission, a distinct case-mix component from clinical grouping, functional level, timing, and comorbidity adjustment.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b1730c12-f115-41c9-b643-9cf51351e587', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 76, 'A patient with a recent stroke has residual dysarthria (slurred, difficult-to-understand speech) without any accompanying aphasia (language comprehension/production is intact — this is purely a motor speech production issue). Select the correct coding, distinguishing this from the aphasia code used in Paper 7''s stroke sequela question.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('126f5d72-53c8-4ae5-82d5-7dae9859c642', 'b1730c12-f115-41c9-b643-9cf51351e587', 0, 'I69.320');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2e925b0c-f74f-4abd-9c90-1229b61e174d', 'b1730c12-f115-41c9-b643-9cf51351e587', 1, 'R47.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('98d6c8d9-dd31-48ee-9a7b-df88b865c7d2', 'b1730c12-f115-41c9-b643-9cf51351e587', 2, 'I69.322');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9ee551ad-e1ca-4fd8-9594-3f928f0b44d1', 'b1730c12-f115-41c9-b643-9cf51351e587', 3, 'I69.90');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b1730c12-f115-41c9-b643-9cf51351e587', '98d6c8d9-dd31-48ee-9a7b-df88b865c7d2', 'I69.322 (dysarthria following cerebral infarction) is the specific stroke-sequela combination code for this exact residual deficit — distinct from I69.320 (aphasia following cerebral infarction, used in Paper 7''s Q23 for a LANGUAGE deficit) because dysarthria is a MOTOR SPEECH PRODUCTION problem, not a language comprehension/production problem, and ICD-10-CM''s I69.3xx family has separate, specific codes for each distinct type of residual deficit. R47.1 (dysarthria and anarthria, a general symptom code) would under-code the documented stroke-etiology relationship, the same etiology-code-over-symptom-code principle tested with the dysphagia question earlier in this paper.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('26309605-adbf-427b-8879-4b631d0c9e90', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 77, 'A patient with congestive heart failure has an implanted CardioMEMS pulmonary artery pressure sensor for remote hemodynamic monitoring, with data reviewed weekly by the cardiologist to guide diuretic adjustments. Select the correct coding to reflect the presence of this device, in addition to the heart failure diagnosis itself.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cbca819a-7597-474e-98f7-a43bdea9d969', '26309605-adbf-427b-8879-4b631d0c9e90', 0, 'I50.9, Z95.828');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5a37fe0e-18f4-4f71-8f0a-a990fd5c49ab', '26309605-adbf-427b-8879-4b631d0c9e90', 1, 'Z45.09, I50.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c3187ca9-ad25-4c4c-beec-c69e586382e1', '26309605-adbf-427b-8879-4b631d0c9e90', 2, 'I50.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6ad9449c-5cea-4eb5-a5bd-bdba3cc306ef', '26309605-adbf-427b-8879-4b631d0c9e90', 3, 'T82.847A, I50.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('26309605-adbf-427b-8879-4b631d0c9e90', 'cbca819a-7597-474e-98f7-a43bdea9d969', 'I50.9 (heart failure, unspecified — or a more specific I50.2x/I50.3x code if type/chronicity is documented, per the precision-matching principle tested elsewhere in this paper) is sequenced first as the underlying condition being monitored. Z95.828 (presence of other cardiac implants and grafts) is the correct device-status code for an implanted hemodynamic monitoring sensor like CardioMEMS — this is a cardiac implant, so it falls under the Z95 (presence of cardiac/vascular implants) family rather than Z45.09 (encounter for adjustment/management of other cardiac device, which describes an ENCOUNTER for device programming/adjustment, not an ongoing device-presence status) or T82.847A (a device COMPLICATION code, not applicable here since the device is functioning as intended with no documented malfunction).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('98b54317-b12d-4881-9481-5c80f3084443', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 78, 'A patient with chronic kidney disease stage 4 is found to have a new diagnosis of secondary hyperparathyroidism, confirmed by elevated PTH labs, physician-documented as due to the CKD. Select the correct coding, addressing whether a combination code applies.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('909b8ac8-7300-48bb-b486-34e741758cb9', '98b54317-b12d-4881-9481-5c80f3084443', 0, 'N18.4, E21.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('25bfa5cf-ba33-460e-a63b-33dc85e9300e', '98b54317-b12d-4881-9481-5c80f3084443', 1, 'E21.1, N18.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8c815083-ed3d-4d3e-bbf9-8d2870ec4b5c', '98b54317-b12d-4881-9481-5c80f3084443', 2, 'N25.81, N18.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8fadbc38-a0be-4e0f-9bc1-0b794d375d40', '98b54317-b12d-4881-9481-5c80f3084443', 3, 'N18.4, N25.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('98b54317-b12d-4881-9481-5c80f3084443', '8fadbc38-a0be-4e0f-9bc1-0b794d375d40', 'N18.4 (CKD stage 4) is sequenced first as the underlying condition. N25.81 (secondary hyperparathyroidism of renal origin) is the correct manifestation code — its title specifically names renal origin, making it the precise match once the physician documents the hyperparathyroidism as due to the CKD. E21.1 (secondary hyperparathyroidism, not elsewhere classified) is the wrong choice here specifically because it excludes the renal-origin form — E21.1 is reserved for secondary hyperparathyroidism from NON-renal causes (e.g., malabsorption, vitamin D deficiency unrelated to kidney disease), while N25.81 is the dedicated code once CKD/renal disease is the documented cause. There is no single combination code merging CKD and renal hyperparathyroidism into one code the way there is for CKD-with-anemia (D63.1, tested in Paper 7) or diabetes-with-CKD, so these remain two separately sequenced codes, with the underlying CKD leading.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6955924d-3fea-4234-ad60-e4b56ddf6a74', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 79, 'A patient''s home health record must document the patient''s or representative''s informed consent understanding of the plan of care, including risks/benefits of treatment. If a patient with fluctuating capacity (e.g., due to early-stage dementia with documented good days and bad days) is asked to consent on a day the clinician assesses as a ''good day'' with intact decision-making capacity for this specific decision, is this a valid consent process?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c59ed053-95aa-4bff-9671-3633badca12c', '6955924d-3fea-4234-ad60-e4b56ddf6a74', 0, 'No — any dementia diagnosis automatically invalidates the patient''s own consent regardless of day-to-day capacity');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6d94e378-2cb9-4ecc-8ba7-34b075954a44', '6955924d-3fea-4234-ad60-e4b56ddf6a74', 1, 'Yes, provided the clinician specifically assesses and documents decision-specific capacity at the time consent is obtained, since capacity can be decision-specific and time-variable rather than a fixed, all-or-nothing status');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a372c48d-1659-426d-8aef-fd952bd98a08', '6955924d-3fea-4234-ad60-e4b56ddf6a74', 2, 'Consent from a fluctuating-capacity patient is never valid without a court-appointed guardian');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c855f44d-896f-463e-b702-f5abea6785df', '6955924d-3fea-4234-ad60-e4b56ddf6a74', 3, 'Consent documentation is unnecessary once a diagnosis of dementia, at any stage, is present');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6955924d-3fea-4234-ad60-e4b56ddf6a74', '6d94e378-2cb9-4ecc-8ba7-34b075954a44', 'Decision-making capacity is properly assessed as decision-specific and can genuinely fluctuate over time (particularly in early-stage dementia with documented variability) — a diagnosis of dementia alone does not automatically strip a patient of the ability to consent to their own care; the clinically and legally sound approach is for the clinician to assess and document capacity specifically at the time a particular consent decision is being made, rather than assuming either blanket incapacity from the diagnosis or ignoring genuine variability, and rather than requiring guardianship as a universal prerequisite absent an actual capacity determination supporting that need.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('11dee179-583d-48e6-ba2e-34abf80d0759', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 80, 'A patient''s 30-day PDGM period has a principal diagnosis that, per CMS''s published PDGM diagnosis code mapping list, is NOT an acceptable primary diagnosis for case-mix grouping purposes (e.g., certain symptom/unspecified codes CMS has excluded from primary-diagnosis use). What happens to that period''s claim?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a01021b1-60d0-4c38-a8a2-5c21ca2fc3d6', '11dee179-583d-48e6-ba2e-34abf80d0759', 0, 'The claim is paid at the standard rate with no adjustment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5a62d752-4050-4288-86fe-5c2a597fdbf4', '11dee179-583d-48e6-ba2e-34abf80d0759', 1, 'The claim will be returned to the provider (RTP) for correction, since the primary diagnosis must map to one of PDGM''s designated clinical groups to be accepted for case-mix grouping and payment processing');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('80cdeafc-4529-4d9b-85c7-0d563febcafa', '11dee179-583d-48e6-ba2e-34abf80d0759', 2, 'CMS automatically substitutes a default diagnosis code without provider involvement');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('945edb2a-3cbc-4107-b9f7-62f71a859ffb', '11dee179-583d-48e6-ba2e-34abf80d0759', 3, 'The period is automatically classified as a LUPA regardless of visit volume');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('11dee179-583d-48e6-ba2e-34abf80d0759', '5a62d752-4050-4288-86fe-5c2a597fdbf4', 'CMS maintains a published list of diagnosis codes that are NOT acceptable as a home health primary/principal diagnosis for PDGM case-mix grouping purposes (generally vague symptom codes or codes CMS has determined don''t meaningfully drive a distinct clinical grouping) — a claim submitted with such a code as the primary diagnosis will be returned to the provider (RTP) for correction with a valid, acceptable primary diagnosis, rather than being paid as-is, auto-corrected by CMS without provider input, or automatically defaulted to LUPA status, which is an unrelated payment mechanism triggered by visit volume, not diagnosis code acceptability.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9830f945-d33c-4d7a-8b85-dc1526cc27ac', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 81, 'A patient with a recent total hip replacement has a documented leg length discrepancy (operative leg now measured 1.5cm shorter) noted by the physician as a known, non-emergent complication being monitored with a shoe lift, not requiring revision surgery. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7117f347-8ac1-4a84-9be8-a17b08d244b1', '9830f945-d33c-4d7a-8b85-dc1526cc27ac', 0, 'M21.752, Z96.641');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('180d1527-524e-4931-ab0f-0ce22672d188', '9830f945-d33c-4d7a-8b85-dc1526cc27ac', 1, 'T84.84XA, Z96.641');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('20c0eec3-825c-4fd1-a2ed-44b2a32f05a0', '9830f945-d33c-4d7a-8b85-dc1526cc27ac', 2, 'M21.75, Z96.641');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2e657df7-1ede-4b8e-9077-a862b99cc5df', '9830f945-d33c-4d7a-8b85-dc1526cc27ac', 3, 'Q72.819, Z96.641');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9830f945-d33c-4d7a-8b85-dc1526cc27ac', '180d1527-524e-4931-ab0f-0ce22672d188', 'T84.84XA (length discrepancy due to internal joint prosthesis, initial encounter) is the specific device-related complication code for a leg length discrepancy directly attributable to a joint replacement — M21.752 (acquired unequal limb length, lower limb — a general acquired-deformity code not specific to a prosthesis) would under-specify the documented device-related etiology, since a more precise code (T84.84XA) matching the prosthesis-related cause is available. Q72.819 is a CONGENITAL limb-length code, entirely wrong for an acquired, procedure-related finding in an adult. Z96.641 (presence of right artificial hip joint) is added as the device-status code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('17db2d84-06db-42c5-b9ce-075dae638171', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 82, 'A home health agency''s clinical record retention policy must comply with Medicare requirements for how long clinical records are retained after the last date of service. What is the minimum required retention period under Medicare CoPs?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f477d32c-328f-44cc-ad02-8ae524ea9d8a', '17db2d84-06db-42c5-b9ce-075dae638171', 0, '1 year');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8cf68e21-4307-4dfb-a3c3-31bacc5f6a0e', '17db2d84-06db-42c5-b9ce-075dae638171', 1, '5 years');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6b1bf19d-c3d9-46e8-82db-c0b2735a3919', '17db2d84-06db-42c5-b9ce-075dae638171', 2, '3 years');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a2de0b9e-eae0-439e-84b0-39c7f2a69740', '17db2d84-06db-42c5-b9ce-075dae638171', 3, 'Indefinitely, with no defined minimum');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('17db2d84-06db-42c5-b9ce-075dae638171', '8cf68e21-4307-4dfb-a3c3-31bacc5f6a0e', 'Medicare CoPs require home health agencies to retain clinical records for a minimum of 5 years after the discharge of the patient (or after the death of the patient, in certain minor-patient or state-law-driven extensions, which may impose a longer state-specific requirement layered on top of the federal floor) — this 5-year federal minimum is the baseline every certified agency must meet, though state law can require longer retention, making 5 years the correct federal-CoP-specific answer being tested here.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('45fcf68c-4ed4-4d27-a22b-347a11bf0cc3', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 83, 'A patient with type 2 diabetes has a new finding of diabetic dermopathy (shin spots), a benign skin manifestation confirmed by the physician as diabetes-related but not requiring any specific treatment, noted incidentally during a routine assessment. Should this be coded, and if so, how?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6a773794-77d5-484b-b0f8-7422e9bd18a4', '45fcf68c-4ed4-4d27-a22b-347a11bf0cc3', 0, 'E11.628, L98.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dc0ea2c2-2027-4dc0-82a4-1db5cc1186dd', '45fcf68c-4ed4-4d27-a22b-347a11bf0cc3', 1, 'No code is needed since it doesn''t require treatment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0eca126c-36bb-4a3d-899a-0978b8f943df', '45fcf68c-4ed4-4d27-a22b-347a11bf0cc3', 2, 'L98.8 alone, since it''s a skin finding independent of the diabetes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a29b0ef8-fe57-4369-a4df-49a3779d0514', '45fcf68c-4ed4-4d27-a22b-347a11bf0cc3', 3, 'E11.9 alone, since dermopathy isn''t clinically significant enough to warrant its own code');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('45fcf68c-4ed4-4d27-a22b-347a11bf0cc3', '6a773794-77d5-484b-b0f8-7422e9bd18a4', 'E11.628 (type 2 diabetes with other skin complications) is coded even though the finding is benign and requires no specific treatment — ICD-10-CM coding is based on the presence of a documented condition, not on whether it requires active treatment; a clinically confirmed, diabetes-related skin manifestation is still a codeable diabetic complication once identified and documented by the physician. L98.8 (other specified skin disorders) is added as the more general skin-finding code alongside the diabetes combination code, since diabetic dermopathy doesn''t have an even more specific dedicated ICD-10-CM code beyond the general ''other skin complications'' diabetes combination category.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('25088ff2-e8fb-4fce-9b80-55fea2fbf9fa', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 84, 'A patient''s home health agency receives a physician''s plan of care order for ''PT 2x/week x 6 weeks'' at SOC. At week 4, the PT determines the patient has met all functional goals and further therapy is not needed. Per CoP requirements, can the PT unilaterally discharge the patient from PT services without further physician contact, given that goals were fully met ahead of schedule?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fc61e289-75ff-41e7-ae88-3e5322171a19', '25088ff2-e8fb-4fce-9b80-55fea2fbf9fa', 0, 'Yes, meeting all documented functional goals automatically and unilaterally ends the ordered service without any further step');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c3719399-0504-4a78-a828-3a6dac28c911', '25088ff2-e8fb-4fce-9b80-55fea2fbf9fa', 1, 'No — the physician must be notified of goal achievement and provide an order to discontinue therapy or otherwise document agreement with ending services early, consistent with the plan-of-care revision principle requiring physician-authorized changes to ordered care');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('701e8803-c7e4-4acd-946e-1193ae62d6eb', '25088ff2-e8fb-4fce-9b80-55fea2fbf9fa', 2, 'The PT must continue visits at the originally ordered frequency through week 6 regardless of goal achievement');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6706f702-988a-4b4e-9d8e-5dfa19140a41', '25088ff2-e8fb-4fce-9b80-55fea2fbf9fa', 3, 'Only the agency''s clinical director, not the treating PT or the physician, can authorize early discharge from a specific discipline');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('25088ff2-e8fb-4fce-9b80-55fea2fbf9fa', 'c3719399-0504-4a78-a828-3a6dac28c911', 'This applies the same core plan-of-care-revision principle tested repeatedly across this exam series (Paper 7 Q41/Q46, Paper 8''s earlier hip-fracture-recovery-frequency question) — even when the clinical rationale for changing an ordered service (ending therapy early because goals are met) seems obviously justified and beneficial, it still requires physician notification and an order/documented agreement to formally change the ordered plan of care, rather than a unilateral clinician decision to stop, blind continuation of unneeded visits through the original end date, or requiring an escalation to an administrative role (clinical director) that isn''t the actual physician-authorization pathway required.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('72854228-a066-414d-b429-299c9c6e1b0d', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 85, 'A patient with COPD and a new finding of pulmonary hypertension, confirmed by echocardiogram and right heart catheterization as directly due to the chronic lung disease (not left heart disease, not idiopathic), is admitted to home health. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8b2d434c-5aa6-43ca-80a4-fad21af70929', '72854228-a066-414d-b429-299c9c6e1b0d', 0, 'I27.20, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('25e239a3-e755-4756-9f04-6080ddc5ceb9', '72854228-a066-414d-b429-299c9c6e1b0d', 1, 'I27.21, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d93bc041-b503-4d3c-9943-06edf7af45c2', '72854228-a066-414d-b429-299c9c6e1b0d', 2, 'I27.0, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b75ad050-c1e5-4df8-94b8-4e861b3eb196', '72854228-a066-414d-b429-299c9c6e1b0d', 3, 'J44.9, I27.21');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('72854228-a066-414d-b429-299c9c6e1b0d', '25e239a3-e755-4756-9f04-6080ddc5ceb9', 'I27.21 (secondary pulmonary hypertension associated with lung diseases and hypoxia — specifically matching the documented COPD-caused etiology) is more precise than I27.20 (pulmonary hypertension, unspecified) or I27.0 (primary/idiopathic pulmonary arterial hypertension, which is explicitly ruled out by the documented COPD-related etiology). J44.9 (COPD) is added as the underlying disease, sequenced after the pulmonary hypertension in this option since the pulmonary hypertension represents the newer, currently escalating clinical concern — though reasonable sequencing could also lead with the COPD as the root cause; the key tested distinction here is selecting the correct etiology-specific I27.2x code over the less precise unspecified or wrong-etiology alternatives, not the exact leading position between the two conditions.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('32df9b39-609e-4019-933f-4113d2e17d87', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 86, 'A patient with a Foley catheter for neurogenic bladder develops catheter-associated urinary tract infection (CAUTI), confirmed by symptomatic presentation (fever, suprapubic pain) plus positive urine culture growing Klebsiella pneumoniae. Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bc62a4f9-b5b9-4e23-930b-fb7e897e1c03', '32df9b39-609e-4019-933f-4113d2e17d87', 0, 'N39.0, T83.511A, B96.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8dd8cfd3-32ca-4b2f-a2e8-5f2474b61933', '32df9b39-609e-4019-933f-4113d2e17d87', 1, 'T83.511A, N39.0, B96.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('66fc96dd-27d2-433f-874a-4983e1c21c31', '32df9b39-609e-4019-933f-4113d2e17d87', 2, 'N39.0, B96.1, T83.511A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5ecc8e43-054b-4412-9258-3efa6a018861', '32df9b39-609e-4019-933f-4113d2e17d87', 3, 'T83.511A, B96.1, N39.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('32df9b39-609e-4019-933f-4113d2e17d87', 'bc62a4f9-b5b9-4e23-930b-fb7e897e1c03', 'N39.0 (urinary tract infection) is sequenced first as the primary, symptomatic infection diagnosis — distinguishing this from the earlier asymptomatic-bacteriuria question in this paper (Q26), since fever and suprapubic pain confirm a genuinely symptomatic infection here, correctly warranting the N39.0 UTI code rather than R82.71 bacteriuria. T83.511A (infection and inflammatory reaction due to indwelling urinary catheter, initial encounter) is added to flag the catheter-associated etiology. B96.1 (Klebsiella pneumoniae as the cause of disease classified elsewhere) is added to identify the specific confirmed organism.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('002ffbdd-2907-4b75-97ab-1521191dc799', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 87, 'A patient''s OASIS at SOC scores M1033 (Risk for Hospitalization) with multiple risk factors checked, including recent hospitalization within the prior 14 days and multiple co-morbidities. How does this OASIS item factor into PDGM payment specifically, as distinct from its use in quality reporting?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0217609a-ef16-40c7-af07-b8d5c43d6838', '002ffbdd-2907-4b75-97ab-1521191dc799', 0, 'M1033 directly determines the comorbidity adjustment level for PDGM case-mix payment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d6590822-99b4-45c6-a5e2-01594c1dde96', '002ffbdd-2907-4b75-97ab-1521191dc799', 1, 'M1033 is primarily a quality/risk-stratification and care-planning item; it does not itself directly drive PDGM case-mix payment calculations the way the specific comorbidity diagnosis codes (mapped from claims/OASIS primary and secondary diagnoses) do');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bc52e47d-e9c6-440e-81f4-0a7303e71d89', '002ffbdd-2907-4b75-97ab-1521191dc799', 2, 'M1033 sets the LUPA visit threshold for the period');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('27e1af3d-c6db-4641-bff4-b8a09671ed7d', '002ffbdd-2907-4b75-97ab-1521191dc799', 3, 'M1033 determines whether the admission source is classified as institutional or community');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('002ffbdd-2907-4b75-97ab-1521191dc799', 'd6590822-99b4-45c6-a5e2-01594c1dde96', 'M1033 (Risk for Hospitalization) is primarily a clinical risk-stratification and quality/care-planning data item — it is not itself one of the direct PDGM case-mix payment inputs (which are clinical grouping from the primary diagnosis, functional impairment level from specific GG/functional items, comorbidity adjustment from specific secondary diagnosis codes mapped to CMS''s comorbidity subgroups, admission source, and timing) — this tests whether a candidate correctly distinguishes OASIS items that inform quality reporting/care planning from the specific, narrower subset of data elements that actually feed PDGM''s payment calculation formula.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('22a12cfc-b121-43e7-b79d-ba1477fe0f12', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 88, 'A patient with a recent below-knee amputation has phantom limb pain (as in Paper 7''s Q9) that is now being treated with mirror therapy provided by home health OT, in addition to the gabapentin already prescribed. Six weeks later, the pain has completely resolved and mirror therapy is discontinued per OT''s assessment and physician concurrence. At the NEXT home health visit (a non-OASIS visit) for an unrelated skin check, should G54.6 still be coded as an active diagnosis?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('027f5275-0044-45be-ac4c-00fb42fca0aa', '22a12cfc-b121-43e7-b79d-ba1477fe0f12', 0, 'Yes, phantom limb pain is a permanent code once assigned and can never be removed from the active problem list');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2d64b545-a19f-427c-b697-9c00b99604bb', '22a12cfc-b121-43e7-b79d-ba1477fe0f12', 1, 'No — since the pain has resolved and is no longer being treated (confirmed by discontinuation of treatment with physician concurrence), G54.6 (phantom limb syndrome WITH pain) is no longer accurate; G54.7 (phantom limb syndrome WITHOUT pain) may be more appropriate if the syndrome itself persists without the pain component, or the condition may be considered resolved entirely depending on physician documentation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a06229ca-bb14-4c3a-99e2-0cffc1d454ee', '22a12cfc-b121-43e7-b79d-ba1477fe0f12', 2, 'The amputation status code alone (Z89.512) should now be listed with no phantom-limb-related code at all, regardless of physician documentation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fcaac46f-207d-4a6b-b109-e0a29c4e1edc', '22a12cfc-b121-43e7-b79d-ba1477fe0f12', 3, 'A new SOC assessment is required before the code can be changed');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('22a12cfc-b121-43e7-b79d-ba1477fe0f12', '2d64b545-a19f-427c-b697-9c00b99604bb', 'This applies the same current-status coding principle established multiple times in this exam series (pressure ulcer staging in both directions, the grooming/OASIS-timepoint question) to a symptom-resolution scenario — once phantom limb PAIN has genuinely resolved (confirmed by treatment discontinuation and physician concurrence), G54.6 (WITH pain) is no longer an accurate current-status code; depending on the physician''s own documentation, either G54.7 (WITHOUT pain, if the broader phantom limb syndrome/sensation persists without the pain component) or no phantom-limb code at all (if fully resolved) becomes appropriate — this is a physician documentation-driven determination, not an automatic, permanent code assignment that can never be revisited, and does not require an immediately-triggered new SOC assessment to update, consistent with the routine-visit-vs-OASIS-timepoint documentation principle.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c5ac5b73-94d9-48d4-9a5d-cb6a0f2dd21d', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 89, 'A patient with hypertension and hyperlipidemia is newly diagnosed with peripheral arterial disease, and the physician''s note explicitly states the PAD is ''due to the patient''s longstanding, poorly-controlled atherosclerotic disease, with hypertension and hyperlipidemia as significant contributing risk factors'' but does NOT state a specific hypertensive-heart-or-kidney combination relationship. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('038e5ea8-5432-409d-af31-f37dab652ec7', 'c5ac5b73-94d9-48d4-9a5d-cb6a0f2dd21d', 0, 'I70.209, I10, E78.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bb8c3ebe-5c86-4eb1-bbf6-b60511ad5cbf', 'c5ac5b73-94d9-48d4-9a5d-cb6a0f2dd21d', 1, 'I13.0, I70.209');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0654fece-84c3-4e6d-9737-6b6fd292dd00', 'c5ac5b73-94d9-48d4-9a5d-cb6a0f2dd21d', 2, 'I70.209, I10, E78.5, I25.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('67a55a19-912e-4fe5-8931-59510dbbdbee', 'c5ac5b73-94d9-48d4-9a5d-cb6a0f2dd21d', 3, 'I25.10, I70.209, I10, E78.5');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c5ac5b73-94d9-48d4-9a5d-cb6a0f2dd21d', '038e5ea8-5432-409d-af31-f37dab652ec7', 'I70.209 (unspecified atherosclerosis of native arteries of extremities, unspecified extremity, without claudication documented in this specific stem) is sequenced first as the newly diagnosed, current focus of care. I10 (hypertension) and E78.5 (hyperlipidemia) are added as separate, coexisting risk-factor conditions — I13.0 does NOT apply here since the physician''s documentation doesn''t establish the specific hypertensive-heart-and-kidney-disease relationship that combination code requires (this is peripheral arterial disease, not heart failure or CKD), correctly testing whether a candidate over-applies the I13 combination-code pattern to an unrelated vascular bed. I25.10 (coronary artery disease) is not added since no coronary-specific diagnosis is documented in this stem — only peripheral arterial disease is confirmed, and adding a coronary code without supporting documentation would be coding a condition not actually established here.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2681fb96-b3b7-4e82-afe5-4ae65a18b727', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 90, 'A home health patient''s discharge planning process, per CoP requirements, must include which of the following when the patient is being discharged due to goal achievement (not transfer to another facility)?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('52f6d1c2-10c4-4153-9ae0-5b504772767c', '2681fb96-b3b7-4e82-afe5-4ae65a18b727', 0, 'A discharge summary communicated to the physician, including the patient''s status at discharge, goals achieved, and any ongoing care needs or referrals made');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('86c81968-e4d3-4783-b916-9477d826764b', '2681fb96-b3b7-4e82-afe5-4ae65a18b727', 1, 'Discharge planning is only required when a patient is transferred to a hospital or SNF, not for routine goal-achievement discharges');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5eb77b7c-5a32-40bd-970b-99149ca96790', '2681fb96-b3b7-4e82-afe5-4ae65a18b727', 2, 'No communication with the physician is required if the patient agrees verbally to discharge');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e67d56c5-5cd1-4976-9ec2-7225a17cb4bc', '2681fb96-b3b7-4e82-afe5-4ae65a18b727', 3, 'A discharge summary is optional and left to individual clinician discretion');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2681fb96-b3b7-4e82-afe5-4ae65a18b727', '52f6d1c2-10c4-4153-9ae0-5b504772767c', 'CoP discharge planning/care coordination requirements apply to ALL discharges, including routine goal-achievement discharges, not just transfers to another facility — a discharge summary communicated to the physician (documenting status at discharge, goals achieved, and any ongoing needs or referrals) is a required element of proper care coordination and closing out the episode, not an optional or discretionary step, and not something limited to only facility-transfer scenarios.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('95324bf6-4416-487e-825b-872b64072c7b', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 91, 'A patient with generalized anxiety disorder and comorbid alcohol use disorder (in early remission, per physician documentation, using the correct dependence-family code established earlier in this exam series) is prescribed buspirone specifically because it has a lower risk profile for a patient with a substance use history compared to a benzodiazepine. How should this specific prescribing rationale be reflected in documentation and coding?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9826b399-d45b-4a9c-8395-5fa30224c4cd', '95324bf6-4416-487e-825b-872b64072c7b', 0, 'F41.1, F10.21, with the specific medication-choice rationale (buspirone selected due to lower misuse potential given the alcohol use history) captured in narrative clinical documentation, since no single ICD-10-CM code exists for ''medication chosen due to substance use history''');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8534560f-e228-402b-a697-0cddc6e3eb7e', '95324bf6-4416-487e-825b-872b64072c7b', 1, 'T42.4X5A must be used to reflect the buspirone prescription itself');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b1d77522-d012-464b-ac73-530be9d4cff1', '95324bf6-4416-487e-825b-872b64072c7b', 2, 'Only F10.21 should be coded, since the medication choice was driven by that diagnosis specifically');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('34fe87e2-3799-4246-b092-8ae16d9e988b', '95324bf6-4416-487e-825b-872b64072c7b', 3, 'Z79.899 must always be added whenever a psychiatric medication is prescribed to a patient with any substance use history');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('95324bf6-4416-487e-825b-872b64072c7b', '9826b399-d45b-4a9c-8395-5fa30224c4cd', 'F41.1 (generalized anxiety disorder) and F10.21 (alcohol dependence, in remission — the correct dependence-family code established in Paper 7 Q14) are both coded as the genuinely present, separately diagnosed conditions. There is no dedicated ICD-10-CM code for a specific prescribing RATIONALE like ''chose this drug because of that other diagnosis''s risk profile'' — this kind of clinical decision-making reasoning belongs in narrative documentation (supporting medical necessity and appropriate prescribing practice), not forced into a code, mirroring the same narrative-vs-code distinction tested with the intentional anticoagulation-combination question earlier in this paper. T42.4X5A (adverse effect of buspirone) is wrong since there''s no documented adverse reaction — the medication is simply being appropriately prescribed.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d98b727f-aa73-470e-a37a-86325b2c564e', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 92, 'A patient''s home health record shows the case manager assigned a home health aide to provide services without first confirming the aide''s required competency evaluation (per CoP aide training/competency requirements) was current. Per CoP requirements, what is required regarding aide competency?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0ad31efa-0448-4fe3-b781-02475d6801ab', 'd98b727f-aa73-470e-a37a-86325b2c564e', 0, 'Aides must complete a competency evaluation before providing services, covering the specific skills they will perform, with periodic (at least annual, or sooner if a performance concern arises) re-evaluation — assigning an aide without a current competency evaluation on file is a compliance gap');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dc8e014c-0d7c-4305-8447-08891cea4005', 'd98b727f-aa73-470e-a37a-86325b2c564e', 1, 'Competency evaluation is a one-time requirement at hire with no periodic re-evaluation ever required');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e47f8617-5b09-4fb9-bfd0-15d48246cc89', 'd98b727f-aa73-470e-a37a-86325b2c564e', 2, 'Only aides providing wound care specifically require competency evaluation; other aide tasks do not');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6b85217d-59dc-43a5-b0fe-cb0d1826ce18', 'd98b727f-aa73-470e-a37a-86325b2c564e', 3, 'Competency evaluations are optional and left entirely to individual agency discretion with no federal minimum standard');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d98b727f-aa73-470e-a37a-86325b2c564e', '0ad31efa-0448-4fe3-b781-02475d6801ab', 'CoP home health aide requirements mandate a competency evaluation covering the specific skills/tasks an aide will perform before they provide unsupervised services, with periodic re-evaluation required (a defined minimum interval, generally at least annually, sooner if a specific performance concern is identified) — this is a genuine federal minimum standard, not left entirely to agency discretion, is not limited to only wound-care tasks, and is not a one-time-only hire requirement; assigning an aide without a current, on-file competency evaluation represents a real compliance gap against this standard.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e089c46f-aa7e-46a6-83d4-b55bdfa208dc', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 93, 'A patient with type 2 diabetes is newly started on an SGLT2 inhibitor and develops a case of Fournier''s gangrene (necrotizing fasciitis of the perineum), a rare but serious documented adverse effect of this drug class, correctly dosed and taken as prescribed, requiring hospitalization (now home for continued wound care post-debridement). Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c1b137ad-e0d8-4b9c-ba41-77d71b35925c', 'e089c46f-aa7e-46a6-83d4-b55bdfa208dc', 0, 'N49.3, T38.3X5A, E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b6f7524f-9410-422e-84bd-4c29b72fe54d', 'e089c46f-aa7e-46a6-83d4-b55bdfa208dc', 1, 'T38.3X5A, N49.3, E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a3c79700-e6e2-4d0f-a523-0315b6c29160', 'e089c46f-aa7e-46a6-83d4-b55bdfa208dc', 2, 'M72.6, T38.3X5A, E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ded3a818-88c9-478f-bd9c-d3b00b2dbc11', 'e089c46f-aa7e-46a6-83d4-b55bdfa208dc', 3, 'T38.3X5A, M72.6, E11.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e089c46f-aa7e-46a6-83d4-b55bdfa208dc', 'b6f7524f-9410-422e-84bd-4c29b72fe54d', 'T38.3X5A (adverse effect of insulin and oral hypoglycemic drugs — the drug-class code covering SGLT2 inhibitors, since ICD-10-CM''s T38.3 poisoning/adverse-effect family covers diabetes medications broadly rather than having an SGLT2-specific subcode) is sequenced first per the adverse-effect convention. N49.3 (Fournier gangrene — which has its own specific, dedicated code distinct from the general necrotizing fasciitis code M72.6) is the correct, most specific manifestation code — using M72.6 (necrotizing fasciitis, general) instead of the Fournier-specific N49.3 would under-code the documented specific anatomic/clinical diagnosis when a more precise dedicated code exists. E11.9 (type 2 diabetes) is added as the underlying condition for which the SGLT2 inhibitor was prescribed.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cc0b75c3-828e-4edc-8c08-4d92eeae052d', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 94, 'A home health patient''s plan of care includes an order for wound care using a specific dressing type. The nurse, based on clinical judgment during a visit, determines a different dressing type would be more appropriate given the wound''s current presentation, and changes the dressing type used without contacting the physician first, planning to inform the physician at the next scheduled contact. Is this compliant with CoP requirements?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('608a6ab1-c892-44b3-b655-bda7eeb7b020', 'cc0b75c3-828e-4edc-8c08-4d92eeae052d', 0, 'Yes, since dressing selection is considered routine nursing judgment never requiring physician authorization');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('da6ed50f-810a-4283-be05-90f653642dce', 'cc0b75c3-828e-4edc-8c08-4d92eeae052d', 1, 'No — per the plan-of-care-revision principle applied consistently throughout this exam series, a change to physician-ordered wound care specifics (like dressing type) requires physician contact and an updated order before implementation, not after-the-fact notification, even though the change reflects sound clinical judgment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7541871e-aa0f-4b21-8d95-c052074d7934', 'cc0b75c3-828e-4edc-8c08-4d92eeae052d', 2, 'Yes, but only if the new dressing type is less expensive than the originally ordered one');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ed674a5f-b8ed-47be-a7bf-8568a94f5757', 'cc0b75c3-828e-4edc-8c08-4d92eeae052d', 3, 'No, but only because the specific wording ''wound care'' was used rather than a specific treatment order');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cc0b75c3-828e-4edc-8c08-4d92eeae052d', 'da6ed50f-810a-4283-be05-90f653642dce', 'This is the plan-of-care-revision principle tested repeatedly across this exam series (Paper 7 Q41/Q46, Paper 8''s PT-discharge and hip-fracture-frequency questions) applied to wound care treatment specifics — even a clinically sound, well-reasoned change to a physician-ordered treatment detail (dressing type) requires physician contact and an updated order BEFORE implementation, not simply informing the physician afterward at the next scheduled contact; the nurse''s clinical judgment, while valuable and appropriately the basis for RECOMMENDING a change, doesn''t substitute for the physician authorization the CoPs require before altering ordered care.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('75522783-3112-4331-b8ac-38c4dbcc4d4a', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 95, 'A patient with COPD and confirmed alpha-1 antitrypsin deficiency (genetically confirmed as the underlying cause of the COPD, rather than smoking-related) is on home health for disease management and augmentation therapy infusions. Select the correct coding, addressing the specific etiology.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8895a05d-2fb5-4fa9-b803-89881007bcc2', '75522783-3112-4331-b8ac-38c4dbcc4d4a', 0, 'J44.9, E88.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c9b7d5c8-e20f-4bbc-b89d-cded768002ae', '75522783-3112-4331-b8ac-38c4dbcc4d4a', 1, 'E88.01, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a1f7fe02-dd8c-4c38-a796-529f82240c98', '75522783-3112-4331-b8ac-38c4dbcc4d4a', 2, 'J43.9, E88.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('51982c9e-60af-494b-baa5-26ca50649a59', '75522783-3112-4331-b8ac-38c4dbcc4d4a', 3, 'E88.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('75522783-3112-4331-b8ac-38c4dbcc4d4a', 'c9b7d5c8-e20f-4bbc-b89d-cded768002ae', 'E88.01 (alpha-1 antitrypsin deficiency) is sequenced first per the ''code first'' etiology convention, since the alpha-1 antitrypsin deficiency is the genetically confirmed root cause driving the entire disease process — J44.9 (COPD) follows as the resulting pulmonary manifestation. This mirrors the etiology-first sequencing pattern established with hepatitis-C-related cirrhosis (Paper 7, corrected version) and lupus nephritis (Paper 7 Q46) — when a specific, confirmed underlying genetic/systemic cause drives a pulmonary or organ complication, the etiology code leads, particularly when (as here) it carries specific implications for a distinct treatment approach (augmentation therapy) not used for typical smoking-related COPD.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cdfd24d9-3a81-4caf-ae74-82772a8f2e0c', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 96, 'A patient''s home health agency changes ownership. Per CoP requirements, does the new owner automatically retain the agency''s existing Medicare certification and provider number without any additional CMS action required?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6b58350b-f5a9-4873-b669-534e0a9ce1c3', 'cdfd24d9-3a81-4caf-ae74-82772a8f2e0c', 0, 'Yes, ownership changes have no effect on Medicare certification status');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e68a1050-080b-4068-b154-1f657b0dd8a5', 'cdfd24d9-3a81-4caf-ae74-82772a8f2e0c', 1, 'No — a change of ownership (CHOW) requires specific notification to CMS/the state survey agency, and the new owner generally accepts assignment of the existing provider agreement subject to conditions, rather than certification simply continuing automatically with no process at all');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('72e2192e-b541-4945-b659-bafe592352ef', 'cdfd24d9-3a81-4caf-ae74-82772a8f2e0c', 2, 'A change of ownership always requires the agency to close and reopen as an entirely new, separately-surveyed entity with a new provider number in every case');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('319c510e-4ccf-45d6-ae7e-21aaae44328b', 'cdfd24d9-3a81-4caf-ae74-82772a8f2e0c', 3, 'Only verbal notification to the regional CMS office is required, with no written documentation');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cdfd24d9-3a81-4caf-ae74-82772a8f2e0c', 'e68a1050-080b-4068-b154-1f657b0dd8a5', 'A change of ownership (CHOW) triggers specific CMS/state survey agency notification and processing requirements — the new owner typically accepts assignment of the existing provider agreement (allowing continuity of the Medicare certification/provider number under specified conditions), but this is a defined regulatory process requiring proper notification and documentation, not something that happens with zero process at all, and not necessarily requiring a full new survey/new provider number in every CHOW scenario (that outcome depends on the specific circumstances and whether assignment is accepted or declined) — this tests baseline awareness that ownership changes are a regulated event with real CoP/certification implications, not an operationally invisible non-event.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('80f65f75-e3c3-4f6e-aa65-924d5f7ffcf6', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 97, 'A patient with a recent stroke has both expressive aphasia AND a NEW, separately documented finding of dysgraphia (difficulty with written language specifically), confirmed by SLP evaluation as a distinct component of the aphasia syndrome affecting written rather than spoken output specifically. Does ICD-10-CM require a separate code for the dysgraphia component?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e358d1b2-cb0e-489d-a337-88007ea479a9', '80f65f75-e3c3-4f6e-aa65-924d5f7ffcf6', 0, 'Yes, R48.8 must always be added alongside I69.320 for any documented writing-specific component');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ef9c91e5-0470-4c7a-bd75-ccac49e3a127', '80f65f75-e3c3-4f6e-aa65-924d5f7ffcf6', 1, 'No dedicated additional code is required beyond I69.320 (aphasia following cerebral infarction) — dysgraphia as a component of a broader aphasia syndrome is typically considered part of the overall aphasia presentation rather than requiring a separate stacked code, though the specific written-language deficit is valuable information for the SLP''s own treatment planning and narrative documentation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5adcdaeb-cce0-404c-b9d6-28567236eba8', '80f65f75-e3c3-4f6e-aa65-924d5f7ffcf6', 2, 'The stroke code must be changed entirely to a different I69 subcategory specific to writing deficits');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('04fd1fb7-7666-48f3-a8b7-3638b7604287', '80f65f75-e3c3-4f6e-aa65-924d5f7ffcf6', 3, 'Dysgraphia can only be coded if it exists completely independent of any aphasia diagnosis');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('80f65f75-e3c3-4f6e-aa65-924d5f7ffcf6', 'ef9c91e5-0470-4c7a-bd75-ccac49e3a127', 'When dysgraphia is documented as a component of a broader aphasia syndrome (rather than an entirely separate, independent neurological finding), I69.320 (aphasia following cerebral infarction) is generally considered to already encompass this as part of the overall aphasia presentation, without requiring an additional stacked R48.8 (dyslexia and other symbolic dysfunctions, not elsewhere classified) code — this mirrors the non-redundant-combination-code principle tested repeatedly in this series (Crohn''s/fistula, diabetes/gastroparesis), here applied to a neurological-symptom-cluster context rather than a disease-combination-code context; the specific written-language detail remains clinically valuable for SLP treatment planning and belongs in narrative documentation even without generating a separate ICD-10-CM code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c109487b-16c8-4ada-b522-de6854c4bdbb', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 98, 'A patient''s home health agency''s clinical manager reviews a random sample of clinical records each month as part of the QAPI program, specifically checking for documentation completeness, but does NOT track or trend adverse events (falls, hospitalizations, wounds worsening) across the patient population over time. Does this satisfy the CoP QAPI requirement?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e2f1fe6a-2f06-4554-b73a-c91a6c42fccd', 'c109487b-16c8-4ada-b522-de6854c4bdbb', 0, 'Yes, documentation completeness review alone fully satisfies the QAPI requirement');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8f25e639-983d-4f20-9809-c25ea6be3d6a', 'c109487b-16c8-4ada-b522-de6854c4bdbb', 1, 'No — QAPI requires ongoing, data-driven tracking and trending of quality indicators INCLUDING adverse events across the patient population, not just individual record documentation-completeness spot checks; the described program is incomplete relative to the CoP requirement');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a0dbeee2-44c6-4e36-9bfa-69affd1edc46', 'c109487b-16c8-4ada-b522-de6854c4bdbb', 2, 'Yes, as long as the sample size is at least 10% of the total patient census');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fdd8d6be-25f9-458a-8809-71d3e81104ea', 'c109487b-16c8-4ada-b522-de6854c4bdbb', 3, 'No, but only because monthly review frequency is insufficient — QAPI reviews must occur weekly');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c109487b-16c8-4ada-b522-de6854c4bdbb', '8f25e639-983d-4f20-9809-c25ea6be3d6a', 'This directly extends the QAPI question earlier in this paper (Q5) — a program limited to documentation-completeness spot checks, without population-level tracking and trending of adverse events and other quality indicators over time, does not satisfy the full CoP QAPI requirement, which specifically requires that broader, ongoing, data-driven quality measurement — documentation completeness review is a reasonable COMPONENT of quality oversight, but is not a substitute for the adverse-event tracking/trending requirement, and the deficiency here isn''t about review frequency (no specific weekly requirement exists) but about the missing scope of what''s being tracked.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ba1f7711-2eb6-4f42-89f4-ca59ac648623', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 99, 'A patient with severe COPD and cor pulmonale (as in Paper 8''s earlier question) is now ALSO found to have new atrial fibrillation, with the physician documenting the new arrhythmia as likely related to the right heart strain from the cor pulmonale. Select the correct, complete coding addressing all three conditions and their relationship.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('88c667e1-fa38-4849-96f1-32b9c2c8d42d', 'ba1f7711-2eb6-4f42-89f4-ca59ac648623', 0, 'I48.91, I27.81, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b72d35b8-bfa8-40e1-a2fd-8ed8733c62a3', 'ba1f7711-2eb6-4f42-89f4-ca59ac648623', 1, 'I27.81, I48.91, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a57bfb57-0c31-4aad-b09c-edba0fa0d776', 'ba1f7711-2eb6-4f42-89f4-ca59ac648623', 2, 'J44.9, I27.81, I48.91');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8bbb0806-59d3-465f-b420-d475c160e361', 'ba1f7711-2eb6-4f42-89f4-ca59ac648623', 3, 'I27.81, J44.9, I48.91');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ba1f7711-2eb6-4f42-89f4-ca59ac648623', 'b72d35b8-bfa8-40e1-a2fd-8ed8733c62a3', 'I27.81 (chronic cor pulmonale) is sequenced first as the condition the physician specifically identifies as causally contributing to the new arrhythmia, making it the clinically primary driver of this encounter''s concern. I48.91 (atrial fibrillation, unspecified type) follows as the new, currently acute finding resulting from the cor pulmonale-related right heart strain. J44.9 (COPD) is added last as the base underlying chronic lung disease from which the cor pulmonale itself originated — there''s no single combination code linking all three conditions together, so they''re coded as three separately sequenced codes with sequencing reflecting the documented causal chain (COPD → cor pulmonale → new AFib), led by the most proximate, currently-relevant cause of the new finding.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('aed1f267-9ab2-4d5f-ad49-9174943040de', '06886938-d62a-4e8b-9ed3-bdb51c85b2fa', 100, 'A patient with major depressive disorder is prescribed bupropion, specifically chosen by the physician because the patient also has a documented seizure disorder and the physician needed to weigh bupropion''s known seizure-threshold-lowering effect against its antidepressant benefit — a deliberate, monitored risk-benefit decision, with no seizure occurring since starting the medication 8 weeks ago. Select the correct coding for this ongoing home health monitoring visit.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b1031e0a-5933-4f27-8e66-cad0f4e81a2f', 'aed1f267-9ab2-4d5f-ad49-9174943040de', 0, 'F33.9, G40.909, with the specific medication risk-benefit rationale captured in narrative documentation supporting the monitoring plan, since no single ICD-10-CM code exists for ''medication chosen despite a known interaction risk, currently tolerating well''');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a9f4cd30-fbd4-4a57-bc6a-5c040ca82729', 'aed1f267-9ab2-4d5f-ad49-9174943040de', 1, 'T42.6X5A must be added prophylactically since bupropion carries a seizure risk in this patient population');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e9dfe496-a1dd-430a-9403-9ca2bbae12e3', 'aed1f267-9ab2-4d5f-ad49-9174943040de', 2, 'Only G40.909 should be coded, since the depression is considered secondary to seizure management priorities');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4c9830a3-c1be-4595-8e53-fca35c118d04', 'aed1f267-9ab2-4d5f-ad49-9174943040de', 3, 'Z91.89 must always be added whenever a medication with any known interaction risk is prescribed');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('aed1f267-9ab2-4d5f-ad49-9174943040de', 'b1031e0a-5933-4f27-8e66-cad0f4e81a2f', 'F33.9 (major depressive disorder, unspecified) and G40.909 (epilepsy, unspecified, not intractable, without status epilepticus — the same baseline seizure-disorder code established earlier in this paper) are both coded as the genuinely present, separately diagnosed conditions. This mirrors the buspirone/alcohol-use-history question earlier in this paper: there is no dedicated ICD-10-CM code for a specific prescribing risk-benefit rationale (''chose this drug despite a known interaction risk, currently monitored and tolerating well without incident'') — that clinical reasoning belongs in narrative documentation supporting the monitoring plan and medical necessity, not forced into a code. T42.6X5A (adverse effect) would be wrong since no adverse reaction has actually occurred — the patient has tolerated the medication without a seizure for 8 weeks; coding an adverse effect prophylactically, before any actual adverse event has happened, would misrepresent the clinical picture.');

-- ---------- Paper 9: BCHH-C Practice Paper 9 ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order)
VALUES ('c38f1507-76ee-429c-8a12-fa6eed4b4b51', 'bchhc-practice-9', 'BCHH-C Practice Paper 9', 'bchhc', ARRAY['Endocrine', 'Hematology\Oncology', 'Infectious Disease', 'Rheumatology', 'Neurology', 'CoP\PDGM']::TEXT[], 100, 'advanced', true, 9);
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f8db3c99-d768-4e42-b49f-3de9145d12a7', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 1, 'A patient with Graves'' disease develops thyroid storm, confirmed by the physician based on fever, tachycardia, and altered mental status, requiring urgent hospitalization (now home for post-crisis monitoring, thyroid storm resolved, patient stable on methimazole). Select the correct coding for this home health episode.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b94b5eb9-5ebf-4f05-b0c3-bc97d70ebff6', 'f8db3c99-d768-4e42-b49f-3de9145d12a7', 0, 'E05.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cba1809a-8e6e-4550-88c6-5a6ef14890ff', 'f8db3c99-d768-4e42-b49f-3de9145d12a7', 1, 'E05.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b441a05e-321e-482b-a5ef-2f9347dc030b', 'f8db3c99-d768-4e42-b49f-3de9145d12a7', 2, 'E05.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f1b5d77d-a783-4fcf-ac6a-72b71336af99', 'f8db3c99-d768-4e42-b49f-3de9145d12a7', 3, 'E05.91');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f8db3c99-d768-4e42-b49f-3de9145d12a7', 'b94b5eb9-5ebf-4f05-b0c3-bc97d70ebff6', 'E05.00 (thyrotoxicosis with diffuse goiter without thyrotoxic crisis or storm) is used because the thyroid storm itself has RESOLVED prior to this home health episode — E05.01 (with thyrotoxic crisis or storm) would only apply while the storm is the current, active condition being treated, which isn''t the case here since the patient is now stable, post-crisis. E05.90/E05.91 (thyrotoxicosis, unspecified, without/with crisis) would under-code the documented Graves''-specific diffuse-goiter etiology when the more specific E05.0- combination code is available and matches.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('aadd3cd7-3bbb-48c0-a413-48352a2b6d1e', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 2, 'A patient with longstanding Addison''s disease (primary adrenal insufficiency) on maintenance hydrocortisone develops an adrenal crisis during an acute gastroenteritis illness, now stabilized after stress-dose steroids and hospitalization, home for continued monitoring. Select the correct coding for the underlying condition at this home health episode, given the crisis has resolved.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f399581d-d8cd-49ee-a3a7-529755ebe8f6', 'aadd3cd7-3bbb-48c0-a413-48352a2b6d1e', 0, 'E27.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7bd0fabd-5442-485a-935e-ac888fe219c8', 'aadd3cd7-3bbb-48c0-a413-48352a2b6d1e', 1, 'E27.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('868b8221-d87d-4b3f-8959-92287acb3f11', 'aadd3cd7-3bbb-48c0-a413-48352a2b6d1e', 2, 'E27.40');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('632ae2dd-9c6f-4536-9133-d9486cbb88f3', 'aadd3cd7-3bbb-48c0-a413-48352a2b6d1e', 3, 'E27.49');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('aadd3cd7-3bbb-48c0-a413-48352a2b6d1e', 'f399581d-d8cd-49ee-a3a7-529755ebe8f6', 'E27.1 (primary adrenal cortical insufficiency — Addison''s disease) remains the correct ongoing ACTIVE diagnosis code, since Addison''s disease itself is a permanent, chronic condition requiring lifelong hydrocortisone replacement — this mirrors the seizure-disorder principle established in Paper 8 (chronic condition managed on ongoing therapy stays coded as active, not history) — even though the acute CRISIS episode has resolved (E27.2, adrenal crisis, would only apply to the acute crisis itself as it''s happening), the underlying Addison''s disease is not resolved and remains coded as E27.1 for ongoing management.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d1b70ae8-2d5c-431a-add8-2141cfece56f', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 3, 'A patient with a known history of sickle cell disease (HbSS genotype) is admitted to home health for management following a recent vaso-occlusive pain crisis, now resolved, with the patient stable and no current crisis symptoms. Select the correct coding for the sickle cell disease status at this episode.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('95c7c9d6-1906-4357-875c-7b5d770d7ddb', 'd1b70ae8-2d5c-431a-add8-2141cfece56f', 0, 'D57.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('40123447-0a7d-4667-b00d-9183867f2548', 'd1b70ae8-2d5c-431a-add8-2141cfece56f', 1, 'D57.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1e96a61a-2bf3-4956-ad2a-0c2b811d4d8d', 'd1b70ae8-2d5c-431a-add8-2141cfece56f', 2, 'D57.219');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('515cd32e-50f5-40b6-b225-6e0c4c3b498c', 'd1b70ae8-2d5c-431a-add8-2141cfece56f', 3, 'D57.20');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d1b70ae8-2d5c-431a-add8-2141cfece56f', '40123447-0a7d-4667-b00d-9183867f2548', 'D57.1 (sickle cell disease without crisis) is correct since the vaso-occlusive crisis has resolved and the patient is currently stable — D57.00 (Hb-SS disease WITH crisis, unspecified) would incorrectly code this as if the crisis were still actively occurring. D57.219 and D57.20 are wrong disease-variant codes (Hb-SC disease and sickle-cell trait respectively, not matching the documented HbSS genotype). This mirrors the current-status coding principle applied throughout this exam series — sickle cell disease itself remains a permanent, active diagnosis (not converted to history, since it''s a genetic disease that never resolves), but the WITH/WITHOUT crisis distinction reflects current status.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('93978542-d9f8-4c1b-ae14-02e11fd6368c', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 4, 'A patient with cystic fibrosis (confirmed by genetic testing, pancreatic-insufficient phenotype, no history of meconium ileus) is on home health for pulmonary toilet, pancreatic enzyme replacement, and nutritional monitoring. Select the correct coding, addressing whether the pulmonary and pancreatic manifestations require separate codes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a02b6033-b61e-444b-aa0e-de48498d916b', '93978542-d9f8-4c1b-ae14-02e11fd6368c', 0, 'E84.9 alone, since cystic fibrosis is a single systemic disease not requiring manifestation-specific codes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a55346eb-b885-4a96-a414-42e1baf0f076', '93978542-d9f8-4c1b-ae14-02e11fd6368c', 1, 'E84.11, K86.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('20cdf3ea-c24f-4c20-b8c4-12030a9422a8', '93978542-d9f8-4c1b-ae14-02e11fd6368c', 2, 'E84.0, K86.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d0e27086-f4fb-4d27-9c93-892af42fd4d4', '93978542-d9f8-4c1b-ae14-02e11fd6368c', 3, 'E84.9, E84.0, K90.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('93978542-d9f8-4c1b-ae14-02e11fd6368c', '20cdf3ea-c24f-4c20-b8c4-12030a9422a8', 'E84.0 (cystic fibrosis with pulmonary manifestations) is used since pulmonary toilet is an active part of this care plan. K86.81 (exocrine pancreatic insufficiency) is added as a separate code per the E84 category''s own ''code also'' instruction for pancreatic insufficiency — CF''s own E84.1x subcategory does NOT cover pancreatic insufficiency the way it might seem to: E84.11 is specifically ''meconium ileus in cystic fibrosis,'' a neonatal bowel-obstruction presentation, not pancreatic insufficiency at all, and E84.1x more broadly covers intestinal manifestations, not pancreatic status — pancreatic insufficiency in CF is captured by the separate K86.81 code, the same code used for exocrine pancreatic insufficiency from any cause (as also seen with the alcohol-induced chronic pancreatitis question in Paper 7). This is a genuinely easy code-family mix-up: assuming CF''s own E84 chapter has a dedicated pancreatic-insufficiency subcode when it actually does not.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f77f8aa2-8771-4575-b127-373cf30b27dd', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 5, 'A patient with rheumatoid arthritis develops rheumatoid vasculitis, confirmed by biopsy, causing digital ischemia requiring wound care for resulting fingertip ulceration. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dc2c4346-1114-48d6-9056-9d1565b843cc', 'f77f8aa2-8771-4575-b127-373cf30b27dd', 0, 'M05.20, L98.499');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ed552363-c588-4fb5-819e-e3d8ba83b71a', 'f77f8aa2-8771-4575-b127-373cf30b27dd', 1, 'M06.9, I77.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1ed5a921-0c13-4233-81ff-52ffe4a39ebc', 'f77f8aa2-8771-4575-b127-373cf30b27dd', 2, 'M05.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3a3675da-562a-4eb8-a6a6-a0bbd4eafeb4', 'f77f8aa2-8771-4575-b127-373cf30b27dd', 3, 'I77.6, M05.20');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f77f8aa2-8771-4575-b127-373cf30b27dd', 'dc2c4346-1114-48d6-9056-9d1565b843cc', 'M05.20 (rheumatoid vasculitis with rheumatoid arthritis of unspecified site) is the specific combination code capturing both the RA and the vasculitis complication together. L98.499 (non-pressure chronic ulcer of skin, other site — used here for the fingertip ulceration resulting from the vasculitis-caused ischemia) is added as the resulting wound needing home health wound care. M06.9 (uncomplicated RA, without the vasculitis specificity) would under-code the documented complication. I77.6 (arteritis, unspecified) is a less precise, non-RA-specific vasculitis code that doesn''t capture the documented rheumatoid etiology as directly as M05.20 does.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('be23ed89-d3eb-47b5-a1be-7621a4439d37', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 6, 'A patient with HIV infection, virally suppressed and clinically stable on antiretroviral therapy with no current opportunistic infection or HIV-related illness, is admitted to home health for an unrelated post-surgical wound care episode. Select the correct coding for the HIV status.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cbfdc84a-92dd-4cb4-b5f1-094116577c54', 'be23ed89-d3eb-47b5-a1be-7621a4439d37', 0, 'B20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5f903331-7ee1-45ee-8824-2336e690ef74', 'be23ed89-d3eb-47b5-a1be-7621a4439d37', 1, 'Z21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c9e2c094-b401-4b71-8606-ed0c693836a4', 'be23ed89-d3eb-47b5-a1be-7621a4439d37', 2, 'R75');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f1495176-9371-4e21-8fb6-967959052947', 'be23ed89-d3eb-47b5-a1be-7621a4439d37', 3, 'B20, Z21');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('be23ed89-d3eb-47b5-a1be-7621a4439d37', 'cbfdc84a-92dd-4cb4-b5f1-094116577c54', 'B20 (HIV disease) remains the correct code even for a clinically stable, virally suppressed patient with no current opportunistic infection — ICD-10-CM guidelines specifically direct that once a patient has a confirmed diagnosis of HIV disease (as opposed to Z21, asymptomatic HIV infection status, which is used for patients who have tested positive but have never been diagnosed with any HIV-related illness), B20 is used for all subsequent encounters, regardless of current symptom status, since the diagnosis of HIV DISEASE (as opposed to simply infection status) is a permanent classification once established — this is a genuinely important, frequently tested distinction, since it runs counter to the general ''resolved condition converts to history/status'' pattern used elsewhere: B20 does NOT revert to Z21 once assigned, even if the patient becomes asymptomatic and virally suppressed.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7119d19c-e4e0-43b6-b635-cbec6b5ccd4f', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 7, 'A patient''s home health record documents a stool culture positive for Clostridioides difficile with the patient having active diarrhea, confirmed by the physician as a first episode of C. diff colitis (not a recurrence), requiring oral vancomycin and enhanced contact precautions during home visits. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b817e643-ee05-419f-af26-1d76c791f87e', '7119d19c-e4e0-43b6-b635-cbec6b5ccd4f', 0, 'A04.72');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fbe7fe35-2ad3-4f0a-b6fa-487c53dd09bb', '7119d19c-e4e0-43b6-b635-cbec6b5ccd4f', 1, 'A04.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e0599582-a45e-4e4e-90c1-8ff9180294ac', '7119d19c-e4e0-43b6-b635-cbec6b5ccd4f', 2, 'B96.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1d2025ff-a205-4ebd-8b34-a67988a6486a', '7119d19c-e4e0-43b6-b635-cbec6b5ccd4f', 3, 'K52.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7119d19c-e4e0-43b6-b635-cbec6b5ccd4f', 'b817e643-ee05-419f-af26-1d76c791f87e', 'A04.72 (enterocolitis due to Clostridium difficile, not specified as recurrent) is the correct, complete combination code — A04.7 itself is a non-billable parent category requiring the more specific 5-character extension: A04.71 for a documented RECURRENT episode, or A04.72 when recurrence is not specified/this is a first episode, which matches this stem. This single code already captures both the organism and the clinical colitis presentation together, so B96.89 (a distractor ''other specified bacterial agent'' code, used only as a secondary code alongside a separate intestinal-infection code, not needed here since A04.72 already conveys the organism) is not separately added. A04.9 (bacterial intestinal infection, unspecified) and K52.9 (noninfective gastroenteritis/colitis, unspecified) would both under-code the documented, specifically confirmed C. diff etiology.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('de3ee4a1-0cf3-4cde-b36c-6ec9e75018c2', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 8, 'A patient''s home health record documents a nasal swab positive for MRSA colonization (screening test, no active infection, no symptoms), identified during routine pre-admission screening. Select the correct coding approach for this finding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c9e21115-71a9-4954-8e53-62ec0269d28c', 'de3ee4a1-0cf3-4cde-b36c-6ec9e75018c2', 0, 'A49.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c806da66-ab04-459b-90c9-2b9199ac8316', 'de3ee4a1-0cf3-4cde-b36c-6ec9e75018c2', 1, 'Z22.322');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f81054f9-d18f-4309-b8b0-fd414c63c6a7', 'de3ee4a1-0cf3-4cde-b36c-6ec9e75018c2', 2, 'B95.62');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('75201ce0-4d0b-4a18-86d1-0e9655f35ee0', 'de3ee4a1-0cf3-4cde-b36c-6ec9e75018c2', 3, 'No code is needed since colonization without infection isn''t clinically significant');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('de3ee4a1-0cf3-4cde-b36c-6ec9e75018c2', 'c806da66-ab04-459b-90c9-2b9199ac8316', 'Z22.322 (carrier of Methicillin resistant Staphylococcus aureus) is the correct status code for confirmed MRSA COLONIZATION without active infection — this is clinically significant information affecting infection control precautions during home visits (mirroring the latex-allergy and penicillin-allergy status-coding questions in Paper 8, where a stable, non-acute status finding is still coded because it''s relevant to care precautions), so it should not be omitted as clinically insignificant. A49.02 (MRSA infection, unspecified site — an ACTIVE infection code) and B95.62 (MRSA as the cause of disease classified elsewhere — used as a secondary code alongside an actual infection diagnosis) both incorrectly imply an active infection, which the stem explicitly rules out (asymptomatic screening finding only).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('97b9d9a6-806b-4005-b98f-f0550b43cc5d', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 9, 'A patient with multiple sclerosis, relapsing-remitting type, is admitted to home health during an acute exacerbation causing new lower extremity weakness and bladder dysfunction, both physician-documented as directly due to the current MS relapse. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f213fa1f-5273-4fcc-97a6-e0382ed69506', '97b9d9a6-806b-4005-b98f-f0550b43cc5d', 0, 'G35A, R26.9, R32');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f4dc5dd8-1c30-45a5-ac74-5bd05b5667f3', '97b9d9a6-806b-4005-b98f-f0550b43cc5d', 1, 'G35A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d2dde3e4-ee54-44ee-a47b-1db5b5176159', '97b9d9a6-806b-4005-b98f-f0550b43cc5d', 2, 'G35A, G83.9, N31.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8365849b-2d97-446e-bacb-39395f762102', '97b9d9a6-806b-4005-b98f-f0550b43cc5d', 3, 'G83.9, N31.9, G35A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('97b9d9a6-806b-4005-b98f-f0550b43cc5d', 'f4dc5dd8-1c30-45a5-ac74-5bd05b5667f3', 'G35A (relapsing-remitting multiple sclerosis) is coded alone here, matching the documented MS subtype — G35 by itself is a 3-character category header, not a billable code, and requires the additional character specifying course (G35A relapsing-remitting, G35B primary progressive, G35C secondary progressive, or G35D unspecified). ICD-10-CM does not require or support separately stacking generic weakness/bladder-dysfunction codes on top of G35A when those symptoms are explicitly documented as direct manifestations of an active MS relapse, since G35A itself is understood clinically to encompass the range of neurological manifestations MS can produce during an exacerbation; this mirrors the non-redundant-combination-code principle applied elsewhere in this exam series (Crohn''s/fistula, aphasia/dysgraphia in Paper 8) — R26.9 (unspecified abnormality of gait), R32 (unspecified urinary incontinence), G83.9 (paralysis, unspecified), and N31.9 (neurogenic bladder, unspecified) would all be redundant symptom-level codes when the single underlying, actively-relapsing MS diagnosis already accounts for these manifestations without further specificity being demonstrated as clinically distinct.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('015cf5e2-3bcc-47b3-ab81-aa168459fbb3', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 10, 'A patient with amyotrophic lateral sclerosis (ALS), rapidly progressive, now has both dysphagia requiring a modified diet and respiratory muscle weakness requiring nocturnal BiPAP, both documented as direct ALS manifestations. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('91bc51a5-7ec0-4501-b061-ff773c56c563', '015cf5e2-3bcc-47b3-ab81-aa168459fbb3', 0, 'G12.21, R13.10, J96.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5a2d4093-7e81-4046-ba6b-b735e3ba72d3', '015cf5e2-3bcc-47b3-ab81-aa168459fbb3', 1, 'G12.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('edb140f4-6259-47bc-a9e6-4eabe9bd63b5', '015cf5e2-3bcc-47b3-ab81-aa168459fbb3', 2, 'G12.21, J96.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e81364f2-d0a5-4df6-9f75-141dab38394c', '015cf5e2-3bcc-47b3-ab81-aa168459fbb3', 3, 'G12.21, R13.10');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('015cf5e2-3bcc-47b3-ab81-aa168459fbb3', '5a2d4093-7e81-4046-ba6b-b735e3ba72d3', 'G12.21 (amyotrophic lateral sclerosis) is coded alone, following the identical non-redundant-manifestation principle just tested with the MS/relapse question in this same paper — dysphagia and respiratory weakness explicitly documented as direct ALS manifestations don''t require separately stacked symptom codes (R13.10 dysphagia, J96.10 chronic respiratory failure) when G12.21 itself is understood to encompass ALS''s known progressive manifestations; this is a deliberately repeated pattern across this exam series specifically because many candidates default to over-stacking symptom codes onto a single well-understood progressive neurological diagnosis rather than recognizing when the base code already conveys the clinical picture.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('659e5af1-e5b1-433f-8191-1fe39202e3b1', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 11, 'A patient develops Guillain-Barré syndrome following a documented recent viral gastroenteritis illness (the trigger identified by the physician), now with residual lower extremity weakness being managed by home health PT, with the acute ascending paralysis phase having resolved. Select the correct coding for this home health episode.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b1332bef-11a4-4d76-8072-37237f017129', '659e5af1-e5b1-433f-8191-1fe39202e3b1', 0, 'G61.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3d707b49-184c-4fca-973f-2fbce45cd7e0', '659e5af1-e5b1-433f-8191-1fe39202e3b1', 1, 'G70.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9943ad73-4cc5-46d6-b111-8aa4d3cc6d34', '659e5af1-e5b1-433f-8191-1fe39202e3b1', 2, 'G04.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6057198a-ffdb-4697-9588-2d62fd58d70f', '659e5af1-e5b1-433f-8191-1fe39202e3b1', 3, 'A08.4, G61.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('659e5af1-e5b1-433f-8191-1fe39202e3b1', 'b1332bef-11a4-4d76-8072-37237f017129', 'G61.0 (Guillain-Barré syndrome) remains the correct code for the current home health episode addressing residual weakness — even though the ACUTE ascending paralysis phase has resolved, Guillain-Barré syndrome itself as a diagnosis is coded as long as it remains the clinically relevant condition being actively managed (here, through PT for residual deficits), rather than converting to a resolved/history code, since the residual weakness is a direct ongoing consequence still requiring active treatment. G70.00 (myasthenia gravis, a different neuromuscular condition entirely) is wrong. G04.90 (encephalitis/myelitis, unspecified) is the wrong diagnosis family. A08.4 (the preceding viral gastroenteritis, now resolved and not the current focus of care) is not re-added at this point since it''s a resolved trigger, not an active, currently-treated condition.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a9f31237-3184-43ea-92ce-b0efe7f9cb8a', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 12, 'A patient with myasthenia gravis, generalized, is admitted to home health following a recent myasthenic crisis (now resolved after hospitalization and treatment adjustment), currently stable on pyridostigmine with residual mild ptosis. Select the correct coding for this home health episode.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('175fd135-aec0-406a-93a9-3554cb151d3b', 'a9f31237-3184-43ea-92ce-b0efe7f9cb8a', 0, 'G70.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('187e507c-c164-4848-87c2-629fde872cf1', 'a9f31237-3184-43ea-92ce-b0efe7f9cb8a', 1, 'G70.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('412945f7-c649-47ff-bc02-c4ca4b8c8755', 'a9f31237-3184-43ea-92ce-b0efe7f9cb8a', 2, 'G70.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1322a3ef-bbf1-499f-9a9c-0e16afc0b910', 'a9f31237-3184-43ea-92ce-b0efe7f9cb8a', 3, 'G70.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a9f31237-3184-43ea-92ce-b0efe7f9cb8a', '187e507c-c164-4848-87c2-629fde872cf1', 'G70.00 (myasthenia gravis without (acute) exacerbation) is correct since the myasthenic CRISIS has resolved and the patient is currently stable — G70.01 (myasthenia gravis WITH exacerbation) would incorrectly code this as if the crisis were still actively occurring. G70.2 (congenital and developmental myasthenia) is the wrong etiology entirely (this is acquired, autoimmune myasthenia gravis, not congenital). G70.9 (myoneural disorder, unspecified) would under-code the documented specific myasthenia gravis diagnosis when the more specific G70.0- combination code is available and matches.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d714fe11-2242-49ac-9a1c-5dffb39511f5', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 13, 'A patient''s home health agency admits a patient and must submit a Notice of Admission (NOA) to Medicare. Per current Medicare home health billing requirements (post-RAP elimination), what is the required timeframe for submitting the NOA after the start of care date?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d671a2fb-ed69-4079-86dd-80c6134c852e', 'd714fe11-2242-49ac-9a1c-5dffb39511f5', 0, 'Within 5 calendar days of the start of care date');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cfe8d9f3-225b-42d0-a151-b81ec21bd222', 'd714fe11-2242-49ac-9a1c-5dffb39511f5', 1, 'Within 30 calendar days of the start of care date');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('99e71753-109f-48ac-b6f2-46a1188dd127', 'd714fe11-2242-49ac-9a1c-5dffb39511f5', 2, 'There is no specific timeframe — NOA submission timing has no payment consequence');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fd115321-e4a8-4e1e-a3b2-126df7cdcfbb', 'd714fe11-2242-49ac-9a1c-5dffb39511f5', 3, 'Within 60 calendar days, aligned with the certification period');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d714fe11-2242-49ac-9a1c-5dffb39511f5', 'd671a2fb-ed69-4079-86dd-80c6134c852e', 'Since the elimination of the Request for Anticipated Payment (RAP) and its replacement with the Notice of Admission (NOA) requirement (effective CY2022), the NOA must be submitted within 5 calendar days of the start of care date — failure to submit within this window results in a payment reduction for the days between the SOC date and the late NOA submission, making the timing genuinely consequential for payment, not merely administrative; this replaced the prior RAP system''s own timing/payment-consequence structure with this specific 5-day NOA standard.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bb01a2be-01d6-4e6f-bac8-4a4714f31426', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 14, 'A home health patient exhibits severe agitation and a risk of pulling out a necessary medical device (e.g., a feeding tube), and the care team considers using a physical restraint to prevent this. Per CoP requirements governing restraint use in home health, what standard applies?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('90e26598-9ecb-47eb-ab9b-8be2a43c6799', 'bb01a2be-01d6-4e6f-bac8-4a4714f31426', 0, 'Restraints may be used freely at the family''s discretion without any clinical determination');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ffe2a6b8-f7b7-4227-8da5-858941961c60', 'bb01a2be-01d6-4e6f-bac8-4a4714f31426', 1, 'Restraint use must be based on a documented clinical need, ordered by a physician, used only as a last resort after less restrictive alternatives are considered, and must be time-limited with ongoing reassessment — home health CoPs restrict restraint use similarly to other Medicare-certified settings'' patient rights protections');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a168891c-c064-4044-81b9-faaf6bc46166', 'bb01a2be-01d6-4e6f-bac8-4a4714f31426', 2, 'Restraints are entirely prohibited in the home health setting under all circumstances, with no exceptions');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5587d69a-827e-4505-989c-45d1e69b524a', 'bb01a2be-01d6-4e6f-bac8-4a4714f31426', 3, 'Restraint use requires no physician order as long as a family member consents');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('bb01a2be-01d6-4e6f-bac8-4a4714f31426', 'ffe2a6b8-f7b7-4227-8da5-858941961c60', 'CoP patient rights provisions extend meaningful restrictions on restraint use into the home health setting, consistent with the broader Medicare patient-rights framework applied across care settings — restraint use must be based on documented clinical necessity, physician-ordered, used only after less restrictive alternatives have been considered, and subject to time limits and ongoing reassessment, rather than being either freely permitted at family discretion or categorically banned outright with no clinical pathway at all; this reflects a genuine, meaningful patient-safety-and-rights balance, not either extreme.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9be241bb-fdbf-401d-89b5-a0a91008467a', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 15, 'A patient''s home health agency identifies a suspected case of elder abuse (unexplained bruising pattern inconsistent with the caregiver''s explanation) during a routine visit. Per CoP and mandatory reporting principles, what is required?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('39574872-48e2-40cf-bc05-1e29a8e5e254', '9be241bb-fdbf-401d-89b5-a0a91008467a', 0, 'The agency should document the finding but has no reporting obligation beyond internal documentation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5d18f5e3-8410-439b-8c64-c6d34f0d0044', '9be241bb-fdbf-401d-89b5-a0a91008467a', 1, 'The agency must report suspected abuse/neglect to appropriate authorities (e.g., adult protective services) per applicable mandatory reporting laws, in addition to internal documentation and care plan adjustments to protect the patient');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6748ded4-c92f-483e-bd87-afd82c28c7f1', '9be241bb-fdbf-401d-89b5-a0a91008467a', 2, 'Only the physician, not home health staff, has a mandatory reporting obligation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b30f3a8d-aba3-4d6f-92c4-141aa1716e9f', '9be241bb-fdbf-401d-89b5-a0a91008467a', 3, 'Reporting is only required if the patient explicitly requests it');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9be241bb-fdbf-401d-89b5-a0a91008467a', '5d18f5e3-8410-439b-8c64-c6d34f0d0044', 'Home health clinical staff are generally mandatory reporters under state adult protective services / elder abuse reporting laws, and suspected abuse or neglect identified during care must be reported to the appropriate authorities, not merely documented internally — this is a genuine legal and ethical obligation layered on top of (not a substitute for) internal clinical documentation and any necessary care plan adjustments to protect the patient''s immediate safety, and this reporting obligation applies to the home health staff identifying the concern directly, not exclusively to the physician.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a659cd9c-a531-4d14-84d6-2df3c5246c63', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 16, 'A patient with peripartum cardiomyopathy, diagnosed in the last month of pregnancy and confirmed to persist 6 weeks postpartum with continued reduced ejection fraction, is on home health for heart failure management. Select the correct coding for this postpartum episode.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('74036d2e-e0c6-4dd1-ad71-e73fa2f3f511', 'a659cd9c-a531-4d14-84d6-2df3c5246c63', 0, 'O90.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5286bf22-6e5d-44aa-8a46-5e91e674e6d9', 'a659cd9c-a531-4d14-84d6-2df3c5246c63', 1, 'I42.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('023cd7a5-3900-48e1-90a0-58e4107366b9', 'a659cd9c-a531-4d14-84d6-2df3c5246c63', 2, 'O90.3, I50.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ba3397dd-aa79-4798-b3d3-0addf6678d86', 'a659cd9c-a531-4d14-84d6-2df3c5246c63', 3, 'I50.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a659cd9c-a531-4d14-84d6-2df3c5246c63', '74036d2e-e0c6-4dd1-ad71-e73fa2f3f511', 'O90.3 (peripartum cardiomyopathy) is the single, specific combination code capturing this exact condition — it is used for the condition whether diagnosed antepartum (late pregnancy) or postpartum, and remains the correct code during the postpartum period while the condition is still active, without needing a separate general heart failure code (I50.9) stacked on top, since O90.3 already specifically identifies this as a cardiomyopathy with heart failure implications. I42.8 (other cardiomyopathies, a non-obstetric-specific code) would under-code the documented pregnancy-related etiology when the more specific peripartum-specific code exists and applies.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1d2b14d7-8243-43a6-8bd5-152b24aec476', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 17, 'A patient experiences a postpartum hemorrhage immediately after a vaginal delivery, requiring blood transfusion, now 5 days postpartum and stable, admitted to home health for wound/perineal care and general postpartum monitoring. Should the postpartum hemorrhage still be coded at this home health SOC, given it has resolved?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dab3fc3e-cbfb-4d4a-9a7d-4624702d67d5', '1d2b14d7-8243-43a6-8bd5-152b24aec476', 0, 'Yes — O72.1 (other immediate postpartum hemorrhage) remains appropriately coded as a relevant recent complication of this delivery/postpartum course even though the acute bleeding itself has stopped, since it''s clinically relevant context for the current postpartum recovery period and remains within the global postpartum timeframe');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b3ef1301-b8d5-49aa-b6bd-18ee9aba5f3b', '1d2b14d7-8243-43a6-8bd5-152b24aec476', 1, 'No — since the hemorrhage has stopped, it should not be coded at all');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9bcd258f-96a5-4201-afbb-cc36944d1125', '1d2b14d7-8243-43a6-8bd5-152b24aec476', 2, 'Yes, but only using a personal history Z-code (Z87.59), never the active O72.1 code, given more than 24 hours have passed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6e213dc9-9872-40f3-a89a-0973edd2ea27', '1d2b14d7-8243-43a6-8bd5-152b24aec476', 3, 'The hemorrhage should be coded as a NEW diagnosis unrelated to the delivery');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1d2b14d7-8243-43a6-8bd5-152b24aec476', 'dab3fc3e-cbfb-4d4a-9a7d-4624702d67d5', 'Obstetric complication codes (O-codes) remain appropriately coded throughout the relevant postpartum period (generally defined as up to 6 weeks postpartum, sometimes documented further per specific circumstances) as long as the complication remains clinically relevant to the current episode of care, even after the acute event itself has stabilized — O72.1 documents a real, recent, clinically significant complication of this specific delivery that is still within the active postpartum global period, distinct from resolved-condition-converts-to-history logic applied to non-obstetric conditions elsewhere in this series, since the obstetric/postpartum coding convention specifically supports continued O-code use throughout the postpartum period itself.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('67c76f12-1740-432a-b393-053cd14669e8', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 18, 'A patient with a history of successfully treated pulmonary tuberculosis (completed a full course of RIPE therapy 3 years ago, confirmed cured, no current active disease) is admitted to home health for an unrelated post-surgical episode. Select the correct coding for the TB history.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4e471f13-46dc-47fd-82a4-1557e9d67a63', '67c76f12-1740-432a-b393-053cd14669e8', 0, 'A15.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('32ae222e-eb56-49f4-93e0-a1d15ed4a064', '67c76f12-1740-432a-b393-053cd14669e8', 1, 'B90.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dc737fdf-e8a5-4735-ab51-27cca40c502c', '67c76f12-1740-432a-b393-053cd14669e8', 2, 'Z86.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0417c150-d0aa-4735-9bd7-b8eff9d98fe0', '67c76f12-1740-432a-b393-053cd14669e8', 3, 'A15.0, Z86.11');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('67c76f12-1740-432a-b393-053cd14669e8', 'dc737fdf-e8a5-4735-ab51-27cca40c502c', 'Z86.11 (personal history of tuberculosis) is the correct code for confirmed, successfully treated, resolved TB — A15.0 (respiratory tuberculosis, an ACTIVE disease code) would incorrectly imply currently active TB, contradicted by the documented completed treatment and cure. B90.9 (sequelae of tuberculosis, unspecified) is reserved for LATE EFFECTS/residual damage from prior TB (e.g., residual lung scarring causing ongoing symptoms), not simply a history of successfully treated, fully resolved disease with no residual effects documented — this distinction (history alone vs. history WITH a documented residual late effect) is a genuinely useful one this question tests.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7a53b7a7-964f-46a1-9a98-d744b0aa08e8', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 19, 'A patient with a history of chickenpox in childhood develops a new, unilateral, dermatomal vesicular rash with severe pain along the T4 dermatome, confirmed by the physician as herpes zoster (shingles). Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ef9f1af8-fc31-4870-8dd8-cb0bfd9ea9e9', '7a53b7a7-964f-46a1-9a98-d744b0aa08e8', 0, 'B02.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fe71c96b-84d6-431f-aff9-04fa4eb7aab2', '7a53b7a7-964f-46a1-9a98-d744b0aa08e8', 1, 'B02.29');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0c08f31f-5fee-48a5-a9bc-3adf549067b5', '7a53b7a7-964f-46a1-9a98-d744b0aa08e8', 2, 'B02.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8e4e5ee9-fe2a-430a-bc93-21a458ceb8e5', '7a53b7a7-964f-46a1-9a98-d744b0aa08e8', 3, 'B01.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7a53b7a7-964f-46a1-9a98-d744b0aa08e8', 'ef9f1af8-fc31-4870-8dd8-cb0bfd9ea9e9', 'B02.9 (zoster without complications) is correct for uncomplicated shingles — the stem describes the classic dermatomal vesicular rash with pain but does not document any of the specific complications (like postherpetic neuralgia, ophthalmic involvement, or other specific organ involvement) that would warrant one of the more specific B02.2x/B02.3x/etc. complication-specific subcodes. B02.29 and B02.21 are both distractors from the ''zoster with other nervous system involvement'' subcategory, which would require documentation of a specific neurological complication beyond the typical dermatomal pain itself. B01.9 is the wrong disease entirely (varicella/chickenpox itself, not zoster/shingles — the reactivation).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9dca9b44-3ae6-418d-b9d1-ce04558d5abc', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 20, 'A patient with a history of shingles now has confirmed postherpetic neuralgia, a well-recognized chronic pain complication persisting after the acute rash resolved, requiring ongoing gabapentin management. Select the correct coding for this specific complication.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7dec3efd-3ce8-4ff3-8b33-e17bac5fde45', '9dca9b44-3ae6-418d-b9d1-ce04558d5abc', 0, 'B02.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ceca5608-ba2b-4b6c-8c61-6bc0d9d0cd9f', '9dca9b44-3ae6-418d-b9d1-ce04558d5abc', 1, 'B02.29');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f6d23176-c563-4551-9960-4df9f593cc83', '9dca9b44-3ae6-418d-b9d1-ce04558d5abc', 2, 'G89.29');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2051ef07-5573-45c1-b8c0-dfc4fea176f5', '9dca9b44-3ae6-418d-b9d1-ce04558d5abc', 3, 'B02.9, G89.29');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9dca9b44-3ae6-418d-b9d1-ce04558d5abc', 'ceca5608-ba2b-4b6c-8c61-6bc0d9d0cd9f', 'B02.29 (postherpetic polyneuropathy — the specific zoster-complication code that directly captures postherpetic neuralgia) is the single, most specific code for this exact, well-recognized complication — B02.9 (zoster WITHOUT complications) would be contradictory to use here since a complication (the neuralgia) IS specifically documented. G89.29 (other chronic pain, a general, nonspecific chronic pain code) would under-code the documented specific zoster-etiology relationship when the more precise combination code (B02.29) is available and directly matches.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2b1469cd-11aa-4d09-b1a3-afce3377670b', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 21, 'A patient with gout, confirmed by joint aspiration showing monosodium urate crystals, has an acute gout flare of the right first metatarsophalangeal joint, with a documented history of similar recurrent flares over the past 2 years. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6988beb5-9f00-47f6-87ce-b0846df26640', '2b1469cd-11aa-4d09-b1a3-afce3377670b', 0, 'M10.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7fa36ae0-aec1-4e3d-bae7-8fa0761751a7', '2b1469cd-11aa-4d09-b1a3-afce3377670b', 1, 'M1A.9X0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('39fd304b-82ad-4493-8b06-9e682ea38515', '2b1469cd-11aa-4d09-b1a3-afce3377670b', 2, 'M10.071');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5471b0d0-a680-4983-9fa4-093dfb975f93', '2b1469cd-11aa-4d09-b1a3-afce3377670b', 3, 'M1A.071');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2b1469cd-11aa-4d09-b1a3-afce3377670b', '39fd304b-82ad-4493-8b06-9e682ea38515', 'M10.071 (idiopathic gout, right ankle and foot — used here for the first MTP joint, which falls under the ankle/foot anatomical grouping in ICD-10-CM''s joint-site classification) is the correct code for an ACUTE gout flare — the M1A category is specifically for CHRONIC gout (chronic gouty arthropathy, tophaceous or non-tophaceous), which is a distinct classification from an acute flare, even in a patient with a history of recurrent flares; recurrent ACUTE flares are still coded to M10 each time they occur, while M1A is reserved for the chronic, ongoing gouty arthritis pattern specifically documented as such by the physician (not merely inferred from flare frequency). M10.9 (gout, unspecified) under-codes the documented specific joint site.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('48f53650-cddf-4f51-8258-04fb4d7a2978', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 22, 'A patient has chronic tophaceous gout (idiopathic — no drug-induced, lead-induced, or renal-impairment etiology documented), physician-documented as an established chronic condition with visible tophi on physical exam, currently having an acute-on-chronic flare of the right first MTP joint. Select the correct coding, contrasting with the acute-only gout question in this same paper.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('77b7a4ca-ef1d-406b-880a-46e1027010e5', '48f53650-cddf-4f51-8258-04fb4d7a2978', 0, 'M10.071');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4e50336f-b4d1-4de2-abdf-6ab1fc9f4115', '48f53650-cddf-4f51-8258-04fb4d7a2978', 1, 'M1A.0711');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('54351559-8517-423b-99aa-9029b81df4cc', '48f53650-cddf-4f51-8258-04fb4d7a2978', 2, 'M1A.9XX0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c78e13c5-3188-4c18-8eaa-fb36cfe0f87b', '48f53650-cddf-4f51-8258-04fb4d7a2978', 3, 'M10.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('48f53650-cddf-4f51-8258-04fb4d7a2978', '4e50336f-b4d1-4de2-abdf-6ab1fc9f4115', 'M1A.0711 (idiopathic chronic gout, right ankle and foot, with tophus) is the correct code — M10.071 (used correctly for a purely ACUTE flare in the earlier question in this paper) would under-code the documented CHRONIC, tophaceous nature of this patient''s gout, since M1A is the dedicated chronic-gout category, structurally mirroring M10''s etiology/site/laterality digits but adding a required tophus-presence character (0 = without tophus, 1 = with tophus). Since no drug-induced, lead-induced, or renal-impairment cause is documented, the idiopathic etiology branch (M1A.0-) applies, matched to the same right ankle/foot site grouping used for M10.071, with the final character set to 1 for the physician''s documented tophi. M1A.9XX0 (chronic gout, unspecified etiology and site, without tophus) would under-code both the documented idiopathic etiology/specific site and the documented tophi.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ef343e11-4866-4e5f-94dc-ecf88ac9ecaa', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 23, 'A patient with iron deficiency anemia, confirmed by low ferritin and low iron saturation, is found by the physician to have the anemia caused by chronic GI blood loss from a colonic angiodysplasia (confirmed by colonoscopy). Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b538ddb4-c10d-4bd8-a7d7-9eaac063b4bf', 'ef343e11-4866-4e5f-94dc-ecf88ac9ecaa', 0, 'D50.0, K55.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dc95ef9b-2cb2-4273-b77d-8de74615e16c', 'ef343e11-4866-4e5f-94dc-ecf88ac9ecaa', 1, 'D64.9, K55.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f13b49f0-e7dc-4a2b-8e97-97302acf63db', 'ef343e11-4866-4e5f-94dc-ecf88ac9ecaa', 2, 'D63.1, K55.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('916a21d0-b1dd-4a4d-ab04-77f1dc6954fd', 'ef343e11-4866-4e5f-94dc-ecf88ac9ecaa', 3, 'D50.9, K55.20');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ef343e11-4866-4e5f-94dc-ecf88ac9ecaa', 'b538ddb4-c10d-4bd8-a7d7-9eaac063b4bf', 'D50.0 (iron deficiency anemia secondary to blood loss (chronic)) is the specific combination code matching the documented chronic-GI-bleed etiology — more precise than D50.9 (iron deficiency anemia, unspecified, which doesn''t specify the blood-loss cause) or D64.9 (anemia, unspecified — wrong, less specific disease family entirely) or D63.1 (anemia in CKD, the wrong etiology-specific code used correctly elsewhere in this exam series but not applicable here since this anemia is GI-blood-loss-driven, not CKD-driven). K55.20 (angiodysplasia of colon without hemorrhage — used here since the question describes chronic, ongoing low-grade bleeding rather than an acute hemorrhage episode) is added as the source lesion.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d1f0a057-8c4a-484a-b0bc-bdaf1771aa24', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 24, 'A patient with chronic anemia of unclear initial cause is found by the physician to have anemia specifically due to their chronic kidney disease stage 3b, now confirmed after ruling out iron deficiency and other causes. Select the correct coding, contrasting with the iron-deficiency-anemia question in this paper.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a0f67368-45b9-436f-87de-b354d1079454', 'd1f0a057-8c4a-484a-b0bc-bdaf1771aa24', 0, 'D63.1, N18.32');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8f32a332-cbc2-40f1-a2a5-f25046ad57a0', 'd1f0a057-8c4a-484a-b0bc-bdaf1771aa24', 1, 'N18.32, D63.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f35ffefc-5813-431d-85d4-b7e4c3a583f3', 'd1f0a057-8c4a-484a-b0bc-bdaf1771aa24', 2, 'D64.9, N18.32');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f42943ba-7df3-4f8c-9b1c-bd5511c22df4', 'd1f0a057-8c4a-484a-b0bc-bdaf1771aa24', 3, 'D50.9, N18.32');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d1f0a057-8c4a-484a-b0bc-bdaf1771aa24', '8f32a332-cbc2-40f1-a2a5-f25046ad57a0', 'N18.32 (CKD stage 3b) is sequenced first per D63.1''s own ''code first the underlying condition'' instructional note, which requires the CKD code to lead with the anemia code (D63.1, anemia in chronic kidney disease) following — the same etiology-first sequencing rule already established in Paper 7 (Q28) for this exact code pair, deliberately retested here to confirm the sequencing is applied consistently rather than reversed. D64.9 (anemia, unspecified) and D50.9 (iron deficiency anemia, unspecified — explicitly ruled out by the stem) would both under-code or misattribute the documented CKD-specific etiology.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('66f4577a-1b2c-4f5e-bde9-96690001e6bc', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 25, 'A patient with chronic obstructive pulmonary disease also has confirmed gastroesophageal reflux disease, with the physician noting the GERD is NOT related to the COPD (two independent, coexisting chronic conditions, no causal relationship documented). Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4290c460-80f4-4bae-a07b-bd4c1c3bb742', '66f4577a-1b2c-4f5e-bde9-96690001e6bc', 0, 'J44.9, K21.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ef6674fe-7449-4ad1-8657-3fc0a8b245af', '66f4577a-1b2c-4f5e-bde9-96690001e6bc', 1, 'K21.9, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e274f6ef-0386-4575-8736-bea126795067', '66f4577a-1b2c-4f5e-bde9-96690001e6bc', 2, 'J44.9, K21.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1eecfc91-8bf5-4001-bc80-7046c9a847f5', '66f4577a-1b2c-4f5e-bde9-96690001e6bc', 3, 'K21.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('66f4577a-1b2c-4f5e-bde9-96690001e6bc', '4290c460-80f4-4bae-a07b-bd4c1c3bb742', 'J44.9 (COPD) is sequenced first as the more clinically significant, typically primary reason for home health involvement in a respiratory-focused care plan, with K21.9 (GERD without esophagitis) added as a separate, independently documented, coexisting chronic condition — there is no ICD-10-CM combination code linking COPD and GERD (unlike some of the true combination-code relationships tested elsewhere in this series), so these are simply two separately sequenced codes, testing whether a candidate incorrectly assumes a combination-code relationship exists here the way it does for genuinely linked condition pairs elsewhere in this exam series.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cbc2fba2-a999-4554-8b66-1938ea42f786', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 26, 'A patient with a documented history of major depressive disorder now presents with acute confusion, disorientation, and fluctuating attention that developed over the past 2 days, with the home health nurse identifying this as a new, acute change distinct from the patient''s baseline. The physician confirms this represents delirium, likely due to a new urinary tract infection. Select the correct coding, distinguishing delirium from dementia and from the pre-existing depression.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9f00f951-3f01-4ed6-95e7-f8805648c359', 'cbc2fba2-a999-4554-8b66-1938ea42f786', 0, 'F32.9, F05');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d74e2db7-0faf-40a0-907b-d19dc5f16cc0', 'cbc2fba2-a999-4554-8b66-1938ea42f786', 1, 'F05, N39.0, F32.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('087289fc-0ae9-4723-b3dd-7ee1b328480d', 'cbc2fba2-a999-4554-8b66-1938ea42f786', 2, 'F03.90, N39.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c349206b-3ae2-4d21-8b89-3bea2101e9f2', 'cbc2fba2-a999-4554-8b66-1938ea42f786', 3, 'F05, F32.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cbc2fba2-a999-4554-8b66-1938ea42f786', 'd74e2db7-0faf-40a0-907b-d19dc5f16cc0', 'F05 (delirium due to known physiological condition) is sequenced first as the acute, currently active condition being addressed. N39.0 (urinary tract infection) is added as the underlying documented cause of the delirium per the ''code first the underlying condition'' convention for delirium. F32.9 (major depressive disorder, unspecified) remains coded as the separate, pre-existing chronic psychiatric condition. This tests a genuinely important distinction many candidates conflate: delirium (F05 — an ACUTE, typically reversible confusional state with a specific, often infectious/metabolic cause, fluctuating course) versus dementia (F03.9x — a chronic, typically progressive, non-fluctuating cognitive decline) are fundamentally different diagnostic categories requiring different codes, not interchangeable terms for ''confusion in an older patient.''');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8a15eb79-73a9-43eb-be4b-d80543be06e4', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 27, 'A patient with PTSD, chronic, related to combat trauma from military service decades ago, is admitted to home health for an unrelated cardiac recovery episode. The patient''s PTSD is well-managed with ongoing therapy and medication, with no acute exacerbation currently. Select the correct coding for the PTSD status.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('acccd11b-3521-4e4c-bc8d-2c3f14a98d0f', '8a15eb79-73a9-43eb-be4b-d80543be06e4', 0, 'F43.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('039b731e-87b1-4c0b-a51f-151cd8d405e8', '8a15eb79-73a9-43eb-be4b-d80543be06e4', 1, 'F43.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3695e20b-1abb-4821-881f-6aaed838a56b', '8a15eb79-73a9-43eb-be4b-d80543be06e4', 2, 'Z91.49');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f40bdf09-0b72-4e8d-b852-9f7ae535d3bc', '8a15eb79-73a9-43eb-be4b-d80543be06e4', 3, 'F43.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8a15eb79-73a9-43eb-be4b-d80543be06e4', 'acccd11b-3521-4e4c-bc8d-2c3f14a98d0f', 'F43.10 (post-traumatic stress disorder, unspecified) remains coded as an ACTIVE, ongoing diagnosis — even though well-managed and without a current acute exacerbation, chronic PTSD requiring ongoing therapy/medication is not a resolved condition (mirroring the seizure disorder and Addison''s disease pattern established earlier in this exam series: a chronic condition well-controlled on ongoing treatment stays coded as active). Z91.49 (personal history of psychological trauma, NOT elsewhere classified) would incorrectly imply the PTSD itself has resolved into pure history, which isn''t supported by the stem''s description of ongoing active management. F43.9 (reaction to severe stress, unspecified) would under-code the documented specific PTSD diagnosis when the more specific F43.1- code is available and matches.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c617d765-307b-4569-9aa3-cb009b7d630a', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 28, 'A home health agency operates a branch office in a different county from its main/parent office, providing services to patients in that county. Per CoP requirements, does the branch office require separate Medicare certification distinct from the parent agency?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d395e098-36b8-4b6e-ad5d-ee350d2226cc', 'c617d765-307b-4569-9aa3-cb009b7d630a', 0, 'Yes, every branch office must obtain its own entirely separate Medicare provider number and undergo independent certification');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9c67ced7-dd82-455b-b801-4e8c4056ec7f', 'c617d765-307b-4569-9aa3-cb009b7d630a', 1, 'No — a properly organized branch office operates under the parent agency''s existing Medicare certification/provider number, subject to specific CoP requirements distinguishing a ''branch'' from a legally separate ''subunit'' (which WOULD require its own certification)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b1a58276-8475-4bf5-8091-345302736523', 'c617d765-307b-4569-9aa3-cb009b7d630a', 2, 'Branch offices are not recognized under Medicare home health regulations at all — an agency may only operate from a single location');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('facf7e2a-277d-451e-a3f2-11ba5d0406a0', 'c617d765-307b-4569-9aa3-cb009b7d630a', 3, 'Branch office status is determined solely by physical distance from the parent office, with no other criteria');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c617d765-307b-4569-9aa3-cb009b7d630a', '9c67ced7-dd82-455b-b801-4e8c4056ec7f', 'Medicare home health regulations distinguish between a ''branch office'' (which operates under the parent agency''s existing provider number/certification, subject to specific administrative/oversight criteria establishing it as a genuine extension of the parent rather than a functionally separate entity) and a ''subunit'' (a more functionally independent entity that DOES require its own separate certification) — a properly structured branch does not require independent certification, but this determination depends on more than physical distance alone (administrative structure, oversight, and functional independence all factor in), and agencies are not restricted to a single physical location under Medicare rules.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0158134f-a1e0-4656-a735-d3fcc6eb4541', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 29, 'A physician wants to certify a patient for home health services. Per CMS''s face-to-face encounter requirement, what must be true about the timing and content of the qualifying encounter?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('220b9e42-16e0-4ca2-b245-d930988d54a0', '0158134f-a1e0-4656-a735-d3fcc6eb4541', 0, 'The encounter must occur within 90 days before or 30 days after the start of home health care, and must be related to the primary reason the patient requires home health services');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7b2b7386-e093-4bb9-a5ab-c817d6b731fc', '0158134f-a1e0-4656-a735-d3fcc6eb4541', 1, 'The face-to-face encounter requirement was eliminated entirely and no longer applies under current rules');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6450f83e-2855-4077-b1f0-79f473478662', '0158134f-a1e0-4656-a735-d3fcc6eb4541', 2, 'Any physician encounter within the patient''s lifetime satisfies this requirement, regardless of timing or relevance');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2548439c-fbcc-41b0-98a6-66141c3dfaa2', '0158134f-a1e0-4656-a735-d3fcc6eb4541', 3, 'The face-to-face encounter must occur exclusively via telehealth, in-person visits no longer qualify');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0158134f-a1e0-4656-a735-d3fcc6eb4541', '220b9e42-16e0-4ca2-b245-d930988d54a0', 'The face-to-face encounter requirement mandates that a qualifying encounter with the certifying physician (or an allowed non-physician practitioner under current rules) occur within 90 days before or 30 days after the home health start of care date, and the encounter must be clinically related to the primary reason the patient requires home health services — this remains an active, required element of the certification process (not eliminated), and can be satisfied by either an in-person visit or, where permitted, a qualifying telehealth encounter — telehealth is an ALLOWED modality in appropriate circumstances, not the exclusively required one.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('318c1b55-ed2c-49ed-a5a2-c2ab31f38c2c', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 30, 'A home health patient requires a hospital bed and wheelchair (DME) as part of the plan of care. Per CoP care coordination requirements, what is the home health agency''s responsibility regarding DME coordination, given DME is typically billed and supplied by a separate DME supplier, not the home health agency itself?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('610f3022-9951-447f-bbc6-2c2928e225ee', '318c1b55-ed2c-49ed-a5a2-c2ab31f38c2c', 0, 'The home health agency has no responsibility for DME once it refers the patient to a DME supplier');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('20afd7fd-7f00-42a3-8158-3d1d805465a2', '318c1b55-ed2c-49ed-a5a2-c2ab31f38c2c', 1, 'The home health agency must coordinate with the DME supplier as part of the overall plan of care, ensuring the equipment ordered matches the patient''s assessed needs and that its use is integrated into care planning and patient/caregiver education, even though the DME itself is separately billed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('db11a38f-4825-43ce-b0f9-b5c45ad800cf', '318c1b55-ed2c-49ed-a5a2-c2ab31f38c2c', 2, 'DME needs are outside the scope of home health CoPs entirely and require no documentation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bdc17553-e0a8-4695-b5c5-6d4e14b37105', '318c1b55-ed2c-49ed-a5a2-c2ab31f38c2c', 3, 'The home health agency must directly employ DME technicians rather than coordinate with an outside supplier');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('318c1b55-ed2c-49ed-a5a2-c2ab31f38c2c', '20afd7fd-7f00-42a3-8158-3d1d805465a2', 'Even though DME is typically supplied and billed separately from the home health episode itself, CoP care coordination requirements still obligate the home health agency to coordinate DME needs as part of the overall plan of care — ensuring the equipment matches the patient''s actual assessed clinical needs, integrating its use into the care plan, and providing/coordinating relevant patient and caregiver education — this is a genuine care coordination responsibility, not something the agency can treat as entirely outside its scope simply because the billing mechanism is separate.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7352c41b-428a-4442-af3d-b0ea597b3bd2', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 31, 'A patient''s home health record shows an admission source classification of ''community'' for their first 30-day PDGM period, but the patient was actually discharged from a skilled nursing facility 10 days before the home health SOC date. Is ''community'' the correct admission source classification here?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e7292833-0996-4972-99b4-b9fc0aa66025', '7352c41b-428a-4442-af3d-b0ea597b3bd2', 0, 'Yes, since the patient is now living in the community (their own home), admission source is always ''community'' regardless of recent facility history');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('86383859-2c4d-413f-a345-7f4486bce2ba', '7352c41b-428a-4442-af3d-b0ea597b3bd2', 1, 'No — a qualifying post-acute facility stay (including a SNF stay) within the 14 days immediately preceding home health admission should classify this period as ''institutional'' admission source, not ''community,'' per the PDGM admission-source rule established earlier in this exam series');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5b30de7e-dd28-4708-b175-267e77cecdac', '7352c41b-428a-4442-af3d-b0ea597b3bd2', 2, 'Admission source classification is determined by the patient''s insurance type, not facility history');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1cbbb66d-fd8f-4c9d-9af4-03e587bf684d', '7352c41b-428a-4442-af3d-b0ea597b3bd2', 3, 'SNF stays specifically are excluded from the institutional-source lookback window, unlike hospital stays');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7352c41b-428a-4442-af3d-b0ea597b3bd2', '86383859-2c4d-413f-a345-7f4486bce2ba', 'This directly applies the PDGM admission-source rule established in Paper 8 (Q75) — a qualifying acute or POST-ACUTE facility stay (explicitly including SNF, not just acute hospital stays) within the 14 days immediately preceding home health admission should classify the period as ''institutional'' source, not ''community'' — a 10-day-prior SNF discharge falls squarely within that 14-day lookback window, meaning ''community'' is the WRONG classification here and should be corrected to ''institutional,'' testing whether a candidate incorrectly assumes ''community'' simply means ''currently living at home'' rather than correctly applying the specific facility-stay lookback rule.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5a0ae603-e89a-4ac5-8a16-ca097e3392aa', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 32, 'A patient with Cushing''s syndrome due to long-term prescribed corticosteroid therapy for severe asthma (correctly dosed, medically necessary, no alternative available) develops the classic features (central obesity, moon facies, skin thinning) confirmed by the physician as steroid-induced. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aa86adfa-88e3-4dc7-9f29-4773334dff19', '5a0ae603-e89a-4ac5-8a16-ca097e3392aa', 0, 'E24.2, T38.0X5A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('21357b8d-16b2-4c27-b2d5-11d5d3544bf1', '5a0ae603-e89a-4ac5-8a16-ca097e3392aa', 1, 'T38.0X5A, E24.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('377ad832-7f08-4d4b-a065-8f21bfbdb37c', '5a0ae603-e89a-4ac5-8a16-ca097e3392aa', 2, 'E24.9, T38.0X5A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('23aeeec3-92d5-4add-86de-d57a2c7c808c', '5a0ae603-e89a-4ac5-8a16-ca097e3392aa', 3, 'E24.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5a0ae603-e89a-4ac5-8a16-ca097e3392aa', '21357b8d-16b2-4c27-b2d5-11d5d3544bf1', 'T38.0X5A (adverse effect of glucocorticoids and synthetic analogues, initial encounter) is sequenced first per the adverse-effect sequencing convention used consistently throughout this exam series — even though the corticosteroid is medically necessary and correctly dosed for the asthma, the resulting Cushing''s syndrome is still an adverse (unintended) effect of an appropriately-used medication, matching the same ''correctly prescribed, still causes an adverse effect'' pattern tested repeatedly in this series. E24.2 (drug-induced Cushing''s syndrome — the etiology-specific combination code precisely matching the documented steroid-induced cause) follows as the resulting manifestation, more precise than E24.9 (Cushing''s syndrome, unspecified) which would under-code the clearly documented drug-induced etiology.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4acca525-ecdf-439b-b6c7-55fc32149a9a', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 33, 'A patient with longstanding untreated/undertreated hypothyroidism is found unresponsive with hypothermia, bradycardia, and altered mental status, diagnosed by the physician as myxedema coma, now stabilized after hospitalization and home for continued monitoring on adjusted levothyroxine dosing. Select the correct coding for this home health episode.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7803a444-84cc-4341-ba6d-08b34a199c36', '4acca525-ecdf-439b-b6c7-55fc32149a9a', 0, 'E03.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('27b1ef74-f0ee-4745-8774-238a8e46b33a', '4acca525-ecdf-439b-b6c7-55fc32149a9a', 1, 'E03.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cd33fe6e-37c8-4b0d-93a0-159938ec44fd', '4acca525-ecdf-439b-b6c7-55fc32149a9a', 2, 'E03.9, E03.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1bf57096-7d60-4b0a-b983-27311d981b25', '4acca525-ecdf-439b-b6c7-55fc32149a9a', 3, 'E89.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4acca525-ecdf-439b-b6c7-55fc32149a9a', '27b1ef74-f0ee-4745-8774-238a8e46b33a', 'E03.5 (myxedema coma) is the specific code for this severe hypothyroid crisis presentation — even though the acute coma episode has resolved and the patient is now stable, this remains the most clinically specific and relevant code reflecting the severity of the hypothyroid disease process that led to this admission and now requires careful ongoing dose titration monitoring, simileffectively to how other crisis-level diagnoses in this exam series remain coded when representing the clinically significant severity tier of an ongoing chronic disease requiring intensive monitoring, rather than defaulting to the generic E03.9 (hypothyroidism, unspecified), which would understate the documented severity history driving the current intensive monitoring need. E89.0 (postprocedural hypothyroidism) is wrong since this isn''t surgically induced.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('6d1ed46c-9e9d-441e-9732-6e4f5f48c6df', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 34, 'A patient with a prosthetic heart valve (bioprosthetic, aortic position) develops infective endocarditis, confirmed by blood cultures growing viridans group Streptococcus and echocardiographic vegetation, requiring 6 weeks of home IV antibiotics. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('38ef8de3-18ed-4c5b-bff2-7a94166c6fda', '6d1ed46c-9e9d-441e-9732-6e4f5f48c6df', 0, 'I33.0, T82.6XXA, B95.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6542a9db-4716-4616-9c27-7e924f0b546e', '6d1ed46c-9e9d-441e-9732-6e4f5f48c6df', 1, 'T82.6XXA, I33.0, B95.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b0b20e8e-71d7-4ab1-a591-2357f8cacf04', '6d1ed46c-9e9d-441e-9732-6e4f5f48c6df', 2, 'I33.0, B95.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('016080b8-01cd-407c-a8cd-b8ad9ea09b26', '6d1ed46c-9e9d-441e-9732-6e4f5f48c6df', 3, 'T82.6XXA, B95.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('6d1ed46c-9e9d-441e-9732-6e4f5f48c6df', '6542a9db-4716-4616-9c27-7e924f0b546e', 'T82.6XXA (infection and inflammatory reaction due to cardiac valve prosthesis, initial encounter) is sequenced first since the endocarditis is specifically documented as involving the prosthetic valve, matching the device-infection sequencing pattern established repeatedly in this series (AV fistula infection, pacemaker pocket infection, PD catheter peritonitis in Papers 7-8) — the device-complication code leads when the infection is specifically device-associated. I33.0 (acute and subacute infective endocarditis) follows as the specific clinical diagnosis. B95.4 (other Streptococcus as the cause of disease classified elsewhere — covering viridans group strep) is added to identify the confirmed organism.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7b41f55d-7fb1-410f-b6d9-555474afe884', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 35, 'A patient with cellulitis of the right lower leg has the home health nurse identify red streaking extending proximally from the cellulitis site up the leg, consistent with lymphangitis, confirmed by the physician as a spreading complication of the same infection. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e3d87a2a-3ef2-4a7e-b2ca-de57a6bb7df1', '7b41f55d-7fb1-410f-b6d9-555474afe884', 0, 'L03.116');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('efa018cb-1496-4912-aebf-69bf4dac9f4d', '7b41f55d-7fb1-410f-b6d9-555474afe884', 1, 'L03.116, L03.115');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('af3d6173-ba1e-469a-8f4d-86038821a392', '7b41f55d-7fb1-410f-b6d9-555474afe884', 2, 'I89.1, L03.116');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3b8b78d1-1641-4d28-bd0f-78d3d3f10555', '7b41f55d-7fb1-410f-b6d9-555474afe884', 3, 'L03.116 alone is insufficient; use L03.115 instead');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7b41f55d-7fb1-410f-b6d9-555474afe884', 'efa018cb-1496-4912-aebf-69bf4dac9f4d', 'Both L03.116 (cellulitis of right lower limb) and L03.115 (lymphangitis, acute, of right lower limb) are coded together since the lymphangitis represents a distinct, specifically documented additional finding (the streaking) beyond the cellulitis itself — L03 has separate subcategories for cellulitis versus acute lymphangitis by site, and when both are specifically documented as present (not simply one being a redundant description of the other), both codes apply. I89.1 (chronic lymphangitis, not elsewhere classified) is the wrong code entirely — this is an ACUTE, infection-associated lymphangitis directly tied to the cellulitis, which the L03.115 acute-lymphangitis-by-site code captures more precisely than the general chronic I89.1 code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c498a1f4-5372-4b64-9fea-0b5be65f4b7f', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 36, 'A patient''s OASIS at SOC scores M1400 (Dyspnea) as ''3 - patient is short of breath with agitation or restlessness, when talking, or eating, or performing bathing/dressing activities.'' At a subsequent visit (non-OASIS timepoint), the patient reports increased shortness of breath now occurring even at rest, unwitnessed by the clinician directly but clearly and consistently described by the patient. What is the correct documentation approach?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('581227de-e88a-4b12-9ad8-509753af4c39', 'c498a1f4-5372-4b64-9fea-0b5be65f4b7f', 0, 'The clinician should immediately amend the SOC OASIS M1400 response to ''4'' since the patient''s report is credible');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('823451a4-1b39-45a5-a920-defa934796c7', 'c498a1f4-5372-4b64-9fea-0b5be65f4b7f', 1, 'The clinician should document this reported symptom change in the visit note narrative and contact the physician per the worsening-symptom protocol; the formal OASIS M1400 item will be reassessed and scored at the next required OASIS collection timepoint, consistent with the OASIS-timepoint-vs-routine-visit-documentation principle established throughout this exam series');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('452ab7b0-3fc6-483b-b086-206a73e46bd1', 'c498a1f4-5372-4b64-9fea-0b5be65f4b7f', 2, 'Patient-reported symptoms that aren''t directly observed by the clinician cannot be documented at all');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2498e9f8-a219-4f80-9a23-704efb2099e3', 'c498a1f4-5372-4b64-9fea-0b5be65f4b7f', 3, 'A new SOC assessment must be triggered immediately by any dyspnea worsening');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c498a1f4-5372-4b64-9fea-0b5be65f4b7f', '823451a4-1b39-45a5-a920-defa934796c7', 'This applies the same OASIS-timepoint-vs-routine-visit-documentation principle tested repeatedly across this exam series (Paper 7''s grooming discrepancy, Paper 8''s NPWT discontinuation, this paper''s phantom-limb-pain-resolution question) — a symptom change identified at a non-OASIS visit is documented in that visit''s narrative and acted on clinically (physician contact per protocol for worsening respiratory symptoms), with the formal OASIS M1400 item itself reassessed and re-scored at the next actual OASIS collection timepoint, not retroactively amended on the already-submitted SOC assessment. Patient-reported symptoms ARE valid clinical documentation (clinicians routinely document reported, not just directly observed, symptoms) — dismissing them as undocumentable would be clinically inappropriate.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('28047c8f-debe-456c-888a-c4f5237a151c', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 37, 'A home health patient''s medication administration includes insulin injections. The patient''s home health aide (not a licensed nurse) is asked by the family to administer the insulin on a day the nurse is not scheduled to visit. Per CoP scope-of-practice requirements, is this permissible?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('19628aa9-35c5-426c-b1ef-7e2a301d2848', '28047c8f-debe-456c-888a-c4f5237a151c', 0, 'Yes, as long as the family provides verbal permission');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('129ba7cd-a0a3-4f03-aa99-4949ea889bfa', '28047c8f-debe-456c-888a-c4f5237a151c', 1, 'No — insulin administration (a skilled nursing task involving medication administration via injection) is outside a home health aide''s scope of practice and CoP-defined role; aide duties are limited to personal care and basic supportive tasks, not skilled medication administration');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('649a4a17-c85d-4caa-9f4f-a2e7eea87fee', '28047c8f-debe-456c-888a-c4f5237a151c', 2, 'Yes, if the aide has previously watched a nurse perform the task');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5567c3d4-bf6a-4469-b613-290b6ba10d88', '28047c8f-debe-456c-888a-c4f5237a151c', 3, 'Aide scope of practice is determined entirely by individual state nurse practice acts with no CoP-level floor at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('28047c8f-debe-456c-888a-c4f5237a151c', '129ba7cd-a0a3-4f03-aa99-4949ea889bfa', 'Home health aide duties under the CoPs are limited to personal care and basic supportive/hands-on assistance tasks (bathing, grooming, light housekeeping related to patient care, etc.) — skilled tasks like injectable medication administration fall outside the aide scope of practice and CoP-defined role, regardless of family permission or the aide having previously observed the task performed by a nurse; while state nurse practice acts do add their own layer of specific scope regulation, the CoPs themselves establish a baseline distinguishing aide-level tasks from skilled nursing tasks that family consent alone cannot expand.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('df061754-e98c-4e6c-a77a-5b447cdfc8fd', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 38, 'A patient with type 2 diabetes and a diabetic foot ulcer is found to have the ulcer improving in depth but developing new surrounding cellulitis, confirmed by the physician as a new, distinct complication layered on the healing ulcer. Select the correct, complete coding reflecting both the improving ulcer and the new cellulitis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cac63267-9aa6-460d-bc2b-d5034416cb79', 'df061754-e98c-4e6c-a77a-5b447cdfc8fd', 0, 'E11.621, L97.412 (or whatever the current, improved depth is), L03.116');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d961b228-498a-433e-80bd-59c329fecf49', 'df061754-e98c-4e6c-a77a-5b447cdfc8fd', 1, 'E11.621, L03.116');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('96910a1b-e1fd-4e2c-8efd-3b67d3a43c68', 'df061754-e98c-4e6c-a77a-5b447cdfc8fd', 2, 'L03.116, E11.621, L97.412');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8648680c-8e35-492e-b0fb-3c585474eb87', 'df061754-e98c-4e6c-a77a-5b447cdfc8fd', 3, 'E11.621, L97.412');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('df061754-e98c-4e6c-a77a-5b447cdfc8fd', 'cac63267-9aa6-460d-bc2b-d5034416cb79', 'This combines two principles already independently established in this exam series: the current-status wound-staging/depth-coding principle (Paper 8''s pressure injury improving/worsening question — the ulcer depth code should reflect its CURRENT depth, updated as it improves) and the diabetic-ulcer sequencing pattern (E11.621 leading, ulcer depth code following, established in Paper 7). The new cellulitis (L03.116) is added as a genuinely distinct, newly-documented complication, not redundant with the ulcer codes — all three pieces of information (diabetes-ulcer combination, current ulcer depth, new cellulitis) are independently clinically meaningful and should each be reflected, rather than dropping any one of them.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fc534139-1bf4-4102-922e-575699a6f392', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 39, 'A patient with generalized anxiety disorder is noted by home health nursing to have new-onset auditory hallucinations, a symptom NOT typical of GAD and not previously documented, prompting physician evaluation. The physician determines this represents a new, separate diagnosis of brief psychotic disorder, unrelated to a medical cause or substance. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb26afba-c75c-4838-9a03-bcade5bf9363', 'fc534139-1bf4-4102-922e-575699a6f392', 0, 'F41.1, F23');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7bc0d112-5869-4a41-899e-72092df36b8a', 'fc534139-1bf4-4102-922e-575699a6f392', 1, 'F23, F41.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('77c89d05-98f6-4b99-8031-9c88f330d1f0', 'fc534139-1bf4-4102-922e-575699a6f392', 2, 'F41.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('876c0265-7b5d-4847-bcaf-2b0ea9224081', 'fc534139-1bf4-4102-922e-575699a6f392', 3, 'F09');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fc534139-1bf4-4102-922e-575699a6f392', '7bc0d112-5869-4a41-899e-72092df36b8a', 'F23 (brief psychotic disorder) is sequenced first as the new, acute, currently most clinically significant diagnosis prompting physician evaluation and likely urgent psychiatric follow-up. F41.1 (generalized anxiety disorder) remains coded as the separate, pre-existing chronic condition. F09 (unspecified mental disorder due to a known physiological condition) is wrong since the physician specifically determines this is NOT due to a medical cause — F23 is the correct primary-psychiatric-diagnosis code, not a secondary-to-medical-condition code, given that etiology has been specifically ruled out.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('aaf4033d-54db-44b1-997e-00870456f5f0', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 40, 'A patient with a recent hospitalization for a hypertensive emergency (severely elevated BP with acute end-organ damage — acute kidney injury) is now home, hypertension controlled on adjusted medications, AKI resolved with kidney function returned to prior baseline. Select the correct coding for the hypertension at this home health episode.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('819a9a18-aef4-4805-9c42-1d4e64e92ca8', 'aaf4033d-54db-44b1-997e-00870456f5f0', 0, 'I16.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('df6a0de7-a6e5-4b3b-8a12-493cc7bc9750', 'aaf4033d-54db-44b1-997e-00870456f5f0', 1, 'I10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ad6b99b9-ebd6-4455-a607-f61cf81a80e4', 'aaf4033d-54db-44b1-997e-00870456f5f0', 2, 'I12.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('eb5ff81d-d25a-4ef0-817e-c63d804d3623', 'aaf4033d-54db-44b1-997e-00870456f5f0', 3, 'I16.1, N17.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('aaf4033d-54db-44b1-997e-00870456f5f0', 'df6a0de7-a6e5-4b3b-8a12-493cc7bc9750', 'I10 (essential hypertension) is the correct code now that the hypertensive EMERGENCY itself (I16.1, hypertensive urgency/emergency with a specific acute crisis designation) has resolved and kidney function has returned to baseline — I16.1 would only apply while the acute hypertensive emergency/crisis is the current, active condition, not after it has resolved and the patient has returned to a baseline, chronic-hypertension-management state, mirroring the resolved-acute-crisis-reverts-to-baseline-chronic-code principle established multiple times in this series (resolved cardiogenic shock, resolved DKA, resolved thyroid storm). I12.0 (hypertensive CKD with stage 5 CKD or ESRD) is wrong since the AKI has fully resolved with return to baseline kidney function, not progressed to a chronic staged CKD/ESRD condition.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ef1f9750-8393-49ce-ac80-b1f9874514d2', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 41, 'A patient with a skin graft for a prior burn injury develops graft failure with partial necrosis, confirmed by the physician 3 weeks after the grafting procedure, now requiring wound care and evaluation for repeat grafting. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fe03a7e9-9676-435d-a2d7-5b9ac648fde8', 'ef1f9750-8393-49ce-ac80-b1f9874514d2', 0, 'T86.821');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1b8f6cb9-3bed-4cd6-85ed-6830c453bdb3', 'ef1f9750-8393-49ce-ac80-b1f9874514d2', 1, 'T79.5XXA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('28ef56ac-4b9d-4230-8a42-fadce1fe2408', 'ef1f9750-8393-49ce-ac80-b1f9874514d2', 2, 'L98.8');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f18d486e-91a8-49e7-a932-913f26e4789d', 'ef1f9750-8393-49ce-ac80-b1f9874514d2', 3, 'T86.829');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ef1f9750-8393-49ce-ac80-b1f9874514d2', 'fe03a7e9-9676-435d-a2d7-5b9ac648fde8', 'T86.821 (skin graft (allograft) (autograft) failure) is the specific device/graft-complication code for documented graft failure — T86.829 (skin graft rejection, a distinct mechanism specifically involving immunologic rejection rather than the general ''failure'' category, which better fits when a specific immune rejection process isn''t specifically documented, as here where ''graft failure with partial necrosis'' is described rather than a documented rejection reaction) is a less precise match. T79.5XXA (traumatic ischemia of muscle, an unrelated trauma code) doesn''t apply. L98.8 (other specified skin disorders) would under-code the documented specific graft-complication relationship.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c349aad1-0e31-4c95-b21c-6eece3a67365', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 42, 'A patient with obsessive-compulsive disorder, characterized by contamination fears and compulsive handwashing severe enough to cause skin breakdown on the hands, is admitted to home health for both psychiatric nursing and wound care for the resulting hand dermatitis. Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ddac3196-5f24-4705-a4f2-7aab9969759b', 'c349aad1-0e31-4c95-b21c-6eece3a67365', 0, 'F42.2, L30.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ce8abd62-7e94-4deb-9738-09b97b2a9463', 'c349aad1-0e31-4c95-b21c-6eece3a67365', 1, 'F42.8, L30.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8c371cbd-2649-4dfc-aaf8-c5c49584c4ac', 'c349aad1-0e31-4c95-b21c-6eece3a67365', 2, 'F42.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('560d3227-5054-4a17-8dbe-87c746e5bb97', 'c349aad1-0e31-4c95-b21c-6eece3a67365', 3, 'L30.9, F42.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c349aad1-0e31-4c95-b21c-6eece3a67365', 'ddac3196-5f24-4705-a4f2-7aab9969759b', 'F42.2 (obsessive-compulsive disorder with both obsessive thoughts and compulsive acts — matching the documented combination of contamination fears (obsessions) and compulsive handwashing (compulsions)) is sequenced first as the underlying psychiatric condition driving the physical complication. L30.9 (dermatitis, unspecified) is added as the resulting skin complication requiring separate wound care — there is no ICD-10-CM combination code linking OCD directly to a resulting skin condition, so these are coded as two separately sequenced, causally-related but individually-coded conditions, similar to the malnutrition/pressure-injury pattern established in Paper 8 (no combination code exists, but a real, documented causal relationship still gets captured via separate codes plus narrative documentation).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('87d6010e-58e4-4666-9d18-3b79c743233a', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 43, 'A patient with a longstanding restrictive eating disorder (anorexia nervosa, restricting type, physician-documented as severe based on current BMI) has severe malnutrition requiring intensive home health nutritional monitoring and cardiac monitoring for refeeding syndrome risk. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7aedd29e-83a1-46b9-9b4f-520a6e7ff9f1', '87d6010e-58e4-4666-9d18-3b79c743233a', 0, 'F50.012, E43');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('db33015b-291a-4b26-a08b-36d1bf1ce999', '87d6010e-58e4-4666-9d18-3b79c743233a', 1, 'F50.022, E43');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('db6aff53-371a-430e-83f7-096ded921b52', '87d6010e-58e4-4666-9d18-3b79c743233a', 2, 'F50.9, E43');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('39f3a195-f2de-4ce6-8013-b2a4cd2a47a2', '87d6010e-58e4-4666-9d18-3b79c743233a', 3, 'F50.012');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('87d6010e-58e4-4666-9d18-3b79c743233a', '7aedd29e-83a1-46b9-9b4f-520a6e7ff9f1', 'F50.012 (anorexia nervosa, restricting type, severe) precisely matches both the documented specific subtype and the documented severity — F50.01 alone is a non-billable parent requiring this severity specification (mild/moderate/severe/extreme/in remission/unspecified, per DSM-5-aligned BMI criteria). F50.022 (binge-eating/purging type, severe) would be the wrong subtype, contradicted by the stem''s explicit ''restricting type'' documentation. E43 (severe protein-calorie malnutrition) is added as the documented, currently clinically significant nutritional complication, coded separately since there''s no ICD-10-CM combination code merging the eating disorder and its nutritional complication into one code — the same non-existent-combination-code pattern tested with the malnutrition/pressure-injury question in Paper 8.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4a2b63cc-5d8c-42c7-afa7-f7cb62237eb5', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 44, 'A patient with acute diverticulitis of the sigmoid colon develops a peridiverticular abscess, confirmed by CT, being managed at home with IV antibiotics via PICC line following percutaneous drainage (no surgery performed). Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('966004a0-4dae-43e7-8c15-96dff4823239', '4a2b63cc-5d8c-42c7-afa7-f7cb62237eb5', 0, 'K57.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('05089f3f-da3c-42a6-9e66-e5d8f109c1f8', '4a2b63cc-5d8c-42c7-afa7-f7cb62237eb5', 1, 'K57.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('29c5df54-4ba7-43b9-b1a0-04bf98a83a7c', '4a2b63cc-5d8c-42c7-afa7-f7cb62237eb5', 2, 'K57.92');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0bcd907f-b7c0-4d8c-813d-8950c605cd5f', '4a2b63cc-5d8c-42c7-afa7-f7cb62237eb5', 3, 'K57.93');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4a2b63cc-5d8c-42c7-afa7-f7cb62237eb5', '966004a0-4dae-43e7-8c15-96dff4823239', 'K57.20 (diverticulitis of large intestine with perforation and abscess, without bleeding) is the correct code — the stem documents an abscess with no mention of GI bleeding, and the presence/absence of bleeding must be explicitly documented to select between K57.20 and K57.21 (with bleeding); absent any documented hemorrhage, the ''without bleeding'' code applies. K57.92/K57.93 (diverticulitis of unspecified intestine, without/with perforation-abscess-bleeding specificity) would under-code the documented sigmoid colon (large intestine) location and the confirmed perforation/abscess finding.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2754d2d7-7afc-46dd-aac5-4204b1828ef7', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 45, 'A patient with acute cholecystitis is managed non-surgically at home with IV antibiotics due to being a poor surgical candidate, confirmed by the physician as calculous cholecystitis (gallstones present) without evidence of gangrene or perforation. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('983f8ccd-e6fc-4350-9631-ccc673c4c881', '2754d2d7-7afc-46dd-aac5-4204b1828ef7', 0, 'K80.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('be72618a-dbb4-43b9-9a0c-d0a9bf83699f', '2754d2d7-7afc-46dd-aac5-4204b1828ef7', 1, 'K81.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('97b028ea-da6c-44c0-947a-20eb4d7530d0', '2754d2d7-7afc-46dd-aac5-4204b1828ef7', 2, 'K80.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('880b767e-7af1-4dd2-90ac-6e18ace74729', '2754d2d7-7afc-46dd-aac5-4204b1828ef7', 3, 'K80.66');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2754d2d7-7afc-46dd-aac5-4204b1828ef7', '983f8ccd-e6fc-4350-9631-ccc673c4c881', 'K80.00 (calculus of gallbladder with acute cholecystitis, without obstruction) is the specific combination code matching the documented gallstone-caused (calculous) acute cholecystitis without a documented obstruction, gangrene, or perforation — K81.9 (cholecystitis, unspecified, without the calculus/gallstone specificity) would under-code the documented gallstone etiology, since a more specific combination code (K80.0-) is available and matches. K80.10 (calculus of gallbladder with CHRONIC cholecystitis) is the wrong acuity — this is documented as acute. K80.66 is a distractor from a different, unrelated K80 subcategory.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('78c81008-d81a-4dc7-9b5f-e02c3680d2fb', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 46, 'A patient with nephrotic syndrome, confirmed by significant proteinuria, hypoalbuminemia, and edema, with the physician documenting the underlying cause as focal segmental glomerulosclerosis (FSGS) confirmed by renal biopsy. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fa9b1bc6-a2a7-4f94-9481-9cf670c53229', '78c81008-d81a-4dc7-9b5f-e02c3680d2fb', 0, 'N04.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b48b13fd-0ff6-41de-9f33-b9019d1bf926', '78c81008-d81a-4dc7-9b5f-e02c3680d2fb', 1, 'N04.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8fa0de75-c724-457b-982e-3977931d7072', '78c81008-d81a-4dc7-9b5f-e02c3680d2fb', 2, 'N18.9, N04.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('43a587e5-e51b-4547-ba59-43d88c2de790', '78c81008-d81a-4dc7-9b5f-e02c3680d2fb', 3, 'N05.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('78c81008-d81a-4dc7-9b5f-e02c3680d2fb', 'fa9b1bc6-a2a7-4f94-9481-9cf670c53229', 'N04.1 (nephrotic syndrome with focal and segmental glomerular lesions) is the specific combination code capturing both the nephrotic syndrome clinical picture AND the biopsy-confirmed FSGS etiology together — more precise than N04.9 (nephrotic syndrome with unspecified morphologic changes), which would under-code the documented specific biopsy finding. N05.1 is the wrong syndrome category (unspecified nephritic, not nephrotic, syndrome — nephritic and nephrotic are distinct clinical syndromes, a commonly confused pair this question specifically tests). N18.9 (CKD, unspecified stage) is not supported here since no CKD staging is documented in this stem — only the nephrotic syndrome and its specific glomerular lesion type.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3401246b-f148-45c4-8bb3-14d4bdb6bc9c', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 47, 'A patient with recurrent nephrolithiasis has a new, confirmed obstructing right ureteral stone causing hydronephrosis, being managed conservatively at home with pain control and increased fluids pending urology follow-up (no current infection). Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1994b6fe-f50a-4544-874b-fe84f6677eb4', '3401246b-f148-45c4-8bb3-14d4bdb6bc9c', 0, 'N20.1, N13.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('39ba38cb-b990-4295-9e87-27d5e400aabb', '3401246b-f148-45c4-8bb3-14d4bdb6bc9c', 1, 'N20.0, N13.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('70e509a5-785a-4a24-bc3f-5d1b08bedba6', '3401246b-f148-45c4-8bb3-14d4bdb6bc9c', 2, 'N20.1, N13.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4ec71540-930e-4dbd-8173-d518673e3ae3', '3401246b-f148-45c4-8bb3-14d4bdb6bc9c', 3, 'N13.2, N20.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3401246b-f148-45c4-8bb3-14d4bdb6bc9c', '1994b6fe-f50a-4544-874b-fe84f6677eb4', 'N20.1 (calculus of ureter) is sequenced first as the primary, currently active urologic diagnosis. N13.2 (hydronephrosis with renal and ureteral calculous obstruction) is added as the specific combination code for hydronephrosis WITH a documented obstructing stone as the cause — this is more precise than N13.30 (hydronephrosis, unspecified, without the stone-obstruction etiology specified), since the causal stone relationship is explicitly documented here. N20.0 (calculus of kidney, the wrong location — this is a ureteral stone, not a kidney/renal stone) would misidentify the stone''s anatomic location.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('59196f02-ff16-4170-87e9-b14d4a4d7a88', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 48, 'A patient with tricuspid valve regurgitation, confirmed moderate-severe by echocardiogram, physician-documented as secondary to right ventricular dilation from longstanding pulmonary hypertension (itself due to COPD), is on home health for combined cardiopulmonary management. Select the correct, complete coding reflecting the full causal chain.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('efbdb61a-b642-402a-a624-0374d2d57ac5', '59196f02-ff16-4170-87e9-b14d4a4d7a88', 0, 'I36.1, I27.21, J44.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c116b81a-6eb0-4af7-90ad-4e043e956c34', '59196f02-ff16-4170-87e9-b14d4a4d7a88', 1, 'J44.9, I27.21, I36.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5c63dc58-833a-4077-8dfc-8b0550c0ffe8', '59196f02-ff16-4170-87e9-b14d4a4d7a88', 2, 'I36.1, J44.9, I27.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('20a73af8-78f7-493c-b670-d2dcdf60491e', '59196f02-ff16-4170-87e9-b14d4a4d7a88', 3, 'I27.21, I36.1, J44.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('59196f02-ff16-4170-87e9-b14d4a4d7a88', 'efbdb61a-b642-402a-a624-0374d2d57ac5', 'I36.1 (nonrheumatic tricuspid valve insufficiency) is sequenced first as the newest, most acute clinical finding — echocardiogram-confirmed moderate-severe regurgitation — representing the current focus of cardiac evaluation. I27.21 (pulmonary hypertension due to lung disease) follows as the immediate physiologic cause of the tricuspid regurgitation (right heart strain from pulmonary hypertension causing valve dilation/regurgitation). J44.9 (COPD) is added last as the root underlying disease from which the pulmonary hypertension itself originated — this three-step causal chain (COPD → pulmonary hypertension → tricuspid regurgitation) mirrors the identical three-condition sequencing pattern already established in Paper 8''s cor pulmonale/new-AFib question, applied here to a different specific cardiac manifestation of the same underlying COPD-driven pulmonary hypertension pathway.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cb3907e6-4c7e-4248-b433-d6acaef16bff', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 49, 'A patient with a recent traumatic vertebral compression fracture (L1, osteoporotic patient, fragility fracture per physician documentation) is admitted to home health for pain management and bracing, 2 weeks post-injury, still in the active treatment phase. Select the correct coding, including the correct 7th character, contrasting with the earlier fragility-fracture question in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('312855ac-a93f-4528-a3f2-6dcb867cffc6', 'cb3907e6-4c7e-4248-b433-d6acaef16bff', 0, 'M80.08XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7a6be6c8-3806-4120-9ac4-ee7dc583bbc4', 'cb3907e6-4c7e-4248-b433-d6acaef16bff', 1, 'S32.010A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a3c02bcd-616d-4cb8-a03a-d9f449207052', 'cb3907e6-4c7e-4248-b433-d6acaef16bff', 2, 'M80.08XD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('06b40493-d733-4463-9611-cac04856034f', 'cb3907e6-4c7e-4248-b433-d6acaef16bff', 3, 'S22.089A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cb3907e6-4c7e-4248-b433-d6acaef16bff', '312855ac-a93f-4528-a3f2-6dcb867cffc6', 'M80.08XA (age-related osteoporosis with current pathological fracture, vertebra(e), initial encounter for fracture) is the correct code — this mirrors the fragility-fracture principle established in Paper 7 (Q10): a fracture the physician documents as fragility-related (osteoporotic, low-energy) is coded as pathologic (M80.0-), not traumatic (S32.0-), even when described using the word ''traumatic'' loosely in casual conversation, since the physician''s specific ''fragility fracture'' documentation is what governs the code family choice. The 7th character is A (initial encounter) since the patient is still within the active treatment phase (2 weeks post-injury, ongoing pain management and bracing) — not yet in the routine healing/follow-up phase that would warrant a D.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a897b167-f204-4802-8ed2-9c8e1530c888', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 50, 'A patient with the same osteoporotic vertebral fracture from the prior question is now seen 10 weeks later for a routine follow-up visit, with the fracture healing normally per physician documentation. Select the correct 7th character for this later encounter.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3e9ef3cc-4a6a-4874-ac79-8c89d6fc405c', 'a897b167-f204-4802-8ed2-9c8e1530c888', 0, 'A - initial encounter');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9dfef1e6-3c5a-4b2b-9926-fe0d3a9cb41a', 'a897b167-f204-4802-8ed2-9c8e1530c888', 1, 'D - subsequent encounter for fracture with routine healing');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d880d725-b74c-4b21-8734-c080e5f3ca8d', 'a897b167-f204-4802-8ed2-9c8e1530c888', 2, 'G - subsequent encounter for fracture with delayed healing');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ee86bc89-db8a-460a-ae82-5e8dadbbbf0c', 'a897b167-f204-4802-8ed2-9c8e1530c888', 3, 'S - sequela');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a897b167-f204-4802-8ed2-9c8e1530c888', '9dfef1e6-3c5a-4b2b-9926-fe0d3a9cb41a', '7th character D (subsequent encounter for fracture with routine healing) is correct now that the patient is in the follow-up phase with the physician specifically documenting normal, routine healing progress — mirroring the exact A-to-D transition logic already established for the fragility fracture pattern in Paper 7 (Q10), applied here to confirm the same principle at a vertebral fracture site. This is a deliberately repeated pattern in this exam series to reinforce the initial-vs-subsequent 7th character transition as the encounter phase changes, not the underlying pathology.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f9f50353-90d1-4109-b7da-8cd173131e49', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 51, 'A home health patient with heart failure is being remotely monitored via a connected scale and blood pressure cuff, with data reviewed by a nurse who identifies a concerning trend and escalates to the physician per protocol, resulting in a medication change without an in-person visit. Per current Medicare guidance (building on the telehealth/RPM question earlier in this paper), can this remote monitoring-triggered nurse review and escalation itself be counted as a home health ''visit'' for OASIS or billing purposes?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2b06b553-1971-44c3-8dbf-6802eda7a1b1', 'f9f50353-90d1-4109-b7da-8cd173131e49', 0, 'Yes, any nurse review of remote data counts as a full home health visit');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7dd324c3-5a4d-496d-9fbf-3303638fea73', 'f9f50353-90d1-4109-b7da-8cd173131e49', 1, 'No — consistent with the earlier-established principle that RPM/telehealth doesn''t generate a billable visit, this remote review and escalation, while clinically valuable and appropriately documented, does not itself constitute an in-person home health visit for OASIS timepoint or visit-count purposes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dd0de729-50f0-4ee0-b420-a54c997a7d83', 'f9f50353-90d1-4109-b7da-8cd173131e49', 2, 'It counts as a visit only if the escalation results in a medication change');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ab6dce13-5295-47af-b46b-5d0b9ab51248', 'f9f50353-90d1-4109-b7da-8cd173131e49', 3, 'It counts as half a visit under current Medicare rules');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f9f50353-90d1-4109-b7da-8cd173131e49', '7dd324c3-5a4d-496d-9fbf-3303638fea73', 'This directly extends the RPM/telehealth billing principle established earlier in this paper — even a clinically significant, well-documented remote-monitoring-triggered nurse review and physician escalation does not itself generate a billable in-person ''visit'' or count toward OASIS assessment timepoints, regardless of whether it results in a clinically meaningful outcome like a medication change; the clinical value of the intervention doesn''t change its administrative/billing classification as a non-visit activity under current Medicare home health rules.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ee27eb6a-8677-428b-9d1f-8cc30ea269b4', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 52, 'A patient with atrial fibrillation, hypertension, and diabetes has all three documented as separate, well-controlled chronic conditions with no specific combination-code relationship stated between any of them. A physician later specifically documents ''hypertensive heart disease with heart failure'' as a NEW finding, now linking the hypertension and a new heart failure diagnosis together, with the diabetes and AFib remaining separately unrelated. Select the correct, complete updated coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2bf4ad78-de9f-4a06-9cdc-e543c3e1f60e', 'ee27eb6a-8677-428b-9d1f-8cc30ea269b4', 0, 'I11.0, I48.91, E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('28b5c459-1564-463a-938c-3b08f5576ead', 'ee27eb6a-8677-428b-9d1f-8cc30ea269b4', 1, 'I10, I50.9, I48.91, E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('716bdf15-3c24-4844-9679-8f2b53054974', 'ee27eb6a-8677-428b-9d1f-8cc30ea269b4', 2, 'I13.0, I48.91, E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('99bd8bbc-fcdc-40ff-91c7-e032341e5ace', 'ee27eb6a-8677-428b-9d1f-8cc30ea269b4', 3, 'I11.0, I50.9, I48.91, E11.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ee27eb6a-8677-428b-9d1f-8cc30ea269b4', '2bf4ad78-de9f-4a06-9cdc-e543c3e1f60e', 'I11.0 (hypertensive heart disease with heart failure) is the correct combination code once the physician specifically links hypertension AND heart failure together (but NOT CKD, which isn''t mentioned in this scenario) — this is the two-condition combination code (hypertension + heart failure), distinct from I13.0 (which requires all THREE: hypertension + heart failure + CKD, not applicable here since no CKD relationship is documented). I48.91 (atrial fibrillation) and E11.9 (type 2 diabetes) remain separately coded as the two genuinely unrelated conditions, per the physician''s own documentation. This tests whether a candidate correctly selects between the I11 (two-condition) and I13 (three-condition) combination-code families based on exactly which conditions are documented as linked.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('174bb34e-af65-4505-8877-2e9251ac48ca', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 53, 'A patient with schizophrenia is noted by home health nursing to have significant weight gain (18% body weight over 6 months) since starting olanzapine, confirmed by the physician as a known metabolic adverse effect of the antipsychotic, correctly dosed, with the physician now also diagnosing new-onset type 2 diabetes attributable to the medication''s metabolic effects. Select the correct, complete coding addressing the full causal chain.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a3f068da-338e-40e1-80cd-4cf82d7c7e38', '174bb34e-af65-4505-8877-2e9251ac48ca', 0, 'F20.9, T43.595A, E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bf1e27ed-65ea-4aa3-b1a1-f61a5858b898', '174bb34e-af65-4505-8877-2e9251ac48ca', 1, 'T43.595A, E11.9, F20.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('38044ff6-7aa4-4388-b94e-d215ea8b779c', '174bb34e-af65-4505-8877-2e9251ac48ca', 2, 'F20.9, E11.9, T43.595A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1120c8d7-4318-48eb-acf5-bf175b6d2692', '174bb34e-af65-4505-8877-2e9251ac48ca', 3, 'E11.9, T43.595A, F20.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('174bb34e-af65-4505-8877-2e9251ac48ca', 'a3f068da-338e-40e1-80cd-4cf82d7c7e38', 'F20.9 (schizophrenia) is sequenced first as the underlying condition requiring the antipsychotic, per the chronic-disease-first sequencing pattern established repeatedly in this exam series (methotrexate/pancytopenia, clozapine/agranulocytosis in Paper 8). T43.595A (adverse effect of other antipsychotics) follows. E11.9 (type 2 diabetes) is added last as the resulting manifestation — this is a genuinely real, well-recognized clinical phenomenon (atypical antipsychotic-induced metabolic syndrome/diabetes), and the same three-part sequencing (disease → drug effect → manifestation) applies even though the manifestation here is itself a full new diagnosis (diabetes) rather than a transient lab abnormality, since the underlying adverse-effect coding logic doesn''t change based on how clinically major the resulting manifestation is.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4620a7df-2a3c-4f83-8ae0-342f1067e5f9', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 54, 'A patient''s home health agency wants to bill for a skilled nursing visit where the ONLY service provided was drawing blood for a routine lab test ordered by the physician, with no other skilled assessment, teaching, or intervention performed. Does this visit meet Medicare''s skilled nursing visit criteria?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a0c86648-2f83-4da7-a5c0-ee73642fad86', '4620a7df-2a3c-4f83-8ae0-342f1067e5f9', 0, 'Yes, any physician-ordered lab draw automatically qualifies as a skilled nursing visit regardless of what else occurs');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('764c5ee7-e3cc-4be1-8b7c-b608ac15cd61', '4620a7df-2a3c-4f83-8ae0-342f1067e5f9', 1, 'Generally no — a visit consisting SOLELY of a routine blood draw, without additional skilled nursing assessment, observation, teaching, or intervention, typically does not by itself meet the skilled-care threshold for a separately billable skilled nursing visit under Medicare home health coverage criteria');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('040de715-be9c-49fe-8e78-4ac9ac9e8360', '4620a7df-2a3c-4f83-8ae0-342f1067e5f9', 2, 'Yes, but only if the lab result comes back abnormal');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('88321fb2-0576-4d52-a105-049ece31c37d', '4620a7df-2a3c-4f83-8ae0-342f1067e5f9', 3, 'Lab draws can never be performed by home health nursing under any circumstance');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4620a7df-2a3c-4f83-8ae0-342f1067e5f9', '764c5ee7-e3cc-4be1-8b7c-b608ac15cd61', 'A visit limited solely to a routine blood draw, without additional skilled nursing assessment, observation, teaching, or intervention actually performed and documented, generally does NOT by itself meet Medicare''s skilled-care threshold for home health coverage — this connects directly to the documentation-specificity principle tested earlier in this paper and in Paper 8 (Q42): skilled nursing coverage requires genuinely skilled services, not simply any physician-ordered task performed by a nurse; a lab draw alone is generally considered a task that could be performed by non-skilled personnel or doesn''t independently require nursing judgment/skill in the way Medicare coverage criteria contemplate, meaning this kind of visit is a genuine coverage risk if billed as a stand-alone skilled visit without additional skilled content actually being provided and documented.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('05ec4ed2-e225-4930-8512-1e5b23917601', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 55, 'A patient''s home health agency documentation shows a therapy reassessment (required periodically under Medicare rules to justify continued therapy services) was completed 45 days after the initial therapy evaluation. Per current Medicare home health therapy reassessment requirements, is this compliant?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2da3f12b-8fb6-4962-838e-9de1b199f9d6', '05ec4ed2-e225-4930-8512-1e5b23917601', 0, 'Yes, therapy reassessment has no specific required timeframe');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('53ddf914-d146-4854-a1e3-75aceadbe130', '05ec4ed2-e225-4930-8512-1e5b23917601', 1, 'Generally no — Medicare requires a qualified therapist to conduct a reassessment of the patient at least every 30 calendar days (a functional reassessment visit), and a 45-day gap without this required reassessment would be a documentation/coverage compliance concern');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f16ce973-458b-43c2-ab4f-9090fa3bbd85', '05ec4ed2-e225-4930-8512-1e5b23917601', 2, 'Yes, since PDGM eliminated all therapy-specific documentation requirements along with removing therapy visit thresholds from case-mix payment');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0a5d4203-ed72-4978-b4b1-c2e29844513e', '05ec4ed2-e225-4930-8512-1e5b23917601', 3, 'Therapy reassessment is only required annually');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('05ec4ed2-e225-4930-8512-1e5b23917601', '53ddf914-d146-4854-a1e3-75aceadbe130', 'This tests whether a candidate incorrectly conflates two distinct PDGM-related therapy changes: PDGM eliminated therapy VISIT VOLUME as a case-mix PAYMENT driver (tested earlier in this paper and in Paper 8, Q2) — but this is entirely separate from the ongoing CLINICAL/DOCUMENTATION requirement for periodic therapy reassessment (generally required at least every 30 calendar days by a qualified therapist) to support continued medical necessity of therapy services — that clinical reassessment requirement was NOT eliminated by PDGM''s payment-model changes, making a 45-day gap without the required reassessment a genuine compliance concern, distinct from and not excused by the payment-model change.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4e8f2690-577e-4810-9f99-76b0fa2f0fcd', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 56, 'A patient with urinary incontinence, confirmed by the physician as stress incontinence (leakage with coughing/sneezing/exertion, no urgency component), is admitted to home health for pelvic floor PT. Select the correct coding, distinguishing this from urge incontinence.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('489ad16f-2edb-4ebb-abd8-4e2c4dd58d3c', '4e8f2690-577e-4810-9f99-76b0fa2f0fcd', 0, 'N39.46');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8d9a1b25-e5ab-4952-a91d-948c13004201', '4e8f2690-577e-4810-9f99-76b0fa2f0fcd', 1, 'N39.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('522aadb9-4be5-4b49-b94e-8362ad093f81', '4e8f2690-577e-4810-9f99-76b0fa2f0fcd', 2, 'N39.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1e3303e8-8fc8-4763-b22b-a17d323153f6', '4e8f2690-577e-4810-9f99-76b0fa2f0fcd', 3, 'R32');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4e8f2690-577e-4810-9f99-76b0fa2f0fcd', '522aadb9-4be5-4b49-b94e-8362ad093f81', 'N39.3 (stress incontinence (female)(male)) precisely matches the documented presentation — leakage specifically triggered by physical exertion/coughing/sneezing, with no urgency component. N39.41 (urge incontinence) is the wrong type entirely, describing leakage following a sudden, intense urge to urinate (typically overactive bladder/detrusor instability) — a distinct mechanism the stem specifically rules out. N39.46 (mixed incontinence) would only apply if BOTH stress and urge components were documented together, which isn''t the case here. R32 (unspecified urinary incontinence) would under-code the documented specific stress-incontinence pattern.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3f2d59fd-5840-456a-a27d-39f0e9f16c27', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 57, 'A patient''s home health record shows the physician''s certification statement for the plan of care lacks a specific narrative explaining why the patient''s condition makes them homebound, containing only a checked box with no supporting clinical detail. Per CoP documentation standards for physician certification, is a checkbox alone (with no supporting narrative) generally considered sufficient?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('76b3f81a-9bec-4770-8cc7-fab886170557', '3f2d59fd-5840-456a-a27d-39f0e9f16c27', 0, 'Yes, a checked box alone always fully satisfies the homebound certification requirement');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b1ce20b9-f24a-4c98-a2ef-ce0fcfe157b7', '3f2d59fd-5840-456a-a27d-39f0e9f16c27', 1, 'Generally no — CMS guidance and audit experience indicate that the certifying documentation should include enough specific clinical detail to support the homebound determination, not merely a checked box without narrative substantiation, mirroring the broader documentation-specificity theme tested throughout this exam series');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b98cee42-e9e0-4f8a-8281-55933aa2afaf', '3f2d59fd-5840-456a-a27d-39f0e9f16c27', 2, 'Homebound status does not require any physician certification at all');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('db54e74b-30db-450d-868a-7636a0c547c4', '3f2d59fd-5840-456a-a27d-39f0e9f16c27', 3, 'A checkbox is sufficient only for patients over age 80');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3f2d59fd-5840-456a-a27d-39f0e9f16c27', 'b1ce20b9-f24a-4c98-a2ef-ce0fcfe157b7', 'This extends the documentation-specificity principle tested repeatedly in this exam series (Paper 8''s vague-visit-note question, the lab-draw-only visit question earlier in this paper) to physician certification specifically — CMS guidance and audit/appeals experience consistently show that homebound certification supported only by a checked box, without narrative clinical detail explaining WHY the patient meets the homebound criteria, is a recognized audit vulnerability and generally insufficient to reliably support the certification if challenged, even though the underlying regulation doesn''t mandate a specific word-count or format — the substantive standard is meaningful clinical support, not simply a checked box.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('dd9d6cd6-8c3c-4bc3-8717-d27709f9ed1e', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 58, 'A patient''s home health agency wants to discharge a patient against medical advice (the patient is refusing further care despite ongoing, clearly documented skilled care needs). Per CoP requirements, what must the agency do before finalizing this discharge?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('14ecb3e1-71b7-4194-8f47-3deb1c9a506d', 'dd9d6cd6-8c3c-4bc3-8717-d27709f9ed1e', 0, 'Simply stop visiting without further documentation once the patient states they don''t want care');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cc762364-f03a-4ffb-99ad-2eb6848609a8', 'dd9d6cd6-8c3c-4bc3-8717-d27709f9ed1e', 1, 'Document the patient''s informed refusal (including that risks were explained), notify the physician, and complete appropriate discharge documentation reflecting the reason for discharge and the patient''s right to refuse care — this is a genuine right the patient holds, but the agency must still properly document and communicate the discharge');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('43860b16-aed6-421c-84a9-ca1f6485e8dd', 'dd9d6cd6-8c3c-4bc3-8717-d27709f9ed1e', 2, 'Obtain a court order before any discharge against medical advice can occur');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0e240ed3-e885-4685-9cc1-84dca9c15fba', 'dd9d6cd6-8c3c-4bc3-8717-d27709f9ed1e', 3, 'The patient must sign a specific CMS form or the discharge is invalid, with no alternative documentation method available');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('dd9d6cd6-8c3c-4bc3-8717-d27709f9ed1e', 'cc762364-f03a-4ffb-99ad-2eb6848609a8', 'A patient has a genuine right to refuse care (part of the CoP patient rights framework tested elsewhere in this exam series) — but the agency''s obligation doesn''t end at simply stopping visits; proper discharge-against-medical-advice documentation requires documenting the informed refusal (including that risks of discontinuing care were explained), physician notification, and completing appropriate discharge summary documentation reflecting the circumstances — this protects both the patient''s right to refuse and ensures the clinical record accurately and defensibly reflects why care ended, without requiring an unnecessary court order or a single mandated CMS form format.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a8b9a129-0968-4e08-b3e2-79d249dc9318', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 59, 'A patient with chronic kidney disease stage 4 has a new diagnosis of renal osteodystrophy, confirmed by the physician and supported by imaging/lab findings, causing bone pain and requiring careful mobility precautions during home health PT. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('933624b2-2c3d-47df-8a37-f1399b826a04', 'a8b9a129-0968-4e08-b3e2-79d249dc9318', 0, 'N18.4, N25.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('67968e39-5aab-47ef-9b83-7574e8c733c2', 'a8b9a129-0968-4e08-b3e2-79d249dc9318', 1, 'N25.0, N18.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c4844bdf-41a1-499c-863a-ee9e97b36f85', 'a8b9a129-0968-4e08-b3e2-79d249dc9318', 2, 'M81.8, N18.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6bc04fc7-57b1-49f1-8a78-d163abbe072f', 'a8b9a129-0968-4e08-b3e2-79d249dc9318', 3, 'N18.4, M81.8');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a8b9a129-0968-4e08-b3e2-79d249dc9318', '933624b2-2c3d-47df-8a37-f1399b826a04', 'N18.4 (CKD stage 4) is sequenced first per N25.0''s own ''code first'' instructional note, which requires the underlying kidney disease to be identified before the renal osteodystrophy code — the same etiology-first sequencing pattern already established in this exam series for D63.1 (anemia in CKD, Paper 7 Q28) and N25.81 (secondary hyperparathyroidism of renal origin, Paper 8 Q78, corrected). N25.0 (renal osteodystrophy) follows as the specific bone-disease manifestation. M81.8 (other osteoporosis, a non-renal-specific bone code) would under-code the documented renal etiology when the more specific, dedicated N25.0 code is available and directly matches.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bfce5816-7f18-442b-9258-e646bd774866', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 60, 'A patient with a chronic indwelling suprapubic catheter has the home health nurse perform a routine, scheduled catheter change per physician order, with no complications. Select the correct coding to reflect this routine catheter care encounter, if any code beyond the underlying condition is needed.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('550d3d9e-95d8-4f4c-b4fd-b52763a6f26c', 'bfce5816-7f18-442b-9258-e646bd774866', 0, 'Z46.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('461772af-d9b7-4b67-a9d6-a119fa680961', 'bfce5816-7f18-442b-9258-e646bd774866', 1, 'T83.091A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f0c08c31-7b3c-4f9d-9fe8-6f54df562d4c', 'bfce5816-7f18-442b-9258-e646bd774866', 2, 'Z43.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2203a723-4940-4583-94f0-c7f428c7da4e', 'bfce5816-7f18-442b-9258-e646bd774866', 3, 'No code needed for routine catheter maintenance');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('bfce5816-7f18-442b-9258-e646bd774866', 'f0c08c31-7b3c-4f9d-9fe8-6f54df562d4c', 'Z43.5 (encounter for attention to cystostomy) is the specific aftercare/attention code for routine, planned suprapubic catheter care — Z46.6 (encounter for fitting and adjustment of urinary device, a DIFFERENT Z-code used more for external/non-cystostomy urinary devices) is a close but less precise distractor for this specific cystostomy-catheter scenario. T83.091A (other mechanical complication of indwelling urinary catheter) would incorrectly imply a complication occurred, contradicted by the stem''s explicit ''no complications'' documentation — routine, uncomplicated scheduled maintenance is captured by the Z43.5 aftercare code, not a complication code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e262d059-bf6c-4442-a185-3c0d2b15bf4b', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 61, 'A patient with a chronic wound has documentation showing conflicting wound measurements between two consecutive home health visits (visit 1: 3cm x 2cm; visit 2, one week later: 5cm x 4cm) with no narrative explanation for the significant size increase and no indication the measurement technique changed. What should the QA reviewer/coder do with this discrepancy before finalizing documentation reflecting wound status?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0e1d94b1-fe83-429c-9a97-d4da71b7949b', 'e262d059-bf6c-4442-a185-3c0d2b15bf4b', 0, 'Automatically use the larger measurement since it''s more recent');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fde7b31a-ceb6-4a5f-bfd5-e7749995a55b', 'e262d059-bf6c-4442-a185-3c0d2b15bf4b', 1, 'Query the clinician to confirm whether this reflects genuine wound deterioration, a measurement technique difference, or a documentation error, before finalizing any conclusions about wound status — an unexplained significant discrepancy is a legitimate accuracy concern requiring clarification, not silent resolution');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f844bccd-e32b-4a07-aee5-ea50456a5834', 'e262d059-bf6c-4442-a185-3c0d2b15bf4b', 2, 'Average the two measurements');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e91501b1-4eb5-4934-9fe2-8a04a2a2db23', 'e262d059-bf6c-4442-a185-3c0d2b15bf4b', 3, 'Ignore the discrepancy since wound measurements naturally have some variability');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e262d059-bf6c-4442-a185-3c0d2b15bf4b', 'fde7b31a-ceb6-4a5f-bfd5-e7749995a55b', 'This applies the same discrepancy-resolution principle established in Paper 8 (Q44, the OASIS grooming discrepancy question) to a wound-measurement context — an unexplained, clinically significant jump in wound measurement between consecutive visits, without narrative explanation or noted technique change, is a genuine documentation-accuracy concern requiring clinician query to resolve before drawing conclusions, rather than the coder/reviewer guessing (by taking the larger number, averaging, or dismissing it as normal variability) — silently resolving a real discrepancy risks either missing genuine deterioration requiring physician notification or documenting an inaccurate size that could affect wound-care planning and case-mix-relevant severity data.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('de5a1f9a-757a-4169-bb71-673879eb517e', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 62, 'A patient with severe aortic stenosis undergoes outpatient TAVR successfully, and 5 days later is admitted to home health for post-procedure monitoring, with the aortic stenosis now considered surgically corrected per the cardiologist. Select the correct coding for the aortic valve status at this home health SOC.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('26a32cc1-e1a4-403e-81ff-4bdaee23881f', 'de5a1f9a-757a-4169-bb71-673879eb517e', 0, 'I35.0, Z95.828');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7ca71460-1d06-4c95-8137-ba35eed974cd', 'de5a1f9a-757a-4169-bb71-673879eb517e', 1, 'Z95.828');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c5153579-3226-4eb0-956d-d5582f62b4ff', 'de5a1f9a-757a-4169-bb71-673879eb517e', 2, 'I35.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7122b3ae-abb0-4e96-8757-263fa27aac8d', 'de5a1f9a-757a-4169-bb71-673879eb517e', 3, 'Z98.61');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('de5a1f9a-757a-4169-bb71-673879eb517e', '26a32cc1-e1a4-403e-81ff-4bdaee23881f', 'I35.0 (nonrheumatic aortic valve stenosis) is still coded alongside Z95.828 (presence of other cardiac implants and grafts, appropriate for the TAVR valve) — even though the stenosis is ''surgically corrected,'' the native valve disease diagnosis itself typically remains coded post-TAVR (similar to the CABG/native-CAD principle established in Paper 8: the underlying valve disease isn''t erased by the procedure the way a joint replacement physically removes the arthritic joint), since the TAVR valve is a replacement device addressing the consequence of the stenosis, not a cure of the underlying valvular disease process itself, and ongoing monitoring is specifically for this valve/condition relationship. Z98.61 (coronary angioplasty status, an unrelated procedure code) doesn''t apply to a TAVR.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ae081b4d-cec4-4712-9780-4425fad2ad92', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 63, 'A patient with longstanding systemic sclerosis (scleroderma) develops new pulmonary fibrosis, confirmed by the physician as a direct manifestation of the systemic sclerosis (not a separate, unrelated lung disease), requiring home oxygen. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('453f40ac-2dca-4e25-8f4c-b4cae8759941', 'ae081b4d-cec4-4712-9780-4425fad2ad92', 0, 'M34.9, J84.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b5c07497-14bc-4f57-8338-5da9f1c2df3c', 'ae081b4d-cec4-4712-9780-4425fad2ad92', 1, 'J84.10, M34.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5c72a101-aff3-4837-9137-a1ef6f97fd92', 'ae081b4d-cec4-4712-9780-4425fad2ad92', 2, 'M34.81, J84.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e0c2a8b9-d18e-4b1f-8fcd-085dda06083f', 'ae081b4d-cec4-4712-9780-4425fad2ad92', 3, 'M34.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ae081b4d-cec4-4712-9780-4425fad2ad92', '5c72a101-aff3-4837-9137-a1ef6f97fd92', 'M34.81 (systemic sclerosis with lung involvement) is the specific combination code capturing both the systemic sclerosis AND its documented pulmonary manifestation together — more precise than M34.9 (systemic sclerosis, unspecified, without the lung-involvement specificity). J84.10 (other interstitial pulmonary disease with fibrosis) is still added as a secondary code to further specify the exact pulmonary pathology, since M34.81 itself doesn''t specify the fibrotic pattern — this is a case where the disease-specific combination code (M34.81) and an additional manifestation-detail code (J84.10) are BOTH appropriately used together, distinct from the fully-redundant-combination-code pattern (diabetes/gastroparesis, Crohn''s/fistula) tested elsewhere in this series where the second code would be fully redundant.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c3322170-cdef-4f8c-a851-9fc78bab0f22', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 64, 'A patient''s home health agency wants to use an electronic signature for physician orders and certification documents. Per CoP and Medicare documentation requirements, are electronic signatures acceptable?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b4160ca1-de51-428f-b203-6a5411f98be2', 'c3322170-cdef-4f8c-a851-9fc78bab0f22', 0, 'No, only wet-ink signatures are ever acceptable for any Medicare home health documentation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c09e84fe-0729-4dc3-bc24-da7036917b57', 'c3322170-cdef-4f8c-a851-9fc78bab0f22', 1, 'Yes — electronic signatures are generally acceptable for physician orders and certifications, provided the agency''s system meets applicable authentication/security standards ensuring the signature is genuinely attributable to the signing physician and the record cannot be altered without detection');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d552bbc9-ab71-45b5-b4f0-b011246d0493', 'c3322170-cdef-4f8c-a851-9fc78bab0f22', 2, 'Electronic signatures are acceptable only for nursing documentation, never for physician orders');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0531a24f-6790-4555-b1c0-ae196bbe1f0b', 'c3322170-cdef-4f8c-a851-9fc78bab0f22', 3, 'Electronic signatures require a separate, additional CMS pre-approval application for each individual physician');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c3322170-cdef-4f8c-a851-9fc78bab0f22', 'c09e84fe-0729-4dc3-bc24-da7036917b57', 'Electronic signatures are generally acceptable for Medicare home health documentation, including physician orders and certifications, provided the agency''s electronic system includes appropriate authentication and security safeguards ensuring the signature is genuinely and verifiably attributable to the specific signing physician and that the record maintains integrity against undetected alteration — this reflects modern documentation practice broadly accepted across CMS-regulated settings, not restricted to only nursing documentation, and does not require a separate per-physician CMS pre-approval process.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c7751c6e-068e-4ad2-afff-f8c439bd4c16', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 65, 'A patient with a recent lower GI bleed (now stabilized, no active bleeding, hemoglobin trending up after transfusion) confirmed by colonoscopy to be due to diverticulosis (not diverticulitis — no inflammation/infection, simple diverticula with a bleeding vessel), is now home for monitoring. Select the correct coding, distinguishing diverticulosis-with-bleeding from the diverticulitis-with-abscess question earlier in this paper.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('296b36c4-0f1a-4185-9098-c61684e1d626', 'c7751c6e-068e-4ad2-afff-f8c439bd4c16', 0, 'K57.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b036b986-abbb-42a9-9539-c8779ee73489', 'c7751c6e-068e-4ad2-afff-f8c439bd4c16', 1, 'K57.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3355a003-78de-461c-b97f-942f61a734d6', 'c7751c6e-068e-4ad2-afff-f8c439bd4c16', 2, 'K57.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('125dbc29-381b-4c2e-a14e-6ab03701a120', 'c7751c6e-068e-4ad2-afff-f8c439bd4c16', 3, 'K57.33');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c7751c6e-068e-4ad2-afff-f8c439bd4c16', 'b036b986-abbb-42a9-9539-c8779ee73489', 'K57.31 (diverticulosis of large intestine with bleeding, without perforation or abscess) is the correct code — this is a genuinely distinct code family from K57.2x (diverticulITIS with perforation and abscess, used correctly earlier in this paper for a different, inflamed/infected presentation): diverticulOSIS (simple diverticula, no inflammation) with bleeding uses K57.3x, while diverticulITIS (inflamed/infected) with perforation/abscess uses K57.2x — this tests whether a candidate correctly distinguishes these two related-sounding but clinically and code-wise distinct diverticular disease presentations. K57.30 (diverticulosis without perforation, abscess, OR bleeding) would under-code the documented bleeding. K57.33 is a distractor from a different specific sub-variant not matching this presentation.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8e78551e-1f7d-4720-ab08-193c7282b7b6', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 66, 'A patient with major depressive disorder is prescribed a tricyclic antidepressant (amitriptyline) for combined depression and neuropathic pain management. The home health nurse identifies new urinary retention, confirmed by the physician as an anticholinergic adverse effect of the correctly-dosed medication. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('078b8f25-f91a-4727-949e-28b856c18282', '8e78551e-1f7d-4720-ab08-193c7282b7b6', 0, 'R33.9, T43.015A, F33.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6fffcd05-8db1-4773-a7c2-60f100115807', '8e78551e-1f7d-4720-ab08-193c7282b7b6', 1, 'F33.9, T43.015A, R33.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('240e415b-77ff-4b52-a61c-cb9cf1a61dc4', '8e78551e-1f7d-4720-ab08-193c7282b7b6', 2, 'T43.015A, F33.9, R33.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('65b08047-b776-4e1c-8311-a0071817a234', '8e78551e-1f7d-4720-ab08-193c7282b7b6', 3, 'F33.9, R33.9, T43.015A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8e78551e-1f7d-4720-ab08-193c7282b7b6', '6fffcd05-8db1-4773-a7c2-60f100115807', 'F33.9 (major depressive disorder) is sequenced first as the underlying condition requiring the medication, per the chronic-disease-first sequencing pattern used consistently in this exam series. T43.015A (adverse effect of tricyclic antidepressants, initial encounter) follows. R33.9 (retention of urine, unspecified) is the resulting manifestation, sequenced last — the same three-part disease → drug-effect → manifestation sequencing pattern deliberately repeated throughout this exam series (clozapine/agranulocytosis, olanzapine/diabetes in Paper 8/9).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8976ba61-81f2-4037-885f-4128f659c15a', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 67, 'A patient''s home health record shows the plan of care listing ''skilled nursing for wound care'' without specifying visit frequency (e.g., ''3x/week'') or duration (e.g., ''x 4 weeks''), just an open-ended order. Is this order sufficiently specific to support ongoing Medicare coverage?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3c72b260-c52e-4204-b7e6-c92845500021', '8976ba61-81f2-4037-885f-4128f659c15a', 0, 'Yes, an order without a specific frequency/duration is fully sufficient as long as visits occur');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('36bdb3eb-4ac3-4848-8ae6-98cbb73a4577', '8976ba61-81f2-4037-885f-4128f659c15a', 1, 'Generally no — Medicare coverage and CoP documentation standards expect the plan of care to specify frequency and duration for ordered services, not an open-ended, unspecified order; this is a genuine documentation deficiency, not merely a stylistic preference');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f0bfe7d0-254b-4331-82ae-1f3e99106008', '8976ba61-81f2-4037-885f-4128f659c15a', 2, 'Frequency/duration specificity is only required for therapy orders, not nursing orders');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8d06b04c-73a8-4b63-90bb-06250fda5874', '8976ba61-81f2-4037-885f-4128f659c15a', 3, 'An open-ended order is acceptable as long as the total number of visits doesn''t exceed 60 in the certification period');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8976ba61-81f2-4037-885f-4128f659c15a', '36bdb3eb-4ac3-4848-8ae6-98cbb73a4577', 'This extends the order-specificity theme tested throughout this exam series (the wound-care-frequency utilization-review question in Paper 8, the vague-visit-note documentation question) to the plan of care order itself — Medicare coverage criteria and CoP documentation standards expect physician orders to specify frequency and duration, not leave services open-ended, since an unspecified order makes it difficult to establish and audit medical necessity, determine when reassessment/recertification is due, and confirm the agency is following (not exceeding or falling short of) what''s actually been ordered — this specificity requirement applies to nursing orders just as much as therapy orders.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('49b72884-c96f-4d21-84b0-90d60c3fe765', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 68, 'A patient with Parkinson''s disease, without dyskinesia and without motor fluctuations, develops new dysphagia with confirmed aspiration pneumonia, physician-documented as directly caused by the swallowing dysfunction from the Parkinson''s. Select the correct, complete coding reflecting the full causal chain.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ceea7aad-36b2-496c-ac74-c8ce7557966b', '49b72884-c96f-4d21-84b0-90d60c3fe765', 0, 'G20.A1, R13.10, J69.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dc34f8a5-240a-4671-a289-944bf03c360d', '49b72884-c96f-4d21-84b0-90d60c3fe765', 1, 'J69.0, R13.10, G20.A1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5cd67b63-82be-41ae-b74e-5fc17abcf58f', '49b72884-c96f-4d21-84b0-90d60c3fe765', 2, 'G20.A1, J69.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('94f0882f-ca21-4fc4-bdd8-148a25a0f2e2', '49b72884-c96f-4d21-84b0-90d60c3fe765', 3, 'J69.0, G20.A1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('49b72884-c96f-4d21-84b0-90d60c3fe765', '5cd67b63-82be-41ae-b74e-5fc17abcf58f', 'G20.A1 (Parkinson''s disease without dyskinesia, without mention of fluctuations) is sequenced first as the root underlying neurological disease — G20 alone is a non-billable category header requiring this dyskinesia/fluctuation specification. J69.0 (pneumonitis due to inhalation of food and vomit — the specific aspiration pneumonia combination code) follows directly, without a separately stacked R13.10 (dysphagia symptom code) — since the dysphagia is explicitly documented as the causal MECHANISM linking Parkinson''s to the aspiration pneumonia (not a separately, independently significant finding requiring its own additional code beyond what''s already implied by the G20.A1-to-J69.0 causal chain), adding R13.10 on top would be a redundant middle-step symptom code between two already-linked, more clinically significant diagnoses — mirroring the non-redundant-symptom-code principle established with the MS/ALS non-stacking questions earlier in this paper.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0ffd8da1-5561-42c7-a6e1-2e98a813a264', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 69, 'A patient''s home health agency plans to discharge a patient because the patient has met all goals and no longer requires skilled care, with the physician in agreement. The patient will continue to need non-skilled personal care assistance from private-pay caregivers after discharge. Per CoP discharge planning requirements, what must the agency''s discharge summary address regarding this transition?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7d055521-a122-4759-be62-e73c902ad510', '0ffd8da1-5561-42c7-a6e1-2e98a813a264', 0, 'Nothing — once skilled care needs end, the agency has no further discharge planning obligation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e813dfe6-52a4-4d91-808f-d615bba0507c', '0ffd8da1-5561-42c7-a6e1-2e98a813a264', 1, 'The discharge summary should address the patient''s continuing non-skilled care needs and any coordination/referral information relevant to that transition (e.g., information about private-pay caregiving resources), even though the ongoing care itself won''t be provided or billed by the home health agency');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bfd8d71c-397b-401f-befe-186c75e51bd1', '0ffd8da1-5561-42c7-a6e1-2e98a813a264', 2, 'The agency must continue billing Medicare for the private-pay caregiving arrangement');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('28854bc3-0966-4f7a-8f83-4c6071e7d1b3', '0ffd8da1-5561-42c7-a6e1-2e98a813a264', 3, 'Discharge planning is only required when a patient is transferred to another Medicare-certified provider, not to private-pay arrangements');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0ffd8da1-5561-42c7-a6e1-2e98a813a264', 'e813dfe6-52a4-4d91-808f-d615bba0507c', 'This extends the discharge-planning principle established earlier in this paper (Q39, the goal-achievement discharge summary question) — proper discharge planning addresses the patient''s continuing care needs and relevant coordination/referral information regardless of whether the NEXT care arrangement is Medicare-certified, private-pay, or informal family/caregiver support — the agency''s discharge-planning responsibility isn''t limited to only formal provider-to-provider transfers, and doesn''t simply end the moment skilled Medicare-covered need ends, even though the agency obviously isn''t billing Medicare for care it isn''t providing.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('18ccbcfb-06ce-4dbb-b8a7-77f5e5f6c51f', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 70, 'A patient with a long-standing history of alcohol use disorder now presents with confirmed Wernicke encephalopathy (confusion, ataxia, ophthalmoplegia), physician-documented as due to thiamine deficiency from chronic alcohol use, requiring urgent thiamine repletion. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2b82eb79-7ff2-4f6f-a415-dc87987ff19c', '18ccbcfb-06ce-4dbb-b8a7-77f5e5f6c51f', 0, 'E51.2, F10.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bfa00952-54ac-424f-88b0-1726e1ffa7aa', '18ccbcfb-06ce-4dbb-b8a7-77f5e5f6c51f', 1, 'F10.20, E51.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('da865b74-2362-4a98-8cd3-a4c14ea73d59', '18ccbcfb-06ce-4dbb-b8a7-77f5e5f6c51f', 2, 'G31.2, F10.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('337f595b-1707-4c08-be97-0679f727d67e', '18ccbcfb-06ce-4dbb-b8a7-77f5e5f6c51f', 3, 'E51.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('18ccbcfb-06ce-4dbb-b8a7-77f5e5f6c51f', '2b82eb79-7ff2-4f6f-a415-dc87987ff19c', 'E51.2 (Wernicke''s encephalopathy) is sequenced first as the acute, currently active, and clinically urgent condition being treated. F10.20 (alcohol dependence, uncomplicated) is added as the separate underlying substance use disorder — this is NOT a strict ''code first'' combination-code relationship the way some other pairs in this series are (like D63.1/CKD or N25.0/CKD), since E51.2 and F10.20 are each independently coded conditions rather than one being a designated manifestation code requiring the other to lead by instructional note; sequencing here reflects clinical significance (the acute neurological emergency) rather than a mandatory etiology-first rule. G31.2 (degeneration of nervous system due to alcohol, a DIFFERENT, more chronic alcohol-related neurological code) would be the wrong code for this specific acute Wernicke''s presentation.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('66d1931a-1120-486d-8ec0-d5628ce5d0d5', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 71, 'A patient with chronic alcohol use disorder has been diagnosed with Korsakoff syndrome (the chronic, often irreversible memory disorder that can follow Wernicke encephalopathy), now stable, requiring structured daily routines and safety supervision at home. Select the correct coding, distinguishing this from the acute Wernicke''s question in this paper.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('733b6aa8-a6a2-4cfa-ba4b-4736d4cd507d', '66d1931a-1120-486d-8ec0-d5628ce5d0d5', 0, 'F10.96');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ed8604d0-45ed-4201-a3d9-cf5d12e888d6', '66d1931a-1120-486d-8ec0-d5628ce5d0d5', 1, 'E51.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6ec63a8a-6911-4a7d-81e6-65abc1e7b6fd', '66d1931a-1120-486d-8ec0-d5628ce5d0d5', 2, 'F10.26');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4a10c056-8ac2-4677-811d-03e5ba8551c1', '66d1931a-1120-486d-8ec0-d5628ce5d0d5', 3, 'F10.27');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('66d1931a-1120-486d-8ec0-d5628ce5d0d5', '6ec63a8a-6911-4a7d-81e6-65abc1e7b6fd', 'F10.26 (alcohol dependence with alcohol-induced persisting amnestic disorder — the specific code covering Korsakoff syndrome as a chronic, persisting memory complication of alcohol dependence) is the correct combination code, distinct from E51.2 (Wernicke''s encephalopathy, the ACUTE phase tested in the prior question) — Wernicke-Korsakoff syndrome is often described as a single continuum, but ICD-10-CM codes the acute encephalopathy phase (E51.2) and the chronic amnestic/Korsakoff phase (F10.26) differently, testing whether a candidate recognizes these as coded separately despite their close clinical relationship. F10.27 is a distractor for a DIFFERENT diagnosis — alcohol dependence with alcohol-induced persisting DEMENTIA — a distinct condition from the amnestic (memory-specific) disorder that defines Korsakoff syndrome; these two adjacent codes are easy to swap by mistake, which is exactly what this question tests. F10.96 (alcohol use with alcohol-induced psychotic disorder) is the wrong specific complication type entirely.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('be7e03bb-03b5-4d86-b137-76d73f1d1b99', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 72, 'A patient''s home health agency wants to know whether a physician assistant (PA) or nurse practitioner (NP) may certify and establish the home health plan of care under current Medicare rules, given historically only physicians could do so.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3353391f-e778-45e5-93fe-e32333288f6f', 'be7e03bb-03b5-4d86-b137-76d73f1d1b99', 0, 'No, only physicians (MD/DO) have ever been permitted to certify home health services under any circumstance');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5fe5e493-62ab-4f4f-a637-91ff4b31ce15', 'be7e03bb-03b5-4d86-b137-76d73f1d1b99', 1, 'Yes — current Medicare rules permit certain allowed non-physician practitioners (including nurse practitioners, physician assistants, and clinical nurse specialists, working in collaboration with a physician per applicable state and federal requirements) to certify and establish home health plans of care, a change from the historically physician-only requirement');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b75df533-3bac-4471-9f7a-47b0c83f0675', 'be7e03bb-03b5-4d86-b137-76d73f1d1b99', 2, 'PAs and NPs may only co-sign an order already certified by a physician, never independently certify');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bf780fc1-5f69-4d80-bb2f-a67decee5ad6', 'be7e03bb-03b5-4d86-b137-76d73f1d1b99', 3, 'This authority varies so completely by state that no general federal rule can be stated');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('be7e03bb-03b5-4d86-b137-76d73f1d1b99', '5fe5e493-62ab-4f4f-a637-91ff4b31ce15', 'Medicare rules have evolved to permit certain allowed non-physician practitioners (NPs, PAs, and certified nurse specialists, among others, subject to applicable collaboration/supervision requirements and state scope-of-practice law) to certify and establish home health plans of care — this represents a genuine, real change from the historically physician-only certification requirement, and candidates should not assume the older physician-only rule still applies universally; while state scope-of-practice law is relevant context, there IS a general federal framework permitting this expanded certification authority, not simply an unstatable state-by-state patchwork with no federal baseline at all.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9c67397c-69d4-4a60-8689-8ba023a54428', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 73, 'A patient with a documented DNR (Do Not Resuscitate) order is receiving home health services. During a visit, the patient experiences a witnessed cardiac arrest. Per CoP patient rights and advance directive requirements, what governs the home health staff''s response?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('51f327ec-c3ad-4935-8217-5848cf7e359f', '9c67397c-69d4-4a60-8689-8ba023a54428', 0, 'Home health staff must always perform CPR regardless of any DNR order, since DNR orders don''t apply outside hospital settings');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('34b20c9c-59fb-4744-8626-32b7c437468b', '9c67397c-69d4-4a60-8689-8ba023a54428', 1, 'Home health staff must respect the patient''s properly documented, valid DNR order/advance directive and not perform CPR, consistent with CoP requirements to honor patient advance directives and the patient''s right to make decisions about their own care');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('59e8e292-1a60-4de5-9651-33859db19996', '9c67397c-69d4-4a60-8689-8ba023a54428', 2, 'DNR orders require a family member to be physically present and verbally confirm before staff may honor them');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f0937401-a7c3-4239-a855-ca1189f70943', '9c67397c-69d4-4a60-8689-8ba023a54428', 3, 'Home health agencies are prohibited from accepting patients with DNR orders');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9c67397c-69d4-4a60-8689-8ba023a54428', '34b20c9c-59fb-4744-8626-32b7c437468b', 'CoP requirements around patient rights and advance directives require home health agencies and their staff to honor a patient''s properly executed, valid DNR order/advance directive — a documented, valid DNR applies across care settings including home health, not just hospitals, and does not require a family member''s real-time verbal reconfirmation at the moment of the event to be honored (that would defeat much of the purpose of having an advance directive in place); agencies are not prohibited from accepting or serving patients with DNR orders, and honoring the patient''s documented wishes is itself part of respecting patient rights, not a barrier to admission.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e26b1393-23e4-4b37-8b08-9e65be591721', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 74, 'A patient with COPD has a new finding of eosinophilia on routine labs, and the physician determines this represents COPD with an eosinophilic phenotype, relevant to guiding a specific biologic therapy choice (not a separate diagnosis, simply a phenotypic characterization of the existing COPD). Should a separate code be used for ''eosinophilic COPD phenotype''?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('16ae3e19-fc76-43ba-b7ed-e862ed3655c4', 'e26b1393-23e4-4b37-8b08-9e65be591721', 0, 'Yes, a dedicated ICD-10-CM code exists specifically for eosinophilic COPD phenotype and must be used');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fa149d67-b3ec-4832-aca1-3492c8fbf3a7', 'e26b1393-23e4-4b37-8b08-9e65be591721', 1, 'No dedicated ICD-10-CM code exists for this specific phenotypic characterization; J44.9 (or a more specific J44 code if additional acuity/exacerbation detail is documented) remains the correct diagnosis code, with the eosinophilic phenotype detail captured in narrative clinical documentation supporting the specific biologic therapy choice');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('082e23cc-1b13-460a-93fd-0455852fc7fb', 'e26b1393-23e4-4b37-8b08-9e65be591721', 2, 'D72.10 (eosinophilia, unspecified) should replace the COPD code entirely');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('af0daf94-5b32-4475-804b-1d39089fcc9e', 'e26b1393-23e4-4b37-8b08-9e65be591721', 3, 'The phenotype must be captured using a Z-code for genetic/phenotypic status');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e26b1393-23e4-4b37-8b08-9e65be591721', 'fa149d67-b3ec-4832-aca1-3492c8fbf3a7', 'This mirrors the narrative-vs-code distinction tested repeatedly in this exam series (the buspirone/alcohol-history rationale, the anticoagulation-combination risk-benefit decision in Paper 8) — there is no dedicated ICD-10-CM code capturing a specific disease PHENOTYPE characterization like ''eosinophilic COPD'' as a distinct diagnosis; the underlying diagnosis remains J44.9 (or a more specific J44 variant if exacerbation status is separately documented), with the phenotypic detail relevant to the specific therapy choice captured in narrative documentation, not forced into a code that doesn''t exist for this purpose. D72.10 (eosinophilia) is a lab-finding code, not a replacement for the underlying respiratory disease diagnosis.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ff080c87-b98a-4030-be49-884e58e813da', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 75, 'A home health patient''s agency has a QAPI-identified pattern showing a specific nurse has a notably higher rate of late/missed visits compared to peers over the past quarter. Per CoP requirements, what should the agency''s response be?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ea4bb277-31df-4d10-a6a0-b5853ec27e66', 'ff080c87-b98a-4030-be49-884e58e813da', 0, 'Immediately terminate the nurse without any further investigation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2aa96f5a-cc1a-4c78-9b61-d9b60c6aa4d0', 'ff080c87-b98a-4030-be49-884e58e813da', 1, 'Investigate the underlying cause of the pattern (e.g., caseload, geographic assignment, personal circumstances, or a genuine performance concern), and take appropriate corrective action based on the specific findings — a QAPI-identified pattern should trigger meaningful follow-up, not be ignored, but also not result in an automatic, undifferentiated punitive response');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('49d1eaf5-00a9-45f9-bb36-30664f0748c4', 'ff080c87-b98a-4030-be49-884e58e813da', 2, 'Ignore individual-level QAPI data since QAPI is only meant to track agency-wide trends, never individual staff patterns');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f603f7b4-365f-41b6-a224-8a1fd911493d', 'ff080c87-b98a-4030-be49-884e58e813da', 3, 'Reassign all of the nurse''s patients immediately without investigating the cause');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ff080c87-b98a-4030-be49-884e58e813da', '2aa96f5a-cc1a-4c78-9b61-d9b60c6aa4d0', 'A genuine QAPI-identified performance pattern (like a specific nurse''s elevated missed/late-visit rate) should trigger meaningful investigation into the underlying cause — which could reflect a systemic issue (excessive caseload, difficult geographic assignment) as much as an individual performance concern — followed by an appropriately tailored response based on the actual findings, rather than either ignoring the data (QAPI legitimately can and should surface individual-level patterns, not just pure agency-wide aggregate trends) or jumping to an automatic, undifferentiated punitive action without understanding the cause first.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('eaa467f7-383e-417e-a68d-c8109af2e222', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 76, 'A patient with chronic hepatitis C, now successfully treated with direct-acting antivirals and confirmed to have achieved sustained virologic response (SVR — considered cured), is admitted to home health for an unrelated orthopedic issue. Select the correct coding for the hepatitis C status.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a117c184-61d0-467b-9823-20bbf68e9d5a', 'eaa467f7-383e-417e-a68d-c8109af2e222', 0, 'B18.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7d7246ea-8cec-4c32-a286-72bde9a7034d', 'eaa467f7-383e-417e-a68d-c8109af2e222', 1, 'B19.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b68e9e1c-82ae-4523-8d53-3e0b7a2176d3', 'eaa467f7-383e-417e-a68d-c8109af2e222', 2, 'Z86.19');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a3919920-90df-4532-8a11-6fb733a979f9', 'eaa467f7-383e-417e-a68d-c8109af2e222', 3, 'Z22.8');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('eaa467f7-383e-417e-a68d-c8109af2e222', 'b68e9e1c-82ae-4523-8d53-3e0b7a2176d3', 'Z86.19 (personal history of other infectious and parasitic diseases — used for cured/resolved hepatitis C after confirmed SVR) is correct since SVR represents a genuine virologic cure, not simply viral suppression the way HIV''s B20 code remains permanently active regardless of viral suppression (a deliberate contrast with the HIV question earlier in this paper) — hepatitis C, once cured via SVR, is coded as resolved history, not as an ongoing active disease (B18.2, chronic viral hepatitis C, wrong since the disease is cured, not ongoing) or B19.20 (unspecified viral hepatitis C, which under-codes the documented specific, confirmed-cured status). Z22.8 (carrier of other infectious diseases, a general catch-all Z-code) is also wrong here — ICD-10-CM''s carrier chapter doesn''t cover viral hepatitis at all, and even if it did, SVR-confirmed cure means the virus has been eliminated entirely, which is a fundamentally different status from being a carrier of an ongoing, if inactive, infection.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('adf787fc-838f-43a8-8bd6-28aa3299b046', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 77, 'A patient with a recent stroke has confirmed central post-stroke pain syndrome (a specific neuropathic pain condition resulting from the stroke''s effect on pain-processing pathways), distinct from musculoskeletal pain, requiring gabapentin management. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4f52aad0-9149-42af-8b65-8dcc0b54412a', 'adf787fc-838f-43a8-8bd6-28aa3299b046', 0, 'I69.398');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('99858e7c-91b7-4881-ab6e-3dbbda01cc9d', 'adf787fc-838f-43a8-8bd6-28aa3299b046', 1, 'G89.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('87fccbfe-f782-452f-84b9-64fb0a250233', 'adf787fc-838f-43a8-8bd6-28aa3299b046', 2, 'R52');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('30eddaaf-2d94-4f74-82c1-f716d16df769', 'adf787fc-838f-43a8-8bd6-28aa3299b046', 3, 'I69.90');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('adf787fc-838f-43a8-8bd6-28aa3299b046', '4f52aad0-9149-42af-8b65-8dcc0b54412a', 'I69.398 (other sequelae of cerebral infarction) is the most appropriate available code for this specific late-effect neuropathic pain syndrome caused by the stroke — ICD-10-CM does not have a single dedicated combination code specifically named ''central post-stroke pain,'' so the general ''other sequelae'' code within the I69.3xx stroke-sequela family is used to capture this genuinely stroke-caused pain syndrome, maintaining the etiology-linked-code-over-generic-symptom-code principle established throughout this exam series for stroke sequelae specifically. G89.3 (neoplasm-related pain) is the wrong etiology entirely. R52 (pain, unspecified) would fail to capture the documented stroke-specific causal relationship.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a2c29d54-7f6e-4c2c-84a0-d1e2be0774e6', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 78, 'A patient''s home health agency''s clinical documentation for a wound care visit describes ''wound cleaned and redressed'' with no measurement, no description of wound bed characteristics (granulation, slough, eschar), and no assessment of surrounding skin. Compared to the earlier vague-documentation questions in this exam series, does this specific documentation gap create a distinct risk beyond general coverage/medical-necessity concerns?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('da2e7eda-9b5e-4fdd-a853-8493e543fc19', 'a2c29d54-7f6e-4c2c-84a0-d1e2be0774e6', 0, 'No, this is identical to the general vague-documentation coverage risk already tested elsewhere and creates no additional distinct concern');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a552e464-4fe9-4b01-a270-4e6384860db1', 'a2c29d54-7f6e-4c2c-84a0-d1e2be0774e6', 1, 'Yes — beyond the general medical-necessity documentation concern, this specific gap also prevents accurate wound-stage/depth ICD-10-CM coding (which depends on documented wound bed characteristics) and prevents tracking wound-healing trajectory over time, both of which have downstream effects on coding accuracy and PDGM case-mix data quality, not just coverage risk');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2ab40d07-f736-48e0-af18-96faa4c93c3a', 'a2c29d54-7f6e-4c2c-84a0-d1e2be0774e6', 2, 'Wound measurement and characteristics are optional documentation elements with no coding or payment relevance');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b6e429f6-af21-4d78-8410-151469622967', 'a2c29d54-7f6e-4c2c-84a0-d1e2be0774e6', 3, 'This documentation gap only matters for surgical wounds, not other wound types');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a2c29d54-7f6e-4c2c-84a0-d1e2be0774e6', 'a552e464-4fe9-4b01-a270-4e6384860db1', 'This question asks the candidate to synthesize multiple principles established throughout this exam series: beyond the general skilled-care/medical-necessity documentation risk (Paper 8 Q42, this paper''s lab-draw-only-visit question), a wound note missing measurement and wound-bed characteristics specifically undermines the ability to assign an accurate ICD-10-CM stage/depth code (which the current-status wound-staging principle from Paper 8 depends on having accurate, current documentation to apply) and to track the improving/worsening trajectory that determines whether that code should be updated — this is a genuinely compounding documentation risk (coding accuracy AND case-mix data quality AND coverage support), not simply a repeat of the general vague-documentation concern already tested.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7adbda8e-b5ee-4059-8b6a-4b6fb3788090', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 79, 'A patient with a permanent ostomy (colostomy) has the home health nurse identify a parastomal hernia, confirmed by the physician on exam, causing the stoma to bulge significantly with standing, without obstruction or gangrene, not yet requiring surgical repair but being monitored. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('62cf5992-c52b-4bc9-af20-afab2a2ba951', '7adbda8e-b5ee-4059-8b6a-4b6fb3788090', 0, 'K43.5, Z93.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c346575c-4dea-4000-8fa4-7f3155c9cbf2', '7adbda8e-b5ee-4059-8b6a-4b6fb3788090', 1, 'K94.03, Z93.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8b23c446-62bd-47a4-aa34-a6b74893b737', '7adbda8e-b5ee-4059-8b6a-4b6fb3788090', 2, 'K94.09, Z93.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('515cab4f-8992-47fa-a7b0-7f6fbbbc04ae', '7adbda8e-b5ee-4059-8b6a-4b6fb3788090', 3, 'K43.9, Z93.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7adbda8e-b5ee-4059-8b6a-4b6fb3788090', '62cf5992-c52b-4bc9-af20-afab2a2ba951', 'K43.5 (parastomal hernia without obstruction or gangrene) is the specific, dedicated code for exactly this presentation — ICD-10-CM classifies parastomal hernia under the K43 hernia chapter (with K43.3-K43.6 covering parastomal hernia by obstruction/gangrene status), NOT under the K94 colostomy-complications chapter, which is a genuinely easy mix-up: K94.03 is actually ''colostomy malfunction'' (a different complication entirely, not hernia), and K94.09 (''other complications of colostomy'') is a less specific fallback that under-codes the documented, specifically diagnosable hernia when the dedicated K43.5 code exists and matches. K43.9 (unspecified abdominal hernia, without the parastomal specificity) would also under-code the documented stoma-related etiology. Z93.3 (colostomy status) is added as the device-status secondary code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ee838f18-3839-43c1-ba6f-4daa8fb9ccd0', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 80, 'A patient with type 1 diabetes on an insulin pump has recurring episodes of nocturnal hypoglycemia, confirmed by continuous glucose monitor data, with the physician documenting this as hypoglycemia unawareness (the patient no longer feels typical warning symptoms before becoming hypoglycemic). Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8afc4fa6-352c-41f7-b409-a12ce53705af', 'ee838f18-3839-43c1-ba6f-4daa8fb9ccd0', 0, 'E10.649');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('854d5962-0a55-4612-b629-23f0bdfdafb9', 'ee838f18-3839-43c1-ba6f-4daa8fb9ccd0', 1, 'E10.649, R40.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8b49b542-af51-4fd9-92cc-4422ebbf7f80', 'ee838f18-3839-43c1-ba6f-4daa8fb9ccd0', 2, 'E10.641');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a59d8ae9-3648-495b-b3ac-844f39933e86', 'ee838f18-3839-43c1-ba6f-4daa8fb9ccd0', 3, 'E10.641, R40.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ee838f18-3839-43c1-ba6f-4daa8fb9ccd0', '8afc4fa6-352c-41f7-b409-a12ce53705af', 'E10.649 (type 1 diabetes with hypoglycemia without coma) is the correct combination code — hypoglycemia UNAWARENESS is a clinically important descriptive detail about how the hypoglycemia presents (without typical warning symptoms) but does not have its own separate, distinct ICD-10-CM code; it remains captured within the standard diabetes-with-hypoglycemia combination code, with the specific ''unawareness'' detail documented narratively for care-planning purposes (informing more intensive glucose monitoring), similar to the narrative-vs-code pattern tested elsewhere in this series. E10.641 (diabetes with hypoglycemia WITH coma) would over-code this presentation, since no coma is documented here — only asymptomatic/unaware episodes identified via CGM data.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3dececf2-f565-4445-98a8-d71dc8f4dd65', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 81, 'A patient with a recent lumbar laminectomy for spinal stenosis develops a postoperative CSF (cerebrospinal fluid) leak, confirmed by the surgeon, now managed conservatively at home with bed rest and monitoring (no repeat surgery required). Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('060e08ac-959b-4bf3-972a-0bc5de61cc46', '3dececf2-f565-4445-98a8-d71dc8f4dd65', 0, 'G96.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4f8fa5f2-01bb-413e-a1fb-b70ba378604a', '3dececf2-f565-4445-98a8-d71dc8f4dd65', 1, 'G97.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c270ed3a-acfc-4523-a2d1-7ab864d30d09', '3dececf2-f565-4445-98a8-d71dc8f4dd65', 2, 'G97.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6ed972ae-4490-4de2-84a8-f80a8e108146', '3dececf2-f565-4445-98a8-d71dc8f4dd65', 3, 'T81.40XA');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3dececf2-f565-4445-98a8-d71dc8f4dd65', '4f8fa5f2-01bb-413e-a1fb-b70ba378604a', 'G97.0 (cerebrospinal fluid leak from spinal puncture) is the specific postprocedural complication code matching this exact finding — more precise than G96.0 (rhinorrhea, wrong presentation entirely — a nasal, not spinal, CSF leak) or G97.1 (other reaction to spinal and lumbar puncture, a less specific ''other reaction'' code when the leak itself is the confirmed, specifically documented finding matching the more precise G97.0). T81.40XA (infection following a procedure, unspecified) is the wrong complication type entirely — this is a CSF leak, not an infection.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5bb51070-3274-4f23-b182-cc7df2288788', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 82, 'A patient with chronic kidney disease stage 3a is found to have new-onset chronic metabolic acidosis, confirmed by ABG and bicarbonate level, physician-documented as due to the CKD. Select the correct coding, contrasting with the hyperkalemia-in-CKD question in Paper 7 (which did NOT require etiology-first sequencing).');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ecc7f251-ba6f-490e-b687-61107370842b', '5bb51070-3274-4f23-b182-cc7df2288788', 0, 'N18.31, E87.22');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c7db01b8-8fe3-4b9d-9b43-497a28855525', '5bb51070-3274-4f23-b182-cc7df2288788', 1, 'E87.22, N18.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('102111a0-3b11-4f64-8f3d-b9cca75c0859', '5bb51070-3274-4f23-b182-cc7df2288788', 2, 'N18.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5e0e93f0-a54d-499f-8f07-0b3accaa2ee5', '5bb51070-3274-4f23-b182-cc7df2288788', 3, 'E87.22');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5bb51070-3274-4f23-b182-cc7df2288788', 'ecc7f251-ba6f-490e-b687-61107370842b', 'N18.31 (CKD stage 3a) is sequenced first, followed by E87.22 (chronic metabolic acidosis — the specific billable 5th-character code; E87.2 itself is a non-billable parent requiring this level of subdivision, the same non-billable-parent pattern seen with K85.9 and A04.7 earlier in this exam series) — unlike the CKD-hyperkalemia pairing in Paper 7 (Q26), where no ''code first'' instructional note exists and the acutely-relevant electrolyte finding was sequenced first, metabolic acidosis in CKD does carry a ''code first underlying condition'' convention when specifically documented as CKD-caused, similar to the anemia-in-CKD and renal-osteodystrophy patterns established elsewhere in this exam series — this question deliberately tests whether a candidate over-generalizes the hyperkalemia question''s sequencing (acute finding first) to a different CKD-related electrolyte/acid-base finding that actually follows the opposite, etiology-first convention.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('cba38f3c-c78e-449e-8c47-273ea2eadf54', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 83, 'A patient''s home health agency wants to know if a single missed OASIS timepoint (e.g., a recertification assessment completed 3 days late, outside the required 56-60 day window) invalidates the entire certification period for payment purposes.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d1bbc258-dc85-4310-b5cd-9808b8e30029', 'cba38f3c-c78e-449e-8c47-273ea2eadf54', 0, 'Yes, any late OASIS automatically forfeits all payment for the certification period with no remedy available');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e7865177-6c74-4c06-b27c-984cc8c98cea', 'cba38f3c-c78e-449e-8c47-273ea2eadf54', 1, 'A late OASIS assessment is a genuine compliance/timing deficiency with potential payment consequences (which can vary by the specific circumstances and applicable guidance), but it is a documentation-timing issue to be addressed through proper corrective action and documentation, not something to be casually dismissed as inconsequential');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4c091745-53a4-42c9-adb7-4424ef0423fe', 'cba38f3c-c78e-449e-8c47-273ea2eadf54', 2, 'OASIS timing has no relationship to payment whatsoever');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('42dea6db-581f-44a1-8251-979e7e621657', 'cba38f3c-c78e-449e-8c47-273ea2eadf54', 3, 'Late OASIS assessments are automatically forgiven if the patient''s condition was stable');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('cba38f3c-c78e-449e-8c47-273ea2eadf54', 'e7865177-6c74-4c06-b27c-984cc8c98cea', 'A late OASIS assessment (outside the required collection window) is a genuine compliance and documentation-timing concern with real potential payment/coverage implications — this connects to the broader documentation-specificity and timing-compliance themes tested throughout this exam series (NOA timing, recertification window, therapy reassessment timing) — but the precise consequence can depend on specific circumstances and current guidance, meaning this is presented as a genuine, non-trivial issue requiring proper corrective documentation and action, not glibly summarized as either ''total automatic forfeiture with no remedy'' or ''no consequence at all,'' both of which are oversimplified extremes.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('be9a1c81-7a0e-4c8c-803d-4d0e7156a57f', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 84, 'A patient with a permanent nephrostomy tube (for a chronic ureteral obstruction from prior pelvic radiation, non-cancer related fibrosis) has the home health nurse perform routine, scheduled tube maintenance/flushing with no complications. Select the correct coding for this routine encounter.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('123452d7-3961-4b0f-8202-42f98e0dcccc', 'be9a1c81-7a0e-4c8c-803d-4d0e7156a57f', 0, 'N13.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('82062eb1-bb4d-4065-8d7a-a3e538373074', 'be9a1c81-7a0e-4c8c-803d-4d0e7156a57f', 1, 'Z43.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('97d16c86-bfd6-47ef-93f5-3bcbf455402b', 'be9a1c81-7a0e-4c8c-803d-4d0e7156a57f', 2, 'T83.098A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('253b9744-aa23-4f49-997d-2f3fe76d6165', 'be9a1c81-7a0e-4c8c-803d-4d0e7156a57f', 3, 'N99.89');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('be9a1c81-7a0e-4c8c-803d-4d0e7156a57f', '82062eb1-bb4d-4065-8d7a-a3e538373074', 'Z43.6 (encounter for attention to other artificial openings of urinary tract — the specific aftercare code for nephrostomy tube care) mirrors the Z43.5 cystostomy-aftercare pattern established earlier in this paper — routine, uncomplicated, scheduled device maintenance is captured by the appropriate Z43 aftercare code, not the underlying obstructive condition (N13.30, which would be the reason FOR the nephrostomy but isn''t what this specific encounter is coded to when it''s purely routine maintenance) or a complication code (T83.098A, which would incorrectly imply a problem occurred, contradicted by the stem''s explicit ''no complications'' documentation).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('35bd4332-a506-453a-8940-6218210d50a3', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 85, 'A patient with congestive heart failure has an implanted left ventricular assist device (LVAD) as destination therapy (not a bridge to transplant), on home health for driveline exit-site care and INR monitoring. The nurse identifies redness and mild purulent drainage at the driveline exit site, confirmed by the physician as a driveline infection. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a3897987-d3bc-44e2-a1c7-850afde35282', '35bd4332-a506-453a-8940-6218210d50a3', 0, 'T82.7XXA, Z95.811');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f9f6bdb0-1c4a-4c3b-9cd2-9480d09549cd', '35bd4332-a506-453a-8940-6218210d50a3', 1, 'I50.9, T82.7XXA, Z95.811');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('73a399ac-b4ef-440b-9546-162c9a3c11b6', '35bd4332-a506-453a-8940-6218210d50a3', 2, 'T82.7XXA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('47b428e8-20d9-43f6-82d3-c508cf318b83', '35bd4332-a506-453a-8940-6218210d50a3', 3, 'Z95.811, T82.7XXA');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('35bd4332-a506-453a-8940-6218210d50a3', 'a3897987-d3bc-44e2-a1c7-850afde35282', 'T82.7XXA (infection and inflammatory reaction due to cardiac and vascular devices, implants and grafts — the same broad cardiac-device-infection code family used correctly for pacemaker pocket infections in Paper 8) is sequenced first as the active, currently-treated complication. Z95.811 (presence of heart assist device) is added as the device-status code — I50.9 (heart failure) is not separately re-added here since the acute focus of THIS specific encounter is the device infection, and the underlying heart failure that necessitated the LVAD is already implicitly represented by the ongoing device-status code, consistent with the principle tested in Paper 8''s CABG/native-CAD question that a device fully addressing (rather than merely mitigating) an underlying condition doesn''t always require the original disease code re-stated at every subsequent device-related encounter, particularly when device status itself is the more clinically relevant status marker for this specific complication.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('06a2245a-f71c-4015-acb5-895c0d9f1c1a', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 86, 'A patient with chronic pain from failed back surgery syndrome has a spinal cord stimulator implanted for pain management. The home health nurse identifies the stimulator''s spinal cord electrode (lead) has migrated from its original position, confirmed by imaging, requiring surgical revision. Select the correct coding for this specific finding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c4b0032d-3b30-477e-9ad0-3cc0e250f681', '06a2245a-f71c-4015-acb5-895c0d9f1c1a', 0, 'T85.122A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bf87db9c-f021-40c3-85c9-68adb326c506', '06a2245a-f71c-4015-acb5-895c0d9f1c1a', 1, 'T85.113A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('31aa67cf-0fdc-4139-9586-1deaca06819a', '06a2245a-f71c-4015-acb5-895c0d9f1c1a', 2, 'M96.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bb154f94-068f-43aa-a2cf-573c2d2c06a2', '06a2245a-f71c-4015-acb5-895c0d9f1c1a', 3, 'T85.79XA');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('06a2245a-f71c-4015-acb5-895c0d9f1c1a', 'c4b0032d-3b30-477e-9ad0-3cc0e250f681', 'T85.122A (displacement of implanted electronic neurostimulator of spinal cord electrode (lead), initial encounter) is the precise, dedicated code for lead migration specifically at the spinal cord electrode — the T85.1- neurostimulator-complication family distinguishes BREAKDOWN (T85.11x, mechanical failure of the device itself) from DISPLACEMENT (T85.12x, the lead/electrode physically moving out of position), and further distinguishes by component (generator vs. peripheral nerve electrode vs. spinal cord electrode). T85.113A (breakdown of the generator component) would misclassify migration as a functional failure of the wrong component entirely. M96.1 (postlaminectomy syndrome, an unrelated code for a different condition) and T85.79XA (infection, not applicable since no infection is documented) are both wrong complication types.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b88ef2b1-dc49-4e30-94d3-5bced6d1464e', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 87, 'A patient with a recent below-knee amputation is fitted with a new prosthetic limb. During a home health PT visit, the patient reports the prosthetic socket has become a poor fit, causing skin irritation, due to recent significant weight loss changing the residual limb''s size — no infection, no skin breakdown yet, just early irritation from friction. Select the correct coding for this finding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('29d41490-f250-435e-9df8-ce8e38fa87cf', 'b88ef2b1-dc49-4e30-94d3-5bced6d1464e', 0, 'T87.44');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1a50bedf-4d44-4091-86ba-c15cac89b9e4', 'b88ef2b1-dc49-4e30-94d3-5bced6d1464e', 1, 'Z44.129');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b0ccd4ba-43c7-4a72-b72c-bdb6ea8dc71a', 'b88ef2b1-dc49-4e30-94d3-5bced6d1464e', 2, 'L98.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fa4c684c-d800-47b8-9f50-c10dabb73c22', 'b88ef2b1-dc49-4e30-94d3-5bced6d1464e', 3, 'T87.42');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b88ef2b1-dc49-4e30-94d3-5bced6d1464e', '1a50bedf-4d44-4091-86ba-c15cac89b9e4', 'Z44.129 (encounter for fitting and adjustment of other lower limb prosthetic device — used here since the actual clinical issue is that the prosthetic needs REFITTING/adjustment due to a changed residual limb, not a wound or infection requiring its own diagnosis code) is the most appropriate code — T87.44 (infection of amputation stump) doesn''t apply since no infection is documented, and T87.42 (a different, non-infection stump complication code) is a less precise match than the fitting/adjustment encounter code when the core issue is genuinely a sizing/fit problem prompting adjustment, not yet a distinct diagnosable stump complication. L98.9 (unspecified skin disorder) would under-code the more specific, correctly-identified fitting-related etiology.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ce807e9b-6b34-4312-9b49-fa1c51b5d725', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 88, 'A patient with a history of pulmonary embolism 2 years ago (fully treated, off anticoagulation per physician decision after the standard treatment course) now presents with NEW acute shortness of breath and pleuritic chest pain, and the physician orders urgent evaluation to rule out a new, recurrent PE. Should the OLD, resolved PE be coded differently at this specific encounter compared to the DVT-history and PE-history questions used as pattern examples earlier in this exam series?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e2318a08-7e86-4a79-9792-4a79e2284dea', 'ce807e9b-6b34-4312-9b49-fa1c51b5d725', 0, 'Yes — because a NEW PE is now specifically being actively ruled out (not simply a stable, unrelated encounter where the history is background context), the old PE''s history code (Z86.711) remains appropriately used as relevant risk-factor history, while the CURRENT acute symptom workup would use its own presenting-symptom codes (e.g., R06.02 shortness of breath, R07.9 chest pain) until/unless a new PE is confirmed, at which point a new, separate active PE code would be added');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0776b8d7-dac5-45dc-82bc-3904d611965e', 'ce807e9b-6b34-4312-9b49-fa1c51b5d725', 1, 'The old PE should automatically be re-coded as I26.99 (active PE) again, since PE has a tendency to recur');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d7d373cf-8c2f-4580-a67a-3093e5afe83f', 'ce807e9b-6b34-4312-9b49-fa1c51b5d725', 2, 'No coding is needed for either the history or the current symptoms until the workup is fully complete');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('75b37910-83f1-4349-8641-28889c39ea92', 'ce807e9b-6b34-4312-9b49-fa1c51b5d725', 3, 'The history code becomes invalid and must be removed the moment new symptoms suggestive of PE occur');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ce807e9b-6b34-4312-9b49-fa1c51b5d725', 'e2318a08-7e86-4a79-9792-4a79e2284dea', 'This question asks the candidate to apply the established history-code principle (Paper 7''s DVT/PE history questions) to a MORE clinically tense scenario — an old, resolved PE remains coded as history (Z86.711) even when a NEW, currently-unconfirmed possible recurrence is being actively worked up, since the history code accurately reflects the OLD event and remains genuinely relevant risk-factor context; the CURRENT presenting symptoms get their own symptom codes until/unless the new PE is actually confirmed, at which point a new, separate, ACTIVE PE code (I26.99 or more specific) would be added — the old history code is not simply flipped back to active status based on suspicion alone, and is not invalidated simply because new symptoms are being investigated.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d4b9db1e-5f8e-41db-9822-273d25196f0f', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 89, 'A patient with schizophrenia and co-occurring severe caffeine use (10+ cups of coffee daily) develops caffeine-induced anxiety and tachycardia, confirmed by the physician as directly due to excessive caffeine intake. Does ICD-10-CM have a specific caffeine-related diagnosis code applicable here?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d63210cf-e97d-44fd-8786-08af112c354d', 'd4b9db1e-5f8e-41db-9822-273d25196f0f', 0, 'F15.980 (other stimulant use, unspecified, with stimulant-induced anxiety disorder) — caffeine is coded within the broader ''other stimulant'' (F15) category in ICD-10-CM, since there is no separate, dedicated ''caffeine use disorder'' chapter distinct from this broader stimulant category');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('589b5cd5-fb3b-4c76-9d52-831565a467fa', 'd4b9db1e-5f8e-41db-9822-273d25196f0f', 1, 'No code exists for any caffeine-related condition in ICD-10-CM');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b2fdd16a-c109-494e-b388-71c31e57c09e', 'd4b9db1e-5f8e-41db-9822-273d25196f0f', 2, 'F10.980 (alcohol-induced anxiety disorder — incorrectly applied here)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6afe64fe-256e-41f4-8a31-bd68f1386fba', 'd4b9db1e-5f8e-41db-9822-273d25196f0f', 3, 'R45.0 alone, since caffeine effects are never coded as a distinct substance-related diagnosis');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d4b9db1e-5f8e-41db-9822-273d25196f0f', 'd63210cf-e97d-44fd-8786-08af112c354d', 'F15.980 (other stimulant use, unspecified, with stimulant-induced anxiety disorder) is correct — ICD-10-CM classifies caffeine-related diagnoses within the broader F15 ''other stimulant'' chapter (which also covers substances like amphetamines-adjacent stimulants not otherwise separately classified), rather than giving caffeine its own entirely separate dedicated chapter the way alcohol (F10), cannabis (F12), or opioids (F11) each have their own dedicated F1x chapter — this is a genuinely easy-to-miss structural fact, since caffeine is such a common, casually-regarded substance that candidates might assume ICD-10-CM doesn''t formally code caffeine-related conditions at all, when in fact a specific, correct code family does exist and should be used when clinically documented.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8b365280-6fd4-490d-aafe-4b3d9b5aa937', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 90, 'A patient''s home health agency wants to confirm: does a physician''s standing order (e.g., ''may increase acetaminophen up to 3g/day PRN for pain, per standing protocol'') eliminate the need for a new, specific physician order each time the nurse actually adjusts the dose within that pre-authorized range?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('62d9e87f-a1a8-416b-b451-48a922090176', '8b365280-6fd4-490d-aafe-4b3d9b5aa937', 0, 'No, a new specific order is required every single time any medication adjustment occurs, with no exceptions for standing orders');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('744744d8-fdd7-4590-8b0f-2a1ebad5107e', '8b365280-6fd4-490d-aafe-4b3d9b5aa937', 1, 'A properly authorized, specific standing order/protocol (clearly defining the parameters, such as the exact dose range and PRN conditions) can appropriately guide nursing action within those pre-defined parameters without requiring a brand-new discrete order for each individual instance within that range — but this differs from an open-ended change OUTSIDE the standing order''s defined parameters, which would still require new physician contact per the plan-of-care revision principle established throughout this exam series');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e8c69fe1-c8f0-4c3f-9c10-410786757a0f', '8b365280-6fd4-490d-aafe-4b3d9b5aa937', 2, 'Standing orders are never permitted under Medicare home health CoPs');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a1b8df57-3f70-4fb9-be74-f75f964080ff', '8b365280-6fd4-490d-aafe-4b3d9b5aa937', 3, 'Standing orders eliminate all physician involvement in medication management for the remainder of the certification period');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8b365280-6fd4-490d-aafe-4b3d9b5aa937', '744744d8-fdd7-4590-8b0f-2a1ebad5107e', 'A properly authorized standing order/protocol with clearly defined parameters can appropriately guide nursing action within those specific, pre-authorized bounds without requiring a new discrete order for every single instance — this is a genuine, common, and appropriate clinical practice tool, distinct from the plan-of-care-revision principle tested repeatedly in this exam series (which specifically concerns changes OUTSIDE what''s already been ordered/authorized) — a nurse increasing a PRN dose within an already-authorized standing-order range is following the existing order, not making an unauthorized change requiring new physician contact, while any adjustment outside those defined parameters would still trigger the standard physician-contact requirement.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a9723b97-ee0a-4976-81e3-c5435353d424', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 91, 'A patient with type 2 diabetes has diabetic retinopathy, confirmed by ophthalmology as proliferative (based on neovascularization and a vitreous hemorrhage finding on exam), in the right eye, without macular edema. Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('72de1f4b-171d-4157-bc83-e021d6ab6601', 'a9723b97-ee0a-4976-81e3-c5435353d424', 0, 'E11.359, H43.13');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('92e44e9b-60b9-4793-a8be-fa4a45006125', 'a9723b97-ee0a-4976-81e3-c5435353d424', 1, 'E11.359');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a1ae5213-c8d3-4e2f-a16b-c6413cf517e4', 'a9723b97-ee0a-4976-81e3-c5435353d424', 2, 'E11.3591');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c6acecb3-77fe-4345-83ad-da2989f70d3a', 'a9723b97-ee0a-4976-81e3-c5435353d424', 3, 'E11.319, H43.13');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a9723b97-ee0a-4976-81e3-c5435353d424', 'a1ae5213-c8d3-4e2f-a16b-c6413cf517e4', 'E11.3591 (type 2 diabetes with proliferative diabetic retinopathy without macular edema, right eye) is correct — but note the E11.35x code family''s digit structure is actually organized around proliferative-vs-nonproliferative status and macular-edema presence/absence, NOT around vitreous hemorrhage as its own separate coded element; vitreous hemorrhage is simply one of the clinical exam findings that can establish ''proliferative'' staging in the first place, already implicit in the code once ''proliferative'' is selected, rather than a separately distinguished digit within this family. A separately stacked H43.13 (vitreous hemorrhage, right eye) is not needed for the same non-redundant-combination-code principle tested throughout this exam series, since the proliferative-retinopathy diagnosis already reflects that severity tier. E11.359 (missing the laterality digit) and E11.319 (nonproliferative, the wrong severity tier) would both be less complete or incorrect matches.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('546b4bc1-a251-49da-8e99-522ab33f7af7', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 92, 'A patient with congestive heart failure and chronic kidney disease stage 4, both well-documented as separately coexisting (no hypertensive combination-code relationship documented — hypertension itself is not even present in this patient''s history), is admitted to home health. The physician''s note separately mentions the patient has cardiorenal syndrome, type 2 (chronic cardiorenal, meaning chronic heart failure leading to progressive chronic kidney dysfunction). Does ''cardiorenal syndrome'' change the coding approach here?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9ea2305f-717b-4565-a40d-01367b57eaa0', '546b4bc1-a251-49da-8e99-522ab33f7af7', 0, 'Yes — I50.9 and N18.4 remain separately coded (as they would without the cardiorenal syndrome label), since ICD-10-CM does not have a single dedicated ''cardiorenal syndrome'' combination code distinct from coding the heart failure and CKD separately; the cardiorenal relationship is captured in narrative documentation, not a single combination code');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('91f2e4fc-5bc6-4af9-9cf6-b590b193cd79', '546b4bc1-a251-49da-8e99-522ab33f7af7', 1, 'Yes — a single, dedicated cardiorenal syndrome combination code must replace both I50.9 and N18.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f4fd449a-ab47-4e43-8eb2-6058e4afae04', '546b4bc1-a251-49da-8e99-522ab33f7af7', 2, 'No additional consideration is needed; cardiorenal syndrome automatically defaults to the I13 hypertensive combination family regardless of documented hypertension status');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('635079c9-68ee-4e80-b143-2faf757593a3', '546b4bc1-a251-49da-8e99-522ab33f7af7', 3, 'Cardiorenal syndrome must be coded as an adverse drug effect');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('546b4bc1-a251-49da-8e99-522ab33f7af7', '9ea2305f-717b-4565-a40d-01367b57eaa0', 'This mirrors the malnutrition/pressure-injury and OCD/dermatitis non-existent-combination-code pattern tested elsewhere in this exam series — ''cardiorenal syndrome'' is a genuine, clinically meaningful descriptive concept (type 2 specifically describing the chronic heart-failure-causing-chronic-CKD pattern), but ICD-10-CM does not have one single dedicated code replacing the separate heart failure and CKD codes; I50.9 (or a more specific heart failure code if type/acuity is documented) and N18.4 remain separately coded, with the cardiorenal relationship communicated through clinical narrative documentation. The I13 hypertensive combination family specifically requires documented hypertension, which this stem explicitly states is absent, ruling out option C''s automatic default.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a9d1543e-d563-4277-a7b5-cf493e9fffb7', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 93, 'A patient''s home health agency wants to understand: under PDGM, if a 30-day period''s principal diagnosis maps to the ''Wound'' clinical group, does this automatically mean the patient must have a pressure injury specifically, or can other wound types also map to this group?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b3858457-c3ca-4479-8dc7-211d6232f443', 'a9d1543e-d563-4277-a7b5-cf493e9fffb7', 0, 'Only pressure injuries map to the Wound clinical group; all other wound types map to different groups');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dcee8bd2-0dcc-457c-bfb1-33ed1bd59a06', 'a9d1543e-d563-4277-a7b5-cf493e9fffb7', 1, 'The Wound clinical group is broader than pressure injuries alone — it can include various wound-related principal diagnoses (e.g., surgical wounds, certain traumatic wounds, other chronic ulcers) that CMS has mapped into this group, not exclusively pressure injury diagnoses');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('523d0291-079d-4c45-a992-66503a186473', 'a9d1543e-d563-4277-a7b5-cf493e9fffb7', 2, 'The Wound clinical group was eliminated in a recent PDGM update and no longer exists');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('77f010ca-3d4e-4816-8d63-982b59d56bfc', 'a9d1543e-d563-4277-a7b5-cf493e9fffb7', 3, 'Clinical group assignment for wounds depends on wound size in square centimeters, not diagnosis code');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a9d1543e-d563-4277-a7b5-cf493e9fffb7', 'dcee8bd2-0dcc-457c-bfb1-33ed1bd59a06', 'PDGM''s ''Wound'' clinical group is broader than pressure injuries specifically — CMS''s principal-diagnosis-to-clinical-group mapping includes a range of wound-related diagnoses (surgical wounds, certain traumatic wounds, various chronic ulcer types, not exclusively pressure injuries) that fall into this group, reflecting that the clinical resource needs driving home health wound care aren''t limited to one specific wound etiology — this tests whether a candidate over-narrows their understanding of a PDGM clinical group''s actual scope based on the most commonly-discussed example (pressure injuries) rather than the group''s full defined breadth.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b64f5751-fbbe-417b-bdb9-a7c5632d0218', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 94, 'A patient''s home health agency documentation for a psychiatric nursing visit describes only ''patient counseled'' with no further detail on the specific content, techniques used, or patient response. Applying the documentation-specificity theme tested throughout this exam series to psychiatric nursing specifically, is this sufficient to support skilled psychiatric nursing coverage?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4fbb85f5-ef12-404a-bcbe-d5eea326fc53', 'b64f5751-fbbe-417b-bdb9-a7c5632d0218', 0, 'Yes, since psychiatric visits are inherently different from physical skilled nursing and don''t require the same documentation specificity');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('af03630f-5013-48c1-a7ab-0b4fd9ebd82a', 'b64f5751-fbbe-417b-bdb9-a7c5632d0218', 1, 'No — the same documentation-specificity principle applies to psychiatric nursing as to any other skilled service: the note should reflect the SPECIFIC skilled intervention provided (e.g., specific therapeutic technique, safety assessment findings, medication education content, and the patient''s specific response), not merely a generic statement that counseling occurred');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dd2e6a9a-10f9-4549-a8bb-a39ea29448f1', 'b64f5751-fbbe-417b-bdb9-a7c5632d0218', 2, 'Psychiatric nursing documentation requirements are governed by entirely separate rules with no connection to the general skilled-nursing documentation standard');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c1178653-d5dc-44a0-a9a3-eb72eef1c63a', 'b64f5751-fbbe-417b-bdb9-a7c5632d0218', 3, 'Yes, as long as the visit lasted at least 30 minutes');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b64f5751-fbbe-417b-bdb9-a7c5632d0218', 'af03630f-5013-48c1-a7ab-0b4fd9ebd82a', 'This applies the documentation-specificity principle (Paper 8 Q42, this paper''s lab-draw-only-visit and vague-wound-note questions) to psychiatric home health nursing specifically — there is no exemption for psychiatric visits from the general requirement that documentation reflect the actual specific skilled intervention provided and the patient''s response to it; ''patient counseled'' alone, without specifying the therapeutic content, technique, or observed response, is just as vague and just as much a coverage-support risk as a generic ''wound cleaned and redressed'' note, testing whether a candidate incorrectly assumes psychiatric documentation is exempt from this general principle.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9b35b6dd-ea1e-412a-a736-89fdbcbfc78c', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 95, 'A patient with a recent hip fracture repair develops a surgical site seroma (fluid collection, sterile, no infection), confirmed by ultrasound, requiring aspiration by the surgeon, now home for continued wound monitoring. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('802addb0-e305-481e-ae2e-750dabfee025', '9b35b6dd-ea1e-412a-a736-89fdbcbfc78c', 0, 'T81.31XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4b179e25-bb18-44e1-b351-3079d9fce031', '9b35b6dd-ea1e-412a-a736-89fdbcbfc78c', 1, 'T81.40XA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('64c7267f-eab1-4163-9295-5bd168bdf493', '9b35b6dd-ea1e-412a-a736-89fdbcbfc78c', 2, 'L76.34');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2b70296f-3dcb-4b32-ac4f-aa00a8b7b91e', '9b35b6dd-ea1e-412a-a736-89fdbcbfc78c', 3, 'T81.89XA');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9b35b6dd-ea1e-412a-a736-89fdbcbfc78c', '64c7267f-eab1-4163-9295-5bd168bdf493', 'L76.34 (postprocedural seroma of skin and subcutaneous tissue following other procedure — ''other'' since a hip fracture repair is an orthopedic, not dermatologic, procedure, distinguishing it from L76.33''s dermatologic-procedure-specific code) is the correct, specific code for a documented sterile postoperative seroma. T81.31XA (disruption of external operation wound) is a distractor describing a different mechanical complication (wound separation, not a fluid collection). T81.40XA (infection, unspecified) is explicitly ruled out by the sterile/non-infected documentation. T81.89XA (other complications of procedures, not elsewhere classified) would under-code the documented, specifically diagnosable seroma when the dedicated L76.3x code family is available and matches.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2d6193d7-9b16-4d54-93d1-17f7b002861b', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 96, 'A patient''s home health agency wants confirmation: can a single home health episode include patients receiving BOTH Medicare-covered skilled services AND separately private-pay (non-covered) additional services (e.g., extra private-duty aide hours beyond what Medicare covers), within the same episode of care?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb0c0310-79df-43c0-b005-fcdb3181ab38', '2d6193d7-9b16-4d54-93d1-17f7b002861b', 0, 'No, mixing Medicare-covered and private-pay services within the same patient''s care is never permitted under any circumstance');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e63eae07-34bd-4564-8594-3706bb40d95d', '2d6193d7-9b16-4d54-93d1-17f7b002861b', 1, 'Yes, this is permissible, provided the agency maintains clear documentation distinguishing which services are billed to Medicare as covered, medically necessary skilled care versus which are separately arranged, disclosed, and billed as private-pay, avoiding any inappropriate cost-shifting or improper billing of non-covered services to Medicare');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('346f19ad-6c58-41c2-9813-d8b1e4356194', '2d6193d7-9b16-4d54-93d1-17f7b002861b', 2, 'Yes, but only if the private-pay services are provided by a completely different, unrelated agency');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c5caae3b-ebc6-4a50-bab1-562afe4825c9', '2d6193d7-9b16-4d54-93d1-17f7b002861b', 3, 'Private-pay services automatically disqualify the patient from any Medicare coverage for the remainder of the certification period');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2d6193d7-9b16-4d54-93d1-17f7b002861b', 'e63eae07-34bd-4564-8594-3706bb40d95d', 'An agency may appropriately furnish both Medicare-covered skilled services and separately arranged private-pay services to the same patient within the same general episode of care, provided there is clear, transparent documentation and billing distinguishing the two — Medicare-covered services must be genuinely medically necessary and appropriately billed as such, while private-pay services are separately disclosed and billed directly to the patient, without any inappropriate cost-shifting (e.g., billing Medicare for services that don''t meet coverage criteria, using Medicare billing to subsidize non-covered add-on services) — this is a real, common, and permissible arrangement, not an absolute prohibition, not a requirement to use a separate agency, and does not disqualify the patient from otherwise-legitimate Medicare coverage.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('982c13e8-cb92-4d6e-bdc9-83e3625d3bdc', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 97, 'A patient with type 2 diabetes and diabetic peripheral neuropathy is found by the home health nurse to have a new callus on the plantar surface of the right foot with early skin breakdown underneath, confirmed by the physician as a pre-ulcerative lesion (not yet a full-thickness ulcer). Select the correct coding, distinguishing this from the full diabetic-foot-ulcer questions used elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('74d7097a-9634-4df4-a817-4c8c2d667acb', '982c13e8-cb92-4d6e-bdc9-83e3625d3bdc', 0, 'E11.628, L84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b7c60dba-7583-4e56-bad4-3513dfbfd01d', '982c13e8-cb92-4d6e-bdc9-83e3625d3bdc', 1, 'E11.621, L97.512');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7a14d82d-00aa-4368-b03b-c66f858bb6d5', '982c13e8-cb92-4d6e-bdc9-83e3625d3bdc', 2, 'E11.628, L97.512');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d3255176-5603-4240-9ed8-cb322c03d2fe', '982c13e8-cb92-4d6e-bdc9-83e3625d3bdc', 3, 'E11.9, L84');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('982c13e8-cb92-4d6e-bdc9-83e3625d3bdc', '74d7097a-9634-4df4-a817-4c8c2d667acb', 'E11.628 (type 2 diabetes with other skin complications — the same code family used for diabetic dermopathy earlier in this paper, appropriately broad enough to cover this pre-ulcerative callus-with-early-breakdown finding) is used since this is explicitly NOT yet a full-thickness ulcer (which would use the E11.621/L97.5xx diabetic-foot-ulcer combination pattern used correctly elsewhere in this exam series) — this tests whether a candidate correctly distinguishes a pre-ulcerative lesion from an actual ulcer, since using the ulcer-specific combination code here would over-code the documented severity. L84 (corns and callosities) is added as the specific callus finding — this is a single, complete billable code with no further laterality or site subdivision in current ICD-10-CM. E11.9 (diabetes, unspecified complications) would under-code the documented skin-specific complication.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('13e4cbb2-1422-433e-b7d3-b89007f92049', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 98, 'A patient''s home health agency policy requires a second RN co-signature on all high-risk medication administration records (e.g., insulin, anticoagulants) as an internal quality control measure, beyond what CoPs strictly require. A surveyor notes one instance where this internal policy wasn''t followed (single-nurse signature only, no co-sign), though the medication was correctly administered with no adverse event. Is this necessarily a CoP violation?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5c6d56da-fec4-4a8e-a472-73d6e30d19f7', '13e4cbb2-1422-433e-b7d3-b89007f92049', 0, 'Yes, automatically, since any deviation from written agency policy is by definition also a CoP violation');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('83c7424a-d444-4518-9857-bc9e164f46a8', '13e4cbb2-1422-433e-b7d3-b89007f92049', 1, 'Not necessarily — while failing to follow the agency''s OWN internal policy is a genuine quality/consistency concern worth addressing, it is not automatically the same as violating a specific federal CoP requirement unless that particular co-signature practice is itself independently mandated by a specific CoP provision, which this scenario doesn''t establish');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('139fb27a-7852-4b52-b6ec-4978be9de026', '13e4cbb2-1422-433e-b7d3-b89007f92049', 2, 'No, internal agency policies are irrelevant to survey findings under any circumstance');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5b2a4873-639c-4120-bfac-d48980bc365a', '13e4cbb2-1422-433e-b7d3-b89007f92049', 3, 'This can never be assessed by a surveyor since it''s an internal policy, not a regulation');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('13e4cbb2-1422-433e-b7d3-b89007f92049', '83c7424a-d444-4518-9857-bc9e164f46a8', 'This tests a genuinely important distinction: an agency''s own internal policies (often exceeding the federal CoP floor, like a stricter co-signature requirement here) are worth following for quality/consistency reasons, and a surveyor MAY note a deviation from an agency''s own stated policy as relevant to broader quality assessment — but failing to follow an agency''s own more-stringent internal policy is not automatically equivalent to violating a specific federal CoP requirement, unless that specific practice happens to independently be mandated by an actual CoP provision — this distinguishes ''good internal practice not followed'' from ''federal regulatory violation,'' two related but legally distinct concepts, avoiding both extremes (automatic equivalence, or complete irrelevance) presented in the other options.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3faf7b70-01eb-4a45-81fc-2bb8d00a792d', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 99, 'A patient with congestive heart failure is found by the home health nurse to have a new S3 heart sound on auscultation, a finding the nurse documents and reports to the physician as potentially significant. Does an S3 heart sound finding alone, without further physician diagnostic conclusion, warrant its own separate ICD-10-CM code at this specific visit?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c589fefd-788e-4039-ad8e-d5b0eb3dd491', '3faf7b70-01eb-4a45-81fc-2bb8d00a792d', 0, 'Yes — an S3 finding is documented in the visit note as a clinical observation supporting the medical necessity and skilled nature of the assessment and the physician contact that followed, but does not itself require a separate ICD-10-CM code absent further physician diagnostic interpretation; the existing heart failure diagnosis code remains the relevant diagnosis code for this encounter');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f4ed4bc3-b1e2-423d-9a49-ae7f60740da0', '3faf7b70-01eb-4a45-81fc-2bb8d00a792d', 1, 'Yes, R01.1 (cardiac murmur, unspecified) must always be added whenever any new heart sound is auscultated');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a9080c84-5dd3-4d63-9fa3-aa3929df3e72', '3faf7b70-01eb-4a45-81fc-2bb8d00a792d', 2, 'No, physical exam findings are never documented at all in home health nursing notes');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('02e26f7a-c8db-4fe3-87ad-c4df70bfb91e', '3faf7b70-01eb-4a45-81fc-2bb8d00a792d', 3, 'The S3 finding requires an immediate new SOC OASIS assessment');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3faf7b70-01eb-4a45-81fc-2bb8d00a792d', 'c589fefd-788e-4039-ad8e-d5b0eb3dd491', 'This applies the finding-vs-diagnosis distinction established earlier in this paper (the CHF weight-gain question, Q11) to a physical exam finding specifically — a new S3 heart sound is a genuine, clinically meaningful skilled-assessment finding worth documenting (supporting both medical necessity of the visit and the physician contact that followed), but it is not itself an ICD-10-CM diagnosis code requiring separate coding absent the physician''s own diagnostic interpretation of its significance; R01.1 (cardiac murmur) is also the wrong finding entirely — an S3 is a heart SOUND finding, not a murmur, a distinction a candidate should recognize rather than reflexively reaching for the nearest-sounding cardiac auscultation code. No new SOC is triggered by a routine assessment finding within an ongoing episode.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1a95342c-2fc0-413e-9dc1-e3caa974617f', 'c38f1507-76ee-429c-8a12-fa6eed4b4b51', 100, 'A patient''s home health agency is reviewing its overall approach to this exam''s two most frequently repeated principles across all three papers (7, 8, and 9): the adverse-effect-vs-poisoning distinction, and the resolved-condition-vs-still-active-chronic-condition distinction. Which single fact most reliably distinguishes an ADVERSE EFFECT from a POISONING, regardless of which specific drug or clinical scenario is involved?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c419fa81-d972-4143-a0d3-ee4a0c0e98e4', '1a95342c-2fc0-413e-9dc1-e3caa974617f', 0, 'Whether the resulting harm was severe enough to require hospitalization');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('011a8647-fda5-4e7f-ab72-cd35efe60950', '1a95342c-2fc0-413e-9dc1-e3caa974617f', 1, 'Whether the medication was taken exactly as prescribed (correct drug, correct dose, correct route) — if so, any resulting unintended harm is an adverse effect; if the drug was taken in error, in excess, or with harmful intent, it is poisoning');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('84003284-61cf-4a19-ac16-7572a677e8bf', '1a95342c-2fc0-413e-9dc1-e3caa974617f', 2, 'Whether the patient is elderly or has multiple comorbidities');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('faa350e5-45aa-4212-9aaf-4084550a823a', '1a95342c-2fc0-413e-9dc1-e3caa974617f', 3, 'Whether the drug was a controlled substance');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1a95342c-2fc0-413e-9dc1-e3caa974617f', '011a8647-fda5-4e7f-ab72-cd35efe60950', 'This closing question deliberately distills the single most repeated, highest-yield distinction across this entire three-paper set: adverse effect vs. poisoning hinges entirely on whether the medication was taken exactly as prescribed — correct drug, correct dose, correct route — with the resulting harm being unintended despite correct use (adverse effect), versus the drug being taken in error, in excess of what was prescribed, or with harmful intent (poisoning, further subdivided by intent: accidental, intentional self-harm, assault, or undetermined). Severity of harm, patient age/comorbidity burden, and controlled-substance status are all irrelevant to this specific classification — a correctly-dosed, appropriately-prescribed medication causing a severe, hospitalization-requiring reaction is still an adverse effect, not poisoning, exactly as tested repeatedly across all three papers in this series.');

-- ---------- Paper 10: BCHH-C Practice Paper 10 ----------
INSERT INTO question_papers (id, slug, title, exam_type, focus_tags, question_count, difficulty, is_premium, sort_order)
VALUES ('a5bd0f94-2fc9-47e9-9d99-15158832dc47', 'bchhc-practice-10', 'BCHH-C Practice Paper 10', 'bchhc', ARRAY['Comprehensive Simulation', 'Dermatology', 'Cardiomyopathy\Endocarditis', 'Oncology Sequencing', 'CoP\PDGM']::TEXT[], 100, 'advanced', true, 10);
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('acbfb8dc-dd62-4f56-84bf-f665d392dad1', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 1, 'A patient with longstanding plaque psoriasis develops new psoriatic arthritis, confirmed by rheumatology with joint erosions on imaging, requiring a new biologic agent managed in coordination with home health medication teaching. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9579dfc9-a6b2-411d-8658-c33e796bac06', 'acbfb8dc-dd62-4f56-84bf-f665d392dad1', 0, 'L40.50, L40.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bd543f55-e2c1-41f1-94b3-21a5e5a2ba8b', 'acbfb8dc-dd62-4f56-84bf-f665d392dad1', 1, 'L40.50');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('89350e0d-e709-4cb7-b4c7-565ca7cb11ad', 'acbfb8dc-dd62-4f56-84bf-f665d392dad1', 2, 'M06.9, L40.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('056b963d-3d43-4bfb-bae0-524fb6ec0df5', 'acbfb8dc-dd62-4f56-84bf-f665d392dad1', 3, 'L40.0, M06.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('acbfb8dc-dd62-4f56-84bf-f665d392dad1', 'bd543f55-e2c1-41f1-94b3-21a5e5a2ba8b', 'L40.50 (arthropathic psoriasis, unspecified) is a single combination code that already captures both the psoriasis AND the psoriatic arthritis together — L40.0 (psoriasis vulgaris, the plaque-only skin code) is not separately added, since it would be redundant once the arthropathic combination code is used, mirroring the non-redundant-combination-code principle established repeatedly across this exam series (Crohn''s/fistula, diabetes/gastroparesis in Paper 7). M06.9 (rheumatoid arthritis, unspecified) is the wrong disease entirely — this is psoriatic, not rheumatoid, arthritis; ICD-10-CM classifies all psoriasis-related joint disease (including psoriatic arthritis) exclusively under the L40.5x combination-code family, not under the M05-M07 inflammatory-arthropathy chapter.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('acd54e55-baf1-47dc-a442-98cb530b7019', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 2, 'A patient with severe, longstanding fibromyalgia has widespread chronic pain significantly limiting function, confirmed by rheumatology per tender-point criteria, requiring a structured home-based pain management and gentle conditioning program. Select the correct coding, distinguishing this from a general chronic-pain symptom code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('30386c86-082f-4107-b2ba-ace2628a939d', 'acd54e55-baf1-47dc-a442-98cb530b7019', 0, 'M79.7');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('959eaa70-a59a-426a-99f6-436586f88404', 'acd54e55-baf1-47dc-a442-98cb530b7019', 1, 'R52');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b8626f85-cabc-4394-a22e-83fbaf1fcd35', 'acd54e55-baf1-47dc-a442-98cb530b7019', 2, 'M79.7, R52');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a568fdf7-4ba9-43c9-8e8c-7921d848c1ff', 'acd54e55-baf1-47dc-a442-98cb530b7019', 3, 'G93.31');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('acd54e55-baf1-47dc-a442-98cb530b7019', '30386c86-082f-4107-b2ba-ace2628a939d', 'M79.7 (fibromyalgia) is the specific, confirmed diagnosis code — R52 (pain, unspecified, a nonspecific symptom code) is not separately needed and would actually be inappropriate to add alongside the more specific, already-diagnosed condition, per the same principle tested with the lumbar-spinal-stenosis-vs-R52-equivalent question in Paper 7 (M48.061 alone, not stacked with a generic pain symptom code). G93.31 (postviral fatigue syndrome, a different, distinct diagnosis characterized by post-infectious fatigue rather than widespread musculoskeletal pain) is the wrong condition entirely — fibromyalgia and chronic fatigue syndrome are related but clinically and diagnostically distinct conditions, a distinction this question specifically tests.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('291a3424-6149-4c3a-9635-4be20df7db3b', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 3, 'A patient with dilated cardiomyopathy, confirmed by echocardiogram to be non-ischemic in origin (no significant coronary artery disease on recent catheterization), has resulting chronic combined systolic and diastolic heart failure. Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f2b513c7-b89f-4a48-9e33-f76a0d635906', '291a3424-6149-4c3a-9635-4be20df7db3b', 0, 'I42.0, I50.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dc593624-25c5-4d3b-9256-245aab560bf2', '291a3424-6149-4c3a-9635-4be20df7db3b', 1, 'I42.0, I50.42');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7879b38c-a723-4dd1-8cd2-fc6f1b1211ad', '291a3424-6149-4c3a-9635-4be20df7db3b', 2, 'I25.5, I50.42');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0e2b8986-c10a-4f60-9c06-1d4951923498', '291a3424-6149-4c3a-9635-4be20df7db3b', 3, 'I42.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('291a3424-6149-4c3a-9635-4be20df7db3b', 'dc593624-25c5-4d3b-9256-245aab560bf2', 'I42.0 (dilated cardiomyopathy) is sequenced first as the specific, confirmed structural heart disease diagnosis — I25.5 (ischemic cardiomyopathy) is explicitly ruled out by the stem''s documentation of a non-ischemic origin with no significant CAD. I50.42 (chronic combined systolic and diastolic heart failure) precisely matches the documented combined heart failure type — I50.9 (heart failure, unspecified) would under-code the documented specific combined type, the same precision-matching principle tested with the I50.22/I50.32 questions in Papers 7 and 8.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4228e5ff-17c3-425d-b1d0-4cfd43e83a7a', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 4, 'A patient with a bicuspid aortic valve (a congenital anomaly, discovered incidentally in adulthood) develops infective endocarditis of that valve, confirmed by blood cultures growing viridans group streptococcus, requiring 6 weeks of home IV antibiotics. Select the correct, complete coding, addressing whether the congenital valve anomaly changes the coding approach compared to the prosthetic-valve endocarditis question tested elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0e5dbad0-b956-4125-b474-64aa12cc976a', '4228e5ff-17c3-425d-b1d0-4cfd43e83a7a', 0, 'I33.0, B95.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f89128c3-d36b-44c9-abd4-306831f95eb5', '4228e5ff-17c3-425d-b1d0-4cfd43e83a7a', 1, 'Q23.1, I33.0, B95.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('327e5048-e414-45e5-b8d0-04316639918e', '4228e5ff-17c3-425d-b1d0-4cfd43e83a7a', 2, 'T82.6XXA, I33.0, B95.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cec8ed09-905b-44ff-9e5f-2944bb869d28', '4228e5ff-17c3-425d-b1d0-4cfd43e83a7a', 3, 'I33.0, Q23.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4228e5ff-17c3-425d-b1d0-4cfd43e83a7a', 'f89128c3-d36b-44c9-abd4-306831f95eb5', 'I33.0 (acute and subacute infective endocarditis) is sequenced first as the active, currently-treated condition. Q23.1 (congenital insufficiency of aortic valve — the closest standard congenital-anomaly code family for a bicuspid aortic valve) is added as a relevant, genuinely present congenital status, since the anomaly is a lifelong structural condition (mirroring the Down syndrome principle from Paper 7: congenital conditions are coded as present for the patient''s whole life, not converted to history). T82.6XXA (infection due to cardiac valve PROSTHESIS) is explicitly wrong here — unlike the Paper 7 prosthetic-valve endocarditis question, this is the patient''s own native (congenitally abnormal, but native) valve, not an implanted prosthesis, so the device-infection code family doesn''t apply at all. B95.4 (other streptococcus as the cause of disease classified elsewhere) identifies the confirmed organism.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('acfda5ee-a7f0-4319-a62e-929bd379b756', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 5, 'A patient with severe atopic dermatitis (eczema) has widespread skin involvement with secondary bacterial infection, confirmed by wound culture growing MSSA, requiring topical and oral antibiotic therapy coordinated with home health skin care. Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c97bddd4-0d1d-4ab0-9328-e755128cfcfe', 'acfda5ee-a7f0-4319-a62e-929bd379b756', 0, 'L20.9, L08.9, B95.61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f2db2934-8ea1-47be-b2d2-6d51f5b249fd', 'acfda5ee-a7f0-4319-a62e-929bd379b756', 1, 'L20.9, B95.61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('68f988d4-1a51-44cd-b558-4cfb1ec8d24a', 'acfda5ee-a7f0-4319-a62e-929bd379b756', 2, 'L20.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f74c3a13-dd16-4c75-ac8e-4687bc017bb0', 'acfda5ee-a7f0-4319-a62e-929bd379b756', 3, 'L08.9, B95.61, L20.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('acfda5ee-a7f0-4319-a62e-929bd379b756', 'c97bddd4-0d1d-4ab0-9328-e755128cfcfe', 'L20.9 (atopic dermatitis, unspecified) is sequenced first as the underlying chronic skin condition. L08.9 (local infection of skin and subcutaneous tissue, unspecified — used here as the general secondary-infection code, since ICD-10-CM does not have a single dedicated combination code merging atopic dermatitis with a secondary bacterial infection the way some other skin/disease combinations exist) is added for the documented secondary infection. B95.61 (MSSA as the causal organism) identifies the confirmed organism. This tests whether a candidate correctly recognizes that NOT every disease-plus-complication pairing has a dedicated combination code — sometimes, as here, two conditions are genuinely coded separately even when clinically related, a distinction reinforced repeatedly across this exam series (COPD+GERD in Paper 9, hypertension+hyperlipidemia+angina in Paper 7).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b382c793-b8b8-43bc-8e92-4053e32fae55', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 6, 'A patient has metastatic breast cancer (left breast, treated 3 years ago with mastectomy, no evidence of local recurrence) with a NEW finding of brain metastasis, confirmed by MRI, causing new-onset seizures now being managed at home with anticonvulsants. Select the correct, complete coding, distinguishing the active brain metastasis from the resolved primary breast cancer.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4b2922b4-5f6d-438c-90b8-19cbb31ce279', 'b382c793-b8b8-43bc-8e92-4053e32fae55', 0, 'C50.912, C79.31, G40.909');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('41fde806-3df5-4f76-aef2-1d97350a7176', 'b382c793-b8b8-43bc-8e92-4053e32fae55', 1, 'Z85.3, C79.31, G40.909');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7873fbce-a04d-4d8d-bb72-e556ad78ff71', 'b382c793-b8b8-43bc-8e92-4053e32fae55', 2, 'C50.912, C79.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d3a3b278-6d56-41e7-becd-d8e0ff3929e3', 'b382c793-b8b8-43bc-8e92-4053e32fae55', 3, 'Z85.3, C79.31');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b382c793-b8b8-43bc-8e92-4053e32fae55', '41fde806-3df5-4f76-aef2-1d97350a7176', 'Z85.3 (personal history of malignant neoplasm of breast) is used since the primary breast cancer has been surgically treated with no evidence of local recurrence — the same active-vs-history distinction established in Paper 7''s original metastatic breast cancer question (C50.912 would incorrectly code the primary as still active). C79.31 (secondary malignant neoplasm of brain) is the active, currently-relevant metastatic site. G40.909 (epilepsy, unspecified, not intractable, without status epilepticus — the same baseline seizure-disorder code established in Paper 8) is added for the new seizure activity, since new-onset seizures requiring ongoing anticonvulsant management represent a genuine, separately codable neurological complication, not simply an inherent, non-codable manifestation of the brain metastasis the way some symptom-integral-to-diagnosis patterns work elsewhere in this exam series.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('63214ca6-8198-4c84-86c6-f66b4f9dae78', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 7, 'A patient with ALS (amyotrophic lateral sclerosis), rapidly progressive, has a NEW finding of aspiration pneumonia, physician-documented as directly caused by ALS-related bulbar dysfunction (progressive weakness of swallowing muscles). Select the correct, complete coding, contrasting with the Parkinson''s-aspiration-pneumonia question tested elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('48d44527-5a5f-4102-85c3-faa0e1be654a', '63214ca6-8198-4c84-86c6-f66b4f9dae78', 0, 'G12.21, J69.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7a4c4084-4312-436b-a9c8-a38affe5aa88', '63214ca6-8198-4c84-86c6-f66b4f9dae78', 1, 'J69.0, G12.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c7eba6a1-7908-4639-a02d-ca6caaf31b0b', '63214ca6-8198-4c84-86c6-f66b4f9dae78', 2, 'G12.21, R13.10, J69.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('41eb0270-1284-42ba-a354-3ba03bdfb4fb', '63214ca6-8198-4c84-86c6-f66b4f9dae78', 3, 'J69.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('63214ca6-8198-4c84-86c6-f66b4f9dae78', '48d44527-5a5f-4102-85c3-faa0e1be654a', 'G12.21 (amyotrophic lateral sclerosis) is sequenced first as the root underlying neurological disease, matching the identical sequencing and non-redundant-symptom-code pattern established with the Parkinson''s-aspiration-pneumonia question in Paper 9 — J69.0 (pneumonitis due to inhalation of food and vomit) follows directly, without a separately stacked R13.10 (dysphagia symptom code), since the dysphagia/bulbar dysfunction is explicitly documented as the causal mechanism linking ALS to the aspiration pneumonia rather than an independently significant finding requiring its own code. This question deliberately mirrors the Parkinson''s version to reinforce that the same non-redundant-symptom-code principle applies across different underlying neurological diagnoses, not just the one specific disease it was first introduced with.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ddf23d11-082e-4964-98c9-45482c3244c7', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 8, 'A patient with a recent ischemic stroke (4 months ago, acute phase resolved) has confirmed residual right-sided hemiparesis, documented by the physician as affecting the patient''s dominant (right-handed) side. Select the correct coding, contrasting with the left-sided, dominance-unspecified hemiplegia question tested elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('38effd85-ff18-45ea-8f59-709662c018a4', 'ddf23d11-082e-4964-98c9-45482c3244c7', 0, 'I63.9, G81.91');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7f30044f-7763-4a6d-b988-6a6750b5c3a0', 'ddf23d11-082e-4964-98c9-45482c3244c7', 1, 'I69.351');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('02608283-6e1e-4ed2-b27e-058c270a68be', 'ddf23d11-082e-4964-98c9-45482c3244c7', 2, 'I69.359');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9ab56d52-016b-45c5-b206-63b28c969238', 'ddf23d11-082e-4964-98c9-45482c3244c7', 3, 'I63.9, I69.351');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ddf23d11-082e-4964-98c9-45482c3244c7', '7f30044f-7763-4a6d-b988-6a6750b5c3a0', 'I69.351 (hemiplegia and hemiparesis following cerebral infarction, affecting right dominant side) is the correct, complete sequela code — since the acute stroke phase has fully resolved, I63.9 (acute cerebral infarction, an ACTIVE-phase code) is not used, following the same acute-vs-sequela distinction established with the aphasia/hemiparesis question in Paper 7. Unlike that earlier question (where dominance was unspecified and defaulted per convention to ''nondominant'' for an undocumented left-sided deficit), THIS stem explicitly documents both the right side AND that the patient is right-hand dominant, directly supporting the ''dominant side'' 6th-character selection (I69.351) rather than requiring any default-dominance inference. I69.359 (unspecified side) would under-code the explicitly documented laterality and dominance.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e256f99f-b7e7-44b3-a377-15d58dd21b05', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 9, 'A patient with severe COPD has chronic respiratory failure with documented hypoxia (not hypercapnia), now with a NEW acute-on-chronic decompensation requiring urgent home oxygen escalation and physician notification. Select the correct combination code, contrasting the acute-on-chronic respiratory failure family with the purely chronic version tested elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('293128ad-0353-4279-ae44-742fbcd264c0', 'e256f99f-b7e7-44b3-a377-15d58dd21b05', 0, 'J96.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8aac937b-4de6-4556-ad8a-c51da0e3700d', 'e256f99f-b7e7-44b3-a377-15d58dd21b05', 1, 'J96.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('39d98d76-e726-493e-8b12-da5a47bf2ad9', 'e256f99f-b7e7-44b3-a377-15d58dd21b05', 2, 'J96.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('921b7c18-db37-4646-818e-e41fce7f13b7', 'e256f99f-b7e7-44b3-a377-15d58dd21b05', 3, 'J96.11, J96.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e256f99f-b7e7-44b3-a377-15d58dd21b05', '8aac937b-4de6-4556-ad8a-c51da0e3700d', 'J96.21 (acute and chronic respiratory failure with hypoxia) is the specific combination code capturing a NEW acute decompensation layered on the patient''s baseline chronic respiratory failure — this parallels the acute-on-chronic heart failure pattern (I50.23, I50.33) tested repeatedly across this exam series, applied here to the respiratory failure code family instead. J96.11 (purely chronic respiratory failure with hypoxia, no acute component) would under-code the documented new acute decompensation. J96.01 (acute respiratory failure with hypoxia, with no chronic component specified) would fail to capture the documented pre-existing chronic baseline — the acute-ON-chronic combination code (J96.21) is required when both the new acute event AND the underlying chronic condition are simultaneously documented, matching the exact combination described in this stem.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fd9ead7e-de22-462a-b72e-52c3bad80ef1', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 10, 'A patient with chronic kidney disease stage 3a is found to have both anemia of CKD (confirmed as CKD-caused, no other identified cause) AND hypomagnesemia (physician-documented as multifactorial, not specifically CKD-caused). Select the correct, complete coding, addressing whether both electrolyte/hematologic findings follow the same sequencing convention.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d1a7f658-6ba8-4aa9-aa76-8b06d9aa4a1d', 'fd9ead7e-de22-462a-b72e-52c3bad80ef1', 0, 'N18.31, D63.1, E83.42');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cdde75aa-cab4-4d46-add2-8c6c43ce3010', 'fd9ead7e-de22-462a-b72e-52c3bad80ef1', 1, 'D63.1, N18.31, E83.42');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e893c73a-44ed-442e-9ed1-f14d0f8838e7', 'fd9ead7e-de22-462a-b72e-52c3bad80ef1', 2, 'N18.31, E83.42, D63.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9cbd6b4b-203e-4ba8-92d0-22e313b6d4d8', 'fd9ead7e-de22-462a-b72e-52c3bad80ef1', 3, 'E83.42, N18.31, D63.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fd9ead7e-de22-462a-b72e-52c3bad80ef1', 'd1a7f658-6ba8-4aa9-aa76-8b06d9aa4a1d', 'N18.31 (CKD stage 3a) is sequenced first per D63.1''s own ''code first CKD'' instructional note, the same etiology-first sequencing rule established repeatedly in this exam series (Paper 7 Q28, Paper 9''s renal osteodystrophy question). D63.1 (anemia in chronic kidney disease) follows as the CKD-caused manifestation. E83.42 (hypomagnesemia) is added last as a separately-documented, NOT CKD-specifically-caused finding — since it doesn''t carry the same ''code first CKD'' instructional note that D63.1 does (hypomagnesemia in CKD isn''t one of ICD-10-CM''s mandatory etiology/manifestation combination pairs the way anemia-in-CKD is), it''s simply added as an independently coded, coexisting finding, testing whether a candidate correctly recognizes that not every CKD-associated lab abnormality carries the identical mandatory-sequencing convention.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('856fe941-ef27-4ffa-a362-103f77aea4f5', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 11, 'A patient with prediabetes (confirmed by HbA1c in the prediabetic range, not yet meeting diagnostic criteria for type 2 diabetes) is admitted to home health for diabetes-prevention lifestyle coaching and weight management. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9c55afb7-c0d5-4145-a0b5-b1235d9ac04e', '856fe941-ef27-4ffa-a362-103f77aea4f5', 0, 'E11.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4d682b7c-ba50-4e38-8109-552dd0cd68cb', '856fe941-ef27-4ffa-a362-103f77aea4f5', 1, 'R73.03');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0ada67bf-53d9-4920-acc7-a3320a40a7ab', '856fe941-ef27-4ffa-a362-103f77aea4f5', 2, 'R73.09');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('999c3ba6-3982-4275-af88-57274dec40dd', '856fe941-ef27-4ffa-a362-103f77aea4f5', 3, 'E11.65');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('856fe941-ef27-4ffa-a362-103f77aea4f5', '4d682b7c-ba50-4e38-8109-552dd0cd68cb', 'R73.03 (prediabetes) is the specific, correct code for confirmed prediabetes — E11.9 (type 2 diabetes, unspecified complications) and E11.65 (type 2 diabetes with hyperglycemia) would both incorrectly code this as an actual diabetes diagnosis, which the stem explicitly states has NOT yet been met (''not yet meeting diagnostic criteria''); this is a genuinely important distinction, since prediabetes and diabetes are clinically and diagnostically distinct states requiring different codes, not simply different severities of the same code. R73.09 (other abnormal glucose, a less specific, different finding code) would under-code the documented specific prediabetes diagnosis when the dedicated R73.03 code is available and matches.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('806c5c2e-f622-4922-8028-b6e27f455489', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 12, 'A patient with type 2 diabetes on a sulfonylurea develops hypoglycemia, physician-documented as directly due to the correctly-dosed medication combined with the patient having skipped a meal (patient''s own dietary lapse, not a dosing error). Select the correct coding approach, addressing whether the patient''s meal-skipping changes the adverse-effect-vs-poisoning classification.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('540ea6de-5d32-4ab1-ad06-facdb9a09add', '806c5c2e-f622-4922-8028-b6e27f455489', 0, 'T38.3X1A, E11.649');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('180babe5-0357-4edd-9350-59aa95097b5b', '806c5c2e-f622-4922-8028-b6e27f455489', 1, 'T38.3X5A, E11.649');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a23b3e9e-1b01-4bb1-99ba-b449e2034264', '806c5c2e-f622-4922-8028-b6e27f455489', 2, 'E11.649, T38.3X5A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f01cbedb-8be6-4279-8078-fdfdd3af90b9', '806c5c2e-f622-4922-8028-b6e27f455489', 3, 'T38.3X5A, E11.649, Z91.198');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('806c5c2e-f622-4922-8028-b6e27f455489', '180babe5-0357-4edd-9350-59aa95097b5b', 'T38.3X5A (adverse effect of insulin and oral hypoglycemic drugs, initial encounter) is sequenced first per the adverse-effect convention — the patient''s own dietary lapse (skipping a meal) does NOT change the classification from adverse effect to poisoning, since poisoning specifically requires an error in how the DRUG ITSELF was used (wrong dose, wrong drug, wrong route), not an unrelated behavioral/dietary factor that happened to contribute to the drug''s effect being more pronounced; the medication itself was still taken exactly as prescribed. E11.649 (type 2 diabetes with hypoglycemia without coma) follows as the resulting manifestation. This tests whether a candidate incorrectly expands the definition of ''dosing error'' to include any contributing patient behavior, rather than correctly limiting it to errors in the medication''s own use.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('81344f08-e208-41e1-b474-2e870cac9b49', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 13, 'A patient with confirmed antiphospholipid syndrome (a hereditary/acquired hypercoagulable state) develops a new right lower-extremity DVT, confirmed by ultrasound to be in the proximal deep veins, with the physician documenting the hypercoagulable syndrome as a significant contributing risk factor. Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('09284191-12e6-4e5b-8473-9563954a5c5b', '81344f08-e208-41e1-b474-2e870cac9b49', 0, 'I82.4Y1, D68.61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e7d9a72d-c7af-4e3b-b8c7-61856e1483a9', '81344f08-e208-41e1-b474-2e870cac9b49', 1, 'D68.61, I82.4Y1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('18f17da2-b548-4595-bdf6-35ef090a77a4', '81344f08-e208-41e1-b474-2e870cac9b49', 2, 'I82.4Z1, D68.61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('587fe5cb-8191-471f-88d9-68cf01160e74', '81344f08-e208-41e1-b474-2e870cac9b49', 3, 'I82.4Y1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('81344f08-e208-41e1-b474-2e870cac9b49', '09284191-12e6-4e5b-8473-9563954a5c5b', 'I82.4Y1 (acute embolism and thrombosis of unspecified deep veins of right PROXIMAL lower extremity) is sequenced first as the acute, currently-treated finding — matching the documented proximal location specifically, not I82.4Z1 (the DISTAL deep vein code, wrong anatomic level for this stem''s documentation). D68.61 (antiphospholipid syndrome) is added as the significant, documented contributing hypercoagulable condition — this mirrors the diabetic-ulcer-with-PAD pattern (contributing vascular condition added after the primary acute finding) established in Paper 7, applied here to a hypercoagulable-state-contributing-to-DVT context instead.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('309e0460-a05d-4834-a8ff-5563e5356067', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 14, 'A patient with chronic atrial fibrillation, confirmed by the physician as persistent (not paroxysmal, not permanent) type, is on home health for anticoagulation monitoring and rate control medication management. Select the correct, most specific coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1b7e2578-b6d4-4803-bb54-1e7c702dbf90', '309e0460-a05d-4834-a8ff-5563e5356067', 0, 'I48.91');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('170c6175-e32c-44d7-bea1-86828d61a6e7', '309e0460-a05d-4834-a8ff-5563e5356067', 1, 'I48.19');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f003c820-eedd-4241-aa82-dd183b70481c', '309e0460-a05d-4834-a8ff-5563e5356067', 2, 'I48.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c838fc1f-9323-47f9-a413-4c54c651a5e2', '309e0460-a05d-4834-a8ff-5563e5356067', 3, 'I48.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('309e0460-a05d-4834-a8ff-5563e5356067', '170c6175-e32c-44d7-bea1-86828d61a6e7', 'I48.19 (other persistent atrial fibrillation) precisely matches the documented specific AFib type — I48.91 (unspecified atrial fibrillation) would under-code the documented ''persistent'' specificity when a more precise code is available and directly matches. I48.20 (chronic atrial fibrillation, unspecified — a distractor referring to the broader chronic-but-unspecified-subtype family) is less precise than I48.19''s specific persistent-type match. I48.0 (paroxysmal atrial fibrillation) is the wrong specific type, explicitly ruled out by the stem''s documentation.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('84718353-91f5-44c2-86df-9467b49ea817', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 15, 'A home health agency''s discharge planning process must, per CoP requirements, address the patient''s need for post-discharge services. If a patient is being discharged from home health because they now qualify for and need a higher level of care (e.g., skilled nursing facility placement), what must the discharge summary and process specifically address, beyond the routine goal-achievement discharge process tested elsewhere in this exam series?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fc7ee961-4d3d-4e8e-97cb-24a724ed4d86', '84718353-91f5-44c2-86df-9467b49ea817', 0, 'Nothing different — all discharges use the exact identical process regardless of destination');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6b20b636-2484-4f41-9595-37fb3eac0248', '84718353-91f5-44c2-86df-9467b49ea817', 1, 'The discharge planning process must specifically address the transfer of relevant clinical information to the receiving level of care, coordination of the transition, and the clinical rationale supporting the need for the higher level of care — a facility-transfer discharge has genuine additional coordination requirements beyond a routine goal-achievement discharge');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('96a2f91e-c949-43c5-9796-1fb2c725d354', '84718353-91f5-44c2-86df-9467b49ea817', 2, 'The agency has no further responsibility once a higher level of care is identified as needed');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('00ea0558-d42b-4c97-bf60-8e33ec9fccba', '84718353-91f5-44c2-86df-9467b49ea817', 3, 'Only the patient''s family, not the agency, is responsible for coordinating the transition to a higher level of care');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('84718353-91f5-44c2-86df-9467b49ea817', '6b20b636-2484-4f41-9595-37fb3eac0248', 'This extends the discharge-planning principle established across this exam series (Paper 7''s discharge-against-medical-advice question, Paper 9''s goal-achievement and private-pay-transition discharge questions) to a facility-transfer scenario specifically — a discharge for a higher level of care genuinely requires more than the routine goal-achievement discharge process: specifically, coordinating transfer of relevant clinical information to the receiving facility, coordinating the actual transition logistics, and documenting the clinical rationale supporting the need for escalated care — this is a real, meaningfully different process from a routine discharge, not identical, and remains the agency''s affirmative responsibility, not something that ends once the need is identified or that shifts entirely to family.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8024fdc7-db58-4640-8914-7356b9ce326a', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 16, 'A home health patient''s OASIS at SOC documents M1033 (Risk for Hospitalization) and separately, the clinical team implements a specific care-planning intervention (increased visit frequency, telehealth monitoring) in direct response to the identified risk factors. Six weeks later, the patient is NOT hospitalized. Does this outcome, by itself, prove the OASIS risk assessment or the resulting interventions were effective?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6f17f2b1-da43-429e-9494-fcbb14298db4', '8024fdc7-db58-4640-8914-7356b9ce326a', 0, 'Yes, definitively — no hospitalization within any timeframe following a risk assessment always proves the assessment and interventions were effective');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('070a145a-2974-489d-803c-4ba2be9de6fd', '8024fdc7-db58-4640-8914-7356b9ce326a', 1, 'Not definitively on its own — while a lack of hospitalization is a positive outcome consistent with effective risk mitigation, it cannot be attributed with certainty to the specific assessment/intervention without further analysis (the patient may not have been at genuinely high risk of hospitalization regardless, or hospitalization avoidance could reflect other unmeasured factors), which is why quality programs use aggregate outcome trends and risk-adjustment methods rather than single-patient outcomes to evaluate intervention effectiveness');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0953320d-df6a-40fd-9b58-846ce75bd612', '8024fdc7-db58-4640-8914-7356b9ce326a', 2, 'OASIS risk assessments have no relationship to hospitalization outcomes at all');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('435ffa8c-9886-4539-ac58-d610685222ec', '8024fdc7-db58-4640-8914-7356b9ce326a', 3, 'Only a formal randomized controlled trial can ever establish whether a specific home health intervention was effective');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8024fdc7-db58-4640-8914-7356b9ce326a', '070a145a-2974-489d-803c-4ba2be9de6fd', 'This tests a genuinely important quality-measurement and clinical-reasoning concept: a single favorable outcome (no hospitalization) following a risk assessment and intervention does not, by itself, definitively prove causation or effectiveness — this is a basic but frequently overlooked distinction between correlation/anecdote and demonstrated effectiveness, which is exactly why home health quality programs and CMS outcome measures rely on aggregate, risk-adjusted trends across many patients rather than single-case outcomes to evaluate whether risk-assessment-driven interventions are genuinely effective, without requiring the unrealistic standard of a formal RCT for every clinical practice.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fbfef515-34f9-47b9-8521-f5b893172dad', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 17, 'A patient with alcoholic cirrhosis, without documented ascites, has NEW esophageal varices, confirmed by endoscopy with active bleeding requiring hospitalization, now home for continued monitoring and beta-blocker therapy for rebleed prevention. Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0f561acf-82c2-4e81-83dc-e6a627c5d6ac', 'fbfef515-34f9-47b9-8521-f5b893172dad', 0, 'K70.31, I85.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c2c64706-1943-43a5-ae36-9ca78a86e7c1', 'fbfef515-34f9-47b9-8521-f5b893172dad', 1, 'I85.01, K70.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ed4f4bff-ef21-47f8-b548-902d95e2195f', 'fbfef515-34f9-47b9-8521-f5b893172dad', 2, 'K70.30, I85.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('adf89d70-41d5-474b-9a2f-8a1fb866685d', 'fbfef515-34f9-47b9-8521-f5b893172dad', 3, 'I85.00, K70.31');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fbfef515-34f9-47b9-8521-f5b893172dad', 'c2c64706-1943-43a5-ae36-9ca78a86e7c1', 'I85.01 (esophageal varices with bleeding) is sequenced first as the acute, currently-relevant bleeding complication that prompted hospitalization and remains the focus of ongoing home monitoring — matching the documented active bleeding on endoscopy, not I85.00 (varices without bleeding, which would under-code the documented hemorrhage). K70.30 (alcoholic cirrhosis of liver without ascites) follows as the underlying structural liver disease, matching this stem''s documentation, which does not mention ascites — K70.31 (with ascites) would incorrectly add a finding not actually documented here, testing whether a candidate carries over the ''with ascites'' variant from memory of a similar-sounding scenario rather than checking what this specific stem actually documents.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('70c42934-080d-4bcd-925e-ba2109efee6f', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 18, 'A patient with alpha-1 antitrypsin deficiency (confirmed by genetic testing) has BOTH the expected pulmonary manifestation (early-onset emphysema) AND a separately documented liver manifestation (cirrhosis), both attributed by the physician to the same underlying genetic condition. Select the correct, complete coding reflecting both organ manifestations.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('096e077b-a51c-42d3-8fbd-6ac3408c13ee', '70c42934-080d-4bcd-925e-ba2109efee6f', 0, 'E88.01, J43.9, K74.60');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fa258aba-e3c4-4766-a11a-90246c6f903e', '70c42934-080d-4bcd-925e-ba2109efee6f', 1, 'J43.9, K74.60, E88.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d85d97c2-e8ea-4064-8795-921c473cd1c4', '70c42934-080d-4bcd-925e-ba2109efee6f', 2, 'E88.01, K74.60, J43.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('74256511-abf6-4bca-8acb-2cd6e1f3fbea', '70c42934-080d-4bcd-925e-ba2109efee6f', 3, 'K74.60, J43.9, E88.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('70c42934-080d-4bcd-925e-ba2109efee6f', '096e077b-a51c-42d3-8fbd-6ac3408c13ee', 'E88.01 (alpha-1 antitrypsin deficiency) is sequenced first per the ''code first'' etiology convention established with the identical condition in Paper 8 (Q95, alpha-1-antitrypsin-related COPD) — the confirmed genetic diagnosis is the root cause driving both organ manifestations. J43.9 (emphysema, unspecified) and K74.60 (unspecified cirrhosis of liver) both follow as the two separately documented, distinct-organ-system manifestations of the same underlying genetic condition — unlike some combination-code relationships tested elsewhere in this series, alpha-1 antitrypsin deficiency doesn''t have single combination codes merging it with each specific organ manifestation, so both manifestation codes are added separately after the etiology code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ff9559e7-b1c7-4218-a086-e92846c140fc', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 19, 'A patient with a recent coronary artery stent placement (2 weeks ago) develops in-stent restenosis, confirmed by repeat catheterization, causing recurrent angina, now home for medication optimization pending decision on repeat intervention. Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fd36d359-5e46-4af5-8d5c-1e90822dc733', 'ff9559e7-b1c7-4218-a086-e92846c140fc', 0, 'I25.10, Z95.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a5b4d227-bd53-452c-85b8-61ee93e33a9c', 'ff9559e7-b1c7-4218-a086-e92846c140fc', 1, 'T82.855A, Z95.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ad5b1f5b-3bbf-49d5-bff8-209d3211a373', 'ff9559e7-b1c7-4218-a086-e92846c140fc', 2, 'T82.855A, I25.10, Z95.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6722daf3-5a62-4dda-8df8-13bf3d7c81f2', 'ff9559e7-b1c7-4218-a086-e92846c140fc', 3, 'I21.4, T82.855A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ff9559e7-b1c7-4218-a086-e92846c140fc', 'a5b4d227-bd53-452c-85b8-61ee93e33a9c', 'T82.855A (stenosis of coronary artery stent, initial encounter) is the specific, dedicated device-complication code that already captures the documented in-stent restenosis finding directly — I25.10 (atherosclerotic heart disease without angina, a general CAD code) is not separately needed alongside the more specific stent-stenosis code, since T82.855A already conveys the coronary disease process at the stented site; adding a second, more generic CAD code would be redundant, matching the non-redundant-combination-code principle established repeatedly across this exam series. Z95.5 (presence of coronary angioplasty implant and graft) is added as the device-status code. I21.4 (NSTEMI, an ACUTE myocardial infarction code) is wrong entirely — recurrent angina from restenosis is not the same as a new acute MI, which isn''t documented in this stem.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b516afe8-4cfa-4abc-bf4e-4a86ef943839', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 20, 'A patient with morbid obesity (BMI 42) has confirmed obstructive sleep apnea, diagnosed by home sleep study, requiring CPAP therapy coordinated by home health respiratory therapy, distinct from the obesity hypoventilation syndrome tested elsewhere in this exam series. Select the correct, complete coding, contrasting these two related but distinct obesity-associated respiratory conditions.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('020bf345-366a-4470-b9a9-70cff273ac16', 'b516afe8-4cfa-4abc-bf4e-4a86ef943839', 0, 'G47.33, E66.01, Z68.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bf215d66-0f37-4b2a-b4f8-86de7120401e', 'b516afe8-4cfa-4abc-bf4e-4a86ef943839', 1, 'G47.36, E66.01, Z68.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('35bc43c5-59dc-4c53-b4f9-a71870dae455', 'b516afe8-4cfa-4abc-bf4e-4a86ef943839', 2, 'E66.01, G47.33, Z68.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2a4dffbf-d03b-4973-b0d0-650a5925a2b8', 'b516afe8-4cfa-4abc-bf4e-4a86ef943839', 3, 'G47.33, R06.83, E66.01');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b516afe8-4cfa-4abc-bf4e-4a86ef943839', '020bf345-366a-4470-b9a9-70cff273ac16', 'G47.33 (obstructive sleep apnea) is the correct, specific diagnosis for THIS stem''s sleep-study-confirmed OSA — a mechanical, anatomic upper-airway obstruction condition — deliberately contrasted with G47.36 (sleep-related hypoventilation, the code used for obesity hypoventilation syndrome in Paper 7''s Q37, a distinct condition driven by chronically inadequate ventilation rather than airway obstruction); this pair of similar-sounding but clinically and code-wise distinct obesity-associated respiratory conditions tests whether a candidate correctly distinguishes them rather than defaulting to the previously-seen G47.36 code from memory. E66.01 (morbid obesity due to excess calories) is added as the underlying etiological condition, and Z68.41 (BMI 40.0-44.9) reports the specific documented BMI category, both per the same obesity-documentation convention established in Paper 7. R06.83 (snoring, a nonspecific symptom) would under-code the documented, sleep-study-confirmed OSA diagnosis.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c1c3b960-95c8-4b74-99f5-c4529d437bb3', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 21, 'A patient with generalized anxiety disorder is found by the home health nurse to have excessive, persistent worry specifically and exclusively focused on having a serious undiagnosed illness, despite repeated medical reassurance and negative workups, documented by the physician as a distinct, separate diagnosis from the GAD. Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('43c62eaf-f3ac-4dc3-ba2c-b289cad918b7', 'c1c3b960-95c8-4b74-99f5-c4529d437bb3', 0, 'F41.1, F45.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('298b5035-6293-4840-9a26-7fbec5d5e6f6', 'c1c3b960-95c8-4b74-99f5-c4529d437bb3', 1, 'F45.21, F41.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1408b93b-7798-4893-9905-58366fa14662', 'c1c3b960-95c8-4b74-99f5-c4529d437bb3', 2, 'F41.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('00af26e2-538c-4f44-bc27-6843265087bd', 'c1c3b960-95c8-4b74-99f5-c4529d437bb3', 3, 'F41.1, R45.89');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c1c3b960-95c8-4b74-99f5-c4529d437bb3', '298b5035-6293-4840-9a26-7fbec5d5e6f6', 'F45.21 (hypochondriasis — illness anxiety disorder) is sequenced first as the newly diagnosed, distinctly documented condition specifically driving this concern, matching the same ''two distinct, separately diagnosed conditions coded together'' pattern established with the GAD/panic-disorder question in Paper 7 (Q75) — the physician has explicitly documented this as a separate diagnosis from the GAD, not merely a symptom of it. F41.1 (generalized anxiety disorder) follows as the pre-existing, separate condition. R45.89 (other symptoms and signs involving emotional state, a nonspecific symptom code) would under-code the documented specific, diagnosable illness-anxiety condition.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7e6ad531-51eb-493e-93bb-5ba5be0c3e00', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 22, 'A patient with chronic migraine, confirmed by neurology as migraine WITH aura, currently not intractable and without status migrainosus, is on home health for medication management and trigger-avoidance education. Select the correct, most specific coding, distinguishing migraine from a nonspecific headache symptom code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5ca5d0e0-6610-4059-b282-4b7c7d20dc78', '7e6ad531-51eb-493e-93bb-5ba5be0c3e00', 0, 'R51.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1a68d69b-206c-4de1-9bfd-b59e84a6a4e7', '7e6ad531-51eb-493e-93bb-5ba5be0c3e00', 1, 'G43.909');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bb789063-67de-4814-bc8d-52cce3950e89', '7e6ad531-51eb-493e-93bb-5ba5be0c3e00', 2, 'G43.109');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('870b3f58-b48c-4cb0-a41a-35dcae6a9e85', '7e6ad531-51eb-493e-93bb-5ba5be0c3e00', 3, 'G44.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7e6ad531-51eb-493e-93bb-5ba5be0c3e00', 'bb789063-67de-4814-bc8d-52cce3950e89', 'G43.109 (migraine with aura, not intractable, without status migrainosus) precisely matches the documented specific migraine subtype (with aura) and acuity status — G43.909 (migraine, unspecified — without the aura specificity) would under-code the documented ''with aura'' finding when the more precise code is available and matches. R51.9 (headache, unspecified, a nonspecific symptom code) would under-code the documented, neurologist-confirmed specific migraine diagnosis, mirroring the same specific-diagnosis-over-generic-symptom-code principle tested throughout this exam series. G44.1 (vascular headache, not elsewhere classified — a different, less specific headache classification) doesn''t apply once the more specific migraine-with-aura diagnosis is established.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0f95a5e8-c005-46be-955c-e4ef5d1b48c8', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 23, 'A patient with a recent stroke has confirmed residual short-term memory deficit, physician-documented as a direct sequela of the cerebral infarction, distinct from the aphasia and hemiparesis questions tested elsewhere in this exam series. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('36616370-9fad-45ce-bce3-35c1319bffe3', '0f95a5e8-c005-46be-955c-e4ef5d1b48c8', 0, 'I69.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f3261701-9fae-44a6-bd5c-b52effa827f9', '0f95a5e8-c005-46be-955c-e4ef5d1b48c8', 1, 'I69.311');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4fd435cb-9a91-445e-a1b0-02a674dabae5', '0f95a5e8-c005-46be-955c-e4ef5d1b48c8', 2, 'G31.84');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('94744cc0-da0b-4507-b5b0-88e3412070c6', '0f95a5e8-c005-46be-955c-e4ef5d1b48c8', 3, 'R41.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0f95a5e8-c005-46be-955c-e4ef5d1b48c8', 'f3261701-9fae-44a6-bd5c-b52effa827f9', 'I69.311 (memory deficit following cerebral infarction) is the specific stroke-sequela combination code for this exact residual deficit, following the same etiology-linked-code-over-generic-code principle established with the aphasia (I69.320) and dysarthria (I69.322, Paper 8) stroke-sequela codes — I69.90 (unspecified sequelae of unspecified cerebrovascular disease) would under-code the documented specific memory-deficit finding when the more precise code matches. G31.84 (mild cognitive impairment of uncertain or unknown etiology) is the wrong etiology entirely — this stem''s memory deficit has a confirmed, specific, documented stroke cause, not an uncertain one. R41.0 (disorientation, a nonspecific symptom code) would under-code the documented specific stroke-sequela diagnosis.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('34850ffe-a856-4db7-83be-cd5e1d8a2a3d', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 24, 'A patient with hypothyroidism, confirmed by the endocrinologist as severely undertreated for several months, develops a NEW depressive syndrome, physician-documented as directly due to the hypothyroidism itself (not a separate primary psychiatric diagnosis), improving as thyroid levels are corrected. Select the correct, complete coding, addressing whether this is coded as major depressive disorder or differently.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e3d9b8cb-9675-4725-91ac-abb23fbe2eac', '34850ffe-a856-4db7-83be-cd5e1d8a2a3d', 0, 'E03.9, F32.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d4b1bee0-bf1f-47e1-980b-1de914c3b35c', '34850ffe-a856-4db7-83be-cd5e1d8a2a3d', 1, 'F06.31, E03.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('730bd2eb-0f6c-4844-abff-90a8c1fbd622', '34850ffe-a856-4db7-83be-cd5e1d8a2a3d', 2, 'E03.9, F06.31');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a4998c82-bcd4-4f2d-b23f-adf60778ca1c', '34850ffe-a856-4db7-83be-cd5e1d8a2a3d', 3, 'E03.9, F32.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('34850ffe-a856-4db7-83be-cd5e1d8a2a3d', '730bd2eb-0f6c-4844-abff-90a8c1fbd622', 'E03.9 (hypothyroidism, unspecified) is sequenced first per the ''code first the underlying physiological condition'' convention required for F06 mood-disorder-due-to-known-physiological-condition codes. F06.31 (mood disorder due to known physiological condition, with depressive features) follows — this is NOT coded as F32.x (major depressive disorder), since F32 codes are reserved for primary psychiatric depressive disorder, while F06.31 is the specific, correct code when depression is documented as directly CAUSED by a diagnosed medical/physiological condition rather than being an independent primary psychiatric diagnosis; this is a genuinely important distinction many candidates miss, defaulting to the more commonly-tested F32/F33 family regardless of documented causation.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9a4af911-9237-45de-bd2d-797787d106ac', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 25, 'A patient with chronic venous hypertension has a documented venous stasis ulcer of the left lower extremity, confirmed by the physician as idiopathic (not attributable to varicose veins specifically), requiring compression therapy and wound care. Select the correct coding, distinguishing this from the varicose-veins-with-ulcer combination code tested elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('19c2e8fe-f438-475d-aa11-02e1d8a3f1bd', '9a4af911-9237-45de-bd2d-797787d106ac', 0, 'I87.312');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9f62666d-4c43-4448-a2bb-317ea33485b8', '9a4af911-9237-45de-bd2d-797787d106ac', 1, 'I83.012');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3bddfd64-be8d-4c50-8974-10f914f36002', '9a4af911-9237-45de-bd2d-797787d106ac', 2, 'I87.2, L97.922');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('13e464fd-8a07-4957-9002-d70c20d8056f', '9a4af911-9237-45de-bd2d-797787d106ac', 3, 'I87.312, L97.922');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9a4af911-9237-45de-bd2d-797787d106ac', '19c2e8fe-f438-475d-aa11-02e1d8a3f1bd', 'I87.312 (chronic venous hypertension (idiopathic) with ulcer of left lower extremity) is the specific, single combination code matching THIS stem''s documentation — idiopathic venous hypertension, not varicose-vein-caused — deliberately contrasted with I83.012 (varicose veins of left lower extremity with ulcer, the code used correctly in Paper 7''s Q30 for a varicose-vein-specific presentation), testing whether a candidate recognizes these as two different, specific etiology-matched combination codes rather than interchangeable. I87.2 plus a separate L97.922 ulcer-depth code would be redundant, since I87.312 already fully captures both the venous hypertension and its ulcer complication in one combination code, per the same non-redundant-combination-code principle established repeatedly in this exam series.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0d1fb328-5ac2-4406-a93e-123775e80614', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 26, 'A patient with type 2 diabetes and diabetic peripheral neuropathy develops cellulitis of the right great toe, confirmed by the physician as NOT associated with any documented ulcer or wound (intact skin, no break in the skin barrier identified). Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d4a22d83-51b0-4486-bbae-ef7125c39750', '0d1fb328-5ac2-4406-a93e-123775e80614', 0, 'E11.628, L03.031');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d824c31c-fa40-40af-8e7c-03a79af30f67', '0d1fb328-5ac2-4406-a93e-123775e80614', 1, 'E11.622, L03.031');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('14b8e175-57e9-459a-b5dc-4c6142311c5b', '0d1fb328-5ac2-4406-a93e-123775e80614', 2, 'L03.031, E11.628');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8e443973-f826-4526-8624-ddf2ce2f0323', '0d1fb328-5ac2-4406-a93e-123775e80614', 3, 'E11.628, A49.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0d1fb328-5ac2-4406-a93e-123775e80614', 'd4a22d83-51b0-4486-bbae-ef7125c39750', 'E11.628 (type 2 diabetes with other skin complications) is sequenced first, matching the same code used for diabetic dermopathy (Paper 8) and the pre-ulcerative callus finding (Paper 9) — NOT E11.622 (type 2 diabetes with other skin ulcer), since this stem explicitly documents intact skin with no ulcer/wound present, ruling out the ulcer-specific combination code. L03.031 (cellulitis of right toe) is added as the specific site-matched infection code — the laterality-and-digit-specific L03.03x family is more precise than a general foot-cellulitis code. A49.9 (bacterial infection, unspecified organism) would be a redundant, nonspecific addition when L03.031 already conveys the clinical diagnosis without a confirmed specific organism being documented in this stem.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c7976844-136f-474f-96fd-1c6507e66e48', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 27, 'A patient with moderate persistent asthma develops an acute exacerbation requiring nebulizer treatments and a short prednisone course, managed at home with close respiratory monitoring. Select the correct, most specific coding, contrasting with an unspecified-severity asthma code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('05797e89-5e12-4eac-90de-613816d993c3', 'c7976844-136f-474f-96fd-1c6507e66e48', 0, 'J45.909');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d584d4fa-d4d9-4ba4-b9f2-6d383305dc27', 'c7976844-136f-474f-96fd-1c6507e66e48', 1, 'J45.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6c201a62-ef72-4d42-9eba-61209f942178', 'c7976844-136f-474f-96fd-1c6507e66e48', 2, 'J45.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3ec25598-ead5-4f61-98f1-a3d06da32944', 'c7976844-136f-474f-96fd-1c6507e66e48', 3, 'J45.909, R06.02');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c7976844-136f-474f-96fd-1c6507e66e48', 'd584d4fa-d4d9-4ba4-b9f2-6d383305dc27', 'J45.41 (moderate persistent asthma with (acute) exacerbation) precisely matches the documented specific severity classification (moderate persistent) AND the documented acute exacerbation — J45.909 (unspecified asthma, uncomplicated — without the persistent-severity classification or exacerbation status) would significantly under-code the documented specificity. J45.21 (mild intermittent asthma with exacerbation) is the wrong severity classification, contradicted by the stem''s ''moderate persistent'' documentation. Adding R06.02 (shortness of breath) alongside J45.909 would still under-code relative to simply using the correct, fully specific J45.41 combination code in the first place.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('7195fbab-7266-440a-a9a7-34373a9961a8', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 28, 'A patient with GERD, confirmed by endoscopy to have esophagitis without bleeding, is on home health for medication management and dietary counseling. Select the correct, most specific coding, contrasting with GERD without esophagitis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c45176cf-5b49-4558-9486-701e43be54dd', '7195fbab-7266-440a-a9a7-34373a9961a8', 0, 'K21.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('01f974c4-c44c-4ef3-ae5c-98f210039867', '7195fbab-7266-440a-a9a7-34373a9961a8', 1, 'K21.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('60374ce6-8f00-45f1-9117-1396f1d5fb28', '7195fbab-7266-440a-a9a7-34373a9961a8', 2, 'K21.9, K21.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('77ea0f12-4d8c-4d2f-89d9-30749504964e', '7195fbab-7266-440a-a9a7-34373a9961a8', 3, 'K21.00, K21.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('7195fbab-7266-440a-a9a7-34373a9961a8', '01f974c4-c44c-4ef3-ae5c-98f210039867', 'K21.00 (gastro-esophageal reflux disease with esophagitis, without bleeding) precisely matches the documented endoscopy-confirmed esophagitis finding — K21.9 (GERD without esophagitis) would be the wrong, contradicting code, since esophagitis IS specifically documented here. Coding both K21.9 and K21.00 together would be internally contradictory (one explicitly states ''without esophagitis,'' the other ''with esophagitis'' — they describe mutually exclusive findings, not complementary ones), testing whether a candidate recognizes that these codes represent an either/or classification rather than stackable findings.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2aeb3143-9c61-496d-b933-290547dcd0a7', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 29, 'A patient with chronic gastritis develops an acute bleeding episode, confirmed by endoscopy, presenting with melena, requiring transfusion and now home for continued monitoring and iron repletion for the resulting blood-loss anemia. Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('91fcf4d0-f6b3-48e3-8227-af2bc28af79d', '2aeb3143-9c61-496d-b933-290547dcd0a7', 0, 'K29.60, K92.1, D50.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e7aae0ec-3186-4792-9bd5-7987d449b37d', '2aeb3143-9c61-496d-b933-290547dcd0a7', 1, 'K29.61, K92.1, D50.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('59580352-5dee-4682-af19-756eedb13f11', '2aeb3143-9c61-496d-b933-290547dcd0a7', 2, 'K29.61, D50.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('379d61c8-3c1a-4620-afb3-2b8d1ceeb786', '2aeb3143-9c61-496d-b933-290547dcd0a7', 3, 'K29.60, D62');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2aeb3143-9c61-496d-b933-290547dcd0a7', '59580352-5dee-4682-af19-756eedb13f11', 'K29.61 (other gastritis with bleeding) is a single combination code that already captures both the gastritis AND its bleeding complication together — K92.1 (melena, a symptom finding) is NOT separately added, since it would be a redundant symptom-level code once the bleeding-gastritis combination code already conveys that bleeding is present, matching the non-redundant-combination-code principle established repeatedly across this exam series. D50.0 (iron deficiency anemia secondary to chronic blood loss) is added as the resulting anemia — the same specific blood-loss-anemia code used correctly in Paper 9''s angiodysplasia question, more precise than D62 (ACUTE posthemorrhagic anemia, which would be the wrong acuity for this now-stabilizing, chronic-blood-loss-pattern anemia requiring ongoing iron repletion).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b8f3cdd6-4a27-443d-bba4-e1be8f3d9746', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 30, 'A patient with a permanent pacemaker for complete AV block has a NEW finding of symptomatic hypotension, physician-documented as directly due to a recently increased dose of a correctly-prescribed antihypertensive medication, causing lightheadedness (no syncope). Select the correct, complete coding, contrasting with the pacemaker/complete-AV-block sequencing pattern tested elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2adfcd83-cba0-4709-bd92-90125bd9c096', 'b8f3cdd6-4a27-443d-bba4-e1be8f3d9746', 0, 'I95.9, Z95.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4a505c7a-dc5d-4082-b393-00832e803285', 'b8f3cdd6-4a27-443d-bba4-e1be8f3d9746', 1, 'I95.2, Z95.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('df5297ad-d8ca-4132-b9af-5a0ab805ef7b', 'b8f3cdd6-4a27-443d-bba4-e1be8f3d9746', 2, 'T50.905A, I95.2, Z95.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7296bf89-6773-47cc-b7e0-6bd7e8cb3433', 'b8f3cdd6-4a27-443d-bba4-e1be8f3d9746', 3, 'I44.2, I95.2, Z95.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b8f3cdd6-4a27-443d-bba4-e1be8f3d9746', 'df5297ad-d8ca-4132-b9af-5a0ab805ef7b', 'T50.905A (adverse effect of unspecified drugs, initial encounter — used here since the specific antihypertensive drug class isn''t identified in this stem) is sequenced first per the adverse-effect sequencing convention. I95.2 (hypotension due to drugs) follows as the specific, drug-caused hypotension manifestation — more precise than I95.9 (hypotension, unspecified), which would under-code the documented drug-causation. Z95.0 (presence of cardiac pacemaker) is added as the device-status code — I44.2 (complete AV block, the original reason for the pacemaker) is NOT re-added, following the identical ''device-status code doesn''t require re-adding the original underlying condition'' principle established with the pacemaker-pocket-infection question in Paper 7.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('f4b6df45-e082-4b2c-afc3-d41d751d0984', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 31, 'A patient with no prior cardiac history is found by the home health nurse to have frequent premature ventricular contractions on a routine pulse check, confirmed by a subsequent Holter monitor ordered by the physician, asymptomatic, not requiring any medication change at this time per cardiology. Select the correct, most specific coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1702821d-836e-419c-9434-12bd639e38a8', 'f4b6df45-e082-4b2c-afc3-d41d751d0984', 0, 'I49.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cc09bbaf-2d53-4b8b-a78a-cca9430f1f71', 'f4b6df45-e082-4b2c-afc3-d41d751d0984', 1, 'I49.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('27975d75-ee4d-4c42-9d71-3196092bbf90', 'f4b6df45-e082-4b2c-afc3-d41d751d0984', 2, 'R00.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('57ebdead-8286-4d8f-a440-da42cac46408', 'f4b6df45-e082-4b2c-afc3-d41d751d0984', 3, 'I49.3, R00.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('f4b6df45-e082-4b2c-afc3-d41d751d0984', 'cc09bbaf-2d53-4b8b-a78a-cca9430f1f71', 'I49.3 (ventricular premature depolarization — the specific PVC diagnosis code) is the correct, precise code matching the documented, confirmed finding — I49.9 (cardiac arrhythmia, unspecified) would under-code the documented specific PVC diagnosis when the more precise code is available and matches, mirroring the specific-over-generic-code principle tested throughout this exam series. R00.0 (tachycardia, a symptom code describing a different, unrelated finding — rate, not rhythm irregularity) doesn''t apply to this presentation at all, since PVCs are a rhythm/beat-origin finding, not a rate abnormality.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5202e5d9-b7b7-41ff-9a09-44f2bcf97792', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 32, 'A home health agency''s QAPI program identifies, through routine data review, a pattern of increased rehospitalization specifically among patients discharged from a particular local hospital''s cardiology service. Per CoP quality-improvement principles, what is the appropriate next step, distinct from the individual-nurse-performance-pattern question tested elsewhere in this exam series?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3cdeba4c-d81d-4126-9e1e-4215d006d6f5', '5202e5d9-b7b7-41ff-9a09-44f2bcf97792', 0, 'Ignore the pattern since it involves an external hospital, outside the home health agency''s control');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9e8facae-9ac0-431f-8127-d5b8ac7e1680', '5202e5d9-b7b7-41ff-9a09-44f2bcf97792', 1, 'Investigate the pattern further (e.g., specific discharge/transition practices, communication gaps, medication reconciliation issues at that referral source) to identify whether a targeted quality-improvement intervention — potentially including improved care-coordination communication with that specific hospital — could reduce the rehospitalization pattern');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('65006196-ac30-40d2-8a44-43e11b4b1d7c', '5202e5d9-b7b7-41ff-9a09-44f2bcf97792', 2, 'Automatically refuse all future referrals from that hospital');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f8a19e17-0ddc-4e6f-9bc8-ac2f4395a3da', '5202e5d9-b7b7-41ff-9a09-44f2bcf97792', 3, 'Report the hospital to state licensing without further internal investigation');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5202e5d9-b7b7-41ff-9a09-44f2bcf97792', '9e8facae-9ac0-431f-8127-d5b8ac7e1680', 'This extends the QAPI investigation principle established with the individual-nurse missed-visit pattern question in Paper 9 to a referral-source-level pattern — a genuine, data-identified rehospitalization pattern tied to a specific referral source should trigger meaningful investigation into potentially addressable contributing factors (discharge communication, medication reconciliation gaps, transition-of-care practices) rather than being dismissed as outside the agency''s control simply because the pattern originates partly from an external source; a targeted quality intervention, including improved care coordination with that specific hospital, is a genuine, appropriate QAPI response, distinct from either ignoring the pattern or jumping to extreme, disproportionate responses (refusing referrals, external reporting) without first investigating and attempting a proportionate improvement approach.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('9a37e5b1-73d8-415e-ae13-b164753684ad', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 33, 'A patient''s home health record shows the plan of care was signed and dated by the physician 45 days after the services began, though the physician had given verbal authorization for the plan at the time services started, properly documented per CoP verbal-order requirements. Does the delayed signature alone retroactively invalidate the services provided during those 45 days?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0a301a83-fa44-4a0b-b56c-6e86b0903c06', '9a37e5b1-73d8-415e-ae13-b164753684ad', 0, 'Yes, automatically — any signature delay of any length voids all services provided before the signature date, with no exceptions');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('82a5ce3a-11e2-4446-9400-31216b5bd68a', '9a37e5b1-73d8-415e-ae13-b164753684ad', 1, 'Not necessarily — properly documented verbal authorization at the time services began, later followed by physician signature (even if delayed beyond the ideal timeframe), generally supports that the services were physician-ordered; however, a 45-day delay is still a genuine compliance concern worth addressing through improved processes, since timely signature is the CoP-compliant standard, not merely a best practice');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('494c2511-ec2f-4496-8e1d-269c8ea8292f', '9a37e5b1-73d8-415e-ae13-b164753684ad', 2, 'No, verbal authorization alone is always sufficient forever, and physician signatures are never actually required for home health orders');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('59a1c831-cb81-4624-a2ab-0394fd1290da', '9a37e5b1-73d8-415e-ae13-b164753684ad', 3, 'The delay is irrelevant because CoPs do not require any physician signature on plans of care at all');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('9a37e5b1-73d8-415e-ae13-b164753684ad', '82a5ce3a-11e2-4446-9400-31216b5bd68a', 'This applies the verbal-order documentation-and-authentication principle established in Paper 7 (Q41) to a plan-of-care-signature-timing scenario specifically — properly documented verbal authorization at the time services began, later followed by a physician signature (even significantly delayed), generally supports that the services were legitimately physician-ordered from the start, avoiding automatic retroactive invalidation — but a 45-day delay is still a real, meaningful compliance gap against the CoP-required timely-authentication standard, worth genuine process improvement, not something to treat as either fully catastrophic (automatic voiding) or entirely inconsequential (signatures don''t matter).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('33edd7f1-5407-464d-b407-44e9a808c8b4', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 34, 'A patient with overactive bladder, confirmed by urology as detrusor overactivity, has associated urge incontinence, both requiring home health bladder-training education and medication management. Select the correct, complete coding, addressing whether one code captures both findings.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('15fb0829-e4cd-4da1-9013-0f872907ca83', '33edd7f1-5407-464d-b407-44e9a808c8b4', 0, 'N32.81, N39.41');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aae2f9d0-d9a1-4f34-8004-a4de5e0d0c69', '33edd7f1-5407-464d-b407-44e9a808c8b4', 1, 'N32.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('48b0d1e9-90a9-4131-8a4f-d43224dee9a7', '33edd7f1-5407-464d-b407-44e9a808c8b4', 2, 'N39.41, N32.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d1b16b11-76a2-421f-9e99-13c724c34ea0', '33edd7f1-5407-464d-b407-44e9a808c8b4', 3, 'N32.9, N39.41');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('33edd7f1-5407-464d-b407-44e9a808c8b4', '15fb0829-e4cd-4da1-9013-0f872907ca83', 'N32.81 (overactive bladder) is sequenced first as the underlying urodynamic diagnosis. N39.41 (urge incontinence) is added as a separate, distinct finding — ICD-10-CM does not have a single combination code merging overactive bladder with its resulting urge incontinence the way some other disease-complication pairs do, so both are coded separately despite their close clinical relationship, testing the same ''not every related pairing has a combination code'' principle established with the COPD+GERD and hypertension+hyperlipidemia+angina questions elsewhere in this exam series. N32.9 (bladder disorder, unspecified) would under-code the documented specific overactive-bladder diagnosis.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('89430e66-9ffc-4d53-be88-036aaf9ac0ba', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 35, 'A patient with benign prostatic hyperplasia, confirmed by the physician as WITHOUT any current lower urinary tract symptoms (patient is asymptomatic, BPH noted incidentally on recent imaging for an unrelated reason), is admitted to home health for an unrelated orthopedic issue. Select the correct coding for the BPH finding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ea3d32f4-2e3e-4645-b7b9-ddc98fef0350', '89430e66-9ffc-4d53-be88-036aaf9ac0ba', 0, 'N40.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('54f07474-11cd-4608-b8ff-e734cede9d89', '89430e66-9ffc-4d53-be88-036aaf9ac0ba', 1, 'N40.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb0fa198-4a0f-49ad-bfd3-b0c0879bf8a6', '89430e66-9ffc-4d53-be88-036aaf9ac0ba', 2, 'N40.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('46d75111-d3a7-4dd9-9b02-a226f4c828f8', '89430e66-9ffc-4d53-be88-036aaf9ac0ba', 3, 'No code needed since the patient is asymptomatic');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('89430e66-9ffc-4d53-be88-036aaf9ac0ba', '54f07474-11cd-4608-b8ff-e734cede9d89', 'N40.0 (benign prostatic hyperplasia WITHOUT lower urinary tract symptoms) precisely matches the documented asymptomatic status — N40.1 (BPH WITH lower urinary tract symptoms, the code used correctly in the TURP question in Paper 8 and elsewhere in this exam series for a symptomatic presentation) would incorrectly imply symptoms that are explicitly NOT present here, testing whether a candidate defaults to the more commonly-tested N40.1 from memory rather than checking this specific stem''s explicitly asymptomatic documentation. A confirmed, currently-relevant diagnostic finding is still coded even when asymptomatic, the same principle established with the diabetic dermopathy question in Paper 8 (a diagnosis doesn''t require symptoms or active treatment to remain codeable once documented).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ef5cd552-69c7-4522-bc4d-c98f4c4d356c', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 36, 'A patient has a right total hip replacement (2 years ago, well-functioning) and a LEFT hip with severe, untreated primary osteoarthritis, admitted to home health for PT specifically addressing the painful left hip in preparation for an upcoming left hip replacement. Select the correct principal diagnosis, addressing both hips.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b7d74b50-0e16-4259-80ee-64454c412822', 'ef5cd552-69c7-4522-bc4d-c98f4c4d356c', 0, 'M16.12, Z96.641');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('360c5a03-6e1a-4c84-82f0-126849f02933', 'ef5cd552-69c7-4522-bc4d-c98f4c4d356c', 1, 'Z96.641, M16.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('67fe48b4-3ef5-414d-92a5-cfc845d57ed0', 'ef5cd552-69c7-4522-bc4d-c98f4c4d356c', 2, 'M16.11, Z96.641');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('70eaa759-ea9a-4ba3-9a80-5f1872dd65f8', 'ef5cd552-69c7-4522-bc4d-c98f4c4d356c', 3, 'M16.12, M16.11');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ef5cd552-69c7-4522-bc4d-c98f4c4d356c', 'b7d74b50-0e16-4259-80ee-64454c412822', 'M16.12 (unilateral primary osteoarthritis, left hip) is sequenced first since the left hip''s untreated, symptomatic osteoarthritis is the actual focus of THIS home health episode''s PT — a different sequencing emphasis than the Paper 7 knee-replacement-recovery question, where the device-status code led because that episode''s focus was post-operative recovery from the already-completed surgery; here, the pre-operative, still-native, symptomatic joint is the current clinical focus, so its active arthritis code leads. Z96.641 (presence of right artificial hip joint) is added as the device-status code for the OTHER hip, the one already replaced — M16.11 (right hip osteoarthritis) is NOT re-added for the right hip, since that joint''s original arthritis has been surgically resolved and is now represented by the Z96.641 status code instead, the same principle established in Paper 7''s knee-replacement question.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5681a218-5a2c-4648-a9cf-a0f032fd2764', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 37, 'A patient with a left hip replacement (8 years ago) develops sudden hip pain and inability to bear weight after a minor fall at home, with imaging confirming the prosthesis has dislocated (not broken, not infected). Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('30efb878-b2dd-4e42-ac46-48ee52b936a5', '5681a218-5a2c-4648-a9cf-a0f032fd2764', 0, 'T84.021A, M25.552');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cf0fc728-6a12-4a56-b9dc-6e350237404a', '5681a218-5a2c-4648-a9cf-a0f032fd2764', 1, 'T84.021A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('51570bf7-0794-415e-9dc9-49c3ea26382c', '5681a218-5a2c-4648-a9cf-a0f032fd2764', 2, 'T84.019A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0e59dfaf-c5d4-447f-9eb4-edaea72f204a', '5681a218-5a2c-4648-a9cf-a0f032fd2764', 3, 'M16.12, T84.021A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5681a218-5a2c-4648-a9cf-a0f032fd2764', 'cf0fc728-6a12-4a56-b9dc-6e350237404a', 'T84.021A (dislocation of internal left hip prosthesis, initial encounter) is the correct, laterality-specific code matching the documented left hip replacement — T84.019A (broken internal joint prosthesis, unspecified site) is the wrong complication type entirely, since the stem specifically documents dislocation, not breakage. M25.552 (pain in left hip) is not separately needed alongside T84.021A, since the dislocation code itself already conveys the clinically relevant diagnosis without requiring a redundant, less-specific pain symptom code stacked on top, the same non-redundant-symptom-code principle established repeatedly across this exam series. M16.12 (left hip osteoarthritis, the ORIGINAL condition that led to the replacement) is not re-added, since that condition was surgically resolved by the joint replacement and is no longer the active diagnosis, the same principle established with the knee/hip-replacement-status questions elsewhere in this exam series.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('71677d41-83be-4fd0-a5a1-bb86db6cf2b6', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 38, 'A patient with lung cancer (right upper lobe, confirmed by biopsy) develops a NEW malignant pleural effusion, confirmed by thoracentesis cytology, requiring a home health-coordinated drainage catheter for symptom management. Select the correct, complete coding, distinguishing malignant pleural effusion from a benign effusion.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('670308c5-f685-4cfc-a94a-6686ac9d714c', '71677d41-83be-4fd0-a5a1-bb86db6cf2b6', 0, 'C34.11, J91.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('da5820f8-427b-4ce0-bc98-df45266b6a19', '71677d41-83be-4fd0-a5a1-bb86db6cf2b6', 1, 'C34.11, J90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c38d4fd3-b2fb-458f-9699-d5f3a7336a7e', '71677d41-83be-4fd0-a5a1-bb86db6cf2b6', 2, 'J91.0, C34.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0b1cf912-6c3c-45c1-95b6-ae5e60f5118f', '71677d41-83be-4fd0-a5a1-bb86db6cf2b6', 3, 'C34.11, R09.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('71677d41-83be-4fd0-a5a1-bb86db6cf2b6', '670308c5-f685-4cfc-a94a-6686ac9d714c', 'C34.11 (malignant neoplasm of upper lobe, right lung) is sequenced first as the primary cancer diagnosis. J91.0 (malignant pleural effusion) is the specific, cytology-confirmed combination code for cancer-caused pleural effusion — J90 (pleural effusion, not elsewhere classified — a generic, non-malignancy-specific effusion code) would under-code the documented, biopsy/cytology-confirmed malignant etiology when the more precise J91.0 code is available and matches. R09.1 (pleurisy, a different clinical finding — inflammation of the pleura, not fluid accumulation) doesn''t match this presentation at all.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('93b8e562-a95c-4767-98fc-8ca811c1fa0c', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 39, 'A patient with breast cancer (treated 5 years ago, no evidence of recurrence) has a NEW finding of a lung nodule on routine surveillance imaging, not yet biopsied, with the radiologist''s report stating the nature of the nodule is indeterminate pending further workup. Select the correct coding for this specific finding, addressing whether it should be coded as metastatic cancer before biopsy confirmation.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3fb7ecbe-75ab-458c-8cd6-eae3b62bb05a', '93b8e562-a95c-4767-98fc-8ca811c1fa0c', 0, 'C78.01, Z85.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a4a82274-f45f-4579-b7b8-298b75d1b044', '93b8e562-a95c-4767-98fc-8ca811c1fa0c', 1, 'R91.8, Z85.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f603bc4e-005a-48bb-91ee-e54c0320931c', '93b8e562-a95c-4767-98fc-8ca811c1fa0c', 2, 'C78.00, Z85.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8c9bf09a-3b6d-4dce-bdce-48a2acbb60e5', '93b8e562-a95c-4767-98fc-8ca811c1fa0c', 3, 'Z85.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('93b8e562-a95c-4767-98fc-8ca811c1fa0c', 'a4a82274-f45f-4579-b7b8-298b75d1b044', 'R91.8 (other nonspecific abnormal finding of lung field) is the correct code for an indeterminate, not-yet-biopsied finding — coding this as C78.00/C78.01 (secondary malignant neoplasm of lung, an ACTIVE metastatic cancer diagnosis) would be premature and incorrect, since the radiologist has explicitly NOT confirmed malignancy yet (''indeterminate pending further workup''); this is a genuinely important principle distinct from the resolved-condition-vs-active-condition pattern tested elsewhere in this exam series — here, the issue is coding a diagnosis that hasn''t been CONFIRMED at all yet, not one that has resolved. Z85.3 (personal history of breast cancer) remains appropriately coded as relevant history, matching the same history-vs-active-disease principle established in Paper 7''s original metastatic breast cancer question.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('24cb1136-cfa2-4302-adc2-bb5cf8e4d005', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 40, 'A patient with confirmed right carpal tunnel syndrome, diagnosed by nerve conduction study, is on home health OT for splinting and activity-modification education, distinct from a general wrist-pain symptom presentation. Select the correct, most specific coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('700be9f2-ddb1-4a62-9155-3ed04e17708e', '24cb1136-cfa2-4302-adc2-bb5cf8e4d005', 0, 'M25.511');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a5f8af25-2696-41a0-91a0-f2456aec8335', '24cb1136-cfa2-4302-adc2-bb5cf8e4d005', 1, 'G56.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('af2ef52e-ca0f-47d1-ad94-30d77cc68437', '24cb1136-cfa2-4302-adc2-bb5cf8e4d005', 2, 'G56.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('16106ae2-2cd0-40ee-891e-08aaceeca178', '24cb1136-cfa2-4302-adc2-bb5cf8e4d005', 3, 'M54.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('24cb1136-cfa2-4302-adc2-bb5cf8e4d005', 'a5f8af25-2696-41a0-91a0-f2456aec8335', 'G56.01 (carpal tunnel syndrome, right upper limb) is the specific, confirmed diagnosis matching the documented nerve-conduction-study-confirmed finding and laterality — G56.00 (unspecified upper limb) would under-code the documented right-sided laterality. M25.511 (pain in right shoulder — an unrelated joint and a nonspecific symptom code) is both the wrong anatomic site and the wrong specificity tier. M54.2 (cervicalgia, neck pain — an entirely unrelated anatomic region) doesn''t match this presentation at all.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b9d04346-33ec-420f-8862-5b992d81b52d', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 41, 'A patient with chronic right shoulder pain is found by imaging to have a rotator cuff tear, physician-documented as degenerative in nature (NOT resulting from any specific traumatic injury), requiring home PT for a structured strengthening program prior to considering surgical repair. Select the correct, complete coding, addressing whether this is coded as a traumatic injury.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d67344ab-cb94-4b84-aca6-211c574f1355', 'b9d04346-33ec-420f-8862-5b992d81b52d', 0, 'M75.101, M25.511');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a17cc1a0-1c27-4a99-8de2-90b81bdf9dc3', 'b9d04346-33ec-420f-8862-5b992d81b52d', 1, 'M75.101');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4e706fc7-2048-4b00-b6e7-358ee6e1103f', 'b9d04346-33ec-420f-8862-5b992d81b52d', 2, 'S46.011A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('69e0a68b-9e8b-4377-bcef-0b73fd084b2a', 'b9d04346-33ec-420f-8862-5b992d81b52d', 3, 'M75.30, M25.511');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b9d04346-33ec-420f-8862-5b992d81b52d', 'a17cc1a0-1c27-4a99-8de2-90b81bdf9dc3', 'M75.101 (unspecified rotator cuff tear or rupture of right shoulder, not specified as traumatic) precisely matches the documented degenerative, non-traumatic etiology — S46.011A (a traumatic muscle/tendon injury code with an initial-encounter 7th character) would be incorrect, since this stem specifically rules out a traumatic mechanism, mirroring the fragility-fracture-vs-traumatic-fracture etiology distinction tested repeatedly throughout this exam series (Paper 7''s M80.032 question). M25.511 (pain in right shoulder) is not separately needed alongside the specific rotator cuff diagnosis, following the same non-redundant-symptom-code principle established throughout this series.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5bf5268c-9394-4ff0-a913-efb9d9eb386d', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 42, 'A patient with confirmed type 1 von Willebrand disease (the mild, most common form, confirmed by hematology testing) is on home health following a recent minor procedure, requiring monitoring for bleeding risk. Select the correct, most specific coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3bfcfc78-8e53-4451-b0d8-a996470484ad', '5bf5268c-9394-4ff0-a913-efb9d9eb386d', 0, 'D68.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c85379e6-a651-4115-9aaf-91326891b7c4', '5bf5268c-9394-4ff0-a913-efb9d9eb386d', 1, 'D68.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7ea81074-0d70-41f5-a211-67d428e27036', '5bf5268c-9394-4ff0-a913-efb9d9eb386d', 2, 'D69.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('494da2ab-4c19-42a2-9dff-e168159636eb', '5bf5268c-9394-4ff0-a913-efb9d9eb386d', 3, 'D68.61');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5bf5268c-9394-4ff0-a913-efb9d9eb386d', '3bfcfc78-8e53-4451-b0d8-a996470484ad', 'D68.01 (von Willebrand disease, type 1) precisely matches the documented specific subtype — D68.0 by itself is a non-billable parent requiring type specification (type 1, type 2 with its own further subtypes, type 3, acquired, or other). D68.00 (unspecified type) would under-code the documented specific type 1 diagnosis. D69.6 (thrombocytopenia, an entirely different hematologic mechanism — low platelet count, not the von Willebrand factor deficiency actually documented) is the wrong condition. D68.61 (antiphospholipid syndrome, the hypercoagulable condition tested earlier in this paper — the opposite clinical direction, a clotting tendency rather than a bleeding tendency) is also wrong.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3bb50a95-8bb4-440c-9daa-ef83d5a58e79', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 43, 'A patient develops a new pulmonary embolism, confirmed by CT angiogram, with the physician specifically documenting NO evidence of acute cor pulmonale (right heart strain) on echocardiogram. Select the correct, most specific coding, contrasting with a PE WITH documented cor pulmonale.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a0c24e7b-7bc8-481f-b53e-06c9c18551a6', '3bb50a95-8bb4-440c-9daa-ef83d5a58e79', 0, 'I26.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fa7067e5-1205-4ac8-9363-c305c7704a19', '3bb50a95-8bb4-440c-9daa-ef83d5a58e79', 1, 'I26.99');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1031d352-e6b9-4e5e-91d5-48794bd22313', '3bb50a95-8bb4-440c-9daa-ef83d5a58e79', 2, 'I26.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f057beae-0b0f-460c-9b1f-5acdb7fa9198', '3bb50a95-8bb4-440c-9daa-ef83d5a58e79', 3, 'I26.90, I26.99');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3bb50a95-8bb4-440c-9daa-ef83d5a58e79', 'fa7067e5-1205-4ac8-9363-c305c7704a19', 'I26.99 (other pulmonary embolism without acute cor pulmonale) precisely matches the documented absence of right heart strain — I26.02 (saddle embolus WITH acute cor pulmonale) would incorrectly add a finding explicitly ruled out by this stem''s documentation. I26.90 (septic pulmonary embolism, a specific INFECTIOUS-source PE variant) is the wrong etiology entirely — this stem doesn''t document a septic/infectious source, just a standard confirmed PE, making I26.99 (the general ''other PE'' code) the correct match rather than the septic-specific variant.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0dadd38f-ff4a-4f04-bc8f-6db6b9a93914', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 44, 'A patient with confirmed bilateral sensorineural hearing loss, diagnosed by audiology, is on home health for fall-prevention education addressing the communication and safety implications of the hearing impairment. Select the correct, most specific coding, distinguishing sensorineural from unspecified hearing loss.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4305d10c-e425-47c1-b0cf-f3a4e6e6e14f', '0dadd38f-ff4a-4f04-bc8f-6db6b9a93914', 0, 'H90.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1bbe1fe8-757a-421b-b00d-14c083ec6e3e', '0dadd38f-ff4a-4f04-bc8f-6db6b9a93914', 1, 'H91.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4397830c-a0ec-4211-a45c-bdfc14dd45eb', '0dadd38f-ff4a-4f04-bc8f-6db6b9a93914', 2, 'H93.19');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('daecd16a-2c27-42a8-9a10-821a34fc166e', '0dadd38f-ff4a-4f04-bc8f-6db6b9a93914', 3, 'H90.41');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0dadd38f-ff4a-4f04-bc8f-6db6b9a93914', '4305d10c-e425-47c1-b0cf-f3a4e6e6e14f', 'H90.3 (sensorineural hearing loss, bilateral) precisely matches the documented, audiology-confirmed specific hearing loss type and laterality — H91.90 (unspecified hearing loss, unspecified ear) would under-code the documented specificity when the more precise sensorineural code is available and matches. H93.19 (tinnitus, a different finding — ringing/noise perception, not hearing loss itself) doesn''t match this presentation. H90.41 (unilateral, right ear only) would under-code the documented bilateral finding.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('4a68bc6a-c5d6-4c85-8797-1264edbf51a9', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 45, 'A patient with a recent stroke has confirmed dysphasia (a milder language impairment than full aphasia), physician-documented specifically as dysphasia rather than aphasia, following cerebral infarction. Select the correct coding, distinguishing dysphasia from the full aphasia sequela code used elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('312532a1-e69b-40ac-b774-b8c2738b9128', '4a68bc6a-c5d6-4c85-8797-1264edbf51a9', 0, 'I69.320');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b58c8f4b-54a4-4c5e-af07-822822e1b1fa', '4a68bc6a-c5d6-4c85-8797-1264edbf51a9', 1, 'R47.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5175450b-f40e-4057-bb67-305e2e12daf5', '4a68bc6a-c5d6-4c85-8797-1264edbf51a9', 2, 'R47.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('80e5f980-474e-4957-8979-4ad680bd37b9', '4a68bc6a-c5d6-4c85-8797-1264edbf51a9', 3, 'I69.320, R47.02');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('4a68bc6a-c5d6-4c85-8797-1264edbf51a9', '312532a1-e69b-40ac-b774-b8c2738b9128', 'I69.320 (aphasia following cerebral infarction — the same stroke-sequela combination code used in Paper 7''s Q23) is actually the correct code here too, since ICD-10-CM''s I69.320 code title covers ''aphasia'' broadly and dysphasia is classified as a milder degree within the same code category rather than having its own separate stroke-sequela combination code — R47.02 (dysphasia, a general symptom code without the stroke-etiology link) would under-code the documented specific stroke-sequela relationship, the same etiology-code-over-symptom-code principle tested throughout this exam series. This tests whether a candidate incorrectly assumes dysphasia needs an entirely different code from aphasia, rather than recognizing it falls under the same I69.320 sequela code once the stroke etiology is documented.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5edf2975-d4af-426c-8198-3b886798edef', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 46, 'A patient with confirmed autoimmune thyroiditis (Hashimoto''s), currently presenting with hypothyroidism as the resulting clinical state, is on home health for levothyroxine management. Select the correct, complete coding, addressing whether one or two codes are needed to capture both the autoimmune process and its resulting hormonal state.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8d777ecb-d8b1-498b-8ef1-7e8f27e8d6c8', '5edf2975-d4af-426c-8198-3b886798edef', 0, 'E06.3, E03.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9bc4bcec-baa4-4ed6-a029-cd8e9b9ecaef', '5edf2975-d4af-426c-8198-3b886798edef', 1, 'E03.9, E06.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('badcdabd-91e3-4a9d-a15d-1553ec3ec87b', '5edf2975-d4af-426c-8198-3b886798edef', 2, 'E06.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d8103bf0-78fb-424b-a341-edbad0936d5c', '5edf2975-d4af-426c-8198-3b886798edef', 3, 'E03.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5edf2975-d4af-426c-8198-3b886798edef', '8d777ecb-d8b1-498b-8ef1-7e8f27e8d6c8', 'E06.3 (autoimmune thyroiditis) is sequenced first as the underlying specific autoimmune disease process — E03.9 (hypothyroidism, unspecified) is added as the resulting hormonal/clinical state, since ICD-10-CM does not have a single combination code merging Hashimoto''s thyroiditis with its resulting hypothyroidism the way some other disease-complication pairs do, testing the same ''not every related pairing has a combination code'' principle established repeatedly across this exam series (COPD+GERD in Paper 9, overactive-bladder+urge-incontinence earlier in this paper).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('eca15379-c486-4442-95f0-1b46864aa3c7', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 47, 'A patient with confirmed primary adrenal insufficiency (Addison''s disease, the same specific diagnosis tested elsewhere in this exam series) is stable on maintenance hydrocortisone and fludrocortisone, admitted to home health for an unrelated orthopedic issue. Select the correct, most specific coding for the adrenal insufficiency status.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a317ed75-c714-4430-97bb-76c8c9744587', 'eca15379-c486-4442-95f0-1b46864aa3c7', 0, 'E27.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('77f3ba52-a6cc-4652-9d88-fbeaa3128f3e', 'eca15379-c486-4442-95f0-1b46864aa3c7', 1, 'E27.40');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('741a4c21-16d1-45ef-b59e-1799114ba2ec', 'eca15379-c486-4442-95f0-1b46864aa3c7', 2, 'E27.49');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3064fb8b-8327-4aaa-9031-5a3bca8d34f0', 'eca15379-c486-4442-95f0-1b46864aa3c7', 3, 'R94.6');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('eca15379-c486-4442-95f0-1b46864aa3c7', 'a317ed75-c714-4430-97bb-76c8c9744587', 'E27.1 (primary adrenocortical insufficiency — Addison''s disease) is the specific, correct code, matching the same code correctly used in Paper 9''s Addison''s disease question — E27.40 (unspecified adrenocortical insufficiency) and E27.49 (other adrenocortical insufficiency) would both under-code the documented specific primary/Addison''s diagnosis when the more precise E27.1 code is available and directly matches. R94.6 (abnormal thyroid function studies — the wrong endocrine gland entirely, thyroid rather than adrenal) doesn''t apply to this presentation at all.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fa8b3606-d3fa-4cc9-be52-36d6f49d695a', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 48, 'A patient develops severe sepsis, confirmed by physician documentation of sepsis WITH associated acute kidney injury (organ dysfunction), but explicitly WITHOUT septic shock (blood pressure remains stable, no vasopressor requirement). Select the correct, complete coding, distinguishing severe sepsis without shock from the sepsis-with-shock variant.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cf750b7a-a438-4009-af09-1ad3b09aaf1e', 'fa8b3606-d3fa-4cc9-be52-36d6f49d695a', 0, 'A41.9, R65.21, N17.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('91e93006-1435-471d-9683-717f35788cd4', 'fa8b3606-d3fa-4cc9-be52-36d6f49d695a', 1, 'A41.9, R65.20, N17.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4c3ccd1e-edb0-45a5-8c23-1d38c09db06b', 'fa8b3606-d3fa-4cc9-be52-36d6f49d695a', 2, 'A41.9, N17.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('06e74719-e821-4fa9-9db9-5af7134a245b', 'fa8b3606-d3fa-4cc9-be52-36d6f49d695a', 3, 'R65.20, A41.9, N17.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fa8b3606-d3fa-4cc9-be52-36d6f49d695a', '91e93006-1435-471d-9683-717f35788cd4', 'A41.9 (sepsis, unspecified organism) is sequenced first as the underlying sepsis diagnosis. R65.20 (severe sepsis without septic shock) precisely matches the documented organ dysfunction (AKI) WITHOUT the septic shock component — R65.21 (severe sepsis WITH septic shock) would incorrectly add a finding explicitly ruled out by this stem''s documentation (stable BP, no vasopressors). N17.9 (acute kidney injury) is added as the specific documented organ dysfunction that qualifies this as ''severe'' sepsis rather than uncomplicated sepsis, per the same organ-dysfunction-requires-severe-sepsis-code principle established with the UTI/sepsis question in Paper 7.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b39eba39-26dd-4064-b961-1008877209f7', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 49, 'A patient develops pneumonia, confirmed by sputum culture growing Streptococcus pneumoniae, now home for continued oral antibiotic therapy. Select the correct, most specific coding, contrasting with an unspecified-organism pneumonia code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('03bfa8bd-7ec5-4b1e-9e53-5c58713c538e', 'b39eba39-26dd-4064-b961-1008877209f7', 0, 'J18.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6af0d71e-0dd2-481d-8eaf-4955c2c49217', 'b39eba39-26dd-4064-b961-1008877209f7', 1, 'J15.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7e7940b0-fd4b-493a-814f-587a026d6b4d', 'b39eba39-26dd-4064-b961-1008877209f7', 2, 'J13');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('feb789b2-852d-485d-8baf-5b5614ce78be', 'b39eba39-26dd-4064-b961-1008877209f7', 3, 'J16.8');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b39eba39-26dd-4064-b961-1008877209f7', '7e7940b0-fd4b-493a-814f-587a026d6b4d', 'J13 (pneumonia due to Streptococcus pneumoniae) precisely matches the documented, culture-confirmed specific organism — J18.9 (pneumonia, unspecified organism) and J15.9 (unspecified bacterial pneumonia) would both under-code the documented specific organism when the more precise, organism-specific code is available and directly matches, the same specific-over-generic-code principle tested throughout this exam series. J16.8 (pneumonia due to OTHER specified infectious organisms — a distractor for a different, non-pneumococcal specific organism) doesn''t match the documented Streptococcus pneumoniae finding.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('bc74315d-14bd-4024-8948-26fd5a8814a9', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 50, 'A patient with a right femoral neck fracture (fall at home, genuinely traumatic mechanism, no osteoporosis or fragility-fracture documentation) underwent surgical repair 10 days ago, now home for the initial post-surgical follow-up visit, still in active fracture treatment. Select the correct coding with the appropriate 7th character, contrasting with the pathologic-fracture pattern tested elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c550c71d-8d5a-4e9e-9a4e-7c9b57ccf306', 'bc74315d-14bd-4024-8948-26fd5a8814a9', 0, 'S72.001A, W19.XXXA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d73f5e20-6f47-4604-93cd-6883b4c45d4d', 'bc74315d-14bd-4024-8948-26fd5a8814a9', 1, 'S72.001D, W19.XXXD');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('09253eab-74b7-4a7d-bb6e-58819f93c992', 'bc74315d-14bd-4024-8948-26fd5a8814a9', 2, 'M80.051A, W19.XXXA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1fea7b70-2d66-4e6e-8022-637cb257aa86', 'bc74315d-14bd-4024-8948-26fd5a8814a9', 3, 'S72.001A, W19.XXXD');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('bc74315d-14bd-4024-8948-26fd5a8814a9', 'c550c71d-8d5a-4e9e-9a4e-7c9b57ccf306', 'S72.001A (fracture of unspecified part of neck of right femur, initial encounter for closed fracture) is the correct TRAUMATIC fracture code, contrasted with M80.05- (which would apply only if this were documented as a pathologic/fragility fracture, per the etiology-driven distinction established in Paper 7''s M80.032 question) — since this stem explicitly documents a genuine traumatic mechanism with no osteoporosis/fragility framing, the traumatic S72 code family applies, not the pathologic M80 family. The 7th character is A (initial encounter) since the patient is still in the active treatment phase (10 days post-op, first follow-up) — not yet in the routine-healing follow-up phase that would warrant D, mirroring the A-vs-D distinction established repeatedly throughout this exam series. W19.XXXA (unspecified fall, initial encounter) matches the same encounter-phase logic for the external cause code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b500b388-f468-48ce-bcee-7a417c62e722', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 51, 'A patient has bilateral knee replacements (both done in the same surgery, 3 months ago), now completing final home health PT for both knees simultaneously. Select the correct device-status coding, addressing whether one code captures both knees.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('524be950-a9ba-4c20-8fcc-05560f33cf8b', 'b500b388-f468-48ce-bcee-7a417c62e722', 0, 'Z96.651, Z96.652');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('86efed95-7359-4fbb-8591-7d4122b01c8c', 'b500b388-f468-48ce-bcee-7a417c62e722', 1, 'Z96.653');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('39aa647f-c8e7-4de3-948f-ddeb2780eae6', 'b500b388-f468-48ce-bcee-7a417c62e722', 2, 'Z96.651');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('69697b9b-adae-4e62-aca9-76f031806a06', 'b500b388-f468-48ce-bcee-7a417c62e722', 3, 'M17.31, Z96.653');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b500b388-f468-48ce-bcee-7a417c62e722', '86efed95-7359-4fbb-8591-7d4122b01c8c', 'Z96.653 (presence of artificial knee joint, BILATERAL) is the single, specific combination code that already captures both knee replacements together — using two separate unilateral codes (Z96.651 right + Z96.652 left) would be redundant once the dedicated bilateral code is available and matches, the same non-redundant-combination-code principle established repeatedly throughout this exam series. M17.31 (post-traumatic osteoarthritis, the ORIGINAL condition, not documented as the cause here and in any case superseded by the replacement) is not applicable.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('fb429f0a-ba06-449c-95ef-79ab9471846f', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 52, 'A patient with heart failure on a diuretic develops dehydration, physician-documented as due to over-diuresis from a recently increased dose (correctly prescribed and taken exactly as directed), presenting with orthostatic hypotension. Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a627e132-64d4-43c7-be66-6e08504ec35a', 'fb429f0a-ba06-449c-95ef-79ab9471846f', 0, 'E86.0, I95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aa9049bb-7ef7-4239-bea3-c899b969954c', 'fb429f0a-ba06-449c-95ef-79ab9471846f', 1, 'T50.2X5A, E86.0, I95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('04d36112-5721-4cf1-8a4a-fa83edfcc2a5', 'fb429f0a-ba06-449c-95ef-79ab9471846f', 2, 'E86.0, T50.2X5A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e033ef0c-52fa-4e64-bf14-a657bc3c3440', 'fb429f0a-ba06-449c-95ef-79ab9471846f', 3, 'I95.1, E86.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('fb429f0a-ba06-449c-95ef-79ab9471846f', 'aa9049bb-7ef7-4239-bea3-c899b969954c', 'T50.2X5A (adverse effect of diuretics, initial encounter — the same diuretic-adverse-effect code family used correctly in Paper 7''s furosemide/hypokalemia question) is sequenced first per the adverse-effect convention, since the correctly-prescribed, correctly-taken diuretic dose is documented as the direct cause of both resulting findings. E86.0 (dehydration) and I95.1 (orthostatic hypotension) both follow as the two separate, resulting manifestations of the same adverse drug effect — both are added since they represent two genuinely distinct, separately significant clinical findings, not one being redundant with the other.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('11241124-dec8-471d-b98e-0e7def3e0523', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 53, 'A patient with chronic pain from failed back surgery syndrome on a stable long-term opioid regimen develops constipation, but the physician specifically documents this constipation as due to inadequate dietary fiber and low fluid intake, EXPLICITLY ruling out the opioid as the cause after review. Select the correct coding, contrasting with the opioid-induced-constipation pattern tested repeatedly elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1141e0ed-0de7-4549-b9ff-bcaf4280d2fc', '11241124-dec8-471d-b98e-0e7def3e0523', 0, 'T40.2X5A, K59.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ee94deb8-ff2a-4d8d-a31b-822cb0e50f47', '11241124-dec8-471d-b98e-0e7def3e0523', 1, 'K59.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('919b9dd2-836f-426e-813b-d33b61d803e5', '11241124-dec8-471d-b98e-0e7def3e0523', 2, 'K59.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('83c76908-9bbb-4635-88f9-a9658fbb8aef', '11241124-dec8-471d-b98e-0e7def3e0523', 3, 'K59.00, T40.2X5A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('11241124-dec8-471d-b98e-0e7def3e0523', 'ee94deb8-ff2a-4d8d-a31b-822cb0e50f47', 'K59.00 (constipation, unspecified) is coded ALONE here — T40.2X5A (adverse effect of opioids) is explicitly NOT added, since the physician has specifically ruled out the opioid as the cause after review, attributing the constipation instead to dietary/fluid factors; this is a deliberate contrast with the opioid-constipation pattern tested repeatedly elsewhere in this exam series (Paper 7 Q39, Q56), testing whether a candidate reflexively applies the previously-seen ''opioid patient + constipation = adverse effect'' pattern from memory rather than correctly reading that THIS stem''s documentation specifically attributes the finding to a different, non-drug cause.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3cb4d246-42d3-40fe-9946-6dd769e0b62b', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 54, 'A patient is started on a new antibiotic and develops a generalized skin rash 3 days later, physician-documented as a drug eruption due to the correctly-dosed, correctly-taken antibiotic, mild and not requiring discontinuation. Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b9d8ea0a-2f13-43b4-a0d1-6d5e65bea6e8', '3cb4d246-42d3-40fe-9946-6dd769e0b62b', 0, 'L27.0, T36.8X5A');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('65218fba-bf85-4a0a-92d3-b3a4fa07937e', '3cb4d246-42d3-40fe-9946-6dd769e0b62b', 1, 'T36.8X5A, L27.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3ff332a7-a8f3-4379-85d1-c61003d1b8eb', '3cb4d246-42d3-40fe-9946-6dd769e0b62b', 2, 'L27.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1cb5d87e-37c1-4bed-82d5-15e243ead345', '3cb4d246-42d3-40fe-9946-6dd769e0b62b', 3, 'L50.0, T36.8X5A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3cb4d246-42d3-40fe-9946-6dd769e0b62b', '65218fba-bf85-4a0a-92d3-b3a4fa07937e', 'T36.8X5A (adverse effect of other systemic antibiotics, initial encounter) is sequenced first per the adverse-effect sequencing convention used consistently throughout this exam series. L27.0 (generalized skin eruption due to drugs taken internally) follows as the specific, matching manifestation — this is the correct dermatologic-reaction code family for a documented generalized drug eruption, distinct from L50.0 (allergic urticaria — a different, hives-specific skin reaction pattern not documented as the presentation here).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('64327e4f-c9fe-4d44-8062-cf5277f8840f', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 55, 'A patient with known severe shellfish allergy is accidentally exposed to a hidden shellfish ingredient in a meal, developing anaphylaxis requiring emergency epinephrine and hospitalization, now home for post-anaphylaxis monitoring and allergen-avoidance education. Select the correct coding for this encounter, addressing whether the acute anaphylaxis event itself is still coded.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b7c4be8a-fee9-478e-a080-1516724ba998', '64327e4f-c9fe-4d44-8062-cf5277f8840f', 0, 'T78.2XXA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('08ada002-c130-4029-83f6-6594c45226d6', '64327e4f-c9fe-4d44-8062-cf5277f8840f', 1, 'Z91.013');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8b3e18b2-a499-4e43-bb1e-f6e6dc1a0d52', '64327e4f-c9fe-4d44-8062-cf5277f8840f', 2, 'T78.2XXA, Z91.013');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2af97ceb-79ce-4ec9-bbf4-796d770d123b', '64327e4f-c9fe-4d44-8062-cf5277f8840f', 3, 'Z91.013, T78.2XXA');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('64327e4f-c9fe-4d44-8062-cf5277f8840f', '8b3e18b2-a499-4e43-bb1e-f6e6dc1a0d52', 'T78.2XXA (anaphylactic shock, unspecified, initial encounter) remains appropriately coded even though the acute event has stabilized, since this home health episode is specifically for POST-anaphylaxis monitoring directly following the acute event — distinct from the earlier-established pattern of NOT re-coding a fully resolved acute event when the current encounter is for an entirely separate, unrelated purpose (e.g., the resolved-cardiogenic-shock and resolved-DKA questions elsewhere in this exam series); here, the anaphylaxis is the direct and recent reason for this specific encounter''s monitoring focus, not an incidental unrelated history. Z91.013 (allergy to seafood) is added as the underlying allergy-status code relevant to ongoing avoidance education.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('84e2ae21-63ff-4f0c-9c0a-221f15f8d547', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 56, 'A patient with generalized muscle weakness, confirmed by physician exam, of unclear/undetermined cause (workup ongoing, no specific diagnosis yet established), has a documented history of two falls in the past month directly attributed to this weakness. Select the correct, complete coding, addressing both the weakness finding and the fall pattern.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2ee608b0-0fa2-49a3-b585-fd4f613c8846', '84e2ae21-63ff-4f0c-9c0a-221f15f8d547', 0, 'M62.81, R29.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3607caf9-1aca-4fea-aca4-c0433a5244cd', '84e2ae21-63ff-4f0c-9c0a-221f15f8d547', 1, 'M62.81, Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bcb164bd-5b5d-4101-bce9-56f7ab532f65', '84e2ae21-63ff-4f0c-9c0a-221f15f8d547', 2, 'R26.81, R29.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f1c1d325-0f3c-4635-a937-b0ff81266556', '84e2ae21-63ff-4f0c-9c0a-221f15f8d547', 3, 'M62.81');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('84e2ae21-63ff-4f0c-9c0a-221f15f8d547', '2ee608b0-0fa2-49a3-b585-fd4f613c8846', 'M62.81 (generalized muscle weakness) is the specific, confirmed finding, coded even though the underlying cause remains undetermined — a symptom/finding can be legitimately coded on its own while its etiology is still being worked up, without requiring the root cause to be established first. R29.6 (repeated falls) is the correct code here rather than Z91.81 (history of falling, a risk-factor status code), since this stem specifically documents an ACTIVE PATTERN of two actual fall events currently being evaluated, not simply a background risk-factor history — matching the R29.6-vs-Z91.81 distinction established in Paper 7 (Q47), applied here to a scenario landing on the opposite (active pattern) side of that same distinction.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('43ea787c-f25a-481a-b040-c832189d17b2', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 57, 'A patient reports intermittent unsteadiness on their feet when walking, without any confirmed falls, and without yet meeting criteria for a specific gait-disorder diagnosis, being evaluated by home health PT for a formal balance assessment. Select the correct coding for this specific, currently undiagnosed finding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('354c2fed-d5bd-4d07-8f2d-6aed23b21b12', '43ea787c-f25a-481a-b040-c832189d17b2', 0, 'R26.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('40c77237-37eb-4506-872b-c1147284a6bc', '43ea787c-f25a-481a-b040-c832189d17b2', 1, 'R29.6');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('10799743-2b9a-4012-81e3-392f1a9eaa28', '43ea787c-f25a-481a-b040-c832189d17b2', 2, 'Z91.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('62693e12-ac2c-40e3-9797-4504f5fe9d0b', '43ea787c-f25a-481a-b040-c832189d17b2', 3, 'R26.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('43ea787c-f25a-481a-b040-c832189d17b2', '354c2fed-d5bd-4d07-8f2d-6aed23b21b12', 'R26.81 (unsteadiness on feet) is the specific, correct symptom code precisely matching the documented finding — R29.6 (repeated falls) would over-code this presentation, since no actual falls are documented, only subjective unsteadiness. Z91.81 (history of falling) similarly doesn''t apply without any documented fall history. R26.2 (difficulty in walking, a related but distinct gait-disturbance code describing a different specific symptom than unsteadiness) is a less precise match than the more specific R26.81 code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('97b17b83-bafa-46b9-b762-fe248f5af96f', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 58, 'A patient with a kidney transplant 5 years ago (functioning well, no active rejection) has chronic anemia, physician-documented as due to a DIFFERENT chronic disease process (rheumatoid arthritis, also present), NOT attributed to the transplanted kidney or any kidney dysfunction. Select the correct, complete coding, contrasting with the anemia-in-CKD combination-code pattern tested repeatedly elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('66ea451b-30f0-4160-94f7-510eaf031d22', '97b17b83-bafa-46b9-b762-fe248f5af96f', 0, 'D63.1, Z94.0, M06.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9852b590-4426-4a77-b071-4567c3f53f06', '97b17b83-bafa-46b9-b762-fe248f5af96f', 1, 'D63.8, M06.9, Z94.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c70e6fb3-15c2-4d26-a9dc-f441c218d544', '97b17b83-bafa-46b9-b762-fe248f5af96f', 2, 'D63.1, M06.9, Z94.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b4629171-050c-415a-8e37-4249b79c5d86', '97b17b83-bafa-46b9-b762-fe248f5af96f', 3, 'D63.8, Z94.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('97b17b83-bafa-46b9-b762-fe248f5af96f', '9852b590-4426-4a77-b071-4567c3f53f06', 'D63.8 (anemia in other chronic diseases classified elsewhere) is sequenced with its own ''code first'' requirement pointing to the actual documented cause — since the physician specifically attributes this anemia to the rheumatoid arthritis, NOT to kidney dysfunction, D63.1 (anemia in CHRONIC KIDNEY DISEASE specifically) would be the wrong, contradicting combination code despite the patient having a kidney transplant in their history; this tests whether a candidate reflexively applies the anemia-in-CKD pattern (D63.1) whenever any kidney-related history is present, rather than correctly matching the code to the ACTUALLY documented cause. M06.9 (rheumatoid arthritis) follows as the true underlying cause. Z94.0 (kidney transplant status) is added as the relevant, currently well-functioning transplant status, not implicated in this specific anemia.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('da9bdec2-b0ed-4528-abe1-4850b8104e30', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 59, 'A patient has confirmed early-onset Alzheimer''s disease (diagnosed at age 58, genetically confirmed familial form), currently WITHOUT any documented behavioral, psychotic, mood, or anxiety disturbance. Select the correct, complete coding, contrasting with the late-onset and behavioral-disturbance Alzheimer''s questions tested elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fc4450c3-03ba-4f5c-bbec-831c61c1b162', 'da9bdec2-b0ed-4528-abe1-4850b8104e30', 0, 'G30.1, F02.80');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d80f08a1-0c5c-44ca-976b-a404320dc86e', 'da9bdec2-b0ed-4528-abe1-4850b8104e30', 1, 'G30.0, F02.80');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('918a1539-3761-4e08-995c-bb4e7456067a', 'da9bdec2-b0ed-4528-abe1-4850b8104e30', 2, 'G30.9, F02.80');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1f9634ea-c608-4f72-91f8-441f3e04d560', 'da9bdec2-b0ed-4528-abe1-4850b8104e30', 3, 'G30.0, F03.90');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('da9bdec2-b0ed-4528-abe1-4850b8104e30', 'd80f08a1-0c5c-44ca-976b-a404320dc86e', 'G30.0 (Alzheimer''s disease with EARLY onset) precisely matches the documented age-58, genetically-confirmed early-onset presentation — G30.1 (late onset) would be the wrong specific subtype, and G30.9 (unspecified onset) would under-code the documented specific early-onset finding when the more precise code is available and matches. F02.80 (dementia in other diseases classified elsewhere, WITHOUT behavioral disturbance) follows, matching the documented absence of behavioral/psychotic/mood/anxiety disturbance — a direct contrast with the F02.811 (with agitation) code used correctly in Paper 7''s Alzheimer''s question, where behavioral disturbance WAS documented.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('094928bc-78e6-4ffd-9348-3f0f2233093b', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 60, 'A patient with confirmed renal artery stenosis, physician-documented as the specific cause of the patient''s hypertension (renovascular hypertension), is on home health for blood pressure monitoring pending possible angioplasty. Select the correct, most specific coding, contrasting with essential hypertension.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e5c292f9-8acf-4ac3-af00-53b755bf716c', '094928bc-78e6-4ffd-9348-3f0f2233093b', 0, 'I10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a8a7d05c-ac29-48d0-8693-c54e9f89c757', '094928bc-78e6-4ffd-9348-3f0f2233093b', 1, 'I15.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cb1fac9a-d54b-4db9-b554-5e456977a4c3', '094928bc-78e6-4ffd-9348-3f0f2233093b', 2, 'I15.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d9c2c2f2-10fe-4c39-8640-766968b50ef6', '094928bc-78e6-4ffd-9348-3f0f2233093b', 3, 'I12.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('094928bc-78e6-4ffd-9348-3f0f2233093b', 'a8a7d05c-ac29-48d0-8693-c54e9f89c757', 'I15.0 (renovascular hypertension) is the specific, confirmed secondary-hypertension diagnosis matching the documented renal artery stenosis etiology — I10 (essential/primary hypertension, used throughout this exam series for hypertension WITHOUT a specific identified secondary cause) would be the wrong classification entirely once a specific secondary cause (renal artery stenosis) is confirmed and documented. I15.1 (hypertension secondary to OTHER renal disorders, a less specific code than the renovascular-specific I15.0) doesn''t match as precisely. I12.9 (hypertensive chronic kidney disease, a different combination-code concept requiring documented CKD, not simply a renal-ARTERY cause of hypertension) doesn''t apply here.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5c601103-00c0-4ae7-a551-8fbce6e07bbd', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 61, 'A patient has both mitral valve prolapse (confirmed by echocardiogram, mild, no significant regurgitation) AND separately documented tricuspid valve stenosis with insufficiency (both nonrheumatic, unrelated conditions), on home health for cardiac monitoring. Select the correct, complete coding for both valve findings.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d3e6d3f3-81d3-4350-9d40-f48c26444ab3', '5c601103-00c0-4ae7-a551-8fbce6e07bbd', 0, 'I34.1, I36.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d5d894d0-ffda-4f00-94e0-c5be945fc34d', '5c601103-00c0-4ae7-a551-8fbce6e07bbd', 1, 'I34.0, I36.0, I36.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2e6e82dd-c615-4fc1-b40c-44da0d8b2125', '5c601103-00c0-4ae7-a551-8fbce6e07bbd', 2, 'I34.1, I36.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('34d622a6-47e3-49e4-a9c1-22975b1705d1', '5c601103-00c0-4ae7-a551-8fbce6e07bbd', 3, 'I08.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5c601103-00c0-4ae7-a551-8fbce6e07bbd', 'd3e6d3f3-81d3-4350-9d40-f48c26444ab3', 'I34.1 (nonrheumatic mitral valve prolapse) precisely matches the documented specific mitral finding — I34.0 (mitral insufficiency, a different specific finding not documented here, since only mild prolapse without significant regurgitation is stated) would be the wrong subtype. I36.2 (nonrheumatic tricuspid stenosis WITH insufficiency) is a single combination code that already captures both documented tricuspid findings together — using two separate codes (I36.0 stenosis + I36.1 insufficiency) would be redundant once the combined-finding code is available and matches, the same non-redundant-combination-code principle established repeatedly throughout this exam series. I08.0 (RHEUMATIC disease of both mitral and aortic valves — wrong etiology entirely, both this stem''s findings are nonrheumatic, and aortic valve isn''t even involved) is wrong.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0dd32868-ad1c-464e-a0fe-9c01d6ed35b5', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 62, 'A patient with age-related macular degeneration, confirmed by ophthalmology, type/laterality not further specified in the referral documentation available to home health, is on home health for low-vision safety adaptation and fall-prevention education. Select the correct coding for this general, currently-documented finding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('610f5569-c881-4786-8a03-43a9f969387d', '0dd32868-ad1c-464e-a0fe-9c01d6ed35b5', 0, 'H35.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('642669ae-80fd-4e87-bbc1-6b4bdd17894c', '0dd32868-ad1c-464e-a0fe-9c01d6ed35b5', 1, 'H54.7');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e63cd80d-806d-450d-bef7-97f9a7a09f35', '0dd32868-ad1c-464e-a0fe-9c01d6ed35b5', 2, 'H53.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ddeb7ee3-b964-49c9-b6ae-b6f5872a6e48', '0dd32868-ad1c-464e-a0fe-9c01d6ed35b5', 3, 'H35.361');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0dd32868-ad1c-464e-a0fe-9c01d6ed35b5', '610f5569-c881-4786-8a03-43a9f969387d', 'H35.30 (unspecified macular degeneration) is the correct, complete code when the specific type (exudative/nonexudative) and laterality are not documented in the information actually available — H35.30 itself is fully billable at this level, unlike the more specific H35.31/H35.32 exudative/nonexudative subcategories, which are non-billable parents requiring extensive further subdivision (laterality plus disease stage) that isn''t supported by this stem''s limited documentation. H54.7 (unspecified visual loss, a different, less specific finding) and H53.9 (unspecified visual disturbance) would both under-code the documented specific macular degeneration diagnosis when H35.30 is available and matches.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1d425c26-d49e-4540-a124-ac2cfaf18336', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 63, 'A patient with confirmed vitamin B12 deficiency anemia, physician-documented as specifically due to pernicious anemia (intrinsic factor deficiency, confirmed by antibody testing), is on home health for B12 injection administration. Select the correct, most specific coding, contrasting with a general nutritional B12 deficiency.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1ed402a2-744d-47a2-82e2-55fcf23d0b28', '1d425c26-d49e-4540-a124-ac2cfaf18336', 0, 'D51.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('66221e15-41be-4fb8-b789-2af0ef79561d', '1d425c26-d49e-4540-a124-ac2cfaf18336', 1, 'D51.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dc920bc3-d275-483e-8edc-cd32b68ba70c', '1d425c26-d49e-4540-a124-ac2cfaf18336', 2, 'D53.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dea25dfb-05c2-45f8-8534-76eac73ade4d', '1d425c26-d49e-4540-a124-ac2cfaf18336', 3, 'E56.0');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1d425c26-d49e-4540-a124-ac2cfaf18336', '66221e15-41be-4fb8-b789-2af0ef79561d', 'D51.0 (vitamin B12 deficiency anemia due to intrinsic factor deficiency — the specific pernicious anemia combination code) precisely matches the documented, antibody-confirmed specific etiology — D51.9 (vitamin B12 deficiency anemia, unspecified) would under-code the documented specific pernicious/intrinsic-factor cause when the more precise code is available and matches. D53.9 (nutritional anemia, unspecified, a less specific code that doesn''t identify B12 as the deficient nutrient) and E56.0 (vitamin E deficiency, an entirely different, wrong vitamin) are both incorrect.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1ebec30f-5f89-4918-bc0e-3f6cd4e7fdfc', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 64, 'A patient with confirmed systemic lupus erythematosus has a NEW finding of lupus-related inflammatory arthritis affecting multiple joints, physician-documented as directly part of the SLE presentation (not a separate, co-existing rheumatoid arthritis diagnosis). Select the correct coding, distinguishing SLE-related joint involvement from a separate RA diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b23fe1da-ec6c-4633-9e5a-c44c1da2f92f', '1ebec30f-5f89-4918-bc0e-3f6cd4e7fdfc', 0, 'M32.9, M06.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d2a361be-24a8-480b-bf12-9be831d20e07', '1ebec30f-5f89-4918-bc0e-3f6cd4e7fdfc', 1, 'M32.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2607eb51-bf53-4bf0-a8af-028b69428252', '1ebec30f-5f89-4918-bc0e-3f6cd4e7fdfc', 2, 'M06.9, M32.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6f29598e-02fe-4317-8930-0a4216ec6fe1', '1ebec30f-5f89-4918-bc0e-3f6cd4e7fdfc', 3, 'M06.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1ebec30f-5f89-4918-bc0e-3f6cd4e7fdfc', 'd2a361be-24a8-480b-bf12-9be831d20e07', 'M32.9 (systemic lupus erythematosus, unspecified) is coded ALONE here — M06.9 (rheumatoid arthritis, a SEPARATE, DIFFERENT autoimmune disease) is explicitly NOT added, since the joint involvement is specifically documented as part of the SLE presentation itself, not as a co-existing, independently diagnosed RA — SLE''s own systemic inflammatory process is understood to encompass joint manifestations without requiring a separate RA code stacked on top, mirroring the non-redundant-symptom-code principle established repeatedly throughout this exam series (the MS/ALS non-stacking questions in Paper 9). This tests whether a candidate incorrectly adds a second, distinct rheumatologic diagnosis code simply because joint symptoms are present, rather than correctly reading that this stem attributes the joint findings to the ALREADY-coded SLE, not to a separate condition.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('906ee90f-f8d4-492d-81fe-e628d309e1e6', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 65, 'A patient with a recent PICC line for home IV antibiotics develops confirmed superficial thrombophlebitis of the right tibial vein at an unrelated site (not the PICC insertion site itself, and not documented as PICC-related), requiring warm compresses and monitoring. Select the correct, complete coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('81edf41a-5233-4b56-844d-aa926ef2163e', '906ee90f-f8d4-492d-81fe-e628d309e1e6', 0, 'I80.231');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('033fa4bc-1d59-4dc6-ac4e-4992ec7aa576', '906ee90f-f8d4-492d-81fe-e628d309e1e6', 1, 'T80.1XXA');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2afc83d1-2936-47e6-8354-69f5ae77dc41', '906ee90f-f8d4-492d-81fe-e628d309e1e6', 2, 'L03.115');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d3766159-be4b-4753-8e89-10f6c2fff20d', '906ee90f-f8d4-492d-81fe-e628d309e1e6', 3, 'I82.220');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('906ee90f-f8d4-492d-81fe-e628d309e1e6', '81edf41a-5233-4b56-844d-aa926ef2163e', 'I80.231 (phlebitis and thrombophlebitis of right tibial vein) is the correct, specific code matching the documented finding — since the stem explicitly states this is NOT related to the PICC line (a different, unrelated site and not device-attributed), T80.1XXA (a vascular-catheter-complication code, wrong here since no causal PICC relationship is documented) does not apply, testing whether a candidate reflexively codes any vascular finding in a PICC-line patient as device-related without checking whether the documentation actually supports that causal link. L03.115 (cellulitis, a different diagnosis — skin/soft tissue infection, not venous inflammation) doesn''t match this presentation. I82.220 (thrombosis of the inferior vena cava, the wrong anatomic vessel entirely) is also incorrect.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3902d103-7316-494e-ad24-50dc27abab40', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 66, 'A patient with a history of abdominal surgery (appendectomy, 10 years ago) develops acute abdominal pain, distension, and vomiting, with imaging confirming a small bowel obstruction, physician-documented as likely due to adhesions from the prior surgery, now home for conservative bowel-rest management. Select the correct coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cc56496b-c1b2-475a-bf5f-260504710bdf', '3902d103-7316-494e-ad24-50dc27abab40', 0, 'K56.609');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('78857239-0e0d-45d4-8621-bccc8b01a9a3', '3902d103-7316-494e-ad24-50dc27abab40', 1, 'K56.609, Z98.890');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e8ab47e0-8edd-4e26-974d-c1ed26a6fcac', '3902d103-7316-494e-ad24-50dc27abab40', 2, 'K91.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9a50dc5c-9b29-43fa-a3c0-dd5db63ae969', '3902d103-7316-494e-ad24-50dc27abab40', 3, 'K56.51');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3902d103-7316-494e-ad24-50dc27abab40', 'cc56496b-c1b2-475a-bf5f-260504710bdf', 'K56.609 (unspecified intestinal obstruction, unspecified as to partial versus complete) is the correct code for this confirmed bowel obstruction — this tests whether a candidate correctly recognizes that this obstruction, while suspected to be adhesion-related, is coded to the general obstruction code rather than the postsurgical-complication-specific K91.3x family (postprocedural intestinal obstruction), since the physician''s documentation frames this as ''likely due to'' adhesions rather than definitively, directly attributing it as a postprocedural complication of that specific prior surgery; K91.30 would require that more direct postprocedural causal attribution, which this stem''s more tentative ''likely due to'' phrasing doesn''t quite establish to the same standard as the explicit causal-attribution language used in other adverse-effect and postprocedural-complication questions throughout this exam series.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('892046e4-6184-472a-bc51-f3f5d2cab139', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 67, 'A patient with confirmed intestinal adhesions from a prior surgery has a NEW bowel obstruction, with the physician EXPLICITLY documenting this specific obstruction as a direct postprocedural complication of that prior surgery, currently PARTIAL (not complete), managed conservatively at home. Select the correct, complete coding, contrasting with the more tentative causal-attribution question tested elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cd35941b-7f55-428f-9ef3-e27c8bfc1adf', '892046e4-6184-472a-bc51-f3f5d2cab139', 0, 'K56.609');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('697f85c3-02b3-4a46-ac56-ddfaa59b8473', '892046e4-6184-472a-bc51-f3f5d2cab139', 1, 'K56.51');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f27ca366-d52e-43a6-8492-01eca54d4d5a', '892046e4-6184-472a-bc51-f3f5d2cab139', 2, 'K91.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b2db7cc5-6882-4957-89c6-6859ca51fb58', '892046e4-6184-472a-bc51-f3f5d2cab139', 3, 'K91.30, K56.51');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('892046e4-6184-472a-bc51-f3f5d2cab139', '697f85c3-02b3-4a46-ac56-ddfaa59b8473', 'K56.51 (intestinal adhesions with partial obstruction) is a single combination code that already captures both the adhesions AND the specific partial-obstruction complication together — this is a more specific, dedicated combination code than the general K91.30 (postprocedural intestinal obstruction, unspecified as to partial/complete) or K56.609 (general obstruction, no adhesion-specificity), matching the documented explicit adhesion-causation AND partial-obstruction specificity together in one precise code. This contrasts directly with the earlier bowel obstruction question in this paper, where the more tentative ''likely due to'' documentation didn''t support this same level of specific, confirmed causal attribution.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('c70b5493-5dce-4ea5-a7a1-44c92a1258e8', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 68, 'A patient with severe COPD has chronic respiratory failure, physician documentation stating only ''chronic respiratory failure'' without specifying whether hypoxia or hypercapnia is present. Select the correct coding for this level of documentation, contrasting with the more specific J96.11/J96.12 codes used correctly elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('400779c9-780b-4bdd-a3be-974e028c008b', 'c70b5493-5dce-4ea5-a7a1-44c92a1258e8', 0, 'J96.11');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ffde37f6-d80d-4c0d-99df-d37d208ddb9a', 'c70b5493-5dce-4ea5-a7a1-44c92a1258e8', 1, 'J96.12');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('353f8d62-05a7-40aa-b75a-ba091ed689c7', 'c70b5493-5dce-4ea5-a7a1-44c92a1258e8', 2, 'J96.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a870950a-8d14-4808-9aee-11ea31e49f98', 'c70b5493-5dce-4ea5-a7a1-44c92a1258e8', 3, 'J96.91');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('c70b5493-5dce-4ea5-a7a1-44c92a1258e8', '353f8d62-05a7-40aa-b75a-ba091ed689c7', 'J96.10 (chronic respiratory failure, unspecified whether with hypoxia or hypercapnia) is the correct code precisely because this stem''s documentation does NOT specify which of the two — using J96.11 (chronic respiratory failure WITH hypoxia, the specific code correctly used in Paper 8 when hypoxia specifically WAS documented) or J96.12 (WITH both hypoxia and hypercapnia, used correctly in Paper 8 when both were documented) here would incorrectly add specificity not actually supported by THIS stem''s more limited documentation; this tests whether a candidate defaults to a previously-seen specific code from memory rather than correctly matching the code to what''s actually documented in each individual stem. J96.91 (respiratory failure, unspecified, WITH hypoxia — a different code family entirely, missing the chronic-vs-acute distinction) doesn''t match either.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ff12644b-938b-4409-a268-5cbfd9b95585', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 69, 'A patient with prostate cancer (treated 4 years ago with radical prostatectomy, PSA undetectable, no evidence of recurrence) is admitted to home health for an unrelated orthopedic issue. Select the correct coding for the prostate cancer status, contrasting with an active/current prostate cancer diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c78dd9da-27ff-459f-ba38-59031fe9b4e2', 'ff12644b-938b-4409-a268-5cbfd9b95585', 0, 'C61');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('45f448c2-41cd-41e4-ad2b-9279c4b49f62', 'ff12644b-938b-4409-a268-5cbfd9b95585', 1, 'Z85.46');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a01266a1-6e58-403a-87c3-9c70e45fe35b', 'ff12644b-938b-4409-a268-5cbfd9b95585', 2, 'N40.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('435a754d-5bef-4b09-bced-cba28195ce5b', 'ff12644b-938b-4409-a268-5cbfd9b95585', 3, 'C61, Z85.46');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ff12644b-938b-4409-a268-5cbfd9b95585', '45f448c2-41cd-41e4-ad2b-9279c4b49f62', 'Z85.46 (personal history of malignant neoplasm of prostate) is correct since the cancer has been surgically treated with undetectable PSA and no evidence of recurrence — matching the identical active-vs-history distinction established with the breast cancer question in Paper 7 and the prostate-specific structure of that same principle. C61 (malignant neoplasm of prostate, an ACTIVE cancer code) would incorrectly code the resolved cancer as still active. N40.2 (nodular prostate without LUTS — an unrelated benign finding) doesn''t apply to this cancer-history scenario at all.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('aaef3b88-a480-4eef-af49-fff9101b07c3', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 70, 'A patient with no prior urologic history is found by the home health nurse to have asymptomatic microscopic hematuria on a routine urinalysis ordered for an unrelated reason, with the physician planning outpatient urology referral for further workup, no diagnosis established yet. Select the correct coding for this specific, currently undiagnosed finding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0e3b004f-237f-4187-8966-375d6b40c495', 'aaef3b88-a480-4eef-af49-fff9101b07c3', 0, 'C67.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('756aa774-d909-4ad6-9748-103af94d5e6b', 'aaef3b88-a480-4eef-af49-fff9101b07c3', 1, 'N28.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6db60043-4858-4fae-b9cb-127096993557', 'aaef3b88-a480-4eef-af49-fff9101b07c3', 2, 'R31.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0e849ee1-5777-4e97-8c56-940900319a6d', 'aaef3b88-a480-4eef-af49-fff9101b07c3', 3, 'C64.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('aaef3b88-a480-4eef-af49-fff9101b07c3', '6db60043-4858-4fae-b9cb-127096993557', 'R31.21 (asymptomatic microscopic hematuria) is the specific, correct finding code precisely matching the documented presentation — coding this as C67.9 (bladder cancer) or C64.9 (kidney cancer) would be premature and incorrect, since no diagnosis has been established yet and urology workup is only just being initiated, mirroring the same not-yet-confirmed-diagnosis principle tested with the indeterminate lung nodule question earlier in this paper. N28.89 (other specified kidney/ureter disorders, a nonspecific catch-all) would under-code the documented specific hematuria finding when the more precise R31.21 code is available and matches.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5f7710d2-9d04-41df-8a05-009853d10900', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 71, 'A patient with a permanent gastrostomy tube (for chronic dysphagia) has the home health nurse perform routine, scheduled tube site care and flushing, with no complications documented. Select the correct coding for this routine encounter, distinguishing routine care from a complication.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f6bdc463-4ae5-4427-837d-f1f4bf0bf65e', '5f7710d2-9d04-41df-8a05-009853d10900', 0, 'K91.89, Z93.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3a6f3cc9-d817-4cef-9dd8-8b304e4c01aa', '5f7710d2-9d04-41df-8a05-009853d10900', 1, 'Z43.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('961db312-5174-42dd-be9d-9146da86647f', '5f7710d2-9d04-41df-8a05-009853d10900', 2, 'Z93.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('24d4835b-7965-4a4b-adf8-4acdfcfc1873', '5f7710d2-9d04-41df-8a05-009853d10900', 3, 'Z43.1, Z93.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5f7710d2-9d04-41df-8a05-009853d10900', '3a6f3cc9-d817-4cef-9dd8-8b304e4c01aa', 'Z43.1 (encounter for attention to gastrostomy) is the specific aftercare/attention code for routine, uncomplicated gastrostomy tube care — mirroring the Z43.5 cystostomy-attention and Z43.6 nephrostomy-attention pattern established in Paper 9, applied here to gastrostomy tube care instead. K91.89 (other postprocedural digestive complications) would incorrectly imply a complication occurred, contradicted by the stem''s explicit ''no complications documented.'' Z93.1 (gastrostomy status, a general presence-status code) alone would under-represent that THIS specific encounter is for active attention/care, not simply documenting ongoing status.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1e092a77-e073-42a0-9be7-9274e571c161', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 72, 'A patient with bipolar disorder is currently experiencing a severe manic episode, physician-confirmed as WITHOUT psychotic features, requiring close psychiatric home health monitoring and medication adjustment. Select the correct, complete coding, contrasting with the manic-with-psychotic-features question tested elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a06d25b9-6af1-444b-8d1b-7feebddaa53e', '1e092a77-e073-42a0-9be7-9274e571c161', 0, 'F31.13');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0ac5e8d6-67a9-480f-a5af-89447e9e307e', '1e092a77-e073-42a0-9be7-9274e571c161', 1, 'F31.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4aaacd6f-2994-41ed-a642-56cbe66f00c7', '1e092a77-e073-42a0-9be7-9274e571c161', 2, 'F31.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('34435d3a-543c-4916-a73b-f21207889ba1', '1e092a77-e073-42a0-9be7-9274e571c161', 3, 'F31.30');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1e092a77-e073-42a0-9be7-9274e571c161', 'a06d25b9-6af1-444b-8d1b-7feebddaa53e', 'F31.13 (bipolar disorder, current episode manic without psychotic features, severe) precisely matches the documented episode type, severity, AND explicit absence of psychotic features — F31.2 (the code correctly used in Paper 7''s Q22 for manic SEVERE WITH psychotic features) would incorrectly add psychotic features explicitly ruled out by THIS stem''s documentation, testing whether a candidate reflexively applies the previously-seen F31.2 code from memory rather than checking this stem''s specific ''without psychotic features'' detail. F31.9 (unspecified) and F31.30 (the wrong episode type — depressed, not manic) would both under-code or misclassify the documented presentation.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('e1dff360-b130-4e7f-99c6-bed7a9dd679d', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 73, 'A patient has chronic, persistent mild depressive symptoms lasting over 2 years, physician-documented as dysthymic disorder, distinct from a major depressive episode, managed with ongoing counseling. Select the correct coding, distinguishing dysthymia from major depressive disorder.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('389b5882-5cb7-4944-9499-145ca6ccf8a8', 'e1dff360-b130-4e7f-99c6-bed7a9dd679d', 0, 'F33.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ea38366e-b8c6-408f-8fd8-38f445c80a9c', 'e1dff360-b130-4e7f-99c6-bed7a9dd679d', 1, 'F34.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5f4cbc43-5f4c-4250-b983-9bd161c1c19b', 'e1dff360-b130-4e7f-99c6-bed7a9dd679d', 2, 'F32.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2261fd7c-b1dd-4d9a-8e97-48283a4c7a28', 'e1dff360-b130-4e7f-99c6-bed7a9dd679d', 3, 'F39');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('e1dff360-b130-4e7f-99c6-bed7a9dd679d', 'ea38366e-b8c6-408f-8fd8-38f445c80a9c', 'F34.1 (dysthymic disorder) is the specific, correct diagnosis matching the documented chronic, persistent, milder depressive pattern — a genuinely distinct diagnostic category from major depressive disorder (F32/F33 family, used throughout this exam series for discrete depressive episodes), reflecting a different symptom duration/severity pattern (chronic, low-grade, at least 2 years) rather than episodic, more acute depression. F39 (unspecified mood disorder, a nonspecific catch-all) would under-code the documented specific dysthymia diagnosis.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1c638f78-d959-4605-a6ee-a12e87c5cade', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 74, 'A patient has confirmed hoarding disorder, physician-documented as distinct from OCD (no obsessive thoughts or compulsive rituals beyond the hoarding behavior itself), creating a home safety hazard requiring home health environmental safety assessment and coordination with a professional organizing service. Select the correct coding, distinguishing hoarding disorder from OCD.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('386979bf-2c04-4db8-9604-a017840f3e19', '1c638f78-d959-4605-a6ee-a12e87c5cade', 0, 'F42.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3eb25e22-135e-4e82-b4b0-7011b0ee1c33', '1c638f78-d959-4605-a6ee-a12e87c5cade', 1, 'F42.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('12b43d66-5920-4c3c-a1fb-2101f579ce49', '1c638f78-d959-4605-a6ee-a12e87c5cade', 2, 'F42.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('66ac864b-797d-4a79-bf46-58dc21e728e8', '1c638f78-d959-4605-a6ee-a12e87c5cade', 3, 'F42.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1c638f78-d959-4605-a6ee-a12e87c5cade', '3eb25e22-135e-4e82-b4b0-7011b0ee1c33', 'F42.3 (hoarding disorder) is the specific, correct diagnosis matching the documented presentation — this is a genuinely distinct diagnostic category from OCD (F42.9/F42.2), a distinction the DSM-5 and ICD-10-CM both formally recognize, and this stem specifically documents hoarding WITHOUT the obsessive-thought/compulsive-ritual pattern that would characterize true OCD. F42.4 (excoriation/skin-picking disorder, a different specific body-focused repetitive behavior) doesn''t match this presentation at all.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0e6f89c1-77c6-4a4f-9cd6-7fcd99295d1d', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 75, 'A patient has a NEW transient episode of one-sided weakness and slurred speech lasting 20 minutes, fully resolved by the time of physician evaluation, with imaging showing no acute infarct, physician-documented as a TIA, being monitored at home pending outpatient neurology workup. Select the correct coding, distinguishing TIA from a completed stroke.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f7c4e13a-ccb7-4c0b-8bae-7137f0eed920', '0e6f89c1-77c6-4a4f-9cd6-7fcd99295d1d', 0, 'I63.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2aa1c8d4-6e45-4f5d-8224-ab6107b57345', '0e6f89c1-77c6-4a4f-9cd6-7fcd99295d1d', 1, 'G45.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0a8ce923-09fa-43ab-a8f0-cc5bbb4ec561', '0e6f89c1-77c6-4a4f-9cd6-7fcd99295d1d', 2, 'I67.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('421a19c3-9404-4c39-9fe4-d82f1adda00c', '0e6f89c1-77c6-4a4f-9cd6-7fcd99295d1d', 3, 'G45.4');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0e6f89c1-77c6-4a4f-9cd6-7fcd99295d1d', '2aa1c8d4-6e45-4f5d-8224-ab6107b57345', 'G45.9 (transient cerebral ischemic attack, unspecified — TIA) precisely matches the documented transient, fully-resolved presentation with no acute infarct on imaging — I63.9 (cerebral infarction, an ACTIVE, completed-stroke code) would be incorrect here, since imaging specifically confirms no infarct occurred, directly distinguishing TIA (transient, no lasting tissue damage) from a completed ischemic stroke, a genuinely important clinical and coding distinction. G45.4 (transient global amnesia, a different, distinct transient neurological syndrome involving memory rather than motor/speech function) doesn''t match this presentation''s specific weakness-and-speech-slurring symptoms.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('8c06af26-6414-4dda-b133-4842c9b96ea1', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 76, 'A patient with colon cancer (treated 6 years ago with hemicolectomy, no evidence of recurrence on recent surveillance colonoscopy) is admitted to home health for an unrelated cardiac issue. Select the correct coding for the colon cancer status, contrasting with active colon cancer.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4c518434-80c7-4c72-accf-75571162de98', '8c06af26-6414-4dda-b133-4842c9b96ea1', 0, 'C18.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0a409573-c7a2-44d3-b809-a1c5a8ffbcff', '8c06af26-6414-4dda-b133-4842c9b96ea1', 1, 'Z85.038');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3e496f6a-29bd-410d-931a-a2575822f47f', '8c06af26-6414-4dda-b133-4842c9b96ea1', 2, 'K63.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fba22765-53d4-45ef-8379-bc227412bb30', '8c06af26-6414-4dda-b133-4842c9b96ea1', 3, 'C18.9, Z85.038');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('8c06af26-6414-4dda-b133-4842c9b96ea1', '0a409573-c7a2-44d3-b809-a1c5a8ffbcff', 'Z85.038 (personal history of other malignant neoplasm of large intestine) is correct since the cancer has been surgically treated with no evidence of recurrence on recent surveillance — matching the same active-vs-history distinction established repeatedly throughout this exam series. C18.9 (malignant neoplasm of colon, an ACTIVE cancer code) would incorrectly code the resolved cancer as still active. K63.5 (polyp of colon, an unrelated, different finding) doesn''t apply to this cancer-history scenario.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5914475e-32c4-495d-8778-c0f9cf45f287', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 77, 'A patient with Crohn''s disease, confirmed by the physician as currently WITHOUT any documented complications (no fistula, no obstruction, no abscess — stable on maintenance medication), is on home health for medication management and nutritional monitoring. Select the correct, most specific coding, contrasting with the Crohn''s-with-fistula combination code tested elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dd7623ee-5da2-4e61-b3a1-82561efa0a1d', '5914475e-32c4-495d-8778-c0f9cf45f287', 0, 'K50.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f56eb8dd-b3c0-4e14-a9ad-7b36803045b2', '5914475e-32c4-495d-8778-c0f9cf45f287', 1, 'K50.014');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e2dc15db-2393-46a6-b61b-286f1ee515cd', '5914475e-32c4-495d-8778-c0f9cf45f287', 2, 'K51.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3139f680-5752-4c8d-a764-22220a22d4d8', '5914475e-32c4-495d-8778-c0f9cf45f287', 3, 'K50.90, K51.90');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5914475e-32c4-495d-8778-c0f9cf45f287', 'dd7623ee-5da2-4e61-b3a1-82561efa0a1d', 'K50.90 (Crohn''s disease, unspecified, WITHOUT complications) precisely matches the documented uncomplicated, stable presentation — a direct contrast with K50.014 (the combination code correctly used in Paper 7''s Q45 for Crohn''s WITH a documented fistula complication), testing whether a candidate correctly matches the code to what''s actually documented in each specific stem rather than defaulting to memory of a previously-seen, more complex combination code. K51.90 (ulcerative colitis, an entirely different inflammatory bowel disease, not Crohn''s) is the wrong specific IBD diagnosis.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2398897e-0670-4796-9876-12aaef6896b7', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 78, 'A patient with confirmed heterozygous familial hypercholesterolemia (genetically confirmed, a hereditary lipid disorder distinct from typical age/lifestyle-related hyperlipidemia) is on home health for a new PCSK9-inhibitor injection teaching. Select the correct, most specific coding, distinguishing familial hypercholesterolemia from general hyperlipidemia.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b538e1d4-05de-4d8a-9360-2b8a678eb833', '2398897e-0670-4796-9876-12aaef6896b7', 0, 'E78.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4db2c099-d5cd-402b-bd99-9d6aabe96e8e', '2398897e-0670-4796-9876-12aaef6896b7', 1, 'E78.019');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c2e46feb-32c5-4709-8bfa-08f250462bc1', '2398897e-0670-4796-9876-12aaef6896b7', 2, 'E78.011');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('82184257-f789-4880-8be4-bf12a0850579', '2398897e-0670-4796-9876-12aaef6896b7', 3, 'E78.00');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2398897e-0670-4796-9876-12aaef6896b7', 'c2e46feb-32c5-4709-8bfa-08f250462bc1', 'E78.011 (heterozygous familial hypercholesterolemia) precisely matches the documented genetically-confirmed specific subtype — E78.019 (familial hypercholesterolemia, unspecified subtype) would under-code the documented specific heterozygous finding when the more precise code is available and matches. E78.5 (hyperlipidemia, unspecified) and E78.00 (pure hypercholesterolemia, unspecified) would both fail to capture the documented specific, genetically-distinct familial diagnosis driving the specialized PCSK9-inhibitor therapy choice.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('1ce0e5b6-cb25-43d8-b2d4-f5f5b70ab6e0', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 79, 'A patient on a statin develops severe muscle pain and confirmed rhabdomyolysis (elevated CK, myoglobinuria), physician-documented as an adverse effect of the correctly-dosed statin, with resulting acute kidney injury specifically due to tubular necrosis from the myoglobin. Select the correct, complete coding reflecting this full causal chain.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b30b343e-45bd-48b0-83cb-27e66c234c40', '1ce0e5b6-cb25-43d8-b2d4-f5f5b70ab6e0', 0, 'T46.6X5A, M62.82, N17.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9532f950-fc87-4101-b6b6-d5ef18c59722', '1ce0e5b6-cb25-43d8-b2d4-f5f5b70ab6e0', 1, 'M62.82, T46.6X5A, N17.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6d49bf96-2d09-4c41-a8ad-2ec01b0d70b7', '1ce0e5b6-cb25-43d8-b2d4-f5f5b70ab6e0', 2, 'T46.6X5A, N17.0, M62.82');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('857a0f86-2135-46b4-9c4b-1043fe18a1d2', '1ce0e5b6-cb25-43d8-b2d4-f5f5b70ab6e0', 3, 'N17.0, M62.82, T46.6X5A');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('1ce0e5b6-cb25-43d8-b2d4-f5f5b70ab6e0', 'b30b343e-45bd-48b0-83cb-27e66c234c40', 'T46.6X5A (adverse effect of antihyperlipidemic drugs — the same statin-adverse-effect code correctly used in Paper 8''s Q29 for statin-induced rhabdomyolysis) is sequenced first per the adverse-effect convention. M62.82 (rhabdomyolysis) follows as the direct manifestation. N17.0 (acute kidney failure WITH tubular necrosis) is added last as the specific, documented downstream renal complication — using the precise tubular-necrosis subtype rather than a generic AKI code, since the physician specifically documents tubular necrosis as the mechanism, matching the specific-over-generic-code principle tested throughout this exam series.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5b640d4f-d857-4be1-b366-4d9364584d4f', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 80, 'A patient with obesity has confirmed nonalcoholic steatohepatitis (NASH), biopsy-confirmed, distinct from simple fatty liver, requiring close monitoring for progression to cirrhosis. Select the correct, most specific coding, contrasting NASH from simple hepatic steatosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fbd0d47d-665d-4f89-810a-82eecbb00dad', '5b640d4f-d857-4be1-b366-4d9364584d4f', 0, 'K76.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b2f0074d-f761-4b6e-9642-08eaa89a1469', '5b640d4f-d857-4be1-b366-4d9364584d4f', 1, 'K75.81');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('05fb7f1b-cb3a-4f4c-adb7-1be497a3b434', '5b640d4f-d857-4be1-b366-4d9364584d4f', 2, 'K74.60');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3ee77bff-b83d-4cb2-a748-6740c11c2b27', '5b640d4f-d857-4be1-b366-4d9364584d4f', 3, 'E88.09');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5b640d4f-d857-4be1-b366-4d9364584d4f', 'b2f0074d-f761-4b6e-9642-08eaa89a1469', 'K75.81 (nonalcoholic steatohepatitis) precisely matches the documented biopsy-confirmed specific diagnosis — K76.0 (fatty change of liver, NOT elsewhere classified — simple steatosis WITHOUT the inflammatory/hepatitis component) would under-code the documented, more severe NASH diagnosis, a genuinely important distinction since NASH (with active inflammation) carries meaningfully different progression risk than simple fatty liver alone. K74.60 (cirrhosis, a later-stage complication not yet documented as present here) would be premature. E88.09 (an unrelated metabolic disorder code) doesn''t apply.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b3325828-abe2-42e5-b613-4c7828b527c5', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 81, 'A patient develops sudden left-arm weakness following a highly stressful family event, with full neurological workup (MRI, EEG) completely normal, physician-documented as conversion disorder with motor symptom, distinct from a true neurological deficit. Select the correct coding, addressing whether this is coded as a neurological condition.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c0943f05-bef2-4067-bf4c-c78dcdad9afa', 'b3325828-abe2-42e5-b613-4c7828b527c5', 0, 'G81.94');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d695c706-dc63-4bb2-be3f-5a5256053a36', 'b3325828-abe2-42e5-b613-4c7828b527c5', 1, 'F44.4');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('354df86b-16fe-4261-bb7b-b1a9ad8b88a9', 'b3325828-abe2-42e5-b613-4c7828b527c5', 2, 'F45.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('07fdfa6b-5ded-4f92-a90c-4ea85e89e132', 'b3325828-abe2-42e5-b613-4c7828b527c5', 3, 'F44.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b3325828-abe2-42e5-b613-4c7828b527c5', 'd695c706-dc63-4bb2-be3f-5a5256053a36', 'F44.4 (conversion disorder with motor symptom or deficit) is the specific, correct psychiatric diagnosis matching the documented presentation and normal neurological workup — G81.94 (hemiplegia, a NEUROLOGICAL code) would be incorrect, since the physician has specifically documented this as a psychiatric conversion disorder, not a true neurological deficit, despite the physical motor symptom; this tests a genuinely important distinction, since conversion disorder produces real, physically-manifesting symptoms without an identifiable neurological or medical cause. F45.1 (undifferentiated somatoform disorder, a different, less specific diagnostic category) and F44.9 (unspecified conversion disorder, less specific than the documented motor-symptom subtype) are both less precise matches.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d88a496c-284b-4365-a86a-b63371eeb826', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 82, 'A home health nurse identifies impacted cerumen (earwax) in the right ear during a routine assessment, physician-ordered for removal at the next visit, causing mild hearing difficulty. Select the correct, most specific coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a3891c6b-b456-4342-a688-6df2f28ed892', 'd88a496c-284b-4365-a86a-b63371eeb826', 0, 'H61.20');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2dee5627-e57e-46fc-bf82-b1305413eb92', 'd88a496c-284b-4365-a86a-b63371eeb826', 1, 'H61.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('05453922-2d36-4fa1-9b22-2ac03cfa1535', 'd88a496c-284b-4365-a86a-b63371eeb826', 2, 'H92.09');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a7fbb834-7284-4003-8fb4-f108eb4b6c83', 'd88a496c-284b-4365-a86a-b63371eeb826', 3, 'H66.90');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d88a496c-284b-4365-a86a-b63371eeb826', '2dee5627-e57e-46fc-bf82-b1305413eb92', 'H61.21 (impacted cerumen, right ear) is the specific, laterality-matched code for this documented finding — H61.20 (unspecified ear) would under-code the documented right-ear laterality when the more precise code is available and matches. H92.09 (otalgia — ear pain, a different symptom not documented here) and H66.90 (otitis media, an unrelated infectious diagnosis not documented) both fail to match this specific cerumen-impaction finding.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('495a1049-35f0-4a3a-8f00-3d85a65997ce', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 83, 'A patient with a right heel pressure ulcer, stage 1 at SOC, is found at a follow-up visit 2 weeks later to have progressed to stage 2 with a small area of purple discoloration suggestive of deep tissue injury nearby but not yet open. Select the correct coding for the CURRENT stage 2 finding specifically, distinguishing it from a separate deep tissue injury diagnosis.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a904fc5f-5143-4bee-b7ca-801e1817f29e', '495a1049-35f0-4a3a-8f00-3d85a65997ce', 0, 'L89.611');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f2024968-fcad-4064-8e31-5ab3669f6601', '495a1049-35f0-4a3a-8f00-3d85a65997ce', 1, 'L89.612');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c1dbce37-4f87-4e46-8bee-c7676ba7a688', '495a1049-35f0-4a3a-8f00-3d85a65997ce', 2, 'L89.612, L89.006');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('cbad2c69-d4a7-48f2-9ae8-7a6c5f3c545e', '495a1049-35f0-4a3a-8f00-3d85a65997ce', 3, 'L89.006');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('495a1049-35f0-4a3a-8f00-3d85a65997ce', 'f2024968-fcad-4064-8e31-5ab3669f6601', 'L89.612 (pressure ulcer of right heel, stage 2) is the correct code reflecting the CURRENT documented stage, per the current-status pressure-ulcer-staging principle established repeatedly throughout this exam series (Paper 7 and Paper 8) — L89.611 (stage 1) would be outdated, no longer reflecting the current, progressed status. L89.006 (deep tissue damage, a genuinely distinct staging category reserved for a suspected deep tissue injury that hasn''t yet opened into a visible stage 1-4 ulcer) is not separately added here, since the stem describes this as ''nearby'' but the actual current, primary finding being coded is the now-open stage 2 ulcer itself, not a separate, distinct deep-tissue-injury site requiring its own code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('245b926d-924a-472b-9ad1-ee6d09b60e36', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 84, 'A patient has a documented history of recurrent UTIs (4 episodes in the past year, most recently 3 months ago, currently asymptomatic with a negative urinalysis today) is admitted to home health for an unrelated orthopedic issue. Select the correct coding for the UTI history, addressing whether an active infection code is used.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('91052b2f-a125-4f53-b3bb-49f171837e50', '245b926d-924a-472b-9ad1-ee6d09b60e36', 0, 'N39.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0231e9b4-9ad2-4b99-9c12-c3ecc7be33a4', '245b926d-924a-472b-9ad1-ee6d09b60e36', 1, 'Z87.440');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('34ba8fd2-6559-40b6-aa75-51cea540ad4b', '245b926d-924a-472b-9ad1-ee6d09b60e36', 2, 'R82.71');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('fd1deac2-1448-468d-b0e8-c75587248164', '245b926d-924a-472b-9ad1-ee6d09b60e36', 3, 'N39.0, Z87.440');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('245b926d-924a-472b-9ad1-ee6d09b60e36', '0231e9b4-9ad2-4b99-9c12-c3ecc7be33a4', 'Z87.440 (personal history of urinary tract infections) is the correct code for this documented history of recurrent, but currently resolved and asymptomatic, UTIs — N39.0 (urinary tract infection, an ACTIVE infection code) would be incorrect, since today''s urinalysis is explicitly negative and the patient is asymptomatic, meaning there is no currently active infection to code, only a clinically relevant history of recurrence. R82.71 (bacteriuria, a different specific lab finding) doesn''t apply since no bacteriuria is documented on today''s testing either.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('ff5516fa-50eb-44e6-8b0e-3ec12a853ad1', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 85, 'A patient with confirmed SIADH (syndrome of inappropriate antidiuretic hormone secretion), physician-documented as due to a small cell lung cancer (paraneoplastic syndrome), has resulting severe hyponatremia requiring careful fluid restriction managed at home. Select the correct, complete coding, addressing sequencing between SIADH and the resulting sodium abnormality.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('944cbe4e-29a0-483a-ad05-e10f228a067e', 'ff5516fa-50eb-44e6-8b0e-3ec12a853ad1', 0, 'E87.1, E22.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5c5976af-7a3b-4256-83f5-b0f9a20574be', 'ff5516fa-50eb-44e6-8b0e-3ec12a853ad1', 1, 'E22.2, E87.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('79fe004c-21c1-4a3e-aba4-0a948c9d3cba', 'ff5516fa-50eb-44e6-8b0e-3ec12a853ad1', 2, 'E22.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5d47129b-673c-4a07-b6b2-cab3ae64238f', 'ff5516fa-50eb-44e6-8b0e-3ec12a853ad1', 3, 'E87.1');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('ff5516fa-50eb-44e6-8b0e-3ec12a853ad1', '5c5976af-7a3b-4256-83f5-b0f9a20574be', 'E22.2 (syndrome of inappropriate secretion of antidiuretic hormone) is sequenced first as the specific, confirmed endocrine diagnosis directly causing the resulting sodium abnormality. E87.1 (hyponatremia) follows as the resulting manifestation — this pairing mirrors the standard etiology-then-manifestation sequencing pattern used consistently throughout this exam series, since SIADH is the confirmed cause of the hyponatremia, not simply a coexisting, unrelated finding. Note the underlying lung cancer, while mentioned as the ultimate paraneoplastic cause, is not necessarily required in this specific two-code answer focused on the SIADH-hyponatremia relationship itself.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('98c126c5-3021-4c5f-be23-d898abef3779', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 86, 'A patient develops sudden, severe left leg pain, pallor, and pulselessness, confirmed by CT angiogram as an acute arterial embolism of the lower extremity, requiring emergent embolectomy, now home for post-procedure monitoring. Select the correct, most specific coding for this acute arterial event, distinguishing it from chronic atherosclerotic peripheral artery disease.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9d7c1d92-c766-4a63-9919-d33bfab7f094', '98c126c5-3021-4c5f-be23-d898abef3779', 0, 'I70.92');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('aa93ab36-8ef7-4fff-a164-1531a18d77b3', '98c126c5-3021-4c5f-be23-d898abef3779', 1, 'I74.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a44a4dc4-891b-430d-885c-8dac7a78d6db', '98c126c5-3021-4c5f-be23-d898abef3779', 2, 'I70.90');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a4de224f-1f3b-4031-bb24-cf5c3a1c0df9', '98c126c5-3021-4c5f-be23-d898abef3779', 3, 'I74.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('98c126c5-3021-4c5f-be23-d898abef3779', 'aa93ab36-8ef7-4fff-a164-1531a18d77b3', 'I74.3 (embolism and thrombosis of arteries of the lower extremities) precisely matches the documented ACUTE arterial embolic event — this is a genuinely distinct clinical entity and code family from I70.9x (chronic atherosclerotic peripheral artery disease, the more gradual, chronic occlusive process tested elsewhere in this exam series), representing a sudden, acute vascular emergency rather than a chronic, progressive condition. I74.2 (upper extremity, wrong anatomic location — this stem specifically documents the leg) doesn''t match.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('45ad2b43-b15e-467b-b134-0aa1957756fe', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 87, 'A patient on hemodialysis has recurring episodes of hypotension specifically occurring during dialysis sessions, physician-documented as directly related to the dialysis process (intradialytic fluid shifts), distinct from general or drug-induced hypotension. Select the correct, most specific coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4abdf46f-239f-4a74-93c2-422fc4e875c5', '45ad2b43-b15e-467b-b134-0aa1957756fe', 0, 'I95.9');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a47076e3-f182-4bdb-9785-0e9e2dba99d6', '45ad2b43-b15e-467b-b134-0aa1957756fe', 1, 'I95.2');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6bd6a0ec-d590-444d-af43-d58f2e632133', '45ad2b43-b15e-467b-b134-0aa1957756fe', 2, 'I95.3');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('8538952b-b2f8-4531-ba1d-19654d47874c', '45ad2b43-b15e-467b-b134-0aa1957756fe', 3, 'R00.2');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('45ad2b43-b15e-467b-b134-0aa1957756fe', '6bd6a0ec-d590-444d-af43-d58f2e632133', 'I95.3 (hypotension of hemodialysis) is the specific, dedicated combination code precisely matching the documented dialysis-related hypotension pattern — I95.9 (unspecified hypotension) and I95.2 (drug-induced hypotension, the wrong specific etiology, not documented here) would both fail to capture the documented dialysis-specific mechanism when the more precise, dedicated I95.3 code is available and matches. R00.2 (palpitations, an unrelated symptom) doesn''t apply to this presentation.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('62c605c0-e08a-49ae-b454-e4d9ad2426da', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 88, 'A patient reports recurrent, brief episodes of spinning vertigo triggered specifically by head position changes (rolling over in bed, looking up), confirmed by physician exam with positive Dix-Hallpike testing, affecting both ears. Select the correct, most specific coding, distinguishing this from a nonspecific dizziness symptom code.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6e9bc7ca-ff36-4e06-990f-b945042b7b65', '62c605c0-e08a-49ae-b454-e4d9ad2426da', 0, 'R42');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('380a066b-d05e-45c5-897d-0b49a3a323f8', '62c605c0-e08a-49ae-b454-e4d9ad2426da', 1, 'H81.10');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9803d822-78e1-4b8e-b833-82ed5b406eed', '62c605c0-e08a-49ae-b454-e4d9ad2426da', 2, 'H81.13');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c6e3c304-4d1b-4171-acf9-de902a4e79b1', '62c605c0-e08a-49ae-b454-e4d9ad2426da', 3, 'R42, H81.13');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('62c605c0-e08a-49ae-b454-e4d9ad2426da', '9803d822-78e1-4b8e-b833-82ed5b406eed', 'H81.13 (benign paroxysmal vertigo, bilateral) precisely matches the documented, Dix-Hallpike-confirmed specific diagnosis AND the documented bilateral finding — H81.10 (unspecified ear) would under-code the documented bilateral laterality when the more precise code is available and matches. R42 (dizziness and giddiness, a nonspecific symptom code) would under-code the documented specific BPPV diagnosis, the same specific-over-generic-code principle tested throughout this exam series — and is not separately needed alongside the more specific diagnosis code.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('b192f308-8749-4fee-93ef-4f7661fe986c', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 89, 'A patient with a recent facial laceration (sutured 5 days ago) develops surrounding facial cellulitis, confirmed by the physician, with red streaking extending toward the ear consistent with lymphangitis. Select the correct, complete coding, distinguishing facial cellulitis/lymphangitis from the lower-extremity versions tested elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2cc5e2a0-c48a-4c44-a77e-7d61eada7d31', 'b192f308-8749-4fee-93ef-4f7661fe986c', 0, 'L03.211');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('f6481a2d-3149-455a-bab9-46d5324013af', 'b192f308-8749-4fee-93ef-4f7661fe986c', 1, 'L03.211, L03.212');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('990a5f5f-8edc-4ff9-ab70-b0b3910a1615', 'b192f308-8749-4fee-93ef-4f7661fe986c', 2, 'L03.212');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('48675fde-24fa-4cfb-9e02-708304e865a0', 'b192f308-8749-4fee-93ef-4f7661fe986c', 3, 'L03.211, L03.116');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('b192f308-8749-4fee-93ef-4f7661fe986c', 'f6481a2d-3149-455a-bab9-46d5324013af', 'L03.211 (cellulitis of face) and L03.212 (acute lymphangitis of face) are both coded together, since the lymphangitis (the red streaking) is specifically documented as a distinct additional finding beyond the cellulitis itself — mirroring the identical dual-coding pattern established with the lower-extremity cellulitis-plus-lymphangitis question in Paper 9 (L03.115/L03.116 for the leg), applied here to the facial anatomic site instead, using the correct face-specific code family rather than the lower-limb codes.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('910980f5-5d77-41da-9961-8aea4f0179fc', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 90, 'A patient with type 1 diabetes has diabetic nephropathy with CKD stage 3, unspecified sub-stage, confirmed by the physician as CKD-staged nephropathy (not simply early nephropathy without staging). Select the correct, complete coding, contrasting with the type 2 diabetes nephropathy-without-CKD-staging pattern tested elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('49cefdba-268a-4c87-95dc-158270d542b3', '910980f5-5d77-41da-9961-8aea4f0179fc', 0, 'E10.21, N18.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('80c0094e-38b0-4468-9395-a28d6a49fb28', '910980f5-5d77-41da-9961-8aea4f0179fc', 1, 'E10.22, N18.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5999b713-aa8a-4b25-abbd-e79dad312e96', '910980f5-5d77-41da-9961-8aea4f0179fc', 2, 'E10.9, N18.30');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('40c4b39f-e166-45c5-89d8-2adf2c2a2d50', '910980f5-5d77-41da-9961-8aea4f0179fc', 3, 'E10.22');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('910980f5-5d77-41da-9961-8aea4f0179fc', '80c0094e-38b0-4468-9395-a28d6a49fb28', 'E10.22 (type 1 diabetes with diabetic CHRONIC KIDNEY DISEASE) is the correct combination code once CKD staging IS specifically established, matching the same E11.21-vs-E11.22 distinction tested with the type 2 diabetes nephropathy question in Paper 7 (Q40), applied here to type 1 diabetes instead — E10.21 (diabetic nephropathy WITHOUT CKD staging) would under-code the documented specific CKD stage 3 finding. N18.30 (CKD stage 3, unspecified sub-stage) is added to specify the documented stage.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('3b9ed669-285a-4720-9d1c-53eb8fa46b01', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 91, 'A postmenopausal patient (confirmed menopause 8 years ago, no hormone therapy) has a NEW episode of vaginal bleeding, physician-documented as requiring urgent gynecologic workup to rule out endometrial pathology. Select the correct coding for this specific, currently-being-worked-up finding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('a32fcd89-5dfc-4124-9c47-fe139900720f', '3b9ed669-285a-4720-9d1c-53eb8fa46b01', 0, 'N95.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('bb053fe2-92b4-4c1f-8c1c-c0a6a751fdbc', '3b9ed669-285a-4720-9d1c-53eb8fa46b01', 1, 'N92.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('744ae1be-1a59-4c83-8efd-7221e33ffcc4', '3b9ed669-285a-4720-9d1c-53eb8fa46b01', 2, 'N95.0');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('55834818-ed88-4d26-9019-026a30a710f6', '3b9ed669-285a-4720-9d1c-53eb8fa46b01', 3, 'Z78.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('3b9ed669-285a-4720-9d1c-53eb8fa46b01', '744ae1be-1a59-4c83-8efd-7221e33ffcc4', 'N95.0 (postmenopausal bleeding) is the specific, correct finding code matching this exact presentation — a clinically significant finding in a postmenopausal patient specifically requiring urgent workup, since postmenopausal bleeding always warrants investigation to rule out malignancy. N95.1 (menopausal and climacteric states, a general status code for menopause itself, not this specific new bleeding finding) would under-code the documented acute concern. N92.0 (excessive menstruation WITH a regular cycle, a premenopausal-context code) doesn''t apply to a confirmed postmenopausal patient.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('0bf1b567-1b6d-4747-a4e2-de0b36635c52', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 92, 'A patient reports right forearm numbness and tingling specifically in the ring and little fingers, confirmed by nerve conduction study to be an ulnar nerve lesion at the elbow (cubital tunnel syndrome), distinct from the carpal tunnel syndrome question tested elsewhere in this exam series. Select the correct, most specific coding, distinguishing ulnar nerve entrapment from median nerve (carpal tunnel) entrapment.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d45eab62-e0d4-4b16-937a-d4ce57cc4740', '0bf1b567-1b6d-4747-a4e2-de0b36635c52', 0, 'G56.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('4d9bbaf8-bdd1-464d-b141-4c357984f174', '0bf1b567-1b6d-4747-a4e2-de0b36635c52', 1, 'G56.21');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0197320e-1e7c-4839-877b-3da854333040', '0bf1b567-1b6d-4747-a4e2-de0b36635c52', 2, 'M79.601');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e897c38f-2d61-4f3e-8cd3-d17f4c573ecb', '0bf1b567-1b6d-4747-a4e2-de0b36635c52', 3, 'G56.22');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('0bf1b567-1b6d-4747-a4e2-de0b36635c52', '4d9bbaf8-bdd1-464d-b141-4c357984f174', 'G56.21 (lesion of ulnar nerve, right upper limb) precisely matches the documented nerve-conduction-confirmed specific diagnosis and laterality — G56.01 (carpal tunnel syndrome, a MEDIAN nerve entrapment, the wrong specific nerve entirely, tested correctly elsewhere in this exam series for a distinctly different presentation) would misclassify this ulnar-specific finding. M79.601 (pain in right arm, a nonspecific symptom code) would under-code the documented specific, confirmed nerve diagnosis.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('5e9850b4-2b51-45dc-b1ed-d4fd62ce02aa', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 93, 'A patient with chronic heart failure and atrial fibrillation is admitted to home health following hospitalization for cardiogenic shock, now fully resolved and hemodynamically stable, with the physician''s note stating the heart failure itself has NOT been further characterized beyond ''heart failure'' in this specific discharge summary. Select the correct, complete coding for this home health SOC, applying the documentation-specificity-matching principle tested repeatedly throughout this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('33127793-7c9e-4411-a38c-f800fd61768f', '5e9850b4-2b51-45dc-b1ed-d4fd62ce02aa', 0, 'R57.0, I50.9, I48.91');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0b28e0c3-395e-4a3a-a8b3-4612d10b1809', '5e9850b4-2b51-45dc-b1ed-d4fd62ce02aa', 1, 'I50.22, I48.91');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1ec2d10a-a317-4abe-b279-78b0deb0b20a', '5e9850b4-2b51-45dc-b1ed-d4fd62ce02aa', 2, 'I50.9, I48.91');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('52fe5520-eab5-4c23-ac1f-9ceecae54d7a', '5e9850b4-2b51-45dc-b1ed-d4fd62ce02aa', 3, 'I50.9, I48.91, R57.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('5e9850b4-2b51-45dc-b1ed-d4fd62ce02aa', '1ec2d10a-a317-4abe-b279-78b0deb0b20a', 'I50.9 (heart failure, unspecified) is coded to match the documented level of specificity — the discharge summary explicitly does NOT characterize the heart failure type/acuity beyond the general term, so I50.22 (chronic systolic heart failure, a MORE specific code not actually supported by this stem''s limited documentation) would be incorrect to assume or infer. I48.91 (atrial fibrillation) is added as the separate, coexisting condition. R57.0 (cardiogenic shock) is NOT re-added since the shock has fully resolved prior to this home health episode, matching the resolved-acute-event principle established repeatedly throughout this exam series (Paper 7''s original cardiogenic shock question, among others).');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('2f58227b-7d54-4e73-8e60-215d698dab71', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 94, 'A patient develops new insomnia specifically and directly following a recent stressful life event (a spouse''s hospitalization), physician-documented as a time-limited, situational insomnia expected to resolve as the stressor resolves, distinct from primary/chronic insomnia. Select the correct, most specific coding, contrasting with the general insomnia code tested elsewhere in this exam series.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('638120db-f90f-4503-8079-3dd3a31a4780', '2f58227b-7d54-4e73-8e60-215d698dab71', 0, 'G47.00');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3f1ab9cd-3d42-4fca-b0af-117a317f0d6d', '2f58227b-7d54-4e73-8e60-215d698dab71', 1, 'F51.01');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('b648fc92-68ce-4412-8e94-9c003ede2fa2', '2f58227b-7d54-4e73-8e60-215d698dab71', 2, 'F51.02');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('dad3b047-c67e-41d4-b9d2-25389d56844e', '2f58227b-7d54-4e73-8e60-215d698dab71', 3, 'G47.09');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('2f58227b-7d54-4e73-8e60-215d698dab71', 'b648fc92-68ce-4412-8e94-9c003ede2fa2', 'F51.02 (adjustment insomnia) precisely matches the documented situational, stressor-triggered, time-limited presentation — a genuinely distinct diagnostic category from G47.00 (the general insomnia code correctly used in Paper 7''s Q76 for a less specifically characterized presentation) and from F51.01 (primary insomnia, which implies a more chronic, not clearly situationally-triggered pattern, contradicted by this stem''s specific stressor-linked, time-limited framing). This tests whether a candidate recognizes the more specific behavioral-sleep-medicine subtype code once the documentation supports it, rather than defaulting to the more general code from memory.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('75739f9f-c8bf-4dee-a1da-e8d1294344e8', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 95, 'A patient with confirmed metabolic syndrome (elevated waist circumference, hypertension, elevated triglycerides, and insulin resistance, all documented together per standard diagnostic criteria) is on home health for lifestyle-modification coaching. Select the correct, most specific coding.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7c393842-3bda-4cea-ae6c-6c27bc51ffe5', '75739f9f-c8bf-4dee-a1da-e8d1294344e8', 0, 'E66.811, I10, E78.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('ca15ed2f-f8db-40c7-a25c-0c6b81eba273', '75739f9f-c8bf-4dee-a1da-e8d1294344e8', 1, 'E88.810');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('5de136e8-af17-4d48-bf85-2d9dfd2a6082', '75739f9f-c8bf-4dee-a1da-e8d1294344e8', 2, 'E88.819');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c64e4a06-35ef-41b2-a2e5-50aaef91db7c', '75739f9f-c8bf-4dee-a1da-e8d1294344e8', 3, 'E66.3');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('75739f9f-c8bf-4dee-a1da-e8d1294344e8', 'ca15ed2f-f8db-40c7-a25c-0c6b81eba273', 'E88.810 (metabolic syndrome) is the single, specific, dedicated combination code for this confirmed diagnostic cluster — E88.81 alone is a non-billable parent requiring this further specification (metabolic syndrome itself, versus other, different insulin-resistance-syndrome subtypes). Coding each individual component condition separately (obesity, hypertension, hyperlipidemia) would fail to capture that this is being diagnosed and managed as the specific, unified metabolic syndrome entity, not simply a coincidental collection of unrelated findings. E88.819 (insulin resistance, unspecified — a less specific, different diagnosis than the fully-diagnosed metabolic syndrome documented here) would under-code the documented complete diagnostic picture.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a1bd5ac1-8674-4994-ab85-21218074e16f', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 96, 'A home health agency''s clinical team, per a physician''s order, uses a soft physical restraint (mitts) on a patient at high risk of dislodging a feeding tube, documented with clear clinical justification, physician order, and a defined reassessment plan, consistent with the restraint-use standard established elsewhere in this exam series. Select the correct coding to reflect the current restraint status.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('21d9ab1a-5b2d-47bd-aaa5-4822de808814', 'a1bd5ac1-8674-4994-ab85-21218074e16f', 0, 'Z71.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2a21d3dc-2827-49e4-a90d-2432d24c0ae8', 'a1bd5ac1-8674-4994-ab85-21218074e16f', 1, 'Z78.1');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('0a0161fd-4231-41a1-9bd7-ffba3d9ad36a', 'a1bd5ac1-8674-4994-ab85-21218074e16f', 2, 'Z76.89');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d6bbd0a0-063d-467e-b6d6-7a95f62c541c', 'a1bd5ac1-8674-4994-ab85-21218074e16f', 3, 'Z71.9');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a1bd5ac1-8674-4994-ab85-21218074e16f', '2a21d3dc-2827-49e4-a90d-2432d24c0ae8', 'Z78.1 (physical restraint status) is the specific, correct status code documenting the current, physician-ordered restraint use — directly connecting to the restraint-use CoP principle established in Paper 8 (Q22): physical restraint use must be clinically justified, physician-ordered, and reassessed, and once appropriately implemented under that standard, the current status is captured with this specific Z-code. Z71.89, Z76.89, and Z71.9 are all generic counseling/encounter-circumstance codes that don''t specifically capture restraint status.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('d8816171-0e83-4723-b7b5-289af2e5da91', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 97, 'A home health patient has a documented, valid DNR order in place, consistent with the DNR-honoring principle tested elsewhere in this exam series, and is separately receiving formal palliative home health services (non-hospice) for symptom management of end-stage COPD. Select the correct coding to reflect both the DNR status and the palliative care encounter focus, distinguishing these two related but distinct concepts.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('c7844450-2c82-42f0-ae8b-e559d44b235c', 'd8816171-0e83-4723-b7b5-289af2e5da91', 0, 'Z66, Z51.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('27163da2-e133-4ef8-8978-49df456b42ba', 'd8816171-0e83-4723-b7b5-289af2e5da91', 1, 'Z66');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3855de22-e615-4f43-89a6-cd3a5777dc85', 'd8816171-0e83-4723-b7b5-289af2e5da91', 2, 'Z51.5');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('d3b514b3-509a-477a-abe1-a1c92ce69332', 'd8816171-0e83-4723-b7b5-289af2e5da91', 3, 'R99, Z51.5');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('d8816171-0e83-4723-b7b5-289af2e5da91', 'c7844450-2c82-42f0-ae8b-e559d44b235c', 'Z66 (do not resuscitate) and Z51.5 (encounter for palliative care) are both coded together, since they represent two distinct, separately meaningful concepts — Z66 documents the specific DNR directive status (a decision about resuscitation specifically), while Z51.5 documents that this encounter''s clinical focus is palliative/comfort-oriented care; a patient can have one without the other (a DNR patient not yet receiving formal palliative care, or a palliative care patient who is still full-code), so both are appropriately captured together when both are genuinely and separately documented, rather than treating them as redundant or interchangeable.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('83ab9eb2-d0cf-454b-9b64-96cfa29c5f01', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 98, 'A sacral pressure ulcer was documented at admission as stage 3. On a follow-up OASIS reassessment two weeks later, the wound has deteriorated with visible tendon and bone now exposed at the base. Applying the current-status pressure ulcer staging principle (staging reflects the wound''s current state, not its best or worst historical state), select the correct code for this reassessment.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('3a7d3eec-6ee4-4194-85cf-b7dac70cac5e', '83ab9eb2-d0cf-454b-9b64-96cfa29c5f01', 0, 'L89.153 (sacral pressure ulcer, stage 3) — carried forward from admission');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2d466c46-cc42-4d08-91a0-af94c951ea96', '83ab9eb2-d0cf-454b-9b64-96cfa29c5f01', 1, 'L89.154 (sacral pressure ulcer, stage 4)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('1cf2719c-2be9-4a25-963e-4cdc518d3c78', '83ab9eb2-d0cf-454b-9b64-96cfa29c5f01', 2, 'L89.150 (sacral pressure ulcer, unstageable)');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('e499edf7-6920-45f2-a809-0287ef060d4e', '83ab9eb2-d0cf-454b-9b64-96cfa29c5f01', 3, 'L89.159 (sacral pressure ulcer, unspecified stage)');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('83ab9eb2-d0cf-454b-9b64-96cfa29c5f01', '2d466c46-cc42-4d08-91a0-af94c951ea96', 'L89.154 (pressure ulcer of sacral region, stage 4) is correct: exposed tendon or bone is the defining criterion for stage 4, and per the current-status staging principle already established for improving wounds elsewhere in this exam series, the same logic applies symmetrically when a wound worsens — the code must reflect the wound''s current depth of tissue involvement at this reassessment, not the stage documented at an earlier encounter. Carrying forward the admission stage (option A) would understate the wound''s true current severity. Unstageable (L89.150) applies only when the wound base is obscured by slough or eschar, not when full-thickness tissue loss is directly visualized, and unspecified stage (L89.159) is never appropriate when the depth has been clearly documented.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('35b77e43-97eb-45cd-b4e0-76b3fc3937dd', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 99, 'Per Medicare Conditions of Participation, a physician (or allowed non-physician practitioner) face-to-face encounter is required for certification of home health eligibility. Which statement correctly describes the permitted timing window for this encounter relative to the start of care?');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('9aa59d0c-8bc5-4381-a721-c5016691485c', '35b77e43-97eb-45cd-b4e0-76b3fc3937dd', 0, 'The encounter must occur within the 90 days before the start of care, or within the 30 days after the start of care');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('05db9b82-1d10-4064-840d-c733034af3e4', '35b77e43-97eb-45cd-b4e0-76b3fc3937dd', 1, 'The encounter must occur only within the 30 days before the start of care');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('2d375da5-9e36-4ae0-9801-310930581ca1', '35b77e43-97eb-45cd-b4e0-76b3fc3937dd', 2, 'The encounter must occur only within the 14 days after the start of care');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('43675fcf-b61a-4e1d-a7b8-33bd88ca4724', '35b77e43-97eb-45cd-b4e0-76b3fc3937dd', 3, 'The encounter has no defined timing window as long as it is documented before the final claim is submitted');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('35b77e43-97eb-45cd-b4e0-76b3fc3937dd', '9aa59d0c-8bc5-4381-a721-c5016691485c', 'The face-to-face encounter must occur within 90 days prior to the start of care, or within 30 days after the start of care — a defined window that gives flexibility to use an existing recent visit (e.g., a hospital discharge exam) while also allowing a home health clinician''s own visit shortly after start of care to satisfy the requirement if no qualifying encounter already occurred beforehand. There is no allowance for open-ended timing, and the requirement is not satisfied merely by documenting it before claim submission — the encounter itself must fall within this specific window, and the certifying practitioner must attest to it as part of the certification of eligibility.');
INSERT INTO questions (id, paper_id, sort_order, question_text)
VALUES ('a17fd86c-a230-453b-84eb-c506b8c40224', 'a5bd0f94-2fc9-47e9-9d99-15158832dc47', 100, 'A home health patient with type 2 diabetes mellitus has a documented right heel ulcer with fat layer exposed. The physician''s note explicitly states the ulcer is of undetermined etiology and does NOT document it as being caused by the diabetes. Applying the coding convention that a diabetes-complication combination code should never be used unless the causal link is actually documented, select the correct code set.');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('6cb30c5f-4642-4831-9857-3079003e02ba', 'a17fd86c-a230-453b-84eb-c506b8c40224', 0, 'E11.621, L97.412');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('03a75410-e428-4798-bf60-c883b185d904', 'a17fd86c-a230-453b-84eb-c506b8c40224', 1, 'E11.622');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('7b627321-c448-4b11-b3d8-69d2e0096040', 'a17fd86c-a230-453b-84eb-c506b8c40224', 2, 'E11.9, L97.412');
INSERT INTO question_options (id, question_id, sort_order, option_text)
VALUES ('12b138df-d515-4ed4-b00e-d87a6aef58cb', 'a17fd86c-a230-453b-84eb-c506b8c40224', 3, 'E11.621');
INSERT INTO question_answers (question_id, correct_option_id, explanation)
VALUES ('a17fd86c-a230-453b-84eb-c506b8c40224', '7b627321-c448-4b11-b3d8-69d2e0096040', 'E11.9 (type 2 diabetes mellitus without complications) plus L97.412 (non-pressure chronic ulcer of right heel and midfoot with fat layer exposed), coded separately, is correct: the combination codes E11.621 (diabetes with foot ulcer) and E11.622 (diabetes with other skin ulcer) both carry an implied causal link between the diabetes and the ulcer per ICD-10-CM convention, and that causal link must be clinically documented by the physician to be coded — it cannot be assumed simply because both diabetes and an ulcer happen to be present in the same patient. Since the documentation explicitly declines to attribute the ulcer to the diabetes, the diabetes and the ulcer are coded as two independent conditions rather than using the combination code, directly extending the non-assumed-causality principle applied elsewhere in this exam series (e.g., diabetes with unrelated conditions is never combination-coded without an explicit documented link).');
